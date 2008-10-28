program Island;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Antlr.Runtime,
  JavadocLexer in 'JavadocLexer.pas',
  SimpleLexer in 'SimpleLexer.pas',
  JavadocParser in 'JavadocParser.pas',
  SimpleParser in 'SimpleParser.pas';

procedure Run(const InputFilename: String);
var
  Input: ICharStream;
  Lex: ISimpleLexer;
  Tokens: ICommonTokenStream;
  Parser: ISimpleParser;
begin
  WriteLn('Processing file: ' + InputFilename);
  Input := TANTLRFileStream.Create(InputFilename);
  Lex := TSimpleLexer.Create(Input);
  Tokens := TCommonTokenStream.Create(Lex);
  Parser := TSimpleParser.Create(Tokens);
  Parser.prog;
end;

begin
  try
    ReportMemoryLeaksOnShutdown := True;
    if (ParamCount = 1) then
      Run(ParamStr(1))
    else
      WriteLn('Usage: Island <input-file>');
  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.
