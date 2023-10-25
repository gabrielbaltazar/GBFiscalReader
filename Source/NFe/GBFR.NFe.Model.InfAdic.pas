unit GBFR.NFe.Model.InfAdic;

interface

uses
  GBFR.NFe.Model.ObsFisco,
  GBFR.NFe.Model.ObsCont,
  GBFR.NFe.Model.ProcRef;

type
  TGBFRNFeModelInfAdic = class
  private
    FinfCpl: string;
    FinfAdFisco: String;
    FobsFisco: TGBFRNFeModelObsFisco;
    FprocRef: TGBFRNFeModelProcRef;
    FobsCont: TGBFRNFeModelObsCont;

  public
    property infAdFisco: String read FinfAdFisco write FinfAdFisco;
    property infCpl: string read FinfCpl write FinfCpl;
    property obsFisco: TGBFRNFeModelObsFisco read FobsFisco write FobsFisco;
    property obsCont: TGBFRNFeModelObsCont read FobsCont write FobsCont;
    property procRef: TGBFRNFeModelProcRef read FprocRef write FprocRef;

    constructor create;
    destructor  Destroy; override;
  end;

implementation

{ TGBFRNFeModelInfAdic }

constructor TGBFRNFeModelInfAdic.create;
begin
  FobsFisco   := TGBFRNFeModelObsFisco.Create;
  FobsCont    := TGBFRNFeModelObsCont.Create;
  FprocRef    := TGBFRNFeModelProcRef.Create;
end;

destructor TGBFRNFeModelInfAdic.Destroy;
begin
  FobsFisco.Free;
  FobsCont.Free;
  FprocRef.Free;
  inherited;
end;


end.
