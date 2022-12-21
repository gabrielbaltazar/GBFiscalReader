unit GBFR.NFSe.Model.Abrasf204;

interface

uses
  GBFR.NFSe.Model.Types,
  GBFR.NFSe.Model.Classes,
  System.SysUtils,
  System.Generics.Collections,
  System.Classes;

type
  TGBFRNFSeModelAbrasf204Contato = class;
  TGBFRNFSeModelAbrasf204CPFCNPJ = class;
  TGBFRNFSeModelAbrasf204Endereco = class;
  TGBFRNFSeModelAbrasf204EnderecoExterior = class;
  TGBFRNFSeModelAbrasf204IdentificacaoPessoa = class;
  TGBFRNFSeModelAbrasf204InfPrestacaoServico = class;
  TGBFRNFSeModelAbrasf204NFSe = class;
  TGBFRNFSeModelAbrasf204NFSeInfo = class;
  TGBFRNFSeModelAbrasf204NFSeValores = class;
  TGBFRNFSeModelAbrasf204OrgaoGerador = class;
  TGBFRNFSeModelAbrasf204PrestacaoServico = class;
  TGBFRNFSeModelAbrasf204Prestador = class;
  TGBFRNFSeModelAbrasf204RPS = class;
  TGBFRNFSeModelAbrasf204RPSSubstituido = class;
  TGBFRNFSeModelAbrasf204Servico = class;
  TGBFRNFSeModelAbrasf204ServicoValores = class;
  TGBFRNFSeModelAbrasf204Tomador = class;

  TGBFRNFSeModelAbrasf204Contato = class
  private
    FTelefone: string;
    FEmail: string;
  public
    property Telefone: string read FTelefone write FTelefone;
    property Email: string read FEmail write FEmail;
  end;

  TGBFRNFSeModelAbrasf204CPFCNPJ = class
  private
    FCnpj: string;
    FCpf: string;
  public
    property Cnpj: string read FCnpj write FCnpj;
    property Cpf: string read FCpf write FCpf;
  end;

  TGBFRNFSeModelAbrasf204Endereco = class
  private
    FEndereco: string;
    FNumero: string;
    FComplemento: string;
    FBairro: string;
    FCodigoMunicipio: string;
    FUF: string;
    FCEP: string;
  public
    property Endereco: string read FEndereco write FEndereco;
    property Numero: string read FNumero write FNumero;
    property Complemento: string read FComplemento write FComplemento;
    property Bairro: string read FBairro write FBairro;
    property CodigoMunicipio: string read FCodigoMunicipio write FCodigoMunicipio;
    property UF: string read FUF write FUF;
    property CEP: string read FCEP write FCEP;
  end;

  TGBFRNFSeModelAbrasf204EnderecoExterior = class
  private
    FCodigoPais: string;
    FEnderecoCompletoExterior: string;
  public
    property CodigoPais: string read FCodigoPais write FCodigoPais;
    property EnderecoCompletoExterior: string read FEnderecoCompletoExterior write FEnderecoCompletoExterior;
  end;

  TGBFRNFSeModelAbrasf204IdentificacaoPessoa = class
  private
    FCpfCnpj: TGBFRNFSeModelAbrasf204CPFCNPJ;
    FInscricaoMunicipal: string;
  public
    constructor Create;
    destructor Destroy; override;

    property CpfCnpj: TGBFRNFSeModelAbrasf204CPFCNPJ read FCpfCnpj write FCpfCnpj;
    property InscricaoMunicipal: string read FInscricaoMunicipal write FInscricaoMunicipal;
  end;

  TGBFRNFSeModelAbrasf204InfPrestacaoServico = class
  private
    FRps: TGBFRNFSeModelAbrasf204RPS;
    FCompetencia: TDateTime;
    FServico: TGBFRNFSeModelAbrasf204Servico;
    FTomadorServico: TGBFRNFSeModelAbrasf204Tomador;
    FOptanteSimplesNacional: Boolean;
    FRpsSubstituido: TGBFRNFSeModelAbrasf204RPSSubstituido;
  public
    constructor Create;
    destructor Destroy; override;

    property Rps: TGBFRNFSeModelAbrasf204RPS read FRps write FRps;
    property RpsSubstituido: TGBFRNFSeModelAbrasf204RPSSubstituido read FRpsSubstituido write FRpsSubstituido;
    property Competencia: TDateTime read FCompetencia write FCompetencia;
    property Servico: TGBFRNFSeModelAbrasf204Servico read FServico write FServico;
    property TomadorServico: TGBFRNFSeModelAbrasf204Tomador read FTomadorServico write FTomadorServico;
    property OptanteSimplesNacional: Boolean read FOptanteSimplesNacional write FOptanteSimplesNacional;
  end;

  TGBFRNFSeModelAbrasf204NFSe = class
  private
    FVersao: string;
    FInfNfse: TGBFRNFSeModelAbrasf204NFSeInfo;
  public
    constructor Create;
    destructor Destroy; override;

    function ToModelNFSe: TGBFRNFSeModel;

    property Versao: string read FVersao write FVersao;
    property InfNfse: TGBFRNFSeModelAbrasf204NFSeInfo read FInfNfse write FInfNfse;
  end;

  TGBFRNFSeModelAbrasf204NFSeInfo = class
  private
    FNumero: string;
    FCodigoVerificacao: string;
    FDataEmissao: TDateTime;
    FOutrasInformacoes: string;
    FValoresNfse: TGBFRNFSeModelAbrasf204NFSeValores;
    FDescricaoCodigoTributacaoMunicipio: string;
    FValorCredito: Currency;
    FPrestadorServico: TGBFRNFSeModelAbrasf204Prestador;
    FOrgaoGerador: TGBFRNFSeModelAbrasf204OrgaoGerador;
    FDeclaracaoPrestacaoServico: TGBFRNFSeModelAbrasf204PrestacaoServico;
    FNfseSubstituida: string;
  public
    constructor Create;
    destructor Destroy; override;

    property Numero: string read FNumero write FNumero;
    property CodigoVerificacao: string read FCodigoVerificacao write FCodigoVerificacao;
    property DataEmissao: TDateTime read FDataEmissao write FDataEmissao;
    property NfseSubstituida: string read FNfseSubstituida write FNfseSubstituida;
    property OutrasInformacoes: string read FOutrasInformacoes write FOutrasInformacoes;
    property ValoresNfse: TGBFRNFSeModelAbrasf204NFSeValores read FValoresNfse write FValoresNfse;
    property DescricaoCodigoTributacaoMunicipio: string read FDescricaoCodigoTributacaoMunicipio write FDescricaoCodigoTributacaoMunicipio;
    property ValorCredito: Currency read FValorCredito write FValorCredito;
    property PrestadorServico: TGBFRNFSeModelAbrasf204Prestador read FPrestadorServico write FPrestadorServico;
    property OrgaoGerador: TGBFRNFSeModelAbrasf204OrgaoGerador read FOrgaoGerador write FOrgaoGerador;
    property DeclaracaoPrestacaoServico: TGBFRNFSeModelAbrasf204PrestacaoServico read FDeclaracaoPrestacaoServico write FDeclaracaoPrestacaoServico;
  end;

  TGBFRNFSeModelAbrasf204NFSeValores = class
  private
    FBaseCalculo: Currency;
    FAliquota: Currency;
    FValorIss: Currency;
    FValorLiquidoNfse: Currency;
  public
    property BaseCalculo: Currency read FBaseCalculo write FBaseCalculo;
    property Aliquota: Currency read FAliquota write FAliquota;
    property ValorIss: Currency read FValorIss write FValorIss;
    property ValorLiquidoNfse: Currency read FValorLiquidoNfse write FValorLiquidoNfse;
  end;

  TGBFRNFSeModelAbrasf204OrgaoGerador = class
  private
    FCodigoMunicipio: string;
    FUF: string;
  public
    property CodigoMunicipio: string read FCodigoMunicipio write FCodigoMunicipio;
    property UF: string read FUF write FUF;
  end;

  TGBFRNFSeModelAbrasf204PrestacaoServico = class
  private
    FInfDeclaracaoPrestacaoServico: TGBFRNFSeModelAbrasf204InfPrestacaoServico;
  public
    constructor Create;
    destructor Destroy; override;

    property InfDeclaracaoPrestacaoServico: TGBFRNFSeModelAbrasf204InfPrestacaoServico read FInfDeclaracaoPrestacaoServico write FInfDeclaracaoPrestacaoServico;
  end;

  TGBFRNFSeModelAbrasf204Prestador = class
  private
    FRazaoSocial: string;
    FNomeFantasia: string;
    FEndereco: TGBFRNFSeModelAbrasf204Endereco;
    FContato: TGBFRNFSeModelAbrasf204Contato;
    FIdentificacao: TGBFRNFSeModelAbrasf204IdentificacaoPessoa;
  public
    constructor Create;
    destructor Destroy; override;

    property Identificacao: TGBFRNFSeModelAbrasf204IdentificacaoPessoa read FIdentificacao write FIdentificacao;
    property RazaoSocial: string read FRazaoSocial write FRazaoSocial;
    property NomeFantasia: string read FNomeFantasia write FNomeFantasia;
    property Endereco: TGBFRNFSeModelAbrasf204Endereco read FEndereco write FEndereco;
    property Contato: TGBFRNFSeModelAbrasf204Contato read FContato write FContato;
  end;

  TGBFRNFSeModelAbrasf204RPS = class
  private
    FStatus: string;
    FNumero: string;
    FSerie: string;
    FTipo: string;
    FDataEmissaoRps: TDateTime;
    function GetSituacao: TNFSeSituacao;
  public
    property Numero: string read FNumero write FNumero;
    property Serie: string read FSerie write FSerie;
    property Tipo: string read FTipo write FTipo;
    property DataEmissaoRps: TDateTime read FDataEmissaoRps write FDataEmissaoRps;
    property Status: string read FStatus write FStatus;
    property Situacao: TNFSeSituacao read GetSituacao;
  end;

  TGBFRNFSeModelAbrasf204RPSSubstituido = class
  private
    FNumero: string;
    FSerie: string;
    FTipo: Integer;
  public
    property Numero: string read FNumero write FNumero;
    property Serie: string read FSerie write FSerie;
    property Tipo: Integer read FTipo write FTipo;
  end;

  TGBFRNFSeModelAbrasf204Servico = class
  private
    FValores: TGBFRNFSeModelAbrasf204ServicoValores;
    FIssRetido: Boolean;
    FItemListaServico: string;
    FCodigoCnae: string;
    FCodigoTributacaoMunicipio: string;
    FDiscriminacao: string;
    FCodigoMunicipio: string;
    FExigibilidadeISS: TNFSeExigilidadeIss;
    FMunicipioIncidencia: string;
    FCodigoNbs: string;
    FCodigoPais: string;
  public
    constructor Create;
    destructor Destroy; override;

    property Valores: TGBFRNFSeModelAbrasf204ServicoValores read FValores write FValores;
    property IssRetido: Boolean read FIssRetido write FIssRetido;
    property ItemListaServico: string read FItemListaServico write FItemListaServico;
    property CodigoCnae: string read FCodigoCnae write FCodigoCnae;
    property CodigoTributacaoMunicipio: string read FCodigoTributacaoMunicipio write FCodigoTributacaoMunicipio;
    property CodigoNbs: string read FCodigoNbs write FCodigoNbs;
    property Discriminacao: string read FDiscriminacao write FDiscriminacao;
    property CodigoMunicipio: string read FCodigoMunicipio write FCodigoMunicipio;
    property CodigoPais: string read FCodigoPais write FCodigoPais;
    property ExigibilidadeISS: TNFSeExigilidadeIss read FExigibilidadeISS write FExigibilidadeISS;
    property MunicipioIncidencia: string read FMunicipioIncidencia write FMunicipioIncidencia;
  end;

  TGBFRNFSeModelAbrasf204ServicoValores = class
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
    FValTotTributos: Currency;
  public
    property ValorServicos: Currency read FValorServicos write FValorServicos;
    property ValorDeducoes: Currency read FValorDeducoes write FValorDeducoes;
    property ValorPis: Currency read FValorPis write FValorPis;
    property ValorCofins: Currency read FValorCofins write FValorCofins;
    property ValorInss: Currency read FValorInss write FValorInss;
    property ValorIr: Currency read FValorIr write FValorIr;
    property ValorCsll: Currency read FValorCsll write FValorCsll;
    property OutrasRetencoes: Currency read FOutrasRetencoes write FOutrasRetencoes;
    property ValTotTributos: Currency read FValTotTributos write FValTotTributos;
    property DescontoIncondicionado: Currency read FDescontoIncondicionado write FDescontoIncondicionado;
    property DescontoCondicionado: Currency read FDescontoCondicionado write FDescontoCondicionado;
  end;

  TGBFRNFSeModelAbrasf204Tomador = class
  private
    FIdentificacaoTomador: TGBFRNFSeModelAbrasf204IdentificacaoPessoa;
    FRazaoSocial: string;
    FEndereco: TGBFRNFSeModelAbrasf204Endereco;
    FNifTomador: string;
    FEnderecoExterior: TGBFRNFSeModelAbrasf204EnderecoExterior;
  public
    constructor Create;
    destructor Destroy; override;

    property IdentificacaoTomador: TGBFRNFSeModelAbrasf204IdentificacaoPessoa read FIdentificacaoTomador write FIdentificacaoTomador;
    property NifTomador: string read FNifTomador write FNifTomador;
    property RazaoSocial: string read FRazaoSocial write FRazaoSocial;
    property Endereco: TGBFRNFSeModelAbrasf204Endereco read FEndereco write FEndereco;
    property EnderecoExterior: TGBFRNFSeModelAbrasf204EnderecoExterior read FEnderecoExterior write FEnderecoExterior;
  end;

  TGBFRNFSeModelAbrasf204ValoresNFSe = class
  private
    FBaseCalculo: Currency;
    FAliquota: Currency;
    FValorIss: Currency;
    FValorLiquidoNfse: Currency;
  public
    property BaseCalculo: Currency read FBaseCalculo write FBaseCalculo;
    property Aliquota: Currency read FAliquota write FAliquota;
    property ValorIss: Currency read FValorIss write FValorIss;
    property ValorLiquidoNfse: Currency read FValorLiquidoNfse write FValorLiquidoNfse;
  end;

