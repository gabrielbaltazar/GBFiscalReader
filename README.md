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
  nota : TGBRFNFeModelNotaFiscal;
begin
  nota := XMLNFeReader.loadFromContent(xmlFile);
  try
    //
  finally
    nota.Free;
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
  nota : TGBRFNFeModelNotaFiscal;
begin
  nota := XMLNFeReader.loadFromFile(xmlFile);
  try
    //
  finally
    nota.Free;
  end;
end;

```


