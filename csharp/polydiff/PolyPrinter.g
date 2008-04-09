tree grammar PolyPrinter;
options {
    language=CSharp2;
    tokenVocab=Poly;
    ASTLabelType=CommonTree;
    output=template;
}

poly:    ^('+'  a=poly b=poly)    -> template(a={$a.st},b={$b.st}) "<a>+<b>"
    |    ^(MULT a=poly b=poly)    -> template(a={$a.st},b={$b.st}) "<a><b>"
    |    ^('^'  a=poly b=poly)    -> template(a={$a.st},b={$b.st}) "<a>^<b>"
    |    INT                      -> {%{$INT.text}}
    |    ID                       -> {%{$ID.text}}
    ;
