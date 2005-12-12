import org.antlr.runtime.*;

public class Main {
	public static void main(String[] args) throws Exception {
		CharStream input = new ANTLRFileStream(args[0]);
		FuzzyJava lex = new FuzzyJava(input);
		TokenStream tokens = new CommonTokenStream(lex);
		tokens.toString();
		//System.out.println(tokens);
	}
}
