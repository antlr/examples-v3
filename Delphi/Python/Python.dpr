program Python;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Antlr.Runtime,
  PythonLexer in 'PythonLexer.pas',
  PythonParser in 'PythonParser.pas',
  PythonTokenSource in 'PythonTokenSource.pas';

type
  TMyLexer = class(TPythonLexer)
  protected
    { ILexer }
    function NextToken: IToken; override;
  end;

{ TMyLexer }

function TMyLexer.NextToken: IToken;
begin
  StartPos := GetCharPositionInLine;
  Result := inherited NextToken;
end;

procedure Run(const InputFilename: String);
var
  Input: ICharStream;
  Lex: IPythonLexer;
  Tokens: ICommonTokenStream;
  Parser: IPythonParser;
  IndentedSource: ITokenSource;
begin
  WriteLn('Processing file: ' + InputFilename);
  Input := TANTLRFileStream.Create(InputFilename);
  Lex := TMyLexer.Create(Input);
  Tokens := TCommonTokenStream.Create(Lex);
  Tokens.DiscardOffChannelTokens(True);
  IndentedSource := TPythonTokenSource.Create(Tokens);
  Tokens := TCommonTokenStream.Create(IndentedSource);
  Parser := TPythonParser.Create(Tokens);
  Parser.file_input;
end;

begin
  try
    ReportMemoryLeaksOnShutdown := True;
    if (ParamCount = 1) then
      Run(ParamStr(1))
    else
      WriteLn('Usage: Python <input-file>');
  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.
