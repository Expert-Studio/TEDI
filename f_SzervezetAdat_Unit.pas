unit f_SzervezetAdat_Unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AlapAblak_unit, Data.DB, Data.Win.ADODB,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Alap, AlapFuggveny, VDComboBox,
  Vcl.Grids, Vcl.DBGrids;

type
  Tf_SzervezetAdat = class(TAlapAblak)
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label47: TLabel;
    e_rovid_nev: TEdit;
    e_bank: TEdit;
    e_nev: TEdit;
    e_cegszam: TEdit;
    e_adoszam: TEdit;
    e_jurtakod: TEdit;
    Label3: TLabel;
    dbg_eleres: TDBGrid;
    bb_eleres_mod: TBitBtn;
    bb_eleres_torol: TBitBtn;
    bb_eleres_uj: TBitBtn;
    e_ev: TEdit;
    vdc_tipus: TVDComboBox;
    vdc_forma: TVDComboBox;
    eleres: TADOQuery;
    eleresDS: TDataSource;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_SzervezetAdat: Tf_SzervezetAdat;

implementation

{$R *.dfm}

procedure Tf_SzervezetAdat.FormShow(Sender: TObject);
begin
  GridAllapotToltes(dbg_eleres);
  vdc_tipus.Feltolt;
  vdc_forma.Feltolt;
  inherited;
  If HIVO=1 Then
  begin
    With SZURES do
    begin
      Active:=False;
      Parameters.ParamByName('szer_id').Value:=SZER_ID;
      Active:=True;
    end;
    eleres.Active:=False;
    eleres.Parameters.ParamByName('szer_id').Value:=SZER_ID;
    eleres.Active:=True;
    bb_megsemClick(Self);
  end;
  If HIVO=2 Then bb_ujClick(Self);
  If HIVO=3 Then bb_modositClick(Self);
  IF HIVO=4 Then
  begin
    With SZURES do
    begin
      Active:=False;
      Parameters.ParamByName('szer_id').Value:=SZER_ID;
      Active:=True;
    end;
    eleres.Active:=False;
    eleres.Parameters.ParamByName('szer_id').Value:=SZER_ID;
    eleres.Active:=True;
    HIVO:=8;
    bb_ujClick(Self);
  end;

end;

end.
