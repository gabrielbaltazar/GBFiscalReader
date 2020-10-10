unit GBFR.CTe.Model;

interface

uses
  GBFR.CTe.Model.Ide,
  GBFR.CTe.Model.DadosComplementares;

type TGBFRCTeModel = class
  private
    Fide: TGBFRCTeModelIde;
    FId: string;
    Fversao: String;
    Fcompl: TGBFRCTeModelDadosComplementares;

  public
    property Id: string read FId write FId;
    property versao: String read Fversao write Fversao;
    property ide: TGBFRCTeModelIde read Fide write Fide;
    property compl: TGBFRCTeModelDadosComplementares read Fcompl write Fcompl;

    constructor create;
    destructor  Destroy; override;
end;

implementation

{ TGBFRCTeModel }

constructor TGBFRCTeModel.create;
begin
  Fide   := TGBFRCTeModelIde.Create;
  Fcompl := TGBFRCTeModelDadosComplementares.Create;
end;

destructor TGBFRCTeModel.Destroy;
begin
  Fide.Free;
  Fcompl.Free;
  inherited;
end;

end.
