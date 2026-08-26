unit GBFR.NFeAvulsa.XML.Default;

interface

{$IFDEF WEAKPACKAGEUNIT}
  {$WEAKPACKAGEUNIT ON}
{$ENDIF}

uses
  System.Classes,
  Xml.XMLIntf,
  Xml.XMLDoc,
  GBFR.XML.Base,
  GBFR.NFeAvulsa.Classes,
  GBFR.NFeAvulsa.XML.Interfaces;

type
  TGBFRNFeAvulsaXMLDefault = class(TGBFRXmlBase, IGBFRNFeAvulsaXML)
  private
    FModel: TGBFRNFeAvulsaNFeProc;
    FNFeProc: IXMLNode;
    FInfNFe: IXMLNode;

    procedure LoadTagProtNFe;
    procedure LoadTagNFeProc;
    procedure LoadTagInfNFe;
    procedure LoadTagAvulsa;
    procedure LoadTagIde;
    procedure LoadTagEmit;
    procedure LoadTagDest;
    procedure LoadTagDetItem;
    procedure LoadTagImpostoICMS(const ANodeImposto: IXMLNode; const AItem: TGBFRNFeAvulsaDetItem);
    procedure LoadTagImpostoIPI(const ANodeImposto: IXMLNode; const AItem: TGBFRNFeAvulsaDetItem);
    procedure LoadTagImpostoPIS(const ANodeImposto: IXMLNode; const AItem: TGBFRNFeAvulsaDetItem);
    procedure LoadTagImpostoCOFINS(const ANodeImposto: IXMLNode; const AItem: TGBFRNFeAvulsaDetItem);
    procedure LoadTagTotal;
    procedure LoadTagPag;
    procedure LoadTagTransp;
  protected
    function LoadFromContent(const AValue: WideString): TGBFRNFeAvulsaNFeProc; overload;
    function LoadFromContent(const AValue: TStream): TGBFRNFeAvulsaNFeProc; overload;
    function LoadFromFile(const AFileName: string): TGBFRNFeAvulsaNFeProc;
  public
    class function New: IGBFRNFeAvulsaXML;
  end;

implementation

uses
  System.SysUtils;

{ TGBFRNFeAvulsaXMLDefault }

function TGBFRNFeAvulsaXMLDefault.LoadFromContent(const AValue: WideString): TGBFRNFeAvulsaNFeProc;
begin
  LoadXmlContent(AValue);
  Result := TGBFRNFeAvulsaNFeProc.Create;
  try
    FModel := Result;
    LoadTagNFeProc;
    LoadTagProtNFe;
    LoadTagInfNFe;
    LoadTagAvulsa;
    LoadTagIde;
    LoadTagEmit;
    LoadTagDest;
    LoadTagDetItem;
    LoadTagTotal;
    LoadTagPag;
    LoadTagTransp;
  except
    Result.Free;
    raise;
  end;
end;

function TGBFRNFeAvulsaXMLDefault.LoadFromContent(const AValue: TStream): TGBFRNFeAvulsaNFeProc;
var
  LStringStream: TStringStream;
  LContent: string;
begin
  LStringStream := TStringStream.Create;
  try
    LStringStream.LoadFromStream(AValue);
    LContent := LStringStream.DataString;
    Result := LoadFromContent(LContent)
  finally
    LStringStream.Free;
  end;
end;

function TGBFRNFeAvulsaXMLDefault.LoadFromFile(const AFileName: string): TGBFRNFeAvulsaNFeProc;
var
  LXmlFile: TStrings;
begin
  LXmlFile := TStringList.Create;
  try
    LXmlFile.LoadFromFile(AFileName);
    Result := LoadFromContent(LXmlFile.Text);
  finally
    LXmlFile.Free;
  end;
end;

procedure TGBFRNFeAvulsaXMLDefault.LoadTagAvulsa;
var
  LNode: IXMLNode;
