unit GBFR.NFe.Model;

interface

uses
  GBFR.NFe.Model.Types,
  GBFR.NFe.Model.Ide,
  GBFR.NFe.Model.Destinatario,
  GBFR.NFe.Model.Emitente,
  GBFR.NFe.Model.ICMSTot,
  GBFR.NFe.Model.InfAdic,
  GBFR.NFe.Model.ISSQNTot,
  GBFR.NFe.Model.Item,
  GBFR.NFe.Model.Pagamento,
  GBFR.NFe.Model.Protocolo,
  GBFR.NFe.Model.ResponsavelTecnico,
  System.Generics.Collections;

type TGBFRNFeModel = class
  private
    Fide: TGBFRNFeModelIde;
    Femit: TGBFRNFeModelEmitente;
    Fdest: TGBFRNFeModelDestinatario;
    FICMSTot: TGBFRNFeModelICMSTot;
    Fitens: TObjectList<TGBFRNFeModelItem>;
    Fpag: TGBFRNFeModelPagamento;
    FinfRespTec: TGBFRNFeModelResponsavelTecnico;
    FprotNFe: TGBFRNFeModelProtocolo;
    FinfAdic: TGBFRNFeModelInfAdic;
    FId: String;
    Fversao: String;
    FISSQNTot: TGBFRNFeModelISSQNTot;

  public
    property Id: String read FId write FId;
    property versao: String read Fversao write Fversao;
    property ide: TGBFRNFeModelIde read Fide write Fide;
    property emit: TGBFRNFeModelEmitente read Femit write Femit;
    property dest: TGBFRNFeModelDestinatario read Fdest write Fdest;
    property itens: TObjectList<TGBFRNFeModelItem> read Fitens write Fitens;
    property ICMSTot: TGBFRNFeModelICMSTot read FICMSTot write FICMSTot;
    property ISSQNTot: TGBFRNFeModelISSQNTot read FISSQNTot write FISSQNTot;
    property pag: TGBFRNFeModelPagamento read Fpag write Fpag;
    property infAdic: TGBFRNFeModelInfAdic read FinfAdic write FinfAdic;
    property infRespTec: TGBFRNFeModelResponsavelTecnico read FinfRespTec write FinfRespTec;
    property protNFe: TGBFRNFeModelProtocolo read FprotNFe write FprotNFe;

    constructor create;
    destructor  Destroy; override;
end;

implementation

{ TGBRFNFeModel }

constructor TGBFRNFeModel.create;
begin
  Fide        := TGBFRNFeModelIde.Create;
  Femit       := TGBFRNFeModelEmitente.create;
  Fdest       := TGBFRNFeModelDestinatario.create;
  FISSQNTot   := TGBFRNFeModelISSQNTot.Create;
  FICMSTot    := TGBFRNFeModelICMSTot.Create;
  FprotNFe    := TGBFRNFeModelProtocolo.Create;
  FinfRespTec := TGBFRNFeModelResponsavelTecnico.Create;
  Fpag        := TGBFRNFeModelPagamento.create;
  FinfAdic    := TGBFRNFeModelInfAdic.Create;
  Fitens      := TObjectList<TGBFRNFeModelItem>.create;
end;

destructor TGBFRNFeModel.Destroy;
begin
  Fide.Free;
  Femit.Free;
  Fdest.Free;
  Fitens.Free;
  FISSQNTot.Free;
  FICMSTot.Free;
  Fpag.Free;
  FinfAdic.Free;
  FinfRespTec.Free;
  FprotNFe.Free;
  inherited;
end;

end.
