unit GBFR.NFSe.Model.IssNetOnline;

interface

uses
  GBFR.NFSe.Model.Types,
  GBFR.NFSe.Model.Classes,
  System.SysUtils,
  System.Generics.Collections,
  System.Classes;

type
  TGBFRNFSeModelIssNetOnlineContato = class;
  TGBFRNFSeModelIssNetOnlineCPFCNPJ = class;
  TGBFRNFSeModelIssNetOnlineEndereco = class;
  TGBFRNFSeModelIssNetOnlineIdentificacaoPessoa = class;
  TGBFRNFSeModelIssNetOnlineNFSe = class;
  TGBFRNFSeModelIssNetOnlineNFSeInfo = class;
  TGBFRNFSeModelIssNetOnlineOrgaoGerador = class;
  TGBFRNFSeModelIssNetOnlinePrestador = class;
  TGBFRNFSeModelIssNetOnlineServico = class;
  TGBFRNFSeModelIssNetOnlineServicoValores = class;
  TGBFRNFSeModelIssNetOnlineTomador = class;

  TGBFRNFSeModelIssNetOnlineContato = class
  private
    FTelefone: string;
    FEmail: string;
  public
    property Telefone: string read FTelefone write FTelefone;
    property Email: string read FEmail write FEmail;
  end;

  TGBFRNFSeModelIssNetOnlineCPFCNPJ = class
  private
    FCnpj: string;
    FCpf: string;
  public
    property Cnpj: string read FCnpj write FCnpj;
    property Cpf: string read FCpf write FCpf;
  end;

  TGBFRNFSeModelIssNetOnlineEndereco = class
  private
    FEndereco: string;
    FNumero: string;
    FComplemento: string;
    FBairro: string;
    FCidade: string;
    FEstado: string;
    FCEP: string;
  public
    property Endereco: string read FEndereco write FEndereco;
    property Numero: string read FNumero write FNumero;
    property Complemento: string read FComplemento write FComplemento;
    property Bairro: string read FBairro write FBairro;
    property Cidade: string read FCidade write FCidade;
    property Estado: string read FEstado write FEstado;
    property CEP: string read FCEP write FCEP;
  end;

  TGBFRNFSeModelIssNetOnlineIdentificacaoPessoa = class
  private
    FCpfCnpj: TGBFRNFSeModelIssNetOnlineCPFCNPJ;
    FInscricaoMunicipal: string;
  public
    constructor Create;
    destructor Destroy; override;

    property CpfCnpj: TGBFRNFSeModelIssNetOnlineCPFCNPJ read FCpfCnpj write FCpfCnpj;
    property InscricaoMunicipal: string read FInscricaoMunicipal write FInscricaoMunicipal;
  end;

  TGBFRNFSeModelIssNetOnlineNFSe = class
  private
    FInfNfse: TGBFRNFSeModelIssNetOnlineNFSeInfo;
  public
    constructor Create;
    destructor Destroy; override;

    function ToModelNFSe: TGBFRNFSeModel;

    property InfNfse: TGBFRNFSeModelIssNetOnlineNFSeInfo read FInfNfse write FInfNfse;
  end;

  TGBFRNFSeModelIssNetOnlineNFSeInfo = class
  private
    FNumero: string;
    FCodigoVerificacao: string;
    FDataEmissao: TDateTime;
    FOutrasInformacoes: string;
    FValorCredito: Currency;
    FNfseSubstituida: string;
    FNaturezaOperacao: TNFSeNaturezaOperacao;
    FRegimeEspecialTributacao: TNFSeRegimeTributacao;
    FOptanteSimplesNacional: Boolean;
    FIncentivadorCultural: Boolean;
    FCompetencia: TDateTime;
    FServico: TGBFRNFSeModelIssNetOnlineServico;
    FPrestadorServico: TGBFRNFSeModelIssNetOnlinePrestador;
    FOrgaoGerador: TGBFRNFSeModelIssNetOnlineOrgaoGerador;
    FTomadorServico: TGBFRNFSeModelIssNetOnlineTomador;
  public
    constructor Create;
    destructor Destroy; override;

    property Numero: string read FNumero write FNumero;
    property CodigoVerificacao: string read FCodigoVerificacao write FCodigoVerificacao;
    property DataEmissao: TDateTime read FDataEmissao write FDataEmissao;
    property NaturezaOperacao: TNFSeNaturezaOperacao read FNaturezaOperacao write FNaturezaOperacao;
    property RegimeEspecialTributacao: TNFSeRegimeTributacao read FRegimeEspecialTributacao write FRegimeEspecialTributacao;
    property OptanteSimplesNacional: Boolean read FOptanteSimplesNacional write FOptanteSimplesNacional;
    property IncentivadorCultural: Boolean read FIncentivadorCultural write FIncentivadorCultural;
    property Competencia: TDateTime read FCompetencia write FCompetencia;
    property NfseSubstituida: string read FNfseSubstituida write FNfseSubstituida;
    property OutrasInformacoes: string read FOutrasInformacoes write FOutrasInformacoes;
    property Servico: TGBFRNFSeModelIssNetOnlineServico read FServico write FServico;
    property PrestadorServico: TGBFRNFSeModelIssNetOnlinePrestador read FPrestadorServico write FPrestadorServico;
    property TomadorServico: TGBFRNFSeModelIssNetOnlineTomador read FTomadorServico write FTomadorServico;
    property OrgaoGerador: TGBFRNFSeModelIssNetOnlineOrgaoGerador read FOrgaoGerador write FOrgaoGerador;
    property ValorCredito: Currency read FValorCredito write FValorCredito;
  end;

  TGBFRNFSeModelIssNetOnlineOrgaoGerador = class
  private
    FCodigoMunicipio: string;
    FUF: string;
  public
    property CodigoMunicipio: string read FCodigoMunicipio write FCodigoMunicipio;
    property UF: string read FUF write FUF;
  end;

  TGBFRNFSeModelIssNetOnlinePrestador = class
  private
    FIdentificacaoPrestador: TGBFRNFSeModelIssNetOnlineIdentificacaoPessoa;
    FRazaoSocial: string;
    FNomeFantasia: string;
    FEndereco: TGBFRNFSeModelIssNetOnlineEndereco;
    FContato: TGBFRNFSeModelIssNetOnlineContato;
  public
    constructor Create;
    destructor Destroy; override;

    property IdentificacaoPrestador: TGBFRNFSeModelIssNetOnlineIdentificacaoPessoa read FIdentificacaoPrestador write FIdentificacaoPrestador;
    property RazaoSocial: string read FRazaoSocial write FRazaoSocial;
    property NomeFantasia: string read FNomeFantasia write FNomeFantasia;
    property Endereco: TGBFRNFSeModelIssNetOnlineEndereco read FEndereco write FEndereco;
    property Contato: TGBFRNFSeModelIssNetOnlineContato read FContato write FContato;
  end;

  TGBFRNFSeModelIssNetOnlineServico = class
  private
    FValores: TGBFRNFSeModelIssNetOnlineServicoValores;
    FItemListaServico: string;
    FCodigoCnae: string;
    FCodigoTributacaoMunicipio: string;
    FDiscriminacao: string;
    FMunicipioPrestacaoServico: string;
  public
    constructor Create;
    destructor Destroy; override;

    property ItemListaServico: string read FItemListaServico write FItemListaServico;
    property CodigoCnae: string read FCodigoCnae write FCodigoCnae;
    property CodigoTributacaoMunicipio: string read FCodigoTributacaoMunicipio write FCodigoTributacaoMunicipio;
    property Discriminacao: string read FDiscriminacao write FDiscriminacao;
    property MunicipioPrestacaoServico: string read FMunicipioPrestacaoServico write FMunicipioPrestacaoServico;
    property Valores: TGBFRNFSeModelIssNetOnlineServicoValores read FValores write FValores;
  end;

  TGBFRNFSeModelIssNetOnlineServicoValores = class
  private
    FValorServicos: Currency;
    FValorDeducoes: Currency;
    FValorPis: Currency;
    FValorCofins: Currency;
    FValorInss: Currency;
    FValorIr: Currency;
    FValorCsll: Currency;
    FOutrasRetencoes: Currency;
    FDescontoIncondicionado: Currency;
    FDescontoCondicionado: Currency;
    FValorIss: Currency;
    FAliquota: Currency;
    FIssRetido: Boolean;
    FBaseCalculo: Currency;
    FValorLiquidoNfse: Currency;
    FValorIssRetido: Currency;
  public
    property ValorServicos: Currency read FValorServicos write FValorServicos;
    property ValorDeducoes: Currency read FValorDeducoes write FValorDeducoes;
    property ValorPis: Currency read FValorPis write FValorPis;
    property ValorCofins: Currency read FValorCofins write FValorCofins;
    property ValorInss: Currency read FValorInss write FValorInss;
    property ValorIr: Currency read FValorIr write FValorIr;
    property ValorCsll: Currency read FValorCsll write FValorCsll;
    property IssRetido: Boolean read FIssRetido write FIssRetido;
    property OutrasRetencoes: Currency read FOutrasRetencoes write FOutrasRetencoes;
    property BaseCalculo: Currency read FBaseCalculo write FBaseCalculo;
    property Aliquota: Currency read FAliquota write FAliquota;
    property ValorLiquidoNfse: Currency read FValorLiquidoNfse write FValorLiquidoNfse;
    property ValorIssRetido: Currency read FValorIssRetido write FValorIssRetido;
    property ValorIss: Currency read FValorIss write FValorIss;
    property DescontoIncondicionado: Currency read FDescontoIncondicionado write FDescontoIncondicionado;
    property DescontoCondicionado: Currency read FDescontoCondicionado write FDescontoCondicionado;
  end;

  TGBFRNFSeModelIssNetOnlineTomador = class
  private
    FIdentificacaoTomador: TGBFRNFSeModelIssNetOnlineIdentificacaoPessoa;
    FRazaoSocial: string;
    FEndereco: TGBFRNFSeModelIssNetOnlineEndereco;
    FContato: TGBFRNFSeModelIssNetOnlineContato;
  public
    constructor Create;
    destructor Destroy; override;

    property IdentificacaoTomador: TGBFRNFSeModelIssNetOnlineIdentificacaoPessoa read FIdentificacaoTomador write FIdentificacaoTomador;
    property RazaoSocial: string read FRazaoSocial write FRazaoSocial;
    property Endereco: TGBFRNFSeModelIssNetOnlineEndereco read FEndereco write FEndereco;
    property Contato: TGBFRNFSeModelIssNetOnlineContato read FContato write FContato;
  end;
  
