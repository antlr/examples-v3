namespace Antlr.Examples.DynamicScope
{
	using System;
	using Path = System.IO.Path;
	using Antlr.Runtime;

	public class DynamicScopeMain
	{
		public static void Main(string[] args)
		{
			if (args.Length == 1)
			{
				string inputFileName = args[0];
				if (!Path.IsPathRooted(inputFileName))
				{
					inputFileName = Path.Combine(Environment.CurrentDirectory, inputFileName);
				}

				ICharStream input = new ANTLRFileStream(inputFileName);
				TLexer lex = new TLexer(input);
				CommonTokenStream tokens = new CommonTokenStream(lex);
				//System.out.println("tokens="+tokens);
				TParser parser = new TParser(tokens);
				parser.program();
			}
			else
				Console.Error.WriteLine("Usage: dynscope <input-file>");
		}
	}
}