unit GBFR.CTe.Model.InfProt;

interface

uses
  GBFR.CTe.Model.Types;

type TGBFRCTeModelInfProt = class
  private
    FtpAmb: TCTeAmbiente;
    FverAplic: String;
    FchCTe: String;
    FdhRecbto: TDateTime;
    FnProt: String;
    FdigVal: String;
    FcStat: Integer;
    FxMotivo: String;

  public
    property tpAmb: TCTeAmbiente read FtpAmb write FtpAmb;
    property verAplic: String read FverAplic write FverAplic;
    property chCTe: String read FchCTe write FchCTe;
    property dhRecbto: TDateTime read FdhRecbto write FdhRecbto;
    property nProt: String read FnProt write FnProt;
    property digVal: String read FdigVal write FdigVal;
    property cStat: Integer read FcStat write FcStat;
    property xMotivo: String read FxMotivo write FxMotivo;
end;

implementation

end.
