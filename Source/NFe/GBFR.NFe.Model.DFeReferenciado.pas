unit GBFR.NFe.Model.DFeReferenciado;

interface

{$IFDEF WEAKPACKAGEUNIT}
  {$WEAKPACKAGEUNIT ON}
{$ENDIF}

type
  TGBFRNFeModelDFeReferenciado = class
  private
    FchaveAcesso: String;
    FnItem: Integer;

  public
    property chaveAcesso: String read FchaveAcesso write FchaveAcesso;
    property nItem: Integer read FnItem write FnItem;
  end;

implementation

end.
