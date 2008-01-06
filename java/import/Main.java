import java.io.*;
import org.antlr.runtime.*;

public class Main {
    public static void main(String[] args) throws Exception {
	CharStream input = new ANTLRFileStream(args[0]);
	SimpleLexer lexer = new SimpleLexer(input);
	CommonTokenStream tokens = new CommonTokenStream(lexer);
/*
	for (Object t : tokens.getTokens()) {
		System.out.println(t);
	}
*/
	SimpleParser parser = new SimpleParser(tokens);
	parser.file();
    }
}
