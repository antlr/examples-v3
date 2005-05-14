import org.antlr.runtime.*;

public class Test {
	public static void main(String[] args) throws Exception {
		CharStream input = new ANTLRFileStream(args[0]);
		SimpleLexer lex = new SimpleLexer(input);
		CommonTokenStream tokens = new CommonTokenStream(lex);
		//System.out.println("tokens="+tokens);
		Simple parser = new Simple(tokens);
		parser.program();
	}
}
