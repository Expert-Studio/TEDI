inherited f_HelyisegKeres: Tf_HelyisegKeres
  Caption = 'Helyis'#233'g keres'#233's'
  ClientHeight = 581
  ClientWidth = 924
  ExplicitLeft = -2
  ExplicitWidth = 940
  ExplicitHeight = 620
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 16
    Top = 20
    Width = 20
    Height = 15
    Caption = 'C'#237'm'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel [1]
    Left = 16
    Top = 134
    Width = 61
    Height = 15
    Caption = 'Tulajdonos'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel [2]
    Left = 16
    Top = 76
    Width = 39
    Height = 15
    Caption = 'St'#225'tusz'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object Label14: TLabel [3]
    Left = 336
    Top = 20
    Width = 129
    Height = 13
    AutoSize = False
    Caption = 'Ter'#252'let nagyobb mint'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Label6: TLabel [4]
    Left = 544
    Top = 20
    Width = 129
    Height = 13
    AutoSize = False
    Caption = 'kisebb mint'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Label8: TLabel [5]
    Left = 16
    Top = 48
    Width = 89
    Height = 13
    AutoSize = False
    Caption = 'Helyrajzi sz'#225'm'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Label10: TLabel [6]
    Left = 16
    Top = 104
    Width = 29
    Height = 15
    Caption = 'B'#233'rl'#337
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object Label13: TLabel [7]
    Left = 336
    Top = 48
    Width = 36
    Height = 15
    Caption = #214'vezet'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object Label15: TLabel [8]
    Left = 336
    Top = 76
    Width = 63
    Height = 15
    Caption = 'Rendeltet'#233's'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  inherited Panel1: TPanel
    Top = 533
    Width = 924
    inherited bb_kilep: TBitBtn
      Left = 880
    end
    inherited bb_ok: TBitBtn
      Left = 838
    end
    inherited bb_nyomtat: TBitBtn
      Left = 796
    end
    inherited bb_excel: TBitBtn
      Left = 754
    end
    inherited cb_uj: TCheckBox
      Left = 594
    end
    inherited bb_csv: TBitBtn
      Left = 711
    end
  end
  inherited dbg_lista: TDBGrid
    Width = 908
    Height = 351
  end
  inherited bb_uj: TBitBtn
    Left = 880
    Top = 11
    ExplicitLeft = 880
    ExplicitTop = 11
  end
  inherited p_keres: TPanel
    Left = 328
    Top = 212
    ExplicitLeft = 328
    ExplicitTop = 212
  end
  object e_terulettol: TEdit [13]
    Left = 464
    Top = 16
    Width = 65
    Height = 23
    Color = clInfoBk
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object e_hrsz: TEdit [14]
    Left = 120
    Top = 45
    Width = 87
    Height = 23
    Color = clInfoBk
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
  object e_kozter: TEdit [15]
    Left = 120
    Top = 16
    Width = 199
    Height = 23
    Color = clInfoBk
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
  end
  object Edit1: TEdit [16]
    Left = 620
    Top = 16
    Width = 63
    Height = 23
    Color = clInfoBk
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
  end
  object e_tulaj: TEdit [17]
    Left = 120
    Top = 130
    Width = 193
    Height = 23
    Color = clInfoBk
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
  end
  object e_berlo: TEdit [18]
    Left = 120
    Top = 101
    Width = 193
    Height = 23
    Color = clInfoBk
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
  end
  object VDComboBox1: TVDComboBox [19]
    Left = 120
    Top = 74
    Width = 145
    Height = 21
    TabOrder = 10
    Text = 'VDComboBox1'
  end
  object VDComboBox2: TVDComboBox [20]
    Left = 464
    Top = 45
    Width = 145
    Height = 21
    TabOrder = 11
    Text = 'VDComboBox1'
  end
  object VDComboBox3: TVDComboBox [21]
    Left = 464
    Top = 74
    Width = 145
    Height = 21
    TabOrder = 12
    Text = 'VDComboBox1'
  end
  inherited SZURESds: TDataSource
    Left = 164
    Top = 356
  end
  inherited SZURES: TADOQuery
    Left = 364
    Top = 400
  end
  inherited LISTA: TADOQuery
    Left = 280
    Top = 428
  end
  object ADOQuery1: TADOQuery
    Parameters = <>
    Left = 888
    Top = 128
  end
end
