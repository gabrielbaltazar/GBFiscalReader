unit GBFR.NFeAvulsa.Adapter.Test;

interface

uses
  DUnitX.TestFramework,
  GBFR.NFe.Model,
  GBFR.NFeAvulsa.Adapter,
  GBFR.NFeAvulsa.XML.Interfaces,
  GBFR.NFeAvulsa.Classes,
  GBFR.NFe.Avulsa.Constants;

type
  [TestFixture]
  TGBFRNFeAvulsaAdapterTest = class
  private
    FXml: IGBFRNFeAvulsaXML;
    FNotaAvulsa: TGBFRNFeAvulsaNFeProc;
    FNFe: TGBFRNFeModel;
  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    procedure TestInfProt;

    [Test]
    procedure TestIde;

    [Test]
    procedure TestEmit;

    [Test]
    procedure TestDest;

    [Test]
    procedure TestItem;

    [Test]
    procedure TestImpostoICMS;

    [Test]
    procedure TestImpostoIPI;

    [Test]
    procedure TestImpostoPIS;

    [Test]
    procedure TestImpostoCOFINS;

    [Test]
    procedure TestICMSTot;

    [Test]
    procedure TestPag;
  end;

implementation

uses
  System.SysUtils,
  System.DateUtils,
  GBFR.NFe.Model.Types;

procedure TGBFRNFeAvulsaAdapterTest.Setup;
begin
  FXml := GetNFeAvulsaXML;
  FNotaAvulsa := FXml.LoadFromContent(CXMLBase);
  FNFe := TGBFRNFeModelAdapter.ToNFe(FNotaAvulsa);
end;

procedure TGBFRNFeAvulsaAdapterTest.TearDown;
begin
  FNotaAvulsa.Free;
end;

procedure TGBFRNFeAvulsaAdapterTest.TestInfProt;
begin
  Assert.IsNotNull(FNFe);
  Assert.AreEqual('4.00', FNFe.versao);
  Assert.AreEqual('NFe42260882951310000156558900121396171039686994', FNFe.Id);
  Assert.AreEqual('242260366429847', FNFe.protNFe.nProt);
  Assert.AreEqual('VCGfDM1lGSsctC3+mMJEBbs9SwM=', FNFe.protNFe.digVal);
  Assert.AreEqual('2026-08-07 08:13:49', FNFe.protNFe.dhRecbto.Format('yyyy-MM-dd hh:mm:ss'));
  Assert.AreEqual('42260882951310000156558900121396171039686994', FNFe.protNFe.chNFe);
  Assert.AreEqual('Autorizado o uso da NF-e', FNFe.protNFe.xMotivo);
  Assert.AreEqual(100, FNFe.protNFe.cStat);
end;

procedure TGBFRNFeAvulsaAdapterTest.TestIde;
begin
  Assert.AreEqual('42', FNFe.ide.cUF);
  Assert.AreEqual('03968699', FNFe.ide.cNF);
  Assert.AreEqual('Venda de Mercadoria', FNFe.ide.natOp);
  Assert.AreEqual('55', FNFe.ide.&mod);
  Assert.AreEqual('890', FNFe.ide.serie);
  Assert.AreEqual(12139617, FNFe.ide.nNF);
  Assert.AreEqual('2026-08-07 08:09:00', FNFe.ide.dhEmi.Format('yyyy-MM-dd hh:mm:ss'));
  Assert.AreEqual(NFeSaida, FNFe.ide.tpNF);
  Assert.AreEqual(NFeInterna, FNFe.ide.idDest);
  Assert.AreEqual('4205407', FNFe.ide.cMunFG);
  Assert.AreEqual(NFeRetrato, FNFe.ide.tpImp);
  Assert.AreEqual(NFeEmissaoNormal, FNFe.ide.tpEmis);
  Assert.AreEqual(NFeProducao, FNFe.ide.tpAmb);
  Assert.AreEqual(NFeNormal, FNFe.ide.finNFe);
  Assert.AreEqual(NFeConsumidorFinal, FNFe.ide.indFinal);
  Assert.AreEqual(NFeNaoSeAplica, FNFe.ide.indPres);
  Assert.AreEqual(NFeAvulsaPeloFisco, FNFe.ide.procEmi);
  Assert.AreEqual('4', FNFe.ide.cDV);
  Assert.AreEqual('SVRS20260612220011', FNFe.ide.verProc);
