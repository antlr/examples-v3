tree grammar Simplifier;
options 
{
	tokenVocab		= Poly;
	ASTLabelType	= pANTLR3_BASE_TREE;
	output			= AST;
	backtrack		= true;
	language		= C;
//	rewrite=true; // works either in rewrite or normal mode
}

/** Match some common patterns that we can reduce via identity
 *  definitions.  Since this is only run once, it will not be
 *  perfect.  We'd need to run the tree into this until nothing
 *  changed to make it correct.
 */
poly
@declarations
{
	pANTLR3_STRING s1, s2, s3;
}
@init
{
	s1 = NULL; s2 = NULL; s3 = NULL;// Prevent compiler warnings
}
	:	^('+' a=INT b=INT)	
		{
			// Because we may have done a rewrite in the differentiator of any of the tokens, and
			// given it new text, we cannot just use the string return by a .text reference
			// in this parser like we could in the differentiator because unlike Java where you 
			// get new string reference, we will get the a pointer to the same rewritten string each time!
			// So, we just ask the string factory for a brand new one. Same goes for the alts below.
			//
			s1=$a.text;
			s2=$b.text;
			s3= ADAPTOR->strFactory->newRaw(ADAPTOR->strFactory);
			s3->addi(s3, (s1->toInt32(s1)+s2->toInt32(s2)));
		}
			-> INT[s3->chars]

	|	^('+' ^('+' a=INT p=poly) b=INT)
		{
			s1=$a.text;
			s2=$b.text;
			s3= ADAPTOR->strFactory->newRaw(ADAPTOR->strFactory);
			s3->addi(s3, (s1->toInt32(s1)+s2->toInt32(s2)));
		}	
	
			-> ^('+' $p INT[s3->chars])
	
	|	^('+' ^('+' p=poly a=INT) b=INT)
		{
			s1=$a.text;
			s2=$b.text;
			s3= ADAPTOR->strFactory->newRaw(ADAPTOR->strFactory);
			s3->addi(s3, (s1->toInt32(s1)+s2->toInt32(s2)));
		}	
	
			-> ^('+' $p INT[s3->chars])
	
	|	^('+' p=poly q=poly)
	
		{
			s1 = $p.tree->toStringTree($p.tree);
			s2 = $q.tree->toStringTree($q.tree);			
		}
			-> {s1->compare8(s1, "0") == 0}? $q
			-> {s2->compare8(s2, "0") == 0}? $p
			-> ^('+' $p $q)

	|	^(MULT INT poly)	-> {$INT.int==1}? poly
							-> ^(MULT INT poly)

	|	^('^' ID e=INT)		-> {$e.int==1}? ID
							-> {$e.int==0}? INT["1"]
							-> ^('^' ID INT)

	|	INT
	|	ID
	;
