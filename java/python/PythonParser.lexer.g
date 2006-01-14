lexer grammar PythonParserLexer;
@members {
/** Handles context-sensitive lexing of implicit line joining such as
 *  the case where newline is ignored in cases like this:
 *  a = [3,
 *       4]
 */
int implicitLineJoiningLevel = 0;
int startPos=-1;
}

T64 : 'def' ;
T65 : 'print' ;
T66 : 'del' ;
T67 : 'pass' ;
T68 : 'break' ;
T69 : 'continue' ;
T70 : 'return' ;
T71 : 'yield' ;
T72 : 'raise' ;
T73 : 'import' ;
T74 : 'from' ;
T75 : 'global' ;
T76 : 'exec' ;
T77 : 'in' ;
T78 : 'assert' ;
T79 : 'if' ;
T80 : 'elif' ;
T81 : 'else' ;
T82 : 'while' ;
T83 : 'for' ;
T84 : 'try' ;
T85 : 'finally' ;
T86 : 'except' ;
T87 : 'or' ;
T88 : 'and' ;
T89 : 'not' ;
T90 : 'is' ;
T91 : 'lambda' ;
T92 : 'class' ;

#src "python.g" 389
LPAREN	: '(' {implicitLineJoiningLevel++;} ;

#src "python.g" 391
RPAREN	: ')' {implicitLineJoiningLevel--;} ;

#src "python.g" 393
LBRACK	: '[' {implicitLineJoiningLevel++;} ;

#src "python.g" 395
RBRACK	: ']' {implicitLineJoiningLevel--;} ;

#src "python.g" 397
COLON 	: ':' ;

#src "python.g" 399
COMMA	: ',' ;

#src "python.g" 401
SEMI	: ';' ;

#src "python.g" 403
PLUS	: '+' ;

#src "python.g" 405
MINUS	: '-' ;

#src "python.g" 407
STAR	: '*' ;

#src "python.g" 409
SLASH	: '/' ;

#src "python.g" 411
VBAR	: '|' ;

#src "python.g" 413
AMPER	: '&' ;

#src "python.g" 415
LESS	: '<' ;

#src "python.g" 417
GREATER	: '>' ;

#src "python.g" 419
ASSIGN	: '=' ;

#src "python.g" 421
PERCENT	: '%' ;

#src "python.g" 423
BACKQUOTE	: '`' ;

#src "python.g" 425
LCURLY	: '{' {implicitLineJoiningLevel++;} ;

#src "python.g" 427
RCURLY	: '}' {implicitLineJoiningLevel--;} ;

#src "python.g" 429
CIRCUMFLEX	: '^' ;

#src "python.g" 431
TILDE	: '~' ;

#src "python.g" 433
EQUAL	: '==' ;

#src "python.g" 435
NOTEQUAL	: '!=' ;

#src "python.g" 437
ALT_NOTEQUAL: '<>' ;

#src "python.g" 439
LESSEQUAL	: '<=' ;

#src "python.g" 441
LEFTSHIFT	: '<<' ;

#src "python.g" 443
GREATEREQUAL	: '>=' ;

#src "python.g" 445
RIGHTSHIFT	: '>>' ;

#src "python.g" 447
PLUSEQUAL	: '+=' ;

#src "python.g" 449
MINUSEQUAL	: '-=' ;

#src "python.g" 451
DOUBLESTAR	: '**' ;

#src "python.g" 453
STAREQUAL	: '*=' ;

#src "python.g" 455
DOUBLESLASH	: '//' ;

#src "python.g" 457
SLASHEQUAL	: '/=' ;

#src "python.g" 459
VBAREQUAL	: '|=' ;

#src "python.g" 461
PERCENTEQUAL	: '%=' ;

#src "python.g" 463
AMPEREQUAL	: '&=' ;

#src "python.g" 465
CIRCUMFLEXEQUAL	: '^=' ;

#src "python.g" 467
LEFTSHIFTEQUAL	: '<<=' ;

#src "python.g" 469
RIGHTSHIFTEQUAL	: '>>=' ;

#src "python.g" 471
DOUBLESTAREQUAL	: '**=' ;

#src "python.g" 473
DOUBLESLASHEQUAL	: '//=' ;

#src "python.g" 475
DOT : '.' ;

#src "python.g" 477
FLOAT
	:	'.' DIGITS (Exponent)?
    |   DIGITS ('.' (DIGITS (Exponent)?)? | Exponent)
    ;

