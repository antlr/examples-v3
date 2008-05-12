tree grammar LangDumpDecl;
options {
    tokenVocab=Lang;
    ASTLabelType = Tree;
    language=CSharp2; 
}

decl : ^(DECL type declarator)
       // label.start, label.start, label.text
       {Console.Out.WriteLine("int "+$declarator.text);}
     ;

type : INTTYPE ;

declarator
     : ID
     ;
