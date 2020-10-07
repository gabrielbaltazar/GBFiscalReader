unit GBFR.CTe.XML.Default;

interface

uses
  GBFR.CTe.Model.Classes,
  GBFR.CTe.Model.Types,
  GBFR.CTe.XML.Interfaces,
  GBFR.XML.Base,
  System.Classes,
  System.SysUtils,
  Xml.XMLIntf,
  Xml.XMLDoc;

type TGBFRCTeXMLDefault = class(TGBFRXmlBase, IGBFRCTeXML)

  private
    FCTe: TGBFRCTeModel;
    [Weak]
    FInfCTe: IXMLNode;

    procedure loadTagIde;

  protected
    function loadFromContent(Value: String): TGBFRCTeModel;
    function loadFromFile   (Value: String): TGBFRCTeModel;

  public
    class function New: IGBFRCTeXML;
end;

implementation

{ TGBFRCTeXMLDefault }

function TGBFRCTeXMLDefault.loadFromContent(Value: String): TGBFRCTeModel;
begin
  loadXmlContent(Value);
  Result := TGBFRCTeModel.create;
  try
    FCTe := Result;

    loadTagIde;
  except
    Result.Free;
    raise;
  end;
end;

function TGBFRCTeXMLDefault.loadFromFile(Value: String): TGBFRCTeModel;
var
  xmlFile: TStrings;
begin
  xmlFile := TStringList.Create;
  try
    xmlFile.LoadFromFile(Value);
    result := loadFromContent(xmlFile.Text);
  finally
    xmlFile.Free;
  end;
end;

procedure TGBFRCTeXMLDefault.loadTagIde;
var
  nodeIDE : IXMLNode;
begin
  try
    FInfCTe := FXml.DocumentElement.ChildNodes.Get(0)
                                   .ChildNodes.Get(0);
    if not Assigned(FInfCTe) then
      raise Exception.CreateFmt('Error on read Tag infCTe', []);

    nodeIDE := FInfCTe.ChildNodes.FindNode('ide');

    if Assigned(nodeIDE) then
    begin
      FCTe.ide.tpAmb.fromInteger(GetNodeInt(nodeIDE, 'tpAmb', 2));
      FCTe.ide.cUF := GetNodeStr(nodeIDE, 'cUF');

      FCTe.ide.cCT     := GetNodeStr(nodeIDE, 'cCT');
      FCTe.ide.CFOP    := GetNodeStr(nodeIDE, 'CFOP');
      FCTe.ide.natOp   := GetNodeStr(nodeIDE, 'natOp');
      FCTe.ide.&mod    := GetNodeInt(nodeIDE, 'mod');
      FCTe.ide.serie   := GetNodeStr(nodeIDE, 'serie');
      FCTe.ide.nCT     := GetNodeInt(nodeIDE, 'nCT');
      FCTe.ide.dhEmi   := GetNodeDate(nodeIDE, 'dhEmi');
      FCTe.ide.verProc := GetNodeStr(nodeIDE, 'verProc');
      FCTe.ide.cMunEnv := GetNodeStr(nodeIDE, 'cMunEnv');
    end;
  except
    on e : Exception do
    begin
      e.Message := 'Error on read Tag <ide>: ' + e.Message;
      raise;
    end;
  end;
end;

class function TGBFRCTeXMLDefault.New: IGBFRCTeXML;
begin
  result := Self.create;
end;

end.
