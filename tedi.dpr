program tedi;



uses
  Vcl.Forms,
  SysUtils,
  IniFiles,
  Vcl.Themes,
  Vcl.Styles,
  Alap in 'Alap.pas',
  AlapAblak_unit in 'AlapAblak_unit.pas' {AlapAblak},
  AlapAdat in 'AlapAdat.pas' {AdatModul: TDataModule},
  AlapFuggveny in 'AlapFuggveny.pas',
  AlapSzures_Unit in 'AlapSzures_Unit.pas' {AlapSzures},
  f_Admin_Unit in 'f_Admin_Unit.pas' {f_Admin},
  f_BefizetesAdat_Unit in 'f_BefizetesAdat_Unit.pas' {f_BefizetesAdat},
  f_BefizetesSzures_Unit in 'f_BefizetesSzures_Unit.pas' {f_BefizetesSzures},
  f_BerlemenyAdat_Unit in 'f_BerlemenyAdat_Unit.pas' {f_BerlemenyAdat},
  f_BerlemenyKereses_Unit in 'f_BerlemenyKereses_Unit.pas' {f_BerlemenyKereses},
  f_BerloAdatSzemely_Unit in 'f_BerloAdatSzemely_Unit.pas' {f_BerloAdatSzemely},
  f_BerloKeres_Unit in 'f_BerloKeres_Unit.pas' {f_BerloKeres},
  f_Foablak_Unit in 'f_Foablak_Unit.pas' {f_Foablak},
  f_GridMezok_Unit in 'f_GridMezok_Unit.pas' {f_GridMezok},
  f_Indito_Unit in 'f_Indito_Unit.pas' {f_Indito},
  f_PenztarBefizetes_Unit in 'f_PenztarBefizetes_Unit.pas' {f_PenztarBefizetes},
  f_Reszletfizetes_Unit in 'f_Reszletfizetes_Unit.pas' {f_Reszletfizetes},
  f_ReszletfizetesSzures_Unit in 'f_ReszletfizetesSzures_Unit.pas' {f_ReszletfizetesSzures},
  f_SzamlaAdat_Unit in 'f_SzamlaAdat_Unit.pas' {f_SzamlaAdat},
  f_SzamlaKeres_Unit in 'f_SzamlaKeres_Unit.pas' {f_SzamlaKeres},
  f_SzamlaTetelAdat_Unit in 'f_SzamlaTetelAdat_Unit.pas' {f_SzamlaTetelAdat},
  f_SzerzodesAdat_Unit in 'f_SzerzodesAdat_Unit.pas' {f_SzerzodesAdat},
  f_SzerzodesKeres_Unit in 'f_SzerzodesKeres_Unit.pas' {f_SzerzodesKeres},
  f_TamogatasAdat_Unit in 'f_TamogatasAdat_Unit.pas' {f_TamogatasAdat},
  f_TamogatasSzures_Unit in 'f_TamogatasSzures_Unit.pas' {f_TamogatasSzures},
  f_LakasKeres_unit in 'f_LakasKeres_unit.pas' {f_LakasKeres},
  f_SzemelyKeres_Unit in 'f_SzemelyKeres_Unit.pas' {f_SzemelyKeres},
  f_SzervezetKeres_Unit in 'f_SzervezetKeres_Unit.pas' {f_SzervezetKeres},
  f_PenztarKeres_Unit in 'f_PenztarKeres_Unit.pas' {f_PenztarKeres},
  f_SzamelyAdat_Unit in 'f_SzamelyAdat_Unit.pas' {f_SzamelyAdat},
  f_EleresAdat_Unit in 'f_EleresAdat_Unit.pas' {f_EleresAdat},
  f_CimSzerkeszto_Unit in 'f_CimSzerkeszto_Unit.pas' {f_CimSzerkeszto},
  f_BerloKivalasztas_Unit in 'f_BerloKivalasztas_Unit.pas' {f_BerloKivalasztas},
  f_SzervezetAdat_Unit in 'f_SzervezetAdat_Unit.pas' {f_SzervezetAdat},
  f_AdatMigracio_Unit in 'f_AdatMigracio_Unit.pas' {f_AdatMigracio},
  f_LakasAdat_Unit in 'f_LakasAdat_Unit.pas' {f_LakasAdat},
  f_HelyisegKeres_Unit in 'f_HelyisegKeres_Unit.pas' {f_HelyisegKeres},
  f_EgyebKeres_Unit in 'f_EgyebKeres_Unit.pas' {f_EgyebKeres};

{$R *.res}

Function AblakNyit(TF: TFormClass; F: TForm): Integer;
Begin
  F := TF.Create(Application);
  try
    result := F.ShowModal;
  finally
    F.Free;
    F := Nil;
  end;
End;

Var
  Ini: TIniFile;

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Luna');
  Application.CreateForm(TAdatModul, AdatModul);
  Application.CreateForm(Tf_Foablak, f_Foablak);
  if Not FileExists(ExtractFilePath(ParamStr(0)) + 'tedi.ini') Then
  Begin
    Uzenet('Nem találom a program futtatásához szükséges tedi.ini fájlt! A program futása leáll.');
    Application.Terminate;
    Halt;
  End;

  Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'tedi.ini');
  If Ini.ReadString('Futtatas', 'Adatbazis szerver', '') = '' Then
  Begin
    Ini.Destroy;
    Application.Terminate;
    Halt;
  End;
  try
//    ADOConnection := AdatModul.ADOConn;
    // Application.Run;
    If AblakNyit(Tf_Indito, f_Indito) = 19780712 Then
    Begin
      // form_Hibakezeles.InitFileParam(ChangeFileExt(paramstr(0), '.ini'));
      // Hibakezeles.Adatbazis:=Adatmodul.ADOConn;
      Application.Run;
    End
    Else
    begin
      Application.Terminate;
      Halt;
    end;
  except
  end;

end.
