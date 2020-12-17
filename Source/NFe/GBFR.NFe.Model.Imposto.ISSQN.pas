unit GBFR.NFe.Model.Imposto.ISSQN;

interface

uses
  GBFR.NFe.Model.Types;

type TGBFRNFeModelISSQN = class
  private
    FvBC: Currency;
    FvISSQN: Currency;
    FvAliq: Currency;
    FcMunFG: String;
    FcListServ: String;
    FindISS: TNFeIndicadorExigilidadeISS;
    FindIncentivo: TNFeIndicadorIncentivoFiscal;

  public
    property vBC: Currency read FvBC write FvBC;
    property vISSQN: Currency read FvISSQN write FvISSQN;
    property vAliq: Currency read FvAliq write FvAliq;
    property cMunFG: String read FcMunFG write FcMunFG;
    property cListServ: String read FcListServ write FcListServ;
    property indISS: TNFeIndicadorExigilidadeISS read FindISS write FindISS;
    property indIncentivo: TNFeIndicadorIncentivoFiscal read FindIncentivo write FindIncentivo;

    constructor create;
end;

implementation

{ TGBFRNFeModelISSQN }

constructor TGBFRNFeModelISSQN.create;
begin
  indIncentivo := NFeIIFSim;
  indISS := NFeExigivel;
end;

end.