implementation

{ TGBFRNFSeModelAbrasf204Prestador }

constructor TGBFRNFSeModelAbrasf204Prestador.Create;
begin
  FIdentificacao := TGBFRNFSeModelAbrasf204IdentificacaoPessoa.Create;
  FEndereco := TGBFRNFSeModelAbrasf204Endereco.Create;
  FContato := TGBFRNFSeModelAbrasf204Contato.Create;
end;

destructor TGBFRNFSeModelAbrasf204Prestador.Destroy;
begin
  FEndereco.Free;
  FContato.Free;
  FIdentificacao.Free;
  inherited;
end;

{ TGBFRNFSeModelAbrasf204Servico }

constructor TGBFRNFSeModelAbrasf204Servico.Create;
begin
  FValores := TGBFRNFSeModelAbrasf204ServicoValores.Create;
end;

destructor TGBFRNFSeModelAbrasf204Servico.Destroy;
begin
  FValores.Free;
  inherited;
end;

{ TGBFRNFSeModelAbrasf204IdentificacaoPessoa }

constructor TGBFRNFSeModelAbrasf204IdentificacaoPessoa.Create;
begin
  FCpfCnpj := TGBFRNFSeModelAbrasf204CPFCNPJ.Create;
end;

destructor TGBFRNFSeModelAbrasf204IdentificacaoPessoa.Destroy;
begin
  FCpfCnpj.Free;
  inherited;
