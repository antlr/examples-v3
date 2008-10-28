program XmlLexer;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Antlr.Runtime,
  XML in 'XML.pas';

procedure Run(const InputFilename: String);
var
  Input: ICharStream;
  Lex: IXML;
begin
  WriteLn('Processing file: ' + InputFilename);
  Input := TANTLRFileStream.Create(InputFilename);
  Lex := TXML.Create(Input);
  while (Lex.NextToken <> TToken.EOF_TOKEN) do ;
end;

begin
  try
    ReportMemoryLeaksOnShutdown := True;
    if (ParamCount = 1) then
      Run(ParamStr(1))
    else
      WriteLn('Usage: XmlLexer <input-file>');
  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.
