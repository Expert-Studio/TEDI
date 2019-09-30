inherited form_LakasKeres: Tform_LakasKeres
  Left = 450
  Top = 19
  Width = 800
  Height = 537
  Caption = 'Lak'#225's keres'#233's'
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 16
    Top = 20
    Width = 59
    Height = 13
    Caption = 'K'#246'zter'#252'let'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel [1]
    Left = 16
    Top = 42
    Width = 62
    Height = 13
    Caption = 'Tulajdonos'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel [2]
    Left = 16
    Top = 68
    Width = 43
    Height = 13
    Caption = 'St'#225'tusz'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label14: TLabel [3]
    Left = 368
    Top = 20
    Width = 97
    Height = 13
    AutoSize = False
    Caption = 'Ter'#252'let > mint'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object Label4: TLabel [4]
    Left = 368
    Top = 68
    Width = 57
    Height = 13
    Caption = #220'gyint'#233'z'#337
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel [5]
    Left = 16
    Top = 116
    Width = 46
    Height = 13
    Caption = 'Komfort'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel [6]
    Left = 576
    Top = 20
    Width = 41
    Height = 13
    AutoSize = False
    Caption = '< mint'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object Label7: TLabel [7]
    Left = 368
    Top = 93
    Width = 52
    Height = 13
    Caption = 'K'#246'nyvel'#337
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel [8]
    Left = 368
    Top = 44
    Width = 97
    Height = 13
    AutoSize = False
    Caption = 'Helyrajzi sz'#225'm'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object Label9: TLabel [9]
    Left = 368
    Top = 116
    Width = 100
    Height = 13
    Caption = 'K'#246'zm'#369' gy'#225'risz'#225'm'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label10: TLabel [10]
    Left = 16
    Top = 140
    Width = 29
    Height = 13
    Caption = 'B'#233'rl'#337
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label11: TLabel [11]
    Left = 16
    Top = 92
    Width = 101
    Height = 13
    Caption = 'Hasznos'#237'that'#243's'#225'g'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited p_Vezerlosav: TPanel
    Top = 458
    Width = 784
    TabOrder = 13
    inherited bb_kilepes: TBitBtn
      Left = 739
    end
    inherited bb_Ok: TBitBtn
      Left = 701
    end
    inherited bb_Ment: TBitBtn
      Left = 550
    end
    inherited bb_excel: TBitBtn
      Left = 588
    end
    inherited bb_xml: TBitBtn
      Left = 512
    end
    inherited bb_email: TBitBtn
      Left = 664
    end
    inherited bb_nyomtat: TBitBtn
      Left = 626
    end
  end
  object dbg_lista: TDBGrid [13]
    Left = 8
    Top = 168
    Width = 769
    Height = 286
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = clInfoBk
    DataSource = SZURESds
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 12
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbg_listaDblClick
    OnKeyUp = dbg_listaKeyUp
    OnTitleClick = dbg_listaTitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'cim'
        Font.Charset = EASTEUROPE_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = 'c'#237'm'
        Title.Color = clMoneyGreen
        Title.Font.Charset = EASTEUROPE_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 307
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'hrsz'
        Font.Charset = EASTEUROPE_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = 'helyrajzi sz'#225'm'
        Title.Color = clMoneyGreen
        Title.Font.Charset = EASTEUROPE_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 188
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'statusz'
        Font.Charset = EASTEUROPE_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = 'st'#225'tusz'
        Title.Color = clMoneyGreen
        Title.Font.Charset = EASTEUROPE_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'lakas_osszes_terulete'
        Font.Charset = EASTEUROPE_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = 'ter'#252'let'
        Title.Color = clMoneyGreen
        Title.Font.Charset = EASTEUROPE_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'komfort'
        Font.Charset = EASTEUROPE_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Color = clMoneyGreen
        Title.Font.Charset = EASTEUROPE_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end>
  end
  object e_terulettol: TEdit [14]
    Left = 480
    Top = 16
    Width = 65
    Height = 21
    Color = clInfoBk
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
  end
  object vcb_statusz: TVDCComboBox [15]
    Left = 120
    Top = 64
    Width = 193
    Height = 21
    Color = clInfoBk
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ItemHeight = 13
    ParentFont = False
    TabOrder = 2
    ADOQuery = ADOQuery1
    IDMezo = 'es_id'
    NevMezo = 'es_nev'
    TablaNev = 'ellenstatusz'
  end
  object vcb_komfort: TVDCComboBox [16]
    Left = 120
    Top = 112
    Width = 193
    Height = 21
    Color = clInfoBk
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ItemHeight = 13
    ParentFont = False
    TabOrder = 4
    ADOQuery = ADOQuery1
    IDMezo = 'komfort_id'
    NevMezo = 'komfort_nev'
    TablaNev = 'l_komfortfokozat'
  end
  object e_teruletig: TEdit [17]
    Left = 624
    Top = 16
    Width = 65
    Height = 21
    Color = clInfoBk
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
  end
  object vcb_ugyintezo: TVDCComboBox [18]
    Left = 480
    Top = 64
    Width = 217
    Height = 21
    Color = clInfoBk
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ItemHeight = 13
    ParentFont = False
    TabOrder = 9
    Lekerdezes = 
      'Select felh_id as ID, teljes_nev as NEV From felhasznalo Where b' +
      'elephet=1 Order By NEV'
    ADOQuery = ADOQuery1
  end
  object vcb_konyvelo: TVDCComboBox [19]
    Left = 480
    Top = 88
    Width = 217
    Height = 21
    Color = clInfoBk
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ItemHeight = 13
    ParentFont = False
    TabOrder = 10
    Lekerdezes = 
      'Select a.felh_id as ID, a.teljes_nev as NEV From felhasznalo a W' +
      'here a.felh_id in (Select x.konyvelo From kozos_kepviselet x) Or' +
      'der By NEV'
    ADOQuery = ADOQuery1
  end
  object e_hrsz: TEdit [20]
    Left = 480
    Top = 40
    Width = 89
    Height = 21
    Color = clInfoBk
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
  end
  object e_kozter: TEdit [21]
    Left = 120
    Top = 16
    Width = 209
    Height = 21
    Color = clInfoBk
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object e_tulaj: TEdit [22]
    Left = 120
    Top = 40
    Width = 209
    Height = 21
    Color = clInfoBk
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object e_kozmu: TEdit [23]
    Left = 480
    Top = 112
    Width = 145
    Height = 21
    Color = clInfoBk
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
  end
  object e_berlo: TEdit [24]
    Left = 120
    Top = 136
    Width = 193
    Height = 21
    Color = clInfoBk
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
  object p_uzenet: TPanel [25]
    Left = 256
    Top = 232
    Width = 289
    Height = 65
    BevelInner = bvRaised
    BevelWidth = 2
    Color = clMaroon
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clYellow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 14
    Visible = False
  end
  object vdc_haszn: TVDCComboBox [26]
    Left = 120
    Top = 88
    Width = 193
    Height = 21
    Color = clInfoBk
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ItemHeight = 13
    ParentFont = False
    TabOrder = 3
    ADOQuery = ADOQuery1
    IDMezo = 'statusz_id'
    NevMezo = 'statusz_nev'
    TablaNev = 'statusz'
  end
  inherited SZURESds: TDataSource
    Left = 728
    Top = 136
  end
  inherited SZURES: TADOQuery
    CursorType = ctStatic
    AfterScroll = SZURESAfterScroll
    SQL.Strings = (
      'Select'
      '  a.lakas_id,'
      '  a.lakas_osszes_terulete,'
      
        '  (Select x.statusz_nev From statusz x Where x.statusz_id=a.stat' +
        'usz_id) as statusz,'
      
        '  (Select x.komfort_nev From l_komfortfokozat x Where x.komfort_' +
        'id=a.komfort_id) as komfort,'
      
        '  (Select x.helyrajziszam From helyrajzi_szamok x Where a.hrsz_i' +
        'd=x.hrsz_id) as hrsz,'
      
        '  (Select x.helyrajzi_szam_alatores From helyrajzi_szamok x Wher' +
        'e a.hrsz_id=x.hrsz_id) as alatores,'
      
        '  (Select x.cim_sor_1 From cim x Where a.hrsz_id=x.hrsz_id) as c' +
        'im'
      'From'
      '  l_lakas a')
    Left = 720
    Top = 80
  end
  inherited SaveDialog1: TSaveDialog
    Left = 712
    Top = 16
  end
  inherited ADOQuery1: TADOQuery
    Left = 752
    Top = 8
  end
end
