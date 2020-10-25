unit GBFR.CTe.Model.Imposto.ICMS;

interface

type TGBFRCTeModelImpostoICMS = class
  private
    FCST: String;
    FvBC: Currency;
    FpICMS: Currency;
    FvICMS: Currency;
    FpRedBC: Currency;
    FvCred: Currency;
    FpRedBCOutraUF: Currency;
    FvBCOutraUF: Currency;
    FpICMSOutraUF: Currency;
    FvICMSOutraUF: Currency;
    FindSN: Boolean;

  public
    property CST: String read FCST write FCST;
    property vBC: Currency read FvBC write FvBC;
    property pICMS: Currency read FpICMS write FpICMS;
    property vICMS: Currency read FvICMS write FvICMS;
    property pRedBC: Currency read FpRedBC write FpRedBC;
    property vCred: Currency read FvCred write FvCred;
    property pRedBCOutraUF: Currency read FpRedBCOutraUF write FpRedBCOutraUF;
    property vBCOutraUF: Currency read FvBCOutraUF write FvBCOutraUF;
    property pICMSOutraUF: Currency read FpICMSOutraUF write FpICMSOutraUF;
    property vICMSOutraUF: Currency read FvICMSOutraUF write FvICMSOutraUF;
    property indSN: Boolean read FindSN write FindSN;
end;

implementation

end.
