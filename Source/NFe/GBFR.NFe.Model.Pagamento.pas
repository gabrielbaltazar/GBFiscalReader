unit GBFR.NFe.Model.Pagamento;

interface

uses
  GBFR.NFe.Types;

type TGBFRNFeModelPagamento = class
  private
    FtPag: TNFeFormaPagamento;
    FvPag: Currency;
    FtpIntegra: TNFeTipoIntegracaoPagamento;
    FCNPJ: String;
    FtBand: TNFeBandeiraOperadora;
    FcAut: String;

  public
    property tPag: TNFeFormaPagamento read FtPag write FtPag;
    property vPag: Currency read FvPag write FvPag;
    property tpIntegra: TNFeTipoIntegracaoPagamento read FtpIntegra write FtpIntegra;
    property CNPJ: String read FCNPJ write FCNPJ;
    property tBand: TNFeBandeiraOperadora read FtBand write FtBand;
    property cAut: String read FcAut write FcAut;
end;

implementation

end.
