grammar Poly;
options 
{
	output=AST;
	language = C;
	ASTLabelType    = pANTLR3_BASE_TREE;

}
tokens { MULT; } // imaginary token

poly: term ('+'^ term)*
    ;

term: INT ID  -> ^(MULT["*"] INT ID)
    | INT pexp -> ^(MULT["*"] INT pexp)
    | pexp
    | INT
	| ID
    ;

pexp : ID '^'^ INT
    ;
    
ID	: 'a'..'z'+ ;

INT	: '0'..'9'+ ;

WS	: (' '|'\t'|'\r'|'\n')+ {$channel=HIDDEN;} ;
