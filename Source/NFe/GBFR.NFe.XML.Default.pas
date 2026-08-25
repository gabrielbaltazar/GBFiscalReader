unit GBFR.NFe.XML.Default;

interface

{$IFDEF WEAKPACKAGEUNIT}
  {$WEAKPACKAGEUNIT ON}
{$ENDIF}

uses
  System.Classes,
  System.SysUtils,
  Xml.XMLIntf,
  Xml.XMLDoc,
  GBFR.XML.Base,
  GBFR.NFe.XML.Interfaces,
  GBFR.NFe.Model.Types,
  GBFR.NFe.Model.Classes;

type
  TGBFRNFeXMLDefault = class(TGBFRXmlBase, IGBFRNFeXML)
  private
    FModel: TGBFRNFeModel;
    [Weak]
    FInfNFe: IXMLNode;
    function GetNodeImposto(ANodeDet: IXMLNode; ATag: string): IXMLNode;
    function GetNodeImpostoDevol(ANodeDet: IXMLNode; ATag: string): IXMLNode;
    procedure LoadTagInfNFe;
    procedure LoadTagIde;
    procedure LoadTagIdeNFref;
    procedure LoadTagEmit;
    procedure LoadTagDest;
    procedure LoadTagDetItem;
    procedure LoadTagPag;
    procedure LoadTagTotal;
    procedure LoadTagCobr;
    procedure LoadTagTotalICMSTot(ANodeTotal: IXMLNode);
    procedure LoadTagTotalISSQNTot(ANodeTotal: IXMLNode);
    procedure LoadTagInfRespTec;
    procedure LoadTagInfAdic;
    procedure LoadTagObsFisco(ANodeInfAdic: IXMLNode);
    procedure LoadTagObsCont(ANodeInfAdic: IXMLNode);
    procedure LoadTagProcRef(ANodeInfAdic: IXMLNode);
    procedure LoadTagProtNFe;
    procedure LoadTagRetEvento;
    procedure LoadTagDI(ANodeItem: IXMLNode);
    procedure LoadTagAdi(ANodeDI: IXMLNode; AItem: TGBFRNFeModelItem);
    procedure LoadTagImposto(ANodeDet: IXMLNode);
    procedure LoadTagImpostoICMS(ANodeDet: IXMLNode; AItem: TGBFRNFeModelItem);
    procedure LoadTagImpostoPIS(ANodeDet: IXMLNode; AItem: TGBFRNFeModelItem);
    procedure LoadTagImpostoCOFINS(ANodeDet: IXMLNode; AItem: TGBFRNFeModelItem);
    procedure LoadTagImpostoIPI(ANodeDet: IXMLNode; AItem: TGBFRNFeModelItem);
    procedure LoadTagImpostoII(ANodeDet: IXMLNode; AItem: TGBFRNFeModelItem);
    procedure LoadTagImpostoISSQN(ANodeDet: IXMLNode; AItem: TGBFRNFeModelItem);
    procedure LoadTagImpostoDevol(ANodeDet: IXMLNode);
    procedure LoadTagImpostoDevolIPI(ANodeImpostoDevolIPI: IXMLNode; AItem: TGBFRNFeModelItem);
    procedure LoadTagIBSCBS(ANodeDet: IXMLNode; AItem: TGBFRNFeModelItem);
    procedure LoadTagImpSel(ANodeDet: IXMLNode; AItem: TGBFRNFeModelItem);
    procedure LoadTagIBSUF(ANodegIBSCBS: IXMLNode; AItem: TGBFRNFeModelItem);
    procedure LoadTagIBSMun(ANodegIBSCBS: IXMLNode; AItem: TGBFRNFeModelItem);
    procedure LoadTagCBS(ANodegIBSCBS: IXMLNode; AItem: TGBFRNFeModelItem);
    procedure LoadTagDFeReferenciado(ANodeDet: IXMLNode);
  protected
    function LoadFromContent(AValue: WideString): TGBFRNFeModel;
    function LoadFromFile(AValue: WideString): TGBFRNFeModel;
    function LoadFromStream(AValue: TStream): TGBFRNFeModel;
  public
    class function New: IGBFRNFeXML;
  end;

implementation

{ TGBFRNFeXMLDefault }

function TGBFRNFeXMLDefault.GetNodeImposto(ANodeDet: IXMLNode; ATag: string): IXMLNode;
begin
  Result := ANodeDet.ChildNodes.FindNode('imposto');
  if not Assigned(Result) then
    Exit;
  Result := Result.ChildNodes.FindNode(ATag);
  if not Assigned(Result) then
    Exit;
  if not ATag.ToLower.Equals('issqn') and
    not ATag.ToLower.Equals('ipi') and
    not ATag.ToLower.Equals('ii') and
    not ATag.ToLower.Equals('is') and
    not ATag.ToLower.Equals('ibscbs') then
  begin
    Result := Result.ChildNodes.Get(0);
    if not Assigned(Result) then
      Exit;
  end;
end;

function TGBFRNFeXMLDefault.GetNodeImpostoDevol(ANodeDet: IXMLNode;
  ATag: string): IXMLNode;
