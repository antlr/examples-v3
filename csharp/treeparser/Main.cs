namespace Antlr.Examples.SimpleTreeParser
{
	using System;
	using Path = System.IO.Path;
	using Antlr.Runtime;
	using Antlr.Runtime.Tree;

	public class TreeParserApp 
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
				LangLexer lex = new LangLexer(input);
				CommonTokenStream tokens = new CommonTokenStream(lex);
				LangParser parser = new LangParser(tokens);

				//LangParser.decl_return r = parser.decl();
				LangParser.start_return r = parser.start();
				Console.Out.WriteLine("tree: "+((ITree)r.Tree).ToStringTree());
				CommonTree r0 = ((CommonTree)r.Tree);
				CommonTreeNodeStream nodes = new CommonTreeNodeStream(r0);
				nodes.TokenStream = tokens;
				LangDumpDecl walker = new LangDumpDecl(nodes);
				walker.decl();
			}
			else
				Console.Error.WriteLine("Usage: TreeParser <input-file>");
		}
	}
}
