grammar Simple;

options {
    language=CSharp2;
}
// pull in all rules even if not referenced so comments etc... work
import CommonLexer; 

file : 'program' ID ';' {Console.Out.WriteLine("found program "+$ID.Text);}
       decl+
     ;

decl : 'var' ID ('=' expr)? ';'
       {Console.Out.WriteLine("found var "+$ID.Text);}
     ;

expr : INT | FLOAT ;
