unit f_PenztarBefizetes_Unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AlapAblak_unit, Data.DB, Data.Win.ADODB,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, VDComboBox,
  Vcl.Mask, Alap, AlapFuggveny;

type
  Tf_PenztarBefizetes = class(TAlapAblak)
    le_berlo: TLabeledEdit;
    me_datum: TMaskEdit;
    Label2: TLabel;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    le_osszeg: TLabeledEdit;
    le_befizeto: TLabeledEdit;
    Label5: TLabel;
    dbg_lista: TDBGrid;
    le_osszes: TLabeledEdit;
    bb_szemely: TBitBtn;
    bb_szerv: TBitBtn;
    vdc_mod1: TVDComboBox;
    Label4: TLabel;
    le_hivatkozas: TLabeledEdit;
    Label1: TLabel;
    vdc_afa: TVDComboBox;
    le_afa: TLabeledEdit;
    procedure bb_szervClick(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure bb_szemelyClick(Sender: TObject);
    procedure bb_felveszClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bb_ujClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bb_kilepClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_PenztarBefizetes: Tf_PenztarBefizetes;

implementation

{$R *.dfm}

uses f_SzemelyKeres_Unit, f_SzervezetKeres_Unit, f_SzamlaKeres_Unit,
  f_BerloKeres_Unit;

procedure Tf_PenztarBefizetes.bb_felveszClick(Sender: TObject);
var x, y: Integer;
begin
  if BB_BILL=1  then
  begin
    Beszuras('befizetes',[
      'berlo_id='+BERLO_ID,
      'fm_id='+vdc_mod1.Eredmeny,
      'fh_id=3',
      'felh_id='+FELHASZNALO_ID,
      'befiz_ev='+SzerverEv,
      'befiz_ho='+SzerverHo,
      'befiz_datum='+StrDate(me_datum.Text),
      'befiz alap='+le_osszeg.Text,
      'befiz_afa='+le_afa.Text,
      'befiz_brutto='+le_osszes.Text,
      'befiz_hiv='+le_hivatkozas.Text,
      'befiz_fizeto='+le_befizeto.Text
    ]);
    //Ha a befizetett összeg több számát is érint végig kell menni
    If dbg_lista.SelectedRows.Count>0 Then
    begin
      SZURES.First;
      y:=StrToInt(le_osszeg.Text);
      While not SZURES.Eof do
      begin
        x:=SZURES.RecNo;
        SZURES.DisableControls;
        If dbg_lista.SelectedRows.CurrentRowSelected Then
        begin
          if y>SZURES.FieldByName('szamla_osszdij').AsInteger then
          begin
             Modositas('szamla',['szamla_rendezve=1'],'szamla_id='+SZURES.FieldByName('szamla_id').AsString);
             y:=y-SZURES.FieldByName('szamla_osszdij').AsInteger;
          end
          else
             Uzenet('Létezik maradék összeg!');
        end;
        SZURES.RecNo:=x;
        SZURES.EnableControls;
        SZURES.Next;
      end;
      SZURES.First;
    end
    else
      Uzenet('Nincs kijelölve a befizetendõ számla!');
  end;
  inherited;
end;

procedure Tf_PenztarBefizetes.bb_kilepClick(Sender: TObject);
begin
  inherited;
  GridAllapotMentes(dbg_lista);
end;

procedure Tf_PenztarBefizetes.bb_szemelyClick(Sender: TObject);
begin
  inherited;
  AblakNyit(Tf_BerloKeres, TForm(f_BerloKeres));
  //Adott bérlõ nyitott számláinak keresése
  SZURES.SQL.Text:=
    'Select a.* From szamla x Where x.berlo_id='+BERLO_ID+' and x.szamla_rendezve<>1';
  SZURES.Active:=True;
end;

procedure Tf_PenztarBefizetes.bb_szervClick(Sender: TObject);
begin
  inherited;
  AblakNyit(Tf_SzervezetKeres, TForm(f_SzervezetKeres));
  //Adott bérlõ nyitott számláinak keresése
  SZURES.SQL.Text:=
    'Select a.* From szamla x Where x.berlo_id='+BERLO_ID+' and x.szamla_rendezve<>1';
  SZURES.Active:=True;
end;

procedure Tf_PenztarBefizetes.bb_ujClick(Sender: TObject);
begin
  inherited;
  le_berlo.SetFocus;
end;

procedure Tf_PenztarBefizetes.BitBtn6Click(Sender: TObject);
begin
  inherited;
  AblakNyit(Tf_SzamlaKeres, TForm(f_SzamlaKeres));
end;

procedure Tf_PenztarBefizetes.FormActivate(Sender: TObject);
begin
  inherited;
  if BERLO<>'' then
  begin
    le_berlo.Text:=BERLO;
    if SZEM_ID<>'' then
       le_berlo.Hint:='Anyja neve: '+SZEM_ANYJA+UJSOR+'Születési idõ: '+SZEM_SZD+UJSOR+'Születési hely:'+SZEM_SZH
    else
       le_berlo.Hint:='Adószám:'+SZER_ADO+UJSOR+'Benkszámla:'+SZER_BSZ;
  end;
end;

procedure Tf_PenztarBefizetes.FormShow(Sender: TObject);
begin
  inherited;
  GridAllapotToltes(dbg_lista);
  vdc_mod1.Feltolt;
  vdc_afa.Feltolt;
  if HIVO=1 then
     bb_ujClick(Self);
end;

end.
