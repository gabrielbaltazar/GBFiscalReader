unit GBFR.NFSe.Test.Padroes;

interface

uses
  DUnitX.TestFramework,
  GBFR.NFSe.Test.Base,
  GBFR.NFSe.Model.Types,
  GBFR.NFSe.Model.Classes,
  GBFR.NFSe.XML.Interfaces,
  Winapi.ActiveX,
  System.SysUtils,
  System.Classes;

type
  [TestFixture]
  TGBFRNFSeTestPadroes = class(TGBFRNFSeTestBase)
  private
    FModel: TGBFRNFSeModel;

    procedure LerXml(AResourceName: string);
  public
    [Setup]
    procedure Setup;

    [Teardown]
    procedure Teardown;

    [Test]
    procedure Abrasf204;

    [Test]
    procedure IssNetOnline;
  end;

implementation

{ TGBFRNFSeTestPadroes }

procedure TGBFRNFSeTestPadroes.Abrasf204;
begin
  LerXml('MT_MATOGROSSO_ABRASF');
  Assert.AreEqual('Abrasf 2.04', FModel.Padrao);
end;

procedure TGBFRNFSeTestPadroes.IssNetOnline;
begin
  LerXml('MT_MATOGROSSO_ISSNETONLINE');
  Assert.AreEqual('IssNetOnline', FModel.Padrao);
end;

procedure TGBFRNFSeTestPadroes.LerXml(AResourceName: string);
var
  LXml: string;
begin
  LXml := LoadXMLResource(AResourceName);
  FModel := GetNFSeXML.LoadNFSeFromContent(LXml);
end;

procedure TGBFRNFSeTestPadroes.Setup;
begin
  CoInitialize(nil);
end;

procedure TGBFRNFSeTestPadroes.Teardown;
begin
  CoUninitialize;
  FreeAndNil(FModel);
end;

end.
