unit GBFR.NFSe.XML.Abrasf204.Interfaces;

interface

uses
  System.Classes,
  GBFR.NFSe.XML.Interfaces,
  GBFR.NFSe.Model.Classes,
  GBFR.NFSe.Model.Abrasf204,
  GBFR.NFSe.Model.Types;

type
  IGBFRNFSeXMLAbrasf204 = interface
    ['{4F0AA84F-623C-4911-BBD1-4381944A632F}']
    function LoadFromContent(AValue: string): TGBFRNFSeModelAbrasf204CompNFSe;
    function LoadFromFile(AValue: string): TGBFRNFSeModelAbrasf204CompNFSe;
    function LoadFromStream(AValue: TStream): TGBFRNFSeModelAbrasf204CompNFSe;
  end;

implementation

end.
