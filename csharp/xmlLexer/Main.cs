namespace Antlr.Examples.XmlLexer
{
	using System;
	using Path = System.IO.Path;
	using Antlr.Runtime;

	/** XML parser by Oliver Zeigermann October 10, 2005 */
	public class XmlLexerMain
	{
		public static void Main(string[] args)
		{
			if (args.Length > 0)
			{
				try
				{
					string inputFileName = args[0];
					if (!Path.IsPathRooted(inputFileName))
					{
						inputFileName = Path.Combine(Environment.CurrentDirectory, inputFileName);
					}
					ICharStream input = new ANTLRFileStream(inputFileName);
					XML lexer = new XML(input);
					while (lexer.NextToken() != Token.EOF_TOKEN) ;
				}
				catch (Exception ex)
				{
					Console.Out.WriteLine("exception: " + ex);
					Console.Out.WriteLine(ex.StackTrace);
				}
			}
			else
				Console.Error.WriteLine("Usage: xmlLexer <input-file>");
		}
	}
}
