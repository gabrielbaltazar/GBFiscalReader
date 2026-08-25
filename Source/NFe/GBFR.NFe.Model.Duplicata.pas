unit GBFR.NFe.Model.Duplicata;

interface

{$IFDEF WEAKPACKAGEUNIT}
  {$WEAKPACKAGEUNIT ON}
{$ENDIF}

type TGBFRNFeModelDuplicata = class
  private
    FnDup: string;
    FdVenc: TDate;
    FvDup: Currency;

  public
    property nDup: string read FnDup write FnDup;
    property dVenc: TDate read FdVenc write FdVenc;
    property vDup: Currency read FvDup write FvDup;

    constructor create;
    destructor  Destroy; override;
end;

implementation

{ TGBFRNFeModelDuplicata }

constructor TGBFRNFeModelDuplicata.create;
begin
end;

destructor TGBFRNFeModelDuplicata.Destroy;
begin
  inherited;
end;

end.
