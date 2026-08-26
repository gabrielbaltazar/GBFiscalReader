unit GBFR.NFeAvulsa.Classes;

interface

{$IFDEF WEAKPACKAGEUNIT}
  {$WEAKPACKAGEUNIT ON}
{$ENDIF}

uses
  System.Generics.Collections;

type
  TGBFRNFeAvulsaNFeProc = class;

  TGBFRNFeAvulsaEndereco = class;

  TGBFRNFeAvulsaImposto = class;

  TGBFRNFeAvulsaImpostoCOFINS = class;

  TGBFRNFeAvulsaImpostoICMS = class;

  TGBFRNFeAvulsaImpostoIPI = class;

  TGBFRNFeAvulsaImpostoPIS = class;

  TGBFRNFeAvulsaTotalICMSTot = class;

  TGBFRNFeAvulsaPag = class;

  TGBFRNFeAvulsaProduto = class;

  TGBFRNFeAvulsaProtNFe = class;

  TGBFRNFeAvulsaTotal = class;

  TGBFRNFeAvulsaTransp = class;

  TGBFRNFeAvulsaAvulsa = class
  private
    FMatr: string;
    FUF: string;
    FXAgente: string;
    FCNPJ: string;
    FXOrgao: string;
    FRepEmi: string;
  public
    property Matr: string read FMatr write FMatr;
    property UF: string read FUF write FUF;
    property XAgente: string read FXAgente write FXAgente;
    property CNPJ: string read FCNPJ write FCNPJ;
    property XOrgao: string read FXOrgao write FXOrgao;
    property RepEmi: string read FRepEmi write FRepEmi;
  end;

  TGBFRNFeAvulsaDestinatario = class
  private
    FXNome: string;
    FCNPJ: string;
    FIE: string;
    FIndIEDest: Integer;
    FEnderDest: TGBFRNFeAvulsaEndereco;
  public
    constructor Create;
    destructor Destroy; override;

    property XNome: string read FXNome write FXNome;
    property CNPJ: string read FCNPJ write FCNPJ;
    property IE: string read FIE write FIE;
    property IndIEDest: Integer read FIndIEDest write FIndIEDest;
    property EnderDest: TGBFRNFeAvulsaEndereco read FEnderDest write FEnderDest;
  end;

  TGBFRNFeAvulsaDetItem = class
  private
    FNItem: Integer;
    FProd: TGBFRNFeAvulsaProduto;
    FImposto: TGBFRNFeAvulsaImposto;
  public
    constructor Create;
    destructor Destroy; override;

    property NItem: Integer read FNItem write FNItem;
    property Prod: TGBFRNFeAvulsaProduto read FProd write FProd;
    property Imposto: TGBFRNFeAvulsaImposto read FImposto write FImposto;
  end;

  TGBFRNFeAvulsaDetPag = class
  private
    FVPag: Double;
    FTPag: string;
    FIndPag: Integer;
  public
    property VPag: Double read FVPag write FVPag;
    property TPag: string read FTPag write FTPag;
    property IndPag: Integer read FIndPag write FIndPag;
  end;

  TGBFRNFeAvulsaEmitente = class
  private
    FXNome: string;
    FCNPJ: string;
    FIE: string;
    FEnderEmit: TGBFRNFeAvulsaEndereco;
    FCRT: Integer;
    FXFant: string;
  public
    constructor Create;
    destructor Destroy; override;

    property XNome: string read FXNome write FXNome;
    property CRT: Integer read FCRT write FCRT;
    property XFant: string read FXFant write FXFant;
    property CNPJ: string read FCNPJ write FCNPJ;
    property IE: string read FIE write FIE;
    property EnderEmit: TGBFRNFeAvulsaEndereco read FEnderEmit write FEnderEmit;
  end;

  TGBFRNFeAvulsaEndereco = class
  private
    FUF: string;
    FXPais: string;
    FCPais: Integer;
    FXLgr: string;
    FXMun: string;
    FNro: string;
    FCMun: Integer;
    FXBairro: string;
    FCEP: string;
  public
    property UF: string read FUF write FUF;
    property XPais: string read FXPais write FXPais;
    property CPais: Integer read FCPais write FCPais;
    property XLgr: string read FXLgr write FXLgr;
    property XMun: string read FXMun write FXMun;
    property Nro: string read FNro write FNro;
    property CMun: Integer read FCMun write FCMun;
    property XBairro: string read FXBairro write FXBairro;
    property CEP: string read FCEP write FCEP;
  end;

  TGBFRNFeAvulsaIde = class
  private
    FTpNF: Integer;
    FMod: Integer;
    FIndPres: Integer;
    FTpImp: Integer;
    FNNF: Integer;
    FCMunFG: Integer;
    FProcEmi: Integer;
    FFinNFe: Integer;
    FDhEmi: TDateTime;
    FTpAmb: Integer;
    FIndFinal: Integer;
    FIdDest: Integer;
    FTpEmis: Integer;
    FCDV: Integer;
    FCUF: Integer;
    FSerie: string;
    FNatOp: string;
    FCNF: string;
    FVerProc: string;
    FIndIntermed: string;
  public
    property TpNF: Integer read FTpNF write FTpNF;
    property &Mod: Integer read FMod write FMod;
    property IndPres: Integer read FIndPres write FIndPres;
    property TpImp: Integer read FTpImp write FTpImp;
    property NNF: Integer read FNNF write FNNF;
    property CMunFG: Integer read FCMunFG write FCMunFG;
    property ProcEmi: Integer read FProcEmi write FProcEmi;
    property FinNFe: Integer read FFinNFe write FFinNFe;
    property DhEmi: TDateTime read FDhEmi write FDhEmi;
    property TpAmb: Integer read FTpAmb write FTpAmb;
    property IndFinal: Integer read FIndFinal write FIndFinal;
    property IdDest: Integer read FIdDest write FIdDest;
    property TpEmis: Integer read FTpEmis write FTpEmis;
    property CDV: Integer read FCDV write FCDV;
    property CUF: Integer read FCUF write FCUF;
    property Serie: string read FSerie write FSerie;
    property NatOp: string read FNatOp write FNatOp;
    property CNF: string read FCNF write FCNF;
    property VerProc: string read FVerProc write FVerProc;
    property IndIntermed: string read FIndIntermed write FIndIntermed;
  end;

  TGBFRNFeAvulsaImposto = class
  private
    FICMS: TGBFRNFeAvulsaImpostoICMS;
    FIPI: TGBFRNFeAvulsaImpostoIPI;
    FCOFINS: TGBFRNFeAvulsaImpostoCOFINS;
    FPIS: TGBFRNFeAvulsaImpostoPIS;
  public
    constructor Create;
    destructor Destroy; override;

    property ICMS: TGBFRNFeAvulsaImpostoICMS read FICMS write FICMS;
    property IPI: TGBFRNFeAvulsaImpostoIPI read FIPI write FIPI;
    property COFINS: TGBFRNFeAvulsaImpostoCOFINS read FCOFINS write FCOFINS;
    property PIS: TGBFRNFeAvulsaImpostoPIS read FPIS write FPIS;
  end;

  TGBFRNFeAvulsaImpostoCOFINS = class
  private
    FCST: string;
  public
    property CST: string read FCST write FCST;
  end;

  TGBFRNFeAvulsaImpostoICMS = class
  private
    FOrig: string;
    FCSOSN: string;
  public
    property Orig: string read FOrig write FOrig;
    property CSOSN: string read FCSOSN write FCSOSN;
  end;

  TGBFRNFeAvulsaImpostoIPI = class
  private
    FCST: string;
    FCEnq: string;
  public
    property CST: string read FCST write FCST;
    property CEnq: string read FCEnq write FCEnq;
  end;

  TGBFRNFeAvulsaImpostoPIS = class
  private
    FCST: string;
  public
    property CST: string read FCST write FCST;
  end;

  TGBFRNFeAvulsaInfNFe = class
  private
    FAvulsa: TGBFRNFeAvulsaAvulsa;
    FDet: TObjectList<TGBFRNFeAvulsaDetItem>;
    FTotal: TGBFRNFeAvulsaTotal;
    FPag: TGBFRNFeAvulsaPag;
    FId: string;
    FIde: TGBFRNFeAvulsaIde;
    FEmit: TGBFRNFeAvulsaEmitente;
    FDest: TGBFRNFeAvulsaDestinatario;
    FTransp: TGBFRNFeAvulsaTransp;
  public
    constructor Create;
    destructor Destroy; override;

    property Id: string read FId write FId;
    property Avulsa: TGBFRNFeAvulsaAvulsa read FAvulsa write FAvulsa;
    property Det: TObjectList<TGBFRNFeAvulsaDetItem> read FDet write FDet;
    property Total: TGBFRNFeAvulsaTotal read FTotal write FTotal;
    property Pag: TGBFRNFeAvulsaPag read FPag write FPag;
    property Ide: TGBFRNFeAvulsaIde read FIde write FIde;
    property Emit: TGBFRNFeAvulsaEmitente read FEmit write FEmit;
    property Dest: TGBFRNFeAvulsaDestinatario read FDest write FDest;
    property Transp: TGBFRNFeAvulsaTransp read FTransp write FTransp;
  end;

  TGBFRNFeAvulsaInfProt = class
  private
    FNProt: string;
    FDigVal: string;
    FDhRecbto: TDateTime;
    FChNFe: string;
    FXMotivo: string;
    FCStat: Integer;
  public
    property NProt: string read FNProt write FNProt;
    property DigVal: string read FDigVal write FDigVal;
    property DhRecbto: TDateTime read FDhRecbto write FDhRecbto;
    property ChNFe: string read FChNFe write FChNFe;
    property XMotivo: string read FXMotivo write FXMotivo;
    property CStat: Integer read FCStat write FCStat;
  end;

  TGBFRNFeAvulsaNFe = class
  private
    FInfNFe: TGBFRNFeAvulsaInfNFe;
  public
    constructor Create;
    destructor Destroy; override;
    property InfNFe: TGBFRNFeAvulsaInfNFe read FInfNFe write FInfNFe;
  end;

  TGBFRNFeAvulsaNFeProc = class
  private
    FVersao: string;
    FProtNFe: TGBFRNFeAvulsaProtNFe;
    FNFe: TGBFRNFeAvulsaNFe;
  public
    constructor Create;
    destructor Destroy; override;

    property Versao: string read FVersao write FVersao;
    property ProtNFe: TGBFRNFeAvulsaProtNFe read FProtNFe write FProtNFe;
    property NFe: TGBFRNFeAvulsaNFe read FNFe write FNFe;
  end;

  TGBFRNFeAvulsaPag = class
  private
    FDetPag: TObjectList<TGBFRNFeAvulsaDetPag>;
  public
    constructor Create;
    destructor Destroy; override;
    property DetPag: TObjectList<TGBFRNFeAvulsaDetPag> read FDetPag write FDetPag;
  end;

  TGBFRNFeAvulsaProduto = class
  private
    FCEAN: string;
    FCProd: string;
    FQCom: Double;
    FCEANTrib: string;
    FVUnTrib: Double;
    FQTrib: Double;
    FVProd: Double;
    FXProd: string;
    FVUnCom: Double;
    FIndTot: Integer;
    FUTrib: string;
    FNCM: string;
    FUCom: string;
    FCFOP: string;
  public
    property CEAN: string read FCEAN write FCEAN;
    property CProd: string read FCProd write FCProd;
    property QCom: Double read FQCom write FQCom;
    property CEANTrib: string read FCEANTrib write FCEANTrib;
    property VUnTrib: Double read FVUnTrib write FVUnTrib;
    property QTrib: Double read FQTrib write FQTrib;
    property VProd: Double read FVProd write FVProd;
    property XProd: string read FXProd write FXProd;
    property VUnCom: Double read FVUnCom write FVUnCom;
    property IndTot: Integer read FIndTot write FIndTot;
    property UTrib: string read FUTrib write FUTrib;
    property NCM: string read FNCM write FNCM;
    property UCom: string read FUCom write FUCom;
    property CFOP: string read FCFOP write FCFOP;
  end;

  TGBFRNFeAvulsaProtNFe = class
  private
    FInfProt: TGBFRNFeAvulsaInfProt;
  public
    constructor Create;
    destructor Destroy; override;

    property InfProt: TGBFRNFeAvulsaInfProt read FInfProt write FInfProt;
  end;

  TGBFRNFeAvulsaTotal = class
  private
    FICMSTot: TGBFRNFeAvulsaTotalICMSTot;
  public
    constructor Create;
    destructor Destroy; override;

    property ICMSTot: TGBFRNFeAvulsaTotalICMSTot read FICMSTot write FICMSTot;
  end;

  TGBFRNFeAvulsaTotalICMSTot = class
  private
    FVCOFINS: Double;
    FVBCST: Double;
    FVICMSDeson: Double;
    FVProd: Double;
    FVSeg: Double;
    FVFCP: Double;
    FVFCPST: Double;
    FVNF: Double;
    FVTotTrib: Double;
    FVPIS: Double;
    FVIPIDevol: Double;
    FVBC: Double;
    FVST: Double;
    FVICMS: Double;
    FVII: Double;
    FVFCPSTRet: Double;
    FVDesc: Double;
    FVOutro: Double;
    FVIPI: Double;
    FVFrete: Double;
  public
    property VCOFINS: Double read FVCOFINS write FVCOFINS;
    property VBCST: Double read FVBCST write FVBCST;
    property VICMSDeson: Double read FVICMSDeson write FVICMSDeson;
    property VProd: Double read FVProd write FVProd;
    property VSeg: Double read FVSeg write FVSeg;
    property VFCP: Double read FVFCP write FVFCP;
    property VFCPST: Double read FVFCPST write FVFCPST;
    property VNF: Double read FVNF write FVNF;
    property VTotTrib: Double read FVTotTrib write FVTotTrib;
    property VPIS: Double read FVPIS write FVPIS;
    property VIPIDevol: Double read FVIPIDevol write FVIPIDevol;
    property VBC: Double read FVBC write FVBC;
    property VST: Double read FVST write FVST;
    property VICMS: Double read FVICMS write FVICMS;
    property VII: Double read FVII write FVII;
    property VFCPSTRet: Double read FVFCPSTRet write FVFCPSTRet;
    property VDesc: Double read FVDesc write FVDesc;
    property VOutro: Double read FVOutro write FVOutro;
    property VIPI: Double read FVIPI write FVIPI;
    property VFrete: Double read FVFrete write FVFrete;
  end;

  TGBFRNFeAvulsaTransp = class
  private
    FModFrete: Integer;
  public
    property ModFrete: Integer read FModFrete write FModFrete;
  end;

