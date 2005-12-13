import java.io.*;
import org.antlr.runtime.*;
import org.antlr.stringtemplate.*;
import org.antlr.stringtemplate.language.*;

public class Main {
    public static StringTemplateGroup templates;

    public static void main(String[] args) throws Exception {
	CharStream input = new ANTLRFileStream(args[0]);
	PythonParserLexer lexer = new PythonParserLexer(input);
	CommonTokenStream tokens = new CommonTokenStream(lexer);
	tokens.discardOffChannelTokens(true);
	PythonTokenSource indentedSource = new PythonTokenSource(tokens);
	tokens = new CommonTokenStream(indentedSource);
	System.out.println("tokens="+tokens);
	PythonParser parser = new PythonParser(tokens);
	parser.file_input();
    }
}
