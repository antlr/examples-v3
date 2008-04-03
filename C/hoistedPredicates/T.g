/** Demonstrates how semantic predicates get hoisted out of the rule in 
 *  which they are found and used in other decisions.  This grammar illustrates
 *  how predicates can be used to distinguish between enum as a keyword and
 *  an ID *dynamically*. :)
 *
 * Run "java org.antlr.Tool -dfa T.g3pl" to generate DOT (graphviz) files.  See
 * the T_dec-1.dot file to see the predicates in action.
 *
 * Adapted from Java equivalent example by Jim Idle - Apr 2007 
 */
grammar T;

options
{
    language	= C;
}

@members 
{
    /** With this true, enum is seen as a keyword.  False, it's an identifier.
     *  Note that while stick a global into @members like this is very convenient,
     *  it is also very not thread safe. When thread safety is required, use a dynamic global
     *  scope as in the C parsing example.
     */
    ANTLR3_BOOLEAN enableEnum = ANTLR3_FALSE;
}

// Modifed slightly from the Java example to give an example of
// invoking a parser rule with a parameter. Also note that you have to be more careful
// with your rule names in C as the functions they generate are not obfuscated. This rule was
// called stat, but that generates a function called stat() that clashes with the C runtime.
// I have left it this way as it is more intuitive and is aminor incovenience at most.
//
statement[ANTLR3_BOOLEAN asIDs]

    @init
    {
	enableEnum  = $asIDs;
    }
    : identifier    {printf("enum is an ID\n");}
    | enumAsKeyword {printf("enum is a keyword\n");}
    ;

identifier
    : ID
    | enumAsID
    ;

enumAsKeyword : {enableEnum}? 'enum' ;

enumAsID : {!enableEnum}? 'enum' ;

ID  :   ('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'0'..'9'|'_')*
    ;

INT :	('0'..'9')+
    ;

WS  :   (   ' '
        |   '\t'
        |   '\r'
        |   '\n'
        )+
        { $channel=HIDDEN; }
    ;    
