object frmSCData: TfrmSCData
  Left = 593
  Top = 283
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #51221#44592#52264#47049' '#54788#54889
  ClientHeight = 447
  ClientWidth = 1235
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548#52404
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object sb: TStatusBar
    Left = 0
    Top = 428
    Width = 1235
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object DBAdvGrid1: TDBAdvGrid
    Left = 0
    Top = 0
    Width = 1235
    Height = 328
    Cursor = crDefault
    Align = alTop
    ColCount = 14
    DrawingStyle = gdsClassic
    RowCount = 2
    FixedRows = 1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #44404#47548#52404
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goColSizing, goRowSelect]
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 1
    OnClick = DBAdvGrid1Click
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
        FieldName = 'GroupName'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        Header = #44536#47353#47749
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
        Width = 120
      end
      item
        Alignment = taCenter
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        FieldName = 'Name'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        Header = #49457'  '#47749
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
        Width = 77
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
        Alignment = taCenter
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        FieldName = 'CompName'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        Header = #54924#49324#47749
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
        FieldName = 'DeptName'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        Header = #48512#49436#47749
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
        Alignment = taCenter
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        FieldName = 'TelNo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        Header = #55092#45824#54256
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
        Width = 89
      end
      item
        Alignment = taCenter
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        FieldName = 'Reserve1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        Header = #52264#47049#51333#47448
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
        Width = 80
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
        Width = 100
      end
      item
        Alignment = taCenter
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        FieldName = 'Status'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        Header = #49345#53468
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
        Header = #52636#51077#49884#44036#45824
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
        Alignment = taCenter
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        FieldName = 'APB'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        Header = 'APB'
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
        Width = 91
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
        Width = 97
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
        Width = 97
      end>
    DataSource = dsCustInfo
    PageMode = False
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
    RefreshOnDelete = True
    RefreshOnInsert = True
    ShowUnicode = False
    ColWidths = (
      20
      120
      77
      90
      100
      90
      89
      80
      100
      90
      90
      91
      97
      97)
  end
  object Panel1: TPanel
    Left = 0
    Top = 328
    Width = 1235
    Height = 43
    Align = alTop
    TabOrder = 2
    object Bevel2: TBevel
      Left = 20
      Top = 10
      Width = 70
      Height = 20
    end
    object Label8: TLabel
      Left = 31
      Top = 14
      Width = 48
      Height = 12
      Alignment = taCenter
      Caption = #51312#54924#44536#47353
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Bevel1: TBevel
      Left = 332
      Top = 10
      Width = 70
      Height = 20
    end
    object Label1: TLabel
      Left = 343
      Top = 14
      Width = 48
      Height = 12
      Alignment = taCenter
      Caption = #51312#54924#44396#48516
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object cmbGroupName: TComboBox
      Left = 93
      Top = 10
      Width = 188
      Height = 20
      Style = csDropDownList
      ImeName = #54620#44397#50612'('#54620#44544')'
      TabOrder = 0
      OnChange = cmbGroupNameChange
    end
    object cmbType: TComboBox
      Left = 405
      Top = 10
      Width = 108
      Height = 20
      Style = csDropDownList
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 1
      Items.Strings = (
        #51204#52404
        #52264#47049#48264#54840
        #49457#47749
        #54840#49688
        #55092#45824#54256)
    end
    object edtSeek: TEdit
      Left = 520
      Top = 10
      Width = 177
      Height = 20
      ImeMode = imSHanguel
      ImeName = 'Microsoft IME 2010'
      TabOrder = 2
    end
  end
  object btnSearch: TBitBtn
    Left = 915
    Top = 383
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
    TabOrder = 3
    OnClick = btnSearchClick
  end
  object btnPrint: TBitBtn
    Left = 1025
    Top = 419
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
    TabOrder = 4
    Visible = False
  end
  object btnClose: TBitBtn
    Left = 1128
    Top = 383
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
    TabOrder = 5
    OnClick = btnCloseClick
  end
  object btnExcel: TBitBtn
    Left = 1022
    Top = 383
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
    TabOrder = 6
    OnClick = btnExcelClick
  end
  object btnExpOver: TBitBtn
    Left = 20
    Top = 383
    Width = 113
    Height = 35
    Caption = #47564#47308#52264#47049#51312#54924
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
    TabOrder = 7
    OnClick = btnExpOverClick
  end
  object btnDelete: TBitBtn
    Left = 139
    Top = 383
    Width = 97
    Height = 35
    Caption = #49325'  '#51228
    Enabled = False
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
    TabOrder = 8
    OnClick = btnDeleteClick
  end
  object qryCustInfo: TADOQuery
    Connection = dmTables.ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from CustInfo')
    Left = 56
    Top = 96
    object qryCustInfoParkNo: TSmallintField
      FieldName = 'ParkNo'
    end
    object qryCustInfoTKType: TWordField
      FieldName = 'TKType'
    end
    object qryCustInfoGroupNo: TWordField
      FieldName = 'GroupNo'
    end
    object qryCustInfoTKNo: TStringField
      FieldName = 'TKNo'
      Size = 50
    end
    object qryCustInfoName: TStringField
      FieldName = 'Name'
      Size = 50
    end
    object qryCustInfoTelNo: TStringField
      FieldName = 'TelNo'
      Size = 50
    end
    object qryCustInfoCarNo: TStringField
      FieldName = 'CarNo'
      Size = 50
    end
    object qryCustInfoCompName: TStringField
      FieldName = 'CompName'
      Size = 50
    end
    object qryCustInfoDeptName: TStringField
      FieldName = 'DeptName'
      Size = 50
    end
    object qryCustInfoAddress: TStringField
      FieldName = 'Address'
      Size = 100
    end
    object qryCustInfoIssueDate: TStringField
      FieldName = 'IssueDate'
      FixedChar = True
      Size = 10
    end
    object qryCustInfoIssueAmt: TIntegerField
      FieldName = 'IssueAmt'
    end
    object qryCustInfoStatus: TWordField
      FieldName = 'Status'
      OnGetText = qryCustInfoStatusGetText
    end
    object qryCustInfoExpDateF: TStringField
      FieldName = 'ExpDateF'
      FixedChar = True
      Size = 10
    end
    object qryCustInfoExpDateT: TStringField
      FieldName = 'ExpDateT'
      FixedChar = True
      Size = 10
    end
    object qryCustInfoWPNo: TWordField
      FieldName = 'WPNo'
    end
    object qryCustInfoLastParkNo: TSmallintField
      FieldName = 'LastParkNo'
    end
    object qryCustInfoLastUnitNo: TWordField
      FieldName = 'LastUnitNo'
    end
    object qryCustInfoLastUseDate: TStringField
      FieldName = 'LastUseDate'
      FixedChar = True
      Size = 10
    end
    object qryCustInfoLastUseTime: TStringField
      FieldName = 'LastUseTime'
      FixedChar = True
      Size = 8
    end
    object qryCustInfoIOStatusNo: TWordField
      FieldName = 'IOStatusNo'
    end
    object qryCustInfoCurrAmt: TIntegerField
      FieldName = 'CurrAmt'
    end
    object qryCustInfoAPB: TWordField
      FieldName = 'APB'
      OnGetText = qryCustInfoAPBGetText
    end
    object qryCustInfoCarTypeNo: TWordField
      FieldName = 'CarType'
    end
    object qryCustInfoMarkNo: TStringField
      FieldName = 'MarkNo'
      Size = 50
    end
    object qryCustInfoReserve1: TStringField
      FieldName = 'Reserve1'
      Size = 50
    end
    object qryCustInfoReserve2: TStringField
      FieldName = 'Reserve2'
      Size = 50
    end
    object qryCustInfoReserve3: TStringField
      FieldName = 'Reserve3'
      Size = 50
    end
    object qryCustInfoReserve4: TStringField
      FieldName = 'Reserve4'
      Size = 50
    end
    object qryCustInfoReserve5: TStringField
      FieldName = 'Reserve5'
      Size = 50
    end
    object qryCustInfoGroupName: TStringField
      FieldKind = fkLookup
      FieldName = 'GroupName'
      LookupDataSet = qryGroup
      LookupKeyFields = 'GroupNo'
      LookupResultField = 'GroupName'
      KeyFields = 'GroupNo'
      Size = 50
      Lookup = True
    end
    object qryCustInfoIOStatusName: TStringField
      FieldKind = fkLookup
      FieldName = 'IOStatusName'
      LookupDataSet = qryIOStatus
      LookupKeyFields = 'IOStatusNo'
      LookupResultField = 'IOStatusName'
      KeyFields = 'IOStatusNo'
      Size = 50
      Lookup = True
    end
    object qryCustInfoWPName: TStringField
      FieldKind = fkLookup
      FieldName = 'WPName'
      LookupDataSet = qryWP
      LookupKeyFields = 'WPNo'
      LookupResultField = 'WPName'
      KeyFields = 'WPNo'
      Size = 50
      Lookup = True
    end
  end
  object dsCustInfo: TDataSource
    DataSet = qryCustInfo
    Left = 56
    Top = 160
  end
  object qryGroup: TADOQuery
    Connection = dmTables.ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from GGroup')
    Left = 112
    Top = 96
    object qryGroupParkNo: TSmallintField
      FieldName = 'ParkNo'
    end
    object qryGroupGroupNo: TWordField
      FieldName = 'GroupNo'
    end
    object qryGroupGroupName: TStringField
      FieldName = 'GroupName'
      Size = 50
    end
    object qryGroupAPB: TWordField
      FieldName = 'APB'
    end
    object qryGroupStatus: TWordField
      FieldName = 'Status'
    end
    object qryGroupGroupType: TWordField
      FieldName = 'GroupType'
    end
    object qryGroupUseFeeItem: TWordField
      FieldName = 'UseFeeItem'
    end
    object qryGroupRemark: TStringField
      FieldName = 'Remark'
      Size = 255
    end
    object qryGroupReserve1: TStringField
      FieldName = 'Reserve1'
      Size = 50
    end
    object qryGroupReserve2: TStringField
      FieldName = 'Reserve2'
      Size = 50
    end
    object qryGroupReserve3: TStringField
      FieldName = 'Reserve3'
      Size = 50
    end
    object qryGroupReserve4: TStringField
      FieldName = 'Reserve4'
      Size = 50
    end
    object qryGroupReserve5: TStringField
      FieldName = 'Reserve5'
      Size = 50
    end
  end
  object qryIOStatus: TADOQuery
    Connection = dmTables.ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from IOStatus')
    Left = 112
    Top = 160
    object qryIOStatusIOStatusNo: TWordField
      FieldName = 'IOStatusNo'
    end
    object qryIOStatusIOStatusName: TStringField
      FieldName = 'IOStatusName'
      Size = 50
    end
    object qryIOStatusReserve1: TStringField
      FieldName = 'Reserve1'
      Size = 50
    end
    object qryIOStatusReserve2: TStringField
      FieldName = 'Reserve2'
      Size = 50
    end
    object qryIOStatusReserve3: TStringField
      FieldName = 'Reserve3'
      Size = 50
    end
    object qryIOStatusReserve4: TStringField
      FieldName = 'Reserve4'
      Size = 50
    end
    object qryIOStatusReserve5: TStringField
      FieldName = 'Reserve5'
      Size = 50
    end
  end
  object qryTemp: TADOQuery
    Connection = dmTables.ADODB
    Parameters = <>
    Left = 176
    Top = 96
  end
  object qryWP: TADOQuery
    Connection = dmTables.ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from WP')
    Left = 176
    Top = 160
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
  object SaveDialog1: TSaveDialog
    Filter = 'Excel files (*.xls)|*.xls'
    Left = 256
    Top = 96
  end
  object AdvGridExcelIO1: TAdvGridExcelIO
    AdvStringGrid = DBAdvGrid1
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
    Top = 160
  end
end
