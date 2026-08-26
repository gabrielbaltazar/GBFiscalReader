unit GBFR.NFeAvulsa.Adapter;

interface

{$IFDEF WEAKPACKAGEUNIT}
  {$WEAKPACKAGEUNIT ON}
{$ENDIF}

uses
  GBFR.NFe.Model,
  GBFR.NFe.Model.Types,
  GBFR.NFe.Model.Endereco,
  GBFR.NFe.Model.Item,
  GBFR.NFe.Model.FormaPagamento,
  GBFR.NFeAvulsa.Classes;

type
  TGBFRNFeModelAdapter = class
  private
    class var FNFe: TGBFRNFeModel;
    class var FNFeProc: TGBFRNFeAvulsaNFeProc;

    class procedure ParseInfProt;
    class procedure ParseIde;
    class procedure ParseEmit;
    class procedure ParseDest;
    class procedure ParseEndereco(const ASource: TGBFRNFeAvulsaEndereco; const ATarget: TGBFRNFeModelEndereco);
    class procedure ParseItens;
    class procedure ParseICMSTot;
    class procedure ParsePag;
  public
    class function ToNFe(const ANFeProc: TGBFRNFeAvulsaNFeProc): TGBFRNFeModel;
  end;

implementation

uses
  System.SysUtils;

{ TGBFRNFeModelAdapter }

class procedure TGBFRNFeModelAdapter.ParseDest;
begin
  FNFe.dest.CNPJ := FNFeProc.NFe.InfNFe.Dest.CNPJ;
  FNFe.dest.xNome := FNFeProc.NFe.InfNFe.Dest.XNome;
  FNFe.dest.IE := FNFeProc.NFe.InfNFe.Dest.IE;
  FNFe.dest.indIEDest.fromInteger(FNFeProc.NFe.InfNFe.Dest.IndIEDest);
  ParseEndereco(FNFeProc.NFe.InfNFe.Dest.EnderDest, FNFe.dest.enderDest);
end;

class procedure TGBFRNFeModelAdapter.ParseEmit;
begin
  FNFe.emit.CNPJ := FNFeProc.NFe.InfNFe.Emit.CNPJ;
  FNFe.emit.xNome := FNFeProc.NFe.InfNFe.Emit.XNome;
  FNFe.emit.xFant := FNFeProc.NFe.InfNFe.Emit.XFant;
  FNFe.emit.IE := FNFeProc.NFe.InfNFe.Emit.IE;
  FNFe.emit.CRT.fromInteger(FNFeProc.NFe.InfNFe.Emit.CRT);
  ParseEndereco(FNFeProc.NFe.InfNFe.Emit.EnderEmit, FNFe.emit.enderEmit);
end;

class procedure TGBFRNFeModelAdapter.ParseEndereco(const ASource: TGBFRNFeAvulsaEndereco; const ATarget: TGBFRNFeModelEndereco);
begin
  ATarget.xLgr := ASource.XLgr;
  ATarget.nro := ASource.Nro;
  ATarget.xBairro := ASource.XBairro;
  ATarget.cMun := IntToStr(ASource.CMun);
  ATarget.xMun := ASource.XMun;
  ATarget.UF := ASource.UF;
  ATarget.CEP := ASource.CEP;
  ATarget.cPais := IntToStr(ASource.CPais);
  ATarget.xPais := ASource.XPais;
end;

