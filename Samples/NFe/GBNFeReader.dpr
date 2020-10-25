program GBNFeReader;

uses
  Vcl.Forms,
  FNFeReader in 'FNFeReader.pas' {frmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
