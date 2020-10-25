program GBFRCTeTest;

{$IFNDEF TESTINSIGHT}
{$APPTYPE CONSOLE}
{$ENDIF}
{$STRONGLINKTYPES ON}
{$R *.dres}

uses
  System.SysUtils,
  Winapi.ActiveX,
  {$IFDEF TESTINSIGHT}
  TestInsight.DUnitX,
  {$ELSE}
  DUnitX.Loggers.Console,
  DUnitX.Loggers.XML.NUnit,
  {$ENDIF }
  DUnitX.TestFramework,
  GBFR.CTe.Test.Base in 'GBFR.CTe.Test.Base.pas',
  GBFR.CTe.Model in '..\..\Source\CTe\GBFR.CTe.Model.pas',
  GBFR.CTe.Model.Ide in '..\..\Source\CTe\GBFR.CTe.Model.Ide.pas',
  GBFR.CTe.Model.Types in '..\..\Source\CTe\GBFR.CTe.Model.Types.pas',
  GBFR.CTe.Model.Classes in '..\..\Source\CTe\GBFR.CTe.Model.Classes.pas',
  GBFR.CTe.XML.Interfaces in '..\..\Source\CTe\GBFR.CTe.XML.Interfaces.pas',
  GBFR.CTe.XML.Default in '..\..\Source\CTe\GBFR.CTe.XML.Default.pas',
  GBFR.XML.Base in '..\..\Source\XML\GBFR.XML.Base.pas',
  System.Classes,
  GBFR.CTe.Model.Ide.Toma3 in '..\..\Source\CTe\GBFR.CTe.Model.Ide.Toma3.pas',
  GBFR.CTe.Model.Ide.Toma4 in '..\..\Source\CTe\GBFR.CTe.Model.Ide.Toma4.pas',
  GBFR.CTe.Model.DadosComplementares in '..\..\Source\CTe\GBFR.CTe.Model.DadosComplementares.pas',
  GBFR.CTe.Model.Endereco in '..\..\Source\CTe\GBFR.CTe.Model.Endereco.pas',
  GBFR.CTe.Model.Emitente in '..\..\Source\CTe\GBFR.CTe.Model.Emitente.pas',
  GBFR.CTe.Model.Remetente in '..\..\Source\CTe\GBFR.CTe.Model.Remetente.pas',
  GBFR.CTe.Model.Expedidor in '..\..\Source\CTe\GBFR.CTe.Model.Expedidor.pas',
  GBFR.CTe.Model.Destinatario in '..\..\Source\CTe\GBFR.CTe.Model.Destinatario.pas',
  GBFR.CTe.Model.PrestacaoServico in '..\..\Source\CTe\GBFR.CTe.Model.PrestacaoServico.pas',
  GBFR.CTe.Model.ComponentePrestacao in '..\..\Source\CTe\GBFR.CTe.Model.ComponentePrestacao.pas',
  GBFR.CTe.Model.InfoQuantidade in '..\..\Source\CTe\GBFR.CTe.Model.InfoQuantidade.pas',
  GBFR.CTe.Model.InfoCarga in '..\..\Source\CTe\GBFR.CTe.Model.InfoCarga.pas',
  GBFR.CTe.Model.InfoNFe in '..\..\Source\CTe\GBFR.CTe.Model.InfoNFe.pas',
  GBFR.CTe.Model.InfoDoc in '..\..\Source\CTe\GBFR.CTe.Model.InfoDoc.pas',
  GBFR.CTe.Model.ModalRodoviario in '..\..\Source\CTe\GBFR.CTe.Model.ModalRodoviario.pas',
  GBFR.CTe.Model.InfoModal in '..\..\Source\CTe\GBFR.CTe.Model.InfoModal.pas',
  GBFR.CTe.Model.InfoCTeNormal in '..\..\Source\CTe\GBFR.CTe.Model.InfoCTeNormal.pas',
  GBFR.CTe.Model.AutDownloadXML in '..\..\Source\CTe\GBFR.CTe.Model.AutDownloadXML.pas',
  GBFR.CTe.Model.InfProt in '..\..\Source\CTe\GBFR.CTe.Model.InfProt.pas',
  GBFR.CTe.Model.InfoSuplementar in '..\..\Source\CTe\GBFR.CTe.Model.InfoSuplementar.pas',
  GBFR.CTe.Model.Imposto.ICMS in '..\..\Source\CTe\GBFR.CTe.Model.Imposto.ICMS.pas',
  GBFR.CTe.Model.Imposto in '..\..\Source\CTe\GBFR.CTe.Model.Imposto.pas';

//
{$IFNDEF TESTINSIGHT}
var
  runner: ITestRunner;
  results: IRunResults;
  logger: ITestLogger;
  nunitLogger : ITestLogger;
{$ENDIF}
begin
  ReportMemoryLeaksOnShutdown := True;
  IsConsole := False;
  CoInitialize(nil);
{$IFDEF TESTINSIGHT}
  TestInsight.DUnitX.RunRegisteredTests;
{$ELSE}
  try
    //Check command line options, will exit if invalid
    TDUnitX.CheckCommandLine;
    //Create the test runner
    runner := TDUnitX.CreateRunner;
    //Tell the runner to use RTTI to find Fixtures
    runner.UseRTTI := True;
    //When true, Assertions must be made during tests;
    runner.FailsOnNoAsserts := False;

    //tell the runner how we will log things
    //Log to the console window if desired
    if TDUnitX.Options.ConsoleMode <> TDunitXConsoleMode.Off then
    begin
      logger := TDUnitXConsoleLogger.Create(TDUnitX.Options.ConsoleMode = TDunitXConsoleMode.Quiet);
      runner.AddLogger(logger);
    end;
    //Generate an NUnit compatible XML File
    nunitLogger := TDUnitXXMLNUnitFileLogger.Create(TDUnitX.Options.XMLOutputFile);
    runner.AddLogger(nunitLogger);

    //Run tests
    results := runner.Execute;
    if not results.AllPassed then
      System.ExitCode := EXIT_ERRORS;

    {$IFNDEF CI}
    //We don't want this happening when running under CI.
    if TDUnitX.Options.ExitBehavior = TDUnitXExitBehavior.Pause then
    begin
      System.Write('Done.. press <Enter> key to quit.');
      System.Readln;
    end;
    {$ENDIF}
  except
    on E: Exception do
      System.Writeln(E.ClassName, ': ', E.Message);
  end;
{$ENDIF}
  CoUninitialize;
end.
