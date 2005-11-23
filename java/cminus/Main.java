import java.io.*;
import org.antlr.runtime.*;
import org.antlr.stringtemplate.*;
import org.antlr.stringtemplate.language.*;

public class Main {
    public static StringTemplateGroup templates;

    public static void main(String[] args) throws Exception {
	String templateFileName = args[0];
	templates = new StringTemplateGroup(new FileReader(templateFileName),
					    AngleBracketTemplateLexer.class);

	CharStream input = new ANTLRFileStream(args[1]);
	CMinusParserLexer lexer = new CMinusParserLexer(input);
	CommonTokenStream tokens = new CommonTokenStream(lexer);
	CMinusParser parser = new CMinusParser(tokens);
	parser.setTemplateLib(templates);
	RuleReturnScope r = parser.program();
	System.out.println(r.getTemplate().toString());
    }
}
