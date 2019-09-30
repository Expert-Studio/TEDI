inherited f_TamogatasSzures: Tf_TamogatasSzures
  Caption = 'T'#225'mogat'#225'sok keres'#233'se'
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel [0]
    Left = 8
    Top = 122
    Width = 33
    Height = 13
    Caption = 'Jellege'
  end
  object Label1: TLabel [1]
    Left = 323
    Top = 0
    Width = 72
    Height = 13
    Caption = 'T'#225'mogat'#225'si id'#337
  end
  object dtp_mettol: TDateTimePicker [2]
    Left = 323
    Top = 25
    Width = 153
    Height = 31
    Date = 42868.759430324080000000
    Time = 42868.759430324080000000
    ShowCheckbox = True
    Checked = False
    MaxDate = 73415.999988425930000000
    MinDate = 2.000000000000000000
    TabOrder = 4
  end
  object dtp_meddig: TDateTimePicker [3]
    Left = 323
    Top = 82
    Width = 153
    Height = 31
    Date = 42868.760037650460000000
    Time = 42868.760037650460000000
    ShowCheckbox = True
    Checked = False
    TabOrder = 6
  end
  object LabeledEdit1: TLabeledEdit [4]
    Left = 323
    Top = 153
    Width = 354
    Height = 21
    Anchors = [akTop, akRight]
    EditLabel.Width = 50
    EditLabel.Height = 13
    EditLabel.Caption = 'B'#233'rlem'#233'ny'
    TabOrder = 5
    OnChange = bb_keresClick
  end
  object le_berlonev: TLabeledEdit [5]
    Left = 8
    Top = 25
    Width = 241
    Height = 21
    EditLabel.Width = 51
    EditLabel.Height = 13
    EditLabel.Caption = 'B'#233'rl'#337' neve'
    TabOrder = 7
    OnChange = bb_keresClick
  end
  object le_berlokod: TLabeledEdit [6]
    Left = 8
    Top = 82
    Width = 241
    Height = 21
    EditLabel.Width = 73
    EditLabel.Height = 13
    EditLabel.Caption = 'B'#233'rl'#337' azonos'#237't'#243
    TabOrder = 3
    OnChange = bb_keresClick
  end
  inherited Panel1: TPanel
    inherited cb_uj: TCheckBox
      Left = 377
      ExplicitLeft = 377
    end
  end
  inherited dbg_lista: TDBGrid
    Top = 208
    Height = 151
    Columns = <
      item
        Expanded = False
        Title.Alignment = taCenter
        Title.Caption = 'b'#233'rl'#337
        Width = 132
        Visible = True
      end
      item
        Expanded = False
        Title.Alignment = taCenter
        Title.Caption = 'b'#233'rlem'#233'ny'
        Width = 260
        Visible = True
      end
      item
        Expanded = False
        Title.Alignment = taCenter
        Title.Caption = 'jelleg'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        Title.Alignment = taCenter
        Title.Caption = 'mett'#337'l'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        Title.Alignment = taCenter
        Title.Caption = 'meddig'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        Title.Alignment = taCenter
        Title.Caption = #246'sszeg'
        Width = 94
        Visible = True
      end>
  end
  inherited p_keres: TPanel
    TabOrder = 8
  end
end
