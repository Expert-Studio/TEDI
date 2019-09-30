unit form_Lakas_unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Alap_Form_Unit, Grids, DBGrids, ComCtrls, StdCtrls, DBCtrls, ShellAPI,
  Mask, DB, ADODB, Buttons, ExtCtrls, Alap_unit, VDCComboBox, Menus, form_GridMezok_Unit;

type
  Tform_Lakas = class(TAlap_Form)
    berlo: TADOQuery;
    tulaj: TADOQuery;
    ertek: TADOQuery;
    berloDS: TDataSource;
    tulajDS: TDataSource;
    ertekDS: TDataSource;
    megjegyzes: TADOQuery;
    megjegyzesDS: TDataSource;
    kepDS: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label14: TLabel;
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
    Label38: TLabel;
    Label39: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    sb_hrsz: TSpeedButton;
    Label19: TLabel;
    Label21: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label48: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label25: TLabel;
    Label16: TLabel;
    helyrajzi_szam_foresz: TEdit;
    helyrajzi_szam_alresz: TEdit;
    helyrajzi_szam_betu: TEdit;
    helyrajzi_szam_alatores: TEdit;
    e_epulet_jel: TEdit;
    e_lepcsohaz: TEdit;
    e_ajto: TEdit;
    e_taroloszama: TEdit;
    e_taroloterulete: TEdit;
    e_thszamlalo: TEdit;
    e_thnevezo: TEdit;
    e_hszamlalo: TEdit;
    e_hnevezo: TEdit;
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
    cb_apport: TCheckBox;
    e_wcdarab: TEdit;
    e_etkszama: TEdit;
    e_fozoterulet: TEdit;
    p_uzenet: TPanel;
    vcb_szint: TVDCComboBox;
    vcb_melegviz: TVDCComboBox;
    vcb_komfort: TVDCComboBox;
    vcb_furdo: TVDCComboBox;
    vcb_fozo: TVDCComboBox;
    vcb_muszaki: TVDCComboBox;
    vcb_kozmu: TVDCComboBox;
    vcb_futes: TVDCComboBox;
    vcb_jogirendezettseg: TVDCComboBox;
    vcb_forgalomkepesseg: TVDCComboBox;
    e_muterem: TEdit;
    e_kulsoterulet: TEdit;
    e_terulet: TEdit;
    e_hasznos: TEdit;
    e_tarsashaz_terulet: TEdit;
    m_megj: TMemo;
    dbg_megj: TDBGrid;
    Label15: TLabel;
    dbg_tulaj: TDBGrid;
    dbg_kozmu: TDBGrid;
    dbg_ertek: TDBGrid;
    Label27: TLabel;
    Label31: TLabel;
    Label8: TLabel;
    Label12: TLabel;
    Panel1: TPanel;
    Label29: TLabel;
    l_cim: TLabel;
    sp_elo: TSpeedButton;
    sp_kov: TSpeedButton;
    l_id: TLabel;
    dbg_kep: TDBGrid;
    ADOQuery1: TADOQuery;
    sb_cim: TSpeedButton;
    kep: TADOQuery;
    pm_megj: TPopupMenu;
    j2: TMenuItem;
    mdosts1: TMenuItem;
    trls1: TMenuItem;
    dbg_berlo: TDBGrid;
    kozmu: TADOQuery;
    kozmuDS: TDataSource;
    Label33: TLabel;
    vdc_haszn: TVDCComboBox;
    Label40: TLabel;
    dbg_ellenorzesek: TDBGrid;
    eddigi: TADOQuery;
    eddigiDS: TDataSource;
    e_jurtakod: TEdit;
    Label47: TLabel;
    Label49: TLabel;
    l_szecs: TLabel;
    sb_jurta: TSpeedButton;
    bb_megj: TBitBtn;
    cb_vizmero: TCheckBox;
    e_lakok: TEdit;
    Label13: TLabel;
    dbg_doksi: TDBGrid;
    Label50: TLabel;
    doksi: TADOQuery;
    doksiDS: TDataSource;
    od_doksi: TOpenDialog;
    sb_fel: TSpeedButton;
    sb_doktorol: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure dbg_berloDblClick(Sender: TObject);
    procedure dbg_tulajDblClick(Sender: TObject);
    procedure dbg_ertekDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bb_felveszClick(Sender: TObject);
    procedure bb_torolClick(Sender: TObject);
    procedure bb_megjClick(Sender: TObject);
    procedure sb_kilepClick(Sender: TObject);
    procedure megjegyzesAfterScroll(DataSet: TDataSet);
    procedure bb_ujClick(Sender: TObject);
    procedure bb_modositClick(Sender: TObject);
    procedure dbg_kepDblClick(Sender: TObject);
    procedure sp_eloClick(Sender: TObject);
    procedure sp_kovClick(Sender: TObject);
    procedure SZURESAfterScroll(DataSet: TDataSet);
    procedure sb_hrszClick(Sender: TObject);
    procedure helyrajzi_szam_alatoresExit(Sender: TObject);
    procedure kepAfterScroll(DataSet: TDataSet);
    procedure UPDATEQueryAfterScroll(DataSet: TDataSet);
    procedure sb_faxClick(Sender: TObject);
    procedure sb_cimClick(Sender: TObject);
    procedure sb_nyomtatClick(Sender: TObject);
    procedure mdosts1Click(Sender: TObject);
    procedure trls1Click(Sender: TObject);
    procedure dbg_kozmuDblClick(Sender: TObject);
    procedure kozmuAfterScroll(DataSet: TDataSet);
    procedure dbg_ellenorzesekDblClick(Sender: TObject);
    procedure eddigiAfterScroll(DataSet: TDataSet);
    procedure sb_jurtaClick(Sender: TObject);
    procedure dbg_doksiDblClick(Sender: TObject);
    procedure sb_felClick(Sender: TObject);
    procedure doksiAfterScroll(DataSet: TDataSet);
    procedure sb_doktorolClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_Lakas: Tform_Lakas;

