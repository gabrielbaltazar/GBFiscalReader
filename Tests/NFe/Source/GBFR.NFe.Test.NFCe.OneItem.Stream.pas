unit GBFR.NFe.Test.NFCe.OneItem.Stream;

interface

uses
  DUnitX.TestFramework,
  GBFR.NFe.Test.Base,
  GBFR.NFe.Model.Classes,
  GBFR.NFe.Model.Types,
  GBFR.NFe.XML.Interfaces,
  System.SysUtils,
  System.Classes,
  Winapi.Windows;

const
  XML_NFCe = 'NFCe41200699999999999999650020000000031000000117';

type
  [TestFixture]
  TGBFRNFeTestNFCeOneItemStream = class(TGBFRNFeTestBase)

  private
    FModel : TGBFRNFeModel;

  public
    [Test]
    procedure TestInfNFe;

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
    procedure TestImpostoPIS;

    [Test]
    procedure TestImpostoCOFINS;

    [Test]
    procedure TestICMSTot;

    [Test]
    procedure TestPag;

    [Test]
    procedure TestInfAdic;

    [Test]
    procedure TestInfRespTec;

    [Test]
    procedure TestInfProt;

    constructor create;
    destructor  Destroy; override;
  end;

implementation

{ TGBFRNFeTestNFCeOneItemStream }

constructor TGBFRNFeTestNFCeOneItemStream.create;
var
  stream : TStream;
begin
  stream := LoadXMLResourceStream(XML_NFCe);
  try
    FModel := XMLNFeReader.loadFromStream(stream);
  finally
    stream.Free;
  end;
end;

destructor TGBFRNFeTestNFCeOneItemStream.Destroy;
begin
  FModel.Free;
  inherited;
end;

procedure TGBFRNFeTestNFCeOneItemStream.TestDest;
begin
  Assert.IsEmpty(FModel.dest.CNPJ);
  Assert.AreEqual('84752264188', FModel.dest.CPF);
  Assert.AreEqual('NF-E EMITIDA EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL', FModel.dest.xNome);
  Assert.AreEqual('destinatario@email.com.br', FModel.dest.email);
  Assert.AreEqual(NFeNaoContribuinte, FModel.dest.indIEDest);

  Assert.AreEqual('Rua Professor Otacilio', FModel.dest.enderDest.xLgr);
  Assert.AreEqual('50', FModel.dest.enderDest.nro);
  Assert.AreEqual('Apto 101', FModel.dest.enderDest.xCpl);
  Assert.AreEqual('Santa Rosa', FModel.dest.enderDest.xBairro);
  Assert.AreEqual('3303302', FModel.dest.enderDest.cMun);
  Assert.AreEqual('Niteroi', FModel.dest.enderDest.xMun);
  Assert.AreEqual('RJ', FModel.dest.enderDest.UF);
  Assert.AreEqual('24240670', FModel.dest.enderDest.CEP);
  Assert.AreEqual('1058', FModel.dest.enderDest.cPais);
  Assert.AreEqual('BRASIL', FModel.dest.enderDest.xPais);
  Assert.AreEqual('999888777', FModel.dest.enderDest.fone);
end;

procedure TGBFRNFeTestNFCeOneItemStream.TestEmit;
begin
  Assert.IsEmpty(FModel.emit.CPF);
  Assert.AreEqual('99999999999999', FModel.emit.CNPJ);
  Assert.AreEqual('Company Test', FModel.emit.xNome);
  Assert.AreEqual('Company Test', FModel.emit.xFant);
  Assert.AreEqual('8080099999', FModel.emit.IE);
  Assert.AreEqual('888', FModel.emit.IM);
  Assert.AreEqual('5510000', FModel.emit.CNAE);
  Assert.AreEqual(NFeRegimeNormal, FModel.emit.CRT);

  Assert.IsEmpty(FModel.emit.enderEmit.xCpl);
  Assert.AreEqual('VILA Test', FModel.emit.enderEmit.xLgr);
  Assert.AreEqual('.', FModel.emit.enderEmit.nro);
  Assert.AreEqual('Bairro Test', FModel.emit.enderEmit.xBairro);
  Assert.AreEqual('9999845', FModel.emit.enderEmit.cMun);
  Assert.AreEqual('Test', FModel.emit.enderEmit.xMun);
  Assert.AreEqual('PR', FModel.emit.enderEmit.UF);
  Assert.AreEqual('12345678', FModel.emit.enderEmit.CEP);
  Assert.AreEqual('1058', FModel.emit.enderEmit.cPais);
  Assert.AreEqual('BRASIL', FModel.emit.enderEmit.xPais);
  Assert.AreEqual('9999999999', FModel.emit.enderEmit.fone);
