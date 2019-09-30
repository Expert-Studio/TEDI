inherited f_BerloKeres: Tf_BerloKeres
  Caption = 'B'#233'rl'#337' keres'#233'se'
  ClientHeight = 543
  ClientWidth = 726
  ExplicitWidth = 742
  ExplicitHeight = 582
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 323
    Top = 0
    Width = 30
    Height = 13
    Caption = 'Mett'#337'l'
  end
  object Meddig: TLabel [1]
    Left = 323
    Top = 58
    Width = 34
    Height = 13
    Caption = 'Meddig'
  end
  object Label3: TLabel [2]
    Left = 8
    Top = 122
    Width = 32
    Height = 13
    Caption = 'Jogc'#237'm'
  end
  object Label4: TLabel [3]
    Left = 323
    Top = 122
    Width = 36
    Height = 13
    Caption = 'St'#225'tusz'
  end
  object le_berlokod: TLabeledEdit [4]
    Left = 8
    Top = 82
    Width = 241
    Height = 21
    EditLabel.Width = 73
    EditLabel.Height = 13
    EditLabel.Caption = 'B'#233'rl'#337' azonos'#237't'#243
    TabOrder = 5
    OnChange = bb_keresClick
  end
  object vdc_allapot: TVDComboBox [5]
    Left = 323
    Top = 146
    Width = 145
    Height = 21
    TabOrder = 10
    ADOQuery = LISTA
    IDMezo = 'bstatusz_id'
    NevMezo = 'bstatusz_nev'
    TablaNev = 'berles_statusza'
  end
  object rg_tipus: TRadioGroup [6]
    Left = 506
    Top = 0
    Width = 159
    Height = 105
    Caption = 'T'#237'pus'
    Items.Strings = (
      'szem'#233'ly'
      'szervezet'
      'egy'#233'ni v'#225'llalkoz'#243)
    TabOrder = 6
  end
  object dtp_meddig: TDateTimePicker [7]
    Left = 323
    Top = 82
    Width = 153
    Height = 21
    Date = 42868.760037650460000000
    Time = 42868.760037650460000000
    ShowCheckbox = True
    Checked = False
    TabOrder = 4
  end
  object CheckBox1: TCheckBox [8]
    Left = 506
    Top = 128
    Width = 119
    Height = 17
    Alignment = taLeftJustify
    Caption = 'R'#233'szletfizet'#337'?'
    TabOrder = 7
  end
  object cb_aktiv: TCheckBox [9]
    Left = 506
    Top = 174
    Width = 119
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Akt'#237'v?'
    TabOrder = 11
  end
  object vdc_jogcim: TVDComboBox [10]
    Left = 8
    Top = 146
    Width = 249
    Height = 21
    TabOrder = 9
    ADOQuery = LISTA
    IDMezo = 'berlesjog_id'
    NevMezo = 'berlesjog_neve'
    TablaNev = 'berles_jogcime'
  end
  object dtp_mettol: TDateTimePicker [11]
    Left = 323
    Top = 25
    Width = 153
    Height = 21
    Date = 42868.759430324080000000
    Time = 42868.759430324080000000
    ShowCheckbox = True
    Checked = False
    MaxDate = 73415.999988425930000000
    MinDate = 2.000000000000000000
    TabOrder = 13
  end
  object CheckBox2: TCheckBox [12]
    Left = 506
    Top = 151
    Width = 119
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Peres'#237'tett?'
    TabOrder = 8
  end
  object le_berlonev: TLabeledEdit [13]
    Left = 8
    Top = 25
    Width = 241
    Height = 21
    EditLabel.Width = 51
    EditLabel.Height = 13
    EditLabel.Caption = 'B'#233'rl'#337' neve'
    TabOrder = 12
    OnChange = bb_keresClick
  end
  inherited Panel1: TPanel
    Top = 495
    Width = 726
    ExplicitTop = 495
    ExplicitWidth = 726
    inherited bb_kilep: TBitBtn
      Left = 682
      ExplicitLeft = 682
    end
    inherited bb_ok: TBitBtn
      Left = 640
      OnClick = bb_okClick
      ExplicitLeft = 640
    end
    inherited bb_nyomtat: TBitBtn
      Left = 598
      ExplicitLeft = 598
    end
    inherited bb_excel: TBitBtn
      Left = 556
      ExplicitLeft = 556
    end
    inherited cb_uj: TCheckBox
      Left = 451
      ExplicitLeft = 451
    end
    inherited bb_csv: TBitBtn
      Left = 514
      ExplicitLeft = 514
    end
  end
  inherited dbg_lista: TDBGrid
    Top = 216
    Width = 710
    Height = 273
    Columns = <
      item
        Expanded = False
        FieldName = 'berlo'
        Title.Alignment = taCenter
        Title.Caption = 'b'#233'rl'#337
        Title.Color = clMoneyGreen
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'berlesjog'
        Title.Alignment = taCenter
        Title.Caption = 'b'#233'rl'#233'sjog'
        Title.Color = clMoneyGreen
        Width = 132
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'statusz'
        Title.Alignment = taCenter
        Title.Caption = 'st'#225'tusz'
        Title.Color = clMoneyGreen
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'hasznalt_terulet'
        Title.Alignment = taCenter
        Title.Caption = 'ter'#252'let'
        Visible = True
      end>
  end
  inherited bb_uj: TBitBtn
    Left = 682
    OnClick = bb_ujClick
    ExplicitLeft = 682
  end
  inherited SZURESds: TDataSource
    Left = 656
    Top = 304
  end
  inherited SZURES: TADOQuery
    AfterOpen = SZURESAfterOpen
    AfterScroll = SZURESAfterScroll
    Left = 272
    Top = 24
  end
  inherited LISTA: TADOQuery
    Left = 520
    Top = 296
  end
end
