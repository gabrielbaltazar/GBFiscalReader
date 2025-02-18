unit GBFR.NFe.Model.RefECF;

interface

type
  TGBFRNFeModelRefECF = class
  private
    FnECF: string;
    FnCOO: string;
    Fmod: string;
  public
    property &mod: string read Fmod write Fmod;
    property nECF: string read FnECF write FnECF;
    property nCOO: string read FnCOO write FnCOO;
  end;

implementation

end.
