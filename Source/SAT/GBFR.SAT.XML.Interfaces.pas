unit GBFR.SAT.XML.Interfaces;

interface

uses
  GBFR.SAT.Model.Classes,
  System.SysUtils,
  System.Classes;

type
  TGBFRSATModelCFe = GBFR.SAT.Model.Classes.TGBFRSATModelCFe;

  IGBFRSATXML = interface
    ['{23C3FD59-EB91-4DFB-93F0-21484677799A}']
    function LoadFromContent(AValue: string): TGBFRSATModelCFe;
    function LoadFromFile(AValue: string): TGBFRSATModelCFe;
    function LoadFromStream(AValue: TStream): TGBFRSATModelCFe;
  end;

function XMLSATReader: IGBFRSATXML;

implementation

uses
  GBFR.SAT.XML.Default;

function XMLSATReader: IGBFRSATXML;
begin
  Result := TGBFRSATXMLDefault.New;
end;

end.
