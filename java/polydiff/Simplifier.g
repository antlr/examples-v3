tree grammar Simplifier;
options {
	tokenVocab=Poly;
	ASTLabelType=CommonTree;
	output=AST;
	//rewrite=true;
}

poly:	// special case; ambiguous, but resolves properly to first alt
		^('+' a=INT b=INT)	-> INT[String.valueOf($a.int+$b.int)]

	|	^('+' p=poly q=poly)-> {$p.tree.toStringTree().equals("0")}? $q
							-> {$q.tree.toStringTree().equals("0")}? $p
							-> ^('+' $p $q)

	|	^(MULT INT poly)	-> {$INT.int==1}? poly
							-> ^(MULT INT poly)

	|	^('^' ID e=INT)		-> {$e.int==1}? ID
							-> {$e.int==0}? INT["1"]
							-> ^('^' ID INT)

	|	INT
	|	ID
	;
