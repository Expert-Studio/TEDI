unit f_SzerzodesAdat_Unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Alap, Alapfuggveny,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AlapAblak_unit, Vcl.StdCtrls,
  VDComboBox, Vcl.ComCtrls, Vcl.ExtCtrls, Data.DB, Data.Win.ADODB, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, ekbasereport, ekrtf, ShellApi;

type
  Tf_SzerzodesAdat = class(TAlapAblak)
    le_szerzszam: TLabeledEdit;
    Label1: TLabel;
    dtp_mettol: TDateTimePicker;
    dtp_meddig: TDateTimePicker;
    vdc_berlesjog: TVDComboBox;
    Label3: TLabel;
    Label2: TLabel;
    dtp_datum: TDateTimePicker;
    bb_szerzodes: TBitBtn;
    Label6: TLabel;
    le_berlemeny: TLabeledEdit;
    vdc_dijmod: TVDComboBox;
    bb_berlemeny: TBitBtn;
    pc_dijelem: TPageControl;
    TabSheet1: TTabSheet;
    Események: TTabSheet;
    dbg_lista: TDBGrid;
    bb_megsemelem: TBitBtn;
    bb_torolelem: TBitBtn;
    bb_ujelem: TBitBtn;
    vdc_dijelem: TVDComboBox;
    Label7: TLabel;
    le_menny: TLabeledEdit;
    vdc_me: TVDComboBox;
    Label8: TLabel;
    le_egyseg: TLabeledEdit;
    le_netto: TLabeledEdit;
    vdc_afa: TVDComboBox;
    Label9: TLabel;
    le_afa: TLabeledEdit;
    le_brutto: TLabeledEdit;
    le_berlotars: TLabeledEdit;
    bb_berlotars: TBitBtn;
    dbg_berlotars: TDBGrid;
    Label10: TLabel;
    vdc_berlesjog1: TVDComboBox;
    bb_ujtars: TBitBtn;
    bb_toroltars: TBitBtn;
    bb_oktars: TBitBtn;
    bb_megsemtars: TBitBtn;
    Label11: TLabel;
    vdc_fizmod: TVDComboBox;
    Label12: TLabel;
    vdc_idoszak: TVDComboBox;
    bb_felvelem: TBitBtn;
    szerzdijelem: TADOQuery;
    szerzdijelemDS: TDataSource;
    dtp_birtok: TDateTimePicker;
    Label13: TLabel;
    bb_berlo: TBitBtn;
    le_berlo: TLabeledEdit;
    dtp_esemeny: TDateTimePicker;
    Label14: TLabel;
    m_esemeny: TMemo;
    bb_ujesem: TBitBtn;
    bb_okesem: TBitBtn;
    bb_megsemesem: TBitBtn;
    bb_torolesem: TBitBtn;
    dbg_esemeny: TDBGrid;
    Label15: TLabel;
    GroupBox1: TGroupBox;
    cb_automata: TCheckBox;
    cb_emeles: TCheckBox;
    le_emeles: TLabeledEdit;
    vdc_allapot: TVDComboBox;
    Label16: TLabel;
    vdc_vonatkozas: TVDComboBox;
    Label17: TLabel;
    m_leiras: TMemo;
    Label18: TLabel;
    le_terulet: TLabeledEdit;
    le_iktato: TLabeledEdit;
    TabSheet2: TTabSheet;
    dbg_csatolmany: TDBGrid;
    bb_ujcsat: TBitBtn;
    bb_torolcsat: TBitBtn;
    od: TOpenDialog;
    esemeny: TADOQuery;
    esemenyDS: TDataSource;
    csatolmany: TADOQuery;
    csatolmanyDS: TDataSource;
    berlotars: TADOQuery;
    berlotarsDS: TDataSource;
    vdc_szerzido: TVDComboBox;
    Label4: TLabel;
    TabSheet3: TTabSheet;
    bb_ujszerz: TBitBtn;
    bb_torolszerz: TBitBtn;
    dbg_szerzodes: TDBGrid;
    Label5: TLabel;
    vdc_minta: TVDComboBox;
    bb_modszerz: TBitBtn;
    bb_megseszerz: TBitBtn;
    Doksi: TEkRTF;
    szerzodes: TADOQuery;
    szerzodesDS: TDataSource;
    le_baszam: TLabeledEdit;
    dtp_badatum: TDateTimePicker;
    Label19: TLabel;
    lakas: TADOQuery;
    procedure FormShow(Sender: TObject);
    procedure bb_ujelemClick(Sender: TObject);
    procedure bb_felvelemClick(Sender: TObject);
    procedure bb_megsemelemClick(Sender: TObject);
    procedure bb_torolelemClick(Sender: TObject);
    procedure bb_berlemenyClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bb_felveszClick(Sender: TObject);
    procedure bb_ujClick(Sender: TObject);
    procedure bb_berloClick(Sender: TObject);
    procedure bb_berlotarsClick(Sender: TObject);
    procedure SZURESAfterScroll(DataSet: TDataSet);
    procedure bb_megsemClick(Sender: TObject);
    procedure le_egysegExit(Sender: TObject);
    procedure vdc_afaExit(Sender: TObject);
    procedure szerzdijelemAfterScroll(DataSet: TDataSet);
    procedure bb_modositClick(Sender: TObject);
    procedure bb_kilepClick(Sender: TObject);
    procedure bb_ujesemClick(Sender: TObject);
    procedure bb_okesemClick(Sender: TObject);
    procedure esemenyAfterScroll(DataSet: TDataSet);
    procedure bb_torolesemClick(Sender: TObject);
    procedure bb_ujcsatClick(Sender: TObject);
    procedure bb_torolcsatClick(Sender: TObject);
    procedure bb_megsemesemClick(Sender: TObject);
    procedure bb_oktarsClick(Sender: TObject);
    procedure bb_ujtarsClick(Sender: TObject);
    procedure bb_ujszerzClick(Sender: TObject);
    procedure bb_modszerzClick(Sender: TObject);
    procedure le_berlemenyDblClick(Sender: TObject);
    procedure bb_megseszerzClick(Sender: TObject);
    procedure bb_toroltarsClick(Sender: TObject);
    procedure berlotarsAfterScroll(DataSet: TDataSet);
    procedure dbg_csatolmanyDblClick(Sender: TObject);
    procedure csatolmanyAfterScroll(DataSet: TDataSet);
    procedure bb_szerzodesClick(Sender: TObject);
  private
    { Private declarations }
    foszam, alszam, konyv, jel, iratgyujto, ev,
    ESEM_ID, BT_ID :string;
  public
    { Public declarations }
  end;

