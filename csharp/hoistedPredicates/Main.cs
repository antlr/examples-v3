namespace Antlr.Examples.HoistedPredicates
{
	using System;
	using Path = System.IO.Path;
	using Antlr.Runtime;

	public class HoistedPredicatesMain
	{
		public static void Main(string[] args)
		{
			if (args.Length == 1)
			{

				ICharStream input = new ANTLRFileStream(args[0]);
				TLexer lex = new TLexer(input);
				CommonTokenStream tokens = new CommonTokenStream(lex);
				//System.out.println("tokens="+tokens);
				TParser parser = new TParser(tokens);
				parser.stat();
			}
			else
				Console.Error.WriteLine("Usage: hoisted <input-file>");
		}
	}
}
