inherited f_TamogatasAdat: Tf_TamogatasAdat
  Caption = 'T'#225'mogat'#225's'
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 281
    Top = 0
    Width = 72
    Height = 13
    Caption = 'T'#225'mogat'#225'si id'#337
  end
  object Label4: TLabel [1]
    Left = 8
    Top = 169
    Width = 33
    Height = 13
    Caption = 'Jellege'
  end
  object LabeledEdit3: TLabeledEdit [2]
    Left = 8
    Top = 249
    Width = 113
    Height = 21
    Anchors = [akTop, akRight]
    EditLabel.Width = 35
    EditLabel.Height = 13
    EditLabel.Caption = #214'sszeg'
    TabOrder = 7
  end
  object LabeledEdit7: TLabeledEdit [3]
    Left = 8
    Top = 24
    Width = 217
    Height = 21
    EditLabel.Width = 51
    EditLabel.Height = 13
    EditLabel.Caption = 'B'#233'rl'#337' neve'
    TabOrder = 4
  end
  object dtp_meddig: TDateTimePicker [4]
    Left = 465
    Top = 24
    Width = 153
    Height = 31
    Date = 42868.760037650460000000
    Time = 42868.760037650460000000
    ShowCheckbox = True
    TabOrder = 3
  end
  object VDComboBox1: TVDComboBox [5]
    Left = 8
    Top = 193
    Width = 241
    Height = 21
    TabOrder = 6
    ADOQuery = LISTA
    IDMezo = 'berlesjog_id'
    NevMezo = 'berlesjog_neve'
    TablaNev = 'berles_jogcime'
  end
  object LabeledEdit2: TLabeledEdit [6]
    Left = 8
    Top = 137
    Width = 156
    Height = 21
    Anchors = [akTop, akRight]
    EditLabel.Width = 49
    EditLabel.Height = 13
    EditLabel.Caption = 'Szerz'#337'd'#233's'
    TabOrder = 5
  end
  object dtp_mettol: TDateTimePicker [7]
    Left = 281
    Top = 24
    Width = 153
    Height = 31
    Date = 42868.759430324080000000
    Time = 42868.759430324080000000
    ShowCheckbox = True
    MaxDate = 73415.999988425930000000
    MinDate = 2.000000000000000000
    TabOrder = 2
  end
  object LabeledEdit1: TLabeledEdit [8]
    Left = 8
    Top = 81
    Width = 453
    Height = 21
    Anchors = [akTop, akRight]
    EditLabel.Width = 50
    EditLabel.Height = 13
    EditLabel.Caption = 'B'#233'rlem'#233'ny'
    TabOrder = 1
  end
  inherited Panel1: TPanel
    inherited bb_kilep: TBitBtn
      ExplicitLeft = 729
    end
    inherited bb_nyomtat: TBitBtn
      ExplicitLeft = 687
    end
    inherited bb_email: TBitBtn
      ExplicitLeft = 643
    end
  end
end
