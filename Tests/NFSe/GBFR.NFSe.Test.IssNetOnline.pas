unit GBFR.NFSe.Test.IssNetOnline;

interface

uses
  DUnitX.TestFramework,
  GBFR.NFSe.Test.Base,
  GBFR.NFSe.Model.Types,
  GBFR.NFSe.Model.Classes,
  GBFR.NFSe.Model.IssNetOnline,
  GBFR.NFSe.XML.IssNetOnline.Interfaces,
  GBFR.NFSe.XML.IssNetOnline,
  Winapi.ActiveX,
  System.SysUtils,
  System.Classes;

type
  [TestFixture]
  TGBFRNFSeTestIssNetOnline = class(TGBFRNFSeTestBase)
  private
    FNFSe: TGBFRNFSeModelIssNetOnlineNFSe;
    FModel: TGBFRNFSeModel;
  public
    [Setup]
    procedure Setup;

    [Teardown]
    procedure Teardown;

    [Test]
    procedure InfNFSe;

    [Test]
    procedure Tomador;

    [Test]
    procedure Prestador;

    [Test]
    procedure OrgaoGerador;

    [Test]
    procedure Servico;

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

{ TGBFRNFSeTestIssNetOnline }

procedure TGBFRNFSeTestIssNetOnline.InfNFSe;
begin
  Assert.AreEqual('96019', FNFSe.InfNfse.Numero);
  Assert.AreEqual(' 86 FF D6', FNFSe.InfNfse.CodigoVerificacao);
  Assert.AreEqual('2022-11-30 16:27:23', FormatDateTime('yyyy-MM-dd hh:mm:ss', FNFSe.InfNfse.DataEmissao));
  Assert.AreEqual(TNFSeNaturezaOperacao.noTributacaoMunicipio, FNFSe.InfNfse.NaturezaOperacao);
  Assert.AreEqual(TNFSeRegimeTributacao.rtMicroEmpresa, FNFSe.InfNfse.RegimeEspecialTributacao);
  Assert.IsFalse(FNFSe.InfNfse.OptanteSimplesNacional);
  Assert.IsFalse(FNFSe.InfNfse.IncentivadorCultural);
  Assert.AreEqual('2022-11-01', FormatDateTime('yyyy-MM-dd', FNFSe.InfNfse.Competencia));
  Assert.AreEqual('  PROCON/MT- Rua Baltazar Navarros, 567 ', FNFSe.InfNfse.OutrasInformacoes);
  Assert.AreEqual<Currency>(2, FNFSe.InfNfse.ValorCredito);
end;

procedure TGBFRNFSeTestIssNetOnline.ModelNFSe;
begin
  Assert.AreEqual('IssNetOnline', FModel.Padrao);
  Assert.AreEqual('96019', FModel.Numero);
  Assert.AreEqual(' 86 FF D6', FModel.CodigoVerificacao);
  Assert.AreEqual('2022-11-30 16:27:23', FormatDateTime('yyyy-MM-dd hh:mm:ss', FModel.DataEmissao));
  Assert.IsFalse(FModel.OptanteSimplesNacional);
  Assert.IsFalse(FModel.IncentivadorCultural);
  Assert.AreEqual('  PROCON/MT- Rua Baltazar Navarros, 567 ', FModel.OutrasInformacoes);
  Assert.AreEqual<Currency>(2, FModel.ValorCredito);
  Assert.AreEqual(1, FModel.Servicos.Count);

  Assert.AreEqual<Currency>(135630, FModel.Valor);
  Assert.AreEqual<Currency>(2, FModel.ValorCredito);
  Assert.AreEqual<Currency>(135630, FModel.BaseCalculo);
  Assert.AreEqual<Currency>(4068.9, FModel.ValorIss);
  Assert.AreEqual<Currency>(135630, FModel.ValorLiquido);
  Assert.AreEqual<Currency>(1, FModel.ValorDeducoes);
  Assert.AreEqual<Currency>(2, FModel.ValorPis);
  Assert.AreEqual<Currency>(3, FModel.ValorCofins);
  Assert.AreEqual<Currency>(4, FModel.ValorInss);
  Assert.AreEqual<Currency>(5, FModel.ValorIr);
  Assert.AreEqual<Currency>(6, FModel.ValorCsll);
  Assert.AreEqual<Currency>(7, FModel.OutrasRetencoes);
  Assert.AreEqual<Currency>(8, FModel.ValorIssRetido);
  Assert.AreEqual<Currency>(10, FModel.DescontoIncondicionado);
  Assert.AreEqual<Currency>(9, FModel.DescontoCondicionado);
end;

