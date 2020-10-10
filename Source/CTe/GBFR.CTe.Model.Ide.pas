unit GBFR.CTe.Model.Ide;

interface

uses
  GBFR.CTe.Model.Types;

type TGBFRCTeModelIde = class
  private
    FcUF: String;
    FcCT: String;
    FCFOP: String;
    FnatOp: String;
    FMod: Integer;
    Fserie: string;
    FnCT: Integer;
    FdhEmi: TDateTime;
    FcDV: String;
    FtpAmb: TCTeAmbiente;
    FverProc: String;
    FindGlobalizado: string;
    FcMunEnv: String;
    FxMunEnv: String;
    FUFEnv: String;
    FcMunIni: string;
    FxMunIni: String;
    FUFIni: String;
    FcMunFim: String;
    FxMunFim: String;
    FUFFim: String;
    FtpImp: TCTeFormatoImpressao;

  public
    property cUF: String read FcUF write FcUF;
    property cCT: String read FcCT write FcCT;
    property CFOP: String read FCFOP write FCFOP;
    property natOp: String read FnatOp write FnatOp;
    property &mod: Integer read Fmod write Fmod;
    property serie: string read Fserie write Fserie;
    property nCT: Integer read FnCT write FnCT;
    property dhEmi: TDateTime read FdhEmi write FdhEmi;
    property tpImp: TCTeFormatoImpressao read FtpImp write FtpImp;
    property cDV: String read FcDV write FcDV;
    property tpAmb: TCTeAmbiente read FtpAmb write FtpAmb;
    property verProc: String read FverProc write FverProc;
    property indGlobalizado: string read FindGlobalizado write FindGlobalizado;
    property cMunEnv: String read FcMunEnv write FcMunEnv;
    property xMunEnv: String read FxMunEnv write FxMunEnv;
    property UFEnv: String read FUFEnv write FUFEnv;
    property cMunIni: string read FcMunIni write FcMunIni;
    property xMunIni: String read FxMunIni write FxMunIni;
    property UFIni: String read FUFIni write FUFIni;
    property cMunFim: String read FcMunFim write FcMunFim;
    property xMunFim: String read FxMunFim write FxMunFim;
    property UFFim: String read FUFFim write FUFFim;
end;

implementation

end.
