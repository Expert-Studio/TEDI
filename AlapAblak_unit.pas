unit AlapAblak_unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  StrUtils, Registry,
  VDComboBox, Alap, AlapFuggveny, Data.DB, Data.Win.ADODB;

type
  TAlapAblak = class(TForm)
    Panel1: TPanel;
    bb_felvesz: TBitBtn;
    bb_uj: TBitBtn;
    bb_modosit: TBitBtn;
    bb_torol: TBitBtn;
    bb_kilep: TBitBtn;
    bb_nyomtat: TBitBtn;
    bb_megsem: TBitBtn;
    LISTA: TADOQuery;
    SZURESds: TDataSource;
    bb_valtozas: TBitBtn;
    bb_email: TBitBtn;
    SZURES: TADOQuery;
    procedure bb_kilepClick(Sender: TObject);
    procedure bb_ujClick(Sender: TObject);
    procedure bb_modositClick(Sender: TObject);
    procedure bb_felveszClick(Sender: TObject);
    procedure bb_megsemClick(Sender: TObject);
    procedure bb_torolClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bb_valtozasClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AlapAblak: TAlapAblak;
  Hibasmezo: String;

implementation

uses AlapAdat;

{$R *.dfm}

Procedure KotelezoKeres(Ablak: TWinControl; Var Uzenet: String;
  Var WC: TWinControl);
Var
  I: Integer;
  S, S2: String;
Begin
  S := '';
  For I := 0 to Ablak.ComponentCount - 1 Do
  Begin
    If (Ablak.Components[I] is TWinControl) Then
    Begin
      If (Ablak.Components[I] is TVDComboBox) Then
        If (Ablak.Components[I] as TVDComboBox).Text = '' Then
          (Ablak.Components[I] as TVDComboBox).Ertek('0');
      If ((Ablak.Components[I] as TWinControl).HelpKeyword = 'k') Or
        (LeftStr((Ablak.Components[I] as TWinControl).HelpKeyword, 2)
        = 'k_') Then
      Begin
        S2 := (Ablak.Components[I] as TWinControl).HelpKeyword;
        delete(S2, 1, 2);
        S2 := S2 + ' ';
        if (Ablak.Components[I] is TEdit) then
          If (Ablak.Components[I] as TEdit).Text = '' Then
            S := S2;
        if (Ablak.Components[I] is TComboBox) then
          If (Ablak.Components[I] as TComboBox).Text = '' Then
            S := S2;
        if (Ablak.Components[I] is TMemo) then
          If (Ablak.Components[I] as TMemo).Text = '' Then
            S := S2;
      End;
      If (Ablak.Components[I] is TFrame) Then
        KotelezoKeres((Ablak.Components[I] as TWinControl), Uzenet, WC);
    End;
    If S <> '' Then
    Begin
      Uzenet := S;
      WC := (Ablak.Components[I] as TWinControl);
      Exit;
    End;
    If Uzenet <> '' Then
      Exit;
  End;
End;

procedure TAlapAblak.bb_felveszClick(Sender: TObject);
Var
  WC: TWinControl;
begin
  Hibasmezo := '';
  KotelezoKeres(Self, Hibasmezo, WC);
  If Hibasmezo <> '' Then
  Begin
    Uzenet(Format(MezoKotelezo, [TrimStr(Hibasmezo)]));
    ActiveControl := WC;
    Abort;
  End;
  BB_BILL := 0;
  bb_felvesz.Enabled := False;
  bb_uj.Enabled := True;
  bb_modosit.Enabled := True;
  bb_valtozas.Enabled := True;
  bb_megsem.Enabled := False;
  bb_torol.Enabled := False;
  Szinvaltas(Self, BB_BILL);
  bb_nyomtat.Enabled := False;
end;

procedure TAlapAblak.bb_kilepClick(Sender: TObject);
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
  If bb_felvesz.Enabled Then
  begin
    If Rakerdez('Elmentetlen adatok vannak az ablakon. Mégis kilépsz?') Then
    begin
      BB_BILL := 0;
      HIVO := 0;
      ModalResult := mrOk;
      Close;
    end;
  end;
  ModalResult := mrCancel;
  Close;
end;

procedure TAlapAblak.bb_megsemClick(Sender: TObject);
begin
  bb_felvesz.Enabled := False;
  bb_uj.Enabled := True;
  bb_modosit.Enabled := True;
  bb_valtozas.Enabled := True;
  bb_megsem.Enabled := False;
  bb_torol.Enabled := False;
  If BB_BILL = 1 Then
    UresreTorles(Self);
  BB_BILL := 0;
  Szinvaltas(Self, BB_BILL);
end;

procedure TAlapAblak.bb_modositClick(Sender: TObject);
begin
  BB_BILL := 2;
  bb_felvesz.Enabled := True;
  bb_uj.Enabled := False;
  bb_modosit.Enabled := False;
  bb_valtozas.Enabled:=False;
  bb_megsem.Enabled := True;
  bb_torol.Enabled := True;
  Szinvaltas(Self, BB_BILL);
end;

procedure TAlapAblak.bb_torolClick(Sender: TObject);
begin
  BB_BILL := 0;
  bb_felvesz.Enabled := False;
  bb_uj.Enabled := True;
  bb_modosit.Enabled := True;
  bb_valtozas.Enabled := True;
  bb_megsem.Enabled := False;
  bb_torol.Enabled := False;
  UresreTorles(Self);
  Szinvaltas(Self, BB_BILL);
end;

procedure TAlapAblak.bb_ujClick(Sender: TObject);
begin
  BB_BILL := 1;
  bb_felvesz.Enabled := True;
  bb_uj.Enabled := False;
  bb_modosit.Enabled := False;
  bb_valtozas.Enabled:=False;
  bb_megsem.Enabled := True;
  bb_torol.Enabled := True;
  UresreTorles(Self);
  Szinvaltas(Self, BB_BILL);
end;

procedure TAlapAblak.bb_valtozasClick(Sender: TObject);
begin
  BB_BILL := 3;
  bb_felvesz.Enabled := True;
  bb_uj.Enabled := False;
  bb_modosit.Enabled := False;
  bb_megsem.Enabled := True;
  bb_torol.Enabled := True;
  bb_valtozas.Enabled:=False;
  Szinvaltas(Self, BB_BILL);
end;

procedure TAlapAblak.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TAlapAblak.FormCreate(Sender: TObject);
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
end;

procedure TAlapAblak.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key = ESC then
    Close;
end;

procedure TAlapAblak.FormShow(Sender: TObject);
begin
  bb_megsemClick(Self);
  SZURES.Active := False;
end;

end.