var
  f_SzerzodesAdat: Tf_SzerzodesAdat;

implementation

uses AlapAdat, f_BerlemenyKereses_Unit, f_BerloKivalasztas_Unit,
  f_BerloKeres_Unit, f_SzemelyKeres_Unit, f_BerlemenyAdat_Unit;

{$R *.dfm}

procedure Tf_SzerzodesAdat.bb_ujszerzClick(Sender: TObject);
begin
  inherited;
  if LAK_ID<>'' then
     vdc_minta.Lekerdezes:='Select * From szerzodes_minta Where szv_id=2';
  if NLAK_ID<>'' then
     vdc_minta.Lekerdezes:='Select * From szerzodes_minta Where szv_id=3';
  if BERL_ID<>'' then
     vdc_minta.Lekerdezes:='Select * From szerzodes_minta Where szv_id=7';
  vdc_minta.Feltolt;
  vdc_minta.Enabled:=True;
  bb_ujszerz.Enabled:=False;
  bb_megseszerz.Enabled:=True;
  bb_modszerz.Enabled:=True;
  vdc_minta.SetFocus;
end;

procedure Tf_SzerzodesAdat.bb_berlemenyClick(Sender: TObject);
begin
  inherited;
  CIM_SOR:='';LAK_ID:='';NLAK_ID:='';BERL_ID:=''; CIM_ID:='';
  AblakNyit(Tf_BerlemenyKereses, TForm(f_BerlemenyKereses));
end;

procedure Tf_SzerzodesAdat.bb_felvelemClick(Sender: TObject);
begin
  inherited;
  if BB_BILL=1 then
    Beszuras('szerzodes_dij',[
    'szdt_id='+vdc_dijelem.Eredmeny,
    'szerz_id='+SZE_ID,
    'afa_id='+vdc_afa.Eredmeny,
    'me_id='+vdc_me.Eredmeny,
    'szd_menny='+le_menny.Text,
    'szd_egysegar='+le_egyseg.Text,
    'szd_netto='+le_netto.Text,
    'szd_afa='+le_afa.Text,
    'szd_brutto='+le_brutto.Text
    ]);
  BB_BILL:=0;
  bb_ujelem.Enabled:=True;
  bb_felvelem.Enabled:=False;
  bb_megsemelem.Enabled:=False;
  bb_torolelem.Enabled:=True;
  szerzdijelem.Active:=False;
  szerzdijelem.Parameters.ParamByName('sze_id').Value:=SZE_ID;
  szerzdijelem.Active:=True;
  bb_ujelem.SetFocus;
end;

