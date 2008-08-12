/** XML parser by Oliver Zeigermann October 10, 2005 */
lexer grammar XML;
options {language=JavaScript}

DOCUMENT
    :  XMLDECL? WS? DOCTYPE? WS? ELEMENT WS? 
    ;

fragment DOCTYPE
    :
        '<!DOCTYPE' WS rootElementName=GENERIC_ID 
        { print("ROOTELEMENT: "+rootElementName.getText()); }   
        WS
        ( 
            ( 'SYSTEM' WS sys1=VALUE
                { print("SYSTEM: "+sys1.getText()); }   
                
            | 'PUBLIC' WS pub=VALUE WS sys2=VALUE
                { print("PUBLIC: "+pub.getText()); }   
                { print("SYSTEM: "+sys2.getText()); }   
            )
            ( WS )?
        )?
        ( dtd=INTERNAL_DTD
            { print("INTERNAL DTD: "+dtd.getText()); }   
        )?
		'>'
	;

fragment INTERNAL_DTD : '[' (options {greedy=false;} : .)* ']' ;

fragment PI :
        '<?' target=GENERIC_ID WS? 
          { print("PI: "+target.getText()); }
        ( ATTRIBUTE WS? )*  '?>'
	;

fragment XMLDECL :
        '<?' ('x'|'X') ('m'|'M') ('l'|'L') WS? 
          { print("XML declaration"); }
        ( ATTRIBUTE WS? )*  '?>'
	;


fragment ELEMENT
    : ( START_TAG
            (ELEMENT
            | t=PCDATA
                { print("PCDATA: \""+$t.getText()+"\""); }
            | t=CDATA
                { print("CDATA: \""+$t.getText()+"\""); }
            | t=COMMENT
                { print("Comment: \""+$t.getText()+"\""); }
            | pi=PI
            )*
            END_TAG
        | EMPTY_ELEMENT
        )
    ;

fragment START_TAG 
    : '<' WS? name=GENERIC_ID WS?
          { print("Start Tag: "+name.getText()); }
        ( ATTRIBUTE WS? )* '>'
    ;

fragment EMPTY_ELEMENT 
    : '<' WS? name=GENERIC_ID WS?
          { print("Empty Element: "+name.getText()); }
        ( ATTRIBUTE WS? )* '/>'
    ;

fragment ATTRIBUTE 
    : name=GENERIC_ID WS? '=' WS? value=VALUE
        { print("Attr: "+name.getText()+"="+value.getText()); }
    ;

fragment END_TAG 
    : '</' WS? name=GENERIC_ID WS? '>'
        { print("End Tag: "+name.getText()); }
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

