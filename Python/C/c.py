import sys
import antlr3
from CLexer import CLexer
from CParser import CParser

cStream = antlr3.StringStream(open(sys.argv[1]).read())
lexer = CLexer(cStream)
tStream = antlr3.CommonTokenStream(lexer)
parser = CParser(tStream)
parser.translation_unit()
