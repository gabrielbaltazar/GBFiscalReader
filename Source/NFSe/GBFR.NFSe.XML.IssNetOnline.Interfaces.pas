unit GBFR.NFSe.XML.IssNetOnline.Interfaces;

interface

uses
  System.Classes,
  GBFR.NFSe.Model.IssNetOnline,
  GBFR.NFSe.Model.Types;

type
  IGBFRNFSeXMLIssNetOnline = interface
    ['{3D8F91D1-7C4B-4974-A740-C42B7887886D}']
    function LoadFromContent(AValue: string): TGBFRNFSeModelIssNetOnlineNFSe;
    function LoadFromFile(AValue: string): TGBFRNFSeModelIssNetOnlineNFSe;
    function LoadFromStream(AValue: TStream): TGBFRNFSeModelIssNetOnlineNFSe;
  end;

implementation

end.
