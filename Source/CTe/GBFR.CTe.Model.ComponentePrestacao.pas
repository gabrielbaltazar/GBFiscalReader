unit GBFR.CTe.Model.ComponentePrestacao;

interface

{$IFDEF WEAKPACKAGEUNIT}
  {$WEAKPACKAGEUNIT ON}
{$ENDIF}

type TGBFRCTeModelComponentePrestacao = class
  private
    FxNome: String;
    FvComp: Currency;

  public
    property xNome: String read FxNome write FxNome;
    property vComp: Currency read FvComp write FvComp;
end;

implementation

end.
