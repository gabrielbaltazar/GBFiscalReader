unit GBFR.NFe.Model.InfAdic;

interface

type TGBFRNFeModelInfAdic = class
  private
    FinfCpl: string;
    FinfAdFisco: String;

  public
    property infAdFisco: String read FinfAdFisco write FinfAdFisco;
    property infCpl: string read FinfCpl write FinfCpl;

end;

implementation

end.