begin
  if Assigned(FInfNFe) then
  begin
    LNode := FInfNFe.ChildNodes.FindNode('avulsa');
    if Assigned(LNode) then
    begin
      FModel.NFe.InfNFe.Avulsa.Matr := GetNodeStr(LNode, 'matr');
      FModel.NFe.InfNFe.Avulsa.UF := GetNodeStr(LNode, 'UF');
      FModel.NFe.InfNFe.Avulsa.XAgente := GetNodeStr(LNode, 'xAgente');
      FModel.NFe.InfNFe.Avulsa.CNPJ := GetNodeStr(LNode, 'CNPJ');
      FModel.NFe.InfNFe.Avulsa.XOrgao := GetNodeStr(LNode, 'xOrgao');
      FModel.NFe.InfNFe.Avulsa.RepEmi := GetNodeStr(LNode, 'repEmi');
    end;
  end;
end;

procedure TGBFRNFeAvulsaXMLDefault.LoadTagDest;
var
  LNode: IXMLNode;
  LNodeEndereco: IXMLNode;
begin
  if not Assigned(FInfNFe) then
    Exit;
  LNode := FInfNFe.ChildNodes.FindNode('dest');
  if not Assigned(LNode) then
    Exit;
  FModel.NFe.InfNFe.Dest.XNome := GetNodeStr(LNode, 'xNome');
  FModel.NFe.InfNFe.Dest.CNPJ := GetNodeStr(LNode, 'CNPJ');
  FModel.NFe.InfNFe.Dest.IE := GetNodeStr(LNode, 'IE');
  FModel.NFe.InfNFe.Dest.IndIEDest := GetNodeInt(LNode, 'indIEDest');

  LNodeEndereco := LNode.ChildNodes.FindNode('enderDest');
  if Assigned(LNodeEndereco) then
  begin
    FModel.NFe.InfNFe.Dest.EnderDest.UF := GetNodeStr(LNodeEndereco, 'UF');
    FModel.NFe.InfNFe.Dest.EnderDest.XPais := GetNodeStr(LNodeEndereco, 'xPais');
    FModel.NFe.InfNFe.Dest.EnderDest.CPais := GetNodeInt(LNodeEndereco, 'cPais');
    FModel.NFe.InfNFe.Dest.EnderDest.XLgr := GetNodeStr(LNodeEndereco, 'xLgr');
    FModel.NFe.InfNFe.Dest.EnderDest.XMun := GetNodeStr(LNodeEndereco, 'xMun');
    FModel.NFe.InfNFe.Dest.EnderDest.Nro := GetNodeStr(LNodeEndereco, 'nro');
    FModel.NFe.InfNFe.Dest.EnderDest.CMun := GetNodeInt(LNodeEndereco, 'cMun');
    FModel.NFe.InfNFe.Dest.EnderDest.XBairro := GetNodeStr(LNodeEndereco, 'xBairro');
    FModel.NFe.InfNFe.Dest.EnderDest.CEP := GetNodeStr(LNodeEndereco, 'CEP');
  end;
end;

procedure TGBFRNFeAvulsaXMLDefault.LoadTagDetItem;
var
  LNodeDet: IXMLNode;
  LNodeProd: IXMLNode;
  LNodeImposto: IXMLNode;
  LItem: TGBFRNFeAvulsaDetItem;
