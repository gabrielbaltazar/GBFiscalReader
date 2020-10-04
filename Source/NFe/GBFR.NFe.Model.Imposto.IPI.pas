unit GBFR.NFe.Model.Imposto.IPI;

interface

type TGBFRNFeModelIPI = class
  private
    FCST: String;
    FvBC: Currency;
    FpIPI: Currency;
    FvIPI: Currency;
    FcEnq: String;

  public
    property CST: String read FCST write FCST;
    property vBC: Currency read FvBC write FvBC;
    property pIPI: Currency read FpIPI write FpIPI;
    property vIPI: Currency read FvIPI write FvIPI;
    property cEnq: String read FcEnq write FcEnq;
end;

implementation

end.
