import java.io.*;
import org.antlr.runtime.*;

/** XML parser by Oliver Zeigermann October 10, 2005 */
public class Main {
    public static void main(String[] args) {
	try {
	    CharStream input = new ANTLRFileStream(args[0]);
	    XMLLexer lexer = new XMLLexer(input);
	    while (lexer.nextToken() != Token.EOF_TOKEN);
	} catch(Throwable t) {
	    System.out.println("exception: "+t);
	    t.printStackTrace();
	}
    }
}