begin
  Result := ANodeDet.ChildNodes.FindNode(ATag);
  if not Assigned(Result) then
    Exit;
  if not ATag.ToLower.Equals('issqn') and
    not ATag.ToLower.Equals('ipi') and
    not ATag.ToLower.Equals('ii') and
    not ATag.ToLower.Equals('is') and
    not ATag.ToLower.Equals('ibscbs') then
  begin
    Result := Result.ChildNodes.Get(0);
    if not Assigned(Result) then
      Exit;
  end;
end;

procedure TGBFRNFeXMLDefault.LoadTagAdi(ANodeDI: IXMLNode; AItem: TGBFRNFeModelItem);
var
  LDI: TGBFRNFeModelDI;
  LAdi: TGBFRNFeModelAdi;
  LNodeAdi: IXMLNode;
  LNodesAdi: IXMLNode;
begin
  LNodesAdi := ANodeDI.ChildNodes.FindNode('adi');
  if not Assigned(LNodesAdi) then
    Exit;
  repeat
    LNodeAdi := LNodesAdi;
    if Assigned(LNodeAdi) then
    begin
      LAdi := TGBFRNFeModelAdi.Create;
      LAdi.nAdicao := GetNodeInt(LNodeAdi, 'nAdicao');
      LAdi.nSeqAdic := GetNodeInt(LNodeAdi, 'nSeqAdic');
      LAdi.cFabricante := GetNodeStr(LNodeAdi, 'cFabricante');
      LAdi.vDescDI := GetNodeCurrency(LNodeAdi, 'vDescDI');
      LAdi.nDraw := GetNodeStr(LNodeAdi, 'nDraw');
      LDI := AItem.prod.DecImportacoes.Last;
      LDI.adicoes.Add(LAdi);
    end;
    LNodesAdi := LNodesAdi.NextSibling;
  until (LNodeAdi = nil) or (LNodesAdi = nil);
end;

procedure TGBFRNFeXMLDefault.LoadTagCBS(ANodegIBSCBS: IXMLNode;
  AItem: TGBFRNFeModelItem);
var
  LNodegCBS: IXMLNode;
  LNodegRed: IXMLNode;
begin
  LNodegCBS := ANodegIBSCBS.ChildNodes.FindNode('gCBS');
  if not Assigned(LNodegCBS) then
    Exit;

  AItem.IBSCBS.gIBSCBS.gCBS.pCBS := GetNodeFloat(LNodegCBS, 'pCBS');
  AItem.IBSCBS.gIBSCBS.gCBS.vCBS := GetNodeCurrency(LNodegCBS, 'vCBS');

  LNodegRed := LNodegCBS.ChildNodes.FindNode('gRed');
  if Assigned(LNodegRed) then
  begin
    AItem.IBSCBS.gIBSCBS.gCBS.gRed.pRedAliq := GetNodeFloat(LNodegRed, 'pRedAliq');
    AItem.IBSCBS.gIBSCBS.gCBS.gRed.pAliqEfet := GetNodeFloat(LNodegRed, 'pAliqEfet');
  end;
end;

procedure TGBFRNFeXMLDefault.LoadTagCobr;
var
  LNodeCobranca: IXMLNode;
  LNode: IXMLNode;
  I: Integer;
begin
  LNodeCobranca := FInfNFe.ChildNodes.FindNode('cobr');
  if not Assigned(LNodeCobranca) then
    Exit;

  LNode := LNodeCobranca.ChildNodes.FindNode('fat');
  if Assigned(LNode) then
  begin
    FModel.cobr.fat.nFat := GetNodeStr(LNode, 'nFat');
    FModel.cobr.fat.vOrig := GetNodeCurrency(LNode, 'vOrig');
    FModel.cobr.fat.vDesc := GetNodeCurrency(LNode, 'vDesc');
    FModel.cobr.fat.vLiq := GetNodeCurrency(LNode, 'vLiq');
  end;

  LNodeCobranca.ChildNodes.First;
  for I := 0 to Pred(LNodeCobranca.ChildNodes.Count) do
  begin
    LNode := LNodeCobranca.ChildNodes.Get(I);
    if LNode.NodeName <> 'dup' then
      Continue;
    FModel.cobr.dup.Add(TGBFRNFeModelDuplicata.Create);
    FModel.cobr.dup.Last.nDup := GetNodeStr(LNode, 'nDup');
    FModel.cobr.dup.Last.dVenc := GetNodeDate(LNode, 'dVenc');
    FModel.cobr.dup.Last.vDup := GetNodeCurrency(LNode, 'vDup');
  end;
end;

procedure TGBFRNFeXMLDefault.LoadTagDest;
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
  FModel.dest.idEstrangeiro := GetNodeStr(LNodeDestinatario, 'idEstrangeiro');
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

procedure TGBFRNFeXMLDefault.LoadTagEmit;
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
  FModel.emit.CPF := GetNodeStr(LNodeEmitente, 'CPF');
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

procedure TGBFRNFeXMLDefault.LoadTagImposto(ANodeDet: IXMLNode);
var
  LItem: TGBFRNFeModelItem;
  LNodeImposto: IXMLNode;