procedure TGBFRNFSeTestIssNetOnline.ModelNFSeServico;
begin
  Assert.AreEqual<Currency>(135630, FModel.Servicos[0].Valor);
  Assert.AreEqual<Currency>(135630, FModel.Servicos[0].BaseCalculo);
  Assert.AreEqual<Currency>(4068.9, FModel.Servicos[0].ValorIss);
  Assert.AreEqual<Currency>(135630, FModel.Servicos[0].ValorLiquido);
  Assert.AreEqual<Currency>(1, FModel.Servicos[0].ValorDeducoes);
  Assert.AreEqual<Currency>(2, FModel.Servicos[0].ValorPis);
  Assert.AreEqual<Currency>(3, FModel.Servicos[0].ValorCofins);
  Assert.AreEqual<Currency>(4, FModel.Servicos[0].ValorInss);
  Assert.AreEqual<Currency>(5, FModel.Servicos[0].ValorIr);
  Assert.AreEqual<Currency>(6, FModel.Servicos[0].ValorCsll);
  Assert.AreEqual<Currency>(7, FModel.Servicos[0].OutrasRetencoes);
  Assert.AreEqual<Currency>(8, FModel.Servicos[0].ValorIssRetido);
  Assert.AreEqual<Currency>(10, FModel.Servicos[0].DescontoIncondicionado);
  Assert.AreEqual<Currency>(9, FModel.Servicos[0].DescontoCondicionado);
  Assert.IsTrue(FModel.Servicos[0].IssRetido);
end;

procedure TGBFRNFSeTestIssNetOnline.ModelPrestador;
begin
  Assert.AreEqual('01982156000188', FModel.Prestador.NumeroDocumento);
  Assert.AreEqual('42782', FModel.Prestador.InscricaoMunicipal);
  Assert.AreEqual('PAIAGUÁS HOTÉIS LTDA', FModel.Prestador.RazaoSocial);
  Assert.AreEqual('PAIAGUAIS HOTEIS  ', FModel.Prestador.NomeFantasia);
  Assert.AreEqual('Avenida Historiador Rubens de Mendonça', FModel.Prestador.Endereco.Logradouro);
  Assert.AreEqual('1718', FModel.Prestador.Endereco.Numero);
  Assert.AreEqual('', FModel.Prestador.Endereco.Complemento);
  Assert.AreEqual('Bosque da Saúde', FModel.Prestador.Endereco.Bairro);
  Assert.AreEqual('5103403', FModel.Prestador.Endereco.CodigoCidade);
  Assert.AreEqual('MT', FModel.Prestador.Endereco.UF);
  Assert.AreEqual('78050000', FModel.Prestador.Endereco.CEP);
  Assert.AreEqual('656425353', FModel.Prestador.Telefone);
  Assert.AreEqual('edduran@paiaguas.com.br', FModel.Prestador.Email);
end;

procedure TGBFRNFSeTestIssNetOnline.ModelTomador;
begin
  Assert.AreEqual('15054480000140', FModel.Tomador.NumeroDocumento);
  Assert.AreEqual('MEGA COMERCIALIZADORA DE ENERGIA ELETRICA LTDA  ', FModel.Tomador.RazaoSocial);
  Assert.AreEqual('MEGA COMERCIALIZADORA DE ENERGIA ELETRICA LTDA  ', FModel.Tomador.NomeFantasia);
  Assert.AreEqual('Rua Alvorada', FModel.Tomador.Endereco.Logradouro);
  Assert.AreEqual('1289', FModel.Tomador.Endereco.Numero);
  Assert.AreEqual('conj 904', FModel.Tomador.Endereco.Complemento);
  Assert.AreEqual('Vila Olímpia', FModel.Tomador.Endereco.Bairro);
  Assert.AreEqual('3550308', FModel.Tomador.Endereco.CodigoCidade);
  Assert.AreEqual('SP', FModel.Tomador.Endereco.UF);
  Assert.AreEqual('04550004', FModel.Tomador.Endereco.CEP);
  Assert.AreEqual('1138584329', FModel.Tomador.Telefone);
  Assert.AreEqual('CONTABILIDADE@FEMAX.COM.BR', FModel.Tomador.Email);
end;

procedure TGBFRNFSeTestIssNetOnline.OrgaoGerador;
begin
  Assert.AreEqual('5103403', FNFSe.InfNfse.OrgaoGerador.CodigoMunicipio);
  Assert.AreEqual('MT', FNFSe.InfNfse.OrgaoGerador.UF);
end;

procedure TGBFRNFSeTestIssNetOnline.Prestador;
begin
  Assert.AreEqual('01982156000188', FNFSe.InfNfse.PrestadorServico.IdentificacaoPrestador.CpfCnpj.Cnpj);
  Assert.AreEqual('42782', FNFSe.InfNfse.PrestadorServico.IdentificacaoPrestador.InscricaoMunicipal);
  Assert.AreEqual('PAIAGUÁS HOTÉIS LTDA', FNFSe.InfNfse.PrestadorServico.RazaoSocial);
  Assert.AreEqual('PAIAGUAIS HOTEIS  ', FNFSe.InfNfse.PrestadorServico.NomeFantasia);
  Assert.AreEqual('Avenida Historiador Rubens de Mendonça', FNFSe.InfNfse.PrestadorServico.Endereco.Endereco);
  Assert.AreEqual('1718', FNFSe.InfNfse.PrestadorServico.Endereco.Numero);
  Assert.AreEqual('', FNFSe.InfNfse.PrestadorServico.Endereco.Complemento);
  Assert.AreEqual('Bosque da Saúde', FNFSe.InfNfse.PrestadorServico.Endereco.Bairro);
  Assert.AreEqual('5103403', FNFSe.InfNfse.PrestadorServico.Endereco.Cidade);
  Assert.AreEqual('MT', FNFSe.InfNfse.PrestadorServico.Endereco.Estado);
  Assert.AreEqual('78050000', FNFSe.InfNfse.PrestadorServico.Endereco.CEP);
  Assert.AreEqual('656425353', FNFSe.InfNfse.PrestadorServico.Contato.Telefone);
  Assert.AreEqual('edduran@paiaguas.com.br', FNFSe.InfNfse.PrestadorServico.Contato.Email);
