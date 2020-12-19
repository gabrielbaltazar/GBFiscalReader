unit GBFR.CTe.XML.Interfaces;

interface

uses
  GBFR.CTe.Model.Classes,
  System.Classes;

type
  TGBFRCTeModel = GBFR.CTe.Model.Classes.TGBFRCTeModel;

  IGBFRCTeXML = interface
    ['{C09B00E6-3091-45C1-A798-D6F6E48D3CF2}']
    function loadFromContent(Value: String): TGBFRCTeModel;
    function loadFromFile   (Value: String): TGBFRCTeModel;
    function loadFromStream (Value: TStream): TGBFRCTeModel;
  end;

function XMLCTeReader: IGBFRCTeXML;

implementation

uses
  GBFR.CTe.XML.Default;

function XMLCTeReader: IGBFRCTeXML;
begin
  result := TGBFRCTeXMLDefault.New;
end;

end.