procedure Tf_SzerzodesAdat.bb_felveszClick(Sender: TObject);
var s: Word;
begin
  s:=BB_BILL;
  inherited;
  if s=1 then
  begin
    alszam:='';
    jel:='';
    With AdatModul.ADOQuery2 do
    begin
      Active:=False;
      SQL.Text:='Select iratgyujto_id, iratgyujto_ev From irat_gyujto Where iratgyujto_ev = cast((convert(varchar(4),getdate(),102)) as integer)';
      Active:=True;
      iratgyujto:=FieldByName('iratgyujto_id').AsString;
      ev:=FieldByName('iratgyujto_ev').AsString;
      Active:=False;
      SQL.Text:='Select ikonyv_id, ikonyv_szam From iktato_konyvek Where ikonyv_ev = YEAR(getdate()) and ikonyv_statusz=1 and ikonyv_jel is null';
      Active:=True;
      If Not Eof Then
      begin
         IKT_KONYV:=FieldByName('ikonyv_id').AsString;
         konyv:=FieldByName('ikonyv_szam').AsString;
      end;
    end;
    foszam:=iktatoszam(ev, konyv);
    //Iktatás
    IKT_ID:=Beszuras('iktatokonyv',[
        'iratgyujto_id='+iratgyujto,
        'irat_tipus_id=1',
        'szervezet_id='+SZER_ID,
        'szemely_id='+SZEM_ID,
        'selejtezes_id=0',
        'iktato='+FELHASZNALO_ID,
        'iktato_konyv_szama='+konyv,
        'ikonyv_id='+IKT_KONYV,
        'iktatas_iranya=1',
        'iktatas_datuma='+SzerverDat(2),
        'irat_foszam='+foszam,
        'irat_alszam='+alszam,
        'irat_ev='+ev,
        'hatarido_id=1',
        //'elozmeny='+elozo,
        'irat_fotargy_1=180',
        'irat_leiras='+le_berlemeny.Text+' bérleti szerzõdése'
        ], False);
    Beszuras('irat_tortenet',[
        'iktato_id='+IKT_ID,
        'irat_all_id=1',
        'kitol='+FELHASZNALO_ID,
        'felh_csoport_id=42',
        'felh_id='+Vezeto('42'),
        'tortenet_kezdet='+SzerverDat(2),
        'irat_csoport_id=42',
        'tortenet_veg='+StrDate(MAXDAT),
        'atadva=0'
        ]);
    Beszuras('iktato_cim',[
        'iktato_id='+IKT_ID,
        'cim_id='+CIM_ID
      ]);
    //Szerzõdés
      BERLO_ID:=Beszuras('berlok',[
        'szemely_id='+SZEM_ID,
        'szervezet_id='+SZER_ID
        ]);
      SZE_ID:=Beszuras('szerzodes',[
        'berlo_id='+BERLO_ID,
        'iktato_id='+IKT_ID,
        'me_id=6',
        'szf_id=1',
        'szi_id='+vdc_szerzido.Eredmeny,
        'szt_id=5',
        'berlesjog_id='+vdc_berlesjog.Eredmeny,
        'fm_id='+vdc_fizmod.Eredmeny,
        'szd_id=1',
        'sza_id='+vdc_allapot.Eredmeny,
        'sztargy_id=65',
        'szv_id='+vdc_vonatkozas.Eredmeny,
        'dsz_id='+vdc_dijmod.Eredmeny,
        'felh_csoport_id=42',
        'szerz_ev='+SzerverEv,
        'szerz_szam=0',
        'szerz_datum='+StrDate(DateToStr(dtp_datum.Date)),
        'szerz_mettol='+StrDate(DateToStr(dtp_mettol.Date)),
        'szerz_meddig='+StrDate(DateToStr(dtp_meddig.Date)),
        'szerz_birtok='+StrDate(DateToStr(dtp_birtok.Date)),
        'bado_szama='+le_baszam.Text,
        'bado_datuma='+StrDate(DateToStr(dtp_birtok.Date)),
        'df_id='+vdc_idoszak.Eredmeny,
        'szerz_emeles='+BoolToStr(cb_emeles.Checked),
        'szerz_automata='+BoolToStr(cb_automata.Checked),
        'szerz_emelesszaz='+le_emeles.Text,
        'szerz_leiras='+m_leiras.Text
        ], False);
      Beszuras('szerzodes_kapocs',[
        'szerz_id='+SZE_ID,
        'lakas_id='+LAK_ID,
        'nem_lakas_id='+NLAK_ID,
        'berl_id='+BERL_ID
      ]);
      m_esemeny.Text:='A szerzõdés rögzítésre került.';
      Beszuras('szerzodes_esemeny',[
        'szerz_id='+SZE_ID,
        'felh_id='+FELHASZNALO_ID,
        'sze_datum='+SzerverDat(2),
        'sze_leiras='+m_esemeny.Text
      ]);
    //Ha volt már bérlõ, akkor kivezetni
    LISTA.Active:=False;
    if LAK_ID<>'' then
      LISTA.SQL.Text:=
        'Select TOP 1 a.lakas_id, a.berlo_kapcsolat_id From berlo_kapcsolat a, berlok b '+
        'Where a.berlo_id = b.berlo_id and a.berles_vege_datuma > getdate() and a.lakas_id = '+LAK_ID+' Order by a.berles_vege_datuma desc';
    if NLAK_ID<>'' then
      LISTA.SQL.Text:=
        'Select TOP 1 a.nem_lakas_id, a.berlo_kapcsolat_id From berlo_kapcsolat a, berlok b '+
        'Where a.berlo_id = b.berlo_id and a.berles_vege_datuma > getdate() and a.nem_lakas_id = '+NLAK_ID+' Order by a.berles_vege_datuma desc';
    if BERL_ID<>'' then
      LISTA.SQL.Text:=
        'Select TOP 1 a.berl_id, a.berlo_kapcsolat_id From berlo_kapcsolat a, berlok b '+
        'Where a.berlo_id = b.berlo_id and a.berles_vege_datuma > getdate() and a.berl_id = '+BERL_ID+' Order by a.berles_vege_datuma desc';
    LISTA.Active:=True;

    If (LISTA.RecordCount>0) or (LISTA.FieldByName('berlo_kapcsolat_id').AsString<>'') Then
       Modositas('berlo_kapcsolat',
        ['berles_vege_datuma='+StrDate(DateToStr(dtp_mettol.Date))],
        'berlo_kapcsolat_id='+LISTA.FieldByName('berlo_kapcsolat_id').AsString);
    //Berlõ módosítása
    BKAP_ID:=Beszuras('berlo_kapcsolat',[
      'lakas_id='+LAK_ID,
      'nem_lakas_id='+NLAK_ID,
      'berl_id='+BERL_ID,
      'berlo_id='+BERLO_ID,
      'berlesjog_id='+vdc_berlesjog.Eredmeny,
      'bstatusz_id=1',
      'berles_kezdet_datuma='+StrDate(DateToStr(dtp_mettol.Date)),
      'berles_vege_datuma='+StrDate(DateToStr(dtp_meddig.Date)),
      'hasznalt_terulet='+le_terulet.Text
      ]);
    pc_dijelem.Enabled:=True;
  end;
  if s=2 then
  begin
      Modositas('szerzodes',[
        'berlo_id='+BERLO_ID,
        'szi_id='+vdc_szerzido.Eredmeny,
        'berlesjog_id='+vdc_berlesjog.Eredmeny,
        'fm_id='+vdc_fizmod.Eredmeny,
        'sza_id='+vdc_allapot.Eredmeny,
        'szv_id='+vdc_vonatkozas.Eredmeny,
        'dsz_id='+vdc_dijmod.Eredmeny,
        'szerz_ev='+SzerverEv,
        'szerz_datum='+StrDate(DateToStr(dtp_datum.Date)),
        'szerz_mettol='+StrDate(DateToStr(dtp_mettol.Date)),
        'szerz_meddig='+StrDate(DateToStr(dtp_meddig.Date)),
        'szerz_birtok='+StrDate(DateToStr(dtp_birtok.Date)),
        'bado_szama='+le_baszam.Text,
        'bado_datuma='+StrDate(DateToStr(dtp_birtok.Date)),
        'df_id='+vdc_idoszak.Eredmeny,
        'szerz_emeles='+BoolToStr(cb_emeles.Checked),
        'szerz_automata='+BoolToStr(cb_automata.Checked),
        'szerz_emelesszaz='+le_emeles.Text,
        'szerz_leiras='+m_leiras.Text
        ], 'szerz_id='+SZE_ID);
  end;
  bb_berlemeny.Enabled:=False;
  bb_berlo.Enabled:=False;
  bb_ujelem.Enabled:=True;
  bb_felvelem.Enabled:=False;
  bb_megsemelem.Enabled:=False;
  bb_torolelem.Enabled:=False;
  SZURES.Active:=False;
  SZURES.Parameters.ParamByName('sze_id').Value:=SZE_ID;
  SZURES.Active:=True;
  f_SzerzodesAdat.BorderStyle:=bsSizeable;
  f_SzerzodesAdat.BorderWidth:=0;
