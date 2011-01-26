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
  List<IToken> names;
}

@members {
int level = 0;

private string ListToSTring(List<IToken> list) {
	List<string> names = new List<string>();
	foreach(IToken token in list) {
		names.Add(token.Text);
	}
	return String.Join(",", names.ToArray());
}
}

public
prog:   globals (method)*
    ;

globals
scope Symbols;
@init {
    level++;
    $Symbols::names = new List<IToken>();
}
    :   (decl)*
        {
        Console.Out.WriteLine("globals: " +  ListToSTring($Symbols::names));
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
    $Symbols::names = new List<IToken>();
}
    :   '{' (decl)* (stat)* '}'
        {
        Console.Out.WriteLine("level "+level+" symbols: " + ListToSTring($Symbols::names));
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

WS  :   (' '|'\n'|'\r')+ {$channel=Hidden;}
    ;
