unit GBFR.CTe.Model.Expedidor;

interface

uses
  GBFR.CTe.Model.Endereco;

type TGBFRCTeModelExpedidor = class
  private
    FCNPJ: String;
    FIE: string;
    FIEST: String;
    FxNome: String;
    FxFant: String;
    FenderExped: TGBFRCTeModelEndereco;
    Ffone: String;

  public
    property CNPJ: String read FCNPJ write FCNPJ;
    property IE: string read FIE write FIE;
    property IEST: String read FIEST write FIEST;
    property xNome: String read FxNome write FxNome;
    property xFant: String read FxFant write FxFant;
    property fone: String read Ffone write Ffone;
    property enderExped: TGBFRCTeModelEndereco read FenderExped write FenderExped;

    constructor create;
    destructor  Destroy; override;
end;

implementation

{ TGBFRCTeModelExpedidor }

constructor TGBFRCTeModelExpedidor.create;
begin
  FenderExped := TGBFRCTeModelEndereco.Create;
end;

destructor TGBFRCTeModelExpedidor.Destroy;
begin
  FenderExped.Free;
  inherited;
end;

end.

