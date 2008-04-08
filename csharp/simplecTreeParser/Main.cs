namespace Antlr.Examples.SimpleTreeParser
{
	using System;
	using Path = System.IO.Path;
	using Antlr.Runtime;
	using Antlr.Runtime.Tree;

	public class SimpleCApp 
	{
		public static void Main(string[] args) 
		{
			if (args.Length == 1)
			{
				string fullpath;
				if ( Path.IsPathRooted(args[0]) )
					fullpath = args[0];
				else
					fullpath = Path.Combine(Environment.CurrentDirectory, args[0]);

				Console.Out.WriteLine("Processing file: {0}", fullpath);
				ICharStream input = new ANTLRFileStream(fullpath);
				SimpleCLexer lex = new SimpleCLexer(input);
				CommonTokenStream tokens = new CommonTokenStream(lex);
				SimpleCParser parser = new SimpleCParser(tokens);
				SimpleCParser.program_return r = parser.program();
				Console.Out.WriteLine("tree="+((ITree)r.Tree).ToStringTree());

				if ( parser.NumberOfSyntaxErrors > 0 ) {
					// don't tree parse if has errors
					return;
				}

				CommonTreeNodeStream nodes = new CommonTreeNodeStream((ITree)r.Tree);
				nodes.TokenStream = tokens;
				SimpleCWalker walker = new SimpleCWalker(nodes);
				
				walker.program();
			}
			else
				Console.Error.WriteLine("Usage: SimpleC <input-file>");
		}
	}
}
