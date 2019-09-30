unit f_Reszletfizetes_Unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AlapAblak_unit, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.ExtCtrls, Data.DB, Data.Win.ADODB, Vcl.Buttons;

type
  Tf_Reszletfizetes = class(TAlapAblak)
    le_berlonev: TLabeledEdit;
    le_berlokod: TLabeledEdit;
    dtp_mettol: TDateTimePicker;
    Label1: TLabel;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    LabeledEdit6: TLabeledEdit;
    bb_berlemeny: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_Reszletfizetes: Tf_Reszletfizetes;

implementation

{$R *.dfm}

end.
