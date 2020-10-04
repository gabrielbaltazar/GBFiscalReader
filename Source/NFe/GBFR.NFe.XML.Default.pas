unit GBFR.NFe.XML.Default;

interface

uses
  GBFR.XML.Base,
  GBFR.NFe.XML.Interfaces,
  GBFR.NFe.Model.Types,
  GBFR.NFe.Model.Item,
  GBFR.NFe.Model.NotaFiscal,
  GBFR.NFe.Model.FormaPagamento,
  System.Classes,
  System.SysUtils,
  Xml.XMLIntf,
  Xml.XMLDoc;

type TGBFRNFeXMLDefault = class(TGBFRXmlBase, IGBFRNFeXML)

  private
    FNota: TGBRFNFeModelNotaFiscal;
    [Weak]
    FInfNFe: IXMLNode;

    function GetNodeImposto(ANodeDet: IXMLNode; ATag: String): IXMLNode;

    procedure loadNotaFiscal;
    procedure loadEmitente;
    procedure loadDestinatario;
    procedure loadItems;
    procedure loadPagamentos;
    procedure loadTotals;
    procedure loadInfoAdicionais;
    procedure loadProtNFe;

    procedure loadImposto       (ANodeDet: IXMLNode);
    procedure loadImpostoICMS   (ANodeDet: IXMLNode; AItem: TGBFRNFeModelItem);
    procedure loadImpostoPIS    (ANodeDet: IXMLNode; AItem: TGBFRNFeModelItem);
    procedure loadImpostoCOFINS (ANodeDet: IXMLNode; AItem: TGBFRNFeModelItem);
    procedure loadImpostoIPI    (ANodeDet: IXMLNode; AItem: TGBFRNFeModelItem);
    procedure loadImpostoII     (ANodeDet: IXMLNode; AItem: TGBFRNFeModelItem);
    procedure loadImpostoISSQN  (ANodeDet: IXMLNode; AItem: TGBFRNFeModelItem);
  protected
    function loadFromContent(Value: String): TGBRFNFeModelNotaFiscal;
    function loadFromFile   (Value: String): TGBRFNFeModelNotaFiscal;

  public
    class function New: IGBFRNFeXML;
end;

implementation

{ TGBFRNFeXMLDefault }

function TGBFRNFeXMLDefault.GetNodeImposto(ANodeDet: IXMLNode; ATag: String): IXMLNode;
begin
  result := ANodeDet.ChildNodes.FindNode('imposto');
  if not Assigned(result) then
    Exit;

  result := result.ChildNodes.FindNode(ATag);
  if not Assigned(result) then
    Exit;

  result := result.ChildNodes.Get(0);
  if not Assigned(result) then
    Exit;
end;

procedure TGBFRNFeXMLDefault.loadDestinatario;
var
  nodeDestinatario : IXMLNode;
  nodeEndereco     : IXMLNode;
begin
  nodeDestinatario := FInfNFe.ChildNodes.FindNode('dest');

  if not Assigned(nodeDestinatario) then
    Exit;

  FNota.dest.xNome := GetNodeStr(nodeDestinatario, 'xNome');
  FNota.dest.CNPJ  := GetNodeStr(nodeDestinatario, 'CNPJ');
  FNota.dest.CPF   := GetNodeStr(nodeDestinatario, 'CPF');
  FNota.dest.IE    := GetNodeStr(nodeDestinatario, 'IE');
  FNota.dest.IM    := GetNodeStr(nodeDestinatario, 'IM');
  FNota.dest.email := GetNodeStr(nodeDestinatario, 'email');

  nodeEndereco := nodeDestinatario.ChildNodes.FindNode('enderDest');
  if Assigned(nodeEndereco) then
  begin
    FNota.dest.enderDest.xLgr    := GetNodeStr(nodeEndereco, 'xLgr');
    FNota.dest.enderDest.nro     := GetNodeStr(nodeEndereco, 'nro');
    FNota.dest.enderDest.xCpl    := GetNodeStr(nodeEndereco, 'xCpl');
    FNota.dest.enderDest.xBairro := GetNodeStr(nodeEndereco, 'xBairro');
    FNota.dest.enderDest.cMun    := GetNodeStr(nodeEndereco, 'cMun');
    FNota.dest.enderDest.xMun    := GetNodeStr(nodeEndereco, 'xMun');
    FNota.dest.enderDest.UF      := GetNodeStr(nodeEndereco, 'UF');
    FNota.dest.enderDest.CEP     := GetNodeStr(nodeEndereco, 'CEP');
    FNota.dest.enderDest.cPais   := GetNodeStr(nodeEndereco, 'cPais');
    FNota.dest.enderDest.xPais   := GetNodeStr(nodeEndereco, 'xPais');
    FNota.dest.enderDest.fone    := GetNodeStr(nodeEndereco, 'fone');
  end;
