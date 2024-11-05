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

type
  TGBFRNFeInfEvento = class;

  TGBFRNFeModel = class
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
    FId: string;
    Fversao: string;
    FISSQNTot: TGBFRNFeModelISSQNTot;
    FEventos: TObjectList<TGBFRNFeInfEvento>;
  public
    constructor Create;
    destructor Destroy; override;

    function Cancelamento: TGBFRNFeInfEvento;
    function NFeCancelada: Boolean;

    property Id: string read FId write FId;
    property versao: string read Fversao write Fversao;
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
    property Eventos: TObjectList<TGBFRNFeInfEvento> read FEventos write FEventos;
  end;

  TGBFRNFeInfEvento = class
  private
    FTpAmb: TNFeAmbiente;
    FVerAplic: string;
    FCOrgao: string;
    FCStat: Integer;
    FXMotivo: string;
    FChNFe: string;
    FTpEvento: string;
    FNSeqEvento: Integer;
    FDhRegEvento: TDateTime;
    FNProt: string;
  public
    property TpAmb: TNFeAmbiente read FTpAmb write FTpAmb;
    property VerAplic: string read FVerAplic write FVerAplic;
    property COrgao: string read FCOrgao write FCOrgao;
    property CStat: Integer read FCStat write FCStat;
    property XMotivo: string read FXMotivo write FXMotivo;
    property ChNFe: string read FChNFe write FChNFe;
    property TpEvento: string read FTpEvento write FTpEvento;
    property NSeqEvento: Integer read FNSeqEvento write FNSeqEvento;
    property DhRegEvento: TDateTime read FDhRegEvento write FDhRegEvento;
    property NProt: string read FNProt write FNProt;
  end;

implementation

{ TGBRFNFeModel }

function TGBFRNFeModel.Cancelamento: TGBFRNFeInfEvento;
var
  LEvento: TGBFRNFeInfEvento;
begin
  Result := nil;
  for LEvento in FEventos do
  begin
    if LEvento.TpEvento = '110111' then
      Exit(LEvento);
  end;
end;

constructor TGBFRNFeModel.Create;
begin
  Fide := TGBFRNFeModelIde.Create;
  Femit := TGBFRNFeModelEmitente.Create;
  Fdest := TGBFRNFeModelDestinatario.Create;
  FISSQNTot := TGBFRNFeModelISSQNTot.Create;
  FICMSTot := TGBFRNFeModelICMSTot.Create;
  FprotNFe := TGBFRNFeModelProtocolo.Create;
  FinfRespTec := TGBFRNFeModelResponsavelTecnico.Create;
  Fpag := TGBFRNFeModelPagamento.Create;
  FinfAdic := TGBFRNFeModelInfAdic.Create;
  Fitens := TObjectList<TGBFRNFeModelItem>.Create;
  FEventos := TObjectList<TGBFRNFeInfEvento>.Create;
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
  FEventos.Free;
  inherited;
end;

function TGBFRNFeModel.NFeCancelada: Boolean;
begin
  Result := Cancelamento <> nil;
end;

end.
