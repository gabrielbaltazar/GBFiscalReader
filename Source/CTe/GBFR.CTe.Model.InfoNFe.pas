unit GBFR.CTe.Model.InfoNFe;

interface

type TGBFRCTeModelInfoNFe = class
  private
    Fchave: String;
    FPIN: String;
    FdPrev: TDateTime;

  public
    property chave: String read Fchave write Fchave;
    property PIN: String read FPIN write FPIN;
    property dPrev: TDateTime read FdPrev write FdPrev;
end;

implementation

end.
