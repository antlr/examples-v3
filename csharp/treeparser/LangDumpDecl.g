tree grammar LangDumpDecl;
options {
    tokenVocab=Lang;
    ASTLabelType = Tree;
    language=CSharp; 
}

decl : ^(DECL type declarator)
       // label.start, label.start, label.text
       {Console.Out.WriteLine("int "+$declarator.text);}
     ;

type : INTTYPE ;

declarator
     : ID
     ;
