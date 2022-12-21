unit GBFR.NFSe.Test.Base;

interface

uses
  System.SysUtils,
  System.Classes,
  Winapi.Windows;

type
  TGBFRNFSeTestBase = class
  protected
    function LoadXMLResource(AName: string): string;
    function LoadXMLResourceStream(AName: string): TStream;
  end;

implementation

{ TGBFRNFSeTestBase }

function TGBFRNFSeTestBase.LoadXMLResource(AName: string): string;
var
  LResource: TResourceStream;

  function LoadStream(AEncoding: TEncoding): string;
  var
    LStream: TStringStream;
  begin
    LStream := TStringStream.Create('', AEncoding);
    try
      LStream.LoadFromStream(LResource);
      Result := LStream.DataString;
    finally
      LStream.Free;
    end;
  end;
begin
  LResource := TResourceStream.Create(HInstance, AName, RT_RCDATA);
  try
    try
      Result := LoadStream(TEncoding.UTF8);
    except
      Result := LoadStream(TEncoding.ANSI);
    end;
  finally
    LResource.Free;
  end;
end;

function TGBFRNFSeTestBase.LoadXMLResourceStream(AName: string): TStream;
begin
  Result := TStringStream.Create(LoadXMLResource(AName));
end;

end.
