unit f_BerlemenyAdat_Unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, AlapFuggveny, Alap, f_GridMezok_Unit,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AlapAblak_unit, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.ComCtrls, Data.DB, Data.Win.ADODB, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids, Vcl.Imaging.pngimage, VDComboBox;

type
  Tf_BerlemenyAdat = class(TAlapAblak)
    pc_berlemeny: TPageControl;
    TabSheet1: TTabSheet;
    le_hrsz: TLabeledEdit;
    le_cim: TLabeledEdit;
    le_terulet: TLabeledEdit;
    le_hasznos: TLabeledEdit;
    le_kobmeter: TLabeledEdit;
    le_lakok: TLabeledEdit;
    le_tulhany: TLabeledEdit;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Panel2: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    bb_pdf: TBitBtn;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    dbg_berlo: TDBGrid;
    Panel3: TPanel;
    le_berlo: TLabeledEdit;
    Image1: TImage;
    Panel4: TPanel;
    Image2: TImage;
    le_szamla: TLabeledEdit;
    Panel5: TPanel;
    Image3: TImage;
    le_szerzodes: TLabeledEdit;
    vdc_komfort: TVDComboBox;
    vdc_komfort2: TVDComboBox;
    szerzodes: TADOQuery;
    szerzodesDS: TDataSource;
    le_szoba: TLabeledEdit;
    vdc_statusz: TVDComboBox;
    Label11: TLabel;
    dbg_szerzodes: TDBGrid;
    dbg_szamla: TDBGrid;
    e_szerszam: TEdit;
    e_jogcim: TEdit;
    e_datum: TEdit;
    e_dijszamitas: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Label12: TLabel;
    e_berlo: TEdit;
    szerzdijelemDS: TDataSource;
    szerzdijelem: TADOQuery;
    dbg_lista: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure pc_berlemenyChange(Sender: TObject);
    procedure SZURESAfterScroll(DataSet: TDataSet);
    procedure le_szamlaExit(Sender: TObject);
    procedure le_berloExit(Sender: TObject);
    procedure le_szerzodesExit(Sender: TObject);
    procedure bb_kilepClick(Sender: TObject);
    procedure szerzodesAfterScroll(DataSet: TDataSet);
    procedure dbg_listaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbg_berloKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbg_szamlaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbg_szerzodesKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbg_szerzodesTitleClick(Column: TColumn);
    procedure dbg_szamlaTitleClick(Column: TColumn);
    procedure dbg_berloTitleClick(Column: TColumn);
    procedure dbg_listaTitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_BerlemenyAdat: Tf_BerlemenyAdat;

implementation

{$R *.dfm}

uses AlapAdat;

procedure Tf_BerlemenyAdat.bb_kilepClick(Sender: TObject);
begin
  inherited;
  GridAllapotMentes(dbg_lista);
  GridAllapotMentes(dbg_berlo);
  GridAllapotMentes(dbg_szamla);
  GridAllapotMentes(dbg_szerzodes);
end;

procedure Tf_BerlemenyAdat.dbg_berloKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If Key = vk_F12 Then
    GridMezok(dbg_berlo);
end;

procedure Tf_BerlemenyAdat.dbg_berloTitleClick(Column: TColumn);
begin
  inherited;
  dbg_TitleClick(dbg_szerzodes, Column);
end;

procedure Tf_BerlemenyAdat.dbg_listaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If Key = vk_F12 Then
    GridMezok(dbg_lista);
end;

procedure Tf_BerlemenyAdat.dbg_listaTitleClick(Column: TColumn);
begin
  inherited;
  dbg_TitleClick(dbg_lista, Column);
end;

procedure Tf_BerlemenyAdat.dbg_szamlaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If Key = vk_F12 Then
    GridMezok(dbg_szamla);
end;

procedure Tf_BerlemenyAdat.dbg_szamlaTitleClick(Column: TColumn);
begin
  inherited;
  dbg_TitleClick(dbg_szerzodes, Column);
end;

procedure Tf_BerlemenyAdat.dbg_szerzodesKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If Key = vk_F12 Then
    GridMezok(dbg_szerzodes);
end;

procedure Tf_BerlemenyAdat.dbg_szerzodesTitleClick(Column: TColumn);
begin
  inherited;
  dbg_TitleClick(dbg_szerzodes, Column);
end;

