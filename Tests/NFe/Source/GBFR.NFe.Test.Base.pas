unit GBFR.NFe.Test.Base;

interface

uses
  System.SysUtils,
  System.Classes,
  Winapi.Windows;

type
  TGBFRNFeTestBase = class

  protected
    function LoadXMLResource(Name: String): string;

  end;

implementation

{ TGBFRNFeTestBase }

function TGBFRNFeTestBase.LoadXMLResource(Name: String): string;
var
  resource: TResourceStream;
  stream  : TStringStream;
begin
  resource := TResourceStream.Create(HInstance, Name, RT_RCDATA);
  try
    stream := TStringStream.Create;
    try
      stream.LoadFromStream(resource);
      result := stream.DataString;
    finally
      stream.Free;
    end;
  finally
    resource.Free;
  end;
end;

end.