end;

procedure Tf_SzerzodesAdat.bb_kilepClick(Sender: TObject);
begin
  GridAllapotMentes(dbg_lista);
  GridAllapotMentes(dbg_esemeny);
  GridAllapotMentes(dbg_berlotars);
  inherited;
end;

procedure Tf_SzerzodesAdat.bb_megsemClick(Sender: TObject);
begin
  inherited;
  pc_dijelem.Enabled:=True;
  f_SzerzodesAdat.BorderStyle:=bsSizeable;
  f_SzerzodesAdat.BorderWidth:=0;
end;

procedure Tf_SzerzodesAdat.bb_megsemelemClick(Sender: TObject);
begin
  inherited;
  BB_BILL:=0;
  bb_ujelem.Enabled:=True;
  bb_felvelem.Enabled:=False;
  bb_megsemelem.Enabled:=False;
  bb_torolelem.Enabled:=True;
end;

procedure Tf_SzerzodesAdat.bb_megsemesemClick(Sender: TObject);
begin
  inherited;
  dtp_esemeny.Enabled:=False;
  m_esemeny.Enabled:=False;
end;

procedure Tf_SzerzodesAdat.bb_megseszerzClick(Sender: TObject);
begin
  inherited;
  vdc_minta.Enabled:=False;
  bb_ujszerz.Enabled:=True;
  bb_megseszerz.Enabled:=False;
  bb_modszerz.Enabled:=False;
end;

procedure Tf_SzerzodesAdat.bb_modositClick(Sender: TObject);
begin
  inherited;
  pc_dijelem.Enabled:=True;
  bb_ujelem.Enabled:=True;
  bb_felvelem.Enabled:=True;
  bb_megsemelem.Enabled:=True;
  bb_torolelem.Enabled:=True;
  bb_berlo.Enabled:=False;
  bb_berlemeny.Enabled:=False;
  le_szerzszam.Enabled:=False;
  le_iktato.Enabled:=False;
end;

procedure Tf_SzerzodesAdat.bb_modszerzClick(Sender: TObject);
var elozmeny, szerszam, verzio: String;
begin
    //Szerzõdés összeállítása
    szerszam:=StringReplace(le_szerzszam.Text,'-','/',[rfReplaceAll]);
    //Lakás adat
    lakas.Active:=False;
    lakas.SQL.Text:='Select a.*, '+
      '(Select x.HELYRAJZISZAM From HELYRAJZI_SZAMOK x Where x.HRSZ_ID=a.HRSZ_ID) as hrsz, '+
      '(Select x.KOMFORT_NEV From L_KOMFORTFOKOZAT x Where x.KOMFORT_ID=a.KOMFORT_ID) as komfort '+
      'From l_lakas a Where a.lakas_id='+LAK_ID;
    lakas.Active:=True;
    //Utolsó változat keresése
    LISTA.Active:=False;
    LISTA.SQL.Text:='Select TOP 1 b.dokumentum_nev, b.doku_verzio, c.szerszam, b.doku_tartalom '+
      'From szerzodes_dokumentum a, dokumentum b, szerzodes c '+
      'Where a.szerz_id='+SZE_ID+' and a.dokumentum_id=b.dokumentum_id '+
      'and a.szerz_id=c.szerz_id Order By a.szerzdok_datum desc';
    LISTA.Active:=True;
    if LISTA.RecordCount>1 then
    begin
      elozmeny:=LISTA.FieldByName('dokumentum_nev').AsString;
      if LISTA.FieldByName('doku_verzio').AsString<>'' then
         verzio:=IntToStr(LISTA.FieldByName('doku_verzio').AsInteger+1)
      else
         verzio:='1';
      szerszam:=LISTA.FieldByName('szerszam').AsString+'/'+verzio;
    end;
    If vdc_minta.Text<>'' Then
    begin
        //Minta dokumentum az adatbázisból
        LISTA.Active:=False;
        LISTA.SQL.Text:='Select * From szerzodes_minta Where szm_id='+vdc_minta.Eredmeny;
        LISTA.Active:=True;
        TBlobField(LISTA.FieldByName('szm_tartalom')).SaveToFile(GetCurrentDir+'\aa_'+vdc_minta.Text+'.rtf');
        //Minta dokumentum betöltése, kitöltése
        Doksi.InFile:=GetCurrentDir+'\aa_'+vdc_minta.Text;
        Doksi.OutFile:=GetCurrentDir+'\aa_'+StringReplace(szerszam+'.doc', '/','-',[rfReplaceAll]);
        Doksi.ClearVars;
        Doksi.CreateVar('elozmeny',elozmeny);
        Doksi.CreateVar('ugyszam',szerszam);
        Doksi.CreateVar('vezerigazgato','');
