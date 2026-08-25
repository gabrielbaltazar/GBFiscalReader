unit GBFR.NFe.Model.Fatura;

interface

{$IFDEF WEAKPACKAGEUNIT}
  {$WEAKPACKAGEUNIT ON}
{$ENDIF}

type TGBFRNFeModelFatura = class
  private
    FnFat: string;
    FvOrig: Currency;
    FvDesc: Currency;
    FvLiq: Currency;

  public
    property nFat: string read FnFat write FnFat;
    property vOrig: Currency read FvOrig write FvOrig;
    property vDesc: Currency read FvDesc write FvDesc;
    property vLiq: Currency read FvLiq write FvLiq;

    constructor create;
    destructor  Destroy; override;
end;

implementation

{ TGBFRNFeModelFatura }

constructor TGBFRNFeModelFatura.create;
begin
end;

destructor TGBFRNFeModelFatura.Destroy;
begin
  inherited;
end;

end.
