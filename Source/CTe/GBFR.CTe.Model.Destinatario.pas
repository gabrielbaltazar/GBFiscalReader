unit GBFR.CTe.Model.Destinatario;

interface

uses
  GBFR.CTe.Model.Endereco;

type TGBFRCTeModelDestinatario = class
  private
    FCNPJ: String;
    FIE: string;
    FIEST: String;
    FxNome: String;
    FxFant: String;
    FenderDest: TGBFRCTeModelEndereco;
    Ffone: String;
    FISUF: String;

  public
    property CNPJ: String read FCNPJ write FCNPJ;
    property IE: string read FIE write FIE;
    property IEST: String read FIEST write FIEST;
    property xNome: String read FxNome write FxNome;
    property xFant: String read FxFant write FxFant;
    property fone: String read Ffone write Ffone;
    property ISUF: String read FISUF write FISUF;
    property enderDest: TGBFRCTeModelEndereco read FenderDest write FenderDest;

    constructor create;
    destructor  Destroy; override;
end;

implementation

{ TGBFRCTeModelDestinatario }

constructor TGBFRCTeModelDestinatario.create;
begin
  FenderDest := TGBFRCTeModelEndereco.Create;
end;

destructor TGBFRCTeModelDestinatario.Destroy;
begin
  FenderDest.Free;
  inherited;
end;

end.

