unit GBFR.CTe.Model.InfoModal;

interface

uses
  GBFR.CTe.Model.ModalRodoviario;

type TGBFRCTeModelInfoModal = class
  private
    FversaoModal: String;
    Frodo: TGBFRCTeModelModalRodoviario;

  public
    property versaoModal: String read FversaoModal write FversaoModal;
    property rodo: TGBFRCTeModelModalRodoviario read Frodo write Frodo;

    constructor create;
    destructor  Destroy; override;
end;

implementation

{ TGBFRCTeModelInfoModal }

constructor TGBFRCTeModelInfoModal.create;
begin
  Frodo := TGBFRCTeModelModalRodoviario.Create;
end;

destructor TGBFRCTeModelInfoModal.Destroy;
begin
  Frodo.Free;
  inherited;
end;

end.
