unit GBFR.NFe.XML.Default;

interface

uses
  GBFR.XML.Base,
  GBFR.NFe.XML.Interfaces,
  GBFR.NFe.Model.Types,
  GBFR.NFe.Model.Item,
  GBFR.NFe.Model.Imposto.ICMS,
  GBFR.NFe.Model.Imposto.PIS,
  GBFR.NFe.Model.Imposto.COFINS,
  GBFR.NFe.Model.NotaFiscal,
  GBFR.NFe.Model.FormaPagamento,
  System.SysUtils,
  Xml.XMLIntf,
  Xml.XMLDoc;

type TGBFRNFeXMLDefault = class(TGBFRXmlBase, IGBFRNFeXML)

  private
    FNota: TGBRFNFeModelNotaFiscal;
    [Weak]
    FInfNFe: IXMLNode;

    procedure loadNotaFiscal;
    procedure loadEmitente;
    procedure loadDestinatario;
    procedure loadPagamentos;
    procedure loadTotals;
    procedure loadInfoAdicionais;
    procedure loadProtNFe;

  protected
    function loadFromContent(Value: String): TGBRFNFeModelNotaFiscal;
end;

implementation

{ TGBFRNFeXMLDefault }

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

procedure TGBFRNFeXMLDefault.loadInfoAdicionais;
var
  nodeInfAdic: IXMLNode;
begin
  nodeInfAdic := FInfNFe.ChildNodes.FindNode('infAdic');
  if not Assigned(nodeInfAdic) then
    Exit;

  FNota.infCpl := GetNodeStr(nodeInfAdic, 'infCpl');
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

function TGBFRNFeXMLDefault.loadFromContent(Value: String): TGBRFNFeModelNotaFiscal;
begin
  loadXmlContent(Value);

  result := TGBRFNFeModelNotaFiscal.create;
  try
    loadNotaFiscal;
    loadEmitente;
    loadDestinatario;
    loadInfoAdicionais;
    loadTotals;
    loadPagamentos;
    loadProtNFe;
  except
    Result.Free;
    raise;
  end;
end;

end.
