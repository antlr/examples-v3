grammar SymtabTest;
options{language=JavaScript;}

/* Scope of symbol names.  Both globals and block rules need to push a new
 * symbol table upon entry and they must use the same stack.  So, I must
 * define a global scope and say that globals and block use this by saying
 * 'scope Symbols;' in those rule definitions.
 */
scope Symbols {
  var names;
}

@header {
}

@members {
	this.level = 0;
}

prog:   globals (method)*
    ;

globals
scope Symbols;
@init {
    this.level++;
    $Symbols::names = [];
}
    :   (decl)*
        {
        print("globals: "+$Symbols::names);
        this.level--;
        }
    ;

method
    :   'method' ID '(' ')' block
    ;

block
scope Symbols;
@init {
    this.level++;
    $Symbols::names = [];
}
    :   '{' (decl)* (stat)* '}'
        {
        print("level "+this.level+" symbols: "+$Symbols::names);
        this.level--;
        }
    ;

stat:   ID '=' INT ';'
    |   block
    ;

decl:   'int' ID ';'
        {$Symbols::names.push($ID);} // add to current symbol table
    ;

ID  :   ('a'..'z')+
    ;

INT :   ('0'..'9')+
    ;

WS  :   (' '|'\n'|'\r')+ {$channel=HIDDEN;}
    ;