//        Doksi.Execute([SZURES,lakas,szerzdijelem,berlotars]);
        Doksi.Execute([SZURES,lakas,szerzdijelem]);
        DOK_NEV:=StringReplace('sz_'+szerszam+'.doc', '/','-',[rfReplaceAll]);
        DOK_EV:=ev;
        DOK_ID:=Beszuras('dokumentum',[
            'dokumentum_nev='+DOK_NEV,
            'doku_ev='+DOK_EV,
            'doku_tip_id=5',
            'da_id=1',
            'doku_verzio='+verzio
            ]);
        Beszuras('szerzodes_dokumentum',[
            'szerz_id='+SZE_ID,
            'dokumentum_id='+DOK_ID,
            'szerzdok_datum='+SzerverDat(2)
            ]);
        BB_BILL:=0;
        DOK_ALL:=2;
        DOK_FELH:=FELHASZNALO_ID;
        LISTA.SQL.Text:='Update dokumentum set doku_tartalom = :dok Where dokumentum_id='+DOK_ID;
        LISTA.Parameters.ParamByName('dok').LoadFromFile(Doksi.OutFile,ftBlob);
        LISTA.ExecSQL;
        //Szerkesztés
        try
            ShellExecute(f_SzerzodesAdat.Handle,'Open',PChar(Doksi.OutFile), NIL, NIL,SW_SHOW);
        except
          on E : Exception do
          begin
            Uzenet('Hiba a szerzõdésnél!');
            if HibaKuldes(Self.Name, E.ClassName+' hiba üzenettel: '+E.Message ,SZURES.SQL.Text) then
               Uzenet('A hiba továbbításra került a fejlesztõk felé!');
            end;
        end;
        Sleep(500);
        AFE_ID:=FE_ID;
        FE_ID:=Beszuras('FELADATOK',[
            'ELOZO_FELADAT='+AFE_ID,
            'FELADO='+FELHASZNALO_ID,
            'CIMZETT=1',
            'FTIPUS_ID=5',
            'FALLAPOT_ID=10',
            'FELADAT_NEV='+'Szerkesztés',
            'FELADAT_SZOVEG='+'A dokumentumot szerkesztették, módosították.',
            'FDATUMTOL='+SzerverDat(2)
            ], False);
           //Továbbítás
//        If Rakerdez('Továbbítja a levelet ... részére?') Then
//        begin
//            DOK_ALAIRO:='';
//            //A dokumentum állapotának módosítása - továbbított
//            Modositas('iktato_dokumentum',['ida_id=1'],'dokumentum_id='+DOK_ID);
//            DOK_ALL:=1;  //továbbított
//            If FE_ID<>'' Then
//               FE_ID:=Beszuras('FELADATOK',[
//                  'ELOZO_FELADAT='+AFE_ID,
//                  'FELADO='+FELHASZNALO_ID,
//                  'CIMZETT=1',
//                  'FTIPUS_ID=5',
//                  'FALLAPOT_ID=6',
//                  'FELADAT_NEV='+'Továbbítás',
//                  'FELADAT_SZOVEG='+'A dokumentum további ellenõrzésre küldve.',
//                  'FDATUMTOL='+SzerverDat(2)
//                  ], False);
//        end;
      SZURESAfterScroll(SZURES);
   end;
end;

procedure Tf_SzerzodesAdat.bb_okesemClick(Sender: TObject);
begin
  Beszuras('szerzodes_esemeny',[
      'szerz_id='+SZE_ID,
      'felh_id='+FELHASZNALO_ID,
      'sze_datum='+StrDate(DateToStr(dtp_esemeny.Date)),
      'sze_leiras='+m_esemeny.Text
    ]);
  esemeny.Active:=False;
  esemeny.Parameters.ParamByName('sze_id').Value:=SZE_ID;
  esemeny.Active:=True;
  dtp_esemeny.Enabled:=False;
  m_esemeny.Enabled:=False;
  bb_okesem.Enabled:=False;
  bb_megsemesem.Enabled:=False;
  bb_ujesem.Enabled:=True;
  bb_torolesem.Enabled:=True;
  inherited;
end;

procedure Tf_SzerzodesAdat.bb_oktarsClick(Sender: TObject);
var  s:String;
begin
  inherited;
  if BERLO_TARS<>'' then
  begin
    s:=Beszuras('berlok',[
      'szemely_id='+SZEM_ID,
      'szervezet_id='+SZER_ID
    ]);
    BKAP_ID:=Beszuras('berlo_kapcsolat',[
      'lakas_id='+LAK_ID,
      'nem_lakas_id='+NLAK_ID,
      'berl_id='+BERL_ID,
      'berlo_id='+s,
      'berlesjog_id='+vdc_berlesjog1.Eredmeny,
      'bstatusz_id=1',
      'berles_kezdet_datuma='+StrDate(DateToStr(dtp_mettol.Date)),
      'berles_vege_datuma='+StrDate(DateToStr(dtp_meddig.Date)),
      'hasznalt_terulet='+le_terulet.Text
    ]);
    berlotars.Active:=False;
    berlotars.Parameters.ParamByName('sze_id').Value:=SZE_ID;
    berlotars.Active:=True;;
  end;
