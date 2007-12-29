tree grammar Simplifier;
options {
	tokenVocab=Poly;
	ASTLabelType=CommonTree;
	output=AST;
	//rewrite=true;
}

poly:	// special case; ambiguous, but resolves properly to first alt
		^('+' a=INT b=INT)	-> INT[String.valueOf($a.int+$b.int)]

	|	^('+' p=poly term)	-> {$p.tree.toStringTree().equals("0")}? term
							-> {$term.tree.toStringTree().equals("0")}? poly
							-> ^('+' poly term)

	|	term
	;

term
	:	^(MULT INT ID)		-> {$INT.int==1}? ID
							-> ^(MULT INT ID)

	|	^(MULT c=INT ^('^' ID e=INT))
							-> {$c.int==1}? ^('^' ID $e)
							-> {$e.int==1}? ^(MULT $c ID)
							-> {$e.int==0}? $c
							-> ^(MULT $c ^('^' ID $e))

	|	^('^' ID e=INT)		-> {$e.int==1}? ID
							-> {$e.int==0}? INT["1"]
							-> ^('^' ID INT)

	|	INT
	|	ID
	;
