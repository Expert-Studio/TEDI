unit f_PenztarKeres_Unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AlapSzures_Unit, Data.DB,
  Data.Win.ADODB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Mask, Alap, AlapFuggveny, Vcl.WinXCtrls;

type
  Tf_PenztarKeres = class(TAlapSzures)
    le_befizeto: TLabeledEdit;
    le_berlo: TLabeledEdit;
    me_datum: TMaskEdit;
    Label1: TLabel;
    le_osszeg: TLabeledEdit;
    le_szamla: TLabeledEdit;
    le_berlemeny: TLabeledEdit;
    procedure bb_ujClick(Sender: TObject);
    procedure bb_keresClick(Sender: TObject);
    procedure dbg_listaDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_PenztarKeres: Tf_PenztarKeres;

implementation

{$R *.dfm}

uses f_PenztarBefizetes_Unit;

procedure Tf_PenztarKeres.bb_keresClick(Sender: TObject);
begin
  SZURES.SQL.Text:=
    'Select a.*,' +
    '(Case When b.szemely_id is not null Then (Select y.szemely_teljes_neve From szemely y Where y.szemely_id=x.szemely_id) ' +
    'Else (Select y.szervezet_nev From szervezet y Where y.szervezet_id=x.szervezet_id) End) as berlo, '+
    '(Select (Case When z.lakas_id is not null Then '+
      '     (Select x.cim_sor_1 From cim x, l_lakas y Where y.hrsz_id=x.hrsz_id and y.lakas_id=z.lakas_id) Else '+
      '     (Case When z.nem_lakas_id is not null Then '+
      '         (Select x.cim_sor_1 From cim x, b_nem_lakas y Where y.hrsz_id=x.hrsz_id and y.nem_lakas_id=z.nem_lakas_id) Else '+
      '         (Case When z.berl_id is not null Then '+
      '             (Select x.cim_sor_1 From cim x, berlemeny y Where y.hrsz_id=x.hrsz_id and y.berl_id=z.berl_id) End) '+
      '     End) '+
      '   End) From berlo_kapcsolat z Where z.berlo_id=b.berlo_id ) as cim, '+
    '(Select x.fm_nev From fizetes_mod x Where x.fm_id=a.fm_id) as fizmod '+
    'From befizetes a, berlok b Where a.berlo_id=b.berlo_id and a.fh_id=3 ';
  if le_berlo.Text<>'' then
    SZURES.SQL.Add(
      'and ((b.szemely_id is (Select x.szemely_id From szemely x Where x.szemely_teljes_neve like '+IDCHAR+'%'+le_berlo.Text+'%'+IDCHAR+')) or ' +
      '(b.szervezet_id in (Select x.szervezet_id From szervezet x Where x.szervezet_nev like '+IDCHAR+'%'+le_berlo.Text+'%'+IDCHAR+'))) ');
  if le_befizeto.Text<>'' then
    SZURES.SQL.Add('');
  if le_berlemeny.Text<>'' then
    SZURES.SQL.Add('');
  inherited;
end;

procedure Tf_PenztarKeres.bb_ujClick(Sender: TObject);
begin
  inherited;
  HIVO:=1;
  AblakNyit(Tf_PenztarBefizetes, TForm(f_PenztarBefizetes));
end;

procedure Tf_PenztarKeres.dbg_listaDblClick(Sender: TObject);
begin
  inherited;
  if UJ=1 then
    AblakNyit(Tf_PenztarBefizetes, TForm(f_PenztarBefizetes))
  else
    f_PenztarBefizetes.Show;
end;

end.
