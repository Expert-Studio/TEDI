unit f_EgyebKeres_Unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AlapSzures_Unit, Data.DB,
  Data.Win.ADODB, Vcl.WinXCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, VDComboBox;

type
  Tf_EgyebKeres = class(TAlapSzures)
    Label1: TLabel;
    e_kozter: TEdit;
    VDComboBox1: TVDComboBox;
    Label3: TLabel;
    Label10: TLabel;
    e_berlo: TEdit;
    VDComboBox2: TVDComboBox;
    Label2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_EgyebKeres: Tf_EgyebKeres;

implementation

{$R *.dfm}

end.
