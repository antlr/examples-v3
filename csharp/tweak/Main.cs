namespace Antlr.Examples.Tweak
{
	using System;
	using Path = System.IO.Path;
	using Antlr.Runtime;

	public class TweakMain
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
				TLexer lex = new TLexer(input);
				ITokenStream tokens = new TokenRewriteStream(lex);
				TParser parser = new TParser(tokens);
				parser.program();
				Console.Out.WriteLine(tokens);
			}
			else
				Console.Error.WriteLine("Usage: tweak <input-file>");
		}
	}
}
