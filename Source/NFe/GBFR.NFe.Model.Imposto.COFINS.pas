unit GBFR.NFe.Model.Imposto.COFINS;

interface

type TGBFRNFeModelCOFINS = class
  private
    FCST: string;
    FpCOFINS: Double;
    FvCofins: Currency;
    FvBC: Currency;

  public
    property CST: string read FCST write FCST;
    property pCOFINS: Double read FpCOFINS write FpCOFINS;
    property vCOFINS: Currency read FvCofins write FvCofins;
    property vBC: Currency read FvBC write FvBC;
end;

implementation

end.
