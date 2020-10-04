unit GBFR.NFe.XML.Interfaces;

interface

uses
  GBFR.NFe.Model.NotaFiscal;

type
  IGBFRNFeXML = interface
    ['{F77AAF88-CEA4-4534-AEF5-A43103A785EF}']
    function loadFromContent(Value: String): TGBRFNFeModelNotaFiscal;
  end;

implementation

end.
