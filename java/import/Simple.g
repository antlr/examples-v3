grammar Simple;
// pull in all rules even if not referenced so comments etc... work
import CommonLexer; 

file : 'program' ID ';' {System.out.println("found program "+$ID.text);}
       decl+
     ;

decl : 'var' ID ('=' expr)? ';'
       {System.out.println("found var "+$ID.text);}
     ;

expr : INT | FLOAT ;
