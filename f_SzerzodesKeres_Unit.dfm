inherited f_SzerzodesKeres: Tf_SzerzodesKeres
  Caption = 'Szerz'#337'd'#233's keres'#233's'
  ClientHeight = 485
  ClientWidth = 694
  ExplicitWidth = 710
  ExplicitHeight = 524
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 281
    Top = 5
    Width = 87
    Height = 13
    Caption = 'Szerz'#337'd'#233's id'#337'szak'
  end
  object Label5: TLabel [1]
    Left = 281
    Top = 108
    Width = 25
    Height = 13
    Caption = 'T'#237'pus'
  end
  object Label17: TLabel [2]
    Left = 281
    Top = 57
    Width = 55
    Height = 13
    Caption = 'Vonatkoz'#225's'
  end
  object Label3: TLabel [3]
    Left = 281
    Top = 161
    Width = 32
    Height = 13
    Caption = 'Jogc'#237'm'
  end
  object Label16: TLabel [4]
    Left = 496
    Top = 57
    Width = 33
    Height = 13
    Caption = #193'llapot'
  end
  object Label4: TLabel [5]
    Left = 496
    Top = 105
    Width = 37
    Height = 13
    Caption = 'Id'#337'szak'
  end
  object vdc_vonatkozas: TVDComboBox [6]
    Left = 281
    Top = 76
    Width = 178
    Height = 21
    TabOrder = 11
    OnChange = bb_keresClick
    ADOQuery = LISTA
    IDMezo = 'szv_id'
    NevMezo = 'szv_nev'
    TablaNev = 'szerzodes_vonatkozas'
  end
  object vdc_berlesjog: TVDComboBox [7]
    Left = 281
    Top = 180
    Width = 241
    Height = 21
    TabOrder = 12
    OnChange = bb_keresClick
    ADOQuery = LISTA
    IDMezo = 'berlesjog_id'
    NevMezo = 'berlesjog_neve'
    TablaNev = 'berles_jogcime'
  end
  object vdc_allapot: TVDComboBox [8]
    Left = 496
    Top = 76
    Width = 129
    Height = 21
    TabOrder = 13
    OnChange = bb_keresClick
    ADOQuery = LISTA
    IDMezo = 'sza_id'
    NevMezo = 'sza_nev'
    TablaNev = 'szerzodes_allapot'
  end
  object vdc_idoszak: TVDComboBox [9]
    Left = 496
    Top = 124
    Width = 129
    Height = 21
    TabOrder = 14
    OnChange = bb_keresClick
    ADOQuery = LISTA
    IDMezo = 'szi_id'
    NevMezo = 'szi_nev'
    TablaNev = 'szerzodes_idoszak'
  end
  object dtp_mettol: TDateTimePicker [10]
    Left = 281
    Top = 24
    Width = 140
    Height = 26
    Date = 42868.759430324080000000
    Time = 42868.759430324080000000
    ShowCheckbox = True
    Checked = False
    MaxDate = 73415.999988425930000000
    MinDate = 2.000000000000000000
    TabOrder = 4
    OnChange = bb_keresClick
  end
  object le_berlonev: TLabeledEdit [11]
    Left = 8
    Top = 76
    Width = 241
    Height = 21
    EditLabel.Width = 51
    EditLabel.Height = 13
    EditLabel.Caption = 'B'#233'rl'#337' neve'
    TabOrder = 8
    OnChange = bb_keresClick
  end
  object le_berlemeny: TLabeledEdit [12]
    Left = 8
    Top = 180
    Width = 241
    Height = 21
    EditLabel.Width = 50
    EditLabel.Height = 13
    EditLabel.Caption = 'B'#233'rlem'#233'ny'
    TabOrder = 10
    OnChange = bb_keresClick
  end
  object dtp_meddig: TDateTimePicker [13]
    Left = 431
    Top = 25
    Width = 142
    Height = 26
    Date = 42868.760037650460000000
    Time = 42868.760037650460000000
    ShowCheckbox = True
    Checked = False
    TabOrder = 5
    OnChange = bb_keresClick
  end
  object le_szam: TLabeledEdit [14]
    Left = 8
    Top = 24
    Width = 78
    Height = 21
    EditLabel.Width = 31
    EditLabel.Height = 13
    EditLabel.Caption = 'Sz'#225'ma'
    TabOrder = 0
    OnChange = bb_keresClick
  end
  object le_berloazon: TLabeledEdit [15]
    Left = 8
    Top = 124
    Width = 241
    Height = 21
    EditLabel.Width = 73
    EditLabel.Height = 13
    EditLabel.Caption = 'B'#233'rl'#337' azonos'#237't'#243
    TabOrder = 6
    OnChange = bb_keresClick
  end
  object le_ev: TLabeledEdit [16]
    Left = 105
    Top = 24
    Width = 80
    Height = 21
    EditLabel.Width = 18
    EditLabel.Height = 13
    EditLabel.Caption = #201've'
    TabOrder = 1
    OnChange = bb_keresClick
  end
  object vdc_tipus: TVDComboBox [17]
    Left = 281
    Top = 127
    Width = 178
    Height = 21
    TabOrder = 7
    OnChange = bb_keresClick
    ADOQuery = LISTA
    IDMezo = 'szt_id'
    NevMezo = 'szt_nev'
    TablaNev = 'szerzodes_tipus'
  end
  inherited Panel1: TPanel
    Top = 437
    Width = 694
    TabOrder = 9
    ExplicitTop = 437
    ExplicitWidth = 694
    inherited bb_kilep: TBitBtn
      Left = 650
      ExplicitLeft = 650
    end
    inherited bb_ok: TBitBtn
      Left = 608
      ExplicitLeft = 608
    end
    inherited bb_nyomtat: TBitBtn
      Left = 566
      ExplicitLeft = 566
    end
    inherited bb_excel: TBitBtn
      Left = 524
      ExplicitLeft = 524
    end
    inherited cb_uj: TCheckBox
      Left = 423
      ExplicitLeft = 423
    end
    inherited bb_csv: TBitBtn
      Left = 482
      ExplicitLeft = 482
    end
  end
  inherited dbg_lista: TDBGrid
    Top = 232
    Width = 678
    Height = 199
    TabOrder = 2
    Columns = <
      item
        Expanded = False
        FieldName = 'szerszam'
        Title.Alignment = taCenter
        Title.Caption = 'szerz'#337'd'#233'ssz'#225'm'
        Width = 138
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'szerz_datum'
        Title.Alignment = taCenter
        Title.Caption = 'szerz'#337'd'#233's d'#225'tuma'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'szerz_mettol'
        Title.Alignment = taCenter
        Title.Caption = 'mett'#337'l'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'szerz_meddig'
        Title.Alignment = taCenter
        Title.Caption = 'meddig'
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tipus'
        Title.Alignment = taCenter
        Title.Caption = 't'#237'pus'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'jogcim'
        Title.Alignment = taCenter
        Title.Caption = 'jogc'#237'm'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'szerz_birtok'
        Title.Alignment = taCenter
        Title.Caption = 'b'#237'rtokba ad'#225's'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cim'
        Title.Alignment = taCenter
        Title.Caption = 'c'#237'm'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'berlo'
        Title.Alignment = taCenter
        Title.Caption = 'b'#233'rl'#337
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vonatkozas'
        Title.Alignment = taCenter
        Title.Caption = 'milyen'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'szerz_id'
        Title.Alignment = taCenter
        Title.Caption = 'id'
        Visible = True
      end>
  end
  inherited bb_uj: TBitBtn
    Left = 650
    TabOrder = 3
    OnClick = bb_ujClick
    ExplicitLeft = 650
  end
  inherited p_keres: TPanel
    Left = 251
    Top = 213
    TabOrder = 15
    ExplicitLeft = 251
    ExplicitTop = 213
  end
  inherited SZURESds: TDataSource
    Left = 200
    Top = 264
  end
  inherited SZURES: TADOQuery
    AfterScroll = SZURESAfterScroll
    Left = 296
    Top = 294
  end
  inherited LISTA: TADOQuery
    Left = 368
    Top = 278
  end
end
