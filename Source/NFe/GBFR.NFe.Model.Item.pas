unit GBFR.NFe.Model.Item;

interface

uses
  GBFR.NFe.Model.Types,
  GBFR.NFe.Model.Imposto.ICMS,
  GBFR.NFe.Model.Imposto.PIS,
  GBFR.NFe.Model.Imposto.COFINS,
  GBFR.NFe.Model.Imposto.II,
  GBFR.NFe.Model.Imposto.ISSQN,
  GBFR.NFe.Model.Imposto.IPI;

type TGBFRNFeModelItem = class
  private
    FnItem: Integer;
    FcProd: String;
    FcEAN: String;
    FxProd: String;
    FNCM: String;
    FCFOP: String;
    FuCom: String;
    FqCom: Double;
    FvUnCom: Currency;
    FvProd: Currency;
    FcEANTrib: String;
    FuTrib: String;
    FqTrib: Double;
    FvUnTrib: Currency;
    FindTot: TNFeIndicadorTotal;
    FICMS: TGBFRNFeModelICMS;
    FPIS: TGBFRNFeModelPIS;
    FCOFINS: TGBFRNFeModelCOFINS;
    FIPI: TGBFRNFeModelIPI;
    FII: TGBFRNFeModelII;
    FISSQN: TGBFRNFeModelISSQN;

  public
    property nItem: Integer read FnItem write FnItem;
    property cProd: String read FcProd write FcProd;
    property cEAN: String read FcEAN write FcEAN;
    property xProd: String read FxProd write FxProd;
    property NCM: String read FNCM write FNCM;
    property CFOP: String read FCFOP write FCFOP;
    property uCom: String read FuCom write FuCom;
    property qCom: Double read FqCom write FqCom;
    property vUnCom: Currency read FvUnCom write FvUnCom;
    property vProd: Currency read FvProd write FvProd;
    property cEANTrib: String read FcEANTrib write FcEANTrib;
    property uTrib: String read FuTrib write FuTrib;
    property qTrib: Double read FqTrib write FqTrib;
    property vUnTrib: Currency read FvUnTrib write FvUnTrib;
    property indTot: TNFeIndicadorTotal read FindTot write FindTot;
    property ICMS: TGBFRNFeModelICMS read FICMS write FICMS;
    property PIS: TGBFRNFeModelPIS read FPIS write FPIS;
    property COFINS: TGBFRNFeModelCOFINS read FCOFINS write FCOFINS;
    property IPI: TGBFRNFeModelIPI read FIPI write FIPI;
    property II: TGBFRNFeModelII read FII write FII;
    property ISSQN: TGBFRNFeModelISSQN read FISSQN write FISSQN;

    constructor create;
    destructor  Destroy; override;
end;

implementation

{ TGBFRNFeModelItem }

constructor TGBFRNFeModelItem.create;
begin
  FICMS   := TGBFRNFeModelICMS.Create;
  FPIS    := TGBFRNFeModelPIS.Create;
  FCOFINS := TGBFRNFeModelCOFINS.Create;
  FIPI    := TGBFRNFeModelIPI.Create;
  FISSQN  := TGBFRNFeModelISSQN.Create;
  FII     := TGBFRNFeModelII.Create;
end;

destructor TGBFRNFeModelItem.Destroy;
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
