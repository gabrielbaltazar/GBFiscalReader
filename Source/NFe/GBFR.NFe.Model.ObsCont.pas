unit GBFR.NFe.Model.ObsCont;

interface

type
  TGBFRNFeModelObsCont =  class
  private
    FxCampo: string;
    FxTexto: string;
  public
    property xCampo: string read FxCampo write FxCampo;
    property xTexto: string read FxTexto write FxTexto;
  end;

implementation

end.
