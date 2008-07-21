import java.io.*;
import org.antlr.runtime.*;
import org.antlr.runtime.tree.*;
import org.antlr.runtime.debug.*;

/** Build either ASTs and, optionally, parse trees.  To also build
 *  parse trees, run antlr with -debug option on ANTLRv3.g
 *  and then uncomment the middle code section and comment out the
 *  first "build AST" only section.
 */
public class Main {
    public static void main(String args[]) throws Exception {
        CharStream input = null;
        String inputName = "<stdin>";
        if ( args.length==1 ) {
            input = new ANTLRFileStream(args[0]);
            inputName = args[0];
        }
        else {
            input = new ANTLRInputStream(System.in);
        }

        // BUILD AST
        ANTLRv3Lexer lex = new ANTLRv3Lexer(input);
        CommonTokenStream tokens = new CommonTokenStream(lex);
        ANTLRv3Parser g = new ANTLRv3Parser(tokens);
        ANTLRv3Parser.grammarDef_return r = g.grammarDef();
        CommonTree t = (CommonTree)r.getTree();
        System.out.println(t.toStringTree());

/*
        // BUILD AST + PARSE TREES (needs ANTLR -debug option)
        ANTLRv3Lexer lex = new ANTLRv3Lexer(input);
        CommonTokenStream tokens = new CommonTokenStream(lex);
        ParseTreeBuilder builder = new ParseTreeBuilder(inputName);
        ANTLRv3Parser g = new ANTLRv3Parser(tokens, builder);
        ANTLRv3Parser.grammarDef_return r = g.grammarDef();
        CommonTree t = (CommonTree)r.getTree(); // not used here
        System.out.println("parse tree: "+builder.getTree().toStringTree());
        System.out.print("input:\n"+builder.getTree().toInputString());
*/

        // WALK AST
        CommonTreeNodeStream nodes = new CommonTreeNodeStream(t);
        ANTLRv3Tree walker = new ANTLRv3Tree(nodes);
        walker.grammarDef();
    }
}
