unit GBFR.CTe.Model;

interface

uses
  GBFR.CTe.Model.Ide;

type TGBFRCTeModel = class
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

{ TGBFRCTeModel }

constructor TGBFRCTeModel.create;
begin
  Fide := TGBFRCTeModelIde.Create;
end;

destructor TGBFRCTeModel.Destroy;
begin
  Fide.Free;
  inherited;
end;

end.
