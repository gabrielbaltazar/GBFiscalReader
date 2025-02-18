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
  GBFR.NFe.Test.NFCe.OneItem in 'Source\GBFR.NFe.Test.NFCe.OneItem.pas',
  GBFR.NFe.Test.NFeReferenciada in 'Source\GBFR.NFe.Test.NFeReferenciada.pas',
  GBFR.NFe.Test.NFCeMoreItems in 'Source\GBFR.NFe.Test.NFCeMoreItems.pas' {/},
  GBFR.NFe.Test.NFeComISSQN in 'Source\GBFR.NFe.Test.NFeComISSQN.pas',
  GBFR.NFe.Test.NFCe.OneItem.Stream in 'Source\GBFR.NFe.Test.NFCe.OneItem.Stream.pas',
  GBFR.NFe.Test.NFCePayments in 'Source\GBFR.NFe.Test.NFCePayments.pas',
  GBFR.NFe.Test.NFCe.Cancelled in 'Source\GBFR.NFe.Test.NFCe.Cancelled.pas';

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
