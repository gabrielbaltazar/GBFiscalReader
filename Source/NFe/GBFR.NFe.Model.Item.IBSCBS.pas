unit GBFR.NFe.Model.Item.IBSCBS;

interface

{$IFDEF WEAKPACKAGEUNIT}
  {$WEAKPACKAGEUNIT ON}
{$ENDIF}

type
  TGBFRNFeModelgCBS = class;

  TGBFRNFeModelgIBSCBS = class;

  TGBFRNFeModelgIBSMun = class;

  TGBFRNFeModelgIBSUF = class;

  TGBFRNFeModelgRed = class
  private
    FpAliqEfet: Currency;
    FpRedAliq: Currency;
  public
    property pRedAliq: Currency read FpRedAliq write FpRedAliq;
    property pAliqEfet: Currency read FpAliqEfet write FpAliqEfet;
  end;

  TGBFRNFeItemIBSCBS = class
  private
    FcClassTrib: string;
    FCST: string;
    FgIBSCBS: TGBFRNFeModelgIBSCBS;
  public
    constructor Create;
    destructor Destroy; override;

    property CST: string read FCST write FCST;
    property cClassTrib: string read FcClassTrib write FcClassTrib;
    property gIBSCBS: TGBFRNFeModelgIBSCBS read FgIBSCBS;
  end;

  TGBFRNFeModelgCBS = class
  private
    FpCBS: Currency;
    FvCBS: Currency;
    FgRed: TGBFRNFeModelgRed;
  public
    constructor Create;
    destructor Destroy; override;

    property pCBS: Currency read FpCBS write FpCBS;
    property vCBS: Currency read FvCBS write FvCBS;
    property gRed: TGBFRNFeModelgRed read FgRed write FgRed;
  end;

  TGBFRNFeModelgIBSCBS = class
  private
    FvBC: Currency;
    FgCBS: TGBFRNFeModelgCBS;
    FgIBSMun: TGBFRNFeModelgIBSMun;
    FgIBSUF: TGBFRNFeModelgIBSUF;
  public
    constructor Create;
    destructor Destroy; override;

    property vBC: Currency read FvBC write FvBC;
    property gIBSUF: TGBFRNFeModelgIBSUF read FgIBSUF write FgIBSUF;
    property gIBSMun: TGBFRNFeModelgIBSMun read FgIBSMun write FgIBSMun;
    property gCBS: TGBFRNFeModelgCBS read FgCBS write FgCBS;
  end;

  TGBFRNFeModelgIBSMun = class
  private
    FpIBSMun: Currency;
    FvIBSMun: Currency;
    FgRed: TGBFRNFeModelgRed;
  public
    constructor Create;
    destructor Destroy; override;

    property pIBSMun: Currency read FpIBSMun write FpIBSMun;
    property vIBSMun: Currency read FvIBSMun write FvIBSMun;
    property gRed: TGBFRNFeModelgRed read FgRed write FgRed;
  end;

  TGBFRNFeModelgIBSUF = class
  private
    FpIBSUF: Currency;
    FvIBSUF: Currency;
    FgRed: TGBFRNFeModelgRed;
  public
    constructor Create;
    destructor Destroy; override;

    property pIBSUF: Currency read FpIBSUF write FpIBSUF;
    property vIBSUF: Currency read FvIBSUF write FvIBSUF;
    property gRed: TGBFRNFeModelgRed read FgRed write FgRed;
  end;

implementation

{ TGBFRNFeItemIBSCBS }

constructor TGBFRNFeItemIBSCBS.Create;
begin
  FgIBSCBS := TGBFRNFeModelgIBSCBS.Create;
end;

destructor TGBFRNFeItemIBSCBS.Destroy;
begin
  FgIBSCBS.Free;
  inherited;
end;

{ TGBFRNFeModelgIBSCBS }

constructor TGBFRNFeModelgIBSCBS.Create;
begin
  FgCBS := TGBFRNFeModelgCBS.Create;
  FgIBSMun := TGBFRNFeModelgIBSMun.Create;
  FgIBSUF := TGBFRNFeModelgIBSUF.Create;
end;

destructor TGBFRNFeModelgIBSCBS.Destroy;
begin
  FgCBS.Free;
  FgIBSMun.Free;
  FgIBSUF.Free;
  inherited;
end;

{ TGBFRNFeModelgCBS }

constructor TGBFRNFeModelgCBS.Create;
begin
  FgRed := TGBFRNFeModelgRed.Create;
end;

destructor TGBFRNFeModelgCBS.Destroy;
begin
  FgRed.Free;
  inherited;
end;

{ TGBFRNFeModelgIBSMun }

constructor TGBFRNFeModelgIBSMun.Create;
begin
  FgRed := TGBFRNFeModelgRed.Create;
end;

destructor TGBFRNFeModelgIBSMun.Destroy;
begin
  FgRed.Free;
  inherited;
end;

{ TGBFRNFeModelgIBSUF }

constructor TGBFRNFeModelgIBSUF.Create;
begin
  FgRed := TGBFRNFeModelgRed.Create;
end;

destructor TGBFRNFeModelgIBSUF.Destroy;
begin
  FgRed.Free;
  inherited;
end;

end.
