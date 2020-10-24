unit GBFR.CTe.Test.Base;

interface

uses
  DUnitX.TestFramework,
  System.SysUtils,
  System.Classes,
  Winapi.Windows,
  GBFR.CTe.Model.Classes,
  GBFR.CTe.Model.Types,
  GBFR.CTe.XML.Interfaces;

const
  XML_RES = 'CTe35200903629957000602570010005940341265045246';

type
  [TestFixture]
  TGBFRCTeTestBase = class

  private
    FCTe: TGBFRCTeModel;

  protected
    function LoadXMLResource(Name: String): string;

  public
    [Test]
    procedure TestInfCTe;

    [Test]
    procedure TestTagIde;

    [Test]
    procedure TestTagToma3;

    [Test]
    procedure TestTagCompl;

    [Test]
    procedure TestTagEmit;

    [Test]
    procedure TestTagRem;

    [Test]
    procedure TestTagExped;

    [Test]
    procedure TestTagDest;

    [Test]
    procedure TestTagVPrest;

    [Test]
    procedure TestInfCarga;

    [Test]
    procedure TestTagInfDoc;

    [Test]
    procedure TestTagInfModal;

    [Test]
    procedure TestTagAutXML;

    [Test]
    procedure TestTagInfProt;

    constructor create;
    destructor  Destroy; override;

  end;

implementation

{ TGBFRCTeTestBase }

constructor TGBFRCTeTestBase.create;
var
  xml : string;
begin
  xml  := LoadXMLResource(XML_RES);
  FCTe := XMLCTeReader.loadFromContent(xml);
end;

destructor TGBFRCTeTestBase.Destroy;
begin
  FCTe.Free;
  inherited;
end;

function TGBFRCTeTestBase.LoadXMLResource(Name: String): string;
var
  resource: TResourceStream;
  stream  : TStringStream;
begin
  resource := TResourceStream.Create(HInstance, Name, RT_RCDATA);
  try
    stream := TStringStream.Create;
    try
      stream.LoadFromStream(resource);
      result := stream.DataString;
    finally
      stream.Free;
    end;
  finally
    resource.Free;
  end;
end;

procedure TGBFRCTeTestBase.TestInfCarga;
begin
  Assert.AreEqual('11026,7', CurrToStr(FCTe.infCTeNorm.infCarga.vCarga));
  Assert.AreEqual('PROD. DIVERSOS', FCTe.infCTeNorm.infCarga.proPred);
  Assert.AreEqual('CAIXA(S)', FCTe.infCTeNorm.infCarga.xOutCat);
  Assert.AreEqual('11026,71', CurrToStr(FCTe.infCTeNorm.infCarga.vCargaAverb));

  Assert.AreEqual(3, FCTe.infCTeNorm.infCarga.infQ.Count);

  Assert.AreEqual('01', FCTe.infCTeNorm.infCarga.infQ[0].cUnid.Value);
  Assert.AreEqual('PESO DECLARADO', FCTe.infCTeNorm.infCarga.infQ[0].tpMed);
  Assert.AreEqual('14,31', CurrToStr(FCTe.infCTeNorm.infCarga.infQ[0].qCarga));

  Assert.AreEqual('01', FCTe.infCTeNorm.infCarga.infQ[1].cUnid.Value);
  Assert.AreEqual('PESO BASE DE CALCULO', FCTe.infCTeNorm.infCarga.infQ[1].tpMed);
  Assert.AreEqual('14,31', CurrToStr(FCTe.infCTeNorm.infCarga.infQ[1].qCarga));

  Assert.AreEqual('03', FCTe.infCTeNorm.infCarga.infQ[2].cUnid.Value);
  Assert.AreEqual('CAIXAS E ETC', FCTe.infCTeNorm.infCarga.infQ[2].tpMed);
  Assert.AreEqual('2', CurrToStr(FCTe.infCTeNorm.infCarga.infQ[2].qCarga));
end;

procedure TGBFRCTeTestBase.TestInfCTe;
begin
  Assert.AreEqual('CTe35200903629957000602570010005940341265045246', FCTe.Id);
  Assert.AreEqual('3.00', FCTe.versao);
