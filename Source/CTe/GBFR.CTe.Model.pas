unit GBFR.CTe.Model;

interface

uses
  GBFR.CTe.Model.AutDownloadXML,
  GBFR.CTe.Model.Ide,
  GBFR.CTe.Model.DadosComplementares,
  GBFR.CTe.Model.Destinatario,
  GBFR.CTe.Model.Emitente,
  GBFR.CTe.Model.Expedidor,
  GBFR.CTe.Model.InfoCTeNormal,
  GBFR.CTe.Model.PrestacaoServico,
  GBFR.CTe.Model.InfProt,
  GBFR.CTe.Model.InfoSuplementar,
  GBFR.CTe.Model.Remetente,
  System.Generics.Collections;

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
    FinfCTeNorm: TGBFRCTeModelInfoCTeNormal;
    FautXML: TObjectList<TGBFRCTeModelAutDownloadXML>;
    FinfProt: TGBFRCTeModelInfProt;
    FinfCTeSupl: TGBFRCTeModelInfoSuplementar;

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
    property infCTeNorm: TGBFRCTeModelInfoCTeNormal read FinfCTeNorm write FinfCTeNorm;
    property autXML: TObjectList<TGBFRCTeModelAutDownloadXML> read FautXML write FautXML;
    property infProt: TGBFRCTeModelInfProt read FinfProt write FinfProt;
    property infCTeSupl: TGBFRCTeModelInfoSuplementar read FinfCTeSupl write FinfCTeSupl;

    procedure addAutXML(CNPJ, CPF: String);

    constructor create;
    destructor  Destroy; override;
end;

implementation

{ TGBFRCTeModel }

procedure TGBFRCTeModel.addAutXML(CNPJ, CPF: String);
begin
  FautXML.Add(TGBFRCTeModelAutDownloadXML.Create);
  FautXML.Last.CNPJ := CNPJ;
  FautXML.Last.CPF  := CPF;
end;

constructor TGBFRCTeModel.create;
begin
  Fide        := TGBFRCTeModelIde.Create;
  Fcompl      := TGBFRCTeModelDadosComplementares.Create;
  Femit       := TGBFRCTeModelEmitente.Create;
  Frem        := TGBFRCTeModelRemetente.create;
  Fexped      := TGBFRCTeModelExpedidor.create;
  Fdest       := TGBFRCTeModelDestinatario.create;
  FvPrest     := TGBFRCTeModelPrestacaoServico.create;
  FinfCTeNorm := TGBFRCTeModelInfoCTeNormal.create;
  FautXML     := TObjectList<TGBFRCTeModelAutDownloadXML>.create;
  FinfCTeSupl := TGBFRCTeModelInfoSuplementar.Create;
  FinfProt    := TGBFRCTeModelInfProt.Create;
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
  FinfCTeNorm.Free;
  FautXML.Free;
  FinfProt.Free;
  FinfCTeSupl.Free;
  inherited;
end;

end.
