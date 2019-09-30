unit form_LakasKeres_unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AlapSzures_Unit, StdCtrls, Grids, DBGrids, DB, ADODB, Buttons,
  ExtCtrls, VDComboBox, f_GridMezok_Unit, Alap;

type
  Tform_LakasKeres = class(TAlapSzures)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label14: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dbg_lista: TDBGrid;
    e_terulettol: TEdit;
    vcb_statusz: TVDComboBox;
    vcb_komfort: TVDComboBox;
    e_teruletig: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    vcb_ugyintezo: TVDComboBox;
    vcb_konyvelo: TVDComboBox;
    Label8: TLabel;
    e_hrsz: TEdit;
    e_kozter: TEdit;
    e_tulaj: TEdit;
    e_kozmu: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    e_berlo: TEdit;
    p_uzenet: TPanel;
    vdc_haszn: TVDComboBox;
    Label11: TLabel;
    procedure FormShow(Sender: TObject);
    procedure dbg_listaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbg_listaDblClick(Sender: TObject);
    procedure bb_inditClick(Sender: TObject);
    procedure SZURESAfterScroll(DataSet: TDataSet);
    procedure dbg_listaTitleClick(Column: TColumn);
    procedure bb_felttorolClick(Sender: TObject);
    procedure bb_kilepesClick(Sender: TObject);
    procedure bb_OkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_LakasKeres: Tform_LakasKeres;

implementation

uses form_Lakas_unit, form_Fooldal_Unit;

{$R *.dfm}

procedure Tform_LakasKeres.FormShow(Sender: TObject);
begin
  inherited;
  GridAllapotToltes(dbg_lista);
  vcb_statusz.Feltolt;
  vcb_komfort.Feltolt;
  vcb_ugyintezo.Feltolt;
  vcb_konyvelo.Feltolt;
  vdc_haszn.Feltolt;
end;

procedure Tform_LakasKeres.dbg_listaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If Key = vk_F12 Then
     GridMezok(dbg_lista);
end;

procedure Tform_LakasKeres.dbg_listaDblClick(Sender: TObject);
var i: String;
begin
  If (LAK_ID<>'') and (SZURES.State<>dsInactive) Then
  begin
    i:=LAK_ID;
    HIVO:=0;
    AblakNyit(Tform_Lakas,TForm(form_Lakas), true, form_Fooldal.menu11);
    EpuletFrissites(KAT_ID);
    Frissites(SZURES,LAK_ID,'lakas_id');
  end;
end;

procedure Tform_LakasKeres.bb_inditClick(Sender: TObject);
begin
  p_uzenet.Caption:='A keresés folyamatban...';
  p_uzenet.Visible:=True;
  Application.ProcessMessages;
  With SZURES do
  begin
    Active:=False;
    SQL.Text:=
      'SELECT a.*, '+
      '  (Select x.es_nev From ellenstatusz x Where x.es_id=a.es_id) as statusz, '+
      '  (Select x.komfort_nev From l_komfortfokozat x Where x.komfort_id=a.komfort_id) as komfort, '+
      '  (Select x.helyrajziszam From helyrajzi_szamok x Where a.hrsz_id=x.hrsz_id) as hrsz, '+
      '  (Select x.hrsz_id From helyrajzi_szamok x Where a.hrsz_id=x.hrsz_id) as hrsz_id, '+
      '  (Select x.helyrajzi_szam_foresz From helyrajzi_szamok x Where a.hrsz_id=x.hrsz_id) as foresz, '+
      '  (Select x.helyrajzi_szam_alatores From helyrajzi_szamok x Where a.hrsz_id=x.hrsz_id) as alatores, '+
      '  (Select x.cim_sor_1 From cim x Where a.hrsz_id=x.hrsz_id) as cim, '+
      '  (Select x.cim_id From cim x Where a.hrsz_id=x.hrsz_id) as cim_id '+
      'FROM l_lakas a WHERE a.lakas_id>0 ';
    If e_kozter.Text<>'' Then
       SQL.Add('and a.hrsz_id in (Select x.hrsz_id From cim x Where x.cim_sor_1 like '+IDCHAR+StringReplace(StringReplace(e_kozter.Text,'.','',[rfReplaceAll]),' ','%',[rfReplaceAll])+'%'+IDCHAR+') ');
    If e_tulaj.Text<>'' Then
       SQL.Add('and a.lakas_id in (Select x.lakas_id From lakas_tulajdonos x, szervezet y Where x.szervezet_id=y.szervezet_id and y.szervezet_nev like '+IDCHAR+StringReplace(e_tulaj.Text,' ','%',[rfReplaceAll])+'%'+IDCHAR+') ');
    If vcb_statusz.ItemIndex>-1 Then
       SQL.Add('and a.es_id='+vcb_statusz.Eredmeny+' ');
    If vdc_haszn.ItemIndex>-1 Then
       SQL.Add('and a.statusz_id='+vdc_haszn.Eredmeny+' ');
    If vcb_komfort.ItemIndex>-1 Then
       SQL.Add('and a.komfort_id='+vcb_komfort.Eredmeny+' ');
    If e_terulettol.Text<>'' Then
       SQL.Add('and a.lakas_osszes_terulete >='+e_terulettol.Text+' ');
    If e_teruletig.Text<>'' Then
       SQL.Add('and a.lakas_osszes_terulete <='+e_teruletig.Text+' ');
    If e_hrsz.Text<>'' Then
       SQL.Add('and a.hrsz_id in (Select x.hrsz_id From helyrajzi_szamok x Where x.helyrajziszam like '+IDCHAR+'%'+e_hrsz.Text+'%'+IDCHAR+' )');
    If e_kozmu.Text<>'' Then
       SQL.Add('and a.lakas_id in (Select x.lakas_id From kozmu x Where x.kozmu_szama like '+IDCHAR+'%'+e_kozmu.Text+'%'+IDCHAR+' )');
    If e_berlo.Text<>'' Then
    begin
        SQL.Add('and  ((a.LAKAS_ID in (Select x.lakas_id From BERLO_KAPCSOLAT x, BERLOK y, SZEMELY z ');
        SQL.Add('Where y.SZEMELY_ID=z.SZEMELY_ID and x.BERLO_ID=y.BERLO_ID and x.BERLES_VEGE_DATUMA > GETDATE() and ');
        SQL.Add('z.SZEMELY_TELJES_NEVE like '+IDCHAR+'%'+e_berlo.Text+'%'+IDCHAR+')) or ');
        SQL.Add('(a.LAKAS_ID in (Select x.lakas_id From BERLO_KAPCSOLAT x, BERLOK y, SZERVEZET z ');
        SQL.Add('Where y.SZERVEZET_ID=z.SZERVEZET_ID and x.BERLO_ID=y.BERLO_ID and x.BERLES_VEGE_DATUMA > GETDATE() and ');
        SQL.Add('z.SZERVEZET_NEV like '+IDCHAR+'%'+e_berlo.Text+'%'+IDCHAR+')))');
    end;
  end;
  inherited;
  p_uzenet.Visible:=False;
  Application.ProcessMessages;
