tree grammar PolyDifferentiator;
options {
    language=CSharp2;
    tokenVocab=Poly;
    ASTLabelType=CommonTree;
    output=AST;
//    rewrite=true; // works either in rewrite or normal mode
}

@header {
    #pragma warning disable 0219
}

poly:    ^('+' poly poly)
    |    ^(MULT INT ID)         -> INT
    |    ^(MULT c=INT ^('^' ID e=INT))
        {
          string c2 = "" + $c.int*$e.int;
          string e2 = "" + ($e.int-1);
        }
                                -> ^(MULT["*"] INT[c2] ^('^' ID INT[e2]))
    |    ^('^' ID e=INT)
        {
          string c2 = "" + $e.int;
          string e2 = "" + ($e.int-1);
        }
                                -> ^(MULT["*"] INT[c2] ^('^' ID INT[e2]))
    |    INT                    -> INT["0"]
    |    ID                     -> INT["1"]
    ;
