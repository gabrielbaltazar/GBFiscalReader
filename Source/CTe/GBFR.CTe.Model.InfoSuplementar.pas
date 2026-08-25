unit GBFR.CTe.Model.InfoSuplementar;

interface

{$IFDEF WEAKPACKAGEUNIT}
  {$WEAKPACKAGEUNIT ON}
{$ENDIF}

type TGBFRCTeModelInfoSuplementar = class
  private
    FqrCodCTe: String;

  public
    property qrCodCTe: String read FqrCodCTe write FqrCodCTe;
end;

implementation

end.
