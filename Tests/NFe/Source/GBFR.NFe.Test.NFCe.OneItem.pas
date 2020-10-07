unit GBFR.NFe.Test.NFCe.OneItem;

interface

uses
  DUnitX.TestFramework,
  GBFR.NFe.Test.Base,
  GBFR.NFe.Model.Classes,
  GBFR.NFe.XML.Interfaces,
  System.SysUtils,
  System.Classes,
  Winapi.Windows;

const
  XML_NFCe = 'NFCe41200699999999999999650020000000031000000117';

type
  [TestFixture]
  TGBFRNFeTestNFCeOneItem = class(TGBFRNFeTestBase)

  private
    FModel : TGBRFNFeModel;

  public
    [Test]
    procedure TestInfNFe;

    [Test]
    procedure TestIde;

    constructor create;
    destructor  Destroy; override;
  end;

implementation

{ TGBFRNFeTestNFCeOneItem }

constructor TGBFRNFeTestNFCeOneItem.create;
var
  xml : string;
begin
  xml    := LoadXMLResource(XML_NFCe);
  FModel := XMLNFeReader.loadFromContent(xml);
end;

destructor TGBFRNFeTestNFCeOneItem.Destroy;
begin
  FModel.Free;
  inherited;
end;

procedure TGBFRNFeTestNFCeOneItem.TestIde;
begin
  Assert.AreEqual('41', FModel.ide.cUF);
end;

procedure TGBFRNFeTestNFCeOneItem.TestInfNFe;
begin
  Assert.AreEqual('NFe41200699999999999999650020000000031000000117', FModel.Id);
  Assert.AreEqual('4.00', FModel.versao);
end;

initialization
  TDUnitX.RegisterTestFixture(TGBFRNFeTestBase);

end.
