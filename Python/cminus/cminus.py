import sys
import antlr3
import stringtemplate3
from CMinusParser import CMinusParser
from CMinusLexer import CMinusLexer

if len(sys.argv) == 2:
    templateFileName = "Java.stg"
    inputFileName = sys.argv[1]

elif len(sys.argv) == 3:
    templateFileName = sys.argv[1]
    inputFileName = sys.argv[2]

else:
    sys.stderr.write(repr(sys.argv) + '\n')
    sys.exit(1)
    
templates = stringtemplate3.StringTemplateGroup(
    file=open(templateFileName, 'r'),
    lexer='angle-bracket'
    )

cStream = antlr3.ANTLRFileStream(inputFileName)
lexer = CMinusLexer(cStream)
tStream = antlr3.CommonTokenStream(lexer)
parser = CMinusParser(tStream)
parser.templateLib = templates
r = parser.program()
print r.st.toString()
