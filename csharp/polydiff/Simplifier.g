tree grammar Simplifier;
options {
    language=CSharp2;
    tokenVocab=Poly;
    ASTLabelType=CommonTree;
    output=AST;
    backtrack=true;
//    rewrite=true; // works either in rewrite or normal mode
}

@header {
    #pragma warning disable 0219
}

/** Match some common patterns that we can reduce via identity
 *  definitions.  Since this is only run once, it will not be
 *  perfect.  We'd need to run the tree into this until nothing
 *  changed to make it correct.
 */
poly:    ^('+' a=INT b=INT)     -> INT["" + ($a.int + $b.int)]

    |    ^('+' ^('+' a=INT p=poly) b=INT)
                                -> ^('+' $p INT["" + ($a.int + $b.int)])
    
    |    ^('+' ^('+' p=poly a=INT) b=INT)
                                -> ^('+' $p INT["" + ($a.int + $b.int)])
    
    |    ^('+' p=poly q=poly)   -> {$p.tree.ToStringTree() == "0"}? $q
                                -> {$q.tree.ToStringTree() == "0"}? $p
                                -> ^('+' $p $q)

    |    ^(MULT INT poly)       -> {$INT.int==1}? poly
                                -> ^(MULT INT poly)

    |    ^('^' ID e=INT)        -> {$e.int==1}? ID
                                -> {$e.int==0}? INT["1"]
                                -> ^('^' ID INT)

    |    INT
    |    ID
    ;
