unit GBFR.NFSe.XML.Abrasf204;

interface

uses
  GBFR.NFSe.XML.Abrasf204.Interfaces,
  GBFR.NFSe.Model.Types,
  GBFR.NFSe.Model.Abrasf204,
  GBFR.XML.Base,
  GBFR.NFSe.XML.Interfaces,
  GBFR.NFSe.Model.Classes,
  System.Classes,
  System.SysUtils,
  Xml.XMLIntf,
  Xml.XMLDoc;

type
  TGBFRNFSeXMLAbrasf204 = class(TGBFRXmlBase, IGBFRNFSeXMLAbrasf204, IGBFRNFSeXML)
  private
    [Weak]
    FNodeInfNfse: IXMLNode;
    FNFSe: TGBFRNFSeModelAbrasf204NFSe;
    FInfNFSe: TGBFRNFSeModelAbrasf204NFSeInfo;

    procedure LoadTagInfNFSe;
    procedure LoadTagValoresNFSe;
    procedure LoadTagOrgaoGerador;
    procedure LoadTagPrestacaoServico;
    procedure LoadTagPrestador;
    procedure LoadTagServico;
    procedure LoadTagTomador;
  protected
    function LoadFromContent(AValue: string): TGBFRNFSeModelAbrasf204NFSe;
    function LoadFromFile(AValue: string): TGBFRNFSeModelAbrasf204NFSe;
    function LoadFromStream(AValue: TStream): TGBFRNFSeModelAbrasf204NFSe;

    function LoadNFSeFromContent(AValue: string): TGBFRNFSeModel;
    function LoadNFSeFromFile(AValue: string): TGBFRNFSeModel;
    function LoadNFSeFromStream(AValue: TStream): TGBFRNFSeModel;
  public
    class function New: IGBFRNFSeXMLAbrasf204;
    class function NewNFSe: IGBFRNFSeXML;
  end;

implementation

{ TGBFRNFSeXMLAbrasf204 }

function TGBFRNFSeXMLAbrasf204.LoadFromContent(AValue: string): TGBFRNFSeModelAbrasf204NFSe;
begin
  LoadXmlContent(AValue);
  Result := TGBFRNFSeModelAbrasf204NFSe.Create;
  try
    FNFSe := Result;
    FInfNFSe := Result.InfNfse;

    LoadTagInfNFSe;
    LoadTagValoresNFSe;
    LoadTagOrgaoGerador;
    LoadTagServico;
    LoadTagPrestador;
    LoadTagTomador;
    LoadTagPrestacaoServico;
  except
    Result.Free;
    raise;
  end;
end;

function TGBFRNFSeXMLAbrasf204.LoadFromFile(AValue: string): TGBFRNFSeModelAbrasf204NFSe;
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

function TGBFRNFSeXMLAbrasf204.LoadFromStream(AValue: TStream): TGBFRNFSeModelAbrasf204NFSe;
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

function TGBFRNFSeXMLAbrasf204.LoadNFSeFromContent(AValue: string): TGBFRNFSeModel;
var
  LAbrasf: TGBFRNFSeModelAbrasf204NFSe;
begin
  LAbrasf := LoadFromContent(AValue);
  try
    Result := LAbrasf.ToModelNFSe;
  finally
    LAbrasf.Free;
  end;
end;

function TGBFRNFSeXMLAbrasf204.LoadNFSeFromFile(AValue: string): TGBFRNFSeModel;
var
  LAbrasf: TGBFRNFSeModelAbrasf204NFSe;
begin
  LAbrasf := LoadFromFile(AValue);
  try
    Result := LAbrasf.ToModelNFSe;
  finally
    LAbrasf.Free;
  end;
end;

function TGBFRNFSeXMLAbrasf204.LoadNFSeFromStream(AValue: TStream): TGBFRNFSeModel;
var
  LAbrasf: TGBFRNFSeModelAbrasf204NFSe;
begin
  LAbrasf := LoadFromStream(AValue);
  try
    Result := LAbrasf.ToModelNFSe;
  finally
    LAbrasf.Free;
  end;
end;

