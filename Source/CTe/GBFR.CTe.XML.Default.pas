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

    procedure loadTagInfCte;
    procedure loadTagIde;
    procedure loadTagIdeToma3(ANode: IXMLNode);
    procedure loadTagCompl;
    procedure loadTagEmit;
    procedure loadTagRem;
    procedure loadTagExped;
    procedure loadTagEndereco(ANode: IXMLNode; AEndereco: TGBFRCTeModelEndereco);

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

    loadTagInfCte;
    loadTagIde;
    loadTagCompl;
    loadTagEmit;
    loadTagRem;
    loadTagExped;
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

procedure TGBFRCTeXMLDefault.loadTagCompl;
var
  nodeCompl: IXMLNode;
begin
  nodeCompl := FInfCTe.ChildNodes.FindNode('compl');
  if not Assigned(nodeCompl) then
    Exit;

  FCTe.compl.xCaracAd  := GetNodeStr(nodeCompl, 'xCaracAd');
  FCTe.compl.xCaracSer := GetNodeStr(nodeCompl, 'xCaracSer');
  FCTe.compl.xEmi      := GetNodeStr(nodeCompl, 'xEmi');
  FCTe.compl.origCalc  := GetNodeStr(nodeCompl, 'origCalc');
  FCTe.compl.destCalc  := GetNodeStr(nodeCompl, 'destCalc');
  FCTe.compl.xObs      := GetNodeStr(nodeCompl, 'xObs');
end;

procedure TGBFRCTeXMLDefault.loadTagEmit;
var
  nodeEmit: IXMLNode;
  nodeEndereco: IXMLNode;
begin
  nodeEmit := FInfCTe.ChildNodes.FindNode('emit');
  if not Assigned(nodeEmit) then
    Exit;

  FCTe.emit.CNPJ  := GetNodeStr(nodeEmit, 'CNPJ');
  FCTe.emit.IE    := GetNodeStr(nodeEmit, 'IE');
  FCTe.emit.IEST  := GetNodeStr(nodeEmit, 'IEST');
  FCTe.emit.xNome := GetNodeStr(nodeEmit, 'xNome');
  FCTe.emit.xFant := GetNodeStr(nodeEmit, 'xFant');

  nodeEndereco := nodeEmit.ChildNodes.FindNode('enderEmit');
  loadTagEndereco(nodeEndereco, FCTe.emit.enderEmit);
end;

procedure TGBFRCTeXMLDefault.loadTagEndereco(ANode: IXMLNode; AEndereco: TGBFRCTeModelEndereco);
begin
  if not Assigned(ANode) then
    Exit;

  AEndereco.xLgr    := GetNodeStr(ANode, 'xLgr');
  AEndereco.nro     := GetNodeStr(ANode, 'nro');
  AEndereco.xCpl    := GetNodeStr(ANode, 'xCpl');
  AEndereco.xBairro := GetNodeStr(ANode, 'xBairro');
  AEndereco.cMun    := GetNodeStr(ANode, 'cMun');
  AEndereco.xMun    := GetNodeStr(ANode, 'xMun');
  AEndereco.CEP     := GetNodeStr(ANode, 'CEP');
  AEndereco.UF      := GetNodeStr(ANode, 'UF');
  AEndereco.cPais   := GetNodeStr(ANode, 'cPais');
  AEndereco.xPais   := GetNodeStr(ANode, 'xPais');
  AEndereco.email   := GetNodeStr(ANode, 'email');
  AEndereco.fone    := GetNodeStr(ANode, 'fone');
end;

procedure TGBFRCTeXMLDefault.loadTagExped;
var
  nodeExped: IXMLNode;
  nodeEndereco: IXMLNode;
begin
  nodeExped := FInfCTe.ChildNodes.FindNode('exped');
  if not Assigned(nodeExped) then
    Exit;

  FCTe.exped.CNPJ  := GetNodeStr(nodeExped, 'CNPJ');
  FCTe.exped.IE    := GetNodeStr(nodeExped, 'IE');
  FCTe.exped.IEST  := GetNodeStr(nodeExped, 'IEST');
  FCTe.exped.xNome := GetNodeStr(nodeExped, 'xNome');
  FCTe.exped.xFant := GetNodeStr(nodeExped, 'xFant');
  FCTe.exped.fone  := GetNodeStr(nodeExped, 'fone');

  nodeEndereco := nodeExped.ChildNodes.FindNode('enderExped');
  loadTagEndereco(nodeEndereco, FCTe.exped.enderExped);
end;

procedure TGBFRCTeXMLDefault.loadTagIde;
var
  nodeIDE : IXMLNode;
