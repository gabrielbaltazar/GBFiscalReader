unit GBFR.NFe.Test.NFCePayments;

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
    FXML: String;

  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    procedure NFCeTwoPayments;

    [Test]
    procedure NFCeTwoPaymentsWithCharge;
  end;

implementation

{ TGBFRNFeTestNFCePayments }

procedure TGBFRNFeTestNFCePayments.NFCeTwoPayments;
begin
  FXML := LoadXMLResource('nfceCom2Pagamentos');
  FModel := XMLNFeReader.loadFromContent(FXML);
  Assert.IsNotNull(FModel);

  Assert.AreEqual(2, FModel.pag.detPag.Count);
  Assert.AreEqual<Currency>(100, FModel.pag.detPag[0].vPag);
  Assert.AreEqual<Currency>(50, FModel.pag.detPag[1].vPag);
end;

procedure TGBFRNFeTestNFCePayments.NFCeTwoPaymentsWithCharge;
begin
  FXML := LoadXMLResource('nfceCom2PagamentosETroco');
  FModel := XMLNFeReader.loadFromContent(FXML);
  Assert.IsNotNull(FModel);

  Assert.AreEqual(2, FModel.pag.detPag.Count);
  Assert.AreEqual<Currency>(8, FModel.pag.vTroco);
  Assert.AreEqual<Currency>(50, FModel.pag.detPag[0].vPag);
  Assert.AreEqual<Currency>(40, FModel.pag.detPag[1].vPag);
  Assert.AreEqual('54742734000175', FModel.pag.detPag[1].Card.CNPJ);
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