procedure TGBFRNFSeXMLAbrasf204.LoadTagInfNFSe;
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
  until (LNode = nil) or (LNode.NodeName = 'Nfse');

  if (not Assigned(LNode)) or (not LNode.NodeName.Equals( 'Nfse' )) then
    raise Exception.CreateFmt('Error on read Tag Nfse', []);

  FNFSe.Versao := LNode.Attributes['versao'];
  FNodeInfNfse := LNode.ChildNodes.FindNode('InfNfse');
  if not Assigned(FNodeInfNfse) then
    raise Exception.CreateFmt('Error on read Tag InfNfse', []);

  FInfNFSe.Numero := GetNodeStr(FNodeInfNfse, 'Numero');
  FInfNFSe.CodigoVerificacao := GetNodeStr(FNodeInfNfse, 'CodigoVerificacao');
  FInfNFSe.DataEmissao := GetNodeDate(FNodeInfNfse, 'DataEmissao');
  FInfNFSe.OutrasInformacoes := GetNodeStr(FNodeInfNfse, 'OutrasInformacoes');
  FInfNFSe.DescricaoCodigoTributacaoMunicipio := GetNodeStr(FNodeInfNfse, 'DescricaoCodigoTributacaoMunicípio');
  FInfNFSe.ValorCredito := GetNodeCurrency(FNodeInfNfse, 'ValorCredito');
end;

procedure TGBFRNFSeXMLAbrasf204.LoadTagOrgaoGerador;
var
  LNode: IXMLNode;
begin
  LNode := FNodeInfNfse.ChildNodes.FindNode('OrgaoGerador');
  if not Assigned(LNode) then
    Exit;

  FInfNFSe.OrgaoGerador.CodigoMunicipio := GetNodeStr(LNode, 'CodigoMunicipio');
  FInfNFSe.OrgaoGerador.UF := GetNodeStr(LNode, 'Uf');
end;

procedure TGBFRNFSeXMLAbrasf204.LoadTagPrestacaoServico;
var
  LNode: IXMLNode;
  LNodeRPS: IXMLNode;
  LPrestacao: TGBFRNFSeModelAbrasf204InfPrestacaoServico;
begin
  LNode := LoadTag(FNodeInfNfse, 'DeclaracaoPrestacaoServico,InfDeclaracaoPrestacaoServico');
  if not Assigned(LNode) then
    Exit;

  LPrestacao := FInfNFSe.DeclaracaoPrestacaoServico.InfDeclaracaoPrestacaoServico;
  LPrestacao.Competencia := GetNodeDate(LNode, 'Competencia');
  LPrestacao.OptanteSimplesNacional := GetNodeStr(LNode, 'OptanteSimplesNacional') = '1';

  LNodeRPS := LNode.ChildNodes.FindNode('Rps');
  if Assigned(LNodeRPS) then
  begin
    LPrestacao.Rps.Numero := GetNodeStr(LNodeRPS, 'Numero');
    LPrestacao.Rps.Serie := GetNodeStr(LNodeRPS, 'Serie');
    LPrestacao.Rps.Tipo := GetNodeStr(LNodeRPS, 'Tipo');
    LPrestacao.Rps.DataEmissaoRps := GetNodeDate(LNodeRPS, 'DataEmissaoRps');
  end;

  LNodeRPS := LNode.ChildNodes.FindNode('RpsSubstituido');
  if Assigned(LNodeRPS) then
  begin
    LPrestacao.RpsSubstituido.Numero := GetNodeStr(LNodeRPS, 'Numero');
    LPrestacao.RpsSubstituido.Serie := GetNodeStr(LNodeRPS, 'Serie');
    LPrestacao.RpsSubstituido.Tipo := GetNodeInt(LNodeRPS, 'Tipo');
  end;
end;

procedure TGBFRNFSeXMLAbrasf204.LoadTagPrestador;
var
  LNode: IXMLNode;
  LNodeEndereco: IXMLNode;
  LNodeContato: IXMLNode;
