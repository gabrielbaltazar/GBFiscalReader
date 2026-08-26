unit GBFR.NFeAvulsa.XML.Interfaces;

interface

{$IFDEF WEAKPACKAGEUNIT}
  {$WEAKPACKAGEUNIT ON}
{$ENDIF}

uses
  System.Classes,
  GBFR.NFeAvulsa.Classes;

type
  IGBFRNFeAvulsaXML = interface
    ['{17236A8B-1368-4D3B-99A1-05296BF1D6CB}']
    function LoadFromContent(const AValue: WideString): TGBFRNFeAvulsaNFeProc; overload;
    function LoadFromContent(const AValue: TStream): TGBFRNFeAvulsaNFeProc; overload;
    function LoadFromFile(const AFileName: string): TGBFRNFeAvulsaNFeProc;
  end;

function GetNFeAvulsaXML: IGBFRNFeAvulsaXML;

implementation

uses
  GBFR.NFeAvulsa.XML.Default;

function GetNFeAvulsaXML: IGBFRNFeAvulsaXML;
begin
  Result := TGBFRNFeAvulsaXMLDefault.New;
end;

end.