end;

{ TGBFRNFSeModelAbrasf204Tomador }

constructor TGBFRNFSeModelAbrasf204Tomador.Create;
begin
  FIdentificacaoTomador := TGBFRNFSeModelAbrasf204IdentificacaoPessoa.Create;
  FEndereco := TGBFRNFSeModelAbrasf204Endereco.Create;
  FEnderecoExterior := TGBFRNFSeModelAbrasf204EnderecoExterior.Create;
end;

destructor TGBFRNFSeModelAbrasf204Tomador.Destroy;
begin
  FIdentificacaoTomador.Free;
  FEndereco.Free;
  FEnderecoExterior.Free;
  inherited;
end;

{ TGBFRNFSeModelAbrasf204InfPrestacaoServico }

constructor TGBFRNFSeModelAbrasf204InfPrestacaoServico.Create;
begin
  FRps := TGBFRNFSeModelAbrasf204RPS.Create;
  FRpsSubstituido := TGBFRNFSeModelAbrasf204RPSSubstituido.Create;
  FServico := TGBFRNFSeModelAbrasf204Servico.Create;
  FTomadorServico := TGBFRNFSeModelAbrasf204Tomador.Create;
  FOptanteSimplesNacional := False;
end;

destructor TGBFRNFSeModelAbrasf204InfPrestacaoServico.Destroy;
begin
  FRps.Free;
  FRpsSubstituido.Free;
  FServico.Free;
  FTomadorServico.Free;
  inherited;
