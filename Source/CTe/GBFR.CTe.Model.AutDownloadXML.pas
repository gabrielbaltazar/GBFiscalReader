unit GBFR.CTe.Model.AutDownloadXML;

interface

{$IFDEF WEAKPACKAGEUNIT}
  {$WEAKPACKAGEUNIT ON}
{$ENDIF}

type TGBFRCTeModelAutDownloadXML = class
  private
    FCNPJ: String;
    FCPF: String;

  public
    property CNPJ: String read FCNPJ write FCNPJ;
    property CPF: String read FCPF write FCPF;
end;

implementation

end.
