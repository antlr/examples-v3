import sys
import antlr3
from PythonLexer import PythonLexer
from PythonParser import PythonParser
from PythonTokenSource import PythonTokenSource


# override nextToken to set startPos (this seems too hard)
class MyLexer(PythonLexer):
    def nextToken(self):
        self.startPos = self.getCharPositionInLine()
        return PythonLexer.nextToken(self)


cStream = antlr3.FileStream(sys.argv[1])
lexer = MyLexer(cStream)
tokens = antlr3.CommonTokenStream(lexer)
tokens.discardOffChannelTokens = True
indentedSource = PythonTokenSource(tokens)
tokens = antlr3.CommonTokenStream(indentedSource)
parser = PythonParser(tokens)
parser.file_input()
