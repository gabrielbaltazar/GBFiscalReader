unit GBFR.NFe.XML.Default;

interface

uses
  GBFR.XML.Base,
  GBFR.NFe.XML.Interfaces,
  GBFR.NFe.Model.Types,
  GBFR.NFe.Model.Classes,
  System.Classes,
  System.SysUtils,
  Xml.XMLIntf,
  Xml.XMLDoc;

type TGBFRNFeXMLDefault = class(TGBFRXmlBase, IGBFRNFeXML)

  private
    FModel: TGBRFNFeModel;
    [Weak]
    FInfNFe: IXMLNode;

    function GetNodeImposto(ANodeDet: IXMLNode; ATag: String): IXMLNode;

    procedure loadTagInfNFe;
    procedure loadTagIde;
    procedure loadTagIdeNFref;
    procedure loadTagEmit;
    procedure loadTagDest;
    procedure loadTagDetItem;
    procedure loadTagPag;
    procedure loadTagTotal;
    procedure loadTagTotalICMSTot(ANodeTotal: IXMLNode);
    procedure loadTagTotalISSQNTot(ANodeTotal: IXMLNode);
    procedure loadTagInfAdic;
    procedure loadTagInfRespTec;
    procedure loadTagProtNFe;

    procedure loadTagImposto       (ANodeDet: IXMLNode);
    procedure loadTagImpostoICMS   (ANodeDet: IXMLNode; AItem: TGBFRNFeModelItem);
    procedure loadTagImpostoPIS    (ANodeDet: IXMLNode; AItem: TGBFRNFeModelItem);
    procedure loadTagImpostoCOFINS (ANodeDet: IXMLNode; AItem: TGBFRNFeModelItem);
    procedure loadTagImpostoIPI    (ANodeDet: IXMLNode; AItem: TGBFRNFeModelItem);
    procedure loadTagImpostoII     (ANodeDet: IXMLNode; AItem: TGBFRNFeModelItem);
    procedure loadTagImpostoISSQN  (ANodeDet: IXMLNode; AItem: TGBFRNFeModelItem);
  protected
    function loadFromContent(Value: String): TGBRFNFeModel;
    function loadFromFile   (Value: String): TGBRFNFeModel;

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

  if not ATag.ToLower.Equals('issqn') then
  begin
    result := result.ChildNodes.Get(0);
    if not Assigned(result) then
      Exit;
  end;
end;

procedure TGBFRNFeXMLDefault.loadTagDest;
var
  nodeDestinatario : IXMLNode;
  nodeEndereco     : IXMLNode;
begin
  nodeDestinatario := FInfNFe.ChildNodes.FindNode('dest');

  if not Assigned(nodeDestinatario) then
    Exit;

  FModel.dest.xNome := GetNodeStr(nodeDestinatario, 'xNome');
  FModel.dest.CNPJ  := GetNodeStr(nodeDestinatario, 'CNPJ');
  FModel.dest.CPF   := GetNodeStr(nodeDestinatario, 'CPF');
  FModel.dest.IE    := GetNodeStr(nodeDestinatario, 'IE');
  FModel.dest.IM    := GetNodeStr(nodeDestinatario, 'IM');
  FModel.dest.email := GetNodeStr(nodeDestinatario, 'email');

  FModel.dest.indIEDest.fromInteger(GetNodeInt(nodeDestinatario, 'indIEDest'));

  nodeEndereco := nodeDestinatario.ChildNodes.FindNode('enderDest');
  if Assigned(nodeEndereco) then
  begin
    FModel.dest.enderDest.xLgr    := GetNodeStr(nodeEndereco, 'xLgr');
    FModel.dest.enderDest.nro     := GetNodeStr(nodeEndereco, 'nro');
    FModel.dest.enderDest.xCpl    := GetNodeStr(nodeEndereco, 'xCpl');
    FModel.dest.enderDest.xBairro := GetNodeStr(nodeEndereco, 'xBairro');
    FModel.dest.enderDest.cMun    := GetNodeStr(nodeEndereco, 'cMun');
    FModel.dest.enderDest.xMun    := GetNodeStr(nodeEndereco, 'xMun');
    FModel.dest.enderDest.UF      := GetNodeStr(nodeEndereco, 'UF');
    FModel.dest.enderDest.CEP     := GetNodeStr(nodeEndereco, 'CEP');
    FModel.dest.enderDest.cPais   := GetNodeStr(nodeEndereco, 'cPais');
    FModel.dest.enderDest.xPais   := GetNodeStr(nodeEndereco, 'xPais');
    FModel.dest.enderDest.fone    := GetNodeStr(nodeEndereco, 'fone');
  end;