begin
  if not Assigned(FInfNFe) then
    Exit;
  LNodeDet := FInfNFe.ChildNodes.FindNode('det');
  if not Assigned(LNodeDet) then
    Exit;
  repeat
    LNodeProd := LNodeDet.ChildNodes.FindNode('prod');
    if Assigned(LNodeProd) then
    begin
      LItem := TGBFRNFeAvulsaDetItem.Create;
      try
        LItem.NItem := GetNodeInt(LNodeDet, 'nItem');
        LItem.Prod.CEAN := GetNodeStr(LNodeProd, 'cEAN');
        LItem.Prod.CProd := GetNodeStr(LNodeProd, 'cProd');
        LItem.Prod.QCom := GetNodeFloat(LNodeProd, 'qCom');
        LItem.Prod.CEANTrib := GetNodeStr(LNodeProd, 'cEANTrib');
        LItem.Prod.VUnTrib := GetNodeFloat(LNodeProd, 'vUnTrib');
        LItem.Prod.QTrib := GetNodeFloat(LNodeProd, 'qTrib');
        LItem.Prod.VProd := GetNodeFloat(LNodeProd, 'vProd');
        LItem.Prod.XProd := GetNodeStr(LNodeProd, 'xProd');
        LItem.Prod.VUnCom := GetNodeFloat(LNodeProd, 'vUnCom');
        LItem.Prod.IndTot := GetNodeInt(LNodeProd, 'indTot');
        LItem.Prod.UTrib := GetNodeStr(LNodeProd, 'uTrib');
        LItem.Prod.NCM := GetNodeStr(LNodeProd, 'NCM');
        LItem.Prod.UCom := GetNodeStr(LNodeProd, 'uCom');
        LItem.Prod.CFOP := GetNodeStr(LNodeProd, 'CFOP');

        LNodeImposto := LNodeDet.ChildNodes.FindNode('imposto');
        if Assigned(LNodeImposto) then
        begin
          LoadTagImpostoICMS(LNodeImposto, LItem);
          LoadTagImpostoIPI(LNodeImposto, LItem);
          LoadTagImpostoPIS(LNodeImposto, LItem);
          LoadTagImpostoCOFINS(LNodeImposto, LItem);
        end;
      except
        LItem.Free;
        raise;
      end;
      FModel.NFe.InfNFe.Det.Add(LItem);
    end;
    LNodeDet := LNodeDet.NextSibling;
  until (LNodeDet = nil) or (LNodeProd = nil);
end;

procedure TGBFRNFeAvulsaXMLDefault.LoadTagEmit;
var
  LNode: IXMLNode;
  LNodeEndereco: IXMLNode;
begin
  if not Assigned(FInfNFe) then
    Exit;
  LNode := FInfNFe.ChildNodes.FindNode('emit');
  if not Assigned(LNode) then
    Exit;
  FModel.NFe.InfNFe.Emit.XNome := GetNodeStr(LNode, 'xNome');
  FModel.NFe.InfNFe.Emit.XFant := GetNodeStr(LNode, 'xFant');
  FModel.NFe.InfNFe.Emit.CNPJ := GetNodeStr(LNode, 'CNPJ');
  FModel.NFe.InfNFe.Emit.IE := GetNodeStr(LNode, 'IE');
  FModel.NFe.InfNFe.Emit.CRT := GetNodeInt(LNode, 'CRT');

  LNodeEndereco := LNode.ChildNodes.FindNode('enderEmit');
  if Assigned(LNodeEndereco) then
  begin
    FModel.NFe.InfNFe.Emit.EnderEmit.UF := GetNodeStr(LNodeEndereco, 'UF');
    FModel.NFe.InfNFe.Emit.EnderEmit.XPais := GetNodeStr(LNodeEndereco, 'xPais');
    FModel.NFe.InfNFe.Emit.EnderEmit.CPais := GetNodeInt(LNodeEndereco, 'cPais');
    FModel.NFe.InfNFe.Emit.EnderEmit.XLgr := GetNodeStr(LNodeEndereco, 'xLgr');
    FModel.NFe.InfNFe.Emit.EnderEmit.XMun := GetNodeStr(LNodeEndereco, 'xMun');
    FModel.NFe.InfNFe.Emit.EnderEmit.Nro := GetNodeStr(LNodeEndereco, 'nro');
    FModel.NFe.InfNFe.Emit.EnderEmit.CMun := GetNodeInt(LNodeEndereco, 'cMun');
    FModel.NFe.InfNFe.Emit.EnderEmit.XBairro := GetNodeStr(LNodeEndereco, 'xBairro');
    FModel.NFe.InfNFe.Emit.EnderEmit.CEP := GetNodeStr(LNodeEndereco, 'CEP');
  end;
