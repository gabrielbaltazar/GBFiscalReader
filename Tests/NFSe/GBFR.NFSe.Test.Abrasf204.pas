unit GBFR.NFSe.Test.Abrasf204;

interface

uses
  DUnitX.TestFramework,
  GBFR.NFSe.Test.Base,
  GBFR.NFSe.Model.Types,
  GBFR.NFSe.Model.Abrasf204,
  GBFR.NFSe.Model.Classes,
  GBFR.NFSe.XML.Abrasf204.Interfaces,
  GBFR.NFSe.XML.Abrasf204,
  Winapi.ActiveX,
  System.SysUtils,
  System.Classes;

type
  [TestFixture]
  TGBFRNFSeTestAbrasf204 = class(TGBFRNFSeTestBase)
  private
    FNFSe: TGBFRNFSeModelAbrasf204NFSe;
    FModel: TGBFRNFSeModel;
  public
    [Setup]
    procedure Setup;

    [Teardown]
    procedure Teardown;

    [Test]
    procedure InfNFSe;

    [Test]
    procedure ValoresNFSe;

    [Test]
    procedure PrestadorServico;

    [Test]
    procedure TomadorServico;

    [Test]
    procedure OrgaoGerador;

    [Test]
    procedure Servico;

    [Test]
    procedure ServicoValores;

    [Test]
    procedure InfDeclaracaoPrestacaoServico;

    [Test]
    procedure ModelPrestador;

    [Test]
    procedure ModelTomador;

    [Test]
    procedure ModelNFSe;

    [Test]
    procedure ModelNFSeServico;
  end;

implementation

{ TGBFRNFSeTestAbrasf204 }

procedure TGBFRNFSeTestAbrasf204.InfDeclaracaoPrestacaoServico;
var
  LDeclaracao: TGBFRNFSeModelAbrasf204InfPrestacaoServico;
begin
  LDeclaracao := FNFSe.InfNfse.DeclaracaoPrestacaoServico
    .InfDeclaracaoPrestacaoServico;

  Assert.AreEqual(TNFSeSituacao.sNormal, LDeclaracao.Rps.Situacao);
  Assert.AreEqual('2022-12-13', FormatDateTime('yyyy-MM-dd', LDeclaracao.Competencia));
  Assert.IsFalse(LDeclaracao.OptanteSimplesNacional);
end;

procedure TGBFRNFSeTestAbrasf204.InfNFSe;
begin
  Assert.AreEqual('2.04', FNFSe.Versao);
  Assert.AreEqual('96398', FNFSe.InfNfse.Numero);
  Assert.AreEqual('3CAC2A7E9', FNFSe.InfNfse.CodigoVerificacao);
  Assert.AreEqual('2022-12-13 13:11:22', FormatDateTime('yyyy-MM-dd hh:mm:ss', FNFSe.InfNfse.DataEmissao));
  Assert.AreEqual(' .', FNFSe.InfNfse.OutrasInformacoes);
  Assert.AreEqual('Hotel com Restaurante', FNFSe.InfNfse.DescricaoCodigoTributacaoMunicipio);
  Assert.AreEqual<Currency>(1, FNFSe.InfNfse.ValorCredito);
end;

