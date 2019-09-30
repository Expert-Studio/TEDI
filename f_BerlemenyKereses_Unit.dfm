inherited f_BerlemenyKereses: Tf_BerlemenyKereses
  Caption = 'B'#233'rlem'#233'ny keres'#233's'
  ClientHeight = 446
  ClientWidth = 708
  ExplicitTop = -26
  ExplicitWidth = 724
  ExplicitHeight = 485
  DesignSize = (
    708
    446)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 466
    Top = 72
    Width = 38
    Height = 13
    Caption = 'Komfort'
  end
  object Label3: TLabel [1]
    Left = 466
    Top = 134
    Width = 36
    Height = 13
    Caption = 'St'#225'tusz'
  end
  object vdc_komfort: TVDComboBox [2]
    Left = 466
    Top = 100
    Width = 224
    Height = 21
    TabOrder = 6
    ADOQuery = LISTA
    IDMezo = 'KOMFORT_ID'
    NevMezo = 'KOMFORT_NEV'
    TablaNev = 'L_KOMFORTFOKOZAT'
  end
  object le_hrsz: TLabeledEdit [3]
    Left = 280
    Top = 96
    Width = 137
    Height = 21
    EditLabel.Width = 68
    EditLabel.Height = 13
    EditLabel.Caption = 'Helyrajzi sz'#225'm'
    TabOrder = 3
  end
  object le_cim: TLabeledEdit [4]
    Left = 8
    Top = 96
    Width = 233
    Height = 21
    EditLabel.Width = 17
    EditLabel.Height = 13
    EditLabel.Caption = 'C'#237'm'
    TabOrder = 7
    OnChange = bb_keresClick
  end
  object vdc_statusz: TVDComboBox [5]
    Left = 466
    Top = 156
    Width = 224
    Height = 21
    TabOrder = 8
    ADOQuery = LISTA
    IDMezo = 'es_id'
    NevMezo = 'es_nev'
    TablaNev = 'ELLENSTATUSZ'
  end
  object LabeledEdit1: TLabeledEdit [6]
    Left = 8
    Top = 161
    Width = 233
    Height = 21
    EditLabel.Width = 24
    EditLabel.Height = 13
    EditLabel.Caption = 'B'#233'rl'#337
    TabOrder = 5
    OnChange = bb_keresClick
  end
  object rg_tipus: TRadioGroup [7]
    Left = 8
    Top = 0
    Width = 321
    Height = 65
    Caption = 'B'#233'rlem'#233'ny t'#237'pus'
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      'lak'#225's'
      'helyis'#233'g'
      'egy'#233'b')
    TabOrder = 4
  end
  inherited Panel1: TPanel
    Top = 398
    Width = 708
    ExplicitTop = 398
    ExplicitWidth = 708
    DesignSize = (
      708
      48)
    inherited bb_kilep: TBitBtn
      Left = 664
      ExplicitLeft = 664
    end
    inherited bb_ok: TBitBtn
      Left = 622
      ExplicitLeft = 622
    end
    inherited bb_nyomtat: TBitBtn
      Left = 580
      ExplicitLeft = 580
    end
    inherited bb_excel: TBitBtn
      Left = 538
      ExplicitLeft = 538
    end
    inherited cb_uj: TCheckBox
      Left = 427
      Width = 42
      ExplicitLeft = 427
      ExplicitWidth = 42
    end
    inherited bb_csv: TBitBtn
      Left = 496
      ExplicitLeft = 496
    end
  end
  inherited dbg_lista: TDBGrid
    Top = 200
    Width = 692
    Height = 192
    Columns = <
      item
        Expanded = False
        FieldName = 'cim'
        Title.Alignment = taCenter
        Title.Caption = 'c'#237'm'
        Width = 210
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'hrsz'
        Title.Alignment = taCenter
        Width = 139
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'terulet'
        Title.Alignment = taCenter
        Title.Caption = 'ter'#252'let'
        Width = 149
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'komfort'
        Title.Alignment = taCenter
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'statusz'
        Title.Alignment = taCenter
        Title.Caption = 'st'#225'tusz'
        Width = 85
        Visible = True
      end>
  end
  inherited bb_uj: TBitBtn
    Left = 664
    OnClick = bb_ujClick
    ExplicitLeft = 664
  end
  inherited p_keres: TPanel
    TabOrder = 9
  end
  inherited SZURESds: TDataSource
    Left = 600
    Top = 240
  end
  inherited SZURES: TADOQuery
    AfterScroll = SZURESAfterScroll
    Left = 568
    Top = 64
  end
  inherited LISTA: TADOQuery
    Left = 368
    Top = 128
  end
end
