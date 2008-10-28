// Convert the simple input to be java code; wrap in a class,
// convert method with "public void", add decls.  This shows how to insert
// extra text into a stream of tokens and how to replace a token
// with some text.  Calling toString() on the TokenRewriteStream
// in Main will print out the original input stream.
//
// Note that you can do the instructions in any order as the
// rewrite instructions just get queued up and executed upon toString().
grammar Tweak;

options {
	language=Delphi;
}

@usesInterface {
Generics.Collections,
}

@memberDeclarations {
Tokens: ITokenRewriteStream; // avoid typecasts all over
}

prog
@vars {
Start: IToken;
}
@init {
    Tokens := Input as ITokenRewriteStream; 
    Start := Input.LT(1);
}
    :   method+
        {
        Tokens.InsertBefore(Start, 'public class Wrapper {'#13#10);
        // note the reference to the last token matched for method:
        Tokens.InsertAfter($method.stop, #13#10'}'#13#10);
        }
    ;

method
    :   m='method' ID '(' ')' body
        {Tokens.Replace($m, 'public void');}
    ; 

body
scope {
    IDictionary<string, string> decls;
    // decls is on body's local variable stack but is visible to
    // any rule that body calls such as stat.  From other rules
    // it is referenced as $body::decls
    // From within rule body, you can use $decls shorthand 
}
@vars {
E: TPair<string, string>;
}
@init {
    $body::decls = TDictionary<string, string>.Create;
}
    :   lcurly='{' stat* '}'
        {
        for E in $body::decls do 
          Tokens.InsertAfter($lcurly, #13#10'int '+e.Value+';');
        }
    ;

stat:   ID '=' expr ';' {$body::decls.AddOrSetValue($ID.Text, $ID.Text);} // track left-hand-sides
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

WS  :   (' '|'\t'|'\n')+ {$channel:=HIDDEN;}
    ;
