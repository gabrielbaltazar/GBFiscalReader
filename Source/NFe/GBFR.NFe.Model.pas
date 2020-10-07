unit GBFR.NFe.Model;

interface

uses
  GBFR.NFe.Model.Types,
  GBFR.NFe.Model.Ide,
  GBFR.NFe.Model.Destinatario,
  GBFR.NFe.Model.Emitente,
  GBFR.NFe.Model.ICMSTot,
  GBFR.NFe.Model.InfAdic,
  GBFR.NFe.Model.Item,
  GBFR.NFe.Model.Pagamento,
  GBFR.NFe.Model.Protocolo,
  GBFR.NFe.Model.ResponsavelTecnico,
  System.Generics.Collections;

type TGBRFNFeModel = class
  private
    Fide: TGBFRNFeModelIde;
    Femit: TGBFRNFeModelEmitente;
    Fdest: TGBFRNFeModelDestinatario;
    FICMSTot: TGBFRNFeModelICMSTot;
    Fitens: TObjectList<TGBFRNFeModelItem>;
    Fpag: TGBFRNFeModelPagamento;
    FinfRespTec: TGBFRNFeModelResponsavelTecnico;
    FprotNFe: TGBRFNFeModelProtocolo;
    FinfAdic: TGBFRNFeModelInfAdic;

  public
    property ide: TGBFRNFeModelIde read Fide write Fide;
    property emit: TGBFRNFeModelEmitente read Femit write Femit;
    property dest: TGBFRNFeModelDestinatario read Fdest write Fdest;
    property itens: TObjectList<TGBFRNFeModelItem> read Fitens write Fitens;
    property ICMSTot: TGBFRNFeModelICMSTot read FICMSTot write FICMSTot;
    property pag: TGBFRNFeModelPagamento read Fpag write Fpag;
    property infAdic: TGBFRNFeModelInfAdic read FinfAdic write FinfAdic;
    property infRespTec: TGBFRNFeModelResponsavelTecnico read FinfRespTec write FinfRespTec;
    property protNFe: TGBRFNFeModelProtocolo read FprotNFe write FprotNFe;

    constructor create;
    destructor  Destroy; override;
end;

implementation

{ TGBRFNFeModel }

constructor TGBRFNFeModel.create;
begin
  Fide        := TGBFRNFeModelIde.Create;
  Femit       := TGBFRNFeModelEmitente.create;
  Fdest       := TGBFRNFeModelDestinatario.create;
  FICMSTot    := TGBFRNFeModelICMSTot.Create;
  FprotNFe    := TGBRFNFeModelProtocolo.Create;
  FinfRespTec := TGBFRNFeModelResponsavelTecnico.Create;
  Fpag        := TGBFRNFeModelPagamento.create;
  FinfAdic    := TGBFRNFeModelInfAdic.Create;
  Fitens      := TObjectList<TGBFRNFeModelItem>.create;
end;

destructor TGBRFNFeModel.Destroy;
begin
  Fide.Free;
  Femit.Free;
  Fdest.Free;
  Fitens.Free;
  FICMSTot.Free;
  Fpag.Free;
  FinfAdic.Free;
  FinfRespTec.Free;
  FprotNFe.Free;
  inherited;
end;

end.
