unit GBFR.NFe.Model.Types;

interface

uses
  System.SysUtils;

type
  TNFeAmbiente = (NFeProducao, NFeHomologacao);

  TNFeCRT = (NFeSimplesNacional,
            NFeSimplesNacionalExcessoDeSublimiteDeReceitaBruta,
            NFeRegimeNormal);

  TNFeIndicadorIE = (NFeContribuinteICMS,
                    NFeContribuinteIsentoInscricao,
                    NFeNaoContribuinte);

  TNFeIndicadorTotal = (NFeNaoCompoe, NFeCompoe);

  TNFeModalidadeBC = (NFeMargemValorAgregado,
                      NFePauta,
                      NFePrecoTabelado,
                      NFeValorOperacao);

  TNFeModalidadeBCST = (NFeSTPrecoTabelado,
                        NFeSTListaNegativa,
                        NFeSTListaPositiva,
                        NFeSTListaNeutra,
                        NFeSTMargemValorAgregado,
                        NFeSTPauta);

  TNFeFormaPagamento = (NFeFPDinheiro,
                        NFeFPCheque,
                        NFeFPCartaoCredito,
                        NFeFPCartaoDebito,
                        NFeFPCreditoLoja,
                        NFeFPValeAlimentacao,
                        NFeFPValeRefeicao,
                        NFeFPValePresente,
                        NFeFPValeCombustivel,
                        NFeFPBoletoBancario,
                        NFeFPSemPagamento,
                        NFeFPOutros);

  TNFeBandeiraOperadora = (NFeVisa,
                           NFeMastercard,
                           NFeAmericanExpress,
                           NFeSorocred,
                           NFeDinnersClub,
                           NFeElo,
                           NFeHipercard,
                           NFeAura,
                           NFeCabal,
                           NFeOutros);

  TNFeTipoIntegracaoPagamento = (NFeIntegrado, NFeNaoIntegrado);

  TNFeAmbienteHelper = record helper for TNFeAmbiente
  public
    procedure fromInteger(Value: Integer);
    function Value: Integer;
  end;

  TNFeCRTHelper = record helper for TNFeCRT
  public
    procedure fromInteger(Value: Integer);
    function Value: Integer;
  end;

  TNFeIndicadorIEHelper = record helper for TNFeIndicadorIE
  public
    procedure fromInteger(Value: Integer);
    function Value: Integer;
  end;

  TNFeIndicadorTotalHelper = record helper for TNFeIndicadorTotal
  public
    procedure fromInteger(Value: Integer);
    function Value: Integer;
  end;

  TNFeModalidadeBCHelper = record helper for TNFeModalidadeBC
  public
    procedure fromInteger(Value: Integer);
    function Value: Integer;
  end;

  TNFeModalidadeBCSTHelper = record helper for TNFeModalidadeBCST
  public
    procedure fromInteger(Value: Integer);
    function Value: Integer;
  end;

  TNFeFormaPagamentoHelper = record helper for TNFeFormaPagamento
  public
    procedure fromString(Value: String);
    function Value: String;
  end;

  TNFeBandeiraOperadoraHelper = record helper for TNFeBandeiraOperadora
  public
    procedure fromString(Value: String);
    function Value: String;
  end;

  TNFeTipoIntegracaoPagamentoHelper = record helper for TNFeTipoIntegracaoPagamento
  public
    procedure fromInteger(Value: Integer);
    function Value: Integer;
  end;

implementation

{ NFeAmbienteHelper }

procedure TNFeAmbienteHelper.fromInteger(Value: Integer);
begin
  Self := NFeHomologacao;
  if Value = 1 then
    Self := NFeProducao;
end;

function TNFeAmbienteHelper.Value: Integer;
begin
  result := 2;
  case Self of
    NFeProducao    : result := 1;
    NFeHomologacao : result := 2;
  end;
end;

{ NFeCRTHelper }

procedure TNFeCRTHelper.fromInteger(Value: Integer);
begin
  if (Value < 1) or (Value > 3) then
    raise Exception.CreateFmt('Invalid NFeCRT, must be in 1, 2 or 3.', []);

  Self := TNFeCRT(Value - 1);
end;

function TNFeCRTHelper.Value: Integer;
begin
  Result := Integer(Self) + 1;
end;

{ NFeIndicadorIEHelper }

procedure TNFeIndicadorIEHelper.fromInteger(Value: Integer);
begin
  if Value = 1 then
  begin
    Self := NFeContribuinteICMS;
    Exit;
  end;

  if Value = 2 then
  begin
    Self := NFeContribuinteIsentoInscricao;
    Exit;
  end;

  if Value = 9 then
  begin
    Self := NFeNaoContribuinte;
    Exit;
  end;

  raise Exception.CreateFmt('Invalid Value for NFeIndicadorIE, must be in 1, 2 or 9.', []);
end;

function TNFeIndicadorIEHelper.Value: Integer;
begin
  result := -1;
  case Self of
    NFeContribuinteICMS            : result := 1;
    NFeContribuinteIsentoInscricao : result := 2;
    NFeNaoContribuinte             : result := 9;
  end;
end;

{ NFeIndicadorTotalHelper }

procedure TNFeIndicadorTotalHelper.fromInteger(Value: Integer);
begin
  Self := TNFeIndicadorTotal(Value);

  if Value > 1 then
    raise Exception.CreateFmt('Invalid Value for NFeIndicadorTotal, must be in 0 or 1.', []);
