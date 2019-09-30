object f_SzamlaKep: Tf_SzamlaKep
  Left = 0
  Top = 0
  Caption = 'f_SzamlaKep'
  ClientHeight = 827
  ClientWidth = 861
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object QuickRep1: TQuickRep
    Left = 24
    Top = 8
    Width = 635
    Height = 898
    ShowingPreview = True
    DataSet = SZURES
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    OnPreview = QuickRep1Preview
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Continuous = False
    Page.Values = (
      100.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      100.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrinterSettings.MemoryLimit = 1000000
    PrinterSettings.PrintQuality = 0
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 0
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 80
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    PreviewWidth = 500
    PreviewHeight = 500
    PrevInitialZoom = qrZoomToFit
    PreviewDefaultSaveType = stPDF
    PreviewLeft = 0
    PreviewTop = 0
    object QRBand1: TQRBand
      Left = 30
      Top = 30
      Width = 575
      Height = 32
      Frame.DrawBottom = True
      Frame.Width = 2
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        1901.692708333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbTitle
      object QRLabel1: TQRLabel
        Left = 250
        Top = 6
        Width = 64
        Height = 18
        Size.Values = (
          59.531250000000000000
          826.822916666666700000
          19.843750000000000000
          211.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'SZ'#193'MLA'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 14
      end
    end
    object qrb_fejlec: TQRBand
      Left = 30
      Top = 62
      Width = 575
      Height = 331
      Frame.DrawBottom = True
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      LinkBand = qrb_tetel
      Size.Values = (
        1094.713541666667000000
        1901.692708333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbColumnHeader
      object qrl_elado: TQRLabel
        Left = 6
        Top = 5
        Width = 327
        Height = 41
        Size.Values = (
          134.937500000000000000
          21.166666666666670000
          15.875000000000000000
          1082.145833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrl_elado'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel2: TQRLabel
        Left = 346
        Top = 7
        Width = 94
        Height = 18
        Size.Values = (
          59.531250000000000000
          1144.322916666667000000
          23.151041666666670000
          310.885416666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sz'#225'mla sz'#225'ma:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRDBText1: TQRDBText
        Left = 454
        Top = 7
        Width = 73
        Height = 16
        Size.Values = (
          52.916666666666670000
          1501.510416666667000000
          23.151041666666670000
          241.432291666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = SZURES
        DataField = 'QRDBText1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object qrl_eladocim: TQRLabel
        Left = 6
        Top = 50
        Width = 327
        Height = 14
        Size.Values = (
          47.625000000000000000
          21.166666666666670000
          166.687500000000000000
          1082.145833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrl_elado'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrl_eladoszamla: TQRLabel
        Left = 6
        Top = 70
        Width = 206
        Height = 14
        Size.Values = (
          47.625000000000000000
          21.166666666666670000
          230.187500000000000000
          679.979166666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'sz'#225'mlasz'#225'm:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 6
        Top = 89
        Width = 206
        Height = 14
        Size.Values = (
          47.625000000000000000
          21.166666666666670000
          293.687500000000000000
          679.979166666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'ad'#243'sz'#225'm:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel4: TQRLabel
        Left = 6
        Top = 121
        Width = 74
        Height = 14
        Size.Values = (
          46.302083333333330000
          19.843750000000000000
          400.182291666666700000
          244.739583333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'A sz'#225'mla kelte:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel5: TQRLabel
        Left = 6
        Top = 140
        Width = 93
        Height = 14
        Size.Values = (
          46.302083333333330000
          19.843750000000000000
          463.020833333333300000
          307.578125000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Teljes'#237't'#233's id'#337'pontja:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel6: TQRLabel
        Left = 6
        Top = 159
        Width = 81
        Height = 14
        Size.Values = (
          46.302083333333330000
          19.843750000000000000
          525.859375000000000000
          267.890625000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fizet'#233'si hat'#225'rid'#337':'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel7: TQRLabel
        Left = 6
        Top = 178
        Width = 70
        Height = 14
        Size.Values = (
          46.302083333333330000
          19.843750000000000000
          588.697916666666700000
          231.510416666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fizet'#233's m'#243'dja:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel8: TQRLabel
        Left = 260
        Top = 121
        Width = 88
        Height = 14
        Size.Values = (
          46.302083333333330000
          859.895833333333300000
          400.182291666666700000
          291.041666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sz'#225'mlafizet'#337' neve:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel9: TQRLabel
        Left = 260
        Top = 140
        Width = 73
        Height = 14
        Size.Values = (
          46.302083333333330000
          859.895833333333300000
          463.020833333333300000
          241.432291666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sz'#233'khely c'#237'me:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel10: TQRLabel
        Left = 260
        Top = 159
        Width = 54
        Height = 14
        Size.Values = (
          46.302083333333330000
          859.895833333333300000
          525.859375000000000000
          178.593750000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Ad'#243'sz'#225'ma:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel11: TQRLabel
        Left = 6
        Top = 217
        Width = 62
        Height = 14
        Size.Values = (
          46.302083333333330000
          19.843750000000000000
          717.682291666666700000
          205.052083333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Megnevez'#233's:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel12: TQRLabel
        Left = 6
        Top = 274
        Width = 45
        Height = 14
        Size.Values = (
          46.302083333333330000
          19.843750000000000000
          906.197916666666700000
          148.828125000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'B'#233'rl'#337'k'#243'd:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel13: TQRLabel
        Left = 6
        Top = 313
        Width = 90
        Height = 14
        Size.Values = (
          46.302083333333330000
          19.843750000000000000
          1035.182291666667000000
          297.656250000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'T'#233'tel megnevez'#233'se'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel14: TQRLabel
        Left = 211
        Top = 313
        Width = 47
        Height = 14
        Size.Values = (
          46.302083333333330000
          697.838541666666700000
          1035.182291666667000000
          155.442708333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'SZJ sz'#225'm'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel15: TQRLabel
        Left = 277
        Top = 313
        Width = 37
        Height = 14
        Size.Values = (
          46.302083333333330000
          916.119791666666700000
          1035.182291666667000000
          122.369791666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Id'#337'szak'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel16: TQRLabel
        Left = 333
        Top = 313
        Width = 52
        Height = 14
        Size.Values = (
          46.302083333333330000
          1101.328125000000000000
          1035.182291666667000000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Nett'#243' '#233'rt'#233'k'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel17: TQRLabel
        Left = 6
        Top = 198
        Width = 99
        Height = 14
        Size.Values = (
          46.302083333333330000
          19.843750000000000000
          654.843750000000000000
          327.421875000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'A sz'#225'mla p'#233'nzneme:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel18: TQRLabel
        Left = 396
        Top = 313
        Width = 34
        Height = 14
        Size.Values = (
          46.302083333333330000
          1309.687500000000000000
          1035.182291666667000000
          112.447916666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = #193'FA %'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel19: TQRLabel
        Left = 435
        Top = 313
        Width = 48
        Height = 14
        Size.Values = (
          46.302083333333330000
          1438.671875000000000000
          1035.182291666667000000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = #193'FA '#233'rt'#233'k'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel20: TQRLabel
        Left = 496
        Top = 313
        Width = 55
        Height = 14
        Size.Values = (
          46.302083333333330000
          1640.416666666667000000
          1035.182291666667000000
          181.901041666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Brutt'#243' '#233'rt'#233'k'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRDbDMBarcode1: TQRDbDMBarcode
        Left = 480
        Top = 32
        Width = 89
        Height = 52
        Size.Values = (
          171.979166666666700000
          1587.500000000000000000
          105.833333333333300000
          294.348958333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        MatrixRows = m12x12
        FNCChar = '['
        GS1 = False
        QuietZone = True
        AutoSize = False
        DataField = 'QRDbDMBarcode1'
        FontSize = 10
      end
      object QRShape1: TQRShape
        Left = 250
        Top = 178
        Width = 302
        Height = 123
        Size.Values = (
          407.458333333333400000
          825.500000000000100000
          590.020833333333400000
          997.479166666666900000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRDBText3: TQRDBText
        Left = 292
        Top = 234
        Width = 73
        Height = 18
        Size.Values = (
          59.531250000000000000
          965.729166666666700000
          773.906250000000000000
          241.432291666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataField = 'QRDBText3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRDBText4: TQRDBText
        Left = 292
        Top = 258
        Width = 73
        Height = 18
        Size.Values = (
          59.531250000000000000
          965.729166666666700000
          853.281250000000000000
          241.432291666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataField = 'QRDBText4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRDBText5: TQRDBText
        Left = 292
        Top = 277
        Width = 73
        Height = 18
        Size.Values = (
          59.531250000000000000
          965.729166666666700000
          916.119791666666700000
          241.432291666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataField = 'QRDBText5'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 12
      end
    end
    object QRDBText2: TQRDBText
      Left = 322
      Top = 260
      Width = 73
      Height = 18
      Size.Values = (
        59.531250000000000000
        1064.947916666667000000
        859.895833333333300000
        241.432291666666700000)
      XLColumn = 0
      XLNumFormat = nfGeneral
      ActiveInPreview = False
      Alignment = taLeftJustify
      AlignToBand = False
      Color = clWhite
      DataField = 'QRDBText2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      ExportAs = exptText
      WrapStyle = BreakOnSpaces
      FullJustify = False
      MaxBreakChars = 0
      VerticalAlignment = tlTop
      FontSize = 12
    end
    object qrb_tetel: TQRBand
      Left = 30
      Top = 393
      Width = 575
      Height = 24
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        79.375000000000000000
        1901.692708333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object qr_megnevezes: TQRDBText
        Left = 6
        Top = 4
        Width = 73
        Height = 14
        Size.Values = (
          46.302083333333330000
          19.843750000000000000
          13.229166666666670000
          241.432291666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataField = 'qr_megnevezes'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qr_szj: TQRDBText
        Left = 211
        Top = 4
        Width = 29
        Height = 14
        Size.Values = (
          46.302083333333330000
          697.838541666666700000
          13.229166666666670000
          95.911458333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataField = 'qr_szj'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qr_idoszak: TQRDBText
        Left = 270
        Top = 4
        Width = 51
        Height = 14
        Size.Values = (
          46.302083333333330000
          892.968750000000000000
          13.229166666666670000
          168.671875000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataField = 'qr_idoszak'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qr_netto: TQRDBText
        Left = 346
        Top = 4
        Width = 38
        Height = 14
        Size.Values = (
          46.302083333333330000
          1144.322916666667000000
          13.229166666666670000
          125.677083333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataField = 'qr_netto'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qr_afa1: TQRDBText
        Left = 389
        Top = 4
        Width = 34
        Height = 14
        Size.Values = (
          46.302083333333330000
          1286.536458333333000000
          13.229166666666670000
          112.447916666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataField = 'qr_afa1'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qr_afa2: TQRDBText
        Left = 450
        Top = 4
        Width = 34
        Height = 14
        Size.Values = (
          46.302083333333330000
          1488.281250000000000000
          13.229166666666670000
          112.447916666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataField = 'qr_afa2'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qr_brutto: TQRDBText
        Left = 510
        Top = 4
        Width = 42
        Height = 14
        Size.Values = (
          46.302083333333330000
          1686.718750000000000000
          13.229166666666670000
          138.906250000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataField = 'qr_brutto'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object qrb_lablec: TQRPBand
      Left = 30
      Top = 417
      Width = 575
      Height = 32
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      LinkBand = qrb_tetel
      Size.Values = (
        105.833333333333300000
        1901.692708333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      AlwaysUseSpace = False
      NotOnFirstPage = False
      NotOnLastPage = False
    end
  end
  object SZURES: TADOQuery
    Connection = AdatModul.ADOConn
    Parameters = <
      item
        Name = 'SZAMLA_ID'
        DataType = ftString
        Size = 1
        Value = '1'
      end>
    SQL.Strings = (
      'Select *'
      'From szamla'
      'Where szamla_id = :SZAMLA_ID')
    Left = 504
    Top = 32
  end
  object SZURESds: TDataSource
    DataSet = SZURES
    Left = 552
    Top = 192
  end
end