end;

procedure TGBFRNFeAvulsaXMLDefault.LoadTagIde;
var
  LNode: IXMLNode;
begin
  if not Assigned(FInfNFe) then
    Exit;
  LNode := FInfNFe.ChildNodes.FindNode('ide');
  if not Assigned(LNode) then
    Exit;
  FModel.NFe.InfNFe.Ide.TpNF := GetNodeInt(LNode, 'tpNF');
  FModel.NFe.InfNFe.Ide.&Mod := GetNodeInt(LNode, 'mod');
  FModel.NFe.InfNFe.Ide.IndPres := GetNodeInt(LNode, 'indPres');
  FModel.NFe.InfNFe.Ide.TpImp := GetNodeInt(LNode, 'tpImp');
  FModel.NFe.InfNFe.Ide.NNF := GetNodeInt(LNode, 'nNF');
  FModel.NFe.InfNFe.Ide.CMunFG := GetNodeInt(LNode, 'cMunFG');
  FModel.NFe.InfNFe.Ide.ProcEmi := GetNodeInt(LNode, 'procEmi');
  FModel.NFe.InfNFe.Ide.FinNFe := GetNodeInt(LNode, 'finNFe');
  FModel.NFe.InfNFe.Ide.DhEmi := GetNodeDate(LNode, 'dhEmi');
  FModel.NFe.InfNFe.Ide.TpAmb := GetNodeInt(LNode, 'tpAmb');
  FModel.NFe.InfNFe.Ide.IndFinal := GetNodeInt(LNode, 'indFinal');
  FModel.NFe.InfNFe.Ide.IdDest := GetNodeInt(LNode, 'idDest');
  FModel.NFe.InfNFe.Ide.TpEmis := GetNodeInt(LNode, 'tpEmis');
  FModel.NFe.InfNFe.Ide.CDV := GetNodeInt(LNode, 'cDV');
  FModel.NFe.InfNFe.Ide.CUF := GetNodeInt(LNode, 'cUF');
  FModel.NFe.InfNFe.Ide.Serie := GetNodeStr(LNode, 'serie');
  FModel.NFe.InfNFe.Ide.NatOp := GetNodeStr(LNode, 'natOp');
  FModel.NFe.InfNFe.Ide.CNF := GetNodeStr(LNode, 'cNF');
  FModel.NFe.InfNFe.Ide.VerProc := GetNodeStr(LNode, 'verProc');
  FModel.NFe.InfNFe.Ide.IndIntermed := GetNodeStr(LNode, 'indIntermed');
end;

procedure TGBFRNFeAvulsaXMLDefault.LoadTagImpostoCOFINS(const ANodeImposto: IXMLNode;
  const AItem: TGBFRNFeAvulsaDetItem);
var
  LNodeCOFINS: IXMLNode;
  LNodeCst: IXMLNode;
begin
  LNodeCOFINS := ANodeImposto.ChildNodes.FindNode('COFINS');
  if not Assigned(LNodeCOFINS) then
    Exit;
  LNodeCst := LNodeCOFINS.ChildNodes.Get(0);
  if Assigned(LNodeCst) then
    AItem.Imposto.COFINS.CST := GetNodeStr(LNodeCst, 'CST');
end;

procedure TGBFRNFeAvulsaXMLDefault.LoadTagImpostoICMS(const ANodeImposto: IXMLNode;
  const AItem: TGBFRNFeAvulsaDetItem);
var
  LNodeICMS: IXMLNode;
  LNodeCst: IXMLNode;
begin
  LNodeICMS := ANodeImposto.ChildNodes.FindNode('ICMS');
  if not Assigned(LNodeICMS) then
    Exit;
  LNodeCst := LNodeICMS.ChildNodes.Get(0);
  if not Assigned(LNodeCst) then
    Exit;
  AItem.Imposto.ICMS.Orig := GetNodeStr(LNodeCst, 'orig');
  AItem.Imposto.ICMS.CSOSN := GetNodeStr(LNodeCst, 'CSOSN');
