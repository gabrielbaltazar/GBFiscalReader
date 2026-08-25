unit GBFR.CTe.Model.ModalRodoviario;

interface

{$IFDEF WEAKPACKAGEUNIT}
  {$WEAKPACKAGEUNIT ON}
{$ENDIF}

type TGBFRCTeModelModalRodoviario = class
  private
    FRNTRC: String;

  public
    property RNTRC: String read FRNTRC write FRNTRC;
end;

implementation

end.
