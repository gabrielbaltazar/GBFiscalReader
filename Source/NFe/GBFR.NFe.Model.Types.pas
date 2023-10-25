unit GBFR.NFe.Model.Types;

interface

uses
  System.SysUtils;

type
  TNFeAmbiente = (NFeProducao, NFeHomologacao);

  TNFeTipoOperacao = (NFeEntrada, NFeSaida);

  TNFeDestinoOperacao = (NFeInterna,
                         NFeInterestadual,
                         NFeExterior);

  TNFeFormatoImpressao = (NFeSemGeracao,
                          NFeRetrato,
                          NFePaisagem,
                          NFeSimplificado,
                          NFeDanfeNFCe,
                          NFeDanfeNFCeMensagemEletronica);

  TNFeTipoEmissao = (NFeEmissaoNormal,
                     NFeContingenciaFSIA,
                     NFeContingenciaScan,
                     NFeContingenciaDPEC,
                     NFeContingenciaFSDA,
                     NFeContingenciaSVCAN,
                     NFeContingenciaSVCRS,
                     NFeContingenciaOffline);

  TNFeFinalidadeEmissao = (NFeNormal,
                           NFeComplementar,
                           NFeAjuste,
                           NFeDevolucaoMercadoria);

  TNFeOperacaoConsumidor = (NFeOperacaoNormal,
                            NFeConsumidorFinal);

  TNFeIndicadorPresenca = (NFeNaoSeAplica,
                           NFeOperacaoPresencial,
                           NFeInternet,
                           NFeTeleatendimento,
                           NFeNFCeDomicilio,
                           NFeNaoPresencialOutros);

  TNFeIndicadorOrigemProcesso = (NFeOrigemProcessoSEFAZ,
                                 NFeOrigemProcessoJusticaFederal,
                                 NFeOrigemProcessoJusticaEstadual,
                                 NFeOrigemProcessoSecexRFB,
                                 NFeOrigemProcessoOutros);

  TNFeProcessoEmissao = (NFeAplicativoContribuinte,
                         NFeAvulsaPeloFisco,
                         NFeContribuinteComCertificado,
                         NFeContribuinteAppFisco);

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

  TNFeMotivoDesoneracao = (
    NFeMdTaxi,
    NFeMdDeficienteFisico,
    NFeMdProdutorAgropecuario,
    NFeMdFrotista,
    NFeMdDiplomatico,
    NFeMdUtilitarios,
    NFeMdSuframa,
    NFeMdVendaOrgaoPublico,
    NFeMdOutros,
    NFeMdDeficienciaCondutor,
    NFeMdDeficienciaNaoCondutor,
    NFeMdOrgaoFomento,
    NFeMdOlimpiadas,
    NFeMdSolicitadoPeloFisco,
    NFeMdVazio
  );

  TNFeIndicadorPagamento = (NFeIPAvista, NFeIPAprazo, NFeVazio);

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
                        NFeFPDepositoBancario,
                        NFeFPPIX,
                        NFeFPTransferenciaBancaria,
                        NFeFPProgFidelidadeCashbackCredVirt,
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

  TNFeIndicadorExigilidadeISS = (
    NFeExigivel,
    NFeNaoIncidencia,
    NFeIsencao,
    NFeExportacao,
    NFeImunidade,
    NFeSuspensaDecisaoJudicial,
    NFeSuspensaProcessoAdministrativo);

  TNFeIndicadorIncentivoFiscal = (
    NFeIIFSim,
    NFeIIFNao);

  TNFeDIIndicadorIntermedio = (
    NFeDIPorContaPropria,
    NFeDIPorContaEordem,
    NFeDIPorEncomenda);

  TNFeDIIndicadorViaTransp = (
    NFeDIMaritima,
    NFeDIFluvial,
    NFeDILacustre,
    NFeDIAerea,
    NFeDIPostal,
    NFeDIFerroviaria,
    NFeDIRodoviaria,
    NFeDIConduto,
    NFeDIMeiosProprios,
    NFeDIEntradaSaidaFicta,
    NFeDICourier,
    NFeDIHandcarry);

  TNFeAmbienteHelper = record helper for TNFeAmbiente
  public
    procedure fromInteger(Value: Integer);
    function Value: Integer;
  end;

  TNFeMotivoDesoneracaoHelper = record helper for TNFeMotivoDesoneracao
  public
    procedure fromString(Value: string);
    function Value: string;
  end;

  TNFeTipoOperacaoHelper = record helper for TNFeTipoOperacao
  public
    procedure fromInteger(Value: Integer);
    function Value: Integer;
  end;

  TNFeDestinoOperacaoHelper = record helper for TNFeDestinoOperacao
  public
    procedure fromInteger(Value: Integer);
    function Value: Integer;
  end;

  TNFeFormatoImpressaoHelper = record helper for TNFeFormatoImpressao
  public
    procedure fromInteger(Value: Integer);
    function Value: Integer;
  end;

  TNFeTipoEmissaoHelper = record helper for TNFeTipoEmissao
  public
    procedure fromInteger(Value: Integer);
    function Value: Integer;
  end;

  TNFeFinalidadeEmissaoHelper = record helper for TNFeFinalidadeEmissao
  public
    procedure fromInteger(Value: Integer);
    function Value: Integer;
  end;

  TNFeOperacaoConsumidorHelper = record helper for TNFeOperacaoConsumidor
  public
    procedure fromInteger(Value: Integer);
    function Value: Integer;
  end;

  TNFeIndicadorPresencaHelper = record helper for TNFeIndicadorPresenca
  public
    procedure fromInteger(Value: Integer);
    function Value: Integer;
  end;

  TNFeProcessoEmissaoHelper = record helper for TNFeProcessoEmissao
  public
    procedure fromInteger(Value: Integer);
    function Value: Integer;
  end;

  TNFeCRTHelper = record helper for TNFeCRT
  public
    procedure fromInteger(Value: Integer);
    function Value: Integer;
  end;

  TNFeIndicadorOrigemProcessoHelper = record helper for TNFeIndicadorOrigemProcesso
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

  TNFeIndicadorPagamentoHelper = record helper for TNFeIndicadorPagamento
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

  TNFeIndicadorExigilidadeISSHelper = record helper for TNFeIndicadorExigilidadeISS
  public
    procedure fromInteger(Value: Integer);
    function Value: Integer;
  end;

  TNFeIndicadorIncentivoFiscalHelper = record helper for TNFeIndicadorIncentivoFiscal
  public
    procedure fromInteger(Value: Integer);
    function Value: Integer;
  end;

  TNFeDIIndicadorIntermedioHelper = record helper for TNFeDIIndicadorIntermedio
  public
    procedure fromInteger(Value: Integer);
    function Value: Integer;
  end;

  TNFeDIIndicadorViaTranspHelper = record helper for TNFeDIIndicadorViaTransp
  public
    procedure fromInteger(Value: Integer);
    function Value: Integer;
  end;


