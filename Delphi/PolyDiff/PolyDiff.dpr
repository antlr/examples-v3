program PolyDiff;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Antlr.Runtime,
  Antlr.Runtime.Tree,
  PolyLexer in 'PolyLexer.pas',
  PolyParser in 'PolyParser.pas',
  PolyDifferentiator in 'PolyDifferentiator.pas',
  Simplifier in 'Simplifier.pas';

procedure Run(const InputFilename: String);
var
  Input: ICharStream;
  Lex: IPolyLexer;
  Tokens: ICommonTokenStream;
  Parser: IPolyParser;
  R: PolyParser.Ipoly_return;
  Nodes: ICommonTreeNodeStream;
  Differ: IPolyDifferentiator;
  R2: PolyDifferentiator.Ipoly_return;
  Reducer: ISimplifier;
  R3: Simplifier.Ipoly_return;
begin
  WriteLn('Processing file: ' + InputFilename);
  Input := TANTLRFileStream.Create(InputFilename);

  // BUILD AST
  Lex := TPolyLexer.Create(Input);
  Tokens := TCommonTokenStream.Create(Lex);
  Parser := TPolyParser.Create(Tokens);
  R := Parser.poly;
  WriteLn('tree=' + (R.Tree as ITree).ToStringTree);

  // DIFFERENTIATE
  Nodes := TCommonTreeNodeStream.Create(R.Tree);
  Differ := TPolyDifferentiator.Create(Nodes);
  R2 := Differ.poly;
  WriteLn('d/dx=' + (R2.Tree as ITree).ToStringTree);

	// SIMPLIFY / NORMALIZE
  Nodes := TCommonTreeNodeStream.Create(R2.Tree);
  Nodes.TokenStream := Tokens;
  Reducer := TSimplifier.Create(Nodes);
  R3 := Reducer.poly;
  WriteLn('simplified=' + (R3.Tree as ITree).ToStringTree);
end;

begin
  try
    ReportMemoryLeaksOnShutdown := True;
    if (ParamCount = 1) then
      Run(ParamStr(1))
    else
      WriteLn('Usage: PolyDiff <input-file>');
  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.
