inherited f_SzervezetKeres: Tf_SzervezetKeres
  Caption = 'Szervezet keres'#233's'
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 64
    Width = 25
    Height = 13
    Caption = 'T'#237'pus'
  end
  object Label3: TLabel [1]
    Left = 304
    Top = 64
    Width = 30
    Height = 13
    Caption = 'Forma'
  end
  object le_szervezet: TLabeledEdit [2]
    Left = 8
    Top = 32
    Width = 217
    Height = 21
    EditLabel.Width = 19
    EditLabel.Height = 13
    EditLabel.Caption = 'N'#233'v'
    TabOrder = 3
    OnChange = bb_keresClick
  end
  object le_adoszam: TLabeledEdit [3]
    Left = 304
    Top = 32
    Width = 217
    Height = 21
    EditLabel.Width = 43
    EditLabel.Height = 13
    EditLabel.Caption = 'Ad'#243'sz'#225'm'
    TabOrder = 6
    OnChange = bb_keresClick
  end
  object vdc_tipus: TVDComboBox [4]
    Left = 8
    Top = 88
    Width = 145
    Height = 21
    TabOrder = 4
    OnChange = bb_keresClick
    ADOQuery = LISTA
    IDMezo = 'szervezet_tipus_id'
    NevMezo = 'szervezet_tipus_nev'
    TablaNev = 'szervezet_tipus'
  end
  object vdc_forma: TVDComboBox [5]
    Left = 304
    Top = 88
    Width = 145
    Height = 21
    TabOrder = 5
    OnChange = bb_keresClick
    ADOQuery = LISTA
    IDMezo = 'szervezet_forma_id'
    NevMezo = 'szervezet_forma_nev'
    TablaNev = 'szervezet_forma'
  end
  inherited dbg_lista: TDBGrid
    Top = 136
    Height = 223
    Columns = <
      item
        Expanded = False
        FieldName = 'szervezet_id'
        Title.Alignment = taCenter
        Title.Caption = 'id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'szervezet_nev'
        Title.Alignment = taCenter
        Title.Caption = 'n'#233'v'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'adoszam'
        Title.Alignment = taCenter
        Title.Caption = 'ad'#243'sz'#225'm'
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
        FieldName = 'forma'
        Title.Alignment = taCenter
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
        FieldName = 'email'
        Title.Alignment = taCenter
        Title.Caption = 'e-mail'
        Visible = True
      end>
  end
  inherited p_keres: TPanel
    TabOrder = 7
  end
  inherited SZURES: TADOQuery
    AfterScroll = SZURESAfterScroll
  end
end
