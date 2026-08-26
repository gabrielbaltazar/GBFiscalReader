unit GBFR.NFe.Avulsa.Test;

interface

uses
  DUnitX.TestFramework,
  GBFR.NFeAvulsa.XML.Interfaces,
  GBFR.NFeAvulsa.Classes;

type
  [TestFixture]
  TGBFRNFeAvulsaTest = class
  private
    FXml: IGBFRNFeAvulsaXML;
    FNotaAvulsa: TGBFRNFeAvulsaNFeProc;
  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    procedure InfProtTest;

    [Test]
    procedure InfNFeAvulsaTest;

    [Test]
    procedure InfNFeTotalTest;

    [Test]
    procedure InfNFeIdeTest;

    [Test]
    procedure InfNFeEmitTest;

    [Test]
    procedure InfNFeDestTest;

    [Test]
    procedure InfNFeItemTest;

    [Test]
    procedure InfNFeImpostoICMSTest;

    [Test]
    procedure InfNFeImpostoIPITest;

    [Test]
    procedure InfNFeImpostoPISTest;

    [Test]
    procedure InfNFeImpostoCOFINSTest;

    [Test]
    procedure InfNFePagTest;

    [Test]
    procedure InfNFeTranspTest;
  end;

implementation

uses
  System.SysUtils,
  System.DateUtils,
  GBFR.NFe.Avulsa.Constants;

procedure TGBFRNFeAvulsaTest.InfNFeAvulsaTest;
begin
  FNotaAvulsa := FXml.LoadFromContent(CXMLBase);
  Assert.IsNotNull(FNotaAvulsa);
  Assert.AreEqual('99999999', FNotaAvulsa.NFe.InfNFe.Avulsa.Matr);
  Assert.AreEqual('SC', FNotaAvulsa.NFe.InfNFe.Avulsa.UF);
  Assert.AreEqual('NFA-e WEB', FNotaAvulsa.NFe.InfNFe.Avulsa.XAgente);
  Assert.AreEqual('82951310000156', FNotaAvulsa.NFe.InfNFe.Avulsa.CNPJ);
  Assert.AreEqual('SEFAZ-SC', FNotaAvulsa.NFe.InfNFe.Avulsa.XOrgao);
  Assert.AreEqual('SEFAZ-SC', FNotaAvulsa.NFe.InfNFe.Avulsa.RepEmi);
end;

procedure TGBFRNFeAvulsaTest.InfNFeDestTest;
begin
  FNotaAvulsa := FXml.LoadFromContent(CXMLBase);
  Assert.IsNotNull(FNotaAvulsa);
  Assert.AreEqual('COSTAO DO SANTINHO TURISMO E LAZER S.', FNotaAvulsa.NFe.InfNFe.Dest.XNome);
  Assert.AreEqual('04908757000139', FNotaAvulsa.NFe.InfNFe.Dest.CNPJ);
  Assert.AreEqual('254894135', FNotaAvulsa.NFe.InfNFe.Dest.IE);
  Assert.AreEqual(1, FNotaAvulsa.NFe.InfNFe.Dest.IndIEDest);

  Assert.AreEqual('SC', FNotaAvulsa.NFe.InfNFe.Dest.EnderDest.UF);
  Assert.AreEqual('BRASIL', FNotaAvulsa.NFe.InfNFe.Dest.EnderDest.XPais);
  Assert.AreEqual(1058, FNotaAvulsa.NFe.InfNFe.Dest.EnderDest.CPais);
  Assert.AreEqual('ESTRADA VEREADOR ONILDO LEMOS', FNotaAvulsa.NFe.InfNFe.Dest.EnderDest.XLgr);
  Assert.AreEqual('FLORIANOPOLIS', FNotaAvulsa.NFe.InfNFe.Dest.EnderDest.XMun);
  Assert.AreEqual('2505', FNotaAvulsa.NFe.InfNFe.Dest.EnderDest.Nro);
  Assert.AreEqual(4205407, FNotaAvulsa.NFe.InfNFe.Dest.EnderDest.CMun);
  Assert.AreEqual('INGLESES DO RIO VERMELHO', FNotaAvulsa.NFe.InfNFe.Dest.EnderDest.XBairro);
  Assert.AreEqual('88058700', FNotaAvulsa.NFe.InfNFe.Dest.EnderDest.CEP);
end;

