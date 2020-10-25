unit GBFR.CTe.Model.InfoQuantidade;

interface

uses
  GBFR.CTe.Model.Types;

type TGBFRCTeModelInfoQuantidade = class
  private
    FcUnid: TCTeUnidadeMedida;
    FtpMed: String;
    FqCarga: Currency;

  public
    property cUnid: TCTeUnidadeMedida read FcUnid write FcUnid;
    property tpMed: String read FtpMed write FtpMed;
    property qCarga: Currency read FqCarga write FqCarga;
end;

implementation

end.
