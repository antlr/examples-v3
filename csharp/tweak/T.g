/** Convert the simple input to be java code; wrap in a class,
 *  convert method with "public void", add decls.  This shows how to insert
 *  extra text into a stream of tokens and how to replace a token
 *  with some text.  Calling toString() on the TokenRewriteStream
 *  in Main will print out the original input stream.
 *
 *  Note that you can do the instructions in any order as the
 *  rewrite instructions just get queued up and executed upon toString().
 */
grammar T;

options {
	language=CSharp2;
}

@header {
using Hashtable			= System.Collections.Hashtable;
using IDictionary		= System.Collections.IDictionary;
using DictionaryEntry	= System.Collections.DictionaryEntry;
}

@members {
TokenRewriteStream tokens; // avoid typecasts all over
}

program
@init {
    tokens = (TokenRewriteStream)input; 
    IToken start = input.LT(1);
}
    :   method+
        {
        tokens.InsertBefore(start,"public class Wrapper {\n");
        // note the reference to the last token matched for method:
        tokens.InsertAfter($method.stop, "\n}\n");
        }
    ;

method
    :   m='method' ID '(' ')' body
        {tokens.Replace($m, "public void");}
    ; 

body
scope {
    // decls is on body's local variable stack but is visible to
    // any rule that body calls such as stat.  From other rules
    // it is referenced as $body::decls
    // From within rule body, you can use $decls shorthand
    IDictionary decls;
}
@init {
    $body::decls = new Hashtable();
}
    :   lcurly='{' stat* '}'
        {
        // dump declarations for all identifiers seen in statement list
        foreach(DictionaryEntry e in $body::decls) {
            tokens.InsertAfter($lcurly, "\nint "+e.Value+";");
        }
        }
    ;

stat:   ID '=' expr ';' {$body::decls[$ID.Text] = $ID.Text;} // track left-hand-sides
    ;

expr:   mul ('+' mul)* 
    ;

mul :   atom ('*' atom)*
    ;

atom:   ID
    |   INT
    ;

ID  :   ('a'..'z'|'A'..'Z')+ ;

INT :   ('0'..'9')+ ;

WS  :   (' '|'\t'|'\n')+ {$channel=HIDDEN;}
    ;
