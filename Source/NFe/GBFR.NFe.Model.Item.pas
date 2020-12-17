unit GBFR.NFe.Model.Item;

interface

uses
  GBFR.NFe.Model.Types,
  GBFR.NFe.Model.Item.Imposto;

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
    FCEST: String;
    FinfAdProd: String;
    FvDesc: Currency;
    FcBenef: String;
    FvFrete: Currency;
    FvSeg: Currency;
    FvOutro: Currency;
    FxPed: String;
    FnItemPed: String;
    Fimposto: TGBFRNFeItemImposto;

  public
    property nItem: Integer read FnItem write FnItem;
    property cProd: String read FcProd write FcProd;
    property cEAN: String read FcEAN write FcEAN;
    property xProd: String read FxProd write FxProd;
    property NCM: String read FNCM write FNCM;
    property CEST: String read FCEST write FCEST;
    property CFOP: String read FCFOP write FCFOP;
    property uCom: String read FuCom write FuCom;
    property qCom: Double read FqCom write FqCom;
    property vUnCom: Currency read FvUnCom write FvUnCom;
    property vDesc: Currency read FvDesc write FvDesc;
    property vFrete: Currency read FvFrete write FvFrete;
    property vSeg: Currency read FvSeg write FvSeg;
    property vOutro: Currency read FvOutro write FvOutro;
    property vProd: Currency read FvProd write FvProd;
    property cBenef: String read FcBenef write FcBenef;
    property cEANTrib: String read FcEANTrib write FcEANTrib;
    property uTrib: String read FuTrib write FuTrib;
    property qTrib: Double read FqTrib write FqTrib;
    property vUnTrib: Currency read FvUnTrib write FvUnTrib;
    property infAdProd: String read FinfAdProd write FinfAdProd;
    property xPed: String read FxPed write FxPed;
    property nItemPed: String read FnItemPed write FnItemPed;
    property indTot: TNFeIndicadorTotal read FindTot write FindTot;
    property imposto: TGBFRNFeItemImposto read Fimposto write Fimposto;

    constructor create;
    destructor  Destroy; override;
end;

implementation

{ TGBFRNFeModelItem }

constructor TGBFRNFeModelItem.create;
begin
  Fimposto := TGBFRNFeItemImposto.Create;
end;

destructor TGBFRNFeModelItem.Destroy;
begin
  Fimposto.Free;
  inherited;
end;

end.
