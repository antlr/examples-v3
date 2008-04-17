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
	language=ActionScript;
}

@members {
private var tokens:TokenRewriteStream; // avoid typecasts all over
}

program
@init {
    tokens = TokenRewriteStream(input); 
    var start:Token = input.LT(1);
}
    :   method+
        {
        tokens.insertBeforeToken(start,"public class Wrapper {\n");
        // note the reference to the last token matched for method:
        tokens.insertAfterToken($method.stop, "\n}\n");
        }
    ;

method
    :   m='method' ID '(' ')' body
        {tokens.replaceToken($m, "public void");}
    ; 

body
scope {
    // decls is on body's local variable stack but is visible to
    // any rule that body calls such as stat.  From other rules
    // it is referenced as $body::decls
    // From within rule body, you can use $decls shorthand
    Object decls;
}
@init {
    $body::decls = new Object();
}
    :   lcurly='{' stat* '}'
        {
        // dump declarations for all identifiers seen in statement list
	var decls:Object = $body::decls;
	for (var text:String in decls) {
		tokens.insertAfterToken($lcurly, "\nint " + text + ";");
	}
        }
    ;

stat:   ID '=' expr ';' { var decls:Object = $body::decls;
			  var text:String = $ID.text;
			  if (decls != null && text != null) {
				decls[text] = true;
			  }
			} // track left-hand-sides
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

WS  :   (' '|'\t'|'\n'|'\r')+ {$channel=HIDDEN;}
    ;
