grammar Simple;

tokens {
	RCURLY='}';
}

@lexer::members {
public static final int JAVADOC_CHANNEL = 1;
public static int nesting = 0;
}

/** This example is meant to illustrate how ANTLR can handle so-called "island
 *  grammars", which are just embedded languages.  I chose a particularly
 *  nasty problem.  A simple programming language with javadoc-style
 *  comments with the usual embedded @author tag but also with embedded
 *  Simple code actions in curlies such as {x=3}.  Now that is a stupid
 *  thing maybe from a language design point of view, but is hard because it's
 *  a language (Simple) embedded within another language (JavaDoc) embedded
 *  within the innermost language (Simple) again.  See the input file.
 *  So the Simple lexer invokes the javadoc lexer which invokes the Simple
 *  lexer again.  The key seems to be returning an EOF token when you
 *  see the "final" token.
 *
 *  This example is made nasty further by using valid characters of Simple
 *  (the curlies) to delimit it inside the Javadoc comments. The problem is
 *  that '}' may be a regular curly inside a Simple statement or it could
 *  be the signal that the embedded action is over.  You must count the
 *  curly nesting level to decide if it's time to stop the embedded action.
 *  consider every "island grammar input chunk" such as javadoc or
 *  embedded Simple statements as a separate "file".  So, when I hit the
 *  last delimiter token that says to bail out, I just return EOF.  Then
 *  there is no need for an explicit stack of input streams.
 *
 *  Finally, this grammar illustrates how to share input streams as all
 *  the grammars pull from the same input stream.
 *
 *  A key point to notice is that since I create a new token stream when
 *  I go off to recognize javadoc comments, the lookahead for the Simple
 *  parser is not messed up in any way.
 */
program : (variable)*
          (method)+
        ;
variable: 'int' ID ('=' expr)? ';'
        ;
method  : 'method' ID '(' ')' {System.out.println("enter method "+$ID.text);}
          block
        ;

block   : '{'
            (variable)*
            (statement)+
          '}'
        ;

statement
        : ID '=' expr ';' {System.out.println("assignment to "+$ID.text);}
        | 'return' expr ';'
        | block
        ;

expr    : ID
        | INT
        ;

ID      : ('a'..'z'|'A'..'Z')+ ;
INT     : ('0'..'9')+ ;
WS      : (' '|'\t'|'\n')+ {$channel=HIDDEN;}
        ;
LCURLY  : '{' {nesting++;}
        ;
/** If we have a '}' with nesting level 0 then it must match the '{'
 *  (unseen by this grammar) that started an embedded Simple statement
 *  block within a javadoc comment.
 */
RCURLY  : '}'
          {
          if ( nesting<=0 ) {
                emit(Token.EOF_TOKEN);
                System.out.println("exiting embedded simple");
          }
          else {
                nesting--;
          }
          }
        ;
JAVADOC : '/**'
          {
            // create a new javadoc lexer/parser duo that feeds
            // off the current input stream
            System.out.println("enter javadoc");
            JavadocLexer j = new JavadocLexer(input);
            CommonTokenStream tokens = new CommonTokenStream(j);
            tokens.discardTokenType(JavadocLexer.WS);
            JavadocParser p = new JavadocParser(tokens);
            p.comment();
            // returns a JAVADOC token to the java parser but on a
            // different channel than the normal token stream so it
            // doesn't get in the way.
            $channel = JAVADOC_CHANNEL;
          }
        ;