implementation

uses form_LakasBerlo_unit, form_LakasTulaj_unit, form_LakasErtek_unit, Adatmodul_unit,
  form_Megjegyzes_unit, form_Hrsz_unit,
  form_Kep_unit, form_Fooldal_Unit, form_LakasNyomt_Unit,
  form_Kozmu_Unit, form_EsemenynaploLista_Unit, form_BerlemenyEll_unit,
  form_CimSzerkeszto_unit;

{$R *.dfm}

procedure Tform_Lakas.FormCreate(Sender: TObject);
begin
  vcb_szint.Feltolt;
  vcb_melegviz.Feltolt;
  vcb_komfort.Feltolt;
  vcb_furdo.Feltolt;
  vcb_fozo.Feltolt;
  vcb_muszaki.Feltolt;
  vcb_kozmu.Feltolt;
  vcb_futes.Feltolt;
  vcb_jogirendezettseg.Feltolt;
  vcb_forgalomkepesseg.Feltolt;
//  vcb_statusz.Feltolt;
  vdc_haszn.Feltolt;
  GridAllapotToltes(dbg_berlo);
  GridAllapotToltes(dbg_tulaj);
  GridAllapotToltes(dbg_ertek);
  GridAllapotToltes(dbg_kep);
  GridAllapotToltes(dbg_megj);
  GridAllapotToltes(dbg_kozmu);
end;

procedure Tform_Lakas.dbg_berloDblClick(Sender: TObject);
var i: Integer;
begin
  i:=BB_BILL;
  BB_BILL:=0;
  AblakNyit(Tform_LakasBerlo, TForm(form_LakasBerlo), true, form_Fooldal.menu11);
  Frissites(berlo,LAK_ID,'lakas_id');
  BB_BILL:=i;
end;

procedure Tform_Lakas.dbg_tulajDblClick(Sender: TObject);
var i: Integer;
begin
  i:=BB_BILL;
  BB_BILL:=0;
  AblakNyit(Tform_LakasTulaj, TForm(form_LakasTulaj), true, form_Fooldal.menu11);
  Frissites(tulaj,LAK_ID,'lakas_id');
  Frissites(SZURES,LAK_ID,'lakas_id');
  BB_BILL:=i;
end;

procedure Tform_Lakas.dbg_ertekDblClick(Sender: TObject);
var i: Integer;
begin
  i:=BB_BILL;
  BB_BILL:=0;
  AblakNyit(Tform_LakasErtek, TForm(form_LakasErtek), true, form_Fooldal.menu11);
  Frissites(ertek,LAK_ID,'lakas_id');
  BB_BILL:=i;
end;

procedure Tform_Lakas.FormShow(Sender: TObject);
var s: String;
begin
  If (FelhObjJog('menu11', 0) = 62) Then
  begin
    bb_megj.Visible:=True;
    sb_cim.Visible:=True;
    sb_jurta.Visible:=True;
  end;
  If HIVO=0 Then
  begin
    s:=LAK_ID;
    bb_megsemClick(Self);
    UPDATEQuery.Active:=False;
    UPDATEQuery.Parameters.ParamByName('kat_id').Value:=KAT_ID;
    UPDATEQuery.Active:=True;
    With SZURES do
    begin
      Active:=False;
      Parameters.ParamByName('lak_id').Value:=s;
      Active:=True;
    end;
    Frissites(SZURES,s,'lakas_id');
  end
  else
    bb_ujClick(Self);
end;

