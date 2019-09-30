unit f_SzemelyKeres_Unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AlapSzures_Unit, Data.DB,
  Data.Win.ADODB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, VDComboBox, AlapFuggveny, Alap, Vcl.WinXCtrls;

type
  Tf_SzemelyKeres = class(TAlapSzures)
    le_nev: TLabeledEdit;
    vdc_szerepkor: TVDComboBox;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure bb_keresClick(Sender: TObject);
    procedure SZURESAfterScroll(DataSet: TDataSet);
    procedure dbg_listaDblClick(Sender: TObject);
    procedure bb_kilepClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_SzemelyKeres: Tf_SzemelyKeres;

implementation

{$R *.dfm}

procedure Tf_SzemelyKeres.bb_keresClick(Sender: TObject);
begin
  With SZURES do
  begin
    Active:=False;
    SQL.Text:=
      'Select a.*, (Select x.szerepkor_nev From szerepkorok x Where x.szerepkor_id=a.szerepkor_id) as szerepkor, '+
      '  (Select TOP 1 x.eleres_nev From eleres x, szemely_eleres y Where x.eleres_id=y.eleres_id and y.szemely_id=a.szemely_id and x.eleres_tipus_id=8) as cim, '+
      '  (Select TOP 1 x.eleres_nev From eleres x, szemely_eleres y Where x.eleres_id=y.eleres_id and y.szemely_id=a.szemely_id and x.eleres_tipus_id=9) as emil '+
      'From szemely a Where a.szemely_vege='+IDCHAR+'21001231'+IDCHAR+' ';
    If le_nev.Text<>'' Then
       SQL.Add('and a.szemely_teljes_neve like '+IDCHAR+'%'+StringReplace(le_nev.Text,' ','%',[rfReplaceAll])+'%'+IDCHAR+' ');
    If vdc_szerepkor.ItemIndex<>-1 Then
      SQL.Add('and a.szerepkor_id = '+vdc_szerepkor.Eredmeny+' ');
    SQL.Add('Order By a.szemely_teljes_neve ');
  end;
  inherited;
end;

procedure Tf_SzemelyKeres.bb_kilepClick(Sender: TObject);
begin
  inherited;
  If SZURES.Active Then
  begin
    SZEM_NEV:=SZURES.FieldByName('szemely_teljes_neve').AsString;
    SZEM_ID:=SZURES.FieldByName('szemely_id').AsString;
  end
  else
  begin
    SZEM_NEV:='';
    SZEM_ID:='';
  end;
end;

procedure Tf_SzemelyKeres.dbg_listaDblClick(Sender: TObject);
begin
  inherited;
  If (SZEM_ID<>'') and (SZURES.State<>dsInactive) Then
  begin
    HIVO:=1;
//    AblakNyit(Tf_SzemelyAdat, TForm(f_SzemelyAdat));
    HIVO:=0;
    FrissitesTeljes(SZURES,SZEM_ID,'szemely_id');
    inherited;
  end;
end;

procedure Tf_SzemelyKeres.FormShow(Sender: TObject);
begin
  inherited;
  vdc_szerepkor.Feltolt;
  SZEM_ID:='';
  SZEM_NEV:='';
  //Az új gomb csak az ügyvitelnek, ügyfélszolgálaton és a jogi titkárságnak jelenjen meg
  If (FelhObjJog('menu21', 0) = 62) or (FelhObjJog('menu291', 0) = 62)
   or (FelhObjJog('menu29', 0) = 62) or (FelhObjJog('menu212', 0) = 62) or (FelhObjJog('menu213', 0) = 62) Then
     bb_uj.Visible:=True;
  le_nev.SetFocus;
end;

procedure Tf_SzemelyKeres.SZURESAfterScroll(DataSet: TDataSet);
begin
  inherited;
  SZEM_EMIL:=SZURES.FieldByName('emil').AsString;
  SZEM_CIM:=SZURES.FieldByName('cim').AsString;
  SZEM_NEV:=SZURES.FieldByName('szemely_teljes_neve').AsString;
  SZEM_ID:=SZURES.FieldByName('szemely_id').AsString;
end;

end.
