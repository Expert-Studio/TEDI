unit f_Admin_Unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Alap, AlapAblak_unit, Data.DB, Vcl.Controls,
  Vcl.StdCtrls, VDComboBox, Vcl.Grids, Vcl.DBGrids, Vcl.Dialogs, Vcl.ComCtrls,
  Data.Win.ADODB, Vcl.Buttons, Vcl.ExtCtrls, AlapFuggveny, ShellAPI;

type
  Tf_Admin = class(TAlapAblak)
    pc_rendszer: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    e_ir: TEdit;
    Edit3: TEdit;
    TabSheet3: TTabSheet;
    Edit2: TEdit;
    Edit4: TEdit;
    od: TOpenDialog;
    bb_csatolmany: TBitBtn;
    Label5: TLabel;
    e_nev: TEdit;
    dbg_lista: TDBGrid;
    p_szures: TPanel;
    TabSheet4: TTabSheet;
    Label711: TLabel;
    dbg_kodtabla: TDBGrid;
    vdc_kodtabla: TVDComboBox;
    ADO: TADOTable;
    ADOds: TDataSource;
    procedure bb_csatolmanyClick(Sender: TObject);
    procedure vdc_kodtablaChange(Sender: TObject);
    procedure pc_rendszerChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bb_felveszClick(Sender: TObject);
    procedure bb_kilepClick(Sender: TObject);
    procedure SZURESAfterScroll(DataSet: TDataSet);
    procedure dbg_listaDblClick(Sender: TObject);
  private
    { Private declarations }
    SZM_ID: String;
  public
    { Public declarations }
  end;

var
  f_Admin: Tf_Admin;

implementation

{$R *.dfm}

procedure Tf_Admin.bb_csatolmanyClick(Sender: TObject);
begin
  inherited;
  If od.Execute Then
  begin
    p_szures.Visible:=True;
//    Modositas('szerzodes_minta',['szm_nev = '+ExtractFilename(od.FileName)],'szm_id='+SZM_ID);
    LISTA.SQL.Text:='Update szerzodes_minta set szm_tartalom = :dok Where szm_id='+SZM_ID;
    LISTA.Parameters.ParamByName('dok').LoadFromFile(od.FileName,ftBlob);
    LISTA.ExecSQL;
    p_szures.Visible:=False;
  end;
  SZURES.Active:=False;
  SZURES.Active:=True;
  bb_megsemClick(Self);
end;

procedure Tf_Admin.bb_felveszClick(Sender: TObject);
begin
  case pc_rendszer.ActivePageIndex of
  2:
  begin
    if BB_BILL=1 then
       Beszuras('szerzodes_minta',[
        'szm_nev='+e_nev.Text,
        'szm_mettol='+SzerverDat(2),
        'szm_meddig='+StrDate(MAXDAT)
       ]);
    inherited;
    SZURES.SQL.Text:=
      'Select *, (case when szm_meddig>getdate() Then 1 Else 0 End) as ervenyes, '+
      '(Case When szm_tartalom is not null Then 1 Else 0 End) as tartalom '+
      'From szerzodes_minta';
    SZURES.Active:=True;
  end;
  end;
end;

procedure Tf_Admin.bb_kilepClick(Sender: TObject);
begin
  inherited;
  GridAllapotMentes(dbg_lista);
  GridAllapotMentes(dbg_kodtabla);
end;

procedure Tf_Admin.dbg_listaDblClick(Sender: TObject);
begin
  inherited;
  p_szures.Visible:=True;
  LISTA.Active:=False;
  LISTA.SQL.Text:='Select szm_tartalom, szm_nev From szerzodes_minta Where szm_id='+SZM_ID;
  LISTA.Active:=True;
  TBlobField(LISTA.FieldByName('szm_tartalom')).SaveToFile(MEGOSZTAS +'aa_'+LISTA.FieldByName('szm_nev').AsString);
  ShellExecute(f_Admin.Handle,'Open',PChar(MEGOSZTAS +'aa_'+LISTA.FieldByName('szm_nev').AsString), NIL, NIL,SW_SHOW);
  p_szures.Visible:=False;
end;

procedure Tf_Admin.FormShow(Sender: TObject);
begin
  inherited;
  pc_rendszer.ActivePageIndex:=0;
  GridAllapotToltes(dbg_lista);
  GridAllapotToltes(dbg_kodtabla);
end;

procedure Tf_Admin.pc_rendszerChange(Sender: TObject);
begin
  inherited;
  case pc_rendszer.ActivePageIndex of
  2:
    begin
      SZURES.SQL.Text:=
      'Select *, (case when szm_meddig>getdate() Then 1 Else 0 End) as ervenyes, '+
      '(Case When szm_tartalom is not null Then 1 Else 0 End) as tartalom '+
      'From szerzodes_minta';
      SZURES.Active:=True;
    end;
  3:
    begin
      vdc_kodtabla.Feltolt;
      vdc_kodtabla.Enabled:=True;
    end;
  end;
end;

procedure Tf_Admin.SZURESAfterScroll(DataSet: TDataSet);
begin
  inherited;
  case pc_rendszer.ActivePageIndex of
  2: SZM_ID:=SZURES.FieldByName('szm_id').AsString;
  end;
end;

procedure Tf_Admin.vdc_kodtablaChange(Sender: TObject);
Var S: String;
    i: Integer;
begin
  LISTA.SQL.Text:='Select kodtabla_nev From kodtabla Where kodtabla_id='+vdc_kodtabla.Eredmeny;
  LISTA.Active:=True;
  ADO.Active:=False;
  ADO.TableName:=LISTA.FieldByName('kodtabla_nev').AsString;
  i:=0;
  dbg_kodtabla.Columns.Clear;
  For i:=0 to ADO.FieldCount-1 do
  Begin
    dbg_kodtabla.Columns.Add;
    dbg_kodtabla.Columns[i].FieldName:=ADO.Fields[i].Name;
    dbg_kodtabla.Columns[i].Width:=300;
  End;
  ADO.Active:=True;
  Szures.Active:=False;
end;

end.
