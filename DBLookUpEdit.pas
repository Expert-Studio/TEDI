unit DBLookUpEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db;

type
  TDBLookUpEdit = class(TEdit)
  private
    { Private declarations }
    FName : String;
    AName : String;
    Eredm : String;
    DS: TDataSource;
  protected
    { Protected declarations }
    Procedure KeyUp(Sender: TObject; Var Key: Word; Shift: TShiftState);
  public
    { Public declarations }
    Constructor Create(AOwner: TComponent); Override;
  published
    { Published declarations }
    property DataSource : TDataSource read DS write DS;
    property FieldName  : string read FName write Fname;
    property Azonosito  : string read AName write Aname;
    property Eredmeny   : string read Eredm write Eredm;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Data Controls', [TDBLookUpEdit]);
end;

constructor TDBLookUpEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  OnKeyUp:= KeyUp;
end;

Procedure TDBLookUpEdit.KeyUp;
 Var RSz, HRSz: String;
     A: Byte;
 Begin
   Try
     Case key Of
       32..36,
       41..250: Begin
                   RSz:=Text;
                   SetLength(RSz,length(Text)-length(SelText));
                   DS.DataSet.Locate(FName, Text, [loCaseInsensitive, loPartialKey]);
                   HRSz:=DS.DataSet.FieldByName(FName).AsString;
                   A:=SelStart;
                   If Pos(RSz,Hrsz)=1 Then Begin
                      delete(Hrsz,1,Length(RSz));
                      If SelStart<>Length(RSz) Then SelStart:=Length(RSz);
                      SelText:=HRSz;
                   End;
                   SelStart:=A;
                   SelLength:=Length(Text)-Length(RSz);
                End;
       Vk_Down  : Begin
                     DS.DataSet.Next;
                     Text:=DS.DataSet.FieldByName(FName).AsString;
                   End;
       Vk_Up    : Begin
                     DS.DataSet.Prior;
                     Text:=DS.DataSet.FieldByName(FName).AsString;
                   End;
//       Vk_Delete        : Text:='';
     End;
     Try Eredm:=DS.DataSet.FieldByName(AName).AsString; Except End;
   Except End;
 End;

end.
