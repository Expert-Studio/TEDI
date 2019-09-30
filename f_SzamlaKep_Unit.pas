unit f_SzamlaKep_Unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, qrpctrls, QRCtrls, QRDMBarcode,
  QuickRpt, Vcl.ExtCtrls, Data.DB, Data.Win.ADODB;

type
  Tf_SzamlaKep = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    qrb_fejlec: TQRBand;
    qrl_elado: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    qrl_eladocim: TQRLabel;
    qrl_eladoszamla: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRDbDMBarcode1: TQRDbDMBarcode;
    QRShape1: TQRShape;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    qrb_tetel: TQRBand;
    qr_megnevezes: TQRDBText;
    qr_szj: TQRDBText;
    qr_idoszak: TQRDBText;
    qr_netto: TQRDBText;
    qr_afa1: TQRDBText;
    qr_afa2: TQRDBText;
    qr_brutto: TQRDBText;
    qrb_lablec: TQRPBand;
    SZURES: TADOQuery;
    SZURESds: TDataSource;
    procedure QuickRep1Preview(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_SzamlaKep: Tf_SzamlaKep;

implementation

{$R *.dfm}

procedure Tf_SzamlaKep.QuickRep1Preview(Sender: TObject);
begin
  SZURES.Active:=False;
  SZURES.Parameters.ParamByName('szamla_id').Value:=1;
  SZURES.Active:=True;
end;

end.
