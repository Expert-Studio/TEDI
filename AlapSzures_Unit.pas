unit AlapSzures_Unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VDComboBox, Alap,
  Alapfuggveny, f_GridMezok_Unit, Data.DB, Data.Win.ADODB, Vcl.Grids, DateUtils,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Registry, Vcl.WinXCtrls;

type
  TAlapSzures = class(TForm)
    Panel1: TPanel;
    bb_kilep: TBitBtn;
    bb_keres: TBitBtn;
    bb_torol: TBitBtn;
    dbg_lista: TDBGrid;
    bb_ok: TBitBtn;
    bb_nyomtat: TBitBtn;
    bb_excel: TBitBtn;
    SZURESds: TDataSource;
    cb_uj: TCheckBox;
    SZURES: TADOQuery;
    bb_uj: TBitBtn;
    LISTA: TADOQuery;
    l_talalat: TLabel;
    l_szumma: TLabel;
    l_kijelolve: TLabel;
    l_jelolt: TLabel;
    p_keres: TPanel;
    ActivityIndicator1: TActivityIndicator;
    bb_csv: TBitBtn;
    procedure bb_kilepClick(Sender: TObject);
    procedure bb_torolClick(Sender: TObject);
    procedure dbg_listaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbg_listaTitleClick(Column: TColumn);
    procedure bb_keresClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bb_ujClick(Sender: TObject);
    procedure dbg_listaDblClick(Sender: TObject);
    procedure bb_excelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbg_listaCellClick(Column: TColumn);
    procedure bb_csvClick(Sender: TObject);
    procedure dbg_listaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AlapSzures: TAlapSzures;

implementation

uses AlapAdat;

{$R *.dfm}

procedure TAlapSzures.bb_csvClick(Sender: TObject);
begin
  try
    CSVKimenet(SZURES, dbg_lista,'A CSV konvertálás megtörtént!');
  except
  on E: Exception do
    begin
      Uzenet('Hiba az adatok kiírásakor!');
      if HibaKuldes(Self.Name, E.ClassName+' hiba üzenettel: '+E.Message ,SZURES.SQL.Text) then
         Uzenet('A hiba továbbításra került a fejlesztõk felé!');
    end;
  end;
end;

procedure TAlapSzures.bb_excelClick(Sender: TObject);
begin
  try
    ExcelKimenet(SZURES, dbg_lista,'Az EXCEL konvertálás megtörtént! Lépjen át a táblázatkezelõbe.');
  except
  on E: Exception do
    begin
      Uzenet('Hiba az adatok kiírásakor!');
      if HibaKuldes(Self.Name, E.ClassName+' hiba üzenettel: '+E.Message ,SZURES.SQL.Text) then
         Uzenet('A hiba továbbításra került a fejlesztõk felé!');
    end;
  end;
end;

procedure TAlapSzures.bb_keresClick(Sender: TObject);
Var
  I, x, y: Integer;
  Tabla, s: String;
  t: TStringList;
  a: TDateTime;
begin
  p_keres.Visible:=True;
  Application.ProcessMessages;
  a := Now;
  s := SZURES.SQL.Text;
  try
    SZURES.Active:=True;
  except
  on E: Exception do
    begin
      Uzenet('Hibás lekérdezés!');
      if HibaKuldes(Self.Name, E.ClassName+' hiba üzenettel: '+E.Message ,SZURES.SQL.Text) then
         Uzenet('A hiba továbbításra került a fejlesztõk felé!');
    end;
  end;
  l_talalat.Enabled:=True;
  l_szumma.Enabled:=True;
  l_szumma.Caption := Helyiertek((Self.SZURES.RecordCount));
  If SZURES.RecordCount > 0 Then
  begin
    bb_excel.Enabled := True;
    bb_nyomtat.Enabled := True;
    bb_ok.Enabled := True;
    cb_uj.Enabled := True;
  end;
  l_szumma.Caption := l_szumma.Caption + ' (' +
    IntToStr(MilliSecondsBetween(Now, a)) + ' ms)';
  bb_torol.Enabled:=True;
  p_keres.Visible:=False;
  Application.ProcessMessages;
end;

