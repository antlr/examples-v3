// Demonstrates how semantic predicates get hoisted out of the rule in 
//  which they are found and used in other decisions.  This grammar illustrates
//  how predicates can be used to distinguish between enum as a keyword and
//  an ID *dynamically*. :)
//
// Run "java org.antlr.Tool -dfa t.g" to generate DOT (graphviz) files.  See
// the T_dec-1.dot file to see the predicates in action.
grammar Sample;

options {
	language=Delphi;
}

@memberDeclarations {
// With this true, enum is seen as a keyword.  False, it's an identifier 
EnableEnum: Boolean;
}

stat: identifier    {WriteLn('enum is an ID');}
    | enumAsKeyword {WriteLn('enum is a keyword');}
    ;

identifier
    : ID
    | enumAsID
    ;

enumAsKeyword : {EnableEnum}? 'enum' ;

enumAsID : {not EnableEnum}? 'enum' ;

ID  :   ('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'0'..'9'|'_')*
    ;

INT :	('0'..'9')+
    ;

WS  :   (   ' '
        |   '\t'
        |   '\r'
        |   '\n'
        )+
        { $channel := HIDDEN; }
    ;    
