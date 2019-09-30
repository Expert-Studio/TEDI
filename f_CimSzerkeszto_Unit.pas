unit f_CimSzerkeszto_Unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AlapAblak_unit, Data.DB, Data.Win.ADODB,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, VDComboBox, Vcl.Grids, Vcl.DBGrids, Alap, AlapFuggveny;

type
  Tf_CimSzerkeszto = class(TAlapAblak)
    Label7: TLabel;
    Label3: TLabel;
    l_irszam: TLabel;
    e_irszam: TEdit;
    Label22: TLabel;
    e_postafiok: TEdit;
    Label11: TLabel;
    e_kerulet: TEdit;
    Label1: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    e_kozterulet: TEdit;
    Label9: TLabel;
    Label6: TLabel;
    Label12: TLabel;
    cb_ervenyes: TCheckBox;
    Label13: TLabel;
    Label10: TLabel;
    dbg_halmaz: TDBGrid;
    e_hazszamtol: TEdit;
    e_betutol: TEdit;
    Label15: TLabel;
    e_hazszamig: TEdit;
    e_betuig: TEdit;
    Label16: TLabel;
    Label8: TLabel;
    e_epulet: TEdit;
    Label14: TLabel;
    e_ajto: TEdit;
    e_kulso: TEdit;
    l_cim1: TLabel;
    l_cim2: TLabel;
    vdc_tipus: TVDComboBox;
    vdc_telepules: TVDComboBox;
    vdc_telepulesresz: TVDComboBox;
    vdc_jelleg: TVDComboBox;
    l_elozo: TLabel;
    vdc_szint: TVDComboBox;
    kozterulet: TDataSource;
    procedure vdc_telepulesExit(Sender: TObject);
    procedure e_kozteruletExit(Sender: TObject);
    procedure vdc_jellegExit(Sender: TObject);
    procedure dbg_halmazDblClick(Sender: TObject);
    procedure e_kozteruletKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbg_halmazKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure e_kozteruletEnter(Sender: TObject);
    procedure bb_ujClick(Sender: TObject);
    procedure bb_felveszClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure e_kozteruletChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_CimSzerkeszto: Tf_CimSzerkeszto;

implementation

{$R *.dfm}

uses AlapAdat;

procedure Tf_CimSzerkeszto.bb_felveszClick(Sender: TObject);
var s, k: String;
    b: Integer;
begin
  b:=BB_BILL;
  PCIM_SOR:='';
  CIM_SOR:='';
  inherited;
  If cb_ervenyes.Checked Then k:='21001231' Else k:=SzerverDat(2);
  If e_irszam.Text<>'' Then s:=e_irszam.Text+' ';
  If vdc_telepules.ItemIndex>0 Then s:=s+vdc_telepules.Text;
  If vdc_telepulesresz.ItemIndex>0 Then s:=s+' ('+vdc_telepulesresz.Text+'), ' Else s:=s+', ';
  If e_kozterulet.Hint<>'' Then
  begin
    CIM_SOR:=CIM_SOR+e_kozterulet.Text+' ';
    If vdc_jelleg.ItemIndex>0 Then CIM_SOR:=CIM_SOR+vdc_jelleg.Text+' ';
    If e_hazszamtol.Text<>'' Then CIM_SOR:=CIM_SOR+e_hazszamtol.Text+'.';
    If e_betutol.Text<>'' Then CIM_SOR:=CIM_SOR+'/'+e_betutol.Text;
    If e_hazszamig.Text<>'' Then CIM_SOR:=CIM_SOR+' - '+e_hazszamig.Text+'.';
    If e_betuig.Text<>'' Then CIM_SOR:=CIM_SOR+'/'+e_betuig.Text;
    If e_epulet.Text<>'' Then CIM_SOR:=CIM_SOR+' '+e_epulet.Text+' ép.';
    If vdc_szint.ItemIndex>0 Then CIM_SOR:=CIM_SOR+' '+vdc_szint.Text;
    If e_ajto.Text<>'' Then CIM_SOR:=CIM_SOR+' '+e_ajto.Text;
  end;
  If e_postafiok.Text<>'' Then
     CIM_SOR:=CIM_SOR+' Pf.:'+e_postafiok.Text;
  PCIM_SOR:=s+CIM_SOR;
  If CIM_SOR<>'' Then
  begin
    If b=1 Then
     CIM_ID:=Beszuras('cim',[
      'cim_tipus_id='+vdc_tipus.Eredmeny,
      'telepules_id='+vdc_telepules.Eredmeny,
      'telepules_resz_id='+vdc_telepulesresz.Eredmeny,
      'iranyitoszam='+e_irszam.Text,
      'postafiok='+e_postafiok.Text,
      'kerulet='+e_kerulet.Text,
      'kozterulet_id='+e_kozterulet.Hint,
      'kjelleg_id='+vdc_jelleg.Eredmeny,
      'epulet='+e_epulet.Text,
      'hazszamtol='+e_hazszamtol.Text,
      'betutol='+e_betutol.Text,
      'hazszamig='+e_hazszamig.Text,
      'betuig='+e_betuig.Text,
      'ajto='+e_ajto.Text,
      'szint_id='+vdc_szint.Eredmeny,
      'SZECS_azo='+e_kulso.Text,
      'cim_sor_1='+CIM_SOR,
      'teljes_cim='+PCIM_SOR,
      'cim_kezdete='+SzerverDat(2),
      'cim_vege='+'21001231'
      ])
    else
    Modositas('cim',[
      'cim_tipus_id='+vdc_tipus.Eredmeny,
      'telepules_id='+vdc_telepules.Eredmeny,
      'telepules_resz_id='+vdc_telepulesresz.Eredmeny,
      'iranyitoszam='+e_irszam.Text,
      'postafiok='+e_postafiok.Text,
      'kerulet='+e_kerulet.Text,
      'kozterulet_id='+e_kozterulet.Hint,
      'kjelleg_id='+vdc_jelleg.Eredmeny,
      'epulet='+e_epulet.Text,
      'hazszamtol='+e_hazszamtol.Text,
      'betutol='+e_betutol.Text,
      'hazszamig='+e_hazszamig.Text,
      'betuig='+e_betuig.Text,
      'ajto='+e_ajto.Text,
      'szint_id='+vdc_szint.Eredmeny,
      'SZECS_azo='+e_kulso.Text,
      'cim_sor_1='+CIM_SOR,
      'teljes_cim='+PCIM_SOR,
      'cim_vege='+k
      ],'cim_id='+CIM_ID);
  end
  else
    Uzenet('Hiányos a cím meghatározása!');
  l_cim1.Caption:=CIM_SOR;
  l_cim2.Caption:=PCIM_SOR;
