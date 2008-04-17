/** XML parser by Oliver Zeigermann October 10, 2005 */
lexer grammar XMLLexer;

options {
	language=ActionScript;
}

DOCUMENT
    :  XMLDECL? WS? DOCTYPE? WS? ELEMENT WS? 
    ;

fragment DOCTYPE
    :
        '<!DOCTYPE' WS rootElementName=GENERIC_ID 
        { trace("ROOTELEMENT: "+rootElementName.text); }   
        WS
        ( 
            ( 'SYSTEM' WS sys1=VALUE
                { trace("SYSTEM: "+sys1.text); }   
                
            | 'PUBLIC' WS pub=VALUE WS sys2=VALUE
                { trace("PUBLIC: "+pub.text); }   
                { trace("SYSTEM: "+sys2.text); }   
            )
            ( WS )?
        )?
        ( dtd=INTERNAL_DTD
            { trace("INTERNAL DTD: "+dtd.text); }   
        )?
		'>'
	;

fragment INTERNAL_DTD : '[' (options {greedy=false;} : .)* ']' ;

fragment PI :
        '<?' target=GENERIC_ID WS? 
          { trace("PI: "+target.text); }
        ( ATTRIBUTE WS? )*  '?>'
	;

fragment XMLDECL :
        '<?' ('x'|'X') ('m'|'M') ('l'|'L') WS? 
          { trace("XML declaration"); }
        ( ATTRIBUTE WS? )*  '?>'
	;


fragment ELEMENT
    : ( START_TAG
            (ELEMENT
            | t=PCDATA
                { trace("PCDATA: \""+$t.text+"\""); }
            | t=CDATA
                { trace("CDATA: \""+$t.text+"\""); }
            | t=COMMENT
                { trace("Comment: \""+$t.text+"\""); }
            | pi=PI
            )*
            END_TAG
        | EMPTY_ELEMENT
        )
    ;

fragment START_TAG 
    : '<' WS? name=GENERIC_ID WS?
          { trace("Start Tag: "+name.text); }
        ( ATTRIBUTE WS? )* '>'
    ;

fragment EMPTY_ELEMENT 
    : '<' WS? name=GENERIC_ID WS?
          { trace("Empty Element: "+name.text); }
        ( ATTRIBUTE WS? )* '/>'
    ;

fragment ATTRIBUTE 
    : name=GENERIC_ID WS? '=' WS? value=VALUE
        { trace("Attr: "+name.text+"="+value.text); }
    ;

fragment END_TAG 
    : '</' WS? name=GENERIC_ID WS? '>'
        { trace("End Tag: "+name.text); }
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

