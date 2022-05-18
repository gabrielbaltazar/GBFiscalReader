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
    FModel: TGBFRNFeModel;
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

    procedure loadTagImposto(ANodeDet: IXMLNode);
    procedure loadTagImpostoICMS(ANodeDet: IXMLNode; AItem: TGBFRNFeModelItem);
    procedure loadTagImpostoPIS(ANodeDet: IXMLNode; AItem: TGBFRNFeModelItem);
    procedure loadTagImpostoCOFINS(ANodeDet: IXMLNode; AItem: TGBFRNFeModelItem);
    procedure loadTagImpostoIPI(ANodeDet: IXMLNode; AItem: TGBFRNFeModelItem);
    procedure loadTagImpostoII(ANodeDet: IXMLNode; AItem: TGBFRNFeModelItem);
    procedure loadTagImpostoISSQN(ANodeDet: IXMLNode; AItem: TGBFRNFeModelItem);
  protected
    function loadFromContent(Value: String): TGBFRNFeModel;
    function loadFromFile(Value: String): TGBFRNFeModel;
    function loadFromStream(Value: TStream): TGBFRNFeModel;

  public
    class function New: IGBFRNFeXML;
end;

implementation

{ TGBFRNFeXMLDefault }

function TGBFRNFeXMLDefault.GetNodeImposto(ANodeDet: IXMLNode; ATag: String): IXMLNode;
begin
  Result := ANodeDet.ChildNodes.FindNode('imposto');
  if not Assigned(Result) then
    Exit;

  Result := Result.ChildNodes.FindNode(ATag);
  if not Assigned(Result) then
    Exit;

  if not ATag.ToLower.Equals('issqn') then
  begin
    Result := Result.ChildNodes.Get(0);
    if not Assigned(Result) then
      Exit;
  end;
end;

procedure TGBFRNFeXMLDefault.loadTagDest;
var
  LNodeDestinatario: IXMLNode;
  LNodeEndereco: IXMLNode;
begin
  LNodeDestinatario := FInfNFe.ChildNodes.FindNode('dest');

  if not Assigned(LNodeDestinatario) then
    Exit;

  FModel.dest.xNome := GetNodeStr(LNodeDestinatario, 'xNome');
  FModel.dest.CNPJ := GetNodeStr(LNodeDestinatario, 'CNPJ');
  FModel.dest.CPF := GetNodeStr(LNodeDestinatario, 'CPF');
  FModel.dest.IE := GetNodeStr(LNodeDestinatario, 'IE');
  FModel.dest.IM := GetNodeStr(LNodeDestinatario, 'IM');
  FModel.dest.email := GetNodeStr(LNodeDestinatario, 'email');

  FModel.dest.indIEDest.fromInteger(GetNodeInt(LNodeDestinatario, 'indIEDest'));

  LNodeEndereco := LNodeDestinatario.ChildNodes.FindNode('enderDest');
  if Assigned(LNodeEndereco) then
  begin
    FModel.dest.enderDest.xLgr := GetNodeStr(LNodeEndereco, 'xLgr');
    FModel.dest.enderDest.nro := GetNodeStr(LNodeEndereco, 'nro');
    FModel.dest.enderDest.xCpl := GetNodeStr(LNodeEndereco, 'xCpl');
    FModel.dest.enderDest.xBairro := GetNodeStr(LNodeEndereco, 'xBairro');
    FModel.dest.enderDest.cMun := GetNodeStr(LNodeEndereco, 'cMun');
    FModel.dest.enderDest.xMun := GetNodeStr(LNodeEndereco, 'xMun');
    FModel.dest.enderDest.UF := GetNodeStr(LNodeEndereco, 'UF');
    FModel.dest.enderDest.CEP := GetNodeStr(LNodeEndereco, 'CEP');
    FModel.dest.enderDest.cPais := GetNodeStr(LNodeEndereco, 'cPais');
    FModel.dest.enderDest.xPais := GetNodeStr(LNodeEndereco, 'xPais');
    FModel.dest.enderDest.fone := GetNodeStr(LNodeEndereco, 'fone');
  end;
end;

procedure TGBFRNFeXMLDefault.loadTagEmit;
var
  LNodeEmitente: IXMLNode;
  LNodeEndereco: IXMLNode;
