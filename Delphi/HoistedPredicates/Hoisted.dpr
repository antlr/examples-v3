program Hoisted;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Antlr.Runtime,
  SampleLexer in 'SampleLexer.pas',
  SampleParser in 'SampleParser.pas';

procedure Run(const InputFilename: String);
var
  Input: ICharStream;
  Lex: ISampleLexer;
  Tokens: ICommonTokenStream;
  Parser: ISampleParser;
begin
  WriteLn('Processing file: ' + InputFilename);
  Input := TANTLRFileStream.Create(InputFilename);
  Lex := TSampleLexer.Create(Input);
  Tokens := TCommonTokenStream.Create(Lex);
  Parser := TSampleParser.Create(Tokens);
  Parser.stat;
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
