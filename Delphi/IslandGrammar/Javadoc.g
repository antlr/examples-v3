grammar Javadoc;

options {
	language=Delphi;
}

@lexer::usesImplementation {
SimpleLexer,
SimpleParser,
}
@namespace		{Antlr.Examples.IslandGrammar}

comment : ( author )* ;

author  : '@author' ID {WriteLn('author ' + $ID.Text);} ;

ID      : ('a'..'z'|'A'..'Z')+
        ;

SIMPLE
@vars {
Lex: ITokenSource;
Tokens: ICommonTokenStream;
Parser: ISimpleParser;
}  :   '{'
            {
            WriteLn('enter embedded Simple escape');
            Lex := TSimpleLexer.Create(Input);
            Tokens := TCommonTokenStream.Create(Lex);
            //Console.Out.WriteLine("tokens="+tokens);
            Parser := TSimpleParser.Create(Tokens);
            Parser.statement();
            }
            {$channel:=HIDDEN;}
        ;

/** When the javadoc parser sees end-of-comment it just says 'I'm done', which
 *  consumes the tokens and forces this javadoc parser (feeding
 *  off the input stream currently) to exit.  It returns from
 *  method comment(), which was called from JAVADOC action in the
 *  Simple parser's lexer.
 */
STOP     : '*/' {State.Token := TToken.EOF_TOKEN;}
          {WriteLn('exit javadoc');}
        ;

WS      : (' '|'\t'|'\n')+
        ;