end;

procedure TGBFRNFeXMLDefault.loadEmitente;
var
  nodeEmitente: IXMLNode;
  nodeEndereco: IXMLNode;
begin
  nodeEmitente := FInfNFe.ChildNodes.FindNode('emit');

  if not Assigned(nodeEmitente) then
    raise Exception.CreateFmt('Error on read Tag emit', []);

  FNota.emit.xNome := GetNodeStr(nodeEmitente, 'xNome');
  FNota.emit.xFant := GetNodeStr(nodeEmitente, 'xFant');
  FNota.emit.CNPJ  := GetNodeStr(nodeEmitente, 'CNPJ');
  FNota.emit.IE    := GetNodeStr(nodeEmitente, 'IE');
  FNota.emit.IM    := GetNodeStr(nodeEmitente, 'IM');

  nodeEndereco := nodeEmitente.ChildNodes.FindNode('enderEmit');
  if Assigned(nodeEndereco) then
  begin
    FNota.emit.enderEmit.xLgr    := GetNodeStr(nodeEndereco, 'xLgr');
    FNota.emit.enderEmit.nro     := GetNodeStr(nodeEndereco, 'nro');
    FNota.emit.enderEmit.xCpl    := GetNodeStr(nodeEndereco, 'xCpl');
    FNota.emit.enderEmit.xBairro := GetNodeStr(nodeEndereco, 'xBairro');
    FNota.emit.enderEmit.cMun    := GetNodeStr(nodeEndereco, 'cMun');
    FNota.emit.enderEmit.xMun    := GetNodeStr(nodeEndereco, 'xMun');
    FNota.emit.enderEmit.UF      := GetNodeStr(nodeEndereco, 'UF');
    FNota.emit.enderEmit.CEP     := GetNodeStr(nodeEndereco, 'CEP');
    FNota.emit.enderEmit.cPais   := GetNodeStr(nodeEndereco, 'cPais');
    FNota.emit.enderEmit.xPais   := GetNodeStr(nodeEndereco, 'xPais');
    FNota.emit.enderEmit.fone    := GetNodeStr(nodeEndereco, 'fone');
  end;
end;

procedure TGBFRNFeXMLDefault.loadImposto(ANodeDet: IXMLNode);
var
  item : TGBFRNFeModelItem;
begin
  item := FNota.itens.Last;

  loadImpostoICMS   (ANodeDet, item);
  loadImpostoIPI    (ANodeDet, item);
  loadImpostoPIS    (ANodeDet, item);
  loadImpostoCOFINS (ANodeDet, item);
  loadImpostoII     (ANodeDet, item);
  loadImpostoISSQN  (ANodeDet, item);
end;

procedure TGBFRNFeXMLDefault.loadImpostoCOFINS(ANodeDet: IXMLNode; AItem: TGBFRNFeModelItem);
var
  nodeImposto : IXMLNode;
begin
  nodeImposto := GetNodeImposto(ANodeDet, 'COFINS');

  if not Assigned(nodeImposto) then
    Exit;

  AItem.COFINS.CST     := GetNodeStr(nodeImposto, 'CST');
  AItem.COFINS.vBC     := GetNodeCurrency(nodeImposto, 'vBC');
  AItem.COFINS.pCOFINS := GetNodeCurrency(nodeImposto, 'pCOFINS');
  AItem.COFINS.vCOFINS := GetNodeCurrency(nodeImposto, 'vCOFINS');
