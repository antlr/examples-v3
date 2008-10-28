tree grammar LangDumpDecl;
options {
	tokenVocab=Lang;
	ASTLabelType = Tree;
	language=Delphi; 
}

decl: 	^(DECLARATION dtype declarator)
       // label.start, label.start, label.text
	{WriteLn('int ' + $declarator.text);}
	;

dtype:	INTTYPE;

declarator
	: ID
	;
