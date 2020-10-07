unit GBFR.CTe.Test.Base;

interface

uses
  DUnitX.TestFramework,
  System.SysUtils,
  System.Classes,
  Winapi.Windows,
  GBFR.CTe.Model.Classes,
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
    procedure TestTagIde;

    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

  end;

implementation

{ TGBFRCTeTestBase }

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

procedure TGBFRCTeTestBase.Setup;
var
  xml : string;
begin
  xml  := LoadXMLResource(XML_RES);
  FCTe := XMLCTeReader.loadFromContent(xml);
end;

procedure TGBFRCTeTestBase.TearDown;
begin
  FreeAndNil(FCTe);
end;

procedure TGBFRCTeTestBase.TestTagIde;
begin
  Assert.AreEqual('35', FCTe.ide.cUF);
  Assert.AreEqual('26504524', FCTe.ide.cCT);
  Assert.AreEqual('6352', FCTe.ide.CFOP);
  Assert.AreEqual('Prest.Serv.Transp.p/ Ind.', FCTe.ide.natOp);
  Assert.AreEqual(57, FCTe.ide.&mod);
end;

initialization
  TDUnitX.RegisterTestFixture(TGBFRCTeTestBase);

end.