begin
  LNodeEmitente := FInfNFe.ChildNodes.FindNode('emit');

  if not Assigned(LNodeEmitente) then
    raise Exception.CreateFmt('Error on read Tag emit', []);

  FModel.emit.xNome := GetNodeStr(LNodeEmitente, 'xNome');
  FModel.emit.xFant := GetNodeStr(LNodeEmitente, 'xFant');
  FModel.emit.CNPJ := GetNodeStr(LNodeEmitente, 'CNPJ');
  FModel.emit.IE := GetNodeStr(LNodeEmitente, 'IE');
  FModel.emit.IM := GetNodeStr(LNodeEmitente, 'IM');
  FModel.emit.CNAE := GetNodeStr(LNodeEmitente, 'CNAE');

  FModel.emit.CRT.fromInteger(GetNodeInt(LNodeEmitente, 'CRT'));

  LNodeEndereco := LNodeEmitente.ChildNodes.FindNode('enderEmit');
  if Assigned(LNodeEndereco) then
  begin
    FModel.emit.enderEmit.xLgr := GetNodeStr(LNodeEndereco, 'xLgr');
    FModel.emit.enderEmit.nro := GetNodeStr(LNodeEndereco, 'nro');
    FModel.emit.enderEmit.xCpl := GetNodeStr(LNodeEndereco, 'xCpl');
    FModel.emit.enderEmit.xBairro := GetNodeStr(LNodeEndereco, 'xBairro');
    FModel.emit.enderEmit.cMun := GetNodeStr(LNodeEndereco, 'cMun');
    FModel.emit.enderEmit.xMun := GetNodeStr(LNodeEndereco, 'xMun');
    FModel.emit.enderEmit.UF := GetNodeStr(LNodeEndereco, 'UF');
    FModel.emit.enderEmit.CEP := GetNodeStr(LNodeEndereco, 'CEP');
    FModel.emit.enderEmit.cPais := GetNodeStr(LNodeEndereco, 'cPais');
    FModel.emit.enderEmit.xPais := GetNodeStr(LNodeEndereco, 'xPais');
    FModel.emit.enderEmit.fone := GetNodeStr(LNodeEndereco, 'fone');
  end;
end;

procedure TGBFRNFeXMLDefault.loadTagImposto(ANodeDet: IXMLNode);
var
  LItem: TGBFRNFeModelItem;
  LNodeImposto: IXMLNode;
begin
  LItem := FModel.itens.Last;

  LNodeImposto := ANodeDet.ChildNodes.FindNode('imposto');
  LItem.imposto.vTotTrib := GetNodeCurrency(LNodeImposto, 'vTotTrib');

  loadTagImpostoICMS(ANodeDet, LItem);
  loadTagImpostoIPI(ANodeDet, LItem);
  loadTagImpostoPIS(ANodeDet, LItem);
  loadTagImpostoCOFINS(ANodeDet, LItem);
  loadTagImpostoISSQN(ANodeDet, LItem);
  loadTagImpostoII(ANodeDet, LItem);
end;

procedure TGBFRNFeXMLDefault.loadTagImpostoCOFINS(ANodeDet: IXMLNode; AItem: TGBFRNFeModelItem);
var
  LNodeImposto: IXMLNode;
begin
  LNodeImposto := GetNodeImposto(ANodeDet, 'COFINS');

  if not Assigned(LNodeImposto) then
    Exit;

  AItem.imposto.COFINS.CST := GetNodeStr(LNodeImposto, 'CST');
  AItem.imposto.COFINS.vBC := GetNodeCurrency(LNodeImposto, 'vBC');
  AItem.imposto.COFINS.pCOFINS := GetNodeCurrency(LNodeImposto, 'pCOFINS');
  AItem.imposto.COFINS.vCOFINS := GetNodeCurrency(LNodeImposto, 'vCOFINS');
end;

procedure TGBFRNFeXMLDefault.loadTagImpostoICMS(ANodeDet: IXMLNode; AItem: TGBFRNFeModelItem);
var
  LNodeImposto: IXMLNode;