implementation

var
  aStrMotivoDesoneracao: array of string = ['1','2','3','4','5','6','7','8','9','11','12','16','90'];
  aStrFormaPagamento: array of string = ['01','02','03','04','05','10','11','12','13','15','16','17','18','19','90','99'];


{ TNFeAmbienteHelper }

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

{ TNFeCRTHelper }

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

{ TNFeIndicadorIEHelper }

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
    NFeContribuinteICMS : result := 1;
    NFeContribuinteIsentoInscricao : result := 2;
    NFeNaoContribuinte : result := 9;
  end;
end;

{ TNFeIndicadorOrigemProcessoHelper }

procedure TNFeIndicadorOrigemProcessoHelper.fromInteger(Value: Integer);
begin
  if Value = 0 then
  begin
    Self := NFeOrigemProcessoSEFAZ;
    Exit;
  end;

  if Value = 1 then
  begin
    Self := NFeOrigemProcessoJusticaFederal;
    Exit;
  end;

  if Value = 2 then
  begin
    Self := NFeOrigemProcessoJusticaEstadual;
    Exit;
  end;

  if Value = 3 then
  begin
    Self := NFeOrigemProcessoSecexRFB;
    Exit;
  end;

  if Value = 9 then
  begin
    Self := NFeOrigemProcessoOutros;
    Exit;
  end;

  raise Exception.CreateFmt('Invalid Value for NFeIndicadorOrigemProcesso, must be in 0, 1, 2, 3 or 9.', []);
end;

function TNFeIndicadorOrigemProcessoHelper.Value: Integer;
begin
  result := -1;
  case Self of
    NFeOrigemProcessoSEFAZ : result := 0;
    NFeOrigemProcessoJusticaFederal : result := 1;
    NFeOrigemProcessoJusticaEstadual : result := 2;
    NFeOrigemProcessoSecexRFB : result := 3;
    NFeOrigemProcessoOutros : result := 9;
  end;
