unit GBFR.NFe.Model.Imposto.II;

interface

type TGBFRNFeModelII = class
  private
    FvBC: Currency;
    FvII: Currency;
    FvIOF: Currency;
    FvDespAdu: Currency;

  public
    property vBC: Currency read FvBC write FvBC;
    property vDespAdu: Currency read FvDespAdu write FvDespAdu;
    property vII: Currency read FvII write FvII;
    property vIOF: Currency read FvIOF write FvIOF;
end;

implementation

end.
