unit GBFR.NFe.Model.Protocolo;

interface

uses
  GBFR.NFe.Model.Types;

type TGBFRNFeModelProtocolo = class
  private
    FchNFe: String;
    FnProt: String;
    FdhRecbto: TDateTime;
    FdigVal: String;
    FcStat: Integer;
    FxMotivo: String;
    FtpAmb: TNFeAmbiente;
    FverAplic: String;

  public
    property tpAmb: TNFeAmbiente read FtpAmb write FtpAmb;
    property verAplic: String read FverAplic write FverAplic;
    property chNFe: String read FchNFe write FchNFe;
    property nProt: String read FnProt write FnProt;
    property dhRecbto: TDateTime read FdhRecbto write FdhRecbto;
    property digVal: String read FdigVal write FdigVal;
    property cStat: Integer read FcStat write FcStat;
    property xMotivo: String read FxMotivo write FxMotivo;

end;

implementation

end.
