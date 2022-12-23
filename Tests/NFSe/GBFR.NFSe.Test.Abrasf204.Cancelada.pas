unit GBFR.NFSe.Test.Abrasf204.Cancelada;

interface

uses
  DUnitX.TestFramework,
  GBFR.NFSe.Test.Base,
  GBFR.NFSe.Model.Types,
  GBFR.NFSe.Model.Abrasf204,
  GBFR.NFSe.Model.Classes,
  GBFR.NFSe.XML.Abrasf204.Interfaces,
  GBFR.NFSe.XML.Abrasf204,
  Winapi.ActiveX,
  System.SysUtils,
  System.Classes;

type
  [TestFixture]
  TGBFRNFSeTestAbrasf204Cancelada = class(TGBFRNFSeTestBase)
  private
    FCompNFSe: TGBFRNFSeModelAbrasf204CompNFSe;
    FNFSe: TGBFRNFSeModelAbrasf204NFSe;
    FModel: TGBFRNFSeModel;
  public
    [Setup]
    procedure Setup;

    [Teardown]
    procedure Teardown;

    [Test]
    procedure DFBrasilia;
  end;

implementation

{ TGBFRNFSeTestAbrasf204Cancelada }

procedure TGBFRNFSeTestAbrasf204Cancelada.DFBrasilia;
begin
  Assert.AreEqual('2', FCompNFSe.NFSeCancelamento.Confirmacao.Pedido.InfPedidoCancelamento.CodigoCancelamento);
  Assert.AreEqual('2022-12-23 13:34:10',
    FormatDateTime('yyyy-MM-dd hh:mm:ss', FCompNFSe.NFSeCancelamento.Confirmacao.DataHora));
  Assert.AreEqual(sCancelado, FCompNFSe.GetSituacao);

  Assert.AreEqual(sCancelado, FModel.Situacao);
  Assert.AreEqual('2', FModel.CodigoCancelamento);
  Assert.AreEqual('2022-12-23 13:34:10', FormatDateTime('yyyy-MM-dd hh:mm:ss', FModel.DataCancelamento));
end;

procedure TGBFRNFSeTestAbrasf204Cancelada.Setup;
var
  LXml: string;
begin
  CoInitialize(nil);
  LXml := LoadXMLResource('DF_BRASILIA_ABRASF_CANCELADA');
  FCompNFSe := TGBFRNFSeXMLAbrasf204.New.LoadFromContent(LXml);
  FModel := FCompNFSe.ToModelNFSe;
end;

procedure TGBFRNFSeTestAbrasf204Cancelada.Teardown;
begin
  CoUninitialize;
  FreeAndNil(FCompNFSe);
  FreeAndNil(FModel);
end;

end.