procedure TGBFRNFeAvulsaTest.InfNFeEmitTest;
begin
  FNotaAvulsa := FXml.LoadFromContent(CXMLBase);
  Assert.IsNotNull(FNotaAvulsa);
  Assert.AreEqual('VENDO VERDE COMERCIO DE ORGANICOS LTDA', FNotaAvulsa.NFe.InfNFe.Emit.XNome);
  Assert.AreEqual('VENDO VERDE ORGANICOS', FNotaAvulsa.NFe.InfNFe.Emit.XFant);
  Assert.AreEqual('21619082000127', FNotaAvulsa.NFe.InfNFe.Emit.CNPJ);
  Assert.AreEqual('258642017', FNotaAvulsa.NFe.InfNFe.Emit.IE);
  Assert.AreEqual(1, FNotaAvulsa.NFe.InfNFe.Emit.CRT);

  Assert.AreEqual('SC', FNotaAvulsa.NFe.InfNFe.Emit.EnderEmit.UF);
  Assert.AreEqual(1058, FNotaAvulsa.NFe.InfNFe.Emit.EnderEmit.CPais);
  Assert.AreEqual('SC 401', FNotaAvulsa.NFe.InfNFe.Emit.EnderEmit.XLgr);
  Assert.AreEqual('FLORIANOPOLIS', FNotaAvulsa.NFe.InfNFe.Emit.EnderEmit.XMun);
  Assert.AreEqual('3522', FNotaAvulsa.NFe.InfNFe.Emit.EnderEmit.Nro);
  Assert.AreEqual(4205407, FNotaAvulsa.NFe.InfNFe.Emit.EnderEmit.CMun);
  Assert.AreEqual('SACO GRANDE II', FNotaAvulsa.NFe.InfNFe.Emit.EnderEmit.XBairro);
  Assert.AreEqual('88032000', FNotaAvulsa.NFe.InfNFe.Emit.EnderEmit.CEP);
end;

procedure TGBFRNFeAvulsaTest.InfNFeIdeTest;
begin
  FNotaAvulsa := FXml.LoadFromContent(CXMLBase);
  Assert.IsNotNull(FNotaAvulsa);
  Assert.AreEqual(1, FNotaAvulsa.NFe.InfNFe.Ide.TpNF);
  Assert.AreEqual(55, FNotaAvulsa.NFe.InfNFe.Ide.&Mod);
  Assert.AreEqual(0, FNotaAvulsa.NFe.InfNFe.Ide.IndPres);
  Assert.AreEqual(1, FNotaAvulsa.NFe.InfNFe.Ide.TpImp);
  Assert.AreEqual(12139617, FNotaAvulsa.NFe.InfNFe.Ide.NNF);
  Assert.AreEqual(4205407, FNotaAvulsa.NFe.InfNFe.Ide.CMunFG);
  Assert.AreEqual(1, FNotaAvulsa.NFe.InfNFe.Ide.ProcEmi);
  Assert.AreEqual(1, FNotaAvulsa.NFe.InfNFe.Ide.FinNFe);
  Assert.AreEqual('2026-08-07 08:09:00', FNotaAvulsa.NFe.InfNFe.Ide.DhEmi.Format('yyyy-MM-dd hh:mm:ss'));
  Assert.AreEqual(1, FNotaAvulsa.NFe.InfNFe.Ide.TpAmb);
  Assert.AreEqual(1, FNotaAvulsa.NFe.InfNFe.Ide.IndFinal);
  Assert.AreEqual(1, FNotaAvulsa.NFe.InfNFe.Ide.IdDest);
  Assert.AreEqual(1, FNotaAvulsa.NFe.InfNFe.Ide.TpEmis);
  Assert.AreEqual(4, FNotaAvulsa.NFe.InfNFe.Ide.CDV);
  Assert.AreEqual(42, FNotaAvulsa.NFe.InfNFe.Ide.CUF);
  Assert.AreEqual('890', FNotaAvulsa.NFe.InfNFe.Ide.Serie);
  Assert.AreEqual('Venda de Mercadoria', FNotaAvulsa.NFe.InfNFe.Ide.NatOp);
  Assert.AreEqual('03968699', FNotaAvulsa.NFe.InfNFe.Ide.CNF);
  Assert.AreEqual('SVRS20260612220011', FNotaAvulsa.NFe.InfNFe.Ide.VerProc);
  Assert.AreEqual('0', FNotaAvulsa.NFe.InfNFe.Ide.IndIntermed);
end;

