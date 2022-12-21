unit GBFR.NFSe.Model.Types;

interface

type
  TNFSeExigilidadeIss = (eiNenhum, eiExigivel, eiNaoIncidencia, eiIsencao, eiExportacao,
    eiImunidade, eiSuspensaJudicial, eiSuspensaProcessoAdministrativo);

  TNFSeNaturezaOperacao = (noNenhum, noTributacaoMunicipio, noTributacaoForaMunicipio,
    noIsencao, noImune, noSuspensaJudicial, noSuspensaProcessoAdministrativo);

  TNFSeRegimeTributacao = (rtNenhum, rtMicroEmpresa, rtEstimativa,
    rtSociedadeProfissionais, rtCooperativa);

  TNFSeSituacao = (sNormal, sCancelado);

  TNFSeExigilidadeIssHelper = record helper for TNFSeExigilidadeIss
  public
    procedure FromString(AValue: string);
  end;

  TNFSeNaturezaOperacaoHelper = record helper for TNFSeNaturezaOperacao
  public
    procedure FromString(AValue: string);
  end;

  TNFSeRegimeTributacaoHelper = record helper for TNFSeRegimeTributacao
  public
    procedure FromString(AValue: string);
  end;

implementation

{ TNFSeExigilidadeIssHelper }

procedure TNFSeExigilidadeIssHelper.FromString(AValue: string);
begin
  Self := eiNenhum;
  if AValue = '1' then
    Self := eiExigivel;
  if AValue = '2' then
    Self := eiNaoIncidencia;
  if AValue = '3' then
    Self := eiIsencao;
  if AValue = '4' then
    Self := eiExportacao;
  if AValue = '5' then
    Self := eiImunidade;
  if AValue = '6' then
    Self := eiSuspensaJudicial;
  if AValue = '7' then
    Self := eiSuspensaProcessoAdministrativo;
end;

{ TNFSeNaturezaOperacaoHelper }

procedure TNFSeNaturezaOperacaoHelper.FromString(AValue: string);
begin
  Self := noNenhum;
  if AValue = '1' then
    Self := noTributacaoMunicipio;
  if AValue = '2' then
    Self := noTributacaoForaMunicipio;
  if AValue = '3' then
    Self := noIsencao;
  if AValue = '4' then
    Self := noImune;
  if AValue = '5' then
    Self := noSuspensaJudicial;
  if AValue = '6' then
    Self := noSuspensaProcessoAdministrativo;
end;

{ TNFSeRegimeTributacaoHelper }

procedure TNFSeRegimeTributacaoHelper.FromString(AValue: string);
begin
  Self := rtNenhum;
  if AValue = '1' then
    Self := rtMicroEmpresa;
  if AValue = '2' then
    Self := rtEstimativa;
  if AValue = '3' then
    Self := rtSociedadeProfissionais;
  if AValue = '4' then
    Self := rtCooperativa;
end;

end.
