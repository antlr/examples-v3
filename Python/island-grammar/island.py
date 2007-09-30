import sys
import antlr3
from SimpleLexer import SimpleLexer
from SimpleParser import SimpleParser

cStream = antlr3.StringStream(open(sys.argv[1]).read())
lexer = SimpleLexer(cStream)
tStream = antlr3.CommonTokenStream(lexer)
parser = SimpleParser(tStream)
parser.program()