procedure TGBFRNFeAvulsaTest.InfNFeImpostoCOFINSTest;
begin
  FNotaAvulsa := FXml.LoadFromContent(CXMLBase);
  Assert.IsNotNull(FNotaAvulsa);
  Assert.AreEqual(1, FNotaAvulsa.NFe.InfNFe.Det.Count);
  Assert.AreEqual('08', FNotaAvulsa.NFe.InfNFe.Det[0].Imposto.COFINS.CST);
end;

procedure TGBFRNFeAvulsaTest.InfNFeImpostoICMSTest;
begin
  FNotaAvulsa := FXml.LoadFromContent(CXMLBase);
  Assert.IsNotNull(FNotaAvulsa);
  Assert.AreEqual(1, FNotaAvulsa.NFe.InfNFe.Det.Count);
  Assert.AreEqual('0', FNotaAvulsa.NFe.InfNFe.Det[0].Imposto.ICMS.Orig);
  Assert.AreEqual('102', FNotaAvulsa.NFe.InfNFe.Det[0].Imposto.ICMS.CSOSN);
end;

procedure TGBFRNFeAvulsaTest.InfNFeImpostoIPITest;
begin
  FNotaAvulsa := FXml.LoadFromContent(CXMLBase);
  Assert.IsNotNull(FNotaAvulsa);
  Assert.AreEqual(1, FNotaAvulsa.NFe.InfNFe.Det.Count);
  Assert.AreEqual('53', FNotaAvulsa.NFe.InfNFe.Det[0].Imposto.IPI.CST);
  Assert.AreEqual('999', FNotaAvulsa.NFe.InfNFe.Det[0].Imposto.IPI.CEnq);
end;

procedure TGBFRNFeAvulsaTest.InfNFeImpostoPISTest;
begin
  FNotaAvulsa := FXml.LoadFromContent(CXMLBase);
  Assert.IsNotNull(FNotaAvulsa);
  Assert.AreEqual(1, FNotaAvulsa.NFe.InfNFe.Det.Count);
  Assert.AreEqual('08', FNotaAvulsa.NFe.InfNFe.Det[0].Imposto.PIS.CST);
end;

procedure TGBFRNFeAvulsaTest.InfNFeItemTest;
var
  LProd: TGBFRNFeAvulsaProduto;
begin
  FNotaAvulsa := FXml.LoadFromContent(CXMLBase);
  Assert.IsNotNull(FNotaAvulsa);
  Assert.AreEqual(1, FNotaAvulsa.NFe.InfNFe.Det.Count);
  Assert.AreEqual(1, FNotaAvulsa.NFe.InfNFe.Det[0].NItem);

  LProd := FNotaAvulsa.NFe.InfNFe.Det[0].Prod;
  Assert.AreEqual('SEM GTIN', LProd.CEAN);
  Assert.AreEqual('105311', LProd.CProd);
  Assert.AreEqual<Double>(9, LProd.QCom);
  Assert.AreEqual('SEM GTIN', LProd.CEANTrib);
  Assert.AreEqual<Double>(5.9, LProd.VUnTrib);
  Assert.AreEqual<Double>(9, LProd.QTrib);
  Assert.AreEqual<Double>(53.10, LProd.VProd);
  Assert.AreEqual('TAXA', LProd.XProd);
  Assert.AreEqual<Double>(5.9, LProd.VUnCom);
  Assert.AreEqual(1, LProd.IndTot);
  Assert.AreEqual('UN', LProd.UTrib);
  Assert.AreEqual('21069090', LProd.NCM);
  Assert.AreEqual('UN', LProd.UCom);
  Assert.AreEqual('5102', LProd.CFOP);
end;

procedure TGBFRNFeAvulsaTest.InfNFePagTest;
begin
  FNotaAvulsa := FXml.LoadFromContent(CXMLBase);
  Assert.IsNotNull(FNotaAvulsa);
  Assert.AreEqual(1, FNotaAvulsa.NFe.InfNFe.Pag.DetPag.Count);
  Assert.AreEqual<Double>(53.10, FNotaAvulsa.NFe.InfNFe.Pag.DetPag[0].VPag);
  Assert.AreEqual('01', FNotaAvulsa.NFe.InfNFe.Pag.DetPag[0].TPag);
  Assert.AreEqual(0, FNotaAvulsa.NFe.InfNFe.Pag.DetPag[0].IndPag);
end;

