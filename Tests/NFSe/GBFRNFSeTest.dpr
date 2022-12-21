program GBFRNFSeTest;

{$IFNDEF TESTINSIGHT}
{$APPTYPE CONSOLE}
{$ENDIF}
{$STRONGLINKTYPES ON}
{$R *.dres}

uses
  System.SysUtils,
  {$IFDEF TESTINSIGHT}
  TestInsight.DUnitX,
  {$ELSE}
  DUnitX.Loggers.Console,
  {$ENDIF }
  DUnitX.TestFramework,
  GBFR.NFSe.Test.Base in 'GBFR.NFSe.Test.Base.pas',
  GBFR.XML.Base in '..\..\Source\XML\GBFR.XML.Base.pas',
  GBFR.NFSe.Model.Abrasf204 in '..\..\Source\NFSe\GBFR.NFSe.Model.Abrasf204.pas',
  GBFR.NFSe.Model.Types in '..\..\Source\NFSe\GBFR.NFSe.Model.Types.pas',
  GBFR.NFSe.Model.IssNetOnline in '..\..\Source\NFSe\GBFR.NFSe.Model.IssNetOnline.pas',
  GBFR.NFSe.XML.Abrasf204.Interfaces in '..\..\Source\NFSe\GBFR.NFSe.XML.Abrasf204.Interfaces.pas',
  GBFR.NFSe.XML.Abrasf204 in '..\..\Source\NFSe\GBFR.NFSe.XML.Abrasf204.pas',
  GBFR.NFSe.Test.Abrasf204 in 'GBFR.NFSe.Test.Abrasf204.pas';

{ keep comment here to protect the following conditional from being removed by the IDE when adding a unit }
begin
  ReportMemoryLeaksOnShutdown := True;
  TestInsight.DUnitX.RunRegisteredTests;
end.
