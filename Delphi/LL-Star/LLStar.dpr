program LLStar;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Antlr.Runtime,
  SimpleCLexer in 'SimpleCLexer.pas',
  SimpleCParser in 'SimpleCParser.pas';

procedure Run(const InputFilename: String);
var
  Input: ICharStream;
  Lex: ISimpleCLexer;
  Tokens: ICommonTokenStream;
  Parser: ISimpleCParser;
begin
  WriteLn('Processing file: ' + InputFilename);
  Input := TANTLRFileStream.Create(InputFilename);
  Lex := TSimpleCLexer.Create(Input);
  Tokens := TCommonTokenStream.Create(Lex);
  Parser := TSimpleCParser.Create(Tokens);
  Parser.prog;
end;

begin
  try
    ReportMemoryLeaksOnShutdown := True;
    if (ParamCount = 1) then
      Run(ParamStr(1))
    else
      WriteLn('Usage: Hoisted <input-file>');
  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.