end;

procedure TGBFRNFeXMLDefault.loadImpostoICMS(ANodeDet: IXMLNode; AItem: TGBFRNFeModelItem);
var
  nodeImposto : IXMLNode;
begin
  nodeImposto := GetNodeImposto(ANodeDet, 'ICMS');
  if not Assigned(nodeImposto) then
    Exit;

  AItem.ICMS.CST        := GetNodeStr(nodeImposto, 'CST');
  AItem.ICMS.orig       := GetNodeStr(nodeImposto, 'orig');
  AItem.ICMS.vBC        := GetNodeCurrency(nodeImposto, 'vBC');
  AItem.ICMS.pICMS      := GetNodeCurrency(nodeImposto, 'pICMS');
  AItem.ICMS.vICMS      := GetNodeCurrency(nodeImposto, 'vICMS');
  AItem.ICMS.pRedBC     := GetNodeCurrency(nodeImposto, 'pRedBC');
  AItem.ICMS.vICMSDeson := GetNodeCurrency(nodeImposto, 'vICMSDeson');
  AItem.ICMS.vBCSTRet   := GetNodeCurrency(nodeImposto, 'vBCSTRet');

  AItem.ICMS.modBC.fromInteger( GetNodeInt(nodeImposto, 'modBC'));
  AItem.ICMS.modBCST.fromInteger(GetNodeInt(nodeImposto, 'modBCST'));

  if AItem.ICMS.vBCST > 0 then
  begin
    AItem.ICMS.pST        := GetNodeCurrency(nodeImposto, 'pST');
    AItem.ICMS.vICMSSTRet := GetNodeCurrency(nodeImposto, 'vICMSSTRet');
  end
  else
  begin
    AItem.ICMS.vBCST   := GetNodeCurrency(nodeImposto, 'vBCST');
    AItem.ICMS.pICMSST := GetNodeCurrency(nodeImposto, 'pICMSST');
    AItem.ICMS.vICMSST := GetNodeCurrency(nodeImposto, 'vICMSST');
  end;
end;

procedure TGBFRNFeXMLDefault.loadImpostoII(ANodeDet: IXMLNode; AItem: TGBFRNFeModelItem);
var
  nodeImposto : IXMLNode;
begin
  nodeImposto := GetNodeImposto(ANodeDet, 'II');

  if not Assigned(nodeImposto) then
    Exit;

  AItem.II.CST  := GetNodeStr(nodeImposto, 'CST');
  AItem.II.vBC  := GetNodeCurrency(nodeImposto, 'vBC');
  AItem.II.vII  := GetNodeCurrency(nodeImposto, 'vII');
  AItem.II.vIOF := GetNodeCurrency(nodeImposto, 'vIOF');
end;

procedure TGBFRNFeXMLDefault.loadImpostoIPI(ANodeDet: IXMLNode; AItem: TGBFRNFeModelItem);
var
  nodeImposto : IXMLNode;
begin
  nodeImposto := GetNodeImposto(ANodeDet, 'IPI');
  if not Assigned(nodeImposto) then
    Exit;

  AItem.IPI.CST  := GetNodeStr(nodeImposto, 'CST');
  AItem.IPI.cEnq := GetNodeStr(nodeImposto, 'cEnq');
  AItem.IPI.vBC  := GetNodeCurrency(nodeImposto, 'vBC');
  AItem.IPI.pIPI := GetNodeCurrency(nodeImposto, 'pIPI');
  AItem.IPI.vIPI := GetNodeCurrency(nodeImposto, 'vIPI');
end;

procedure TGBFRNFeXMLDefault.loadImpostoISSQN(ANodeDet: IXMLNode; AItem: TGBFRNFeModelItem);
var
  nodeImposto : IXMLNode;
