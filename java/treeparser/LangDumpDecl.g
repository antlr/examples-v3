tree grammar LangDumpDecl;
options {
    tokenVocab=Lang;
    ASTLabelType = Tree;
}

decl : ^(DECL type declarator)
       // label.start, label.start, label.text
       {System.out.println("int "+$declarator.text);}
     ;

type : INTTYPE ;

declarator
     : ID
     ;
