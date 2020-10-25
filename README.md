# GBFiscalReader
Leitor XML Notas Fiscais

[![img/PagSeguro.png](img/PagSeguro.png)](https://pag.ae/7WreVnPYG)

## NFe Read From Content 
```delphi

uses
  GBFR.NFe.XML.Interfaces;
  
procedure ReadXml(AXmlContent: String);

implementation

procedure ReadXml(AXmlContent: String);
var
  nfe : TGBRFNFeModel;
begin
  nfe := XMLNFeReader.loadFromContent(AXmlContent);
  try
    //
  finally
    nfe.Free;
  end;
end;

```

## NFe Read From File 
```delphi

uses
  GBFR.NFe.XML.Interfaces;
  
procedure ReadXml(AXmlFile: String);

implementation

procedure ReadXml(AXmlFile: String);
var
  nfe : TGBRFNFeModel;
begin
  nfe := XMLNFeReader.loadFromFile(xmlFile);
  try
    //
  finally
    nfe.Free;
  end;
end;

```


