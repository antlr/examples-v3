grammar Javadoc;

options
{
    language	= C;
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

comment 
    : ( author )* 
    ;

author  
    : '@author' ID {printf("author ",$ID.text->chars);} ;

ID      
    : ('a'..'z'|'A'..'Z')+
    ;

SIMPLE  
    : '{'
    {
	callSimple(INPUT);
	$channel=HIDDEN;
    }
    ;

/** When the javadoc parser sees end-of-comment it just says 'I'm done', which
 *  consumes the tokens and forces this javadoc parser (feeding
 *  off the input stream currently) to exit.  It returns from
 *  method comment(), which was called from JAVADOC action in the
 *  Simple parser's lexer.
 */
END     : '*' '/' 
	  {
	    LTOKEN = EOF_TOKEN;
	    printf("exit javadoc\n");
	  }
        ;

WS      : (' '|'\t'|'\n'|'\r')+
        ;