class procedure TGBFRNFeModelAdapter.ParseICMSTot;
begin
  FNFe.ICMSTot.vBC := FNFeProc.NFe.InfNFe.Total.ICMSTot.VBC;
  FNFe.ICMSTot.vICMS := FNFeProc.NFe.InfNFe.Total.ICMSTot.VICMS;
  FNFe.ICMSTot.vICMSDeson := FNFeProc.NFe.InfNFe.Total.ICMSTot.VICMSDeson;
  FNFe.ICMSTot.vFCP := FNFeProc.NFe.InfNFe.Total.ICMSTot.VFCP;
  FNFe.ICMSTot.vBCST := FNFeProc.NFe.InfNFe.Total.ICMSTot.VBCST;
  FNFe.ICMSTot.vST := FNFeProc.NFe.InfNFe.Total.ICMSTot.VST;
  FNFe.ICMSTot.vFCPST := FNFeProc.NFe.InfNFe.Total.ICMSTot.VFCPST;
  FNFe.ICMSTot.vFCPSTRet := FNFeProc.NFe.InfNFe.Total.ICMSTot.VFCPSTRet;
  FNFe.ICMSTot.vProd := FNFeProc.NFe.InfNFe.Total.ICMSTot.VProd;
  FNFe.ICMSTot.vFrete := FNFeProc.NFe.InfNFe.Total.ICMSTot.VFrete;
  FNFe.ICMSTot.vSeg := FNFeProc.NFe.InfNFe.Total.ICMSTot.VSeg;
  FNFe.ICMSTot.vDesc := FNFeProc.NFe.InfNFe.Total.ICMSTot.VDesc;
  FNFe.ICMSTot.vII := FNFeProc.NFe.InfNFe.Total.ICMSTot.VII;
  FNFe.ICMSTot.vIPI := FNFeProc.NFe.InfNFe.Total.ICMSTot.VIPI;
  FNFe.ICMSTot.vIPIDevol := FNFeProc.NFe.InfNFe.Total.ICMSTot.VIPIDevol;
  FNFe.ICMSTot.vPIS := FNFeProc.NFe.InfNFe.Total.ICMSTot.VPIS;
  FNFe.ICMSTot.vCOFINS := FNFeProc.NFe.InfNFe.Total.ICMSTot.VCOFINS;
  FNFe.ICMSTot.vOutro := FNFeProc.NFe.InfNFe.Total.ICMSTot.VOutro;
  FNFe.ICMSTot.vNF := FNFeProc.NFe.InfNFe.Total.ICMSTot.VNF;
  FNFe.ICMSTot.vTotTrib := FNFeProc.NFe.InfNFe.Total.ICMSTot.VTotTrib;
end;

class procedure TGBFRNFeModelAdapter.ParseIde;
begin
  FNFe.ide.cUF := IntToStr(FNFeProc.NFe.InfNFe.Ide.CUF);
  FNFe.ide.cNF := FNFeProc.NFe.InfNFe.Ide.CNF;
  FNFe.ide.natOp := FNFeProc.NFe.InfNFe.Ide.NatOp;
  FNFe.ide.&mod := IntToStr(FNFeProc.NFe.InfNFe.Ide.&Mod);
  FNFe.ide.serie := FNFeProc.NFe.InfNFe.Ide.Serie;
  FNFe.ide.nNF := FNFeProc.NFe.InfNFe.Ide.NNF;
  FNFe.ide.dhEmi := FNFeProc.NFe.InfNFe.Ide.DhEmi;
  FNFe.ide.tpNF.fromInteger(FNFeProc.NFe.InfNFe.Ide.TpNF);
  FNFe.ide.idDest.fromInteger(FNFeProc.NFe.InfNFe.Ide.IdDest);
  FNFe.ide.cMunFG := IntToStr(FNFeProc.NFe.InfNFe.Ide.CMunFG);
  FNFe.ide.tpImp.fromInteger(FNFeProc.NFe.InfNFe.Ide.TpImp);
  FNFe.ide.tpEmis.fromInteger(FNFeProc.NFe.InfNFe.Ide.TpEmis);
  FNFe.ide.tpAmb.fromInteger(FNFeProc.NFe.InfNFe.Ide.TpAmb);
  FNFe.ide.finNFe.fromInteger(FNFeProc.NFe.InfNFe.Ide.FinNFe);
  FNFe.ide.indFinal.fromInteger(FNFeProc.NFe.InfNFe.Ide.IndFinal);
  FNFe.ide.indPres.fromInteger(FNFeProc.NFe.InfNFe.Ide.IndPres);
  FNFe.ide.procEmi.fromInteger(FNFeProc.NFe.InfNFe.Ide.ProcEmi);
  FNFe.ide.cDV := IntToStr(FNFeProc.NFe.InfNFe.Ide.CDV);
  FNFe.ide.verProc := FNFeProc.NFe.InfNFe.Ide.VerProc;
end;

