grammar Simple;

options {
	language=ActionScript;
}

// pull in all rules even if not referenced so comments etc... work
import CommonLexer; 

file : 'program' ID ';' {trace("found program "+$ID.text);}
       decl+
     ;

decl : 'var' ID ('=' expr)? ';'
       {trace("found var "+$ID.text);}
     ;

expr : INT | FLOAT ;
