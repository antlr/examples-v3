program TreeParser;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Antlr.Runtime,
  Antlr.Runtime.Tree,
  LangLexer in 'LangLexer.pas',
  LangParser in 'LangParser.pas',
  LangDumpDecl in 'LangDumpDecl.pas';

procedure Run(const InputFilename: String);
var
  Input: ICharStream;
  Lex: ILangLexer;
  Tokens: ICommonTokenStream;
  Parser: ILangParser;
  R: IParserRuleReturnScope;
  R0: ICommonTree;
  Nodes: ICommonTreeNodeStream;
  Walker: ILangDumpDecl;
begin
  WriteLn('Processing file: ' + InputFilename);
  Input := TANTLRFileStream.Create(InputFilename);
  Lex := TLangLexer.Create(Input);
  Tokens := TCommonTokenStream.Create(Lex);
  Parser := TLangParser.Create(Tokens);

  R := Parser.Start;
  WriteLn('tree: ' + (R.Tree as ITree).ToStringTree);
  R0 := R.Tree as ICommonTree;
  Nodes := TCommonTreeNodeStream.Create(R0);
  Nodes.TokenStream := Tokens;
  Walker := TLangDumpDecl.Create(Nodes);
  Walker.decl;
end;

begin
  try
    ReportMemoryLeaksOnShutdown := True;
    if (ParamCount = 1) then
      Run(ParamStr(1))
    else
      WriteLn('Usage: TreeParser <input-file>');
  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.
