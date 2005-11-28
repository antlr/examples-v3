/** A grammar for ruby built from scratch by Terence Parr.  As a Ruby Nuby
 *  I used Yukihiro Matsumoto's parse.y and
 *  http://www.math.sci.hokudai.ac.jp/~gotoken/ruby/man/syntax.html
 *  a references.
 *
 * November 27, 2005
 */
grammar Ruby;

program
    :   compstmt
    ;

bodystmt
    :   slist
        //rescue?
        ("ensure" slist)?
        ("else" slist)?
    ;

compstmt
    :   slist terminator?
    ;

slist
    :   stmt (terminator* stmt)*
    ;

stmt: simplestmt stmtmodifier*
    ;

simplestmt
    :   multiexpr "=" multiexpr
/*   "alias" fitem  fitem
    |   "alias" GVAR GVAR
    |   "alias" GVAR BACK_REF
    |   "alias" GVAR NTH_REF
    |   UNDEF undef_list
    |   "BEGIN" "{" compstmt "}"
    |   "END" "{" compstmt "}"
    |   lhs "=" command_call
    |   mlhs "=" command_call
    |   var_lhs OP_ASGN command_call
    |   primary_value "[" aref_args "]" OP_ASGN command_call
    |   primary_value "." IDENTIFIER OP_ASGN command_call
    |   primary_value "." CONSTANT OP_ASGN command_call
    |   primary_value COLON2 IDENTIFIER OP_ASGN command_call
    |   backref OP_ASGN command_call
    |   lhs "=" mrhs
    |   mlhs "=" arg_value
    |   mlhs "=" mrhs
    |   expr
*/
    ;

stmtmodifier
    :   "if" expr
    |   "unless" expr
    |   "while" expr
    |   "until" expr
    |   "rescue" stmt
    ;

/*
lhs :   variable
	| primary_value "[" aref_args "]"
    | primary_value "." IDENTIFIER
    | primary_value COLON2 IDENTIFIER
    | primary_value "." CONSTANT
    | primary_value COLON2 CONSTANT
    | COLON3 CONSTANT
    | backref
    ;
*/

multiexpr
    :   exprlist ("," "*" expr)?
    |   "*" expr
    ;

exprlist
    :   expr ("," expr)*
    ;

expr:   atom
    ;

atom:   variable
    |   INT
    |   FLOAT
    ;

variable
	: ID
    | IVAR
    | GVAR
    | CONSTANT
    | CVAR
    | "nil" 
    | "self"
    | "true"
    | "false"
    | "__FILE__"
    | "__LINE__"
    ;

terminator
    : ";" 
    | "\n"
    ;


// LEXER RULES

/** global variable */
GVAR:   "$" ID ;

/** instance variable */
IVAR:   "@" ID ;

/** Class variable */
CVAR:   "@@" "A".."Z"+ ;

CONSTANT
    :   "A".."Z" ("a".."z"|"A".."Z"|"0".."9"|"_")*
    ;

ID :   ("a".."z"|"_") ("a".."z"|"A".."Z"|"0".."9"|"_")* ;

INT:    "0".."9"+ ;

FLOAT
    :   INT "." INT
    |   "." INT
    ;

WS  :   (" "|"\t"|"\n")+ {channel=99;}
    ;