begin
  LItem := FModel.itens.Last;
  LNodeImposto := ANodeDet.ChildNodes.FindNode('imposto');
  LItem.imposto.vTotTrib := GetNodeCurrency(LNodeImposto, 'vTotTrib');
  LoadTagImpostoICMS(ANodeDet, LItem);
  LoadTagImpostoIPI(ANodeDet, LItem);
  LoadTagImpostoPIS(ANodeDet, LItem);
  LoadTagImpostoCOFINS(ANodeDet, LItem);
  LoadTagImpostoISSQN(ANodeDet, LItem);
  LoadTagImpostoII(ANodeDet, LItem);
  LoadTagIBSCBS(ANodeDet, LItem);
  LoadTagImpSel(ANodeDet, LItem);
end;

procedure TGBFRNFeXMLDefault.LoadTagImpostoCOFINS(ANodeDet: IXMLNode; AItem: TGBFRNFeModelItem);
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

procedure TGBFRNFeXMLDefault.LoadTagImpostoDevol(ANodeDet: IXMLNode);
var
  LItem: TGBFRNFeModelItem;
  LNodeImpostoDevol: IXMLNode;
begin
  LItem := FModel.itens.Last;
  LNodeImpostoDevol := ANodeDet.ChildNodes.FindNode('impostoDevol');

  if not Assigned(LNodeImpostoDevol) then
    Exit;

  LItem.impostoDevol.pDevol := GetNodeCurrency(LNodeImpostoDevol, 'pDevol');
  LoadTagImpostoDevolIPI(LNodeImpostoDevol, LItem);
end;

procedure TGBFRNFeXMLDefault.LoadTagImpostoDevolIPI(ANodeImpostoDevolIPI: IXMLNode;
  AItem: TGBFRNFeModelItem);
var
  LNodeImpostoDevolIPI: IXMLNode;
begin
  LNodeImpostoDevolIPI := GetNodeImpostoDevol(ANodeImpostoDevolIPI, 'IPI');
  if not Assigned(LNodeImpostoDevolIPI) then
    Exit;

  AItem.impostoDevol.IPI.vIPIDevol := GetNodeCurrency(LNodeImpostoDevolIPI, 'vIPIDevol');
end;

procedure TGBFRNFeXMLDefault.LoadTagImpostoICMS(ANodeDet: IXMLNode; AItem: TGBFRNFeModelItem);
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
  AItem.imposto.ICMS.vFCP := GetNodeCurrency(LNodeImposto, 'vFCP');
  AItem.imposto.ICMS.vBCFCPST := GetNodeCurrency(LNodeImposto, 'vBCFCPST');
  AItem.imposto.ICMS.pFCPST := GetNodeCurrency(LNodeImposto, 'pFCPST');
  AItem.imposto.ICMS.vFCPST := GetNodeCurrency(LNodeImposto, 'vFCPST');
  AItem.imposto.ICMS.vBCFCPSTRet := GetNodeCurrency(LNodeImposto, 'vBCFCPSTRet');
  AItem.imposto.ICMS.pFCPSTRet := GetNodeCurrency(LNodeImposto, 'pFCPSTRet');
  AItem.imposto.ICMS.vFCPSTRet := GetNodeCurrency(LNodeImposto, 'vFCPSTRet');
  AItem.imposto.ICMS.modBC.fromInteger(GetNodeInt(LNodeImposto, 'modBC'));
  AItem.imposto.ICMS.modBCST.fromInteger(GetNodeInt(LNodeImposto, 'modBCST'));
  AItem.imposto.ICMS.motDesICMS.fromString(GetNodeStr(LNodeImposto, 'motDesICMS'));
  AItem.imposto.ICMS.pST := GetNodeCurrency(LNodeImposto, 'pST');
  AItem.imposto.ICMS.vICMSSubstituto := GetNodeCurrency(LNodeImposto, 'vICMSSubstituto');
  AItem.imposto.ICMS.vICMSSTRet := GetNodeCurrency(LNodeImposto, 'vICMSSTRet');
  AItem.imposto.ICMS.vBCST := GetNodeCurrency(LNodeImposto, 'vBCST');
  AItem.imposto.ICMS.pICMSST := GetNodeCurrency(LNodeImposto, 'pICMSST');
  AItem.imposto.ICMS.vICMSST := GetNodeCurrency(LNodeImposto, 'vICMSST');
  AItem.imposto.ICMS.pRedBCEfet := GetNodeCurrency(LNodeImposto, 'pRedBCEfet');
  AItem.imposto.ICMS.vBCEfet := GetNodeCurrency(LNodeImposto, 'vBCEfet');
  AItem.imposto.ICMS.pICMSEfet := GetNodeCurrency(LNodeImposto, 'pICMSEfet');
  AItem.imposto.ICMS.vICMSEfet := GetNodeCurrency(LNodeImposto, 'vICMSEfet');
  AItem.imposto.ICMS.vICMSOp := GetNodeCurrency(LNodeImposto, 'vICMSOp');
  AItem.imposto.ICMS.vICMSDif := GetNodeCurrency(LNodeImposto, 'vICMSDif');
  AItem.imposto.ICMS.pDif := GetNodeCurrency(LNodeImposto, 'pDif');