end;

procedure TGBFRNFeXMLDefault.loadTagEmit;
var
  nodeEmitente: IXMLNode;
  nodeEndereco: IXMLNode;
begin
  nodeEmitente := FInfNFe.ChildNodes.FindNode('emit');

  if not Assigned(nodeEmitente) then
    raise Exception.CreateFmt('Error on read Tag emit', []);

  FModel.emit.xNome := GetNodeStr(nodeEmitente, 'xNome');
  FModel.emit.xFant := GetNodeStr(nodeEmitente, 'xFant');
  FModel.emit.CNPJ  := GetNodeStr(nodeEmitente, 'CNPJ');
  FModel.emit.IE    := GetNodeStr(nodeEmitente, 'IE');
  FModel.emit.IM    := GetNodeStr(nodeEmitente, 'IM');
  FModel.emit.CNAE  := GetNodeStr(nodeEmitente, 'CNAE');

  FModel.emit.CRT.fromInteger(GetNodeInt(nodeEmitente, 'CRT'));

  nodeEndereco := nodeEmitente.ChildNodes.FindNode('enderEmit');
  if Assigned(nodeEndereco) then
  begin
    FModel.emit.enderEmit.xLgr    := GetNodeStr(nodeEndereco, 'xLgr');
    FModel.emit.enderEmit.nro     := GetNodeStr(nodeEndereco, 'nro');
    FModel.emit.enderEmit.xCpl    := GetNodeStr(nodeEndereco, 'xCpl');
    FModel.emit.enderEmit.xBairro := GetNodeStr(nodeEndereco, 'xBairro');
    FModel.emit.enderEmit.cMun    := GetNodeStr(nodeEndereco, 'cMun');
    FModel.emit.enderEmit.xMun    := GetNodeStr(nodeEndereco, 'xMun');
    FModel.emit.enderEmit.UF      := GetNodeStr(nodeEndereco, 'UF');
    FModel.emit.enderEmit.CEP     := GetNodeStr(nodeEndereco, 'CEP');
    FModel.emit.enderEmit.cPais   := GetNodeStr(nodeEndereco, 'cPais');
    FModel.emit.enderEmit.xPais   := GetNodeStr(nodeEndereco, 'xPais');
    FModel.emit.enderEmit.fone    := GetNodeStr(nodeEndereco, 'fone');
  end;
end;

procedure TGBFRNFeXMLDefault.loadTagImposto(ANodeDet: IXMLNode);
var
  item : TGBFRNFeModelItem;
  nodeImposto: IXMLNode;
begin
  item := FModel.itens.Last;

  nodeImposto := ANodeDet.ChildNodes.FindNode('imposto');
  item.imposto.vTotTrib := GetNodeCurrency(nodeImposto, 'vTotTrib');

  loadTagImpostoICMS   (ANodeDet, item);
  loadTagImpostoIPI    (ANodeDet, item);
  loadTagImpostoPIS    (ANodeDet, item);
  loadTagImpostoCOFINS (ANodeDet, item);
  loadTagImpostoISSQN  (ANodeDet, item);
  loadTagImpostoII     (ANodeDet, item);
