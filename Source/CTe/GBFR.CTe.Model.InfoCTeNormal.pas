unit GBFR.CTe.Model.InfoCTeNormal;

interface

uses
  GBFR.CTe.Model.InfoCarga,
  GBFR.CTe.Model.InfoDoc,
  GBFR.CTe.Model.InfoModal;

type TGBFRCTeModelInfoCTeNormal = class
  private
    FinfCarga: TGBFRCTeModelInfoCarga;
    FinfDoc: TGBFRCTeModelInfoDoc;
    FinfModal: TGBFRCTeModelInfoModal;

  public
    property infCarga: TGBFRCTeModelInfoCarga read FinfCarga write FinfCarga;
    property infDoc: TGBFRCTeModelInfoDoc read FinfDoc write FinfDoc;
    property infModal: TGBFRCTeModelInfoModal read FinfModal write FinfModal;

    constructor create;
    destructor  Destroy; override;
end;

implementation

{ TGBFRCTeModelInfoCTeNormal }

constructor TGBFRCTeModelInfoCTeNormal.create;
begin
  FinfCarga := TGBFRCTeModelInfoCarga.create;
  FinfDoc   := TGBFRCTeModelInfoDoc.create;
  FinfModal := TGBFRCTeModelInfoModal.create;
end;

destructor TGBFRCTeModelInfoCTeNormal.Destroy;
begin
  FinfCarga.Free;
  FinfDoc.Free;
  FinfModal.Free;
  inherited;
end;

end.
