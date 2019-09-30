unit f_SzamlaTetelAdat_Unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AlapAblak_unit, Data.DB, Data.Win.ADODB,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Data.Bind.EngExt, Vcl.Bind.DBEngExt,
  System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Components,
  VDComboBox, Alap, AlapFuggveny;

type
  Tf_SzamlaTetelAdat = class(TAlapAblak)
    le_megnevezes: TLabeledEdit;
    vdc_me: TVDComboBox;
    le_szj: TLabeledEdit;
    le_vonev: TLabeledEdit;
    le_vonho: TLabeledEdit;
    le_egysegar: TLabeledEdit;
    le_mennyiseg: TLabeledEdit;
    Label2: TLabel;
    le_netto: TLabeledEdit;
    vdc_afa: TVDComboBox;
    Label1: TLabel;
    le_afa: TLabeledEdit;
    le_brutto: TLabeledEdit;
    le_megj: TLabeledEdit;
    vdc_dijelem: TVDComboBox;
    Label3: TLabel;
    procedure bb_felveszClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bb_ujClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_SzamlaTetelAdat: Tf_SzamlaTetelAdat;

implementation

{$R *.dfm}

procedure Tf_SzamlaTetelAdat.bb_felveszClick(Sender: TObject);
var s: integer;
begin
  s:=BB_BILL;
  inherited;
  if s=1 then
    SZAMLAT_ID:=Beszuras('szamla_tetel', [
      'szamla_id='+SZAMLA_ID,
      'me_id='+vdc_me.Eredmeny,
      'afa_id='+vdc_afa.Eredmeny,
      'de_id='+vdc_dijelem.Eredmeny,
      'szamlat_menny='+le_mennyiseg.Text,
      'szamlat_ea='+le_egysegar.Text,
      'szamlat_netto'+le_netto.Text,
      'szamlat_afa='+le_afa.Text,
      'szamlat_brutto='+le_brutto.Text,
      'szamlat_mettol='+le_vonev.Text,
      'szamlat_meddig='+le_vonho.Text
    ]);
  if s=2 then
    Modositas('szamla_tetel', [
      'szamla_id='+SZAMLA_ID,
      'me_id='+vdc_me.Eredmeny,
      'afa_id='+vdc_afa.Eredmeny,
      'de_id='+vdc_dijelem.Eredmeny,
      'szamlat_menny='+le_mennyiseg.Text,
      'szamlat_ea='+le_egysegar.Text,
      'szamlat_netto'+le_netto.Text,
      'szamlat_afa='+le_afa.Text,
      'szamlat_brutto='+le_brutto.Text,
      'szamlat_mettol='+le_vonev.Text,
      'szamlat_meddig='+le_vonho.Text
    ],'szamlat_id='+SZAMLAT_ID);
end;

procedure Tf_SzamlaTetelAdat.bb_ujClick(Sender: TObject);
begin
  inherited;
  le_vonev.Text:=SzerverDat(0);
  le_vonev.SetFocus;
end;

procedure Tf_SzamlaTetelAdat.FormShow(Sender: TObject);
begin
  inherited;
  vdc_dijelem.Feltolt;
  vdc_me.Feltolt;
  vdc_afa.Feltolt;
end;

end.
