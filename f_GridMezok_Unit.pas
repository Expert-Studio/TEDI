unit f_GridMezok_Unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, CheckLst, dbgrids, Registry, ExtCtrls, Alapfuggveny;

type
  Tf_GridMezok = class(TForm)
    Panel1: TPanel;
    bb_Kilep: TBitBtn;
    sb_Fel: TSpeedButton;
    clb_Mezolista: TCheckListBox;
    sb_Le: TSpeedButton;
    sb_elore: TSpeedButton;
    sb_hatra: TSpeedButton;
    sb_mindbe: TSpeedButton;
    sb_mindki: TSpeedButton;
    e_szel: TEdit;
    procedure FormShow(Sender: TObject);
    procedure clb_MezolistaClick(Sender: TObject);
    procedure sb_FelClick(Sender: TObject);
    procedure sb_LeClick(Sender: TObject);
    procedure sb_eloreClick(Sender: TObject);
    procedure sb_hatraClick(Sender: TObject);
    procedure sb_mindbeClick(Sender: TObject);
    procedure sb_mindkiClick(Sender: TObject);
    procedure e_szelChange(Sender: TObject);
    procedure clb_MezolistaClickCheck(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Grid: TDBGrid;
  end;

Procedure GridMezok(Grid: TDBGrid);

var
  f_GridMezok: Tf_GridMezok;

implementation

{$R *.DFM}

Procedure GridMezok(Grid: TDBGrid);
Var
  Reg: TRegistry;
  I: Integer;
  GridReg: String;
  F: TWinControl;
  Sorrend: Array [0 .. 50] Of TColumn;
Begin
  FillChar(Sorrend, SizeOf(Sorrend), 0);
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    F := Grid;
    While Not(F is TForm) Do
      F := F.Parent;
    GridReg := '\Software\Expert\Ablakok\' + F.Name + '\' + Grid.Name;
    if Reg.OpenKey(GridReg, True) then
    Begin
      For I := 0 To Grid.Columns.Count - 1 Do
      Begin
        if Reg.OpenKey(GridReg + '\' + Grid.Columns[I].FieldName, True) then
        Begin
          Try
            Grid.Columns[I].Visible := Reg.ReadBool('Visible');
            Sorrend[Reg.ReadInteger('Index')] := Grid.Columns[I];
            Grid.Columns[I].Width := Reg.ReadInteger('Width');
          Except
          End;
        End;
      End;
      I := 0;
      While Sorrend[I] <> nil Do
      Begin
        Sorrend[I].Index := Grid.Columns.Count - 1;
        Inc(I);
      End;
    End; { }
  Except
  end;

  f_GridMezok := Tf_GridMezok.Create(Grid.Parent);
  f_GridMezok.Grid := Grid;
  f_GridMezok.ShowModal;
  FreeAndNil(f_GridMezok);

  Try
    For I := 0 To Grid.Columns.Count - 1 Do
    Begin
      if Reg.OpenKey(GridReg + '\' + Grid.Columns[I].FieldName, True) then
      Begin
        Reg.WriteBool('Visible', Grid.Columns[I].Visible);
        Reg.WriteInteger('Index', Grid.Columns[I].Index);
        Reg.WriteInteger('Width', Grid.Columns[I].Width);
      End;
    End;
  Finally
    Reg.CloseKey;
    Reg.Free;
  End;
End;

procedure Tf_GridMezok.clb_MezolistaClickCheck(Sender: TObject);
begin
  Grid.Columns[clb_Mezolista.ItemIndex].Visible:=clb_Mezolista.Checked[clb_Mezolista.ItemIndex];
end;

procedure Tf_GridMezok.e_szelChange(Sender: TObject);
begin
  If e_szel.Text<>'' Then
     Grid.Columns[clb_Mezolista.ItemIndex].Width:=StrToInt(e_szel.Text);
end;

procedure Tf_GridMezok.FormShow(Sender: TObject);
Var
  I: Integer;
begin
  f_GridMezok.Font.Size := BETUMERET;
  clb_Mezolista.Font.Size := BETUMERET;
  clb_Mezolista.Items.Clear;
  For I := 0 To Grid.Columns.Count - 1 Do
  Begin
    clb_Mezolista.Items.Add(Grid.Columns[I].Title.Caption);
    clb_Mezolista.Checked[I] := Grid.Columns[I].Visible;
  End;
  clb_Mezolista.ItemIndex := 0;
end;

procedure Tf_GridMezok.clb_MezolistaClick(Sender: TObject);
begin
  e_szel.Text:=IntToStr(Grid.Columns[clb_Mezolista.ItemIndex].Width);
end;

procedure Tf_GridMezok.sb_FelClick(Sender: TObject);
Var
  I: Integer;
begin
  I := clb_Mezolista.ItemIndex - 1;
  If I < 0 Then Exit;
  Grid.Columns[clb_Mezolista.ItemIndex].Index := clb_Mezolista.ItemIndex - 1;
  clb_Mezolista.Items.Move(clb_Mezolista.ItemIndex, clb_Mezolista.ItemIndex - 1);
  ActiveControl := clb_Mezolista;
  clb_Mezolista.ItemIndex := I;
end;

procedure Tf_GridMezok.sb_LeClick(Sender: TObject);
Var
  I: Integer;
begin
  I := clb_Mezolista.ItemIndex + 1;
  If I = clb_Mezolista.Items.Count Then Exit;
  Grid.Columns[clb_Mezolista.ItemIndex].Index := clb_Mezolista.ItemIndex + 1;
  clb_Mezolista.Items.Move(clb_Mezolista.ItemIndex, clb_Mezolista.ItemIndex + 1);
  ActiveControl := clb_Mezolista;
  clb_Mezolista.ItemIndex := I;
end;

procedure Tf_GridMezok.sb_eloreClick(Sender: TObject);
begin
  Grid.Columns[clb_Mezolista.ItemIndex].Index := 0;
  clb_Mezolista.Items.Move(clb_Mezolista.ItemIndex, 0);
  ActiveControl := clb_Mezolista;
  clb_Mezolista.ItemIndex := 0;
end;

procedure Tf_GridMezok.sb_hatraClick(Sender: TObject);
begin
  If clb_Mezolista.ItemIndex + 1 = clb_Mezolista.Items.Count Then Exit;
  Grid.Columns[clb_Mezolista.ItemIndex].Index := clb_Mezolista.Items.Count - 1;
  clb_Mezolista.Items.Move(clb_Mezolista.ItemIndex, clb_Mezolista.Items.Count - 1);
  ActiveControl := clb_Mezolista;
  clb_Mezolista.ItemIndex := clb_Mezolista.Items.Count - 1;
end;

procedure Tf_GridMezok.sb_mindbeClick(Sender: TObject);
var
  I: Integer;
begin
  For I := 0 to clb_Mezolista.Items.Count - 1 do
    clb_Mezolista.Checked[I] := True;
end;

procedure Tf_GridMezok.sb_mindkiClick(Sender: TObject);
var
  I: Integer;
begin
  For I := 0 to clb_Mezolista.Items.Count - 1 do
    clb_Mezolista.Checked[I] := False;
end;

end.
