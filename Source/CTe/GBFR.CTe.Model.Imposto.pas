unit GBFR.CTe.Model.Imposto;

interface

uses
  GBFR.CTe.Model.Imposto.ICMS;

type TGBFRCTeModelImposto = class
  private
    FvTotTrib: Currency;
    FinfAdFisco: String;
    FICMS: TGBFRCTeModelImpostoICMS;

  public
    property vTotTrib: Currency read FvTotTrib write FvTotTrib;
    property infAdFisco: String read FinfAdFisco write FinfAdFisco;
    property ICMS: TGBFRCTeModelImpostoICMS read FICMS write FICMS;

    constructor create;
    destructor  Destroy; override;
end;

implementation

{ TGBFRCTeModelImposto }

constructor TGBFRCTeModelImposto.create;
begin
  FICMS := TGBFRCTeModelImpostoICMS.Create;
end;

destructor TGBFRCTeModelImposto.Destroy;
begin
  FICMS.Free;
  inherited;
end;

end.