begin
  LNode := FNodeInfNfse.ChildNodes.FindNode('PrestadorServico');
  if not Assigned(LNode) then
    Exit;

  FInfNFSe.PrestadorServico.RazaoSocial := GetNodeStr(LNode, 'RazaoSocial');
  FInfNFSe.PrestadorServico.NomeFantasia := GetNodeStr(LNode, 'NomeFantasia');

  LNodeEndereco := LNode.ChildNodes.FindNode('Endereco');
  if Assigned(LNodeEndereco) then
  begin
    FInfNFSe.PrestadorServico.Endereco.Endereco := GetNodeStr(LNodeEndereco, 'Endereco');
    FInfNFSe.PrestadorServico.Endereco.Numero := GetNodeStr(LNodeEndereco, 'Numero');
    FInfNFSe.PrestadorServico.Endereco.Complemento := GetNodeStr(LNodeEndereco, 'Complemento');
    FInfNFSe.PrestadorServico.Endereco.Bairro := GetNodeStr(LNodeEndereco, 'Bairro');
    FInfNFSe.PrestadorServico.Endereco.CodigoMunicipio := GetNodeStr(LNodeEndereco, 'CodigoMunicipio');
    FInfNFSe.PrestadorServico.Endereco.UF := GetNodeStr(LNodeEndereco, 'Uf');
    FInfNFSe.PrestadorServico.Endereco.CEP := GetNodeStr(LNodeEndereco, 'Cep');
  end;

  LNodeContato := LNode.ChildNodes.FindNode('Contato');
  if Assigned(LNodeContato) then
  begin
    FInfNFSe.PrestadorServico.Contato.Telefone := GetNodeStr(LNodeContato, 'Telefone');
    FInfNFSe.PrestadorServico.Contato.Email := GetNodeStr(LNodeContato, 'Email');
  end;

  LNode := LoadTag(FNodeInfNfse, 'DeclaracaoPrestacaoServico,' +
    'InfDeclaracaoPrestacaoServico,Prestador');
  if Assigned(LNode) then
  begin
    FInfNFSe.PrestadorServico.Identificacao.InscricaoMunicipal := GetNodeStr(LNode, 'InscricaoMunicipal');
    LNode := LNode.ChildNodes.FindNode('CpfCnpj');
    if Assigned(LNode) then
    begin
      FInfNFSe.PrestadorServico.Identificacao.CpfCnpj.Cnpj := GetNodeStr(LNode, 'Cnpj');
      FInfNFSe.PrestadorServico.Identificacao.CpfCnpj.Cpf := GetNodeStr(LNode, 'Cpf');
    end;
  end;
end;

procedure TGBFRNFSeXMLAbrasf204.LoadTagServico;
var
  LNode: IXMLNode;
  LServico: TGBFRNFSeModelAbrasf204Servico;
begin
  LNode := LoadTag(FNodeInfNfse, 'DeclaracaoPrestacaoServico,InfDeclaracaoPrestacaoServico,' +
    'Servico');
  if not Assigned(LNode) then
    Exit;

  LServico := FInfNFSe.DeclaracaoPrestacaoServico.InfDeclaracaoPrestacaoServico.Servico;
  LServico.IssRetido := GetNodeStr(LNode, 'IssRetido') = '1';
  LServico.ItemListaServico := GetNodeStr(LNode, 'ItemListaServico');
  LServico.CodigoCnae := GetNodeStr(LNode, 'CodigoCnae');
  LServico.CodigoTributacaoMunicipio := GetNodeStr(LNode, 'CodigoTributacaoMunicipio');
  LServico.CodigoNbs := GetNodeStr(LNode, 'CodigoNbs');
  LServico.Discriminacao := GetNodeStr(LNode, 'Discriminacao');
  LServico.CodigoMunicipio := GetNodeStr(LNode, 'CodigoMunicipio');
  LServico.CodigoPais := GetNodeStr(LNode, 'CodigoPais');
  LServico.MunicipioIncidencia := GetNodeStr(LNode, 'MunicipioIncidencia');
  LServico.ExigibilidadeISS.FromString(GetNodeStr(LNode, 'ExigibilidadeISS'));

  LNode := LNode.ChildNodes.FindNode('Valores');
  if not Assigned(LNode) then
    Exit;

  LServico.Valores.ValorServicos := GetNodeCurrency(LNode, 'ValorServicos');
  LServico.Valores.ValorDeducoes := GetNodeCurrency(LNode, 'ValorDeducoes');
  LServico.Valores.ValorPis := GetNodeCurrency(LNode, 'ValorPis');
  LServico.Valores.ValorCofins := GetNodeCurrency(LNode, 'ValorCofins');
  LServico.Valores.ValorInss := GetNodeCurrency(LNode, 'ValorInss');
  LServico.Valores.ValorIr := GetNodeCurrency(LNode, 'ValorIr');
  LServico.Valores.ValorCsll := GetNodeCurrency(LNode, 'ValorCsll');
  LServico.Valores.OutrasRetencoes := GetNodeCurrency(LNode, 'OutrasRetencoes');
  LServico.Valores.ValTotTributos := GetNodeCurrency(LNode, 'ValTotTributos');
  LServico.Valores.DescontoIncondicionado := GetNodeCurrency(LNode, 'DescontoIncondicionado');
  LServico.Valores.DescontoCondicionado := GetNodeCurrency(LNode, 'DescontoCondicionado');
