import sys
import antlr3
import antlr3.tree
from SimpleCLexer import SimpleCLexer
from SimpleCParser import SimpleCParser
from SimpleCWalker import SimpleCWalker

cStream = antlr3.StringStream(open(sys.argv[1]).read())
lexer = SimpleCLexer(cStream)
tStream = antlr3.CommonTokenStream(lexer)
parser = SimpleCParser(tStream)
r = parser.program()

print "tree=" + r.tree.toStringTree()

nodes = antlr3.tree.CommonTreeNodeStream(r.tree)
nodes.setTokenStream(tStream)
walker = SimpleCWalker(nodes)
walker.program()
