unit GBFR.NFe.Model.Imposto.IPI;

interface

{$IFDEF WEAKPACKAGEUNIT}
  {$WEAKPACKAGEUNIT ON}
{$ENDIF}

type
  TGBFRNFeModelIPITrib = class;

  TGBFRNFeModelIPI = class
  private
    FcEnq: string;
    FCNPJProd: string;
    FclEnq: string;
    FcSelo: string;
    FqSelo: Double;
    FIPITrib: TGBFRNFeModelIPITrib;
  public
    constructor Create;
    destructor Destroy; override;

    function CST: string;
    function vBC: Currency;
    function pIPI: Currency;
    function vIPI: Currency;

    property clEnq: string read FclEnq write FclEnq;
    property CNPJProd: string read FCNPJProd write FCNPJProd;
    property cSelo: string read FcSelo write FcSelo;
    property qSelo: Double read FqSelo write FqSelo;
    property cEnq: string read FcEnq write FcEnq;
    property IPITrib: TGBFRNFeModelIPITrib read FIPITrib;
  end;

  TGBFRNFeModelIPITrib = class
  private
    FvBC: Currency;
    FpIPI: Currency;
    FvIPI: Currency;
    FCST: string;
  public
    property CST: string read FCST write FCST;
    property vBC: Currency read FvBC write FvBC;
    property pIPI: Currency read FpIPI write FpIPI;
    property vIPI: Currency read FvIPI write FvIPI;
  end;

implementation

{ TGBFRNFeModelIPI }

constructor TGBFRNFeModelIPI.Create;
begin
  FIPITrib := TGBFRNFeModelIPITrib.Create;
end;

function TGBFRNFeModelIPI.CST: string;
begin
  Result := FIPITrib.CST;
end;

destructor TGBFRNFeModelIPI.Destroy;
begin
  FIPITrib.Free;
  inherited;
end;

function TGBFRNFeModelIPI.pIPI: Currency;
begin
  Result := FIPITrib.pIPI;
end;

function TGBFRNFeModelIPI.vBC: Currency;
begin
  Result := FIPITrib.vBC;
end;

function TGBFRNFeModelIPI.vIPI: Currency;
begin
  Result := FIPITrib.vIPI;
end;

end.
