unit GBFR.CTe.Model.InfoCarga;

interface

uses
  GBFR.CTe.Model.InfoQuantidade,
  System.Generics.Collections;

type TGBFRCTeModelInfoCarga = class
  private
    FvCarga: Currency;
    FproPred: String;
    FxOutCat: String;
    FinfQ: TObjectList<TGBFRCTeModelInfoQuantidade>;
    FvCargaAverb: Currency;

  public
    property vCarga: Currency read FvCarga write FvCarga;
    property proPred: String read FproPred write FproPred;
    property xOutCat: String read FxOutCat write FxOutCat;
    property vCargaAverb: Currency read FvCargaAverb write FvCargaAverb;
    property infQ: TObjectList<TGBFRCTeModelInfoQuantidade> read FinfQ write FinfQ;

    procedure AddInfoQuantidade;

    constructor create;
    destructor  Destroy; override;
end;

implementation

{ TGBFRCTeModelInfoCarga }

procedure TGBFRCTeModelInfoCarga.AddInfoQuantidade;
begin
  FinfQ.Add(TGBFRCTeModelInfoQuantidade.Create);
end;

constructor TGBFRCTeModelInfoCarga.create;
begin
  FinfQ := TObjectList<TGBFRCTeModelInfoQuantidade>.create;
end;

destructor TGBFRCTeModelInfoCarga.Destroy;
begin
  FinfQ.Free;
  inherited;
end;

end.
