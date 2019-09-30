inherited f_ReszletfizetesSzures: Tf_ReszletfizetesSzures
  Caption = 'R'#233'szletfizet'#233's keres'#233's'
  ClientHeight = 409
  ClientWidth = 772
  ExplicitWidth = 788
  ExplicitHeight = 448
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 283
    Top = 0
    Width = 90
    Height = 13
    Caption = 'T'#246'rleszt'#233's kezdete'
  end
  object LabeledEdit1: TLabeledEdit [1]
    Left = 8
    Top = 81
    Width = 354
    Height = 21
    EditLabel.Width = 50
    EditLabel.Height = 13
    EditLabel.Caption = 'B'#233'rlem'#233'ny'
    TabOrder = 5
    OnChange = bb_keresClick
  end
  object le_berlonev: TLabeledEdit [2]
    Left = 8
    Top = 25
    Width = 241
    Height = 21
    EditLabel.Width = 51
    EditLabel.Height = 13
    EditLabel.Caption = 'B'#233'rl'#337' neve'
    TabOrder = 8
    OnChange = bb_keresClick
  end
  object dtp_mettol: TDateTimePicker [3]
    Left = 283
    Top = 25
    Width = 153
    Height = 21
    Date = 42868.759430324080000000
    Time = 42868.759430324080000000
    ShowCheckbox = True
    Checked = False
    MaxDate = 73415.999988425930000000
    MinDate = 2.000000000000000000
    TabOrder = 4
  end
  object LabeledEdit3: TLabeledEdit [4]
    Left = 388
    Top = 81
    Width = 65
    Height = 21
    EditLabel.Width = 44
    EditLabel.Height = 13
    EditLabel.Caption = 'Futamid'#337
    TabOrder = 6
  end
  object LabeledEdit4: TLabeledEdit [5]
    Left = 484
    Top = 81
    Width = 65
    Height = 21
    EditLabel.Width = 55
    EditLabel.Height = 13
    EditLabel.Caption = #201'ves kamat'
    TabOrder = 7
  end
  object le_berlokod: TLabeledEdit [6]
    Left = 484
    Top = 25
    Width = 241
    Height = 21
    EditLabel.Width = 73
    EditLabel.Height = 13
    EditLabel.Caption = 'Szerz'#337'd'#233'ssz'#225'm'
    TabOrder = 3
    OnChange = bb_keresClick
  end
  inherited Panel1: TPanel
    Top = 361
    Width = 772
    ExplicitTop = 361
    ExplicitWidth = 772
    inherited bb_kilep: TBitBtn
      Left = 681
      ExplicitLeft = 681
    end
    inherited bb_ok: TBitBtn
      Left = 586
      ExplicitLeft = 586
    end
    inherited bb_nyomtat: TBitBtn
      Left = 490
      ExplicitLeft = 490
    end
    inherited bb_excel: TBitBtn
      Left = 424
      ExplicitLeft = 424
    end
    inherited cb_uj: TCheckBox
      Left = 369
      ExplicitLeft = 369
    end
  end
  inherited dbg_lista: TDBGrid
    Top = 136
    Width = 756
    Height = 219
    Columns = <
      item
        Expanded = False
        Title.Alignment = taCenter
        Title.Caption = 'b'#233'rl'#337
        Width = 195
        Visible = True
      end
      item
        Expanded = False
        Title.Alignment = taCenter
        Title.Caption = 'b'#233'rlem'#233'ny'
        Width = 316
        Visible = True
      end
      item
        Expanded = False
        Title.Alignment = taCenter
        Title.Caption = 'kezdet'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        Title.Alignment = taCenter
        Title.Caption = 'futamid'#337
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        Title.Alignment = taCenter
        Title.Caption = 'kamat'
        Visible = True
      end>
  end
end
