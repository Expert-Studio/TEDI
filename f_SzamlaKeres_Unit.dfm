inherited f_SzamlaKeres: Tf_SzamlaKeres
  Caption = 'Sz'#225'mla keres'#233's'
  ClientHeight = 541
  ClientWidth = 675
  ExplicitWidth = 691
  ExplicitHeight = 580
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel [0]
    Left = 281
    Top = 52
    Width = 25
    Height = 13
    Caption = 'Fajta'
  end
  object Label5: TLabel [1]
    Left = 281
    Top = 103
    Width = 25
    Height = 13
    Caption = 'T'#237'pus'
  end
  object Label1: TLabel [2]
    Left = 281
    Top = 5
    Width = 72
    Height = 13
    Caption = 'Sz'#225'mla d'#225'tuma'
  end
  object Label3: TLabel [3]
    Left = 281
    Top = 161
    Width = 66
    Height = 13
    Caption = 'Fizet'#233's m'#243'dja'
  end
  object LabeledEdit1: TLabeledEdit [4]
    Left = 8
    Top = 124
    Width = 241
    Height = 21
    EditLabel.Width = 73
    EditLabel.Height = 13
    EditLabel.Caption = 'B'#233'rl'#337' azonos'#237't'#243
    TabOrder = 4
    OnChange = bb_keresClick
  end
  object vdc_mod: TVDComboBox [5]
    Left = 281
    Top = 180
    Width = 241
    Height = 21
    TabOrder = 9
    ADOQuery = LISTA
    IDMezo = 'fm_id'
    NevMezo = 'fm_nev'
    TablaNev = 'fizetesi_mod'
  end
  object dtp_meddig: TDateTimePicker [6]
    Left = 430
    Top = 24
    Width = 131
    Height = 26
    Date = 42868.760037650460000000
    Time = 42868.760037650460000000
    TabOrder = 6
  end
  object vdc_fajta: TVDComboBox [7]
    Left = 281
    Top = 71
    Width = 241
    Height = 21
    TabOrder = 7
    ADOQuery = LISTA
    IDMezo = 'berlesjog_id'
    NevMezo = 'berlesjog_neve'
    TablaNev = 'berles_jogcime'
  end
  object le_szamlaszam: TLabeledEdit [8]
    Left = 8
    Top = 24
    Width = 241
    Height = 21
    EditLabel.Width = 57
    EditLabel.Height = 13
    EditLabel.Caption = 'Sz'#225'mlasz'#225'm'
    TabOrder = 11
    OnChange = bb_keresClick
  end
  object vdc_tipus: TVDComboBox [9]
    Left = 281
    Top = 122
    Width = 241
    Height = 21
    TabOrder = 8
    ADOQuery = LISTA
    IDMezo = 'szt_id'
    NevMezo = 'szt_nev'
    TablaNev = 'szamla_tipus'
  end
  object LabeledEdit3: TLabeledEdit [10]
    Left = 8
    Top = 180
    Width = 241
    Height = 21
    EditLabel.Width = 68
    EditLabel.Height = 13
    EditLabel.Caption = 'B'#233'rlem'#233'ny c'#237'm'
    TabOrder = 10
    OnChange = bb_keresClick
  end
  object le_berlonev: TLabeledEdit [11]
    Left = 8
    Top = 72
    Width = 241
    Height = 21
    EditLabel.Width = 51
    EditLabel.Height = 13
    EditLabel.Caption = 'B'#233'rl'#337' neve'
    TabOrder = 12
    OnChange = bb_keresClick
  end
  object dtp_mettol: TDateTimePicker [12]
    Left = 281
    Top = 24
    Width = 128
    Height = 26
    Date = 42868.759430324080000000
    Time = 42868.759430324080000000
    MaxDate = 73415.999988425930000000
    MinDate = 2.000000000000000000
    TabOrder = 5
  end
  inherited Panel1: TPanel
    Top = 493
    Width = 675
    ExplicitTop = 493
    ExplicitWidth = 675
    inherited bb_kilep: TBitBtn
      Left = 631
      ExplicitLeft = 631
    end
    inherited bb_ok: TBitBtn
      Left = 589
      ExplicitLeft = 589
    end
    inherited bb_nyomtat: TBitBtn
      Left = 547
      ExplicitLeft = 547
    end
    inherited bb_excel: TBitBtn
      Left = 505
      ExplicitLeft = 505
    end
    inherited cb_uj: TCheckBox
      Left = 406
      ExplicitLeft = 406
    end
    inherited bb_csv: TBitBtn
      Left = 469
      ExplicitLeft = 469
    end
  end
  inherited dbg_lista: TDBGrid
    Top = 240
    Width = 659
    Height = 247
    Columns = <
      item
        Expanded = False
        FieldName = 'szamlaszama'
        Title.Alignment = taCenter
        Title.Caption = 'sz'#225'mlasz'#225'm'
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'szamla_kelte'
        Title.Alignment = taCenter
        Title.Caption = 'sz'#225'mla d'#225'tuma'
        Width = 162
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cim'
        Title.Alignment = taCenter
        Title.Caption = 'b'#233'rlem'#233'ny'
        Width = 225
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
        FieldName = 'tipus'
        Title.Alignment = taCenter
        Title.Caption = 't'#237'pus'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'szamla_osszdij'
        Title.Alignment = taCenter
        Title.Caption = 'brutt'#243
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'szamla_id'
        Title.Alignment = taCenter
        Title.Caption = 'id'
        Visible = True
      end>
  end
  inherited bb_uj: TBitBtn
    Left = 631
    OnClick = bb_ujClick
    ExplicitLeft = 631
  end
  inherited SZURESds: TDataSource
    Left = 544
    Top = 168
  end
  inherited SZURES: TADOQuery
    AfterScroll = SZURESAfterScroll
    Left = 544
    Top = 72
  end
  inherited LISTA: TADOQuery
    Left = 600
    Top = 128
  end
end
