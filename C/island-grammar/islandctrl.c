#include    <islandctl.h>

void callJavadoc(pANTLR3_INPUT_STREAM input)
{
        pANTLR3_COMMON_TOKEN_STREAM tstream;
	pJavadocLexer		    lex;
	pJavadocParser		    parser;

	printf("enter Javadoc\n");

	lex	    = JavaDocLexerNew(INPUT);
	tstream	    = antlr3CommonTokenStreamSourceNew(ANTLR3_SIZE_HINT, lex->pLexer->tokSource);
        parser	    = JavaDocParserNew(tokens);

        parser->comment(parser);

	parser	->free(parser);
	tstream	->free(tstream);
	lex	->free(lex);
}

void callSimple(pANTLR3_INPUT_STREAM input)
{
    	pANTLR3_COMMON_TOKEN_STREAM tstream;
	pSimpleLexer		    lex;
	pSimpleParser		    parser;

	printf("enter embedded Simple escape\n");

	lex	    = SimpleLexerNew(INPUT);
	tstream	    = antlr3CommonTokenStreamSourceNew(ANTLR3_SIZE_HINT, lex->pLexer->tokSource);
        parser	    = SimpleParserNew(tokens);

        parser->statement(parser);

	parser	->free(parser);
	tstream	->free(tstream);
	lex	->free(lex);
}
