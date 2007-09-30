import sys
import antlr3
from TLexer import TLexer
from TParser import TParser

cStream = antlr3.FileStream(sys.argv[1])
lexer = TLexer(cStream)
tStream = antlr3.TokenRewriteStream(lexer)
parser = TParser(tStream)
parser.program()
print tStream
