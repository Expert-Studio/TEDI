unit f_BefizetesSzures_Unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AlapSzures_Unit, Data.DB, Vcl.StdCtrls,
  VDComboBox, Vcl.ComCtrls, Vcl.ExtCtrls, Data.Win.ADODB, Vcl.Grids, Alap,
  Vcl.DBGrids, Vcl.Buttons, AlapFuggveny, Vcl.WinXCtrls;

type
  Tf_BefizetesSzures = class(TAlapSzures)
    le_azon: TLabeledEdit;
    dtp_mettol: TDateTimePicker;
    dtp_meddig: TDateTimePicker;
    Label1: TLabel;
    le_berlonev: TLabeledEdit;
    le_azonosito: TLabeledEdit;
    vdc_mod: TVDComboBox;
    Label3: TLabel;
    le_hivatkozas: TLabeledEdit;
    le_osszeg: TLabeledEdit;
    cb_konyvelt: TCheckBox;
    BitBtn6: TBitBtn;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bb_keresClick(Sender: TObject);
    procedure bb_ujClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_BefizetesSzures: Tf_BefizetesSzures;

implementation

{$R *.dfm}

uses f_BefizetesAdat_Unit, f_PenztarBefizetes_Unit;

procedure Tf_BefizetesSzures.bb_keresClick(Sender: TObject);
begin
  SZURES.SQL.Text:=
    'Select a.*, '+
    '(Select x.fm_nev From fizetesi_mod x Where x.fm_id=a.fm_id) as fizmod, '+
    '(Select x.fh_nev From fizetes_hely x Where x.fh_id=a.fh_id) as fizhely, '+
    '  (Case When b.szervezet_id is null ' +
    '  Then (Select x.szemely_teljes_neve From szemely x Where x.szemely_id=b.szemely_id) '+
    '  Else (Select x.szervezet_nev From szervezet x Where x.szervezet_id=b.szervezet_id) '+
    '  End) as berlo ' +
    'From befizetes a, berlok b Where a.berlo_id=b.berlo_id ';
  if le_azon.Text <> '' then
    SZURES.SQL.Add('and a.befiz_sorszam like '+IDCHAR+'%'+le_azon.Text+'%'+IDCHAR);
  if le_berlonev.Text <> '' then
    SZURES.SQL.Add('and (Case When b.szervezet_id is null Then ' +
      ' (Select x.szemely_teljes_neve From szemely x Where x.szemely_id=b.szemely_id) else '
      + ' (Select x.szervezet_nev From szervezet x Where x.szervezet_id=b.szervezet_id) end) '
      + 'like ' + IDCHAR + '%' + le_berlonev.Text + '%' + IDCHAR + ' ');
  if le_azonosito.Text <> '' then
    SZURES.SQL.Add('and (Case When b.szervezet_id is null Then ' +
      ' (Select x.szecs_azonosito From szemely x Where x.szemely_id=b.szemely_id) else '
      + ' (Select x.jurta_kod From szervezet x Where x.szervezet_id=b.szervezet_id) end) '
      + 'like ' + IDCHAR + '%' + le_azonosito.Text + '%' + IDCHAR + ' ');
  if vdc_mod.ItemIndex <> -1 then
    SZURES.SQL.Add('and a.fm_id='+vdc_mod.Eredmeny+' ');
  if le_hivatkozas.Text <> '' then
    SZURES.SQL.Add('and a.befiz_hiv like '+IDCHAR+'%'+le_hivatkozas.Text+'%'+IDCHAR);
  if le_osszeg.Text <> '' then
    SZURES.SQL.Add('and a.befiz_brutto = '+le_osszeg.Text+' ');
  inherited;
end;

procedure Tf_BefizetesSzures.bb_ujClick(Sender: TObject);
begin
  inherited;
  HIVO:=1;
  AblakNyit(Tf_PenztarBefizetes, TForm(f_PenztarBefizetes));
end;

procedure Tf_BefizetesSzures.BitBtn1Click(Sender: TObject);
begin
  inherited;
  AblakNyit(Tf_BefizetesAdat, TForm(f_BefizetesAdat));
end;

procedure Tf_BefizetesSzures.BitBtn6Click(Sender: TObject);
begin
  inherited;
  AblakNyit(Tf_PenztarBefizetes, TForm(f_PenztarBefizetes));
end;

procedure Tf_BefizetesSzures.FormShow(Sender: TObject);
begin
  inherited;
  vdc_mod.Feltolt;
end;

end.
