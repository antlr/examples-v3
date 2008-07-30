tree grammar PolyDifferentiator;
options 
{
	tokenVocab		= Poly;
	output			= AST;
	language		= C;
	ASTLabelType	= pANTLR3_BASE_TREE;
	
//	rewrite=true; // works either in rewrite or normal mode
}

poly
@declarations
{
			pANTLR3_STRING c2;
			pANTLR3_STRING e2;
			int	ci, ei;
}
	:	^('+' poly poly)
	|	^(MULT INT ID)		-> INT
	|	^(MULT c=INT ^('^' ID e=INT))
		{
			// To get ourselves a new string, we just get a copy of the
			// text of one of the tokens. When we override the text, it only changes this local copy and not the
			// actual print stream. We need the strings anyway because we need to use their values. We could use
			// $c.int, but then we would not have the advantage of the string to use, and anyway, our string has
			// a method to convert to int anyway, which is what the \$int reference uses :-)
			//
			// Note that if there is any danger that the text has been changed with SETTEXT in the lexer, or
			// was rewritten with new text by the parser, then we cannot use this trick as the text we get back
			// will be a pointer to the pANTLR3_STRING that was used to set the text, rather than a new one created
			// from the text stream.
			//
			// This allows you to either keep getting copies of the text in the input stream, or just get one copy
			// and manipulate it with a local reference after that. Make sure you understand this if you are going to use
			// the .text references... which you don't have to of course. If you are using C++ and want the
			// standard template libraries or some other implementation , then write yourself a constructor that takes a
			// token/tree/whatever and constructs the string itself like input->subString does. 
			//
			c2 = $c.text;
			e2 = $e.text;
			ci = c2->toInt32(c2);
			ei = e2->toInt32(e2);
			c2->set8(c2, "");
			c2->addi(c2, ci*ei);
			e2->set8(e2, "");
			e2->addi(e2, ei-1);
		}
				-> ^(MULT["*"] INT[c2->chars] ^('^' ID INT[e2->chars]))
				
	|	^('^' ID e=INT)
		{
			c2 = $e.text;
			e2 = $e.text;
			ei = e2->toInt32(e2);

			e2->set8(e2, "");
			e2->addi(e2, ei-1);

		}
							-> ^(MULT["*"] INT[c2->chars] ^('^' ID INT[e2->chars]))
	|	INT					-> INT["0"]
	|	ID					-> INT["1"]
	;
