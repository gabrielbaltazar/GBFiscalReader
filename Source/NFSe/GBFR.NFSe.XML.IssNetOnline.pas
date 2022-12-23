unit GBFR.NFSe.XML.IssNetOnline;

interface

uses
  GBFR.NFSe.XML.IssNetOnline.Interfaces,
  GBFR.NFSe.Model.Types,
  GBFR.NFSe.Model.IssNetOnline,
  GBFR.XML.Base,
  GBFR.NFSe.XML.Interfaces,
  GBFR.NFSe.Model.Classes,
  System.Classes,
  System.SysUtils,
  Xml.XMLIntf,
  Xml.XMLDoc;

type
  TGBFRNFSeXMLIssNetOnline = class(TGBFRXmlBase, IGBFRNFSeXMLIssNetOnline, IGBFRNFSeXML)
  private
    [Weak]
    FNodeInfNfse: IXMLNode;
    FNFSe: TGBFRNFSeModelIssNetOnlineNFSe;
    FInfNFSe: TGBFRNFSeModelIssNetOnlineNFSeInfo;

    procedure LoadTagInfNFSe;
    procedure LoadTagTomador;
    procedure LoadTagPrestador;
    procedure LoadTagOrgaoGerador;
    procedure LoadTagServico;
  protected
    function LoadFromContent(AValue: string): TGBFRNFSeModelIssNetOnlineNFSe;
    function LoadFromFile(AValue: string): TGBFRNFSeModelIssNetOnlineNFSe;
    function LoadFromStream(AValue: TStream): TGBFRNFSeModelIssNetOnlineNFSe;

    function LoadNFSeFromContent(AValue: string): TGBFRNFSeModel;
    function LoadNFSeFromFile(AValue: string): TGBFRNFSeModel;
    function LoadNFSeFromStream(AValue: TStream): TGBFRNFSeModel;
  public
    class function New: IGBFRNFSeXMLIssNetOnline;
    class function NewNFSe: IGBFRNFSeXML;
  end;

implementation

{ TGBFRNFSeXMLIssNetOnline }

function TGBFRNFSeXMLIssNetOnline.LoadFromContent(AValue: string): TGBFRNFSeModelIssNetOnlineNFSe;
begin
  LoadXmlContent(AValue);
  Result := TGBFRNFSeModelIssNetOnlineNFSe.Create;
  try
    FNFSe := Result;
    FInfNFSe := Result.InfNfse;

    LoadTagInfNFSe;
    LoadTagTomador;
    LoadTagPrestador;
    LoadTagOrgaoGerador;
    LoadTagServico;
  except
    Result.Free;
    raise;
  end;
end;

function TGBFRNFSeXMLIssNetOnline.LoadFromFile(AValue: string): TGBFRNFSeModelIssNetOnlineNFSe;
var
  LXmlFile: TStrings;
begin
  LXmlFile := TStringList.Create;
  try
    try
      LXmlFile.LoadFromFile(AValue, TEncoding.UTF8);
    except
      LXmlFile.LoadFromFile(AValue);
    end;
    Result := LoadFromContent(LXmlFile.Text);
  finally
    LXmlFile.Free;
  end;
end;

function TGBFRNFSeXMLIssNetOnline.LoadFromStream(AValue: TStream): TGBFRNFSeModelIssNetOnlineNFSe;
var
  LStringStream: TStringStream;
  LContent: string;
begin
  LStringStream := TStringStream.Create('', TEncoding.UTF8);
  try
    LStringStream.LoadFromStream(AValue);
    LContent := LStringStream.DataString.Replace('﻿', '');
    Result := LoadFromContent(LContent)
  finally
    LStringStream.Free;
  end;
end;

function TGBFRNFSeXMLIssNetOnline.LoadNFSeFromContent(AValue: string): TGBFRNFSeModel;
var
  LIssNetOnline: TGBFRNFSeModelIssNetOnlineNFSe;
begin
  LIssNetOnline := LoadFromContent(AValue);
  try
    Result := LIssNetOnline.ToModelNFSe;
  finally
    LIssNetOnline.Free;
  end;
end;

function TGBFRNFSeXMLIssNetOnline.LoadNFSeFromFile(AValue: string): TGBFRNFSeModel;
var
  LIssNetOnline: TGBFRNFSeModelIssNetOnlineNFSe;
