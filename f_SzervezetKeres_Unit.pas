unit f_SzervezetKeres_Unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AlapSzures_Unit, Data.DB,
  Data.Win.ADODB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, AlapFuggveny, VDComboBox, Alap, Vcl.WinXCtrls;

type
  Tf_SzervezetKeres = class(TAlapSzures)
    le_szervezet: TLabeledEdit;
    vdc_tipus: TVDComboBox;
    vdc_forma: TVDComboBox;
    Label1: TLabel;
    Label3: TLabel;
    le_adoszam: TLabeledEdit;
    procedure bb_keresClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SZURESAfterScroll(DataSet: TDataSet);
    procedure dbg_listaDblClick(Sender: TObject);
    procedure bb_ujClick(Sender: TObject);
    procedure bb_kilepClick(Sender: TObject);
    procedure dbg_listaCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_SzervezetKeres: Tf_SzervezetKeres;

implementation

{$R *.dfm}

uses f_SzervezetAdat_Unit;

procedure Tf_SzervezetKeres.bb_keresClick(Sender: TObject);
begin
  With SZURES do
  begin
    Active:=False;
    SQL.Text:=
      'Select a.*, '+
      '  (Select x.szervezet_tipus_nev From szervezet_tipus x Where x.szervezet_tipus_id=a.szervezet_tipus_id) as tipus, '+
      '  (Select x.szervezet_forma_nev From szervezet_forma x Where x.szervezet_forma_id=a.szervezet_forma_id) as forma, '+
      '  (Select TOP 1 x.eleres_nev From eleres x, szervezet_eleres y Where x.eleres_id=y.eleres_id and y.szervezet_id=a.szervezet_id and x.eleres_tipus_id=8) as cim, '+
      '  (Select TOP 1 x.eleres_nev From eleres x, szervezet_eleres y Where x.eleres_id=y.eleres_id and y.szervezet_id=a.szervezet_id and x.eleres_tipus_id=9) as emil '+
      'From szervezet a Where a.szervezet_id>-1 ';
    If le_szervezet.Text<>'' Then
       SQL.Add('and a.szervezet_nev like '+IDCHAR+'%'+StringReplace(le_szervezet.Text,' ','%',[rfReplaceAll])+'%'+IDCHAR+' ');
    If vdc_tipus.ItemIndex<>-1 Then
       SQL.Add('and a.szervezet_tipus_id='+vdc_tipus.Eredmeny);
    If vdc_forma.ItemIndex<>-1 Then
       SQL.Add('and a.szervezet_forma_id='+vdc_forma.Eredmeny);
    If le_adoszam.Text<>'' Then
       SQL.Add('and a.adoszam like '+IDCHAR+le_adoszam.Text+'%'+IDCHAR+' ');
    SQL.Add('Order By szervezet_nev');
  end;
  inherited;
end;

procedure Tf_SzervezetKeres.bb_kilepClick(Sender: TObject);
begin
  inherited;
  If SZURES.Active Then
  begin
    SZER_NEV:=SZURES.FieldByName('szervezet_nev').AsString;
    SZER_ID:=SZURES.FieldByName('szervezet_id').AsString;
  end
  else
  begin
    SZER_NEV:='';
    SZER_ID:='';
  end;
end;

procedure Tf_SzervezetKeres.bb_ujClick(Sender: TObject);
begin
  inherited;
  HIVO:=2;
//  AblakNyit(Tf_SzervezetAdat, TForm(f_SzervezetAdat));
  HIVO:=0;
  FrissitesTeljes(SZURES,SZER_ID,'szervezet_id');
  le_szervezet.Text:=SZER_NEV;
  bb_keresClick(Self);
end;

procedure Tf_SzervezetKeres.dbg_listaCellClick(Column: TColumn);
begin
  inherited;
  If (SZER_ID<>'') and (SZURES.State<>dsInactive) Then
  begin
    HIVO:=1;
    AblakNyit(Tf_SzervezetAdat,TForm(f_SzervezetAdat));
    le_szervezet.Text:=SZER_NEV;
    FrissitesTeljes(SZURES,SZER_ID,'szervezet_id');
  end;
end;

procedure Tf_SzervezetKeres.dbg_listaDblClick(Sender: TObject);
begin
  inherited;
  If (SZER_ID<>'') and (SZURES.State<>dsInactive) Then
  begin
    HIVO:=1;
//    AblakNyit(Tf_SzervezetAdat,TForm(f_SzervezetAdat));
    le_szervezet.Text:=SZER_NEV;
    FrissitesTeljes(SZURES,SZER_ID,'szervezet_id');
    inherited;
  end;
end;

procedure Tf_SzervezetKeres.FormShow(Sender: TObject);
begin
  inherited;
  vdc_tipus.Feltolt;
  vdc_forma.Feltolt;
  SZER_NEV:='';
  SZER_ID:='';
  bb_ok.Visible:=True;
  bb_ok.Enabled:=True;
  //Az új gomb csak az ügyvitelnek, ügyfélszolgálaton és a jogi titkárságnak jelenjen meg
  If (FelhObjJog('menu21', 0) = 62) or (FelhObjJog('menu291', 0) = 62)
   or (FelhObjJog('menu29', 0) = 62) or (FelhObjJog('menu212', 0) = 62) or (FelhObjJog('menu213', 0) = 62) Then
     bb_uj.Visible:=True;
end;

procedure Tf_SzervezetKeres.SZURESAfterScroll(DataSet: TDataSet);
begin
  inherited;
  SZER_EMIL:=SZURES.FieldByName('emil').AsString;
  SZER_CIM:=SZURES.FieldByName('cim').AsString;
  SZER_NEV:=SZURES.FieldByName('szervezet_nev').AsString;
  SZER_ID:=SZURES.FieldByName('szervezet_id').AsString;
end;

end.
