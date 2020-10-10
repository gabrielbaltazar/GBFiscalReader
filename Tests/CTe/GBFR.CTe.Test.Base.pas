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

procedure TGBFRCTeTestBase.TestInfCTe;
begin
  Assert.AreEqual('CTe35200903629957000602570010005940341265045246', FCTe.Id);
  Assert.AreEqual('3.00', FCTe.versao);
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

procedure TGBFRCTeTestBase.TestTagToma3;
begin
  Assert.AreEqual(3, FCTe.ide.toma3.toma.Value);
end;

initialization
  TDUnitX.RegisterTestFixture(TGBFRCTeTestBase);

end.