implementation

{ TGBFRNFeAvulsaDestinatario }

constructor TGBFRNFeAvulsaDestinatario.Create;
begin
  FEnderDest := TGBFRNFeAvulsaEndereco.Create;
end;

destructor TGBFRNFeAvulsaDestinatario.Destroy;
begin
  FEnderDest.Free;
  inherited;
end;

{ TGBFRNFeAvulsaEmitente }

constructor TGBFRNFeAvulsaEmitente.Create;
begin
  FEnderEmit := TGBFRNFeAvulsaEndereco.Create;
end;

destructor TGBFRNFeAvulsaEmitente.Destroy;
begin
  FEnderEmit.Free;
  inherited;
end;

{ TGBFRNFeAvulsaTotal }

constructor TGBFRNFeAvulsaTotal.Create;
begin
  FICMSTot := TGBFRNFeAvulsaTotalICMSTot.Create;
end;

destructor TGBFRNFeAvulsaTotal.Destroy;
begin
  FICMSTot.Free;
  inherited;
end;

{ TGBFRNFeAvulsaImposto }

constructor TGBFRNFeAvulsaImposto.Create;
begin
  FICMS := TGBFRNFeAvulsaImpostoICMS.Create;
  FIPI := TGBFRNFeAvulsaImpostoIPI.Create;
  FCOFINS := TGBFRNFeAvulsaImpostoCOFINS.Create;
  FPIS := TGBFRNFeAvulsaImpostoPIS.Create;