end;

procedure TGBFRNFeXMLDefault.loadTagImpostoCOFINS(ANodeDet: IXMLNode; AItem: TGBFRNFeModelItem);
var
  nodeImposto : IXMLNode;
begin
  nodeImposto := GetNodeImposto(ANodeDet, 'COFINS');

  if not Assigned(nodeImposto) then
    Exit;

  AItem.imposto.COFINS.CST     := GetNodeStr(nodeImposto, 'CST');
  AItem.imposto.COFINS.vBC     := GetNodeCurrency(nodeImposto, 'vBC');
  AItem.imposto.COFINS.pCOFINS := GetNodeCurrency(nodeImposto, 'pCOFINS');
  AItem.imposto.COFINS.vCOFINS := GetNodeCurrency(nodeImposto, 'vCOFINS');
end;

procedure TGBFRNFeXMLDefault.loadTagImpostoICMS(ANodeDet: IXMLNode; AItem: TGBFRNFeModelItem);
var
  nodeImposto : IXMLNode;
begin
  nodeImposto := GetNodeImposto(ANodeDet, 'ICMS');
  if not Assigned(nodeImposto) then
    Exit;

  AItem.imposto.ICMS.CST        := GetNodeStr(nodeImposto, 'CST');
  AItem.imposto.ICMS.orig       := GetNodeStr(nodeImposto, 'orig');
  AItem.imposto.ICMS.vBC        := GetNodeCurrency(nodeImposto, 'vBC');
  AItem.imposto.ICMS.pICMS      := GetNodeCurrency(nodeImposto, 'pICMS');
  AItem.imposto.ICMS.vICMS      := GetNodeCurrency(nodeImposto, 'vICMS');
  AItem.imposto.ICMS.pRedBC     := GetNodeCurrency(nodeImposto, 'pRedBC');
  AItem.imposto.ICMS.vICMSDeson := GetNodeCurrency(nodeImposto, 'vICMSDeson');
  AItem.imposto.ICMS.vBCSTRet   := GetNodeCurrency(nodeImposto, 'vBCSTRet');

  AItem.imposto.ICMS.modBC.fromInteger( GetNodeInt(nodeImposto, 'modBC'));
  AItem.imposto.ICMS.modBCST.fromInteger(GetNodeInt(nodeImposto, 'modBCST'));

  if AItem.imposto.ICMS.vBCST > 0 then
  begin
    AItem.imposto.ICMS.pST        := GetNodeCurrency(nodeImposto, 'pST');
    AItem.imposto.ICMS.vICMSSTRet := GetNodeCurrency(nodeImposto, 'vICMSSTRet');
  end
  else
  begin
    AItem.imposto.ICMS.vBCST   := GetNodeCurrency(nodeImposto, 'vBCST');
    AItem.imposto.ICMS.pICMSST := GetNodeCurrency(nodeImposto, 'pICMSST');
    AItem.imposto.ICMS.vICMSST := GetNodeCurrency(nodeImposto, 'vICMSST');
  end;
end;

procedure TGBFRNFeXMLDefault.loadTagImpostoII(ANodeDet: IXMLNode; AItem: TGBFRNFeModelItem);
var
  nodeImposto : IXMLNode;
begin
  nodeImposto := GetNodeImposto(ANodeDet, 'II');

  if not Assigned(nodeImposto) then
    Exit;

  AItem.imposto.II.CST  := GetNodeStr(nodeImposto, 'CST');
  AItem.imposto.II.vBC  := GetNodeCurrency(nodeImposto, 'vBC');
  AItem.imposto.II.vII  := GetNodeCurrency(nodeImposto, 'vII');
  AItem.imposto.II.vIOF := GetNodeCurrency(nodeImposto, 'vIOF');
end;

procedure TGBFRNFeXMLDefault.loadTagImpostoIPI(ANodeDet: IXMLNode; AItem: TGBFRNFeModelItem);
var
  nodeImposto : IXMLNode;
