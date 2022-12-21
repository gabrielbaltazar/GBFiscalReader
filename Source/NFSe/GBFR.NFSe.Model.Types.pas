unit GBFR.NFSe.Model.Types;

interface

type
  TNFSeExigilidadeIss = (eiNenhum, eiExigivel, eiNaoIncidencia, eiIsencao, eiExportacao,
    eiImunidade, eiSuspensaJudicial, eiSuspensaProcessoAdministrativo);

  TNFSeNaturezaOperacao = (noNenhum, noTributacaoMunicipio, noTributacaoForaMunicipio,
    noIsencao, noImune, noSuspensaJudicial, noSuspensaProcessoAdministrativo);

  TNFSeRegimeTributacao = (rtMicroEmpresa, rtEstimativa,
    rtSociedadeProfissionais, rtCooperativa);

  TNFSeSituacao = (sNormal, sCancelado);

  TNFSeExigilidadeIssHelper = record helper for TNFSeExigilidadeIss
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

end.
