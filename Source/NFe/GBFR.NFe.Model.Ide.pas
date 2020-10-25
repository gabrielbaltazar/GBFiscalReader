unit GBFR.NFe.Model.Ide;

interface

uses
  GBFR.NFe.Model.Types,
  GBFR.NFe.Model.NFRef,
  System.Generics.Collections;

type TGBFRNFeModelIde = class
  private
    FdhEmi: TDateTime;
    FcMunFG: String;
    FnatOp: String;
    FtpAmb: TNFeAmbiente;
    Fserie: String;
    FnNF: Integer;
    FcUF: string;
    FcNF: String;
    Fmod: string;
    FdSaiEnt: TDateTime;
    FcDV: String;
    FNFRef: TObjectList<TGBFRNFeModelNFRef>;
    FtpNF: TNFeTipoOperacao;
    FidDest: TNFeDestinoOperacao;
    FtpImp: TNFeFormatoImpressao;
    FtpEmis: TNFeTipoEmissao;
    FfinNFe: TNFeFinalidadeEmissao;
    FindFinal: TNFeOperacaoConsumidor;
    FindPres: TNFeIndicadorPresenca;
    FprocEmi: TNFeProcessoEmissao;

  public
    property cUF: string read FcUF write FcUF;
    property cNF: String read FcNF write FcNF;
    property natOp: String read FnatOp write FnatOp;
    property &mod: string read Fmod write Fmod;
    property serie: String read Fserie write Fserie;
    property nNF: Integer read FnNF write FnNF;
    property dhEmi: TDateTime read FdhEmi write FdhEmi;
    property dSaiEnt: TDateTime read FdSaiEnt write FdSaiEnt;
    property tpNF: TNFeTipoOperacao read FtpNF write FtpNF;
    property idDest: TNFeDestinoOperacao read FidDest write FidDest;
    property cMunFG: String read FcMunFG write FcMunFG;
    property tpImp: TNFeFormatoImpressao read FtpImp write FtpImp;
    property tpEmis: TNFeTipoEmissao read FtpEmis write FtpEmis;
    property tpAmb: TNFeAmbiente read FtpAmb write FtpAmb;
    property finNFe: TNFeFinalidadeEmissao read FfinNFe write FfinNFe;
    property indFinal: TNFeOperacaoConsumidor read FindFinal write FindFinal;
    property indPres: TNFeIndicadorPresenca read FindPres write FindPres;
    property procEmi: TNFeProcessoEmissao read FprocEmi write FprocEmi;
    property cDV: String read FcDV write FcDV;
    property NFRef: TObjectList<TGBFRNFeModelNFRef> read FNFRef write FNFRef;

    procedure addNFRef(ARefNFe: String);

    constructor create;
    destructor  Destroy; override;
end;

implementation

{ TGBFRNFeModelIde }

procedure TGBFRNFeModelIde.addNFRef(ARefNFe: String);
begin
  NFRef.Add(TGBFRNFeModelNFRef.Create);
  NFRef.Last.refNFe := ARefNFe;
end;

constructor TGBFRNFeModelIde.create;
begin
  FNFRef := TObjectList<TGBFRNFeModelNFRef>.Create;
end;

destructor TGBFRNFeModelIde.Destroy;
begin
  FNFRef.Free;
  inherited;
end;

end.
