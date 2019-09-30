unit f_BerloKeres_Unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AlapSzures_Unit, Data.DB, Vcl.StdCtrls,
  Vcl.ExtCtrls, Data.Win.ADODB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Alap,
  Vcl.ComCtrls, Alapfuggveny, f_GridMezok_Unit, VDComboBox, Vcl.Mask,
  DBLookUpEdit, NumberEdit, Vcl.WinXCtrls;

type
  Tf_BerloKeres = class(TAlapSzures)
    le_berlonev: TLabeledEdit;
    dtp_mettol: TDateTimePicker;
    dtp_meddig: TDateTimePicker;
    Label1: TLabel;
    Meddig: TLabel;
    le_berlokod: TLabeledEdit;
    rg_tipus: TRadioGroup;
    Label3: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    vdc_jogcim: TVDComboBox;
    vdc_allapot: TVDComboBox;
    Label4: TLabel;
    cb_aktiv: TCheckBox;
    procedure bb_okClick(Sender: TObject);
    procedure SZURESAfterOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure bb_keresClick(Sender: TObject);
    procedure dbg_listaDblClick(Sender: TObject);
    procedure bb_ujClick(Sender: TObject);
    procedure SZURESAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_BerloKeres: Tf_BerloKeres;

implementation

{$R *.dfm}

uses f_BerloAdatSzemely_Unit;

procedure Tf_BerloKeres.bb_keresClick(Sender: TObject);
begin
  SZURES.Active := False;
  SZURES.SQL.Text :=
    'Select a.*, b.szervezet_id, b.szemely_id, ' +
    '  (Case When b.szervezet_id is null ' +
    '  Then (Select x.szemely_teljes_neve From szemely x Where x.szemely_id=b.szemely_id) '
    + '  Else (Select x.szervezet_nev From szervezet x Where x.szervezet_id=b.szervezet_id) '
    + '  End) as berlo, ' +
    '  (Select x.berlesjog_neve From berles_jogcime x Where x.berlesjog_id=a.berlesjog_id) as berlesjog, '
    + '  (Select x.bstatusz_nev From berles_statusza x Where x.bstatusz_id=a.bstatusz_id) as statusz '
    + 'From berlo_kapcsolat a, berlok b Where a.berlo_id = b.berlo_id ';
  if le_berlonev.Text <> '' then
    SZURES.SQL.Add('and (Case When b.szervezet_id is null Then ' +
      ' (Select x.szemely_teljes_neve From szemely x Where x.szemely_id=b.szemely_id) else '
      + ' (Select x.szervezet_nev From szervezet x Where x.szervezet_id=b.szervezet_id) end) '
      + 'like ' + IDCHAR + '%' + le_berlonev.Text + '%' + IDCHAR + ' ');
  if le_berlokod.Text <> '' then
    SZURES.SQL.Add('and (Case When b.szervezet_id is null Then ' +
      ' (Select x.jurta_kod From szemely x Where x.szemely_id=b.szemely_id) else '
      + ' (Select x.jurta_kod From szervezet x Where x.szervezet_id=b.szervezet_id) end) '
      + 'like ' + IDCHAR + '%' + le_berlokod.Text + '%' + IDCHAR + ' ');
  if dtp_mettol.Checked then
    SZURES.SQL.Add('and a.berles_kezdet_datuma > ' + IDCHAR +
      DateToStr(dtp_mettol.Date) + IDCHAR + ' ');
  inherited;
end;

procedure Tf_BerloKeres.bb_okClick(Sender: TObject);
begin
  inherited;
  BERLO_ID:=SZURES.FieldByName('berlo_id').AsString;
  SZEM_ID:=SZURES.FieldByName('szemely_id').AsString;
  SZER_ID:=SZURES.FieldByName('szervezet_id').AsString;
  BERLO:=SZURES.FieldByName('berlo').AsString;
  Close;
  ModalResult := mrOk;
end;

procedure Tf_BerloKeres.bb_ujClick(Sender: TObject);
begin
  inherited;
  HIVO:=1;
  case rg_tipus.ItemIndex of
  0: AblakNyit(Tf_BerloAdatSzemely, TForm(f_BerloAdatSzemely));
  1: AblakNyit(Tf_BerloAdatSzemely, TForm(f_BerloAdatSzemely));
  2: AblakNyit(Tf_BerloAdatSzemely, TForm(f_BerloAdatSzemely));
  end;

end;

procedure Tf_BerloKeres.dbg_listaDblClick(Sender: TObject);
begin
  inherited;
  AblakNyit(Tf_BerloAdatSzemely, TForm(f_BerloAdatSzemely));
end;

procedure Tf_BerloKeres.FormShow(Sender: TObject);
begin
  inherited;
  GridAllapotToltes(dbg_lista);
  vdc_jogcim.Feltolt;
  vdc_allapot.Feltolt;
  bb_excel.Enabled := False;
  bb_nyomtat.Enabled := False;
  bb_ok.Enabled := False;
  le_berlonev.SetFocus;
end;

procedure Tf_BerloKeres.SZURESAfterOpen(DataSet: TDataSet);
begin
  inherited;
  If SZURES.RecordCount > 0 Then
  begin
    bb_excel.Enabled := True;
    bb_nyomtat.Enabled := True;
    bb_ok.Enabled := True;
  end;
end;

procedure Tf_BerloKeres.SZURESAfterScroll(DataSet: TDataSet);
begin
  inherited;
  BERLO_ID:=SZURES.FieldByName('berlo_id').AsString;
end;

end.
