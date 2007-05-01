namespace Antlr.Examples.RubyParse
{
	using System;
	using Path = System.IO.Path;
	using Antlr.Runtime;

	public class RubyMain
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
				RubyLexer lexer = new RubyLexer(input);
				CommonTokenStream tokens = new CommonTokenStream(lexer);
				RubyParser parser = new RubyParser(tokens);
				parser.program();
			}
			else
				Console.Error.WriteLine("Usage: ruby <input-file>");
		}
	}
}
