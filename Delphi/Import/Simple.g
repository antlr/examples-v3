grammar Simple;

options {
    language=Delphi;
}
// pull in all rules even if not referenced so comments etc... work
import CommonLexer; 

prog : 'program' ID ';' {WriteLn('found program '+$ID.Text);}
       decl+
     ;

decl : 'var' ID ('=' expr)? ';'
       {WriteLn('found var '+$ID.Text);}
     ;

expr : INT | FLOAT ;
