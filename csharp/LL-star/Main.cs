namespace Antlr.Examples.LLStar
{
	using System;
	using System.IO;
	using Antlr.Runtime;
	
	public class LLStarApp
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
				//System.out.println("tokens="+tokens);
				SimpleCParser parser = new SimpleCParser(tokens);
				parser.program();
				Console.Out.WriteLine("Finished processing file: {0}", fullpath);
			}
			else
				Console.Error.WriteLine("Usage: llstar <input-filename>");
		}
	}
}