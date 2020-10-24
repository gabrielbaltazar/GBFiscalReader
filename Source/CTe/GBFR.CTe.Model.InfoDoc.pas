unit GBFR.CTe.Model.InfoDoc;

interface

uses
  GBFR.CTe.Model.InfoNFe,
  System.Generics.Collections;

type TGBFRCTeModelInfoDoc = class
  private
    FinfoNFe: TObjectList<TGBFRCTeModelInfoNFe>;

  public
    property infoNFe: TObjectList<TGBFRCTeModelInfoNFe> read FinfoNFe write FinfoNFe;

    constructor create;
    destructor  Destroy; override;
end;

implementation

{ TGBFRCTeModelInfoDoc }

constructor TGBFRCTeModelInfoDoc.create;
begin
  FinfoNFe := TObjectList<TGBFRCTeModelInfoNFe>.create;
end;

destructor TGBFRCTeModelInfoDoc.Destroy;
begin
  FinfoNFe.Free;
  inherited;
end;

end.