end;

procedure TGBFRNFeXMLDefault.LoadTagImpostoII(ANodeDet: IXMLNode; AItem: TGBFRNFeModelItem);
var
  LNodeImposto: IXMLNode;
begin
  LNodeImposto := GetNodeImposto(ANodeDet, 'II');
  if not Assigned(LNodeImposto) then
    Exit;
  AItem.imposto.II.vBC := GetNodeCurrency(LNodeImposto, 'vBC');
  AItem.imposto.II.vDespAdu := GetNodeCurrency(LNodeImposto, 'vDespAdu');
  AItem.imposto.II.vII := GetNodeCurrency(LNodeImposto, 'vII');
  AItem.imposto.II.vIOF := GetNodeCurrency(LNodeImposto, 'vIOF');
end;

procedure TGBFRNFeXMLDefault.LoadTagImpostoIPI(ANodeDet: IXMLNode; AItem: TGBFRNFeModelItem);
var
  LNodeImposto: IXMLNode;
  LNodeIPITrib: IXMLNode;
begin
  LNodeImposto := GetNodeImposto(ANodeDet, 'IPI');
  if not Assigned(LNodeImposto) then
    Exit;
  LNodeIPITrib := LNodeImposto.ChildNodes.FindNode('IPITrib');

  AItem.imposto.IPI.CNPJProd := GetNodeStr(LNodeImposto, 'CNPJProd');
  AItem.imposto.IPI.cSelo := GetNodeStr(LNodeImposto, 'cSelo');
  AItem.imposto.IPI.qSelo := GetNodeFloat(LNodeImposto, 'qSelo');
  AItem.imposto.IPI.cEnq := GetNodeStr(LNodeImposto, 'cEnq');

  if Assigned(LNodeIPITrib) then
  begin
    AItem.imposto.IPI.IPITrib.CST := GetNodeStr(LNodeIPITrib, 'CST');
    AItem.imposto.IPI.IPITrib.vBC := GetNodeCurrency(LNodeIPITrib, 'vBC');
    AItem.imposto.IPI.IPITrib.pIPI := GetNodeCurrency(LNodeIPITrib, 'pIPI');
    AItem.imposto.IPI.IPITrib.vIPI := GetNodeCurrency(LNodeIPITrib, 'vIPI');
  end
  else
  begin
    AItem.imposto.IPI.IPITrib.CST := GetNodeStr(LNodeImposto, 'CST');
    AItem.imposto.IPI.IPITrib.vBC := GetNodeCurrency(LNodeImposto, 'vBC');
    AItem.imposto.IPI.IPITrib.pIPI := GetNodeCurrency(LNodeImposto, 'pIPI');
    AItem.imposto.IPI.IPITrib.vIPI := GetNodeCurrency(LNodeImposto, 'vIPI');
  end;
end;

procedure TGBFRNFeXMLDefault.LoadTagImpostoISSQN(ANodeDet: IXMLNode; AItem: TGBFRNFeModelItem);
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

procedure TGBFRNFeXMLDefault.LoadTagImpostoPIS(ANodeDet: IXMLNode; AItem: TGBFRNFeModelItem);
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

procedure TGBFRNFeXMLDefault.LoadTagImpSel(ANodeDet: IXMLNode; AItem: TGBFRNFeModelItem);
var
  LNodeImpSel: IXMLNode;
begin
  LNodeImpSel := GetNodeImposto(ANodeDet, 'IS');
  if not Assigned(LNodeImpSel) then
    Exit;

  AItem.ImpSel.CST := GetNodeStr(LNodeImpSel, 'CST');
  AItem.ImpSel.cClassTrib := GetNodeStr(LNodeImpSel, 'cClassTrib');
  AItem.ImpSel.vBCImpSel := GetNodeCurrency(LNodeImpSel, 'vBCImpSel');
  AItem.ImpSel.pImpSel := GetNodeFloat(LNodeImpSel, 'pImpSel');
  AItem.ImpSel.vImpSel := GetNodeCurrency(LNodeImpSel, 'vImpSel');
  AItem.ImpSel.pImpSelEspec := GetNodeFloat(LNodeImpSel, 'pImpSelEspec');
  AItem.ImpSel.uTrib := GetNodeStr(LNodeImpSel, 'uTrib');
  AItem.ImpSel.qTrib := GetNodeFloat(LNodeImpSel, 'qTrib');
end;

procedure TGBFRNFeXMLDefault.LoadTagInfAdic;
var
  LNodeInfAdic: IXMLNode;
begin
  LNodeInfAdic := FInfNFe.ChildNodes.FindNode('infAdic');
  if not Assigned(LNodeInfAdic) then
    Exit;
  FModel.infAdic.infAdFisco := GetNodeStr(LNodeInfAdic, 'infAdFisco');
  FModel.infAdic.infCpl := GetNodeStr(LNodeInfAdic, 'infCpl');
  LoadTagObsFisco(LNodeInfAdic);
  LoadTagObsCont(LNodeInfAdic);
  LoadTagProcRef(LNodeInfAdic);
end;

