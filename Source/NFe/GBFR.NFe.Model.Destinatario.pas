unit GBFR.NFe.Model.Destinatario;

interface

uses
  GBFR.NFe.Types,
  GBFR.NFe.Model.Endereco;

type TGBFRNFeModelDestinatario = class
  private
    FCNPJ: String;
    FCPF: String;
    FidEstrangeiro: string;
    FxNome: String;
    FindIEDest: TNFeIndicadorIE;
    FIE: String;
    FISUF: String;
    FIM: string;
    Femail: String;
    FenderDest: TGBFRNFeModelEndereco;

  public
    property CNPJ: String read FCNPJ write FCNPJ;
    property CPF: String read FCPF write FCPF;
    property idEstrangeiro: string read FidEstrangeiro write FidEstrangeiro;
    property xNome: String read FxNome write FxNome;
    property indIEDest: TNFeIndicadorIE read FindIEDest write FindIEDest;
    property IE: String read FIE write FIE;
    property ISUF: String read FISUF write FISUF;
    property IM: string read FIM write FIM;
    property email: String read Femail write Femail;
    property enderDest: TGBFRNFeModelEndereco read FenderDest write FenderDest;

    constructor create;
    destructor  Destroy; override;
end;

implementation

{ TGBFRNFeModelDestinatario }

constructor TGBFRNFeModelDestinatario.create;
begin
  FenderDest := TGBFRNFeModelEndereco.Create;
end;

destructor TGBFRNFeModelDestinatario.Destroy;
begin
  FenderDest.Free;
  inherited;
end;

end.