begin
  LNodeImposto := GetNodeImposto(ANodeDet, 'ICMS');
  if not Assigned(LNodeImposto) then
    Exit;

  AItem.imposto.ICMS.CST := GetNodeStr(LNodeImposto, 'CST');
  AItem.imposto.ICMS.CSOSN := GetNodeStr(LNodeImposto, 'CSOSN');
  AItem.imposto.ICMS.orig := GetNodeStr(LNodeImposto, 'orig');
  AItem.imposto.ICMS.vBC := GetNodeCurrency(LNodeImposto, 'vBC');
  AItem.imposto.ICMS.pICMS := GetNodeCurrency(LNodeImposto, 'pICMS');
  AItem.imposto.ICMS.vICMS := GetNodeCurrency(LNodeImposto, 'vICMS');
  AItem.imposto.ICMS.pRedBC := GetNodeCurrency(LNodeImposto, 'pRedBC');
  AItem.imposto.ICMS.vICMSDeson := GetNodeCurrency(LNodeImposto, 'vICMSDeson');
  AItem.imposto.ICMS.vBCSTRet := GetNodeCurrency(LNodeImposto, 'vBCSTRet');
  AItem.imposto.ICMS.vBCFCP := GetNodeCurrency(LNodeImposto, 'vBCFCP');
  AItem.imposto.ICMS.pFCP := GetNodeCurrency(LNodeImposto, 'pFCP');

  AItem.imposto.ICMS.modBC.fromInteger( GetNodeInt(LNodeImposto, 'modBC'));
  AItem.imposto.ICMS.modBCST.fromInteger(GetNodeInt(LNodeImposto, 'modBCST'));
  AItem.imposto.ICMS.motDesICMS.fromInteger(GetNodeInt(LNodeImposto, 'motDesICMS'));

  if AItem.imposto.ICMS.vBCST > 0 then
  begin
    AItem.imposto.ICMS.pST := GetNodeCurrency(LNodeImposto, 'pST');
    AItem.imposto.ICMS.vICMSSTRet := GetNodeCurrency(LNodeImposto, 'vICMSSTRet');
  end
  else
  begin
    AItem.imposto.ICMS.vBCST := GetNodeCurrency(LNodeImposto, 'vBCST');
    AItem.imposto.ICMS.pICMSST := GetNodeCurrency(LNodeImposto, 'pICMSST');
    AItem.imposto.ICMS.vICMSST := GetNodeCurrency(LNodeImposto, 'vICMSST');
  end;
end;

procedure TGBFRNFeXMLDefault.loadTagImpostoII(ANodeDet: IXMLNode; AItem: TGBFRNFeModelItem);
var
  LNodeImposto: IXMLNode;
begin
  LNodeImposto := GetNodeImposto(ANodeDet, 'II');

  if not Assigned(LNodeImposto) then
    Exit;

  AItem.imposto.II.CST := GetNodeStr(LNodeImposto, 'CST');
  AItem.imposto.II.vBC := GetNodeCurrency(LNodeImposto, 'vBC');
  AItem.imposto.II.vII := GetNodeCurrency(LNodeImposto, 'vII');
  AItem.imposto.II.vIOF := GetNodeCurrency(LNodeImposto, 'vIOF');
end;

procedure TGBFRNFeXMLDefault.loadTagImpostoIPI(ANodeDet: IXMLNode; AItem: TGBFRNFeModelItem);
var
  LNodeImposto: IXMLNode;
begin
  LNodeImposto := GetNodeImposto(ANodeDet, 'IPI');
  if not Assigned(LNodeImposto) then
    Exit;

  AItem.imposto.IPI.CST := GetNodeStr(LNodeImposto, 'CST');
  AItem.imposto.IPI.cEnq := GetNodeStr(LNodeImposto, 'cEnq');
  AItem.imposto.IPI.vBC := GetNodeCurrency(LNodeImposto, 'vBC');
  AItem.imposto.IPI.pIPI := GetNodeCurrency(LNodeImposto, 'pIPI');
  AItem.imposto.IPI.vIPI := GetNodeCurrency(LNodeImposto, 'vIPI');
end;

procedure TGBFRNFeXMLDefault.loadTagImpostoISSQN(ANodeDet: IXMLNode; AItem: TGBFRNFeModelItem);
var
  LNodeImposto: IXMLNode;