class procedure TGBFRNFeModelAdapter.ParseInfProt;
begin
  FNFe.protNFe.chNFe := FNFeProc.ProtNFe.InfProt.ChNFe;
  FNFe.protNFe.nProt := FNFeProc.ProtNFe.InfProt.NProt;
  FNFe.protNFe.digVal := FNFeProc.ProtNFe.InfProt.DigVal;
  FNFe.protNFe.dhRecbto := FNFeProc.ProtNFe.InfProt.DhRecbto;
  FNFe.protNFe.xMotivo := FNFeProc.ProtNFe.InfProt.XMotivo;
  FNFe.protNFe.cStat := FNFeProc.ProtNFe.InfProt.CStat;
end;

class procedure TGBFRNFeModelAdapter.ParseItens;
var
  LDetItem: TGBFRNFeAvulsaDetItem;
  LItem: TGBFRNFeModelItem;
begin
  for LDetItem in FNFeProc.NFe.InfNFe.Det do
  begin
    LItem := TGBFRNFeModelItem.Create;
    try
      LItem.nItem := LDetItem.NItem;
      LItem.prod.cProd := LDetItem.Prod.CProd;
      LItem.prod.cEAN := LDetItem.Prod.CEAN;
      LItem.prod.xProd := LDetItem.Prod.XProd;
      LItem.prod.NCM := LDetItem.Prod.NCM;
      LItem.prod.CFOP := LDetItem.Prod.CFOP;
      LItem.prod.uCom := LDetItem.Prod.UCom;
      LItem.prod.qCom := LDetItem.Prod.QCom;
      LItem.prod.vUnCom := LDetItem.Prod.VUnCom;
      LItem.prod.vProd := LDetItem.Prod.VProd;
      LItem.prod.cEANTrib := LDetItem.Prod.CEANTrib;
      LItem.prod.uTrib := LDetItem.Prod.UTrib;
      LItem.prod.qTrib := LDetItem.Prod.QTrib;
      LItem.prod.vUnTrib := LDetItem.Prod.VUnTrib;
      LItem.prod.indTot.fromInteger(LDetItem.Prod.IndTot);

      LItem.imposto.ICMS.orig := LDetItem.Imposto.ICMS.Orig;
      LItem.imposto.ICMS.CSOSN := LDetItem.Imposto.ICMS.CSOSN;
      LItem.imposto.IPI.cEnq := LDetItem.Imposto.IPI.CEnq;
      LItem.imposto.IPI.IPITrib.CST := LDetItem.Imposto.IPI.CST;
      LItem.imposto.PIS.CST := LDetItem.Imposto.PIS.CST;
      LItem.imposto.COFINS.CST := LDetItem.Imposto.COFINS.CST;
    except
      LItem.Free;
      raise;
    end;
    FNFe.itens.Add(LItem);
  end;
end;

class procedure TGBFRNFeModelAdapter.ParsePag;
var
  LDetPag: TGBFRNFeAvulsaDetPag;
  LPagamento: TGBFRNFeModelFormaPagamento;
begin
  for LDetPag in FNFeProc.NFe.InfNFe.Pag.DetPag do
  begin
    LPagamento := TGBFRNFeModelFormaPagamento.Create;
    try
      LPagamento.VPag := LDetPag.VPag;
      LPagamento.TPag.FromString(LDetPag.TPag);
      LPagamento.IndPag.FromString(IntToStr(LDetPag.IndPag));
    except
      LPagamento.Free;
      raise;
    end;
    FNFe.pag.detPag.Add(LPagamento);
  end;
end;

class function TGBFRNFeModelAdapter.ToNFe(const ANFeProc: TGBFRNFeAvulsaNFeProc): TGBFRNFeModel;
begin
  FNFeProc := ANFeProc;
  if Assigned(FNFe) then
    FreeAndNil(FNFe);
  Result := TGBFRNFeModel.Create;
  FNFe := Result;

  FNFe.Id := FNFeProc.NFe.InfNFe.Id;
  FNFe.versao := FNFeProc.Versao;

  ParseInfProt;
  ParseIde;
  ParseEmit;
  ParseDest;
  ParseItens;
  ParseICMSTot;
  ParsePag;
end;

end.
