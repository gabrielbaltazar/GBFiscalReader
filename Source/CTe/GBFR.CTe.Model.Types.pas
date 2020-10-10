unit GBFR.CTe.Model.Types;

interface

uses
  System.SysUtils;

type
  TCTeAmbiente = (CTeProducao, CTeHomologacao);

  TCTeFormatoImpressao = (CTeRetrato, CTePaisagem);

  TCTeFormaEmissao = (CTeEmissaoNormal,
                      CTeEPECPelaSVC,
                      CTeContingenciaFSDA,
                      CTeAutorizacaoSVCRS,
                      CTeAutorizacaoSVCSP);

  TCTeTipoCTe = (CTeNormal,
                 CTeComplementoDeValores,
                 CTeAnulacao,
                 CTeSubstituicao);

  TCTeProcessoEmissao = (CTeAplicativoContribuinte,
                         CTeAplicativoSEBRAE);

  TCTeModal = (CTeRodoviario,
               CTeAereo,
               CTeAquaviario,
               CTeFerroviario,
               CTeDutoviario,
               CTeMultimodal);

  TCTeTipoServico = (CTeServicoNormal,
                     CTeSubcontratacao,
                     CTeRedespacho,
                     CTeRedespachoIntermediario,
                     CTeServicoVinculadoMultimodal);

  TCTeIndicadorIE = (CTeContribuinteICMS,
                     CTeContribuinteIsentoInscricao,
                     CTeNaoContribuinte);

  TCTeAmbienteHelper = record helper for TCTeAmbiente
  public
    procedure fromInteger(Value: Integer);
    function Value: Integer;
  end;

  TCTeIndicadorIEHelper = record helper for TCTeIndicadorIE
  public
    procedure fromInteger(Value: Integer);
    function Value: Integer;
  end;

  TCTeFormatoImpressaoHelper = record helper for TCTeFormatoImpressao
  public
    procedure fromInteger(Value: Integer);
    function Value: Integer;
  end;

  TCTeFormaEmissaoHelper = record helper for TCTeFormaEmissao
  public
    procedure fromInteger(Value: Integer);
    function Value: Integer;
  end;

  TCTeTipoCTeHelper = record helper for TCTeTipoCTe
  public
    procedure fromInteger(Value: Integer);
    function Value: Integer;
  end;

  TCTeProcessoEmissaoHelper = record helper for TCTeProcessoEmissao
  public
    procedure fromInteger(Value: Integer);
    function Value: Integer;
  end;

  TCTeModalHelper = record helper for TCTeModal
  public
    procedure fromString(Value: String);
    function Value: String;
  end;

  TCTeTipoServicoHelper = record helper for TCTeTipoServico
  public
    procedure fromInteger(Value: Integer);
    function Value: Integer;
  end;

implementation

{ TCTeAmbienteHelper }

procedure TCTeAmbienteHelper.fromInteger(Value: Integer);
begin
  Self := CTeHomologacao;
  if Value = 1 then
    Self := CTeProducao;
end;

function TCTeAmbienteHelper.Value: Integer;
begin
  result := 2;
  case Self of
    CTeProducao    : result := 1;
    CTeHomologacao : result := 2;
  end;
end;

{ TCTeIndicadorIEHelper }

procedure TCTeIndicadorIEHelper.fromInteger(Value: Integer);
begin
  if Value = 1 then
  begin
    Self := CTeContribuinteICMS;
    Exit;
  end;

  if Value = 2 then
  begin
    Self := CTeContribuinteIsentoInscricao;
    Exit;
  end;

  if Value = 9 then
  begin
    Self := CTeNaoContribuinte;
    Exit;
  end;

  raise Exception.CreateFmt('Invalid Value for CTeIndicadorIE, must be in 1, 2 or 9.', []);
end;

function TCTeIndicadorIEHelper.Value: Integer;
begin
  result := -1;
  case Self of
    CTeContribuinteICMS            : result := 1;
    CTeContribuinteIsentoInscricao : result := 2;
    CTeNaoContribuinte             : result := 9;
  end;
end;

{ TCTeFormatoImpressaoHelper }

procedure TCTeFormatoImpressaoHelper.fromInteger(Value: Integer);
begin
  Self := CTeRetrato;
  if Value = 2 then
    Self := CTePaisagem;
end;

function TCTeFormatoImpressaoHelper.Value: Integer;
begin
  result := Integer(Self) + 1;
end;

{ TCTeFormaEmissaoHelper }

procedure TCTeFormaEmissaoHelper.fromInteger(Value: Integer);
begin
  if Value = 1 then
  begin
    Self := CTeEmissaoNormal;
    Exit;
  end;

  if Value = 4 then
  begin
    Self := CTeEPECPelaSVC;
    Exit;
  end;

  if Value = 5 then
  begin
    Self := CTeContingenciaFSDA;
    Exit;
  end;

  if Value = 7 then
  begin
    Self := CTeAutorizacaoSVCRS;
    Exit;
  end;

  if Value = 8 then
  begin
    Self := CTeAutorizacaoSVCSP;
    Exit;
  end;
end;

function TCTeFormaEmissaoHelper.Value: Integer;
begin
  result := 1;
  case Self of
    CTeEmissaoNormal    : result := 1;
    CTeEPECPelaSVC      : result := 4;
    CTeContingenciaFSDA : result := 5;
    CTeAutorizacaoSVCRS : result := 7;
    CTeAutorizacaoSVCSP : result := 8;
  end;
end;

{ TCTeTipoCTeHelper }

procedure TCTeTipoCTeHelper.fromInteger(Value: Integer);
begin
  Self := TCTeTipoCTe(Value);
end;

function TCTeTipoCTeHelper.Value: Integer;
begin
  result := Integer(Self);
end;

{ TCTeProcessoEmissaoHelper }

procedure TCTeProcessoEmissaoHelper.fromInteger(Value: Integer);
begin
  if Value = 0 then
  begin
    Self := CTeAplicativoContribuinte;
    Exit;
  end;

  if Value = 3 then
  begin
    Self := CTeAplicativoSEBRAE;
    Exit;
  end;
end;

function TCTeProcessoEmissaoHelper.Value: Integer;
begin
  result := 0;
  case Self of
    CTeAplicativoContribuinte : result := 0;
    CTeAplicativoSEBRAE       : result := 3;
  end;
end;

{ TCTeModalHelper }

procedure TCTeModalHelper.fromString(Value: String);
begin
  if Value = '01' then
  begin
    Self := CTeRodoviario;
    Exit;
  end;

  if Value = '02' then
  begin
    Self := CTeAereo;
    Exit;
  end;

  if Value = '03' then
  begin
    Self := CTeAquaviario;
    Exit;
  end;

  if Value = '04' then
  begin
    Self := CTeFerroviario;
    Exit;
  end;

  if Value = '05' then
  begin
    Self := CTeDutoviario;
    Exit;
  end;

  if Value = '06' then
  begin
    Self := CTeMultimodal;
    Exit;
  end;
end;

function TCTeModalHelper.Value: String;
begin
  result := '01';
  case Self of
    CTeRodoviario  : result := '01';
    CTeAereo       : result := '02';
    CTeAquaviario  : result := '03';
    CTeFerroviario : result := '04';
    CTeDutoviario  : result := '05';
    CTeMultimodal  : result := '06';
  end;
end;

{ TCTeTipoServicoHelper }

procedure TCTeTipoServicoHelper.fromInteger(Value: Integer);
begin
  Self := TCTeTipoServico(Value);
end;

function TCTeTipoServicoHelper.Value: Integer;
begin
  result := Integer(Self);
end;

end.