procedure Tform_Lakas.bb_felveszClick(Sender: TObject);
var i: Integer;
begin
  i:=BB_BILL;
  inherited;
  If i=1 Then
  begin
    LAK_ID:=Beszuras('l_lakas',[
      'kataszter_id='+KAT_ID,
      'hrsz_id='+HRSZ_ID,
      'szint_id='+vcb_szint.Eredmeny,
      'melegviz_id='+vcb_melegviz.Eredmeny,
      'komfort_id='+vcb_komfort.Eredmeny,
      'furdo_id='+vcb_furdo.Eredmeny,
      'fozo_id='+vcb_fozo.Eredmeny,
      'muszaki_allapot_id='+vcb_muszaki.Eredmeny,
      'kozmuellatas_id='+vcb_kozmu.Eredmeny,
      'futesi_mod_id='+vcb_futes.Eredmeny,
      'jogi_rend_id='+vcb_jogirendezettseg.Eredmeny,
      'forgk_id='+vcb_forgalomkepesseg.Eredmeny,
      'statusz_id='+vdc_haszn.Eredmeny,
//      'es_id='+vcb_statusz.Eredmeny,
      'muterem_terulet='+StringReplace(e_muterem.Text,',','.',[rfReplaceAll]),
      'kulso_terulet='+StringReplace(e_kulsoterulet.Text,',','.',[rfReplaceAll]),
      'lakas_osszes_terulete='+StringReplace(e_terulet.Text,',','.',[rfReplaceAll]),
      'lakas_hasznos_terulete='+StringReplace(e_hasznos.Text,',','.',[rfReplaceAll]),
      'l_tarsashazi_terulet='+StringReplace(e_tarsashaz_terulet.Text,',','.',[rfReplaceAll]),
      'l_th_hanyad_sz='+e_thszamlalo.Text,
      'l_th_hanyad_n='+e_thnevezo.Text,
      'l_hanyad_sz='+e_hszamlalo.Text,
      'l_hanyad_n='+e_hnevezo.Text,
      'tarolo_szama='+e_taroloszama.Text,
      'tarolo_terulet='+StringReplace(e_taroloterulete.Text,',','.',[rfReplaceAll]),
      'szoba_szam='+e_szobaszam.Text,
      'szoba_terulet='+StringReplace(e_szoba_terulet.Text,',','.',[rfReplaceAll]),
      'halofulke_szam='+e_hfszam.Text,
      'halofulke_terulet='+StringReplace(e_hfterulet.Text,',','.',[rfReplaceAll]),
      'etkezofulke_szam='+e_etkszama.Text,
      'etkezofulke_terulet='+StringReplace(e_etkterulet.Text,',','.',[rfReplaceAll]),
      'felszoba_szam='+e_felszoba_szam.Text,
      'felszoba_terulet='+StringReplace(e_felszobe_terulet.Text,',','.',[rfReplaceAll]),
      'hall_szam='+e_hall_szam.Text,
      'hall_terulet='+StringReplace(e_hall_terulet.Text,',','.',[rfReplaceAll]),
      'eloter_szam='+e_eloter_szam.Text,
      'eloter_terulet='+StringReplace(e_eloter_terulet.Text,',','.',[rfReplaceAll]),
      'fozo_helyiseg_terulet='+StringReplace(e_fozoterulet.Text,',','.',[rfReplaceAll]),
      'furdo_terulet='+StringReplace(e_furdo_terulet.Text,',','.',[rfReplaceAll]),
      'wc_terulet='+StringReplace(e_wc_terulet.Text,',','.',[rfReplaceAll]),
      'kozlekedo_terulet='+StringReplace(e_kozl_terulet.Text,',','.',[rfReplaceAll]),
      'l_apport='+BoolToStr(cb_apport.Checked),
      'l_vizmero='+BoolToStr(cb_vizmero.Checked),
      'wc_darab='+e_wcdarab.Text,
      'l_epulet_jel='+e_epulet_jel.Text,
      'l_lepcsohaz='+e_lepcsohaz.Text,
      'l_ajto='+e_ajto.Text,
      'lakok_szama='+e_lakok.Text
      ]);
  end
  else
  begin
    Modositas('l_lakas',[
      'szint_id='+vcb_szint.Eredmeny,
      'melegviz_id='+vcb_melegviz.Eredmeny,
      'komfort_id='+vcb_komfort.Eredmeny,
      'furdo_id='+vcb_furdo.Eredmeny,
      'fozo_id='+vcb_fozo.Eredmeny,
      'muszaki_allapot_id='+vcb_muszaki.Eredmeny,
      'kozmuellatas_id='+vcb_kozmu.Eredmeny,
      'futesi_mod_id='+vcb_futes.Eredmeny,
      'jogi_rend_id='+vcb_jogirendezettseg.Eredmeny,
      'forgk_id='+vcb_forgalomkepesseg.Eredmeny,
      'statusz_id='+vdc_haszn.Eredmeny,
//      'es_id='+vcb_statusz.Eredmeny,
      'muterem_terulet='+StringReplace(e_muterem.Text,',','.',[rfReplaceAll]),
      'kulso_terulet='+StringReplace(e_kulsoterulet.Text,',','.',[rfReplaceAll]),
      'lakas_osszes_terulete='+StringReplace(e_terulet.Text,',','.',[rfReplaceAll]),
      'lakas_hasznos_terulete='+StringReplace(e_hasznos.Text,',','.',[rfReplaceAll]),
      'l_tarsashazi_terulet='+StringReplace(e_tarsashaz_terulet.Text,',','.',[rfReplaceAll]),
      'l_th_hanyad_sz='+e_thszamlalo.Text,
      'l_th_hanyad_n='+e_thnevezo.Text,
      'l_hanyad_sz='+e_hszamlalo.Text,
      'l_hanyad_n='+e_hnevezo.Text,
      'tarolo_szama='+e_taroloszama.Text,
      'tarolo_terulet='+StringReplace(e_taroloterulete.Text,',','.',[rfReplaceAll]),
      'szoba_szam='+e_szobaszam.Text,
      'szoba_terulet='+StringReplace(e_szoba_terulet.Text,',','.',[rfReplaceAll]),
      'halofulke_szam='+e_hfszam.Text,
      'halofulke_terulet='+StringReplace(e_hfterulet.Text,',','.',[rfReplaceAll]),
      'etkezofulke_szam='+e_etkszama.Text,
      'etkezofulke_terulet='+StringReplace(e_etkterulet.Text,',','.',[rfReplaceAll]),
      'felszoba_szam='+e_felszoba_szam.Text,
      'felszoba_terulet='+StringReplace(e_felszobe_terulet.Text,',','.',[rfReplaceAll]),
      'hall_szam='+e_hall_szam.Text,
      'hall_terulet='+StringReplace(e_hall_terulet.Text,',','.',[rfReplaceAll]),
      'eloter_szam='+e_eloter_szam.Text,
      'eloter_terulet='+StringReplace(e_eloter_terulet.Text,',','.',[rfReplaceAll]),
      'fozo_helyiseg_terulet='+StringReplace(e_fozoterulet.Text,',','.',[rfReplaceAll]),
      'furdo_terulet='+StringReplace(e_furdo_terulet.Text,',','.',[rfReplaceAll]),
      'wc_terulet='+StringReplace(e_wc_terulet.Text,',','.',[rfReplaceAll]),
      'kozlekedo_terulet='+StringReplace(e_kozl_terulet.Text,',','.',[rfReplaceAll]),
      'l_apport='+BoolToStr(cb_apport.Checked),
      'l_vizmero='+BoolToStr(cb_vizmero.Checked),
      'wc_darab='+e_wcdarab.Text,
      'l_epulet_jel='+e_epulet_jel.Text,
      'l_lepcsohaz='+e_lepcsohaz.Text,
      'l_ajto='+e_ajto.Text,
      'lakok_szama='+e_lakok.Text
      ],'lakas_id='+LAK_ID);
  end;