end;

procedure TGBFRNFeTestNFCeOneItemStream.TestImpostoCOFINS;
var
  item : TGBFRNFeModelItem;
begin
  item := FModel.itens[0];

  Assert.IsNotNull(item);
  Assert.AreEqual('01', item.imposto.COFINS.CST);
  Assert.AreEqual<Currency>(100, item.imposto.COFINS.vBC);
  Assert.AreEqual<Currency>(7.6, item.imposto.COFINS.pCOFINS);
  Assert.AreEqual<Currency>(7.6, item.imposto.COFINS.vCOFINS);
end;

procedure TGBFRNFeTestNFCeOneItemStream.TestImpostoICMS;
var
  item : TGBFRNFeModelItem;
begin
  item := FModel.itens[0];

  Assert.IsNotNull(item);
  Assert.AreEqual('0', item.imposto.ICMS.orig);
  Assert.AreEqual('00', item.imposto.ICMS.CST);
  Assert.AreEqual(NFeValorOperacao, item.imposto.ICMS.modBC);
  Assert.AreEqual<Currency>(100, item.imposto.ICMS.vBC);
  Assert.AreEqual<Currency>(12, item.imposto.ICMS.pICMS);
  Assert.AreEqual<Currency>(12, item.imposto.ICMS.vICMS);
end;

procedure TGBFRNFeTestNFCeOneItemStream.TestImpostoPIS;
var
  item : TGBFRNFeModelItem;
begin
  item := FModel.itens[0];

  Assert.IsNotNull(item);
  Assert.AreEqual('01', item.imposto.PIS.CST);
  Assert.AreEqual<Currency>(100, item.imposto.PIS.vBC);
  Assert.AreEqual<Currency>(1.65, item.imposto.PIS.pPIS);
  Assert.AreEqual<Currency>(1.65, item.imposto.PIS.vPIS);
end;

procedure TGBFRNFeTestNFCeOneItemStream.TestICMSTot;
begin
  Assert.AreEqual<Currency>(100, FModel.ICMSTot.vBC);
  Assert.AreEqual<Currency>(12, FModel.ICMSTot.vICMS);
  Assert.AreEqual<Currency>(0, FModel.ICMSTot.vICMSDeson);
  Assert.AreEqual<Currency>(0, FModel.ICMSTot.vFCP);
  Assert.AreEqual<Currency>(0, FModel.ICMSTot.vBCST);
  Assert.AreEqual<Currency>(0, FModel.ICMSTot.vST);
  Assert.AreEqual<Currency>(0, FModel.ICMSTot.vFCPST);
  Assert.AreEqual<Currency>(0, FModel.ICMSTot.vFCPSTRet);
  Assert.AreEqual<Currency>(100, FModel.ICMSTot.vProd);
  Assert.AreEqual<Currency>(0, FModel.ICMSTot.vFrete);
  Assert.AreEqual<Currency>(0, FModel.ICMSTot.vSeg);
  Assert.AreEqual<Currency>(0, FModel.ICMSTot.vDesc);
  Assert.AreEqual<Currency>(0, FModel.ICMSTot.vII);
  Assert.AreEqual<Currency>(0, FModel.ICMSTot.vIPI);
  Assert.AreEqual<Currency>(0, FModel.ICMSTot.vIPIDevol);
  Assert.AreEqual<Currency>(1.65, FModel.ICMSTot.vPIS);
  Assert.AreEqual<Currency>(7.6, FModel.ICMSTot.vCOFINS);
  Assert.AreEqual<Currency>(0, FModel.ICMSTot.vOutro);
  Assert.AreEqual<Currency>(100, FModel.ICMSTot.vNF);
end;

procedure TGBFRNFeTestNFCeOneItemStream.TestIde;
begin
  Assert.AreEqual('41', FModel.ide.cUF);
  Assert.AreEqual('00000011', FModel.ide.cNF);
  Assert.AreEqual('VENDA', FModel.ide.natOp);
  Assert.AreEqual('65', FModel.ide.&mod);
  Assert.AreEqual('2', FModel.ide.serie);
  Assert.AreEqual(3, FModel.ide.nNF);
  Assert.AreEqual('2020-06-09 08:51:46', FormatDateTime('yyyy-MM-dd hh:mm:ss', FModel.ide.dhEmi));
  Assert.AreEqual('4110805', FModel.ide.cMunFG);
  Assert.AreEqual('7', FModel.ide.cDV);
  Assert.AreEqual(0, FModel.Ide.refNFes.Count);
  Assert.AreEqual(NFeHomologacao, FModel.ide.tpAmb);
  Assert.AreEqual(NFeSaida, FModel.ide.tpNF);
  Assert.AreEqual(NFeInterna, FModel.ide.idDest);
  Assert.AreEqual(NFeDanfeNFCe, FModel.ide.tpImp);
  Assert.AreEqual(NFeEmissaoNormal, FModel.ide.tpEmis);
  Assert.AreEqual(NFeNormal, FModel.ide.finNFe);
  Assert.AreEqual(NFeConsumidorFinal, FModel.ide.indFinal);
  Assert.AreEqual(NFeOperacaoPresencial, FModel.ide.indPres);
  Assert.AreEqual(NFeAplicativoContribuinte, FModel.ide.procEmi);
