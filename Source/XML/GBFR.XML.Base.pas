unit GBFR.XML.Base;

interface

uses
  System.SysUtils,
  System.Classes,
  Xml.XMLIntf,
  Xml.XMLDoc;

type
  TGBFRXmlBase = class(TInterfacedObject)
  protected
    FXml: IXMLDocument;

    function Iso8601ToDateTime(AValue: string): TDateTime;

    function GetNodeStr(ANode: IXMLNode; ATag: string; ADefault: string = ''): string;
    function GetNodeFloat(ANode: IXMLNode; ATag: string): Double;
    function GetNodeCurrency(ANode: IXMLNode; ATag: string): Currency;
    function GetNodeInt(ANode: IXMLNode; ATag: string; ADefault: Integer = 0): Integer;
    function GetNodeDate(ANode: IXMLNode; ATag: string): TDateTime; virtual;
    function GetNodeBoolInt(ANode: IXMLNode; ATag: string): Boolean;

    procedure LoadXmlContent(AValue: string);
    procedure LoadXmlFile(AValue: string);
  public
    constructor Create;
    destructor Destroy; override;
end;

implementation

{ TGBFRXmlBase }

constructor TGBFRXmlBase.Create;
begin
  FXml := TXMLDocument.Create(nil);
end;

destructor TGBFRXmlBase.Destroy;
begin
  inherited;
end;

function TGBFRXmlBase.GetNodeBoolInt(ANode: IXMLNode; ATag: string): Boolean;
var
  LIntVal: Integer;
begin
  LIntVal := GetNodeInt(ANode, ATag);
  Result := LIntVal > 0;
end;

function TGBFRXmlBase.GetNodeCurrency(ANode: IXMLNode; ATag: string): Currency;
var
  LStr: string;
begin
  LStr := GetNodeStr(ANode, ATag);
  {$IF CompilerVersion >= 35.0}
  Result := StrToCurrDef(LStr.Replace('.', FormatSettings.DecimalSeparator), 0);
  {$ELSE}
  Result := StrToCurrDef(LStr.Replace('.', ','), 0);
  {$ENDIF}
end;

function TGBFRXmlBase.GetNodeDate(ANode: IXMLNode; ATag: string): TDateTime;
var
  LStr: string;
begin
  Result := 0;
  LStr := GetNodeStr(ANode, ATag);
  if not LStr.IsEmpty then
    Result := Iso8601ToDateTime(LStr);
end;

function TGBFRXmlBase.GetNodeFloat(ANode: IXMLNode; ATag: string): Double;
var
  LStr: string;
begin
  LStr := GetNodeStr(ANode, ATag);
  {$IF CompilerVersion >= 35.0}
  Result := StrToFloatDef(LStr.Replace('.', FormatSettings.DecimalSeparator), 0);
  {$ELSE}
  Result := StrToFloatDef(LStr.Replace('.', ','), 0);
  {$ENDIF}
end;

function TGBFRXmlBase.GetNodeInt(ANode: IXMLNode; ATag: string; ADefault: Integer = 0): Integer;
var
  LStr: string;
begin
  LStr := GetNodeStr(ANode, ATag);
  Result := StrToIntDef(LStr, ADefault);
end;

function TGBFRXmlBase.GetNodeStr(ANode: IXMLNode; ATag: string; ADefault: string = ''): string;
begin
  Result := ADefault;
  if ANode.ChildNodes.FindNode(ATag) <> nil then
    Result := ANode.ChildNodes.FindNode(ATag).Text;
end;

function TGBFRXmlBase.Iso8601ToDateTime(AValue: string): TDateTime;
var
  Y, M, D, HH, MI, SS: Cardinal;
begin
  // YYYY-MM-DD   Thh:mm:ss  or  YYYY-MM-DDThh:mm:ss
  // 1234567890   123456789      1234567890123456789

  //{"$date":"2019-08-24T11:08:13.000-03:00"} // Data no Mongo
  AValue := AValue.Replace('{"$date":"', '').Replace('"}', '');

  Result := 0;
  case Length(AValue) of
    9:
      if (AValue[1] = 'T') and (AValue[4] = ':') and (AValue[7] = ':') then
      begin
        HH := Ord(AValue[2]) * 10 + Ord(AValue[3]) - (48 + 480);
        MI := Ord(AValue[5]) * 10 + Ord(AValue[6]) - (48 + 480);
        SS := Ord(AValue[8]) * 10 + Ord(AValue[9]) - (48 + 480);
        if (HH < 24) and (MI < 60) and (SS < 60) then
          Result := EncodeTime(HH, MI, SS, 0);
      end;
    10:
      if (AValue[5] = AValue[8]) and (Ord(AValue[8]) in [Ord('-'), Ord('/')]) then
      begin
        Y := Ord(AValue[1]) * 1000 + Ord(AValue[2]) * 100 + Ord(AValue[3]) * 10 + Ord(AValue[4]) - (48 + 480 + 4800 + 48000);
        M := Ord(AValue[6]) * 10 + Ord(AValue[7]) - (48 + 480);
        D := Ord(AValue[9]) * 10 + Ord(AValue[10]) - (48 + 480);
        if (Y <= 9999) and ((M - 1) < 12) and ((D - 1) < 31) then
          Result := EncodeDate(Y, M, D);
      end;
    19,20,21,22,23,24,25,26,27,28,29:
      if (AValue[5] = AValue[8]) and
         (Ord(AValue[8]) in [Ord('-'), Ord('/')]) and
         (Ord(AValue[11]) in [Ord(' '), Ord('T')]) and
         (AValue[14] = ':') and
         (AValue[17] = ':') then
      begin
        Y := Ord(AValue[1]) * 1000 + Ord(AValue[2]) * 100 + Ord(AValue[3]) * 10 + Ord(AValue[4]) - (48 + 480 + 4800 + 48000);
        M := Ord(AValue[6]) * 10 + Ord(AValue[7]) - (48 + 480);
        D := Ord(AValue[9]) * 10 + Ord(AValue[10]) - (48 + 480);
        HH := Ord(AValue[12]) * 10 + Ord(AValue[13]) - (48 + 480);
        MI := Ord(AValue[15]) * 10 + Ord(AValue[16]) - (48 + 480);
        SS := Ord(AValue[18]) * 10 + Ord(AValue[19]) - (48 + 480);
        if (Y <= 9999) and ((M - 1) < 12) and ((D - 1) < 31) and (HH < 24) and (MI < 60) and (SS < 60) then
          Result := EncodeDate(Y, M, D) + EncodeTime(HH, MI, SS, 0);
      end;
  end;
end;

procedure TGBFRXmlBase.LoadXmlContent(AValue: string);
var
  LXml : string;
begin
  LXml := AValue.Replace(#$D#$A#9, '').Replace(#$A#9, '')
    .Replace(#9, '').Replace(#$D, '').Replace(#$A, '');

  FXml.Active := False;
  FXml.LoadFromXML(LXml);
end;

procedure TGBFRXmlBase.LoadXmlFile(AValue: string);
var
  LArquivo: TStringList;
begin
  LArquivo := TStringList.Create;
  try
    LArquivo.LoadFromFile(AValue);
    LoadXmlContent(LArquivo.Text);
  finally
    LArquivo.Free;
  end;
end;

end.
