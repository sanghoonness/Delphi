object frmMonthlyReport: TfrmMonthlyReport
  Left = 438
  Top = 250
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #50900#48324' '#45236#50669
  ClientHeight = 413
  ClientWidth = 1037
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object AdvPanel4: TAdvPanel
    Left = 0
    Top = 341
    Width = 1037
    Height = 72
    Align = alBottom
    BevelOuter = bvNone
    Color = 16445929
    Font.Charset = ANSI_CHARSET
    Font.Color = 7485192
    Font.Height = -12
    Font.Name = #44404#47548#52404
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    UseDockManager = True
    Version = '2.3.0.0'
    AutoHideChildren = False
    BorderColor = 16765615
    Caption.Color = 16773091
    Caption.ColorTo = 16765615
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clBlack
    Caption.Font.Height = -11
    Caption.Font.Name = 'MS Sans Serif'
    Caption.Font.Style = []
    Caption.GradientDirection = gdVertical
    Caption.Indent = 2
    Caption.ShadeLight = 255
    CollapsColor = clHighlight
    CollapsDelay = 0
    ColorTo = 15587527
    ColorMirror = 15587527
    ColorMirrorTo = 16773863
    ShadowColor = clBlack
    ShadowOffset = 0
    StatusBar.BorderColor = 16765615
    StatusBar.BorderStyle = bsSingle
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = 7485192
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    StatusBar.Color = 16245715
    StatusBar.ColorTo = 16109747
    StatusBar.GradientDirection = gdVertical
    Text = ''
    FullHeight = 157
    object Bevel14: TBevel
      Left = 24
      Top = 26
      Width = 97
      Height = 20
    end
    object Label14: TLabel
      Left = 48
      Top = 30
      Width = 48
      Height = 12
      Alignment = taCenter
      Caption = #51312#54924#51068#51088
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object edtPDate: TAdvMaskEdit
      Left = 128
      Top = 26
      Width = 77
      Height = 20
      Color = clWindow
      Enabled = True
      EditMask = '!9999-99;1'
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeName = 'Microsoft Office IME 2007'
      MaxLength = 7
      ParentFont = False
      TabOrder = 0
      Text = '    -  '
      Visible = True
      AutoFocus = False
      Flat = False
      FlatLineColor = clBlack
      FlatParentColor = True
      ShowModified = False
      FocusColor = clWindow
      FocusBorder = False
      FocusFontColor = clBlack
      LabelAlwaysEnabled = False
      LabelPosition = lpLeftTop
      LabelMargin = 4
      LabelTransparent = False
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'MS Sans Serif'
      LabelFont.Style = []
      ModifiedColor = clRed
      SelectFirstChar = False
      Version = '3.3.2.0'
    end
    object btnSearch: TBitBtn
      Left = 618
      Top = 21
      Width = 97
      Height = 35
      Caption = #51312'  '#54924
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = #44404#47548#52404
      Font.Style = []
      Glyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000130B0000130B000000010000000100005A6B7300AD7B
        73004A637B00EFBD8400B58C8C00A5948C00C6948C00B59C8C00BD9C8C00BD94
        9400C6949400C69C9400CEAD9400F7CE9400C6A59C00CEA59C00C6AD9C00CEAD
        9C00F7CE9C004A7BA500CEADA500D6B5A500DEBDA500F7D6A500DEBDAD00DEC6
        AD00E7C6AD00FFDEAD00FFE7AD00CEB5B500F7DEB500F7E7B500FFE7B500D6BD
        BD00DED6BD00E7DEBD006B9CC600FFEFC600FFF7C600F7E7CE00FFF7CE0018A5
        D60021A5D60029ADD600F7EFD600F7F7D600FFF7D600FFFFD6002184DE0039AD
        DE0031B5DE0039B5DE0042B5DE0042BDDE00FFFFDE001884E700188CE7004ABD
        E70052C6E7005AC6E7006BC6E700FFFFE700218CEF005ACEEF005AD6EF0063D6
        EF00B5D6EF0094DEEF00F7F7EF00FFF7EF00FFFFEF009CDEF700A5DEF70073E7
        F7007BE7F700A5E7F700ADE7F7007BEFF70094EFF700ADEFF700FFFFF700FF00
        FF004AB5FF0052B5FF0052BDFF0073E7FF008CE7FF0084EFFF008CEFFF0094EF
        FF0084F7FF008CF7FF0094F7FF009CF7FF00A5F7FF0094FFFF009CFFFF00A5FF
        FF00B5FFFF00BDFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00515151515151
        5151515151515151515151515151515151515151515151515151515151515151
        515151515109025151515151515151515151515151515151515151510A133824
        515151515151515151515151515151515151510A133E53525151515151515151
        515151515151515151510A133753535151515151515151515151515151515151
        51091338525351515151513131313131515151510F150E015100305253515151
        51515131434A403A3A3514236363632707054254515151515151512A48635F60
        580444636363606025151D5151515151515151293C635F5C5C22636363606060
        551E0651515151515151512B3B4B615B0B2C636363606060551C165151515151
        515151333B43615B102D636360606057571B1A5151515151515151334A3B4F5F
        0E2C636060606057552018515151515151515133583B4C615B23606060605755
        25250B5151515151515151335C493C4B4F082657555755456419583251515151
        515151335C5F3B3B3B3B111E201C252C2155603A51515151515151344E5F605F
        5B57493B1616110C5659624E2B515151515151335C5F5C5C5C5C5D5A3B3B4347
        43474B4B34515151515151345C5F5C5C5C5C5C5C5C4D3B3B3B2B2B312B515151
        515151345E605C5C5B594E4E4E59595D4151515151515151515151512B626061
        603F31343434393A3451515151515151515151512B2B2B2B2B2B515151515151
        5151515151515151515151515151515151515151515151515151515151515151
        5151515151515151515151515151515151515151515151515151}
      ParentFont = False
      TabOrder = 1
      OnClick = btnSearchClick
    end
    object btnPrint: TBitBtn
      Left = 825
      Top = 21
      Width = 97
      Height = 35
      Caption = #51064'  '#49604
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = #44404#47548#52404
      Font.Style = []
      Glyph.Data = {
        96010000424D9601000000000000760000002800000018000000180000000100
        0400000000002001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDD7877DD78887DDDDDDDDDDD78FF87777788F88DDDDDDD
        78FFFF8700007778F87DDDD78FFFFF887700000777DDD78FFFFF877778777000
        07DDD7FFF88788877777777777DDD788878888F88877777787DDD77788888FFF
        F888877777DDD78888888F8888FF888887DDD7888888F8777778888887DDDD88
        888F88F8F888777888DDDDD788878FFFFFFF88877DDDDDDDD78887888F888888
        DDDDDDDDD7FF88888888878DDDDDDDDDDD8FF88888888DDDDDDDDDDDDD8FF888
        8888DDDDDDDDDDDDDD8FF888888DDDDDDDDDDDDDDD8FF888888DDDDDDDDDDDDD
        DD8FF888888DDDDDDDDDDDDDDD8FF888888DDDDDDDDDDDDDD8FFF88888DDDDDD
        DDDDDDDDD8FFF88888DDDDDDDDDDDDDD888888888DDDDDDDDDDD}
      ParentFont = False
      TabOrder = 2
      OnClick = btnPrintClick
    end
    object btnClose: TBitBtn
      Left = 927
      Top = 21
      Width = 97
      Height = 35
      Caption = #51333'  '#47308
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = #44404#47548#52404
      Font.Style = []
      Glyph.Data = {
        96010000424D9601000000000000760000002800000018000000180000000100
        0400000000002001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDD77D
        DDDDDDDDDDDDDDDDDD77777DDDDDDDDDDDDDDDD7777777777777777777DDD777
        777777777888888887DDD777777777733333333387DDD7777777777333333333
        87DDD777777777733333333387DDD777777777733333333787DDD77777777773
        3333333787DDD777777777733333337787DDD778888877733333777787DDD778
        888F87777377778887DDD77888FF87777788888887DDD788888F877888888888
        87DDD788888887788888888887DDD788888887788888888887DDD78888888778
        8FFFF88887DDD788888887788FF88F8887DDD7888888877888F8888887DDD788
        888887788888888887DDD777888887788888888887DDDDD77778877777777777
        77DDDDDDDD77777DDDDDDDDDDDDDDDDDDDDDD77DDDDDDDDDDDDD}
      ParentFont = False
      TabOrder = 3
      OnClick = btnCloseClick
    end
    object btnExcel: TBitBtn
      Left = 719
      Top = 21
      Width = 105
      Height = 35
      Caption = #50641#49472#51200#51109'(&E)'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = #44404#47548#52404
      Font.Style = []
      Glyph.Data = {
        96010000424D9601000000000000760000002800000018000000180000000100
        0400000000002001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDD7877DD78887DDDDDDDDDDD78FF87777788F88DDDDDDD
        78FFFF8700007778F87DDDD78FFFFF887700000777DDD78FFFFF877778777000
        07DDD7FFF88788877777777777DDD788878888F88877777787DDD77788888FFF
        F888877777DDD78888888F8888FF888887DDD7888888F8777778888887DDDD88
        888F88F8F888777888DDDDD788878FFFFFFF88877DDDDDDDD78887888F888888
        DDDDDDDDD7FF88888888878DDDDDDDDDDD8FF88888888DDDDDDDDDDDDD8FF888
        8888DDDDDDDDDDDDDD8FF888888DDDDDDDDDDDDDDD8FF888888DDDDDDDDDDDDD
        DD8FF888888DDDDDDDDDDDDDDD8FF888888DDDDDDDDDDDDDD8FFF88888DDDDDD
        DDDDDDDDD8FFF88888DDDDDDDDDDDDDD888888888DDDDDDDDDDD}
      ParentFont = False
      TabOrder = 4
      OnClick = btnExcelClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1037
    Height = 273
    Align = alTop
    TabOrder = 1
    object dgTKProc: TDBAdvGrid
      Left = 1
      Top = 1
      Width = 1035
      Height = 168
      Cursor = crDefault
      Align = alTop
      ColCount = 16
      DoubleBuffered = True
      DrawingStyle = gdsClassic
      RowCount = 2
      FixedRows = 1
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      Options = [goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goColSizing, goRowSelect]
      ParentDoubleBuffered = False
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 0
      GridLineColor = 15062992
      HoverRowCells = [hcNormal, hcSelected]
      ActiveCellFont.Charset = DEFAULT_CHARSET
      ActiveCellFont.Color = clWindowText
      ActiveCellFont.Height = -11
      ActiveCellFont.Name = 'Tahoma'
      ActiveCellFont.Style = [fsBold]
      ActiveCellColor = 10344697
      ActiveCellColorTo = 6210033
      ControlLook.FixedGradientFrom = 16513526
      ControlLook.FixedGradientTo = 15260626
      ControlLook.FixedGradientHoverFrom = clGray
      ControlLook.FixedGradientHoverTo = clWhite
      ControlLook.FixedGradientDownFrom = clGray
      ControlLook.FixedGradientDownTo = clSilver
      ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
      ControlLook.DropDownHeader.Font.Color = clWindowText
      ControlLook.DropDownHeader.Font.Height = -11
      ControlLook.DropDownHeader.Font.Name = 'Tahoma'
      ControlLook.DropDownHeader.Font.Style = []
      ControlLook.DropDownHeader.Visible = True
      ControlLook.DropDownHeader.Buttons = <>
      ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
      ControlLook.DropDownFooter.Font.Color = clWindowText
      ControlLook.DropDownFooter.Font.Height = -11
      ControlLook.DropDownFooter.Font.Name = 'Tahoma'
      ControlLook.DropDownFooter.Font.Style = []
      ControlLook.DropDownFooter.Visible = True
      ControlLook.DropDownFooter.Buttons = <>
      Filter = <>
      FilterDropDown.Font.Charset = DEFAULT_CHARSET
      FilterDropDown.Font.Color = clWindowText
      FilterDropDown.Font.Height = -11
      FilterDropDown.Font.Name = 'Tahoma'
      FilterDropDown.Font.Style = []
      FilterDropDown.TextChecked = 'Checked'
      FilterDropDown.TextUnChecked = 'Unchecked'
      FilterDropDownClear = '(All)'
      FilterEdit.TypeNames.Strings = (
        'Starts with'
        'Ends with'
        'Contains'
        'Not contains'
        'Equal'
        'Not equal'
        'Clear')
      FixedColWidth = 20
      FixedRowHeight = 22
      FixedFont.Charset = DEFAULT_CHARSET
      FixedFont.Color = clWindowText
      FixedFont.Height = -11
      FixedFont.Name = 'Tahoma'
      FixedFont.Style = [fsBold]
      FloatFormat = '%.2f'
      PrintSettings.DateFormat = 'dd/mm/yyyy'
      PrintSettings.Font.Charset = DEFAULT_CHARSET
      PrintSettings.Font.Color = clWindowText
      PrintSettings.Font.Height = -11
      PrintSettings.Font.Name = 'MS Sans Serif'
      PrintSettings.Font.Style = []
      PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
      PrintSettings.FixedFont.Color = clWindowText
      PrintSettings.FixedFont.Height = -11
      PrintSettings.FixedFont.Name = 'MS Sans Serif'
      PrintSettings.FixedFont.Style = []
      PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
      PrintSettings.HeaderFont.Color = clWindowText
      PrintSettings.HeaderFont.Height = -11
      PrintSettings.HeaderFont.Name = 'MS Sans Serif'
      PrintSettings.HeaderFont.Style = []
      PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
      PrintSettings.FooterFont.Color = clWindowText
      PrintSettings.FooterFont.Height = -11
      PrintSettings.FooterFont.Name = 'MS Sans Serif'
      PrintSettings.FooterFont.Style = []
      PrintSettings.PageNumSep = '/'
      SearchFooter.Color = 16773091
      SearchFooter.ColorTo = 16765615
      SearchFooter.FindNextCaption = 'Find &next'
      SearchFooter.FindPrevCaption = 'Find &previous'
      SearchFooter.Font.Charset = DEFAULT_CHARSET
      SearchFooter.Font.Color = clWindowText
      SearchFooter.Font.Height = -11
      SearchFooter.Font.Name = 'MS Sans Serif'
      SearchFooter.Font.Style = []
      SearchFooter.HighLightCaption = 'Highlight'
      SearchFooter.HintClose = 'Close'
      SearchFooter.HintFindNext = 'Find next occurence'
      SearchFooter.HintFindPrev = 'Find previous occurence'
      SearchFooter.HintHighlight = 'Highlight occurences'
      SearchFooter.MatchCaseCaption = 'Match case'
      SelectionColor = 6210033
      SortSettings.DefaultFormat = ssAutomatic
      Version = '2.3.6.9'
      AutoCreateColumns = True
      AutoRemoveColumns = True
      Columns = <
        item
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'MS Sans Serif'
          HeaderFont.Style = []
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'MS Sans Serif'
          PrintFont.Style = []
          Width = 20
        end
        item
          Alignment = taCenter
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'UnitName'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Header = #52376#47532#44592#44592
          HeaderFont.Charset = ANSI_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -12
          HeaderFont.Name = #44404#47548#52404
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = ANSI_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -12
          PrintFont.Name = #44404#47548#52404
          PrintFont.Style = []
          Width = 88
        end
        item
          Alignment = taCenter
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'CDate'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Header = #47560#44048#51068#51088
          HeaderFont.Charset = ANSI_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -12
          HeaderFont.Name = #44404#47548#52404
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = ANSI_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -12
          PrintFont.Name = #44404#47548#52404
          PrintFont.Style = []
          Width = 82
        end
        item
          Alignment = taCenter
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'CTime'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Header = #47560#44048#49884#44033
          HeaderFont.Charset = ANSI_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -12
          HeaderFont.Name = #44404#47548#52404
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = ANSI_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -12
          PrintFont.Name = #44404#47548#52404
          PrintFont.Style = []
          Width = 64
        end
        item
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'ProcCnt'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Header = #52376#47532#44148#49688
          HeaderFont.Charset = ANSI_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -12
          HeaderFont.Name = #44404#47548#52404
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = ANSI_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -12
          PrintFont.Name = #44404#47548#52404
          PrintFont.Style = []
          Width = 64
        end
        item
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'ProcFee'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Header = #51452#52264#44552#50529
          HeaderFont.Charset = ANSI_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -12
          HeaderFont.Name = #44404#47548#52404
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = ANSI_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -12
          PrintFont.Name = #44404#47548#52404
          PrintFont.Style = []
          Width = 64
        end
        item
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'DCCnt'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Header = #54624#51064#44148#49688
          HeaderFont.Charset = ANSI_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -12
          HeaderFont.Name = #44404#47548#52404
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = ANSI_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -12
          PrintFont.Name = #44404#47548#52404
          PrintFont.Style = []
          Width = 64
        end
        item
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'ProcDC'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Header = #54624#51064#44552#50529
          HeaderFont.Charset = ANSI_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -12
          HeaderFont.Name = #44404#47548#52404
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = ANSI_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -12
          PrintFont.Name = #44404#47548#52404
          PrintFont.Style = []
          Width = 64
        end
        item
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'ProcRealFee'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Header = #48155#51008#44552#50529
          HeaderFont.Charset = ANSI_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -12
          HeaderFont.Name = #44404#47548#52404
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = ANSI_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -12
          PrintFont.Name = #44404#47548#52404
          PrintFont.Style = []
          Width = 64
        end
        item
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'cashCnt'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Header = #54788#44552#44148#49688
          HeaderFont.Charset = ANSI_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -12
          HeaderFont.Name = #44404#47548#52404
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = ANSI_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -12
          PrintFont.Name = #44404#47548#52404
          PrintFont.Style = []
          Width = 64
        end
        item
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'cashAmt'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Header = #54788#44552#44552#50529
          HeaderFont.Charset = ANSI_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -12
          HeaderFont.Name = #44404#47548#52404
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = ANSI_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -12
          PrintFont.Name = #44404#47548#52404
          PrintFont.Style = []
          Width = 64
        end
        item
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'cardCnt'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Header = #49888#50857#52852#46300#44148#49688
          HeaderFont.Charset = ANSI_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -12
          HeaderFont.Name = #44404#47548#52404
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = ANSI_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -12
          PrintFont.Name = #44404#47548#52404
          PrintFont.Style = []
          Width = 64
        end
        item
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'cardAmt'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Header = #49888#50857#52852#46300#44552#50529
          HeaderFont.Charset = ANSI_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -12
          HeaderFont.Name = #44404#47548#52404
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = ANSI_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -12
          PrintFont.Name = #44404#47548#52404
          PrintFont.Style = []
          Width = 64
        end
        item
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'LostCnt'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Header = #49688#46041#52636#52264#44148#49688
          HeaderFont.Charset = ANSI_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -12
          HeaderFont.Name = #44404#47548#52404
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = ANSI_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -12
          PrintFont.Name = #44404#47548#52404
          PrintFont.Style = []
          Width = 64
        end
        item
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'LostAmt'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Header = #49688#46041#52636#52264#44552#50529
          HeaderFont.Charset = ANSI_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -12
          HeaderFont.Name = #44404#47548#52404
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = ANSI_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -12
          PrintFont.Name = #44404#47548#52404
          PrintFont.Style = []
          Width = 64
        end
        item
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'GT1Cnt'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Header = #47924#47308#53685#44284
          HeaderFont.Charset = ANSI_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -12
          HeaderFont.Name = #44404#47548#52404
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = ANSI_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -12
          PrintFont.Name = #44404#47548#52404
          PrintFont.Style = []
          Width = 64
        end>
      DataSource = dsTKProcClosingM
      InvalidPicture.Data = {
        055449636F6E0000010001002020040000000000E80200001600000028000000
        2000000040000000010004000000000000020000000000000000000000000000
        0000000000000000000080000080000000808000800000008000800080800000
        80808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
        FFFFFF0000000000000000000000000000000000000000000001111111100000
        0000000000000000011111111111100000000000000000011111111111111110
        0000000000000111111111111111111110000000000011111111111111111111
        1100000000011111111111111111111111100000001111117711111111117111
        1110000000111111FF7111111117FF111111000001111118FFF91111117FFFF1
        1111100001111178FFFF711117FFFFF711111000911111178FFFF9117FFFF871
        111110001111199178FFFF97FFFF87111111110011119999178FFFFFFFFF7191
        11111100111999999178FFFFFFF7199911111100119999999997FFFFFF899999
        91111100199999999997FFFFFF9999999911110099999999999FFFFFFFF99999
        999111009999999999FFFFFFFFFF999999911100999999999FFFFF778FFFF999
        99911100999999998FFF879978FFFF999999910099999978FFF87999978FFFF7
        9999910009999978FF8799999978FF8799999000099999978879999999978879
        9999100000999999779999999999779999990000009999977799999999999999
        9991000000099997888879999999999999100000000099978888888888779999
        9900000000000999788888888887999990000000000000999788888888799991
        0000000000000000999788888799991000000000000000000099999999999000
        00000000FF8000FFFF00007FFE00001FF800000FF0000007F0000007E0000003
        C0000001C0000001800000018000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000180000001
        80000003C0000003C0000007E000000FF000001FF800003FFC0000FFFF0001FF
        FFC007FF}
      ShowUnicode = False
      ColWidths = (
        20
        88
        82
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64)
    end
    object DBAdvGrid1: TDBAdvGrid
      Left = 1
      Top = 169
      Width = 1035
      Height = 103
      Cursor = crDefault
      Align = alClient
      ColCount = 4
      DrawingStyle = gdsClassic
      RowCount = 2
      FixedRows = 1
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 1
      HoverRowCells = [hcNormal, hcSelected]
      ActiveCellFont.Charset = DEFAULT_CHARSET
      ActiveCellFont.Color = clWindowText
      ActiveCellFont.Height = -11
      ActiveCellFont.Name = 'Tahoma'
      ActiveCellFont.Style = [fsBold]
      ControlLook.FixedGradientHoverFrom = clGray
      ControlLook.FixedGradientHoverTo = clWhite
      ControlLook.FixedGradientDownFrom = clGray
      ControlLook.FixedGradientDownTo = clSilver
      ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
      ControlLook.DropDownHeader.Font.Color = clWindowText
      ControlLook.DropDownHeader.Font.Height = -11
      ControlLook.DropDownHeader.Font.Name = 'Tahoma'
      ControlLook.DropDownHeader.Font.Style = []
      ControlLook.DropDownHeader.Visible = True
      ControlLook.DropDownHeader.Buttons = <>
      ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
      ControlLook.DropDownFooter.Font.Color = clWindowText
      ControlLook.DropDownFooter.Font.Height = -11
      ControlLook.DropDownFooter.Font.Name = 'Tahoma'
      ControlLook.DropDownFooter.Font.Style = []
      ControlLook.DropDownFooter.Visible = True
      ControlLook.DropDownFooter.Buttons = <>
      Filter = <>
      FilterDropDown.Font.Charset = DEFAULT_CHARSET
      FilterDropDown.Font.Color = clWindowText
      FilterDropDown.Font.Height = -11
      FilterDropDown.Font.Name = 'Tahoma'
      FilterDropDown.Font.Style = []
      FilterDropDown.TextChecked = 'Checked'
      FilterDropDown.TextUnChecked = 'Unchecked'
      FilterDropDownClear = '(All)'
      FilterEdit.TypeNames.Strings = (
        'Starts with'
        'Ends with'
        'Contains'
        'Not contains'
        'Equal'
        'Not equal'
        'Clear')
      FixedColWidth = 20
      FixedRowHeight = 22
      FixedFont.Charset = DEFAULT_CHARSET
      FixedFont.Color = clWindowText
      FixedFont.Height = -11
      FixedFont.Name = 'Tahoma'
      FixedFont.Style = [fsBold]
      FloatFormat = '%.2f'
      PrintSettings.DateFormat = 'dd/mm/yyyy'
      PrintSettings.Font.Charset = DEFAULT_CHARSET
      PrintSettings.Font.Color = clWindowText
      PrintSettings.Font.Height = -11
      PrintSettings.Font.Name = 'Tahoma'
      PrintSettings.Font.Style = []
      PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
      PrintSettings.FixedFont.Color = clWindowText
      PrintSettings.FixedFont.Height = -11
      PrintSettings.FixedFont.Name = 'Tahoma'
      PrintSettings.FixedFont.Style = []
      PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
      PrintSettings.HeaderFont.Color = clWindowText
      PrintSettings.HeaderFont.Height = -11
      PrintSettings.HeaderFont.Name = 'Tahoma'
      PrintSettings.HeaderFont.Style = []
      PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
      PrintSettings.FooterFont.Color = clWindowText
      PrintSettings.FooterFont.Height = -11
      PrintSettings.FooterFont.Name = 'Tahoma'
      PrintSettings.FooterFont.Style = []
      PrintSettings.PageNumSep = '/'
      SearchFooter.FindNextCaption = 'Find &next'
      SearchFooter.FindPrevCaption = 'Find &previous'
      SearchFooter.Font.Charset = DEFAULT_CHARSET
      SearchFooter.Font.Color = clWindowText
      SearchFooter.Font.Height = -11
      SearchFooter.Font.Name = 'Tahoma'
      SearchFooter.Font.Style = []
      SearchFooter.HighLightCaption = 'Highlight'
      SearchFooter.HintClose = 'Close'
      SearchFooter.HintFindNext = 'Find next occurence'
      SearchFooter.HintFindPrev = 'Find previous occurence'
      SearchFooter.HintHighlight = 'Highlight occurences'
      SearchFooter.MatchCaseCaption = 'Match case'
      SortSettings.DefaultFormat = ssAutomatic
      Version = '2.3.6.9'
      AutoCreateColumns = True
      AutoRemoveColumns = True
      Columns = <
        item
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Style = []
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Style = []
          Width = 20
        end
        item
          Alignment = taCenter
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'FeeName'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Header = #50836#44552#51333#47448
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -12
          HeaderFont.Name = #44404#47548#52404
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Style = []
          Width = 210
        end
        item
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'COLUMN1'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Header = #52376#47532#44148#49688
          HeaderFont.Charset = ANSI_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -12
          HeaderFont.Name = #44404#47548#52404
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = ANSI_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -12
          PrintFont.Name = 'Tahoma'
          PrintFont.Style = []
          Width = 150
        end
        item
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'COLUMN2'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Header = #52376#47532#44552#50529
          HeaderFont.Charset = ANSI_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -12
          HeaderFont.Name = #44404#47548#52404
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = ANSI_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -12
          PrintFont.Name = 'Tahoma'
          PrintFont.Style = []
          Width = 150
        end>
      DataSource = dsFeeItemClosing
      InvalidPicture.Data = {
        055449636F6E0000010001002020200000000000A81000001600000028000000
        2000000040000000010020000000000000100000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000003000000290000005C0000008B000000AF000000C1
        000000CA000000CB000000C9000000C1000000AF0000008A0000005E0000002C
        0000000400000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000220000007100001CBE000047F401015DFF01016CFF000074FF
        000075FF00006CFF01015EFF010145FF000020FF000001F3000000DE000000AE
        0000006B00000026000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000005401013DC5010175FF010186FF010189FF000085FF000082FF000081FF
        000080FF000080FF000080FF000083FF000082FF01016EFF01013FFF000007FB
        000000E0000000A10000004D0000000700000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000300003A8B
        010178FF010191FF00008AFF000085FF000085FF000085FF000085FF000086FF
        000086FF000084FF000081FF000080FF00007FFF000081FF000085FF010172FF
        000030FF000000F5000000C3000000610000000A000000000000000000000000
        000000000000000000000000000000000000000000000001010159A5010193FF
        01018EFF000089FF000089FF00008CFF00008CFF00008FFF000090FF000090FF
        000090FF00008FFF00008BFF00008AFF000086FF000082FF00007EFF000081FF
        010182FF00004FFF000000FC000000CB0000005F000000080000000000000000
        0000000000000000000000000000000000000000010167AA02029EFF01018EFF
        00008CFF00008FFF000092FF000095FF000098FF000099FF000098FF00009BFF
        00009AFF000098FF000097FF000094FF00008FFF00008BFF000087FF000082FF
        00007FFF010188FF00005BFF000000FC000000C4000000530000000000000000
        00000000000000000000000000000000010169850202A4FF010191FF000090FF
        000095FF000093FF000096FF00009DFF0000A2FF0000A2FF0000A2FF0000A3FF
        0000A2FF0000A1FF00009FFF00009BFF000097FF00008DFF00008BFF00008AFF
        000084FF00007FFF01018BFF000054FF000000F6000000AC0000003000000000
        000000000000000000000000000168400202A6FF020294FF000094FF00009AFF
        000098FF4949BFFF5353C4FF00009DFF0000A7FF0000A9FF0101AAFF0101AAFF
        0101A9FF0101A8FF0000A5FF0000A2FF00009AFF5F5FC5FF3A3AB3FF00008AFF
        00008BFF000086FF010183FF01018BFF000037FF000000E50000007900000009
        0000000000000000000000000202A2D803039EFF00009AFF0000A0FF0000A1FF
        2929ABFFFFFFFAFFFFFFFFFF4A4AC8FF0000A5FF0000AFFF0000AFFF0101AEFF
        0101B0FF0000AFFF0000ACFF0000A5FF4848B6FFFFFFFFFFFFFFFFFF2424AEFF
        00008FFF000090FF000089FF01018BFF010180FF00000CFF000000BB00000038
        00000000000000000101655C0303B2FF02029EFF0000A4FF0000AAFF2F2FA9FF
        CCCCC0FFFFFFF4FFFFFFFFFFFFFFFFFF4141CAFF0000ACFF0000B3FF0000B3FF
        0000B3FF0000B2FF0000ADFF4343B5FFEDEDD9FFFFFFFFFFFFFFFFFFFFFFFFFF
        3232AFFF000095FF000092FF01018BFF020293FF010155FF000000E50000006F
        00000000000000000303A6D70303A2FF0202A5FF0000ACFF0000B2FF78788DFF
        CBCBA5FFFFFFFCFFFFFFFFFFFFFFFFFFFFFFFFFF4F4FCEFF0000AEFF0000B5FF
        0000B6FF0000B2FF4B4BBDFFF2F2D9FFFFFFF8FFFFFFFFFFFFFFFFFFF8F8D4FF
        8282AEFF0000A2FF00009DFF010194FF020291FF02028CFF000110FD0000009F
        000000180000C5200404A3FF0404A7FF0202ADFF0101B3FF0000BCFF0000B0FF
        606073FFC4C4A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4040CFFF0000B1FF
        0000B3FF4E4EC8FFF6F6DFFFFFFFF6FFFFFFFFFFFFFFFFFFE7E7CBFF737393FF
        0000A9FF0000ABFF0000A4FF01019BFF020292FF02029BFF010139FF000000C2
        000000370201BE6D0505A7FF0404AEFF0303B6FF0303BBFF0101C1FF0000CDFF
        0000B9FF56566EFFC0C0A5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3B3BCFFF
        5050D7FFFFFFFAFFFFFFF5FFFFFFFFFFFFFFFFFFE0E0C8FF6D6D8FFF0000B2FF
        0000B8FF0000B1FF0101ABFF0101A3FF01019AFF02029EFF02026FFF000000DC
        0000004D0405BAA10707ADFF0606B5FF0404BBFF0505C2FF0505C8FF0303CBFF
        0000D2FF0000BAFF616177FFC6C6ABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9CDFF747495FF0000B7FF0000C2FF
        0101BDFF0202B8FF0202B2FF0101AAFF02029FFF03039EFF020289FF000004E6
        000000550606B9CB0808B5FF0606BBFF0606C4FF0606C9FF0606CDFF0606D0FF
        0202CFFF0000D4FF0000BDFF6E6E86FFDADABDFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFF5F5DAFF8181A4FF0000BCFF0000C5FF0000C4FF
        0303C1FF0303BEFF0202B8FF0202B0FF0202A6FF0303A1FF03039FFF00000CEC
        000000590909BBE80909BAFF0808C2FF0808CAFF0808D0FF0909D4FF0707D4FF
        0303D2FF0000D0FF0000D4FF0000C2FF8A8AAEFFF7F7EAFFFFFFFFFFFEFEFEFF
        FEFEFEFFFFFFFFFFFFFFF9FF9393C8FF0000C3FF0000C8FF0000C6FF0101C6FF
        0404C6FF0505C5FF0303BEFF0202B6FF0202ACFF0303A3FF0606AEFF010113ED
        0000005A0A0ABFF80C0CC2FF0B0BC9FF0B0BD0FF0B0BD8FF0D0DDCFF0808D9FF
        0303D5FF0000D2FF0000D2FF0000D4FF4648C5FFF9F9E6FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFF6FF3A3ACEFF0000C6FF0000CBFF0000C9FF0303CAFF
        0505CAFF0505CAFF0505C4FF0404BEFF0404B2FF0505A9FF0505B9FF010115EB
        000000570B0BC6EA1010C9FF0E0ED0FF0E0EDAFF0F0FE1FF0F0FE2FF0B0BE0FF
        0303DAFF0000D6FF0000D4FF4242CBFFE9E9D5FFFFFFFBFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFEFFFFFFF9FF4949DEFF0000C6FF0000CCFF0101CDFF
        0606CFFF0707CFFF0606C9FF0505C3FF0505B7FF0606ADFF0707B8FF010113E2
        0000004F0C0CCDCE1313CFFF1212D7FF1313E1FF1313E9FF1313ECFF0C0CE7FF
        0000E0FF0000DCFF3F3FCDFFEAEAD2FFFFFFF6FFFFFFFFFFFFFFFFFFFFFFF5FF
        FFFFF3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4343DCFF0000CAFF0000D2FF
        0606D4FF0A0AD3FF0808CEFF0808C6FF0707BBFF0808B4FF0606B3FF01010ED4
        000000410909D7A41515D4FF1717E0FF1818E9FF1A1AF2FF1A1AF5FF0E0EF3FF
        0000EBFF4848D2FFECECD0FFFFFFF5FFFFFFFFFFFFFFFFFFEEEED6FF8585BBFF
        8787ADFFDDDDC5FFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFF4E4EE2FF0000D2FF
        0505DBFF0C0CD9FF0B0BD3FF0A0ACAFF0A0ABEFF0B0BBCFF0606A5FF000004B1
        000000200608DE751919D6FF1C1CE6FF1E1EF2FF2121FCFF1E1EFFFF0606FFFF
        4D4DE0FFE6E6CBFFFFFFF4FFFFFFFFFFFFFFFFFFEAEACAFF7B7BA3FF0000D9FF
        0000D4FF737389FFCBCBABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4FEEFF
        0000E4FF0B0BE1FF0D0DDAFF0C0CCEFF0C0CC2FF0F0FC7FF060690FF00000085
        000000050000E6221717DCFF2222E9FF2626F9FF2727FFFF2424FFFF5E5ED6FF
        DFDFC0FFFFFFF5FFFFFFFFFFFFFFFFFFDFDFC2FF72729BFF0000DDFF0000E8FF
        0000E9FF0000D1FF605F7AFFC2C2A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFF
        5656DFFF0606E8FF1010E0FF1111D4FF0F0FC7FF0E0ECEFF020253E200000047
        00000000000000001010E3D92424ECFF2D2DFFFF3131FFFF2F2FFFFF7C7C9FFF
        D8D8B2FFFFFFFFFFFFFFFFFFE1E1C0FF696996FF0000E0FF0000E9FF0000E6FF
        0000E4FF0000ECFF0000D4FF595971FFBEBE9DFFFFFFFFFFFFFFFDFFD6D6A6FF
        7272BFFF1010F6FF1616E4FF1515D6FF1313CFFF0D0DC5FF000021A200000012
        00000000000000000607E85C2121EDFF3030FFFF3C3CFFFF3E3EFFFF3B3BF8FF
        71719AFFD8D8BDFFD9D9BAFF6C6C99FF0000F1FF0000F6FF0000E9FF0000E6FF
        0000E7FF0000E8FF0000F5FF0000DEFF565674FFBBBB98FFC1C19BFF5F5FA8FF
        1717FFFF1919FAFF1C1CE7FF1919D9FF1515DBFF05058CF20000004300000000
        0000000000000000000000001313EED32E2EFDFF4040FFFF4B4BFFFF4F4FFFFF
        4C4CFBFF696981FF6B6B80FF2525FBFF1212FFFF0D0DFFFF0707FAFF0404F3FF
        0505F2FF0606F5FF0A0AFCFF0C0CFFFF1A1AF4FF606067FF5B5B8FFF2323FFFF
        2626FFFF2727FBFF2222E9FF1D1DE0FF1010D2FF000025880000000800000000
        0000000000000000000000000202F1352020F8FF3B3BFFFF4D4DFFFF5C5CFFFF
        6666FFFF6464FCFF5F5FF7FF5555FFFF4343FFFF3131FFFF2121FFFF1919FFFF
        1818FFFF1C1CFFFF2525FFFF3131FFFF3737FFFF3D3DF6FF3939FEFF3535FFFF
        3333FFFF2C2CFAFF2525EAFF1A1AE8FF030380C1000000170000000000000000
        000000000000000000000000000000000909F3712B2BFEFF4646FFFF5D5DFFFF
        6E6EFFFF7B7BFFFF8080FFFF8181FFFF7575FFFF6767FFFF5555FFFF4949FFFF
        4646FFFF4848FFFF4E4EFFFF5454FFFF5757FFFF5050FFFF4949FFFF4040FFFF
        3838FFFF2D2DF6FF2020F6FF0808B6DF00000423000000000000000000000000
        00000000000000000000000000000000000000000D0EF6902F2FFFFF4D4DFFFF
        6666FFFF7C7CFFFF8B8BFFFF9494FFFF9696FFFF9191FFFF8A8AFFFF7E7EFFFF
        7878FFFF7373FFFF7171FFFF6C6CFFFF6464FFFF5B5BFFFF5050FFFF4343FFFF
        3636FFFF2626FFFF0D0ECCE30000072800000000000000000000000000000000
        0000000000000000000000000000000000000000000000000A0AF8782B2BFDFF
        4E4EFFFF6868FFFF7F7FFFFF9292FFFFA0A0FFFFA5A5FFFFA7A7FFFFA2A2FFFF
        9999FFFF8E8EFFFF8282FFFF7575FFFF6868FFFF5959FFFF4B4BFFFF3A3AFFFF
        2727FFFF0B0BCEC600000A150000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000000001F841
        2121FCDD4545FFFF6262FFFF7979FFFF8C8CFFFF9B9BFFFFA4A4FFFFA3A3FFFF
        9B9BFFFF8E8EFFFF7E7EFFFF6C6CFFFF5D5DFFFF4B4BFFFF3838FFFF1F1FEFFF
        0405B77D00000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000708F96B2827FDE24646FEFF6464FFFF7474FFFF8080FFFF8484FFFF
        7E7EFFFF7373FFFF6363FFFF5353FFFF3F3FFEFF2323FAF40C0CE69800007B1C
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000A0AF9321415F9802727F9B03C3CFBD84949FFF1
        4848FFF53939FCDE2727F9BB1516F88B0608F9480708E4070000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000FF8000FFFF00007FFE00001FF800000FF0000007F0000007E0000003
        C0000001C0000001800000018000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000180000001
        80000003C0000003C0000007E000000FF000001FF800003FFC0000FFFF0001FF
        FFC007FF}
      ShowUnicode = False
      ColWidths = (
        20
        210
        150
        150)
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 273
    Width = 1037
    Height = 68
    Align = alClient
    TabOrder = 2
    object edtTotCash: TAdvEdit
      Left = 176
      Top = 11
      Width = 121
      Height = 21
      EditAlign = eaRight
      EmptyTextStyle = []
      LabelCaption = #52509' '#54788#44552' '#44148#49688
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = #44404#47548#52404
      LabelFont.Style = []
      Lookup.Font.Charset = DEFAULT_CHARSET
      Lookup.Font.Color = clWindowText
      Lookup.Font.Height = -11
      Lookup.Font.Name = 'Arial'
      Lookup.Font.Style = []
      Lookup.Separator = ';'
      Color = 15788771
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Text = '0'
      Visible = True
      Version = '3.3.2.0'
    end
    object edtTotCard: TAdvEdit
      Left = 176
      Top = 43
      Width = 121
      Height = 21
      EditAlign = eaRight
      EmptyTextStyle = []
      LabelCaption = #52509' '#49888#50857#52852#46300' '#44148#49688
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = #44404#47548#52404
      LabelFont.Style = []
      Lookup.Font.Charset = DEFAULT_CHARSET
      Lookup.Font.Color = clWindowText
      Lookup.Font.Height = -11
      Lookup.Font.Name = 'Arial'
      Lookup.Font.Style = []
      Lookup.Separator = ';'
      Color = 15788771
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      Text = '0'
      Visible = True
      Version = '3.3.2.0'
    end
    object edtTotCashAmt: TAdvEdit
      Left = 464
      Top = 11
      Width = 121
      Height = 21
      EditAlign = eaRight
      EmptyTextStyle = []
      LabelCaption = #52509' '#54788#44552' '#44552#50529
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = #44404#47548#52404
      LabelFont.Style = []
      Lookup.Font.Charset = DEFAULT_CHARSET
      Lookup.Font.Color = clWindowText
      Lookup.Font.Height = -11
      Lookup.Font.Name = 'Arial'
      Lookup.Font.Style = []
      Lookup.Separator = ';'
      Color = 15788771
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      Text = '0'
      Visible = True
      Version = '3.3.2.0'
    end
    object edtTotCardAmt: TAdvEdit
      Left = 464
      Top = 43
      Width = 121
      Height = 20
      EditAlign = eaRight
      EmptyTextStyle = []
      LabelCaption = #52509' '#49888#50857#52852#46300' '#44552#50529
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = #44404#47548#52404
      LabelFont.Style = []
      Lookup.Font.Charset = DEFAULT_CHARSET
      Lookup.Font.Color = clWindowText
      Lookup.Font.Height = -11
      Lookup.Font.Name = 'Arial'
      Lookup.Font.Style = []
      Lookup.Separator = ';'
      Color = 15788771
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      Text = '0'
      Visible = True
      Version = '3.3.2.0'
    end
  end
  object pnProgress: TPanel
    Left = 419
    Top = 98
    Width = 367
    Height = 75
    BevelInner = bvLowered
    TabOrder = 3
    Visible = False
    object Label6: TLabel
      Left = 16
      Top = 18
      Width = 345
      Height = 19
      AutoSize = False
      Caption = #50641#49472#54028#51068#47196' '#51200#51109#51473#51077#45768#45796'.  '#51104#49884#47564' '#44592#45796#47140#51452#49464#50836'...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
    end
    object ap1: TAdvProgress
      Left = 16
      Top = 43
      Width = 337
      Height = 17
      BarColor = clHighlight
      TabOrder = 0
      BkColor = clWindow
      Version = '1.2.0.0'
    end
  end
  object qryTKProcClosingM: TADOQuery
    Connection = dmTables.ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select unitno, ProcDate CDate, ProcTime CTime, Sum(ProcCnt) Proc' +
        'Cnt, Sum(ProcFee) ProcFee'
      
        ', Sum(DCCnt) DCCnt, Sum(ProcDC) ProcDC, Sum(ProcRealFee) ProcRea' +
        'lFee, '
      
        'Sum(LostCnt) LostCnt,  Sum(LostAmt) LostAmt, Sum(DamageCnt) Dama' +
        'geCnt, Sum(DamageAmt) DamageAmt, Sum(GT1Cnt) GT1Cnt'
      
        ', SUM(CONVERT(int, reserve1)) cashCnt, SUM(CONVERT(int, reserve2' +
        ')) cashAmt'
      
        ', SUM(CONVERT(int, reserve3)) cardCnt, SUM(CONVERT(int, reserve4' +
        ')) cardAmt'
      'from TKProcClosing '
      'Group By ProcDate, ProcTime, UnitNo')
    Left = 8
    Top = 88
    object qryTKProcClosingMunitno: TSmallintField
      FieldName = 'unitno'
    end
    object qryTKProcClosingMCDate: TStringField
      FieldName = 'CDate'
      FixedChar = True
      Size = 10
    end
    object qryTKProcClosingMCTime: TStringField
      FieldName = 'CTime'
      FixedChar = True
      Size = 8
    end
    object qryTKProcClosingMProcCnt: TIntegerField
      FieldName = 'ProcCnt'
      ReadOnly = True
    end
    object qryTKProcClosingMProcFee: TIntegerField
      FieldName = 'ProcFee'
      ReadOnly = True
    end
    object qryTKProcClosingMDCCnt: TIntegerField
      FieldName = 'DCCnt'
      ReadOnly = True
    end
    object qryTKProcClosingMProcDC: TIntegerField
      FieldName = 'ProcDC'
      ReadOnly = True
    end
    object qryTKProcClosingMProcRealFee: TIntegerField
      FieldName = 'ProcRealFee'
      ReadOnly = True
    end
    object qryTKProcClosingMLostCnt: TIntegerField
      FieldName = 'LostCnt'
      ReadOnly = True
    end
    object qryTKProcClosingMLostAmt: TIntegerField
      FieldName = 'LostAmt'
      ReadOnly = True
    end
    object qryTKProcClosingMDamageCnt: TIntegerField
      FieldName = 'DamageCnt'
      ReadOnly = True
    end
    object qryTKProcClosingMDamageAmt: TIntegerField
      FieldName = 'DamageAmt'
      ReadOnly = True
    end
    object qryTKProcClosingMGT1Cnt: TIntegerField
      FieldName = 'GT1Cnt'
      ReadOnly = True
    end
    object qryTKProcClosingMcashCnt: TIntegerField
      FieldName = 'cashCnt'
      ReadOnly = True
    end
    object qryTKProcClosingMcashAmt: TIntegerField
      FieldName = 'cashAmt'
      ReadOnly = True
    end
    object qryTKProcClosingMcardCnt: TIntegerField
      FieldName = 'cardCnt'
      ReadOnly = True
    end
    object qryTKProcClosingMcardAmt: TIntegerField
      FieldName = 'cardAmt'
      ReadOnly = True
    end
    object qryTKProcClosingMUnitName: TStringField
      FieldKind = fkLookup
      FieldName = 'UnitName'
      LookupDataSet = qryUnitInfo
      LookupKeyFields = 'UnitNo'
      LookupResultField = 'UnitName'
      KeyFields = 'unitno'
      Size = 50
      Lookup = True
    end
  end
  object dsTKProcClosingM: TDataSource
    DataSet = qryTKProcClosingM
    Left = 16
    Top = 136
  end
  object qryTemp: TADOQuery
    Connection = dmTables.ADODB
    Parameters = <>
    Left = 304
    Top = 48
  end
  object qryIssueClosingM: TADOQuery
    Connection = dmTables.ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select IssueDate, Count(*), Sum(IssueUnit), Sum(FValue) '
      'from IssueTK Group By IssueDate')
    Left = 168
    Top = 56
    object qryIssueClosingMIssueDate: TStringField
      FieldName = 'IssueDate'
      FixedChar = True
      Size = 10
    end
    object qryIssueClosingMCOLUMN1: TIntegerField
      FieldName = 'COLUMN1'
      ReadOnly = True
    end
    object qryIssueClosingMCOLUMN2: TIntegerField
      FieldName = 'COLUMN2'
      ReadOnly = True
    end
    object qryIssueClosingMCOLUMN3: TIntegerField
      FieldName = 'COLUMN3'
      ReadOnly = True
    end
  end
  object dsIssueClosingM: TDataSource
    DataSet = qryIssueClosingM
    Left = 168
    Top = 104
  end
  object qryBarClosingM: TADOQuery
    Connection = dmTables.ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select CDate, Sum(UpCnt), Sum(DownCnt), Sum(LockCnt), Sum(UnLock' +
        'Cnt) '
      'from BarClosing Group By CDate')
    Left = 256
    Top = 40
    object qryBarClosingMCDate: TStringField
      FieldName = 'CDate'
      FixedChar = True
      Size = 10
    end
    object qryBarClosingMCOLUMN1: TIntegerField
      FieldName = 'COLUMN1'
      ReadOnly = True
    end
    object qryBarClosingMCOLUMN2: TIntegerField
      FieldName = 'COLUMN2'
      ReadOnly = True
    end
    object qryBarClosingMCOLUMN3: TIntegerField
      FieldName = 'COLUMN3'
      ReadOnly = True
    end
    object qryBarClosingMCOLUMN4: TIntegerField
      FieldName = 'COLUMN4'
      ReadOnly = True
    end
  end
  object dsBarClosingM: TDataSource
    DataSet = qryBarClosingM
    Left = 240
    Top = 96
  end
  object qryFeeItemClosing: TADOQuery
    Connection = dmTables.ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select  FeeNo, Sum(FeeCnt), Sum(FeeAmt) '
      'from FeeDetail '
      'Group By FeeNo ')
    Left = 384
    Top = 48
    object qryFeeItemClosingFeeNo: TWordField
      FieldName = 'FeeNo'
    end
    object qryFeeItemClosingFeeName: TStringField
      FieldKind = fkLookup
      FieldName = 'FeeName'
      LookupDataSet = qryFeeItem
      LookupKeyFields = 'FeeNo'
      LookupResultField = 'FeeName'
      KeyFields = 'FeeNo'
      Size = 50
      Lookup = True
    end
    object qryFeeItemClosingCOLUMN1: TIntegerField
      FieldName = 'COLUMN1'
      ReadOnly = True
    end
    object qryFeeItemClosingCOLUMN2: TIntegerField
      FieldName = 'COLUMN2'
      ReadOnly = True
    end
  end
  object dsFeeItemClosing: TDataSource
    DataSet = qryFeeItemClosing
    Left = 384
    Top = 96
  end
  object qryFeeItem: TADOQuery
    Connection = dmTables.ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select ParkNo, FeeNo, FeeName from FeeItem')
    Left = 312
    Top = 96
    object qryFeeItemParkNo: TSmallintField
      FieldName = 'ParkNo'
    end
    object qryFeeItemFeeNo: TWordField
      FieldName = 'FeeNo'
    end
    object qryFeeItemFeeName: TStringField
      FieldName = 'FeeName'
      Size = 50
    end
  end
  object qryNInCnt: TADOQuery
    Connection = dmTables.ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select Count(*) nInCnt from IONData')
    Left = 496
    Top = 40
    object qryNInCntnInCnt: TIntegerField
      FieldName = 'nInCnt'
      ReadOnly = True
    end
  end
  object dsNInCnt: TDataSource
    DataSet = qryNInCnt
    Left = 496
    Top = 88
  end
  object qryNOutCnt: TADOQuery
    Connection = dmTables.ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select Count(*) nOutCnt from IONData')
    Left = 576
    Top = 40
    object qryNOutCntnOutCnt: TIntegerField
      FieldName = 'nOutCnt'
      ReadOnly = True
    end
  end
  object dsNOutCnt: TDataSource
    DataSet = qryNOutCnt
    Left = 576
    Top = 88
  end
  object qrySInCnt: TADOQuery
    Connection = dmTables.ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select Count(*) SInCnt from IOSData')
    Left = 496
    Top = 200
    object qrySInCntSInCnt: TIntegerField
      FieldName = 'SInCnt'
      ReadOnly = True
    end
  end
  object dsSInCnt: TDataSource
    DataSet = qrySInCnt
    Left = 496
    Top = 248
  end
  object qrySOutCnt: TADOQuery
    Connection = dmTables.ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select Count(*) SOutCnt from IOSData')
    Left = 576
    Top = 200
    object qrySOutCntSOutCnt: TIntegerField
      FieldName = 'SOutCnt'
      ReadOnly = True
    end
  end
  object dsSOutCnt: TDataSource
    DataSet = qrySOutCnt
    Left = 576
    Top = 248
  end
  object qrySCAdd: TADOQuery
    Connection = dmTables.ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select Count(*) nAddCnt, Sum(IssueUnit) nAddAmt  '
      'from  IssueTK '
      'where TKType = 2')
    Left = 400
    Top = 200
    object qrySCAddnAddCnt: TIntegerField
      FieldName = 'nAddCnt'
      ReadOnly = True
    end
    object qrySCAddnAddAmt: TIntegerField
      FieldName = 'nAddAmt'
      ReadOnly = True
    end
  end
  object qrySCNew: TADOQuery
    Connection = dmTables.ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select Count(*) nNewCnt, Sum(IssueUnit) nNewAmt  '
      'from  IssueTK '
      'where TKType = 2')
    Left = 304
    Top = 200
    object qrySCNewnNewCnt: TIntegerField
      FieldName = 'nNewCnt'
      ReadOnly = True
    end
    object qrySCNewnNewAmt: TIntegerField
      FieldName = 'nNewAmt'
      ReadOnly = True
    end
  end
  object dsSCNew: TDataSource
    DataSet = qrySCNew
    Left = 304
    Top = 248
  end
  object dsSCAdd: TDataSource
    DataSet = qrySCAdd
    Left = 400
    Top = 248
  end
  object fTKProcClosingM: TfrxDBDataset
    UserName = 'TKProcClosingM'
    CloseDataSource = False
    OpenDataSource = False
    DataSource = dsTKProcClosingM
    BCDToCurrency = False
    Left = 32
    Top = 200
  end
  object fIssueClosingM: TfrxDBDataset
    UserName = 'IssueClosingM'
    CloseDataSource = False
    OpenDataSource = False
    DataSource = dsIssueClosingM
    BCDToCurrency = False
    Left = 128
    Top = 136
  end
  object fBarClosingM: TfrxDBDataset
    UserName = 'BarClosingM'
    CloseDataSource = False
    OpenDataSource = False
    DataSource = dsBarClosingM
    BCDToCurrency = False
    Left = 264
    Top = 136
  end
  object fFeeItemClosing: TfrxDBDataset
    UserName = 'FeeItemClosing'
    CloseDataSource = False
    OpenDataSource = False
    DataSource = dsFeeItemClosing
    BCDToCurrency = False
    Left = 384
    Top = 152
  end
  object fNInCnt: TfrxDBDataset
    UserName = 'NInCnt'
    CloseDataSource = False
    OpenDataSource = False
    DataSource = dsNInCnt
    BCDToCurrency = False
    Left = 496
    Top = 136
  end
  object fNOutCnt: TfrxDBDataset
    UserName = 'NOutCnt'
    CloseDataSource = False
    OpenDataSource = False
    DataSource = dsNOutCnt
    BCDToCurrency = False
    Left = 576
    Top = 136
  end
  object fSCNew: TfrxDBDataset
    UserName = 'SCNew'
    CloseDataSource = False
    OpenDataSource = False
    DataSource = dsSCNew
    BCDToCurrency = False
    Left = 304
    Top = 296
  end
  object fSCAdd: TfrxDBDataset
    UserName = 'SCAdd'
    CloseDataSource = False
    OpenDataSource = False
    DataSource = dsSCAdd
    BCDToCurrency = False
    Left = 400
    Top = 296
  end
  object fSInCnt: TfrxDBDataset
    UserName = 'SInCnt'
    CloseDataSource = False
    OpenDataSource = False
    DataSource = dsSInCnt
    BCDToCurrency = False
    Left = 496
    Top = 296
  end
  object fSOutCnt: TfrxDBDataset
    UserName = 'SOutCnt'
    CloseDataSource = False
    OpenDataSource = False
    DataSource = dsSOutCnt
    BCDToCurrency = False
    Left = 576
    Top = 296
  end
  object frxReport1: TfrxReport
    Version = '5.4.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41128.410836759300000000
    ReportOptions.LastChange = 43046.459651527780000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Memo43OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  Memo43.Text:= <sDate>;      '
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 88
    Top = 232
    Datasets = <
      item
        DataSet = fBarClosingM
        DataSetName = 'BarClosingM'
      end
      item
        DataSet = fDCClosing
        DataSetName = 'DCClosing'
      end
      item
        DataSet = fFeeItemClosing
        DataSetName = 'FeeItemClosing'
      end
      item
        DataSet = fIssueClosingM
        DataSetName = 'IssueClosingM'
      end
      item
        DataSet = fNInCnt
        DataSetName = 'NInCnt'
      end
      item
        DataSet = fNOutCnt
        DataSetName = 'NOutCnt'
      end
      item
        DataSet = fSCAdd
        DataSetName = 'SCAdd'
      end
      item
        DataSet = fSCNew
        DataSetName = 'SCNew'
      end
      item
        DataSet = fSInCnt
        DataSetName = 'SInCnt'
      end
      item
        DataSet = fSOutCnt
        DataSetName = 'SOutCnt'
      end
      item
        DataSet = fTKProcClosingM
        DataSetName = 'TKProcClosingM'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Style = []
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 256
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 43.354360000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          Top = 1.779530000000000000
          Width = 1046.929810000000000000
          Height = 41.574830000000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -29
          Font.Name = #44404#47548#52404
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clScrollBar
          HAlign = haCenter
          LineSpacing = 1.000000000000000000
          Memo.UTF8W = (
            #50900' '#48324' '#45236' '#50669)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Height = 49.133890000000000000
        Top = 124.724490000000000000
        Width = 1046.929810000000000000
        object Memo46: TfrxMemoView
          Width = 1046.929810000000000000
          Height = 22.677180000000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clScrollBar
          Memo.UTF8W = (
            '   '#51068#48152#52264#47049' '#52376#47532#45236#50669)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Top = 22.677180000000000000
          Width = 1046.929810000000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clSilver
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = cl3DLight
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 86.929190000000000000
          Top = 22.677165350000000000
          Width = 86.929133860000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #47560#44048#51068#51088)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 260.787570000000000000
          Top = 22.677165350000000000
          Width = 75.590551180000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #52376#47532#44148#49688)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 336.378170000000000000
          Top = 22.677165350000000000
          Width = 75.590551180000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #51452#52264#44552#50529)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 411.968770000000000000
          Top = 22.677165350000000000
          Width = 75.590551180000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #54624#51064#44148#49688)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 487.559370000000000000
          Top = 22.677165350000000000
          Width = 75.590551180000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #54624#51064#44552#50529)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 563.149970000000000000
          Top = 22.677165350000000000
          Width = 75.590551180000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #48155#51008#44552#50529)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 812.598950000000000000
          Top = 22.677165350000000000
          Width = 83.149606300000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #49688#46041#52636#52264)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 895.748610000000000000
          Top = 22.677165350000000000
          Width = 75.590551180000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #49688#46041#52636#52264#44552#50529)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 971.339210000000000000
          Top = 22.677165350000000000
          Width = 75.590551180000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #47924#47308#53685#44284)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo73: TfrxMemoView
          Top = 22.677180000000000000
          Width = 86.929133860000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #52376#47532#44592#44592)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo75: TfrxMemoView
          Left = 173.858380000000000000
          Top = 22.677180000000000000
          Width = 86.929133860000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #47560#44048#49884#44033)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo126: TfrxMemoView
          Left = 638.740570000000000000
          Top = 22.677180000000000000
          Width = 86.929133860000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #54788#44552)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo128: TfrxMemoView
          Left = 725.669760000000000000
          Top = 22.677180000000000000
          Width = 86.929133860000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #49888#50857#52852#46300)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 196.535560000000000000
        Width = 1046.929810000000000000
        DataSet = fTKProcClosingM
        DataSetName = 'TKProcClosingM'
        RowCount = 0
        object Memo4: TfrxMemoView
          Align = baClient
          Width = 1046.929810000000000000
          Height = 26.456710000000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 86.929190000000000000
          Width = 86.929133860000000000
          Height = 26.456692910000000000
          DataField = 'CDate'
          DataSet = fTKProcClosingM
          DataSetName = 'TKProcClosingM'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[TKProcClosingM."CDate"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 260.787570000000000000
          Width = 75.590551180000000000
          Height = 26.456692910000000000
          DataField = 'ProcCnt'
          DataSet = fTKProcClosingM
          DataSetName = 'TKProcClosingM'
          DisplayFormat.ThousandSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[TKProcClosingM."ProcCnt"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 336.378170000000000000
          Width = 75.590551180000000000
          Height = 26.456692910000000000
          DataField = 'ProcFee'
          DataSet = fTKProcClosingM
          DataSetName = 'TKProcClosingM'
          DisplayFormat.ThousandSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[TKProcClosingM."ProcFee"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 411.968770000000000000
          Width = 75.590551180000000000
          Height = 26.456692910000000000
          DataField = 'DCCnt'
          DataSet = fTKProcClosingM
          DataSetName = 'TKProcClosingM'
          DisplayFormat.ThousandSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[TKProcClosingM."DCCnt"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 487.559370000000000000
          Width = 75.590551180000000000
          Height = 26.456692910000000000
          DataField = 'ProcDC'
          DataSet = fTKProcClosingM
          DataSetName = 'TKProcClosingM'
          DisplayFormat.ThousandSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[TKProcClosingM."ProcDC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 563.149970000000000000
          Width = 75.590551180000000000
          Height = 26.456692910000000000
          DataField = 'ProcRealFee'
          DataSet = fTKProcClosingM
          DataSetName = 'TKProcClosingM'
          DisplayFormat.ThousandSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[TKProcClosingM."ProcRealFee"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 812.598950000000000000
          Width = 83.149606300000000000
          Height = 26.456692910000000000
          DataField = 'LostCnt'
          DataSet = fTKProcClosingM
          DataSetName = 'TKProcClosingM'
          DisplayFormat.ThousandSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[TKProcClosingM."LostCnt"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 895.748610000000000000
          Width = 75.590551180000000000
          Height = 26.456692910000000000
          DataField = 'LostAmt'
          DataSet = fTKProcClosingM
          DataSetName = 'TKProcClosingM'
          DisplayFormat.ThousandSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[TKProcClosingM."LostAmt"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 971.339210000000000000
          Width = 75.590551180000000000
          Height = 26.456692910000000000
          DataField = 'GT1Cnt'
          DataSet = fTKProcClosingM
          DataSetName = 'TKProcClosingM'
          DisplayFormat.ThousandSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[TKProcClosingM."GT1Cnt"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo74: TfrxMemoView
          Top = 0.000014650000000005
          Width = 86.929133860000000000
          Height = 26.456692910000000000
          DataField = 'UnitName'
          DataSet = fTKProcClosingM
          DataSetName = 'TKProcClosingM'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[TKProcClosingM."UnitName"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo125: TfrxMemoView
          Left = 173.858380000000000000
          Top = 0.000014650000000005
          Width = 86.929133860000000000
          Height = 26.456692910000000000
          DataField = 'CTime'
          DataSet = fTKProcClosingM
          DataSetName = 'TKProcClosingM'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[TKProcClosingM."CTime"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo127: TfrxMemoView
          Left = 638.740570000000000000
          Top = 0.000014650000000005
          Width = 86.929133860000000000
          Height = 26.456692910000000000
          DataSet = fTKProcClosingM
          DataSetName = 'TKProcClosingM'
          DisplayFormat.ThousandSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[TKProcClosingM."cashAmt"]'#50896
            '')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo129: TfrxMemoView
          Left = 725.669760000000000000
          Top = 0.000014650000000005
          Width = 86.929133860000000000
          Height = 26.456692910000000000
          DataSet = fTKProcClosingM
          DataSetName = 'TKProcClosingM'
          DisplayFormat.ThousandSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[TKProcClosingM."cardAmt"]'#50896)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 245.669450000000000000
        Width = 1046.929810000000000000
      end
      object Header2: TfrxHeader
        FillType = ftBrush
        Height = 49.133890000000000000
        Top = 291.023810000000000000
        Width = 1046.929810000000000000
        object Memo47: TfrxMemoView
          Width = 1046.929810000000000000
          Height = 22.677180000000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clScrollBar
          Memo.UTF8W = (
            '   '#50836#44552#51333#47448#48324' '#52376#47532#45236#50669)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          Top = 22.677180000000000000
          Width = 1046.929810000000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = cl3DLight
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          Top = 22.677165350000000000
          Width = 151.181102360000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #50836#44552#51333#47448)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo53: TfrxMemoView
          Left = 151.181200000000000000
          Top = 22.677165350000000000
          Width = 94.488250000000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #52376#47532#44148#49688)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo54: TfrxMemoView
          Left = 245.669450000000000000
          Top = 22.677165350000000000
          Width = 94.488250000000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #52376#47532#44552#50529)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData2: TfrxMasterData
        FillType = ftBrush
        Height = 26.456692910000000000
        Top = 362.834880000000000000
        Width = 1046.929810000000000000
        DataSet = fFeeItemClosing
        DataSetName = 'FeeItemClosing'
        RowCount = 0
        object Memo21: TfrxMemoView
          Align = baClient
          Width = 1046.929810000000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Width = 151.181102360000000000
          Height = 26.456692910000000000
          DataField = 'FeeName'
          DataSet = fFeeItemClosing
          DataSetName = 'FeeItemClosing'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[FeeItemClosing."FeeName"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 151.181200000000000000
          Width = 94.488250000000000000
          Height = 26.456692910000000000
          DataSet = fFeeItemClosing
          DataSetName = 'FeeItemClosing'
          DisplayFormat.ThousandSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[FeeItemClosing."COLUMN1"]'#44148)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 245.669450000000000000
          Width = 94.488250000000000000
          Height = 26.456692910000000000
          DataSet = fFeeItemClosing
          DataSetName = 'FeeItemClosing'
          DisplayFormat.ThousandSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[FeeItemClosing."COLUMN2"]'#50896)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Footer2: TfrxFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 411.968770000000000000
        Width = 1046.929810000000000000
      end
      object Header3: TfrxHeader
        FillType = ftBrush
        Height = 49.133858270000000000
        Top = 457.323130000000000000
        Width = 1046.929810000000000000
        object Memo28: TfrxMemoView
          Width = 1046.929810000000000000
          Height = 22.677180000000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clScrollBar
          Memo.UTF8W = (
            '   '#51221#44592#52264#47049' '#48156#44553#45236#50669)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Top = 22.677180000000000000
          Width = 1046.929810000000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = cl3DLight
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Top = 22.677165350000000000
          Width = 86.929133860000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #47560#44048#51068#51088)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 86.929190000000000000
          Top = 22.677165350000000000
          Width = 94.488250000000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #48156#44553#44148#49688)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 181.417440000000000000
          Top = 22.677165350000000000
          Width = 94.488250000000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #48156#44553#44552#50529)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 275.905690000000000000
          Top = 22.677165350000000000
          Width = 94.488250000000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #50529#47732#44552#50529)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData3: TfrxMasterData
        FillType = ftBrush
        Height = 26.456692910000000000
        Top = 529.134200000000000000
        Width = 1046.929810000000000000
        DataSet = fIssueClosingM
        DataSetName = 'IssueClosingM'
        RowCount = 0
        object Memo25: TfrxMemoView
          Align = baClient
          Width = 1046.929810000000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Width = 86.929133860000000000
          Height = 26.456692910000000000
          DataField = 'IssueDate'
          DataSet = fIssueClosingM
          DataSetName = 'IssueClosingM'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[IssueClosingM."IssueDate"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 86.929190000000100000
          Width = 94.488250000000000000
          Height = 26.456692910000000000
          DataSet = fIssueClosingM
          DataSetName = 'IssueClosingM'
          DisplayFormat.ThousandSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[IssueClosingM."COLUMN1"]'#44148)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 181.417440000000000000
          Width = 94.488250000000000000
          Height = 26.456692910000000000
          DataSet = fIssueClosingM
          DataSetName = 'IssueClosingM'
          DisplayFormat.ThousandSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[IssueClosingM."COLUMN2"]'#50896)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 275.905690000000000000
          Width = 94.488250000000000000
          Height = 26.456692910000000000
          DataSet = fIssueClosingM
          DataSetName = 'IssueClosingM'
          DisplayFormat.ThousandSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[IssueClosingM."COLUMN3"]'#50896)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Footer3: TfrxFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 578.268090000000000000
        Width = 1046.929810000000000000
      end
      object Header4: TfrxHeader
        FillType = ftBrush
        Height = 49.811052910000000000
        Top = 623.622450000000000000
        Width = 1046.929810000000000000
        object Memo61: TfrxMemoView
          Width = 1046.929810000000000000
          Height = 22.677180000000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clScrollBar
          Memo.UTF8W = (
            '   '#52264#45800#44592' '#52376#47532#45236#50669)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo62: TfrxMemoView
          Top = 22.677165350000000000
          Width = 1046.929810000000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = cl3DLight
          ParentFont = False
        end
        object Memo63: TfrxMemoView
          Top = 22.677165350000000000
          Width = 86.929133860000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #47560#44048#51068#51088)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo67: TfrxMemoView
          Left = 86.929190000000000000
          Top = 22.677165350000000000
          Width = 94.488188980000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #50676'  '#47548)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo68: TfrxMemoView
          Left = 181.417440000000000000
          Top = 22.677165350000000000
          Width = 94.488188980000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #45803'  '#55192)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo69: TfrxMemoView
          Left = 275.905690000000000000
          Top = 22.677165350000000000
          Width = 94.488188980000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #50676#47548#44256#51221)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo70: TfrxMemoView
          Left = 370.393940000000000000
          Top = 22.677165350000000000
          Width = 94.488188980000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #44256#51221#54644#51228)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData4: TfrxMasterData
        FillType = ftBrush
        Height = 26.456692910000000000
        Top = 695.433520000000000000
        Width = 1046.929810000000000000
        DataSet = fBarClosingM
        DataSetName = 'BarClosingM'
        RowCount = 0
        object Memo36: TfrxMemoView
          Align = baClient
          Width = 1046.929810000000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Width = 86.929133860000000000
          Height = 26.456692910000000000
          DataField = 'CDate'
          DataSet = fBarClosingM
          DataSetName = 'BarClosingM'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[BarClosingM."CDate"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 86.929190000000100000
          Width = 94.488250000000000000
          Height = 26.456692910000000000
          DataSet = fBarClosingM
          DataSetName = 'BarClosingM'
          DisplayFormat.ThousandSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[BarClosingM."COLUMN1"]'#44148)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Left = 181.417440000000000000
          Width = 94.488250000000000000
          Height = 26.456692910000000000
          DataSet = fBarClosingM
          DataSetName = 'BarClosingM'
          DisplayFormat.ThousandSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[BarClosingM."COLUMN2"]'#44148)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Left = 275.905690000000000000
          Width = 94.488250000000000000
          Height = 26.456692910000000000
          DataSet = fBarClosingM
          DataSetName = 'BarClosingM'
          DisplayFormat.ThousandSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[BarClosingM."COLUMN3"]'#44148)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 370.393940000000000000
          Width = 94.488250000000000000
          Height = 26.456692910000000000
          DataSet = fBarClosingM
          DataSetName = 'BarClosingM'
          DisplayFormat.ThousandSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[BarClosingM."COLUMN4"]'#44148)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Footer4: TfrxFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 744.567410000000000000
        Width = 1046.929810000000000000
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 827.717070000000000000
        Width = 1046.929810000000000000
        object Memo79: TfrxMemoView
          Left = 7.559060000000000000
          Top = 3.779530000000020000
          Width = 1028.032160000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'Page [Page]')
          ParentFont = False
        end
      end
    end
    object Page2: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 256
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle2: TfrxReportTitle
        FillType = ftBrush
        Height = 69.811070000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo45: TfrxMemoView
          Top = 1.779530000000000000
          Width = 1046.929810000000000000
          Height = 41.574830000000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -29
          Font.Name = #44404#47548#52404
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clScrollBar
          HAlign = haCenter
          LineSpacing = 1.000000000000000000
          Memo.UTF8W = (
            #50900' '#48324' '#51665' '#44228)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Left = 3.779530000000000000
          Top = 49.133890000000000000
          Width = 260.787570000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo43OnBeforePrint'
          VAlign = vaCenter
        end
      end
      object Header5: TfrxHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 151.181200000000000000
        Width = 1046.929810000000000000
        object Memo95: TfrxMemoView
          Width = 1046.929810000000000000
          Height = 22.677180000000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clScrollBar
          Memo.UTF8W = (
            '   '#51068#48152#52264#47049' '#52376#47532#51665#44228)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData5: TfrxMasterData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 196.535560000000000000
        Visible = False
        Width = 1046.929810000000000000
        DataSet = fBarClosingM
        DataSetName = 'BarClosingM'
        RowCount = 0
      end
      object Footer5: TfrxFooter
        FillType = ftBrush
        Height = 79.834718900000000000
        Top = 241.889920000000000000
        Width = 1046.929810000000000000
        object Memo56: TfrxMemoView
          Top = 0.464566929999989000
          Width = 1046.929810000000000000
          Height = 26.456710000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clSilver
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = cl3DLight
          ParentFont = False
        end
        object Memo57: TfrxMemoView
          Top = 0.031356929999987000
          Width = 222.992128430000000000
          Height = 26.834645670000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #51452' '#52264' '#44552' '#50529)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo80: TfrxMemoView
          Left = 222.992270000000000000
          Top = 0.110236219999990000
          Width = 219.212598430000000000
          Height = 26.834645670000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #54624' '#51064' '#44552' '#50529)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo82: TfrxMemoView
          Left = 441.764069999999000000
          Top = 0.110236219999990000
          Width = 151.181102360000000000
          Height = 26.834645670000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #48155' '#51008' '#44552' '#50529)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo83: TfrxMemoView
          Left = 593.386209999999000000
          Top = 0.110236219999990000
          Width = 188.976377950000000000
          Height = 26.834645670000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #49688' '#46041' '#52636' '#52264)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo84: TfrxMemoView
          Left = 782.362204724409000000
          Width = 113.385802360000000000
          Height = 26.834645670000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #54924' '#52264' '#44148' '#49688)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo85: TfrxMemoView
          Top = 26.921276930000000000
          Width = 1046.929810000000000000
          Height = 30.236240000000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo86: TfrxMemoView
          Top = 26.921276930000000000
          Width = 98.267731180000000000
          Height = 30.236240000000000000
          DisplayFormat.ThousandSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<TKProcClosingM."ProcCnt">,MasterData1)]'#44148)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo87: TfrxMemoView
          Left = 98.267716540000000000
          Top = 26.921276930000000000
          Width = 124.346456690000000000
          Height = 30.236240000000000000
          DisplayFormat.ThousandSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<TKProcClosingM."ProcFee">,MasterData1)]'#50896)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo88: TfrxMemoView
          Left = 222.992270000000000000
          Top = 26.921245200000000000
          Width = 98.267731180000000000
          Height = 30.236240000000000000
          DisplayFormat.ThousandSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<TKProcClosingM."DCCnt">,MasterData1)]'#44148)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo89: TfrxMemoView
          Left = 321.260050000000000000
          Top = 26.921245200000000000
          Width = 120.566929130000000000
          Height = 30.236220470000000000
          DisplayFormat.ThousandSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<TKProcClosingM."ProcDC">,MasterData1)]'#50896)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo91: TfrxMemoView
          Left = 441.882190000000000000
          Top = 26.921245200000000000
          Width = 151.181200000000000000
          Height = 30.236240000000000000
          DisplayFormat.ThousandSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<TKProcClosingM."ProcRealFee">,MasterData1)]'#50896)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo92: TfrxMemoView
          Left = 593.386210000000000000
          Top = 26.921245200000000000
          Width = 83.149606300000000000
          Height = 30.236240000000000000
          DisplayFormat.ThousandSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<TKProcClosingM."LostCnt">,MasterData1)]'#44148)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo93: TfrxMemoView
          Left = 677.315400000000000000
          Top = 26.921245200000000000
          Width = 105.070866140000000000
          Height = 30.236240000000000000
          DisplayFormat.ThousandSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<TKProcClosingM."LostAmt">,MasterData1)]'#50896)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo94: TfrxMemoView
          Left = 782.480830000000000000
          Top = 26.921245200000000000
          Width = 113.385851180000000000
          Height = 30.236240000000000000
          DisplayFormat.ThousandSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<TKProcClosingM."GT1Cnt">,MasterData1)]'#44148)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Header6: TfrxHeader
        FillType = ftBrush
        Height = 49.133890000000000000
        Top = 343.937230000000000000
        Width = 1046.929810000000000000
        object Memo44: TfrxMemoView
          Width = 1046.929810000000000000
          Height = 22.677180000000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clScrollBar
          Memo.UTF8W = (
            '   '#51221#44592#52264#47049' '#48156#44553#51665#44228)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo49: TfrxMemoView
          Left = 260.787401570000000000
          Top = 22.677180000000000000
          Width = 260.031496060000000000
          Height = 26.456710000000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = cl3DLight
          HAlign = haCenter
          Memo.UTF8W = (
            #49888#44508#48156#44553' '#44552#50529)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo96: TfrxMemoView
          Top = 22.677180000000000000
          Width = 260.787401570000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = cl3DLight
          HAlign = haCenter
          Memo.UTF8W = (
            #49888#44508#48156#44553' '#44148#49688)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo117: TfrxMemoView
          Left = 520.575140000000000000
          Top = 22.677180000000000000
          Width = 260.787401570000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = cl3DLight
          HAlign = haCenter
          Memo.UTF8W = (
            #44592#44036#50672#51109' '#44148#49688)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo118: TfrxMemoView
          Left = 781.362710000000000000
          Top = 22.677180000000000000
          Width = 265.322834650000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = cl3DLight
          HAlign = haCenter
          Memo.UTF8W = (
            #44592#44036#50672#51109' '#44552#50529)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData6: TfrxMasterData
        FillType = ftBrush
        Height = 30.236220470000000000
        Top = 415.748300000000000000
        Width = 1046.929810000000000000
        DataSet = fSCNew
        DataSetName = 'SCNew'
        RowCount = 0
        object Memo119: TfrxMemoView
          Width = 260.787570000000000000
          Height = 30.236220470000000000
          DataSet = fSCNew
          DataSetName = 'SCNew'
          DisplayFormat.ThousandSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[SCNew."nNewCnt"]'#44148)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo120: TfrxMemoView
          Left = 260.787401570000000000
          Width = 260.031496060000000000
          Height = 30.236240000000000000
          DataSet = fSCNew
          DataSetName = 'SCNew'
          DisplayFormat.ThousandSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[SCNew."nNewAmt"]'#50896)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo121: TfrxMemoView
          Left = 520.440944880000000000
          Width = 260.787570000000000000
          Height = 30.236240000000000000
          DisplayFormat.ThousandSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[SCAdd."nAddCnt"]'#44148)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo122: TfrxMemoView
          Left = 781.362710000000000000
          Width = 265.322834650000000000
          Height = 30.236240000000000000
          DisplayFormat.ThousandSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[SCAdd."nAddAmt"]'#50896)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Footer6: TfrxFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 468.661720000000000000
        Width = 1046.929810000000000000
      end
      object Header7: TfrxHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 514.016080000000000000
        Width = 1046.929810000000000000
        object Memo98: TfrxMemoView
          Width = 1046.929810000000000000
          Height = 22.677180000000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clScrollBar
          Memo.UTF8W = (
            '   '#52264#45800#44592' '#52376#47532#51665#44228)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData7: TfrxMasterData
        FillType = ftBrush
        Height = 22.677111650000000000
        Top = 559.370440000000000000
        Visible = False
        Width = 1046.929810000000000000
        DataSet = frmDailyReport.fBarClosing
        DataSetName = 'BarClosing'
        RowCount = 0
      end
      object Footer7: TfrxFooter
        FillType = ftBrush
        Height = 79.370115350000000000
        Top = 604.724800000000000000
        Width = 1046.929810000000000000
        object Memo101: TfrxMemoView
          Width = 1046.929810000000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = cl3DLight
          ParentFont = False
        end
        object Memo100: TfrxMemoView
          Top = 26.456692910000000000
          Width = 260.787401570000000000
          Height = 30.236220470000000000
          DisplayFormat.ThousandSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<BarClosingM."COLUMN1">,MasterData4)]'#44148)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo106: TfrxMemoView
          Left = 260.787570000000000000
          Top = 26.456710000000000000
          Width = 260.031496060000000000
          Height = 30.236220470000000000
          DisplayFormat.ThousandSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<BarClosingM."COLUMN2">,MasterData4)]'#44148)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo107: TfrxMemoView
          Left = 520.575140000000000000
          Top = 26.456710000000000000
          Width = 260.787401570000000000
          Height = 30.236220470000000000
          DisplayFormat.ThousandSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<BarClosingM."COLUMN3">,MasterData4)]'#44148)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo108: TfrxMemoView
          Left = 781.142240000000000000
          Top = 26.456710000000000000
          Width = 265.322834650000000000
          Height = 30.236220470000000000
          DisplayFormat.ThousandSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<BarClosingM."COLUMN4">,MasterData4)]'#44148)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo102: TfrxMemoView
          Top = 0.220469999999978000
          Width = 260.787401570000000000
          Height = 26.078740157480300000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #50676'  '#47548)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo103: TfrxMemoView
          Left = 260.567100000000000000
          Width = 260.031496060000000000
          Height = 26.456710000000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #45803'  '#55192)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo104: TfrxMemoView
          Left = 520.575140000000000000
          Top = 0.220469999999978000
          Width = 260.787401570000000000
          Height = 26.078740157480300000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #50676#47548#44256#51221)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo105: TfrxMemoView
          Left = 781.362710000000000000
          Top = 0.220469999999978000
          Width = 265.322834650000000000
          Height = 26.078740160000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #44256#51221#54644#51228)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Header8: TfrxHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 706.772110000000000000
        Width = 1046.929810000000000000
        object Memo97: TfrxMemoView
          Width = 1046.929810000000000000
          Height = 22.677180000000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clScrollBar
          Memo.UTF8W = (
            '   '#52264#47049' '#52636#51077#51665#44228)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData8: TfrxMasterData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 752.126470000000000000
        Visible = False
        Width = 1046.929810000000000000
        DataSet = fBarClosingM
        DataSetName = 'BarClosingM'
        RowCount = 0
      end
      object Footer8: TfrxFooter
        FillType = ftBrush
        Height = 79.370115350000000000
        Top = 797.480830000000000000
        Width = 1046.929810000000000000
        object Memo99: TfrxMemoView
          Width = 1046.929810000000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = cl3DLight
          ParentFont = False
        end
        object Memo109: TfrxMemoView
          Top = 26.456692910000000000
          Width = 260.787401570000000000
          Height = 30.236220470000000000
          DisplayFormat.ThousandSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[NInCnt."nInCnt"]'#44148)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo110: TfrxMemoView
          Left = 260.787570000000000000
          Top = 26.456710000000000000
          Width = 260.031496060000000000
          Height = 30.236220470000000000
          DisplayFormat.ThousandSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[NOutCnt."nOutCnt"]'#44148)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo111: TfrxMemoView
          Left = 520.575140000000000000
          Top = 26.456710000000000000
          Width = 260.409448820000000000
          Height = 30.236220470000000000
          DisplayFormat.ThousandSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[SInCnt."SInCnt"]'#44148)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo112: TfrxMemoView
          Left = 781.142240000000000000
          Top = 26.456710000000000000
          Width = 265.322834650000000000
          Height = 30.236220470000000000
          DisplayFormat.ThousandSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[SOutCnt."SOutCnt"]'#44148)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo114: TfrxMemoView
          Left = 260.567100000000000000
          Width = 260.031496060000000000
          Height = 26.456710000000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #51068#48152#52264#47049' '#52636#52264)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo113: TfrxMemoView
          Width = 260.787401570000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #51068#48152#52264#47049' '#51077#52264)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo115: TfrxMemoView
          Left = 520.575140000000000000
          Width = 260.787401570000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #51221#44592#52264#47049' '#51077#52264)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo116: TfrxMemoView
          Left = 781.362710000000000000
          Width = 265.322834650000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #51221#44592#52264#47049' '#52636#52264)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter2: TfrxPageFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 937.323440000000000000
        Width = 1046.929810000000000000
        object Memo50: TfrxMemoView
          Left = 7.559060000000000000
          Top = 3.779530000000020000
          Width = 1028.032160000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'Page [Page]')
          ParentFont = False
        end
      end
    end
    object Page3: TfrxReportPage
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 256
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object Footer9: TfrxFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 272.126160000000000000
        Width = 1046.929810000000000000
      end
      object ReportTitle3: TfrxReportTitle
        FillType = ftBrush
        Height = 69.811070000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo51: TfrxMemoView
          Top = 1.779530000000000000
          Width = 1046.929810000000000000
          Height = 41.574830000000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -29
          Font.Name = #44404#47548#52404
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clScrollBar
          HAlign = haCenter
          LineSpacing = 1.000000000000000000
          Memo.UTF8W = (
            #54624' '#51064' '#50900' '#48324' '#45236' '#50669)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo55: TfrxMemoView
          Left = 3.779530000000000000
          Top = 49.133890000000000000
          Width = 260.787570000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo43OnBeforePrint'
          VAlign = vaCenter
        end
      end
      object Header9: TfrxHeader
        FillType = ftBrush
        Height = 49.133890000000000000
        Top = 151.181200000000000000
        Width = 1046.929810000000000000
        object Memo58: TfrxMemoView
          Width = 1046.929810000000000000
          Height = 22.677180000000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clScrollBar
          Memo.UTF8W = (
            '   '#54624#51064' '#52376#47532#45236#50669)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo59: TfrxMemoView
          Top = 22.677180000000000000
          Width = 1046.929810000000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clSilver
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = cl3DLight
          ParentFont = False
        end
        object Memo60: TfrxMemoView
          Top = 22.677165350000000000
          Width = 113.385826771654000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #52376#47532#51068#51088)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo64: TfrxMemoView
          Left = 113.385900000000000000
          Top = 22.677165350000000000
          Width = 113.385826770000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #52376#47532#49884#44033)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo65: TfrxMemoView
          Left = 340.157700000000000000
          Top = 22.677165350000000000
          Width = 113.385826770000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #54624#51064#47749)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo66: TfrxMemoView
          Left = 566.929500000000000000
          Top = 22.677165350000000000
          Width = 113.385826770000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #54624#51064#44552#50529)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo71: TfrxMemoView
          Left = 453.543600000000000000
          Top = 22.677165350000000000
          Width = 113.385826770000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #54624#51064#54943#49688)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo72: TfrxMemoView
          Left = 226.771800000000000000
          Top = 22.677165350000000000
          Width = 113.385826770000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #44540#47924#51088)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData9: TfrxMasterData
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 222.992270000000000000
        Width = 1046.929810000000000000
        DataSet = fDCClosing
        DataSetName = 'DCClosing'
        RowCount = 0
        object Memo76: TfrxMemoView
          Align = baClient
          Width = 1046.929810000000000000
          Height = 26.456710000000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object Memo77: TfrxMemoView
          Width = 113.385826770000000000
          Height = 26.456692910000000000
          DataField = 'ProcDate'
          DataSet = fDCClosing
          DataSetName = 'DCClosing'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[DCClosing."ProcDate"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo78: TfrxMemoView
          Left = 113.385900000000000000
          Width = 113.385826770000000000
          Height = 26.456692910000000000
          DataSet = fDCClosing
          DataSetName = 'DCClosing'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[DCClosing."ProcTime"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo81: TfrxMemoView
          Left = 226.771800000000000000
          Width = 113.385826770000000000
          Height = 26.456692910000000000
          DataField = 'MName'
          DataSet = fDCClosing
          DataSetName = 'DCClosing'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[DCClosing."MName"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo90: TfrxMemoView
          Left = 340.157700000000000000
          Width = 113.385826770000000000
          Height = 26.456692910000000000
          DataField = 'DCName'
          DataSet = fDCClosing
          DataSetName = 'DCClosing'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[DCClosing."DCName"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo123: TfrxMemoView
          Left = 453.543600000000000000
          Width = 113.385826770000000000
          Height = 26.456692910000000000
          DataSet = fDCClosing
          DataSetName = 'DCClosing'
          DisplayFormat.ThousandSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[DCClosing."COLUMN1"] '#44148' ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo124: TfrxMemoView
          Left = 566.929500000000000000
          Width = 113.385826770000000000
          Height = 26.456692910000000000
          DataSet = fDCClosing
          DataSetName = 'DCClosing'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[DCClosing."COLUMN2"] '#50896' ')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object qryDCClosing: TADOQuery
    Connection = dmTables.ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select CDate, ProcDate, ProcTime, MName, DCName, DCNo, Sum(DCCnt' +
        '), Sum(DCAmt) '
      'from DCClosing '
      'Group By CDate, ProcDate, ProcTime, MName, DCName, DCNo ')
    Left = 256
    Top = 200
    object qryDCClosingCDate: TStringField
      FieldName = 'CDate'
      FixedChar = True
      Size = 10
    end
    object qryDCClosingProcDate: TStringField
      FieldName = 'ProcDate'
      FixedChar = True
      Size = 10
    end
    object qryDCClosingProcTime: TStringField
      FieldName = 'ProcTime'
      FixedChar = True
      Size = 8
    end
    object qryDCClosingMName: TStringField
      FieldName = 'MName'
      Size = 50
    end
    object qryDCClosingDCName: TStringField
      FieldName = 'DCName'
      Size = 50
    end
    object qryDCClosingDCNo: TWordField
      FieldName = 'DCNo'
    end
    object qryDCClosingCOLUMN1: TIntegerField
      FieldName = 'COLUMN1'
      ReadOnly = True
    end
    object qryDCClosingCOLUMN2: TIntegerField
      FieldName = 'COLUMN2'
      ReadOnly = True
    end
  end
  object dsDCClosing: TDataSource
    DataSet = qryDCClosing
    Left = 216
    Top = 248
  end
  object fDCClosing: TfrxDBDataset
    UserName = 'DCClosing'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CDate=CDate'
      'ProcDate=ProcDate'
      'ProcTime=ProcTime'
      'MName=MName'
      'DCName=DCName'
      'DCNo=DCNo'
      'COLUMN1=COLUMN1'
      'COLUMN2=COLUMN2')
    OpenDataSource = False
    DataSource = dsDCClosing
    BCDToCurrency = False
    Left = 216
    Top = 296
  end
  object qryUnitInfo: TADOQuery
    Connection = dmTables.ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from UnitInfo')
    Left = 152
    Top = 200
    object qryUnitInfoParkNo: TSmallintField
      FieldName = 'ParkNo'
    end
    object qryUnitInfoUnitNo: TSmallintField
      FieldName = 'UnitNo'
    end
    object qryUnitInfoUnitName: TStringField
      FieldName = 'UnitName'
      Size = 50
    end
    object qryUnitInfoUnitKind: TWordField
      FieldName = 'UnitKind'
    end
    object qryUnitInfoMyNo: TWordField
      FieldName = 'MyNo'
    end
    object qryUnitInfoComport: TIntegerField
      FieldName = 'Comport'
    end
    object qryUnitInfoBaudrate: TIntegerField
      FieldName = 'Baudrate'
    end
    object qryUnitInfoIPNo: TStringField
      FieldName = 'IPNo'
      Size = 50
    end
    object qryUnitInfoPortNo: TIntegerField
      FieldName = 'PortNo'
    end
    object qryUnitInfoReserve1: TStringField
      FieldName = 'Reserve1'
      Size = 50
    end
    object qryUnitInfoReserve2: TStringField
      FieldName = 'Reserve2'
      Size = 50
    end
    object qryUnitInfoReserve3: TStringField
      FieldName = 'Reserve3'
      Size = 50
    end
    object qryUnitInfoReserve4: TStringField
      FieldName = 'Reserve4'
      Size = 50
    end
    object qryUnitInfoReserve5: TStringField
      FieldName = 'Reserve5'
      Size = 50
    end
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Excel files (*.xls)|*.xls'
    Left = 744
    Top = 196
  end
  object AdvGridExcelIO1: TAdvGridExcelIO
    AdvStringGrid = dgTKProc
    Options.ExportOverwriteMessage = 'File %s already exists'#13'Ok to overwrite ?'
    Options.ExportFormulas = False
    Options.ExportCellFormats = False
    Options.ExportRawRTF = False
    Options.ExportHardBorders = True
    UseUnicode = False
    GridStartRow = 0
    GridStartCol = 0
    DateFormat = 'YYYY-MM-DD'
    TimeFormat = 'HH:NN:SS'
    Version = '3.8.2'
    Left = 664
    Top = 196
  end
end
