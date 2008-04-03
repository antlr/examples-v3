grammar T;

options
{
    language = C;
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

program 
    : method ;

method
    scope 
    {
      /** name is visible to any rule called by method directly or indirectly.
       *  There is also a stack of these names, one slot for each nested
       *  invocation of method.  If you have a method nested within another
       *  method then you have name strings on the stack.  Referencing
       *  $method.name access the topmost always.  I have no way at the moment
       *  to access earlier elements on the stack.
       */
      pANTLR3_STRING name; 
    }
    :   'method' ID '(' ')' {$method::name=$ID.text;} body
    ; 

body
    :   '{' bstat* '}'
    ;

// Cannot call this stat as it will clash with C runtime functions
//
bstat
    :   ID '=' expr ';'
    |   method // allow nested methods to demo stack nature of dynamic attributes
    ;

expr:   mul ('+' mul)* 
    ;

mul :   atom ('*' atom)*
    ;

/** Demonstrate that 'name' is a dynamically-scoped attribute defined
 *  within rule method.  With lexical-scoping (variables go away at
 *  the end of the '}'), you'd have to pass the current method name
 *  down through all rules as a parameter.  Ick.  This is much much better.
 */
atom
    :   ID  {printf("ref \%s from method \%s\n",$ID.text->chars, $method::name->chars);}
    |   INT {printf("int \%s in method \%s\n", $INT.text->chars, $method::name->chars);}
    ;

ID  :   ('a'..'z'|'A'..'Z')+ ;

INT :   '0'..'9'+ ;

WS  :   (' '|'\t'|'\n'|'\r')+ {$channel=HIDDEN;}
    ;
