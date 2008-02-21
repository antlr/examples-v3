#include    <javadoc.h>

void callJavadoc(pANTLR3_INPUT_STREAM input)
{
        pANTLR3_COMMON_TOKEN_STREAM tstream;
	pJavadocLexer		    lex;
	pJavadocParser		    parser;

	printf("enter Javadoc\n");

	lex	    = JavadocLexerNew(input);
	tstream	    = antlr3CommonTokenStreamSourceNew(ANTLR3_SIZE_HINT, TOKENSOURCE(lex));
        parser	    = JavadocParserNew(tstream);

        parser->comment(parser);

	parser	->free(parser);
	tstream	->free(tstream);
	lex	->free(lex);
}

