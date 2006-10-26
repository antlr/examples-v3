import java.io.*;
import org.antlr.runtime.*;
import org.antlr.stringtemplate.*;
import org.antlr.stringtemplate.language.*;

public class Main {
    public static StringTemplateGroup templates;

    public static void main(String[] args) throws Exception {
	String templateFileName;
	int a = 0;
	if ( args.length<=1 ) {
		templateFileName = "Java.stg";
	}
	else {
		templateFileName = args[a];
		a++;
	}
	templates = new StringTemplateGroup(new FileReader(templateFileName),
					    AngleBracketTemplateLexer.class);

	CharStream input = new ANTLRFileStream(args[a]);
	CMinusLexer lexer = new CMinusLexer(input);
	CommonTokenStream tokens = new CommonTokenStream(lexer);
	CMinusParser parser = new CMinusParser(tokens);
	parser.setTemplateLib(templates);
	RuleReturnScope r = parser.program();
	System.out.println(r.getTemplate().toString());
    }
}
