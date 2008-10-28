program Fuzzy;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Antlr.Runtime,
  FuzzyJava in 'FuzzyJava.pas';

procedure Run(const InputFilename: String);
var
  Input: ICharStream;
  Lex: IFuzzyJava;
  Tokens: ICommonTokenStream;
begin
  WriteLn('Processing file: ' + InputFilename);
  Input := TANTLRFileStream.Create(InputFilename);
  Lex := TFuzzyJava.Create(Input);
  Tokens := TCommonTokenStream.Create(Lex);
  Tokens.ToString;
end;

begin
  try
    ReportMemoryLeaksOnShutdown := True;
    if (ParamCount = 1) then
      Run(ParamStr(1))
    else
      WriteLn('Usage: Fuzzy <input-file>');
  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.