begin
  LNodeImposto := GetNodeImposto(ANodeDet, 'ISSQN');
  if not Assigned(LNodeImposto) then
    Exit;

  AItem.imposto.ISSQN.vBC := GetNodeCurrency(LNodeImposto, 'vBC');
  AItem.imposto.ISSQN.vAliq := GetNodeCurrency(LNodeImposto, 'vAliq');
  AItem.imposto.ISSQN.vISSQN := GetNodeCurrency(LNodeImposto, 'vISSQN');
  AItem.imposto.ISSQN.cMunFG := GetNodeStr(LNodeImposto, 'cMunFG');
  AItem.imposto.ISSQN.cListServ := GetNodeStr(LNodeImposto, 'cListServ');

  AItem.imposto.ISSQN.indISS.fromInteger(GetNodeInt(LNodeImposto, 'indISS', 1));
  AItem.imposto.ISSQN.indIncentivo.fromInteger(GetNodeInt(LNodeImposto, 'indIncentivo', 1));
end;

procedure TGBFRNFeXMLDefault.loadTagImpostoPIS(ANodeDet: IXMLNode; AItem: TGBFRNFeModelItem);
var
  LNodeImposto: IXMLNode;
begin
  LNodeImposto := GetNodeImposto(ANodeDet, 'PIS');
  if not Assigned(LNodeImposto) then
    Exit;

  AItem.imposto.PIS.CST := GetNodeStr(LNodeImposto, 'CST');
  AItem.imposto.PIS.vBC := GetNodeFloat(LNodeImposto, 'vBC');
  AItem.imposto.PIS.pPIS := GetNodeFloat(LNodeImposto, 'pPIS');
  AItem.imposto.PIS.vPIS := GetNodeFloat(LNodeImposto, 'vPIS');
end;

procedure TGBFRNFeXMLDefault.loadTagInfAdic;
var
  LNodeInfAdic: IXMLNode;
begin
  LNodeInfAdic := FInfNFe.ChildNodes.FindNode('infAdic');
  if not Assigned(LNodeInfAdic) then
    Exit;

  FModel.infAdic.infAdFisco := GetNodeStr(LNodeInfAdic, 'infAdFisco');
  FModel.infAdic.infCpl := GetNodeStr(LNodeInfAdic, 'infCpl');
end;

procedure TGBFRNFeXMLDefault.loadTagDetItem;
var
  LItem: TGBFRNFeModelItem;
  LNodeItem: IXMLNode;
  LNodeDet: IXMLNode;
begin
  LNodeDet := FInfNFe.ChildNodes.FindNode('det');
  if not Assigned(LNodeDet) then
    Exit;

  repeat
    LNodeItem := LNodeDet.ChildNodes.FindNode('prod');
    if Assigned(LNodeItem) then
    begin
      LItem := TGBFRNFeModelItem.Create;
      try
        LItem.nItem := FModel.itens.Count + 1;
        LItem.cProd := GetNodeStr(LNodeItem, 'cProd');
        LItem.xProd := GetNodeStr(LNodeItem, 'xProd');
        LItem.cEAN := GetNodeStr(LNodeItem, 'cEAN');
        LItem.CFOP := GetNodeStr(LNodeItem, 'CFOP');
        LItem.NCM := GetNodeStr(LNodeItem, 'NCM');
        LItem.uCom := GetNodeStr(LNodeItem, 'uCom');
        LItem.qCom := GetNodeCurrency(LNodeItem, 'qCom');
        LItem.vUnCom := GetNodeCurrency(LNodeItem, 'vUnCom');
        LItem.vProd := GetNodeCurrency(LNodeItem, 'vProd');
        LItem.cEANTrib := GetNodeStr(LNodeItem, 'cEANTrib');
        LItem.uTrib := GetNodeStr(LNodeItem, 'uTrib');
        LItem.qTrib := GetNodeCurrency(LNodeItem, 'qTrib');
        LItem.vUnTrib := GetNodeCurrency(LNodeItem, 'vUnTrib');
        LItem.CEST := GetNodeStr(LNodeItem, 'CEST');
        LItem.infAdProd := GetNodeStr(LNodeItem, 'infAdProd');
        LItem.vDesc := GetNodeCurrency(LNodeItem, 'vDesc');
        LItem.vFrete := GetNodeCurrency(LNodeItem, 'vFrete');
        LItem.vSeg := GetNodeCurrency(LNodeItem, 'vSeg');
        LItem.vOutro := GetNodeCurrency(LNodeItem, 'vOutro');
        LItem.cBenef := GetNodeStr(LNodeItem, 'cBenef');
        LItem.xPed := GetNodeStr(LNodeItem, 'xPed');
        LItem.nItemPed := GetNodeStr(LNodeItem, 'nItemPed');

        LItem.indTot.fromInteger(GetNodeInt(LNodeItem, 'indTot'));
      except
        LItem.Free;
        raise;
      end;

      FModel.itens.Add(LItem);
      loadTagImposto(LNodeDet);
    end;

    LNodeDet := LNodeDet.NextSibling;
  until (LNodeDet = nil) or (LNodeItem = nil);
