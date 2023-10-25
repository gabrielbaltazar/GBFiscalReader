unit GBFR.SAT.Model.Classes;

interface

uses
  GBFR.SAT.Model.Types,
  System.Generics.Collections,
  System.SysUtils;

type
  TGBFRSATModelDetalhe = class;
  TGBFRSATModelEnderecoEmitente = class;
  TGBFRSATModelInfCFe = class;
  TGBFRSATModelImposto = class;
  TGBFRSATModelInformacaoAdicional = class;
  TGBFRSATModelImpostoCOFINS = class;
  TGBFRSATModelImpostoCOFINSST = class;
  TGBFRSATModelImpostoICMS = class;
  TGBFRSATModelImpostoISSQN = class;
  TGBFRSATModelImpostoPIS = class;
  TGBFRSATModelImpostoPISST = class;
  TGBFRSATModelTotal = class;
  TGBFRSATModelPagamento = class;
  TGBFRSATModelProduto = class;

  TGBFRSATModelCFe = class
  private
    FinfCFe: TGBFRSATModelInfCFe;
  public
    constructor Create;
    destructor Destroy; override;

    property infCFe: TGBFRSATModelInfCFe read FinfCFe write FinfCFe;
  end;

  TGBFRSATModelDestinatario = class
  private
    FCNPJ: string;
    FCPF: string;
    FxNome: string;
  public
    property CNPJ: string read FCNPJ write FCNPJ;
    property CPF: string read FCPF write FCPF;
    property xNome: string read FxNome write FxNome;
  end;

  TGBFRSATModelEmitente = class
  private
    FCNPJ: string;
    FxNome: string;
    FxFant: string;
    FenderEmit: TGBFRSATModelEnderecoEmitente;
    FIE: string;
    FIM: string;
    FcRegTrib: TSATRegimeTributario;
    FcRegTribISSQN: TSATRegimeTributarioISSQN;
    FindRatISSQN: string;
  public
    constructor Create;
    destructor Destroy; override;

    property CNPJ: string read FCNPJ write FCNPJ;
    property xNome: string read FxNome write FxNome;
    property xFant: string read FxFant write FxFant;
    property enderEmit: TGBFRSATModelEnderecoEmitente read FenderEmit write FenderEmit;
    property IE: string read FIE write FIE;
    property IM: string read FIM write FIM;
    property cRegTrib: TSATRegimeTributario read FcRegTrib write FcRegTrib;
    property cRegTribISSQN: TSATRegimeTributarioISSQN read FcRegTribISSQN write FcRegTribISSQN;
    property indRatISSQN: string read FindRatISSQN write FindRatISSQN;
  end;

  TGBFRSATModelDetalhe = class
  private
    Fprod: TGBFRSATModelProduto;
    Fimposto: TGBFRSATModelImposto;
    FnItem: Integer;
  public
    constructor Create;
    destructor Destroy; override;

    property nItem: Integer read FnItem write FnItem;
    property prod: TGBFRSATModelProduto read Fprod write Fprod;
    property imposto: TGBFRSATModelImposto read Fimposto write Fimposto;
  end;

  TGBFRSATModelEnderecoEmitente = class
  private
    FxLgr: string;
    Fnro: string;
    FxCpl: string;
    FxBairro: string;
    FxMun: string;
    FCEP: Integer;
  public
    property xLgr: string read FxLgr write FxLgr;
    property nro: string read Fnro write Fnro;
    property xCpl: string read FxCpl write FxCpl;
    property xBairro: string read FxBairro write FxBairro;
    property xMun: string read FxMun write FxMun;
    property CEP: Integer read FCEP write FCEP;
  end;

  TGBFRSATModelLocalEntrega = class
  private
    FxLgr: string;
    Fnro: string;
    FxCpl: string;
    FxBairro: string;
    FxMun: string;
    FUF: string;
  public
    property xLgr: string read FxLgr write FxLgr;
    property nro: string read Fnro write Fnro;
    property xCpl: string read FxCpl write FxCpl;
    property xBairro: string read FxBairro write FxBairro;
    property xMun: string read FxMun write FxMun;
    property UF: string read FUF write FUF;
  end;

  TGBFRSATModelImposto = class
  private
    FPISST: TGBFRSATModelImpostoPISST;
    FICMS: TGBFRSATModelImpostoICMS;
    FCOFINSST: TGBFRSATModelImpostoCOFINSST;
    FISSQN: TGBFRSATModelImpostoISSQN;
    FPIS: TGBFRSATModelImpostoPIS;
    FCOFINS: TGBFRSATModelImpostoCOFINS;
  public
    constructor Create;
    destructor Destroy; override;

    property COFINS: TGBFRSATModelImpostoCOFINS read FCOFINS write FCOFINS;
    property COFINSST: TGBFRSATModelImpostoCOFINSST read FCOFINSST write FCOFINSST;
    property ICMS: TGBFRSATModelImpostoICMS read FICMS write FICMS;
    property ISSQN: TGBFRSATModelImpostoISSQN read FISSQN write FISSQN;
    property PIS: TGBFRSATModelImpostoPIS read FPIS write FPIS;
    property PISST: TGBFRSATModelImpostoPISST read FPISST write FPISST;
  end;

  TGBFRSATModelProduto = class
  private
    FcProd: string;
    FcEAN: string;
    FxProd: string;
    FNCM: string;
    FCEST: string;
    FCFOP: string;
    FuCom: string;
    FqCom: Double;
    FvUnCom: Double;
    FvProd: Double;
    FindRegra: TSATIndicadorRegraCalculo;
    FvDesc: Double;
    FvOutro: Double;
    FvItem: Double;
    FvRatDesc: Double;
    FvRatAcr: Double;
    FxCampoDet: string;
    FxTextoDet: string;
  public
    property cProd: string read FcProd write FcProd;
    property cEAN: string read FcEAN write FcEAN;
    property xProd: string read FxProd write FxProd;
    property NCM: string read FNCM write FNCM;
    property CEST: string read FCEST write FCEST;
    property CFOP: string read FCFOP write FCFOP;
    property uCom: string read FuCom write FuCom;
    property qCom: Double read FqCom write FqCom;
    property vUnCom: Double read FvUnCom write FvUnCom;
    property vProd: Double read FvProd write FvProd;
    property indRegra: TSATIndicadorRegraCalculo read FindRegra write FindRegra;
    property vDesc: Double read FvDesc write FvDesc;
    property vOutro: Double read FvOutro write FvOutro;
    property vItem: Double read FvItem write FvItem;
    property vRatDesc: Double read FvRatDesc write FvRatDesc;
    property vRatAcr: Double read FvRatAcr write FvRatAcr;
    property xCampoDet: string read FxCampoDet write FxCampoDet;
    property xTextoDet: string read FxTextoDet write FxTextoDet;
  end;

  TGBFRSATModelICMSTotal = class
  private
    FvICMS: Double;
    FvProd: Double;
    FvDesc: Double;
    FvPIS: Double;
    FvCOFINS: Double;
    FvPISST: Double;
    FvCOFINSST: Double;
    FvOutro: Double;
  public
    property vICMS: Double read FvICMS write FvICMS;
    property vProd: Double read FvProd write FvProd;
    property vDesc: Double read FvDesc write FvDesc;
    property vPIS: Double read FvPIS write FvPIS;
    property vCOFINS: Double read FvCOFINS write FvCOFINS;
    property vPISST: Double read FvPISST write FvPISST;
    property vCOFINSST: Double read FvCOFINSST write FvCOFINSST;
    property vOutro: Double read FvOutro write FvOutro;
  end;

  TGBFRSATModelIde = class
  private
    FcUF: Integer;
    FcNF: Integer;
    Fmod: string;
    FnSerieSAT: string;
    FnCFe: string;
    FdEmi: TDate;
    FhEmi: TTime;
    FcDV: Integer;
    FtpAmb: TSATAmbiente;
    FCNPJ: string;
    FsignAC: string;
    FassinaturaQRCODE: string;
    FnumeroCaixa: string;
  public
    property cUF: Integer read FcUF write FcUF;
    property cNF: Integer read FcNF write FcNF;
    property &mod: string read Fmod write Fmod;
    property nSerieSAT: string read FnSerieSAT write FnSerieSAT;
    property nCFe: string read FnCFe write FnCFe;
    property dEmi: TDate read FdEmi write FdEmi;
    property hEmi: TTime read FhEmi write FhEmi;
    property cDV: Integer read FcDV write FcDV;
    property tpAmb: TSATAmbiente read FtpAmb write FtpAmb;
    property CNPJ: string read FCNPJ write FCNPJ;
    property signAC: string read FsignAC write FsignAC;
    property assinaturaQRCODE: string read FassinaturaQRCODE write FassinaturaQRCODE;
    property numeroCaixa: string read FnumeroCaixa write FnumeroCaixa;
  end;

  TGBFRSATModelInfCFe = class
  private
    FId: string;
    Fversao: string;
    FversaoDadosEnt: string;
    FversaoSB: string;
    Fide: TGBFRSATModelIde;
    Femit: TGBFRSATModelEmitente;
    Fdest: TGBFRSATModelDestinatario;
    Fdet: TObjectList<TGBFRSATModelDetalhe>;
    Ftotal: TGBFRSATModelTotal;
    Fpgto: TGBFRSATModelPagamento;
    FinfAdic: TGBFRSATModelInformacaoAdicional;
  public
    constructor Create;
    destructor Destroy; override;

    property Id: string read FId write FId;
    property versao: string read Fversao write Fversao;
    property versaoDadosEnt: string read FversaoDadosEnt write FversaoDadosEnt;
    property versaoSB: string read FversaoSB write FversaoSB;
    property ide: TGBFRSATModelIde read Fide write Fide;
    property emit: TGBFRSATModelEmitente read Femit write Femit;
    property dest: TGBFRSATModelDestinatario read Fdest write Fdest;
    property det: TObjectList<TGBFRSATModelDetalhe> read Fdet write Fdet;
    property total: TGBFRSATModelTotal read Ftotal write Ftotal;
    property pgto: TGBFRSATModelPagamento read Fpgto write Fpgto;
    property infAdic: TGBFRSATModelInformacaoAdicional read FinfAdic write FinfAdic;
  end;

  TGBFRSATModelObsFisco = class
  private
    FxCampo: string;
    FxTexto: string;
  public
    property xCampo: string read FxCampo write FxCampo;
    property xTexto: string read FxTexto write FxTexto;
  end;

  TGBFRSATModelInformacaoAdicional = class
  private
    FobsFisco: TGBFRSATModelObsFisco;
    FinfCpl: string;
  public
    constructor Create;
    destructor Destroy; override;

    property infCpl: string read FinfCpl write FinfCpl;
    property obsFisco: TGBFRSATModelObsFisco read FobsFisco write FobsFisco;
  end;

  TGBFRSATModelISSQNTotal = class
  private
    FvBC: Double;
    FvISS: Double;
    FvPIS: Double;
    FvCOFINS: Double;
    FvPISST: Double;
    FvCOFINSST: Double;
  public
    property vBC: Double read FvBC write FvBC;
    property vISS: Double read FvISS write FvISS;
    property vPIS: Double read FvPIS write FvPIS;
    property vCOFINS: Double read FvCOFINS write FvCOFINS;
    property vPISST: Double read FvPISST write FvPISST;
    property vCOFINSST: Double read FvCOFINSST write FvCOFINSST;
  end;

  TGBFRSATModelMeioPagamento = class
  private
    FcMP: TSATMeioPagamento;
    FvMP: Double;
    FcAdmC: string;
  public
    property cMP: TSATMeioPagamento read FcMP write FcMP;
    property vMP: Double read FvMP write FvMP;
    property cAdmC: string read FcAdmC write FcAdmC;
  end;

  TGBFRSATModelPagamento = class
  private
    FMP: TObjectList<TGBFRSATModelMeioPagamento>;
    FvTroco: Double;
  public
    constructor Create;
    destructor Destroy; override;

    property MP: TObjectList<TGBFRSATModelMeioPagamento> read FMP write FMP;
    property vTroco: Double read FvTroco write FvTroco;
  end;

  TGBFRSATModelTotal = class
  private
    FICMSTot: TGBFRSATModelICMSTotal;
    FISSQNtot: TGBFRSATModelISSQNTotal;
    FvCFe: Double;
    FvCFeLei12741: Double;
  public
    constructor Create;
    destructor Destroy; override;

    property ICMSTot: TGBFRSATModelICMSTotal read FICMSTot write FICMSTot;
    property ISSQNtot: TGBFRSATModelISSQNTotal read FISSQNtot write FISSQNtot;
    property vCFe: Double read FvCFe write FvCFe;
    property vCFeLei12741: Double read FvCFeLei12741 write FvCFeLei12741;
  end;

  {Impostos}
  TGBFRSATModelImpostoCOFINS = class
  private
    FCST: string;
    FvBC: Double;
    FpCOFINS: Double;
    FvCOFINS: Double;
    FqBCProd: Double;
    FvAliqProd: Double;
  public
    property CST: string read FCST write FCST;
    property vBC: Double read FvBC write FvBC;
    property pCOFINS: Double read FpCOFINS write FpCOFINS;
    property vCOFINS: Double read FvCOFINS write FvCOFINS;
    property qBCProd: Double read FqBCProd write FqBCProd;
    property vAliqProd: Double read FvAliqProd write FvAliqProd;
  end;

  TGBFRSATModelImpostoCOFINSST = class
  private
    FvBC: Double;
    FpCOFINS: Double;
    FqBCProd: Double;
    FvAliqProd: Double;
    FvCOFINS: Double;
  public
    property vBC: Double read FvBC write FvBC;
    property pCOFINS: Double read FpCOFINS write FpCOFINS;
    property qBCProd: Double read FqBCProd write FqBCProd;
    property vAliqProd: Double read FvAliqProd write FvAliqProd;
    property vCOFINS: Double read FvCOFINS write FvCOFINS;
  end;

  TGBFRSATModelImpostoICMS = class
  private
    FOrig: string;
    FCST: string;
    FpICMS: Double;
    FvICMS: Double;
    FCSOSN: string;
  public
    property Orig: string read FOrig write FOrig;
    property CST: string read FCST write FCST;
    property pICMS: Double read FpICMS write FpICMS;
    property vICMS: Double read FvICMS write FvICMS;
    property CSOSN: string read FCSOSN write FCSOSN;
  end;

  TGBFRSATModelImpostoISSQN = class
  private
    FvDeducISSQN: Double;
    FvBC: Double;
    FvAliq: Double;
    FvISSQN: Double;
    FcMunFG: Integer;
    FcListServ: string;
    FcServTribMun: string;
    FcNatOp: string;
    FindIncFisc: Boolean;
  public
    property vDeducISSQN: Double read FvDeducISSQN write FvDeducISSQN;
    property vBC: Double read FvBC write FvBC;
    property vAliq: Double read FvAliq write FvAliq;
    property vISSQN: Double read FvISSQN write FvISSQN;
    property cMunFG: Integer read FcMunFG write FcMunFG;
    property cListServ: string read FcListServ write FcListServ;
    property cServTribMun: string read FcServTribMun write FcServTribMun;
    property cNatOp: string read FcNatOp write FcNatOp;
    property indIncFisc: Boolean read FindIncFisc write FindIncFisc;
  end;

  TGBFRSATModelImpostoPIS = class
  private
    FCST: string;
    FvBC: Double;
    FpPIS: Double;
    FvPIS: Double;
    FqBCProd: Double;
    FvAliqProd: Double;
  public
    property CST: string read FCST write FCST;
    property vBC: Double read FvBC write FvBC;
    property pPIS: Double read FpPIS write FpPIS;
    property vPIS: Double read FvPIS write FvPIS;
    property qBCProd: Double read FqBCProd write FqBCProd;
    property vAliqProd: Double read FvAliqProd write FvAliqProd;
  end;

  TGBFRSATModelImpostoPISST = class
  private
    FvBC: Double;
    FpPIS: Double;
    FqBCProd: Double;
    FvAliqProd: Double;
    FvPIS: Double;
  public
    property vBC: Double read FvBC write FvBC;
    property pPIS: Double read FpPIS write FpPIS;
    property qBCProd: Double read FqBCProd write FqBCProd;
    property vAliqProd: Double read FvAliqProd write FvAliqProd;
    property vPIS: Double read FvPIS write FvPIS;
  end;

