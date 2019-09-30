unit f_SzamlaAdat_Unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, f_GridMezok_Unit,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AlapAblak_unit, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.Mask, Vcl.StdCtrls, Vcl.CheckLst, VDComboBox, Vcl.ExtCtrls,
  Vcl.ComCtrls, Data.Win.ADODB, Vcl.Buttons, Alap, Alapfuggveny,
  ekbasereport, ekrtf, Vcl.OleAuto, Vcl.OleCtnrs, Vcl.WinXCtrls;

type
  Tf_SzamlaAdat = class(TAlapAblak)
    pc_szamla: TPageControl;
    TabSheet1: TTabSheet;
    Csoportos: TTabSheet;
    vdc_mod1: TVDComboBox;
    Label1: TLabel;
    me_teljesites: TMaskEdit;
    Label2: TLabel;
    me_hatarido: TMaskEdit;
    Label3: TLabel;
    Label4: TLabel;
    bb_szerzodes: TBitBtn;
    Label6: TLabel;
    vdc_mod2: TVDComboBox;
    Label7: TLabel;
    dbg_csoport: TDBGrid;
    le_csopev: TLabeledEdit;
    le_csopho: TLabeledEdit;
    Label8: TLabel;
    Label9: TLabel;
    vdc_tipus: TVDComboBox;
    vdc_szamla: TVDComboBox;
    CSOPORT: TADOQuery;
    CSOPORTds: TDataSource;
    le_berlo: TLabeledEdit;
    bb_szemely: TBitBtn;
    bb_szerv: TBitBtn;
    Doksi: TEkRTF;
    SZAMLATETEL: TADOQuery;
    SZAMLATETELds: TDataSource;
    dbg_szerzodes: TDBGrid;
    vdc_penznem1: TVDComboBox;
    Label10: TLabel;
    SZERZODES: TADOQuery;
    SZERZODESds: TDataSource;
    vdc_penznem2: TVDComboBox;
    Label11: TLabel;
    AFAOSSZ: TADOQuery;
    l_szamlaszam: TLabel;
    l_osszbrutto: TLabel;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    GroupBox1: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    le_menny: TLabeledEdit;
    vdc_me: TVDComboBox;
    le_egyseg: TLabeledEdit;
    le_netto: TLabeledEdit;
    vdc_afa: TVDComboBox;
    le_afa: TLabeledEdit;
    le_brutto: TLabeledEdit;
    dbg_lista: TDBGrid;
    bb_szerztetel: TBitBtn;
    bb_szerzttorl: TBitBtn;
    e_nev: TEdit;
    Label5: TLabel;
    rg_tipus: TRadioGroup;
    bb_elo: TBitBtn;
    le_ev: TLabeledEdit;
    le_ho: TLabeledEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    LabeledEdit1: TLabeledEdit;
    VDComboBox1: TVDComboBox;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    VDComboBox2: TVDComboBox;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    Edit1: TEdit;
    BitBtn3: TBitBtn;
    p_keres: TPanel;
    ActivityIndicator1: TActivityIndicator;
    procedure bb_szerztetelClick(Sender: TObject);
    procedure bb_szerzodesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bb_felveszClick(Sender: TObject);
    procedure bb_szemelyClick(Sender: TObject);
    procedure bb_szervClick(Sender: TObject);
    procedure bb_nyomtatClick(Sender: TObject);
    procedure dbg_szerzodesDblClick(Sender: TObject);
    procedure SZURESAfterScroll(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure pc_szamlaChange(Sender: TObject);
    procedure bb_ujClick(Sender: TObject);
    procedure SZERZODESAfterScroll(DataSet: TDataSet);
    procedure bb_kilepClick(Sender: TObject);
    procedure dbg_szerzodesKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbg_listaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbg_csoportKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbg_csoportTitleClick(Column: TColumn);
    procedure dbg_listaTitleClick(Column: TColumn);
    procedure dbg_szerzodesTitleClick(Column: TColumn);
    procedure SZAMLATETELAfterScroll(DataSet: TDataSet);
    procedure bb_eloClick(Sender: TObject);
    procedure rg_tipusClick(Sender: TObject);
  private
    { Private declarations }
    OSSZ: String;
  public
    { Public declarations }
  end;

var
  f_SzamlaAdat: Tf_SzamlaAdat;

implementation

{$R *.dfm}

uses f_SzamlaTetelAdat_Unit, f_SzerzodesAdat_Unit, AlapAdat,
     f_BerloKeres_Unit;

procedure Tf_SzamlaAdat.bb_felveszClick(Sender: TObject);
var s: Word;
    k: String;
begin
  k:='';
  s:=BB_BILL;
  inherited;
  if vdc_szamla.Eredmeny='-1' then
     k:='NULL' Else k:=vdc_szamla.Eredmeny;
  case pc_szamla.ActivePageIndex of
  0:
    begin
      //Új adat
      if s=1 then
      begin
        SZAMLA_ID:=Beszuras('szamla',[
          'felh_id='+FELHASZNALO_ID,
          'szerz_id='+SZE_ID,
          'szt_id='+vdc_tipus.Eredmeny,
          'kapcs_szamla_id='+k,
          'fm_id='+vdc_mod1.Eredmeny,
          'penz_id='+vdc_penznem1.Eredmeny,
          'berlo_id='+BERLO_ID,
          'szamla_kelte='+SzerverDat(1),
          'szamla_ev='+le_ev.Text,
          'szamla_ho='+le_ho.Text,
          'szamla_teljesites='+StrDate(me_teljesites.Text),
          'szamla_hatarido='+StrDate(me_hatarido.Text)
         ]);
        bb_szerztetel.Enabled:=True;
        bb_szerzodes.Enabled:=True;
      end;
      //Változás kezelés
      if s=3 then
      begin

      end;
    end;
  1:
    begin
    end;
  end;
end;

procedure Tf_SzamlaAdat.bb_szerzodesClick(Sender: TObject);
begin
  try
    bb_felveszClick(Self);
  except
    Uzenet('Hiányos adatfelvitel! A számla fejléce nem rögzíthetõ!');
    Exit;
  end;
  //Szerzõdés díjtétel alapján számlatétel elõállítás
  LISTA.SQL.Text:=
    'Select a.* From szerzodes_dij a Where a.szerz_id='+SZE_ID+' '+
    'and a.szd_szamla_kezd < getdate() and getdate() between a.szd_mettol and a.szd_meddig';
  LISTA.Active:=True;
  LISTA.First;
  while not LISTA.Eof do
  begin
    Beszuras('szamla_tetel',[
      'szamla_id='+SZAMLA_ID,
      'me_id='+LISTA.FieldByName('me_id').AsString,
      'afa_id='+LISTA.FieldByName('afa_id').AsString,
      'szd_id='+LISTA.FieldByName('szd_id').AsString,
      'szamlat_ev='+SzerverEv,
      'szamlat_ho='+SzerverHo,
      'szamlat_menny='+LISTA.FieldByName('szd_menny').AsString,
      'szamlat_ea='+LISTA.FieldByName('szd_egysegar').AsString,
      'szamlat_netto='+LISTA.FieldByName('szd_netto').AsString,
      'szamlat_afa='+LISTA.FieldByName('szd_afa').AsString,
      'szamlat_brutto='+LISTA.FieldByName('szd_brutto').AsString
      ]);
    LISTA.Next;
  end;
  LISTA.SQL.Text:='Select sum(szamlat_brutto) as ossz From szamla_tetel Where szamla_id='+SZAMLA_ID;
  LISTA.Active:=True;
  Modositas('szamla',['szamla_osszdij='+LISTA.FieldByName('ossz').AsString],'szamla_id='+SZAMLA_ID);
  SZURES.Active:=False;
  SZURES.Parameters.ParamByName('szamla_id').Value:=SZAMLA_ID;
  SZURES.Active:=True;
end;

procedure Tf_SzamlaAdat.bb_kilepClick(Sender: TObject);
begin
  inherited;
  GridAllapotMentes(dbg_szerzodes);
  GridAllapotMentes(dbg_lista);
  GridAllapotMentes(dbg_csoport);
end;

procedure Tf_SzamlaAdat.bb_nyomtatClick(Sender: TObject);
var nev: String;
begin
  inherited;
  p_keres.Visible:=True;
  Application.ProcessMessages;
  Doksi.InFile:=GetCurrentDir+'\'+'szamlakep.rtf';
  case pc_szamla.ActivePageIndex of
    0:
    begin
      nev:=MEGOSZTAS+'szl_'+StringReplace(SZURES.FieldByName('szamlaszama').AsString,'/','-',[rfReplaceAll])+'.doc';
      Doksi.OutFile:=nev;
      Doksi.ClearVars;
      LISTA.Active:=False;
      LISTA.SQL.Text:=
        'Select a.szervezet_nev, a.adoszam, a.bankszamlaszam, '+
        '	(Select z.cim_id From eleres x, szervezet_eleres y, cim z '+
        ' 	Where x.eleres_tipus_id=12 and x.eleres_id=y.eleres_id and x.cim_id=z.cim_id and y.szervezet_id=a.szervezet_id) as cim '+
        'From szervezet a Where a.szervezet_id=1';
      LISTA.Active:=True;
      Doksi.CreateVar('elado', LISTA.FieldByName('szervezet_nev').AsString);
      Doksi.CreateVar('eladocim', LISTA.FieldByName('cim').AsString);
      Doksi.CreateVar('eladoszamla', LISTA.FieldByName('bankszamlaszam').AsString);
      Doksi.CreateVar('eladoado', LISTA.FieldByName('adoszam').AsString);
      Doksi.CreateVar('megbizo','Budapest Terézvárosi Önkormányzat' );
      Doksi.CreateVar('ossznetto',SZAMLATETEL.FieldByName('ossznetto').AsString );
      Doksi.CreateVar('osszafa',SZAMLATETEL.FieldByName('osszafa').AsString );
      Doksi.CreateVar('osszbrutto',SZAMLATETEL.FieldByName('osszbrutto').AsString );
      Doksi.Execute([SZURES,SZAMLATETEL,AFAOSSZ]);
      Doc2Pdf(nev,MEGOSZTAS + 'szl_'+StringReplace(SZURES.FieldByName('szamlaszama').AsString,'/','-',[rfReplaceAll])+'.pdf');
      Application.ProcessMessages;
    end;
    1:
    begin
      CSOPORT.First;
      while not CSOPORT.eof do
      begin
        nev:='szl_'+StringReplace(CSOPORT.FieldByName('szamlaszama').AsString, '/','-',[rfReplaceAll])+'.doc';
        Doksi.OutFile:=nev;
        Doksi.ClearVars;
        Doksi.Execute([CSOPORT]);
        Application.ProcessMessages;
        CSOPORT.Next;
      end;
    end;
  end;
  p_keres.Visible:=False;
  Application.ProcessMessages;
  Uzenet('A számlák elkészültek!');
end;

procedure Tf_SzamlaAdat.bb_szemelyClick(Sender: TObject);
begin
  BERLO_ID:='';
  AblakNyit(Tf_BerloKeres, TForm(f_BerloKeres));
end;

procedure Tf_SzamlaAdat.bb_szervClick(Sender: TObject);
begin
  BERLO_ID:='';
  AblakNyit(Tf_BerloKeres, TForm(f_BerloKeres));
end;

procedure Tf_SzamlaAdat.bb_szerztetelClick(Sender: TObject);
begin
  inherited;
  vdc_me.Ertek('1');
  vdc_afa.Ertek('1');
  le_menny.SetFocus;
  AblakNyit(Tf_SzamlaTetelAdat, TForm(f_SzamlaTetelAdat));
  if SZERZT_ID<>'' then
     bb_szerzttorl.Enabled:=True;
end;

procedure Tf_SzamlaAdat.bb_ujClick(Sender: TObject);
begin
  inherited;
  case pc_szamla.ActivePageIndex of
  0:
  begin
    le_berlo.SetFocus;
    le_ev.Text:=SzerverEv;
    le_ho.Text:=SzerverHo;
    vdc_tipus.Ertek('1');
    vdc_penznem1.Ertek('2');
    szerzodes.Active:=False;
  end;
  1:
  begin
    le_csopev.Text:=SzerverEv;
    le_csopho.Text:=SzerverHo;
    vdc_penznem2.Ertek('2');
    rg_tipus.SetFocus;
  end;
  end;

end;

procedure Tf_SzamlaAdat.bb_eloClick(Sender: TObject);
var dat1 : TDateTime;
begin
  inherited;
  //Feltételek létezésének vizsgálata

  case rg_tipus.ItemIndex of
  0:
    begin
      dat1:=EncodeDate(StrToInt(le_csopev.Text),StrToInt(le_csopho.Text),1);
      //Élõ szerzõdések
      SZURES.SQL.Text:=
        'Select a.szerz_id, a.berlo_id From szerzodes a, szerzodes_dij b '+
        'Where a.szv_id=2 and a.szerz_id=b.szerz_id and '+
        'a.szerz_id not in (Select x.szerz_id From szamla x Where x.szamla_ev='+
        le_csopev.Text+' and x.szamla_ho='+le_csopho.Text+') and '+
        'getdate() between a.szerz_birtok and a.szerz_meddig';
      SZURES.Active:=True;
      while not SZURES.Eof do
      begin
        //Számlafej elõállítása
        SZAMLA_ID:=Beszuras('szamla',[
          'felh_id='+FELHASZNALO_ID,
          'szerz_id='+SZURES.FieldByName('szerz_id').AsString,
          'szt_id=1',
          'szamla_ev='+le_csopev.Text,
          'szamla_ho='+le_csopho.Text,
          'fm_id='+vdc_mod2.Eredmeny,
          'penz_id='+vdc_penznem2.Eredmeny,
          'berlo_id='+SZURES.FieldByName('berlo_id').AsString,
          'szamla_kelte='+SzerverDat(1),
          'szamla_teljesites='+StrDate(DateToStr(HonapVeg(dat1))),
          'szamla_hatarido='+StrDate(DateToStr(HonapVeg(dat1)))
        ]);
        //Szerzõdéstételek alapján a számla tételek feltöltése
        LISTA.SQL.Text:=
          'Select * From szerzodes_dij Where szerz_id='+SZURES.FieldByName('szerz_id').AsString;
        LISTA.Active:=True;
        while not LISTA.EOF do
        begin
          Beszuras('szamla_tetel',[
            'szamla_id='+SZAMLA_ID,
            'me_id='+LISTA.FieldByName('me_id').AsString,
            'afa_id='+LISTA.FieldByName('afa_id').AsString,
            'szd_id='+LISTA.FieldByName('szd_id').AsString,
            'szamlat_menny='+LISTA.FieldByName('szd_menny').AsString,
            'szamlat_ea='+LISTA.FieldByName('szd_egysegar').AsString,
            'szamlat_netto='+LISTA.FieldByName('szd_netto').AsString,
            'szamlat_afa='+LISTA.FieldByName('szd_afa').AsString,
            'szamlat_brutto='+LISTA.FieldByName('szd_brutto').AsString
          ]);
          LISTA.Next;
        end;
        SZURES.Next;
      end;
      CSOPORT.Active:=False;
      CSOPORT.Parameters.ParamByName('ev').Value:=le_csopev.Text;
      CSOPORT.Parameters.ParamByName('ho').Value:=le_csopho.Text;
      CSOPORT.Active:=True;
    end;
  1:
    begin

    end;
  2:
    begin

    end;
  end;
end;

procedure Tf_SzamlaAdat.dbg_csoportKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If Key = vk_F12 Then
    GridMezok(dbg_csoport);
end;

procedure Tf_SzamlaAdat.dbg_csoportTitleClick(Column: TColumn);
begin
  inherited;
  dbg_TitleClick(dbg_csoport, Column);
end;

procedure Tf_SzamlaAdat.dbg_listaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If Key = vk_F12 Then
    GridMezok(dbg_lista);
end;

procedure Tf_SzamlaAdat.dbg_listaTitleClick(Column: TColumn);
begin
  inherited;
  dbg_TitleClick(dbg_lista, Column);
end;

procedure Tf_SzamlaAdat.dbg_szerzodesDblClick(Sender: TObject);
begin
  inherited;
  HIVO := 2;
  AblakNyit(Tf_SzerzodesAdat, TForm(f_SzerzodesAdat));
end;

procedure Tf_SzamlaAdat.dbg_szerzodesKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If Key = vk_F12 Then
    GridMezok(dbg_szerzodes);
end;

procedure Tf_SzamlaAdat.dbg_szerzodesTitleClick(Column: TColumn);
begin
  inherited;
  dbg_TitleClick(dbg_szerzodes, Column);
end;

procedure Tf_SzamlaAdat.FormActivate(Sender: TObject);
begin
  inherited;
  le_berlo.Text:=BERLO;
  me_teljesites.SetFocus;
  if BERLO_ID<>'' then
  begin
    SZERZODES.SQL.Text:=
      'Select a.szerz_id, a.szerszam, a.fm_id, a.berlo_id, '+
      '(Select TOP 1 x.cim_sor_1 From cim x, iktato_cim y Where x.cim_id=y.cim_id and y.iktato_id=a.iktato_id) as cim, '+
      '(Select sum(x.szd_netto) From szerzodes_dij x Where x.szerz_id=a.szerz_id) as netto, '+
      '(Select sum(x.szd_afa) From szerzodes_dij x Where x.szerz_id=a.szerz_id) as afa, '+
      '(Select sum(x.szd_brutto) From szerzodes_dij x Where x.szerz_id=a.szerz_id) as brutto '+
      'From szerzodes a Where a.berlo_id='+BERLO_ID+' '+
      'and a.sza_id=2 '+ //aktív állapotú szerzõdések
      'and a.szt_id=5 '+ //bérleti szerzõdés típus
      'and a.sztargy_id=65 '+ //bérleti szerzõdés típus
      'and a.szerz_meddig > getdate()';
    SZERZODES.Active:=True;
    if SZERZODES.RecordCount>0 then
    begin
      bb_szerzodes.Enabled:=True;
      if BB_BILL=1then
      begin
        vdc_mod1.Ertek(SZERZODES.FieldByName('fm_id').AsString);
      end;
    end;
  end;
end;

procedure Tf_SzamlaAdat.FormShow(Sender: TObject);
begin
  inherited;
  vdc_tipus.Feltolt;
  vdc_mod1.Feltolt;
  vdc_szamla.Feltolt;
  vdc_mod2.Feltolt;
  vdc_penznem1.Feltolt;
  vdc_penznem2.Feltolt;
  vdc_me.Feltolt;
  vdc_afa.Feltolt;
  GridAllapotToltes(dbg_szerzodes);
  GridAllapotToltes(dbg_lista);
  GridAllapotToltes(dbg_csoport);
  pc_szamla.ActivePageIndex:=0;
  if HIVO=1 then
    bb_ujClick(Self);
  if HIVO<>1 then
  begin
    SZURES.Active:=False;
    SZURES.SQL.Text:=
      'Select a.*, '+
      '(Select x.fm_nev From fizetesi_mod x Where x.fm_id=a.fm_id) as fizmod, '+
      '(Select x.penz_rovid From penznem x Where x.penz_id=a.penz_id) as penznem, '+
      ' (Case When d.szervezet_id is null '+
      '  Then (Select x.szemely_teljes_neve From szemely x Where x.szemely_id=d.szemely_id) '+
      '  Else (Select x.szervezet_nev From szervezet x Where x.szervezet_id=d.szervezet_id) '+
      '  End) as fizeto, '+
      ' (Case When d.szervezet_id is null '+
      '  Then (Select x.ado_szam From szemely x Where x.szemely_id=d.szemely_id) '+
      '  Else (Select x.adoszam From szervezet x Where x.szervezet_id=d.szervezet_id) '+
      '  End) as fizetoado, '+
      ' (Case When d.szervezet_id is null '+
      '  Then (Select x.szemely_teljes_neve From szemely x Where x.szemely_id=d.szemely_id) '+
      '  Else (Select x.szervezet_nev From szervezet x Where x.szervezet_id=d.szervezet_id) '+
      '  End) as berlo, '+ //ide még a bérlõtárs ia
      ' (Case When d.szervezet_id is null '+
      '  Then (Select TOP 1 x.eleres_nev From eleres x, szemely_eleres y Where y.szemely_id=d.szemely_id and x.eleres_id=y.eleres_id and x.eleres_tipus_id=8) '+
      '  Else (Select TOP 1 x.eleres_nev From eleres x, szervezet_eleres y Where y.szervezet_id=d.szervezet_id and x.eleres_id=y.eleres_id and x.eleres_tipus_id=8) End) as fizetocim, '+
      ' (Case When b.szervezet_id is null '+
      '  Then (Select TOP 1 z.iranyitoszam From eleres x, szemely_eleres y, cim z Where x.cim_id=z.cim_id and y.szemely_id=d.szemely_id and x.eleres_id=y.eleres_id and x.eleres_tipus_id=8) '+
      '  Else (Select TOP 1 z.iranyitoszam From eleres x, szervezet_eleres y, cim z Where x.cim_id=z.cim_id and y.szervezet_id=d.szervezet_id and x.eleres_id=y.eleres_id and x.eleres_tipus_id=8) End) as vevo_ir, '+
      ' (Case When b.szervezet_id is null '+
      '  Then (Select TOP 1 v.telepules_nev From eleres x, szemely_eleres y, cim z, telepules v Where x.cim_id=z.cim_id and v.telepules_id=z.telepules_id and y.szemely_id=d.szemely_id and x.eleres_id=y.eleres_id and x.eleres_tipus_id=8) '+
      ' Else (Select TOP 1 v.telepules_nev From eleres x, szervezet_eleres y, cim z, telepules v Where x.cim_id=z.cim_id and v.telepules_id=z.telepules_id and y.szervezet_id=d.szervezet_id and x.eleres_id=y.eleres_id and x.eleres_tipus_id=8) End) as vevo_varos, '+
      ' (Case When b.szervezet_id is null '+
      '  Then (Select TOP 1 z.cim_sor_1 From eleres x, szemely_eleres y, cim z Where x.cim_id=z.cim_id and y.szemely_id=d.szemely_id and x.eleres_id=y.eleres_id and x.eleres_tipus_id=8) '+
      '  Else (Select TOP 1.z.cim_sor_1 From eleres x, szervezet_eleres y, cim z Where x.cim_id=z.cim_id and y.szervezet_id=d.szervezet_id and x.eleres_id=y.eleres_id and x.eleres_tipus_id=8) End) as vevo_cim, '+
      ' (Case When c.lakas_id>0 ' +
      '  Then  (Select x.cim_sor_1 From cim x, l_lakas y Where x.hrsz_id=y.hrsz_id and y.lakas_id=c.lakas_id) ' +
      '  Else (Case When c.nem_lakas_id>0 ' +
      '        Then (Select x.cim_sor_1 From cim x, b_nem_lakas y Where x.hrsz_id=y.hrsz_id and y.nem_lakas_id=c.nem_lakas_id) ' +
      '        Else (Select x.cim_sor_1 From cim x, berlemeny y Where x.hrsz_id=y.hrsz_id and y.berl_id=c.berl_id) ' +
      '        End)  End) as berlemeny, ' +
      ' (Case When c.lakas_id>0 ' +
      '  Then  (Select x.szecs_azo From cim x, l_lakas y Where x.hrsz_id=y.hrsz_id and y.lakas_id=c.lakas_id) ' +
      '  Else (Case When c.nem_lakas_id>0 ' +
      '        Then (Select x.szecs_azo From cim x, b_nem_lakas y Where x.hrsz_id=y.hrsz_id and y.nem_lakas_id=c.nem_lakas_id) ' +
      '        Else (Select x.szecs_azo From cim x, berlemeny y Where x.hrsz_id=y.hrsz_id and y.berl_id=c.berl_id) ' +
      '        End)  End) as berlemeny_kod ' +
      'From szamla a, szerzodes b, szerzodes_kapocs c, berlok d ' +
      'Where a.szamla_id='+SZAMLA_ID+' and a.szerz_id=b.szerz_id and b.szerz_id=c.szerz_id and a.berlo_id=d.berlo_id';
    SZURES.Active:=True;
  end;
  if HIVO=2 then
    bb_modositClick(Self);
end;

procedure Tf_SzamlaAdat.pc_szamlaChange(Sender: TObject);
begin
  inherited;
  case pc_szamla.ActivePageIndex of
    0:
      begin

      end;
    1:
      begin
        le_csopev.Enabled:=True;
        le_csopho.Enabled:=True;
        vdc_mod2.Enabled:=True;
        vdc_penznem2.Enabled:=True;
        if le_csopev.Text='' then
        begin
          le_csopev.Text:=SzerverEv;
          le_csopho.Text:=SzerverHo;
        end;
        CSOPORT.Active:=False;
        CSOPORT.SQL.Text:=
          'Select a.szamla_id, a.szamlaszama, '+
          ' (Case When d.szervezet_id is null '+
          '  Then (Select x.szemely_teljes_neve From szemely x Where x.szemely_id=d.szemely_id) '+
          '  Else (Select x.szervezet_nev From szervezet x Where x.szervezet_id=d.szervezet_id) '+
          '  End) as berlo, '+
          ' (Case When d.szervezet_id is null '+
          '  Then (Select TOP 1 x.eleres_nev From eleres x, szemely_eleres y Where y.szemely_id=d.szemely_id and x.eleres_id=y.eleres_id and x.eleres_tipus_id=8) '+
          '  Else (Select TOP 1 x.eleres_nev From eleres x, szervezet_eleres y Where y.szervezet_id=d.szervezet_id and x.eleres_id=y.eleres_id and x.eleres_tipus_id=8) End) as fizetocim, '+
          ' (Case When b.szervezet_id is null '+
          '  Then (Select TOP 1 z.iranyitoszam From eleres x, szemely_eleres y, cim z Where x.cim_id=z.cim_id and y.szemely_id=d.szemely_id and x.eleres_id=y.eleres_id and x.eleres_tipus_id=8) '+
          '  Else (Select TOP 1 z.iranyitoszam From eleres x, szervezet_eleres y, cim z Where x.cim_id=z.cim_id and y.szervezet_id=d.szervezet_id and x.eleres_id=y.eleres_id and x.eleres_tipus_id=8) End) as vevo_ir, '+
          ' (Case When b.szervezet_id is null '+
          '  Then (Select TOP 1 v.telepules_nev From eleres x, szemely_eleres y, cim z, telepules v Where x.cim_id=z.cim_id and v.telepules_id=z.telepules_id and y.szemely_id=d.szemely_id and x.eleres_id=y.eleres_id and x.eleres_tipus_id=8) '+
          ' Else (Select TOP 1 v.telepules_nev From eleres x, szervezet_eleres y, cim z, telepules v Where x.cim_id=z.cim_id and v.telepules_id=z.telepules_id and y.szervezet_id=d.szervezet_id and x.eleres_id=y.eleres_id and x.eleres_tipus_id=8) End) as vevo_varos, '+
          ' (Case When b.szervezet_id is null '+
          '  Then (Select TOP 1 z.cim_sor_1 From eleres x, szemely_eleres y, cim z Where x.cim_id=z.cim_id and y.szemely_id=d.szemely_id and x.eleres_id=y.eleres_id and x.eleres_tipus_id=8) '+
          '  Else (Select TOP 1.z.cim_sor_1 From eleres x, szervezet_eleres y, cim z Where x.cim_id=z.cim_id and y.szervezet_id=d.szervezet_id and x.eleres_id=y.eleres_id and x.eleres_tipus_id=8) End) as vevo_cim, '+
          ' (Case When c.lakas_id>0 ' +
          '  Then  (Select x.cim_sor_1 From cim x, l_lakas y Where x.hrsz_id=y.hrsz_id and y.lakas_id=c.lakas_id) ' +
          '  Else (Case When c.nem_lakas_id>0 ' +
          '        Then (Select x.cim_sor_1 From cim x, b_nem_lakas y Where x.hrsz_id=y.hrsz_id and y.nem_lakas_id=c.nem_lakas_id) ' +
          '        Else (Select x.cim_sor_1 From cim x, berlemeny y Where x.hrsz_id=y.hrsz_id and y.berl_id=c.berl_id) ' +
          '        End)  End) as berlemeny ' +
          'From szamla a, szerzodes b, szerzodes_kapocs c, berlok d ' +
          'Where a.szamla_rendezve is null and a.szamla_nyomtatva is null and ' +
          'a.szerz_id=b.szerz_id and b.szerz_id=c.szerz_id and a.berlo_id=d.berlo_id and ' +
          'a.szamla_ev='+le_csopev.Text+' and a.szamla_ho='+le_csopho.Text+' ';
        case rg_tipus.ItemIndex of
        0: CSOPORT.SQL.Add(' and c.lakas_id is not null ');
        1: CSOPORT.SQL.Add(' and c.nem_lakas_id is not null ');
        2: CSOPORT.SQL.Add(' and c.berl_id is not null ');
        end;
        if vdc_mod2.ItemIndex<>-1 then
           CSOPORT.SQL.Add('and b.fm_id='+vdc_mod2.Eredmeny+' ');
        if vdc_penznem2.ItemIndex<>-1 then
           CSOPORT.SQL.Add('and a.penz_id='+vdc_penznem2.Eredmeny+' ');
        CSOPORT.Active:=True;
      end;
  end;
end;

procedure Tf_SzamlaAdat.rg_tipusClick(Sender: TObject);
begin
  inherited;
  pc_szamlaChange(Self);
end;

procedure Tf_SzamlaAdat.SZAMLATETELAfterScroll(DataSet: TDataSet);
begin
  inherited;
  SZAMLAT_ID:=SZAMLATETEL.FieldByName('szamlat_id').AsString;
  e_nev.Text:=SZAMLATETEL.FieldByName('nev').AsString;
  le_menny.Text:=SZAMLATETEL.FieldByName('szamlat_menny').AsString;
  vdc_me.Ertek(SZAMLATETEL.FieldByName('me_id').AsString);
  le_egyseg.Text:=SZAMLATETEL.FieldByName('szamlat_ea').AsString;
  le_netto.Text:=SZAMLATETEL.FieldByName('szamlat_netto').AsString;
  vdc_afa.Ertek(SZAMLATETEL.FieldByName('afa_id').AsString);
  le_afa.Text:=SZAMLATETEL.FieldByName('szamlat_afa').AsString;
  le_brutto.Text:=SZAMLATETEL.FieldByName('szamlat_brutto').AsString;
end;

procedure Tf_SzamlaAdat.SZERZODESAfterScroll(DataSet: TDataSet);
begin
  inherited;
  SZE_ID:=SZERZODES.FieldByName('szerz_id').AsString;
  BERLO_ID:=SZERZODES.FieldByName('berlo_id').AsString;
end;

procedure Tf_SzamlaAdat.SZURESAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if pc_szamla.ActivePageIndex=0 then
  begin
    l_szamlaszam.Caption:=SZURES.FieldByName('szamlaszama').AsString;
    le_berlo.Text:=SZURES.FieldByName('berlo').AsString;
    BERLO:=SZURES.FieldByName('berlo').AsString;
    me_teljesites.Text:=SZURES.FieldByName('szamla_teljesites').AsString;
    me_hatarido.Text:=SZURES.FieldByName('szamla_hatarido').AsString;
    vdc_mod1.Ertek(SZURES.FieldByName('fm_id').AsString);
    vdc_tipus.Ertek(SZURES.FieldByName('szt_id').AsString);
    vdc_penznem1.Ertek(SZURES.FieldByName('penz_id').AsString);
    vdc_szamla.Ertek(SZURES.FieldByName('szamla_id').AsString);
    le_ev.Text:=SZURES.FieldByName('szamla_ev').AsString;
    le_ho.Text:=SZURES.FieldByName('szamla_ho').AsString;
    l_osszbrutto.Caption:=Helyiertek(SZURES.FieldByName('szamla_osszdij').AsFloat);
    SZAMLATETEL.Active:=False;
    SZAMLATETEL.SQL.Text:=
      'Select a.*, '+
      '(Select x.szdt_nev From szerzodes_dijtipus x, szerzodes_dij y Where x.szdt_id=y.szdt_id and y.szd_id=a.szd_id) as nev, '+
      '(Select x.afa_szazalek From afa x Where x.afa_id=a.afa_id) as afa1, '+
      '(Select cast(x.szamla_ev as varchar(4))+'+IDCHAR+'.'+IDCHAR+'+cast(x.szamla_ho as varchar(2)) From szamla x Where x.szamla_id=a.szamla_id) as ido, '+
      '(Select x.me_nev From me x Where x.me_id=a.me_id) as me, '+
      '(Select sum(x.szamlat_netto) From szamla_tetel x Where x.szamla_id=a.szamla_id) as ossznetto, '+
      '(Select sum(x.szamlat_afa) From szamla_tetel x Where x.szamla_id=a.szamla_id) as osszafa, '+
      '(Select sum(x.szamlat_brutto) From szamla_tetel x Where x.szamla_id=a.szamla_id) as osszbrutto, '+
      '(Select x.szdt_szj From szerzodes_dijtipus x, szerzodes_dij y Where x.szdt_id=y.szdt_id and y.szd_id=a.szd_id) as szj '+
      'From szamla_tetel a Where a.szamla_id='+SZAMLA_ID;
    SZAMLATETEL.Active:=True;
    (SZAMLATETEL.FieldByName('szamlat_netto') as TNumericField).DisplayFormat:='### ### ### ###';
    (SZAMLATETEL.FieldByName('szamlat_afa') as TNumericField).DisplayFormat:='### ### ### ###';
    (SZAMLATETEL.FieldByName('szamlat_brutto') as TNumericField).DisplayFormat:='### ### ### ###';
    AFAOSSZ.Active:=False;
    AFAOSSZ.SQL.Text:=
      'Select (Select x.afa_szazalek From afa x Where x.afa_id=a.afa_id) as afanev, '+
      'sum(a.szamlat_afa) as osszafa, '+
      'sum(a.szamlat_brutto) as osszbrutto '+
      'From szamla_tetel a Where a.szamla_id='+SZAMLA_ID+' Group by a.afa_id';
    AFAOSSZ.Active:=True;
    SZERZODES.SQL.Text:=
      'Select a.szerz_id, a.szerszam, a.fm_id, a.berlo_id, '+
      '(Select TOP 1 x.cim_sor_1 From cim x, iktato_cim y Where x.cim_id=y.cim_id and y.iktato_id=a.iktato_id) as cim, '+
      '(Select sum(x.szd_netto) From szerzodes_dij x Where x.szerz_id=a.szerz_id) as netto, '+
      '(Select sum(x.szd_afa) From szerzodes_dij x Where x.szerz_id=a.szerz_id) as afa, '+
      '(Select sum(x.szd_brutto) From szerzodes_dij x Where x.szerz_id=a.szerz_id) as brutto '+
      'From szerzodes a Where a.berlo_id='+BERLO_ID+' '+
      'and a.sza_id=2 '+ //aktív állapotú szerzõdések
      'and a.szt_id=5 '+ //bérleti szerzõdés típus
      'and a.sztargy_id=65 '+ //bérleti szerzõdés típus
      'and a.szerz_meddig > getdate()';
    SZERZODES.Active:=True;
    bb_szerzodes.Enabled:=False;
  end;
end;

end.
