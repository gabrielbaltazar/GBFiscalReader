unit GBFR.CTe.Model.Remetente;

interface

uses
  GBFR.CTe.Model.Endereco;

type TGBFRCTeModelRemetente = class
  private
    FCNPJ: String;
    FIE: string;
    FIEST: String;
    FxNome: String;
    FxFant: String;
    FenderReme: TGBFRCTeModelEndereco;
    Ffone: String;

  public
    property CNPJ: String read FCNPJ write FCNPJ;
    property IE: string read FIE write FIE;
    property IEST: String read FIEST write FIEST;
    property xNome: String read FxNome write FxNome;
    property xFant: String read FxFant write FxFant;
    property fone: String read Ffone write Ffone;
    property enderReme: TGBFRCTeModelEndereco read FenderReme write FenderReme;

    constructor create;
    destructor  Destroy; override;
end;

implementation

{ TGBFRCTeModelRemetente }

constructor TGBFRCTeModelRemetente.create;
begin
  FenderReme := TGBFRCTeModelEndereco.Create;
end;

destructor TGBFRCTeModelRemetente.Destroy;
begin
  FenderReme.Free;
  inherited;
end;

end.

