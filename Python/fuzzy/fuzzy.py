import sys
import antlr3
from FuzzyJavaLexer import FuzzyJavaLexer

stream = antlr3.StringStream(open(sys.argv[1]).read())
lexer = FuzzyJavaLexer(stream)

while True:
    token = lexer.nextToken()
    if token.type == antlr3.EOF:
        break
