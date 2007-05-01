namespace Antlr.Examples.IslandGrammar
{
	using System;
	using Path = System.IO.Path;
	using Antlr.Runtime;

	public class IslandGrammarMain
	{
		public static void Main(string[] args)
		{
			if (args.Length > 0)
			{

				ICharStream input = new ANTLRFileStream(args[0]);
				SimpleLexer lex = new SimpleLexer(input);
				CommonTokenStream tokens = new CommonTokenStream(lex);
				SimpleParser parser = new SimpleParser(tokens);
				parser.program();
			}
			else
				Console.Error.WriteLine("Usage: island <input-file>");
		}
	}
}
