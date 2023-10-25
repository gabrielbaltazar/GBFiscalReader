unit GBFR.NFe.Model.ObsFisco;

interface

type
  TGBFRNFeModelObsFisco =  class
  private
    FxCampo: string;
    FxTexto: string;
  public
    property xCampo: string read FxCampo write FxCampo;
    property xTexto: string read FxTexto write FxTexto;
  end;

implementation

end.
