inherited f_BerloKivalasztas: Tf_BerloKivalasztas
  Caption = 'B'#233'rl'#337' kiv'#225'laszt'#225'sa'
  ClientHeight = 526
  ClientWidth = 579
  ExplicitWidth = 595
  ExplicitHeight = 565
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 478
    Width = 579
    ExplicitTop = 478
    ExplicitWidth = 579
    inherited bb_kilep: TBitBtn
      Left = 535
      ExplicitLeft = 535
    end
    inherited bb_ok: TBitBtn
      Left = 493
      ExplicitLeft = 493
    end
    inherited bb_nyomtat: TBitBtn
      Left = 451
      ExplicitLeft = 451
    end
    inherited bb_excel: TBitBtn
      Left = 409
      ExplicitLeft = 409
    end
    inherited cb_uj: TCheckBox
      Left = 312
      ExplicitLeft = 312
    end
    inherited bb_csv: TBitBtn
      Left = 367
      ExplicitLeft = 367
    end
  end
  inherited dbg_lista: TDBGrid
    Top = 111
    Width = 563
    Height = 361
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'berlo'
        Title.Alignment = taCenter
        Title.Caption = 'n'#233'v'
        Width = 452
        Visible = True
      end>
  end
  object le_nev: TLabeledEdit [2]
    Left = 8
    Top = 25
    Width = 385
    Height = 21
    EditLabel.Width = 19
    EditLabel.Height = 13
    EditLabel.Caption = 'N'#233'v'
    TabOrder = 4
    OnChange = bb_keresClick
  end
  object rg_tipus: TRadioGroup [3]
    Left = 410
    Top = 0
    Width = 159
    Height = 105
    Caption = 'T'#237'pus'
    Items.Strings = (
      'szem'#233'ly'
      'szervezet'
      'egy'#233'ni v'#225'llalkoz'#243)
    TabOrder = 5
  end
  inherited bb_uj: TBitBtn
    Left = 535
    Visible = False
    ExplicitLeft = 535
  end
end