end;

procedure TGBFRNFSeTestIssNetOnline.Servico;
var
  LValores: TGBFRNFSeModelIssNetOnlineServicoValores;
begin
  Assert.AreEqual('901', FNFSe.InfNfse.Servico.ItemListaServico);
  Assert.AreEqual('5510801', FNFSe.InfNfse.Servico.CodigoCnae);
  Assert.AreEqual('5510801', FNFSe.InfNfse.Servico.CodigoTributacaoMunicipio);
  Assert.AreEqual('HOSPEDAGEM COM PENSÃO COMPLETA', FNFSe.InfNfse.Servico.Discriminacao);
  Assert.AreEqual('5103403', FNFSe.InfNfse.Servico.MunicipioPrestacaoServico);

  LValores := FNFSe.InfNfse.Servico.Valores;
  Assert.AreEqual<Currency>(135630, LValores.ValorServicos);
  Assert.AreEqual<Currency>(1, LValores.ValorDeducoes);
  Assert.AreEqual<Currency>(2, LValores.ValorPis);
  Assert.AreEqual<Currency>(3, LValores.ValorCofins);
  Assert.AreEqual<Currency>(4, LValores.ValorInss);
  Assert.AreEqual<Currency>(5, LValores.ValorIr);
  Assert.AreEqual<Currency>(6, LValores.ValorCsll);
  Assert.AreEqual<Currency>(7, LValores.OutrasRetencoes);
  Assert.AreEqual<Currency>(135630, LValores.BaseCalculo);
  Assert.AreEqual<Currency>(3, LValores.Aliquota);
  Assert.AreEqual<Currency>(135630, LValores.ValorLiquidoNfse);
  Assert.AreEqual<Currency>(8, LValores.ValorIssRetido);
  Assert.AreEqual<Currency>(4068.9, LValores.ValorIss);
  Assert.AreEqual<Currency>(9, LValores.DescontoCondicionado);
  Assert.AreEqual<Currency>(10, LValores.DescontoIncondicionado);
  Assert.IsTrue(LValores.IssRetido);
end;

procedure TGBFRNFSeTestIssNetOnline.Setup;
var
  LXml: string;
begin
  CoInitialize(nil);
  LXml := LoadXMLResource('MT_MATOGROSSO_ISSNETONLINE');
  FNFSe := TGBFRNFSeXMLIssNetOnline.New.LoadFromContent(LXml);
  FModel := FNFSe.ToModelNFSe;
end;

procedure TGBFRNFSeTestIssNetOnline.Teardown;
begin
  CoUninitialize;
  FreeAndNil(FNFSe);
  FreeAndNil(FModel);
end;

procedure TGBFRNFSeTestIssNetOnline.Tomador;
begin
  Assert.AreEqual('15054480000140', FNFSe.InfNfse.TomadorServico.IdentificacaoTomador.CpfCnpj.Cnpj);
  Assert.AreEqual('15054480000141', FNFSe.InfNfse.TomadorServico.IdentificacaoTomador.CpfCnpj.Cpf);
  Assert.AreEqual('MEGA COMERCIALIZADORA DE ENERGIA ELETRICA LTDA  ', FNFSe.InfNfse.TomadorServico.RazaoSocial);
  Assert.AreEqual('Rua Alvorada', FNFSe.InfNfse.TomadorServico.Endereco.Endereco);
  Assert.AreEqual('1289', FNFSe.InfNfse.TomadorServico.Endereco.Numero);
  Assert.AreEqual('conj 904', FNFSe.InfNfse.TomadorServico.Endereco.Complemento);
  Assert.AreEqual('Vila Olímpia', FNFSe.InfNfse.TomadorServico.Endereco.Bairro);
  Assert.AreEqual('3550308', FNFSe.InfNfse.TomadorServico.Endereco.Cidade);
  Assert.AreEqual('SP', FNFSe.InfNfse.TomadorServico.Endereco.Estado);
  Assert.AreEqual('04550004', FNFSe.InfNfse.TomadorServico.Endereco.CEP);
  Assert.AreEqual('1138584329', FNFSe.InfNfse.TomadorServico.Contato.Telefone);
  Assert.AreEqual('CONTABILIDADE@FEMAX.COM.BR', FNFSe.InfNfse.TomadorServico.Contato.Email);
end;

end.
