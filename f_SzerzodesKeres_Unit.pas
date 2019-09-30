unit f_SzerzodesKeres_Unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AlapSzures_Unit, Data.DB, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.ExtCtrls, Data.Win.ADODB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, VDComboBox, Alap, AlapFuggveny, Vcl.WinXCtrls;

type
  Tf_SzerzodesKeres = class(TAlapSzures)
    le_berlonev: TLabeledEdit;
    dtp_mettol: TDateTimePicker;
    dtp_meddig: TDateTimePicker;
    Label1: TLabel;
    le_berloazon: TLabeledEdit;
    le_szam: TLabeledEdit;
    Label5: TLabel;
    vdc_tipus: TVDComboBox;
    le_ev: TLabeledEdit;
    le_berlemeny: TLabeledEdit;
    Label17: TLabel;
    vdc_vonatkozas: TVDComboBox;
    vdc_berlesjog: TVDComboBox;
    Label3: TLabel;
    Label16: TLabel;
    vdc_allapot: TVDComboBox;
    Label4: TLabel;
    vdc_idoszak: TVDComboBox;
    procedure dbg_listaDblClick(Sender: TObject);
    procedure bb_ujClick(Sender: TObject);
    procedure bb_keresClick(Sender: TObject);
    procedure SZURESAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_SzerzodesKeres: Tf_SzerzodesKeres;

implementation

{$R *.dfm}

uses f_SzerzodesAdat_Unit;

procedure Tf_SzerzodesKeres.bb_keresClick(Sender: TObject);
begin
  SZURES.SQL.Text:=
  'Select a.*, '+
  '(Select x.szt_nev From szerzodes_tipus x Where x.szt_id=a.szt_id) as tipus, '+
  '(Select x.szv_nev From szerzodes_vonatkozas x Where x.szv_id=a.szv_id) as vonatkozas, '+
  '(Select (Case When x.szemely_id is not null Then (Select y.szemely_teljes_neve From szemely y Where y.szemely_id=x.szemely_id) ' +
  'Else (Select y.szervezet_nev From szervezet y Where y.szervezet_id=x.szervezet_id) End) From berlok x Where x.berlo_id=a.berlo_id) as berlo, '+
  '(Select x.berlesjog_neve From berles_jogcime x Where x.berlesjog_id=a.berlesjog_id) as jogcim, '+
  '(Case When b.lakas_id is not null Then (Select x.cim_sor_1 From cim x, l_lakas y Where x.hrsz_id=y.hrsz_id and y.lakas_id=b.lakas_id) '+
  'When b.nem_lakas_id is not null Then (Select x.cim_sor_1 From cim x, b_nem_lakas y Where x.hrsz_id=y.hrsz_id and y.nem_lakas_id=b.nem_lakas_id) '+
  'When b.berl_id is not null Then (Select x.cim_sor_1 x From cim x, berlemeny y Where x.hrsz_id=y.hrsz_id and y.berl_id=b.berl_id) End) as cim '+
  'From szerzodes a, szerzodes_kapocs b Where a.szerz_id = b.szerz_id ';
  if le_ev.Text<>'' then
     SZURES.SQL.Add('and a.szerz_ev='+le_ev.Text+' ');
  if le_szam.Text<>'' then
     SZURES.SQL.Add('and a.szerz_szam='+le_szam.Text+' ');
  if le_berlonev.Text<>'' then
     SZURES.SQL.Add(
      'and ((a.szervezet_id in (Select x.szervezet_id From szervezet x Where x.szervezet_nev like '+
      IDCHAR+'%'+le_berlonev.Text+'%'+IDCHAR+')) or '+
      '(a.szemely_id in (Select x.szemely_id From szemely x Where x.szemely_teljes_neve like '+
      IDCHAR+'%'+le_berlonev.Text+'%'+IDCHAR+'))) ');
  if le_berlemeny.Text<>'' then
     SZURES.SQL.Add(
      'and ('+
      '(b.lakas_id in (Select x.lakas_id From l_lakas x, cim y Where x.hrsz_id=y.hrsz_id and y.cim_sor_1 like '+
      IDCHAR+'%'+le_berlemeny.Text+'%'+IDCHAR+')) or '+
      '(b.nem_lakas_id in (Select x.nem_lakas_id From b_nem_lakas x, cim y Where x.hrsz_id=y.hrsz_id and y.cim_sor_1 like '+
      IDCHAR+'%'+le_berlemeny.Text+'%'+IDCHAR+')) or '+
      '(b.berl_id in (Select x.berl_id From berlemeny x, cim y Where x.hrsz_id=y.hrsz_id and y.cim_sor_1 like '+
      IDCHAR+'%'+le_berlemeny.Text+'%'+IDCHAR+'))) ');
  if vdc_allapot.ItemIndex<>-1 then
      SZURES.SQL.Add('and a.sza_id='+vdc_allapot.Eredmeny+' ');
  if vdc_vonatkozas.ItemIndex<>-1 then
      SZURES.SQL.Add('and a.szv_id='+vdc_vonatkozas.Eredmeny+' ');
  if vdc_berlesjog.ItemIndex<>-1 then
      SZURES.SQL.Add('and a.berlesjog_id='+vdc_berlesjog.Eredmeny+' ');
  if vdc_idoszak.ItemIndex<>-1 then
      SZURES.SQL.Add('and a.szi_id='+vdc_idoszak.Eredmeny+' ');
  if vdc_tipus.ItemIndex<>-1 then
      SZURES.SQL.Add('and a.szt_id='+vdc_tipus.Eredmeny+' ');
  if dtp_mettol.Checked then
  begin
     if dtp_meddig.Checked then
       SZURES.SQL.Add('and a.szerz_mettol between '+IDCHAR+DateToStr(dtp_mettol.Date)+IDCHAR+' and '+IDCHAR+DateToStr(dtp_meddig.Date)+IDCHAR+' ')
     else
     SZURES.SQL.Add('and a.szerz_mettol >= '+IDCHAR+DateToStr(dtp_mettol.Date)+IDCHAR+' ');
  end
  else
    if dtp_meddig.Checked then
       SZURES.SQL.Add('and a.szerz_meddig <= '+IDCHAR+DateToStr(dtp_meddig.Date)+IDCHAR+' ');
  inherited;
end;

procedure Tf_SzerzodesKeres.bb_ujClick(Sender: TObject);
begin
  inherited;
  HIVO:=1;
  AblakNyit(Tf_SzerzodesAdat, TForm(f_SzerzodesAdat));
end;

procedure Tf_SzerzodesKeres.dbg_listaDblClick(Sender: TObject);
begin
  inherited;
  AblakNyit(Tf_SzerzodesAdat, TForm(f_SzerzodesAdat));
end;

procedure Tf_SzerzodesKeres.FormShow(Sender: TObject);
begin
  inherited;
  vdc_tipus.Feltolt;
  vdc_allapot.Feltolt;
  vdc_vonatkozas.Feltolt;
  vdc_berlesjog.Feltolt;
  vdc_idoszak.Feltolt;
end;

procedure Tf_SzerzodesKeres.SZURESAfterScroll(DataSet: TDataSet);
begin
  inherited;
  SZE_ID:=SZURES.FieldByName('szerz_id').AsString;
end;

end.
