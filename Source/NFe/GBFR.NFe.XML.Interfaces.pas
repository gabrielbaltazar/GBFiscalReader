unit GBFR.NFe.XML.Interfaces;

interface

uses
  GBFR.NFe.Model.Classes,
  System.Classes;

type
  TGBFRNFeModel = GBFR.NFe.Model.Classes.TGBFRNFeModel;

  IGBFRNFeXML = interface
    ['{F77AAF88-CEA4-4534-AEF5-A43103A785EF}']
    function loadFromContent(Value: WideString): TGBFRNFeModel;
    function loadFromFile   (Value: WideString): TGBFRNFeModel;
    function loadFromStream (Value: TStream): TGBFRNFeModel;
  end;

function XMLNFeReader: IGBFRNFeXML;

implementation

uses
  GBFR.NFe.XML.Default;

function XMLNFeReader: IGBFRNFeXML;
begin
  result := TGBFRNFeXMLDefault.New;
end;

end.
