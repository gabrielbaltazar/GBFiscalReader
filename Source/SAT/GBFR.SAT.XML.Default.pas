unit GBFR.SAT.XML.Default;

interface

uses
  GBFR.SAT.XML.Interfaces,
  GBFR.SAT.Model.Types,
  GBFR.SAT.Model.Classes,
  GBFR.XML.Base,
  System.Classes,
  System.SysUtils,
  Xml.XMLIntf,
  Xml.XMLDoc;

type
  TGBFRSATXMLDefault = class(TGBFRXmlBase, IGBFRSATXML)
  private
    [Weak]
    FInfCFe: IXMLNode;
    FCFe: TGBFRSATModelCFe;

    function GetNodeImposto(ANodeDet: IXMLNode; ATag: string): IXMLNode;

    procedure LoadTagInfCFe;
    procedure LoadTagIde;
    procedure LoadTagEmit;
    procedure LoadTagDest;
    procedure LoadTagInfAdic;
    procedure LoadTagTotal;
    procedure LoadTagTotalICMSTot(ANodeTotal: IXMLNode);
    procedure LoadTagTotalISSQNTot(ANodeTotal: IXMLNode);
    procedure LoadTagPag;

    procedure LoadTagDetItem;
    procedure LoadTagDetItemImposto(ANodeDet: IXMLNode);
    procedure LoadTagImpostoICMS(ANodeDet: IXMLNode; AItem: TGBFRSATModelDetalhe);
    procedure LoadTagImpostoPIS(ANodeDet: IXMLNode; AItem: TGBFRSATModelDetalhe);
    procedure LoadTagImpostoCOFINS(ANodeDet: IXMLNode; AItem: TGBFRSATModelDetalhe);
    procedure LoadTagImpostoCOFINSST(ANodeDet: IXMLNode; AItem: TGBFRSATModelDetalhe);
    procedure LoadTagImpostoPISST(ANodeDet: IXMLNode; AItem: TGBFRSATModelDetalhe);
    procedure LoadTagImpostoISSQN(ANodeDet: IXMLNode; AItem: TGBFRSATModelDetalhe);
  protected
    function LoadFromContent(AValue: string): TGBFRSATModelCFe;
    function LoadFromFile(AValue: string): TGBFRSATModelCFe;
    function LoadFromStream(AValue: TStream): TGBFRSATModelCFe;
  public
    class function New: IGBFRSATXML;
  end;

implementation

{ TGBFRSATXMLDefault }

function TGBFRSATXMLDefault.GetNodeImposto(ANodeDet: IXMLNode;
  ATag: string): IXMLNode;
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

function TGBFRSATXMLDefault.LoadFromContent(AValue: string): TGBFRSATModelCFe;
begin
  LoadXmlContent(AValue);

  Result := TGBFRSATModelCFe.Create;
  try
    FCFe := Result;

    LoadTagInfCFe;
    LoadTagIde;
    LoadTagEmit;
    LoadTagDest;
    LoadTagDetItem;
    LoadTagInfAdic;
    LoadTagTotal;
    LoadTagPag;
  except
    Result.Free;
    raise;
  end;
end;

function TGBFRSATXMLDefault.LoadFromFile(AValue: string): TGBFRSATModelCFe;
var
  LXmlFile: TStrings;
begin
  LXmlFile := TStringList.Create;
  try
    LXmlFile.LoadFromFile(AValue);
    Result := loadFromContent(LXmlFile.Text);
  finally
    LXmlFile.Free;
  end;
end;

function TGBFRSATXMLDefault.LoadFromStream(AValue: TStream): TGBFRSATModelCFe;
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

procedure TGBFRSATXMLDefault.LoadTagDest;
var
  LNodeDestinatario: IXMLNode;
