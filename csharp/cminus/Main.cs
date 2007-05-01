namespace Antlr.Examples.CMinus
{
	using System;
	using System.IO;
	using Antlr.Runtime;
	using Antlr.StringTemplate;
	using Antlr.StringTemplate.Language;

	public class CMinusMain
	{
		public static StringTemplateGroup templates;

		public static void Main(string[] args)
		{
			// Use a try/catch block for parser exceptions
			try
			{
				string inputFileName;
				string templateFileName;

				if ((args.Length == 1) || (args.Length == 2))
				{
					if (args.Length == 1)
					{
						templateFileName = "Java.stg";
						inputFileName = args[0];
					}
					else
					{
						templateFileName = args[0];
						inputFileName = args[1];
					}

					// Ensure full pathnames
					if (!Path.IsPathRooted(templateFileName))
					{
						//templateFileName = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, templateFileName);
						templateFileName = Path.Combine(Environment.CurrentDirectory, templateFileName);
					}
					if (!Path.IsPathRooted(inputFileName))
					{
						inputFileName = Path.Combine(Environment.CurrentDirectory, inputFileName);
					}

					templates = new StringTemplateGroup(new StreamReader(templateFileName),
										typeof(AngleBracketTemplateLexer));

					ICharStream input = new ANTLRFileStream(inputFileName);
					CMinusLexer lexer = new CMinusLexer(input);
					CommonTokenStream tokens = new CommonTokenStream(lexer);
					CMinusParser parser = new CMinusParser(tokens);
					parser.TemplateLib = templates;
					RuleReturnScope r = parser.program();
					Console.Out.WriteLine(r.Template.ToString());
				}
				else
					Console.Error.WriteLine("Usage: cminus [<output-template-file>] <input-file>");
			}
			catch (System.Exception e)
			{
				Console.Error.WriteLine("exception: " + e);
				Console.Error.WriteLine(e.StackTrace); // so we can get stack trace
			}
		}
	}
}