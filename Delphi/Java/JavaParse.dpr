program JavaParse;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Antlr.Runtime,
  JavaLexer in 'JavaLexer.pas',
  JavaParser in 'JavaParser.pas';

procedure Run(const InputFilename: String);
var
  Input: ICharStream;
  Lex: IJavaLexer;
  Tokens: ICommonTokenStream;
  Parser: IJavaParser;
begin
  WriteLn('Processing file: ' + InputFilename);
  Input := TANTLRFileStream.Create(InputFilename);
  Lex := TJavaLexer.Create(Input);
  Tokens := TCommonTokenStream.Create(Lex);
  Parser := TJavaParser.Create(Tokens);
  Parser.compilationUnit;
  WriteLn('finished parsing OK');
end;

begin
  try
    ReportMemoryLeaksOnShutdown := True;
    if (ParamCount = 1) then
      Run(ParamStr(1))
    else
      WriteLn('Usage: JavaParse <input-file>');
  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.