begin
  LNodeDestinatario := FInfCFe.ChildNodes.FindNode('dest');

  if not Assigned(LNodeDestinatario) then
    raise Exception.CreateFmt('Error on read Tag dest', []);

  FCFe.infCFe.dest.xNome := GetNodeStr(LNodeDestinatario, 'xNome');
  FCFe.infCFe.dest.CNPJ := GetNodeStr(LNodeDestinatario, 'CNPJ');
  FCFe.infCFe.dest.CPF := GetNodeStr(LNodeDestinatario, 'CPF');
end;

procedure TGBFRSATXMLDefault.LoadTagDetItem;
var
  LItem: TGBFRSATModelDetalhe;
  LNodeItem: IXMLNode;
  LNodeDet: IXMLNode;
begin
  LNodeDet := FInfCFe.ChildNodes.FindNode('det');
  if not Assigned(LNodeDet) then
    Exit;

  repeat
    LNodeItem := LNodeDet.ChildNodes.FindNode('prod');
    if Assigned(LNodeItem) then
    begin
      LItem := TGBFRSATModelDetalhe.Create;
      try
        LItem.nItem := FCFe.infCFe.det.Count + 1;
        LItem.prod.cProd := GetNodeStr(LNodeItem, 'cProd');
        LItem.prod.cEAN := GetNodeStr(LNodeItem, 'cEAN');
        LItem.prod.xProd := GetNodeStr(LNodeItem, 'xProd');
        LItem.prod.NCM := GetNodeStr(LNodeItem, 'NCM');
        LItem.prod.CEST := GetNodeStr(LNodeItem, 'CEST');
        LItem.prod.CFOP := GetNodeStr(LNodeItem, 'CFOP');
        LItem.prod.uCom := GetNodeStr(LNodeItem, 'uCom');
        LItem.prod.qCom := GetNodeFloat(LNodeItem, 'qCom');
        LItem.prod.vUnCom := GetNodeFloat(LNodeItem, 'vUnCom');
        LItem.prod.vProd := GetNodeFloat(LNodeItem, 'vProd');
        LItem.prod.indRegra.FromString(GetNodeStr(LNodeItem, 'indRegra'));
        LItem.prod.vDesc := GetNodeFloat(LNodeItem, 'vDesc');
        LItem.prod.vOutro := GetNodeFloat(LNodeItem, 'vOutro');
        LItem.prod.vItem := GetNodeFloat(LNodeItem, 'vItem');
        LItem.prod.vRatDesc := GetNodeFloat(LNodeItem, 'vRatDesc');
        LItem.prod.vRatAcr := GetNodeFloat(LNodeItem, 'vRatAcr');
        LItem.prod.xCampoDet := GetNodeStr(LNodeItem, 'xCampoDet');
        LItem.prod.xTextoDet := GetNodeStr(LNodeItem, 'xTextoDet');
      except
        LItem.Free;
        raise;
      end;

      FCFe.infCFe.det.Add(LItem);
      LoadTagDetItemImposto(LNodeDet);
    end;

    LNodeDet := LNodeDet.NextSibling;
  until (LNodeDet = nil) or (LNodeItem = nil);
end;

procedure TGBFRSATXMLDefault.loadTagDetItemImposto(ANodeDet: IXMLNode);
var
  LItem: TGBFRSATModelDetalhe;
  LNodeImposto: IXMLNode;
begin
  LItem := FCFe.infCFe.det.Last;

  LNodeImposto := ANodeDet.ChildNodes.FindNode('imposto');
  LoadTagImpostoCOFINS(ANodeDet, LItem);
  LoadTagImpostoCOFINSST(ANodeDet, LItem);
  LoadTagImpostoICMS(ANodeDet, LItem);
  LoadTagImpostoISSQN(ANodeDet, LItem);
  LoadTagImpostoPIS(ANodeDet, LItem);
  LoadTagImpostoPISST(ANodeDet, LItem);
end;

procedure TGBFRSATXMLDefault.LoadTagEmit;
var
  LNodeEmitente: IXMLNode;
  LNodeEndereco: IXMLNode;