procedure TGBFRNFSeTestAbrasf204.ModelNFSe;
begin
  Assert.AreEqual('Abrasf 2.04', FModel.Padrao);
  Assert.AreEqual('96398', FModel.Numero);
  Assert.AreEqual('', FModel.RPS);
  Assert.AreEqual('', FModel.Serie);
  Assert.AreEqual('', FModel.TipoRPS);
  Assert.AreEqual('3CAC2A7E9', FModel.CodigoVerificacao);
  Assert.AreEqual(TNFSeSituacao.sNormal, FModel.Situacao);
  Assert.AreEqual('DESPESAS COM HOSPEDAGEM CONFORME ABAIXO:', FModel.DiscriminacaoServicos);
  Assert.AreEqual('2022-12-13 13:11:22', FormatDateTime('yyyy-MM-dd hh:mm:ss', FModel.DataEmissao));
  Assert.AreEqual(' .', FModel.OutrasInformacoes);
  Assert.IsFalse(FModel.OptanteSimplesNacional);
  Assert.IsFalse(FModel.IncentivadorCultural);
  Assert.AreEqual(1, FModel.Servicos.Count);

  Assert.AreEqual<Currency>(1512, FModel.Valor);
  Assert.AreEqual<Currency>(1, FModel.ValorCredito);
  Assert.AreEqual<Currency>(1512, FModel.BaseCalculo);
  Assert.AreEqual<Currency>(45.36, FModel.ValorIss);
  Assert.AreEqual<Currency>(1512, FModel.ValorLiquido);
  Assert.AreEqual<Currency>(1, FModel.ValorDeducoes);
  Assert.AreEqual<Currency>(2, FModel.ValorPis);
  Assert.AreEqual<Currency>(4, FModel.ValorCofins);
  Assert.AreEqual<Currency>(3, FModel.ValorInss);
  Assert.AreEqual<Currency>(5, FModel.ValorIr);
  Assert.AreEqual<Currency>(6, FModel.ValorCsll);
  Assert.AreEqual<Currency>(7, FModel.OutrasRetencoes);
  Assert.AreEqual<Currency>(8, FModel.DescontoIncondicionado);
  Assert.AreEqual<Currency>(9, FModel.DescontoCondicionado);
  Assert.AreEqual<Currency>(0, FModel.ValorIssRetido);
  Assert.IsFalse(FModel.Servicos[0].IssRetido);
end;

procedure TGBFRNFSeTestAbrasf204.ModelNFSeServico;
begin
  Assert.AreEqual('09.01', FModel.Servicos[0].ItemListaServico);
  Assert.AreEqual('DESPESAS COM HOSPEDAGEM CONFORME ABAIXO:', FModel.Servicos[0].Discriminacao);
  Assert.AreEqual('5510801', FModel.Servicos[0].CodigoCnae);
  Assert.AreEqual('5511501', FModel.Servicos[0].CodigoTributacaoMunicipio);
  Assert.AreEqual('', FModel.Servicos[0].DescricaoTributacaoMunicipio);
  Assert.AreEqual('5103403', FModel.Servicos[0].MunicipioPrestacao);
  Assert.IsFalse(FModel.Servicos[0].IssRetido);
  Assert.AreEqual<Currency>(1512, FModel.Servicos[0].Valor);
  Assert.AreEqual<Currency>(1512, FModel.Servicos[0].BaseCalculo);
  Assert.AreEqual<Currency>(45.36, FModel.Servicos[0].ValorIss);
  Assert.AreEqual<Currency>(1512, FModel.Servicos[0].ValorLiquido);
  Assert.AreEqual<Currency>(1, FModel.Servicos[0].ValorDeducoes);
  Assert.AreEqual<Currency>(2, FModel.Servicos[0].ValorPis);
  Assert.AreEqual<Currency>(4, FModel.Servicos[0].ValorCofins);
  Assert.AreEqual<Currency>(3, FModel.Servicos[0].ValorInss);
  Assert.AreEqual<Currency>(5, FModel.Servicos[0].ValorIr);
  Assert.AreEqual<Currency>(6, FModel.Servicos[0].ValorCsll);
  Assert.AreEqual<Currency>(7, FModel.Servicos[0].OutrasRetencoes);
  Assert.AreEqual<Currency>(8, FModel.Servicos[0].DescontoIncondicionado);
  Assert.AreEqual<Currency>(9, FModel.Servicos[0].DescontoCondicionado);
end;

procedure TGBFRNFSeTestAbrasf204.ModelPrestador;
begin
  Assert.AreEqual('01982156000188', FModel.Prestador.NumeroDocumento);
  Assert.AreEqual('PAIAGUÁS HOTÉIS LTDA', FModel.Prestador.RazaoSocial);
  Assert.AreEqual('PAIAGUAIS HOTEIS    ', FModel.Prestador.NomeFantasia);
  Assert.AreEqual('42782', FModel.Prestador.InscricaoMunicipal);
  Assert.AreEqual('Avenida Historiador Rubens de Mendonça', FModel.Prestador.Endereco.Logradouro);
  Assert.AreEqual('1718', FModel.Prestador.Endereco.Numero);
  Assert.AreEqual('', FModel.Prestador.Endereco.Complemento);
  Assert.AreEqual('Bosque da Saúde', FModel.Prestador.Endereco.Bairro);
  Assert.AreEqual('5103403', FModel.Prestador.Endereco.CodigoCidade);
  Assert.AreEqual('', FModel.Prestador.Endereco.NomeCidade);
  Assert.AreEqual('MT', FModel.Prestador.Endereco.UF);
  Assert.AreEqual('78050000', FModel.Prestador.Endereco.CEP);
  Assert.AreEqual('1058', FModel.Prestador.Endereco.CodigoPais);
  Assert.AreEqual('Brasil', FModel.Prestador.Endereco.NomePais);
  Assert.AreEqual('656425353           ', FModel.Prestador.Telefone);
  Assert.AreEqual('edduran@paiaguas.com.br', FModel.Prestador.Email);