end;

{ TGBFRNFSeModelAbrasf204PrestacaoServico }

constructor TGBFRNFSeModelAbrasf204PrestacaoServico.Create;
begin
  FInfDeclaracaoPrestacaoServico := TGBFRNFSeModelAbrasf204InfPrestacaoServico.Create;
end;

destructor TGBFRNFSeModelAbrasf204PrestacaoServico.Destroy;
begin
  FInfDeclaracaoPrestacaoServico.Free;
  inherited;
end;

{ TGBFRNFSeModelAbrasf204NFSeInfo }

constructor TGBFRNFSeModelAbrasf204NFSeInfo.Create;
begin
  FValoresNfse := TGBFRNFSeModelAbrasf204NFSeValores.Create;
  FPrestadorServico := TGBFRNFSeModelAbrasf204Prestador.Create;
  FOrgaoGerador := TGBFRNFSeModelAbrasf204OrgaoGerador.Create;
  FDeclaracaoPrestacaoServico := TGBFRNFSeModelAbrasf204PrestacaoServico.Create;
end;

destructor TGBFRNFSeModelAbrasf204NFSeInfo.Destroy;
begin
  FValoresNfse.Free;
  FPrestadorServico.Free;
  FOrgaoGerador.Free;
  FDeclaracaoPrestacaoServico.Free;
  inherited;
