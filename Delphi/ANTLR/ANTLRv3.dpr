program ANTLRv3;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Antlr.Runtime,
  Antlr.Runtime.Tree,
  ANTLRv3Lexer in 'ANTLRv3Lexer.pas',
  ANTLRv3Parser in 'ANTLRv3Parser.pas',
  ANTLRv3Tree in 'ANTLRv3Tree.pas';

procedure Run(const InputFilename: String);
var
  Input: ICharStream;
  Lex: IANTLRv3Lexer;
  Tokens: ICommonTokenStream;
  Parser: IANTLRv3Parser;
  Nodes: ICommonTreeNodeStream;
  Walker: IANTLRv3Tree;
  R: IgrammarDef_return;
  T: ICommonTree;
  S: String;
  F: TextFile;
begin
  WriteLn('Processing file: ' + InputFilename);
  Input := TANTLRFileStream.Create(InputFilename);

  AssignFile(F,'output');
  Rewrite(F);
  try
    // BUILD AST
    Lex := TANTLRv3Lexer.Create(Input);
    Tokens := TCommonTokenStream.Create(Lex);
    Parser := TANTLRv3Parser.Create(Tokens);
    R := Parser.grammarDef;
    T := R.Tree as ICommonTree;
    S := T.ToStringTree;
    WriteLn(S);
    WriteLn(F,S);

    // WALK AST
    Nodes := TCommonTreeNodeStream.Create(T);
    Walker := TANTLRv3Tree.Create(Nodes);
    Walker.grammarDef;
  finally
    CloseFile(F);
  end;
end;

begin
  try
    ReportMemoryLeaksOnShutdown := True;
    if (ParamCount = 1) then
      Run(ParamStr(1))
    else
      WriteLn('Usage: ANTLRv3 <input-file>');
  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.
