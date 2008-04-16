tree grammar LangDumpDecl;
options {
    language=ActionScript;
    tokenVocab=Lang;
    ASTLabelType = Tree;
}

decl : ^(DECL type declarator)
       // label.start, label.start, label.text
       {trace("int "+$declarator.text);}
     ;

type : INTTYPE ;

declarator
     : ID
     ;