end;

procedure TGBFRNFSeXMLAbrasf204.LoadTagTomador;
var
  LNodeTomador: IXMLNode;
  LNodeIdentTomador: IXMLNode;
  LNodeEndereco: IXMLNode;
  LNodeEnderecoExt: IXMLNode;
  LTomador: TGBFRNFSeModelAbrasf204Tomador;
begin
  LTomador := FInfNFSe.DeclaracaoPrestacaoServico.InfDeclaracaoPrestacaoServico
    .TomadorServico;
  LNodeTomador := LoadTag(FNodeInfNfse, 'DeclaracaoPrestacaoServico,' +
    'InfDeclaracaoPrestacaoServico,TomadorServico');
  if not Assigned(LNodeTomador) then
    Exit;

  LTomador.RazaoSocial := GetNodeStr(LNodeTomador, 'RazaoSocial');
  LNodeIdentTomador := LoadTag(LNodeTomador, 'IdentificacaoTomador');
  if Assigned(LNodeIdentTomador) then
  begin
    LTomador.IdentificacaoTomador.InscricaoMunicipal := GetNodeStr(LNodeIdentTomador, 'InscricaoMunicipal');
    LNodeIdentTomador := LNodeIdentTomador.ChildNodes.FindNode('CpfCnpj');
    if Assigned(LNodeIdentTomador) then
    begin
      LTomador.IdentificacaoTomador.CpfCnpj.Cnpj := GetNodeStr(LNodeIdentTomador, 'Cnpj');
      LTomador.IdentificacaoTomador.CpfCnpj.Cpf := GetNodeStr(LNodeIdentTomador, 'Cpf');
    end;
  end;

  LNodeEndereco := LNodeTomador.ChildNodes.FindNode('Endereco');
  if Assigned(LNodeEndereco) then
  begin
    LTomador.Endereco.Endereco := GetNodeStr(LNodeEndereco, 'Endereco');
    LTomador.Endereco.Numero := GetNodeStr(LNodeEndereco, 'Numero');
    LTomador.Endereco.Complemento := GetNodeStr(LNodeEndereco, 'Complemento');
    LTomador.Endereco.Bairro := GetNodeStr(LNodeEndereco, 'Bairro');
    LTomador.Endereco.CodigoMunicipio := GetNodeStr(LNodeEndereco, 'CodigoMunicipio');
    LTomador.Endereco.UF := GetNodeStr(LNodeEndereco, 'Uf');
    LTomador.Endereco.CEP := GetNodeStr(LNodeEndereco, 'Cep');
  end;

  LNodeEnderecoExt := LNodeTomador.ChildNodes.FindNode('EnderecoExterior');
  if Assigned(LNodeEnderecoExt) then
  begin
    LTomador.EnderecoExterior.CodigoPais := GetNodeStr(LNodeEnderecoExt, 'CodigoPais');
    LTomador.EnderecoExterior.EnderecoCompletoExterior := GetNodeStr(LNodeEnderecoExt, 'EnderecoCompletoExterior');
  end;
end;

procedure TGBFRNFSeXMLAbrasf204.LoadTagValoresNFSe;
var
  LNode: IXMLNode;
begin
  LNode := FNodeInfNfse.ChildNodes.FindNode('ValoresNfse');
  if not Assigned(LNode) then
    Exit;

  FInfNFSe.ValoresNfse.BaseCalculo := GetNodeCurrency(LNode, 'BaseCalculo');
  FInfNFSe.ValoresNfse.Aliquota := GetNodeCurrency(LNode, 'Aliquota');
  FInfNFSe.ValoresNfse.ValorIss := GetNodeCurrency(LNode, 'ValorIss');
  FInfNFSe.ValoresNfse.ValorLiquidoNfse := GetNodeCurrency(LNode, 'ValorLiquidoNfse');
end;

class function TGBFRNFSeXMLAbrasf204.New: IGBFRNFSeXMLAbrasf204;
begin
  Result := Self.Create;
end;

class function TGBFRNFSeXMLAbrasf204.NewNFSe: IGBFRNFSeXML;
begin
  Result := Self.Create;
end;

end.
