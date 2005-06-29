import org.antlr.runtime.*;
import org.antlr.runtime.tree.*;

public class Main {
	public static void main(String[] args) throws Exception {
		CharStream input = new ANTLRFileStream(args[0]);
		SimpleCLexer lex = new SimpleCLexer(input);
		CommonTokenStream tokens = new CommonTokenStream(lex);
		SimpleC parser = new SimpleC(tokens);
		SimpleC.program_return r = parser.program();
		System.out.println("tree="+((Tree)r.tree).toStringTree());
        CommonTreeNodeStream nodes = new CommonTreeNodeStream((Tree)r.tree);
		SimpleCTreeParser walker = new SimpleCTreeParser(nodes);
		walker.program();
	}
}
