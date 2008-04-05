/*
 [The "BSD licence"]
 Copyright (c) 2006 Kunle Odutola
 Copyright (c) 2004 Terence Parr and Loring Craymer
 All rights reserved.

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions
 are met:
 1. Redistributions of source code must retain the above copyright
    notice, this list of conditions and the following disclaimer.
 2. Redistributions in binary form must reproduce the above copyright
    notice, this list of conditions and the following disclaimer in the
    documentation and/or other materials provided with the distribution.
 3. The name of the author may not be used to endorse or promote products
    derived from this software without specific prior written permission.

 THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
 IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
 INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

namespace Antlr.Examples.Python
{
	using System;
	using IList = System.Collections.IList;
	using ArrayList = System.Collections.ArrayList;
	using StringBuilder = System.Text.StringBuilder;
	using Antlr.Runtime;

	/** Python does not explicitly provide begin and end nesting signals.
	 Rather, the indentation level indicates when you begin and end.
	 This is an interesting lexical problem because multiple DEDENT
	 tokens should be sent to the parser sometimes without a corresponding
	 input symbol!  Consider the following example:

	 a=1
	 if a>1:
		 print a
	 b=3

	 Here the "b" token on the left edge signals that a DEDENT is needed
	 after the "print a \n" and before the "b".  The sequence should be

	 ... 1 COLON NEWLINE INDENT PRINT a NEWLINE DEDENT b ASSIGN 3 ...

	 For more examples, see the big comment at the bottom of this file.

	 This TokenStream normally just passes tokens through to the parser.
	 Upon NEWLINE token from the lexer, however, an INDENT or DEDENT token
	 may need to be sent to the parser.  The NEWLINE is the trigger for
	 this class to do it's job.  NEWLINE is saved and then the first token
	 of the next line is examined.  If non-leading-whitespace token,
	 then check against stack for indent vs dedent.  If LEADING_WS, then
	 the column of the next non-whitespace token will dictate indent vs
	 dedent.  The column of the next real token is number of spaces
	 in the LEADING_WS token + 1 (to move past the whitespace).  The
	 lexer grammar must set the text of the LEADING_WS token to be
	 the proper number of spaces (and do tab conversion etc...).

	 A stack of column numbers is tracked and used to detect changes
	 in indent level from one token to the next.

	 A queue of tokens is built up to hold multiple DEDENT tokens that
	 are generated.  Before asking the lexer for another token via
	 nextToken(), the queue is flushed first one token at a time.

	 Terence Parr and Loring Craymer
	 February 2004
	 */
	public class PythonTokenSource : ITokenSource
	{
		public const int MAX_INDENTS = 100;
		public const int FIRST_CHAR_POSITION = 0;

		/** The stack of indent levels (column numbers) */
		int[] indentStack = new int[MAX_INDENTS];
		/** stack pointer */
		int sp = -1; // grow upwards

		/** The queue of tokens */
		ArrayList tokens = new ArrayList();

		/** We pull real tokens from this lexer */
		CommonTokenStream stream;

		int lastTokenAddedIndex = -1;

		public PythonTokenSource(PythonLexer lexer)
		{
		}

		public PythonTokenSource(CommonTokenStream stream)
		{
			this.stream = stream;
			// "state" of indent level is FIRST_CHAR_POSITION
			Push(FIRST_CHAR_POSITION);
		}
		
		public string SourceName {
			get { return stream.SourceName; }
		}

		/** From http://www.python.org/doc/2.2.3/ref/indentation.html

		 "Before the first line of the file is read, a single zero is
		 pushed on the stack; this will never be popped off again. The
		 numbers pushed on the stack will always be strictly increasing
		 from bottom to top. At the beginning of each logical line, the
		 line's indentation level is compared to the top of the
		 stack. If it is equal, nothing happens. If it is larger, it is
		 pushed on the stack, and one INDENT token is generated. If it
		 is smaller, it must be one of the numbers occurring on the
		 stack; all numbers on the stack that are larger are popped
		 off, and for each number popped off a DEDENT token is
		 generated. At the end of the file, a DEDENT token is generated
		 for each number remaining on the stack that is larger than
		 zero."

		 I use char position in line 0..n-1 instead.

		 The DEDENTS possibly needed at EOF are gracefully handled by forcing
		 EOF to have char pos 0 even though with UNIX it's hard to get EOF
		 at a non left edge.
		 */
		public IToken NextToken()
		{
			// if something in queue, just remove and return it
			if (tokens.Count > 0)
			{
				IToken t = (IToken)tokens[0];
				tokens.RemoveAt(0);
				// System.out.println(t);
				return t;
			}

			InsertImaginaryIndentDedentTokens();

			return NextToken();
		}

		protected void InsertImaginaryIndentDedentTokens()
		{
			IToken t = stream.LT(1);
			stream.Consume();
			IList hiddenTokens;

			// if not a NEWLINE, doesn't signal indent/dedent work; just enqueue
			if (t.Type != PythonLexer.NEWLINE)
			{
				hiddenTokens = stream.GetTokens(lastTokenAddedIndex + 1, t.TokenIndex - 1);
				if (hiddenTokens != null)
				{
					tokens.AddRange(hiddenTokens);
				}
				lastTokenAddedIndex = t.TokenIndex;
				tokens.Add(t);
				return;
			}

			// save NEWLINE in the queue
			//System.out.println("found newline: "+t+" stack is "+StackString());
			hiddenTokens = stream.GetTokens(lastTokenAddedIndex + 1, t.TokenIndex - 1);
			if (hiddenTokens != null)
			{
				tokens.AddRange(hiddenTokens);
			}
			lastTokenAddedIndex = t.TokenIndex;
			tokens.Add(t);

			// grab first token of next line
			t = stream.LT(1);
			stream.Consume();

			hiddenTokens = stream.GetTokens(lastTokenAddedIndex + 1, t.TokenIndex - 1);
			if (hiddenTokens != null)
			{
				tokens.AddRange(hiddenTokens);
			}
			lastTokenAddedIndex = t.TokenIndex;

			// compute cpos as the char pos of next non-WS token in line
			int cpos = t.CharPositionInLine; // column dictates indent/dedent
			if (t.Type == Token.EOF)
			{
				cpos = -1; // pretend EOF always happens at left edge
			}
			else if (t.Type == PythonLexer.LEADING_WS)
			{
				cpos = t.Text.Length;
			}

			//System.out.println("next token is: "+t);

			// compare to last indent level
			int lastIndent = Peek();
			//System.out.println("cpos, lastIndent = "+cpos+", "+lastIndent);
			if (cpos > lastIndent)
			{ // they indented; track and gen INDENT
				Push(cpos);
				//System.out.println("Push("+cpos+"): "+StackString());
				IToken indent = new ClassicToken(PythonParser.INDENT, "");
				indent.CharPositionInLine = t.CharPositionInLine;
				indent.Line = t.Line;
				tokens.Add(indent);
			}
			else if (cpos < lastIndent)
			{ // they dedented
				// how far back did we dedent?
				int prevIndex = FindPreviousIndent(cpos);
				//System.out.println("dedented; prevIndex of cpos="+cpos+" is "+prevIndex);
				// generate DEDENTs for each indent level we backed up over
				for (int d = sp - 1; d >= prevIndex; d--)
				{
					IToken dedent = new ClassicToken(PythonParser.DEDENT, "");
					dedent.CharPositionInLine = t.CharPositionInLine;
					dedent.Line = t.Line;
					tokens.Add(dedent);
				}
				sp = prevIndex; // pop those off indent level
			}
			if (t.Type != PythonLexer.LEADING_WS)
			{ // discard WS
				tokens.Add(t);
			}
		}

		//  T O K E N  S T A C K  M E T H O D S

		protected void Push(int i)
		{
			if (sp >= MAX_INDENTS)
			{
				throw new InvalidOperationException("stack overflow");
			}
			sp++;
			indentStack[sp] = i;
		}

		protected int Pop()
		{
			if (sp < 0)
			{
				throw new InvalidOperationException("stack underflow");
			}
			int top = indentStack[sp];
			sp--;
			return top;
		}

		protected int Peek()
		{
			return indentStack[sp];
		}

		/** Return the index on stack of previous indent level == i else -1 */
		protected int FindPreviousIndent(int i)
		{
			for (int j = sp - 1; j >= 0; j--)
			{
				if (indentStack[j] == i)
				{
					return j;
				}
			}
			return FIRST_CHAR_POSITION;
		}

		public String StackString()
		{
			StringBuilder buf = new StringBuilder();
			for (int j = sp; j >= 0; j--)
			{
				buf.Append(" ");
				buf.Append(indentStack[j]);
			}
			return buf.ToString();
		}

	}
}

/* More example input / output pairs with code simplified to single chars
------- t1 -------
a a
        b b
        c
d
a a \n INDENT b b \n c \n DEDENT d \n EOF
------- t2 -------
a  c
 b
c
a c \n INDENT b \n DEDENT c \n EOF 
------- t3 -------
a
        b
                c
d
a \n INDENT b \n INDENT c \n DEDENT DEDENT d \n EOF 
------- t4 -------
a
    c
                  d
    e
    f
             g
             h
             i
              j
    k
a \n INDENT c \n INDENT d \n DEDENT e \n f \n INDENT g \n h \n i \n INDENT j \n DEDENT DEDENT k \n DEDENT EOF 
------- t5 -------
a
        b
        c
                d
                e
a \n INDENT b \n c \n INDENT d \n e \n DEDENT DEDENT EOF 
*/
