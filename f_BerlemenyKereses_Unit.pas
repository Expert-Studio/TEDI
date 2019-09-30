unit f_BerlemenyKereses_Unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AlapSzures_Unit, Data.DB, Vcl.StdCtrls,
  Alapfuggveny,
  Vcl.ExtCtrls, Data.Win.ADODB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Alap,
  VDComboBox, Vcl.WinXCtrls;

type
  Tf_BerlemenyKereses = class(TAlapSzures)
    le_cim: TLabeledEdit;
    le_hrsz: TLabeledEdit;
    rg_tipus: TRadioGroup;
    Label1: TLabel;
    LabeledEdit1: TLabeledEdit;
    Label3: TLabel;
    vdc_komfort: TVDComboBox;
    vdc_statusz: TVDComboBox;
    procedure bb_keresClick(Sender: TObject);
    procedure dbg_listaDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure bb_ujClick(Sender: TObject);
    procedure SZURESAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_BerlemenyKereses: Tf_BerlemenyKereses;

implementation

{$R *.dfm}

uses f_BerlemenyAdat_Unit;

procedure Tf_BerlemenyKereses.bb_keresClick(Sender: TObject);
var
  s: String;
begin
  case rg_tipus.ItemIndex of
    0:
      s := 'SELECT a.*, ' +
        '  (Select x.es_nev From ellenstatusz x Where x.es_id=a.es_id) as statusz, '
        + ' a.lakas_osszes_terulete as terulet, '
        + '  (Select x.komfort_nev From l_komfortfokozat x Where x.komfort_id=a.komfort_id) as komfort, '
        + '  (Select x.helyrajziszam From helyrajzi_szamok x Where a.hrsz_id=x.hrsz_id) as hrsz, '
        + '  (Select x.hrsz_id From helyrajzi_szamok x Where a.hrsz_id=x.hrsz_id) as hrsz_id, '
        + '  (Select x.helyrajzi_szam_foresz From helyrajzi_szamok x Where a.hrsz_id=x.hrsz_id) as foresz, '
        + '  (Select x.helyrajzi_szam_alatores From helyrajzi_szamok x Where a.hrsz_id=x.hrsz_id) as alatores, '
        + '  (Select x.cim_sor_1 From cim x Where a.hrsz_id=x.hrsz_id) as cim, '
        + '  (Select x.cim_id From cim x Where a.hrsz_id=x.hrsz_id) as cim_id '
        + 'FROM l_lakas a WHERE a.lakas_id>0 ';
    1:
      s := 'SELECT a.*, ' +
        '  (Select x.es_nev From ellenstatusz x Where x.es_id=a.es_id) as statusz, '
        + '  a.osszes_terulet as terulet, '
        + '  (Select x.helyrajziszam From helyrajzi_szamok x Where a.hrsz_id=x.hrsz_id) as hrsz, '
        + '  (Select x.hrsz_id From helyrajzi_szamok x Where a.hrsz_id=x.hrsz_id) as hrsz_id, '
        + '  (Select x.helyrajzi_szam_foresz From helyrajzi_szamok x Where a.hrsz_id=x.hrsz_id) as foresz, '
        + '  (Select x.helyrajzi_szam_alatores From helyrajzi_szamok x Where a.hrsz_id=x.hrsz_id) as alatores, '
        + '  (Select x.cim_sor_1 From cim x Where a.hrsz_id=x.hrsz_id) as cim, '
        + '  (Select x.cim_id From cim x Where a.hrsz_id=x.hrsz_id) as cim_id '
        + 'FROM b_nem_lakas a WHERE a.nem_lakas_id>0 ';
    2:
      s := 'SELECT a.*, ' +
        '  (Select x.es_nev From ellenstatusz x Where x.es_id=a.es_id) as statusz, '
        + '  (Select x.helyrajziszam From helyrajzi_szamok x Where a.hrsz_id=x.hrsz_id) as hrsz, '
        + '  (Select x.hrsz_id From helyrajzi_szamok x Where a.hrsz_id=x.hrsz_id) as hrsz_id, '
        + '  (Select x.helyrajzi_szam_foresz From helyrajzi_szamok x Where a.hrsz_id=x.hrsz_id) as foresz, '
        + '  (Select x.helyrajzi_szam_alatores From helyrajzi_szamok x Where a.hrsz_id=x.hrsz_id) as alatores, '
        + '  (Select x.cim_sor_1 From cim x Where a.hrsz_id=x.hrsz_id) as cim, '
        + '  (Select x.cim_id From cim x Where a.hrsz_id=x.hrsz_id) as cim_id '
        + 'FROM berlemeny a WHERE a.berl_id>0 ';
    else
      begin
        Uzenet('Válassz bérlemény típust!');
        Exit;
      end;
  end;
  SZURES.SQL.Text := s;
  if le_cim.Text <> '' then
    SZURES.SQL.Add
      ('and (Select x.cim_sor_1 From cim x Where a.hrsz_id=x.hrsz_id) like ' +
      IDCHAR + '%' + le_cim.Text + '%' + IDCHAR);
  if le_hrsz.Text <> '' then
    SZURES.SQL.Add
      ('and (Select x.helyrajziszam From helyrajzi_szamok x Where a.hrsz_id=x.hrsz_id) like '
      + IDCHAR + '%' + le_hrsz.Text + '%' + IDCHAR);
  if vdc_komfort.ItemIndex<>-1 then
     SZURES.SQL.Add('and a.komfort_id='+vdc_komfort.Eredmeny+' ');
  if vdc_statusz.ItemIndex<>-1 then
     SZURES.SQL.Add('and a.es_id='+vdc_statusz.Eredmeny+' ');
  try
    inherited;
  except
    Uzenet('Hibás lekérdezés!');
  end;
end;

procedure Tf_BerlemenyKereses.bb_ujClick(Sender: TObject);
begin
  inherited;
  HIVO:=1;
  AblakNyit(Tf_BerlemenyAdat, TForm(f_BerlemenyAdat));
end;

procedure Tf_BerlemenyKereses.dbg_listaDblClick(Sender: TObject);
begin
  inherited;
  HIVO:=0;
  AblakNyit(Tf_BerlemenyAdat, TForm(f_BerlemenyAdat));
end;

procedure Tf_BerlemenyKereses.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = CRCHAR then
    bb_keresClick(Self);
end;

procedure Tf_BerlemenyKereses.FormShow(Sender: TObject);
begin
  inherited;
  vdc_komfort.Feltolt;
  vdc_statusz.Feltolt;
end;

procedure Tf_BerlemenyKereses.SZURESAfterScroll(DataSet: TDataSet);
begin
  inherited;
  LAK_ID:='';
  NLAK_ID:='';
  BERL_ID:='';
  case rg_tipus.ItemIndex of
  0:  LAK_ID:=SZURES.FieldByName('lakas_id').AsString;
  1:  NLAK_ID:=SZURES.FieldByName('nem_lakas_id').AsString;
  2:  BERL_ID:=SZURES.FieldByName('berl_id').AsString;
  end;
  CIM_ID:=SZURES.FieldByName('cim_id').AsString;
  CIM_SOR:=SZURES.FieldByName('cim').AsString;
  HRSZ_SOR:=SZURES.FieldByName('hrsz').AsString;
end;

end.
