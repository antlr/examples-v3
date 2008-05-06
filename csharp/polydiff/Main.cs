namespace Antlr.Examples.PolyDiff
{
    using System;
    using Runtime;
    using Runtime.Tree;

    public class PolyDiffApp
	{
		public static void Main(string[] args)
		{
		ICharStream input;
		if ( args.Length>0 ) {
			input = new ANTLRFileStream(args[0]);
		}
		else {
			input = new ANTLRReaderStream(Console.In);
		}

		// BUILD AST
		PolyLexer lex = new PolyLexer(input);
		CommonTokenStream tokens = new CommonTokenStream(lex);
		PolyParser parser = new PolyParser(tokens);
		PolyParser.poly_return r = parser.poly();
		Console.Out.WriteLine("tree="+((ITree)r.Tree).ToStringTree());

		// DIFFERENTIATE
       	CommonTreeNodeStream nodes = new CommonTreeNodeStream(r.Tree);
		nodes.TokenStream = tokens;
		PolyDifferentiator differ = new PolyDifferentiator(nodes);
		PolyDifferentiator.poly_return r2 = differ.poly();
		Console.Out.WriteLine("d/dx="+((ITree) r2.Tree).ToStringTree());

		// SIMPLIFY / NORMALIZE
       	nodes = new CommonTreeNodeStream(r2.Tree);
        nodes.TokenStream = tokens;
        Simplifier reducer = new Simplifier(nodes);
		Simplifier.poly_return r3 = reducer.poly();
		Console.Out.WriteLine("simplified="+((ITree) r3.Tree).ToStringTree());

		// CONVERT BACK TO POLYNOMIAL
       	nodes = new CommonTreeNodeStream(r3.Tree);
        nodes.TokenStream = tokens;
        PolyPrinter printer = new PolyPrinter(nodes);
		PolyPrinter.poly_return r4 = printer.poly();
		Console.Out.WriteLine(r4.ST);
	}	}
}
