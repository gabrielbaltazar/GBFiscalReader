unit GBFR.NFe.Model.Endereco;

interface

type TGBFRNFeModelEndereco = class
  private
    FxLgr: String;
    Fnro: String;
    FxBairro: String;
    FcMun: String;
    FxMun: string;
    FUF: String;
    FCEP: String;
    FcPais: String;
    FxPais: String;
    Ffone: String;
    FxCompl: String;

  public
    property xLgr: String read FxLgr write FxLgr;
    property nro: String read Fnro write Fnro;
    property xCompl: String read FxCompl write FxCompl;
    property xBairro: String read FxBairro write FxBairro;
    property cMun: String read FcMun write FcMun;
    property xMun: string read FxMun write FxMun;
    property UF: String read FUF write FUF;
    property CEP: String read FCEP write FCEP;
    property cPais: String read FcPais write FcPais;
    property xPais: String read FxPais write FxPais;
    property fone: String read Ffone write Ffone;
end;

implementation

end.
