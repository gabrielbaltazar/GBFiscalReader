program GBFRSATTest;

{$IFNDEF TESTINSIGHT}
{$APPTYPE CONSOLE}
{$ENDIF}
{$STRONGLINKTYPES ON}
{$R *.dres}

uses
  System.SysUtils,
  Winapi.ActiveX,
  TestInsight.DUnitX,
  DUnitX.TestFramework,
  GBFR.SAT.Test.Base in 'GBFR.SAT.Test.Base.pas',
  GBFR.SAT.Model.Classes in '..\..\Source\SAT\GBFR.SAT.Model.Classes.pas',
  GBFR.SAT.Model.Types in '..\..\Source\SAT\GBFR.SAT.Model.Types.pas',
  GBFR.SAT.XML.Interfaces in '..\..\Source\SAT\GBFR.SAT.XML.Interfaces.pas',
  GBFR.SAT.Test.XML.Simples in 'GBFR.SAT.Test.XML.Simples.pas',
  GBFR.XML.Base in '..\..\Source\XML\GBFR.XML.Base.pas',
  GBFR.SAT.XML.Default in '..\..\Source\SAT\GBFR.SAT.XML.Default.pas';

begin
  ReportMemoryLeaksOnShutdown := True;
  IsConsole := False;
  CoInitialize(nil);
  try
    TestInsight.DUnitX.RunRegisteredTests;
  finally
    CoUninitialize;
  end;
end.
