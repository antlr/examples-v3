/** XML parser by Oliver Zeigermann October 10, 2005 */
lexer grammar XMLLexer;

DOCUMENT
    :  XMLDECL? WS? DOCTYPE? WS? ELEMENT WS? 
    ;

fragment DOCTYPE
    :
        '<!DOCTYPE' WS rootElementName=GENERIC_ID 
        { System.out.println("ROOTELEMENT: "+rootElementName.getText()); }   
        WS
        ( 
            ( 'SYSTEM' WS sys1=VALUE
                { System.out.println("SYSTEM: "+sys1.getText()); }   
                
            | 'PUBLIC' WS pub=VALUE WS sys2=VALUE
                { System.out.println("PUBLIC: "+pub.getText()); }   
                { System.out.println("SYSTEM: "+sys2.getText()); }   
            )
            ( WS )?
        )?
        ( dtd=INTERNAL_DTD
            { System.out.println("INTERNAL DTD: "+dtd.getText()); }   
        )?
		'>'
	;

fragment INTERNAL_DTD : '[' (options {greedy=false;} : .)* ']' ;

fragment PI :
        '<?' target=GENERIC_ID WS? 
          { System.out.println("PI: "+target.getText()); }
        ( ATTRIBUTE WS? )*  '?>'
	;

fragment XMLDECL :
        '<?' ('x'|'X') ('m'|'M') ('l'|'L') WS? 
          { System.out.println("XML declaration"); }
        ( ATTRIBUTE WS? )*  '?>'
	;


fragment ELEMENT
    : ( START_TAG
            (ELEMENT
            | t=PCDATA
                { System.out.println("PCDATA: \""+$t.getText()+"\""); }
            | t=CDATA
                { System.out.println("CDATA: \""+$t.getText()+"\""); }
            | t=COMMENT
                { System.out.println("Comment: \""+$t.getText()+"\""); }
            | pi=PI
            )*
            END_TAG
        | EMPTY_ELEMENT
        )
    ;

fragment START_TAG 
    : '<' WS? name=GENERIC_ID WS?
          { System.out.println("Start Tag: "+name.getText()); }
        ( ATTRIBUTE WS? )* '>'
    ;

fragment EMPTY_ELEMENT 
    : '<' WS? name=GENERIC_ID WS?
          { System.out.println("Empty Element: "+name.getText()); }
        ( ATTRIBUTE WS? )* '/>'
    ;

fragment ATTRIBUTE 
    : name=GENERIC_ID WS? '=' WS? value=VALUE
        { System.out.println("Attr: "+name.getText()+"="+value.getText()); }
    ;

fragment END_TAG 
    : '</' WS? name=GENERIC_ID WS? '>'
        { System.out.println("End Tag: "+name.getText()); }
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

