unit f_TamogatasAdat_Unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AlapAblak_unit, Data.DB, Data.Win.ADODB,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Alap, AlapFuggveny, VDComboBox,
  Vcl.ComCtrls;

type
  Tf_TamogatasAdat = class(TAlapAblak)
    LabeledEdit1: TLabeledEdit;
    Label1: TLabel;
    dtp_mettol: TDateTimePicker;
    dtp_meddig: TDateTimePicker;
    LabeledEdit7: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    Label4: TLabel;
    VDComboBox1: TVDComboBox;
    LabeledEdit3: TLabeledEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_TamogatasAdat: Tf_TamogatasAdat;

implementation

{$R *.dfm}

end.