end;

procedure Tform_Lakas.bb_torolClick(Sender: TObject);
begin
  If Rakerdez('Biztos törölni akarja a lakás adatait?') Then
  begin
    try
      Torles('cim_hrsz_kapcs','hrsz_id='+HRSZ_ID);
      Torles('cim','hrsz_id='+HRSZ_ID);
      Torles('cim','cim_id='+CIM_ID);
      Torles('berlo_kapcsolat','lakas_id='+LAK_ID);
      Torles('lakas_tulajdonos','lakas_id='+LAK_ID);
      Torles('megjegyzes','lakas_id='+LAK_ID);
      Torles('l_lakas','lakas_id='+LAK_ID);
      Torles('helyrajzi_szamok','hrsz_id='+HRSZ_ID);
      Uzenet('A lakás adatainak és kapcsolatainak törlése sikerült!');
    except
      Uzenet('A törlés nem sikerült! Kérem jelezze a fejlesztõknek!');
    end;
    sb_kilepClick(Self);
  end;
  inherited;
end;

procedure Tform_Lakas.bb_megjClick(Sender: TObject);
var s: String;
begin
  s:=EP_ID;
  EP_ID:='';
  NLAK_ID:='';
  HIVO:=1;
  AblakNyit(Tform_Megjegyzes, TForm(form_Megjegyzes), true, form_Fooldal.menu11);
  EP_ID:=s;
  Frissites(megjegyzes,MEG_ID,'megjegyzes_id');
end;