procedure Tf_BerlemenyAdat.FormShow(Sender: TObject);
begin
  inherited;
  GridAllapotToltes(dbg_lista);
  GridAllapotToltes(dbg_berlo);
  GridAllapotToltes(dbg_szamla);
  GridAllapotToltes(dbg_szerzodes);
  vdc_komfort.Feltolt;
  vdc_komfort2.Feltolt;
  vdc_statusz.Feltolt;
  pc_berlemeny.ActivePageIndex:=0;
  pc_berlemenyChange(Self);
end;

procedure Tf_BerlemenyAdat.le_szamlaExit(Sender: TObject);
begin
  inherited;
  SZURES.SQL.Add(
    'and a.szamla_szama like '+IDCHAR+'%'+le_szamla.Text+'%'+IDCHAR+' ');
  SZURES.Active:=True;
end;

procedure Tf_BerlemenyAdat.le_szerzodesExit(Sender: TObject);
begin
  inherited;
  SZURES.SQL.Add(
    'and a.szerszam like '+IDCHAR+'%'+le_szerzodes.Text+'%'+IDCHAR+' ');
  SZURES.Active:=True;
end;

procedure Tf_BerlemenyAdat.le_berloExit(Sender: TObject);
begin
  inherited;
  SZURES.SQL.Add(
    'and a.szemely_id in (Select x.szemely_id From szemely x Where x.szemely_teljes_nev like '+
    IDCHAR+'%'+le_berlo.Text+'%'+IDCHAR+') or a.szervezet_id in (Select x.szervezet_nev From szervezet x '+
    'Where x.szervezet_nev like '+IDCHAR+'%'+le_berlo.Text+'%'+IDCHAR+')');
  SZURES.Active:=True;
end;