procedure TAlapSzures.bb_kilepClick(Sender: TObject);
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  Try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey(RegistryKulcs + Self.Name, True) then
    Begin
      Reg.WriteInteger('Top', Self.Top);
      Reg.WriteInteger('Left', Self.Left);
      Reg.WriteInteger('Width', Self.Width);
      Reg.WriteInteger('Height', Self.Height);
      Reg.WriteInteger('NewWindow', UJ);
    End;
  Except
  End;
  Reg.CloseKey;
  Reg.Free;
  GridAllapotMentes(dbg_lista);
  ModalResult := mrCancel;
  Close;
end;

procedure TAlapSzures.bb_torolClick(Sender: TObject);
var
  I: Integer;
begin
  SZURES.Active := False;
  UresreTorles(Self);
  for I := 0 to ComponentCount - 1 do
    if Components[I] is TVDComboBox then
      (Components[I] as TVDComboBox).ItemIndex := -1;
  bb_ok.Enabled := False;
  cb_uj.Enabled := False;
  bb_excel.Enabled := False;
  bb_nyomtat.Enabled := False;
  bb_torol.Enabled:=False;
  l_talalat.Enabled:=True;
  l_szumma.Enabled:=True;
  l_jelolt.Caption:='';
  l_szumma.Caption:='';
end;

procedure TAlapSzures.bb_ujClick(Sender: TObject);
begin
  UJ := 1;
  HIVO := 1;
end;

procedure TAlapSzures.dbg_listaCellClick(Column: TColumn);
begin
  If dbg_lista.SelectedRows.CurrentRowSelected Then
  begin
     l_kijelolve.Enabled:=True;
     l_jelolt.Enabled:=True;
  end;
  l_jelolt.Caption:=IntToStr(dbg_lista.SelectedRows.Count);
end;

procedure TAlapSzures.dbg_listaDblClick(Sender: TObject);
begin
  if cb_uj.Checked then
    UJ := 1
  else
    UJ := 0;
  HIVO := 0;
end;

procedure TAlapSzures.dbg_listaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  If dbg_lista.SelectedRows.CurrentRowSelected Then
  begin
      dbg_lista.Canvas.Font.Color:=KIJELOLES_SZIN;
  end;
  dbg_lista.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TAlapSzures.dbg_listaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = vk_F12 Then
    GridMezok(dbg_lista);
end;

procedure TAlapSzures.dbg_listaTitleClick(Column: TColumn);
begin
  dbg_TitleClick(dbg_lista, Column);
end;

procedure TAlapSzures.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TAlapSzures.FormCreate(Sender: TObject);
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey(RegistryKulcs + Self.Name, True) then
    Begin
      Self.Top := Reg.ReadInteger('Top');
      Self.Left := Reg.ReadInteger('Left');
      Self.Width := Reg.ReadInteger('Width');
      Self.Height := Reg.ReadInteger('Height');
      UJ := Reg.ReadInteger('NewWindow');
      Self.Position := poDesigned;
    End;
  Except
  end;
  Reg.CloseKey;
  Reg.Free;
  Font.Size := BETUMERET;
  SZURES.Connection := AdatModul.ADOConn;;
  LISTA.Connection := AdatModul.ADOConn;
end;

procedure TAlapSzures.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key = ESC then
    bb_kilepClick(Self);
end;

procedure TAlapSzures.FormShow(Sender: TObject);
var i: Integer;
begin
  p_keres.Visible:=False;
  GridAllapotToltes(dbg_lista);
  bb_excel.Enabled:=False;
  bb_csv.Enabled:=False;
  bb_nyomtat.Enabled:=False;
  bb_ok.Enabled:=False;
  dbg_lista.Font.Name:=BETUTIPUS;
  dbg_lista.TitleFont.Name:=BETUTIPUS;
  For i:=0 to dbg_lista.Columns.Count-1 do
  begin
      dbg_lista.Columns.Items[i].Font.Size:=BETUMERET;
      dbg_lista.Columns.Items[i].Title.Font.Size:=BETUMERET;
      if dbg_lista.Columns.Items[i].Font.Name<>'Wingdings' then
         dbg_lista.Columns.Items[i].Font.Name:=BETUTIPUS;
      dbg_lista.Columns.Items[i].Title.Font.Name:=BETUTIPUS;
  end;
  Application.ProcessMessages;
end;

end.