begin
  LNodeEmitente := FInfCFe.ChildNodes.FindNode('emit');

  if not Assigned(LNodeEmitente) then
    raise Exception.CreateFmt('Error on read Tag emit', []);

  FCFe.infCFe.emit.xNome := GetNodeStr(LNodeEmitente, 'xNome');
  FCFe.infCFe.emit.xFant := GetNodeStr(LNodeEmitente, 'xFant');
  FCFe.infCFe.emit.CNPJ := GetNodeStr(LNodeEmitente, 'CNPJ');
  FCFe.infCFe.emit.IE := GetNodeStr(LNodeEmitente, 'IE');
  FCFe.infCFe.emit.indRatISSQN := GetNodeStr(LNodeEmitente, 'indRatISSQN');
  FCFe.infCFe.emit.IM := GetNodeStr(LNodeEmitente, 'IM');
  FCFe.infCFe.emit.cRegTrib.FromInteger(GetNodeInt(LNodeEmitente, 'cRegTrib'));
  FCFe.infCFe.emit.cRegTribISSQN.FromInteger(GetNodeInt(LNodeEmitente, 'cRegTribISSQN'));

  LNodeEndereco := LNodeEmitente.ChildNodes.FindNode('enderEmit');
  if Assigned(LNodeEndereco) then
  begin
    FCFe.infCFe.emit.enderEmit.xLgr := GetNodeStr(LNodeEndereco, 'xLgr');
    FCFe.infCFe.emit.enderEmit.nro := GetNodeStr(LNodeEndereco, 'nro');
    FCFe.infCFe.emit.enderEmit.xCpl := GetNodeStr(LNodeEndereco, 'xCpl');
    FCFe.infCFe.emit.enderEmit.xBairro := GetNodeStr(LNodeEndereco, 'xBairro');
    FCFe.infCFe.emit.enderEmit.xMun := GetNodeStr(LNodeEndereco, 'xMun');
    FCFe.infCFe.emit.enderEmit.CEP := GetNodeInt(LNodeEndereco, 'CEP');
  end;
end;

procedure TGBFRSATXMLDefault.LoadTagIde;
var
  LNodeIDE: IXMLNode;
  LData: string;
  LHora: string;
  LFormat: TFormatSettings;
begin
  try
    LNodeIDE := FInfCFe.ChildNodes.FindNode('ide');

    if Assigned(LNodeIDE) then
    begin
      FCFe.infCFe.ide.tpAmb.fromInteger(GetNodeInt(LNodeIDE, 'tpAmb', 2));

      FCFe.infCFe.ide.cUF := GetNodeInt(LNodeIDE, 'cUF');
      FCFe.infCFe.ide.cNF := GetNodeInt(LNodeIDE, 'cNF');
      FCFe.infCFe.ide.&mod := GetNodeStr(LNodeIDE, 'mod');
      FCFe.infCFe.ide.nserieSAT := GetNodeInt(LNodeIDE, 'nserieSAT');
      FCFe.infCFe.ide.nCFe := GetNodeStr(LNodeIDE, 'nCFe');
      FCFe.infCFe.ide.cDV := GetNodeInt(LNodeIDE, 'cDV');
      FCFe.infCFe.ide.CNPJ := GetNodeStr(LNodeIDE, 'CNPJ');
      FCFe.infCFe.ide.signAC := GetNodeStr(LNodeIDE, 'signAC');
      FCFe.infCFe.ide.assinaturaQRCODE := GetNodeStr(LNodeIDE, 'assinaturaQRCODE');
      FCFe.infCFe.ide.numeroCaixa := GetNodeStr(LNodeIDE, 'numeroCaixa');

      LData := GetNodeStr(LNodeIDE, 'dEmi');
      LHora := GetNodeStr(LNodeIDE, 'hEmi');
      LFormat := TFormatSettings.Create;
      LFormat.ShortDateFormat := 'yyyyMMdd';
      LFormat.LongTimeFormat := 'hhmmss';
      LFormat.ShortTimeFormat := 'hhmmss';

      FCFe.infCFe.ide.dEmi := StrToDate(LData, LFormat);
      FCFe.infCFe.ide.hEmi := StrToTime(LHora, LFormat);
    end;
  except
    on E: Exception do
    begin
      E.Message := 'Error on read Tag <ide>: ' + E.Message;
      raise;
    end;
  end;
