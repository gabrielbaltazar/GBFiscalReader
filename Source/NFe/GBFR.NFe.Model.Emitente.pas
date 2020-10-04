unit GBFR.NFe.Model.Emitente;

interface

uses
  GBFR.NFe.Types,
  GBFR.NFe.Model.Endereco;

type TGBFRNFeModelEmitente = class
  private
    FCNPJ: String;
    FxNome: String;
    FxFant: String;
    FIE: String;
    FIM: String;
    FCNAE: String;
    FCRT: TNFeCRT;
    FenderEmit: TGBFRNFeModelEndereco;
    FIEST: String;
    FCPF: String;

  public
    property CNPJ: String read FCNPJ write FCNPJ;
    property CPF: String read FCPF write FCPF;
    property xNome: String read FxNome write FxNome;
    property xFant: String read FxFant write FxFant;
    property IE: String read FIE write FIE;
    property IEST: String read FIEST write FIEST;
    property IM: String read FIM write FIM;
    property CNAE: String read FCNAE write FCNAE;
    property CRT: TNFeCRT read FCRT write FCRT;
    property enderEmit: TGBFRNFeModelEndereco read FenderEmit write FenderEmit;

    constructor create;
    destructor  Destroy; override;

end;

implementation

{ TGBFRNFeModelEmitente }

constructor TGBFRNFeModelEmitente.create;
begin
  FenderEmit := TGBFRNFeModelEndereco.Create;
end;

destructor TGBFRNFeModelEmitente.Destroy;
begin
  FenderEmit.Free;
  inherited;
end;

end.