procedure TGBFRNFeXMLDefault.LoadTagDetItem;
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
        LItem.prod.cProd := GetNodeStr(LNodeItem, 'cProd');
        LItem.prod.xProd := GetNodeStr(LNodeItem, 'xProd');
        LItem.prod.cEAN := GetNodeStr(LNodeItem, 'cEAN');
        LItem.prod.CFOP := GetNodeStr(LNodeItem, 'CFOP');
        LItem.prod.NCM := GetNodeStr(LNodeItem, 'NCM');
        LItem.prod.uCom := GetNodeStr(LNodeItem, 'uCom');
        LItem.prod.qCom := GetNodeCurrency(LNodeItem, 'qCom');
        LItem.prod.vUnCom := GetNodeCurrency(LNodeItem, 'vUnCom');
        LItem.prod.vProd := GetNodeCurrency(LNodeItem, 'vProd');
        LItem.prod.cEANTrib := GetNodeStr(LNodeItem, 'cEANTrib');
        LItem.prod.uTrib := GetNodeStr(LNodeItem, 'uTrib');
        LItem.prod.qTrib := GetNodeCurrency(LNodeItem, 'qTrib');
        LItem.prod.vUnTrib := GetNodeCurrency(LNodeItem, 'vUnTrib');
        LItem.prod.CEST := GetNodeStr(LNodeItem, 'CEST');
        LItem.prod.infAdProd := GetNodeStr(LNodeItem, 'infAdProd');
        LItem.prod.vDesc := GetNodeCurrency(LNodeItem, 'vDesc');
        LItem.prod.vFrete := GetNodeCurrency(LNodeItem, 'vFrete');
        LItem.prod.vSeg := GetNodeCurrency(LNodeItem, 'vSeg');
        LItem.prod.vOutro := GetNodeCurrency(LNodeItem, 'vOutro');
        LItem.prod.cBenef := GetNodeStr(LNodeItem, 'cBenef');
        LItem.prod.xPed := GetNodeStr(LNodeItem, 'xPed');
        LItem.prod.nItemPed := GetNodeStr(LNodeItem, 'nItemPed');
        LItem.prod.indTot.fromInteger(GetNodeInt(LNodeItem, 'indTot'));
      except
        LItem.Free;
        raise;
      end;
      FModel.itens.Add(LItem);
      LoadTagDI(LNodeItem);
      LoadTagImposto(LNodeDet);
      LoadTagImpostoDevol(LNodeDet);
      LoadTagDFeReferenciado(LNodeDet);
    end;
    LNodeDet := LNodeDet.NextSibling;
  until (LNodeDet = nil) or (LNodeItem = nil);
end;

procedure TGBFRNFeXMLDefault.LoadTagDFeReferenciado(ANodeDet: IXMLNode);
var
  LItem: TGBFRNFeModelItem;
  LNodeDFeReferenciado: IXMLNode;
begin
  LItem := FModel.itens.Last;
  LNodeDFeReferenciado := ANodeDet.ChildNodes.FindNode('DFeReferenciado');

  if not Assigned(LNodeDFeReferenciado) then
    Exit;

  LItem.DFeReferenciado.chaveAcesso := GetNodeStr(LNodeDFeReferenciado, 'chaveAcesso');
  LItem.DFeReferenciado.nItem := GetNodeInt(LNodeDFeReferenciado, 'nItem');
end;

procedure TGBFRNFeXMLDefault.LoadTagDI(ANodeItem: IXMLNode);
var
  LtemDI: TGBFRNFeModelItem;
  LDI: TGBFRNFeModelDI;
  LNodeDI: IXMLNode;
  LNodesDI: IXMLNode;
begin
  LNodesDI := ANodeItem.ChildNodes.FindNode('DI');
  if not Assigned(LNodesDI) then
    Exit;
  repeat
    LNodeDI := LNodesDI;
    if Assigned(LNodeDI) then
    begin
      LDI := TGBFRNFeModelDI.Create;
      LDI.nDI := GetNodeStr(LNodeDI, 'nDI');
      LDI.dDI := GetNodeDate(LNodeDI, 'dDI');
      LDI.xLocDesemb := GetNodeStr(LNodeDI, 'xLocDesemb');
      LDI.UFDesemb := GetNodeStr(LNodeDI, 'UFDesemb');
      LDI.dDesemb := GetNodeDate(LNodeDI, 'dDesemb');
      LDI.tpViaTransp.fromInteger(GetNodeInt(LNodeDI, 'tpViaTransp'));
      LDI.tpIntermedio.fromInteger(GetNodeInt(LNodeDI, 'tpIntermedio'));
      LDI.CNPJ := GetNodeStr(LNodeDI, 'CNPJ');
      LDI.UFTerceiro := GetNodeStr(LNodeDI, 'UFTerceiro');
      LDI.cExportador := GetNodeStr(LNodeDI, 'cExportador');

      LtemDI := FModel.itens.Last;

      LtemDI.prod.DecImportacoes.Add(LDI);

      LoadTagAdi(LNodeDI, LtemDI);
    end;

    LNodeDI := LNodesDI.NextSibling;
  until (LNodeDI = nil) or (LNodesDI = nil);
end;