end;

procedure TGBFRNFeAvulsaXMLDefault.LoadTagImpostoIPI(const ANodeImposto: IXMLNode; const AItem: TGBFRNFeAvulsaDetItem);
var
  LNodeIPI: IXMLNode;
  LNodeCst: IXMLNode;
  I: Integer;
begin
  LNodeIPI := ANodeImposto.ChildNodes.FindNode('IPI');
  if not Assigned(LNodeIPI) then
    Exit;
  AItem.Imposto.IPI.CEnq := GetNodeStr(LNodeIPI, 'cEnq');
  for I := 0 to Pred(LNodeIPI.ChildNodes.Count) do
  begin
    LNodeCst := LNodeIPI.ChildNodes.Get(I);
    if LNodeCst.NodeName <> 'cEnq' then
    begin
      AItem.Imposto.IPI.CST := GetNodeStr(LNodeCst, 'CST');
      Break;
    end;
  end;
end;

procedure TGBFRNFeAvulsaXMLDefault.LoadTagImpostoPIS(const ANodeImposto: IXMLNode; const AItem: TGBFRNFeAvulsaDetItem);
var
  LNodePIS: IXMLNode;
  LNodeCst: IXMLNode;
begin
  LNodePIS := ANodeImposto.ChildNodes.FindNode('PIS');
  if not Assigned(LNodePIS) then
    Exit;
  LNodeCst := LNodePIS.ChildNodes.Get(0);
  if Assigned(LNodeCst) then
    AItem.Imposto.PIS.CST := GetNodeStr(LNodeCst, 'CST');
end;

procedure TGBFRNFeAvulsaXMLDefault.LoadTagInfNFe;
var
  LNFe: IXMLNode;
begin
  LNFe := FNFeProc.ChildNodes.FindNode('NFe');
  if Assigned(LNFe) then
  begin
    FInfNFe := LNFe.ChildNodes.FindNode('infNFe');
    FModel.NFe.InfNFe.Id := GetNodeStr(FInfNFe, 'Id');
  end;
end;

procedure TGBFRNFeAvulsaXMLDefault.LoadTagNFeProc;
begin
  FNFeProc := FXml.DocumentElement;
  FModel.Versao := GetNodeStr(FNFeProc, 'versao');
end;

procedure TGBFRNFeAvulsaXMLDefault.LoadTagProtNFe;
var
  LNode: IXMLNode;
begin
  LNode := FNFeProc.ChildNodes.Get(0);
  if Assigned(LNode) then
    LNode := LNode.ChildNodes.Get(0);
  if Assigned(LNode) then
  begin
    FModel.ProtNFe.InfProt.NProt := GetNodeStr(LNode, 'nProt');
    FModel.ProtNFe.InfProt.DigVal := GetNodeStr(LNode, 'digVal');
    FModel.ProtNFe.InfProt.DhRecbto := GetNodeDate(LNode, 'dhRecbto');
    FModel.ProtNFe.InfProt.ChNFe := GetNodeStr(LNode, 'chNFe');
    FModel.ProtNFe.InfProt.XMotivo := GetNodeStr(LNode, 'xMotivo');
    FModel.ProtNFe.InfProt.CStat := GetNodeInt(LNode, 'cStat');
  end;
end;

procedure TGBFRNFeAvulsaXMLDefault.LoadTagTotal;
var
  LNode: IXMLNode;
