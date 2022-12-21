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
  LStream: TStringStream;
begin
  LResource := TResourceStream.Create(HInstance, AName, RT_RCDATA);
  try
    LStream := TStringStream.Create('', TEncoding.UTF8);
    try
      LStream.LoadFromStream(LResource);
      Result := LStream.DataString;
      Result := Result.Replace('﻿', '');
    finally
      LStream.Free;
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
