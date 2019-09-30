inherited f_EleresAdat: Tf_EleresAdat
  Caption = 'El'#233'r'#233's'
  ClientHeight = 214
  ClientWidth = 755
  ExplicitWidth = 771
  ExplicitHeight = 253
  PixelsPerInch = 96
  TextHeight = 13
  object Label49: TLabel [0]
    Left = 536
    Top = 67
    Width = 89
    Height = 13
    Caption = #201'rv'#233'nyess'#233'g v'#233'ge'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label44: TLabel [1]
    Left = 8
    Top = 54
    Width = 57
    Height = 13
    Caption = 'El'#233'r'#233's '#233'rt'#233'k'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label45: TLabel [2]
    Left = 536
    Top = 8
    Width = 103
    Height = 13
    Caption = #201'rv'#233'nyess'#233'g kezdete'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel [3]
    Left = 8
    Top = 106
    Width = 57
    Height = 13
    Caption = 'Megjegyz'#233's'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label43: TLabel [4]
    Left = 8
    Top = 8
    Width = 55
    Height = 13
    Caption = 'El'#233'r'#233's t'#237'pus'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  inherited Panel1: TPanel
    Top = 166
    Width = 755
    ExplicitTop = 166
    ExplicitWidth = 755
    inherited bb_kilep: TBitBtn
      Left = 706
      ExplicitLeft = 706
    end
    inherited bb_nyomtat: TBitBtn
      Left = 664
      ExplicitLeft = 664
    end
    inherited bb_email: TBitBtn
      Left = 620
      ExplicitLeft = 620
    end
  end
  object me_datum2: TMaskEdit [6]
    Left = 536
    Top = 103
    Width = 70
    Height = 21
    Color = clInfoBk
    EditMask = '!9999.99.99;1;_'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    MaxLength = 10
    ParentFont = False
    TabOrder = 1
    Text = '    .  .  '
  end
  object e_megj: TEdit [7]
    Left = 8
    Top = 134
    Width = 424
    Height = 21
    Color = clInfoBk
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object me_datum1: TMaskEdit [8]
    Left = 536
    Top = 32
    Width = 81
    Height = 21
    Color = clInfoBk
    EditMask = '!9999.99.99;1;_'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    MaxLength = 10
    ParentFont = False
    TabOrder = 3
    Text = '    .  .  '
  end
  object e_nev: TEdit [9]
    Left = 8
    Top = 73
    Width = 369
    Height = 21
    HelpType = htKeyword
    HelpKeyword = 'k_'#233'rt'#233'k'
    Color = clInfoBk
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object vdc_tipus: TVDComboBox [10]
    Left = 8
    Top = 27
    Width = 128
    Height = 21
    TabOrder = 5
    OnExit = vdc_tipusExit
    ADOQuery = LISTA
    IDMezo = 'eleres_tipus_id'
    NevMezo = 'eleres_tipus_nev'
    TablaNev = 'eleres_tipus'
  end
  object p_uzenet: TPanel [11]
    Left = 256
    Top = 53
    Width = 233
    Height = 60
    TabOrder = 6
    Visible = False
  end
  inherited LISTA: TADOQuery
    Top = 72
  end
  inherited SZURESds: TDataSource
    Left = 688
    Top = 79
  end
  inherited SZURES: TADOQuery
    AfterScroll = SZURESAfterScroll
    Left = 272
    Top = 104
  end
  object ellenor: TADOQuery
    Parameters = <>
    SQL.Strings = (
      'Select count(eleres_id) as db'
      'From eleres a')
    Left = 424
    Top = 24
  end
end
