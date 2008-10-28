program Scopes;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Antlr.Runtime,
  SymtabTestLexer in 'SymtabTestLexer.pas',
  SymtabTestParser in 'SymtabTestParser.pas';

procedure Run(const InputFilename: String);
var
  Input: ICharStream;
  Lex: ISymtabTestLexer;
  Tokens: ICommonTokenStream;
  Parser: ISymtabTestParser;
begin
  WriteLn('Processing file: ' + InputFilename);
  Input := TANTLRFileStream.Create(InputFilename);
  Lex := TSymtabTestLexer.Create(Input);
  Tokens := TCommonTokenStream.Create(Lex);
  Parser := TSymtabTestParser.Create(Tokens);
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
