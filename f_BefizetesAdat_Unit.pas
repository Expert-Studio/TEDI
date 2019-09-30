unit f_BefizetesAdat_Unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AlapAblak_unit, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Data.Win.ADODB, Vcl.Buttons, Alap,
  Alapfuggveny;

type
  Tf_BefizetesAdat = class(TAlapAblak)
    LabeledEdit7: TLabeledEdit;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    dbg_lista: TDBGrid;
    dbg_egyenleg: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    LISTAds: TDataSource;
    LabeledEdit2: TLabeledEdit;
    bb_szemely: TBitBtn;
    bb_szerv: TBitBtn;
    procedure SpeedButton1Click(Sender: TObject);
    procedure bb_kilepClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_BefizetesAdat: Tf_BefizetesAdat;

implementation

{$R *.dfm}

procedure Tf_BefizetesAdat.bb_kilepClick(Sender: TObject);
begin
  inherited;
  GridAllapotMentes(dbg_lista);
  GridAllapotMentes(dbg_egyenleg);
end;

procedure Tf_BefizetesAdat.FormShow(Sender: TObject);
begin
  inherited;
  GridAllapotToltes(dbg_lista);
  GridAllapotToltes(dbg_egyenleg);
end;

procedure Tf_BefizetesAdat.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if Rakerdez('Biztos hogy a tételt a bérlõhöz rendeled?') then

end;

end.
