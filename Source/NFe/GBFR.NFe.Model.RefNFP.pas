unit GBFR.NFe.Model.RefNFP;

interface

type
  TGBFRNFeModelRefNFP = class
  private
    Faamm: string;
    FrefCte: string;
    Fcnpj: string;
    Fcpf: string;
    Fserie: string;
    Fie: string;
    FnNf: string;
    FcUf: string;
    Fmod: string;
  public
    property cUf: string read FcUf write FcUf;
    property aamm: string read Faamm write Faamm;
    property cnpj: string read Fcnpj write Fcnpj;
    property cpf: string read Fcpf write Fcpf;
    property ie: string read Fie write Fie;
    property &mod: string read Fmod write Fmod;
    property serie: string read Fserie write Fserie;
    property nNf: string read FnNf write FnNf;
    property refCte: string read FrefCte write FrefCte;
  end;

implementation

end.
