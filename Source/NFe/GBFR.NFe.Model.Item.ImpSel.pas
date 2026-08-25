unit GBFR.NFe.Model.Item.ImpSel;

interface

{$IFDEF WEAKPACKAGEUNIT}
  {$WEAKPACKAGEUNIT ON}
{$ENDIF}

type
  TGBFRNFeItemImpSel = class
  private
    FCST: string;
    FcClassTrib: string;
    FpImpSel: Double;
    FvImpSel: Currency;
    FvBCImpSel: Currency;
    FqTrib: Double;
    FpImpSelEspec: Double;
    FuTrib: string;
  public
    property CST: string read FCST write FCST;
    property cClassTrib: string read FcClassTrib write FcClassTrib;
    property vBCImpSel: Currency read FvBCImpSel write FvBCImpSel;
    property pImpSel: Double read FpImpSel write FpImpSel;
    property pImpSelEspec: Double read FpImpSelEspec write FpImpSelEspec;
    property uTrib: string read FuTrib write FuTrib;
    property qTrib: Double read FqTrib write FqTrib;
    property vImpSel: Currency read FvImpSel write FvImpSel;
  end;

implementation

end.
