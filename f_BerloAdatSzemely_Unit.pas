unit f_BerloAdatSzemely_Unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AlapAblak_unit, Vcl.StdCtrls,
  Alap, AlapFuggveny,
  Vcl.ComCtrls, Vcl.ExtCtrls, Data.DB, Data.Win.ADODB, Vcl.Buttons, Vcl.Mask,
  Vcl.Grids, Vcl.DBGrids, NumberEdit;

type
  Tf_BerloAdatSzemely = class(TAlapAblak)
    le_berlonev: TLabeledEdit;
    le_kod: TLabeledEdit;
    dtp_mettol: TDateTimePicker;
    dtp_meddig: TDateTimePicker;
    Label1: TLabel;
    Meddig: TLabel;
    le_anyja: TLabeledEdit;
    dtp_szul: TDateTimePicker;
    Label2: TLabel;
    pc_berlo: TPageControl;
    Befizetés: TTabSheet;
    Számla: TTabSheet;
    Egyenleg: TTabSheet;
    dbg_szamla: TDBGrid;
    Támogatás: TTabSheet;
    Részletfizetés: TTabSheet;
    dbg_befizetes: TDBGrid;
    ts_berlotars: TTabSheet;
    ts_doksi: TTabSheet;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    dbg_szerzodes: TDBGrid;
    LISTAds: TDataSource;
    le_cim: TLabeledEdit;
    bb_pdf: TBitBtn;
    dbg_egyenleg: TDBGrid;
    dbg_tamogatas: TDBGrid;
    dbg_reszlet: TDBGrid;
    dbg_berlotars: TDBGrid;
    dbg_dokumentum: TDBGrid;
    dbg_esemeny: TDBGrid;
    procedure bb_emailClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure pc_berloChange(Sender: TObject);
    procedure bb_pdfClick(Sender: TObject);
    procedure dbg_szerzodesDblClick(Sender: TObject);
    procedure dbg_szamlaDblClick(Sender: TObject);
    procedure LISTAAfterScroll(DataSet: TDataSet);
    procedure bb_kilepClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_BerloAdatSzemely: Tf_BerloAdatSzemely;

implementation

{$R *.dfm}

uses f_CimSzerkeszto_Unit, f_SzamlaAdat_Unit, f_SzerzodesAdat_Unit;

procedure Tf_BerloAdatSzemely.bb_emailClick(Sender: TObject);
begin
  inherited;
  if EmailKuldes('altmann.attila@upcmail.hu','Tedi','altmann.attila@upcmail.hu','','','Próba','Levél', []) Then
     Uzenet('Üzenet sikeresen elküldve!')
  Else
     Uzenet('Hiba az üzenet küldésekor!');
end;

procedure Tf_BerloAdatSzemely.bb_kilepClick(Sender: TObject);
begin
  inherited;
  GridAllapotMentes(dbg_szerzodes);
  GridAllapotMentes(dbg_szamla);
  GridAllapotMentes(dbg_befizetes);
  GridAllapotMentes(dbg_egyenleg);
  GridAllapotMentes(dbg_tamogatas);
  GridAllapotMentes(dbg_reszlet);
  GridAllapotMentes(dbg_berlotars);
  GridAllapotMentes(dbg_dokumentum);
  GridAllapotMentes(dbg_esemeny);
end;

procedure Tf_BerloAdatSzemely.bb_pdfClick(Sender: TObject);
begin
  inherited;
  AblakNyit(Tf_CimSzerkeszto,TForm(f_CimSzerkeszto));
  //BB_BILL:=i;
  If CIM_ID<>'' Then le_cim.Text:=PCIM_SOR;
end;

procedure Tf_BerloAdatSzemely.dbg_szamlaDblClick(Sender: TObject);
begin
  inherited;
  AblakNyit(Tf_SzamlaAdat, TForm(f_SzamlaAdat));
end;

procedure Tf_BerloAdatSzemely.dbg_szerzodesDblClick(Sender: TObject);
begin
  inherited;
  AblakNyit(Tf_SzerzodesAdat, TForm(f_SzerzodesAdat));
end;

procedure Tf_BerloAdatSzemely.FormActivate(Sender: TObject);
begin
  inherited;
  SZURES.Active:=False;
  SZURES.Parameters.ParamByName('berlo_id').Value:=BERLO_ID;
  SZURES.Active:=True;
  le_berlonev.Text:=SZURES.FieldByName('szemely').AsString;
  le_anyja.Text:=SZURES.FieldByName('anyja').AsString;
  le_kod.Text:=SZURES.FieldByName('kod').AsString;
  dtp_szul.Date:=SZURES.FieldByName('szdat').AsDateTime;
  dtp_mettol.Date:=SZURES.FieldByName('berles_kezdet_datuma').AsDateTime;
  dtp_meddig.Date:=SZURES.FieldByName('berles_vege_datuma').AsDateTime;
end;

procedure Tf_BerloAdatSzemely.FormShow(Sender: TObject);
begin
  inherited;
  GridAllapotToltes(dbg_szerzodes);
  GridAllapotToltes(dbg_szamla);
  GridAllapotToltes(dbg_befizetes);
  GridAllapotToltes(dbg_egyenleg);
  GridAllapotToltes(dbg_tamogatas);
  GridAllapotToltes(dbg_reszlet);
  GridAllapotToltes(dbg_berlotars);
  GridAllapotToltes(dbg_dokumentum);
  GridAllapotToltes(dbg_esemeny);
end;

procedure Tf_BerloAdatSzemely.LISTAAfterScroll(DataSet: TDataSet);
begin
  inherited;
  case pc_berlo.ActivePageIndex of
    0:
      begin
        SZE_ID:=LISTA.FieldByName('szerz_id').AsString;
      end;
  end;
end;

procedure Tf_BerloAdatSzemely.pc_berloChange(Sender: TObject);
begin
  inherited;
  case pc_berlo.ActivePageIndex of
    0:
      begin
        LISTA.SQL.Text:=
          'Select a.*, '+
          '(Select x.szt_nev From szerzodes_tipus x Where x.szt_id=a.szt_id) as tipus, '+
          '(Select x.berlesjog_neve From berles_jogcime x Where x.berlesjog_id=a.berlesjog_id) as jogcim '+
          'From szerzodes a, szerzodes_kapocs b Where a.szerz_id = b.szerz_id ';
        LISTA.Active:=True;
      end;
    1:
      begin
        LISTA.SQL.Text:=
          'Select a.*, '+
          '(Select x.szt_nev From szerzodes_tipus x Where x.szt_id=a.szt_id) as tipus, '+
          '(Select x.berlesjog_neve From berles_jogcime x Where x.berlesjog_id=a.berlesjog_id) as jogcim '+
          'From szerzodes a, szerzodes_kapocs b Where a.szerz_id = b.szerz_id ';
        LISTA.Active:=True;
      end;
  end;
end;

end.