begin
  LIssNetOnline := LoadFromFile(AValue);
  try
    Result := LIssNetOnline.ToModelNFSe;
  finally
    LIssNetOnline.Free;
  end;
end;

function TGBFRNFSeXMLIssNetOnline.LoadNFSeFromStream(AValue: TStream): TGBFRNFSeModel;
var
  LIssNetOnline: TGBFRNFSeModelIssNetOnlineNFSe;
begin
  LIssNetOnline := LoadFromStream(AValue);
  try
    Result := LIssNetOnline.ToModelNFSe;
  finally
    LIssNetOnline.Free;
  end;
end;

procedure TGBFRNFSeXMLIssNetOnline.LoadTagInfNFSe;
var
  LNode: IXMLNode;
  LCompetencia: string;
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
  until (LNode = nil) or (LNode.NodeName = 'tc:Nfse');

  if (not Assigned(LNode)) or (not LNode.NodeName.Equals( 'tc:Nfse' )) then
    raise Exception.CreateFmt('Error on read Tag tc:Nfse', []);

  FNodeInfNfse := LNode.ChildNodes.FindNode('tc:InfNfse');
  if not Assigned(FNodeInfNfse) then
    raise Exception.CreateFmt('Error on read Tag tc:InfNfse', []);

  FInfNFSe.Numero := GetNodeStr(FNodeInfNfse, 'tc:Numero');
  FInfNFSe.CodigoVerificacao := GetNodeStr(FNodeInfNfse, 'tc:CodigoVerificacao');
  FInfNFSe.DataEmissao := GetNodeDate(FNodeInfNfse, 'tc:DataEmissao');
  FInfNFSe.NaturezaOperacao.FromString(GetNodeStr(FNodeInfNfse, 'NaturezaOperacao'));
  FInfNFSe.RegimeEspecialTributacao.FromString(GetNodeStr(FNodeInfNfse, 'RegimeEspecialTributacao'));
  FInfNFSe.OptanteSimplesNacional := GetNodeStr(FNodeInfNfse, 'tc:OptanteSimplesNacional') = '1';
  FInfNFSe.IncentivadorCultural := GetNodeStr(FNodeInfNfse, 'tc:IncentivadorCultural') = '1';
  FInfNFSe.OutrasInformacoes := GetNodeStr(FNodeInfNfse, 'tc:OutrasInformacoes');
  FInfNFSe.ValorCredito := GetNodeCurrency(FNodeInfNfse, 'tc:ValorCredito');

  LCompetencia := GetNodeStr(FNodeInfNfse, 'tc:Competencia');
  if LCompetencia <> EmptyStr then
  begin
    LCompetencia := Copy(LCompetencia, 1, 4) + '-' + Copy(LCompetencia, 5, 2) + '-01';
    FInfNFSe.Competencia := Iso8601ToDateTime(LCompetencia);
  end;
end;

procedure TGBFRNFSeXMLIssNetOnline.LoadTagOrgaoGerador;
var
  LNode: IXMLNode;
begin
  LNode := FNodeInfNfse.ChildNodes.FindNode('tc:OrgaoGerador');
  if not Assigned(LNode) then
    Exit;

  FInfNFSe.OrgaoGerador.CodigoMunicipio := GetNodeStr(LNode, 'tc:CodigoMunicipio');
  FInfNFSe.OrgaoGerador.UF := GetNodeStr(LNode, 'tc:Uf');
end;

procedure TGBFRNFSeXMLIssNetOnline.LoadTagPrestador;
var
  LNodePrestador: IXMLNode;
  LNodeAux: IXMLNode;
