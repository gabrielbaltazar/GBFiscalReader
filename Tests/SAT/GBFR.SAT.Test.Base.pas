unit GBFR.SAT.Test.Base;

interface

uses
  System.SysUtils,
  System.Classes,
  Winapi.Windows,
  GBFR.SAT.Model.Classes,
  GBFR.SAT.Model.Types,
  GBFR.SAT.XML.Interfaces;

type
  TGBFRSATTestBase = class
  protected
    FCFe: TGBFRSATModelCFe;
    FInfCFe: TGBFRSATModelInfCFe;
    FXML: IGBFRSATXML;

    procedure LerXMLResource(AName: string);
    function LoadXMLResource(AName: string): string;
    function LoadXMLResourceStream(AName: string): TStream;
  end;

implementation

{ TGBFRSATTestBase }

procedure TGBFRSATTestBase.LerXMLResource(AName: string);
var
  AXml: string;
begin
  FXML := XMLSATReader;
  AXml := LoadXMLResource(AName);
  FCFe := FXML.LoadFromContent(AXml);
  FInfCFe := FCFe.infCFe;
end;

function TGBFRSATTestBase.LoadXMLResource(AName: string): string;
var
  LResource: TResourceStream;
  LStream: TStringStream;
begin
  LResource := TResourceStream.Create(HInstance, AName, RT_RCDATA);
  try
    LStream := TStringStream.Create;
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

function TGBFRSATTestBase.LoadXMLResourceStream(AName: string): TStream;
begin
  Result := TStringStream.Create(LoadXMLResource(AName));
end;

end.