implementation

{ TGBFRSATModelEmitente }

constructor TGBFRSATModelEmitente.Create;
begin
  FenderEmit := TGBFRSATModelEnderecoEmitente.Create;
end;

destructor TGBFRSATModelEmitente.Destroy;
begin
  FenderEmit.Free;
  inherited;
end;

{ TGBFRSATModelTotal }

constructor TGBFRSATModelTotal.Create;
begin
  FICMSTot := TGBFRSATModelICMSTotal.Create;
  FISSQNtot := TGBFRSATModelISSQNTotal.Create;
end;

destructor TGBFRSATModelTotal.Destroy;
begin
  FICMSTot.Free;
  FISSQNtot.Free;
  inherited;
end;

{ TGBFRSATModelPagamento }

constructor TGBFRSATModelPagamento.Create;
begin
  FMP := TObjectList<TGBFRSATModelMeioPagamento>.Create;
end;

destructor TGBFRSATModelPagamento.Destroy;
begin
  FMP.Free;
  inherited;
end;

{ TGBFRSATModelImposto }

constructor TGBFRSATModelImposto.Create;
begin
  FCOFINS := TGBFRSATModelImpostoCOFINS.Create;
  FCOFINSST := TGBFRSATModelImpostoCOFINSST.Create;
  FICMS := TGBFRSATModelImpostoICMS.Create;
  FISSQN := TGBFRSATModelImpostoISSQN.Create;
  FPIS := TGBFRSATModelImpostoPIS.Create;
  FPISST := TGBFRSATModelImpostoPISST.Create;