end;

procedure Tf_SzerzodesAdat.bb_szerzodesClick(Sender: TObject);
begin
  //Az utolsó érvényes PDF formátumú szerzõdés

end;

procedure Tf_SzerzodesAdat.bb_torolcsatClick(Sender: TObject);
begin
  inherited;
  if Rakerdez('Biztos törlöd a csatolmányt?') then
     Torles('dokumentum','dokuemtum_id='+DOK_ID);
  csatolmany.Active:=False;
  csatolmany.Parameters.ParamByName('sze_id').Value:=SZE_ID;
  csatolmany.Active:=True;
end;

procedure Tf_SzerzodesAdat.bb_torolelemClick(Sender: TObject);
begin
  inherited;
  if True then

  BB_BILL:=0;
end;

procedure Tf_SzerzodesAdat.bb_torolesemClick(Sender: TObject);
begin
  inherited;
  if Rakerdez('Biztos törlöd az eseményt?') then
     Torles('szerzodes_esemeny','sze_id='+ESEM_ID);
  esemeny.Active:=False;
  esemeny.Parameters.ParamByName('sze_id').Value:=SZE_ID;
  esemeny.Active:=True;
  dtp_esemeny.Enabled:=False;
  m_esemeny.Enabled:=False;
end;

procedure Tf_SzerzodesAdat.bb_toroltarsClick(Sender: TObject);
begin
  inherited;
  if rakerdez('Biztos törlöd a bérlõtársat?') then
  begin
     Torles('berlo_kapcsolat','berlo_kapcsolat_id='+BKAP_ID);
     Torles('berlok','berlo_id='+BT_ID);
  end;
end;

procedure Tf_SzerzodesAdat.bb_ujClick(Sender: TObject);
begin
  inherited;
  bb_ujelem.Enabled:=False;
  bb_felvelem.Enabled:=False;
  bb_megsemelem.Enabled:=False;
  bb_torolelem.Enabled:=False;
  bb_berlemeny.Enabled:=True;
  bb_berlo.Enabled:=True;
  //Szerzõdésszám generálása triggerre megy
  vdc_allapot.Ertek('2');
  vdc_idoszak.Ertek('2');
  szerzdijelem.Active:=False;
  pc_dijelem.Enabled:=False;
end;

procedure Tf_SzerzodesAdat.bb_ujcsatClick(Sender: TObject);
begin
  inherited;
  If od.Execute Then
  begin
    Application.ProcessMessages;
    DOK_ID:=Beszuras('dokumentum',[
      'dokumentum_nev='+ExtractFilename(od.FileName),
      'doku_tip_id=0',
      'doku_ev='+SzerverEv()
    ]);
    LISTA.SQL.Text:='Update dokumentum set doku_tartalom = :dok Where dokumentum_id='+DOK_ID;
    LISTA.Parameters.ParamByName('dok').LoadFromFile(od.FileName,ftBlob);
    LISTA.ExecSQL;
    Beszuras('szerzodes_dokumentum', [
      'szerz_id='+SZE_ID,
      'dokumentum_id='+DOK_ID,
      'szerzdok_datum='+SzerverDat(2)
    ]);
    csatolmany.Active:=False;
    csatolmany.Parameters.ParamByName('sze_id').Value:=SZE_ID;
    csatolmany.Active:=True;
    if csatolmany.RecordCount>0 then bb_torolcsat.Enabled:=True else bb_torolcsat.Enabled:=False;
    Application.ProcessMessages;
  end;
end;

procedure Tf_SzerzodesAdat.bb_ujelemClick(Sender: TObject);
begin
  inherited;
  BB_BILL:=1;
  vdc_dijelem.Enabled:=True;
  le_menny.Enabled:=True;
  vdc_me.Enabled:=True;
  le_egyseg.Enabled:=True;
  le_netto.Enabled:=True;
  vdc_afa.Enabled:=True;
  le_afa.Enabled:=True;
  le_brutto.Enabled:=True;
  vdc_dijelem.ItemIndex:=-1;
  le_menny.Text:='1';
  vdc_me.Ertek('6');
  le_egyseg.Text:='';
  le_netto.Text:='';
  vdc_afa.ItemIndex:=-1;
  le_afa.Text:='';
  le_brutto.Text:='';
  vdc_dijelem.SetFocus;
  bb_ujelem.Enabled:=False;
  bb_felvelem.Enabled:=True;
  bb_megsemelem.Enabled:=True;
  bb_torolelem.Enabled:=False;
end;

procedure Tf_SzerzodesAdat.bb_ujesemClick(Sender: TObject);
begin
  inherited;
//  BB_BILL:=1;
//  Szinvaltas(Self, BB_BILL);
  dtp_esemeny.Enabled:=True;
  dtp_esemeny.Date:=SzervDatum;
  m_esemeny.Enabled:=True;
  dtp_esemeny.SetFocus;
  bb_ujesem.Enabled:=False;
  bb_okesem.Enabled:=True;
  bb_megsemesem.Enabled:=True;
  bb_torolesem.Enabled:=False;
end;

procedure Tf_SzerzodesAdat.bb_ujtarsClick(Sender: TObject);
begin
  inherited;
  bb_ujtars.Enabled:=False;
  bb_berlotars.Enabled:=True;
  bb_oktars.Enabled:=True;
  bb_megsemtars.Enabled:=True;
  vdc_berlesjog1.Enabled:=True;
  vdc_berlesjog1.Ertek('10');
  le_berlotars.Enabled:=True;
