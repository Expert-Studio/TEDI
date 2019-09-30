unit f_SzamelyAdat_Unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Alap, AlapAblak_unit, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, VDComboBox, Data.Win.ADODB,
  Vcl.Buttons, Vcl.ExtCtrls, AlapFuggveny;

type
  Tf_SzamelyAdat = class(TAlapAblak)
    Label5: TLabel;
    l_nev: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    e_vezeteknev1: TEdit;
    e_vezeteknev2: TEdit;
    Label3: TLabel;
    e_keresztnev1: TEdit;
    e_keresztnev2: TEdit;
    Label4: TLabel;
    Label7: TLabel;
    Label11: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label47: TLabel;
    e_anyja: TEdit;
    me_szulido: TMaskEdit;
    m_megj: TMemo;
    dbg_eleres: TDBGrid;
    bb_eleres_uj: TBitBtn;
    bb_eleres_mod: TBitBtn;
    bb_eleres_torol: TBitBtn;
    e_jurtakod: TEdit;
    eleres: TADOQuery;
    eleresDS: TDataSource;
    vdc_elotag: TVDComboBox;
    vdc_utotag: TVDComboBox;
    procedure eleres_szerk;
    procedure bb_felveszClick(Sender: TObject);
    procedure bb_eleres_ujClick(Sender: TObject);
    procedure bb_eleres_modClick(Sender: TObject);
    procedure eleresAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_SzamelyAdat: Tf_SzamelyAdat;

implementation

{$R *.dfm}

uses f_EleresAdat_Unit;

procedure Tf_SzamelyAdat.eleresAfterScroll(DataSet: TDataSet);
begin
  inherited;
  ELE_ID:=eleres.FieldByName('eleres_id').AsString;
end;

procedure Tf_SzamelyAdat.eleres_szerk;
var s: Integer;
begin
  s:=BB_BILL;
  If (HIVO=0) and (BB_BILL=1) Then bb_felveszClick(Self);
  BB_BILL:=0;
  AblakNyit(Tf_EleresAdat,TForm(f_EleresAdat));
  BB_BILL:=s;
  HIVO:=0;
  If ELE_ID<>'' Then
  begin
    If BB_BILL=1 Then
        Beszuras('szemely_eleres',[
          'eleres_id='+ELE_ID,
          'szemely_id='+SZEM_ID,
          'szem_eleres_sorszam=1',
          'szem_eleres_kezdete='+SzerverDat(2),
          'szem_eleres_vege='+'21001231'
          ]);
    If BB_BILL=2 Then
        Modositas('szemely_eleres',[
          'eleres_id='+ELE_ID,
          'szemely_id='+SZEM_ID,
          'szem_eleres_sorszam=1',
          'szem_eleres_kezdete='+SzerverDat(2),
          'szem_eleres_vege='+'21001231'
          ], 'eleres_id='+ELE_ID+' and szemely_id='+SZEM_ID);
    FrissitesTeljes(eleres,ELE_ID,'eleres_id');
    inherited;
  end;
end;


procedure Tf_SzamelyAdat.bb_eleres_modClick(Sender: TObject);
begin
  HIVO:=2;  BB_BILL:=2;
  eleres_szerk;
  inherited;
end;

procedure Tf_SzamelyAdat.bb_eleres_ujClick(Sender: TObject);
begin
  HIVO:=1;  BB_BILL:=1;
  eleres_szerk;
  inherited;
end;

procedure Tf_SzamelyAdat.bb_felveszClick(Sender: TObject);
var i: Integer;
begin
  i:=BB_BILL;
  inherited;
  SZEM_NEV:='';
  If vdc_elotag.ItemIndex>0 Then SZEM_NEV:=vdc_elotag.Text+' ';
  If e_vezeteknev1.Text<>'' Then SZEM_NEV:=SZEM_NEV+e_vezeteknev1.Text+' ';
  If e_vezeteknev2.Text<>'' Then SZEM_NEV:=SZEM_NEV+e_vezeteknev2.Text+' ';
  If e_keresztnev1.Text<>'' Then SZEM_NEV:=SZEM_NEV+e_keresztnev1.Text+' ';
  If e_keresztnev2.Text<>'' Then SZEM_NEV:=SZEM_NEV+e_keresztnev2.Text+' ';
  If vdc_utotag.ItemIndex>0 Then SZEM_NEV:=SZEM_NEV+vdc_utotag.Text;
  l_nev.Caption:=SZEM_NEV;
  If i=1 Then
  begin
     SZEM_ID:=
      Beszuras('szemely',[
        'szerepkor_id=10',
        'elotag='+vdc_elotag.eredmeny,
        'utotag='+vdc_utotag.eredmeny,
        'vezetekneve1='+e_vezeteknev1.Text,
        'vezetekneve2='+e_vezeteknev2.Text,
        'keresztneve1='+e_keresztnev1.Text,
        'anyja_neve='+e_anyja.Text,
        'szuletesi_datum='+StrDate(me_szulido.Text),
        'szemely_megjegyzes='+m_megj.Text,
        'szemely_teljes_neve='+SZEM_NEV,
        'szemely_kezdete='+SzerverDat(2),
        'szemely_vege='+'21001231'
        ]);
  end
  else
    Modositas('szemely',[
        'elotag='+vdc_elotag.eredmeny,
        'utotag='+vdc_utotag.eredmeny,
        'vezetekneve1='+e_vezeteknev1.Text,
        'vezetekneve2='+e_vezeteknev2.Text,
        'keresztneve1='+e_keresztnev1.Text,
        'keresztneve2='+e_keresztnev2.Text,
        'anyja_neve='+e_anyja.Text,
        'szuletesi_datum='+StrDate(me_szulido.Text),
        'szemely_megjegyzes='+m_megj.Text,
        'szemely_teljes_neve='+SZEM_NEV
        ],'szemely_id='+SZEM_ID);
  eleres.Active:=False;
  eleres.Parameters.ParamByName('szem_id').Value:=SZEM_ID;
  eleres.Active:=True;
end;

end.