procedure TGBFRNFeXMLDefault.LoadTagIBSMun(ANodegIBSCBS: IXMLNode;
  AItem: TGBFRNFeModelItem);
var
  LNodegIBSMun: IXMLNode;
  LNodegRed: IXMLNode;
begin
  LNodegIBSMun := ANodegIBSCBS.ChildNodes.FindNode('gIBSMun');
  if not Assigned(LNodegIBSMun) then
    Exit;

  AItem.IBSCBS.gIBSCBS.gIBSMun.pIBSMun := GetNodeFloat(LNodegIBSMun, 'pIBSMun');
  AItem.IBSCBS.gIBSCBS.gIBSMun.vIBSMun := GetNodeCurrency(LNodegIBSMun, 'vIBSMun');

  LNodegRed := LNodegIBSMun.ChildNodes.FindNode('gRed');
  if Assigned(LNodegRed) then
  begin
    AItem.IBSCBS.gIBSCBS.gIBSMun.gRed.pRedAliq := GetNodeFloat(LNodegRed, 'pRedAliq');
    AItem.IBSCBS.gIBSCBS.gIBSMun.gRed.pAliqEfet := GetNodeFloat(LNodegRed, 'pAliqEfet');
  end;
end;

procedure TGBFRNFeXMLDefault.LoadTagIBSCBS(ANodeDet: IXMLNode; AItem: TGBFRNFeModelItem);
var
  LNodeIBSCBS: IXMLNode;
  LNodegIBSCBS: IXMLNode;
begin
  LNodeIBSCBS := GetNodeImposto(ANodeDet, 'IBSCBS');
  if not Assigned(LNodeIBSCBS) then
    Exit;

  AItem.IBSCBS.CST := GetNodeStr(LNodeIBSCBS, 'CST');
  AItem.IBSCBS.cClassTrib := GetNodeStr(LNodeIBSCBS, 'cClassTrib');

  LNodegIBSCBS := LNodeIBSCBS.ChildNodes.FindNode('gIBSCBS');
  if Assigned(LNodegIBSCBS) then
  begin
    AItem.IBSCBS.gIBSCBS.vBC := GetNodeCurrency(LNodegIBSCBS, 'vBC');
    LoadTagIBSUF(LNodegIBSCBS, AItem);
    LoadTagIBSMun(LNodegIBSCBS, AItem);
    LoadTagCBS(LNodegIBSCBS, AItem);
  end;
end;

procedure TGBFRNFeXMLDefault.LoadTagIBSUF(ANodegIBSCBS: IXMLNode;
  AItem: TGBFRNFeModelItem);
var
  LNodegIBSUF: IXMLNode;
  LNodegRed: IXMLNode;
begin
  LNodegIBSUF := ANodegIBSCBS.ChildNodes.FindNode('gIBSUF');
  if not Assigned(LNodegIBSUF) then
    Exit;

  AItem.IBSCBS.gIBSCBS.gIBSUF.pIBSUF := GetNodeFloat(LNodegIBSUF, 'pIBSUF');
  AItem.IBSCBS.gIBSCBS.gIBSUF.vIBSUF := GetNodeCurrency(LNodegIBSUF, 'vIBSUF');

  LNodegRed := LNodegIBSUF.ChildNodes.FindNode('gRed');
  if Assigned(LNodegRed) then
  begin
    AItem.IBSCBS.gIBSCBS.gIBSUF.gRed.pRedAliq := GetNodeFloat(LNodegRed, 'pRedAliq');
    AItem.IBSCBS.gIBSCBS.gIBSUF.gRed.pAliqEfet := GetNodeFloat(LNodegRed, 'pAliqEfet');
  end;
end;

procedure TGBFRNFeXMLDefault.LoadTagIde;
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
      FModel.ide.verProc := GetNodeStr(LNodeIDE, 'verProc');
      LoadTagIdeNFref;
    end;
  except
    on E: Exception do
    begin
      E.Message := 'Error on read Tag <ide>: ' + E.Message;
      raise;
    end;
  end;
end;

procedure TGBFRNFeXMLDefault.LoadTagIdeNFref;
var
  LNodeIDE: IXMLNode;
  LNodeNFRef: IXMLNode;
  LNodeRefNFe: IXMLNode;
  LNodeRefNF: IXMLNode;
  LNodeRefNFP: IXMLNode;
  LNodeRefECF: IXMLNode;
