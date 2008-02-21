#include    <simple.h>

void callSimple(pANTLR3_INPUT_STREAM input)
{
    	pANTLR3_COMMON_TOKEN_STREAM tstream;
	pSimpleLexer		    lex;
	pSimpleParser		    parser;

	printf("enter embedded Simple escape\n");

	lex	    = SimpleLexerNew(input);
	tstream	    = antlr3CommonTokenStreamSourceNew(ANTLR3_SIZE_HINT, TOKENSOURCE(lex));
        parser	    = SimpleParserNew(tstream);

        parser->statement(parser);

	parser	->free(parser);
	tstream	->free(tstream);
	lex	->free(lex);
}
