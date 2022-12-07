unit GBFR.SAT.Test.XML.Simples;

interface

uses
  DUnitX.TestFramework,
  GBFR.SAT.Test.Base,
  GBFR.SAT.Model.Classes,
  GBFR.SAT.Model.Types,
  System.SysUtils;

type
  [TestFixture]
  TGBFRSATTestXMLSimples = class(TGBFRSATTestBase)
  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    procedure InfCFe;

    [Test]
    procedure Ide;

    [Test]
    procedure Emit;

    [Test]
    procedure Total;

    [Test]
    procedure Pag;

    [Test]
    procedure Prod;

    [Test]
    procedure ImpostoICMS;

    [Test]
    procedure ImpostoPIS;

    [Test]
    procedure ImpostoCOFINS;

    [Test]
    procedure InfAdic;
  end;

implementation

{ TGBFRSATTestXMLSimples }

procedure TGBFRSATTestXMLSimples.Emit;
begin
  Assert.AreEqual('82373077000171', FInfCFe.emit.CNPJ);
  Assert.AreEqual('HOTEL CENTRO DE EVENTOS DO CEARA LTDA', FInfCFe.emit.xNome);
  Assert.AreEqual('HOTEL CENTRO DE EVENTOS DO CE', FInfCFe.emit.xFant);
  Assert.AreEqual('0018001360', FInfCFe.emit.IE);
  Assert.AreEqual('271313-6', FInfCFe.emit.IM);
  Assert.AreEqual('3', FInfCFe.emit.cRegTrib.Value.ToString);
  Assert.AreEqual('2', FInfCFe.emit.cRegTribISSQN.Value.ToString);
  Assert.AreEqual('N', FInfCFe.emit.indRatISSQN);

  Assert.AreEqual('R FIRMINO ROCHA AGUIAR', FInfCFe.emit.enderEmit.xLgr);
  Assert.AreEqual('01799', FInfCFe.emit.enderEmit.nro);
  Assert.AreEqual('Teste', FInfCFe.emit.enderEmit.xCpl);
  Assert.AreEqual('PATRIOLINO RIBEIRO', FInfCFe.emit.enderEmit.xBairro);
  Assert.AreEqual('FORTALEZA', FInfCFe.emit.enderEmit.xMun);
  Assert.AreEqual('60810165', FInfCFe.emit.enderEmit.CEP.ToString);
end;

procedure TGBFRSATTestXMLSimples.Ide;
begin
  Assert.AreEqual('23', FInfCFe.ide.cUF.ToString);
  Assert.AreEqual('642774', FInfCFe.ide.cNF.ToString);
  Assert.AreEqual('59', FInfCFe.ide.&mod);
  Assert.AreEqual('230081836', FInfCFe.ide.nSerieSAT.ToString);
  Assert.AreEqual('017869', FInfCFe.ide.nCFe);
  Assert.AreEqual('20221001', FormatDateTime('yyyyMMdd', FInfCFe.ide.dEmi));
  Assert.AreEqual('143904', FormatDateTime('hhmmss', FInfCFe.ide.hEmi));
  Assert.AreEqual('2', FInfCFe.ide.cDV.ToString);
  Assert.AreEqual('1', FInfCFe.ide.tpAmb.Value.ToString);
  Assert.AreEqual('82373077000171', FInfCFe.ide.CNPJ);
  Assert.AreEqual('001', FInfCFe.ide.numeroCaixa);
  Assert.IsNotEmpty(FInfCFe.ide.signAC);
  Assert.IsNotEmpty(FInfCFe.ide.assinaturaQRCODE);
end;

procedure TGBFRSATTestXMLSimples.ImpostoCOFINS;
begin
  Assert.AreEqual('01', FInfCFe.det[0].imposto.COFINS.CST);
  Assert.AreEqual<Double>(45, FInfCFe.det[0].imposto.COFINS.vBC);
  Assert.AreEqual<Double>(3, FInfCFe.det[0].imposto.COFINS.pCOFINS);
  Assert.AreEqual<Double>(4, FInfCFe.det[0].imposto.COFINS.vCOFINS);
end;

procedure TGBFRSATTestXMLSimples.ImpostoICMS;
begin
  Assert.AreEqual('0', FInfCFe.det[0].imposto.ICMS.Orig);
  Assert.AreEqual('00', FInfCFe.det[0].imposto.ICMS.CST);
  Assert.AreEqual<Double>(18, FInfCFe.det[0].imposto.ICMS.pICMS);
  Assert.AreEqual<Double>(8.1, FInfCFe.det[0].imposto.ICMS.vICMS);
  Assert.AreEqual<string>('5', FInfCFe.det[0].imposto.ICMS.CSOSN);
