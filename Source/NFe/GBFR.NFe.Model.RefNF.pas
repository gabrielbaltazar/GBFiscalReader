unit GBFR.NFe.Model.RefNF;

interface

type
  TGBFRNFeModelRefNF = class
  private
    Faamm: string;
    Fcnpj: string;
    Fserie: string;
    FnNf: string;
    FcUf: string;
    Fmod: string;
  public
    property cUf: string read FcUf write FcUf;
    property aamm: string read Faamm write Faamm;
    property cnpj: string read Fcnpj write Fcnpj;
    property &mod: string read Fmod write Fmod;
    property serie: string read Fserie write Fserie;
    property nNf: string read FnNf write FnNf;
  end;

implementation

end.
