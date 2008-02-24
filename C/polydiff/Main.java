import org.antlr.runtime.*;
import org.antlr.runtime.tree.*;

public class Main {
	public static void main(String[] args) throws Exception {
		CharStream input = null;
		if ( args.length>0 ) {
			input = new ANTLRFileStream(args[0]);
		}
		else {
			input = new ANTLRInputStream(System.in);
		}

		// BUILD AST
		PolyLexer lex = new PolyLexer(input);
		CommonTokenStream tokens = new CommonTokenStream(lex);
		PolyParser parser = new PolyParser(tokens);
		PolyParser.poly_return r = parser.poly();
		System.out.println("tree="+((Tree)r.tree).toStringTree());

		// DIFFERENTIATE
       	CommonTreeNodeStream nodes = new CommonTreeNodeStream((Tree)r.tree);
		nodes.setTokenStream(tokens);
		PolyDifferentiator differ = new PolyDifferentiator(nodes);
		PolyDifferentiator.poly_return r2 = differ.poly();
		System.out.println("d/dx="+((Tree)r2.tree).toStringTree());

		// SIMPLIFY / NORMALIZE
       	nodes = new CommonTreeNodeStream((Tree)r2.tree);
		nodes.setTokenStream(tokens);
		Simplifier reducer = new Simplifier(nodes);
		Simplifier.poly_return r3 = reducer.poly();
		System.out.println("simplified="+((Tree)r3.tree).toStringTree());

		// CONVERT BACK TO POLYNOMIAL
       	nodes = new CommonTreeNodeStream((Tree)r3.tree);
		nodes.setTokenStream(tokens);
		PolyPrinter printer = new PolyPrinter(nodes);
		PolyPrinter.poly_return r4 = printer.poly();
		System.out.println(r4.st.toString());
	}
}
