unit GBFR.NFe.Model.FormaPagamento;

interface

uses
  GBFR.NFe.Model.Types;

type
  TGBFRNFeModelFormaPagamentoCard = class;

  TGBFRNFeModelFormaPagamento = class
  private
    FTPag: TNFeFormaPagamento;
    FVPag: Currency;
    FIndPag: TNFeIndicadorPagamento;
    FCard: TGBFRNFeModelFormaPagamentoCard;
    FXPag: string;
  public
    constructor Create;
    destructor Destroy; override;

    property IndPag: TNFeIndicadorPagamento read FIndPag write FIndPag;
    property TPag: TNFeFormaPagamento read FTPag write FTPag;
    property VPag: Currency read FVPag write FVPag;
    property XPag: string read FXPag write FXPag;
    property Card: TGBFRNFeModelFormaPagamentoCard read FCard;
  end;

  TGBFRNFeModelFormaPagamentoCard = class
  private
    FCNPJ: String;
    FCAut: String;
    FTpIntegra: TNFeTipoIntegracaoPagamento;
    FTBand: TNFeBandeiraOperadora;
  public
    property TpIntegra: TNFeTipoIntegracaoPagamento read FTpIntegra write FTpIntegra;
    property CNPJ: String read FCNPJ write FCNPJ;
    property TBand: TNFeBandeiraOperadora read FTBand write FTBand;
    property CAut: String read FCAut write FCAut;
  end;

implementation

{ TGBFRNFeModelFormaPagamento }

constructor TGBFRNFeModelFormaPagamento.Create;
begin
  FCard := TGBFRNFeModelFormaPagamentoCard.Create;
end;

destructor TGBFRNFeModelFormaPagamento.Destroy;
begin
  FCard.Free;
  inherited;
end;

end.