procedure Tform_Lakas.sb_kilepClick(Sender: TObject);
begin
  REND_OSZLOP:='';
  REND_IRANY:='';
  inherited;
  GridAllapotMentes(dbg_berlo);
  GridAllapotMentes(dbg_tulaj);
  GridAllapotMentes(dbg_ertek);
  GridAllapotMentes(dbg_kep);
  GridAllapotMentes(dbg_megj);
  GridAllapotMentes(dbg_kozmu);
end;

procedure Tform_Lakas.megjegyzesAfterScroll(DataSet: TDataSet);
begin
  inherited;
  MEG_ID:=megjegyzes.FieldByName('megjegyzes_id').AsString;
  m_megj.Text:=megjegyzes.FieldByName('megjegyzes').AsString;
end;

procedure Tform_Lakas.bb_ujClick(Sender: TObject);
begin
  inherited;
  helyrajzi_szam_foresz.Text:=HRSZ_SOR;
  sb_hrsz.Enabled:=False;
  HRSZ_ID:='';
  l_cim.Caption:='';
  l_id.Caption:='';
  berlo.Active:=False;
  tulaj.Active:=False;
  ertek.Active:=False;
  kep.Active:=False;
  megjegyzes.Active:=False;
  kozmu.Active:=False;
  vcb_szint.Ertek('0');
  vcb_melegviz.Ertek('0');
  vcb_komfort.Ertek('0');
  vcb_furdo.Ertek('0');
  vcb_fozo.Ertek('0');
  vcb_muszaki.Ertek('0');
  vcb_kozmu.Ertek('0');
  vcb_futes.Ertek('0');
//  vcb_statusz.Ertek('1');
  vdc_haszn.Ertek('0');
  vcb_jogirendezettseg.Ertek('0');
  vcb_forgalomkepesseg.Ertek('0');
  helyrajzi_szam_foresz.SetFocus;
end;

procedure Tform_Lakas.bb_modositClick(Sender: TObject);
begin
  inherited;
  e_epulet_jel.SetFocus;
end;

procedure Tform_Lakas.dbg_kepDblClick(Sender: TObject);
var s: String;
    i: Integer;
begin
  inherited;
  s:=EP_ID;
  EP_ID:='';
  NLAK_ID:='';
  i:=BB_BILL;
  BB_BILL:=0;
  AblakNyit(Tform_Kep, TForm(form_Kep), true, form_Fooldal.menu11);
  Frissites(kep,LAK_ID,'lakas_id');
  EP_ID:=s;
  BB_BILL:=i;
end;

procedure Tform_Lakas.sp_eloClick(Sender: TObject);
begin
  inherited;
  UPDATEQuery.Prior;
  With SZURES do
  begin
    Active:=False;
    Parameters.ParamByName('lak_id').Value:=LAK_ID;
    Active:=True;
  end;
  If UPDATEQuery.Bof Then sp_elo.Enabled:=False else sp_elo.Enabled:=True;
  If UPDATEQuery.Eof Then sp_kov.Enabled:=False else sp_kov.Enabled:=True;
end;

procedure Tform_Lakas.sp_kovClick(Sender: TObject);
begin
  inherited;
  UPDATEQuery.Next;
  With SZURES do
  begin
    Active:=False;
    Parameters.ParamByName('lak_id').Value:=LAK_ID;
    Active:=True;
  end;
  If UPDATEQuery.Bof Then sp_elo.Enabled:=False else sp_elo.Enabled:=True;
  If UPDATEQuery.Eof Then sp_kov.Enabled:=False else sp_kov.Enabled:=True;
end;

procedure Tform_Lakas.SZURESAfterScroll(DataSet: TDataSet);
begin
  With SZURES do
  begin
    LAK_ID:=FieldByName('lakas_id').AsString;
    HRSZ_ID:=FieldByName('hrsz_id').AsString;
    KAT_ID:=FieldByName('kataszter_id').AsString;
    CIM_ID:=FieldByName('cim_id').AsString;       
    l_cim.Caption:=FieldByName('cim').AsString;
    l_id.Caption:=KAT_ID+' ('+FieldByName('lakas_id').AsString+')';
    helyrajzi_szam_foresz.Text:=FieldByName('helyrajzi_szam_foresz').AsString;
    helyrajzi_szam_alresz.Text:=FieldByName('helyrajzi_szam_alresz').AsString;
    helyrajzi_szam_betu.Text:=FieldByName('helyrajzi_szam_betu').AsString;
    helyrajzi_szam_alatores.Text:=FieldByName('helyrajzi_szam_alatores').AsString;
    e_epulet_jel.Text:=FieldByName('l_epulet_jel').AsString;
    e_lepcsohaz.Text:=FieldByName('l_lepcsohaz').AsString;
    e_ajto.Text:=FieldByName('l_ajto').AsString;
    vcb_szint.Ertek(FieldByName('szint_id').Value);
    vcb_melegviz.Ertek(FieldByName('melegviz_id').Value);
    vcb_komfort.Ertek(FieldByName('komfort_id').Value);
    vcb_furdo.Ertek(FieldByName('furdo_id').Value);
    vcb_fozo.Ertek(FieldByName('fozo_id').Value);
    vcb_muszaki.Ertek(FieldByName('muszaki_allapot_id').Value);
    vcb_kozmu.Ertek(FieldByName('kozmuellatas_id').Value);
    vcb_futes.Ertek(FieldByName('futesi_mod_id').Value);
