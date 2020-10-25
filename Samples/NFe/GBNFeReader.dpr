program GBNFeReader;

uses
  Vcl.Forms,
  FNFeReader in 'FNFeReader.pas' {frmMain};

{$R *.res}

begin
  Application.Initialize;
  ReportMemoryLeaksOnShutdown   := True;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
