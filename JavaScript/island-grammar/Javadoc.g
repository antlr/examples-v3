grammar Javadoc;
options {language=JavaScript;}

comment : ( author )* ;

author  : '@author' ID {print("author "+$ID.text);} ;

ID      : ('a'..'z'|'A'..'Z')+
        ;

SIMPLE  :   '{'
            {
            print("enter embedded Simple escape");
            var lexer = new SimpleLexer(this.input);
            var tokens = new org.antlr.runtime.CommonTokenStream(lexer);
            //print("tokens="+tokens);
            var parser = new SimpleParser(tokens);

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
END     : '*/' {this.emit(org.antlr.runtime.Token.EOF_TOKEN);}
          {print("exit javadoc");}
        ;

WS      : (' '|'\t'|'\n')+
        ;
