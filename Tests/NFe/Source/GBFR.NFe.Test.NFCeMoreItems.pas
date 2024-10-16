unit GBFR.NFe.Test.NFCeMoreItems;

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
  XML_NFE = 'NFCe41200999999999999999650020000000481000000659';

type
  [TestFixture]
  TGBFRNFeTestNFCeMoreItems = class(TGBFRNFeTestBase)

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
    procedure TestItems;

    [Test]
    procedure TestItem1;

    [Test]
    procedure TestItem1ImpostoICMS;

    [Test]
    procedure TestItem1ImpostoPIS;

    [Test]
    procedure TestItem1ImpostoCOFINS;

    [Test]
    procedure TestItem2;

    [Test]
    procedure TestItem2ImpostoICMS;

    [Test]
    procedure TestItem2ImpostoPIS;

    [Test]
    procedure TestItem2ImpostoCOFINS;

    constructor create;
    destructor  Destroy; override;
  end;

implementation

{ TGBFRNFeTestNFCeMoreItems }

constructor TGBFRNFeTestNFCeMoreItems.create;
var
  xml : string;
begin
  xml    := LoadXMLResource(XML_NFE);
  FModel := XMLNFeReader.loadFromContent(xml);
end;

destructor TGBFRNFeTestNFCeMoreItems.Destroy;
begin
  FModel.Free;
  inherited;
end;

procedure TGBFRNFeTestNFCeMoreItems.TestEmit;
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

procedure TGBFRNFeTestNFCeMoreItems.TestIde;
begin
  Assert.AreEqual('41', FModel.ide.cUF);
  Assert.AreEqual('00000065', FModel.ide.cNF);
  Assert.AreEqual('VENDA', FModel.ide.natOp);
  Assert.AreEqual('65', FModel.ide.&mod);
  Assert.AreEqual('2', FModel.ide.serie);
  Assert.AreEqual(48, FModel.ide.nNF);
  Assert.AreEqual('2020-09-22 16:21:38', FormatDateTime('yyyy-MM-dd hh:mm:ss', FModel.ide.dhEmi));
  Assert.AreEqual('4110805', FModel.ide.cMunFG);
  Assert.AreEqual('9', FModel.ide.cDV);
  Assert.AreEqual(NFeHomologacao, FModel.ide.tpAmb);
  Assert.AreEqual(0, FModel.Ide.NFRef.Count);
end;

procedure TGBFRNFeTestNFCeMoreItems.TestInfNFe;
begin
  Assert.AreEqual('NFe41200999999999999999650020000000481000000659', FModel.Id);
  Assert.AreEqual('4.00', FModel.versao);
end;

procedure TGBFRNFeTestNFCeMoreItems.TestItem1;
var
  index: Integer;
begin
  index := 0;
  Assert.AreEqual('S00952', FModel.itens[index].prod.cProd);
  Assert.AreEqual('SEM GTIN', FModel.itens[index].prod.cEAN);
  Assert.AreEqual('NOTA FISCAL EMITIDA EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL', FModel.itens[index].prod.xProd);
  Assert.AreEqual('21061000', FModel.itens[index].prod.NCM);
  Assert.AreEqual('5102', FModel.itens[index].prod.CFOP);
  Assert.AreEqual('UN', FModel.itens[index].prod.uCom);
  Assert.AreEqual('1', FModel.itens[index].prod.qCom.ToString);
  Assert.AreEqual<Currency>(42, FModel.itens[index].prod.vUnCom);
  Assert.AreEqual<Currency>(42, FModel.itens[index].prod.vProd);
  Assert.AreEqual('SEM GTIN', FModel.itens[index].prod.cEANTrib);
  Assert.AreEqual('UN', FModel.itens[index].prod.uTrib);
  Assert.AreEqual('1', FModel.itens[index].prod.qTrib.ToString);
  Assert.AreEqual<Currency>(42, FModel.itens[index].prod.vUnTrib);
  Assert.AreEqual(NFeCompoe, FModel.itens[index].prod.indTot);
end;

procedure TGBFRNFeTestNFCeMoreItems.TestItem1ImpostoCOFINS;
var
  item : TGBFRNFeModelItem;
begin
  item := FModel.itens[0];

  Assert.IsNotNull(item);
  Assert.AreEqual('01', item.imposto.COFINS.CST);
  Assert.AreEqual<Currency>(42, item.imposto.COFINS.vBC);
  Assert.AreEqual<Currency>(7.6, item.imposto.COFINS.pCOFINS);
  Assert.AreEqual<Currency>(3.19, item.imposto.COFINS.vCOFINS);
end;

procedure TGBFRNFeTestNFCeMoreItems.TestItem1ImpostoICMS;
var
  item : TGBFRNFeModelItem;