//    vcb_statusz.Ertek(FieldByName('es_id').Value);
    vdc_haszn.Ertek(FieldByName('statusz_id').Value);
    vcb_jogirendezettseg.Ertek(FieldByName('jogi_rend_id').Value);
    vcb_forgalomkepesseg.Ertek(FieldByName('forgk_id').Value);
    e_muterem.Text:=FieldByName('muterem_terulet').AsString;
    e_kulsoterulet.Text:=FieldByName('kulso_terulet').AsString;
    e_terulet.Text:=FieldByName('lakas_osszes_terulete').AsString;
    e_hasznos.Text:=FieldByName('lakas_hasznos_terulete').AsString;
    e_tarsashaz_terulet.Text:=FieldByName('l_tarsashazi_terulet').AsString;
    e_thszamlalo.Text:=FieldByName('l_th_hanyad_sz').AsString;
    e_thnevezo.Text:=FieldByName('l_th_hanyad_n').AsString;
    e_hszamlalo.Text:=FieldByName('l_hanyad_sz').AsString;
    e_hnevezo.Text:=FieldByName('l_hanyad_n').AsString;
    e_taroloszama.Text:=FieldByName('tarolo_szama').AsString;
    e_taroloterulete.Text:=FieldByName('tarolo_terulet').AsString;
    e_szobaszam.Text:=FieldByName('szoba_szam').AsString;
    e_szoba_terulet.Text:=FieldByName('szoba_terulet').AsString;
    e_hfszam.Text:=FieldByName('halofulke_szam').AsString;
    e_hfterulet.Text:=FieldByName('halofulke_terulet').AsString;
    e_etkszama.Text:=FieldByName('etkezofulke_szam').AsString;
    e_etkterulet.Text:=FieldByName('etkezofulke_terulet').AsString;
    e_felszoba_szam.Text:=FieldByName('felszoba_szam').AsString;
    e_felszobe_terulet.Text:=FieldByName('felszoba_terulet').AsString;
    e_hall_szam.Text:=FieldByName('hall_szam').AsString;
    e_hall_terulet.Text:=FieldByName('hall_terulet').AsString;
    e_eloter_szam.Text:=FieldByName('eloter_szam').AsString;
    e_eloter_terulet.Text:=FieldByName('eloter_terulet').AsString;
    e_fozoterulet.Text:=FieldByName('fozo_helyiseg_terulet').AsString;
    e_furdo_terulet.Text:=FieldByName('furdo_terulet').AsString;
    e_wcdarab.Text:=FieldByName('wc_darab').AsString;
    e_wc_terulet.Text:=FieldByName('wc_terulet').AsString;
    e_kozl_terulet.Text:=FieldByName('kozlekedo_terulet').AsString;
    e_jurtakod.Text:=FieldByName('jurta_kod').AsString;
    l_szecs.Caption:=FieldByName('torzskod').AsString;
    e_lakok.Text:=FieldByName('lakok_szama').AsString;
    If FieldByName('l_vizmero').AsString='True' Then cb_vizmero.Checked:=True else cb_vizmero.Checked:=False;
    If FieldByName('l_apport').AsString='True' Then cb_apport.Checked:=True else cb_apport.Checked:=False;
    //Berlõk
    berlo.Active:=False;
    berlo.Parameters.ParamByName('lak_id').Value:=LAK_ID;
    berlo.Active:=True;
    //Tulajdonosok
    tulaj.Active:=False;
    tulaj.Parameters.ParamByName('lak_id').Value:=LAK_ID;
    tulaj.Active:=True;
    //Értékadatok
    ertek.Active:=False;
    ertek.Parameters.ParamByName('lak_id').Value:=LAK_ID;
    ertek.Active:=True;
    //Kép
    KEP_ID:='';
    kep.Active:=False;
    kep.Parameters.ParamByName('lak_id').Value:=LAK_ID;
    kep.Active:=True;
    //Megjegyzés
    megjegyzes.Active:=False;
    megjegyzes.Parameters.ParamByName('lak_id').Value:=LAK_ID;
    megjegyzes.Active:=True;
    //Közmû
    kozmu.Active:=False;
    kozmu.Parameters.ParamByName('lak_id').Value:=LAK_ID;
    kozmu.Active:=True;
    If kozmu.RecordCount=0 Then KOZMU_ID:='';
    //Ellenõrzések
    eddigi.Active:=False;
    eddigi.Parameters.ParamByName('lak_id').Value:=LAK_ID;
    eddigi.Active:=True;
    //Állomány
    doksi.Active:=False;
    doksi.Parameters.ParamByName('lak_id').Value:=LAK_ID;
    doksi.Active:=True;
  end;
  inherited;
