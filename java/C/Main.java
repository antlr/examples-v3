import java.io.*;
import org.antlr.runtime.*;

public class Main {

    public static void main(String args[]) throws Exception {
        CLexer lex = new CLexer(new ANTLRFileStream(args[0]));
        CommonTokenStream tokens = new CommonTokenStream(lex);
        CParser g = new CParser(tokens);

        try {
            g.translation_unit();
        } catch (RecognitionException e) {
            e.printStackTrace();
        }
    }
}
