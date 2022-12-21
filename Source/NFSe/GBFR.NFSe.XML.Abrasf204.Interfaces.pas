unit GBFR.NFSe.XML.Abrasf204.Interfaces;

interface

uses
  System.Classes,
  GBFR.NFSe.Model.Abrasf204,
  GBFR.NFSe.Model.Types;

type
  IGBFRNFSeXMLAbrasf204 = interface
    ['{4F0AA84F-623C-4911-BBD1-4381944A632F}']
    function LoadFromContent(AValue: string): TGBFRNFSeModelAbrasf204NFSe;
    function LoadFromFile(AValue: string): TGBFRNFSeModelAbrasf204NFSe;
    function LoadFromStream(AValue: TStream): TGBFRNFSeModelAbrasf204NFSe;
  end;

implementation

end.