end;

procedure TGBFRCTeTestBase.TestTagAutXML;
begin
  Assert.AreEqual(2, FCTe.autXML.Count);
  Assert.AreEqual('04898488000177', FCTe.autXML[0].CNPJ);
  Assert.AreEqual('76371582000184', FCTe.autXML[1].CNPJ);

  Assert.IsEmpty(FCTe.autXML[0].CPF);
  Assert.IsEmpty(FCTe.autXML[1].CPF);
end;

procedure TGBFRCTeTestBase.TestTagCompl;
begin
  Assert.AreEqual('Normal', FCTe.compl.xCaracAd);
  Assert.AreEqual('Normal', FCTe.compl.xCaracSer);
  Assert.AreEqual('LUIS.P', FCTe.compl.xEmi);
  Assert.AreEqual('Domingos Pacheco', FCTe.compl.origCalc);
  Assert.AreEqual('RUA RAIMUNDO WELTER, 122, AVENTUREIRO', FCTe.compl.destCalc);
  Assert.AreEqual('Valor Aproximado dos Tributos R$ 28,18 (26,13%)', FCTe.compl.xObs);
end;

procedure TGBFRCTeTestBase.TestTagDest;
begin
  Assert.AreEqual('04356485000101', FCTe.dest.CNPJ);
  Assert.AreEqual('254238211', FCTe.dest.IE);
  Assert.AreEqual('BRASFER FERRAMENTARIA LTDA', FCTe.dest.xNome);
  Assert.AreEqual('4734673679', FCTe.dest.fone);
  Assert.IsEmpty(FCTe.dest.xFant);

  Assert.AreEqual('RUA RAIMUNDO WELTER', FCTe.dest.enderDest.xLgr);
  Assert.AreEqual('122', FCTe.dest.enderDest.nro);
  Assert.AreEqual('', FCTe.dest.enderDest.xCpl);
  Assert.AreEqual('AVENTUREIRO', FCTe.dest.enderDest.xBairro);
  Assert.AreEqual('4209102', FCTe.dest.enderDest.cMun);
  Assert.AreEqual('JOINVILLE', FCTe.dest.enderDest.xMun);
  Assert.AreEqual('89219780', FCTe.dest.enderDest.CEP);
  Assert.AreEqual('SC', FCTe.dest.enderDest.UF);
  Assert.AreEqual('1058', FCTe.dest.enderDest.cPais);
  Assert.AreEqual('Brasil', FCTe.dest.enderDest.xPais);
end;

procedure TGBFRCTeTestBase.TestTagEmit;
begin
  Assert.AreEqual('03629957000602', FCTe.emit.CNPJ);
  Assert.AreEqual('116338930114', FCTe.emit.IE);
  Assert.AreEqual('Transligue Transportes e Servicos Ltda', FCTe.emit.xNome);
  Assert.IsEmpty(FCTe.emit.xFant);

  Assert.AreEqual('Rua Domingos Pacheco - Box 11 - Quadra 4', FCTe.emit.enderEmit.xLgr);
  Assert.AreEqual('179', FCTe.emit.enderEmit.nro);
  Assert.AreEqual('', FCTe.emit.enderEmit.xCpl);
  Assert.AreEqual('Jardim Julieta', FCTe.emit.enderEmit.xBairro);
  Assert.AreEqual('3550308', FCTe.emit.enderEmit.cMun);
  Assert.AreEqual('SAO PAULO', FCTe.emit.enderEmit.xMun);
  Assert.AreEqual('02162020', FCTe.emit.enderEmit.CEP);
  Assert.AreEqual('SP', FCTe.emit.enderEmit.UF);
  Assert.AreEqual('1139299088', FCTe.emit.enderEmit.fone);
end;

