grammar SimpleC;
options 
{
    output			= AST;
    language		= C;
	ASTLabelType	= pANTLR3_BASE_TREE;
}

tokens 
{
    VAR_DEF;
    ARG_DEF;
    FUNC_HDR;
    FUNC_DECL;
    FUNC_DEF;
    BLOCK;
}

program
    :   declaration+
    ;

declaration
    :   variable
    |   functionHeader ';'	-> ^(FUNC_DECL functionHeader)
    |   functionHeader block	-> ^(FUNC_DEF  functionHeader block)
    ;

variable
    :   type declarator ';'	-> ^(VAR_DEF type declarator)
    ;

declarator
    :   ID 
    ;

functionHeader
    :   type ID '(' ( formalParameter ( ',' formalParameter )* )? ')'

				-> ^(FUNC_HDR type ID formalParameter+)
    ;

formalParameter
    :   type declarator 
				-> ^(ARG_DEF type declarator)
    ;

type
    :   'int'   
    |   'char'  
    |   'void'
    |   ID        
    ;

block
    :   lc='{'
            variable*
            cstat*
        '}'
        -> ^(BLOCK[$lc, "BLOCK"] variable* cstat*)
    ;

cstat: forStat
    | expr ';'!
    | block
    | assignStat ';'!
    | ';'!
    ;

forStat
    :   'for' '(' start=assignStat ';' e=expr ';' next=assignStat ')' block
        -> ^('for' $start $e $next block)
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

FOR : 'for' ;
INT_TYPE : 'int' ;
CHAR_TYPE: 'char';
VOID_TYPE: 'void';

ID  :   ('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'0'..'9'|'_')*
    ;

INT :	('0'..'9')+
    ;

EQ   : '=' ;
EQEQ : '==' ;
OPLT   : '<' ;
PLUS : '+' ;

WS  :   (   ' '
        |   '\t'
        |   '\r'
        |   '\n'
        )+
        { $channel=HIDDEN; }
    ;    
