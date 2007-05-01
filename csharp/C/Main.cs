namespace Antlr.Examples.C
{
	using System;
	using Path = System.IO.Path;
	using Antlr.Runtime;

	public class CMain
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
				CLexer lex = new CLexer(input);
				CommonTokenStream tokens = new CommonTokenStream(lex);
				CParser parser = new CParser(tokens);
				
				try {
					parser.translation_unit();
				} 
				catch(RecognitionException re) {
					Console.Out.WriteLine(re.StackTrace);
				}
			}
			else
				Console.Error.WriteLine("Usage: cparse <input-file>");
		}
	}
}