begin
  nodeImposto := GetNodeImposto(ANodeDet, 'IPI');
  if not Assigned(nodeImposto) then
    Exit;

  AItem.imposto.IPI.CST  := GetNodeStr(nodeImposto, 'CST');
  AItem.imposto.IPI.cEnq := GetNodeStr(nodeImposto, 'cEnq');
  AItem.imposto.IPI.vBC  := GetNodeCurrency(nodeImposto, 'vBC');
  AItem.imposto.IPI.pIPI := GetNodeCurrency(nodeImposto, 'pIPI');
  AItem.imposto.IPI.vIPI := GetNodeCurrency(nodeImposto, 'vIPI');
end;

procedure TGBFRNFeXMLDefault.loadTagImpostoISSQN(ANodeDet: IXMLNode; AItem: TGBFRNFeModelItem);
var
  nodeImposto : IXMLNode;
begin
  nodeImposto := GetNodeImposto(ANodeDet, 'ISSQN');
  if not Assigned(nodeImposto) then
    Exit;

  AItem.imposto.ISSQN.vBC       := GetNodeCurrency(nodeImposto, 'vBC');
  AItem.imposto.ISSQN.vAliq     := GetNodeCurrency(nodeImposto, 'vAliq');
  AItem.imposto.ISSQN.vISSQN    := GetNodeCurrency(nodeImposto, 'vISSQN');
  AItem.imposto.ISSQN.cMunFG    := GetNodeStr(nodeImposto, 'cMunFG');
  AItem.imposto.ISSQN.cListServ := GetNodeStr(nodeImposto, 'cListServ');

  AItem.imposto.ISSQN.indISS.fromInteger(GetNodeInt(nodeImposto, 'indISS', 1));
  AItem.imposto.ISSQN.indIncentivo.fromInteger(GetNodeInt(nodeImposto, 'indIncentivo', 1));
end;

procedure TGBFRNFeXMLDefault.loadTagImpostoPIS(ANodeDet: IXMLNode; AItem: TGBFRNFeModelItem);
var
  nodeImposto : IXMLNode;
begin
  nodeImposto := GetNodeImposto(ANodeDet, 'PIS');
  if not Assigned(nodeImposto) then
    Exit;

  AItem.imposto.PIS.CST  := GetNodeStr(nodeImposto, 'CST');
  AItem.imposto.PIS.vBC  := GetNodeFloat(nodeImposto, 'vBC');
  AItem.imposto.PIS.pPIS := GetNodeFloat(nodeImposto, 'pPIS');
  AItem.imposto.PIS.vPIS := GetNodeFloat(nodeImposto, 'vPIS');
end;

procedure TGBFRNFeXMLDefault.loadTagInfAdic;
var
  nodeInfAdic: IXMLNode;
begin
  nodeInfAdic := FInfNFe.ChildNodes.FindNode('infAdic');
  if not Assigned(nodeInfAdic) then
    Exit;

  FModel.infAdic.infAdFisco := GetNodeStr(nodeInfAdic, 'infAdFisco');
  FModel.infAdic.infCpl     := GetNodeStr(nodeInfAdic, 'infCpl');
end;

procedure TGBFRNFeXMLDefault.loadTagDetItem;
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
        item.nItem     := FModel.itens.Count + 1;
        item.cProd     := GetNodeStr(nodeItem, 'cProd');
        item.xProd     := GetNodeStr(nodeItem, 'xProd');
        item.cEAN      := GetNodeStr(nodeItem, 'cEAN');
        item.CFOP      := GetNodeStr(nodeItem, 'CFOP');
        item.NCM       := GetNodeStr(nodeItem, 'NCM');
        item.uCom      := GetNodeStr(nodeItem, 'uCom');
        item.qCom      := GetNodeCurrency(nodeItem, 'qCom');
        item.vUnCom    := GetNodeCurrency(nodeItem, 'vUnCom');
        item.vProd     := GetNodeCurrency(nodeItem, 'vProd');
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

      FModel.itens.Add(item);
      loadTagImposto(nodeDet);
    end;

    nodeDet := nodeDet.NextSibling;
  until (nodeDet = nil) or (nodeItem = nil);
