unit GBFR.NFe.Model.Imposto.PIS;

interface

type TGBFRNFeModelPIS = class
  private
    FCST: String;
    FvBC: Currency;
    FpPIS: Double;
    FvPIS: Currency;

  public
    property CST: String read FCST write FCST;
    property vBC: Currency read FvBC write FvBC;
    property pPIS: Double read FpPIS write FpPIS;
    property vPIS: Currency read FvPIS write FvPIS;
end;

implementation

end.
