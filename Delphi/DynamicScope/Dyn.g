grammar Dyn;

options {
	language=Delphi;
}

prog : method ;

method
scope {
   String Name;
}
    :   'method' ID '(' ')' {$method::Name=$ID.Text;} body
    ; 

body:   '{' stat* '}'
    ;

stat:   ID '=' expr ';'
    |   method // allow nested methods to demo stack nature of dynamic attributes
    ;

expr:   mul ('+' mul)* 
    ;

mul :   atom ('*' atom)*
    ;

/** Demonstrate that 'name' is a dynamically-scoped attribute defined
 *  within rule method.  With lexical-scoping (variables go away at
 *  the end of the '}'), you'd have to pass the current method name
 *  down through all rules as a parameter.  Ick.  This is much much better.
 */
atom:   ID  {WriteLn('ref '+$ID.Text+' from method '+$method::Name);}
    |   INT {WriteLn('int '+$INT.Text+' in method '+$method::Name);}
    ;

ID  :   ('a'..'z'|'A'..'Z')+ ;

INT :   '0'..'9'+ ;

WS  :   (' '|'\t'|'\n')+ {$channel := HIDDEN;}
    ;
