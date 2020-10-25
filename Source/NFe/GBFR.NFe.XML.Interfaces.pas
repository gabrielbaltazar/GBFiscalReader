unit GBFR.NFe.XML.Interfaces;

interface

uses
  GBFR.NFe.Model.Classes;

type
  TGBRFNFeModel = GBFR.NFe.Model.Classes.TGBRFNFeModel;

  IGBFRNFeXML = interface
    ['{F77AAF88-CEA4-4534-AEF5-A43103A785EF}']
    function loadFromContent(Value: String): TGBRFNFeModel;
    function loadFromFile   (Value: String): TGBRFNFeModel;
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
