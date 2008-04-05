namespace Antlr.Examples.JavaParse
{
	using System;
	using System.Diagnostics;
	using Path			= System.IO.Path;
	using FileInfo		= System.IO.FileInfo;
	using Directory		= System.IO.Directory;

	using Antlr.Runtime;
	using Antlr.Runtime.Tree;
	using Antlr.Runtime.Debug;

	/** Parse a java file or directory of java files using the generated parser
	 *  ANTLR builds from java.g
	 */
	public class JavaParserApp
	{
		public static long lexerTime = 0;
		public static bool profile = false;

		static JavaLexer lexer;

		public static void Main(string[] args) {
			try {
				Stopwatch stopWatch = new Stopwatch();
				stopWatch.Start();
				if (args.Length > 0 ) {
					// for each directory/file specified on the command line
					for (int i = 0; i < args.Length; i++)
					{
						string fullpath;
						if ( Path.IsPathRooted(args[i]) )
						{
							fullpath = args[i];
						}
						else
						{
							fullpath = Path.Combine(Environment.CurrentDirectory, args[i]);
						}
						ProcessFileOrDirectory(new FileInfo(fullpath)); // parse it
					}
				}
				else {
					Console.Error.WriteLine("Usage: JavaParser <directory or file name>");
				}
				stopWatch.Stop();

				Console.Out.WriteLine("finished parsing OK");
				if ( profile ) {
					Console.Out.WriteLine("num decisions " + profiler.NumDecisions);
				}
			}
			catch(Exception e) {
				Console.Error.WriteLine("exception: "+e);
				Console.Error.WriteLine(e.StackTrace);   // so we can get stack trace
			}
		}

	
		// This method decides what action to take based on the type of
		//   file we are looking at
		public static void  ProcessFileOrDirectory(FileInfo f)
		{
			// If this is a directory, walk each file/dir in that directory
			if (Directory.Exists(f.FullName))
			{
				string[] files = Directory.GetFileSystemEntries(f.FullName);
				for (int i = 0; i < files.Length; i++)
				{
					ProcessFileOrDirectory(new FileInfo(Path.Combine(f.FullName, files[i])));
				}
			}
			else if ((f.Name.Length > 5) && f.Name.Substring(f.Name.Length - 5).Equals(".java"))
			{
				Console.Error.Write("   " + f.FullName + "....");
				ParseJavaFile(f.FullName);
			}
		}

		private class CountDecisions : BlankDebugEventListener {
			public int NumDecisions = 0;
			public void EnterDecision(int decisionNumber) {
				NumDecisions++;
			}
		}
		static CountDecisions profiler = new CountDecisions();
	
		// Here's where we do the real work...
		public static void  ParseJavaFile(string f)
		{
			try
			{
				// Create a scanner that reads from the input stream passed to us
				lexer = new JavaLexer(new ANTLRFileStream(f));
				CommonTokenStream tokens = new CommonTokenStream();
				tokens.TokenSource = lexer;
			
				// Create a parser that reads from the scanner
				JavaParser parser = new JavaParser(tokens);
			
				// start parsing at the compilationUnit rule
				parser.compilationUnit();
			}
			catch (Exception e)
			{
				Console.Error.WriteLine("[ERROR}");
				Console.Error.WriteLine("parser exception: " + e);
				Console.Error.WriteLine(e.StackTrace); // so we can get stack trace		
			}
		}
	}
}
