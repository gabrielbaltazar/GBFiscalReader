unit GBFR.NFe.Model.ImpostoDevol.IPI;

interface

{$IFDEF WEAKPACKAGEUNIT}
  {$WEAKPACKAGEUNIT ON}
{$ENDIF}

type
  TGBFRNFeModelIPIDevol = class
  private
    FvIPIDevol: Currency;
  public
    property vIPIDevol: Currency read FvIPIDevol write FvIPIDevol;
  end;

implementation

end.