end;

{ TNFeIndicadorTotalHelper }

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
var i: Integer;
begin
  for i := Low(aStrFormaPagamento) to high(aStrFormaPagamento) do
    if AnsiSameText(Value, aStrFormaPagamento[i]) then
      Self := TNFeFormaPagamento(i);
end;

function TNFeFormaPagamentoHelper.Value: String;
begin
  case Self of
    NFeFPDinheiro                       : Result := '01';
    NFeFPCheque                         : Result := '02';
    NFeFPCartaoCredito                  : Result := '03';
    NFeFPCartaoDebito                   : Result := '04';
    NFeFPCreditoLoja                    : Result := '05';
    NFeFPValeAlimentacao                : Result := '10';
    NFeFPValeRefeicao                   : Result := '11';
    NFeFPValePresente                   : Result := '12';
    NFeFPValeCombustivel                : Result := '13';
    NFeFPBoletoBancario                 : Result := '15';
    NFeFPDepositoBancario               : Result := '16';
    NFeFPPIX                            : Result := '17';
    NFeFPTransferenciaBancaria          : Result := '18';
    NFeFPProgFidelidadeCashbackCredVirt : Result := '19';
    NFeFPSemPagamento                   : Result := '90';
    NFeFPOutros                         : Result := '99';
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

{ TNFeTipoOperacaoHelper }

procedure TNFeTipoOperacaoHelper.fromInteger(Value: Integer);
begin
  Self := TNFeTipoOperacao(Value);
end;

function TNFeTipoOperacaoHelper.Value: Integer;
begin
  result := Integer(Self);
end;

{ TNFeDestinoOperacaoHelper }

procedure TNFeDestinoOperacaoHelper.fromInteger(Value: Integer);
begin
  Self := TNFeDestinoOperacao(Value - 1);
end;

function TNFeDestinoOperacaoHelper.Value: Integer;
begin
  result := Integer(Self) + 1;
end;

{ TNFeFormatoImpressaoHelper }

procedure TNFeFormatoImpressaoHelper.fromInteger(Value: Integer);
begin
  Self := TNFeFormatoImpressao(Value);
end;

function TNFeFormatoImpressaoHelper.Value: Integer;
begin
  result := Integer(Self);
end;

{ TNFeTipoEmissaoHelper }

procedure TNFeTipoEmissaoHelper.fromInteger(Value: Integer);
begin
  if Value = 1 then
  begin
    Self := NFeEmissaoNormal;
    Exit;
  end;

  if Value = 2 then
  begin
    Self := NFeContingenciaFSIA;
    Exit;
  end;

  if Value = 3 then
  begin
    Self := NFeContingenciaScan;
    Exit;
  end;

  if Value = 4 then
  begin
    Self := NFeContingenciaDPEC;
    Exit;
  end;

  if Value = 5 then
  begin
    Self := NFeContingenciaFSDA;
    Exit;
  end;

  if Value = 6 then
  begin
    Self := NFeContingenciaSVCAN;
    Exit;
  end;

  if Value = 7 then
  begin
    Self := NFeContingenciaSVCRS;
    Exit;
  end;

  if Value = 9 then
  begin
    Self := NFeContingenciaOffline;
    Exit;
  end;
end;

function TNFeTipoEmissaoHelper.Value: Integer;
begin
  Result := 1;
  case Self of
    NFeEmissaoNormal       : Result := 1;
    NFeContingenciaFSIA    : Result := 2;
    NFeContingenciaScan    : Result := 3;
    NFeContingenciaDPEC    : Result := 4;
    NFeContingenciaFSDA    : Result := 5;
    NFeContingenciaSVCAN   : Result := 6;
    NFeContingenciaSVCRS   : Result := 7;
    NFeContingenciaOffline : Result := 9;
  end;
end;

{ TNFeFinalidadeEmissaoHelper }

procedure TNFeFinalidadeEmissaoHelper.fromInteger(Value: Integer);
begin
  Self := TNFeFinalidadeEmissao(Value - 1);
end;

function TNFeFinalidadeEmissaoHelper.Value: Integer;
begin
  result := Integer(Self) + 1;
end;

{ TNFeOperacaoConsumidorHelper }

procedure TNFeOperacaoConsumidorHelper.fromInteger(Value: Integer);
begin
  Self := TNFeOperacaoConsumidor(Value)
end;