end;

procedure Tform_Lakas.sb_hrszClick(Sender: TObject);
var s: Integer;
begin
  inherited;
  HIVO:=BB_BILL;
  s:=BB_BILL;
  BB_BILL:=0;
  AblakNyit(Tform_Hrsz, TForm(form_Hrsz));
  BB_BILL:=s;
  Frissites(SZURES,LAK_ID,'lakas_id');
end;

procedure Tform_Lakas.helyrajzi_szam_alatoresExit(Sender: TObject);
begin
  inherited;
  If BB_BILL=1 Then
  begin
    HRSZ_SOR:=helyrajzi_szam_foresz.Text;
    If helyrajzi_szam_alresz.Text<>'' Then HRSZ_SOR:=HRSZ_SOR+'/'+helyrajzi_szam_alresz.Text;
    If helyrajzi_szam_betu.Text<>'' Then HRSZ_SOR:=HRSZ_SOR+'/'+helyrajzi_szam_betu.Text;
    If helyrajzi_szam_alatores.Text<>'' Then HRSZ_SOR:=HRSZ_SOR+'/'+helyrajzi_szam_alatores.Text;
    With AdatModul.Query2 do
    begin
      Active:=False;
      SQL.Text:='Select * From helyrajzi_szamok Where helyrajziszam='+IDCHAR+HRSZ_SOR+IDCHAR+' ';
      Active:=True;
      If RecordCount>0 Then
      begin
         Uzenet('Már létezik a helyrajzi szám!');
         HRSZ_ID:=FieldByName('hrsz_id').AsString;
      end
      Else
      begin
        //Rögzíteni a helyrajzi számot
        HRSZ_ID:=Beszuras('helyrajzi_szamok',[
          'hrsz_allapot_id=0',
          'kataszter_id='+KAT_ID,
          'helyrajzi_szam_foresz='+helyrajzi_szam_foresz.Text,
          'helyrajzi_szam_alresz='+helyrajzi_szam_alresz.Text,
          'helyrajzi_szam_betu='+helyrajzi_szam_betu.Text,
          'helyrajzi_szam_alatores='+helyrajzi_szam_alatores.Text,
          'helyrajziszam='+HRSZ_SOR
          ]);
        //Ellenõrzés
        AdatModul.Query3.Active:=False;
        AdatModul.Query3.SQL.Text:='Select * From cim Where hrsz_id='+IDCHAR+HRSZ_ID+IDCHAR+' ';
        AdatModul.Query3.Active:=True;
        If AdatModul.Query3.RecordCount>0 Then
        begin
           Uzenet('Már létezik a cím!');
           l_cim.Caption:=AdatModul.Query3.FieldByName('cim_sor_1').AsString;
           CIM_ID:=AdatModul.Query3.FieldByName('cim_id').AsString;
        end
        else
        begin
          //Cim rögzítésének hívása
          HIVO:=1;
          p_uzenet.Caption:='A címszerkesztõ betöltése folyamatban...';
          p_uzenet.Visible:=True;
          Application.ProcessMessages;
          BB_BILL:=0;
          AblakNyit(Tform_CimSzerkeszto, TForm(form_CimSzerkeszto));
          p_uzenet.Visible:=False;
          Application.ProcessMessages;
          BB_BILL:=1;
          Modositas('cim',['hrsz_id='+HRSZ_ID],'cim_id='+CIM_ID);
          l_cim.Caption:=CIM_SOR;
        end;
      end;
    end;
  end;
end;

procedure Tform_Lakas.kepAfterScroll(DataSet: TDataSet);
begin
  inherited;
  KEP_ID:=kep.FieldByName('kep_id').AsString;
end;

procedure Tform_Lakas.UPDATEQueryAfterScroll(DataSet: TDataSet);
begin
  inherited;
  LAK_ID:=UPDATEQuery.FieldByName('lakas_id').AsString;
end;

procedure Tform_Lakas.sb_faxClick(Sender: TObject);
begin
  inherited;
  //Eseméynnapló hívása
  Etabla:='l_lakas';
  Erekord:=LAK_ID;
  AblakNyit(Tform_EsemenyNaploLista, TForm(form_EsemenyNaploLista));
end;

