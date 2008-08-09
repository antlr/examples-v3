namespace Antlr.Examples.ANTLR
{
	using System;
	using Path = System.IO.Path;
	using Antlr.Runtime;
	using Antlr.Runtime.Tree;
	using Antlr.Runtime.Debug;

	/// <summary>
	/// Build either ASTs and, optionally, parse trees.  To also build
	/// parse trees, run antlr with -debug option on ANTLRv3.g
	/// and then uncomment the middle code section and comment out the
	/// first "build AST" only section.
	/// </summary>
	public class AntlrMain
	{
		public static void Main(string[] args)
		{
			if (args.Length > 1) {
				string inputFileName = args[0];
				if (!Path.IsPathRooted(inputFileName))
				{
					inputFileName = Path.Combine(Environment.CurrentDirectory, inputFileName);
				}
				ICharStream input = new ANTLRFileStream(inputFileName);
	
			        // BUILD AST
				ANTLRv3Lexer lex = new ANTLRv3Lexer(input);
				CommonTokenStream tokens = new CommonTokenStream(lex);
				ANTLRv3Parser g = new ANTLRv3Parser(tokens);
				ANTLRv3Parser.grammarDef_return r = g.grammarDef();
				CommonTree t = (CommonTree)r.Tree;
				System.Console.Out.WriteLine(t.ToStringTree());

				/*
				// BUILD AST + PARSE TREES (needs ANTLR -debug option)
				ANTLRv3Lexer lex = new ANTLRv3Lexer(input);
				CommonTokenStream tokens = new CommonTokenStream(lex);
				ParseTreeBuilder builder = new ParseTreeBuilder(inputName);
				ANTLRv3Parser g = new ANTLRv3Parser(tokens, builder);
				ANTLRv3Parser.grammarDef_return r = g.grammarDef();
				CommonTree t = (CommonTree)r.Tree; // not used here
				System.Console.Out.WriteLine("parse tree: "+builder.Tree.ToStringTree());
				System.Console.Out.Write("input:\n"+builder.Tree.ToInputString());
				*/
			
				// WALK AST
				CommonTreeNodeStream nodes = new CommonTreeNodeStream(t);
				ANTLRv3Tree walker = new ANTLRv3Tree(nodes);
				walker.grammarDef();
			}
			else
				Console.Error.WriteLine("Usage: ANTLRv3 <input-file>");
		}
	}
}

	