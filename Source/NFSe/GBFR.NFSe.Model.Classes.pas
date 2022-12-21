unit GBFR.NFSe.Model.Classes;

interface

uses
  GBFR.NFSe.Model.Types,
  System.SysUtils,
  System.Classes,
  System.Generics.Collections;

type
  TGBFRNFSeModelEndereco = class;
  TGBFRNFSeModelPessoa = class;
  TGBFRNFSeModelServico = class;

  TGBFRNFSeModel = class
  private
    FPrestador: TGBFRNFSeModelPessoa;
    FTomador: TGBFRNFSeModelPessoa;
    FNumero: string;
    FCodigoVerificacao: string;
    FDataEmissao: TDateTime;
    FOutrasInformacoes: string;
    FOptanteSimplesNacional: Boolean;
    FIncentivadorCultural: Boolean;
    FRPS: string;
    FSerie: string;
    FTipoRPS: string;
    FValor: Currency;
    FValorIssRetido: Currency;
    FDescontoCondicionado: Currency;
    FValorCsll: Currency;
    FDescontoIncondicionado: Currency;
    FValorLiquido: Currency;
    FValorIss: Currency;
    FValorPis: Currency;
    FValorCofins: Currency;
    FValorInss: Currency;
    FOutrasRetencoes: Currency;
    FValorDeducoes: Currency;
    FBaseCalculo: Currency;
    FValorIr: Currency;
    FServicos: TObjectList<TGBFRNFSeModelServico>;
    FValorCredito: Currency;
    FSituacao: TNFSeSituacao;
    function GetDiscriminacaoServicos: string;
  public
    constructor Create;
    destructor Destroy; override;

    property Prestador: TGBFRNFSeModelPessoa read FPrestador write FPrestador;
    property Tomador: TGBFRNFSeModelPessoa read FTomador write FTomador;
    property Numero: string read FNumero write FNumero;
    property RPS: string read FRPS write FRPS;
    property Serie: string read FSerie write FSerie;
    property TipoRPS: string read FTipoRPS write FTipoRPS;
    property Situacao: TNFSeSituacao read FSituacao write FSituacao;
    property CodigoVerificacao: string read FCodigoVerificacao write FCodigoVerificacao;
    property DiscriminacaoServicos: string read GetDiscriminacaoServicos;
    property DataEmissao: TDateTime read FDataEmissao write FDataEmissao;
    property OutrasInformacoes: string read FOutrasInformacoes write FOutrasInformacoes;
    property OptanteSimplesNacional: Boolean read FOptanteSimplesNacional write FOptanteSimplesNacional;
    property IncentivadorCultural: Boolean read FIncentivadorCultural write FIncentivadorCultural;

    property Servicos: TObjectList<TGBFRNFSeModelServico> read FServicos write FServicos;

    property Valor: Currency read FValor write FValor;
    property BaseCalculo: Currency read FBaseCalculo write FBaseCalculo;
    property ValorIss: Currency read FValorIss write FValorIss;
    property ValorLiquido: Currency read FValorLiquido write FValorLiquido;
    property ValorDeducoes: Currency read FValorDeducoes write FValorDeducoes;
    property ValorPis: Currency read FValorPis write FValorPis;
    property ValorCofins: Currency read FValorCofins write FValorCofins;
    property ValorInss: Currency read FValorInss write FValorInss;
    property ValorIr: Currency read FValorIr write FValorIr;
    property ValorCsll: Currency read FValorCsll write FValorCsll;
    property OutrasRetencoes: Currency read FOutrasRetencoes write FOutrasRetencoes;
    property ValorIssRetido: Currency read FValorIssRetido write FValorIssRetido;
    property ValorCredito: Currency read FValorCredito write FValorCredito;
    property DescontoCondicionado: Currency read FDescontoCondicionado write FDescontoCondicionado;
    property DescontoIncondicionado: Currency read FDescontoIncondicionado write FDescontoIncondicionado;
  end;

  TGBFRNFSeModelEndereco = class
  private
    FLogradouro: string;
    FNumero: string;
    FComplemento: string;
    FBairro: string;
    FCodigoCidade: string;
    FNomeCidade: string;
    FUF: string;
    FCodigoPais: string;
    FNomePais: string;
    FCEP: string;
  public
    property Logradouro: string read FLogradouro write FLogradouro;
    property Numero: string read FNumero write FNumero;
    property Complemento: string read FComplemento write FComplemento;
    property CEP: string read FCEP write FCEP;
    property Bairro: string read FBairro write FBairro;
    property CodigoCidade: string read FCodigoCidade write FCodigoCidade;
    property NomeCidade: string read FNomeCidade write FNomeCidade;
    property UF: string read FUF write FUF;
    property CodigoPais: string read FCodigoPais write FCodigoPais;
    property NomePais: string read FNomePais write FNomePais;
  end;

  TGBFRNFSeModelPessoa = class
  private
    FRazaoSocial: string;
    FNomeFantasia: string;
    FNumeroDocumento: string;
    FInscricaoMunicipal: string;
    FNif: string;
    FTelefone: string;
    FEmail: string;
    FEndereco: TGBFRNFSeModelEndereco;
  public
    constructor Create;
    destructor Destroy; override;
  
    property RazaoSocial: string read FRazaoSocial write FRazaoSocial;
    property NomeFantasia: string read FNomeFantasia write FNomeFantasia;
    property NumeroDocumento: string read FNumeroDocumento write FNumeroDocumento;
    property InscricaoMunicipal: string read FInscricaoMunicipal write FInscricaoMunicipal;
    property Nif: string read FNif write FNif;
    property Telefone: string read FTelefone write FTelefone;
    property Email: string read FEmail write FEmail;
    property Endereco: TGBFRNFSeModelEndereco read FEndereco write FEndereco;
  end;

  TGBFRNFSeModelServico = class
  private
    FItemListaServico: string;
    FDiscriminacao: string;
    FCodigoCnae: string;
    FCodigoTributacaoMunicipio: string;
    FDescricaoTributacaoMunicipio: string;
    FMunicipioPrestacao: string;
    FValor: Currency;
    FBaseCalculo: Currency;
    FAliquota: Currency;
    FValorLiquido: Currency;
    FValorIss: Currency;
    FValorDeducoes: Currency;
    FValorPis: Currency;
    FValorCofins: Currency;
    FValorInss: Currency;
    FValorIr: Currency;
    FValorCsll: Currency;
    FOutrasRetencoes: Currency;
    FValorIssRetido: Currency;
    FDescontoCondicionado: Currency;
    FDescontoIncondicionado: Currency;
    FIssRetido: Boolean;
  public
    property ItemListaServico: string read FItemListaServico write FItemListaServico;
    property Discriminacao: string read FDiscriminacao write FDiscriminacao;
    property CodigoCnae: string read FCodigoCnae write FCodigoCnae;
    property CodigoTributacaoMunicipio: string read FCodigoTributacaoMunicipio write FCodigoTributacaoMunicipio;
    property DescricaoTributacaoMunicipio: string read FDescricaoTributacaoMunicipio write FDescricaoTributacaoMunicipio;
    property MunicipioPrestacao: string read FMunicipioPrestacao write FMunicipioPrestacao;
    property Valor: Currency read FValor write FValor;
    property BaseCalculo: Currency read FBaseCalculo write FBaseCalculo;
    property Aliquota: Currency read FAliquota write FAliquota;
    property ValorIss: Currency read FValorIss write FValorIss;
    property ValorLiquido: Currency read FValorLiquido write FValorLiquido;
    property ValorDeducoes: Currency read FValorDeducoes write FValorDeducoes;
    property ValorPis: Currency read FValorPis write FValorPis;
    property ValorCofins: Currency read FValorCofins write FValorCofins;
    property ValorInss: Currency read FValorInss write FValorInss;
    property ValorIr: Currency read FValorIr write FValorIr;
    property ValorCsll: Currency read FValorCsll write FValorCsll;
    property OutrasRetencoes: Currency read FOutrasRetencoes write FOutrasRetencoes;
    property ValorIssRetido: Currency read FValorIssRetido write FValorIssRetido;
    property DescontoCondicionado: Currency read FDescontoCondicionado write FDescontoCondicionado;
    property DescontoIncondicionado: Currency read FDescontoIncondicionado write FDescontoIncondicionado;
    property IssRetido: Boolean read FIssRetido write FIssRetido;
  end;

implementation

{ TGBFRNFSeModelPessoa }

constructor TGBFRNFSeModelPessoa.Create;
begin
  FEndereco := TGBFRNFSeModelEndereco.Create;
end;

destructor TGBFRNFSeModelPessoa.Destroy;
begin
  FEndereco.Free;
  inherited;
end;

{ TGBFRNFSeModel }

constructor TGBFRNFSeModel.Create;
begin
  FTomador := TGBFRNFSeModelPessoa.Create;
  FPrestador := TGBFRNFSeModelPessoa.Create;
  FServicos := TObjectList<TGBFRNFSeModelServico>.Create;
end;

destructor TGBFRNFSeModel.Destroy;
begin
  FTomador.Free;
  FPrestador.Free;
  FServicos.Free;
  inherited;
end;

function TGBFRNFSeModel.GetDiscriminacaoServicos: string;
var
  I: Integer;
begin
  if FServicos.Count = 0 then
    Exit(EmptyStr);

  Result := FServicos[0].Discriminacao;
  for I := 1 to Pred(FServicos.Count) do
    Result := Result + ' | ' + FServicos[I].Discriminacao;
end;

end.
