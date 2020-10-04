unit GBFR.NFe.XML.Interfaces;

interface

uses
  GBFR.NFe.Model.NotaFiscal;

type
  IGBFRNFeXML = interface
    ['{F77AAF88-CEA4-4534-AEF5-A43103A785EF}']
    function loadFromContent(Value: String): TGBRFNFeModelNotaFiscal;
    function loadFromFile   (Value: String): TGBRFNFeModelNotaFiscal;
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
