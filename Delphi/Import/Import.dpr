program Import;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Antlr.Runtime,
  SimpleLexer in 'SimpleLexer.pas',
  Simple_CommonLexer in 'Simple_CommonLexer.pas',
  SimpleParser in 'SimpleParser.pas';

procedure Run(const InputFilename: String);
var
  Input: ICharStream;
  Lex: ITokenSource;
  Tokens: ICommonTokenStream;
  Parser: ISimpleParser;
begin
  WriteLn('Processing file: ' + InputFilename);
  Input := TANTLRFileStream.Create(InputFilename);
  Lex := TSimpleLexer.Create(Input);
  Tokens := TCommonTokenStream.Create;
  Tokens.TokenSource := Lex;
  Parser := TSimpleParser.Create(Tokens);
  Parser.prog;
end;

begin
  try
    ReportMemoryLeaksOnShutdown := True;
    if (ParamCount = 1) then
      Run(ParamStr(1))
    else
      WriteLn('Usage: Import <input-file>');
  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.
