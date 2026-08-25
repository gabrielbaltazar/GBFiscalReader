unit GBFR.NFe.Model.RefNFe;

interface

{$IFDEF WEAKPACKAGEUNIT}
  {$WEAKPACKAGEUNIT ON}
{$ENDIF}

type
  TGBFRNFeModelRefNFe = class
  private
    FrefNFe: String;
  public
    property refNFe: String read FrefNFe write FrefNFe;
  end;

implementation

end.
