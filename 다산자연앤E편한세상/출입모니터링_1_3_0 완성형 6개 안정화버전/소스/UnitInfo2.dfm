object frmUnitInfo: TfrmUnitInfo
  Left = 552
  Top = 186
  BorderStyle = bsDialog
  Caption = #44592#44592' '#49444#51221
  ClientHeight = 507
  ClientWidth = 934
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #47569#51008' '#44256#46357
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 17
  object dgUnitInfo: TDBAdvGrid
    Left = 0
    Top = 0
    Width = 934
    Height = 347
    Cursor = crDefault
    Align = alClient
    ColCount = 9
    DoubleBuffered = True
    DrawingStyle = gdsClassic
    RowCount = 5
    FixedRows = 1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = []
    Options = [goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goColSizing, goRowSelect]
    ParentDoubleBuffered = False
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 0
    OnClick = dgUnitInfoClick
    HoverRowCells = [hcNormal, hcSelected]
    ActiveCellFont.Charset = ANSI_CHARSET
    ActiveCellFont.Color = clWindowText
    ActiveCellFont.Height = -13
    ActiveCellFont.Name = #47569#51008' '#44256#46357
    ActiveCellFont.Style = [fsBold]
    ActiveCellColor = 15387318
    ControlLook.FixedGradientFrom = clWhite
    ControlLook.FixedGradientTo = clSilver
    ControlLook.FixedGradientHoverFrom = 13619409
    ControlLook.FixedGradientHoverTo = 12502728
    ControlLook.FixedGradientHoverMirrorFrom = 12502728
    ControlLook.FixedGradientHoverMirrorTo = 11254975
    ControlLook.FixedGradientDownFrom = 8816520
    ControlLook.FixedGradientDownTo = 7568510
    ControlLook.FixedGradientDownMirrorFrom = 7568510
    ControlLook.FixedGradientDownMirrorTo = 6452086
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
    FixedFont.Charset = ANSI_CHARSET
    FixedFont.Color = clWindowText
    FixedFont.Height = -13
    FixedFont.Name = #47569#51008' '#44256#46357
    FixedFont.Style = [fsBold]
    FloatFormat = '%.2f'
    Look = glTMS
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
    SearchFooter.ColorTo = 15790320
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
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        HeaderFont.Charset = ANSI_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -13
        HeaderFont.Name = #47569#51008' '#44256#46357
        HeaderFont.Style = [fsBold]
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = ANSI_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -12
        PrintFont.Name = #44404#47548#52404
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
        FieldName = 'ParkNo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        Header = #51452#52264#51109
        HeaderFont.Charset = ANSI_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -13
        HeaderFont.Name = #47569#51008' '#44256#46357
        HeaderFont.Style = [fsBold]
        HeaderAlignment = taCenter
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = ANSI_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -12
        PrintFont.Name = #44404#47548#52404
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
        FieldName = 'UnitNo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        Header = #44592#44592#48264#54840
        HeaderFont.Charset = ANSI_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -13
        HeaderFont.Name = #47569#51008' '#44256#46357
        HeaderFont.Style = [fsBold]
        HeaderAlignment = taCenter
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = ANSI_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -12
        PrintFont.Name = #44404#47548#52404
        PrintFont.Style = []
        Width = 20
      end
      item
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        FieldName = 'UnitName'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        Header = #44592#44592#47749
        HeaderFont.Charset = ANSI_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -13
        HeaderFont.Name = #47569#51008' '#44256#46357
        HeaderFont.Style = [fsBold]
        HeaderAlignment = taCenter
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = ANSI_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -12
        PrintFont.Name = #44404#47548#52404
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
        FieldName = 'ComPort'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        Header = #53685#49888#54252#53944
        HeaderFont.Charset = ANSI_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -13
        HeaderFont.Name = #47569#51008' '#44256#46357
        HeaderFont.Style = [fsBold]
        HeaderAlignment = taCenter
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = ANSI_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -12
        PrintFont.Name = #44404#47548#52404
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
        FieldName = 'Baudrate'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        Header = #53685#49888#49549#46020
        HeaderFont.Charset = ANSI_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -13
        HeaderFont.Name = #47569#51008' '#44256#46357
        HeaderFont.Style = [fsBold]
        HeaderAlignment = taCenter
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = ANSI_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -12
        PrintFont.Name = #44404#47548#52404
        PrintFont.Style = []
        Width = 20
      end
      item
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        FieldName = 'IPNo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        Header = 'IP '#51452#49548
        HeaderFont.Charset = ANSI_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -13
        HeaderFont.Name = #47569#51008' '#44256#46357
        HeaderFont.Style = [fsBold]
        HeaderAlignment = taCenter
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = ANSI_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -12
        PrintFont.Name = #44404#47548#52404
        PrintFont.Style = []
        Width = 20
      end
      item
        Alignment = taRightJustify
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        FieldName = 'PortNo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        Header = 'Port'
        HeaderFont.Charset = ANSI_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -13
        HeaderFont.Name = #47569#51008' '#44256#46357
        HeaderFont.Style = [fsBold]
        HeaderAlignment = taCenter
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = ANSI_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -12
        PrintFont.Name = #44404#47548#52404
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
        FieldName = 'MyNo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        Header = #50672#44208#44592#44592
        HeaderFont.Charset = ANSI_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -13
        HeaderFont.Name = #47569#51008' '#44256#46357
        HeaderFont.Style = [fsBold]
        HeaderAlignment = taCenter
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintFont.Charset = ANSI_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -12
        PrintFont.Name = #44404#47548#52404
        PrintFont.Style = []
        Width = 20
      end>
    DataSource = dsUnitInfo
    DataSetType = dtNonSequenced
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
      20
      20
      20
      20
      20
      20
      20
      20)
  end
  object Panel1: TPanel
    Left = 0
    Top = 347
    Width = 934
    Height = 160
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 1
    object AdvPanel1: TAdvPanel
      Left = 2
      Top = 2
      Width = 930
      Height = 135
      Align = alTop
      BevelOuter = bvNone
      Color = 16445929
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
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
      FullHeight = 0
      object Label1: TLabel
        Left = 302
        Top = 7
        Width = 100
        Height = 17
        Alignment = taRightJustify
        AutoSize = False
        Caption = #44592#44592#48264#54840
        Font.Charset = ANSI_CHARSET
        Font.Color = 7485192
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label2: TLabel
        Left = 543
        Top = 7
        Width = 90
        Height = 17
        Alignment = taRightJustify
        AutoSize = False
        Caption = #44592#44592#47749
        Font.Charset = ANSI_CHARSET
        Font.Color = 7485192
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label3: TLabel
        Left = 16
        Top = 35
        Width = 90
        Height = 17
        Alignment = taRightJustify
        AutoSize = False
        Caption = #44592#44592#51333#47448
        Font.Charset = ANSI_CHARSET
        Font.Color = 7485192
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label4: TLabel
        Left = 302
        Top = 36
        Width = 100
        Height = 17
        Alignment = taRightJustify
        AutoSize = False
        Caption = #53685#49888#54252#53944
        Font.Charset = ANSI_CHARSET
        Font.Color = 7485192
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label6: TLabel
        Left = 543
        Top = 35
        Width = 90
        Height = 17
        Alignment = taRightJustify
        AutoSize = False
        Caption = #53685#49888#49549#46020
        Font.Charset = ANSI_CHARSET
        Font.Color = 7485192
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label9: TLabel
        Left = 302
        Top = 63
        Width = 100
        Height = 17
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'TCP/IP Port'
        Font.Charset = ANSI_CHARSET
        Font.Color = 7485192
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label13: TLabel
        Left = 16
        Top = 7
        Width = 90
        Height = 17
        Alignment = taRightJustify
        AutoSize = False
        Caption = #51452#52264#51109#48264#54840
        Font.Charset = ANSI_CHARSET
        Font.Color = 7485192
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label7: TLabel
        Left = 543
        Top = 63
        Width = 90
        Height = 17
        Alignment = taRightJustify
        AutoSize = False
        Caption = #51204#44305#54032' IP '#51452#49548
        Font.Charset = ANSI_CHARSET
        Font.Color = 7485192
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label8: TLabel
        Left = 16
        Top = 91
        Width = 90
        Height = 17
        Alignment = taRightJustify
        AutoSize = False
        Caption = #48169#47928#51613'LPR'#48264#54840
        Font.Charset = ANSI_CHARSET
        Font.Color = 7485192
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label11: TLabel
        Left = 543
        Top = 91
        Width = 90
        Height = 17
        Alignment = taRightJustify
        AutoSize = False
        Caption = #47700#51064'LPR'#48264#54840
        Font.Charset = ANSI_CHARSET
        Font.Color = 7485192
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label10: TLabel
        Left = 302
        Top = 91
        Width = 100
        Height = 17
        Alignment = taRightJustify
        AutoSize = False
        Caption = #50672#46041#51077'/'#52636#44396#48264#54840
        Font.Charset = ANSI_CHARSET
        Font.Color = 7485192
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label5: TLabel
        Left = 16
        Top = 63
        Width = 90
        Height = 17
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'IP '#51452#49548
        Font.Charset = ANSI_CHARSET
        Font.Color = 7485192
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object edtUnitName: TAdvEdit
        Left = 636
        Top = 4
        Width = 170
        Height = 25
        EmptyTextStyle = []
        FocusColor = clAqua
        LabelFont.Charset = ANSI_CHARSET
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
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = 7485192
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ImeMode = imSHanguel
        ImeName = 'Microsoft Office IME 2007'
        MaxLength = 50
        ParentFont = False
        TabOrder = 2
        Text = ''
        Visible = True
        OnChange = cmbParkNoChange
        Version = '3.3.2.0'
      end
      object edtPortNo: TAdvSpinEdit
        Left = 404
        Top = 60
        Width = 121
        Height = 27
        Value = 0
        DateValue = 41042.880876909720000000
        HexValue = 0
        FocusColor = clAqua
        Font.Charset = ANSI_CHARSET
        Font.Color = 7485192
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        IncrementFloat = 0.100000000000000000
        IncrementFloatPage = 1.000000000000000000
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -11
        LabelFont.Name = 'MS Sans Serif'
        LabelFont.Style = []
        ParentFont = False
        TabOrder = 7
        Visible = True
        Version = '1.6.0.0'
        OnChange = cmbParkNoChange
        OnKeyPress = edtPortNoKeyPress
      end
      object edtUnitNo: TAdvSpinEdit
        Left = 404
        Top = 4
        Width = 121
        Height = 27
        Value = 0
        DateValue = 41042.880876909720000000
        HexValue = 0
        FocusColor = clAqua
        Font.Charset = ANSI_CHARSET
        Font.Color = 7485192
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        IncrementFloat = 0.100000000000000000
        IncrementFloatPage = 1.000000000000000000
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -11
        LabelFont.Name = 'MS Sans Serif'
        LabelFont.Style = []
        MaxValue = 255
        ParentFont = False
        TabOrder = 1
        Visible = True
        Version = '1.6.0.0'
        OnChange = cmbParkNoChange
      end
      object cmbUnitKind: TAdvComboBox
        Left = 108
        Top = 32
        Width = 188
        Height = 22
        Color = clWindow
        Version = '1.5.1.0'
        Visible = True
        Style = csOwnerDrawFixed
        EmptyTextStyle = []
        FocusColor = clAqua
        DropDownCount = 20
        DropWidth = 0
        Enabled = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 7485192
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ImeName = 'Microsoft Office IME 2007'
        ItemIndex = -1
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -11
        LabelFont.Name = 'MS Sans Serif'
        LabelFont.Style = []
        ParentFont = False
        TabOrder = 3
        OnChange = cmbUnitKindChange
      end
      object cmbComPort: TAdvComboBox
        Left = 404
        Top = 32
        Width = 121
        Height = 25
        Color = clWindow
        Version = '1.5.1.0'
        Visible = True
        EmptyTextStyle = []
        FocusColor = clAqua
        DropWidth = 0
        Enabled = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 7485192
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ImeName = 'Microsoft Office IME 2007'
        ItemIndex = 0
        Items.Strings = (
          #49324#50857#50504#54632
          'COM1'
          'COM2'
          'COM3'
          'COM4'
          'COM5'
          'COM6'
          'COM7'
          'COM8'
          'COM9'
          'COM10'
          'COM11'
          'COM12'
          'COM13'
          'COM14'
          'COM15'
          'COM16')
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -11
        LabelFont.Name = 'MS Sans Serif'
        LabelFont.Style = []
        ParentFont = False
        TabOrder = 4
        Text = #49324#50857#50504#54632
        OnChange = cmbParkNoChange
      end
      object cmbBaudrate: TAdvComboBox
        Left = 636
        Top = 32
        Width = 121
        Height = 25
        Color = clWindow
        Version = '1.5.1.0'
        Visible = True
        EmptyTextStyle = []
        FocusColor = clAqua
        DropWidth = 0
        Enabled = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 7485192
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ImeName = 'Microsoft Office IME 2007'
        ItemIndex = 0
        Items.Strings = (
          #49324#50857#50504#54632
          'br110'
          'br300'
          'br600'
          'br1200'
          'br2400'
          'br4800'
          'br9600'
          'br14400'
          'br19200'
          'br38400'
          'br56000'
          'br57600'
          'br115200'
          'br128000'
          'br256000')
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -11
        LabelFont.Name = 'MS Sans Serif'
        LabelFont.Style = []
        ParentFont = False
        TabOrder = 5
        Text = #49324#50857#50504#54632
      end
      object cmbParkNo: TAdvComboBox
        Left = 108
        Top = 4
        Width = 121
        Height = 25
        Color = clWindow
        Version = '1.5.1.0'
        Visible = True
        EmptyTextStyle = []
        FocusColor = clAqua
        DropWidth = 0
        Enabled = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 7485192
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ImeName = 'Microsoft Office IME 2007'
        ItemIndex = -1
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -11
        LabelFont.Name = 'MS Sans Serif'
        LabelFont.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object edtVisitCardNo: TAdvEdit
        Left = 108
        Top = 88
        Width = 121
        Height = 25
        EmptyTextStyle = []
        FocusColor = clAqua
        LabelFont.Charset = ANSI_CHARSET
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
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = 7485192
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ImeMode = imSHanguel
        ImeName = 'Microsoft Office IME 2007'
        MaxLength = 50
        ParentFont = False
        TabOrder = 9
        Text = ''
        Visible = True
        OnChange = cmbParkNoChange
        Version = '3.3.2.0'
      end
      object edtParkMatching: TAdvEdit
        Left = 404
        Top = 88
        Width = 121
        Height = 25
        EmptyTextStyle = []
        FocusColor = clAqua
        LabelFont.Charset = ANSI_CHARSET
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
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = 7485192
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ImeMode = imSHanguel
        ImeName = 'Microsoft Office IME 2007'
        MaxLength = 50
        ParentFont = False
        TabOrder = 10
        Text = ''
        Visible = True
        Version = '3.3.2.0'
      end
      object edtMainLprNo: TAdvEdit
        Left = 636
        Top = 88
        Width = 121
        Height = 25
        EmptyTextStyle = []
        FocusColor = clAqua
        LabelFont.Charset = ANSI_CHARSET
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
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = 7485192
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ImeMode = imSHanguel
        ImeName = 'Microsoft Office IME 2007'
        MaxLength = 50
        ParentFont = False
        TabOrder = 11
        Text = ''
        Visible = True
        OnChange = cmbParkNoChange
        Version = '3.3.2.0'
      end
      object edtIPNo: TAdvMaskEdit
        Left = 108
        Top = 60
        Width = 121
        Height = 25
        Color = clWindow
        Enabled = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 7485192
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ImeName = 'Microsoft Office IME 2007'
        ParentFont = False
        TabOrder = 6
        Text = ''
        Visible = True
        OnChange = cmbParkNoChange
        OnKeyDown = edtIPNoKeyDown
        AutoFocus = False
        Flat = False
        FlatLineColor = clBlack
        FlatParentColor = True
        ShowModified = False
        FocusColor = clAqua
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
      object edtDspIP: TAdvMaskEdit
        Left = 636
        Top = 60
        Width = 121
        Height = 25
        Color = clSilver
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = 7485192
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ImeName = 'Microsoft Office IME 2007'
        ParentFont = False
        TabOrder = 8
        Text = ''
        Visible = True
        AutoFocus = False
        Flat = False
        FlatLineColor = clBlack
        FlatParentColor = True
        ShowModified = False
        FocusColor = clAqua
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
    end
    object Panel2: TPanel
      Left = 2
      Top = 117
      Width = 930
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object btnSave: TAdvToolButton
        Left = 483
        Top = 5
        Width = 97
        Height = 35
        AutoThemeAdapt = False
        BorderColor = 14727579
        BorderDownColor = 4548219
        BorderHotColor = 10079963
        Color = 15653832
        ColorTo = 16178633
        ColorDown = 7778289
        ColorDownTo = 4296947
        ColorHot = 15465983
        ColorHotTo = 11332863
        ColorChecked = 11918331
        ColorCheckedTo = 7915518
        Caption = #51200'  '#51109
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
          AE746C9F52529A4D4E9C4E4F994748A37374B7B8B8B8B6B6B9B7B7BAB8B7BAB7
          B7B9B7B7B8B6B6B7B6B6B8B8B8A47171984546994A4B994B4C9A4D4E9A4D4EFF
          00FFFF00FFB48176C36E6BC96464C96464CB6565B757579A696AB0B1B1CDCDCB
          E5E3E1F2EFEDF9F5F2F9F5F1EEEBEAE3E2E0DEDFDFB67676952C2C9835359E3A
          3AC15B5BC060619A4C4DFF00FFB48176C36E6BCD6565CD6666CE6767BA58599B
          6C6CA18D8DB58180CFAFACDFCCCAF9F5F1FFFCF9FBF7F5EFEDEBE8E9E8B97677
          942A299833339E3939C25C5CC262629A4C4DFF00FFB48176C36E6BCC6565CB66
          66CE6767B858589E7171A17D7E9E3D3CB4706EC9A09DECE8E5FBF7F5FEFAF7F9
          F5F2F0F0EFBB7978942A2A9833339E3939C25C5CC262629A4C4DFF00FFB48176
          C36E6BCC6565CB6666CE6767B85858A27474A78484972F2F9F3F3FB57573DED8
          D7F2EFEDFBF7F5FEFBF8FAFAF7BE7C7C94292A9833339E3939C25C5CC262629A
          4C4DFF00FFB48176C36E6BCC6565CB6666CE6767B85858A57676AD8988983232
          972F2FA04848C9C2C1E5E3E1F3F0EDFDF9F6FFFFFDC27F7E9329299833339E39
          39C25C5CC262629A4C4DFF00FFB48176C36E6BCC6565CB6666CE6767B75757AB
          7A79B58C8B972B2B972B2B973232ADA6A6CFCFCEE6E3E0F6F3F0FFFFFDC48280
          9329299833339E3939C25C5CC262629A4C4DFF00FFB48176C36E6BCC6565CB66
          66CE6767B55656AE7C7BC5AAA8A66565A160609D64649E9F9FB4B9B8D3D6D4EC
          EFECFFFFFFC382819026269530309C3737C15B5BC262629A4C4DFF00FFB48176
          C36E6BCC6565CB6666CE6767BD5C5CB97172D3A7A5C9A0A0BF9999B89494B18D
          8DB18D8DC39F9ED8B2B1E6C2C0C57776A73F3FAA4545AE4949C66060C261629A
          4C4DFF00FFB48176C36E6BCD6666CD6666CD6666CC6565CC6363CB6161CB6262
          CB6262CC6162CC6162CB6161CA5F5FCA5F5FC95F5FCB6262CC6565CC6363CD66
          66CE6767C060619A4C4DFF00FFB48176C36E6BC66060C15D5CC46361C86C6BCB
          7272CD7776CD7776CD7776CD7776CD7776CD7776CD7776CD7776CD7776CD7776
          CD7776CD7978CD6F6FCD6666C060619A4C4DFF00FFB48276C46F6CB04E4AA549
          44B56C68C48F8CD0ABA9D7BCBBD8BFBED8BEBDD8BEBDD8BEBDD8BEBDD8BEBDD8
          BEBDD8BEBDD8BEBDD8BEBDD8C3C2D19090CC6161C060619A4C4DFF00FFB48276
          C46E6BAC4541CE9E9AFAF5F3F6EDECF7EFEEF8F1F0F8F1F0F8F1F0F8F1F0F8F1
          F0F8F1F0F8F1F0F8F1F0F8F1F0F8F1F0FAF3F2EEE5E4CD8E8DC35959C060619A
          4D4EFF00FFB48276C46E6BAC4541D2A6A3FFFFFFFBF5F4FBF5F4FBF5F4FBF5F4
          FBF5F4FBF5F4FBF5F4FBF5F4FBF5F4FBF5F4FBF5F4FBF5F4FDF7F6EFE7E6CC8D
          8CC15757C060619A4D4EFF00FFB48276C46E6BAC4541D1A4A1FFFFFDF8F2F1F8
          F1F0F8F2F1F8F2F1F8F2F1F8F2F1F8F2F1F8F2F1F8F2F1F8F2F1F8F2F1F8F1F0
          FBF5F4EFE6E5CC8D8CC15757C060619A4D4EFF00FFB48276C46E6BAC4541D1A4
          A1FFFFFEE9E4E3CCCACACDCCCCCDCCCCCDCCCCCDCCCCCDCCCCCDCCCCCDCCCCCD
          CCCCCDCCCCCAC9C8E6E2E2F2E8E7CC8D8CC15757C060619A4D4EFF00FFB48276
          C46E6BAC4541D1A4A1FFFFFEF5EEEEEDE8E7EDE8E7EDE8E7EDE8E7EDE8E7EDE8
          E7EDE8E7EDE8E7EDE8E7EDE8E7ECE7E6F5F0F0F1E7E6CC8D8CC15757C060619A
          4D4EFF00FFB48276C46E6BAC4541D1A4A1FFFFFEECE7E6D4D1D1D5D2D2D5D2D2
          D5D2D2D5D2D2D5D2D2D5D2D2D5D2D2D5D2D2D5D2D2D2D0D0E9E5E5F1E8E7CC8D
          8CC15757C060619A4D4EFF00FFB48276C46E6BAC4541D1A4A1FFFFFEF2ECEBE5
          E0DFE5E1E0E5E1E0E5E1E0E5E1E0E5E1E0E5E1E0E5E1E0E5E1E0E5E1E0E4DFDF
          F2EDECF1E7E6CC8D8CC15757C060619A4D4EFF00FFB48276C46E6BAC4541D1A4
          A1FFFFFEF2ECEBE5E0DFE5E1E0E5E1E0E5E1E0E5E1E0E5E1E0E5E1E0E5E1E0E5
          E1E0E5E1E0E4DFDFF2EDECF1E7E6CC8D8CC15757C060619A4D4EFF00FFB48276
          C46E6BAC4541D1A4A1FFFFFEEBE5E5D2CFCFD3D1D0D3D1D0D3D1D0D3D1D0D3D1
          D0D3D1D0D3D1D0D3D1D0D3D1D0D0CECEE9E4E3F2E8E7CC8D8CC15757C060619A
          4D4EFF00FFB48276C46E6BAC4541D2A5A2FFFFFFFCF5F4FDF6F5FDF6F5FDF6F5
          FDF6F5FDF6F5FDF6F5FDF6F5FDF6F5FDF6F5FDF6F5FDF6F5FFF8F7F1E7E6CC8D
          8CC35959C161629A4D4EFF00FFB48276BF6F6BAA4541CB9E9BF3F3F2EFE9E8EF
          E9E8EFE9E8EFE9E8EFE9E8EFE9E8EFE9E8EFE9E8EFE9E8EFE9E8EFE9E8EFE9E8
          F0ECEBE8E0DFC88B8AB85353B85C5D9A4D4EFF00FFFF00FFAD736CA14540B689
          87C6CBCBC4C3C3C4C3C3C4C3C3C4C3C3C4C3C3C4C3C3C4C3C3C4C3C3C4C3C3C4
          C3C3C4C3C3C4C3C3C3C3C3CFC9C8B884849644459A4C4DFF00FF}
        GlyphDisabled.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C006000000000000000000000000000000000000B5B5B5B5B5B5
          A2A2A2959595939393949494919191A1A1A1BBBBBBBBBBBBBBBBBBBCBCBCBCBC
          BCBBBBBBBBBBBBBBBBBBBCBCBCA1A1A1909090929292929292939393939393B5
          B5B5B5B5B5A7A7A7A4A4A4A2A2A2A2A2A2A3A3A39B9B9B9C9C9CB8B8B8C6C6C6
          D1D1D1D7D7D7DADADADADADAD5D5D5D0D0D0CFCFCFA5A5A58787878B8B8B8D8D
          8D9E9E9EA0A0A0939393B5B5B5A7A7A7A4A4A4A3A3A3A4A4A4A4A4A49C9C9C9D
          9D9DA9A9A9A9A9A9BCBCBCC8C8C8DADADADEDEDEDBDBDBD6D6D6D4D4D4A6A6A6
          8686868A8A8A8D8D8D9F9F9FA1A1A1939393B5B5B5A7A7A7A4A4A4A3A3A3A3A3
          A3A4A4A49C9C9CA0A0A0A4A4A48E8E8EA3A3A3B6B6B6D4D4D4DBDBDBDDDDDDDA
          DADAD7D7D7A7A7A78686868A8A8A8D8D8D9F9F9FA1A1A1939393B5B5B5A7A7A7
          A4A4A4A3A3A3A3A3A3A4A4A49C9C9CA1A1A1A7A7A78888888F8F8FA4A4A4CCCC
          CCD7D7D7DBDBDBDDDDDDDCDCDCA9A9A98686868A8A8A8D8D8D9F9F9FA1A1A193
          9393B5B5B5A7A7A7A4A4A4A3A3A3A3A3A3A4A4A49C9C9CA2A2A2AAAAAA8A8A8A
          888888929292C2C2C2D1D1D1D8D8D8DCDCDCDFDFDFAAAAAA8686868A8A8A8D8D
          8D9F9F9FA1A1A1939393B5B5B5A7A7A7A4A4A4A3A3A3A3A3A3A4A4A49B9B9BA5
          A5A5ACACAC878787878787898989B4B4B4C7C7C7D1D1D1D9D9D9DFDFDFABABAB
          8686868A8A8A8D8D8D9F9F9FA1A1A1939393B5B5B5A7A7A7A4A4A4A3A3A3A3A3
          A3A4A4A49A9A9AA6A6A6B9B9B99D9D9D9A9A9A9B9B9BAFAFAFBBBBBBCACACAD6
          D6D6DFDFDFABABAB8484848888888C8C8C9E9E9EA1A1A1939393B5B5B5A7A7A7
          A4A4A4A3A3A3A3A3A3A4A4A49E9E9EA4A4A4BABABAB6B6B6B2B2B2B0B0B0ACAC
          ACACACACB5B5B5BFBFBFC6C6C6A8A8A8909090939393959595A1A1A1A0A0A093
          9393B5B5B5A7A7A7A4A4A4A4A4A4A4A4A4A4A4A4A3A3A3A3A3A3A2A2A2A2A2A2
          A2A2A2A2A2A2A2A2A2A2A2A2A1A1A1A1A1A1A1A1A1A2A2A2A3A3A3A3A3A3A4A4
          A4A4A4A4A0A0A0939393B5B5B5A7A7A7A4A4A4A1A1A19F9F9FA1A1A1A5A5A5A7
          A7A7A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9
          A9A9A9AAAAAAA7A7A7A4A4A4A0A0A0939393B5B5B5A7A7A7A5A5A59696969393
          93A1A1A1AFAFAFBBBBBBC2C2C2C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C4C4C4B2B2B2A2A2A2A0A0A0939393B5B5B5A7A7A7
          A4A4A4939393B6B6B6DBDBDBD7D7D7D8D8D8D9D9D9D9D9D9D9D9D9D9D9D9D9D9
          D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9DADADAD3D3D3B1B1B19E9E9EA0A0A093
          9393B5B5B5A7A7A7A4A4A4939393B9B9B9DFDFDFDBDBDBDBDBDBDBDBDBDBDBDB
          DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDCDCDCD4D4D4B0B0
          B09D9D9DA0A0A0939393B5B5B5A7A7A7A4A4A4939393B9B9B9DFDFDFD9D9D9D9
          D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9
          DBDBDBD4D4D4B0B0B09D9D9DA0A0A0939393B5B5B5A7A7A7A4A4A4939393B9B9
          B9DFDFDFD2D2D2C5C5C5C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C4C4C4D1D1D1D5D5D5B0B0B09D9D9DA0A0A0939393B5B5B5A7A7A7
          A4A4A4939393B9B9B9DFDFDFD8D8D8D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4
          D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D8D8D8D5D5D5B0B0B09D9D9DA0A0A093
          9393B5B5B5A7A7A7A4A4A4939393B9B9B9DFDFDFD4D4D4C9C9C9C9C9C9C9C9C9
          C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C8C8C8D3D3D3D5D5D5B0B0
          B09D9D9DA0A0A0939393B5B5B5A7A7A7A4A4A4939393B9B9B9DFDFDFD6D6D6D0
          D0D0D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D0D0D0
          D7D7D7D5D5D5B0B0B09D9D9DA0A0A0939393B5B5B5A7A7A7A4A4A4939393B9B9
          B9DFDFDFD6D6D6D0D0D0D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1
          D1D1D1D1D1D0D0D0D7D7D7D5D5D5B0B0B09D9D9DA0A0A0939393B5B5B5A7A7A7
          A4A4A4939393B9B9B9DFDFDFD3D3D3C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8
          C8C8C8C8C8C8C8C8C8C8C8C8C8C7C7C7D2D2D2D5D5D5B0B0B09D9D9DA0A0A093
          9393B5B5B5A7A7A7A4A4A4939393B9B9B9DFDFDFDBDBDBDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDDDDDDD5D5D5B0B0
          B09E9E9EA0A0A0939393B5B5B5A7A7A7A4A4A4929292B6B6B6D9D9D9D5D5D5D5
          D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5
          D6D6D6D1D1D1AFAFAF9A9A9A9D9D9D939393B5B5B5B5B5B5A2A2A2919191ABAB
          ABC4C4C4C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1
          C1C1C1C1C1C1C1C1C1C1C1C5C5C5AAAAAA8F8F8F939393B5B5B5}
        ImageIndex = 0
        Rounded = True
        OnClick = btnSaveClick
        Version = '1.6.1.0'
      end
      object btnCancel: TAdvToolButton
        Left = 596
        Top = 5
        Width = 97
        Height = 35
        AutoThemeAdapt = False
        BorderColor = 14727579
        BorderDownColor = 4548219
        BorderHotColor = 10079963
        Color = 15653832
        ColorTo = 16178633
        ColorDown = 7778289
        ColorDownTo = 4296947
        ColorHot = 15465983
        ColorHotTo = 11332863
        ColorChecked = 11918331
        ColorCheckedTo = 7915518
        Caption = #52712'  '#49548
        Enabled = False
        Glyph.Data = {
          76060000424D7606000000000000360400002800000018000000180000000100
          08000000000040020000330B0000330B00000001000000010000005AAD000063
          B5000063BD00006BC600006BCE000073D600007BDE00007BE700007BEF000084
          EF000084F700FF00FF000084FF00008CFF00088CFF001094FF001894FF00219C
          FF00299CFF0031A5FF0039A5FF0042ADFF004AADFF0052ADFF0052B5FF005AB5
          FF0063B5FF006BBDFF0073C6FF007BC6FF0084C6FF008CCEFF00ADDEFF00FFFF
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
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000B0B0B0B0B0B
          0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B
          0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B
          0B0B0B0B1704000202020202020101020102010001170B0B0B0B0B0B0707090A
          0A0A0A0A0A090A090907060503020B0B0B0B0B0B060D0F10101010100E0F0F0E
          0D0D0A0706000B0B0B0B0B0B090E0F1212131212110F0F0E0E0D090A06000B0B
          0B0B0B0B090F1113211E121111100F0E1E210D0A07000B0B0B0B0B0B09111313
          13211E1211100F1E210D0A0D07020B0B0B0B0B0B101214141413211E11101E21
          0E0D0D0D09020B0B0B0B0B0B10141414141413211E1E210F0E0D0A0E0A030B0B
          0B0B0B0B101514151414131321210F0F0E0D0E0F0A020B0B0B0B0B0B13141515
          1513131E21211E100F0F0E0E0D030B0B0B0B0B0B1216151514131E211210211E
          0E0E0A0E0D030B0B0B0B0B0B13171616151E211312100F211E0E0E0F0E020B0B
          0B0B0B0B13191A171E2113141211100F211E100F0D030B0B0B0B0B0B141B1A19
          211514131211111010210E0F0E040B0B0B0B0B0B151D1C1A1917161514131312
          131111100D030B0B0B0B0B0B161F1F1C1A1A191716161615141313110E020B0B
          0B0B0B0B191E1F1C1A17171616161615141312100A050B0B0B0B0B0B20191614
          131312121213110F1010090909170B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B
          0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B
          0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B}
        GlyphDisabled.Data = {
          76060000424D7606000000000000360400002800000018000000180000000100
          0800000000004002000000000000000000000001000000000000005AAD000063
          B5000063BD00006BC600006BCE000073D600007BDE00007BE700007BEF000084
          EF000084F700FF00FF000084FF00008CFF00088CFF001094FF001894FF00219C
          FF00299CFF0031A5FF0039A5FF0042ADFF004AADFF0052ADFF0052B5FF005AB5
          FF0063B5FF006BBDFF0073C6FF007BC6FF0084C6FF008CCEFF00ADDEFF00FFFF
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
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020201E1A1E1E1E1E1E1E1E1E1E1E1E1E1A1E202020202020201E1E1E1E
          1E1E1E1E1E1E1E1E1E1E1E1E1E1E2020202020201E1E1E1E1E1E1E1E1E1E1E1E
          1E1E1E1E1E1A2020202020201E1E1E1F1F1F1F1F1F1E1E1E1E1E1E1E1E1A2020
          202020201E1E1F1F21201F1F1F1E1E1E20211E1E1E1A2020202020201E1F1F1F
          1F21201F1F1E1E20211E1E1E1E1E2020202020201E1F1F1F1F1F21201F1E2021
          1E1E1E1E1E1E2020202020201E1F1F1F1F1F1F212020211E1E1E1E1E1E1E2020
          202020201E201F201F1F1F1F21211E1E1E1E1E1E1E1E2020202020201F1F2020
          201F1F202121201E1E1E1E1E1E1E2020202020201F2020201F1F20211F1E2120
          1E1E1E1E1E1E2020202020201F2020202020211F1F1E1E21201E1E1E1E1E2020
          202020201F20202020211F1F1F1F1E1E21201E1E1E1E2020202020201F202020
          21201F1F1F1F1F1E1E211E1E1E1E20202020202020202020202020201F1F1F1F
          1F1F1F1E1E1E2020202020202020202020202020202020201F1F1F1F1E1E2020
          202020202020202020202020202020201F1F1F1E1E1E2020202020202020201F
          1F1F1F1F1F1F1F1E1E1E1E1E1E20202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020}
        ImageIndex = 0
        Rounded = True
        OnClick = btnCancelClick
        Version = '1.6.1.0'
      end
      object btnDelete: TAdvToolButton
        Left = 709
        Top = 5
        Width = 97
        Height = 35
        AutoThemeAdapt = False
        BorderColor = 14727579
        BorderDownColor = 4548219
        BorderHotColor = 10079963
        Color = 15653832
        ColorTo = 16178633
        ColorDown = 7778289
        ColorDownTo = 4296947
        ColorHot = 15465983
        ColorHotTo = 11332863
        ColorChecked = 11918331
        ColorCheckedTo = 7915518
        Caption = #49325'  '#51228
        Enabled = False
        Glyph.Data = {
          76060000424D7606000000000000360400002800000018000000180000000100
          08000000000040020000420B0000420B00000001000000010000A5390000A542
          0000AD420000AD4A0000B54A0000B5520000BD520000BD5A0000C65A0000A539
          0800A5420800944210009C4210008C421800635242006B52420063524A006B52
          4A006B5A4A00735A4A007B5A4A00735A5200736352007B6352007B635A007B6B
          5A007B6B6300846B630084736B008C736B008C7B6B008C7B7300947B73009484
          7B009C847B009C848400A5948C00AD949400B59C9400B59C9C00BD9C9C00ADA5
          9C00B5A59C00BDA59C00C6ADAD00BDB5AD00C6B5B500CEB5B500D6B5B500D6BD
          BD00DEBDBD00CEC6BD00DEBDC600D6C6C600E7CECE00E7D6DE00E7E7E700EFE7
          E700FFEFF700FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003B3B3B3B3B0A
          05033B3B3B3B3B3B3B05030A3B3B3B3B3B3B3B3B3B3B03070505033B3B3B3B3B
          05070305033B3B3B3B3B3B3B3B0A060A3B0A030A3B3B3B05050A3B0A040A3B3B
          3B3B3B3B3B08053B3B3B0A03053B050A033B3B3B030A3B3B3B3B3B3B3B08053B
          3B3B3B030A3B0A033B3B3B3B030A3B3B3B3B3B3B3B06050A3B3B3B030A3B0A03
          3B3B3B09030A3B3B3B3B3B3B3B3B0805093B0A040A3B0A050A3B0903033B3B3B
          3B3B3B3B3B3B3B08070303070A3B0A07040305053B3B3B3B3B3B3B3B3B3B3B3B
          080503050B0D0B04030A053B3B3B3B3B3B3B3B3B3B3B3B3B3B3B080B131C140B
          083B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B0F2431230F3B3B3B3B3B3B3B3B
          3B3B3B3B3B3B3B3B3B3B1021362F1B190F3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B
          3B3B163537211F36193B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B0F293A2E122A31
          290F3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B1939391C3B1D3636193B3B3B3B3B3B
          3B3B3B3B3B3B3B3B0E293C290F3B0F293C290E3B3B3B3B3B3B3B3B3B3B3B3B3B
          133838163B3B3B163838133B3B3B3B3B3B3B3B3B3B3B3B221F3C213B3B3B3B3B
          213C1F223B3B3B3B3B3B3B3B3B3B3B0E2D330F3B3B3B3B3B0F332D0E3B3B3B3B
          3B3B3B3B3B3B3B162D1A3B3B3B3B3B3B3B1A2D163B3B3B3B3B3B3B3B3B3B3B16
          1E3B3B3B3B3B3B3B3B3B1E163B3B3B3B3B3B3B3B3B3B3B12123B3B3B3B3B3B3B
          3B3B12123B3B3B3B3B3B3B3B3B3B3B123B3B3B3B3B3B3B3B3B3B3B123B3B3B3B
          3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B}
        GlyphDisabled.Data = {
          76060000424D7606000000000000360400002800000018000000180000000100
          0800000000004002000000000000000000000001000000000000A5390000A542
          0000AD420000AD4A0000B54A0000B5520000BD520000BD5A0000C65A0000A539
          0800A5420800944210009C4210008C421800635242006B52420063524A006B52
          4A006B5A4A00735A4A007B5A4A00735A5200736352007B6352007B635A007B6B
          5A007B6B6300846B630084736B008C736B008C7B6B008C7B7300947B73009484
          7B009C847B009C848400A5948C00AD949400B59C9400B59C9C00BD9C9C00ADA5
          9C00B5A59C00BDA59C00C6ADAD00BDB5AD00C6B5B500CEB5B500D6B5B500D6BD
          BD00DEBDBD00CEC6BD00DEBDC600D6C6C600E7CECE00E7D6DE00E7E7E700EFE7
          E700FFEFF700FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF002D2D2D2D2D21
          21212D2D2D2D2D2D2D2121212D2D2D2D2D2D2D2D2D2D21232121212D2D2D2D2D
          21232121212D2D2D2D2D2D2D2D2123212D2121212D2D2D2121212D2121212D2D
          2D2D2D2D2D23212D2D2D2121212D2121212D2D2D21212D2D2D2D2D2D2D23212D
          2D2D2D21212D21212D2D2D2D21212D2D2D2D2D2D2D2321212D2D2D21212D2121
          2D2D2D2121212D2D2D2D2D2D2D2D2321212D2121212D2121212D2121212D2D2D
          2D2D2D2D2D2D2D2323212123212D2123212121212D2D2D2D2D2D2D2D2D2D2D2D
          23212121212121212121212D2D2D2D2D2D2D2D2D2D2D2D2D2D2D232123242321
          232D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D21293329212D2D2D2D2D2D2D2D
          2D2D2D2D2D2D2D2D2D2D2129352E2424212D2D2D2D2D2D2D2D2D2D2D2D2D2D2D
          2D2D243335292935242D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D212D372E232D33
          2D212D2D2D2D2D2D2D2D2D2D2D2D2D2D2D243535242D293535242D2D2D2D2D2D
          2D2D2D2D2D2D2D2D212D372D212D212D372D212D2D2D2D2D2D2D2D2D2D2D2D2D
          233535242D2D2D243535232D2D2D2D2D2D2D2D2D2D2D2D292937292D2D2D2D2D
          293729292D2D2D2D2D2D2D2D2D2D2D212E33212D2D2D2D2D21332E212D2D2D2D
          2D2D2D2D2D2D2D242E242D2D2D2D2D2D2D242E242D2D2D2D2D2D2D2D2D2D2D24
          292D2D2D2D2D2D2D2D2D29242D2D2D2D2D2D2D2D2D2D2D23232D2D2D2D2D2D2D
          2D2D23232D2D2D2D2D2D2D2D2D2D2D232D2D2D2D2D2D2D2D2D2D2D232D2D2D2D
          2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D}
        ImageIndex = 0
        Rounded = True
        OnClick = btnDeleteClick
        Version = '1.6.1.0'
      end
      object btnClose: TAdvToolButton
        Left = 823
        Top = 5
        Width = 97
        Height = 35
        AutoThemeAdapt = False
        BorderColor = 14727579
        BorderDownColor = 4548219
        BorderHotColor = 10079963
        Color = 15653832
        ColorTo = 16178633
        ColorDown = 7778289
        ColorDownTo = 4296947
        ColorHot = 15465983
        ColorHotTo = 11332863
        ColorChecked = 11918331
        ColorCheckedTo = 7915518
        Caption = #51333'  '#47308
        Glyph.Data = {
          76060000424D7606000000000000360400002800000018000000180000000100
          08000000000040020000230F0000230F00000001000000010000316B4A003173
          4A0029735A00397B5200317B5A00327E5900377E5B00424242005A6B52004A7B
          5A00637B5200427B63008C6363009A666600A7666600AD6B6300A76C6D00AF68
          6900B0666700B3666700B4676800B6696A00B86B6B00B96C6D00BB6E6F00AD70
          7000B3737300BD707000BE717200C6666700CD676800C0696A00CE696A00D06A
          6B00D16B6C00D26C6D00D36D6E00D46E6F00D56F7000C0737400C2757500C376
          7700C0797A00C5787800C77A7A00C87B7C00CA7D7D00CC7F7F00D6707100D872
          7300DA747500DB757600DC767700DD777800DE787900DF797A00E07A7B00E17B
          7C00E27C7D00E37D7E00E47E7F00EF7C790029845A0039845A001C9A74001E9D
          7700199E78001B9F7800298463002B8763002D866400298C630029896400218C
          6B00238F6C00298C6B00298D6B0035896B00368E6E0021946B00209370002194
          730020967200249672002E937100279A7500239C760017A37C0015A57D0016A4
          7D0015A57E0014A77F0018A17A0018A17B0018A27B0018A37B0018A37C0019A4
          7C0019A57D0042846B0094946B00B59C7300F6A46800FF00FF00C6848400CD80
          8000DF898A00E6808100E7818200E6878200E8828300EA848500EB858600EC86
          8700E7878800ED878800EE888900EF898A00F08A8B00F18B8C00F28C8D00F38D
          8E00F48E8F00F58F9000E49A9800F6909100F7919200F2939400F8929300F993
          9400FA949500FB959600FC969700FD979800FE989900FF999A00F7B58400F5BB
          BC00F7C09800F2C4A700F7C6A500EFCEBD00F7CEBD00FCD4BC00F7D6CE00FFDE
          CE00FADCDC00FFE7DE00FFFFFF00000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000676767676767
          6767670C07676767676767676767676767676767676767670C0D0F0E07676767
          676767676767676767676767670C0D0F121D1E13070C0C0C0C0C0C0C0C0C0C0C
          6767670C0D111F1E1E1E1E13072A686A7F7F7F7F7F7F7F0C6767670F1E1E1E20
          2122221407475B5A58595F6061627F0C6767670F222222232425241507475A59
          575C434156557F0C6767670F252526303030251607475E5E5D424053544E7F0C
          6767670F253132333332321707445052514F4A4C4D637F0C6767670F25343637
          373635180702494B474845464B0B7F0C6767670F31343B3B3A39381B074B443E
          0405063F0B087F0C6767670F346E6C6B723D3C1C070003030103090808647F0C
          6767670F3B71706F89923D27070808010A0A646588887F0C6767670F3B757473
          92947F28076465658888888888887F0C6767670F6D7877767592732907668888
          8888888888887F0C6767670F777D7B7A7978772B076688888888888888887F0C
          6767670F7781807E7D7B7A2C0766888C8D8D8D8C88887F0C6767670F77848382
          81807E2D078C8C939393918D8D887F0C6767670F778786858584832E078D8F93
          91908D938C887F0C6767670F778787878786862F07668A8E93908E8C88887F0C
          6767670F7787878787878769076688888B8B8B8888887F0C6767670F0F687C87
          87878769076688888888888888887F0C67676767670D0F10687C8769070C0F0F
          0F0F0F0F0F0F0F0F67676767676767670D0F191A076767676767676767676767
          67676767676767676767670F0767676767676767676767676767}
        GlyphDisabled.Data = {
          76060000424D7606000000000000360400002800000018000000180000000100
          0800000000004002000000000000000000000001000000000000316B4A003173
          4A0029735A00397B5200317B5A00327E5900377E5B00424242005A6B52004A7B
          5A00637B5200427B63008C6363009A666600A7666600AD6B6300A76C6D00AF68
          6900B0666700B3666700B4676800B6696A00B86B6B00B96C6D00BB6E6F00AD70
          7000B3737300BD707000BE717200C6666700CD676800C0696A00CE696A00D06A
          6B00D16B6C00D26C6D00D36D6E00D46E6F00D56F7000C0737400C2757500C376
          7700C0797A00C5787800C77A7A00C87B7C00CA7D7D00CC7F7F00D6707100D872
          7300DA747500DB757600DC767700DD777800DE787900DF797A00E07A7B00E17B
          7C00E27C7D00E37D7E00E47E7F00EF7C790029845A0039845A001C9A74001E9D
          7700199E78001B9F7800298463002B8763002D866400298C630029896400218C
          6B00238F6C00298C6B00298D6B0035896B00368E6E0021946B00209370002194
          730020967200249672002E937100279A7500239C760017A37C0015A57D0016A4
          7D0015A57E0014A77F0018A17A0018A17B0018A27B0018A37B0018A37C0019A4
          7C0019A57D0042846B0094946B00B59C7300F6A46800FF00FF00C6848400CD80
          8000DF898A00E6808100E7818200E6878200E8828300EA848500EB858600EC86
          8700E7878800ED878800EE888900EF898A00F08A8B00F18B8C00F28C8D00F38D
          8E00F48E8F00F58F9000E49A9800F6909100F7919200F2939400F8929300F993
          9400FA949500FB959600FC969700FD979800FE989900FF999A00F7B58400F5BB
          BC00F7C09800F2C4A700F7C6A500EFCEBD00F7CEBD00FCD4BC00F7D6CE00FFDE
          CE00FADCDC00FFE7DE00FFFFFF00000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000007C7C7C7C7C7C
          7C7C7C64647C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C64656565647C7C7C
          7C7C7C7C7C7C7C7C7C7C7C7C7C64656565656565646464646464646464646464
          7C7C7C6465656565656565656465657C8D8D8D8D8D8D8D647C7C7C6565656565
          65656565646464646464646464648D647C7C7C65656565656565656564646464
          6464646464648D647C7C7C656565656565656565646464646464646464648D64
          7C7C7C656565656565656565646464646464646464648D647C7C7C6565656565
          65656565646464646464646464648D647C7C7C6565657C7C7C7C7C6564646464
          6464646464648D647C7C7C65657C7C7C7C7C7C65646464646464646464658D64
          7C7C7C657C7C7C7C8D8D7C6564646464646465658D8D8D647C7C7C657C7C7C7C
          8D928D65646565658D8D8D8D8D8D8D647C7C7C657C8D7C7C7C8D7C65647C8D8D
          8D8D8D8D8D8D8D647C7C7C657C8D8D8D8D8D7C65647C8D8D8D8D8D8D8D8D8D64
          7C7C7C657C8D8D8D8D8D8D65647C8D8D8D8D8D8D8D8D8D647C7C7C657C8D8D8D
          8D8D8D65648D8D9090908D8D8D8D8D647C7C7C657C8D8D8D8D8D8D65648D8D90
          8D8D8D908D8D8D647C7C7C657C8D8D8D8D8D8D65647C8D8D908D8D8D8D8D8D64
          7C7C7C657C8D8D8D8D8D8D65647C8D8D8D8D8D8D8D8D8D647C7C7C6565658D8D
          8D8D8D65647C8D8D8D8D8D8D8D8D8D647C7C7C7C7C656565658D8D6564646565
          65656565656565657C7C7C7C7C7C7C7C65656565647C7C7C7C7C7C7C7C7C7C7C
          7C7C7C7C7C7C7C7C7C7C7C65647C7C7C7C7C7C7C7C7C7C7C7C7C}
        ImageIndex = 0
        Rounded = True
        OnClick = btnCloseClick
        Version = '1.6.1.0'
      end
      object btnCopy: TAdvToolButton
        Left = 370
        Top = 5
        Width = 97
        Height = 35
        AutoThemeAdapt = False
        BorderColor = 14727579
        BorderDownColor = 4548219
        BorderHotColor = 10079963
        Color = 15653832
        ColorTo = 16178633
        ColorDown = 7778289
        ColorDownTo = 4296947
        ColorHot = 15465983
        ColorHotTo = 11332863
        ColorChecked = 11918331
        ColorCheckedTo = 7915518
        Caption = #48373' '#51228
        Glyph.Data = {
          36100000424D3610000000000000360000002800000020000000200000000100
          2000000000000010000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000001300000013000000130000001300000013000000130000000E0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000013000000340000004D0000004D0000004D0000004D0000004D0000
          004D0000004D0000004D0000004D0000004D0000004D0000004D0000004D0000
          004D0000004D0000004D0000004D0000004D0000004800000026000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000715A46FF715A46FF715A45FF715A45FF715A45FF715A
          45FF715A45FF715A45FF705A45FF705A45FF705A45FF705944FF705944FF7059
          44FF705944FF705944FF705944FF705944FF705944FF00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000755E4AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF735C48FF00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000078614DFFFFFFFFFFF8F3E9FFF7F2E8FFF7F1E7FFF6F1
          E5FFF6F0E4FFF6EFE3FFF5EFE2FFF5EEE0FFF4EDDFFFF4EDDEFFF4ECDDFFF3EB
          DBFFF3EBDAFFF2EAD9FFF2E9D8FFFFFFFFFF76604BFF00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000007B6551FFFFFFFFFFF8F4EBFFF8F3EAFFF7F2E8FFF7F2
          E7FFF7F1E6FFF6F0E4FFF6F0E3FFF5EFE2FFF5EEE1FFF5EDDFFFF4EDDEFFF4EC
          DDFFF3EBDCFFF3EBDAFFF3EAD9FFFFFFFFFF7A634FFF00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000007F6855FFFFFFFFFFF9F5ECFFF8F4EBFFF8F3EAFFF8F2
          E9FFF7F2E7FFF7F1E6FFF6F0E5FFF6F0E4FFF5EFE2FFF5EEE1FFF5EEE0FFF4ED
          DFFFF4ECDDFFF3ECDCFFF3EBDBFFFFFFFFFF7D6753FF00000000000000000000
          0000000000000000000000000000000000000000000000000000000000130000
          00130000001300000013826C59FFFFFFFFFFF9F5EEFFF9F5EDFFBBA799FFBAA7
          98FFB9A596FFB7A494FFB5A391FFB4A28FFFB2A08DFFB19F8BFFAF9E89FFAD9D
          87FFAC9B85FFF4ECDEFFF4ECDCFFFFFFFFFF806A57FF00000000000000130000
          00340000004D0000004D0000004D0000004D0000004D0000004D0000004D0000
          004D0000004D0000004D86705DFFFFFFFFFFFAF6EFFFF9F6EEFFF9F5EDFFF9F4
          ECFFF8F3EAFFF8F3E9FFF7F2E8FFF7F1E7FFF6F1E5FFF6F0E4FFF6EFE3FFF5EF
          E2FFF5EEE0FFF4EDDFFFF4EDDEFFFFFFFFFF846E5BFF00000000000000000000
          0000715A46FF715A46FF715A45FF715A45FF715A45FF715A45FF715A45FF715A
          45FF705A45FF705A45FF897361FFFFFFFFFFFAF7F1FFFAF6F0FFBBA799FFBAA7
          98FFB9A596FFB7A494FFB5A391FFB4A28FFFB2A08DFFB19F8BFFAF9E89FFAD9D
          87FFAC9B85FFF5EEE1FFF5EDDFFFFFFFFFFF87715FFF00000000000000000000
          0000755E4AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF8D7765FFFFFFFFFFFBF8F3FFFAF7F1FFFAF7F0FFFAF6
          EFFFF9F5EEFFF9F5ECFFF8F4EBFFF8F3EAFFF8F2E9FFF7F2E7FFF7F1E6FFF6F0
          E5FFF6F0E4FFF5EFE2FFF5EEE1FFFFFFFFFF8B7562FF00000000000000000000
          000078614DFFFFFFFFFFF8F3E9FFF7F2E8FFF7F1E7FFF6F1E5FFF6F0E4FFF6EF
          E3FFF5EFE2FFF5EEE0FF907A68FFFFFFFFFFFBF9F4FFFBF8F3FFBBA799FFBAA7
          98FFB9A596FFB7A494FFB5A391FFB4A28FFFB2A08DFFB19F8BFFAF9E89FFAD9D
          87FFAC9B85FFF6F0E4FFF6EFE3FFFFFFFFFF8E7866FF00000000000000000000
          00007B6551FFFFFFFFFFF8F4EBFFF8F3EAFFF7F2E8FFF7F2E7FFF7F1E6FFF6F0
          E4FFF6F0E3FFF5EFE2FF937E6CFFFFFFFFFFFCFAF6FFFBF9F4FFFBF8F3FFFBF8
          F2FFFAF7F1FFFAF6EFFFF9F6EEFFF9F5EDFFF9F4ECFFF8F4EAFFF8F3E9FFF7F2
          E8FFF7F1E7FFF6F1E5FFF6F0E4FFFFFFFFFF917C6AFF00000000000000000000
          00007F6855FFFFFFFFFFF9F5ECFFF8F4EBFFF8F3EAFFF8F2E9FFF7F2E7FFF7F1
          E6FFF6F0E5FFF6F0E4FF978170FFFFFFFFFFFCFBF7FFFCFAF6FFBBA799FFBAA7
          98FFB9A596FFB7A494FFB5A391FFB4A28FFFB2A08DFFB19F8BFFAF9E89FFAD9D
          87FFAC9B85FFF7F2E7FFF7F1E6FFFFFFFFFF957F6EFF00000000000000000000
          0000826C59FFFFFFFFFFF9F5EEFFF9F5EDFFBBA799FFBAA798FFB9A596FFB7A4
          94FFB5A391FFB4A28FFF9A8574FFFFFFFFFFFDFBF9FFFCFBF8FFFCFAF6FFFCF9
          F5FFFBF9F4FFFBF8F3FFFAF7F1FFFAF7F0FFFAF6EFFFF9F5EEFFF9F5ECFFF8F4
          EBFFF8F3EAFFF8F3E9FFF7F2E7FFFFFFFFFF988372FF00000000000000000000
          000086705DFFFFFFFFFFFAF6EFFFF9F6EEFFF9F5EDFFF9F4ECFFF8F3EAFFF8F3
          E9FFF7F2E8FFF7F1E7FF9E8978FFFFFFFFFFFDFCFAFFFDFCF9FFFDFBF8FFFCFA
          F7FFFCFAF5FFFBF9F4FFFBF8F3FFFAF7F2FFFAF7F0FFFAF6EFFFF9F5EEFFF9F5
          EDFFF8F4EBFFF8F3EAFFF8F3E9FFFFFFFFFF9C8675FF00000000000000000000
          0000897361FFFFFFFFFFFAF7F1FFFAF6F0FFBBA799FFBAA798FFB9A596FFB7A4
          94FFB5A391FFB4A28FFFA18C7CFFE3DFDBFFD3CBC4FFD2CAC3FFD2CAC2FFD2C9
          C1FFD1C9C0FFD1C9BFFFD0C8BEFFFBF8F3FFFBF8F2FFFAF7F1FFFAF6EFFFF9F6
          EEFFF9F5EDFFF9F4ECFFF8F4EBFFFFFFFFFF9F8A7AFF00000000000000000000
          00008D7765FFFFFFFFFFFBF8F3FFFAF7F1FFFAF7F0FFFAF6EFFFF9F5EEFFF9F5
          ECFFF8F4EBFFF8F3EAFFA99989FF7C6652FF7A634FFF806D59FF78614DFF7861
          4DFF78614DFF78614DFFD1C9C0FFFBF9F5FFFBF9F4FFFBF8F2FFFAF7F1FFFAF6
          F0FFF9F6EFFFF9F5EDFFF9F4ECFFFFFFFFFFA38E7DFF00000000000000000000
          0000907A68FFFFFFFFFFFBF9F4FFFBF8F3FFBBA799FFBAA798FFB9A596FFB7A4
          94FFB5A391FFB4A28FFFB2A08DFF96826FFFC3B8ABFFFFFFFFFFE4DFD5FFD4CC
          BDFFD4CCBDFF806A56FFD1C9C1FFFCFAF6FFFCF9F5FFFBF9F4FFFBF8F3FFFAF7
          F1FFFAF7F0FFFAF6EFFFF9F5EEFFFFFFFFFFA69181FF00000000000000000000
          0000937E6CFFFFFFFFFFFCFAF6FFFBF9F4FFFBF8F3FFFBF8F2FFFAF7F1FFFAF6
          EFFFF9F6EEFFF9F5EDFFF9F4ECFFF8F4EAFFB8AA9BFFCDC3B9FFFFFFFFFFE4DF
          D5FFD4CCBDFF897360FFD2CAC2FFFDFBF8FFFCFAF7FFFCFAF5FFFBF9F4FFFBF8
          F3FFFBF8F2FFFAF7F1FFFAF6EFFFFFFFFFFFA99585FF00000000000000000000
          0000978170FFFFFFFFFFFCFBF7FFFCFAF6FFBBA799FFBAA798FFB9A596FFB7A4
          94FFB5A391FFB4A28FFFB2A08DFFB19F8BFFAF9E89FFA4917EFFD1C7BEFFFFFF
          FFFFE4DFD5FF917C69FFD2CAC3FFFDFCFAFFFDFBF8FFFCFAF7FFFCFAF6FFFBF9
          F5FFFBF8F3FFFBF8F2FFFAF7F1FFFFFFFFFFAD9889FF00000000000000000000
          00009A8574FFFFFFFFFFFDFBF9FFFCFBF8FFFCFAF6FFFCF9F5FFFBF9F4FFFBF8
          F3FFFAF7F1FFFAF7F0FFFAF6EFFFF9F5EEFFF9F5ECFFF8F4EBFFC8B9ACFFD6CC
          C3FFFFFFFFFFB2A396FFD3CBC4FFFEFDFBFFFDFCFAFFFDFBF9FFFCFBF7FFFCFA
          F6FFFCF9F5FFFBF9F4FFFBF8F2FFFFFFFFFFB09C8DFF00000000000000000000
          00009E8978FFFFFFFFFFFDFCFAFFFDFCF9FFFDFBF8FFFCFAF7FFFCFAF5FFFBF9
          F4FFFBF8F3FFFAF7F2FFFAF7F0FFFAF6EFFFF9F5EEFFF9F5EDFFF8F4EBFFD0C1
          B5FFD5CABFFFAB9686FFD3CCC5FFFEFEFDFFFEFDFBFFFDFCFAFFFDFBF9FFFCFB
          F8FFFCFAF7FFFCF9F5FFFBF9F4FFFFFFFFFFB39F90FF00000000000000000000
          0000A18C7CFFE3DFDBFFD3CBC4FFD2CAC3FFD2CAC2FFD2C9C1FFD1C9C0FFD1C9
          BFFFD0C8BEFFFBF8F3FFFBF8F2FFFAF7F1FFFAF6EFFFF9F6EEFFF9F5EDFFF9F4
          ECFFD2C4B8FFBCA89AFFE3DFDBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7A394FF00000000000000000000
          00007B64509F7C6652FF7A634FFF806D59FF78614DFF78614DFF78614DFF7861
          4DFFD1C9C0FFFBF9F5FFFBF9F4FFFBF8F2FFFAF7F1FFFAF6F0FFF9F6EFFFF9F5
          EDFFF9F4ECFFD5C8BFFFBBA799FFBBA799FFBBA799FFBBA799FFBBA799FFBBA7
          99FFBBA799FFBBA799FFBAA698FFBAA698FFBAA698FF00000000000000000000
          00000000000087715E9FC3B8ABFFFFFFFFFFE4DFD5FFD4CCBDFFD4CCBDFF806A
          56FFD1C9C1FFFCFAF6FFFCF9F5FFFBF9F4FFFBF8F3FFFAF7F1FFFAF7F0FFFAF6
          EFFFF9F5EEFFFFFFFFFFA69181FF000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000937E6C9FCDC3B9FFFFFFFFFFE4DFD5FFD4CCBDFF8973
          60FFD2CAC2FFFDFBF8FFFCFAF7FFFCFAF5FFFBF9F4FFFBF8F3FFFBF8F2FFFAF7
          F1FFFAF6EFFFFFFFFFFFA99585FF000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000009F8A799FD1C7BEFFFFFFFFFFE4DFD5FF917C
          69FFD2CAC3FFFDFCFAFFFDFBF8FFFCFAF7FFFCFAF6FFFBF9F5FFFBF8F3FFFBF8
          F2FFFAF7F1FFFFFFFFFFAD9889FF000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000AB97879FD6CCC3FFFFFFFFFFB2A3
          96FFD3CBC4FFFEFDFBFFFDFCFAFFFDFBF9FFFCFBF7FFFCFAF6FFFCF9F5FFFBF9
          F4FFFBF8F2FFFFFFFFFFB09C8DFF000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000B7A3959FD5CABFFFAB96
          86FFD3CCC5FFFEFEFDFFFEFDFBFFFDFCFAFFFDFBF9FFFCFBF8FFFCFAF7FFFCF9
          F5FFFBF9F4FFFFFFFFFFB39F90FF000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000BCA89A9FBCA8
          9AFFE3DFDBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFB7A394FF000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000BCA8
          9A9FBBA799FFBBA799FFBBA799FFBBA799FFBBA799FFBBA799FFBBA799FFBBA7
          99FFBAA698FFBAA698FFBAA698FF000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        GlyphDisabled.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C006000000000000000000000000000000000000B5B5B5B5B5B5
          A2A2A2959595939393949494919191A1A1A1BBBBBBBBBBBBBBBBBBBCBCBCBCBC
          BCBBBBBBBBBBBBBBBBBBBCBCBCA1A1A1909090929292929292939393939393B5
          B5B5B5B5B5A7A7A7A4A4A4A2A2A2A2A2A2A3A3A39B9B9B9C9C9CB8B8B8C6C6C6
          D1D1D1D7D7D7DADADADADADAD5D5D5D0D0D0CFCFCFA5A5A58787878B8B8B8D8D
          8D9E9E9EA0A0A0939393B5B5B5A7A7A7A4A4A4A3A3A3A4A4A4A4A4A49C9C9C9D
          9D9DA9A9A9A9A9A9BCBCBCC8C8C8DADADADEDEDEDBDBDBD6D6D6D4D4D4A6A6A6
          8686868A8A8A8D8D8D9F9F9FA1A1A1939393B5B5B5A7A7A7A4A4A4A3A3A3A3A3
          A3A4A4A49C9C9CA0A0A0A4A4A48E8E8EA3A3A3B6B6B6D4D4D4DBDBDBDDDDDDDA
          DADAD7D7D7A7A7A78686868A8A8A8D8D8D9F9F9FA1A1A1939393B5B5B5A7A7A7
          A4A4A4A3A3A3A3A3A3A4A4A49C9C9CA1A1A1A7A7A78888888F8F8FA4A4A4CCCC
          CCD7D7D7DBDBDBDDDDDDDCDCDCA9A9A98686868A8A8A8D8D8D9F9F9FA1A1A193
          9393B5B5B5A7A7A7A4A4A4A3A3A3A3A3A3A4A4A49C9C9CA2A2A2AAAAAA8A8A8A
          888888929292C2C2C2D1D1D1D8D8D8DCDCDCDFDFDFAAAAAA8686868A8A8A8D8D
          8D9F9F9FA1A1A1939393B5B5B5A7A7A7A4A4A4A3A3A3A3A3A3A4A4A49B9B9BA5
          A5A5ACACAC878787878787898989B4B4B4C7C7C7D1D1D1D9D9D9DFDFDFABABAB
          8686868A8A8A8D8D8D9F9F9FA1A1A1939393B5B5B5A7A7A7A4A4A4A3A3A3A3A3
          A3A4A4A49A9A9AA6A6A6B9B9B99D9D9D9A9A9A9B9B9BAFAFAFBBBBBBCACACAD6
          D6D6DFDFDFABABAB8484848888888C8C8C9E9E9EA1A1A1939393B5B5B5A7A7A7
          A4A4A4A3A3A3A3A3A3A4A4A49E9E9EA4A4A4BABABAB6B6B6B2B2B2B0B0B0ACAC
          ACACACACB5B5B5BFBFBFC6C6C6A8A8A8909090939393959595A1A1A1A0A0A093
          9393B5B5B5A7A7A7A4A4A4A4A4A4A4A4A4A4A4A4A3A3A3A3A3A3A2A2A2A2A2A2
          A2A2A2A2A2A2A2A2A2A2A2A2A1A1A1A1A1A1A1A1A1A2A2A2A3A3A3A3A3A3A4A4
          A4A4A4A4A0A0A0939393B5B5B5A7A7A7A4A4A4A1A1A19F9F9FA1A1A1A5A5A5A7
          A7A7A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9
          A9A9A9AAAAAAA7A7A7A4A4A4A0A0A0939393B5B5B5A7A7A7A5A5A59696969393
          93A1A1A1AFAFAFBBBBBBC2C2C2C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C4C4C4B2B2B2A2A2A2A0A0A0939393B5B5B5A7A7A7
          A4A4A4939393B6B6B6DBDBDBD7D7D7D8D8D8D9D9D9D9D9D9D9D9D9D9D9D9D9D9
          D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9DADADAD3D3D3B1B1B19E9E9EA0A0A093
          9393B5B5B5A7A7A7A4A4A4939393B9B9B9DFDFDFDBDBDBDBDBDBDBDBDBDBDBDB
          DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDCDCDCD4D4D4B0B0
          B09D9D9DA0A0A0939393B5B5B5A7A7A7A4A4A4939393B9B9B9DFDFDFD9D9D9D9
          D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9
          DBDBDBD4D4D4B0B0B09D9D9DA0A0A0939393B5B5B5A7A7A7A4A4A4939393B9B9
          B9DFDFDFD2D2D2C5C5C5C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
          C6C6C6C6C6C4C4C4D1D1D1D5D5D5B0B0B09D9D9DA0A0A0939393B5B5B5A7A7A7
          A4A4A4939393B9B9B9DFDFDFD8D8D8D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4
          D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D8D8D8D5D5D5B0B0B09D9D9DA0A0A093
          9393B5B5B5A7A7A7A4A4A4939393B9B9B9DFDFDFD4D4D4C9C9C9C9C9C9C9C9C9
          C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C8C8C8D3D3D3D5D5D5B0B0
          B09D9D9DA0A0A0939393B5B5B5A7A7A7A4A4A4939393B9B9B9DFDFDFD6D6D6D0
          D0D0D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D0D0D0
          D7D7D7D5D5D5B0B0B09D9D9DA0A0A0939393B5B5B5A7A7A7A4A4A4939393B9B9
          B9DFDFDFD6D6D6D0D0D0D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1
          D1D1D1D1D1D0D0D0D7D7D7D5D5D5B0B0B09D9D9DA0A0A0939393B5B5B5A7A7A7
          A4A4A4939393B9B9B9DFDFDFD3D3D3C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8
          C8C8C8C8C8C8C8C8C8C8C8C8C8C7C7C7D2D2D2D5D5D5B0B0B09D9D9DA0A0A093
          9393B5B5B5A7A7A7A4A4A4939393B9B9B9DFDFDFDBDBDBDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDDDDDDD5D5D5B0B0
          B09E9E9EA0A0A0939393B5B5B5A7A7A7A4A4A4929292B6B6B6D9D9D9D5D5D5D5
          D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5
          D6D6D6D1D1D1AFAFAF9A9A9A9D9D9D939393B5B5B5B5B5B5A2A2A2919191ABAB
          ABC4C4C4C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1C1
          C1C1C1C1C1C1C1C1C1C1C1C5C5C5AAAAAA8F8F8F939393B5B5B5}
        ImageIndex = 0
        Rounded = True
        OnClick = btnCopyClick
        Version = '1.6.1.0'
      end
    end
  end
  object qryUnitInfo: TADOQuery
    Connection = dmTables.ADODB
    Parameters = <>
    SQL.Strings = (
      'Select * from UnitInfo')
    Left = 80
    Top = 128
    object qryUnitInfoParkNo: TSmallintField
      FieldName = 'ParkNo'
    end
    object qryUnitInfoUnitNo: TWordField
      FieldName = 'UnitNo'
    end
    object qryUnitInfoUnitName: TStringField
      FieldName = 'UnitName'
      Size = 50
    end
    object qryUnitInfoKindName: TStringField
      FieldKind = fkLookup
      FieldName = 'KindName'
      LookupDataSet = qryUnitKind
      LookupKeyFields = 'UnitKind'
      LookupResultField = 'KindName'
      KeyFields = 'UnitKind'
      Size = 50
      Lookup = True
    end
    object qryUnitInfoUnitKind: TWordField
      FieldName = 'UnitKind'
      Visible = False
    end
    object qryUnitInfoMyNo: TWordField
      FieldName = 'MyNo'
      OnGetText = qryUnitInfoMyNoGetText
    end
    object qryUnitInfoComPort: TWordField
      FieldName = 'ComPort'
      OnGetText = qryUnitInfoComPortGetText
    end
    object qryUnitInfoBaudrate: TWordField
      FieldName = 'Baudrate'
      OnGetText = qryUnitInfoBaudrateGetText
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
      OnGetText = qryUnitInfoReserve1GetText
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
  object dsUnitInfo: TDataSource
    DataSet = qryUnitInfo
    Left = 80
    Top = 176
  end
  object qryUnitKind: TADOQuery
    Connection = dmTables.ADODB
    Parameters = <>
    SQL.Strings = (
      'Select * from UnitKind'
      '')
    Left = 16
    Top = 128
    object qryUnitKindUnitKind: TWordField
      FieldName = 'UnitKind'
    end
    object qryUnitKindKindName: TStringField
      FieldName = 'KindName'
      Size = 50
    end
    object qryUnitKindReserve1: TStringField
      FieldName = 'Reserve1'
      Size = 50
    end
    object qryUnitKindReserve2: TStringField
      FieldName = 'Reserve2'
      Size = 50
    end
    object qryUnitKindReserve3: TStringField
      FieldName = 'Reserve3'
      Size = 50
    end
    object qryUnitKindReserve4: TStringField
      FieldName = 'Reserve4'
      Size = 50
    end
    object qryUnitKindReserve5: TStringField
      FieldName = 'Reserve5'
      Size = 50
    end
  end
  object qryTmp: TADOQuery
    Connection = dmTables.ADODB
    Parameters = <>
    SQL.Strings = (
      'select max(unitno)+1 maxNum from UnitInfo')
    Left = 156
    Top = 132
  end
end
