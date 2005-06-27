tree grammar LangTreeParser;
options {
    tokenVocab=LangParser;
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
