namespace Antlr.Examples.Scopes
{
	using System;
	using Path = System.IO.Path;
	using Antlr.Runtime;

	public class ScopesMain
	{
		public static void Main(string[] args)
		{
			if (args.Length > 0)
			{
				string inputFileName = args[0];
				if (!Path.IsPathRooted(inputFileName))
				{
					inputFileName = Path.Combine(Environment.CurrentDirectory, inputFileName);
				}
				ICharStream input = new ANTLRFileStream(inputFileName);
				SymtabTestLexer lex = new SymtabTestLexer(input);
				CommonTokenStream tokens = new CommonTokenStream(lex);
				SymtabTestParser parser = new SymtabTestParser(tokens);
				parser.prog();
			}
			else
				Console.Error.WriteLine("Usage: scopes <input-file>");
		}
	}
}