procedure TGBFRCTeTestBase.TestTagExped;
begin
  Assert.AreEqual('00507405000110', FCTe.exped.CNPJ);
  Assert.AreEqual('114371178114', FCTe.exped.IE);
  Assert.AreEqual('MURRELEKTRONIK DO BRASIL IND.COM.LTDA', FCTe.exped.xNome);
  Assert.AreEqual('0056311017', FCTe.exped.fone);
  Assert.IsEmpty(FCTe.exped.xFant);

  Assert.AreEqual('AV INTERLAGOS', FCTe.exped.enderExped.xLgr);
  Assert.AreEqual('3493', FCTe.exped.enderExped.nro);
  Assert.AreEqual('', FCTe.exped.enderExped.xCpl);
  Assert.AreEqual('JARDIM UMUARAMA', FCTe.exped.enderExped.xBairro);
  Assert.AreEqual('3550308', FCTe.exped.enderExped.cMun);
  Assert.AreEqual('SAO PAULO', FCTe.exped.enderExped.xMun);
  Assert.AreEqual('04661200', FCTe.exped.enderExped.CEP);
  Assert.AreEqual('SP', FCTe.exped.enderExped.UF);
  Assert.AreEqual('1058', FCTe.exped.enderExped.cPais);
  Assert.AreEqual('Brasil', FCTe.exped.enderExped.xPais);
end;

procedure TGBFRCTeTestBase.TestTagIde;
begin
  Assert.AreEqual('35', FCTe.ide.cUF);
  Assert.AreEqual('26504524', FCTe.ide.cCT);
  Assert.AreEqual('6352', FCTe.ide.CFOP);
  Assert.AreEqual('Prest.Serv.Transp.p/ Ind.', FCTe.ide.natOp);
  Assert.AreEqual(57, FCTe.ide.&mod);
  Assert.AreEqual('1', FCTe.ide.serie);
  Assert.AreEqual(594034, FCTe.ide.nCT);
  Assert.AreEqual('2020-09-03 21:14:02', FormatDateTime('yyyy-MM-dd hh:mm:ss', FCTe.ide.dhEmi));
  Assert.AreEqual('2020-09-03 21:14:02', FormatDateTime('yyyy-MM-dd hh:mm:ss', FCTe.ide.dhEmi));
  Assert.AreEqual(CTeRetrato, FCTe.ide.tpImp);
  Assert.AreEqual(1, FCTe.ide.tpEmis.Value);
  Assert.AreEqual('6', FCTe.ide.cDV);
  Assert.AreEqual('1', FCTe.ide.tpAmb.Value.ToString);
  Assert.AreEqual('0', FCTe.ide.tpCTe.Value.ToString);
  Assert.AreEqual('0', FCTe.ide.procEmi.Value.ToString);
  Assert.AreEqual('NDDigital CTe 4.8.5', FCTe.ide.verProc);
  Assert.AreEqual('3550308', FCTe.ide.cMunEnv);
  Assert.AreEqual('SAO PAULO', FCTe.ide.xMunEnv);
  Assert.AreEqual('SP', FCTe.ide.UFEnv);
  Assert.AreEqual('01', FCTe.ide.modal.Value);
  Assert.AreEqual('3550308', FCTe.ide.cMunIni);
  Assert.AreEqual('SAO PAULO', FCTe.ide.xMunIni);
  Assert.AreEqual('SP', FCTe.ide.UFIni);
  Assert.AreEqual('4209102', FCTe.ide.cMunFim);
  Assert.AreEqual('JOINVILLE', FCTe.ide.xMunFim);
  Assert.AreEqual('SC', FCTe.ide.UFFim);
  Assert.AreEqual(True, FCTe.ide.retira);
  Assert.AreEqual('1', FCTe.ide.indIEToma.Value.ToString);
end;

procedure TGBFRCTeTestBase.TestTagInfDoc;
begin
  Assert.AreEqual(2, FCTe.infCTeNorm.infDoc.infoNFe.Count);
  Assert.AreEqual('35200900507405000110550020002244301100136434', FCTe.infCTeNorm.infDoc.infoNFe[0].chave);
  Assert.AreEqual('35200900507405000110550020002244311100076560', FCTe.infCTeNorm.infDoc.infoNFe[1].chave);
