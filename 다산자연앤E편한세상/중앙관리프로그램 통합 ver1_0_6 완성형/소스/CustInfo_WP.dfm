object FrmCustInfo_WP: TFrmCustInfo_WP
  Left = 0
  Top = 0
  Caption = #49464#45824#48324' '#51452#52264#49884#44036'('#51221#44592#52264#47049')'#54624#45817
  ClientHeight = 362
  ClientWidth = 1126
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object tdg2: TDBAdvGrid
    Left = 0
    Top = 0
    Width = 1126
    Height = 209
    Cursor = crDefault
    Align = alTop
    ColCount = 8
    DefaultColWidth = 100
    DefaultRowHeight = 25
    DoubleBuffered = True
    DrawingStyle = gdsClassic
    RowCount = 2
    FixedRows = 1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #44404#47548#52404
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goColSizing]
    ParentDoubleBuffered = False
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 0
    OnClick = tdg2Click
    GridLineColor = 15062992
    HoverRowCells = [hcNormal, hcSelected]
    ActiveCellFont.Charset = DEFAULT_CHARSET
    ActiveCellFont.Color = clWindowText
    ActiveCellFont.Height = -15
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
    FixedColWidth = 50
    FixedRowHeight = 25
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
    SortSettings.Show = True
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
      end
      item
        Alignment = taCenter
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        FieldName = 'dong'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #44404#47548#52404
        Font.Style = []
        Header = #46041
        HeaderFont.Charset = ANSI_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -15
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
        FieldName = 'ho'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #44404#47548#52404
        Font.Style = []
        Header = #54840
        HeaderFont.Charset = ANSI_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -15
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
        FieldName = 'allotmenttime'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #44404#47548#52404
        Font.Style = []
        Header = #54624#45817#49884#44036'('#48516')'
        HeaderFont.Charset = ANSI_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -15
        HeaderFont.Name = #44404#47548#52404
        HeaderFont.Style = []
        HeaderAlignment = taCenter
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = ANSI_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -15
        PrintFont.Name = #44404#47548#52404
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
        FieldName = 'UseTime'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #44404#47548#52404
        Font.Style = []
        Header = #49324#50857#49884#44036
        HeaderFont.Charset = ANSI_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -15
        HeaderFont.Name = #44404#47548#52404
        HeaderFont.Style = []
        HeaderAlignment = taCenter
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = ANSI_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -15
        PrintFont.Name = #44404#47548#52404
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
        FieldName = 'RemainTime'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #44404#47548#52404
        Font.Style = []
        Header = #45224#51008#49884#44036
        HeaderFont.Charset = ANSI_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -15
        HeaderFont.Name = #44404#47548#52404
        HeaderFont.Style = []
        HeaderAlignment = taCenter
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = ANSI_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -15
        PrintFont.Name = #44404#47548#52404
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
        FieldName = 'UpdateTime'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #44404#47548#52404
        Font.Style = []
        Header = #46321#47197#49884#44036
        HeaderFont.Charset = ANSI_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -15
        HeaderFont.Name = #44404#47548#52404
        HeaderFont.Style = []
        HeaderAlignment = taCenter
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = ANSI_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -15
        PrintFont.Name = #44404#47548#52404
        PrintFont.Style = []
        Width = 250
      end
      item
        Alignment = taRightJustify
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        FieldName = 'Yogum'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = #44404#47548#52404
        Font.Style = []
        Header = #44288#47532#48708
        HeaderFont.Charset = ANSI_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -15
        HeaderFont.Name = #44404#47548#52404
        HeaderFont.Style = []
        HeaderAlignment = taCenter
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = ANSI_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -15
        PrintFont.Name = #44404#47548#52404
        PrintFont.Style = []
        Width = 100
      end>
    DataSource = dsCustInfo_WP
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
    ShowUnicode = False
    ColWidths = (
      50
      100
      100
      150
      150
      150
      250
      100)
  end
  object Panel2: TPanel
    Left = 0
    Top = 209
    Width = 1126
    Height = 85
    Align = alTop
    TabOrder = 1
    object Bevel1: TBevel
      Left = 14
      Top = 14
      Width = 35
      Height = 21
    end
    object Label3: TLabel
      Left = 25
      Top = 19
      Width = 16
      Height = 15
      Alignment = taCenter
      Caption = #46041
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -15
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Bevel2: TBevel
      Left = 14
      Top = 43
      Width = 35
      Height = 20
    end
    object Label1: TLabel
      Left = 26
      Top = 47
      Width = 16
      Height = 15
      Alignment = taCenter
      Caption = #54840
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -15
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Bevel3: TBevel
      Left = 164
      Top = 14
      Width = 88
      Height = 23
    end
    object Label2: TLabel
      Left = 168
      Top = 19
      Width = 64
      Height = 15
      Alignment = taCenter
      Caption = #54624#45817#49884#44036
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -15
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Bevel4: TBevel
      Left = 164
      Top = 45
      Width = 88
      Height = 23
    end
    object Bevel6: TBevel
      Left = 386
      Top = 45
      Width = 88
      Height = 23
      Visible = False
    end
    object Label4: TLabel
      Left = 168
      Top = 49
      Width = 64
      Height = 15
      Alignment = taCenter
      Caption = #49324#50857#49884#44036
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -15
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Bevel7: TBevel
      Left = 386
      Top = 16
      Width = 88
      Height = 23
    end
    object Label7: TLabel
      Left = 390
      Top = 48
      Width = 64
      Height = 15
      Alignment = taCenter
      Caption = #52649#51204#49884#44036
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -15
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object Label6: TLabel
      Left = 390
      Top = 20
      Width = 64
      Height = 15
      Alignment = taCenter
      Caption = #45224#51008#49884#44036
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -15
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object edtdong: TEdit
      Left = 55
      Top = 16
      Width = 100
      Height = 23
      Alignment = taCenter
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeMode = imSHanguel
      ImeName = 'Microsoft IME 2010'
      ParentFont = False
      TabOrder = 0
    end
    object edtho: TEdit
      Left = 55
      Top = 45
      Width = 100
      Height = 23
      Alignment = taCenter
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeMode = imSHanguel
      ImeName = 'Microsoft IME 2010'
      ParentFont = False
      TabOrder = 1
    end
    object edtallotmenttime: TEdit
      Left = 258
      Top = 16
      Width = 122
      Height = 23
      Alignment = taCenter
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeMode = imSHanguel
      ImeName = 'Microsoft IME 2010'
      ParentFont = False
      TabOrder = 2
    end
    object edtUseTime: TEdit
      Left = 258
      Top = 45
      Width = 122
      Height = 23
      Alignment = taCenter
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeMode = imSHanguel
      ImeName = 'Microsoft IME 2010'
      ParentFont = False
      TabOrder = 3
    end
    object edtRemainTime: TEdit
      Left = 478
      Top = 16
      Width = 122
      Height = 23
      Alignment = taCenter
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeMode = imSHanguel
      ImeName = 'Microsoft IME 2010'
      ParentFont = False
      TabOrder = 4
    end
    object edtaccumulatedPoint: TEdit
      Left = 478
      Top = 45
      Width = 122
      Height = 23
      Alignment = taCenter
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeMode = imSHanguel
      ImeName = 'Microsoft IME 2010'
      ParentFont = False
      TabOrder = 5
      Visible = False
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 294
    Width = 1126
    Height = 53
    Align = alTop
    TabOrder = 2
    object btnClose: TBitBtn
      Left = 579
      Top = 10
      Width = 111
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
      TabOrder = 0
      OnClick = btnCloseClick
    end
    object btnAllAdd: TBitBtn
      Left = 242
      Top = 10
      Width = 111
      Height = 35
      Align = alCustom
      Caption = #51068#44292#46321#47197
      Glyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000EE0E0000EE0E00000001000000010000212100008C08
        0800941008008C420800945A080084101000843910008C181800943118009C31
        180094212100A53921009C5A210094292900A54A290094313100AD313100B539
        3100A5523100BD313900B5393900A5423900B54A3900AD424200B5424200B552
        4200B55A42009C4A4A00AD4A4A00B54A4A00BD4A4A00C65A4A004A005200B552
        5200BD525200C6525200CE5A5200BD5A5A00C65A5A00B58C5A00CE636300B584
        6300CE636B009C6B6B00C66B6B00D66B6B00B5736B00B58C6B00A5737300B573
        7300BD737300CE737300B57B7300BD7B7300C67B7300B5847300C67B7B00DE7B
        7B00BD847B00C6847B00A5848400C6848400A58C8C00AD8C8C00CE8C8C00E794
        9400BD9C9C00E79C9C00BDA5A500C6ADAD00D6ADAD00B5B5B500C6C6C600CEC6
        C600C6CEC600D6CEC600C6CECE00D6CECE00DECECE00D6DEDE00D6E7DE00E7E7
        E700EFE7E700F7EFEF00F7F7EF00F7F7F700FFF7F700FF00FF00FFFFFF00FFFF
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00575757575757
        5757575757575757575757575757575757575757575757575757575757575757
        57575757575757575757572C28212B4747474747474747280306575757575757
        5757372C28252B3E0D2E4E4A555851280B261B57575757575757372C2825303C
        0A072E524F55582811261B201B5757575757372C2821303F0D0D0F4752505528
        14261B00261B57575757372C282131454242444447524A2814261B19261B5757
        5757372C2828282828282828282828281D261B24261B201B5757371C1C403333
        333333333333392D17281B23261B00261B5737153B5453535353535353535241
        10281B21261B19261B5737153D585656565656565656524110281B1D261B1F26
        1B5737153B58494D4D4D4D4D4851524110251B21281B19261B5737153B585252
        525252525256524110251B21281B19261B5737153B5852525252525252565241
        10251B21281B19261B5737153B58494D4D4D4D4D4851524110251B21251B1928
        1B5737153B585656565656565656524110251B21251B19281B57270C2F4C4848
        484848484848483502051B22251B19281B5757575737123B5856565656565656
        56562A18251B19251B5757575737123B58494D4D4D4D4D4D4D564110251B1925
        1B57575757370429585656565656565656563802051B1A251B575757572F042F
        4C4848484848484848484635322A16251B57575757575757370E3B5849494949
        4949494956410B251B57575757575757370E3558565656565656565656400925
        1B575757575757573704344C4848484848484848483A080F1B57}
      TabOrder = 1
      OnClick = btnAllAddClick
    end
    object btnSave: TBitBtn
      Left = 125
      Top = 10
      Width = 111
      Height = 35
      Caption = #51200'  '#51109
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
      TabOrder = 2
      OnClick = btnSaveClick
    end
    object btnSearch: TBitBtn
      Left = 6
      Top = 10
      Width = 113
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
    object btnCancel: TBitBtn
      Left = 359
      Top = 10
      Width = 111
      Height = 35
      Caption = #52488#44592#54868
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
      TabOrder = 4
      OnClick = btnCancelClick
    end
    object btnExcel: TBitBtn
      Left = 476
      Top = 10
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
      TabOrder = 5
      OnClick = btnExcelClick
    end
  end
  object dsCustInfo_WP: TDataSource
    DataSet = qryCustInfo_WP
    Left = 184
    Top = 60
  end
  object qryCustInfo_WP: TADOQuery
    Connection = dmTables.ADODB
    Parameters = <>
    Left = 88
    Top = 61
    object qryCustInfo_WPdong: TStringField
      FieldName = 'dong'
    end
    object qryCustInfo_WPho: TStringField
      FieldName = 'ho'
    end
    object qryCustInfo_WPallotmenttime: TStringField
      FieldName = 'allotmenttime'
    end
    object qryCustInfo_WPUseTime: TStringField
      FieldName = 'UseTime'
    end
    object qryCustInfo_WPRemainTime: TStringField
      DisplayWidth = 20
      FieldName = 'RemainTime'
    end
    object qryCustInfo_WPUpdateTime: TStringField
      FieldName = 'UpdateTime'
    end
    object qryCustInfo_WPYogum: TIntegerField
      FieldName = 'Yogum'
    end
  end
  object qryTemp: TADOQuery
    Connection = dmTables.ADODB
    Parameters = <>
    Left = 88
    Top = 128
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Excel files (*.xls)|*.xls'
    Left = 184
    Top = 128
  end
  object AdvGridExcelIO1: TAdvGridExcelIO
    AdvStringGrid = tdg2
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
    Left = 259
    Top = 132
  end
end
