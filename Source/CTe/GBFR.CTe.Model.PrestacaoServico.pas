unit GBFR.CTe.Model.PrestacaoServico;

interface

uses
  GBFR.CTe.Model.ComponentePrestacao,
  System.Generics.Collections;

type TGBFRCTeModelPrestacaoServico = class
  private
    FvTPrest: Currency;
    FvRec: Currency;
    FComp: TObjectList<TGBFRCTeModelComponentePrestacao>;

  public
    property vTPrest: Currency read FvTPrest write FvTPrest;
    property vRec: Currency read FvRec write FvRec;
    property Comp: TObjectList<TGBFRCTeModelComponentePrestacao> read FComp write FComp;

    procedure AddComponente(Name: String; Value: Currency);

    constructor create;
    destructor  Destroy; override;
end;

implementation

{ TGBFRCTeModelPrestacaoServico }

procedure TGBFRCTeModelPrestacaoServico.AddComponente(Name: String; Value: Currency);
begin
  FComp.Add(TGBFRCTeModelComponentePrestacao.Create);
  FComp.Last.xNome := Name;
  FComp.Last.vComp := Value;
end;

constructor TGBFRCTeModelPrestacaoServico.create;
begin
  FComp := TObjectList<TGBFRCTeModelComponentePrestacao>.create;
end;

destructor TGBFRCTeModelPrestacaoServico.Destroy;
begin
  FComp.Free;
  inherited;
end;

end.