end;

destructor TGBFRNFeAvulsaImposto.Destroy;
begin
  FICMS.Free;
  FIPI.Free;
  FCOFINS.Free;
  FPIS.Free;
  inherited;
end;

{ TGBFRNFeAvulsaDetItem }

constructor TGBFRNFeAvulsaDetItem.Create;
begin
  FProd := TGBFRNFeAvulsaProduto.Create;
  FImposto := TGBFRNFeAvulsaImposto.Create;
end;

destructor TGBFRNFeAvulsaDetItem.Destroy;
begin
  FProd.Free;
  FImposto.Free;
  inherited;
end;

{ TGBFRNFeAvulsaPag }

constructor TGBFRNFeAvulsaPag.Create;
begin
  FDetPag := TObjectList<TGBFRNFeAvulsaDetPag>.Create;
end;

destructor TGBFRNFeAvulsaPag.Destroy;
begin
  FDetPag.Free;
  inherited;
end;

{ TGBFRNFeAvulsaInfNFe }

constructor TGBFRNFeAvulsaInfNFe.Create;
begin
  FAvulsa := TGBFRNFeAvulsaAvulsa.Create;
  FDet := TObjectList<TGBFRNFeAvulsaDetItem>.Create;
  FTotal := TGBFRNFeAvulsaTotal.Create;
  FPag := TGBFRNFeAvulsaPag.Create;
  FIde := TGBFRNFeAvulsaIde.Create;
  FEmit := TGBFRNFeAvulsaEmitente.Create;
  FDest := TGBFRNFeAvulsaDestinatario.Create;
  FTransp := TGBFRNFeAvulsaTransp.Create;