end;

procedure TGBFRNFeXMLDefault.loadTagIde;
var
  nodeIDE : IXMLNode;
begin
  try
    nodeIDE := FInfNFe.ChildNodes.FindNode('ide');

    if Assigned(nodeIDE) then
    begin
      FModel.ide.tpAmb.fromInteger(GetNodeInt(nodeIDE, 'tpAmb', 2));
      FModel.ide.tpNF.fromInteger(GetNodeInt(nodeIDE, 'tpNF'));
      FModel.ide.idDest.fromInteger(GetNodeInt(nodeIDE, 'idDest', 1));
      FModel.ide.tpImp.fromInteger(GetNodeInt(nodeIDE, 'tpImp', 1));
      FModel.ide.tpEmis.fromInteger(GetNodeInt(nodeIDE, 'tpEmis', 1));
      FModel.ide.finNFe.fromInteger(GetNodeInt(nodeIDE, 'finNFe', 1));
      FModel.ide.indFinal.fromInteger(GetNodeInt(nodeIDE, 'indFinal', 0));
      FModel.ide.indPres.fromInteger(GetNodeInt(nodeIDE, 'indPres', 1));
      FModel.ide.procEmi.fromInteger(GetNodeInt(nodeIDE, 'procEmi', 0));

      FModel.ide.cUF     := GetNodeStr(nodeIDE, 'cUF');
      FModel.ide.cNF     := GetNodeStr(nodeIDE, 'cNF');
      FModel.ide.natOp   := GetNodeStr(nodeIDE, 'natOp');
      FModel.ide.&mod    := GetNodeStr(nodeIDE, 'mod');
      FModel.ide.serie   := GetNodeStr(nodeIDE, 'serie');
      FModel.ide.nNF     := GetNodeInt(nodeIDE, 'nNF');
      FModel.ide.dhEmi   := GetNodeDate(nodeIDE, 'dhEmi');
      FModel.ide.dSaiEnt := GetNodeDate(nodeIDE, 'dSaiEnt');
      FModel.ide.cMunFG  := GetNodeStr(nodeIDE, 'cMunFG');
      FModel.ide.cDV     := GetNodeStr(nodeIDE, 'cDV');

      loadTagIdeNFref;
    end;
  except
    on e : Exception do
    begin
      e.Message := 'Error on read Tag <ide>: ' + e.Message;
      raise;
    end;
  end;
end;

procedure TGBFRNFeXMLDefault.loadTagIdeNFref;
var
  nodeIDE   : IXMLNode;
  nodeNFRef : IXMLNode;
begin
  nodeIDE := FInfNFe.ChildNodes.FindNode('ide');
  if not Assigned(nodeIDE) then
    Exit;

  nodeNFRef := nodeIDE.ChildNodes.FindNode('NFref');
  if not Assigned(nodeNFRef) then
    Exit;

  repeat
    FModel.ide.addNFRef(GetNodeStr(nodeNFRef, 'refNFe'));
    nodeNFRef := nodeNFRef.NextSibling;
  until nodeNFRef = nil;
end;

procedure TGBFRNFeXMLDefault.loadTagPag;
var
  pagamento  : TGBFRNFeModelFormaPagamento;
  nodePag    : IXMLNode;
  nodeDetPag : IXMLNode;
  i          : Integer;
begin
  nodePag := FInfNFe.ChildNodes.FindNode('pag');
  if not Assigned(nodePag) then
    Exit;

  FModel.pag.vTroco := GetNodeCurrency(nodePag, 'vTroco');

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

      FModel.pag.detPag.Add(pagamento);
    except
      pagamento.Free;
      raise;
    end;
  end;
