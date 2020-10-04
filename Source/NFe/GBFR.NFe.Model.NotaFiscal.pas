unit GBFR.NFe.Model.NotaFiscal;

interface

uses
  GBFR.NFe.Model.Types,
  GBFR.NFe.Model.Destinatario,
  GBFR.NFe.Model.Emitente,
  GBFR.NFe.Model.ICMSTot,
  GBFR.NFe.Model.Item,
  GBFR.NFe.Model.Pagamento,
  GBFR.NFe.Model.Protocolo,
  GBFR.NFe.Model.ResponsavelTecnico,
  System.Generics.Collections;

type TGBRFNFeModelNotaFiscal = class
  private
    FcUF: string;
    FcNF: String;
    FnatOp: String;
    Fmod: string;
    Fserie: String;
    FnNF: Integer;
    FdhEmi: TDateTime;
    FcMunFG: String;
    FtpAmb: TNFeAmbiente;
    Femit: TGBFRNFeModelEmitente;
    Fdest: TGBFRNFeModelDestinatario;
    FICMSTot: TGBFRNFeModelICMSTot;
    FinfCpl: String;
    Fitens: TObjectList<TGBFRNFeModelItem>;
    Fpag: TGBFRNFeModelPagamento;
    FinfRespTec: TGBFRNFeModelResponsavelTecnico;
    FprotNFe: TGBRFNFeModelProtocolo;
    FdSaiEnt: TDateTime;

  public
    property cUF: string read FcUF write FcUF;
    property cNF: String read FcNF write FcNF;
    property natOp: String read FnatOp write FnatOp;
    property &mod: string read Fmod write Fmod;
    property serie: String read Fserie write Fserie;
    property nNF: Integer read FnNF write FnNF;
    property dhEmi: TDateTime read FdhEmi write FdhEmi;
    property dSaiEnt: TDateTime read FdSaiEnt write FdSaiEnt;
    property cMunFG: String read FcMunFG write FcMunFG;
    property tpAmb: TNFeAmbiente read FtpAmb write FtpAmb;
    property infCpl: String read FinfCpl write FinfCpl;
    property emit: TGBFRNFeModelEmitente read Femit write Femit;
    property dest: TGBFRNFeModelDestinatario read Fdest write Fdest;
    property itens: TObjectList<TGBFRNFeModelItem> read Fitens write Fitens;
    property pag: TGBFRNFeModelPagamento read Fpag write Fpag;
    property ICMSTot: TGBFRNFeModelICMSTot read FICMSTot write FICMSTot;
    property infRespTec: TGBFRNFeModelResponsavelTecnico read FinfRespTec write FinfRespTec;
    property protNFe: TGBRFNFeModelProtocolo read FprotNFe write FprotNFe;

    constructor create;
    destructor  Destroy; override;
end;

implementation

{ TGBRFNFeModelNotaFiscal }

constructor TGBRFNFeModelNotaFiscal.create;
begin
  Femit       := TGBFRNFeModelEmitente.create;
  Fdest       := TGBFRNFeModelDestinatario.create;
  FICMSTot    := TGBFRNFeModelICMSTot.Create;
  FprotNFe    := TGBRFNFeModelProtocolo.Create;
  FinfRespTec := TGBFRNFeModelResponsavelTecnico.Create;
  Fpag        := TGBFRNFeModelPagamento.create;
  Fitens      := TObjectList<TGBFRNFeModelItem>.create;
end;

destructor TGBRFNFeModelNotaFiscal.Destroy;
begin
  Femit.Free;
  Fdest.Free;
  Fitens.Free;
  FICMSTot.Free;
  Fpag.Free;
  FinfRespTec.Free;
  FprotNFe.Free;
  inherited;
end;

end.
