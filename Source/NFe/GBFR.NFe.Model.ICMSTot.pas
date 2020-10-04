unit GBFR.NFe.Model.ICMSTot;

interface

type TGBFRNFeModelICMSTot = class
  private
    FvBC: Currency;
    FvICMS: Currency;
    FvICMSDeson: Currency;
    FvFCP: Currency;
    FvBCST: Currency;
    FvST: Currency;
    FvFCPST: Currency;
    FvFCPSTRet: Currency;
    FvProd: Currency;
    FvFrete: Currency;
    FvSeg: Currency;
    FvDesc: Currency;
    FvII: Currency;
    FvIPI: Currency;
    FvIPIDevol: Currency;
    FvPIS: Currency;
    FvCOFINS: Currency;
    FvOutro: Currency;
    FvNF: Currency;

  public
    property vBC: Currency read FvBC write FvBC;
    property vICMS: Currency read FvICMS write FvICMS;
    property vICMSDeson: Currency read FvICMSDeson write FvICMSDeson;
    property vFCP: Currency read FvFCP write FvFCP;
    property vBCST: Currency read FvBCST write FvBCST;
    property vST: Currency read FvST write FvST;
    property vFCPST: Currency read FvFCPST write FvFCPST;
    property vFCPSTRet: Currency read FvFCPSTRet write FvFCPSTRet;
    property vProd: Currency read FvProd write FvProd;
    property vFrete: Currency read FvFrete write FvFrete;
    property vSeg: Currency read FvSeg write FvSeg;
    property vDesc: Currency read FvDesc write FvDesc;
    property vII: Currency read FvII write FvII;
    property vIPI: Currency read FvIPI write FvIPI;
    property vIPIDevol: Currency read FvIPIDevol write FvIPIDevol;
    property vPIS: Currency read FvPIS write FvPIS;
    property vCOFINS: Currency read FvCOFINS write FvCOFINS;
    property vOutro: Currency read FvOutro write FvOutro;
    property vNF: Currency read FvNF write FvNF;
end;

implementation

end.
