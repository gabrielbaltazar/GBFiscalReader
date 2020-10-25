# GBFiscalReader
Leitor XML Notas Fiscais

[![img/PagSeguro.png](img/PagSeguro.png)](https://pag.ae/7WreVnPYG)

## CTe

#### Add Uses
```delphi
uses
  GBFR.CTe.XML.Interfaces;
```

#### Read From XML Content
```delphi
var
  cte : TGBFRCTeModel;
begin
  cte := XMLCTeReader.loadFromContent('<?xml version="1.0" encoding="UTF-8"?><cteProc...');
end;
```

#### Read From XML File
```delphi
var
  cte : TGBFRCTeModel;
begin
  cte := XMLCTeReader.loadFromFile('c:\cte.xml');
end;
```



## NFe / NFCe

#### Add Uses
```delphi
uses
  GBFR.NFe.XML.Interfaces;
```

#### Read From XML Content
```delphi
var
  nfe : TGBRFNFeModel;
begin
  nfe := XMLNFeReader.loadFromContent('<?xml version="1.0" encoding="UTF-8"?><nfeProc...');
end;
```

#### Read From XML File
```delphi
var
  nfe : TGBRFNFeModel;
begin
  nfe := XMLNFeReader.loadFromFile('c:\nfe.xml');
end;
```
