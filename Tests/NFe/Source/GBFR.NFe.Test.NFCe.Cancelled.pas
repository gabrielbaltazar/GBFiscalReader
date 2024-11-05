unit GBFR.NFe.Test.NFCe.Cancelled;

interface

uses
  DUnitX.TestFramework,
  GBFR.NFe.Test.Base,
  GBFR.NFe.Model.Classes,
  GBFR.NFe.Model.Types,
  GBFR.NFe.XML.Interfaces,
  System.DateUtils,
  System.SysUtils,
  System.Classes,
  Winapi.Windows;

type
  [TestFixture]
  TGBFRNFeTestNFCeCancelled = class(TGBFRNFeTestBase)
  private
    FModel: TGBFRNFeModel;
  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    procedure NotaCancelada;
  end;

implementation

const
  XML_NFCe = 'NFCe41200999999999999999650020000000481000000659_CANCELADA';

{ TGBFRNFeTestNFCeCancelled }

procedure TGBFRNFeTestNFCeCancelled.NotaCancelada;
begin
  Assert.IsTrue(FModel.NFeCancelada);
  Assert.AreEqual('242240560179223', FModel.Cancelamento.NProt);
  Assert.AreEqual('110111', FModel.Cancelamento.TpEvento);
  Assert.AreEqual(135, FModel.Cancelamento.CStat);
  Assert.AreEqual(NFeProducao, FModel.Cancelamento.TpAmb);
  Assert.AreEqual<TDateTime>(EncodeDateTime(2024, 10, 4, 18, 10, 2, 0),
    FModel.Cancelamento.DhRegEvento);
end;

procedure TGBFRNFeTestNFCeCancelled.Setup;
var
  LXml: string;
begin
  LXml := LoadXMLResource(XML_NFCe);
  FModel := XMLNFeReader.LoadFromContent(LXml);
end;

procedure TGBFRNFeTestNFCeCancelled.TearDown;
begin
  FreeAndNil(FModel);
end;

end.