end;

procedure TGBFRSATXMLDefault.LoadTagImpostoCOFINS(ANodeDet: IXMLNode; AItem: TGBFRSATModelDetalhe);
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
  AItem.imposto.COFINS.qBCProd := GetNodeCurrency(LNodeImposto, 'qBCProd');
  AItem.imposto.COFINS.vAliqProd := GetNodeCurrency(LNodeImposto, 'vAliqProd');
end;

procedure TGBFRSATXMLDefault.LoadTagImpostoCOFINSST(ANodeDet: IXMLNode; AItem: TGBFRSATModelDetalhe);
var
  LNodeImposto: IXMLNode;
begin
  LNodeImposto := GetNodeImposto(ANodeDet, 'COFINSST');

  if not Assigned(LNodeImposto) then
    Exit;

  AItem.imposto.COFINSST.vBC := GetNodeCurrency(LNodeImposto, 'vBC');
  AItem.imposto.COFINSST.pCOFINS := GetNodeCurrency(LNodeImposto, 'pCOFINS');
  AItem.imposto.COFINSST.vCOFINS := GetNodeCurrency(LNodeImposto, 'vCOFINS');
  AItem.imposto.COFINSST.qBCProd := GetNodeCurrency(LNodeImposto, 'qBCProd');
  AItem.imposto.COFINSST.vAliqProd := GetNodeCurrency(LNodeImposto, 'vAliqProd');
end;


procedure TGBFRSATXMLDefault.LoadTagImpostoICMS(ANodeDet: IXMLNode; AItem: TGBFRSATModelDetalhe);
var
  LNodeImposto: IXMLNode;
begin
  LNodeImposto := GetNodeImposto(ANodeDet, 'ICMS');
  if not Assigned(LNodeImposto) then
    Exit;

  AItem.imposto.ICMS.CST := GetNodeStr(LNodeImposto, 'CST');
  AItem.imposto.ICMS.CSOSN := GetNodeStr(LNodeImposto, 'CSOSN');
  AItem.imposto.ICMS.orig := GetNodeStr(LNodeImposto, 'Orig');
  AItem.imposto.ICMS.pICMS := GetNodeCurrency(LNodeImposto, 'pICMS');
  AItem.imposto.ICMS.vICMS := GetNodeCurrency(LNodeImposto, 'vICMS');
end;

procedure TGBFRSATXMLDefault.LoadTagImpostoISSQN(ANodeDet: IXMLNode; AItem: TGBFRSATModelDetalhe);
var
  LNodeImposto: IXMLNode;
begin
  LNodeImposto := GetNodeImposto(ANodeDet, 'ISSQN');
  if not Assigned(LNodeImposto) then
    Exit;

  AItem.imposto.ISSQN.vDeducISSQN := GetNodeCurrency(LNodeImposto, 'vDeducISSQN');
  AItem.imposto.ISSQN.vBC := GetNodeCurrency(LNodeImposto, 'vBC');
  AItem.imposto.ISSQN.vAliq := GetNodeCurrency(LNodeImposto, 'vAliq');
  AItem.imposto.ISSQN.vISSQN := GetNodeCurrency(LNodeImposto, 'vISSQN');
  AItem.imposto.ISSQN.cMunFG := GetNodeInt(LNodeImposto, 'cMunFG');
  AItem.imposto.ISSQN.cListServ := GetNodeStr(LNodeImposto, 'cListServ');
  AItem.imposto.ISSQN.cServTribMun := GetNodeStr(LNodeImposto, 'cServTribMun');
  AItem.imposto.ISSQN.cNatOp := GetNodeStr(LNodeImposto, 'cNatOp');
  AItem.imposto.ISSQN.indIncFisc := GetNodeStr(LNodeImposto, 'indIncFisc') = '1';