end;

procedure TGBFRNFeAvulsaAdapterTest.TestEmit;
begin
  Assert.AreEqual('21619082000127', FNFe.emit.CNPJ);
  Assert.AreEqual('VENDO VERDE COMERCIO DE ORGANICOS LTDA', FNFe.emit.xNome);
  Assert.AreEqual('VENDO VERDE ORGANICOS', FNFe.emit.xFant);
  Assert.AreEqual('258642017', FNFe.emit.IE);
  Assert.AreEqual(NFeSimplesNacional, FNFe.emit.CRT);

  Assert.AreEqual('SC 401', FNFe.emit.enderEmit.xLgr);
  Assert.AreEqual('3522', FNFe.emit.enderEmit.nro);
  Assert.AreEqual('SACO GRANDE II', FNFe.emit.enderEmit.xBairro);
  Assert.AreEqual('4205407', FNFe.emit.enderEmit.cMun);
  Assert.AreEqual('FLORIANOPOLIS', FNFe.emit.enderEmit.xMun);
  Assert.AreEqual('SC', FNFe.emit.enderEmit.UF);
  Assert.AreEqual('88032000', FNFe.emit.enderEmit.CEP);
  Assert.AreEqual('1058', FNFe.emit.enderEmit.cPais);
end;

procedure TGBFRNFeAvulsaAdapterTest.TestDest;
begin
  Assert.AreEqual('04908757000139', FNFe.dest.CNPJ);
  Assert.AreEqual('COSTAO DO SANTINHO TURISMO E LAZER S.', FNFe.dest.xNome);
  Assert.AreEqual('254894135', FNFe.dest.IE);
  Assert.AreEqual(NFeContribuinteICMS, FNFe.dest.indIEDest);

  Assert.AreEqual('ESTRADA VEREADOR ONILDO LEMOS', FNFe.dest.enderDest.xLgr);
  Assert.AreEqual('2505', FNFe.dest.enderDest.nro);
  Assert.AreEqual('INGLESES DO RIO VERMELHO', FNFe.dest.enderDest.xBairro);
  Assert.AreEqual('4205407', FNFe.dest.enderDest.cMun);
  Assert.AreEqual('FLORIANOPOLIS', FNFe.dest.enderDest.xMun);
  Assert.AreEqual('SC', FNFe.dest.enderDest.UF);
  Assert.AreEqual('88058700', FNFe.dest.enderDest.CEP);
  Assert.AreEqual('1058', FNFe.dest.enderDest.cPais);
  Assert.AreEqual('BRASIL', FNFe.dest.enderDest.xPais);
end;

procedure TGBFRNFeAvulsaAdapterTest.TestItem;
begin
  Assert.AreEqual(1, FNFe.itens.Count);
  Assert.AreEqual(1, FNFe.itens[0].nItem);
  Assert.AreEqual('105311', FNFe.itens[0].prod.cProd);
  Assert.AreEqual('SEM GTIN', FNFe.itens[0].prod.cEAN);
  Assert.AreEqual('TAXA', FNFe.itens[0].prod.xProd);
  Assert.AreEqual('21069090', FNFe.itens[0].prod.NCM);
  Assert.AreEqual('5102', FNFe.itens[0].prod.CFOP);
  Assert.AreEqual('UN', FNFe.itens[0].prod.uCom);
  Assert.AreEqual<Double>(9, FNFe.itens[0].prod.qCom);
  Assert.AreEqual<Currency>(5.90, FNFe.itens[0].prod.vUnCom);
  Assert.AreEqual<Currency>(53.10, FNFe.itens[0].prod.vProd);
  Assert.AreEqual('SEM GTIN', FNFe.itens[0].prod.cEANTrib);
  Assert.AreEqual('UN', FNFe.itens[0].prod.uTrib);
  Assert.AreEqual<Double>(9, FNFe.itens[0].prod.qTrib);
  Assert.AreEqual<Currency>(5.90, FNFe.itens[0].prod.vUnTrib);
  Assert.AreEqual(NFeCompoe, FNFe.itens[0].prod.indTot);
