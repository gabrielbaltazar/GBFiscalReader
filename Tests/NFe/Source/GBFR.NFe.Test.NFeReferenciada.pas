unit GBFR.NFe.Test.NFeReferenciada;

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
  XML_NFE = 'nfeComNotaReferenciada';

type
  [TestFixture]
  TGBFRNFeTestNFeReferenciada = class(TGBFRNFeTestBase)

  private
    FModel : TGBRFNFeModel;

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
    procedure TestICMS;

    constructor create;
    destructor  Destroy; override;
  end;

implementation

{ TGBFRNFeTestNFeReferenciada }

constructor TGBFRNFeTestNFeReferenciada.create;
var
  xml : string;
begin
  xml    := LoadXMLResource(XML_NFE);
  FModel := XMLNFeReader.loadFromContent(xml);
end;

destructor TGBFRNFeTestNFeReferenciada.Destroy;
begin
  FModel.Free;
  inherited;
end;

procedure TGBFRNFeTestNFeReferenciada.TestDest;
begin
  Assert.IsEmpty(FModel.dest.CNPJ);
  Assert.AreEqual('84752264188', FModel.dest.CPF);
  Assert.AreEqual('NF-E EMITIDA EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL', FModel.dest.xNome);
  Assert.AreEqual('destinatario@email.com.br', FModel.dest.email);
  Assert.AreEqual(NFeNaoContribuinte, FModel.dest.indIEDest);

  Assert.AreEqual('Rua Test', FModel.dest.enderDest.xLgr);
  Assert.AreEqual('50', FModel.dest.enderDest.nro);
  Assert.AreEqual('Apto 101', FModel.dest.enderDest.xCpl);
  Assert.AreEqual('Santa Rosa', FModel.dest.enderDest.xBairro);
  Assert.AreEqual('3303302', FModel.dest.enderDest.cMun);
  Assert.AreEqual('Niteroi', FModel.dest.enderDest.xMun);
  Assert.AreEqual('RJ', FModel.dest.enderDest.UF);
  Assert.AreEqual('24240876', FModel.dest.enderDest.CEP);
  Assert.AreEqual('1058', FModel.dest.enderDest.cPais);
  Assert.AreEqual('BRASIL', FModel.dest.enderDest.xPais);
  Assert.AreEqual('999888777', FModel.dest.enderDest.fone);
end;

procedure TGBFRNFeTestNFeReferenciada.TestEmit;
begin
  Assert.IsEmpty(FModel.emit.CPF);
  Assert.AreEqual('99999999999999', FModel.emit.CNPJ);
  Assert.AreEqual('Emit 99999', FModel.emit.xNome);
  Assert.AreEqual('Emit Fant', FModel.emit.xFant);
  Assert.AreEqual('808123', FModel.emit.IE);
  Assert.AreEqual('444', FModel.emit.IM);
  Assert.AreEqual('5510000', FModel.emit.CNAE);
  Assert.AreEqual(NFeRegimeNormal, FModel.emit.CRT);

  Assert.AreEqual('VILA ', FModel.emit.enderEmit.xLgr);
  Assert.AreEqual('.', FModel.emit.enderEmit.nro);
  Assert.AreEqual('Bairro Test', FModel.emit.enderEmit.xBairro);
  Assert.AreEqual('4110805', FModel.emit.enderEmit.cMun);
  Assert.AreEqual('IRETAMA', FModel.emit.enderEmit.xMun);
  Assert.AreEqual('PR', FModel.emit.enderEmit.UF);
  Assert.AreEqual('87289999', FModel.emit.enderEmit.CEP);
  Assert.AreEqual('1058', FModel.emit.enderEmit.cPais);
  Assert.AreEqual('BRASIL', FModel.emit.enderEmit.xPais);
  Assert.AreEqual('999888', FModel.emit.enderEmit.fone);
end;

procedure TGBFRNFeTestNFeReferenciada.TestICMS;
var
  item : TGBFRNFeModelItem;
begin
  item := FModel.itens[0];

  Assert.IsNotNull(item);
  Assert.AreEqual('0', item.ICMS.orig);
  Assert.AreEqual('41', item.ICMS.CST);
  Assert.AreEqual(StrToCurr('0'), item.ICMS.vBC);
  Assert.AreEqual(StrToCurr('0'), item.ICMS.pICMS);
  Assert.AreEqual(StrToCurr('0'), item.ICMS.vICMS);
end;

procedure TGBFRNFeTestNFeReferenciada.TestIde;
begin
  Assert.AreEqual(4, FModel.ide.NFRef.Count);
  Assert.AreEqual('53', FModel.ide.cUF);
  Assert.AreEqual('00000047', FModel.ide.cNF);
  Assert.AreEqual('VENDA', FModel.ide.natOp);
  Assert.AreEqual('55', FModel.ide.&mod);
  Assert.AreEqual('503', FModel.ide.serie);
  Assert.AreEqual(201, FModel.ide.nNF);
  Assert.AreEqual('2019-09-02 11:42:52', FormatDateTime('yyyy-MM-dd hh:mm:ss', FModel.ide.dhEmi));
  Assert.AreEqual('5300108', FModel.ide.cMunFG);
  Assert.AreEqual('7', FModel.ide.cDV);
  Assert.AreEqual(NFeHomologacao, FModel.ide.tpAmb);
end;

procedure TGBFRNFeTestNFeReferenciada.TestInfNFe;
begin
  Assert.AreEqual('NFe53190999999999999999555030000002011000000477', FModel.Id);
  Assert.AreEqual('4.00', FModel.versao);
end;

end.
