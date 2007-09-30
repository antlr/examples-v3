import sys
import antlr3
from SymtabTestLexer import SymtabTestLexer
from SymtabTestParser import SymtabTestParser

cStream = antlr3.StringStream(open(sys.argv[1]).read())
lexer = SymtabTestLexer(cStream)
tStream = antlr3.CommonTokenStream(lexer)
parser = SymtabTestParser(tStream)
parser.prog()
