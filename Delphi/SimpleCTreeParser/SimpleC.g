grammar SimpleC;

options {
    language=Delphi; 
    output=AST;
}

tokens {
    VAR_DEF;
    ARG_DEF;
    FUNC_HDR;
    FUNC_DECL;
    FUNC_DEF;
    BLOCK_IMPL;
}

prog
    :   declaration+
    ;

declaration
    :   variable
    |   functionHeader ';' -> ^(FUNC_DECL functionHeader)
    |   functionHeader block -> ^(FUNC_DEF functionHeader block)
    ;

variable
    :   datatype declarator ';' -> ^(VAR_DEF datatype declarator)
    ;

declarator
    :   ID 
    ;

functionHeader
    :   datatype ID '(' ( formalParameter ( ',' formalParameter )* )? ')'
        -> ^(FUNC_HDR datatype ID formalParameter*)
    ;

formalParameter
    :   datatype declarator -> ^(ARG_DEF datatype declarator)
    ;

datatype
    :   'int'   
    |   'char'  
    |   'void'
    |   ID        
    ;

block
    :   lc='{'
            variable*
            stat*
        '}'
        -> ^(BLOCK_IMPL[$lc,'BLOCK'] variable* stat*)
    ;

stat: forStat
    | expr ';'!
    | block
    | assignStat ';'!
    | ';'!
    ;

forStat
    :   'for' '(' start=assignStat ';' expr ';' next=assignStat ')' block
        -> ^('for' $start expr $next block)
    ;

assignStat
    :   ID EQ expr -> ^(EQ ID expr)
    ;

expr:   condExpr
    ;

condExpr
    :   aexpr ( ('=='^ | '<'^) aexpr )?
    ;

aexpr
    :   atom ( '+'^ atom )*
    ;

atom
    : ID      
    | INT      
    | '(' expr ')' -> expr
    ; 

FOR_LOOP : 'for' ;
INT_TYPE : 'int' ;
CHAR: 'char';
VOID: 'void';

ID  :   ('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'0'..'9'|'_')*
    ;

INT :	('0'..'9')+
    ;

EQ   : '=' ;
EQEQ : '==' ;
LT   : '<' ;
PLUS : '+' ;

WS  :   (   ' '
        |   '\t'
        |   '\r'
        |   '\n'
        )+
        { $channel:=HIDDEN; }
    ;    
