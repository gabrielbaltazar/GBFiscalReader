unit GBFR.NFe.Model.ResponsavelTecnico;

interface

type TGBFRNFeModelResponsavelTecnico = class
  private
    FCNPJ: String;
    FxContato: String;
    Femail: String;
    Ffone: String;

  public
    property CNPJ: String read FCNPJ write FCNPJ;
    property xContato: String read FxContato write FxContato;
    property email: String read Femail write Femail;
    property fone: String read Ffone write Ffone;
end;

implementation

end.
