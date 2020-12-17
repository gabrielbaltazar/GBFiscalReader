unit GBFR.NFe.Model.Item.Imposto;

interface

uses
  GBFR.NFe.Model.Imposto.ICMS,
  GBFR.NFe.Model.Imposto.PIS,
  GBFR.NFe.Model.Imposto.COFINS,
  GBFR.NFe.Model.Imposto.II,
  GBFR.NFe.Model.Imposto.ISSQN,
  GBFR.NFe.Model.Imposto.IPI;

type TGBFRNFeItemImposto = class
  private
    FII: TGBFRNFeModelII;
    FICMS: TGBFRNFeModelICMS;
    FISSQN: TGBFRNFeModelISSQN;
    FPIS: TGBFRNFeModelPIS;
    FCOFINS: TGBFRNFeModelCOFINS;
    FIPI: TGBFRNFeModelIPI;
    FvTotTrib: Currency;

  public
    property vTotTrib: Currency read FvTotTrib write FvTotTrib;
    property ICMS: TGBFRNFeModelICMS read FICMS write FICMS;
    property PIS: TGBFRNFeModelPIS read FPIS write FPIS;
    property COFINS: TGBFRNFeModelCOFINS read FCOFINS write FCOFINS;
    property IPI: TGBFRNFeModelIPI read FIPI write FIPI;
    property II: TGBFRNFeModelII read FII write FII;
    property ISSQN: TGBFRNFeModelISSQN read FISSQN write FISSQN;

    constructor create;
    destructor Destroy; override;
end;

implementation

{ TGBFRNFeItemImposto }

constructor TGBFRNFeItemImposto.create;
begin
  FICMS   := TGBFRNFeModelICMS.Create;
  FPIS    := TGBFRNFeModelPIS.Create;
  FCOFINS := TGBFRNFeModelCOFINS.Create;
  FIPI    := TGBFRNFeModelIPI.Create;
  FISSQN  := TGBFRNFeModelISSQN.Create;
  FII     := TGBFRNFeModelII.Create;
end;

destructor TGBFRNFeItemImposto.Destroy;
begin
  FICMS.Free;
  FPIS.Free;
  FCOFINS.Free;
  FIPI.Free;
  FISSQN.Free;
  FII.Free;
  inherited;
end;

end.
