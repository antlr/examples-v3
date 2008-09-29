tree grammar LangDumpDecl;

options 
{
    tokenVocab	    = Lang;
    language	    = C;
    ASTLabelType	= pANTLR3_BASE_TREE;
}

decl	: decls+
		;

decls : ^(DECL type d=declarator)

       // label.start, label.start, label.text
       {
			printf("int \%s\n", $d.text->chars);
       }
     ;

type : INTTYPE ;

declarator
     : i=ID
     ;
