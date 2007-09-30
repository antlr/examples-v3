grammar SymtabTest;

options {
    language=Python;
}

/* Scope of symbol names.  Both globals and block rules need to push a new
 * symbol table upon entry and they must use the same stack.  So, I must
 * define a global scope and say that globals and block use this by saying
 * 'scope Symbols;' in those rule definitions.
 */
scope Symbols {
names
}

@init {
self.level = 0
}

prog:   globals (method)*
    ;

globals
scope Symbols;
@init {
self.level += 1
$Symbols::names = []
}
    :   (decl)*
        {
print "globals: [\%s]" \% ", ".join([str(n) for n in $Symbols::names])
self.level -= 1
        }
    ;

method
    :   'method' ID '(' ')' block
    ;

block
scope Symbols;
@init {
self.level += 1
$Symbols::names = []
}
    :   '{' (decl)* (stat)* '}'
        {
print "level \%s symbols: [\%s]" \% (self.level, ", ".join([str(n) for n in $Symbols::names]))
self.level -= 1
        }
    ;

stat:   ID '=' INT ';'
    |   block
    ;

decl:   'int' ID ';'
        {$Symbols::names.append($ID)} // add to current symbol table
    ;

ID  :   ('a'..'z')+
    ;

INT :   ('0'..'9')+
    ;

WS  :   (' '|'\n'|'\r')+ {$channel=HIDDEN}
    ;
