lexer grammar FuzzyJava;
options {
	filter=true;
	language=Delphi;
}

IMPORT
	:	'import' WS name=QIDStar WS? ';'
	;
	
/** Avoids having "return foo;" match as a field */
RETURN
	:	'return' (options {greedy=false;}:.)* ';'
	;

JCLASS
	:	'class' WS name=ID WS? ('extends' WS QID WS?)?
		('implements' WS QID WS? (',' WS? QID WS?)*)? '{'
        {WriteLn('found class ' + $name.Text);}
	;
	
METHOD
    :   JTYPE WS name=ID WS? '(' ( ARG WS? (',' WS? ARG WS?)* )? ')' WS? 
       ('throws' WS QID WS? (',' WS? QID WS?)*)? '{'
        {WriteLn('found method ' + $name.Text);}
    ;

FIELD
    :   JTYPE WS name=ID '[]'? WS? (';'|'=')
        {WriteLn('found var ' + $name.Text);}
    ;

STAT:	('if'|'while'|'switch'|'for') WS? '(' ;
	
CALL
    :   name=QID WS? '('
        {(*ignore if this/super *) WriteLn('found call ' + $name.Text);}
    ;

COMMENT
    :   '/*' (options {greedy=false;} : . )* '*/'
        {WriteLn('found comment ' + Text);}
    ;

SL_COMMENT
    :   '//' (options {greedy=false;} : . )* '\n'
        {WriteLn('found // comment ' + Text);}
    ;
	
JSTRING
	:	'"' (options {greedy=false;}: ESC | .)* '"'
	;

CHAR
	:	'\'' (options {greedy=false;}: ESC | .)* '\''
	;

WS  :   (' '|'\t'|'\n')+
    ;

fragment
QID :	ID ('.' ID)*
	;
	
/** QID cannot see beyond end of token so using QID '.*'? somewhere won't
 *  ever match since k=1 lookahead in the QID loop of '.' will make it loop.
 *  I made this rule to compensate.
 */
fragment
QIDStar
	:	ID ('.' ID)* '.*'?
	;

fragment
JTYPE:   QID '[]'?
    ;
    
fragment
ARG :   JTYPE WS ID
    ;

fragment
ID  :   ('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'_'|'0'..'9')*
    ;

fragment
ESC	:	'\\' ('"'|'\''|'\\')
	;
