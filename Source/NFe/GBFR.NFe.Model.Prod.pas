unit GBFR.NFe.Model.Prod;

interface

uses
  GBFR.NFe.Model.DI,
  GBFR.NFe.Model.Types,
  System.Generics.Collections;

type
  TGBFRNFeModelProd = class
  private
    FcEANTrib: String;
    FcEAN: String;
    FxPed: String;
    FinfAdProd: String;
    FcProd: String;
    FnItemPed: String;
    FCEST: String;
    FqCom: Double;
    FvSeg: Currency;
    FvUnCom: Currency;
    FindTot: TNFeIndicadorTotal;
    FuCom: String;
    FCFOP: String;
    FNCM: String;
    FxProd: String;
    FvOutro: Currency;
    FvFrete: Currency;
    FvDesc: Currency;
    FqTrib: Double;
    FvUnTrib: Currency;
    FcBenef: String;
    FuTrib: String;
    FvProd: Currency;
    FDecImportacoes: TObjectList<TGBFRNFeModelDI>;

  public
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
    property DecImportacoes: TObjectList<TGBFRNFeModelDI> read FDecImportacoes write FDecImportacoes;

    constructor create;
    destructor  Destroy; override;
  end;

implementation

{ TGBFRNFeModelItemProd }

constructor TGBFRNFeModelProd.create;
begin
  FDecImportacoes := TObjectList<TGBFRNFeModelDI>.Create;
end;

destructor TGBFRNFeModelProd.Destroy;
begin
  FDecImportacoes.Free;
  inherited;
end;

end.