end;

{ TGBFRNFSeModelAbrasf204NFSe }

constructor TGBFRNFSeModelAbrasf204NFSe.Create;
begin
  FInfNfse := TGBFRNFSeModelAbrasf204NFSeInfo.Create;
end;

destructor TGBFRNFSeModelAbrasf204NFSe.Destroy;
begin
  FInfNfse.Free;
  inherited;
end;

function TGBFRNFSeModelAbrasf204NFSe.ToModelNFSe: TGBFRNFSeModel;
var
  LTomador: TGBFRNFSeModelAbrasf204Tomador;
  LServico: TGBFRNFSeModelAbrasf204Servico;
  LNFSeServico: TGBFRNFSeModelServico;
  LRPS: TGBFRNFSeModelAbrasf204RPS;
begin
  Result := TGBFRNFSeModel.Create;
  try
    {$REGION 'PRESTADOR'}
    Result.Prestador.RazaoSocial := Self.FInfNfse.PrestadorServico.RazaoSocial;
    Result.Prestador.NomeFantasia := Self.FInfNfse.PrestadorServico.NomeFantasia;
    Result.Prestador.NumeroDocumento := Self.FInfNfse.PrestadorServico.Identificacao.FCpfCnpj.Cnpj;
    if Result.Prestador.NumeroDocumento = EmptyStr then
      Result.Prestador.NumeroDocumento := Self.FInfNfse.PrestadorServico.Identificacao.FCpfCnpj.Cpf;

    Result.Prestador.InscricaoMunicipal := Self.FInfNfse.PrestadorServico.FIdentificacao.FInscricaoMunicipal;
    Result.Prestador.Telefone := Self.FInfNfse.PrestadorServico.Contato.Telefone;
    Result.Prestador.Email := Self.FInfNfse.PrestadorServico.Contato.Email;
    Result.Prestador.Endereco.Logradouro := Self.FInfNfse.PrestadorServico.Endereco.Endereco;
    Result.Prestador.Endereco.Numero := Self.FInfNfse.PrestadorServico.Endereco.Numero;
    Result.Prestador.Endereco.Complemento := Self.FInfNfse.PrestadorServico.Endereco.Complemento;
    Result.Prestador.Endereco.CEP := Self.FInfNfse.PrestadorServico.Endereco.CEP;
    Result.Prestador.Endereco.Bairro := Self.FInfNfse.PrestadorServico.Endereco.Bairro;
    Result.Prestador.Endereco.CodigoCidade := Self.FInfNfse.PrestadorServico.Endereco.CodigoMunicipio;
    Result.Prestador.Endereco.UF := Self.FInfNfse.PrestadorServico.Endereco.UF;
    Result.Prestador.Endereco.CodigoPais := '1058';
    Result.Prestador.Endereco.NomePais := 'Brasil';
    {$ENDREGION}

    {$REGION 'TOMADOR'}
    LTomador := FInfNfse.DeclaracaoPrestacaoServico.InfDeclaracaoPrestacaoServico.TomadorServico;
    Result.Tomador.RazaoSocial := LTomador.RazaoSocial;
    Result.Tomador.NomeFantasia := LTomador.RazaoSocial;
    Result.Tomador.Nif := LTomador.NifTomador;
    Result.Tomador.NumeroDocumento := LTomador.IdentificacaoTomador.CpfCnpj.Cnpj;
    if Result.Tomador.NumeroDocumento = EmptyStr then
      Result.Tomador.NumeroDocumento := LTomador.IdentificacaoTomador.CpfCnpj.Cpf;

    Result.Tomador.InscricaoMunicipal := LTomador.IdentificacaoTomador.InscricaoMunicipal;
    Result.Tomador.Endereco.Logradouro := LTomador.Endereco.Endereco;
    Result.Tomador.Endereco.Numero := LTomador.Endereco.Numero;
    Result.Tomador.Endereco.Complemento := LTomador.Endereco.Complemento;
    Result.Tomador.Endereco.CEP := LTomador.Endereco.CEP;
    Result.Tomador.Endereco.Bairro := LTomador.Endereco.Bairro;
    Result.Tomador.Endereco.CodigoCidade := LTomador.Endereco.CodigoMunicipio;
    Result.Tomador.Endereco.UF := LTomador.Endereco.UF;
    if LTomador.NifTomador = EmptyStr then
    begin
      Result.Tomador.Endereco.CodigoPais := '1058';
      Result.Tomador.Endereco.NomePais := 'Brasil';
    end;
    {$ENDREGION}

    {$REGION 'SERVICOS'}
    LServico := Self.InfNfse.DeclaracaoPrestacaoServico.InfDeclaracaoPrestacaoServico.Servico;
    LNFSeServico := TGBFRNFSeModelServico.Create;
    Result.Servicos.Add(LNFSeServico);
    LNFSeServico.ItemListaServico := LServico.ItemListaServico;
    LNFSeServico.Discriminacao := LServico.Discriminacao;
    LNFSeServico.CodigoCnae := LServico.CodigoCnae;
    LNFSeServico.CodigoTributacaoMunicipio := LServico.CodigoTributacaoMunicipio;
    LNFSeServico.MunicipioPrestacao := LServico.MunicipioIncidencia;
    LNFSeServico.Valor := LServico.Valores.ValorServicos;
    LNFSeServico.ValorIss := Self.InfNfse.ValoresNfse.ValorIss;
    LNFSeServico.BaseCalculo := Self.InfNfse.ValoresNfse.BaseCalculo;
    LNFSeServico.Aliquota := Self.InfNfse.ValoresNfse.Aliquota;
    LNFSeServico.ValorLiquido := Self.InfNfse.ValoresNfse.ValorLiquidoNfse;
    LNFSeServico.ValorDeducoes := LServico.Valores.ValorDeducoes;
    LNFSeServico.ValorPis := LServico.Valores.ValorPis;
    LNFSeServico.ValorCofins := LServico.Valores.ValorCofins;
    LNFSeServico.ValorInss := LServico.Valores.ValorInss;
    LNFSeServico.ValorIr := LServico.Valores.ValorIr;
    LNFSeServico.ValorCsll := LServico.Valores.ValorCsll;
    LNFSeServico.OutrasRetencoes := LServico.Valores.OutrasRetencoes;
    LNFSeServico.DescontoCondicionado := LServico.Valores.DescontoCondicionado;
    LNFSeServico.DescontoIncondicionado := LServico.Valores.DescontoIncondicionado;
    LNFSeServico.IssRetido := LServico.IssRetido;
    {$ENDREGION}

    {$REGION 'NFSe VALORES'}
    Result.ValorCredito := Self.InfNfse.ValorCredito;
    Result.Valor := LServico.Valores.ValorServicos;
    Result.ValorIss := Self.InfNfse.ValoresNfse.ValorIss;
    Result.BaseCalculo := Self.InfNfse.ValoresNfse.BaseCalculo;
    Result.ValorLiquido := Self.InfNfse.ValoresNfse.ValorLiquidoNfse;
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
    LRPS := FInfNfse.DeclaracaoPrestacaoServico.FInfDeclaracaoPrestacaoServico.Rps;
    Result.RPS := LRPS.FNumero;
    Result.Serie := LRPS.Serie;
    Result.TipoRPS := LRPS.Tipo;
    Result.Situacao := LRPS.GetSituacao;
    Result.Numero := FInfNfse.Numero;
    Result.CodigoVerificacao := FInfNfse.CodigoVerificacao;
    Result.DataEmissao := FInfNfse.DataEmissao;
    Result.OutrasInformacoes := FInfNfse.OutrasInformacoes;
    Result.OptanteSimplesNacional := FInfNfse.DeclaracaoPrestacaoServico.FInfDeclaracaoPrestacaoServico.OptanteSimplesNacional;
    Result.IncentivadorCultural := False;
    {$ENDREGION}
  except
    Result.Free;
    raise;
  end;
end;

{ TGBFRNFSeModelAbrasf204RPS }

function TGBFRNFSeModelAbrasf204RPS.GetSituacao: TNFSeSituacao;
begin
  Result := sNormal;
  if FStatus = '2' then
    Result := sCancelado;
end;

end.
