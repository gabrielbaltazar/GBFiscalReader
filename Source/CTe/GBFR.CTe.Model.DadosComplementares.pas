unit GBFR.CTe.Model.DadosComplementares;

interface

type TGBFRCTeModelDadosComplementares = class
  private
    FxCaracAd: String;
    FxCaracSer: String;
    FxEmi: String;
    ForigCalc: String;
    FdestCalc: String;
    FxObs: String;

  public
    property xCaracAd: String read FxCaracAd write FxCaracAd;
    property xCaracSer: String read FxCaracSer write FxCaracSer;
    property xEmi: String read FxEmi write FxEmi;
    property origCalc: String read ForigCalc write ForigCalc;
    property destCalc: String read FdestCalc write FdestCalc;
    property xObs: String read FxObs write FxObs;
end;

implementation

end.