function TNFeOperacaoConsumidorHelper.Value: Integer;
begin
  result := Integer(Self);
end;

{ TNFeIndicadorPresencaHelper }

procedure TNFeIndicadorPresencaHelper.fromInteger(Value: Integer);
begin
  Self := TNFeIndicadorPresenca(Value);
  if Value = 9 then
    Self := NFeNaoPresencialOutros;
end;

function TNFeIndicadorPresencaHelper.Value: Integer;
begin
  result := 0;
  case Self of
    NFeNaoSeAplica         : result := 0;
    NFeOperacaoPresencial  : result := 1;
    NFeInternet            : result := 2;
    NFeTeleatendimento     : result := 3;
    NFeNFCeDomicilio       : result := 4;
    NFeNaoPresencialOutros : result := 9;
  end;
end;

{ TNFeProcessoEmissaoHelper }

procedure TNFeProcessoEmissaoHelper.fromInteger(Value: Integer);
begin
  Self := TNFeProcessoEmissao(Value);
end;

function TNFeProcessoEmissaoHelper.Value: Integer;
begin
  result := Integer(Self);
end;

{ TNFeIndicadorExigilidadeISSHelper }

procedure TNFeIndicadorExigilidadeISSHelper.fromInteger(Value: Integer);
begin
  Self := TNFeIndicadorExigilidadeISS(Value - 1);
end;

function TNFeIndicadorExigilidadeISSHelper.Value: Integer;
begin
  result := Integer(Self) + 1;
end;

{ TNFeIndicadorIncentivoFiscalHelper }

procedure TNFeIndicadorIncentivoFiscalHelper.fromInteger(Value: Integer);
begin
  Self := TNFeIndicadorIncentivoFiscal(Value - 1);
end;

function TNFeIndicadorIncentivoFiscalHelper.Value: Integer;
begin
  result := Integer(Self) + 1;
end;

{ TNFeMotivoDesoneracaoHelper }

procedure TNFeMotivoDesoneracaoHelper.fromString(Value: string);
var i: Integer;
begin
  Self := NFeMdVazio;
  for i := Low(aStrMotivoDesoneracao) to high(aStrMotivoDesoneracao) do
    if AnsiSameText(Value, aStrMotivoDesoneracao[i]) then
      Self := TNFeMotivoDesoneracao(i);
end;

function TNFeMotivoDesoneracaoHelper.Value: string;
begin
  case Self of
    NFeMdTaxi                  : result := '1';
    NFeMdDeficienteFisico      : result := '2';
    NFeMdProdutorAgropecuario  : result := '3';
    NFeMdFrotista              : result := '4';
    NFeMdDiplomatico           : result := '5';
    NFeMdUtilitarios           : result := '6';
    NFeMdSuframa               : result := '7';
    NFeMdVendaOrgaoPublico     : result := '8';
    NFeMdOutros                : result := '9';
    NFeMdDeficienciaCondutor   : result := '10';
    NFeMdDeficienciaNaoCondutor: result := '11';
    NFeMdOrgaoFomento          : result := '12';
    NFeMdOlimpiadas            : result := '16';
    NFeMdSolicitadoPeloFisco   : result := '90';
  else
    result := EmptyStr;
  end;
end;


{ TNFeDIIndicadorIntermedioHelper }

procedure TNFeDIIndicadorIntermedioHelper.fromInteger(Value: Integer);
begin
  Self := TNFeDIIndicadorIntermedio(Value - 1);
end;

function TNFeDIIndicadorIntermedioHelper.Value: Integer;
begin
  result := Integer(Self) + 1;
end;

{ TNFeDIIndicadorViaTranspHelper }

procedure TNFeDIIndicadorViaTranspHelper.fromInteger(Value: Integer);
begin
  Self := TNFeDIIndicadorViaTransp(Value - 1);
end;

function TNFeDIIndicadorViaTranspHelper.Value: Integer;
begin
  result := Integer(Self) + 1;
end;

{ TNFeIndicadorPagamentoHelper }

procedure TNFeIndicadorPagamentoHelper.fromString(Value: String);
begin
  Self := NFeVazio;

  if Value = '0' then
    Self := NFeIPAvista;

  if Value = '1' then
    Self := NFeIPAprazo;
end;

function TNFeIndicadorPagamentoHelper.Value: String;
begin
  case Self of
    NFeIPAvista : Result := '0';
    NFeIPAprazo : Result := '1';
  else
    Result := EmptyStr;
  end;
end;

end.


