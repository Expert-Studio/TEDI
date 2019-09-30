unit f_ReszletfizetesSzures_Unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AlapSzures_Unit, Data.DB, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.ExtCtrls, Data.Win.ADODB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Alap, AlapFuggveny;

type
  Tf_ReszletfizetesSzures = class(TAlapSzures)
    le_berlonev: TLabeledEdit;
    le_berlokod: TLabeledEdit;
    dtp_mettol: TDateTimePicker;
    Label1: TLabel;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    procedure dbg_listaDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_ReszletfizetesSzures: Tf_ReszletfizetesSzures;

implementation

{$R *.dfm}

uses f_Reszletfizetes_Unit;

procedure Tf_ReszletfizetesSzures.dbg_listaDblClick(Sender: TObject);
begin
  inherited;
  AblakNyit(Tf_Reszletfizetes, TForm(f_Reszletfizetes));
end;

end.
