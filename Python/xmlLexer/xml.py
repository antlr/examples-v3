import sys
import antlr3
import XMLLexer

stream = antlr3.StringStream(open(sys.argv[1]).read())
lexer = XMLLexer.XMLLexer(stream)

while True:
    token = lexer.nextToken()
    if token.type == antlr3.EOF:
        break