begin
  nodeImposto := GetNodeImposto(ANodeDet, 'ISSQN');
  if not Assigned(nodeImposto) then
    Exit;

  AItem.ISSQN.vBC    := GetNodeCurrency(nodeImposto, 'vBC');
  AItem.ISSQN.vISSQN := GetNodeCurrency(nodeImposto, 'vISSQN');
  AItem.ISSQN.vAliq  := GetNodeCurrency(nodeImposto, 'vAliq');
end;

procedure TGBFRNFeXMLDefault.loadImpostoPIS(ANodeDet: IXMLNode; AItem: TGBFRNFeModelItem);
var
  nodeImposto : IXMLNode;
begin
  nodeImposto := GetNodeImposto(ANodeDet, 'PIS');
  if not Assigned(nodeImposto) then
    Exit;

  AItem.PIS.CST  := GetNodeStr(nodeImposto, 'CST');
  AItem.PIS.vBC  := GetNodeFloat(nodeImposto, 'vBC');
  AItem.PIS.pPIS := GetNodeFloat(nodeImposto, 'pPIS');
  AItem.PIS.vPIS := GetNodeFloat(nodeImposto, 'vPIS');
end;

procedure TGBFRNFeXMLDefault.loadInfoAdicionais;
var
  nodeInfAdic: IXMLNode;
begin
  nodeInfAdic := FInfNFe.ChildNodes.FindNode('infAdic');
  if not Assigned(nodeInfAdic) then
    Exit;

  FNota.infCpl := GetNodeStr(nodeInfAdic, 'infCpl');
end;

procedure TGBFRNFeXMLDefault.loadItems;
var
  item     : TGBFRNFeModelItem;
  nodeItem : IXMLNode;
  nodeDet  : IXMLNode;
begin
  nodeDet := FInfNFe.ChildNodes.FindNode('det');
  if not Assigned(nodeDet) then
    Exit;

  repeat
    nodeItem := nodeDet.ChildNodes.FindNode('prod');
    if Assigned(nodeItem) then
    begin
      item := TGBFRNFeModelItem.Create;
      try
        item.nItem     := FNota.itens.Count + 1;
        item.cProd     := GetNodeStr(nodeItem, 'cProd');
        item.xProd     := GetNodeStr(nodeItem, 'xProd');
        item.cEAN      := GetNodeStr(nodeItem, 'cEAN');
        item.CFOP      := GetNodeStr(nodeItem, 'CFOP');
        item.NCM       := GetNodeStr(nodeItem, 'NCM');
        item.uCom      := GetNodeStr(nodeItem, 'uCom');
        item.qCom      := GetNodeCurrency(nodeItem, 'qCom');
        item.vUnCom    := GetNodeCurrency(nodeItem, 'vUnCom');
        item.cEANTrib  := GetNodeStr(nodeItem, 'cEANTrib');
        item.uTrib     := GetNodeStr(nodeItem, 'uTrib');
        item.qTrib     := GetNodeCurrency(nodeItem, 'qTrib');
        item.vUnTrib   := GetNodeCurrency(nodeItem, 'vUnTrib');
        item.CEST      := GetNodeStr(nodeItem, 'CEST');
        item.infAdProd := GetNodeStr(nodeItem, 'infAdProd');
        item.vDesc     := GetNodeCurrency(nodeItem, 'vDesc');
        item.vFrete    := GetNodeCurrency(nodeItem, 'vFrete');
        item.vSeg      := GetNodeCurrency(nodeItem, 'vSeg');
        item.vOutro    := GetNodeCurrency(nodeItem, 'vOutro');
        item.cBenef    := GetNodeStr(nodeItem, 'cBenef');
        item.xPed      := GetNodeStr(nodeItem, 'xPed');
        item.nItemPed  := GetNodeStr(nodeItem, 'nItemPed');

        item.indTot.fromInteger(GetNodeInt(nodeItem, 'indTot'));
      except
        item.Free;
        raise;
      end;

      FNota.itens.Add(item);
      loadImposto(nodeDet);
    end;

    nodeDet := nodeDet.NextSibling;
  until (nodeDet = nil) or (nodeItem = nil);