end;

function TNFeIndicadorTotalHelper.Value: Integer;
begin
  result := -1;
  case Self of
    NFeNaoCompoe: result := 0;
    NFeCompoe   : result := 1;
  end;
end;

{ TNFeModalidadeBCHelper }

procedure TNFeModalidadeBCHelper.fromInteger(Value: Integer);
begin
  Self := TNFeModalidadeBC(Value);

  if Integer(Self) = -1 then
    raise Exception.CreateFmt('Invalid Value for NFeModalidadeBC, must be in 0, 1, 2 or 3.', []);
end;

function TNFeModalidadeBCHelper.Value: Integer;
begin
  result := Integer(Self);
end;

{ TNFeModalidadeBCSTHelper }

procedure TNFeModalidadeBCSTHelper.fromInteger(Value: Integer);
begin
  Self := TNFeModalidadeBCST(Value);

  if Integer(Self) = -1 then
    raise Exception.CreateFmt('Invalid Value for NFeModalidadeBCST, must be in 0, 1, 2, 3, 4 or 5.', []);
end;

function TNFeModalidadeBCSTHelper.Value: Integer;
begin
  result := Integer(Self);
end;

{ TNFeFormaPagamentoHelper }

procedure TNFeFormaPagamentoHelper.fromString(Value: String);
begin
  if Value = '01' then
  begin
    Self := NFeFPDinheiro;
    Exit;
  end;

  if Value = '02' then
  begin
    Self := NFeFPCheque;
    Exit;
  end;

  if Value = '03' then
  begin
    Self := NFeFPCartaoCredito;
    Exit;
  end;

  if Value = '04' then
  begin
    Self := NFeFPCartaoDebito;
    Exit;
  end;

  if Value = '05' then
  begin
    Self := NFeFPCreditoLoja;
    Exit;
  end;

  if Value = '10' then
  begin
    Self := NFeFPValeAlimentacao;
    Exit;
  end;

  if Value = '11' then
  begin
    Self := NFeFPValeRefeicao;
    Exit;
  end;

  if Value = '12' then
  begin
    Self := NFeFPValePresente;
    Exit;
  end;

  if Value = '13' then
  begin
    Self := NFeFPValeCombustivel;
    Exit;
  end;

  if Value = '15' then
  begin
    Self := NFeFPBoletoBancario;
    Exit;
  end;

  if Value = '90' then
  begin
    Self := NFeFPSemPagamento;
    Exit;
  end;

  if Value = '99' then
  begin
    Self := NFeFPOutros;
    Exit;
  end;
end;

function TNFeFormaPagamentoHelper.Value: String;
begin
  case Self of
    NFeFPDinheiro        : Result := '01';
    NFeFPCheque          : Result := '02';
    NFeFPCartaoCredito   : Result := '03';
    NFeFPCartaoDebito    : Result := '04';
    NFeFPCreditoLoja     : Result := '05';
    NFeFPValeAlimentacao : Result := '10';
    NFeFPValeRefeicao    : Result := '11';
    NFeFPValePresente    : Result := '12';
    NFeFPValeCombustivel : Result := '13';
    NFeFPBoletoBancario  : Result := '15';
    NFeFPSemPagamento    : Result := '90';
    NFeFPOutros          : Result := '99';
  end;
end;

{ TNFeBandeiraOperadoraHelper }

procedure TNFeBandeiraOperadoraHelper.fromString(Value: String);
begin
  if Value = '01' then
  begin
    Self := NFeVisa;
    Exit;
  end;

  if Value = '02' then
  begin
    Self := NFeMastercard;
    Exit;
  end;

  if Value = '03' then
  begin
    Self := NFeAmericanExpress;
    Exit;
  end;

  if Value = '04' then
  begin
    Self := NFeSorocred;
    Exit;
  end;

  if Value = '05' then
  begin
    Self := NFeDinnersClub;
    Exit;
  end;

  if Value = '06' then
  begin
    Self := NFeElo;
    Exit;
  end;

  if Value = '07' then
  begin
    Self := NFeHipercard;
    Exit;
  end;

  if Value = '08' then
  begin
    Self := NFeAura;
    Exit;
  end;

  if Value = '09' then
  begin
    Self := NFeCabal;
    Exit;
  end;

  if Value = '99' then
  begin
    Self := NFeOutros;
    Exit;
  end;
end;

function TNFeBandeiraOperadoraHelper.Value: String;
begin
  case Self of
    NFeVisa            : result := '01';
    NFeMastercard      : result := '02';
    NFeAmericanExpress : result := '03';
    NFeSorocred        : result := '04';
    NFeDinnersClub     : result := '05';
    NFeElo             : result := '06';
    NFeHipercard       : result := '07';
    NFeAura            : result := '08';
    NFeCabal           : result := '09';
    NFeOutros          : result := '99';
  end;
end;

{ TNFeTipoIntegracaoPagamentoHelper }

procedure TNFeTipoIntegracaoPagamentoHelper.fromInteger(Value: Integer);
begin
  if Value = 1 then
  begin
    Self := NFeIntegrado;
    Exit;
  end;

  if Value = 2 then
  begin
    Self := NFeNaoIntegrado;
    Exit;
  end;
end;

function TNFeTipoIntegracaoPagamentoHelper.Value: Integer;
begin
  result := 1;
  case Self of
    NFeIntegrado    : result := 1;
    NFeNaoIntegrado : result := 2;
  end;
end;

end.