end;

procedure TGBFRNFSeTestAbrasf204.ModelTomador;
begin
  Assert.AreEqual('00520556000109', FModel.Tomador.NumeroDocumento);
  Assert.AreEqual('SM TURISMO LTDA', FModel.Tomador.RazaoSocial);
  Assert.AreEqual('SM TURISMO LTDA', FModel.Tomador.NomeFantasia);
  Assert.AreEqual('', FModel.Tomador.Nif);
  Assert.AreEqual('', FModel.Tomador.InscricaoMunicipal);
  Assert.AreEqual('Rua Curt Hering', FModel.Tomador.Endereco.Logradouro);
  Assert.AreEqual('154', FModel.Tomador.Endereco.Numero);
  Assert.AreEqual('', FModel.Tomador.Endereco.Complemento);
  Assert.AreEqual('Centro', FModel.Tomador.Endereco.Bairro);
  Assert.AreEqual('4202404', FModel.Tomador.Endereco.CodigoCidade);
  Assert.AreEqual('', FModel.Tomador.Endereco.NomeCidade);
  Assert.AreEqual('SC', FModel.Tomador.Endereco.UF);
  Assert.AreEqual('89010030', FModel.Tomador.Endereco.CEP);
  Assert.AreEqual('1058', FModel.Tomador.Endereco.CodigoPais);
  Assert.AreEqual('Brasil', FModel.Tomador.Endereco.NomePais);
end;

procedure TGBFRNFSeTestAbrasf204.OrgaoGerador;
begin
  Assert.AreEqual('5103403', FNFSe.InfNfse.OrgaoGerador.CodigoMunicipio);
  Assert.AreEqual('MT', FNFSe.InfNfse.OrgaoGerador.UF);
end;

procedure TGBFRNFSeTestAbrasf204.PrestadorServico;
begin
  Assert.AreEqual('01982156000188', FNFSe.InfNfse.PrestadorServico.Identificacao.CpfCnpj.Cnpj);
  Assert.AreEqual('PAIAGUÁS HOTÉIS LTDA', FNFSe.InfNfse.PrestadorServico.RazaoSocial);
  Assert.AreEqual('PAIAGUAIS HOTEIS    ', FNFSe.InfNfse.PrestadorServico.NomeFantasia);
  Assert.AreEqual('42782', FNFSe.InfNfse.PrestadorServico.Identificacao.InscricaoMunicipal);
  Assert.AreEqual('Avenida Historiador Rubens de Mendonça', FNFSe.InfNfse.PrestadorServico.Endereco.Endereco);
  Assert.AreEqual('1718', FNFSe.InfNfse.PrestadorServico.Endereco.Numero);
  Assert.AreEqual('', FNFSe.InfNfse.PrestadorServico.Endereco.Complemento);
  Assert.AreEqual('Bosque da Saúde', FNFSe.InfNfse.PrestadorServico.Endereco.Bairro);
  Assert.AreEqual('5103403', FNFSe.InfNfse.PrestadorServico.Endereco.CodigoMunicipio);
  Assert.AreEqual('MT', FNFSe.InfNfse.PrestadorServico.Endereco.UF);
  Assert.AreEqual('78050000', FNFSe.InfNfse.PrestadorServico.Endereco.CEP);
  Assert.AreEqual('656425353           ', FNFSe.InfNfse.PrestadorServico.Contato.Telefone);
  Assert.AreEqual('edduran@paiaguas.com.br', FNFSe.InfNfse.PrestadorServico.Contato.Email);
end;

procedure TGBFRNFSeTestAbrasf204.Servico;
var
  LServico: TGBFRNFSeModelAbrasf204Servico;