end;

procedure TGBFRSATTestXMLSimples.ImpostoPIS;
begin
  Assert.AreEqual('01', FInfCFe.det[0].imposto.PIS.CST);
  Assert.AreEqual<Double>(45, FInfCFe.det[0].imposto.PIS.vBC);
  Assert.AreEqual<Double>(1, FInfCFe.det[0].imposto.PIS.pPIS);
  Assert.AreEqual<Double>(2, FInfCFe.det[0].imposto.PIS.vPIS);
end;

procedure TGBFRSATTestXMLSimples.InfAdic;
begin
  Assert.AreEqual('Informacao Complementar', FInfCFe.infAdic.infCpl);
  Assert.AreEqual('Info Fisco', FInfCFe.infAdic.obsFisco);
end;

procedure TGBFRSATTestXMLSimples.InfCFe;
begin
  Assert.AreEqual('CFe23221015524451000103592300818360178696427742',
    FinfCFe.Id);
  Assert.AreEqual('0.07', FinfCFe.versao);
  Assert.AreEqual('0.08', FinfCFe.versaoDadosEnt);
  Assert.AreEqual('010008', FinfCFe.versaoSB);
end;

procedure TGBFRSATTestXMLSimples.Pag;
begin
  Assert.AreEqual<Integer>(2, FInfCFe.pgto.MP.Count);
  Assert.AreEqual<Double>(50, FInfCFe.pgto.vTroco);

  Assert.AreEqual('03', FInfCFe.pgto.MP[0].cMP.Value);
  Assert.AreEqual<Double>(45, FInfCFe.pgto.MP[0].vMP);

  Assert.AreEqual('02', FInfCFe.pgto.MP[1].cMP.Value);
  Assert.AreEqual<Double>(50, FInfCFe.pgto.MP[1].vMP);
end;

procedure TGBFRSATTestXMLSimples.Prod;
begin
  Assert.AreEqual('BR0167', FInfCFe.det[0].prod.cProd);
  Assert.AreEqual('BUFFET EVENTO', FInfCFe.det[0].prod.xProd);
  Assert.AreEqual('21069090', FInfCFe.det[0].prod.NCM);
  Assert.AreEqual('5102', FInfCFe.det[0].prod.CFOP);
  Assert.AreEqual('UN', FInfCFe.det[0].prod.uCom);
  Assert.AreEqual('A', FInfCFe.det[0].prod.indRegra.Value);
  Assert.AreEqual<Double>(1, FInfCFe.det[0].prod.qCom);
  Assert.AreEqual<Double>(45, FInfCFe.det[0].prod.vUnCom);
  Assert.AreEqual<Double>(45, FInfCFe.det[0].prod.vProd);
  Assert.AreEqual<Double>(45, FInfCFe.det[0].prod.vItem);
end;

procedure TGBFRSATTestXMLSimples.Setup;
begin
  LerXMLResource('AD23221015524451000103592300818360178696427742');
end;

procedure TGBFRSATTestXMLSimples.TearDown;
begin
  FreeAndNil(FCFe);
end;

procedure TGBFRSATTestXMLSimples.Total;
begin
  Assert.AreEqual<Double>(45, FInfCFe.total.vCFe);
  Assert.AreEqual<Double>(2, FInfCFe.total.vCFeLei12741);
  Assert.AreEqual<Double>(8.10, FInfCFe.total.ICMSTot.vICMS);
  Assert.AreEqual<Double>(45, FInfCFe.total.ICMSTot.vProd);
  Assert.AreEqual<Double>(1, FInfCFe.total.ICMSTot.vDesc);
  Assert.AreEqual<Double>(3, FInfCFe.total.ICMSTot.vPIS);
  Assert.AreEqual<Double>(5.1, FInfCFe.total.ICMSTot.vCOFINS);
  Assert.AreEqual<Double>(4, FInfCFe.total.ICMSTot.vPISST);
  Assert.AreEqual<Double>(8, FInfCFe.total.ICMSTot.vCOFINSST);
  Assert.AreEqual<Double>(7, FInfCFe.total.ICMSTot.vOutro);
end;

end.
