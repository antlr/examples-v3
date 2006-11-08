grammar SymtabTest;

/* Scope of symbol names.  Both globals and block rules need to push a new
 * symbol table upon entry and they must use the same stack.  So, I must
 * define a global scope and say that globals and block use this by saying
 * 'scope Symbols;' in those rule definitions.
 */
scope Symbols {
  List names;
}

@header {
import java.util.List;
import java.util.ArrayList;
}

@members {
int level = 0;
}

prog:   globals (method)*
    ;

globals
scope Symbols;
@init {
    level++;
    $Symbols::names = new ArrayList();
}
    :   (decl)*
        {
        System.out.println("globals: "+$Symbols::names);
        level--;
        }
    ;

method
    :   'method' ID '(' ')' block
    ;

block
scope Symbols;
@init {
    level++;
    $Symbols::names = new ArrayList();
}
    :   '{' (decl)* (stat)* '}'
        {
        System.out.println("level "+level+" symbols: "+$Symbols::names);
        level--;
        }
    ;

stat:   ID '=' INT ';'
    |   block
    ;

decl:   'int' ID ';'
        {$Symbols::names.add($ID);} // add to current symbol table
    ;

ID  :   ('a'..'z')+
    ;

INT :   ('0'..'9')+
    ;

WS  :   (' '|'\n'|'\r')+ {$channel=HIDDEN;}
    ;