end;


procedure TGBFRSATXMLDefault.LoadTagImpostoPIS(ANodeDet: IXMLNode; AItem: TGBFRSATModelDetalhe);
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
  AItem.imposto.PIS.qBCProd := GetNodeFloat(LNodeImposto, 'qBCProd');
  AItem.imposto.PIS.vAliqProd := GetNodeFloat(LNodeImposto, 'vAliqProd');
end;

procedure TGBFRSATXMLDefault.LoadTagImpostoPISST(ANodeDet: IXMLNode; AItem: TGBFRSATModelDetalhe);
var
  LNodeImposto: IXMLNode;
begin
  LNodeImposto := GetNodeImposto(ANodeDet, 'PISST');

  if not Assigned(LNodeImposto) then
    Exit;

  AItem.imposto.PISST.vBC := GetNodeCurrency(LNodeImposto, 'vBC');
  AItem.imposto.PISST.pPIS := GetNodeCurrency(LNodeImposto, 'pPIS');
  AItem.imposto.PISST.vPIS := GetNodeCurrency(LNodeImposto, 'vPIS');
  AItem.imposto.PISST.qBCProd := GetNodeCurrency(LNodeImposto, 'qBCProd');
  AItem.imposto.PISST.vAliqProd := GetNodeCurrency(LNodeImposto, 'vAliqProd');
end;

procedure TGBFRSATXMLDefault.LoadTagInfAdic;
var
  LNodeInfAdic: IXMLNode;
begin
  LNodeInfAdic := FInfCFe.ChildNodes.FindNode('infAdic');
  if not Assigned(LNodeInfAdic) then
    Exit;

  FCFe.infCFe.infAdic.obsFisco := GetNodeStr(LNodeInfAdic, 'obsFisco');
  FCFe.infCFe.infAdic.infCpl := GetNodeStr(LNodeInfAdic, 'infCpl');
end;

procedure TGBFRSATXMLDefault.LoadTagInfCFe;
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
  until (LNode = nil) or (LNode.NodeName = 'infCFe');

  if (not Assigned(LNode)) or (not LNode.NodeName.Equals( 'infCFe' )) then
    raise Exception.CreateFmt('Error on read Tag infCFe', []);

  FInfCFe := LNode;

  FCFe.infCFe.Id := FInfCFe.Attributes['Id'];
  FCFe.infCFe.versao := FInfCFe.Attributes['versao'];
  FCFe.infCFe.versaoDadosEnt := FInfCFe.Attributes['versaoDadosEnt'];
  FCFe.infCFe.versaoSB := FInfCFe.Attributes['versaoSB'];
end;

procedure TGBFRSATXMLDefault.LoadTagPag;
var
  LPagamento: TGBFRSATModelMeioPagamento;
  LNodePag: IXMLNode;
  LNodeMeioPag: IXMLNode;
begin
  LNodePag := FInfCFe.ChildNodes.FindNode('pgto');
  if not Assigned(LNodePag) then
    Exit;

  FCFe.infCFe.pgto.vTroco := GetNodeCurrency(LNodePag, 'vTroco');
  LNodeMeioPag := LNodePag.ChildNodes.FindNode('MP');
  if not Assigned(LNodeMeioPag) then
    Exit;

  repeat
    LPagamento := TGBFRSATModelMeioPagamento.Create;
    try
      LPagamento.cMP.FromString(GetNodeStr(LNodeMeioPag, 'cMP', '99'));
      LPagamento.vMP := GetNodeFloat(LNodeMeioPag, 'vMP');
      LPagamento.cAdmC := GetNodeStr(LNodeMeioPag, 'cAdmC');
      FCFe.infCFe.pgto.MP.Add(LPagamento);
    except
      LPagamento.Free;
      raise;
    end;

    LNodeMeioPag := LNodeMeioPag.NextSibling;
  until (LNodeMeioPag = nil) or (LNodeMeioPag.ChildNodes.FindNode('vMP') = nil);