end;

destructor TGBFRSATModelImposto.Destroy;
begin
  FCOFINS.Free;
  FCOFINSST.Free;
  FICMS.Free;
  FISSQN.Free;
  FPIS.Free;
  FPISST.Free;
  inherited;
end;

{ TGBFRSATModelInfCFe }

constructor TGBFRSATModelInfCFe.Create;
begin
  Fide := TGBFRSATModelIde.Create;
  Femit := TGBFRSATModelEmitente.Create;
  Fdest := TGBFRSATModelDestinatario.Create;
  Fdet := TObjectList<TGBFRSATModelDetalhe>.Create;
  Ftotal := TGBFRSATModelTotal.Create;
  Fpgto := TGBFRSATModelPagamento.Create;
  FinfAdic := TGBFRSATModelInformacaoAdicional.Create;
end;

destructor TGBFRSATModelInfCFe.Destroy;
begin
  Fide.Free;
  Femit.Free;
  Fdest.Free;
  Fdet.Free;
  Ftotal.Free;
  Fpgto.Free;
  FinfAdic.Free;
  inherited;
end;

{ TGBFRSATModelCFe }

constructor TGBFRSATModelCFe.Create;
begin
  FinfCFe := TGBFRSATModelInfCFe.Create;
end;

destructor TGBFRSATModelCFe.Destroy;
begin
  FinfCFe.Free;
  inherited;
end;

{ TGBFRSATModelDetalhe }

constructor TGBFRSATModelDetalhe.Create;
begin
  Fprod := TGBFRSATModelProduto.Create;
  Fimposto := TGBFRSATModelImposto.Create;
end;

destructor TGBFRSATModelDetalhe.Destroy;
begin
  Fprod.Free;
  Fimposto.Free;
  inherited;
end;

{ TGBFRSATModelInformacaoAdicional }

constructor TGBFRSATModelInformacaoAdicional.Create;
begin
  FobsFisco := TGBFRSATModelObsFisco.Create;
end;

destructor TGBFRSATModelInformacaoAdicional.Destroy;
begin
  FobsFisco.Free;
  inherited;
end;


end.
