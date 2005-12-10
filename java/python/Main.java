import java.io.*;
import org.antlr.runtime.*;
import org.antlr.stringtemplate.*;
import org.antlr.stringtemplate.language.*;

public class Main {
    public static StringTemplateGroup templates;

    public static void main(String[] args) throws Exception {
	CharStream input = new ANTLRFileStream(args[0]);
	PythonParserLexer lexer = new PythonParserLexer(input);
	PythonTokenSource indentedSource = new PythonTokenSource(lexer);
	CommonTokenStream tokens = new CommonTokenStream(indentedSource);
	PythonParser parser = new PythonParser(tokens);
	parser.file_input();
    }
}
