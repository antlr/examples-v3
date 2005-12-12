lexer grammar FuzzyJava;

FIELD
    :   TYPE WS? name=ID WS? (';'|'=')
        {System.out.println("found var "+$name.text);}
    ;

METHOD
    :   TYPE WS? name=ID WS? '(' ( ARG WS? (',' WS? ARG)* )? ')' WS? '{'
        {System.out.println("found method "+$name.text);}
    ;

fragment
TYPE:   'int'
    |   'float'
    |   'void'
    |   ID
    ;

fragment
ARG :   TYPE WS? ID
    ;

fragment
ID  :   ('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'_')*
    ;

fragment
WS  :   (' '|'\t'|'\n')+
    ;