procedure Tform_Lakas.sb_cimClick(Sender: TObject);
begin
  inherited;
  HIVO:=2;
  p_uzenet.Caption:='A címszerkesztõ betöltése folyamatban...';
  p_uzenet.Visible:=True;
  Application.ProcessMessages;
  AblakNyit(Tform_CimSzerkeszto, TForm(form_CimSzerkeszto));
  p_uzenet.Visible:=False;
  Frissites(SZURES,LAK_ID,'lakas_id');
  Application.ProcessMessages;
end;

procedure Tform_Lakas.sb_nyomtatClick(Sender: TObject);
begin
  inherited;
  AblakNyit(Tform_LakasNyomt, TForm(form_LakasNyomt));
end;

procedure Tform_Lakas.mdosts1Click(Sender: TObject);
begin
  inherited;
  EP_ID:='';
  NLAK_ID:='';
  HIVO:=2;
  AblakNyit(Tform_Megjegyzes, TForm(form_Megjegyzes), true, form_Fooldal.menu11);
  Frissites(megjegyzes,MEG_ID,'megjegyzes_id');
end;

procedure Tform_Lakas.trls1Click(Sender: TObject);
begin
  inherited;
  If Rakerdez('Biztos hogy törli az adatot?') Then
     Torles('megjegyzes','megjegyzes_id='+MEG_ID);
  Frissites(megjegyzes,MEG_ID,'megjegyzes_id');
end;

procedure Tform_Lakas.dbg_kozmuDblClick(Sender: TObject);
var i: Integer;
begin
  i:=BB_BILL;
  BB_BILL:=0;
  AblakNyit(Tform_Kozmu, TForm(form_Kozmu), true, form_Fooldal.menu11);
  Frissites(kozmu,LAK_ID,'lakas_id');
  BB_BILL:=i;
end;

procedure Tform_Lakas.kozmuAfterScroll(DataSet: TDataSet);
begin
  inherited;
  KOZMU_ID:=kozmu.FieldByName('kozmu_id').AsString;
end;

procedure Tform_Lakas.dbg_ellenorzesekDblClick(Sender: TObject);
begin
  inherited;
  If eddigi.RecordCount>0 Then AblakNyit(Tform_BerlemenyEll, TForm(form_BerlemenyEll));
end;

procedure Tform_Lakas.eddigiAfterScroll(DataSet: TDataSet);
begin
  inherited;
  EL_ID:=eddigi.FieldByName('el_id').AsString;
end;

procedure Tform_Lakas.sb_jurtaClick(Sender: TObject);
begin
  inherited;
  If l_szecs.Caption <> '' Then
  begin
    Modositas('l_lakas',['jurta_kod='+l_szecs.Caption],'lakas_id='+LAK_ID);
    e_jurtakod.Text:=l_szecs.Caption;
  end;
end;

procedure Tform_Lakas.dbg_doksiDblClick(Sender: TObject);
begin
  If DOK_NEV<>'' Then
    If ShellExecute(form_Lakas.Handle,'Open',PChar(D_ELERES+DOK_EV+'\'+DOK_NEV), NIL, NIL,SW_SHOW)=-1 Then
       Uzenet('Az állomány nem található, kérje a rendszergazda segítségét!');end;

procedure Tform_Lakas.sb_felClick(Sender: TObject);
var s, fajl_nev: String;
begin
  //Állomány csatolás
  If (od_doksi.Execute) and (od_doksi.FileName<>'') Then
  begin
    fajl_nev:=ExtractFileName(od_doksi.FileName);
    s:=StringReplace(LAK_ID+'_'+fajl_nev,'/','-',[rfReplaceAll]);
    //felmásoljuk a szerverre (D_ELERES)
    If DoksiSzerverre(od_doksi.FileName,AktualisEv+'\'+s)<>'' Then fajl_nev:=s;
    ALL_ID:=Beszuras('allomany',[
      'allomany_nev='+ExtractFileName(fajl_nev),
      'allomany_ev='+AktualisEv
    ]);
    Beszuras('lakas_allomany',[
      'lakas_id='+LAK_ID,
      'allomany_id='+ALL_ID
      ]);
  end;
  doksi.Active:=False;
  doksi.Parameters.ParamByName('lak_id').Value:=LAK_ID;
  doksi.Active:=True;
end;

procedure Tform_Lakas.doksiAfterScroll(DataSet: TDataSet);
begin
  inherited;
  DOK_EV:=doksi.FieldByName('ev').AsString;
  DOK_NEV:=doksi.FieldByName('nev').AsString;
  ALL_ID:=doksi.FieldByName('allomany_id').AsString;
end;

procedure Tform_Lakas.sb_doktorolClick(Sender: TObject);
begin
  inherited;
  If Rakerdez('Biztos törölni szeretnéd az állományt?') Then
  begin
     Torles('lakas_allomany','lakas_id='+LAK_ID+' and allomany_id='+ALL_ID);
     Torles('allomany','allomany_id='+ALL_ID);
  end;
end;

end.
