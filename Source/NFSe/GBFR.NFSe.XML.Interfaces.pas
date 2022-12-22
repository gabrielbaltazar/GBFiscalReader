unit GBFR.NFSe.XML.Interfaces;

interface

uses
  GBFR.NFSe.Model.Classes,
  System.SysUtils,
  System.Classes;

type
  TGBFRNFSeModel = GBFR.NFSe.Model.Classes.TGBFRNFSeModel;
  TGBFRNFSeModelEndereco = GBFR.NFSe.Model.Classes.TGBFRNFSeModelEndereco;
  TGBFRNFSeModelPessoa = GBFR.NFSe.Model.Classes.TGBFRNFSeModelPessoa;
  TGBFRNFSeModelServico = GBFR.NFSe.Model.Classes.TGBFRNFSeModelServico;

  IGBFRNFSeXML = interface
    ['{F2ACAB51-E7F8-4A26-B1BA-CFD01FD4FB2C}']
    function LoadNFSeFromContent(AValue: string): TGBFRNFSeModel;
    function LoadNFSeFromFile(AValue: string): TGBFRNFSeModel;
    function LoadNFSeFromStream(AValue: TStream): TGBFRNFSeModel;
  end;

function GetNFSeXML: IGBFRNFSeXML;

implementation

uses
  GBFR.NFSe.XML;

function GetNFSeXML: IGBFRNFSeXML;
begin
  Result := TGBFRNFSeXML.New;
end;

end.
