grammar Lang;

options {
	output=AST;
	ASTLabelType=CommonTree;
	language=Delphi; 
}

tokens {DECLARATION;} // an imaginary node

start:	decl;

decl: 	decltype ID ';' -> ^(DECLARATION decltype ID)
	;
	
decltype: INTTYPE  // automatic tree construction builds a node for this rule
     	| FLOATTYPE
     	;

INTTYPE: 	'int' ;
FLOATTYPE: 	'float' ;
ID: 		'a'..'z'+ ;
INT: 		'0'..'9'+ ;
WS: 		(' '|'\n') {$channel := HIDDEN;};
