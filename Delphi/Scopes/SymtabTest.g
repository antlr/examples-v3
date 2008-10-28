grammar SymtabTest;

/* Scope of symbol names.  Both globals and block rules need to push a new
 * symbol table upon entry and they must use the same stack.  So, I must
 * define a global scope and say that globals and block use this by saying
 * 'scope Symbols;' in those rule definitions.
 */

options {
	language=Delphi;
}

scope Symbols {
  IList<IANTLRInterface> names;
}

@memberDeclarations {
level: Integer;
}

@memberInitializations {
level := 0;
}

prog:   globals (method)*
    ;

globals
scope Symbols;
@init {
Inc(level);
$Symbols::names := TList<IANTLRInterface>.Create;
}
    :   (decl)*
        {
        WriteLn('globals: ' +  TCollectionUtils.ListToString($Symbols::names));
        Dec(level);
        }
    ;

method
    :   'method' ID '(' ')' block
    ;

block
scope Symbols;
@init {
    Inc(level);
    $Symbols::names := TList<IANTLRInterface>.Create;
}
    :   '{' (decl)* (stat)* '}'
        {
        WriteLn('level ', level, ' symbols: ' + TCollectionUtils.ListToString($Symbols::names));
        Dec(level);
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

WS  :   (' '|'\n'|'\r')+ {$channel := HIDDEN;}
    ;
