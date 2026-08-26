program GBFRNFeAvulsaTest;

{$IFNDEF TESTINSIGHT}
{$APPTYPE CONSOLE}
{$ENDIF}
{$STRONGLINKTYPES ON}
uses
  System.SysUtils,
  Winapi.ActiveX,
  {$IFDEF TESTINSIGHT}
  TestInsight.DUnitX,
  {$ENDIF }
  {$IFNDEF TESTINSIGHT}
  DUnitX.Loggers.Console,
  DUnitX.Loggers.Xml.NUnit,
  {$ENDIF }
  DUnitX.TestFramework,
  GBFR.NFe.Avulsa.Test in 'GBFR.NFe.Avulsa.Test.pas',
  GBFR.NFeAvulsa.Classes in '..\..\Source\NFeAvulsa\GBFR.NFeAvulsa.Classes.pas',
  GBFR.NFeAvulsa.XML.Interfaces in '..\..\Source\NFeAvulsa\GBFR.NFeAvulsa.XML.Interfaces.pas',
  GBFR.NFeAvulsa.XML.Default in '..\..\Source\NFeAvulsa\GBFR.NFeAvulsa.XML.Default.pas',
  GBFR.XML.Base in '..\..\Source\XML\GBFR.XML.Base.pas',
  GBFR.NFeAvulsa.Adapter in '..\..\Source\NFeAvulsa\GBFR.NFeAvulsa.Adapter.pas',
  GBFR.NFeAvulsa.Adapter.Test in 'GBFR.NFeAvulsa.Adapter.Test.pas',
  GBFR.NFe.Avulsa.Constants in 'GBFR.NFe.Avulsa.Constants.pas';

{ keep comment here to protect the following conditional from being removed by the IDE when adding a unit }
{$IFNDEF TESTINSIGHT}
var
  runner: ITestRunner;
  results: IRunResults;
  logger: ITestLogger;
  nunitLogger : ITestLogger;
{$ENDIF}
begin
  CoInitialize(nil);
  try
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
      if TDUnitX.Options.ExitBehavior = TDUnitXExitBehavior.Continue then
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
  finally
    CoUninitialize;
  end;
end.
