tree grammar LangDumpDecl;
options {
    language=Python;
    tokenVocab=Lang;
    ASTLabelType = Tree;
}

decl : ^(DECL type declarator)
       // label.start, label.start, label.text
       {print "int "+$declarator.text}
     ;

type : INTTYPE ;

declarator
     : ID
     ;
