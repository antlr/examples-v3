/** XML parser by Oliver Zeigermann October 10, 2005 */
lexer grammar XML;
options {
    language = Python;
}

@header {
import sys
}

DOCUMENT
    :  XMLDECL? WS? DOCTYPE? WS? ELEMENT WS? 
    ;

fragment DOCTYPE
    :
        '<!DOCTYPE' WS rootElementName=GENERIC_ID 
        {sys.stdout.write("ROOTELEMENT: "+rootElementName.text + "\n")}   
        WS
        ( 
            ( 'SYSTEM' WS sys1=VALUE
                {sys.stdout.write("SYSTEM: "+sys1.text + "\n")}   
                
            | 'PUBLIC' WS pub=VALUE WS sys2=VALUE
                {sys.stdout.write("PUBLIC: "+pub.text + "\n")}   
                {sys.stdout.write("SYSTEM: "+sys2.text + "\n")}   
            )
            ( WS )?
        )?
        ( dtd=INTERNAL_DTD
            {sys.stdout.write("INTERNAL DTD: "+dtd.text + "\n")}   
        )?
		'>'
	;

fragment INTERNAL_DTD : '[' (options {greedy=false;} : .)* ']' ;

fragment PI :
        '<?' target=GENERIC_ID WS? 
          {sys.stdout.write("PI: "+target.text + "\n")}
        ( ATTRIBUTE WS? )*  '?>'
	;

fragment XMLDECL :
        '<?' ('x'|'X') ('m'|'M') ('l'|'L') WS? 
          {sys.stdout.write("XML declaration" + "\n")}
        ( ATTRIBUTE WS? )*  '?>'
	;


fragment ELEMENT
    : ( START_TAG
            (ELEMENT
            | t=PCDATA
                {sys.stdout.write("PCDATA: \""+$t.text+"\"" + "\n")}
            | t=CDATA
                {sys.stdout.write("CDATA: \""+$t.text+"\"" + "\n")}
            | t=COMMENT
                {sys.stdout.write("Comment: \""+$t.text+"\"" + "\n")}
            | pi=PI
            )*
            END_TAG
        | EMPTY_ELEMENT
        )
    ;

fragment START_TAG 
    : '<' WS? name=GENERIC_ID WS?
          {sys.stdout.write("Start Tag: "+name.text + "\n")}
        ( ATTRIBUTE WS? )* '>'
    ;

fragment EMPTY_ELEMENT 
    : '<' WS? name=GENERIC_ID WS?
          {sys.stdout.write("Empty Element: "+name.text + "\n")}
        ( ATTRIBUTE WS? )* '/>'
    ;

fragment ATTRIBUTE 
    : name=GENERIC_ID WS? '=' WS? value=VALUE
        {sys.stdout.write("Attr: "+name.text+"="+value.text + "\n")}
    ;

fragment END_TAG 
    : '</' WS? name=GENERIC_ID WS? '>'
        {sys.stdout.write("End Tag: "+name.text + "\n")}
    ;

fragment COMMENT
	:	'<!--' (options {greedy=false;} : .)* '-->'
	;

fragment CDATA
	:	'<![CDATA[' (options {greedy=false;} : .)* ']]>'
	;

fragment PCDATA : (~'<')+ ; 

fragment VALUE : 
        ( '\"' (~'\"')* '\"'
        | '\'' (~'\'')* '\''
        )
	;

fragment GENERIC_ID 
    : ( LETTER | '_' | ':') 
        ( options {greedy=true;} : LETTER | '0'..'9' | '.' | '-' | '_' | ':' )*
	;

fragment LETTER
	: 'a'..'z' 
	| 'A'..'Z'
	;

fragment WS  :
        (   ' '
        |   '\t'
        |  ( '\n'
            |	'\r\n'
            |	'\r'
            )
        )+
    ;    

