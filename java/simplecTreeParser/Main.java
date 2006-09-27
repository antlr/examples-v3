import org.antlr.runtime.*;
import org.antlr.runtime.tree.*;

public class Main {
	public static void main(String[] args) throws Exception {
		CharStream input = new ANTLRFileStream(args[0]);
		SimpleCLexer lex = new SimpleCLexer(input);
		CommonTokenStream tokens = new CommonTokenStream(lex);
		SimpleCParser parser = new SimpleCParser(tokens);
		SimpleCParser.program_return r = parser.program();
		System.out.println("tree="+((Tree)r.tree).toStringTree());
        CommonTreeNodeStream nodes = new CommonTreeNodeStream((Tree)r.tree);
		SimpleCWalkerTreeParser walker = new SimpleCWalkerTreeParser(nodes);
		walker.program();
	}
}