end;

destructor TGBFRNFeAvulsaInfNFe.Destroy;
begin
  FAvulsa.Free;
  FDet.Free;
  FTotal.Free;
  FPag.Free;
  FIde.Free;
  FEmit.Free;
  FDest.Free;
  FTransp.Free;
  inherited;
end;

{ TGBFRNFeAvulsaNFe }

constructor TGBFRNFeAvulsaNFe.Create;
begin
  FInfNFe := TGBFRNFeAvulsaInfNFe.Create;
end;

destructor TGBFRNFeAvulsaNFe.Destroy;
begin
  FInfNFe.Free;
  inherited;
end;

{ TGBFRNFeAvulsaProtNFe }

constructor TGBFRNFeAvulsaProtNFe.Create;
begin
  FInfProt := TGBFRNFeAvulsaInfProt.Create;
end;

destructor TGBFRNFeAvulsaProtNFe.Destroy;
begin
  FInfProt.Free;
  inherited;
end;

{ TGBFRNFeAvulsaNFeProc }

constructor TGBFRNFeAvulsaNFeProc.Create;
begin
  FProtNFe := TGBFRNFeAvulsaProtNFe.Create;
  FNFe := TGBFRNFeAvulsaNFe.Create;
end;

destructor TGBFRNFeAvulsaNFeProc.Destroy;
begin
  FProtNFe.Free;
  FNFe.Free;
  inherited;
end;

end.
