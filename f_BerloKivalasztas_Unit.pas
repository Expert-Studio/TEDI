unit f_BerloKivalasztas_Unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AlapSzures_Unit, Data.DB, Vcl.StdCtrls,
  Vcl.ExtCtrls, Data.Win.ADODB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Alap, AlapFuggveny,
  Vcl.WinXCtrls;

type
  Tf_BerloKivalasztas = class(TAlapSzures)
    rg_tipus: TRadioGroup;
    le_nev: TLabeledEdit;
    procedure bb_keresClick(Sender: TObject);
    procedure bb_kilepClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_BerloKivalasztas: Tf_BerloKivalasztas;

implementation

{$R *.dfm}

procedure Tf_BerloKivalasztas.bb_keresClick(Sender: TObject);
begin
  if rg_tipus.ItemIndex<0 then
  begin
     Uzenet('Nincs kiválasztva típus!');
     Exit;
  end;
  case rg_tipus.ItemIndex of
  0:
    begin
      SZURES.SQL.Text:='Select a.szemely_id as id, a.szemely_teljes_neve as berlo, '+
      'a.anyja_neve, a.szuletesi_hely, a.szuletesi_datum '+
      'From szemely a Where a.szemely_id > 0';
      if le_nev.Text<>'' then
         SZURES.SQL.Add('and a.szemely_teljes_neve like'+IDCHAR+'%'+le_nev.Text+'%'+IDCHAR+' ');
    end;
  1,2:
    begin
      SZURES.SQL.Text:='Select a.szervezet_id as id, a.szervezet_nev as berlo, '+
      'a.adoszam, a.bankszamlaszam '+
      'From szervezet a Where a.szervezet_id > 0';
      if le_nev.Text<>'' then
         SZURES.SQL.Add('and a.szervezet_nev like'+IDCHAR+'%'+le_nev.Text+'%'+IDCHAR+' ');
    end;
  end;

  inherited;
end;

procedure Tf_BerloKivalasztas.bb_kilepClick(Sender: TObject);
begin
  case rg_tipus.ItemIndex of
  0:
    begin
      SZEM_ID:=SZURES.FieldByName('id').AsString;
      SZEM_ANYJA:=SZURES.FieldByName('anyja_neve').AsString;
      SZEM_SZH:=SZURES.FieldByName('szuletesi_hely').AsString;
      SZEM_SZD:=SZURES.FieldByName('szuletesi_datum').AsString;
    end;
  1,2:
    begin
      SZER_ID:=SZURES.FieldByName('id').AsString;
      SZER_ADO:=SZURES.FieldByName('adoszam').AsString;
      SZER_BSZ:=SZURES.FieldByName('bankszamlaszam').AsString;
    end;
  end;
  BERLO:=SZURES.FieldByName('berlo').AsString;
  inherited;
end;

end.
