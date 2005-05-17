import org.antlr.runtime.*;

public class Main {
	public static void main(String[] args) throws Exception {
		CharStream input = new ANTLRFileStream(args[0]);
		TLexer lex = new TLexer(input);
		TokenStream tokens = new TokenRewriteStream(lex);
		//System.out.println("before, tokens="+tokens);
		T parser = new T(tokens);
		parser.program();
		System.out.println(tokens);
	}
}
