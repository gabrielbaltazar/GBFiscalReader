unit GBFR.NFe.Model.Classes;

interface

uses
  GBFR.NFe.Model,
  GBFR.NFe.Model.Destinatario,
  GBFR.NFe.Model.Emitente,
  GBFR.NFe.Model.Endereco,
  GBFR.NFe.Model.FormaPagamento,
  GBFR.NFe.Model.ICMSTot,
  GBFR.NFe.Model.Imposto.COFINS,
  GBFR.NFe.Model.Imposto.ICMS,
  GBFR.NFe.Model.Imposto.II,
  GBFR.NFe.Model.Imposto.IPI,
  GBFR.NFe.Model.Imposto.ISSQN,
  GBFR.NFe.Model.Imposto.PIS,
  GBFR.NFe.Model.Item,
  GBFR.NFe.Model.Pagamento,
  GBFR.NFe.Model.Protocolo,
  GBFR.NFe.Model.ResponsavelTecnico;

type
  TGBFRNFeModelDestinatario       = GBFR.NFe.Model.Destinatario.TGBFRNFeModelDestinatario;
  TGBFRNFeModelEmitente           = GBFR.NFe.Model.Emitente.TGBFRNFeModelEmitente;
  TGBFRNFeModelEndereco           = GBFR.NFe.Model.Endereco.TGBFRNFeModelEndereco;
  TGBFRNFeModelFormaPagamento     = GBFR.NFe.Model.FormaPagamento.TGBFRNFeModelFormaPagamento;
  TGBFRNFeModelICMSTot            = GBFR.NFe.Model.ICMSTot.TGBFRNFeModelICMSTot;
  TGBFRNFeModelCOFINS             = GBFR.NFe.Model.Imposto.COFINS.TGBFRNFeModelCOFINS;
  TGBFRNFeModelICMS               = GBFR.NFe.Model.Imposto.ICMS.TGBFRNFeModelICMS;
  TGBFRNFeModelII                 = GBFR.NFe.Model.Imposto.II.TGBFRNFeModelII;
  TGBFRNFeModelIPI                = GBFR.NFe.Model.Imposto.IPI.TGBFRNFeModelIPI;
  TGBFRNFeModelISSQN              = GBFR.NFe.Model.Imposto.ISSQN.TGBFRNFeModelISSQN;
  TGBFRNFeModelPIS                = GBFR.NFe.Model.Imposto.PIS.TGBFRNFeModelPIS;
  TGBFRNFeModelItem               = GBFR.NFe.Model.Item.TGBFRNFeModelItem;
  TGBRFNFeModel                   = GBFR.NFe.Model.TGBRFNFeModel;
  TGBFRNFeModelPagamento          = GBFR.NFe.Model.Pagamento.TGBFRNFeModelPagamento;
  TGBRFNFeModelProtocolo          = GBFR.NFe.Model.Protocolo.TGBRFNFeModelProtocolo;
  TGBFRNFeModelResponsavelTecnico = GBFR.NFe.Model.ResponsavelTecnico.TGBFRNFeModelResponsavelTecnico;

implementation

end.
