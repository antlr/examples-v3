grammar Javadoc;

options {
	language=ActionScript;
}

comment : ( author )* ;

author  : '@author' ID {trace("author "+$ID.text);} ;

ID      : ('a'..'z'|'A'..'Z')+
        ;

SIMPLE  :   '{'
            {
            trace("enter embedded Simple escape");
            var lex:SimpleLexer = new SimpleLexer(input);
            var tokens:CommonTokenStream = new CommonTokenStream(lex);
            var parser:SimpleParser = new SimpleParser(tokens);
            parser.statement();
            }
            {$channel=HIDDEN;}
        ;

/** When the javadoc parser sees end-of-comment it just says 'I'm done', which
 *  consumes the tokens and forces this javadoc parser (feeding
 *  off the input stream currently) to exit.  It returns from
 *  method comment(), which was called from JAVADOC action in the
 *  Simple parser's lexer.
 */
END     : '*/' {emitToken(TokenConstants.EOF_TOKEN);}
          {trace("exit javadoc");}
        ;

WS      : (' '|'\t'|'\n'|'\r')+
        ;
