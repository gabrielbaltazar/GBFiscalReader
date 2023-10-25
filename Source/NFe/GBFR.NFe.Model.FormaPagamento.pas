unit GBFR.NFe.Model.FormaPagamento;

interface

uses
  GBFR.NFe.Model.Types;

type TGBFRNFeModelFormaPagamento = class
  private
    FtPag: TNFeFormaPagamento;
    FvPag: Currency;
    FtpIntegra: TNFeTipoIntegracaoPagamento;
    FCNPJ: String;
    FtBand: TNFeBandeiraOperadora;
    FcAut: String;
    FindPag: TNFeIndicadorPagamento;

  public
    property indPag: TNFeIndicadorPagamento read FindPag write FindPag;
    property tPag: TNFeFormaPagamento read FtPag write FtPag;
    property vPag: Currency read FvPag write FvPag;
    property tpIntegra: TNFeTipoIntegracaoPagamento read FtpIntegra write FtpIntegra;
    property CNPJ: String read FCNPJ write FCNPJ;
    property tBand: TNFeBandeiraOperadora read FtBand write FtBand;
    property cAut: String read FcAut write FcAut;
end;

implementation

end.
