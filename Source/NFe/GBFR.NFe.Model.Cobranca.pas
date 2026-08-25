unit GBFR.NFe.Model.Cobranca;

interface

{$IFDEF WEAKPACKAGEUNIT}
  {$WEAKPACKAGEUNIT ON}
{$ENDIF}

uses
  GBFR.NFE.Model.Duplicata,
  GBFR.NFe.Model.Fatura,
  System.Generics.Collections;

type TGBFRNFeModelCobranca = class
  private
    Fdup: TObjectList<TGBFRNFEModelDuplicata>;
    Ffat: TGBFRNFEModelFatura;

  public
    property dup: TObjectList<TGBFRNFEModelDuplicata> read Fdup write Fdup;
    property fat: TGBFRNFEModelFatura read Ffat write Ffat;

    constructor create;
    destructor  Destroy; override;
end;

implementation

{ TGBFRNFeModelCobranca }

constructor TGBFRNFeModelCobranca.create;
begin
  Fdup := TObjectList<TGBFRNFEModelDuplicata>.create;
  Ffat := TGBFRNFEModelFatura.create;
end;

destructor TGBFRNFeModelCobranca.Destroy;
begin
  Fdup.Free;
  Ffat.Free;
  inherited;
end;

end.
