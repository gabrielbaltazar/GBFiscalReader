unit GBFR.NFe.Model.Pagamento;

interface

uses
  GBFR.NFe.Model.FormaPagamento,
  System.Generics.Collections;

type TGBFRNFeModelPagamento = class
  private
    FvTroco: Currency;
    FdetPag: TObjectList<TGBFRNFeModelFormaPagamento>;

  public
    property vTroco: Currency read FvTroco write FvTroco;
    property detPag: TObjectList<TGBFRNFeModelFormaPagamento> read FdetPag write FdetPag;

    constructor create;
    destructor  Destroy; override;
end;

implementation

{ TGBFRNFeModelPagamento }

constructor TGBFRNFeModelPagamento.create;
begin
  FdetPag := TObjectList<TGBFRNFeModelFormaPagamento>.create;
end;

destructor TGBFRNFeModelPagamento.Destroy;
begin
  FdetPag.Free;
  inherited;
end;

end.
