inherited f_AdatMigracio: Tf_AdatMigracio
  Caption = 'Adatmigr'#225'ci'#243
  ClientHeight = 509
  ClientWidth = 818
  ExplicitWidth = 834
  ExplicitHeight = 548
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 461
    Width = 818
    ExplicitTop = 461
    ExplicitWidth = 818
    inherited bb_kilep: TBitBtn
      Left = 774
      ExplicitLeft = 774
    end
    inherited bb_ok: TBitBtn
      Left = 732
      ExplicitLeft = 732
    end
    inherited bb_nyomtat: TBitBtn
      Left = 690
      ExplicitLeft = 690
    end
    inherited bb_excel: TBitBtn
      Left = 648
      ExplicitLeft = 648
    end
    inherited cb_uj: TCheckBox
      Left = 488
      ExplicitLeft = 488
    end
    inherited bb_csv: TBitBtn
      Left = 605
      ExplicitLeft = 605
    end
  end
  inherited dbg_lista: TDBGrid
    Width = 802
    Height = 279
  end
  inherited bb_uj: TBitBtn
    Left = 774
    Visible = False
    ExplicitLeft = 774
  end
  object BitBtn1: TBitBtn [4]
    Left = 16
    Top = 13
    Width = 133
    Height = 25
    Caption = 'Szem'#233'lyek'
    TabOrder = 4
  end
  object BitBtn2: TBitBtn [5]
    Left = 16
    Top = 44
    Width = 133
    Height = 25
    Caption = 'Szervezetek'
    TabOrder = 5
    OnClick = BitBtn2Click
  end
  object m: TMemo [6]
    Left = 168
    Top = 15
    Width = 593
    Height = 150
    TabOrder = 6
  end
  inherited SZURES: TADOQuery
    Connection = JURTA
  end
  inherited LISTA: TADOQuery
    Connection = AdatModul.ADOConn
  end
  object JURTA: TADOConnection
    ConnectionString = 
      'Provider=SQLNCLI11.1;Persist Security Info=False;User ID=sa;Init' +
      'ial Catalog=TIR_teszt;Data Source=TVVRT-SQL;Initial File Name=""' +
      ';Server SPN="";'
    CursorLocation = clUseServer
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'SQLNCLI11.1'
    Left = 608
    Top = 40
  end
end
