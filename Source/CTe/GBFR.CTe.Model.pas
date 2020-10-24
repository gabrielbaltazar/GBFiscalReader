unit GBFR.CTe.Model;

interface

uses
  GBFR.CTe.Model.Ide,
  GBFR.CTe.Model.DadosComplementares,
  GBFR.CTe.Model.Destinatario,
  GBFR.CTe.Model.Emitente,
  GBFR.CTe.Model.Expedidor,
  GBFR.CTe.Model.PrestacaoServico,
  GBFR.CTe.Model.Remetente;

type TGBFRCTeModel = class
  private
    Fide: TGBFRCTeModelIde;
    FId: string;
    Fversao: String;
    Fcompl: TGBFRCTeModelDadosComplementares;
    Femit: TGBFRCTeModelEmitente;
    Frem: TGBFRCTeModelRemetente;
    Fexped: TGBFRCTeModelExpedidor;
    Fdest: TGBFRCTeModelDestinatario;
    FvPrest: TGBFRCTeModelPrestacaoServico;

  public
    property Id: string read FId write FId;
    property versao: String read Fversao write Fversao;
    property ide: TGBFRCTeModelIde read Fide write Fide;
    property compl: TGBFRCTeModelDadosComplementares read Fcompl write Fcompl;
    property emit: TGBFRCTeModelEmitente read Femit write Femit;
    property rem: TGBFRCTeModelRemetente read Frem write Frem;
    property exped: TGBFRCTeModelExpedidor read Fexped write Fexped;
    property dest: TGBFRCTeModelDestinatario read Fdest write Fdest;
    property vPrest: TGBFRCTeModelPrestacaoServico read FvPrest write FvPrest;

    constructor create;
    destructor  Destroy; override;
end;

implementation

{ TGBFRCTeModel }

constructor TGBFRCTeModel.create;
begin
  Fide   := TGBFRCTeModelIde.Create;
  Fcompl := TGBFRCTeModelDadosComplementares.Create;
  Femit  := TGBFRCTeModelEmitente.Create;
  Frem   := TGBFRCTeModelRemetente.create;
  Fexped := TGBFRCTeModelExpedidor.create;
  Fdest  := TGBFRCTeModelDestinatario.create;
  FvPrest:= TGBFRCTeModelPrestacaoServico.create;
end;

destructor TGBFRCTeModel.Destroy;
begin
  Fide.Free;
  Fcompl.Free;
  Femit.Free;
  Frem.Free;
  Fexped.Free;
  Fdest.Free;
  FvPrest.Free;
  inherited;
end;

end.
