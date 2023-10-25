unit GBFR.NFe.Model.DI;

interface

uses
  GBFR.NFe.Model.Adi,
  GBFR.NFe.Model.Types,
  System.Generics.Collections;

type
  TGBFRNFeModelDI = class
  private
    FcExportador: string;
    FxLocDesemb: string;
    FnDI: string;
    FUFDesemb: string;
    FdDesemb: TDateTime;
    FdDI: TDateTime;
    Fadicoes: TObjectList<TGBFRNFeModelAdi>;
    FCNPJ: string;
    FtpIntermedio: TNFeDIIndicadorIntermedio;
    FtpViaTransp: TNFeDIIndicadorViaTransp;
    FvAFRMM: Currency;
    FUFTerceiro: string;

  public
    property nDI: string read FnDI write FnDI;
    property dDI: TDateTime read FdDI write FdDI;
    property xLocDesemb: string read FxLocDesemb write FxLocDesemb;
    property UFDesemb: string read FUFDesemb write FUFDesemb;
    property dDesemb: TDateTime read FdDesemb write FdDesemb;
    property tpViaTransp: TNFeDIIndicadorViaTransp read FtpViaTransp write FtpViaTransp;
    property vAFRMM: Currency read FvAFRMM write FvAFRMM;
    property tpIntermedio: TNFeDIIndicadorIntermedio read FtpIntermedio write FtpIntermedio;
    property CNPJ: string read FCNPJ write FCNPJ;
    property UFTerceiro: string read FUFTerceiro write FUFTerceiro;
    property cExportador: string read FcExportador write FcExportador;
    property adicoes: TObjectList<TGBFRNFeModelAdi> read Fadicoes write Fadicoes;

    constructor create;
    destructor  Destroy; override;
  end;

implementation

{ TGBFRNFeModelDI }

constructor TGBFRNFeModelDI.create;
begin
  Fadicoes := TObjectList<TGBFRNFeModelAdi>.create;
end;

destructor TGBFRNFeModelDI.Destroy;
begin
  Fadicoes.Free;
  inherited;
end;

end.
