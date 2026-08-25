unit GBFR.NFe.Model.Item;

interface

{$IFDEF WEAKPACKAGEUNIT}
  {$WEAKPACKAGEUNIT ON}
{$ENDIF}

uses
  GBFR.NFe.Model.Prod,
  GBFR.NFe.Model.Item.Imposto,
  GBFR.NFe.Model.Item.ImpostoDevol,
  GBFR.NFe.Model.Item.IBSCBS,
  GBFR.NFe.Model.Item.ImpSel,
  GBFR.NFe.Model.DFeReferenciado;

type TGBFRNFeModelItem = class
  private
    FnItem: Integer;
    Fprod: TGBFRNFeModelProd;
    Fimposto: TGBFRNFeItemImposto;
    FimpostoDevol: TGBFRNFeItemImpostoDevol;
    FIBSCBS: TGBFRNFeItemIBSCBS;
    FImpSel: TGBFRNFeItemImpSel;
    FDFeReferenciado: TGBFRNFeModelDFeReferenciado;
  public
    property nItem: Integer read FnItem write FnItem;
    property prod: TGBFRNFeModelProd read Fprod write Fprod;
    property imposto: TGBFRNFeItemImposto read Fimposto write Fimposto;
    property impostoDevol: TGBFRNFeItemImpostoDevol read FimpostoDevol write FimpostoDevol;
    property IBSCBS: TGBFRNFeItemIBSCBS read FIBSCBS write FIBSCBS;
    property ImpSel: TGBFRNFeItemImpSel read FImpSel write FImpSel;
    property DFeReferenciado: TGBFRNFeModelDFeReferenciado read FDFeReferenciado;

    constructor create;
    destructor  Destroy; override;
end;

implementation

{ TGBFRNFeModelItem }

constructor TGBFRNFeModelItem.create;
begin
  Fprod := TGBFRNFeModelProd.Create;
  Fimposto := TGBFRNFeItemImposto.Create;
  FimpostoDevol := TGBFRNFeItemImpostoDevol.Create;
  FIBSCBS := TGBFRNFeItemIBSCBS.Create;
  FImpSel := TGBFRNFeItemImpSel.Create;
  FDFeReferenciado := TGBFRNFeModelDFeReferenciado.Create;
end;

destructor TGBFRNFeModelItem.Destroy;
begin
  Fprod.Free;
  Fimposto.Free;
  FimpostoDevol.Free;
  FIBSCBS.Free;
  FImpSel.Free;
  FDFeReferenciado.Free;
  inherited;
end;

end.