end;

procedure TGBFRNFeXMLDefault.loadNotaFiscal;
var
  nodeIDE : IXMLNode;
begin
  try
    FInfNFe := FXml.DocumentElement.ChildNodes.Get(0)
                                   .ChildNodes.Get(0);
    if not Assigned(FInfNFe) then
      raise Exception.CreateFmt('Error on read Tag infNFe', []);

    nodeIDE := FInfNFe.ChildNodes.FindNode('ide');

    if Assigned(nodeIDE) then
    begin
      FNota.tpAmb.fromInteger(GetNodeInt(nodeIDE, 'tpAmb', 2));

      FNota.cNF     := GetNodeStr(nodeIDE, 'cNF');
      FNota.natOp   := GetNodeStr(nodeIDE, 'natOp');
      FNota.&mod    := GetNodeStr(nodeIDE, 'mod');
      FNota.serie   := GetNodeStr(nodeIDE, 'serie');
      FNota.nNF     := GetNodeInt(nodeIDE, 'nNF');
      FNota.dhEmi   := GetNodeDate(nodeIDE, 'dhEmi');
      FNota.dSaiEnt := GetNodeDate(nodeIDE, 'dSaiEnt');
    end;
  except
    on e : Exception do
    begin
      e.Message := 'Error on read Tag <ide>: ' + e.Message;
      raise;
    end;
  end;
end;

procedure TGBFRNFeXMLDefault.loadPagamentos;
var
  pagamento  : TGBFRNFeModelFormaPagamento;
  nodePag    : IXMLNode;
  nodeDetPag : IXMLNode;
  i          : Integer;
begin
  nodePag := FInfNFe.ChildNodes.FindNode('pag');
  if not Assigned(nodePag) then
    Exit;

  FNota.pag.vTroco := GetNodeCurrency(nodePag, 'vTroco');

  nodePag.ChildNodes.First;
  for i := 0 to Pred(nodePag.ChildNodes.Count) do
  begin
    nodeDetPag := nodePag.ChildNodes.Get(i);
    pagamento := TGBFRNFeModelFormaPagamento.Create;
    try
      pagamento.vPag := GetNodeCurrency(nodeDetPag, 'vPag');
      pagamento.CNPJ := GetNodeStr(nodeDetPag, 'CNPJ');
      pagamento.cAut := GetNodeStr(nodeDetPag, 'cAut');

      pagamento.tPag.fromString(GetNodeStr(nodeDetPag, 'tPag', '99'));
      pagamento.tpIntegra.fromInteger(GetNodeInt(nodeDetPag, 'tpIntegra', 1));
      pagamento.tBand.fromString(GetNodeStr(nodeDetPag, 'tBand', '99'));

      FNota.pag.detPag.Add(pagamento);
    except
      pagamento.Free;
      raise;
    end;
  end;
end;

procedure TGBFRNFeXMLDefault.loadProtNFe;
var
  nodeProt: IXMLNode;
begin
  nodeProt := FXml.DocumentElement.ChildNodes.FindNode('protNFe');
  if not Assigned(nodeProt) then
    Exit;

  nodeProt := nodeProt.ChildNodes.FindNode('infProt');
  if not Assigned(nodeProt) then
    Exit;

  FNota.protNFe.chNFe   := GetNodeStr(nodeProt, 'chNFe');
  FNota.protNFe.nProt   := GetNodeStr(nodeProt, 'nProt');
  FNota.protNFe.cStat   := GetNodeInt(nodeProt, 'cStat');
  FNota.protNFe.xMotivo := GetNodeStr(nodeProt, 'xMotivo');
  FNota.protNFe.verAplic:= GetNodeStr(nodeProt, 'verAplic');
  FNota.protNFe.dhRecbto:= GetNodeDate(nodeProt, 'dhRecbto');
  FNota.protNFe.digVal  := GetNodeStr(nodeProt, 'digVal');

  FNota.protNFe.tpAmb.fromInteger(GetNodeInt(nodeProt, 'tpAmb', 2));