end;

procedure Tf_SzerzodesAdat.berlotarsAfterScroll(DataSet: TDataSet);
begin
  inherited;
  BT_ID:=berlotars.FieldByName('berlo_id').AsString;
  BKAP_ID:=berlotars.FieldByName('berlo_kapcsolat_id').AsString;
  le_berlotars.Text:=berlotars.FieldByName('berlotars').AsString;
  vdc_berlesjog1.Ertek(berlotars.FieldByName('berlesjog_id').AsString);
end;

procedure Tf_SzerzodesAdat.csatolmanyAfterScroll(DataSet: TDataSet);
begin
  inherited;
  DOK_ID:=csatolmany.FieldByName('dokumentum_id').AsString;
end;

procedure Tf_SzerzodesAdat.dbg_csatolmanyDblClick(Sender: TObject);
begin
  inherited;
  LISTA.Active:=False;
  LISTA.SQL.Text:='Select doku_tartalom, dokumentum_nev From dokumentum Where dokumentum_id='+DOK_ID;
  LISTA.Active:=True;
  TBlobField(LISTA.FieldByName('doku_tartalom')).SaveToFile(MEGOSZTAS +'aa_'+LISTA.FieldByName('dokumentum_nev').AsString);
  ShellExecute(f_SzerzodesAdat.Handle,'Open',PChar(MEGOSZTAS +'aa_'+LISTA.FieldByName('dokumentum_nev').AsString), NIL, NIL,SW_SHOW);
end;

procedure Tf_SzerzodesAdat.bb_berloClick(Sender: TObject);
begin
  inherited;
  BERLO:=''; SZEM_ID:=''; SZER_ID:='';
  AblakNyit(Tf_BerloKivalasztas, TForm(f_BerloKivalasztas));
end;

procedure Tf_SzerzodesAdat.bb_berlotarsClick(Sender: TObject);
begin
  inherited;
  BERLO_TARS:='';
  AblakNyit(Tf_SzemelyKeres, TForm(f_SzemelyKeres));
end;

procedure Tf_SzerzodesAdat.esemenyAfterScroll(DataSet: TDataSet);
begin
  inherited;
  ESEM_ID:=esemeny.FieldByName('sze_id').AsString;
  dtp_esemeny.Date:=esemeny.FieldByName('sze_datum').AsDateTime;
  m_esemeny.Text:=esemeny.FieldByName('sze_leiras').AsString;
end;

procedure Tf_SzerzodesAdat.FormActivate(Sender: TObject);
begin
  inherited;
  if CIM_SOR<>'' then
  begin
    le_berlemeny.Text:=CIM_SOR;
  end;
  if BERLO<>'' then
  begin
    le_berlo.Text:=BERLO;
    if SZEM_ID<>'' then
       le_berlo.Hint:='Anyja neve: '+SZEM_ANYJA+UJSOR+'Születési idõ: '+SZEM_SZD+UJSOR+'Születési hely:'+SZEM_SZH
    else
       le_berlo.Hint:='Adószám:'+SZER_ADO+UJSOR+'Benkszámla:'+SZER_BSZ;
  end;
  if SZEM_ID<>'' then
  begin
    BERLO_TARS:=SZEM_ID;
    le_berlotars.Text:=SZEM_NEV;
  end;
end;

procedure Tf_SzerzodesAdat.FormShow(Sender: TObject);
begin
  inherited;
  GridAllapotToltes(dbg_lista);
  GridAllapotToltes(dbg_esemeny);
  GridAllapotToltes(dbg_berlotars);
  pc_dijelem.ActivePageIndex:=0;
  pc_dijelem.Enabled:=True;
  vdc_berlesjog.Feltolt;
  vdc_berlesjog1.Feltolt;
  vdc_dijmod.Feltolt;
  vdc_idoszak.Feltolt;
  vdc_fizmod.Feltolt;
  vdc_dijelem.Feltolt;
  vdc_me.Feltolt;
  vdc_afa.Feltolt;
  vdc_vonatkozas.Feltolt;
  vdc_allapot.Feltolt;
  vdc_szerzido.Feltolt;
  if HIVO=1 then
     bb_ujClick(Self)
  else
  begin
    if SZE_ID<>'' then
    begin
      SZURES.Active:=False;
      SZURES.Parameters.ParamByName('sze_id').Value:=SZE_ID;
      SZURES.Active:=True;
    end;
  end;
end;

procedure Tf_SzerzodesAdat.le_berlemenyDblClick(Sender: TObject);
begin
  inherited;
  AblakNyit(Tf_BerlemenyAdat, TForm(f_BerlemenyAdat));
end;

procedure Tf_SzerzodesAdat.le_egysegExit(Sender: TObject);
begin
  inherited;
  if (le_egyseg.Text<>'') and (le_menny.Text<>'') then
     le_netto.Text:=IntToStr(StrToInt(le_egyseg.Text)*StrToInt(le_menny.Text));
end;

procedure Tf_SzerzodesAdat.szerzdijelemAfterScroll(DataSet: TDataSet);
begin
  inherited;
  vdc_dijelem.Ertek(szerzdijelem.FieldByName('szdt_id').AsString);
  vdc_me.Ertek(szerzdijelem.FieldByName('me_id').AsString);
  vdc_afa.Ertek(szerzdijelem.FieldByName('afa_id').AsString);
  le_menny.Text:=szerzdijelem.FieldByName('szd_menny').AsString;
  le_egyseg.Text:=szerzdijelem.FieldByName('szd_egysegar').AsString;
  le_netto.Text:=szerzdijelem.FieldByName('szd_netto').AsString;
  le_afa.Text:=szerzdijelem.FieldByName('szd_afa').AsString;
  le_brutto.Text:=szerzdijelem.FieldByName('szd_brutto').AsString;
