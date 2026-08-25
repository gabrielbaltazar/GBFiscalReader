unit GBFR.CTe.Model.Tomador;

interface

{$IFDEF WEAKPACKAGEUNIT}
  {$WEAKPACKAGEUNIT ON}
{$ENDIF}

uses
  GBFR.CTe.Model.Endereco;

type
  TGBFRCTeModelTomador = class
  private
    Ffone: String;
    FCNPJ: String;
    FxFant: String;
    FxNome: String;
    FCPF: string;
    FIE: String;
    FenderToma: TGBFRCTeModelEndereco;
  public
    property CNPJ: String read FCNPJ write FCNPJ;
    property CPF: string read FCPF write FCPF;
    property IE: String read FIE write FIE;
    property xNome: String read FxNome write FxNome;
    property xFant: String read FxFant write FxFant;
    property fone: String read Ffone write Ffone;
    property enderToma: TGBFRCTeModelEndereco read FenderToma write FenderToma;

    constructor create;
    destructor  Destroy; override;
  end;

implementation

{ TGBFRCTeModelTomador }

constructor TGBFRCTeModelTomador.create;
begin
  FenderToma := TGBFRCTeModelEndereco.Create;
end;

destructor TGBFRCTeModelTomador.Destroy;
begin
  FenderToma.Free;
  inherited;
end;

end.
