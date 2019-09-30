unit f_EleresAdat_Unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AlapAblak_unit, Data.DB, Data.Win.ADODB,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, VDComboBox, Vcl.Mask, Alap, AlapFuggveny;

type
  Tf_EleresAdat = class(TAlapAblak)
    me_datum2: TMaskEdit;
    e_megj: TEdit;
    Label49: TLabel;
    me_datum1: TMaskEdit;
    e_nev: TEdit;
    Label44: TLabel;
    Label45: TLabel;
    Label1: TLabel;
    Label43: TLabel;
    vdc_tipus: TVDComboBox;
    ellenor: TADOQuery;
    p_uzenet: TPanel;
    procedure FormShow(Sender: TObject);
    procedure vdc_tipusExit(Sender: TObject);
    procedure bb_megsemClick(Sender: TObject);
    procedure bb_torolClick(Sender: TObject);
    procedure SZURESAfterScroll(DataSet: TDataSet);
    procedure bb_ujClick(Sender: TObject);
    procedure bb_felveszClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_EleresAdat: Tf_EleresAdat;

implementation

{$R *.dfm}

uses f_CimSzerkeszto_Unit;

procedure Tf_EleresAdat.bb_felveszClick(Sender: TObject);
begin
  ellenor.Active:=False;
  If SZER_ID<>'' Then
    ellenor.SQL.Text:=
      'Select count(x.eleres_id) as db From eleres x, szervezet_eleres y '+
      'Where y.szervezet_id='+SZER_ID+' and x.eleres_id=y.eleres_id and '+
      'x.eleres_tipus_id='+vdc_tipus.Eredmeny;
  If SZEM_ID<>'' Then
    ellenor.SQL.Text:=
      'Select count(x.eleres_id) as db From eleres x, szemely_eleres y '+
      'Where y.szemely_id='+SZEM_ID+' and x.eleres_id=y.eleres_id and '+
      'x.eleres_tipus_id='+vdc_tipus.Eredmeny;
  ellenor.Active:=True;
  If (ellenor.FieldByName('db').AsInteger=0) and (BB_BILL=1) Then
       ELE_ID:=Beszuras('eleres',[
        'cim_id='+CIM_ID,
        'kataszter_id='+KAT_ID,
        'eleres_tipus_id='+vdc_tipus.Eredmeny,
        'eleres_nev='+e_nev.Text,
        'eleres_megjegyzes='+e_megj.Text,
        'eleres_kezdete='+StrDate(me_datum1.Text),
        'eleres_vege='+StrDate(me_datum2.Text)
        ])
  Else
    If (ellenor.FieldByName('db').AsInteger<>0) and (BB_BILL=1) Then
    begin
      Uzenet('Már létezik adott típusú elérés!');
      ELE_ID:='';
      Exit;
    end;
  If (ellenor.FieldByName('db').AsInteger=1) and (BB_BILL=2) Then
       Modositas('eleres',[
        'eleres_tipus_id='+vdc_tipus.Eredmeny,
        'eleres_nev='+e_nev.Text,
        'eleres_megjegyzes='+e_megj.Text,
        'eleres_kezdete='+StrDate(me_datum1.Text),
        'eleres_vege='+StrDate(me_datum2.Text)
        ],'eleres_id='+ELE_ID);
  inherited;
  bb_kilepClick(Self);
end;

procedure Tf_EleresAdat.bb_megsemClick(Sender: TObject);
begin
  inherited;
  ELE_ID:='';
end;

procedure Tf_EleresAdat.bb_torolClick(Sender: TObject);
begin
  If Rakerdez('Biztos hogy törölnikívánja az elérést?') Then
     Torles('eleres','eleres_id='+ELE_ID);
  inherited;
  ELE_ID:='';
end;

procedure Tf_EleresAdat.bb_ujClick(Sender: TObject);
begin
  inherited;
    me_datum1.Text:=SzerverDat(1);
    me_datum2.Text:=MAXDAT;
    vdc_tipus.Ertek(IntToStr(HIVO));
    vdc_tipus.SetFocus
end;

procedure Tf_EleresAdat.FormShow(Sender: TObject);
begin
  inherited;
  vdc_tipus.Feltolt;
  If HIVO=1 Then
  begin
    HIVO:=0;
    bb_ujClick(Self);
  end;
  If (HIVO=1) or (HIVO=12) Then
  begin
     bb_ujClick(Self);
     HIVO:=8;
  end;
  If (HIVO=2) and (ELE_ID<>'') Then
  begin
    SZURES.Active:=False;
    SZURES.Parameters.ParamByName('ele_id').Value:=ELE_ID;
    SZURES.Active:=True;
    bb_modositClick(Self);
  end;
end;

procedure Tf_EleresAdat.SZURESAfterScroll(DataSet: TDataSet);
begin
  inherited;
  CIM_ID:=SZURES.FieldByName('cim_id').AsString;
  vdc_tipus.Ertek(SZURES.FieldByName('eleres_tipus_id').AsString);
  e_nev.Text:=SZURES.FieldByName('eleres_nev').AsString;
  e_megj.Text:=SZURES.FieldByName('eleres_megjegyzes').AsString;
  me_datum1.Text:=SZURES.FieldByName('eleres_kezdete').AsString;
  me_datum2.Text:=SZURES.FieldByName('eleres_vege').AsString;
end;

procedure Tf_EleresAdat.vdc_tipusExit(Sender: TObject);
var i: Integer;
begin
  If BB_BILL<>0 Then
  begin
    i:=BB_BILL;
    inherited;
    If vdc_tipus.ItemIndex>-1 Then
    begin
      If StrToInt(vdc_tipus.Eredmeny) in [1,2,3,4,8,12]  Then
      begin
        p_uzenet.Caption:='A címszerkesztõ betöltése folyamatban...';
        p_uzenet.Visible:=True;
        Application.ProcessMessages;
        HIVO:=BB_BILL;
        BB_BILL:=0;
        AblakNyit(Tf_CimSzerkeszto,TForm(f_CimSzerkeszto));
        BB_BILL:=i;
        p_uzenet.Visible:=False;
        If CIM_ID<>'' Then e_nev.Text:=PCIM_SOR;
      end;
    end;
  end;
end;

end.
