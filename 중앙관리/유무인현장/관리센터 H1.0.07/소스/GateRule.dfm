object frmGateRule: TfrmGateRule
  Left = 0
  Top = 0
  Caption = #52636#51077#53685#51228#44288#47532
  ClientHeight = 524
  ClientWidth = 956
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 956
    Height = 328
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object dg1: TDBAdvGrid
      Left = 1
      Top = 1
      Width = 954
      Height = 326
      Cursor = crDefault
      Align = alClient
      ColCount = 12
      DrawingStyle = gdsClassic
      RowCount = 2
      FixedRows = 1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goColSizing, goRowSelect]
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 0
      OnClick = dg1Click
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
      ControlLook.DropDownFooter.Font.Name = 'MS Sans Serif'
      ControlLook.DropDownFooter.Font.Style = []
      ControlLook.DropDownFooter.Visible = True
      ControlLook.DropDownFooter.Buttons = <>
      Filter = <>
      FilterDropDown.Font.Charset = DEFAULT_CHARSET
      FilterDropDown.Font.Color = clWindowText
      FilterDropDown.Font.Height = -11
      FilterDropDown.Font.Name = 'MS Sans Serif'
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
      PrintSettings.FitToPage = fpGrow
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
          Alignment = taCenter
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          HeaderFont.Charset = ANSI_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -12
          HeaderFont.Name = #44404#47548#52404
          HeaderFont.Style = []
          HeaderAlignment = taCenter
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
          FieldName = 'TKType'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = #44404#47548#52404
          Font.Style = []
          Header = #52264#47049#51333#47448
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = #44404#47548#52404
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Style = []
          Width = 92
        end
        item
          Alignment = taCenter
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'Reserve1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = #44404#47548#52404
          Font.Style = []
          Header = #50836#44552#51228
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = #44404#47548#52404
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
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
          FieldName = 'IoType'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = #44404#47548#52404
          Font.Style = []
          Header = #52636#51077#44396#48516
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = #44404#47548#52404
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Style = []
          Width = 72
        end
        item
          Alignment = taCenter
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'NormalSOpen'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = #44404#47548#52404
          Font.Style = []
          Header = #54217#51068#52636#51077#49884#51089#49884#44036
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = #44404#47548#52404
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Style = []
          Width = 100
        end
        item
          Alignment = taCenter
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'NormalEOpen'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = #44404#47548#52404
          Font.Style = []
          Header = #54217#51068#52636#51077#51333#47308#49884#44036
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = #44404#47548#52404
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Style = []
          Width = 100
        end
        item
          Alignment = taCenter
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'SatudaySOpen'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = #44404#47548#52404
          Font.Style = []
          Header = #53664#50836#51068#52636#51077#49884#51089#49884#44036
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = #44404#47548#52404
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Style = []
          Width = 100
        end
        item
          Alignment = taCenter
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'SatudayEOpen'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = #44404#47548#52404
          Font.Style = []
          Header = #53664#50836#51068#52636#51077#51333#47308#49884#44036
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = #44404#47548#52404
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Style = []
          Width = 100
        end
        item
          Alignment = taCenter
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'SundaySOpen'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = #44404#47548#52404
          Font.Style = []
          Header = #51068#50836#51068#52636#51077#49884#51089#49884#44036
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = #44404#47548#52404
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Style = []
          Width = 100
        end
        item
          Alignment = taCenter
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'SundayEOpen'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = #44404#47548#52404
          Font.Style = []
          Header = #51068#50836#51068#52636#51077#51333#47308#49884#44036
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = #44404#47548#52404
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Style = []
          Width = 100
        end
        item
          Alignment = taCenter
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'SpecialdaySOpen'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = #44404#47548#52404
          Font.Style = []
          Header = #53945#51221#51068#52636#51077#49884#51089#49884#44036
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = #44404#47548#52404
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Style = []
          Width = 100
        end
        item
          Alignment = taCenter
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'SpecialdayEOpen'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = #44404#47548#52404
          Font.Style = []
          Header = #53945#51221#51068#52636#51077#51333#47308#49884#44036
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = #44404#47548#52404
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Style = []
          Width = 100
        end>
      DataSource = dsGateRule
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
        92
        88
        72
        100
        100
        100
        100
        100
        100
        100
        100)
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 328
    Width = 956
    Height = 196
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 1
    object btnPrint: TBitBtn
      Left = 110
      Top = 207
      Width = 97
      Height = 35
      Caption = #51064'  '#49604
      Enabled = False
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
      TabOrder = 0
      Visible = False
    end
    object btnClose: TBitBtn
      Left = 850
      Top = 153
      Width = 97
      Height = 35
      Caption = #51333'  '#47308
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
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
      TabOrder = 1
      OnClick = btnCloseClick
    end
    object btnDelete: TBitBtn
      Left = 750
      Top = 153
      Width = 97
      Height = 35
      Caption = #49325'  '#51228
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        96010000424D9601000000000000760000002800000018000000180000000100
        0400000000002001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDD666DDDD
        DDD666DDDDDDDDDD66666DDDDD66666DDDDDDDD666D666DDD666D666DDDDDDD6
        6DDD666D666DDD66DDDDDDD66DDDD66D66DDDD66DDDDDDD666DDD66D66DDD466
        DDDDDDDD664D666D666D466DDDDDDDDDD666666D666666DDDDDDDDDDDD666666
        66666DDDDDDDDDDDDDDD6677766DDDDDDDDDDDDDDDDDD77877DDDDDDDDDDDDDD
        DDDD7788777DDDDDDDDDDDDDDDDD7887787DDDDDDDDDDDDDDDD78F878887DDDD
        DDDDDDDDDDD7FF7D7887DDDDDDDDDDDDDD78F87D78F87DDDDDDDDDDDDD7FF7DD
        D7FF7DDDDDDDDDDDD77F7DDDDD7F77DDDDDDDDDDD7887DDDDD7887DDDDDDDDDD
        D787DDDDDDD787DDDDDDDDDDD77DDDDDDDDD77DDDDDDDDDDD77DDDDDDDDD77DD
        DDDDDDDDD7DDDDDDDDDDD7DDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
      ParentFont = False
      TabOrder = 2
      OnClick = btnDeleteClick
    end
    object btnSave: TBitBtn
      Left = 551
      Top = 153
      Width = 97
      Height = 35
      Caption = #51200'  '#51109
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        96010000424D9601000000000000760000002800000018000000180000000100
        0400000000002001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DD7777778888
        88888777777DD777777788FFFFFF87444777D77777777788FFFFF7444777D777
        77777478FFFFF7444777D777777774478FFFF7444777D777777774478FFFF744
        4777D7777777744488FFF7444777D77777778777788FF7444777D77777778887
        778887477777D77777777777777777777777D77777777777777777777777D777
        77788888888888888777D7778FFFFFFFFFFFFFFF8777D7778FFFFFFFFFFFFFFF
        8777D7778FFFFFFFFFFFFFFF8777D7778FF88888888888FF8777D7778FFFFFFF
        FFFFFFFF8777D7778FF88888888888FF8777D7778FFFFFFFFFFFFFFF8777D777
        8FFFFFFFFFFFFFFF8777D7778FF88888888888FF8777D7778FFFFFFFFFFFFFFF
        8777D7778FFFFFFFFFFFFFFF7777DD767888888888888888777D}
      ParentFont = False
      TabOrder = 3
      OnClick = btnSaveClick
    end
    object btnCancel: TBitBtn
      Left = 650
      Top = 153
      Width = 97
      Height = 35
      Caption = #52712'  '#49548
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        96010000424D9601000000000000760000002800000018000000180000000100
        0400000000002001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDB3
        333333333333333BDDDDDD333333333333333333DDDDDD3BBBBBBBBBBBBB3333
        DDDDDD3BBBBBBBBBBBBB3333DDDDDD3BBBF8BBBBBB8FB333DDDDDD3BBBBF8BBB
        B8FB3B33DDDDDDBBBBBBF8BB8FBBBB33DDDDDDBBBBBBBF88FBBB3B33DDDDDDBB
        BBBBBBFFBBBBBB33DDDDDDBBBBBBB8FF8BBBBBB3DDDDDDBBBBBB8FBBF8BB3BB3
        DDDDDDBBBBB8FBBBBF8BBBB3DDDDDDB88B8FBBBBBBF8BBB3DDDDDDB888FBBBBB
        BBBFBBB3DDDDDDB8888BBBBBBBBBBBB3DDDDDDB888888BBBBBBBBBB3DDDDDD88
        888BBBBBBBBBBB33DDDDDD88BBBBBBBBBBBB333BDDDDDDDDDDDDDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
      ParentFont = False
      TabOrder = 4
      OnClick = btnCancelClick
    end
    object Panel2: TPanel
      Left = 10
      Top = 9
      Width = 938
      Height = 136
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      object cmbTKType: TAdvComboBox
        Left = 137
        Top = 39
        Width = 93
        Height = 20
        Color = clWindow
        Version = '1.5.1.0'
        Visible = True
        Style = csDropDownList
        EmptyTextStyle = []
        DropWidth = 0
        Enabled = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ItemIndex = 0
        Items.Strings = (
          #49440#53469
          #51068#48152#52264#47049
          #51221#44592#52264#47049)
        LabelCaption = #52264#47049#51333#47448
        LabelPosition = lpLeftCenter
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -12
        LabelFont.Name = #44404#47548#52404
        LabelFont.Style = []
        ParentFont = False
        TabOrder = 0
        Text = #49440#53469
      end
      object cmbFeeNo: TAdvComboBox
        Left = 291
        Top = 39
        Width = 158
        Height = 20
        Color = clWindow
        Version = '1.5.1.0'
        Visible = True
        EmptyTextStyle = []
        DropWidth = 0
        Enabled = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ItemIndex = -1
        LabelCaption = #50836#44552#51228
        LabelPosition = lpLeftCenter
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -12
        LabelFont.Name = #44404#47548#52404
        LabelFont.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object cmbIOType: TAdvComboBox
        Left = 595
        Top = 39
        Width = 86
        Height = 20
        Color = clWindow
        Version = '1.5.1.0'
        Visible = True
        Style = csDropDownList
        EmptyTextStyle = []
        DropWidth = 0
        Enabled = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ItemIndex = 0
        Items.Strings = (
          #51077#52264
          #52636#52264)
        LabelCaption = #52636#51077#44396#48516
        LabelPosition = lpLeftCenter
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -12
        LabelFont.Name = #44404#47548#52404
        LabelFont.Style = []
        ParentFont = False
        TabOrder = 2
        Text = #51077#52264
      end
      object edtNormalSTime: TAdvDateTimePicker
        Left = 137
        Top = 73
        Width = 93
        Height = 20
        Date = 39710.000000000000000000
        Format = 'HH:mm'
        Time = 39710.000000000000000000
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ImeName = 'Microsoft Office IME 2007'
        Kind = dkTime
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 3
        BorderStyle = bsSingle
        Ctl3D = True
        DateTime = 39710.000000000000000000
        Version = '1.2.0.6'
        LabelCaption = #54217#51068#52636#51077#49884#51089#49884#44036
        LabelPosition = lpLeftCenter
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -12
        LabelFont.Name = #44404#47548#52404
        LabelFont.Style = []
      end
      object edtNormalETime: TAdvDateTimePicker
        Left = 356
        Top = 73
        Width = 93
        Height = 20
        Date = 39710.000000000000000000
        Format = 'HH:mm'
        Time = 39710.000000000000000000
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ImeName = 'Microsoft Office IME 2007'
        Kind = dkTime
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 4
        BorderStyle = bsSingle
        Ctl3D = True
        DateTime = 39710.000000000000000000
        Version = '1.2.0.6'
        LabelCaption = #54217#51068#52636#51077#51333#47308#49884#44036
        LabelPosition = lpLeftCenter
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -12
        LabelFont.Name = #44404#47548#52404
        LabelFont.Style = []
      end
      object edtSaturdaySTime: TAdvDateTimePicker
        Left = 588
        Top = 73
        Width = 93
        Height = 20
        Date = 39710.000000000000000000
        Format = 'HH:mm'
        Time = 39710.000000000000000000
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ImeName = 'Microsoft Office IME 2007'
        Kind = dkTime
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 5
        BorderStyle = bsSingle
        Ctl3D = True
        DateTime = 39710.000000000000000000
        Version = '1.2.0.6'
        LabelCaption = #53664#50836#51068#52636#51077#49884#51089#49884#44036
        LabelPosition = lpLeftCenter
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -12
        LabelFont.Name = #44404#47548#52404
        LabelFont.Style = []
      end
      object edtSaturdayETime: TAdvDateTimePicker
        Left = 821
        Top = 73
        Width = 93
        Height = 20
        Date = 39710.000000000000000000
        Format = 'HH:mm'
        Time = 39710.000000000000000000
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ImeName = 'Microsoft Office IME 2007'
        Kind = dkTime
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 6
        BorderStyle = bsSingle
        Ctl3D = True
        DateTime = 39710.000000000000000000
        Version = '1.2.0.6'
        LabelCaption = #53664#50836#51068#52636#51077#51333#47308#49884#44036
        LabelPosition = lpLeftCenter
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -12
        LabelFont.Name = #44404#47548#52404
        LabelFont.Style = []
      end
      object edtSundaySTime: TAdvDateTimePicker
        Left = 137
        Top = 105
        Width = 93
        Height = 20
        Date = 39710.000000000000000000
        Format = 'HH:mm'
        Time = 39710.000000000000000000
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ImeName = 'Microsoft Office IME 2007'
        Kind = dkTime
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 7
        BorderStyle = bsSingle
        Ctl3D = True
        DateTime = 39710.000000000000000000
        Version = '1.2.0.6'
        LabelCaption = #51068#50836#51068#52636#51077#49884#51089#49884#44036
        LabelPosition = lpLeftCenter
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -12
        LabelFont.Name = #44404#47548#52404
        LabelFont.Style = []
      end
      object edtSundayETime: TAdvDateTimePicker
        Left = 356
        Top = 105
        Width = 93
        Height = 20
        Date = 39710.000000000000000000
        Format = 'HH:mm'
        Time = 39710.000000000000000000
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ImeName = 'Microsoft Office IME 2007'
        Kind = dkTime
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 8
        BorderStyle = bsSingle
        Ctl3D = True
        DateTime = 39710.000000000000000000
        Version = '1.2.0.6'
        LabelCaption = #51068#50836#51068#52636#51077#51333#47308#49884#44036
        LabelPosition = lpLeftCenter
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -12
        LabelFont.Name = #44404#47548#52404
        LabelFont.Style = []
      end
      object edtSpecialSTime: TAdvDateTimePicker
        Left = 588
        Top = 105
        Width = 93
        Height = 20
        Date = 39710.000000000000000000
        Format = 'HH:mm'
        Time = 39710.000000000000000000
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ImeName = 'Microsoft Office IME 2007'
        Kind = dkTime
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 9
        BorderStyle = bsSingle
        Ctl3D = True
        DateTime = 39710.000000000000000000
        Version = '1.2.0.6'
        LabelCaption = #53945#51221#51068#52636#51077#49884#51089#49884#44036
        LabelPosition = lpLeftCenter
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -12
        LabelFont.Name = #44404#47548#52404
        LabelFont.Style = []
      end
      object edtSpecialETime: TAdvDateTimePicker
        Left = 821
        Top = 105
        Width = 93
        Height = 20
        Date = 39710.000000000000000000
        Format = 'HH:mm'
        Time = 39710.000000000000000000
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ImeName = 'Microsoft Office IME 2007'
        Kind = dkTime
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 10
        BorderStyle = bsSingle
        Ctl3D = True
        DateTime = 39710.000000000000000000
        Version = '1.2.0.6'
        LabelCaption = #53945#51221#51068#52636#51077#51333#47308#49884#44036
        LabelPosition = lpLeftCenter
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -12
        LabelFont.Name = #44404#47548#52404
        LabelFont.Style = []
      end
      object cmbParkNo: TAdvComboBox
        Left = 137
        Top = 10
        Width = 93
        Height = 20
        Color = clWindow
        Version = '1.5.1.0'
        Visible = True
        Style = csDropDownList
        EmptyTextStyle = []
        FocusColor = clAqua
        DropWidth = 0
        Enabled = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 7485192
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ImeName = 'Microsoft Office IME 2007'
        ItemIndex = -1
        LabelCaption = #51452#52264#51109#48264#54840
        LabelPosition = lpLeftCenter
        LabelTransparent = True
        LabelAlwaysEnabled = True
        LabelFont.Charset = ANSI_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -12
        LabelFont.Name = #44404#47548#52404
        LabelFont.Style = []
        ParentFont = False
        TabOrder = 11
      end
    end
  end
  object qryFeeItem: TADOQuery
    Connection = dmTables.ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from FeeItem'
      '')
    Left = 56
    Top = 104
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
    object qryFeeItemItemMax: TIntegerField
      FieldName = 'ItemMax'
    end
    object qryFeeItemTotMax: TIntegerField
      FieldName = 'TotMax'
    end
    object qryFeeItemReserve1: TStringField
      FieldName = 'Reserve1'
      Size = 50
    end
    object qryFeeItemReserve2: TStringField
      FieldName = 'Reserve2'
      Size = 50
    end
    object qryFeeItemReserve3: TStringField
      FieldName = 'Reserve3'
      Size = 50
    end
    object qryFeeItemReserve4: TStringField
      FieldName = 'Reserve4'
      Size = 50
    end
    object qryFeeItemReserve5: TStringField
      FieldName = 'Reserve5'
      Size = 50
    end
  end
  object qryTemp: TADOQuery
    Connection = dmTables.ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from FeeItem'
      '')
    Left = 144
    Top = 104
    object SmallintField1: TSmallintField
      FieldName = 'ParkNo'
    end
    object WordField1: TWordField
      FieldName = 'FeeNo'
    end
    object StringField1: TStringField
      FieldName = 'FeeName'
      Size = 50
    end
    object IntegerField1: TIntegerField
      FieldName = 'ItemMax'
    end
    object IntegerField2: TIntegerField
      FieldName = 'TotMax'
    end
    object StringField2: TStringField
      FieldName = 'Reserve1'
      Size = 50
    end
    object StringField3: TStringField
      FieldName = 'Reserve2'
      Size = 50
    end
    object StringField4: TStringField
      FieldName = 'Reserve3'
      Size = 50
    end
    object StringField5: TStringField
      FieldName = 'Reserve4'
      Size = 50
    end
    object StringField6: TStringField
      FieldName = 'Reserve5'
      Size = 50
    end
  end
  object qryGateRule: TADOQuery
    Connection = dmTables.ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from gaterule')
    Left = 56
    Top = 172
    object qryGateRuleParkNo: TSmallintField
      FieldName = 'ParkNo'
    end
    object qryGateRuleTKType: TWordField
      FieldName = 'TKType'
      OnGetText = qryGateRuleTKTypeGetText
    end
    object qryGateRuleFeeNo: TWordField
      FieldName = 'FeeNo'
    end
    object qryGateRuleIoType: TIntegerField
      FieldName = 'IoType'
      OnGetText = qryGateRuleIoTypeGetText
    end
    object qryGateRuleNormalSOpen: TStringField
      FieldName = 'NormalSOpen'
      FixedChar = True
      Size = 5
    end
    object qryGateRuleNormalEOpen: TStringField
      FieldName = 'NormalEOpen'
      FixedChar = True
      Size = 5
    end
    object qryGateRuleSatudaySOpen: TStringField
      FieldName = 'SatudaySOpen'
      FixedChar = True
      Size = 5
    end
    object qryGateRuleSatudayEOpen: TStringField
      FieldName = 'SatudayEOpen'
      FixedChar = True
      Size = 5
    end
    object qryGateRuleSundaySOpen: TStringField
      FieldName = 'SundaySOpen'
      FixedChar = True
      Size = 5
    end
    object qryGateRuleSundayEOpen: TStringField
      FieldName = 'SundayEOpen'
      FixedChar = True
      Size = 5
    end
    object qryGateRuleSpecialdaySOpen: TStringField
      FieldName = 'SpecialdaySOpen'
      FixedChar = True
      Size = 5
    end
    object qryGateRuleSpecialdayEOpen: TStringField
      FieldName = 'SpecialdayEOpen'
      FixedChar = True
      Size = 5
    end
    object qryGateRuleReserve1: TStringField
      FieldName = 'Reserve1'
      Size = 50
    end
    object qryGateRuleReserve2: TStringField
      FieldName = 'Reserve2'
      Size = 50
    end
    object qryGateRuleReserve3: TStringField
      FieldName = 'Reserve3'
      Size = 50
    end
    object qryGateRuleReserve4: TStringField
      FieldName = 'Reserve4'
      Size = 50
    end
    object qryGateRuleReserve5: TStringField
      FieldName = 'Reserve5'
      Size = 50
    end
    object qryGateRuleUseYes: TIntegerField
      FieldName = 'UseYes'
    end
    object qryGateRuleFeeName: TStringField
      FieldKind = fkLookup
      FieldName = 'FeeName'
      LookupDataSet = qryFeeItem
      LookupKeyFields = 'FeeNo'
      LookupResultField = 'FeeName'
      KeyFields = 'FeeNo'
      Size = 50
      Lookup = True
    end
  end
  object dsGateRule: TDataSource
    DataSet = qryGateRule
    Left = 124
    Top = 172
  end
end
