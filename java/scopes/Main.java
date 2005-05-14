import org.antlr.runtime.*;

public class Main {
	public static void main(String[] args) throws Exception {
		CharStream input = new ANTLRFileStream(args[0]);
		SymtabTestParserLexer lex = new SymtabTestParserLexer(input);
		CommonTokenStream tokens = new CommonTokenStream(lex);
		//System.out.println("tokens="+tokens);
		SymtabTestParser parser = new SymtabTestParser(tokens);
		parser.prog();
	}
}
