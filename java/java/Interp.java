import org.antlr.tool.*;
import org.antlr.runtime.*;
import org.antlr.runtime.tree.*;
import java.io.*;

/** Use java.g to interpret some java code; that is, you don't need
 *  to run org.antlr.Tool on the java.g file to parse java.  This
 *  loads the java.g grammar file in and uses the Grammar object
 *  and the Interpreter to parse input sentences.
 */
public class Interp {
    // pass me a java file to parse
    public static void main(String[] args) throws Exception {
	Grammar parser =
	    new Grammar(null,
			"java.g",
			new BufferedReader(new FileReader("java.g")));

	String lexerGrammarText = parser.getLexerGrammar();
	Grammar lexer = new Grammar();
	lexer.importTokenVocabulary(parser);
	lexer.setGrammarContent(lexerGrammarText);
	CharStream input =
	    new ANTLRFileStream(args[0]);
	Interpreter lexEngine = new Interpreter(lexer, input);
	CommonTokenStream tokens = new CommonTokenStream(lexEngine);
	tokens.setTokenTypeChannel(lexer.getTokenType("WS"), 99);
	tokens.setTokenTypeChannel(lexer.getTokenType("SL_COMMENT"), 99);
	tokens.setTokenTypeChannel(lexer.getTokenType("ML_COMMENT"), 99);
	System.out.println("tokens="+tokens.toString());
	Interpreter parseEngine = new Interpreter(parser, tokens);
	ParseTree t = parseEngine.parse("compilationUnit");
	System.out.println("Parse Tree:");
	System.out.println(t);
    }
}
