program GBReaderNFe;

uses
  Vcl.Forms,
  FMain in 'FMain.pas' {Form1},
  GBFR.NFe.Model.ProtocoloNFe in '..\..\Source\NFe\GBFR.NFe.Model.ProtocoloNFe.pas',
  GBFR.NFe.Types in '..\..\Source\NFe\GBFR.NFe.Types.pas',
  GBFR.NFe.Model.NotaFiscal in '..\..\Source\NFe\GBFR.NFe.Model.NotaFiscal.pas',
  GBFR.NFe.Model.Emitente in '..\..\Source\NFe\GBFR.NFe.Model.Emitente.pas',
  GBFR.NFe.Model.Endereco in '..\..\Source\NFe\GBFR.NFe.Model.Endereco.pas',
  GBFR.NFe.Model.Destinatario in '..\..\Source\NFe\GBFR.NFe.Model.Destinatario.pas',
  GBFR.NFe.Model.ICMSTot in '..\..\Source\NFe\GBFR.NFe.Model.ICMSTot.pas',
  GBFR.NFe.Model.Item in '..\..\Source\NFe\GBFR.NFe.Model.Item.pas',
  GBFR.NFe.Model.Imposto.ICMS in '..\..\Source\NFe\GBFR.NFe.Model.Imposto.ICMS.pas',
  GBFR.NFe.Model.Imposto.COFINS in '..\..\Source\NFe\GBFR.NFe.Model.Imposto.COFINS.pas',
  GBFR.NFe.Model.Imposto.PIS in '..\..\Source\NFe\GBFR.NFe.Model.Imposto.PIS.pas',
  GBFR.NFe.Model.Pagamento in '..\..\Source\NFe\GBFR.NFe.Model.Pagamento.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
