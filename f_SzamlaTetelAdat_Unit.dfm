inherited f_SzamlaTetelAdat: Tf_SzamlaTetelAdat
  Caption = 'Sz'#225'mla t'#233'tel'
  ClientHeight = 378
  ClientWidth = 762
  ExplicitWidth = 778
  ExplicitHeight = 417
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel [0]
    Left = 219
    Top = 165
    Width = 91
    Height = 13
    Caption = 'Mennyis'#233'gi egys'#233'g'
  end
  object Label1: TLabel [1]
    Left = 123
    Top = 221
    Width = 46
    Height = 13
    Caption = #193'FA kulcs'
  end
  object Label3: TLabel [2]
    Left = 19
    Top = 61
    Width = 34
    Height = 13
    Caption = 'D'#237'jelem'
  end
  object le_vonev: TLabeledEdit [3]
    Left = 19
    Top = 24
    Width = 78
    Height = 21
    EditLabel.Width = 72
    EditLabel.Height = 13
    EditLabel.Caption = 'Vonatkoz'#225'si '#233'v'
    TabOrder = 0
  end
  object vdc_me: TVDComboBox [4]
    Left = 219
    Top = 184
    Width = 107
    Height = 21
    TabOrder = 7
    ADOQuery = LISTA
    IDMezo = 'berlesjog_id'
    NevMezo = 'berlesjog_neve'
    TablaNev = 'berles_jogcime'
  end
  object le_szj: TLabeledEdit [5]
    Left = 283
    Top = 133
    Width = 102
    Height = 21
    EditLabel.Width = 17
    EditLabel.Height = 13
    EditLabel.Caption = 'SZJ'
    TabOrder = 4
  end
  object le_egysegar: TLabeledEdit [6]
    Left = 19
    Top = 184
    Width = 78
    Height = 21
    EditLabel.Width = 45
    EditLabel.Height = 13
    EditLabel.Caption = 'Egys'#233'g'#225'r'
    TabOrder = 5
  end
  object le_mennyiseg: TLabeledEdit [7]
    Left = 123
    Top = 184
    Width = 54
    Height = 21
    EditLabel.Width = 51
    EditLabel.Height = 13
    EditLabel.Caption = 'Mennyis'#233'g'
    TabOrder = 6
  end
  object le_megnevezes: TLabeledEdit [8]
    Left = 19
    Top = 133
    Width = 241
    Height = 21
    EditLabel.Width = 60
    EditLabel.Height = 13
    EditLabel.Caption = 'Megnevez'#233's'
    TabOrder = 3
  end
  object le_netto: TLabeledEdit [9]
    Left = 19
    Top = 240
    Width = 78
    Height = 21
    Alignment = taRightJustify
    EditLabel.Width = 27
    EditLabel.Height = 13
    EditLabel.Caption = 'Nett'#243
    TabOrder = 8
  end
  object le_megj: TLabeledEdit [10]
    Left = 19
    Top = 296
    Width = 652
    Height = 21
    EditLabel.Width = 115
    EditLabel.Height = 13
    EditLabel.Caption = 'Sz'#225'mlat'#233'tel megjegyz'#233's'
    TabOrder = 12
  end
  object le_brutto: TLabeledEdit [11]
    AlignWithMargins = True
    Left = 371
    Top = 240
    Width = 78
    Height = 21
    Alignment = taRightJustify
    EditLabel.Width = 30
    EditLabel.Height = 13
    EditLabel.Caption = 'Brutt'#243
    NumbersOnly = True
    TabOrder = 11
    Text = '184'
  end
  object vdc_afa: TVDComboBox [12]
    Left = 123
    Top = 240
    Width = 70
    Height = 21
    TabOrder = 9
    ADOQuery = LISTA
    IDMezo = 'berlesjog_id'
    NevMezo = 'berlesjog_neve'
    TablaNev = 'berles_jogcime'
  end
  object vdc_dijelem: TVDComboBox [13]
    Left = 19
    Top = 80
    Width = 241
    Height = 21
    TabOrder = 2
    ADOQuery = LISTA
    IDMezo = 'de_id'
    NevMezo = 'de_nev'
    TablaNev = 'dijelemek'
  end
  object le_afa: TLabeledEdit [14]
    Left = 259
    Top = 240
    Width = 78
    Height = 21
    Alignment = taRightJustify
    EditLabel.Width = 20
    EditLabel.Height = 13
    EditLabel.Caption = #193'FA'
    TabOrder = 10
  end
  object le_vonho: TLabeledEdit [15]
    Left = 123
    Top = 24
    Width = 78
    Height = 21
    EditLabel.Width = 72
    EditLabel.Height = 13
    EditLabel.Caption = 'Vonatkoz'#225'si h'#243
    TabOrder = 1
  end
  inherited Panel1: TPanel
    Top = 330
    Width = 762
    TabOrder = 13
    ExplicitTop = 330
    ExplicitWidth = 762
    inherited bb_kilep: TBitBtn
      Left = 713
      ExplicitLeft = 713
    end
    inherited bb_nyomtat: TBitBtn
      Left = 671
      ExplicitLeft = 671
    end
    inherited bb_email: TBitBtn
      Left = 627
      ExplicitLeft = 627
    end
  end
  inherited LISTA: TADOQuery
    Left = 568
    Top = 88
  end
  inherited SZURESds: TDataSource
    Left = 624
  end
  inherited SZURES: TADOQuery
    Left = 560
  end
end