begin
  LNode := FInfNFe.ChildNodes.FindNode('total');
  if Assigned(LNode) then
    LNode := LNode.ChildNodes.FindNode('ICMSTot');
  if Assigned(LNode) then
  begin
    FModel.NFe.InfNFe.Total.ICMSTot.VCOFINS := GetNodeFloat(LNode, 'vCOFINS');
    FModel.NFe.InfNFe.Total.ICMSTot.VBCST := GetNodeFloat(LNode, 'vBCST');
    FModel.NFe.InfNFe.Total.ICMSTot.VICMSDeson := GetNodeFloat(LNode, 'vICMSDeson');
    FModel.NFe.InfNFe.Total.ICMSTot.VProd := GetNodeFloat(LNode, 'vProd');
    FModel.NFe.InfNFe.Total.ICMSTot.VSeg := GetNodeFloat(LNode, 'vSeg');
    FModel.NFe.InfNFe.Total.ICMSTot.VFCP := GetNodeFloat(LNode, 'vFCP');
    FModel.NFe.InfNFe.Total.ICMSTot.VFCPST := GetNodeFloat(LNode, 'vFCPST');
    FModel.NFe.InfNFe.Total.ICMSTot.VNF := GetNodeFloat(LNode, 'vNF');
    FModel.NFe.InfNFe.Total.ICMSTot.VTotTrib := GetNodeFloat(LNode, 'vTotTrib');
    FModel.NFe.InfNFe.Total.ICMSTot.VPIS := GetNodeFloat(LNode, 'vPIS');
    FModel.NFe.InfNFe.Total.ICMSTot.VIPIDevol := GetNodeFloat(LNode, 'vIPIDevol');
    FModel.NFe.InfNFe.Total.ICMSTot.VBC := GetNodeFloat(LNode, 'vBC');
    FModel.NFe.InfNFe.Total.ICMSTot.VST := GetNodeFloat(LNode, 'vST');
    FModel.NFe.InfNFe.Total.ICMSTot.VICMS := GetNodeFloat(LNode, 'vICMS');
    FModel.NFe.InfNFe.Total.ICMSTot.VII := GetNodeFloat(LNode, 'vII');
    FModel.NFe.InfNFe.Total.ICMSTot.VFCPSTRet := GetNodeFloat(LNode, 'vFCPSTRet');
    FModel.NFe.InfNFe.Total.ICMSTot.VDesc := GetNodeFloat(LNode, 'vDesc');
    FModel.NFe.InfNFe.Total.ICMSTot.VOutro := GetNodeFloat(LNode, 'vOutro');
    FModel.NFe.InfNFe.Total.ICMSTot.VIPI := GetNodeFloat(LNode, 'vIPI');
    FModel.NFe.InfNFe.Total.ICMSTot.VFrete := GetNodeFloat(LNode, 'vFrete');
  end;
end;

procedure TGBFRNFeAvulsaXMLDefault.LoadTagPag;
var
  LNodePag: IXMLNode;
  LNodeDetPag: IXMLNode;
  LPagamento: TGBFRNFeAvulsaDetPag;
  I: Integer;
begin
  if not Assigned(FInfNFe) then
    Exit;
  LNodePag := FInfNFe.ChildNodes.FindNode('pag');
  if not Assigned(LNodePag) then
    Exit;
  for I := 0 to Pred(LNodePag.ChildNodes.Count) do
  begin
    LNodeDetPag := LNodePag.ChildNodes.Get(I);
    if LNodeDetPag.NodeName <> 'detPag' then
      Continue;
    LPagamento := TGBFRNFeAvulsaDetPag.Create;
    LPagamento.VPag := GetNodeFloat(LNodeDetPag, 'vPag');
    LPagamento.TPag := GetNodeStr(LNodeDetPag, 'tPag');
    LPagamento.IndPag := GetNodeInt(LNodeDetPag, 'indPag');
    FModel.NFe.InfNFe.Pag.DetPag.Add(LPagamento);
  end;
end;

procedure TGBFRNFeAvulsaXMLDefault.LoadTagTransp;
var
  LNode: IXMLNode;
begin
  if not Assigned(FInfNFe) then
    Exit;
  LNode := FInfNFe.ChildNodes.FindNode('transp');
  if not Assigned(LNode) then
    Exit;
  FModel.NFe.InfNFe.Transp.ModFrete := GetNodeInt(LNode, 'modFrete');
end;

class function TGBFRNFeAvulsaXMLDefault.New: IGBFRNFeAvulsaXML;
begin
  Result := Self.Create;
end;

end.
