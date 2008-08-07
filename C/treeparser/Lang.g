grammar Lang;
options 
{
    // Note that in the C implementation, all implementations of trees and
    // adaptors pass around pANTLR3_BASE_TREE, which contains a super pointer
    // to your own implementation of a tree node and tree and so on. Hence
    // the node type is ALWAYS pANTLR3_BASE_TREE and there is no need to define
    // the type (the definition is silently ignored if you leave it there)
    //
	output	    = AST;
	language    = C;
    ASTLabelType	= pANTLR3_BASE_TREE;
}

tokens 
{
    DECL; // an imaginary node
}

start	: decl+ 
	;

decl	: type ID ';' -> ^(DECL type ID)
	;

type	: INTTYPE  // automatic tree construction builds a node for this rule
	| FLOATTYPE
	;

INTTYPE	    : 'int'	    ;
FLOATTYPE   : 'float'	    ;
ID	    : 'a'..'z'+	    ;
INT	    : '0'..'9'+	    ;
WS	    : (' '|'\n' | '\r')    {$channel=HIDDEN;} ;
