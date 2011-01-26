tree grammar LangDumpDecl;
options {
    tokenVocab=Lang;
    ASTLabelType = ITree;
    language=CSharp2; 
}

public
decl : ^(DECL type declarator)
       // label.start, label.start, label.text
       {Console.Out.WriteLine("int "+$declarator.text);}
     ;

type : INTTYPE ;

declarator
     : ID
     ;
