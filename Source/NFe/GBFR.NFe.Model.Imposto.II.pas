unit GBFR.NFe.Model.Imposto.II;

interface

type TGBFRNFeModelII = class
  private
    FvBC: Currency;
    FvII: Currency;
    FvIOF: Currency;
    FCST: String;

  public
    property CST: String read FCST write FCST;
    property vBC: Currency read FvBC write FvBC;
    property vII: Currency read FvII write FvII;
    property vIOF: Currency read FvIOF write FvIOF;
end;

implementation

end.
