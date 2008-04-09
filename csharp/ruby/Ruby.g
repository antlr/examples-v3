/** A grammar for ruby built from scratch by Terence Parr.  As a Ruby Nuby
 *  I used Yukihiro Matsumoto's parse.y and
 *  http://www.math.sci.hokudai.ac.jp/~gotoken/ruby/man/syntax.html
 *  a references.
 *
 * November 27, 2005
 */
grammar Ruby;

options {
	language=CSharp2;
	backtrack=true;
}

program
    :   compoundstmt
    |   classdef
    |   method
    ;

classdef
    :   'class' ID
        ( method | assignmentexpr )*
        'end'
    ;

method
    :   methodhead bodystmt
    ;

methodhead
    :   'def' (expr '.')? ID ( '(' formalargs ')' | formalargs )? terminator
    ;

formalargs
    :   arg (',' arg)* (',' '*' arg)? (',' '&' expr)?
    ;

arg :   ID ('=' expr)?
    ;

bodystmt
    :   slist
        //rescue?
        ('ensure' slist)?
        ('else' slist)?
    ;

compoundstmt
    :   slist terminator?
    ;

slist
    :   stmt (terminator stmt)*
    ;

stmt: simplestmt terminator //stmtmodifier*
    ;

simplestmt
    :   expr terminator
/*   'alias' fitem  fitem
    |   'alias' GVAR GVAR
    |   'alias' GVAR BACK_REF
    |   'alias' GVAR NTH_REF
    |   UNDEF undef_list
    |   'BEGIN' '{' compoundstmt '}'
    |   'END' '{' compoundstmt '}'
    |   lhs '=' command_call
    |   mlhs '=' command_call
    |   var_lhs OP_ASGN command_call
    |   primary_value '[' aref_args ']' OP_ASGN command_call
    |   primary_value '.' IDENTIFIER OP_ASGN command_call
    |   primary_value '.' CONSTANT OP_ASGN command_call
    |   primary_value COLON2 IDENTIFIER OP_ASGN command_call
    |   backref OP_ASGN command_call
    |   lhs '=' mrhs
    |   mlhs '=' arg_value
    |   mlhs '=' mrhs
    |   expr
*/
    ;

block
    :   '{' compoundstmt '}'
    |   'do' compoundstmt 'end'
    ;

stmtmodifier
    :   'if' expr
    |   'unless' expr
    |   'while' expr
    |   'until' expr
    |   'rescue' stmt
    ;

actualargs
    :   expr (',' expr)* (',' '*' expr)?
    |   '*' expr
    ;

lhs :   slot ( '[' exprlist ']')?
    ;

multilhs
    :   lhs (',' lhs)* (',' '*' expr)?
    |   '*' lhs
    ;

exprlist
    :   expr (',' expr)*
    ;

expr:   assignmentexpr
    ;

assignmentexpr
    :   primary (',' primary)* ('=' primary (',' primary)* )?
    ;

primary
    :   slot ( '(' actualargs ')' | '[' exprlist ']' | actualargs )?
    |   aggregate
    ;

slot:   atom
        (   '.' (ID|CONSTANT)
        |   '::' (ID|CONSTANT)
        |   ':::' CONSTANT
        )?
    ;

aggregate
    :   '[' exprlist ']'
//    |   '{' exprlist '}'
    ;

atom:   variable
    |   INT
    |   FLOAT
    |   DOUBLE_STRING
    |   '(' expr ')'
    ;

variable
	: ID
    | IVAR
    | GVAR
    | CONSTANT
    | CVAR
    | 'nil' 
    | 'self'
    | 'true'
    | 'false'
    | '__FILE__'
    | '__LINE__'
    ;

terminator
    : ';' 
    | NL
    ;


// LEXER RULES

/** global variable */
GVAR:   '$' ID ;

/** instance variable */
IVAR:   '@' ID ;

/** Class variable */
CVAR:   '@@' 'A'..'Z'+ ;

CONSTANT
    :   'A'..'Z' ('a'..'z'|'A'..'Z'|'0'..'9'|'_')*
    ;

ID :   ('a'..'z'|'_') ('a'..'z'|'A'..'Z'|'0'..'9'|'_')* ;

INT:    '0'..'9'+ ;

FLOAT
    :   INT '.' INT
    |   '.' INT
    ;

DOUBLE_STRING
    :   '\"' (options {greedy=false;}: .)* '\"'
    ;

NL  :   '\n'
    ;

WS  :   (' '|'\t')+ {$channel=HIDDEN;}
    ;