end;

procedure TGBFRNFeXMLDefault.loadTagIde;
var
  LNodeIDE: IXMLNode;
begin
  try
    LNodeIDE := FInfNFe.ChildNodes.FindNode('ide');

    if Assigned(LNodeIDE) then
    begin
      FModel.ide.tpAmb.fromInteger(GetNodeInt(LNodeIDE, 'tpAmb', 2));
      FModel.ide.tpNF.fromInteger(GetNodeInt(LNodeIDE, 'tpNF'));
      FModel.ide.idDest.fromInteger(GetNodeInt(LNodeIDE, 'idDest', 1));
      FModel.ide.tpImp.fromInteger(GetNodeInt(LNodeIDE, 'tpImp', 1));
      FModel.ide.tpEmis.fromInteger(GetNodeInt(LNodeIDE, 'tpEmis', 1));
      FModel.ide.finNFe.fromInteger(GetNodeInt(LNodeIDE, 'finNFe', 1));
      FModel.ide.indFinal.fromInteger(GetNodeInt(LNodeIDE, 'indFinal', 0));
      FModel.ide.indPres.fromInteger(GetNodeInt(LNodeIDE, 'indPres', 1));
      FModel.ide.procEmi.fromInteger(GetNodeInt(LNodeIDE, 'procEmi', 0));

      FModel.ide.cUF := GetNodeStr(LNodeIDE, 'cUF');
      FModel.ide.cNF := GetNodeStr(LNodeIDE, 'cNF');
      FModel.ide.natOp := GetNodeStr(LNodeIDE, 'natOp');
      FModel.ide.&mod := GetNodeStr(LNodeIDE, 'mod');
      FModel.ide.serie := GetNodeStr(LNodeIDE, 'serie');
      FModel.ide.nNF := GetNodeInt(LNodeIDE, 'nNF');
      FModel.ide.dhEmi := GetNodeDate(LNodeIDE, 'dhEmi');
      FModel.ide.dSaiEnt := GetNodeDate(LNodeIDE, 'dSaiEnt');
      FModel.ide.cMunFG := GetNodeStr(LNodeIDE, 'cMunFG');
      FModel.ide.cDV := GetNodeStr(LNodeIDE, 'cDV');

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
  LNodeIDE: IXMLNode;
  LNodeNFRef: IXMLNode;
begin
  LNodeIDE := FInfNFe.ChildNodes.FindNode('ide');
  if not Assigned(LNodeIDE) then
    Exit;

  LNodeNFRef := LNodeIDE.ChildNodes.FindNode('NFref');
  if not Assigned(LNodeNFRef) then
    Exit;

  repeat
    FModel.ide.addNFRef(GetNodeStr(LNodeNFRef, 'refNFe'));
    LNodeNFRef := LNodeNFRef.NextSibling;
  until LNodeNFRef = nil;
end;

procedure TGBFRNFeXMLDefault.loadTagPag;
var
  LPagamento: TGBFRNFeModelFormaPagamento;
  LNodePag: IXMLNode;
  LNodeDetPag: IXMLNode;
  I: Integer;
begin
  LNodePag := FInfNFe.ChildNodes.FindNode('pag');
  if not Assigned(LNodePag) then
    Exit;

  FModel.pag.vTroco := GetNodeCurrency(LNodePag, 'vTroco');

  LNodePag.ChildNodes.First;
  for I := 0 to Pred(LNodePag.ChildNodes.Count) do
  begin
    LNodeDetPag := LNodePag.ChildNodes.Get(I);
    LPagamento := TGBFRNFeModelFormaPagamento.Create;
    try
      LPagamento.vPag := GetNodeCurrency(LNodeDetPag, 'vPag');
      LPagamento.CNPJ := GetNodeStr(LNodeDetPag, 'CNPJ');
      LPagamento.cAut := GetNodeStr(LNodeDetPag, 'cAut');

      LPagamento.tPag.fromString(GetNodeStr(LNodeDetPag, 'tPag', '99'));
      LPagamento.tpIntegra.fromInteger(GetNodeInt(LNodeDetPag, 'tpIntegra', 1));
      LPagamento.tBand.fromString(GetNodeStr(LNodeDetPag, 'tBand', '99'));

      FModel.pag.detPag.Add(LPagamento);
    except
      LPagamento.Free;
      raise;
    end;
  end;
