unit f_TamogatasSzures_Unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AlapSzures_Unit, Data.DB, Vcl.ComCtrls,
  Vcl.StdCtrls, VDComboBox, Vcl.ExtCtrls, Data.Win.ADODB, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, Alap, AlapFuggveny, Vcl.WinXCtrls;

type
  Tf_TamogatasSzures = class(TAlapSzures)
    le_berlonev: TLabeledEdit;
    le_berlokod: TLabeledEdit;
    dtp_mettol: TDateTimePicker;
    dtp_meddig: TDateTimePicker;
    Label3: TLabel;
    LabeledEdit1: TLabeledEdit;
    Label1: TLabel;
    procedure dbg_listaDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_TamogatasSzures: Tf_TamogatasSzures;

implementation

{$R *.dfm}

uses f_TamogatasAdat_Unit;

procedure Tf_TamogatasSzures.dbg_listaDblClick(Sender: TObject);
begin
  inherited;
  AblakNyit(Tf_TamogatasAdat, TForm(f_TamogatasAdat));
end;

end.
