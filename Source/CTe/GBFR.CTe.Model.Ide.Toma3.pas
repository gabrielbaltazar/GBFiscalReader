unit GBFR.CTe.Model.Ide.Toma3;

interface

uses
  GBFR.CTe.Model.Types;

type TGBFRCTeModelIdeToma3 = class
  private
    Ftoma: TCTeTomadorServico;

  public
    property toma: TCTeTomadorServico read Ftoma write Ftoma;
end;

implementation

end.
