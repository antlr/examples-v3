grammar T;

method
scope {
  /** name is visible to any rule called by method directly or indirectly */
  String name; 
}
    :   "method" ID '(' ')' {$name=$ID.text;} body
    ; 

body:   '{' (stat)* '}'
    ;

stat:   ID '=' expr ';'
    |   method // allow nested methods to demo stack nature of dynamic attributes
    ;

expr:   mul ('+' mul)* 
    ;

mul :   atom ('*' atom)*
    ;

/** Demonstrate that "name" is a dynamically-scoped attribute defined
 *  within rule method.  With lexical-scoping (variables go away at
 *  the end of the '}'), you'd have to pass the current method name
 *  down through all rules as a parameter.  Ick.  This is much much better.
 */
atom:   ID  {System.out.println("ref "+$ID.text+" from method "+$method.name);}
    |   INT {System.out.println("int "+$INT.text+" in method "+$method.name);}
    ;

ID  :   ('a'..'z'|'A'..'Z')+ ;

INT :   ('0'..'9')+ ;

WS  :   (' '|'\t'|'\n')+ {channel=99;}
    ;
