import sys
import antlr3
from SimpleCLexer import SimpleCLexer
from SimpleCParser import SimpleCParser

cStream = antlr3.StringStream(open(sys.argv[1]).read())
lexer = SimpleCLexer(cStream)
tStream = antlr3.CommonTokenStream(lexer)
parser = SimpleCParser(tStream)
parser.program()