procedure Tf_BerlemenyAdat.pc_berlemenyChange(Sender: TObject);
begin
  inherited;
  case pc_berlemeny.ActivePageIndex of
  0://Alapadatok
    begin
      if LAK_ID<>'' then
      begin
         SZURES.SQL.Text:=
          'SELECT a.*, '+
          '  (Select x.es_nev From ellenstatusz x Where x.es_id=a.es_id) as statusz, '+
          '  (Select x.komfort_nev From l_komfortfokozat x Where x.komfort_id=a.komfort_id) as komfort, '+
          '  (Select x.helyrajziszam From helyrajzi_szamok x Where a.hrsz_id=x.hrsz_id) as hrsz, '+
          '  (Select x.hrsz_id From helyrajzi_szamok x Where a.hrsz_id=x.hrsz_id) as hrsz_id, '+
          '  (Select x.helyrajzi_szam_foresz From helyrajzi_szamok x Where a.hrsz_id=x.hrsz_id) as foresz, '+
          '  (Select x.helyrajzi_szam_alatores From helyrajzi_szamok x Where a.hrsz_id=x.hrsz_id) as alatores, '+
          '  (Select x.cim_sor_1 From cim x Where a.hrsz_id=x.hrsz_id) as cim, '+
          '  (Select x.cim_id From cim x Where a.hrsz_id=x.hrsz_id) as cim_id '+
          'FROM l_lakas a WHERE a.lakas_id = '+LAK_ID;
        szerzodes.SQL.Text:=
          'Select a.szerz_id, a.szerszam, a.szerz_datum, '+
          ' (Select x.berlesjog_neve From berles_jogcime x Where x.berlesjog_id=a.berlesjog_id) as jogcim, '+
          ' (Select x.dsz_nev From dijszamitas x Where x.dsz_id=a.dsz_id) as dijszamitas, '+
          ' (Select x.irat_teljes_szama From iktatokonyv x Where x.iktato_id=a.iktato_id) as iktatoszam, '+
          ' (Select (Case When x.szemely_id is not null Then (Select y.szemely_teljes_neve From szemely y Where y.szemely_id=x.szemely_id) '+
          '  Else (Select y.szervezet_nev From szervezet y Where y.szervezet_id=x.szervezet_id) End) From berlok x Where x.berlo_id=a.berlo_id) as berlo '+
          'From szerzodes a, szerzodes_kapocs b '+
          'Where a.szerz_id = b.szerz_id and b.lakas_id = '+LAK_ID;
        szerzodes.Active:=True;
        if szerzodes.FieldByName('szerz_id').AsString<>'' then
        begin
          szerzdijelem.Active:=False;
          szerzdijelem.Parameters.ParamByName('sze_id').Value:=szerzodes.FieldByName('szerz_id').AsString;
          szerzdijelem.Active:=True;
        end;
      end;
      if NLAK_ID<>'' then
         SZURES.SQL.Text:=
          'SELECT a.*, '+
          '  (Select x.es_nev From ellenstatusz x Where x.es_id=a.es_id) as statusz, '+
          '  (Select x.helyrajziszam From helyrajzi_szamok x Where a.hrsz_id=x.hrsz_id) as hrsz, '+
          '  (Select x.hrsz_id From helyrajzi_szamok x Where a.hrsz_id=x.hrsz_id) as hrsz_id, '+
          '  (Select x.helyrajzi_szam_foresz From helyrajzi_szamok x Where a.hrsz_id=x.hrsz_id) as foresz, '+
          '  (Select x.helyrajzi_szam_alatores From helyrajzi_szamok x Where a.hrsz_id=x.hrsz_id) as alatores, '+
          '  (Select x.cim_sor_1 From cim x Where a.hrsz_id=x.hrsz_id) as cim, '+
          '  (Select x.cim_id From cim x Where a.hrsz_id=x.hrsz_id) as cim_id '+
          'FROM b_nem_lakas a WHERE a.nem_lakas_id = '+NLAK_ID;
      if BERL_ID<>'' then
         SZURES.SQL.Text:=
          'SELECT a.*, '+
          '  (Select x.es_nev From ellenstatusz x Where x.es_id=a.es_id) as statusz, '+
          '  (Select x.helyrajziszam From helyrajzi_szamok x Where a.hrsz_id=x.hrsz_id) as hrsz, '+
          '  (Select x.hrsz_id From helyrajzi_szamok x Where a.hrsz_id=x.hrsz_id) as hrsz_id, '+
          '  (Select x.helyrajzi_szam_foresz From helyrajzi_szamok x Where a.hrsz_id=x.hrsz_id) as foresz, '+
          '  (Select x.helyrajzi_szam_alatores From helyrajzi_szamok x Where a.hrsz_id=x.hrsz_id) as alatores, '+
          '  (Select x.cim_sor_1 From cim x Where a.hrsz_id=x.hrsz_id) as cim, '+
          '  (Select x.cim_id From cim x Where a.hrsz_id=x.hrsz_id) as cim_id '+
          'FROM berlemeny a WHERE a.berl_id = '+BERL_ID;

    end;
  1://Bérlõk
    begin
      le_berlo.ReadOnly:=False;
      if LAK_ID<>'' then
         SZURES.SQL.Text:=
          'Select a.*, b.berles_kezdet_datuma, b.berles_vege_datuma, '+
          '  (Select x.szemely_teljes_neve From szemely x Where x.szemely_id=a.szemely_id) as szemely, '+
          '  (Select x.anyja_neve From szemely x Where x.szemely_id=a.szemely_id) as anyja, '+
          '  (Select x.jurta_kod From szemely x Where x.szemely_id=a.szemely_id) as kod, '+
          '  (Select x.szuletesi_datum From szemely x Where x.szemely_id=a.szemely_id) as szdat '+
          'From berlok a, berlo_kapcsolat b '+
          'Where a.berlo_id=b.berlo_id and b.lakas_id='+LAK_ID+' ';
    end;
  2://Számlák
  begin
    le_szamla.ReadOnly:=False;
    SZURES.SQL.Text:=
      'Select a.*, '+
      '(Select (Case When x.szemely_id is not null Then (Select y.szemely_teljes_neve From szemely y Where y.szemely_id=x.szemely_id) ' +
      'Else (Select y.szervezet_nev From szervezet y Where y.szervezet_id=x.szervezet_id) End) From berlok x Where x.berlo_id=a.berlo_id) as berlo, '+
      '(Select x.fm_nev From fizetesi_mod x Where x.fm_id=a.fm_id) as fizmod, '+
      '(Select x.szt_nev From szamla_tipus x Where x.szt_id=a.szt_id) as tipus, '+
      '(Select x.befiz_brutto From befizetes x, befizetes_kapocs y, szamla_tetel z Where z.szamla_id=a.szamla_id and x.befiz_id=y.befiz_id and y.szamlat_id=z.szamlat_id) as befizetes '+
      'From szamla a, szerzodes b, szerzodes_kapocs c '+
      'Where a.szerz_id=b.szerz_id and b.szerz_id=c.szerz_id ';
    if LAK_ID<>'' then
       SZURES.SQL.Add('and c.lakas_id='+LAK_ID);
    if NLAK_ID<>'' then
       SZURES.SQL.Add('and c.nem_lakas_id='+NLAK_ID);
    if BERL_ID<>'' then
       SZURES.SQL.Add('and c.berl_id='+BERL_ID);
  end;
  3://Szerzõdések
  begin
    le_szerzodes.ReadOnly:=False;
    SZURES.SQL.Text:=
      'Select a.*, '+
      '(Select x.szt_nev From szerzodes_tipus x Where x.szt_id=a.szt_id) as tipus, '+
      '(Select x.szv_nev From szerzodes_vonatkozas x Where x.szv_id=a.szv_id) as vonatkozas, '+
      '(Select (Case When x.szemely_id is not null Then (Select y.szemely_teljes_neve From szemely y Where y.szemely_id=x.szemely_id) ' +
      'Else (Select y.szervezet_nev From szervezet y Where y.szervezet_id=x.szervezet_id) End) From berlok x Where x.berlo_id=a.berlo_id) as berlo, '+
      '(Select x.berlesjog_neve From berles_jogcime x Where x.berlesjog_id=a.berlesjog_id) as jogcim '+
      'From szerzodes a, szerzodes_kapocs b Where a.szerz_id = b.szerz_id ';
    if LAK_ID<>'' then
       SZURES.SQL.Add('and b.lakas_id='+LAK_ID);
    if NLAK_ID<>'' then
       SZURES.SQL.Add('and b.nem_lakas_id='+NLAK_ID);
    if BERL_ID<>'' then
       SZURES.SQL.Add('and b.berl_id='+BERL_ID);
  end;
  end;
  SZURES.Active:=True;
