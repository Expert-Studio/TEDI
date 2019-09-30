inherited f_PenztarKeres: Tf_PenztarKeres
  Caption = 'P'#233'nzt'#225'ri befizet'#233'sek keres'#233'se'
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 371
    Top = 5
    Width = 83
    Height = 13
    Caption = 'Befizet'#233's d'#225'tuma'
  end
  object le_osszeg: TLabeledEdit [2]
    Left = 494
    Top = 24
    Width = 107
    Height = 21
    Alignment = taRightJustify
    EditLabel.Width = 73
    EditLabel.Height = 13
    EditLabel.Caption = 'Befizett '#246'sszeg'
    NumbersOnly = True
    TabOrder = 6
  end
  object le_befizeto: TLabeledEdit [3]
    Left = 19
    Top = 80
    Width = 239
    Height = 21
    EditLabel.Width = 66
    EditLabel.Height = 13
    EditLabel.Caption = 'Befizet'#337' neve'
    TabOrder = 9
    OnChange = bb_keresClick
  end
  object me_datum: TMaskEdit [4]
    Left = 371
    Top = 24
    Width = 83
    Height = 21
    EditMask = '!9999.99.99;1;_'
    MaxLength = 10
    TabOrder = 5
    Text = '    .  .  '
  end
  object le_szamla: TLabeledEdit [5]
    Left = 371
    Top = 80
    Width = 239
    Height = 21
    EditLabel.Width = 71
    EditLabel.Height = 13
    EditLabel.Caption = #201'rintett sz'#225'mla'
    TabOrder = 7
  end
  object le_berlemeny: TLabeledEdit [6]
    Left = 19
    Top = 136
    Width = 239
    Height = 21
    EditLabel.Width = 50
    EditLabel.Height = 13
    EditLabel.Caption = 'B'#233'rlem'#233'ny'
    TabOrder = 8
    OnChange = bb_keresClick
  end
  object le_berlo: TLabeledEdit [7]
    Left = 19
    Top = 24
    Width = 239
    Height = 21
    EditLabel.Width = 51
    EditLabel.Height = 13
    EditLabel.Caption = 'B'#233'rl'#337' neve'
    TabOrder = 4
    OnChange = bb_keresClick
  end
  inherited dbg_lista: TDBGrid
    Columns = <
      item
        Expanded = False
        Title.Alignment = taCenter
        Title.Caption = 'id'
        Visible = True
      end
      item
        Expanded = False
        Title.Alignment = taCenter
        Title.Caption = 'b'#233'rl'#337
        Width = 144
        Visible = True
      end
      item
        Expanded = False
        Title.Alignment = taCenter
        Title.Caption = 'd'#225'tum'
        Visible = True
      end
      item
        Expanded = False
        Title.Alignment = taCenter
        Title.Caption = #246'sszeg'
        Visible = True
      end
      item
        Expanded = False
        Title.Alignment = taCenter
        Title.Caption = 'befizet'#337
        Width = 172
        Visible = True
      end
      item
        Expanded = False
        Title.Alignment = taCenter
        Title.Caption = #233'rintett sz'#225'mla'
        Width = 112
        Visible = True
      end>
  end
  inherited bb_uj: TBitBtn
    OnClick = bb_ujClick
  end
  inherited SZURESds: TDataSource
    Left = 296
    Top = 88
  end
  inherited SZURES: TADOQuery
    Left = 296
    Top = 32
  end
end