begin
  LNodeIDE := FInfNFe.ChildNodes.FindNode('ide');
  if not Assigned(LNodeIDE) then
    Exit;
  LNodeNFRef := LNodeIDE.ChildNodes.FindNode('NFref');
  if not Assigned(LNodeNFRef) then
    Exit;

  repeat
    LNodeRefNFe := LNodeNFRef.ChildNodes.FindNode('refNFe');
    if Assigned(LNodeRefNFe) then
    begin
      FModel.ide.refNFes.Add(TGBFRNFeModelRefNFe.Create);
      FModel.ide.refNFes.Last.refNFe := GetNodeStr(LNodeNFRef, 'refNFe');
    end;

    LNodeRefNF := LNodeNFRef.ChildNodes.FindNode('refNF');
    if Assigned(LNodeRefNF) then
    begin
      FModel.ide.refNFs.Add(TGBFRNFeModelRefNF.Create);
      FModel.ide.refNFs.Last.cUf := GetNodeStr(LNodeRefNF, 'cUF');
      FModel.ide.refNFs.Last.aamm := GetNodeStr(LNodeRefNF, 'AAMM');
      FModel.ide.refNFs.Last.cnpj := GetNodeStr(LNodeRefNF, 'CNPJ');
      FModel.ide.refNFs.Last.&mod := GetNodeStr(LNodeRefNF, 'mod');
      FModel.ide.refNFs.Last.serie := GetNodeStr(LNodeRefNF, 'serie');
      FModel.ide.refNFs.Last.nNf := GetNodeStr(LNodeRefNF, 'nNF');
    end;

    LNodeRefNFP := LNodeNFRef.ChildNodes.FindNode('refNFP');
    if Assigned(LNodeRefNFP) then
    begin
      FModel.ide.refNFPs.Add(TGBFRNFeModelRefNFP.Create);
      FModel.ide.refNFPs.Last.cUf := GetNodeStr(LNodeRefNFP, 'cUF');
      FModel.ide.refNFPs.Last.aamm := GetNodeStr(LNodeRefNFP, 'AAMM');
      FModel.ide.refNFPs.Last.cnpj := GetNodeStr(LNodeRefNFP, 'CNPJ');
      FModel.ide.refNFPs.Last.cpf := GetNodeStr(LNodeRefNFP, 'CPF');
      FModel.ide.refNFPs.Last.ie := GetNodeStr(LNodeRefNFP, 'IE');
      FModel.ide.refNFPs.Last.&mod := GetNodeStr(LNodeRefNFP, 'mod');
      FModel.ide.refNFPs.Last.serie := GetNodeStr(LNodeRefNFP, 'serie');
      FModel.ide.refNFPs.Last.nNf := GetNodeStr(LNodeRefNFP, 'nNF');
    end;

    LNodeRefECF := LNodeNFRef.ChildNodes.FindNode('refECF');
    if Assigned(LNodeRefECF) then
    begin
      FModel.ide.refECFs.Add(TGBFRNFeModelRefECF.Create);
      FModel.ide.refECFs.Last.&mod := GetNodeStr(LNodeRefECF, 'mod');
      FModel.ide.refECFs.Last.nECF := GetNodeStr(LNodeRefECF, 'nECF');
      FModel.ide.refECFs.Last.nCOO := GetNodeStr(LNodeRefECF, 'nCOO');
    end;

    LNodeNFRef := LNodeNFRef.NextSibling;
  until LNodeNFRef = nil;
end;

procedure TGBFRNFeXMLDefault.LoadTagPag;
var
  LPagamento: TGBFRNFeModelFormaPagamento;
  LNodePag: IXMLNode;
  LNodeDetPag: IXMLNode;
  LNodeCard: IXMLNode;
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
    if LNodeDetPag.NodeName.ToLower <> 'detpag' then
      Continue;
    LPagamento := TGBFRNFeModelFormaPagamento.Create;
    try
      LPagamento.VPag := GetNodeCurrency(LNodeDetPag, 'vPag');
      LPagamento.XPag := GetNodeStr(LNodeDetPag, 'xPag');
      LPagamento.IndPag.FromString(GetNodeStr(LNodeDetPag, 'indPag', ''));
      LPagamento.TPag.FromString(GetNodeStr(LNodeDetPag, 'tPag', '99'));

      LNodeCard := LNodeDetPag.ChildNodes.FindNode('card');
      if Assigned(LNodeCard) then
      begin
        LPagamento.Card.CNPJ := GetNodeStr(LNodeCard, 'CNPJ');
        LPagamento.Card.CAut := GetNodeStr(LNodeCard, 'cAut');
        LPagamento.Card.TpIntegra.FromInteger(GetNodeInt(LNodeCard, 'tpIntegra', 1));
        LPagamento.Card.TBand.FromString(GetNodeStr(LNodeCard, 'tBand', '99'));
      end;

      FModel.pag.detPag.Add(LPagamento);
    except
      LPagamento.Free;
      raise;
    end;
  end;
end;

procedure TGBFRNFeXMLDefault.LoadTagProcRef(ANodeInfAdic: IXMLNode);
var
  LNodeProcRef: IXMLNode;
begin
  LNodeProcRef := ANodeInfAdic.ChildNodes.FindNode('procRef');
  if not Assigned(LNodeProcRef) then
    Exit;
  FModel.infAdic.procRef.nProc := GetNodeStr(LNodeProcRef, 'nProc');
  FModel.infAdic.procRef.indProc.fromInteger(GetNodeInt(LNodeProcRef, 'indProc'));
end;

procedure TGBFRNFeXMLDefault.LoadTagProtNFe;
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

procedure TGBFRNFeXMLDefault.LoadTagRetEvento;
var
  LNodeRetEvento: IXMLNode;
  LNodeInfEvento: IXMLNode;
  LEvento: TGBFRNFeInfEvento;
