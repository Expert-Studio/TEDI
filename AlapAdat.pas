unit AlapAdat;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TAdatModul = class(TDataModule)
    ADOConn: TADOConnection;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AdatModul: TAdatModul;

implementation

{$R *.dfm}

end.
