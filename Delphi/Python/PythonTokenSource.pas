unit PythonTokenSource;
(*
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
*)

interface

uses
  Classes,
  SysUtils,
  Antlr.Runtime,
  Antlr.Runtime.Tools,
  PythonLexer,
  PythonParser;

(** Python does not explicitly provide begin and end nesting signals.
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
 *)

type
  TPythonTokenSource = class(TANTLRObject, ITokenSource)
  public
    const
      MAX_INDENTS = 100;
      FIRST_CHAR_POSITION = 0;
  strict private
		// The stack of indent levels (column numbers)
    FIndentStack: array [0..MAX_INDENTS - 1] of Integer;
		// stack pointer
    FSP: Integer; // grow upwards
		// The queue of tokens
    FTokens: IList<IToken>;
		// We pull real tokens from this lexer
    FStream: ICommonTokenStream;
    FLastTokenAddedIndex: Integer;
  protected
    { ITokenSource }
    function GetSourceName: String;
    function NextToken: IToken;
  strict protected
    procedure Push(const I: Integer);
    function Peek: Integer;
    function Pop: Integer;
    function FindPreviousIndent(const I: Integer): Integer;
    procedure InsertImaginaryIndentDedentTokens;
  public
    constructor Create; overload;
    constructor Create(const ALexer: IPythonLexer); overload;
    constructor Create(const AStream: ICommonTokenStream); overload;
    function StackString: String;
  end;

implementation

{ TPythonTokenSource }

constructor TPythonTokenSource.Create;
begin
  inherited;
  FSP := -1;
  FLastTokenAddedIndex := -1;
  FTokens := TList<IToken>.Create;
end;

constructor TPythonTokenSource.Create(const ALexer: IPythonLexer);
begin
  Create;
end;

constructor TPythonTokenSource.Create(const AStream: ICommonTokenStream);
begin
  Create;
  FStream := AStream;
  // "state" of indent level is FIRST_CHAR_POSITION
  Push(FIRST_CHAR_POSITION);
end;

function TPythonTokenSource.FindPreviousIndent(const I: Integer): Integer;
// Return the index on stack of previous indent level == i else -1
begin
  for Result := FSP - 1 downto 0 do
    if (FIndentStack[Result] = I) then
      Exit;
  Result := FIRST_CHAR_POSITION;
end;

function TPythonTokenSource.GetSourceName: String;
begin
  Result := FStream.SourceName;
end;

procedure TPythonTokenSource.InsertImaginaryIndentDedentTokens;
var
  T, Indent, Dedent: IToken;
  HiddenTokens: IList<IToken>;
  CPos, LastIndent, PrevIndex, D: Integer;
begin
  T := FStream.LT(1);
  FStream.Consume;

	// if not a NEWLINE, doesn't signal indent/dedent work; just enqueue
  if (T.TokenType <> TPythonLexer.NEWLINE) then
  begin
    HiddenTokens := FStream.GetTokens(FLastTokenAddedIndex + 1,T.TokenIndex - 1);
    if Assigned(HiddenTokens) then
      FTokens.AddRange(HiddenTokens);
    FLastTokenAddedIndex := T.TokenIndex;
    FTokens.Add(T);
    Exit;
  end;

  // save NEWLINE in the queue
  HiddenTokens := FStream.GetTokens(FLastTokenAddedIndex + 1,T.TokenIndex - 1);
  if Assigned(HiddenTokens) then
    FTokens.AddRange(HiddenTokens);
  FLastTokenAddedIndex := T.TokenIndex;
  FTokens.Add(T);

	// grab first token of next line
  T := FStream.LT(1);
  FStream.Consume;

  HiddenTokens := FStream.GetTokens(FLastTokenAddedIndex + 1,T.TokenIndex - 1);
  if Assigned(HiddenTokens) then
    FTokens.AddRange(HiddenTokens);
  FLastTokenAddedIndex := T.TokenIndex;

  // compute cpos as the char pos of next non-WS token in line
  CPos := T.CharPositionInLine; // column dictates indent/dedent
  if (T.TokenType = TToken.EOF) then
    CPos := -1 // pretend EOF always happens at left edge
  else
  if (T.TokenType = TPythonLexer.LEADING_WS) then
    CPos := Length(T.Text);

	// compare to last indent level
  LastIndent := Peek;
  if (CPos > LastIndent) then
  begin
    // they indented; track and gen INDENT
    Push(CPos);
    Indent := TClassicToken.Create(TPythonParser.INDENT, '');
    Indent.CharPositionInLine := T.CharPositionInLine;
    Indent.Line := T.Line;
    FTokens.Add(Indent);
  end
  else
  if (CPos < LastIndent) then
  begin
    // they dedented
	  // how far back did we dedent?
    PrevIndex := FindPreviousIndent(CPos);
		// generate DEDENTs for each indent level we backed up over
    for D := FSP - 1 downto PrevIndex do
    begin
      Dedent := TClassicToken.Create(TPythonParser.DEDENT, '');
      Dedent.CharPositionInLine := T.CharPositionInLine;
      Dedent.Line := T.Line;
      FTokens.Add(Dedent);
    end;
    FSP := PrevIndex; // pop those off indent level
  end;

  if (T.TokenType <> TPythonLexer.LEADING_WS) then
    // discard WS
    FTokens.Add(T);
end;

function TPythonTokenSource.NextToken: IToken;
(** From http://www.python.org/doc/2.2.3/ref/indentation.html

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
 *)
begin
  // if something in queue, just remove and return it
  if (FTokens.Count > 0) then
  begin
    Result := FTokens[0];
    FTokens.Delete(0);
    Exit;
  end;
  InsertImaginaryIndentDedentTokens;
  Result := NextToken;
end;

function TPythonTokenSource.Peek: Integer;
begin
  Result := FIndentStack[FSP];
end;

function TPythonTokenSource.Pop: Integer;
begin
  if (FSP < 0) then
    raise EInvalidOperation.Create('stack underflow');
  Result := FIndentStack[FSP];
  Dec(FSP);
end;

procedure TPythonTokenSource.Push(const I: Integer);
begin
  if (FSP >= MAX_INDENTS) then
    raise EInvalidOperation.Create('stack overflow');
  Inc(FSP);
  FIndentStack[FSP] := I;
end;

function TPythonTokenSource.StackString: String;
var
  Buf: TStringBuilder;
  J: Integer;
begin
  Buf := TStringBuilder.Create;
  try
    for J := FSP downto 0 do
    begin
      Buf.Append(' ');
      Buf.Append(FIndentStack[J]);
    end;
    Result := Buf.ToString;
  finally
    Buf.Free;
  end;
end;

(* More example input / output pairs with code simplified to single chars
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
*)

end.
