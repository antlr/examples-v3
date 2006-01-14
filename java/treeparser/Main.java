import org.antlr.runtime.*;
import org.antlr.runtime.tree.*;

public class Main {
	public static void main(String[] args) throws Exception {
		CharStream input = new ANTLRFileStream(args[0]);
		LangParserLexer lex = new LangParserLexer(input);
		CommonTokenStream tokens = new CommonTokenStream(lex);
		LangParser parser = new LangParser(tokens);
		//LangParser.decl_return r = parser.decl();
		LangParser.start_return r = parser.start();
		System.out.println("tree: "+((Tree)r.tree).toStringTree());
		CommonTree root_0 = ((CommonTree)r.tree);

		CommonTreeNodeStream nodes = new CommonTreeNodeStream((Tree)r.tree);
		LangTreeParser walker = new LangTreeParser(nodes);
		walker.decl();
	}
}
