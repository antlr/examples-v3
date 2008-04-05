namespace Antlr.Examples.Fuzzy
{
	using System;
	using Path = System.IO.Path;
	using Antlr.Runtime;

	public class FuzzyMain
	{
		public static void Main(string[] args)
		{
			if (args.Length > 0 )
			{

				for (int i = 0; i < args.Length; i++)
				{
					string inputFileName = args[i];
					if (!Path.IsPathRooted(inputFileName))
					{
						inputFileName = Path.Combine(Environment.CurrentDirectory, inputFileName);
					}

					ICharStream input = new ANTLRFileStream(inputFileName);
					FuzzyJava lex = new FuzzyJava(input);
					ITokenStream tokens = new CommonTokenStream(lex);
					tokens.ToString();
					//System.out.println(tokens);
				}
			}
			else
				Console.Error.WriteLine("Usage: fuzzy <input-file-list>");
		}
	}
}