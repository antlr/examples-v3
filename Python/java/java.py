import sys
import antlr3
from JavaLexer import JavaLexer
from JavaParser import JavaParser

cStream = antlr3.StringStream(open(sys.argv[1]).read())
lexer = JavaLexer(cStream)
tStream = antlr3.CommonTokenStream(lexer)
parser = JavaParser(tStream)
parser.compilationUnit()
print "finished parsing OK"
