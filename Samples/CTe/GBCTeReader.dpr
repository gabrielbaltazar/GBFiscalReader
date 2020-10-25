program GBCTeReader;

uses
  Vcl.Forms,
  FCTeReader in 'FCTeReader.pas' {frmCTeReader};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCTeReader, frmCTeReader);
  Application.Run;
end.