begin
  LNodePrestador := FNodeInfNfse.ChildNodes.FindNode('tc:PrestadorServico');
  if not Assigned(LNodePrestador) then
    Exit;
  FInfNFSe.PrestadorServico.RazaoSocial := GetNodeStr(LNodePrestador, 'tc:RazaoSocial');
  FInfNFSe.PrestadorServico.NomeFantasia := GetNodeStr(LNodePrestador, 'tc:NomeFantasia');

  LNodeAux := LoadTag(LNodePrestador, 'tc:IdentificacaoPrestador,tc:CpfCnpj');
  if Assigned(LNodeAux) then
  begin
    FInfNFSe.PrestadorServico.IdentificacaoPrestador.CpfCnpj.Cnpj := GetNodeStr(LNodeAux, 'tc:Cnpj');
    FInfNFSe.PrestadorServico.IdentificacaoPrestador.CpfCnpj.Cpf := GetNodeStr(LNodeAux, 'tc:Cpf');
  end;

  LNodeAux := LNodePrestador.ChildNodes.FindNode('tc:IdentificacaoPrestador');
  if Assigned(LNodeAux) then
    FInfNFSe.PrestadorServico.IdentificacaoPrestador.InscricaoMunicipal := GetNodeStr(LNodeAux, 'tc:InscricaoMunicipal');

  LNodeAux := LNodePrestador.ChildNodes.FindNode('tc:Endereco');
  if Assigned(LNodeAux) then
  begin
    FInfNFSe.PrestadorServico.Endereco.Endereco := GetNodeStr(LNodeAux, 'tc:Endereco');
    FInfNFSe.PrestadorServico.Endereco.Numero := GetNodeStr(LNodeAux, 'tc:Numero');
    FInfNFSe.PrestadorServico.Endereco.Complemento := GetNodeStr(LNodeAux, 'tc:Complemento');
    FInfNFSe.PrestadorServico.Endereco.Bairro := GetNodeStr(LNodeAux, 'tc:Bairro');
    FInfNFSe.PrestadorServico.Endereco.Cidade := GetNodeStr(LNodeAux, 'tc:Cidade');
    FInfNFSe.PrestadorServico.Endereco.Estado := GetNodeStr(LNodeAux, 'tc:Estado');
    FInfNFSe.PrestadorServico.Endereco.CEP := GetNodeStr(LNodeAux, 'tc:Cep');
  end;

  LNodeAux := LNodePrestador.ChildNodes.FindNode('tc:Contato');
  if Assigned(LNodeAux) then
  begin
    FInfNFSe.PrestadorServico.Contato.Telefone := GetNodeStr(LNodeAux, 'tc:Telefone');
    FInfNFSe.PrestadorServico.Contato.Email := GetNodeStr(LNodeAux, 'tc:Email');
  end;
end;

procedure TGBFRNFSeXMLIssNetOnline.LoadTagServico;
var
  LNode: IXMLNode;
begin
  LNode := FNodeInfNfse.ChildNodes.FindNode('tc:Servico');
  if not Assigned(LNode) then
    Exit;

  FInfNFSe.Servico.ItemListaServico := GetNodeStr(LNode, 'tc:ItemListaServico');
  FInfNFSe.Servico.CodigoCnae := GetNodeStr(LNode, 'tc:CodigoCnae');
  FInfNFSe.Servico.CodigoTributacaoMunicipio := GetNodeStr(LNode, 'tc:CodigoTributacaoMunicipio');
  FInfNFSe.Servico.Discriminacao := GetNodeStr(LNode, 'tc:Discriminacao');
  FInfNFSe.Servico.MunicipioPrestacaoServico := GetNodeStr(LNode, 'tc:MunicipioPrestacaoServico');

  LNode := LNode.ChildNodes.FindNode('tc:Valores');
  if not Assigned(LNode) then
    Exit;

  FInfNFSe.Servico.Valores.ValorServicos := GetNodeCurrency(LNode, 'tc:ValorServicos');
  FInfNFSe.Servico.Valores.ValorDeducoes := GetNodeCurrency(LNode, 'tc:ValorDeducoes');
  FInfNFSe.Servico.Valores.ValorPis := GetNodeCurrency(LNode, 'tc:ValorPis');
  FInfNFSe.Servico.Valores.ValorCofins := GetNodeCurrency(LNode, 'tc:ValorCofins');
  FInfNFSe.Servico.Valores.ValorInss := GetNodeCurrency(LNode, 'tc:ValorInss');
  FInfNFSe.Servico.Valores.ValorIr := GetNodeCurrency(LNode, 'tc:ValorIr');
  FInfNFSe.Servico.Valores.ValorCsll := GetNodeCurrency(LNode, 'tc:ValorCsll');
  FInfNFSe.Servico.Valores.OutrasRetencoes := GetNodeCurrency(LNode, 'tc:OutrasRetencoes');
  FInfNFSe.Servico.Valores.BaseCalculo := GetNodeCurrency(LNode, 'tc:BaseCalculo');
  FInfNFSe.Servico.Valores.Aliquota := GetNodeCurrency(LNode, 'tc:Aliquota');
  FInfNFSe.Servico.Valores.ValorLiquidoNfse := GetNodeCurrency(LNode, 'tc:ValorLiquidoNfse');
  FInfNFSe.Servico.Valores.ValorIssRetido := GetNodeCurrency(LNode, 'tc:ValorIssRetido');
  FInfNFSe.Servico.Valores.ValorIss := GetNodeCurrency(LNode, 'tc:ValorIss');
  FInfNFSe.Servico.Valores.DescontoCondicionado := GetNodeCurrency(LNode, 'tc:DescontoCondicionado');
  FInfNFSe.Servico.Valores.DescontoIncondicionado := GetNodeCurrency(LNode, 'tc:DescontoIncondicionado');
  FInfNFSe.Servico.Valores.IssRetido := GetNodeStr(LNode, 'IssRetido') = '1';
