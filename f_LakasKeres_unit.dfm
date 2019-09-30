inherited f_LakasKeres: Tf_LakasKeres
  Left = 450
  Top = 19
  Caption = 'Lak'#225's keres'#233's'
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel [0]
    Left = 352
    Top = 108
    Width = 36
    Height = 13
    Caption = 'St'#225'tusz'
  end
  object Label4: TLabel [1]
    Left = 352
    Top = 71
    Width = 48
    Height = 13
    Caption = #220'gyint'#233'z'#337
  end
  object Label5: TLabel [2]
    Left = 352
    Top = 149
    Width = 38
    Height = 13
    Caption = 'Komfort'
  end
  object vdc_ugyintezo: TVDComboBox [3]
    Left = 448
    Top = 67
    Width = 209
    Height = 21
    TabOrder = 4
    ADOQuery = LISTA
  end
  object vdc_statusz: TVDComboBox [4]
    Left = 448
    Top = 108
    Width = 209
    Height = 21
    TabOrder = 2
    ADOQuery = LISTA
  end
  object le_kozter: TLabeledEdit [5]
    Left = 16
    Top = 20
    Width = 265
    Height = 21
    EditLabel.Width = 17
    EditLabel.Height = 13
    EditLabel.Caption = 'C'#237'm'
    TabOrder = 5
    OnChange = bb_keresClick
  end
  object vdc_komfort: TVDComboBox [6]
    Left = 448
    Top = 149
    Width = 209
    Height = 21
    TabOrder = 10
    ADOQuery = LISTA
  end
  object le_tulaj: TLabeledEdit [7]
    Left = 16
    Top = 67
    Width = 265
    Height = 21
    EditLabel.Width = 52
    EditLabel.Height = 13
    EditLabel.Caption = 'Tulajdonos'
    TabOrder = 6
  end
  object le_berlo: TLabeledEdit [8]
    Left = 16
    Top = 115
    Width = 265
    Height = 21
    EditLabel.Width = 24
    EditLabel.Height = 13
    EditLabel.Caption = 'B'#233'rl'#337
    TabOrder = 7
    OnChange = bb_keresClick
  end
  object le_hrsz: TLabeledEdit [9]
    Left = 352
    Top = 20
    Width = 137
    Height = 21
    EditLabel.Width = 68
    EditLabel.Height = 13
    EditLabel.Caption = 'Helyrajzi sz'#225'm'
    TabOrder = 8
    OnChange = bb_keresClick
  end
  inherited dbg_lista: TDBGrid
    Top = 192
    Height = 167
    Columns = <
      item
        Expanded = False
        FieldName = 'LAKAS_ID'
        Title.Alignment = taCenter
        Title.Caption = 'id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'hrsz'
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
        FieldName = 'statusz'
        Title.Alignment = taCenter
        Title.Caption = 'st'#225'tusz'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'komfort'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LAKAS_OSSZES_TERULETE'
        Title.Alignment = taCenter
        Title.Caption = 'ter'#252'let'
        Visible = True
      end>
  end
  inherited bb_uj: TBitBtn
    TabOrder = 9
  end
  inherited p_keres: TPanel
    Left = 236
    Top = 145
    ExplicitLeft = 236
    ExplicitTop = 145
  end
  inherited SZURESds: TDataSource
    Left = 728
    Top = 136
  end
  inherited SZURES: TADOQuery
    Connection = AdatModul.ADOConn
  end
  inherited LISTA: TADOQuery
    Connection = AdatModul.ADOConn
    Left = 208
    Top = 264
  end
end
