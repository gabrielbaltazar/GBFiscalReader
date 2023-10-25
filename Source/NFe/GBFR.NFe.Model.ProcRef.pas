unit GBFR.NFe.Model.ProcRef;

interface

uses
  GBFR.NFe.Model.Types;

type
  TGBFRNFeModelProcRef =  class
  private
    FnProc: string;
    FindProc: TNFeIndicadorOrigemProcesso;
  public
    property nProc: string read FnProc write FnProc;
    property indProc: TNFeIndicadorOrigemProcesso read FindProc write FindProc;
  end;

implementation

end.
