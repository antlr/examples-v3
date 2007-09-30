grammar Javadoc;

options {
    language=Python;
}

comment : ( author )* ;

author  : '@author' ID {print "author "+$ID.text} ;

ID      : ('a'..'z'|'A'..'Z')+
        ;

SIMPLE  :   '{'
            {
print "enter embedded Simple escape"
import SimpleLexer
import SimpleParser
lex = SimpleLexer.SimpleLexer(self.input)
tokens = antlr3.CommonTokenStream(lex)
parser = SimpleParser.SimpleParser(tokens)
parser.statement()
            }
            {$channel=HIDDEN}
        ;

/** When the javadoc parser sees end-of-comment it just says 'I'm done', which
 *  consumes the tokens and forces this javadoc parser (feeding
 *  off the input stream currently) to exit.  It returns from
 *  method comment(), which was called from JAVADOC action in the
 *  Simple parser's lexer.
 */
END     : '*/' {self.token = antlr3.EOF_TOKEN}
          {print "exit javadoc"}
        ;

WS      : (' '|'\t'|'\n')+
        ;