end;

procedure Tf_SzerzodesAdat.SZURESAfterScroll(DataSet: TDataSet);
begin
  inherited;
  SZE_ID:=SZURES.FieldByName('szerz_id').AsString;
  le_szerzszam.Text:=SZURES.FieldByName('szerszam').AsString;
  le_iktato.Text:=SZURES.FieldByName('iktatoszam').AsString;
  dtp_mettol.Date:=SZURES.FieldByName('szerz_mettol').AsDateTime;
  dtp_meddig.Date:=SZURES.FieldByName('szerz_meddig').AsDateTime;
  dtp_datum.Date:=SZURES.FieldByName('szerz_datum').AsDateTime;
  dtp_birtok.Date:=SZURES.FieldByName('szerz_birtok').AsDateTime;
  vdc_vonatkozas.Ertek(SZURES.FieldByName('szv_id').AsString);
  vdc_berlesjog.Ertek(SZURES.FieldByName('berlesjog_id').AsString);
  vdc_fizmod.Ertek(SZURES.FieldByName('fm_id').AsString);
  vdc_allapot.Ertek(SZURES.FieldByName('sza_id').AsString);
  vdc_dijmod.Ertek(SZURES.FieldByName('dsz_id').AsString);
  vdc_idoszak.Ertek(SZURES.FieldByName('df_id').AsString);
  vdc_szerzido.Ertek(SZURES.FieldByName('szi_id').AsString);
  SZEM_ID:=SZURES.FieldByName('szemely_id').AsString;
  SZER_ID:=SZURES.FieldByName('szervezet_id').AsString;
  BERLO_ID:=SZURES.FieldByName('berlo_id').AsString;
  LAK_ID:=SZURES.FieldByName('lakas_id').AsString;
  NLAK_ID:=SZURES.FieldByName('nem_lakas_id').AsString;
  BERL_ID:=SZURES.FieldByName('berl_id').AsString;
  le_berlemeny.Text:=SZURES.FieldByName('berlemeny').AsString;
  le_berlo.Text:=SZURES.FieldByName('berlo').AsString;
  cb_emeles.Checked:=SZURES.FieldByName('szerz_emeles').AsBoolean;
  cb_automata.Checked:=SZURES.FieldByName('szerz_automata').AsBoolean;
  le_emeles.Text:=SZURES.FieldByName('szerz_emelesszaz').AsString;
  le_terulet.Text:=SZURES.FieldByName('terulet').AsString;
  if SZER_ID<>'' then
  begin
    LISTA.SQL.Text:='Select adoszam, bankszamlaszam From szervezet Where szervezet_id='+SZER_ID;
    LISTA.Active:=True;
    le_berlo.Hint:='Adószám:'+LISTA.FieldByName('adoszam').AsString+UJSOR+'Bankszámla:'+LISTA.FieldByName('bankszamlaszam').AsString;
  end;
  if SZEM_ID<>'' then
  begin
    LISTA.SQL.Text:='Select anyja_neve, szuletesi_hely, szuletesi_datum From szemely Where szemely_id='+SZEM_ID;
    LISTA.Active:=True;
    le_berlo.Hint:='Anyja neve: '+LISTA.FieldByName('anyja_neve').AsString+UJSOR+'Születési idõ: '+
    LISTA.FieldByName('szuletesi_datum').AsString+UJSOR+'Születési hely:'+LISTA.FieldByName('szuletesi_hely').AsString;
  end;
  szerzdijelem.Active:=False;
  szerzdijelem.Parameters.ParamByName('sze_id').Value:=SZE_ID;
  szerzdijelem.Active:=True;
  esemeny.Active:=False;
  esemeny.Parameters.ParamByName('sze_id').Value:=SZE_ID;
  esemeny.Active:=True;
  if esemeny.RecordCount>0 then bb_torolesem.Enabled:=True else bb_torolesem.Enabled:=False;
  berlotars.Active:=False;
  berlotars.Parameters.ParamByName('sze_id').Value:=SZE_ID;
  berlotars.Active:=True;
  if berlotars.RecordCount>0 then bb_toroltars.Enabled:=True else bb_toroltars.Enabled:=False;
  csatolmany.Active:=False;
  csatolmany.Parameters.ParamByName('sze_id').Value:=SZE_ID;
  csatolmany.Active:=True;
  if csatolmany.RecordCount>0 then bb_torolcsat.Enabled:=True else bb_torolcsat.Enabled:=False;
  szerzodes.Active:=False;
  szerzodes.Parameters.ParamByName('sze_id').Value:=SZE_ID;
  szerzodes.Active:=True;
  if szerzodes.RecordCount>0 then bb_torolszerz.Enabled:=True else bb_torolszerz.Enabled:=False;
end;

procedure Tf_SzerzodesAdat.vdc_afaExit(Sender: TObject);
begin
  inherited;
  if (le_netto.Text<>'') and (vdc_afa.ItemIndex>-1) then
  begin
     le_afa.Text:=IntToStr(Round(StrToInt(le_netto.Text)*StrToInt(vdc_afa.Text)/100));
     le_brutto.Text:=IntToStr(StrToInt(le_afa.Text)+StrToInt(le_netto.Text));
  end;
end;

end.