end;

procedure Tform_LakasKeres.SZURESAfterScroll(DataSet: TDataSet);
begin
  inherited;
  LAK_ID:=SZURES.FieldByName('lakas_id').AsString;
  KAT_ID:=SZURES.FieldByName('kataszter_id').AsString;
  CIM_SOR:=SZURES.FieldByName('cim').AsString;
  CIM_ID:=SZURES.FieldByName('cim_id').AsString;
  HRSZ_ID:=SZURES.FieldByName('hrsz_id').AsString;
  HRSZ_SOR:=SZURES.FieldByName('hrsz').AsString;
end;

procedure Tform_LakasKeres.dbg_listaTitleClick(Column: TColumn);
begin
  inherited;
  dbg_TitleClick(dbg_lista, Column);
end;

procedure Tform_LakasKeres.bb_felttorolClick(Sender: TObject);
begin
  inherited;
  CIM_ID:=''; HRSZ_ID:='';
end;

procedure Tform_LakasKeres.bb_kilepesClick(Sender: TObject);
begin
  LAK_ID:='';
  KAT_ID:='';
  CIM_SOR:='';
  CIM_ID:='';
  HRSZ_ID:='';
  inherited;
  GridAllapotMentes(dbg_lista);  
end;

procedure Tform_LakasKeres.bb_OkClick(Sender: TObject);
var i, x: Integer;
begin
  ertektorles;
  i:=0;
  //megvizsgálni hogy melyik van kijelölve
  If dbg_lista.SelectedRows.Count>1 Then
  begin
    SZURES.First;
    While not SZURES.Eof do
    begin
      x:=SZURES.RecNo;
      SZURES.DisableControls;
      If dbg_lista.SelectedRows.CurrentRowSelected Then
      begin
         ERTEKEK[i]:=LAK_ID;
         CIM_ERTEKEK[i]:=CIM_ID;
         HRSZ_ERTEKEK[i]:=HRSZ_ID;
         Inc(i);
      end;
      SZURES.RecNo:=x;
      SZURES.EnableControls;
      SZURES.Next;
    end;
    SZURES.First;
  end
  else
     If dbg_lista.SelectedRows.CurrentRowSelected Then
     begin
         ERTEKEK[i]:=LAK_ID;
         CIM_ERTEKEK[i]:=CIM_ID;
         HRSZ_ERTEKEK[i]:=HRSZ_ID;
     end;
//  While (not SZURES.Eof) and (dbg_lista.SelectedRows.CurrentRowSelected=False) do SZURES.Next; end;
  inherited;
end;

end.
