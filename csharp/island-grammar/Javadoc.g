grammar Javadoc;

options {
	language=CSharp2;
}

@namespace		{Antlr.Examples.IslandGrammar}

comment : ( author )* ;

author  : '@author' ID {Console.Out.WriteLine("author "+$ID.Text);} ;

ID      : ('a'..'z'|'A'..'Z')+
        ;

SIMPLE  :   '{'
            {
            Console.Out.WriteLine("enter embedded Simple escape");
            SimpleLexer lex = new SimpleLexer(input);
            CommonTokenStream tokens = new CommonTokenStream(lex);
            //Console.Out.WriteLine("tokens="+tokens);
            Antlr.Examples.IslandGrammar.SimpleParser parser = new Antlr.Examples.IslandGrammar.SimpleParser(tokens);
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
END     : '*/' {state.token = Token.EOF_TOKEN;}
          {Console.Out.WriteLine("exit javadoc");}
        ;

WS      : (' '|'\t'|'\n')+
        ;
