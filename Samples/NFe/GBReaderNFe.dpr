program GBReaderNFe;

uses
  Vcl.Forms,
  FMain in 'FMain.pas' {Form1},
  GBFR.NFe.Model.Protocolo in '..\..\Source\NFe\GBFR.NFe.Model.Protocolo.pas',
  GBFR.NFe.Model.Types in '..\..\Source\NFe\GBFR.NFe.Model.Types.pas',
  GBFR.NFe.Model.NotaFiscal in '..\..\Source\NFe\GBFR.NFe.Model.NotaFiscal.pas',
  GBFR.NFe.Model.Emitente in '..\..\Source\NFe\GBFR.NFe.Model.Emitente.pas',
  GBFR.NFe.Model.Endereco in '..\..\Source\NFe\GBFR.NFe.Model.Endereco.pas',
  GBFR.NFe.Model.Destinatario in '..\..\Source\NFe\GBFR.NFe.Model.Destinatario.pas',
  GBFR.NFe.Model.ICMSTot in '..\..\Source\NFe\GBFR.NFe.Model.ICMSTot.pas',
  GBFR.NFe.Model.Item in '..\..\Source\NFe\GBFR.NFe.Model.Item.pas',
  GBFR.NFe.Model.Imposto.ICMS in '..\..\Source\NFe\GBFR.NFe.Model.Imposto.ICMS.pas',
  GBFR.NFe.Model.Imposto.COFINS in '..\..\Source\NFe\GBFR.NFe.Model.Imposto.COFINS.pas',
  GBFR.NFe.Model.Imposto.PIS in '..\..\Source\NFe\GBFR.NFe.Model.Imposto.PIS.pas',
  GBFR.NFe.Model.FormaPagamento in '..\..\Source\NFe\GBFR.NFe.Model.FormaPagamento.pas',
  GBFR.NFe.Model.ResponsavelTecnico in '..\..\Source\NFe\GBFR.NFe.Model.ResponsavelTecnico.pas',
  GBFR.XML.Base in '..\..\Source\XML\GBFR.XML.Base.pas',
  GBFR.NFe.XML.Interfaces in '..\..\Source\NFe\GBFR.NFe.XML.Interfaces.pas',
  GBFR.NFe.XML.Default in '..\..\Source\NFe\GBFR.NFe.XML.Default.pas',
  GBFR.NFe.Model.Pagamento in '..\..\Source\NFe\GBFR.NFe.Model.Pagamento.pas',
  GBFR.NFe.Model.Imposto.IPI in '..\..\Source\NFe\GBFR.NFe.Model.Imposto.IPI.pas',
  GBFR.NFe.Model.ISSQN in '..\..\Source\NFe\GBFR.NFe.Model.ISSQN.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
