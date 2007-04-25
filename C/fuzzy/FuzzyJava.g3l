lexer grammar FuzzyJava;

options 
{
    filter	= true;
    language	= C;
}

// While you can implement your own character streams and so on, they
// normally call things like LA() via funtion pointers. In general you will
// be using one of the pre-supplied input streams and you can instruct the
// generated code to access the input pointrs directly.
//
// For  8 bit inputs            : #define ANTLR3_INLINE_INPUT_ASCII
// For 16 bit UTF16/UCS2 inputs : #define ANTLR3_INLINE_INPUT_UTF16
//
// If your compiled recognizer might be given inputs from either of the sources
// or you have written your own character input stream, then do not define
// either of these.
//
@lexer::header
{
#define	ANTLR3_INLINE_INPUT_ASCII
}

IMPORT
	:	'import' WS name=QIDStar WS? ';'
	;
	
/** Avoids having "return foo;" match as a field */
RETURN
	:	'return' (options {greedy=false;}:.)* ';'
	;

CLASS
	:	'class' WS name=ID WS? ('extends' WS QID WS?)?
		('implements' WS QID WS? (',' WS? QID WS?)*)? '{'
        {printf("found class \%s\n", $name.text->chars);}
	;
	
METHOD
    :   TYPE WS name=ID WS? '(' ( ARG WS? (',' WS? ARG WS?)* )? ')' WS? 
       ('throws' WS QID WS? (',' WS? QID WS?)*)? '{'
        {printf("found method \%s\n", $name.text->chars);}
    ;

FIELD
    :   TYPE WS name=ID '[]'? WS? (';'|'=')
        {printf("found var \%s\n",$name.text->chars);}
    ;

STAT:	('if'|'while'|'switch'|'for') WS? '(' ;
	
CALL
    :   name=QID WS? '('
        {/*ignore if this/super */ printf("found call \%s\n", $name.text->chars);}
    ;

COMMENT
    :   '/' '*' (options {greedy=false;} : . )* '*' '/'
        {printf("found comment \%s\n",GETTEXT()->chars);}
    ;

SL_COMMENT
    :   '//' (options {greedy=false;} : . )* '\n'
        {printf("found // comment \%s\n", GETTEXT()->chars);}
    ;
	
STRING
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
TYPE:   QID '[]'?
    ;
    
fragment
ARG :   TYPE WS ID
    ;

fragment
ID  :   ('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'_'|'0'..'9')*
    ;

fragment
ESC	:	'\\' ('"'|'\''|'\\')
	;
