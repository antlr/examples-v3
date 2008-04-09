grammar SymtabTest;

/* Scope of symbol names.  Both globals and block rules need to push a new
 * symbol table upon entry and they must use the same stack.  So, I must
 * define a global scope and say that globals and block use this by saying
 * 'scope Symbols;' in those rule definitions.
 */

options {
	language=CSharp2;
}

scope Symbols {
  IList names;
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
        Console.Out.WriteLine("globals: " +  Antlr.Runtime.Collections.CollectionUtils.ListToString($Symbols::names));
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
        Console.Out.WriteLine("level "+level+" symbols: " + Antlr.Runtime.Collections.CollectionUtils.ListToString($Symbols::names));
        level--;
        }
    ;

stat:   ID '=' INT ';'
    |   block
    ;

decl:   'int' ID ';'
        {$Symbols::names.Add($ID);} // add to current symbol table
    ;

ID  :   ('a'..'z')+
    ;

INT :   ('0'..'9')+
    ;

WS  :   (' '|'\n'|'\r')+ {$channel=HIDDEN;}
    ;
