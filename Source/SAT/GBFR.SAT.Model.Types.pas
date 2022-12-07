unit GBFR.SAT.Model.Types;

interface

type
  TSATAmbiente = (satProducao, satTestes);

  TSATIndicadorRegraCalculo = (satArredondamento,
    satTruncamento);

  TSATMeioPagamento = (mpDinheiro, mpCheque, mpCartaoCredito,
    mpCartaoDebito, mpCreditoLoja, mpValeAlimentacao,
    mpValeRefeicao, mpValePresente, mpValeCombustivel,
    mpOutros);

  TSATRegimeTributario = (satSimplesNacional, satRegimeNormal);

  TSATRegimeTributarioISSQN = (satMicroEmpresaMunicipal,
    satEstimativa, satSociedadeProfissionais, satCooperativa,
    satMicroEmpresarioIndividual);

  TSATAmbienteHelper = record helper for TSATAmbiente
  public
    procedure FromInteger(AValue: Integer);
    function Value: Integer;
  end;

  TSATIndicadorRegraCalculoHelper = record helper for TSATIndicadorRegraCalculo
  public
    procedure FromString(AValue: string);
    function Value: string;
  end;

  TSATMeioPagamentoHelper = record helper for TSATMeioPagamento
  public
    procedure FromString(AValue: string);
    function Value: string;
  end;

  TSATRegimeTributarioHelper = record helper for TSATRegimeTributario
  public
    procedure FromInteger(AValue: Integer);
    function Value: Integer;
  end;

  TSATRegimeTributarioISSQNHelper = record helper for TSATRegimeTributarioISSQN
  public
    procedure FromInteger(AValue: Integer);
    function Value: Integer;
  end;

implementation

{ TSATAmbienteHelper }

procedure TSATAmbienteHelper.FromInteger(AValue: Integer);
begin
  Self := satTestes;
  if AValue = 1 then
    Self := satProducao;
end;

function TSATAmbienteHelper.Value: Integer;
begin
  Result := 1;
  case Self of
    satProducao: Result := 1;
    satTestes: Result := 2;
  end;
end;

{ TSATRegimeTributarioHelper }

procedure TSATRegimeTributarioHelper.FromInteger(AValue: Integer);
begin
  Self := satSimplesNacional;
  if AValue = 3 then
    Self := satRegimeNormal;
end;

function TSATRegimeTributarioHelper.Value: Integer;
begin
  Result := 1;
  case Self of
    satSimplesNacional: Result := 1;
    satRegimeNormal: Result := 3;
  end;
end;

{ TSATRegimeTributarioISSQNHelper }

procedure TSATRegimeTributarioISSQNHelper.FromInteger(AValue: Integer);
begin
  Self := satMicroEmpresaMunicipal;
  if AValue = 2 then
    Self := satEstimativa;
  if AValue = 3 then
    Self := satSociedadeProfissionais;
  if AValue = 4 then
    Self := satCooperativa;
  if AValue = 5 then
    Self := satMicroEmpresarioIndividual
end;

function TSATRegimeTributarioISSQNHelper.Value: Integer;
begin
  Result := 1;
  case Self of
    satMicroEmpresaMunicipal: Result := 1;
    satEstimativa: Result := 2;
    satSociedadeProfissionais: Result := 3;
    satCooperativa: Result := 4;
    satMicroEmpresarioIndividual: Result := 5;
  end;
end;

{ TSATIndicadorRegraCalculoHelper }

procedure TSATIndicadorRegraCalculoHelper.FromString(AValue: string);
begin
  Self := satArredondamento;
  if AValue = 'T' then
    Self := satTruncamento;
end;

function TSATIndicadorRegraCalculoHelper.Value: string;
begin
  Result := 'A';
  case Self of
    satArredondamento: Result := 'A';
    satTruncamento: Result := 'T';
  end;
end;

{ TSATMeioPagamentoHelper }

procedure TSATMeioPagamentoHelper.FromString(AValue: string);
begin
  Self := mpOutros;
      {
  01 - Dinheiro
02 - Cheque
03 - Cartão de Crédito
04 - Cartão de Débito
05 - Crédito Loja
10 - Vale Alimentação
11 - Vale Refeição
12 - Vale Presente
13 - Vale Combustível
99 - Outros
  }
  if AValue = '01' then
    Self := mpDinheiro;
  if AValue = '02' then
    Self := mpCheque;
  if AValue = '03' then
    Self := mpCartaoCredito;
  if AValue = '04' then
    Self := mpCartaoDebito;
  if AValue = '05' then
    Self := mpCreditoLoja;
  if AValue = '10' then
    Self := mpValeAlimentacao;
  if AValue = '11' then
    Self := mpValeRefeicao;
  if AValue = '12' then
    Self := mpValePresente;
  if AValue = '13' then
    Self := mpValeCombustivel;
  if AValue = '99' then
    Self := mpOutros;
end;

function TSATMeioPagamentoHelper.Value: string;
begin
  Result := '99';
  case Self of
    mpDinheiro: Result := '01';
    mpCheque: Result := '02';
    mpCartaoCredito: Result := '03';
    mpCartaoDebito: Result := '04';
    mpCreditoLoja: Result := '05';
    mpValeAlimentacao: Result := '10';
    mpValeRefeicao: Result := '11';
    mpValePresente: Result := '12';
    mpValeCombustivel: Result := '13';
    mpOutros: Result := '99';
  end;
end;

end.