end;

procedure TGBFRNFeXMLDefault.loadTagProtNFe;
var
  LNodeProt: IXMLNode;
begin
  LNodeProt := FXml.DocumentElement.ChildNodes.FindNode('protNFe');
  if not Assigned(LNodeProt) then
    Exit;

  LNodeProt := LNodeProt.ChildNodes.FindNode('infProt');
  if not Assigned(LNodeProt) then
    Exit;

  FModel.protNFe.chNFe := GetNodeStr(LNodeProt, 'chNFe');
  FModel.protNFe.nProt := GetNodeStr(LNodeProt, 'nProt');
  FModel.protNFe.cStat := GetNodeInt(LNodeProt, 'cStat');
  FModel.protNFe.xMotivo := GetNodeStr(LNodeProt, 'xMotivo');
  FModel.protNFe.verAplic := GetNodeStr(LNodeProt, 'verAplic');
  FModel.protNFe.dhRecbto := GetNodeDate(LNodeProt, 'dhRecbto');
  FModel.protNFe.digVal := GetNodeStr(LNodeProt, 'digVal');

  FModel.protNFe.tpAmb.fromInteger(GetNodeInt(LNodeProt, 'tpAmb', 2));
end;

procedure TGBFRNFeXMLDefault.loadTagInfRespTec;
var
  LNodeInfRespTec: IXMLNode;
begin
  LNodeInfRespTec := FInfNFe.ChildNodes.FindNode('infRespTec');
  if not Assigned(LNodeInfRespTec) then
    Exit;

  FModel.infRespTec.CNPJ := GetNodeStr(LNodeInfRespTec, 'CNPJ');
  FModel.infRespTec.xContato := GetNodeStr(LNodeInfRespTec, 'xContato');
  FModel.infRespTec.email := GetNodeStr(LNodeInfRespTec, 'email');
  FModel.infRespTec.fone := GetNodeStr(LNodeInfRespTec, 'fone');
end;

procedure TGBFRNFeXMLDefault.loadTagTotal;
var
  LNodeTotal: IXMLNode;
begin
  LNodeTotal := FInfNFe.ChildNodes.FindNode('total');
  if not Assigned(LNodeTotal) then
    Exit;

  loadTagTotalICMSTot(LNodeTotal);
  loadTagTotalISSQNTot(LNodeTotal);
end;

procedure TGBFRNFeXMLDefault.loadTagTotalICMSTot(ANodeTotal: IXMLNode);
var
  LNodeICMSTot: IXMLNode;
begin
  LNodeICMSTot := ANodeTotal.ChildNodes.FindNode('ICMSTot');
  if not Assigned(LNodeICMSTot) then
    Exit;

  FModel.ICMSTot.vBC := GetNodeCurrency(LNodeICMSTot, 'vBC');
  FModel.ICMSTot.vICMS := GetNodeCurrency(LNodeICMSTot, 'vICMS');
  FModel.ICMSTot.vICMSDeson := GetNodeCurrency(LNodeICMSTot, 'vICMSDeson');
  FModel.ICMSTot.vBCST := GetNodeCurrency(LNodeICMSTot, 'vBCST');
  FModel.ICMSTot.vTotTrib := GetNodeCurrency(LNodeICMSTot, 'vTotTrib');
  FModel.ICMSTot.vFCPUFDest := GetNodeCurrency(LNodeICMSTot, 'vFCPUFDest');
  FModel.ICMSTot.vICMSUFDest := GetNodeCurrency(LNodeICMSTot, 'vICMSUFDest');
  FModel.ICMSTot.vICMSUFRemet := GetNodeCurrency(LNodeICMSTot, 'vICMSUFRemet');
  FModel.ICMSTot.vFCP := GetNodeCurrency(LNodeICMSTot, 'vFCP');
  FModel.ICMSTot.vBCST := GetNodeCurrency(LNodeICMSTot, 'vBCST');
  FModel.ICMSTot.vST := GetNodeCurrency(LNodeICMSTot, 'vST');
  FModel.ICMSTot.vFCPST := GetNodeCurrency(LNodeICMSTot, 'vFCPST');
  FModel.ICMSTot.vFCPSTRet := GetNodeCurrency(LNodeICMSTot, 'vFCPSTRet');
  FModel.ICMSTot.vProd := GetNodeCurrency(LNodeICMSTot, 'vProd');
  FModel.ICMSTot.vFrete := GetNodeCurrency(LNodeICMSTot, 'vFrete');
  FModel.ICMSTot.vSeg := GetNodeCurrency(LNodeICMSTot, 'vSeg');
  FModel.ICMSTot.vDesc := GetNodeCurrency(LNodeICMSTot, 'vDesc');
  FModel.ICMSTot.vII := GetNodeCurrency(LNodeICMSTot, 'vII');
  FModel.ICMSTot.vIPI := GetNodeCurrency(LNodeICMSTot, 'vIPI');
  FModel.ICMSTot.vPIS := GetNodeCurrency(LNodeICMSTot, 'vPIS');
  FModel.ICMSTot.vCOFINS := GetNodeCurrency(LNodeICMSTot, 'vCOFINS');
  FModel.ICMSTot.vOutro := GetNodeCurrency(LNodeICMSTot, 'vOutro');
  FModel.ICMSTot.vNF := GetNodeCurrency(LNodeICMSTot, 'vNF');
