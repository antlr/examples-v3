#include    <islandctl.h>

void callJavaDoc(pANTLR3_INPUT_STREAM input)
{
            // create a new javadoc lexer/parser duo that feeds
            // off the current input stream
            System.out.println("enter javadoc");
            JavadocLexer j = new JavadocLexer(input);
            CommonTokenStream tokens = new CommonTokenStream(j);
            tokens.discardTokenType(JavadocLexer.WS);
            JavadocParser p = new JavadocParser(tokens);
            p.comment();
}

void callSimple(pANTLR3_INPUT_STREAM input)
{
}