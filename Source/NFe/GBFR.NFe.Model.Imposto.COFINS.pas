unit GBFR.NFe.Model.Imposto.COFINS;

interface

type TGBFRNFeModelCOFINS = class
  private
    FCST: string;
    FpCOFINS: Currency;
    FvCofins: Currency;
    FvBC: Currency;

  public
    property CST: string read FCST write FCST;
    property pCOFINS: Currency read FpCOFINS write FpCOFINS;
    property vCOFINS: Currency read FvCofins write FvCofins;
    property vBC: Currency read FvBC write FvBC;
end;

implementation

end.