end;

procedure TGBFRNFeXMLDefault.loadTagTotalISSQNTot(ANodeTotal: IXMLNode);
var
  LNodeISSQNTot: IXMLNode;
begin
  LNodeISSQNTot := ANodeTotal.ChildNodes.FindNode('ISSQNtot');
  if not Assigned(LNodeISSQNTot) then
    Exit;

  FModel.ISSQNTot.vServ := GetNodeCurrency(LNodeISSQNTot, 'vServ');
  FModel.ISSQNTot.vBC := GetNodeCurrency(LNodeISSQNTot, 'vBC');
  FModel.ISSQNTot.vISS := GetNodeCurrency(LNodeISSQNTot, 'vISS');
  FModel.ISSQNTot.vPIS := GetNodeCurrency(LNodeISSQNTot, 'vPIS');
  FModel.ISSQNTot.vCOFINS := GetNodeCurrency(LNodeISSQNTot, 'vCOFINS');
  FModel.ISSQNTot.dCompet := GetNodeDate(LNodeISSQNTot, 'dCompet');
end;

class function TGBFRNFeXMLDefault.New: IGBFRNFeXML;
begin
  Result := Self.create;
end;

function TGBFRNFeXMLDefault.loadFromContent(Value: String): TGBFRNFeModel;
begin
  loadXmlContent(Value);

  Result := TGBFRNFeModel.create;
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

function TGBFRNFeXMLDefault.loadFromFile(Value: String): TGBFRNFeModel;
var
  LXmlFile: TStrings;
begin
  LXmlFile := TStringList.Create;
  try
    LXmlFile.LoadFromFile(Value);
    Result := loadFromContent(LXmlFile.Text);
  finally
    LXmlFile.Free;
  end;
end;

function TGBFRNFeXMLDefault.loadFromStream(Value: TStream): TGBFRNFeModel;
var
  LStringStream: TStringStream;
  LContent: string;
begin
  LStringStream := TStringStream.Create;
  try
    LStringStream.LoadFromStream(Value);
    LContent := LStringStream.DataString.Replace('﻿', '');
    Result := loadFromContent(LContent)
  finally
    LStringStream.Free;
  end;
end;

procedure TGBFRNFeXMLDefault.loadTagInfNFe;
var
  LNode: IXMLNode;
begin
  repeat
    if LNode = nil then
      LNode := FXml.DocumentElement
    else
    begin
      if LNode.ChildNodes.Count = 0 then
      begin
        LNode := nil;
        break;
      end;
      LNode := LNode.ChildNodes.Get(0);
    end;
  until (LNode = nil) or (LNode.NodeName = 'infNFe');

  if (not Assigned(LNode)) or (not LNode.NodeName.Equals( 'infNFe' )) then
    raise Exception.CreateFmt('Error on read Tag infNFe', []);

  FInfNFe := LNode;

  FModel.Id := FInfNFe.Attributes['Id'];
  FModel.versao := FInfNFe.Attributes['versao'];
end;

end.
