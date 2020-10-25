unit GBFR.CTe.Model.Emitente;

interface

uses
  GBFR.CTe.Model.Endereco;

type TGBFRCTeModelEmitente = class
  private
    FCNPJ: String;
    FIE: string;
    FIEST: String;
    FxNome: String;
    FxFant: String;
    FenderEmit: TGBFRCTeModelEndereco;

  public
    property CNPJ: String read FCNPJ write FCNPJ;
    property IE: string read FIE write FIE;
    property IEST: String read FIEST write FIEST;
    property xNome: String read FxNome write FxNome;
    property xFant: String read FxFant write FxFant;
    property enderEmit: TGBFRCTeModelEndereco read FenderEmit write FenderEmit;

    constructor create;
    destructor  Destroy; override;
end;

implementation

{ TGBFRCTeModelEmitente }

constructor TGBFRCTeModelEmitente.create;
begin
  FenderEmit := TGBFRCTeModelEndereco.Create;
end;

destructor TGBFRCTeModelEmitente.Destroy;
begin
  FenderEmit.Free;
  inherited;
end;

end.
