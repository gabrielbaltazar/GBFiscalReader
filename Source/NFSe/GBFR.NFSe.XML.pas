unit GBFR.NFSe.XML;

interface

uses
  GBFR.NFSe.Model.Classes,
  GBFR.NFSe.XML.Interfaces,
  GBFR.NFSe.XML.Abrasf204,
  GBFR.NFSe.XML.IssNetOnline,
  System.SysUtils,
  System.Classes;

type
  TGBFRNFSeXML = class(TInterfacedObject, IGBFRNFSeXML)
  private
    function CreateStrategy(AXml: string): IGBFRNFSeXML;
  protected
    function LoadNFSeFromContent(AValue: string): TGBFRNFSeModel;
    function LoadNFSeFromFile(AValue: string): TGBFRNFSeModel;
    function LoadNFSeFromStream(AValue: TStream): TGBFRNFSeModel;
  public
    class function New: IGBFRNFSeXML;
  end;

implementation

{ TGBFRNFSeXML }

const
  ASSINATURA_ISSNETONLINE = 'xmlns:tc="http://www.issnetonline.com.br/webserviceabrasf';
  ASSINATURA_ABRASF_204 = 'xmlns="http://www.abrasf.org.br/nfse.xsd"';

function TGBFRNFSeXML.CreateStrategy(AXml: string): IGBFRNFSeXML;
begin
  if AXml.Contains(ASSINATURA_ISSNETONLINE) then
  begin
    Result := TGBFRNFSeXMLIssNetOnline.NewNFSe;
    Exit;
  end;

  if AXml.Contains(ASSINATURA_ABRASF_204) then
  begin
    Result := TGBFRNFSeXMLAbrasf204.NewNFSe;
    Exit;
  end;

  raise Exception.Create('Xml não reconhecido.');
end;

function TGBFRNFSeXML.LoadNFSeFromContent(AValue: string): TGBFRNFSeModel;
var
  LStrategy: IGBFRNFSeXML;
begin
  LStrategy := CreateStrategy(AValue);
  Result := LStrategy.LoadNFSeFromContent(AValue);
end;

function TGBFRNFSeXML.LoadNFSeFromFile(AValue: string): TGBFRNFSeModel;
var
  LXmlFile: TStrings;
begin
  LXmlFile := TStringList.Create;
  try
    LXmlFile.LoadFromFile(AValue);
    Result := LoadNFSeFromContent(LXmlFile.Text);
  finally
    LXmlFile.Free;
  end;
end;

function TGBFRNFSeXML.LoadNFSeFromStream(AValue: TStream): TGBFRNFSeModel;
var
  LStringStream: TStringStream;
  LContent: string;
begin
  LStringStream := TStringStream.Create('', TEncoding.UTF8);
  try
    LStringStream.LoadFromStream(AValue);
    LContent := LStringStream.DataString.Replace('﻿', '');
    Result := LoadNFSeFromContent(LContent)
  finally
    LStringStream.Free;
  end;
end;

class function TGBFRNFSeXML.New: IGBFRNFSeXML;
begin
  Result := Self.Create;
end;

end.
