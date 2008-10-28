program DynScope;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Antlr.Runtime,
  Antlr.Runtime.Tree,
  DynLexer in 'DynLexer.pas',
  DynParser in 'DynParser.pas';

procedure Run(const InputFilename: String);
var
  Input: ICharStream;
  Lex: IDynLexer;
  Tokens: ICommonTokenStream;
  Parser: IDynParser;
begin
  WriteLn('Processing file: ' + InputFilename);
  Input := TANTLRFileStream.Create(InputFilename);
  Lex := TDynLexer.Create(Input);
  Tokens := TCommonTokenStream.Create(Lex);
  Parser := TDynParser.Create(Tokens);
  Parser.prog;
end;

begin
  try
    ReportMemoryLeaksOnShutdown := True;
    if (ParamCount = 1) then
      Run(ParamStr(1))
    else
      WriteLn('Usage: DynScope <input-file>');
  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.
