object frmRFNSCData: TfrmRFNSCData
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'RF'#51221#44592#44428' '#46321#47197'/'#44592#44036#50672#51109' '#45236#50669
  ClientHeight = 437
  ClientWidth = 793
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
  object DBAdvGrid1: TDBAdvGrid
    Left = 7
    Top = 5
    Width = 778
    Height = 313
    Cursor = crDefault
    ColCount = 9
    DrawingStyle = gdsClassic
    RowCount = 2
    FixedRows = 1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #44404#47548#52404
    Font.Style = []
    Options = [goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goColSizing, goRowSelect]
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
        FieldName = 'IssueDate'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        Header = #48156#44553#51068#51088
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
        Width = 97
      end
      item
        Alignment = taCenter
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        FieldName = 'IssueTime'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        Header = #48156#44553#49884#44033
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
        Width = 88
      end
      item
        Alignment = taCenter
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        FieldName = 'MName'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        Header = #44540#47924#51088
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
        Width = 93
      end
      item
        Alignment = taCenter
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        FieldName = 'CarNo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        Header = #52264#47049#48264#54840
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
        Width = 90
      end
      item
        Alignment = taRightJustify
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        FieldName = 'IssueUnit'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        Header = #48156#44553#44552#50529
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
        Width = 100
      end
      item
        Alignment = taCenter
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        FieldName = 'WPName'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        Header = #49324#50857#49884#44036#45824
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
        Width = 70
      end
      item
        Alignment = taCenter
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        FieldName = 'ExpDateF'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        Header = #50976#54952#44592#44036'('#49884#51089')'
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
        Width = 100
      end
      item
        Alignment = taCenter
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        FieldName = 'ExpDateT'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        Header = #50976#54952#44592#44036'('#51333#47308')'
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
        Width = 100
      end>
    DataSource = dsIssueTk
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
      97
      88
      93
      90
      100
      70
      100
      100)
  end
  object Panel1: TPanel
    Left = 8
    Top = 324
    Width = 778
    Height = 41
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #44404#47548#52404
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Bevel2: TBevel
      Left = 492
      Top = 10
      Width = 70
      Height = 20
    end
    object Label7: TLabel
      Left = 655
      Top = 8
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
    object Label8: TLabel
      Left = 503
      Top = 14
      Width = 48
      Height = 12
      Alignment = taCenter
      Caption = #51312#54924#44592#44036
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Bevel1: TBevel
      Left = 284
      Top = 9
      Width = 70
      Height = 20
    end
    object Label1: TLabel
      Left = 295
      Top = 13
      Width = 48
      Height = 12
      Alignment = taCenter
      Caption = #48156#44553#51333#47448
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object edtSDate: TAdvDateTimePicker
      Left = 564
      Top = 10
      Width = 89
      Height = 20
      Date = 39710.652071759260000000
      Format = ''
      Time = 39710.652071759260000000
      DoubleBuffered = True
      ImeName = 'Microsoft Office IME 2007'
      Kind = dkDate
      ParentDoubleBuffered = False
      TabOrder = 0
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
    object edtEDate: TAdvDateTimePicker
      Left = 669
      Top = 10
      Width = 89
      Height = 20
      Date = 39710.652071759260000000
      Format = ''
      Time = 39710.652071759260000000
      DoubleBuffered = True
      ImeName = 'Microsoft Office IME 2007'
      Kind = dkDate
      ParentDoubleBuffered = False
      TabOrder = 1
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
    object cmbIssueType: TComboBox
      Left = 357
      Top = 9
      Width = 97
      Height = 20
      ImeName = #54620#44397#50612'('#54620#44544')'
      ItemIndex = 0
      TabOrder = 2
      Text = #51204' '#52404
      Items.Strings = (
        #51204' '#52404
        #49888#44508#48156#44553
        #44592#44036#50672#51109)
    end
  end
  object btnSearch: TBitBtn
    Left = 474
    Top = 375
    Width = 97
    Height = 35
    Caption = #51312'  '#54924
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
    TabOrder = 2
    OnClick = btnSearchClick
  end
  object btnExcel: TBitBtn
    Left = 581
    Top = 375
    Width = 97
    Height = 35
    Caption = #50641#49472#51200#51109
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
    TabOrder = 3
    OnClick = btnExcelClick
  end
  object btnClose: TBitBtn
    Left = 688
    Top = 375
    Width = 97
    Height = 35
    Caption = #51333'  '#47308
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
    TabOrder = 4
    OnClick = btnCloseClick
  end
  object btnPrint: TBitBtn
    Left = 580
    Top = 402
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
    TabOrder = 5
    Visible = False
  end
  object sb1: TStatusBar
    Left = 0
    Top = 418
    Width = 793
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object qryManager: TADOQuery
    Active = True
    Connection = dmTables.ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Manager')
    Left = 96
    Top = 128
    object qryManagerParkNo: TSmallintField
      FieldName = 'ParkNo'
    end
    object qryManagerMNo: TWordField
      FieldName = 'MNo'
    end
    object qryManagerPasswd: TStringField
      FieldName = 'Passwd'
    end
    object qryManagerMName: TStringField
      FieldName = 'MName'
      Size = 50
    end
    object qryManagerAuthority: TWordField
      FieldName = 'Authority'
    end
    object qryManagerReserve1: TStringField
      FieldName = 'Reserve1'
      Size = 50
    end
    object qryManagerReserve2: TStringField
      FieldName = 'Reserve2'
      Size = 50
    end
    object qryManagerReserve3: TStringField
      FieldName = 'Reserve3'
      Size = 50
    end
    object qryManagerReserve4: TStringField
      FieldName = 'Reserve4'
      Size = 50
    end
    object qryManagerReserve5: TStringField
      FieldName = 'Reserve5'
      Size = 50
    end
  end
  object qryIssueTk: TADOQuery
    Connection = dmTables.ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from IssueTk')
    Left = 168
    Top = 128
    object qryIssueTkParkNo: TSmallintField
      FieldName = 'ParkNo'
    end
    object qryIssueTkIssueDate: TStringField
      FieldName = 'IssueDate'
      FixedChar = True
      Size = 10
    end
    object qryIssueTkIssueTime: TStringField
      FieldName = 'IssueTime'
      FixedChar = True
      Size = 8
    end
    object qryIssueTkMNo: TWordField
      FieldName = 'MNo'
    end
    object qryIssueTkTKType: TWordField
      FieldName = 'TKType'
    end
    object qryIssueTkTKNo: TStringField
      FieldName = 'TKNo'
      Size = 50
    end
    object qryIssueTkCarTypeNo: TWordField
      FieldName = 'CarType'
    end
    object qryIssueTkIssueType: TWordField
      FieldName = 'IssueType'
    end
    object qryIssueTkIssueUnit: TIntegerField
      FieldName = 'IssueUnit'
    end
    object qryIssueTkExpDateF: TStringField
      FieldName = 'ExpDateF'
      FixedChar = True
      Size = 10
    end
    object qryIssueTkExpDateT: TStringField
      FieldName = 'ExpDateT'
      FixedChar = True
      Size = 10
    end
    object qryIssueTkFValue: TIntegerField
      FieldName = 'FValue'
    end
    object qryIssueTkChkClosing: TWordField
      FieldName = 'ChkClosing'
    end
    object qryIssueTkReserve1: TStringField
      FieldName = 'Reserve1'
      Size = 50
    end
    object qryIssueTkReserve2: TStringField
      FieldName = 'Reserve2'
      Size = 50
    end
    object qryIssueTkReserve3: TStringField
      FieldName = 'Reserve3'
      Size = 50
    end
    object qryIssueTkReserve4: TStringField
      FieldName = 'Reserve4'
      Size = 50
    end
    object qryIssueTkReserve5: TStringField
      FieldName = 'Reserve5'
      Size = 50
    end
    object qryIssueTkMName: TStringField
      FieldKind = fkLookup
      FieldName = 'MName'
      LookupDataSet = qryManager
      LookupKeyFields = 'MNo'
      LookupResultField = 'MName'
      KeyFields = 'MNo'
      Size = 50
      Lookup = True
    end
    object qryIssueTkWPNo: TWordField
      FieldName = 'WPNo'
    end
    object qryIssueTkWPName: TStringField
      FieldKind = fkLookup
      FieldName = 'WPName'
      LookupDataSet = qryWP
      LookupKeyFields = 'WPNo'
      LookupResultField = 'WPName'
      KeyFields = 'WPNo'
      Size = 50
      Lookup = True
    end
    object qryIssueTkUnitNo: TSmallintField
      FieldName = 'UnitNo'
    end
    object qryIssueTkCarNo: TStringField
      FieldName = 'CarNo'
      Size = 50
    end
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Excel files (*.xls)|*.xls'
    Left = 256
    Top = 128
  end
  object AdvGridExcelIO1: TAdvGridExcelIO
    Options.ExportOverwriteMessage = 'File %s already exists'#13'Ok to overwrite ?'
    Options.ExportFormulas = False
    Options.ExportCellFormats = False
    Options.ExportRawRTF = False
    Options.ExportHardBorders = True
    UseUnicode = False
    GridStartRow = 0
    DateFormat = 'YYYY-MM-DD'
    TimeFormat = 'HH:NN:SS'
    Version = '3.8.2'
    Left = 256
    Top = 192
  end
  object dsIssueTk: TDataSource
    DataSet = qryIssueTk
    Left = 168
    Top = 192
  end
  object qryWP: TADOQuery
    Active = True
    Connection = dmTables.ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from WP')
    Left = 96
    Top = 192
    object qryWPParkNo: TSmallintField
      FieldName = 'ParkNo'
    end
    object qryWPWPNo: TWordField
      FieldName = 'WPNo'
    end
    object qryWPWPName: TStringField
      FieldName = 'WPName'
      Size = 50
    end
    object qryWPChkSun: TWordField
      FieldName = 'ChkSun'
    end
    object qryWPSTimeSun: TStringField
      FieldName = 'STimeSun'
      FixedChar = True
      Size = 5
    end
    object qryWPETimeSun: TStringField
      FieldName = 'ETimeSun'
      FixedChar = True
      Size = 5
    end
    object qryWPChkMon: TWordField
      FieldName = 'ChkMon'
    end
    object qryWPSTimeMon: TStringField
      FieldName = 'STimeMon'
      FixedChar = True
      Size = 5
    end
    object qryWPETimeMon: TStringField
      FieldName = 'ETimeMon'
      FixedChar = True
      Size = 5
    end
    object qryWPChkTue: TWordField
      FieldName = 'ChkTue'
    end
    object qryWPSTimeTue: TStringField
      FieldName = 'STimeTue'
      FixedChar = True
      Size = 5
    end
    object qryWPETimeTue: TStringField
      FieldName = 'ETimeTue'
      FixedChar = True
      Size = 5
    end
    object qryWPChkWed: TWordField
      FieldName = 'ChkWed'
    end
    object qryWPSTimeWed: TStringField
      FieldName = 'STimeWed'
      FixedChar = True
      Size = 5
    end
    object qryWPETimeWed: TStringField
      FieldName = 'ETimeWed'
      FixedChar = True
      Size = 5
    end
    object qryWPChkThu: TWordField
      FieldName = 'ChkThu'
    end
    object qryWPSTimeThu: TStringField
      FieldName = 'STimeThu'
      FixedChar = True
      Size = 5
    end
    object qryWPETimeThu: TStringField
      FieldName = 'ETimeThu'
      FixedChar = True
      Size = 5
    end
    object qryWPChkFri: TWordField
      FieldName = 'ChkFri'
    end
    object qryWPSTimeFri: TStringField
      FieldName = 'STimeFri'
      FixedChar = True
      Size = 5
    end
    object qryWPETimeFri: TStringField
      FieldName = 'ETimeFri'
      FixedChar = True
      Size = 5
    end
    object qryWPChkSat: TWordField
      FieldName = 'ChkSat'
    end
    object qryWPSTimeSat: TStringField
      FieldName = 'STimeSat'
      FixedChar = True
      Size = 5
    end
    object qryWPETimeSat: TStringField
      FieldName = 'ETimeSat'
      FixedChar = True
      Size = 5
    end
    object qryWPReserve1: TStringField
      FieldName = 'Reserve1'
      Size = 50
    end
    object qryWPReserve2: TStringField
      FieldName = 'Reserve2'
      Size = 50
    end
    object qryWPReserve3: TStringField
      FieldName = 'Reserve3'
      Size = 50
    end
    object qryWPReserve4: TStringField
      FieldName = 'Reserve4'
      Size = 50
    end
    object qryWPReserve5: TStringField
      FieldName = 'Reserve5'
      Size = 50
    end
  end
end
