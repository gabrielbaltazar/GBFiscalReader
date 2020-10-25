unit FCTeReader;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.FileCtrl,
  Vcl.ExtCtrls,
  GBFR.CTe.XML.Interfaces;

type
  TfrmCTeReader = class(TForm)
    pnlTop: TPanel;
    lstFiles: TFileListBox;
    mmoNota: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure lstFilesDblClick(Sender: TObject);
  private
    procedure writeCTe(Value: TGBFRCTeModel);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCTeReader: TfrmCTeReader;

implementation

{$R *.dfm}

procedure TfrmCTeReader.FormCreate(Sender: TObject);
begin
  lstFiles.Directory := ExtractFilePath(GetModuleName(HInstance)) + 'xmls\';
end;

procedure TfrmCTeReader.lstFilesDblClick(Sender: TObject);
var
  xmlFile: string;
  cte    : TGBFRCTeModel;
begin
  xmlFile := lstFiles.Directory + '\' + lstFiles.Items[lstFiles.ItemIndex];
  cte     := XMLCTeReader.loadFromFile(xmlFile);
  try
    writeCTe(cte);
  finally
    cte.Free;
  end;
end;

procedure TfrmCTeReader.writeCTe(Value: TGBFRCTeModel);
begin
  with mmoNota.Lines do
  begin
    Clear;
    Add('Chave: '   + Value.infProt.chCTe);
    Add('Protocolo: ' + Value.infProt.nProt);
    Add('Numero: '  + Value.ide.nCT.ToString);
    Add('Codigo: '  + Value.ide.cCT);
    Add('Emissão: ' + FormatDateTime('dd/MM/yyyy', Value.ide.dhEmi));
    Add('');
    Add('Emitente: '     + Value.emit.xNome + ' ' + Value.emit.CNPJ);
    Add('Destinatario: ' + Value.dest.xNome);
    Add('');
    Add('Valor Total: '         + CurrToStr( Value.vPrest.vTPrest));
    Add('');
  end;
end;

end.
