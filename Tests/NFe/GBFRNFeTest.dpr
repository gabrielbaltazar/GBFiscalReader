program GBFRNFeTest;

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
  {$ENDIF }
  DUnitX.TestFramework,
  GBFR.NFe.Test.Base in 'Source\GBFR.NFe.Test.Base.pas',
  GBFR.XML.Base in '..\..\Source\XML\GBFR.XML.Base.pas',
  GBFR.NFe.Model.Classes in '..\..\Source\NFe\GBFR.NFe.Model.Classes.pas',
  GBFR.NFe.Model.Destinatario in '..\..\Source\NFe\GBFR.NFe.Model.Destinatario.pas',
  GBFR.NFe.Model.Emitente in '..\..\Source\NFe\GBFR.NFe.Model.Emitente.pas',
  GBFR.NFe.Model.Endereco in '..\..\Source\NFe\GBFR.NFe.Model.Endereco.pas',
  GBFR.NFe.Model.FormaPagamento in '..\..\Source\NFe\GBFR.NFe.Model.FormaPagamento.pas',
  GBFR.NFe.Model.ICMSTot in '..\..\Source\NFe\GBFR.NFe.Model.ICMSTot.pas',
  GBFR.NFe.Model.Imposto.COFINS in '..\..\Source\NFe\GBFR.NFe.Model.Imposto.COFINS.pas',
  GBFR.NFe.Model.Imposto.ICMS in '..\..\Source\NFe\GBFR.NFe.Model.Imposto.ICMS.pas',
  GBFR.NFe.Model.Imposto.II in '..\..\Source\NFe\GBFR.NFe.Model.Imposto.II.pas',
  GBFR.NFe.Model.Imposto.IPI in '..\..\Source\NFe\GBFR.NFe.Model.Imposto.IPI.pas',
  GBFR.NFe.Model.Imposto.ISSQN in '..\..\Source\NFe\GBFR.NFe.Model.Imposto.ISSQN.pas',
  GBFR.NFe.Model.Imposto.PIS in '..\..\Source\NFe\GBFR.NFe.Model.Imposto.PIS.pas',
  GBFR.NFe.Model.Item in '..\..\Source\NFe\GBFR.NFe.Model.Item.pas',
  GBFR.NFe.Model in '..\..\Source\NFe\GBFR.NFe.Model.pas',
  GBFR.NFe.Model.Pagamento in '..\..\Source\NFe\GBFR.NFe.Model.Pagamento.pas',
  GBFR.NFe.Model.Protocolo in '..\..\Source\NFe\GBFR.NFe.Model.Protocolo.pas',
  GBFR.NFe.Model.ResponsavelTecnico in '..\..\Source\NFe\GBFR.NFe.Model.ResponsavelTecnico.pas',
  GBFR.NFe.Model.Types in '..\..\Source\NFe\GBFR.NFe.Model.Types.pas',
  GBFR.NFe.XML.Default in '..\..\Source\NFe\GBFR.NFe.XML.Default.pas',
  GBFR.NFe.XML.Interfaces in '..\..\Source\NFe\GBFR.NFe.XML.Interfaces.pas',
  GBFR.NFe.Model.Ide in '..\..\Source\NFe\GBFR.NFe.Model.Ide.pas',
  GBFR.NFe.Model.InfAdic in '..\..\Source\NFe\GBFR.NFe.Model.InfAdic.pas',
  GBFR.NFe.Test.NFCe.OneItem in 'Source\GBFR.NFe.Test.NFCe.OneItem.pas',
  GBFR.NFe.Model.NFRef in '..\..\Source\NFe\GBFR.NFe.Model.NFRef.pas',
  GBFR.NFe.Test.NFeReferenciada in 'Source\GBFR.NFe.Test.NFeReferenciada.pas',
  GBFR.NFe.Test.NFCeMoreItems in 'Source\GBFR.NFe.Test.NFCeMoreItems.pas' {/},
  GBFR.NFe.Model.ISSQNTot in '..\..\Source\NFe\GBFR.NFe.Model.ISSQNTot.pas',
  GBFR.NFe.Test.NFeComISSQN in 'Source\GBFR.NFe.Test.NFeComISSQN.pas',
  GBFR.NFe.Model.Item.Imposto in '..\..\Source\NFe\GBFR.NFe.Model.Item.Imposto.pas',
  GBFR.NFe.Test.NFCe.OneItem.Stream in 'Source\GBFR.NFe.Test.NFCe.OneItem.Stream.pas',
  GBFR.NFe.Test.NFCePayments in 'Source\GBFR.NFe.Test.NFCePayments.pas';

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