end;

procedure TGBFRNFeXMLDefault.loadTotals;
var
  nodeTotal: IXMLNode;
  nodeICMSTot: IXMLNode;
begin
  nodeTotal := FInfNFe.ChildNodes.FindNode('total');
  if not Assigned(nodeTotal) then
    Exit;

  nodeICMSTot := nodeTotal.ChildNodes.FindNode('ICMSTot');
  if not Assigned(nodeICMSTot) then
    Exit;

  FNota.ICMSTot.vBC          := GetNodeCurrency(nodeICMSTot, 'vBC');
  FNota.ICMSTot.vICMS        := GetNodeCurrency(nodeICMSTot, 'vICMS');
  FNota.ICMSTot.vICMSDeson   := GetNodeCurrency(nodeICMSTot, 'vICMSDeson');
  FNota.ICMSTot.vBCST        := GetNodeCurrency(nodeICMSTot, 'vBCST');
  FNota.ICMSTot.vTotTrib     := GetNodeCurrency(nodeICMSTot, 'vTotTrib');
  FNota.ICMSTot.vFCPUFDest   := GetNodeCurrency(nodeICMSTot, 'vFCPUFDest');
  FNota.ICMSTot.vICMSUFDest  := GetNodeCurrency(nodeICMSTot, 'vICMSUFDest');
  FNota.ICMSTot.vICMSUFRemet := GetNodeCurrency(nodeICMSTot, 'vICMSUFRemet');
  FNota.ICMSTot.vFCP         := GetNodeCurrency(nodeICMSTot, 'vFCP');
  FNota.ICMSTot.vBCST        := GetNodeCurrency(nodeICMSTot, 'vBCST');
  FNota.ICMSTot.vST          := GetNodeCurrency(nodeICMSTot, 'vST');
  FNota.ICMSTot.vFCPST       := GetNodeCurrency(nodeICMSTot, 'vFCPST');
  FNota.ICMSTot.vFCPSTRet    := GetNodeCurrency(nodeICMSTot, 'vFCPSTRet');
  FNota.ICMSTot.vProd        := GetNodeCurrency(nodeICMSTot, 'vProd');
  FNota.ICMSTot.vFrete       := GetNodeCurrency(nodeICMSTot, 'vFrete');
  FNota.ICMSTot.vSeg         := GetNodeCurrency(nodeICMSTot, 'vSeg');
  FNota.ICMSTot.vDesc        := GetNodeCurrency(nodeICMSTot, 'vDesc');
  FNota.ICMSTot.vII          := GetNodeCurrency(nodeICMSTot, 'vII');
  FNota.ICMSTot.vIPI         := GetNodeCurrency(nodeICMSTot, 'vIPI');
  FNota.ICMSTot.vPIS         := GetNodeCurrency(nodeICMSTot, 'vPIS');
  FNota.ICMSTot.vCOFINS      := GetNodeCurrency(nodeICMSTot, 'vCOFINS');
  FNota.ICMSTot.vOutro       := GetNodeCurrency(nodeICMSTot, 'vOutro');
  FNota.ICMSTot.vNF          := GetNodeCurrency(nodeICMSTot, 'vNF');
end;

class function TGBFRNFeXMLDefault.New: IGBFRNFeXML;
begin
  result := Self.create;
end;

function TGBFRNFeXMLDefault.loadFromContent(Value: String): TGBRFNFeModelNotaFiscal;
begin
  loadXmlContent(Value);

  result := TGBRFNFeModelNotaFiscal.create;
  try
    loadNotaFiscal;
    loadEmitente;
    loadDestinatario;
    loadItems;
    loadInfoAdicionais;
    loadTotals;
    loadPagamentos;
    loadProtNFe;
  except
    Result.Free;
    raise;
  end;
end;

function TGBFRNFeXMLDefault.loadFromFile(Value: String): TGBRFNFeModelNotaFiscal;
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

end.
