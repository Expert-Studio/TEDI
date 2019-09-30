inherited f_CimSzerkeszto: Tf_CimSzerkeszto
  Caption = 'C'#237'm szerkeszt'#233'se'
  ClientHeight = 424
  ClientWidth = 759
  ExplicitWidth = 775
  ExplicitHeight = 463
  PixelsPerInch = 96
  TextHeight = 13
  object Label7: TLabel [0]
    Left = 10
    Top = 12
    Width = 53
    Height = 13
    Caption = 'C'#237'm t'#237'pusa:'
  end
  object Label3: TLabel [1]
    Left = 8
    Top = 44
    Width = 49
    Height = 13
    Caption = 'Telep'#252'l'#233's:'
  end
  object l_irszam: TLabel [2]
    Left = 8
    Top = 92
    Width = 66
    Height = 13
    Caption = 'Ir'#225'ny'#237't'#243'sz'#225'm:'
  end
  object Label22: TLabel [3]
    Left = 158
    Top = 93
    Width = 48
    Height = 13
    Caption = 'Postafi'#243'k:'
  end
  object Label11: TLabel [4]
    Left = 302
    Top = 93
    Width = 38
    Height = 13
    Caption = 'Ker'#252'let:'
  end
  object Label1: TLabel [5]
    Left = 268
    Top = 44
    Width = 72
    Height = 13
    Caption = 'Telep'#252'l'#233's r'#233'sz:'
  end
  object Label5: TLabel [6]
    Left = 282
    Top = 136
    Width = 81
    Height = 13
    Caption = 'K'#246'zter'#252'let jelleg:'
  end
  object Label4: TLabel [7]
    Left = 8
    Top = 140
    Width = 53
    Height = 13
    Caption = 'K'#246'zter'#252'let:'
  end
  object Label9: TLabel [8]
    Left = 8
    Top = 182
    Width = 46
    Height = 13
    Caption = 'H'#225'zsz'#225'm:'
  end
  object Label6: TLabel [9]
    Left = 450
    Top = 182
    Width = 27
    Height = 13
    Caption = 'Szint:'
  end
  object Label12: TLabel [10]
    Left = 8
    Top = 222
    Width = 49
    Height = 13
    Caption = 'K'#252'ls'#337' k'#243'd:'
  end
  object Label13: TLabel [11]
    Left = 8
    Top = 262
    Width = 43
    Height = 13
    Caption = 'R'#233'gi c'#237'm:'
  end
  object Label10: TLabel [12]
    Left = 8
    Top = 294
    Width = 50
    Height = 13
    Caption = 'Teljes c'#237'm:'
  end
  object Label15: TLabel [13]
    Left = 172
    Top = 182
    Width = 16
    Height = 13
    Caption = '-t'#243'l'
  end
  object Label16: TLabel [14]
    Left = 282
    Top = 182
    Width = 12
    Height = 13
    Caption = '-ig'
  end
  object Label8: TLabel [15]
    Left = 324
    Top = 182
    Width = 34
    Height = 13
    Caption = #201'p'#252'let:'
  end
  object Label14: TLabel [16]
    Left = 654
    Top = 182
    Width = 24
    Height = 13
    Caption = 'Ajt'#243':'
  end
  object l_cim1: TLabel [17]
    Left = 90
    Top = 294
    Width = 40
    Height = 13
    Caption = 'dfdsfsdf'
  end
  object l_cim2: TLabel [18]
    Left = 90
    Top = 328
    Width = 45
    Height = 13
    Caption = 'dfdsfsdf'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object l_elozo: TLabel [19]
    Left = 91
    Top = 262
    Width = 5
    Height = 13
    Caption = '-'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clYellow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited Panel1: TPanel
    Top = 376
    Width = 759
    TabOrder = 18
    ExplicitTop = 376
    ExplicitWidth = 759
    inherited bb_kilep: TBitBtn
      Left = 710
      ExplicitLeft = 710
    end
    inherited bb_nyomtat: TBitBtn
      Left = 668
      ExplicitLeft = 668
    end
    inherited bb_email: TBitBtn
      Left = 624
      ExplicitLeft = 624
    end
  end
  object e_irszam: TEdit [21]
    Left = 90
    Top = 89
    Width = 49
    Height = 21
    Color = clInfoBk
    TabOrder = 3
  end
  object e_postafiok: TEdit [22]
    Left = 224
    Top = 89
    Width = 49
    Height = 21
    Color = clInfoBk
    TabOrder = 4
  end
  object e_kerulet: TEdit [23]
    Left = 384
    Top = 89
    Width = 49
    Height = 21
    Color = clInfoBk
    TabOrder = 5
  end
  object e_kozterulet: TEdit [24]
    Left = 90
    Top = 133
    Width = 145
    Height = 21
    Color = clInfoBk
    TabOrder = 6
    OnChange = e_kozteruletChange
    OnEnter = e_kozteruletEnter
    OnExit = e_kozteruletExit
    OnKeyUp = e_kozteruletKeyUp
  end
  object cb_ervenyes: TCheckBox [25]
    Left = 324
    Top = 221
    Width = 80
    Height = 17
    Alignment = taLeftJustify
    Caption = #201'rv'#233'nyes?'
    TabOrder = 17
  end
  object e_hazszamtol: TEdit [26]
    Left = 94
    Top = 179
    Width = 33
    Height = 21
    HelpType = htKeyword
    Color = clInfoBk
    TabOrder = 9
  end
  object e_betutol: TEdit [27]
    Left = 133
    Top = 179
    Width = 33
    Height = 21
    Color = clInfoBk
    TabOrder = 10
  end
  object e_hazszamig: TEdit [28]
    Left = 204
    Top = 179
    Width = 33
    Height = 21
    Color = clInfoBk
    TabOrder = 11
  end
  object e_betuig: TEdit [29]
    Left = 243
    Top = 179
    Width = 33
    Height = 21
    Color = clInfoBk
    TabOrder = 12
  end
  object e_epulet: TEdit [30]
    Left = 384
    Top = 179
    Width = 41
    Height = 21
    Color = clInfoBk
    TabOrder = 13
  end
  object e_ajto: TEdit [31]
    Left = 693
    Top = 179
    Width = 33
    Height = 21
    Color = clInfoBk
    TabOrder = 15
  end
  object e_kulso: TEdit [32]
    Left = 94
    Top = 219
    Width = 201
    Height = 21
    Color = clInfoBk
    TabOrder = 16
  end
  object vdc_tipus: TVDComboBox [33]
    Left = 91
    Top = 8
    Width = 134
    Height = 21
    TabOrder = 0
    ADOQuery = LISTA
    IDMezo = 'cim_tipus_id'
    NevMezo = 'cim_tipus_nev'
    TablaNev = 'cim_tipus'
  end
  object vdc_telepules: TVDComboBox [34]
    Left = 91
    Top = 44
    Width = 145
    Height = 21
    TabOrder = 1
    OnExit = vdc_telepulesExit
    ADOQuery = LISTA
    IDMezo = 'telepules_id'
    NevMezo = 'telepules_nev'
    TablaNev = 'telepules'
  end
  object vdc_telepulesresz: TVDComboBox [35]
    Left = 384
    Top = 41
    Width = 145
    Height = 21
    TabOrder = 2
    ADOQuery = LISTA
    IDMezo = 'telepules_resz_id'
    NevMezo = 'telepules_resz_nev'
    TablaNev = 'telepules_resz'
  end
  object vdc_jelleg: TVDComboBox [36]
    Left = 384
    Top = 133
    Width = 145
    Height = 21
    TabOrder = 8
    OnExit = vdc_jellegExit
    ADOQuery = LISTA
    IDMezo = 'kjelleg_id'
    NevMezo = 'kjelleg_nev'
    TablaNev = 'kozterulet_jelleg'
  end
  object vdc_szint: TVDComboBox [37]
    Left = 499
    Top = 179
    Width = 126
    Height = 21
    TabOrder = 14
    OnExit = vdc_jellegExit
    ADOQuery = LISTA
    IDMezo = 'szint_id'
    NevMezo = 'szint_nev'
    TablaNev = 'szint'
  end
  object dbg_halmaz: TDBGrid [38]
    Left = 90
    Top = 133
    Width = 176
    Height = 132
    Color = clInfoBk
    DataSource = kozterulet
    Options = [dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Visible = False
    OnDblClick = dbg_halmazDblClick
    OnKeyUp = dbg_halmazKeyUp
    Columns = <
      item
        Expanded = False
        FieldName = 'kozterulet_nev'
        Font.Charset = EASTEUROPE_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Width = 120
        Visible = True
      end>
  end
  inherited LISTA: TADOQuery
    Left = 262
    Top = 296
  end
  inherited SZURESds: TDataSource
    Left = 208
    Top = 288
  end
  inherited SZURES: TADOQuery
    Left = 336
    Top = 304
  end
  object kozterulet: TDataSource
    DataSet = AdatModul.ADOQuery3
    Left = 440
    Top = 256
  end
end