begin
  item := FModel.itens[0];

  Assert.IsNotNull(item);
  Assert.AreEqual('0', item.imposto.ICMS.orig);
  Assert.AreEqual('00', item.imposto.ICMS.CST);
  Assert.AreEqual(NFeValorOperacao, item.imposto.ICMS.modBC);
  Assert.AreEqual<Currency>(0, item.imposto.ICMS.vBC);
  Assert.AreEqual<Currency>(18, item.imposto.ICMS.pICMS);
  Assert.AreEqual<Currency>(0, item.imposto.ICMS.vICMS);
end;

procedure TGBFRNFeTestNFCeMoreItems.TestItem1ImpostoPIS;
var
  item : TGBFRNFeModelItem;
begin
  item := FModel.itens[0];

  Assert.IsNotNull(item);
  Assert.AreEqual('01', item.imposto.PIS.CST);
  Assert.AreEqual<Currency>(42, item.imposto.PIS.vBC);
  Assert.AreEqual<Currency>(1.65, item.imposto.PIS.pPIS);
  Assert.AreEqual<Currency>(0.69, item.imposto.PIS.vPIS);
end;

procedure TGBFRNFeTestNFCeMoreItems.TestItem2;
var
  index: Integer;
begin
  index := 1;
  Assert.AreEqual('S11100', FModel.itens[index].prod.cProd);
  Assert.AreEqual('SEM GTIN', FModel.itens[index].prod.cEAN);
  Assert.AreEqual('Taxa de Servico', FModel.itens[index].prod.xProd);
  Assert.AreEqual('00000000', FModel.itens[index].prod.NCM);
  Assert.AreEqual('PR800000', FModel.itens[index].prod.cBenef);
  Assert.AreEqual('5102', FModel.itens[index].prod.CFOP);
  Assert.AreEqual('UN', FModel.itens[index].prod.uCom);
  Assert.AreEqual('1', FModel.itens[index].prod.qCom.ToString);
  Assert.AreEqual<Currency>(4.2, FModel.itens[index].prod.vUnCom);
  Assert.AreEqual<Currency>(4.2, FModel.itens[index].prod.vProd);
  Assert.AreEqual('SEM GTIN', FModel.itens[index].prod.cEANTrib);
  Assert.AreEqual('UN', FModel.itens[index].prod.uTrib);
  Assert.AreEqual('1', FModel.itens[index].prod.qTrib.ToString);
  Assert.AreEqual<Currency>(4.2, FModel.itens[index].prod.vUnTrib);
  Assert.AreEqual(NFeCompoe, FModel.itens[index].prod.indTot);
end;

procedure TGBFRNFeTestNFCeMoreItems.TestItem2ImpostoCOFINS;
var
  item : TGBFRNFeModelItem;
begin
  item := FModel.itens[1];

  Assert.IsNotNull(item);
  Assert.AreEqual('01', item.imposto.COFINS.CST);
  Assert.AreEqual<Currency>(4.2, item.imposto.COFINS.vBC);
  Assert.AreEqual<Currency>(7.6, item.imposto.COFINS.pCOFINS);
  Assert.AreEqual<Currency>(0.32, item.imposto.COFINS.vCOFINS);
end;

procedure TGBFRNFeTestNFCeMoreItems.TestItem2ImpostoICMS;
var
  item : TGBFRNFeModelItem;
begin
  item := FModel.itens[1];

  Assert.IsNotNull(item);
  Assert.AreEqual('0', item.imposto.ICMS.orig);
  Assert.AreEqual('41', item.imposto.ICMS.CST);
  Assert.AreEqual(NFeMargemValorAgregado, item.imposto.ICMS.modBC);
  Assert.AreEqual<Currency>(0, item.imposto.ICMS.vBC);
  Assert.AreEqual<Currency>(0, item.imposto.ICMS.pICMS);
  Assert.AreEqual<Currency>(0, item.imposto.ICMS.vICMS);
  Assert.AreEqual<Currency>(0.92, item.imposto.ICMS.vICMSDeson);
end;

procedure TGBFRNFeTestNFCeMoreItems.TestItem2ImpostoPIS;
var
  item : TGBFRNFeModelItem;
begin
  item := FModel.itens[1];

  Assert.IsNotNull(item);
  Assert.AreEqual('01', item.imposto.PIS.CST);
  Assert.AreEqual<Currency>(4.2, item.imposto.PIS.vBC);
  Assert.AreEqual<Currency>(1.65, item.imposto.PIS.pPIS);
  Assert.AreEqual<Currency>(0.07, item.imposto.PIS.vPIS);
end;

procedure TGBFRNFeTestNFCeMoreItems.TestItems;
begin
  Assert.AreEqual(2, FModel.itens.Count);
end;

end.