implementation

{ TGBFRNFSeModelIssNetOnlineIdentificacaoPessoa }

constructor TGBFRNFSeModelIssNetOnlineIdentificacaoPessoa.Create;
begin
  FCpfCnpj := TGBFRNFSeModelIssNetOnlineCPFCNPJ.Create;
end;

destructor TGBFRNFSeModelIssNetOnlineIdentificacaoPessoa.Destroy;
begin
  FCpfCnpj.Free;
  inherited;
end;

{ TGBFRNFSeModelIssNetOnlineTomador }

constructor TGBFRNFSeModelIssNetOnlineTomador.Create;
begin
  FIdentificacaoTomador := TGBFRNFSeModelIssNetOnlineIdentificacaoPessoa.Create;
  FEndereco := TGBFRNFSeModelIssNetOnlineEndereco.Create;
  FContato := TGBFRNFSeModelIssNetOnlineContato.Create;
end;

destructor TGBFRNFSeModelIssNetOnlineTomador.Destroy;
begin
  FIdentificacaoTomador.Free;
  FEndereco.Free;
  FContato.Free;
  inherited;
end;

{ TGBFRNFSeModelIssNetOnlinePrestador }

constructor TGBFRNFSeModelIssNetOnlinePrestador.Create;
begin
  FIdentificacaoPrestador := TGBFRNFSeModelIssNetOnlineIdentificacaoPessoa.Create;
  FEndereco := TGBFRNFSeModelIssNetOnlineEndereco.Create;
  FContato := TGBFRNFSeModelIssNetOnlineContato.Create;
