tree grammar Simplifier;
options {
    language=Delphi;
    tokenVocab=Poly;
    ASTLabelType=CommonTree;
    output=AST;
    backtrack=true;
//    rewrite=true; // works either in rewrite or normal mode
}

/** Match some common patterns that we can reduce via identity
 *  definitions.  Since this is only run once, it will not be
 *  perfect.  We'd need to run the tree into this until nothing
 *  changed to make it correct.
 */
poly:    ^('+' a=INT b=INT)     -> INT[IntToStr($a.int + $b.int)]

    |    ^('+' ^('+' a=INT p=poly) b=INT)
                                -> ^('+' $p INT[IntToStr($a.int + $b.int)])
    
    |    ^('+' ^('+' p=poly a=INT) b=INT)
                                -> ^('+' $p INT[IntToStr($a.int + $b.int)])
    
    |    ^('+' p=poly q=poly)   -> {$p.tree.ToStringTree() = '0'}? $q
                                -> {$q.tree.ToStringTree() = '0'}? $p
                                -> ^('+' $p $q)

    |    ^(MULT INT poly)       -> {1=$INT.int}? poly
                                -> ^(MULT INT poly)

    |    ^('^' ID e=INT)        -> {1=$e.int}? ID
                                -> {0=$e.int}? INT['1']
                                -> ^('^' ID INT)

    |    INT
    |    ID
    ;
