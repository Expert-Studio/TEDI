inherited f_SzemelyKeres: Tf_SzemelyKeres
  Caption = 'Szem'#233'ly keres'#233's'
  ClientWidth = 622
  ExplicitTop = -22
  ExplicitWidth = 638
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 264
    Top = 13
    Width = 48
    Height = 13
    Caption = 'Szerepk'#246'r'
  end
  object le_nev: TLabeledEdit [1]
    Left = 8
    Top = 32
    Width = 185
    Height = 21
    EditLabel.Width = 19
    EditLabel.Height = 13
    EditLabel.Caption = 'N'#233'v'
    TabOrder = 2
    OnChange = bb_keresClick
  end
  object vdc_szerepkor: TVDComboBox [2]
    Left = 264
    Top = 32
    Width = 145
    Height = 21
    TabOrder = 5
    OnChange = bb_keresClick
    ADOQuery = LISTA
    IDMezo = 'szerepkor_id'
    NevMezo = 'szerepkor_nev'
    TablaNev = 'szerepkorok'
  end
  inherited Panel1: TPanel
    Width = 622
    ExplicitWidth = 622
    inherited bb_kilep: TBitBtn
      Left = 578
      ExplicitLeft = 578
    end
    inherited bb_ok: TBitBtn
      Left = 536
      ExplicitLeft = 536
    end
    inherited bb_nyomtat: TBitBtn
      Left = 494
      ExplicitLeft = 494
    end
    inherited bb_excel: TBitBtn
      Left = 452
      ExplicitLeft = 452
    end
    inherited cb_uj: TCheckBox
      Left = 369
      ExplicitLeft = 369
    end
    inherited bb_csv: TBitBtn
      Left = 410
      ExplicitLeft = 410
    end
  end
  inherited dbg_lista: TDBGrid
    Top = 72
    Width = 606
    Height = 287
    Columns = <
      item
        Expanded = False
        FieldName = 'szemely_id'
        Title.Alignment = taCenter
        Title.Caption = 'id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'szemely_teljes_neve'
        Title.Alignment = taCenter
        Title.Caption = 'n'#233'v'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'anyja_neve'
        Title.Alignment = taCenter
        Title.Caption = 'anyja neve'
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
        FieldName = 'emil'
        Title.Alignment = taCenter
        Title.Caption = 'e-mail'
        Visible = True
      end>
  end
  inherited bb_uj: TBitBtn
    Left = 578
    TabOrder = 4
    ExplicitLeft = 578
  end
end