end;

procedure TGBFRNFeXMLDefault.loadTagProtNFe;
var
  nodeProt: IXMLNode;
begin
  nodeProt := FXml.DocumentElement.ChildNodes.FindNode('protNFe');
  if not Assigned(nodeProt) then
    Exit;

  nodeProt := nodeProt.ChildNodes.FindNode('infProt');
  if not Assigned(nodeProt) then
    Exit;

  FModel.protNFe.chNFe   := GetNodeStr(nodeProt, 'chNFe');
  FModel.protNFe.nProt   := GetNodeStr(nodeProt, 'nProt');
  FModel.protNFe.cStat   := GetNodeInt(nodeProt, 'cStat');
  FModel.protNFe.xMotivo := GetNodeStr(nodeProt, 'xMotivo');
  FModel.protNFe.verAplic:= GetNodeStr(nodeProt, 'verAplic');
  FModel.protNFe.dhRecbto:= GetNodeDate(nodeProt, 'dhRecbto');
  FModel.protNFe.digVal  := GetNodeStr(nodeProt, 'digVal');

  FModel.protNFe.tpAmb.fromInteger(GetNodeInt(nodeProt, 'tpAmb', 2));
end;

procedure TGBFRNFeXMLDefault.loadTagInfRespTec;
var
  nodeInfRespTec: IXMLNode;
begin
  nodeInfRespTec := FInfNFe.ChildNodes.FindNode('infRespTec');
  if not Assigned(nodeInfRespTec) then
    Exit;

  FModel.infRespTec.CNPJ     := GetNodeStr(nodeInfRespTec, 'CNPJ');
  FModel.infRespTec.xContato := GetNodeStr(nodeInfRespTec, 'xContato');
  FModel.infRespTec.email    := GetNodeStr(nodeInfRespTec, 'email');
  FModel.infRespTec.fone     := GetNodeStr(nodeInfRespTec, 'fone');
end;

procedure TGBFRNFeXMLDefault.loadTagTotal;
var
  nodeTotal: IXMLNode;
begin
  nodeTotal := FInfNFe.ChildNodes.FindNode('total');
  if not Assigned(nodeTotal) then
    Exit;

  loadTagTotalICMSTot(nodeTotal);
  loadTagTotalISSQNTot(nodeTotal);
end;

procedure TGBFRNFeXMLDefault.loadTagTotalICMSTot(ANodeTotal: IXMLNode);
var
  nodeICMSTot: IXMLNode;