end;

procedure TGBFRSATXMLDefault.LoadTagTotal;
var
  LNodeTotal: IXMLNode;
begin
  LNodeTotal := FInfCFe.ChildNodes.FindNode('total');
  if not Assigned(LNodeTotal) then
    Exit;

  FCFe.infCFe.total.vCFe := GetNodeFloat(LNodeTotal, 'vCFe');
  FCFe.infCFe.total.vCFeLei12741 := GetNodeFloat(LNodeTotal, 'vCFeLei12741');
  LoadTagTotalICMSTot(LNodeTotal);
  LoadTagTotalISSQNTot(LNodeTotal);
end;

procedure TGBFRSATXMLDefault.LoadTagTotalICMSTot(ANodeTotal: IXMLNode);
var
  LNodeICMSTot: IXMLNode;
begin
  LNodeICMSTot := ANodeTotal.ChildNodes.FindNode('ICMSTot');
  if not Assigned(LNodeICMSTot) then
    Exit;

  FCFe.infCFe.total.ICMSTot.vICMS := GetNodeCurrency(LNodeICMSTot, 'vICMS');
  FCFe.infCFe.total.ICMSTot.vProd := GetNodeCurrency(LNodeICMSTot, 'vProd');
  FCFe.infCFe.total.ICMSTot.vDesc := GetNodeCurrency(LNodeICMSTot, 'vDesc');
  FCFe.infCFe.total.ICMSTot.vPIS := GetNodeCurrency(LNodeICMSTot, 'vPIS');
  FCFe.infCFe.total.ICMSTot.vCOFINS := GetNodeCurrency(LNodeICMSTot, 'vCOFINS');
  FCFe.infCFe.total.ICMSTot.vPISST := GetNodeCurrency(LNodeICMSTot, 'vPISST');
  FCFe.infCFe.total.ICMSTot.vCOFINSST := GetNodeCurrency(LNodeICMSTot, 'vCOFINSST');
  FCFe.infCFe.total.ICMSTot.vOutro := GetNodeCurrency(LNodeICMSTot, 'vOutro');
end;

procedure TGBFRSATXMLDefault.LoadTagTotalISSQNTot(ANodeTotal: IXMLNode);
var
  LNodeISSQNTot: IXMLNode;
begin
  LNodeISSQNTot := ANodeTotal.ChildNodes.FindNode('ISSQNtot');
  if not Assigned(LNodeISSQNTot) then
    Exit;

  FCFe.infCFe.total.ISSQNtot.vBC := GetNodeCurrency(LNodeISSQNTot, 'vBC');
  FCFe.infCFe.total.ISSQNtot.vISS := GetNodeCurrency(LNodeISSQNTot, 'vISS');
  FCFe.infCFe.total.ISSQNtot.vPIS := GetNodeCurrency(LNodeISSQNTot, 'vPIS');
  FCFe.infCFe.total.ISSQNtot.vCOFINS := GetNodeCurrency(LNodeISSQNTot, 'vCOFINS');
  FCFe.infCFe.total.ISSQNtot.vPISST := GetNodeCurrency(LNodeISSQNTot, 'vPISST');
  FCFe.infCFe.total.ISSQNtot.vCOFINSST := GetNodeCurrency(LNodeISSQNTot, 'vCOFINSST');
end;

class function TGBFRSATXMLDefault.New: IGBFRSATXML;
begin
  Result := Self.Create;
end;

end.