procedure TGBFRNFeAvulsaTest.InfNFeTotalTest;
begin
  FNotaAvulsa := FXml.LoadFromContent(CXMLBase);
  Assert.IsNotNull(FNotaAvulsa);
  Assert.AreEqual<Double>(0, FNotaAvulsa.NFe.InfNFe.Total.ICMSTot.VCOFINS);
  Assert.AreEqual<Double>(0, FNotaAvulsa.NFe.InfNFe.Total.ICMSTot.VBCST);
  Assert.AreEqual<Double>(0, FNotaAvulsa.NFe.InfNFe.Total.ICMSTot.VICMSDeson);
  Assert.AreEqual<Double>(53.10, FNotaAvulsa.NFe.InfNFe.Total.ICMSTot.VProd);
  Assert.AreEqual<Double>(0, FNotaAvulsa.NFe.InfNFe.Total.ICMSTot.VSeg);
  Assert.AreEqual<Double>(0, FNotaAvulsa.NFe.InfNFe.Total.ICMSTot.VFCP);
  Assert.AreEqual<Double>(0, FNotaAvulsa.NFe.InfNFe.Total.ICMSTot.VFCPST);
  Assert.AreEqual<Double>(53.10, FNotaAvulsa.NFe.InfNFe.Total.ICMSTot.VNF);
  Assert.AreEqual<Double>(0, FNotaAvulsa.NFe.InfNFe.Total.ICMSTot.VTotTrib);
  Assert.AreEqual<Double>(0, FNotaAvulsa.NFe.InfNFe.Total.ICMSTot.VPIS);
  Assert.AreEqual<Double>(0, FNotaAvulsa.NFe.InfNFe.Total.ICMSTot.VIPIDevol);
  Assert.AreEqual<Double>(0, FNotaAvulsa.NFe.InfNFe.Total.ICMSTot.VBC);
  Assert.AreEqual<Double>(0, FNotaAvulsa.NFe.InfNFe.Total.ICMSTot.VST);
  Assert.AreEqual<Double>(0, FNotaAvulsa.NFe.InfNFe.Total.ICMSTot.VICMS);
  Assert.AreEqual<Double>(0, FNotaAvulsa.NFe.InfNFe.Total.ICMSTot.VII);
  Assert.AreEqual<Double>(0, FNotaAvulsa.NFe.InfNFe.Total.ICMSTot.VFCPSTRet);
  Assert.AreEqual<Double>(0, FNotaAvulsa.NFe.InfNFe.Total.ICMSTot.VDesc);
  Assert.AreEqual<Double>(0, FNotaAvulsa.NFe.InfNFe.Total.ICMSTot.VOutro);
  Assert.AreEqual<Double>(0, FNotaAvulsa.NFe.InfNFe.Total.ICMSTot.VIPI);
  Assert.AreEqual<Double>(0, FNotaAvulsa.NFe.InfNFe.Total.ICMSTot.VFrete);
end;

procedure TGBFRNFeAvulsaTest.InfNFeTranspTest;
begin
  FNotaAvulsa := FXml.LoadFromContent(CXMLBase);
  Assert.IsNotNull(FNotaAvulsa);
  Assert.AreEqual(9, FNotaAvulsa.NFe.InfNFe.Transp.ModFrete);
end;

procedure TGBFRNFeAvulsaTest.InfProtTest;
begin
  FNotaAvulsa := FXml.LoadFromContent(CXMLBase);
  Assert.IsNotNull(FNotaAvulsa);
  Assert.AreEqual('4.00', FNotaAvulsa.Versao);
  Assert.AreEqual('242260366429847', FNotaAvulsa.ProtNFe.InfProt.NProt);
  Assert.AreEqual('VCGfDM1lGSsctC3+mMJEBbs9SwM=', FNotaAvulsa.ProtNFe.InfProt.DigVal);
  Assert.AreEqual('2026-08-07 08:13:49', FNotaAvulsa.ProtNFe.InfProt.DhRecbto.Format('yyyy-MM-dd hh:mm:ss'));
  Assert.AreEqual('42260882951310000156558900121396171039686994', FNotaAvulsa.ProtNFe.InfProt.ChNFe);
  Assert.AreEqual('Autorizado o uso da NF-e', FNotaAvulsa.ProtNFe.InfProt.XMotivo);
  Assert.AreEqual(100, FNotaAvulsa.ProtNFe.InfProt.CStat);
end;

procedure TGBFRNFeAvulsaTest.Setup;
begin
  FNotaAvulsa := nil;
  FXml := GetNFeAvulsaXML;
end;

procedure TGBFRNFeAvulsaTest.TearDown;
begin
  FNotaAvulsa.Free;
end;

end.