end;

procedure TGBFRCTeTestBase.TestTagInfModal;
begin
  Assert.AreEqual('3.00', FCTe.infCTeNorm.infModal.versaoModal);
  Assert.AreEqual('02661898', FCTe.infCTeNorm.infModal.rodo.RNTRC);
end;

procedure TGBFRCTeTestBase.TestTagInfProt;
begin
  Assert.AreEqual(1, FCTe.infProt.tpAmb.Value);
  Assert.AreEqual('SP-CTe-2020-07-30-1', FCTe.infProt.verAplic);
  Assert.AreEqual('35200903629957000602570010005940341265045246', FCTe.infProt.chCTe);
  Assert.AreEqual('2020-09-03 21:14:23', FormatDateTime('yyyy-MM-dd hh:mm:ss', FCTe.infProt.dhRecbto));
  Assert.AreEqual('135202542091439', FCTe.infProt.nProt);
  Assert.AreEqual('0S1cw4RU3NtxYKf26+U/QVB0oN0=', FCTe.infProt.digVal);
  Assert.AreEqual('Autorizado o uso do CT-e', FCTe.infProt.xMotivo);
  Assert.AreEqual(100, FCTe.infProt.cStat);
end;

procedure TGBFRCTeTestBase.TestTagRem;
begin
  Assert.AreEqual('00507405000110', FCTe.rem.CNPJ);
  Assert.AreEqual('114371178114', FCTe.rem.IE);
  Assert.AreEqual('MURRELEKTRONIK DO BRASIL IND.COM.LTDA', FCTe.rem.xNome);
  Assert.AreEqual('MURR', FCTe.rem.xFant);
  Assert.AreEqual('0056311017', FCTe.rem.fone);

  Assert.AreEqual('AV INTERLAGOS', FCTe.rem.enderReme.xLgr);
  Assert.AreEqual('3493', FCTe.rem.enderReme.nro);
  Assert.AreEqual('', FCTe.rem.enderReme.xCpl);
  Assert.AreEqual('JARDIM UMUARAMA', FCTe.rem.enderReme.xBairro);
  Assert.AreEqual('3550308', FCTe.rem.enderReme.cMun);
  Assert.AreEqual('SAO PAULO', FCTe.rem.enderReme.xMun);
  Assert.AreEqual('04661200', FCTe.rem.enderReme.CEP);
  Assert.AreEqual('SP', FCTe.rem.enderReme.UF);
  Assert.AreEqual('1058', FCTe.rem.enderReme.cPais);
  Assert.AreEqual('Brasil', FCTe.rem.enderReme.xPais);
end;

procedure TGBFRCTeTestBase.TestTagToma3;
begin
  Assert.AreEqual(3, FCTe.ide.toma3.toma.Value);
end;

procedure TGBFRCTeTestBase.TestTagVPrest;
begin
  Assert.AreEqual('107,82', CurrToStr(FCTe.vPrest.vTPrest));
  Assert.AreEqual('107,85', CurrToStr(FCTe.vPrest.vRec));
  Assert.AreEqual(4, FCTe.vPrest.Comp.Count);

  Assert.AreEqual('FRETE PESO', FCTe.vPrest.Comp[0].xNome);
  Assert.AreEqual('46,75', CurrToStr( FCTe.vPrest.Comp[0].vComp));

  Assert.AreEqual('FRETE VALOR', FCTe.vPrest.Comp[1].xNome);
  Assert.AreEqual('37,59', CurrToStr( FCTe.vPrest.Comp[1].vComp));

  Assert.AreEqual('PEDAGIO', FCTe.vPrest.Comp[2].xNome);
  Assert.AreEqual('4,68', CurrToStr( FCTe.vPrest.Comp[2].vComp));

  Assert.AreEqual('GRIS', FCTe.vPrest.Comp[3].xNome);
  Assert.AreEqual('18,8', CurrToStr( FCTe.vPrest.Comp[3].vComp));
end;

initialization
  TDUnitX.RegisterTestFixture(TGBFRCTeTestBase);

end.
