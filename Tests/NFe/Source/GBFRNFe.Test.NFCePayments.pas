unit GBFRNFe.Test.NFCePayments;

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
  TGBFRNFeTestNFCePayments = class(TGBFRNFeTestBase)

  private
    FModel: TGBFRNFeModel;

  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    procedure NFCeTwoPayments;

  end;

implementation

{ TGBFRNFeTestNFCePayments }

procedure TGBFRNFeTestNFCePayments.NFCeTwoPayments;
var
  LXML: string;
begin
  LXML := LoadXMLResource('nfceCom2Pagamentos');
  FModel := XMLNFeReader.loadFromContent(LXML);
  Assert.IsNotNull(FModel);

  Assert.AreEqual(2, FModel.pag.detPag.Count);
  Assert.AreEqual<Currency>(100, FModel.pag.detPag[0].vPag);
  Assert.AreEqual<Currency>(50, FModel.pag.detPag[1].vPag);
end;

procedure TGBFRNFeTestNFCePayments.Setup;
begin
  FModel := nil;
end;

procedure TGBFRNFeTestNFCePayments.TearDown;
begin
  FModel.Free;
end;

end.
