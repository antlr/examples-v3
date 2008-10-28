tree grammar SimpleCWalker;

options {
    language=Delphi; 
    tokenVocab=SimpleC;
    ASTLabelType=CommonTree;
}

prog
    :   declaration+
    ;

declaration
    :   variable
    |   ^(FUNC_DECL functionHeader)
    |   ^(FUNC_DEF functionHeader block)
    ;

variable
    :   ^(VAR_DEF datatype declarator)
    ;

declarator
    :   ID 
    ;

functionHeader
    :   ^(FUNC_HDR datatype ID formalParameter*)
    ;

formalParameter
    :   ^(ARG_DEF datatype declarator)
    ;

datatype
    :   'int'
    |   'char'
    |   'void'
    |   ID        
    ;

block
    :   ^(BLOCK_IMPL variable* stat*)
    ;

stat: forStat
    | expr
    | block
    ;

forStat
    :   ^('for' expr expr expr block)
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
