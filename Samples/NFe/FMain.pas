unit FMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.FileCtrl,
  Vcl.ExtCtrls,
  GBFR.NFe.XML.Interfaces;

type
  TfrmMain = class(TForm)
    pnlTop: TPanel;
    lstFiles: TFileListBox;
    mmoNota: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure lstFilesDblClick(Sender: TObject);
  private
    procedure writeNota(Value: TGBRFNFeModelNotaFiscal);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  lstFiles.Directory := ExtractFilePath(GetModuleName(HInstance)) + 'xmls\';
end;

procedure TfrmMain.lstFilesDblClick(Sender: TObject);
var
  xmlFile: string;
  nota   : TGBRFNFeModelNotaFiscal;
begin
  xmlFile := lstFiles.Directory + '\' + lstFiles.Items[lstFiles.ItemIndex];
  nota    := XMLNFeReader.loadFromFile(xmlFile);
  try
    writeNota(nota);
  finally
    nota.Free;
  end;
end;

procedure TfrmMain.writeNota(Value: TGBRFNFeModelNotaFiscal);
var
  I: Integer;
begin
  with mmoNota.Lines do
  begin
    Clear;
    Add('Chave: '   + Value.protNFe.chNFe);
    Add('Protocolo: ' + Value.protNFe.nProt);
    Add('Numero: '  + Value.nNF.ToString);
    Add('Codigo: '  + Value.cNF);
    Add('Emissão: ' + FormatDateTime('dd/MM/yyyy', Value.dhEmi));
    Add('');
    Add('Emitente: '     + Value.emit.xNome + ' ' + Value.emit.CNPJ);
    Add('Destinatario: ' + Value.dest.xNome);
    Add('');
    Add('Valor Total: '         + CurrToStr( Value.ICMSTot.vNF));
    Add('Totais dos Produtos: ' + CurrToStr( Value.ICMSTot.vProd));
    Add('');

    for I := 0 to Pred(Value.itens.Count) do
      Add('Produto: ' + Value.itens[i].cProd + ' ' +
                        Value.itens[i].xProd  + ' ' +
                        Value.itens[i].qCom.ToString + ' ' +
                        CurrToStr( Value.itens[i].vUnCom));
    Add('');
    Add('Troco: ' + CurrToStr( Value.pag.vTroco) );
    Add('Pagamentos');
    for I := 0 to Pred(Value.pag.detPag.Count) do
      Add(CurrToStr( Value.pag.detPag[i].vPag) );
  end;
end;

end.
