unit f_HelyisegKeres_Unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AlapSzures_Unit, Data.DB, Vcl.StdCtrls,
  Data.Win.ADODB, Vcl.WinXCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons,
  Vcl.ExtCtrls, VDComboBox;

type
  Tf_HelyisegKeres = class(TAlapSzures)
    ADOQuery1: TADOQuery;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label14: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    e_terulettol: TEdit;
    e_hrsz: TEdit;
    e_kozter: TEdit;
    Edit1: TEdit;
    e_tulaj: TEdit;
    e_berlo: TEdit;
    VDComboBox1: TVDComboBox;
    VDComboBox2: TVDComboBox;
    VDComboBox3: TVDComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_HelyisegKeres: Tf_HelyisegKeres;

implementation

{$R *.dfm}

end.