end;

procedure TGBFRNFeTestNFCeOneItemStream.TestInfAdic;
begin
  Assert.AreEqual('Informacoes da Nota', FModel.infAdic.infCpl);
  Assert.IsEmpty(FModel.infAdic.infAdFisco);
end;

procedure TGBFRNFeTestNFCeOneItemStream.TestInfNFe;
begin
  Assert.AreEqual('NFe41200699999999999999650020000000031000000117', FModel.Id);
  Assert.AreEqual('4.00', FModel.versao);
end;

procedure TGBFRNFeTestNFCeOneItemStream.TestInfProt;
begin
  Assert.AreEqual(NFeHomologacao, FModel.protNFe.tpAmb);
  Assert.AreEqual('PR-v4_4_2', FModel.protNFe.verAplic);
  Assert.AreEqual('41200699999999999999650020000000031000000117', FModel.protNFe.chNFe);
  Assert.AreEqual('141200000291046', FModel.protNFe.nProt);
  Assert.AreEqual('2020-06-09 08:51:48', FormatDateTime('yyyy-MM-dd hh:mm:ss', FModel.protNFe.dhRecbto));
  Assert.AreEqual('+Y9Hf+WRJHskywUjLOJ0AiSd6NA=', FModel.protNFe.digVal);
  Assert.AreEqual(100, FModel.protNFe.cStat);
  Assert.AreEqual('Autorizado o uso da NF-e', FModel.protNFe.xMotivo);
end;

procedure TGBFRNFeTestNFCeOneItemStream.TestInfRespTec;
begin
  Assert.AreEqual('12345678901234', FModel.infRespTec.CNPJ);
  Assert.AreEqual('Resp Contato', FModel.infRespTec.xContato);
  Assert.AreEqual('relacionamento@email.com.br', FModel.infRespTec.email);
  Assert.AreEqual('2130030999', FModel.infRespTec.fone);
end;

procedure TGBFRNFeTestNFCeOneItemStream.TestItem;
begin
  Assert.AreEqual(1, FModel.itens.Count);
  Assert.AreEqual('000092', FModel.itens[0].prod.cProd);
  Assert.AreEqual('SEM GTIN', FModel.itens[0].prod.cEAN);
  Assert.AreEqual('NOTA FISCAL EMITIDA EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL', FModel.itens[0].prod.xProd);
  Assert.AreEqual('08011900', FModel.itens[0].prod.NCM);
  Assert.AreEqual('5102', FModel.itens[0].prod.CFOP);
  Assert.AreEqual('UN', FModel.itens[0].prod.uCom);
  Assert.AreEqual('2', FModel.itens[0].prod.qCom.ToString);
  Assert.AreEqual<Currency>(50, FModel.itens[0].prod.vUnCom);
  Assert.AreEqual<Currency>(100, FModel.itens[0].prod.vProd);
  Assert.AreEqual('SEM GTIN', FModel.itens[0].prod.cEANTrib);
  Assert.AreEqual('UN', FModel.itens[0].prod.uTrib);
  Assert.AreEqual('2', FModel.itens[0].prod.qTrib.ToString);
  Assert.AreEqual<Currency>(50, FModel.itens[0].prod.vUnTrib);
  Assert.AreEqual(NFeCompoe, FModel.itens[0].prod.indTot);
end;

procedure TGBFRNFeTestNFCeOneItemStream.TestPag;
begin
  Assert.AreEqual(1, FModel.pag.detPag.Count);
  Assert.AreEqual<Currency>(0, FModel.pag.vTroco);
  Assert.AreEqual<Currency>(100, FModel.pag.detPag[0].vPag);
  Assert.AreEqual(NFeFPDinheiro, FModel.pag.detPag[0].tPag);
end;

initialization
  TDUnitX.RegisterTestFixture(TGBFRNFeTestNFCeOneItemStream);

end.
