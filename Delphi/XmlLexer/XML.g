// XML parser by Oliver Zeigermann October 10, 2005 
lexer grammar XML;

options {
	language=Delphi;
}

DOCUMENT
    :  XMLDECL? WS? DOCTYPE? WS? ELEMENT WS? 
    ;

fragment DOCTYPE
    :
        '<!DOCTYPE' WS rootElementName=GENERIC_ID 
        { WriteLn('ROOTELEMENT: '+$rootElementName.Text); }   
        WS
        ( 
            ( 'SYSTEM' WS sys1=VALUE
                { WriteLn('SYSTEM: '+$sys1.Text); }   
                
            | 'PUBLIC' WS pub=VALUE WS sys2=VALUE
                { WriteLn('PUBLIC: '+$pub.Text); }   
                { WriteLn('SYSTEM: '+$sys2.Text); }   
            )
            ( WS )?
        )?
        ( dtd=INTERNAL_DTD
            { WriteLn('INTERNAL DTD: '+$dtd.Text); }   
        )?
		'>'
	;

fragment INTERNAL_DTD : '[' (options {greedy=false;} : .)* ']' ;

fragment PI :
        '<?' target=GENERIC_ID WS? 
          { WriteLn('PI: '+$target.Text); }
        ( ATTRIBUTE WS? )*  '?>'
	;

fragment XMLDECL :
        '<?' ('x'|'X') ('m'|'M') ('l'|'L') WS? 
          { WriteLn('XML declaration'); }
        ( ATTRIBUTE WS? )*  '?>'
	;


fragment ELEMENT
    : ( START_TAG
            (ELEMENT
            | t=PCDATA
                { WriteLn('PCDATA: "'+$t.Text+'"'); }
            | t=CDATA
                { WriteLn('CDATA: "'+$t.Text+'"'); }
            | t=COMMENT
                { WriteLn('Comment: "'+$t.Text+'"'); }
            | pi=PI
            )*
            END_TAG
        | EMPTY_ELEMENT
        )
    ;

fragment START_TAG 
    : '<' WS? name=GENERIC_ID WS?
          { WriteLn('Start Tag: '+$name.Text); }
        ( ATTRIBUTE WS? )* '>'
    ;

fragment EMPTY_ELEMENT 
    : '<' WS? name=GENERIC_ID WS?
          { WriteLn('Empty Element: '+$name.Text); }
        ( ATTRIBUTE WS? )* '/>'
    ;

fragment ATTRIBUTE 
    : name=GENERIC_ID WS? '=' WS? value=VALUE
        { WriteLn('Attr: '+$name.Text+'='+$value.Text); }
    ;

fragment END_TAG 
    : '</' WS? name=GENERIC_ID WS? '>'
        { WriteLn('End Tag: '+$name.Text); }
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