begin
  LServico := FNFSe.InfNfse.DeclaracaoPrestacaoServico
    .InfDeclaracaoPrestacaoServico.Servico;

  Assert.IsFalse(LServico.IssRetido);
  Assert.AreEqual('09.01', LServico.ItemListaServico);
  Assert.AreEqual('5510801', LServico.CodigoCnae);
  Assert.AreEqual('5511501', LServico.CodigoTributacaoMunicipio);
  Assert.AreEqual('DESPESAS COM HOSPEDAGEM CONFORME ABAIXO:', LServico.Discriminacao);
  Assert.AreEqual('5103403', LServico.CodigoMunicipio);
  Assert.AreEqual(TNFSeExigilidadeIss.eiExigivel, LServico.ExigibilidadeISS);
  Assert.AreEqual('5103403', LServico.MunicipioIncidencia);
end;

procedure TGBFRNFSeTestAbrasf204.ServicoValores;
var
  LValores: TGBFRNFSeModelAbrasf204ServicoValores;
begin
  LValores := FNFSe.InfNfse.DeclaracaoPrestacaoServico
    .InfDeclaracaoPrestacaoServico.Servico.Valores;

  Assert.AreEqual<Currency>(1512, LValores.ValorServicos);
  Assert.AreEqual<Currency>(1, LValores.ValorDeducoes);
  Assert.AreEqual<Currency>(2, LValores.ValorPis);
  Assert.AreEqual<Currency>(4, LValores.ValorCofins);
  Assert.AreEqual<Currency>(3, LValores.ValorInss);
  Assert.AreEqual<Currency>(5, LValores.ValorIr);
  Assert.AreEqual<Currency>(6, LValores.ValorCsll);
  Assert.AreEqual<Currency>(7, LValores.OutrasRetencoes);
  Assert.AreEqual<Currency>(8, LValores.DescontoIncondicionado);
  Assert.AreEqual<Currency>(9, LValores.DescontoCondicionado);
end;

procedure TGBFRNFSeTestAbrasf204.Setup;
var
  LXml: string;
begin
  CoInitialize(nil);
  LXml := LoadXMLResource('MT_MATOGROSSO_ABRASF');
  FNFSe := TGBFRNFSeXMLAbrasf204.New.LoadFromContent(LXml);
  FModel := FNFSe.ToModelNFSe;
end;

procedure TGBFRNFSeTestAbrasf204.Teardown;
begin
  CoUninitialize;
  FreeAndNil(FNFSe);
  FreeAndNil(FModel);
end;

procedure TGBFRNFSeTestAbrasf204.TomadorServico;
var
  LTomador: TGBFRNFSeModelAbrasf204Tomador;
begin
  LTomador := FNFSe.InfNfse.DeclaracaoPrestacaoServico.InfDeclaracaoPrestacaoServico.TomadorServico;
  Assert.AreEqual('00520556000109', LTomador.IdentificacaoTomador.CpfCnpj.Cnpj);
  Assert.AreEqual('SM TURISMO LTDA', LTomador.RazaoSocial);
  Assert.AreEqual('', LTomador.NifTomador);
  Assert.AreEqual('', LTomador.IdentificacaoTomador.InscricaoMunicipal);
  Assert.AreEqual('Rua Curt Hering', LTomador.Endereco.Endereco);
  Assert.AreEqual('154', LTomador.Endereco.Numero);
  Assert.AreEqual('', LTomador.Endereco.Complemento);
  Assert.AreEqual('Centro', LTomador.Endereco.Bairro);
  Assert.AreEqual('4202404', LTomador.Endereco.CodigoMunicipio);
  Assert.AreEqual('SC', LTomador.Endereco.UF);
  Assert.AreEqual('89010030', LTomador.Endereco.CEP);
end;

procedure TGBFRNFSeTestAbrasf204.ValoresNFSe;
begin
  Assert.AreEqual<Currency>(1512, FNFSe.InfNfse.ValoresNfse.BaseCalculo);
  Assert.AreEqual<Currency>(3, FNFSe.InfNfse.ValoresNfse.Aliquota);
  Assert.AreEqual<Currency>(45.36, FNFSe.InfNfse.ValoresNfse.ValorIss);
  Assert.AreEqual<Currency>(1512, FNFSe.InfNfse.ValoresNfse.ValorLiquidoNfse);
end;

end.