end;

procedure Tf_BerlemenyAdat.szerzodesAfterScroll(DataSet: TDataSet);
begin
  inherited;
  e_szerszam.Text:=szerzodes.FieldByName('szerszam').AsString;
  e_jogcim.Text:=szerzodes.FieldByName('jogcim').AsString;
  e_dijszamitas.Text:=szerzodes.FieldByName('dijszamitas').AsString;
  e_datum.Text:=szerzodes.FieldByName('szerz_datum').AsString;
  e_berlo.Text:=szerzodes.FieldByName('berlo').AsString;
end;

procedure Tf_BerlemenyAdat.SZURESAfterScroll(DataSet: TDataSet);
begin
  inherited;
  case pc_berlemeny.ActivePageIndex of
  0:
    begin
      if LAK_ID<>'' then
      begin
        le_hrsz.Text:=SZURES.FieldByName('hrsz').AsString;
        le_cim.Text:=SZURES.FieldByName('cim').AsString;
        vdc_komfort.Ertek(SZURES.FieldByName('komfort_id').AsString);
        vdc_statusz.Ertek(SZURES.FieldByName('es_id').AsString);
        le_terulet.Text:=SZURES.FieldByName('lakas_osszes_terulete').AsString;
        le_hasznos.Text:=SZURES.FieldByName('lakas_hasznos_terulete').AsString;
        le_tulhany.Text:=SZURES.FieldByName('L_TH_HANYAD_SZ').AsString+'/'+SZURES.FieldByName('L_TH_HANYAD_N').AsString;
        le_lakok.Text:=SZURES.FieldByName('lakok_szama').AsString;
        le_szoba.Text:=SZURES.FieldByName('szoba_szam').AsString;
      end;
      if NLAK_ID<>'' then
      begin
        le_hrsz.Text:=SZURES.FieldByName('hrsz').AsString;
        le_cim.Text:=SZURES.FieldByName('cim').AsString;
        vdc_komfort.ItemIndex:=-1;
        vdc_statusz.Ertek(SZURES.FieldByName('es_id').AsString);
        le_terulet.Text:=SZURES.FieldByName('osszes_terulet').AsString;
        le_hasznos.Text:='';
        le_tulhany.Text:=SZURES.FieldByName('B_TH_HANYAD_SZ').AsString+'/'+SZURES.FieldByName('B_TH_HANYAD_N').AsString;
        le_lakok.Text:='';
        le_szoba.Text:=SZURES.FieldByName('helyisegei_szama').AsString;
      end;
      if BERL_ID<>'' then
      begin
        le_hrsz.Text:=SZURES.FieldByName('hrsz').AsString;
        le_cim.Text:=SZURES.FieldByName('cim').AsString;
        vdc_komfort.ItemIndex:=-1;
        le_terulet.Text:=SZURES.FieldByName('berl_terulet').AsString;
        le_hasznos.Text:='';
        le_tulhany.Text:=SZURES.FieldByName('B_TH_HANYAD_SZ').AsString+'/'+SZURES.FieldByName('B_TH_HANYAD_N').AsString;
        le_lakok.Text:='';
        le_szoba.Text:='';
      end;
    end;
  end;
end;

end.
