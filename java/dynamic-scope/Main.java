import org.antlr.runtime.*;

public class Main {
	public static void main(String[] args) throws Exception {
		CharStream input = new ANTLRFileStream(args[0]);
		TLexer lex = new TLexer(input);
		CommonTokenStream tokens = new CommonTokenStream(lex);
		//System.out.println("tokens="+tokens);
		TParser parser = new TParser(tokens);
		parser.program();
	}
}
