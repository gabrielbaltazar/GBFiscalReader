unit GBFR.CTe.Model.ConhecimentoTransporte;

interface

uses
  GBFR.CTe.Model.Ide;

type TGBFRCTeModelConhecimentoTransporte = class
  private
    Fide: TGBFRCTeModelIde;
    FId: string;
    Fversao: String;

  public
    property Id: string read FId write FId;
    property versao: String read Fversao write Fversao;
    property ide: TGBFRCTeModelIde read Fide write Fide;

    constructor create;
    destructor  Destroy; override;
end;

implementation

{ TGBFRCTeModelConhecimentoTransporte }

constructor TGBFRCTeModelConhecimentoTransporte.create;
begin
  Fide := TGBFRCTeModelIde.Create;
end;

destructor TGBFRCTeModelConhecimentoTransporte.Destroy;
begin
  Fide.Free;
  inherited;
end;

end.
