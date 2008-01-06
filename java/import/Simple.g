grammar Simple;
// pull in all rules even if not referenced so comments etc... work
import CommonLexer; 

file : 'program' ID ';' decl+ ;

decl : 'var' ID ('=' expr)? ';' ;

expr : INT | FLOAT ;