#src "python.g" 482
LONGINT
    :   INT ('l'|'L')
    ;

#src "python.g" 486
fragment
Exponent
	:	('e' | 'E') ( '+' | '-' )? DIGITS
	;

#src "python.g" 491
INT :   // Hex
        '0' ('x' | 'X') ( '0' .. '9' | 'a' .. 'f' | 'A' .. 'F' )+
        ('l' | 'L')?
    |   // Octal
        '0' DIGITS*
    |   '1'..'9' DIGITS*
    ;

#src "python.g" 499
COMPLEX
    :   INT ('j'|'J')
    |   FLOAT ('j'|'J')
    ;

#src "python.g" 504
fragment
DIGITS : ( '0' .. '9' )+ ;

#src "python.g" 507
NAME:	( 'a' .. 'z' | 'A' .. 'Z' | '_')
        ( 'a' .. 'z' | 'A' .. 'Z' | '_' | '0' .. '9' )*
    ;

#src "python.g" 511
/** Match various string types.  Note that greedy=false implies '''
 *  should make us exit loop not continue.
 */
STRING
    :   ('r'|'u'|'ur')?
        (   '\'\'\'' (options {greedy=false;}:.)* '\'\'\''
        |   '"""' (options {greedy=false;}:.)* '"""'
        |   '"' (ESC|~('\\'|'\n'|'"'))* '"'
        |   '\'' (ESC|~('\\'|'\n'|'\''))* '\''
        )
	;

#src "python.g" 523
fragment
ESC
	:	'\\' .
	;

#src "python.g" 528
/** Consume a newline and any whitespace at start of next line */
CONTINUED_LINE
	:	'\\' ('\r')? '\n' (' '|'\t')* { channel=99; }
	;

#src "python.g" 533
/** Treat a sequence of blank lines as a single blank line.  If
 *  nested within a (..), {..}, or [..], then ignore newlines.
 *  If the first newline starts in column one, they are to be ignored.
 */
NEWLINE
    :   (('\r')? '\n' )+
        {if ( startPos==0 || implicitLineJoiningLevel>0 )
            channel=99;
        }
    ;

#src "python.g" 544
WS	:	{startPos>0}?=> (' '|'\t')+ {channel=99;}
	;
	
#src "python.g" 547
/** Grab everything before a real symbol.  Then if newline, kill it
 *  as this is a blank line.  If whitespace followed by comment, kill it
 *  as it's a comment on a line by itself.
 *
 *  Ignore leading whitespace when nested in [..], (..), {..}.
 */
LEADING_WS
@init {
    int spaces = 0;
}
    :   {startPos==0}?=>
    	(   {implicitLineJoiningLevel>0}? ( ' ' | '\t' )+ {channel=99;}
       	|	( 	' '  { spaces++; }
        	|	'\t' { spaces += 8; spaces -= (spaces \% 8); }
       		)+
        	{
            // make a string of n spaces where n is column number - 1
            char[] indentation = new char[spaces];
            for (int i=0; i<spaces; i++) {
                indentation[i] = ' ';
            }
            String s = new String(indentation);
            emit(new ClassicToken(LEADING_WS,new String(indentation)));
        	}
        	// kill trailing newline if present and then ignore
        	( ('\r')? '\n' {if (token!=null) token.setChannel(99); else channel=99;})*
           // {token.setChannel(99); }
        )

/*
        |   // if comment, then only thing on a line; kill so we
            // ignore totally also wack any following newlines as
            // they cannot be terminating a statement
            '#' (~'\n')* ('\n')+ 
            {if (token!=null) token.setChannel(99); else channel=99;}
        )?
        */
    ;

#src "python.g" 586
/** Comments not on line by themselves are turned into newlines.

    b = a # end of line comment

    or

    a = [1, # weird
         2]

    This rule is invoked directly by nextToken when the comment is in
    first column or when comment is on end of nonwhitespace line.

	Only match \n here if we didn't start on left edge; let NEWLINE return that.
	Kill if newlines if we live on a line by ourselves
	
	Consume any leading whitespace if it starts on left edge.
 */
COMMENT
@init {
    channel = 99;
}
    :	{startPos==0}?=> (' '|'\t')* '#' (~'\n')* '\n'+
    |	{startPos>0}?=> '#' (~'\n')* // let NEWLINE handle \n unless char pos==0 for '#'
    ;