end;

procedure TGBFRNFSeXMLIssNetOnline.LoadTagTomador;
var
  LNodeTomador: IXMLNode;
  LNodeAux: IXMLNode;
begin
  LNodeTomador := FNodeInfNfse.ChildNodes.FindNode('tc:TomadorServico');
  if not Assigned(LNodeTomador) then
    Exit;
  FInfNFSe.TomadorServico.RazaoSocial := GetNodeStr(LNodeTomador, 'tc:RazaoSocial');

  LNodeAux := LoadTag(LNodeTomador, 'tc:IdentificacaoTomador,tc:CpfCnpj');
  if Assigned(LNodeAux) then
  begin
    FInfNFSe.TomadorServico.IdentificacaoTomador.CpfCnpj.Cnpj := GetNodeStr(LNodeAux, 'tc:Cnpj');
    FInfNFSe.TomadorServico.IdentificacaoTomador.CpfCnpj.Cpf := GetNodeStr(LNodeAux, 'tc:Cpf');
  end;

  LNodeAux := LNodeTomador.ChildNodes.FindNode('tc:IdentificacaoTomador');
  if Assigned(LNodeAux) then
    FInfNFSe.TomadorServico.IdentificacaoTomador.InscricaoMunicipal := GetNodeStr(LNodeAux, 'tc:InscricaoMunicipal');

  LNodeAux := LNodeTomador.ChildNodes.FindNode('tc:Endereco');
  if Assigned(LNodeAux) then
  begin
    FInfNFSe.TomadorServico.Endereco.Endereco := GetNodeStr(LNodeAux, 'tc:Endereco');
    FInfNFSe.TomadorServico.Endereco.Numero := GetNodeStr(LNodeAux, 'tc:Numero');
    FInfNFSe.TomadorServico.Endereco.Complemento := GetNodeStr(LNodeAux, 'tc:Complemento');
    FInfNFSe.TomadorServico.Endereco.Bairro := GetNodeStr(LNodeAux, 'tc:Bairro');
    FInfNFSe.TomadorServico.Endereco.Cidade := GetNodeStr(LNodeAux, 'tc:Cidade');
    FInfNFSe.TomadorServico.Endereco.Estado := GetNodeStr(LNodeAux, 'tc:Estado');
    FInfNFSe.TomadorServico.Endereco.CEP := GetNodeStr(LNodeAux, 'tc:Cep');
  end;

  LNodeAux := LNodeTomador.ChildNodes.FindNode('tc:Contato');
  if Assigned(LNodeAux) then
  begin
    FInfNFSe.TomadorServico.Contato.Telefone := GetNodeStr(LNodeAux, 'tc:Telefone');
    FInfNFSe.TomadorServico.Contato.Email := GetNodeStr(LNodeAux, 'tc:Email');
  end;
end;

class function TGBFRNFSeXMLIssNetOnline.New: IGBFRNFSeXMLIssNetOnline;
begin
  Result := Self.Create;
end;

class function TGBFRNFSeXMLIssNetOnline.NewNFSe: IGBFRNFSeXML;
begin
  Result := Self.Create;
end;

end.
