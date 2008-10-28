program CParse;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Antlr.Runtime,
  CLexer in 'CLexer.pas',
  CParser in 'CParser.pas';

procedure Run(const InputFilename: String);
var
  Input: ICharStream;
  Lex: ICLexer;
  Tokens: ICommonTokenStream;
  Parser: ICParser;
begin
  WriteLn('Processing file: ' + InputFilename);
  Input := TANTLRFileStream.Create(InputFilename);
  Lex := TCLexer.Create(Input);
  Tokens := TCommonTokenStream.Create(Lex);
  Parser := TCParser.Create(Tokens);
  Parser.translation_unit;
end;

begin
  try
    ReportMemoryLeaksOnShutdown := True;
    if (ParamCount = 1) then
      Run(ParamStr(1))
    else
      WriteLn('Usage: CParse <input-file>');
  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.