end;

destructor TGBFRNFSeModelIssNetOnlinePrestador.Destroy;
begin
  FIdentificacaoPrestador.Free;
  FEndereco.Free;
  FContato.Free;
  inherited;
end;

{ TGBFRNFSeModelIssNetOnlineServico }

constructor TGBFRNFSeModelIssNetOnlineServico.Create;
begin
  FValores := TGBFRNFSeModelIssNetOnlineServicoValores.Create;
end;

destructor TGBFRNFSeModelIssNetOnlineServico.Destroy;
begin
  FValores.Free;
  inherited;
end;

{ TGBFRNFSeModelIssNetOnlineNFSeInfo }

constructor TGBFRNFSeModelIssNetOnlineNFSeInfo.Create;
begin
  FServico := TGBFRNFSeModelIssNetOnlineServico.Create;
  FPrestadorServico := TGBFRNFSeModelIssNetOnlinePrestador.Create;
  FOrgaoGerador := TGBFRNFSeModelIssNetOnlineOrgaoGerador.Create;
  FTomadorServico := TGBFRNFSeModelIssNetOnlineTomador.Create;
end;

destructor TGBFRNFSeModelIssNetOnlineNFSeInfo.Destroy;
begin
  FServico.Free;
  FPrestadorServico.Free;
  FOrgaoGerador.Free;
  FTomadorServico.Free;
  inherited;
