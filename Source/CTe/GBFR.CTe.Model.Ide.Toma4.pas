unit GBFR.CTe.Model.Ide.Toma4;

interface

uses
  GBFR.CTe.Model.Types;

type TGBFRCTeModelIdeToma4 = class
  private
    Ftoma: TCTeTomadorServico;
    FCNPJ: String;
    FCPF: string;
    FIE: String;
    FxNome: String;
    FxFant: String;
    Ffone: String;

  public
    property toma: TCTeTomadorServico read Ftoma write Ftoma;
    property CNPJ: String read FCNPJ write FCNPJ;
    property CPF: string read FCPF write FCPF;
    property IE: String read FIE write FIE;
    property xNome: String read FxNome write FxNome;
    property xFant: String read FxFant write FxFant;
    property fone: String read Ffone write Ffone;
end;

implementation

end.
