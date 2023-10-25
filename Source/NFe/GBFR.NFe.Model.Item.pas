unit GBFR.NFe.Model.Item;

interface

uses
  GBFR.NFe.Model.Prod,
  GBFR.NFe.Model.Item.Imposto;

type TGBFRNFeModelItem = class
  private
    FnItem: Integer;
    Fprod: TGBFRNFeModelProd;
    Fimposto: TGBFRNFeItemImposto;

  public
    property nItem: Integer read FnItem write FnItem;
    property prod: TGBFRNFeModelProd read Fprod write Fprod;
    property imposto: TGBFRNFeItemImposto read Fimposto write Fimposto;

    constructor create;
    destructor  Destroy; override;
end;

implementation

{ TGBFRNFeModelItem }

constructor TGBFRNFeModelItem.create;
begin
  Fprod    := TGBFRNFeModelProd.Create;
  Fimposto := TGBFRNFeItemImposto.Create;
end;

destructor TGBFRNFeModelItem.Destroy;
begin
  Fprod.Free;
  Fimposto.Free;
  inherited;
end;

end.
