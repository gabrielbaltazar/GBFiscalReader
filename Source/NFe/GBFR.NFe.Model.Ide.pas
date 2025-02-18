unit GBFR.NFe.Model.Ide;

interface

uses
  GBFR.NFe.Model.Types,
  GBFR.NFe.Model.RefNFe,
  GBFR.NFe.Model.RefNF,
  GBFR.NFe.Model.RefNFP,
  GBFR.NFe.Model.RefECF,
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
    FrefNFes: TObjectList<TGBFRNFeModelRefNFe>;
    FrefNFs: TObjectList<TGBFRNFeModelRefNF>;
    FrefNFPs: TObjectList<TGBFRNFeModelRefNFP>;
    FrefECFs: TObjectList<TGBFRNFeModelRefECF>;
    FtpNF: TNFeTipoOperacao;
    FidDest: TNFeDestinoOperacao;
    FtpImp: TNFeFormatoImpressao;
    FtpEmis: TNFeTipoEmissao;
    FfinNFe: TNFeFinalidadeEmissao;
    FindFinal: TNFeOperacaoConsumidor;
    FindPres: TNFeIndicadorPresenca;
    FprocEmi: TNFeProcessoEmissao;
    FverProc: string;

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
    property verProc: String read FverProc write FverProc;
    property refNFes: TObjectList<TGBFRNFeModelRefNFe> read FrefNFes write FrefNFes;
    property refNFs: TObjectList<TGBFRNFeModelRefNF> read FrefNFs write FrefNFs;
    property refNFPs: TObjectList<TGBFRNFeModelRefNFP> read FrefNFPs write FrefNFPs;
    property refECFs: TObjectList<TGBFRNFeModelRefECF> read FrefECFs write FrefECFs;

    constructor create;
    destructor  Destroy; override;
end;

implementation

{ TGBFRNFeModelIde }

constructor TGBFRNFeModelIde.create;
begin
  FrefNFes := TObjectList<TGBFRNFeModelRefNFe>.Create;
  FrefNFs := TObjectList<TGBFRNFeModelRefNF>.Create;
  FrefNFPs := TObjectList<TGBFRNFeModelRefNFP>.Create;
  FrefECFs := TObjectList<TGBFRNFeModelRefECF>.Create;
end;

destructor TGBFRNFeModelIde.Destroy;
begin
  FrefNFes.Free;
  FrefNFs.Free;
  FrefNFPs.Free;
  FrefECFs.Free;
  inherited;
end;

end.
