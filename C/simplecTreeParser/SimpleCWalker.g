tree grammar SimpleCWalker;
options {
    tokenVocab	    = SimpleC;
    ASTLabelType    = pANTLR3_BASE_TREE;
    language	    = C;
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
    :   'int'
    |   'char'
    |   'void'
    |   ID        
    ;

block
    :   ^(BLOCK variable* cstat*)
    ;

cstat: forStat
    | expr
    | block
    ;

forStat
    :   ^('for' expr expr expr block)
    ;

expr:   ^(EQEQ expr expr)
    |   ^(OPLT expr expr)
    |   ^(PLUS expr expr)
    |   ^(EQ ID expr)
    |   atom
    ;

atom
    : ID      
    | INT      
    ; 
