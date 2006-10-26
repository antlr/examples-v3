import org.antlr.runtime.*;

public class Main {
	public static void main(String[] args) throws Exception {
		CharStream input = new ANTLRFileStream(args[0]);
		SimpleCLexer lex = new SimpleCLexer(input);
		CommonTokenStream tokens = new CommonTokenStream(lex);
		//System.out.println("tokens="+tokens);
		SimpleCParser parser = new SimpleCParser(tokens);
		parser.program();
	}
}
