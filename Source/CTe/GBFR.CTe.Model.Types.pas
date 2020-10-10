unit GBFR.CTe.Model.Types;

interface

uses
  System.SysUtils;

type
  TCTeAmbiente = (CTeProducao, CTeHomologacao);

  TCTeFormatoImpressao = (CTeRetrato, CTePaisagem);

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

end.
