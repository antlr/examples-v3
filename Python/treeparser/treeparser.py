import sys
import antlr3
import antlr3.tree
from LangLexer import LangLexer
from LangParser import LangParser
from LangDumpDecl import LangDumpDecl

cStream = antlr3.FileStream(sys.argv[1])
lexer = LangLexer(cStream)
tStream = antlr3.CommonTokenStream(lexer)
parser = LangParser(tStream)
r = parser.start()
print "tree: "+r.tree.toStringTree()

nodes = antlr3.tree.CommonTreeNodeStream(r.tree)
nodes.setTokenStream(tStream)
walker = LangDumpDecl(nodes)
walker.decl()
