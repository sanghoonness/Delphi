object frmWebDCSum: TfrmWebDCSum
  Left = 0
  Top = 0
  Caption = #50937' '#50629#52404#48324' '#54624#51064#51665#44228
  ClientHeight = 530
  ClientWidth = 825
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
    Width = 825
    Height = 432
    Align = alClient
    TabOrder = 0
    object sgWebDC: TAdvStringGrid
      Left = 1
      Top = 1
      Width = 823
      Height = 430
      Cursor = crDefault
      Align = alClient
      DrawingStyle = gdsClassic
      FixedCols = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 0
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
      SearchFooter.HintFindNext = 'Find next occurrence'
      SearchFooter.HintFindPrev = 'Find previous occurrence'
      SearchFooter.HintHighlight = 'Highlight occurrences'
      SearchFooter.MatchCaseCaption = 'Match case'
      SortSettings.DefaultFormat = ssAutomatic
      Version = '7.2.8.0'
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 432
    Width = 825
    Height = 98
    Align = alBottom
    TabOrder = 1
    object Label4: TLabel
      Left = 628
      Top = 14
      Width = 12
      Height = 24
      Caption = '~'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object cmbMode: TAdvComboBox
      Left = 80
      Top = 16
      Width = 97
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
        #48156#44553#44592#51456
        #52636#52264#44592#51456)
      LabelCaption = #51312#54924#44592#51456
      LabelPosition = lpLeftCenter
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = #44404#47548#52404
      LabelFont.Style = []
      ParentFont = False
      TabOrder = 0
      Text = #48156#44553#44592#51456
    end
    object edtSDate: TAdvDateTimePicker
      Left = 454
      Top = 16
      Width = 89
      Height = 20
      Date = 39710.652071759260000000
      Format = ''
      Time = 39710.652071759260000000
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeName = 'Microsoft Office IME 2007'
      Kind = dkDate
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 2
      BorderStyle = bsSingle
      Ctl3D = True
      DateTime = 39710.652071759260000000
      Version = '1.2.0.6'
      LabelCaption = #51312#54924#51068#51088
      LabelPosition = lpLeftCenter
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = #44404#47548#52404
      LabelFont.Style = []
    end
    object edtEDate: TAdvDateTimePicker
      Left = 641
      Top = 16
      Width = 89
      Height = 20
      Date = 39710.652071759260000000
      Format = ''
      Time = 39710.652071759260000000
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeName = 'Microsoft Office IME 2007'
      Kind = dkDate
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 3
      BorderStyle = bsSingle
      Ctl3D = True
      DateTime = 39710.652071759260000000
      Version = '1.2.0.6'
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
    end
    object btnSearch: TBitBtn
      Left = 409
      Top = 58
      Width = 97
      Height = 35
      Caption = #51312'  '#54924'(&Q)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
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
      TabOrder = 4
      OnClick = btnSearchClick
    end
    object btnExcel: TBitBtn
      Left = 511
      Top = 58
      Width = 105
      Height = 35
      Caption = #50641#49472#51200#51109'(&E)'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
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
      TabOrder = 5
      OnClick = btnExcelClick
    end
    object btnClose: TBitBtn
      Left = 719
      Top = 58
      Width = 97
      Height = 35
      Caption = #51333'  '#47308'(&X)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
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
      TabOrder = 6
      OnClick = btnCloseClick
    end
    object btnPrint: TBitBtn
      Left = 619
      Top = 58
      Width = 97
      Height = 35
      Caption = #51064'  '#49604
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -12
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
      TabOrder = 7
      OnClick = btnPrintClick
    end
    object cmbStore: TAdvComboBox
      Left = 232
      Top = 16
      Width = 145
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
      ItemIndex = -1
      LabelCaption = #50629#52404
      LabelPosition = lpLeftCenter
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = #44404#47548#52404
      LabelFont.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object edtTotal: TPanel
      Left = 9
      Top = 57
      Width = 392
      Height = 35
      Alignment = taLeftJustify
      Caption = ' '#52509' '#44148#49688': 0'#44148', '#52509' '#54624#51064#44552#50529': 0'#44148', '#52509' '#52397#44396#44552#50529': 0'#50896
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      TabOrder = 8
    end
    object edtSTime: TAdvDateTimePicker
      Left = 544
      Top = 16
      Width = 81
      Height = 20
      Date = 39710.000000000000000000
      Format = 'HH:mm:ss'
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
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
    end
    object edtETime: TAdvDateTimePicker
      Left = 731
      Top = 16
      Width = 81
      Height = 20
      Date = 39710.999988425920000000
      Format = 'HH:mm:ss'
      Time = 39710.999988425920000000
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
      DateTime = 39710.999988425920000000
      Version = '1.2.0.6'
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
    end
  end
  object pnProgress: TPanel
    Left = 251
    Top = 302
    Width = 367
    Height = 75
    BevelInner = bvLowered
    TabOrder = 2
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
  object qryWebDC: TADOQuery
    Connection = dmTables.ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      ''
      '  select StoreName, DiscountName, DiscountCode, DiscountMoney '
      
        ' , DiscountValue, DiscountCount, (DiscountCount * DiscountMoney)' +
        ' as totalMoney, CONVERT(int, Reserve6) Reserve6, CONVERT(int, Re' +
        'serve7) Reserve7'
      
        ' from (select StoreName, DiscountName, DiscountCode, DiscountMon' +
        'ey '
      
        ' , sum(DiscountValue) as DiscountValue, sum(DiscountCount) as Di' +
        'scountCount, Reserve6, Reserve7  '
      ' from tblStoreDiscountPublish  '
      ' where DelYn=0 '
      
        ' group by StoreName, DiscountName, DiscountCode, DiscountMoney, ' +
        'Reserve6, Reserve7  '
      ' )  A '
      ' order by StoreName, DiscountCode')
    Left = 137
    Top = 121
    object qryWebDCStoreName: TStringField
      FieldName = 'StoreName'
      Size = 50
    end
    object qryWebDCDiscountName: TStringField
      FieldName = 'DiscountName'
      Size = 50
    end
    object qryWebDCDiscountCode: TStringField
      FieldName = 'DiscountCode'
      Size = 4
    end
    object qryWebDCDiscountMoney: TIntegerField
      FieldName = 'DiscountMoney'
      DisplayFormat = '#,##0'
    end
    object qryWebDCDiscountValue: TIntegerField
      FieldName = 'DiscountValue'
      ReadOnly = True
    end
    object qryWebDCDiscountCount: TIntegerField
      FieldName = 'DiscountCount'
      ReadOnly = True
    end
    object qryWebDCtotalMoney: TIntegerField
      FieldName = 'totalMoney'
      ReadOnly = True
      DisplayFormat = '#,##0'
    end
    object qryWebDCReserve6: TIntegerField
      FieldName = 'Reserve6'
      ReadOnly = True
      DisplayFormat = '#,##0'
    end
    object qryWebDCReserve7: TIntegerField
      FieldName = 'Reserve7'
      ReadOnly = True
      DisplayFormat = '#,##0'
    end
  end
  object dsWebDC: TDataSource
    DataSet = qryWebDC
    Left = 217
    Top = 113
  end
  object qry: TADOQuery
    Connection = dmTables.ADODB
    Parameters = <>
    Left = 145
    Top = 180
  end
  object AdvGridExcelIO1: TAdvGridExcelIO
    AdvStringGrid = sgWebDC
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
    Left = 216
    Top = 180
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Excel files (*.xls)|*.xls'
    Left = 296
    Top = 180
  end
  object frxReport1: TfrxReport
    Version = '5.4.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41121.595423356500000000
    ReportOptions.LastChange = 42598.640886967590000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Memo27OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  Memo27.Text:= <sDate>;                                        ' +
        '       '
      'end;'
      ''
      'begin'
      'end.            ')
    Left = 216
    Top = 64
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page2: TfrxReportPage
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Style = []
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 300.000000000000000000
      PaperSize = 256
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle2: TfrxReportTitle
        FillType = ftBrush
        Height = 66.031540000000000000
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
            #50629#52404#48324' '#54624#51064#45236#50669' '#51665#44228)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 3.779530000000000000
          Top = 47.133890000000000000
          Width = 260.787570000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo27OnBeforePrint'
          VAlign = vaCenter
        end
      end
      object Header2: TfrxHeader
        FillType = ftBrush
        Height = 49.732298110000000000
        Top = 147.401670000000000000
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
            ' '#50629#52404#48324' '#54624#51064#45236#50669' '#51665#44228)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo56: TfrxMemoView
          Top = 22.141746930000000000
          Width = 1046.929810000000000000
          Height = 27.590551180000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clSilver
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = cl3DLight
          ParentFont = False
        end
        object Memo82: TfrxMemoView
          Left = 226.551330000000000000
          Top = 22.787416220000000000
          Width = 226.771653543307100000
          Height = 26.834645670000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #54624#51064#51333#47448)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo83: TfrxMemoView
          Top = 22.787416220000000000
          Width = 226.771653543307100000
          Height = 26.834645670000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #49345#51216#47749)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo84: TfrxMemoView
          Left = 604.724800000000000000
          Top = 22.677180000000000000
          Width = 188.976377950000000000
          Height = 26.834645670000000000
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
        object Memo1: TfrxMemoView
          Left = 793.480830000000000000
          Top = 22.677180000000000000
          Width = 188.976377950000000000
          Height = 26.834645670000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #52397#44396#44552#50529)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 453.323130000000000000
          Top = 22.677180000000000000
          Width = 151.181102360000000000
          Height = 26.834645670000000000
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
      end
      object PageFooter2: TfrxPageFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 434.645950000000000000
        Width = 1046.929810000000000000
        object Memo26: TfrxMemoView
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
      object MasterData4: TfrxMasterData
        FillType = ftBrush
        Height = 30.700828900000000000
        Top = 219.212740000000000000
        Width = 1046.929810000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo89: TfrxMemoView
          Left = 226.551330000000000000
          Top = 0.464535200000000000
          Width = 226.771653540000000000
          Height = 30.236220470000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."DiscountName"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo90: TfrxMemoView
          Left = 0.338590000000000000
          Top = 0.464588900000000000
          Width = 226.771653543307100000
          Height = 30.236240000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."StoreName"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo91: TfrxMemoView
          Left = 605.504330000000000000
          Top = 0.464535200000000000
          Width = 188.976377950000000000
          Height = 30.236240000000000000
          DataField = 'Reserve7'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
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
            '[frxDBDataset1."Reserve7"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo92: TfrxMemoView
          Left = 794.480830000000000000
          Top = 0.464535200000000000
          Width = 188.976377950000000000
          Height = 30.236240000000000000
          DataField = 'Reserve6'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
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
            '[frxDBDataset1."Reserve6"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 454.102660000000000000
          Top = 0.464535200000000000
          Width = 151.181102360000000000
          Height = 30.236240000000000000
          DataField = 'DiscountCount'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.ThousandSeparator = ','
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."DiscountCount"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData8: TfrxMasterData
        FillType = ftBrush
        Top = 272.126160000000000000
        Width = 1046.929810000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
      end
      object Footer8: TfrxFooter
        FillType = ftBrush
        Height = 79.370130000000000000
        Top = 294.803340000000000000
        Width = 1046.929810000000000000
        object Memo119: TfrxMemoView
          Top = 49.133890000000000000
          Width = 260.787570000000000000
          Height = 30.236220470000000000
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
            '[nTotalCnt]'#44148)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo120: TfrxMemoView
          Left = 520.795441570000000000
          Top = 49.133890000000000000
          Width = 272.125984251968500000
          Height = 30.236240000000000000
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
            '[nTotalAmt1]'#50896)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Width = 793.701300000000000000
          Height = 22.677180000000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clScrollBar
          Memo.UTF8W = (
            ' '#54633#44228)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo44: TfrxMemoView
          Left = 519.795441570000000000
          Top = 22.677180000000000000
          Width = 273.259842519685000000
          Height = 26.456710000000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = cl3DLight
          HAlign = haCenter
          Memo.UTF8W = (
            #52509' '#52397#44396#44552#50529)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo96: TfrxMemoView
          Top = 22.677180000000000000
          Width = 260.787401570000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = cl3DLight
          HAlign = haCenter
          Memo.UTF8W = (
            #52509' '#44148#49688)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 260.787570000000000000
          Top = 49.133890000000000000
          Width = 260.031496060000000000
          Height = 30.236240000000000000
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
            '[nTotalAmt2]'#50896)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 260.787570000000000000
          Top = 22.677180000000000000
          Width = 260.031496060000000000
          Height = 26.456710000000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = cl3DLight
          HAlign = haCenter
          Memo.UTF8W = (
            #52509' '#54624#51064#44552#50529)
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSource = dsWebDC
    BCDToCurrency = False
    Left = 137
    Top = 65
  end
end
