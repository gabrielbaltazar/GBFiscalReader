unit GBFR.NFe.Model.ISSQNTot;

interface

type TGBFRNFeModelISSQNTot = class
  private
    FvServ: Currency;
    FvBC: Currency;
    FvISS: Currency;
    FvPIS: Currency;
    FvCOFINS: Currency;
    FdCompet: TDateTime;

  public
    property vServ: Currency read FvServ write FvServ;
    property vBC: Currency read FvBC write FvBC;
    property vISS: Currency read FvISS write FvISS;
    property vPIS: Currency read FvPIS write FvPIS;
    property vCOFINS: Currency read FvCOFINS write FvCOFINS;
    property dCompet: TDateTime read FdCompet write FdCompet;
end;

implementation

end.