begin
  try
    nodeIDE := FInfCTe.ChildNodes.FindNode('ide');

    if Assigned(nodeIDE) then
    begin
      FCTe.ide.tpAmb.fromInteger(GetNodeInt(nodeIDE, 'tpAmb', 2));
      FCTe.ide.tpImp.fromInteger(GetNodeInt(nodeIDE, 'tpImp', 1));
      FCTe.ide.tpEmis.fromInteger(GetNodeInt(nodeIDE, 'tpEmis', 1));
      FCTe.ide.tpCTe.fromInteger(GetNodeInt(nodeIDE, 'tpCTe', 0));
      FCTe.ide.procEmi.fromInteger(GetNodeInt(nodeIDE, 'procEmi', 0));
      FCTe.ide.modal.fromString(GetNodeStr(nodeIDE, 'modal', '00'));
      FCTe.ide.tpServ.fromInteger(GetNodeInt(nodeIDE, 'tpServ', 0));
      FCTe.ide.indIEToma.fromInteger(GetNodeInt(nodeIDE, 'indIEToma', 9));

      FCTe.ide.cUF            := GetNodeStr(nodeIDE, 'cUF');
      FCTe.ide.cCT            := GetNodeStr(nodeIDE, 'cCT');
      FCTe.ide.CFOP           := GetNodeStr(nodeIDE, 'CFOP');
      FCTe.ide.natOp          := GetNodeStr(nodeIDE, 'natOp');
      FCTe.ide.&mod           := GetNodeInt(nodeIDE, 'mod');
      FCTe.ide.serie          := GetNodeStr(nodeIDE, 'serie');
      FCTe.ide.nCT            := GetNodeInt(nodeIDE, 'nCT');
      FCTe.ide.dhEmi          := GetNodeDate(nodeIDE, 'dhEmi');
      FCTe.ide.cDV            := GetNodeStr(nodeIDE, 'cDV');
      FCTe.ide.verProc        := GetNodeStr(nodeIDE, 'verProc');
      FCTe.ide.indGlobalizado := GetNodeStr(nodeIDE, 'indGlobalizado');
      FCTe.ide.cMunEnv        := GetNodeStr(nodeIDE, 'cMunEnv');
      FCTe.ide.xMunEnv        := GetNodeStr(nodeIDE, 'xMunEnv');
      FCTe.ide.UFEnv          := GetNodeStr(nodeIDE, 'UFEnv');
      FCTe.ide.cMunIni        := GetNodeStr(nodeIDE, 'cMunIni');
      FCTe.ide.xMunIni        := GetNodeStr(nodeIDE, 'xMunIni');
      FCTe.ide.UFIni          := GetNodeStr(nodeIDE, 'UFIni');
      FCTe.ide.cMunFim        := GetNodeStr(nodeIDE, 'cMunFim');
      FCTe.ide.xMunFim        := GetNodeStr(nodeIDE, 'xMunFim');
      FCTe.ide.UFFim          := GetNodeStr(nodeIDE, 'UFFim');
      FCTe.ide.retira         := GetNodeBoolInt(nodeIDE, 'retira');
      FCTe.ide.xRetira        := GetNodeStr(nodeIDE, 'xRetira');

      loadTagIdeToma3(nodeIDE.ChildNodes.FindNode('toma3'));
    end;
  except
    on e : Exception do
    begin
      e.Message := 'Error on read Tag <ide>: ' + e.Message;
      raise;
    end;
  end;
end;

procedure TGBFRCTeXMLDefault.loadTagIdeToma3(ANode: IXMLNode);
begin
  if not Assigned(ANode) then
    Exit;

  FCTe.ide.toma3.toma.fromInteger(GetNodeInt(ANode, 'toma'));
end;

procedure TGBFRCTeXMLDefault.loadTagInfCte;
var
  node : IXMLNode;
begin
  repeat
    if node = nil then
      node := FXml.DocumentElement
    else
    begin
      if node.ChildNodes.Count = 0 then
      begin
        node := nil;
        break;
      end;
      node := node.ChildNodes.Get(0);
    end;
  until (node = nil) or (node.NodeName = 'infCte');

  if (not Assigned(node)) or (not node.NodeName.Equals( 'infCte' )) then
    raise Exception.CreateFmt('Error on read Tag infCte', []);

  FInfCTe     := node;
  FCTe.Id     := FInfCTe.Attributes['Id'];
  FCTe.versao := FInfCTe.Attributes['versao'];
end;

procedure TGBFRCTeXMLDefault.loadTagRem;
var
  nodeRem: IXMLNode;
  nodeEndereco: IXMLNode;
begin
  nodeRem := FInfCTe.ChildNodes.FindNode('rem');
  if not Assigned(nodeRem) then
    Exit;

  FCTe.rem.CNPJ  := GetNodeStr(nodeRem, 'CNPJ');
  FCTe.rem.IE    := GetNodeStr(nodeRem, 'IE');
  FCTe.rem.IEST  := GetNodeStr(nodeRem, 'IEST');
  FCTe.rem.xNome := GetNodeStr(nodeRem, 'xNome');
  FCTe.rem.xFant := GetNodeStr(nodeRem, 'xFant');
  FCTe.rem.fone  := GetNodeStr(nodeRem, 'fone');

  nodeEndereco := nodeRem.ChildNodes.FindNode('enderReme');
  loadTagEndereco(nodeEndereco, FCTe.rem.enderReme);
end;

class function TGBFRCTeXMLDefault.New: IGBFRCTeXML;
begin
  result := Self.create;
end;

end.
