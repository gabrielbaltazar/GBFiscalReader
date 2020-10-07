unit GBFR.NFe.Test.Base;

interface

uses
  DUnitX.TestFramework,
  System.SysUtils,
  System.Classes,
  Winapi.Windows;

type
  [TestFixture]
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

initialization
  TDUnitX.RegisterTestFixture(TGBFRNFeTestBase);

end.
