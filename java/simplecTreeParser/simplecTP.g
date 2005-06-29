tree grammar SimpleCTreeParser;
options {
    tokenVocab=SimpleC;
}

program
    :   declaration+
    ;

declaration
    :   variable
    |   ^(FUNC_DECL functionHeader)
    |   ^(FUNC_DEF functionHeader block)
    ;

variable
    :   ^(VAR_DEF type declarator)
    ;

declarator
    :   ID 
    ;

functionHeader
    :   ^(FUNC_HDR type ID formalParameter+)
    ;

formalParameter
    :   ^(ARG_DEF type declarator)
    ;

type
    :   INT_TYPE  // i have to use token names not "int" for now;
    |   CHAR      // the .tokens file can't handle literals yet
    |   VOID
    |   ID        
    ;

block
    :   ^(BLOCK variable* stat*)
    ;

stat: forStat
    | expr
    | block
    ;

forStat
    :   ^(FOR expr expr expr block)
    ;

expr:   ^(EQEQ expr expr)
    |   ^(LT expr expr)
    |   ^(PLUS expr expr)
    |   ^(EQ ID expr)
    |   atom
    ;

atom
    : ID      
    | INT      
    ; 
