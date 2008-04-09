/** Exact same grammar as examples-v3/java/Java.g but broken into
 *  multiple pieces to illustrate composing grammars via import statement.
 *  Results in multiple classes with Java referring to others via
 *  delegation pattern.  Run ANTLR only once on this root grammar:
 *
 *		java org.antlr.Tool Java.g
 */
grammar Java;
//options {k=2; backtrack=true; memoize=true;}
options {
    language=CSharp2;
    backtrack=true;
    memoize=true;
}

import JavaDecl, JavaAnnotations, JavaExpr, JavaStat, JavaLexerRules;

// starting point for parsing a java file
/* The annotations are separated out to make parsing faster, but must be associated with
   a packageDeclaration or a typeDeclaration (and not an empty one). */
compilationUnit
    :   annotations
        (   packageDeclaration importDeclaration* typeDeclaration*
        |   classOrInterfaceDeclaration typeDeclaration*
        )
    |   packageDeclaration? importDeclaration* typeDeclaration*
    ;
