unit GBFR.NFe.Test.NFeComISSQN;

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
  XML_NFCe = 'nfeComISSQN';

type
  [TestFixture]
  TGBFRNFeTestNFeComISSQN = class(TGBFRNFeTestBase)

  private
    FModel : TGBFRNFeModel;

  public
    [Test]
    procedure TestISSQNItem1;

    [Test]
    procedure TestISSQNItem2;

    [Test]
    procedure TestISSQNTot;

    constructor create;
    destructor  Destroy; override;
  end;

implementation

{ TGBFRNFeTestNFeComISSQN }

constructor TGBFRNFeTestNFeComISSQN.create;
var
  xml : string;
begin
  xml    := LoadXMLResource(XML_NFCe);
  FModel := XMLNFeReader.loadFromContent(xml);
end;

destructor TGBFRNFeTestNFeComISSQN.Destroy;
begin
  FModel.Free;
  inherited;
end;

procedure TGBFRNFeTestNFeComISSQN.TestISSQNItem1;
begin
  Assert.AreEqual(StrToCurr('150'), FModel.itens[0].imposto.ISSQN.vBC);
  Assert.AreEqual(StrToCurr('5'), FModel.itens[0].imposto.ISSQN.vAliq);
  Assert.AreEqual(StrToCurr('7,50'), FModel.itens[0].imposto.ISSQN.vISSQN);
  Assert.AreEqual('5300108', FModel.itens[0].imposto.ISSQN.cMunFG);
  Assert.AreEqual('09.01', FModel.itens[0].imposto.ISSQN.cListServ);
  Assert.AreEqual(NFeExigivel, FModel.itens[0].imposto.ISSQN.indISS);
  Assert.AreEqual(NFeIIFSim, FModel.itens[0].imposto.ISSQN.indIncentivo);
end;

procedure TGBFRNFeTestNFeComISSQN.TestISSQNItem2;
begin
  Assert.AreEqual(StrToCurr('160'), FModel.itens[1].imposto.ISSQN.vBC);
  Assert.AreEqual(StrToCurr('5'), FModel.itens[1].imposto.ISSQN.vAliq);
  Assert.AreEqual(StrToCurr('8'), FModel.itens[1].imposto.ISSQN.vISSQN);
  Assert.AreEqual('5300108', FModel.itens[1].imposto.ISSQN.cMunFG);
  Assert.AreEqual('09.01', FModel.itens[1].imposto.ISSQN.cListServ);
  Assert.AreEqual(NFeExigivel, FModel.itens[1].imposto.ISSQN.indISS);
  Assert.AreEqual(NFeIIFSim, FModel.itens[1].imposto.ISSQN.indIncentivo);
end;

procedure TGBFRNFeTestNFeComISSQN.TestISSQNTot;
begin
  Assert.AreEqual(StrToCurr('310'), FModel.ISSQNTot.vServ);
  Assert.AreEqual(StrToCurr('310'), FModel.ISSQNTot.vBC);
  Assert.AreEqual(StrToCurr('15,50'), FModel.ISSQNTot.vISS);
  Assert.AreEqual(StrToCurr('5,12'), FModel.ISSQNTot.vPIS);
  Assert.AreEqual(StrToCurr('23,56'), FModel.ISSQNTot.vCOFINS);
  Assert.AreEqual(StrToCurr('23,56'), FModel.ISSQNTot.vCOFINS);
  Assert.AreEqual('2020-10-31', FormatDateTime('yyyy-MM-dd', FModel.ISSQNTot.dCompet));
end;

end.