begin
  nodeICMSTot := ANodeTotal.ChildNodes.FindNode('ICMSTot');
  if not Assigned(nodeICMSTot) then
    Exit;

  FModel.ICMSTot.vBC          := GetNodeCurrency(nodeICMSTot, 'vBC');
  FModel.ICMSTot.vICMS        := GetNodeCurrency(nodeICMSTot, 'vICMS');
  FModel.ICMSTot.vICMSDeson   := GetNodeCurrency(nodeICMSTot, 'vICMSDeson');
  FModel.ICMSTot.vBCST        := GetNodeCurrency(nodeICMSTot, 'vBCST');
  FModel.ICMSTot.vTotTrib     := GetNodeCurrency(nodeICMSTot, 'vTotTrib');
  FModel.ICMSTot.vFCPUFDest   := GetNodeCurrency(nodeICMSTot, 'vFCPUFDest');
  FModel.ICMSTot.vICMSUFDest  := GetNodeCurrency(nodeICMSTot, 'vICMSUFDest');
  FModel.ICMSTot.vICMSUFRemet := GetNodeCurrency(nodeICMSTot, 'vICMSUFRemet');
  FModel.ICMSTot.vFCP         := GetNodeCurrency(nodeICMSTot, 'vFCP');
  FModel.ICMSTot.vBCST        := GetNodeCurrency(nodeICMSTot, 'vBCST');
  FModel.ICMSTot.vST          := GetNodeCurrency(nodeICMSTot, 'vST');
  FModel.ICMSTot.vFCPST       := GetNodeCurrency(nodeICMSTot, 'vFCPST');
  FModel.ICMSTot.vFCPSTRet    := GetNodeCurrency(nodeICMSTot, 'vFCPSTRet');
  FModel.ICMSTot.vProd        := GetNodeCurrency(nodeICMSTot, 'vProd');
  FModel.ICMSTot.vFrete       := GetNodeCurrency(nodeICMSTot, 'vFrete');
  FModel.ICMSTot.vSeg         := GetNodeCurrency(nodeICMSTot, 'vSeg');
  FModel.ICMSTot.vDesc        := GetNodeCurrency(nodeICMSTot, 'vDesc');
  FModel.ICMSTot.vII          := GetNodeCurrency(nodeICMSTot, 'vII');
  FModel.ICMSTot.vIPI         := GetNodeCurrency(nodeICMSTot, 'vIPI');
  FModel.ICMSTot.vPIS         := GetNodeCurrency(nodeICMSTot, 'vPIS');
  FModel.ICMSTot.vCOFINS      := GetNodeCurrency(nodeICMSTot, 'vCOFINS');
  FModel.ICMSTot.vOutro       := GetNodeCurrency(nodeICMSTot, 'vOutro');
  FModel.ICMSTot.vNF          := GetNodeCurrency(nodeICMSTot, 'vNF');
end;

procedure TGBFRNFeXMLDefault.loadTagTotalISSQNTot(ANodeTotal: IXMLNode);
var
  nodeISSQNTot: IXMLNode;
begin
  nodeISSQNTot := ANodeTotal.ChildNodes.FindNode('ISSQNtot');
  if not Assigned(nodeISSQNTot) then
    Exit;

  FModel.ISSQNTot.vServ   := GetNodeCurrency(nodeISSQNTot, 'vServ');
  FModel.ISSQNTot.vBC     := GetNodeCurrency(nodeISSQNTot, 'vBC');
  FModel.ISSQNTot.vISS    := GetNodeCurrency(nodeISSQNTot, 'vISS');
  FModel.ISSQNTot.vPIS    := GetNodeCurrency(nodeISSQNTot, 'vPIS');
  FModel.ISSQNTot.vCOFINS := GetNodeCurrency(nodeISSQNTot, 'vCOFINS');
  FModel.ISSQNTot.dCompet := GetNodeDate(nodeISSQNTot, 'dCompet');
end;

class function TGBFRNFeXMLDefault.New: IGBFRNFeXML;
begin
  result := Self.create;
end;

function TGBFRNFeXMLDefault.loadFromContent(Value: String): TGBRFNFeModel;
begin
  loadXmlContent(Value);

  result := TGBRFNFeModel.create;
  try
    FModel := Result;

    loadTagInfNFe;
    loadTagIde;
    loadTagEmit;
    loadTagDest;
    loadTagDetItem;
    loadTagInfAdic;
    loadTagInfRespTec;
    loadTagTotal;
    loadTagPag;
    loadTagProtNFe;
  except
    Result.Free;
    raise;
  end;
end;

function TGBFRNFeXMLDefault.loadFromFile(Value: String): TGBRFNFeModel;
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

procedure TGBFRNFeXMLDefault.loadTagInfNFe;
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
  until (node = nil) or (node.NodeName = 'infNFe');

  if (not Assigned(node)) or (not node.NodeName.Equals( 'infNFe' )) then
    raise Exception.CreateFmt('Error on read Tag infNFe', []);

  FInfNFe := node;

  FModel.Id     := FInfNFe.Attributes['Id'];
  FModel.versao := FInfNFe.Attributes['versao'];
end;

end.
