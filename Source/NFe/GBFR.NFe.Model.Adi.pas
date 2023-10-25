unit GBFR.NFe.Model.Adi;

interface

type
  TGBFRNFeModelAdi = class
  private
    FnSeqAdic: Integer;
    FvDescDI: Currency;
    FnAdicao: Integer;
    FcFabricante: string;
    FnDraw: string;

  public
    property nAdicao: Integer read FnAdicao write FnAdicao;
    property nSeqAdic: Integer read FnSeqAdic write FnSeqAdic;
    property cFabricante: string read FcFabricante write FcFabricante;
    property vDescDI: Currency read FvDescDI write FvDescDI;
    property nDraw: string read FnDraw write FnDraw;

  end;

implementation

end.
