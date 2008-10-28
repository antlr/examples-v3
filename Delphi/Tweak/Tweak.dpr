program Tweak;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Antlr.Runtime,
  TweakLexer in 'TweakLexer.pas',
  TweakParser in 'TweakParser.pas';

procedure Run(const InputFilename: String);
var
  Input: ICharStream;
  Lex: ITweakLexer;
  Tokens: ITokenStream;
  Parser: ITweakParser;
begin
  WriteLn('Processing file: ' + InputFilename);
  Input := TANTLRFileStream.Create(InputFilename);
  Lex := TTweakLexer.Create(Input);
  Tokens := TTokenRewriteStream.Create(Lex);
  Parser := TTweakParser.Create(Tokens);
  Parser.prog;
  WriteLn(Tokens.ToString);
end;

begin
  try
    ReportMemoryLeaksOnShutdown := True;
    if (ParamCount = 1) then
      Run(ParamStr(1))
    else
      WriteLn('Usage: Tweak <input-file>');
  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.
