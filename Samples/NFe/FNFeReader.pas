unit FNFeReader;

interface

{$IFDEF WEAKPACKAGEUNIT}
  {$WEAKPACKAGEUNIT ON}
{$ENDIF}

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
    procedure writeNota(Value: TGBFRNFeModel);
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
  nfe    : TGBFRNFeModel;
begin
  xmlFile := lstFiles.Directory + '\' + lstFiles.Items[lstFiles.ItemIndex];
  nfe     := XMLNFeReader.loadFromFile(xmlFile);
  try
    writeNota(nfe);
  finally
    nfe.Free;
  end;
end;

procedure TfrmMain.writeNota(Value: TGBFRNFeModel);
var
  I: Integer;
begin
  with mmoNota.Lines do
  begin
    Clear;
    Add('Chave: '   + Value.protNFe.chNFe);
    Add('Protocolo: ' + Value.protNFe.nProt);
    Add('Numero: '  + Value.ide.nNF.ToString);
    Add('Codigo: '  + Value.ide.cNF);
    Add('Emissão: ' + FormatDateTime('dd/MM/yyyy', Value.ide.dhEmi));
    Add('');
    Add('Emitente: '     + Value.emit.xNome + ' ' + Value.emit.CNPJ);
    Add('Destinatario: ' + Value.dest.xNome);
    Add('');
    Add('Valor Total: '         + CurrToStr( Value.ICMSTot.vNF));
    Add('Totais dos Produtos: ' + CurrToStr( Value.ICMSTot.vProd));
    Add('');

    for I := 0 to Pred(Value.itens.Count) do
      Add('Produto: ' + Value.itens[i].prod.cProd + ' ' +
                        Value.itens[i].prod.xProd  + ' ' +
                        Value.itens[i].prod.qCom.ToString + ' ' +
                        CurrToStr( Value.itens[i].prod.vUnCom));

    for I := 0 to Pred(Value.itens.Count) do
      Add('IPI: ' + Value.itens[i].imposto.IPI.CST + ' ' +
                    CurrToStr(Value.itens[i].imposto.IPI.vBC)  + ' ' +
                    CurrToStr(Value.itens[i].imposto.IPI.pIPI) + ' ' +
                    CurrToStr(Value.itens[i].imposto.IPI.vIPI) + ' ' +
                    Value.itens[i].imposto.IPI.cEnq);

    for I := 0 to Pred(Value.itens.Count) do
      Add('II: ' +  CurrToStr(Value.itens[i].imposto.II.vBC)  + ' ' +
                    CurrToStr(Value.itens[i].imposto.II.vDespAdu) + ' ' +
                    CurrToStr(Value.itens[i].imposto.II.vII) + ' ' +
                    CurrToStr(Value.itens[i].imposto.II.vIOF));

    Add('');
    Add('Troco: ' + CurrToStr( Value.pag.vTroco) );
    Add('Pagamentos');
    for I := 0 to Pred(Value.pag.detPag.Count) do
      Add(CurrToStr( Value.pag.detPag[i].vPag) );
  end;
end;

end.
