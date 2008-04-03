grammar Simple;

options
{
    language	= C;
}

tokens 
{
	RCURLY='}';
}

// Include external declarations of our parser calling functions
//
@lexer::includes
{
#include    <islandfuncs.h>
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

@lexer::members 
{
#define	JAVADOC_CHANNEL 1;
    static int nesting	= 0;
}

/** This example is meant to illustrate how ANTLR can handle so-called "island
 *  grammars", which are just embedded languages.  I chose a particularly
 *  nasty problem.  A simple programming language with javadoc-style
 *  comments with the usual embedded @author tag but also with embedded
 *  Simple code actions in curlies such as {x=3}.  Now that is a stupid
 *  thing maybe from a language design point of view, but is hard because it's
 *  a language (Simple) embedded within another language (JavaDoc) embedded
 *  within the innermost language (Simple) again.  See the input file.
 *  So the Simple lexer invokes the javadoc lexer which invokes the Simple
 *  lexer again.  The key seems to be returning an EOF token when you
 *  see the "final" token.
 *
 *  This example is made nasty further by using valid characters of Simple
 *  (the curlies) to delimit it inside the Javadoc comments. The problem is
 *  that '}' may be a regular curly inside a Simple statement or it could
 *  be the signal that the embedded action is over.  You must count the
 *  curly nesting level to decide if it's time to stop the embedded action.
 *  consider every "island grammar input chunk" such as javadoc or
 *  embedded Simple statements as a separate "file".  So, when I hit the
 *  last delimiter token that says to bail out, I just return EOF.  Then
 *  there is no need for an explicit stack of input streams.
 *
 *  Finally, this grammar illustrates how to share input streams as all
 *  the grammars pull from the same input stream.
 *
 *  A key point to notice is that since I create a new token stream when
 *  I go off to recognize javadoc comments, the lookahead for the Simple
 *  parser is not messed up in any way.
 */
program 
    : (variable)*
          (method)+
    ;

variable
    : 'int' ID ('=' expr)? ';'
    ;

method  
    : 'method' ID '(' ')' {printf("enter method \%s\n",$ID.text->chars);}
          block
    ;

block   
    : '{'
	(variable)*
        (statement)+
      '}'
    ;

statement
    : ID '=' expr ';' {printf("assignment to \%s\n",$ID.text->chars);}
    | 'return' expr ';'
    | block
    ;

expr    : ID
        | INT
        ;

ID      : ('a'..'z'|'A'..'Z')+ ;
INT     : ('0'..'9')+ ;
WS      : (' '|'\t'|'\n'|'\r')+ {$channel=HIDDEN;}
        ;
LCURLY  : '{' {nesting++;}
        ;
/** If we have a '}' with nesting level 0 then it must match the '{'
 *  (unseen by this grammar) that started an embedded Simple statement
 *  block within a javadoc comment.
 */
RCURLY  
    : '}'
    {
	if ( nesting<=0 ) 
	{
	    LTOKEN	= EOF_TOKEN;
	    printf("exiting embedded simple\n");
        }
        else 
	{
	    nesting--;
	}
    }
    ;

JAVADOC 
    : '/*' '*'
          {
	      callJavadoc(INPUT);

            // returns a JAVADOC token to the java parser but on a
            // different channel than the normal token stream so it
            // doesn't get in the way.
            $channel = JAVADOC_CHANNEL;
          }
        ;