end;

procedure Tf_CimSzerkeszto.bb_ujClick(Sender: TObject);
var i: Integer;
begin
  inherited;
  CIM_ID:='';
  e_kozterulet.Hint:='';
  for i:=0 to f_CimSzerkeszto.ComponentCount-1 do
  begin
    if (f_CimSzerkeszto.Components[i] is TVDComboBox) then
       (f_CimSzerkeszto.Components[i] as TVDComboBox).ItemIndex:=0
  end;
  vdc_telepules.Ertek('388');
  vdc_jelleg.Ertek('1');
  cb_ervenyes.Checked:=True;
  l_cim1.Caption:='';
  l_cim2.Caption:='';
  If HIVO<>0 Then vdc_tipus.Ertek(IntToStr(HIVO));
  vdc_tipus.SetFocus;
end;

procedure Tf_CimSzerkeszto.dbg_halmazDblClick(Sender: TObject);
begin
  inherited;
  If AlapAdat.AdatModul.ADOQuery3.Active Then
  begin
    inherited;
    If AlapAdat.AdatModul.ADOQuery3.RecordCount>0 Then
    begin
      e_kozterulet.Text:=AlapAdat.AdatModul.ADOQuery3.FieldByNAme('kozterulet_nev').AsString;
      e_kozterulet.Hint:=AlapAdat.AdatModul.ADOQuery3.FieldByNAme('kozterulet_id').AsString;
      vdc_jelleg.SetFocus;
      dbg_halmaz.Visible:=False;
    end;
  end
end;

procedure Tf_CimSzerkeszto.dbg_halmazKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  Case Key of
    VK_RETURN: dbg_halmazDblClick(Self);
    VK_BACK, VK_DELETE:
      begin
        dbg_halmaz.Visible:=False;
        e_kozterulet.SetFocus;
      end;
  End;
end;

procedure Tf_CimSzerkeszto.e_kozteruletChange(Sender: TObject);
begin
  inherited;
  If Length(e_kozterulet.Text) > 0 Then
  begin
    AlapAdat.AdatModul.ADOQuery3.Active:=False;
    AlapAdat.AdatModul.ADOQuery3.SQL.Text:=
      'Select kozterulet_id, kozterulet_nev From kozterulet '+
      'Where kozterulet_nev like '+IDCHAR+e_kozterulet.Text+'%'+IDCHAR+'';
    AlapAdat.AdatModul.ADOQuery3.Active:=True;
    dbg_halmaz.Visible:=True;
  end
  else
    dbg_halmaz.Visible:=False;
end;

procedure Tf_CimSzerkeszto.e_kozteruletEnter(Sender: TObject);
begin
  inherited;
  If e_kozterulet.Text<>'' Then
  begin
    If (e_kozterulet.Hint='') and (e_postafiok.Text='') Then
    begin
      Uzenet('Válasszon közterületet!');
      e_kozterulet.SetFocus;
    end;
  end;
end;

procedure Tf_CimSzerkeszto.e_kozteruletExit(Sender: TObject);
begin
  inherited;
  If vdc_telepules.Eredmeny='null' Then
  begin
    Uzenet('Nem jó a kiválasztás!');
    e_kozterulet.SetFocus;
  end;
end;

procedure Tf_CimSzerkeszto.e_kozteruletKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  Case Key of
    VK_DELETE:
      begin
        dbg_halmaz.Visible:=False;
        e_kozterulet.Text:='';
      end;
    VK_RETURN: dbg_halmazDblClick(Self);
    VK_DOWN, VK_UP:
    begin
      If dbg_halmaz.Visible=False Then dbg_halmaz.Visible:=True;
      dbg_halmaz.SetFocus;
    end;
  End;
end;

procedure Tf_CimSzerkeszto.FormShow(Sender: TObject);
begin
  inherited;
  vdc_tipus.Feltolt;
  vdc_telepules.Feltolt;
  vdc_telepulesresz.Feltolt;
  vdc_jelleg.Feltolt;
  vdc_szint.Feltolt;
end;

procedure Tf_CimSzerkeszto.vdc_jellegExit(Sender: TObject);
begin
  inherited;
  If vdc_jelleg.Eredmeny='null' Then
  begin
    Uzenet('Nem jó a kiválasztás!');
    vdc_jelleg.SetFocus;
  end
  else vdc_jelleg.Text:=vdc_jelleg.Items.Strings[vdc_jelleg.itemIndex];
end;

procedure Tf_CimSzerkeszto.vdc_telepulesExit(Sender: TObject);
begin
  inherited;
  If vdc_telepules.Eredmeny='null' Then
  begin
    Uzenet('Nem jó a kiválasztás!');
    vdc_telepules.SetFocus;
  end
  else vdc_telepules.Text:=vdc_telepules.Items.Strings[vdc_telepules.itemIndex];
end;

end.