begin
  repeat
    LNodeRetEvento := FXml.DocumentElement.ChildNodes.FindNode('retEvento');
    if Assigned(LNodeRetEvento) then
    begin
      LNodeInfEvento := LNodeRetEvento.ChildNodes.FindNode('infEvento');
      if Assigned(LNodeInfEvento) then
      begin
        LEvento := TGBFRNFeInfEvento.Create;
        FModel.Eventos.Add(LEvento);
        LEvento.TpAmb.FromInteger(GetNodeInt(LNodeInfEvento, 'tpAmb', 2));
        LEvento.VerAplic := GetNodeStr(LNodeInfEvento, 'verAplic');
        LEvento.CStat := GetNodeInt(LNodeInfEvento, 'cStat');
        LEvento.XMotivo := GetNodeStr(LNodeInfEvento, 'xMotivo');
        LEvento.ChNFe := GetNodeStr(LNodeInfEvento, 'chNFe');
        LEvento.TpEvento := GetNodeStr(LNodeInfEvento, 'tpEvento');
        LEvento.NSeqEvento := GetNodeInt(LNodeInfEvento, 'nSeqEvento');
        LEvento.DhRegEvento := GetNodeDate(LNodeInfEvento, 'dhRegEvento');
        LEvento.NProt := GetNodeStr(LNodeInfEvento, 'nProt');
      end;

      LNodeRetEvento := LNodeRetEvento.NextSibling;
    end;
  until LNodeRetEvento = nil;
end;

procedure TGBFRNFeXMLDefault.LoadTagInfRespTec;
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

procedure TGBFRNFeXMLDefault.LoadTagObsCont(ANodeInfAdic: IXMLNode);
var
  LNodeObsCont: IXMLNode;
begin
  LNodeObsCont := ANodeInfAdic.ChildNodes.FindNode('obsCont');
  if not Assigned(LNodeObsCont) then
    Exit;
  FModel.infAdic.obsCont.xCampo := LNodeObsCont.AttributeNodes['xCampo'].Text;
  FModel.infAdic.obsCont.xTexto := GetNodeStr(LNodeObsCont, 'xTexto');
end;

procedure TGBFRNFeXMLDefault.LoadTagObsFisco(ANodeInfAdic: IXMLNode);
var
  LNodeObsFisco: IXMLNode;
begin
  LNodeObsFisco := ANodeInfAdic.ChildNodes.FindNode('obsFisco');
  if not Assigned(LNodeObsFisco) then
    Exit;
  FModel.infAdic.obsFisco.xCampo := LNodeObsFisco.AttributeNodes['xCampo'].Text;
  FModel.infAdic.obsFisco.xTexto := GetNodeStr(LNodeObsFisco, 'xTexto');
end;

procedure TGBFRNFeXMLDefault.LoadTagTotal;
var
  LNodeTotal: IXMLNode;
begin
  LNodeTotal := FInfNFe.ChildNodes.FindNode('total');
  if not Assigned(LNodeTotal) then
    Exit;
  LoadTagTotalICMSTot(LNodeTotal);
  LoadTagTotalISSQNTot(LNodeTotal);
end;

procedure TGBFRNFeXMLDefault.LoadTagTotalICMSTot(ANodeTotal: IXMLNode);
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

procedure TGBFRNFeXMLDefault.LoadTagTotalISSQNTot(ANodeTotal: IXMLNode);
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
  Result := Self.Create;
end;

function TGBFRNFeXMLDefault.LoadFromContent(AValue: WideString): TGBFRNFeModel;
begin
  LoadXmlContent(AValue);
  Result := TGBFRNFeModel.Create;
  try
    FModel := Result;
    LoadTagInfNFe;
    LoadTagIde;
    LoadTagEmit;
    LoadTagDest;
    LoadTagDetItem;
    LoadTagInfAdic;
    LoadTagInfRespTec;
    LoadTagTotal;
    LoadTagCobr;
    LoadTagPag;
    LoadTagProtNFe;
    LoadTagRetEvento;
  except
    Result.Free;
    raise;
  end;
end;

function TGBFRNFeXMLDefault.LoadFromFile(AValue: WideString): TGBFRNFeModel;
var
  LXmlFile: TStrings;
begin
  LXmlFile := TStringList.Create;
  try
    LXmlFile.LoadFromFile(AValue);
    Result := LoadFromContent(LXmlFile.Text);
  finally
    LXmlFile.Free;
  end;
end;

function TGBFRNFeXMLDefault.LoadFromStream(AValue: TStream): TGBFRNFeModel;
var
  LStringStream: TStringStream;
  LContent: string;
begin
  LStringStream := TStringStream.Create;
  try
    LStringStream.LoadFromStream(AValue);
    LContent := LStringStream.DataString.Replace('﻿', '');
    Result := LoadFromContent(LContent)
  finally
    LStringStream.Free;
  end;
end;

procedure TGBFRNFeXMLDefault.LoadTagInfNFe;
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
  if (not Assigned(LNode)) or (not LNode.NodeName.Equals('infNFe')) then
    raise Exception.CreateFmt('Error on read Tag infNFe', []);
  FInfNFe := LNode;
  FModel.Id := FInfNFe.Attributes['Id'];
  FModel.versao := FInfNFe.Attributes['versao'];
end;

end.