end;

procedure TGBFRNFeAvulsaAdapterTest.TestImpostoICMS;
begin
  Assert.AreEqual('0', FNFe.itens[0].imposto.ICMS.orig);
  Assert.AreEqual('102', FNFe.itens[0].imposto.ICMS.CSOSN);
end;

procedure TGBFRNFeAvulsaAdapterTest.TestImpostoIPI;
begin
  Assert.AreEqual('53', FNFe.itens[0].imposto.IPI.CST);
  Assert.AreEqual('999', FNFe.itens[0].imposto.IPI.cEnq);
end;

procedure TGBFRNFeAvulsaAdapterTest.TestImpostoPIS;
begin
  Assert.AreEqual('08', FNFe.itens[0].imposto.PIS.CST);
end;

procedure TGBFRNFeAvulsaAdapterTest.TestImpostoCOFINS;
begin
  Assert.AreEqual('08', FNFe.itens[0].imposto.COFINS.CST);
end;

procedure TGBFRNFeAvulsaAdapterTest.TestICMSTot;
begin
  Assert.AreEqual<Currency>(0, FNFe.ICMSTot.vCOFINS);
  Assert.AreEqual<Currency>(0, FNFe.ICMSTot.vBCST);
  Assert.AreEqual<Currency>(0, FNFe.ICMSTot.vICMSDeson);
  Assert.AreEqual<Currency>(53.10, FNFe.ICMSTot.vProd);
  Assert.AreEqual<Currency>(0, FNFe.ICMSTot.vSeg);
  Assert.AreEqual<Currency>(0, FNFe.ICMSTot.vFCP);
  Assert.AreEqual<Currency>(0, FNFe.ICMSTot.vFCPST);
  Assert.AreEqual<Currency>(53.10, FNFe.ICMSTot.vNF);
  Assert.AreEqual<Currency>(0, FNFe.ICMSTot.vTotTrib);
  Assert.AreEqual<Currency>(0, FNFe.ICMSTot.vPIS);
  Assert.AreEqual<Currency>(0, FNFe.ICMSTot.vIPIDevol);
  Assert.AreEqual<Currency>(0, FNFe.ICMSTot.vBC);
  Assert.AreEqual<Currency>(0, FNFe.ICMSTot.vST);
  Assert.AreEqual<Currency>(0, FNFe.ICMSTot.vICMS);
  Assert.AreEqual<Currency>(0, FNFe.ICMSTot.vII);
  Assert.AreEqual<Currency>(0, FNFe.ICMSTot.vFCPSTRet);
  Assert.AreEqual<Currency>(0, FNFe.ICMSTot.vDesc);
  Assert.AreEqual<Currency>(0, FNFe.ICMSTot.vOutro);
  Assert.AreEqual<Currency>(0, FNFe.ICMSTot.vIPI);
  Assert.AreEqual<Currency>(0, FNFe.ICMSTot.vFrete);
end;

procedure TGBFRNFeAvulsaAdapterTest.TestPag;
begin
  Assert.AreEqual(1, FNFe.pag.detPag.Count);
  Assert.AreEqual<Currency>(53.10, FNFe.pag.detPag[0].VPag);
  Assert.AreEqual(NFeFPDinheiro, FNFe.pag.detPag[0].TPag);
  Assert.AreEqual(NFeIPAvista, FNFe.pag.detPag[0].IndPag);
end;

end.
