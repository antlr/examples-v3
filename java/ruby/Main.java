import java.io.*;
import org.antlr.runtime.*;
import org.antlr.stringtemplate.*;
import org.antlr.stringtemplate.language.*;

public class Main {
    public static void main(String[] args) throws Exception {
	CharStream input = new ANTLRFileStream(args[0]);
	RubyLexer lexer = new RubyLexer(input);
	CommonTokenStream tokens = new CommonTokenStream(lexer);
	Ruby parser = new Ruby(tokens);
	parser.program();
    }
}
