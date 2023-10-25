unit GBFR.NFe.Model.Imposto.ICMS;

interface

uses
  GBFR.NFe.Model.Types;

type
  TGBFRNFeModelICMS = class
  private
    Forig: string;
    FmodBC: TNFeModalidadeBC;
    FvBC: Currency;
    FpICMS: Currency;
    FvICMS: Currency;
    FmodBCST: TNFeModalidadeBCST;
    FCST: String;
    FpRedBC: Currency;
    FvICMSDeson: Currency;
    FvBCSTRet: Currency;
    FpST: Currency;
    FvICMSSTRet: Currency;
    FvBCST: Currency;
    FpICMSST: Currency;
    FvICMSST: Currency;
    FCSOSN: String;
    FmotDesICMS: TNFeMotivoDesoneracao;
    FpFCP: Currency;
    FvBCFCP: Currency;
    FvFCP: Currency;
    FvBCFCPST: Currency;
    FpFCPST: Currency;
    FvFCPST: Currency;
    FpICMSEfet: Currency;
    FvICMSEfet: Currency;
    FvBCFCPSTRet: Currency;
    FvBCEfet: Currency;
    FvICMSSubstituto: Currency;
    FpFCPSTRet: Currency;
    FpRedBCEfet: Currency;
    FvFCPSTRet: Currency;
    FpDif: Currency;
    FvICMSOp: Currency;
    FvICMSDif: Currency;

  public
    property orig: string read Forig write Forig;
    property CST: String read FCST write FCST;
    property CSOSN: String read FCSOSN write FCSOSN;
    property modBC: TNFeModalidadeBC read FmodBC write FmodBC;
    property vBC: Currency read FvBC write FvBC;
    property pICMS: Currency read FpICMS write FpICMS;
    property vICMS: Currency read FvICMS write FvICMS;
    property modBCST: TNFeModalidadeBCST read FmodBCST write FmodBCST;
    property pRedBC: Currency read FpRedBC write FpRedBC;
    property vICMSDeson: Currency read FvICMSDeson write FvICMSDeson;
    property vBCSTRet: Currency read FvBCSTRet write FvBCSTRet;
    property pST: Currency read FpST write FpST;
    property vICMSSTRet: Currency read FvICMSSTRet write FvICMSSTRet;
    property motDesICMS: TNFeMotivoDesoneracao read FmotDesICMS write FmotDesICMS;
    property vBCST: Currency read FvBCST write FvBCST;
    property pICMSST: Currency read FpICMSST write FpICMSST;
    property vICMSST: Currency read FvICMSST write FvICMSST;
    property vBCFCP: Currency read FvBCFCP write FvBCFCP;
    property pFCP: Currency read FpFCP write FpFCP;
    property vFCP: Currency read FvFCP write FvFCP;
    property vBCFCPST: Currency read FvBCFCPST write FvBCFCPST;
    property pFCPST: Currency read FpFCPST write FpFCPST;
    property vFCPST: Currency read FvFCPST write FvFCPST;
    property vICMSSubstituto: Currency read FvICMSSubstituto write FvICMSSubstituto;
    property vBCFCPSTRet: Currency read FvBCFCPSTRet write FvBCFCPSTRet;
    property pFCPSTRet: Currency read FpFCPSTRet write FpFCPSTRet;
    property vFCPSTRet: Currency read FvFCPSTRet write FvFCPSTRet;
    property pRedBCEfet: Currency read FpRedBCEfet write FpRedBCEfet;
    property vBCEfet: Currency read FvBCEfet write FvBCEfet;
    property pICMSEfet: Currency read FpICMSEfet write FpICMSEfet;
    property vICMSEfet: Currency read FvICMSEfet write FvICMSEfet;
    property pDif: Currency read FpDif write FpDif;
    property vICMSOp: Currency read FvICMSOp write FvICMSOp;
    property vICMSDif: Currency read FvICMSDif write FvICMSDif;
  end;

implementation

end.
