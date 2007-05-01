namespace Antlr.Examples.Python
{
	using System;
	using Path = System.IO.Path;
	using Antlr.Runtime;


	// override nextToken to set startPos (this seems too hard)
	public class MyLexer : PythonLexer
	{
		public MyLexer(ICharStream lexer)
			: base(lexer)
		{
		}
		override public IToken NextToken()
		{
			startPos = CharPositionInLine;
			return base.NextToken();
		}
	}

	public class PythonMain
	{
		public static void Main(string[] args)
		{
			if (args.Length > 0)
			{

				ICharStream input = new ANTLRFileStream(args[0]);
				PythonLexer lexer = new MyLexer(input);
				CommonTokenStream tokens = new CommonTokenStream(lexer);
				tokens.DiscardOffChannelTokens(true);
				PythonTokenSource indentedSource = new PythonTokenSource(tokens);
				tokens = new CommonTokenStream(indentedSource);
				//Console.Out.WriteLine("tokens="+tokens.GetTokens());
				PythonParser parser = new PythonParser(tokens);
				parser.file_input();
			}
			else
				Console.Error.WriteLine("Usage: dynscope <input-file>");
		}
	}
}