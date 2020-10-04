unit FMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.FileCtrl,
  Vcl.ExtCtrls,
  GBFR.NFe.XML.Interfaces,
  GBFR.NFe.Model.NotaFiscal;

type
  TfrmMain = class(TForm)
    pnlTop: TPanel;
    lstFiles: TFileListBox;
    mmoNota: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure lstFilesDblClick(Sender: TObject);
  private
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
  lstFiles.Directory := ExtractFilePath(GetModuleName(HInstance));
end;

procedure TfrmMain.lstFilesDblClick(Sender: TObject);
begin
//
end;

end.
