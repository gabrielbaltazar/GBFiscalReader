unit GBFR.NFe.Model.Imposto.ISSQN;

interface

type TGBFRNFeModelISSQN = class
  private
    FvBC: Currency;
    FvISSQN: Currency;
    FvAliq: Currency;

  public
    property vBC: Currency read FvBC write FvBC;
    property vISSQN: Currency read FvISSQN write FvISSQN;
    property vAliq: Currency read FvAliq write FvAliq;
end;

implementation

end.
