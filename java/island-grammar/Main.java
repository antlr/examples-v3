import org.antlr.runtime.*;

public class Main {
	public static void main(String[] args) throws Exception {
		CharStream input = new ANTLRFileStream(args[0]);
		SimpleLexer lex = new SimpleLexer(input);
		CommonTokenStream tokens = new CommonTokenStream(lex);
		//System.out.println("tokens="+tokens);
		SimpleParser parser = new SimpleParser(tokens);
		parser.program();
	}
}
