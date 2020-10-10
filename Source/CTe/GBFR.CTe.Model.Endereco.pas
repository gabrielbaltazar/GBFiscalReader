unit GBFR.CTe.Model.Endereco;

interface

type TGBFRCTeModelEndereco = class
  private
    FxLgr: String;
    Fnro: String;
    FxCpl: String;
    FxBairro: String;
    FcMun: String;
    FxMun: String;
    FCEP: String;
    FUF: String;
    Ffone: String;

  public
    property xLgr: String read FxLgr write FxLgr;
    property nro: String read Fnro write Fnro;
    property xCpl: String read FxCpl write FxCpl;
    property xBairro: String read FxBairro write FxBairro;
    property cMun: String read FcMun write FcMun;
    property xMun: String read FxMun write FxMun;
    property CEP: String read FCEP write FCEP;
    property UF: String read FUF write FUF;
    property fone: String read Ffone write Ffone;
end;

implementation

end.
