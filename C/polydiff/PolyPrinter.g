tree grammar PolyPrinter;
options 
{
	tokenVocab	= Poly;
	language	= C;
	ASTLabelType = pANTLR3_BASE_TREE;
}

poly: p=polys
	{
		printf("Polynomial:\n\n\%s", $p.result->chars);	// Note that \% escapes the percent sign from ANTLR and is lost to C
	}
	;
	
polys
	
returns [ pANTLR3_STRING result ]
	
	:	^('+'  a=polys b=polys)
		{
			$result = $a.result;
			$a.result->append8($a.result, " + ");
			$a.result->appendS($a.result, $b.result);
					
		}
	|	^(MULT a=polys b=polys)
			{
				$result = $a.result;
				$a.result->appendS($a.result, $b.result);
			}
	|	^('^'  a=polys b=polys)
		{
			$result = $a.result;
			$a.result->append8($a.result, "^");
			$a.result->appendS($a.result, $b.result);					
		}
	|	INT
	
		{ $result = $INT.text; }
		
	|	ID
	
		{ $result = $ID.text; }

	;
