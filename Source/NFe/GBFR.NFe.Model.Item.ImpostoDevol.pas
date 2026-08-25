unit GBFR.NFe.Model.Item.ImpostoDevol;

interface

{$IFDEF WEAKPACKAGEUNIT}
  {$WEAKPACKAGEUNIT ON}
{$ENDIF}

uses
  GBFR.NFe.Model.ImpostoDevol.IPI;

type
  TGBFRNFeItemImpostoDevol = class
  private
    FpDevol: Currency;
    FIPI: TGBFRNFeModelIPIDevol;

  public
    property pDevol: Currency read FpDevol write FpDevol;
    property IPI: TGBFRNFeModelIPIDevol read FIPI write FIPI;

    constructor create;
    destructor Destroy; override;
  end;

implementation

{ TGBFRNFeItemImpostoDevol }

constructor TGBFRNFeItemImpostoDevol.create;
begin
  FIPI := TGBFRNFeModelIPIDevol.Create;
end;

destructor TGBFRNFeItemImpostoDevol.Destroy;
begin
  FIPI.Free;
  inherited;
end;

end.
