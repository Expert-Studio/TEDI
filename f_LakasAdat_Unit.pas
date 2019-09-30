unit f_LakasAdat_Unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AlapAblak_unit, Data.DB, Vcl.StdCtrls,
  VDComboBox, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Data.Win.ADODB, Vcl.ExtCtrls;

type
  Tf_LakasAdat = class(TAlapAblak)
    Panel2: TPanel;
    Label29: TLabel;
    l_cim: TLabel;
    sp_elo: TSpeedButton;
    sp_kov: TSpeedButton;
    l_id: TLabel;
    l_szecs: TLabel;
    sb_jurta: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label14: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label48: TLabel;
    helyrajzi_szam_foresz: TEdit;
    helyrajzi_szam_alresz: TEdit;
    helyrajzi_szam_betu: TEdit;
    helyrajzi_szam_alatores: TEdit;
    e_epulet_jel: TEdit;
    e_lepcsohaz: TEdit;
    e_ajto: TEdit;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label26: TLabel;
    Label28: TLabel;
    Label30: TLabel;
    Label32: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label39: TLabel;
    Label25: TLabel;
    e_taroloszama: TEdit;
    e_taroloterulete: TEdit;
    e_szobaszam: TEdit;
    e_szoba_terulet: TEdit;
    e_hfszam: TEdit;
    e_hfterulet: TEdit;
    e_etkterulet: TEdit;
    e_felszoba_szam: TEdit;
    e_felszobe_terulet: TEdit;
    e_hall_szam: TEdit;
    e_hall_terulet: TEdit;
    e_eloter_szam: TEdit;
    e_eloter_terulet: TEdit;
    e_furdo_terulet: TEdit;
    e_wc_terulet: TEdit;
    e_kozl_terulet: TEdit;
    e_wcdarab: TEdit;
    e_etkszama: TEdit;
    e_fozoterulet: TEdit;
    Label38: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    e_thszamlalo: TEdit;
    e_thnevezo: TEdit;
    e_hszamlalo: TEdit;
    e_hnevezo: TEdit;
    cb_apport: TCheckBox;
    e_muterem: TEdit;
    e_kulsoterulet: TEdit;
    e_terulet: TEdit;
    e_hasznos: TEdit;
    e_tarsashaz_terulet: TEdit;
    cb_vizmero: TCheckBox;
    Label13: TLabel;
    e_lakok: TEdit;
    Label31: TLabel;
    dbg_berlo: TDBGrid;
    Label33: TLabel;
    dbg_kozmu: TDBGrid;
    VDComboBox1: TVDComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_LakasAdat: Tf_LakasAdat;

implementation

{$R *.dfm}

end.