end;

{ TGBFRNFSeModelIssNetOnlineNFSe }

constructor TGBFRNFSeModelIssNetOnlineNFSe.Create;
begin
  FInfNfse := TGBFRNFSeModelIssNetOnlineNFSeInfo.Create;
end;

destructor TGBFRNFSeModelIssNetOnlineNFSe.Destroy;
begin
  FInfNfse.Free;
  inherited;
end;

function TGBFRNFSeModelIssNetOnlineNFSe.ToModelNFSe: TGBFRNFSeModel;
var
  LTomador: TGBFRNFSeModelIssNetOnlineTomador;
  LServico: TGBFRNFSeModelIssNetOnlineServico;
  LNFSeServico: TGBFRNFSeModelServico;
begin
  Result := TGBFRNFSeModel.Create;
  try
    Result.Padrao := 'IssNetOnline';
    {$REGION 'PRESTADOR'}
    Result.Prestador.RazaoSocial := Self.FInfNfse.PrestadorServico.RazaoSocial;
    Result.Prestador.NomeFantasia := Self.FInfNfse.PrestadorServico.NomeFantasia;
    Result.Prestador.NumeroDocumento := Self.FInfNfse.PrestadorServico.IdentificacaoPrestador.FCpfCnpj.Cnpj;
    if Result.Prestador.NumeroDocumento = EmptyStr then
      Result.Prestador.NumeroDocumento := Self.FInfNfse.PrestadorServico.IdentificacaoPrestador.FCpfCnpj.Cpf;

    Result.Prestador.InscricaoMunicipal := Self.FInfNfse.PrestadorServico.IdentificacaoPrestador.InscricaoMunicipal;
    Result.Prestador.Telefone := Self.FInfNfse.PrestadorServico.Contato.Telefone;
    Result.Prestador.Email := Self.FInfNfse.PrestadorServico.Contato.Email;
    Result.Prestador.Endereco.Logradouro := Self.FInfNfse.PrestadorServico.Endereco.Endereco;
    Result.Prestador.Endereco.Numero := Self.FInfNfse.PrestadorServico.Endereco.Numero;
    Result.Prestador.Endereco.Complemento := Self.FInfNfse.PrestadorServico.Endereco.Complemento;
    Result.Prestador.Endereco.CEP := Self.FInfNfse.PrestadorServico.Endereco.CEP;
    Result.Prestador.Endereco.Bairro := Self.FInfNfse.PrestadorServico.Endereco.Bairro;
    Result.Prestador.Endereco.CodigoCidade := Self.FInfNfse.PrestadorServico.Endereco.Cidade;
    Result.Prestador.Endereco.UF := Self.FInfNfse.PrestadorServico.Endereco.Estado;
    Result.Prestador.Endereco.CodigoPais := '1058';
    Result.Prestador.Endereco.NomePais := 'Brasil';
    {$ENDREGION}

    {$REGION 'TOMADOR'}
    LTomador := FInfNfse.TomadorServico;
    Result.Tomador.RazaoSocial := LTomador.RazaoSocial;
    Result.Tomador.NomeFantasia := LTomador.RazaoSocial;
    Result.Tomador.NumeroDocumento := LTomador.IdentificacaoTomador.CpfCnpj.Cnpj;
    if Result.Tomador.NumeroDocumento = EmptyStr then
      Result.Tomador.NumeroDocumento := LTomador.IdentificacaoTomador.CpfCnpj.Cpf;

    Result.Tomador.InscricaoMunicipal := LTomador.IdentificacaoTomador.InscricaoMunicipal;
    Result.Tomador.Endereco.Logradouro := LTomador.Endereco.Endereco;
    Result.Tomador.Endereco.Numero := LTomador.Endereco.Numero;
    Result.Tomador.Endereco.Complemento := LTomador.Endereco.Complemento;
    Result.Tomador.Endereco.CEP := LTomador.Endereco.CEP;
    Result.Tomador.Endereco.Bairro := LTomador.Endereco.Bairro;
    Result.Tomador.Endereco.CodigoCidade := LTomador.Endereco.Cidade;
    Result.Tomador.Endereco.UF := LTomador.Endereco.Estado;
    Result.Tomador.Telefone := LTomador.Contato.Telefone;
    Result.Tomador.Email := LTomador.Contato.Email;
    if Result.Tomador.Endereco.UF <> 'EX' then
    begin
      Result.Tomador.Endereco.CodigoPais := '1058';
      Result.Tomador.Endereco.NomePais := 'Brasil';
    end;
    {$ENDREGION}

    {$REGION 'SERVICOS'}
    LServico := Self.InfNfse.Servico;
    LNFSeServico := TGBFRNFSeModelServico.Create;
    Result.Servicos.Add(LNFSeServico);
    LNFSeServico.ItemListaServico := LServico.ItemListaServico;
    LNFSeServico.Discriminacao := LServico.Discriminacao;
    LNFSeServico.CodigoCnae := LServico.CodigoCnae;
    LNFSeServico.CodigoTributacaoMunicipio := LServico.CodigoTributacaoMunicipio;
    LNFSeServico.MunicipioPrestacao := LServico.MunicipioPrestacaoServico;
    LNFSeServico.Valor := LServico.Valores.ValorServicos;
    LNFSeServico.ValorIss := LServico.Valores.ValorIss;
    LNFSeServico.ValorIssRetido := LServico.Valores.ValorIssRetido;
    LNFSeServico.BaseCalculo := LServico.Valores.BaseCalculo;
    LNFSeServico.Aliquota := LServico.Valores.Aliquota;
    LNFSeServico.ValorLiquido := LServico.Valores.ValorLiquidoNfse;
    LNFSeServico.ValorDeducoes := LServico.Valores.ValorDeducoes;
    LNFSeServico.ValorPis := LServico.Valores.ValorPis;
    LNFSeServico.ValorCofins := LServico.Valores.ValorCofins;
    LNFSeServico.ValorInss := LServico.Valores.ValorInss;
    LNFSeServico.ValorIr := LServico.Valores.ValorIr;
    LNFSeServico.ValorCsll := LServico.Valores.ValorCsll;
    LNFSeServico.OutrasRetencoes := LServico.Valores.OutrasRetencoes;
    LNFSeServico.DescontoCondicionado := LServico.Valores.DescontoCondicionado;
    LNFSeServico.DescontoIncondicionado := LServico.Valores.DescontoIncondicionado;
    LNFSeServico.IssRetido := LServico.Valores.IssRetido;
    {$ENDREGION}

    {$REGION 'NFSe VALORES'}
    Result.ValorCredito := Self.InfNfse.ValorCredito;
    Result.Valor := LServico.Valores.ValorServicos;
    Result.ValorIss := LServico.Valores.ValorIss;
    Result.ValorIssRetido := LServico.Valores.ValorIssRetido;
    Result.BaseCalculo := LServico.Valores.BaseCalculo;
    Result.ValorLiquido := LServico.Valores.ValorLiquidoNfse;
    Result.ValorDeducoes := LServico.Valores.ValorDeducoes;
    Result.ValorPis := LServico.Valores.ValorPis;
    Result.ValorCofins := LServico.Valores.ValorCofins;
    Result.ValorInss := LServico.Valores.ValorInss;
    Result.ValorIr := LServico.Valores.ValorIr;
    Result.ValorCsll := LServico.Valores.ValorCsll;
    Result.OutrasRetencoes := LServico.Valores.OutrasRetencoes;
    Result.DescontoCondicionado := LServico.Valores.DescontoCondicionado;
    Result.DescontoIncondicionado := LServico.Valores.DescontoIncondicionado;
    {$ENDREGION}

    {$REGION 'NFSE'}
    Result.RPS := EmptyStr;
    Result.Serie := EmptyStr;
    Result.TipoRPS := EmptyStr;
    Result.Situacao := sNormal;
    Result.Numero := FInfNfse.Numero;
    Result.CodigoVerificacao := FInfNfse.CodigoVerificacao;
    Result.DataEmissao := FInfNfse.DataEmissao;
    Result.OutrasInformacoes := FInfNfse.OutrasInformacoes;
    Result.OptanteSimplesNacional := FInfNfse.OptanteSimplesNacional;
    Result.IncentivadorCultural := FInfNfse.IncentivadorCultural;
    {$ENDREGION}
  except
    Result.Free;
    raise;
  end;
end;

end.
