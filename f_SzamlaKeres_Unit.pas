unit f_SzamlaKeres_Unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AlapSzures_Unit, Data.DB, Alap,
  Data.Win.ADODB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, VDComboBox, Vcl.ComCtrls, AlapFuggveny, Vcl.WinXCtrls;

type
  Tf_SzamlaKeres = class(TAlapSzures)
    le_szamlaszam: TLabeledEdit;
    le_berlonev: TLabeledEdit;
    LabeledEdit1: TLabeledEdit;
    dtp_mettol: TDateTimePicker;
    dtp_meddig: TDateTimePicker;
    Label4: TLabel;
    vdc_fajta: TVDComboBox;
    Label5: TLabel;
    vdc_tipus: TVDComboBox;
    Label1: TLabel;
    vdc_mod: TVDComboBox;
    Label3: TLabel;
    LabeledEdit3: TLabeledEdit;
    procedure dbg_listaDblClick(Sender: TObject);
    procedure bb_ujClick(Sender: TObject);
    procedure bb_keresClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SZURESAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_SzamlaKeres: Tf_SzamlaKeres;

implementation

{$R *.dfm}

uses f_SzamlaAdat_Unit;

procedure Tf_SzamlaKeres.bb_keresClick(Sender: TObject);
begin
  SZURES.SQL.Text:=
    'Select a.*, '+
    '(Select (Case When x.szemely_id is not null Then (Select y.szemely_teljes_neve From szemely y Where y.szemely_id=x.szemely_id) ' +
    'Else (Select y.szervezet_nev From szervezet y Where y.szervezet_id=x.szervezet_id) End) From berlok x Where x.berlo_id=a.berlo_id) as berlo, '+
    '(Select (Case When z.lakas_id is not null Then '+
      '     (Select x.cim_sor_1 From cim x, l_lakas y Where y.hrsz_id=x.hrsz_id and y.lakas_id=z.lakas_id) Else '+
      '     (Case When z.nem_lakas_id is not null Then '+
      '         (Select x.cim_sor_1 From cim x, b_nem_lakas y Where y.hrsz_id=x.hrsz_id and y.nem_lakas_id=z.nem_lakas_id) Else '+
      '         (Case When z.berl_id is not null Then '+
      '             (Select x.cim_sor_1 From cim x, berlemeny y Where y.hrsz_id=x.hrsz_id and y.berl_id=z.berl_id) End) '+
      '     End) '+
      '     End) From berlo_kapcsolat z, szerzodes v Where z.bstatusz_id=1 and z.berlo_id=v.berlo_id and v.szerz_id=a.szerz_id and z.berlo_id=a.berlo_id ) as cim, '+
    '(Select x.fm_nev From fizetesi_mod x Where x.fm_id=a.fm_id) as fizmod, '+
    '(Select x.szt_nev From szamla_tipus x Where x.szt_id=a.szt_id) as tipus '+
    'From szamla a Where a.szamla_id>0 ';
  if le_szamlaszam.Text<>'' then
    SZURES.SQL.Add('and a.szamla_szama like '+IDCHAR+'%'+le_szamlaszam.Text+'%'+IDCHAR+' ');

  inherited;
  (SZURES.FieldByName('szamla_osszdij') as TNumericField).DisplayFormat:='### ### ### ###';
end;

procedure Tf_SzamlaKeres.bb_ujClick(Sender: TObject);
begin
  HIVO:=1;
  AblakNyit(Tf_SzamlaAdat, TForm(f_SzamlaAdat));
end;

procedure Tf_SzamlaKeres.dbg_listaDblClick(Sender: TObject);
begin
  HIVO:=0;
  AblakNyit(Tf_SzamlaAdat, TForm(f_SzamlaAdat));
end;

procedure Tf_SzamlaKeres.FormShow(Sender: TObject);
begin
  inherited;
  vdc_mod.Feltolt;
  vdc_tipus.Feltolt;

end;

procedure Tf_SzamlaKeres.SZURESAfterScroll(DataSet: TDataSet);
begin
  inherited;
  SZAMLA_ID:=SZURES.FieldByName('szamla_id').AsString;
  BERLO_ID:=SZURES.FieldByName('berlo_id').AsString;
  SZE_ID:=SZURES.FieldByName('szerz_id').AsString;
end;

end.
