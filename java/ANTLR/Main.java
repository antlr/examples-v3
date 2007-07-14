import java.io.*;
import org.antlr.runtime.*;
import org.antlr.runtime.tree.*;

public class Main {
    public static void main(String args[]) throws Exception {
	CharStream input = null;
	if ( args.length==1 ) {
	    input = new ANTLRFileStream(args[0]);
	}
	else {
	    input = new ANTLRInputStream(System.in);
	}
        ANTLRv3Lexer lex = new ANTLRv3Lexer(input);
        CommonTokenStream tokens = new CommonTokenStream(lex);
        ANTLRv3Parser g = new ANTLRv3Parser(tokens);
        ANTLRv3Parser.grammarDef_return r = g.grammarDef();
	CommonTree t = (CommonTree)r.getTree();
	System.out.println(t.toStringTree());

	CommonTreeNodeStream nodes = new CommonTreeNodeStream(t);
	ANTLRv3Tree walker = new ANTLRv3Tree(nodes);
	walker.grammarDef();
    }
}
