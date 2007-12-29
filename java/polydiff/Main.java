import org.antlr.runtime.*;
import org.antlr.runtime.tree.*;

public class Main {
	public static void main(String[] args) throws Exception {
		CharStream input = new ANTLRFileStream(args[0]);
		PolyLexer lex = new PolyLexer(input);
		CommonTokenStream tokens = new CommonTokenStream(lex);
		PolyParser parser = new PolyParser(tokens);
		PolyParser.poly_return r = parser.poly();
		System.out.println("tree="+((Tree)r.tree).toStringTree());

       	CommonTreeNodeStream nodes = new CommonTreeNodeStream((Tree)r.tree);
		nodes.setTokenStream(tokens);
		Differentiator differ = new Differentiator(nodes);
		Differentiator.poly_return rt = differ.poly();
		System.out.println("rewritten tree="+((Tree)rt.tree).toStringTree());

       	nodes = new CommonTreeNodeStream((Tree)rt.tree);
		nodes.setTokenStream(tokens);
		Simplifier reducer = new Simplifier(nodes);
		Simplifier.poly_return rn = reducer.poly();
		System.out.println("rewritten tree="+((Tree)rn.tree).toStringTree());
	}
}
