program SimpleC;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Antlr.Runtime,
  Antlr.Runtime.Tree,
  SimpleCLexer in 'SimpleCLexer.pas',
  SimpleCParser in 'SimpleCParser.pas',
  SimpleCWalker in 'SimpleCWalker.pas';

procedure Run(const InputFilename: String);
var
  Input: ICharStream;
  Lex: ISimpleCLexer;
  Tokens: ICommonTokenStream;
  Parser: ISimpleCParser;
  R: Iprog_return;
  Nodes: ICommonTreeNodeStream;
  Walker: ISimpleCWalker;
begin
  WriteLn('Processing file: ' + InputFilename);
  Input := TANTLRFileStream.Create(InputFilename);
  Lex := TSimpleCLexer.Create(Input);
  Tokens := TCommonTokenStream.Create(Lex);
  Parser := TSimpleCParser.Create(Tokens);
  R := Parser.prog;
  WriteLn('tree=' + (R.Tree as ITree).ToStringTree);

  if (Parser.NumberOfSyntaxErrors = 0) then
  begin
    Nodes := TCommonTreeNodeStream.Create(R.Tree as ITree);
    Nodes.TokenStream := Tokens;
    Walker := TSimpleCWalker.Create(Nodes);
    Walker.prog;
  end;
end;

begin
  try
    ReportMemoryLeaksOnShutdown := True;
    if (ParamCount = 1) then
      Run(ParamStr(1))
    else
      WriteLn('Usage: SimpleC <input-file>');
  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.
