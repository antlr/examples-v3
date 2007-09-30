import sys
import antlr3
from TLexer import TLexer
from TParser import TParser

cStream = antlr3.StringStream(open(sys.argv[1]).read())
lexer = TLexer(cStream)
tStream = antlr3.CommonTokenStream(lexer)
parser = TParser(tStream)
parser.stat()
