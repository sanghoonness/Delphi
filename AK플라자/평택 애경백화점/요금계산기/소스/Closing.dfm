object frmClosing: TfrmClosing
  Left = 355
  Top = 283
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #47560'  '#44048
  ClientHeight = 464
  ClientWidth = 665
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object PageControl1: TAdvPageControl
    Left = 8
    Top = 8
    Width = 649
    Height = 356
    ActivePage = TabSheet1
    ActiveFont.Charset = DEFAULT_CHARSET
    ActiveFont.Color = clWindowText
    ActiveFont.Height = -11
    ActiveFont.Name = 'Tahoma'
    ActiveFont.Style = []
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #44404#47548#52404
    Font.Style = []
    MultiLine = True
    ParentFont = False
    ShowFocus = True
    ActiveColor = clAqua
    ActiveColorTo = 16777088
    TabSheetBorderColor = 16765615
    TabHoverColor = 16445929
    TabHoverColorTo = 15587527
    TabHoverBorder = 16765615
    TabBackGroundColor = clBtnFace
    TabMargin.LeftMargin = 10
    TabMargin.RightMargin = 10
    TabOverlap = 0
    RoundEdges = True
    TabStyle = tsDotNet
    Version = '2.0.0.4'
    PersistPagesState.Location = plRegistry
    PersistPagesState.Enabled = False
    TabOrder = 0
    TabPosition = tpBottom
    TabStop = False
    object TabSheet1: TAdvTabSheet
      Caption = #54000#53011#52376#47532
      Color = clBtnFace
      ColorTo = clNone
      TabColor = 16445929
      TabColorTo = 15587527
      object dgTKProc: TDBAdvGrid
        Left = 12
        Top = 13
        Width = 617
        Height = 143
        Cursor = crDefault
        ColCount = 7
        DrawingStyle = gdsClassic
        RowCount = 2
        FixedRows = 1
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
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
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            HeaderFont.Charset = ANSI_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'Tahoma'
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
            FieldName = 'MName'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = #44540#47924#51088
            HeaderFont.Charset = ANSI_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'Tahoma'
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
            FieldName = 'TKType'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = #54000#53011#51333#47448
            HeaderFont.Charset = ANSI_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'Tahoma'
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
            FieldName = 'COLUMN1'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = #52376#47532#44148#49688
            HeaderFont.Charset = ANSI_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'Tahoma'
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
            FieldName = 'COLUMN2'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = #51452#52264#44552#50529
            HeaderFont.Charset = ANSI_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'Tahoma'
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
            Alignment = taRightJustify
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            FieldName = 'COLUMN3'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = #54624#51064#44552#50529
            HeaderFont.Charset = ANSI_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'Tahoma'
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
            Alignment = taRightJustify
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            FieldName = 'COLUMN4'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = #49892#51228#44552#50529
            HeaderFont.Charset = ANSI_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'Tahoma'
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
        DataSource = dsCTKProc
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
          90
          90
          90
          100
          100
          100)
      end
      object AdvPanel1: TAdvPanel
        Left = 12
        Top = 158
        Width = 616
        Height = 157
        BevelOuter = bvNone
        Color = 16445929
        Font.Charset = ANSI_CHARSET
        Font.Color = 7485192
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
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
        object Bevel3: TBevel
          Left = 16
          Top = 49
          Width = 97
          Height = 20
        end
        object Label3: TLabel
          Left = 40
          Top = 53
          Width = 48
          Height = 12
          Alignment = taCenter
          Caption = #54624#51064#44552#50529
          Font.Charset = ANSI_CHARSET
          Font.Color = 7485192
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Bevel5: TBevel
          Left = 16
          Top = 88
          Width = 97
          Height = 20
        end
        object Label5: TLabel
          Left = 40
          Top = 92
          Width = 48
          Height = 12
          Alignment = taCenter
          Caption = #49688#46041#52636#52264
          Font.Charset = ANSI_CHARSET
          Font.Color = 7485192
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Bevel8: TBevel
          Left = 336
          Top = 88
          Width = 97
          Height = 20
        end
        object Label8: TLabel
          Left = 360
          Top = 92
          Width = 48
          Height = 12
          Alignment = taCenter
          Caption = #47924#47308#53685#44284
          Font.Charset = ANSI_CHARSET
          Font.Color = 7485192
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Bevel13: TBevel
          Left = 16
          Top = 10
          Width = 97
          Height = 20
        end
        object Label13: TLabel
          Left = 40
          Top = 14
          Width = 48
          Height = 12
          Alignment = taCenter
          Caption = #51452#52264#44552#50529
          Font.Charset = ANSI_CHARSET
          Font.Color = 7485192
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Bevel15: TBevel
          Left = 336
          Top = 10
          Width = 97
          Height = 20
        end
        object Label15: TLabel
          Left = 360
          Top = 14
          Width = 48
          Height = 12
          Alignment = taCenter
          Caption = #49892#51228#44552#50529
          Font.Charset = ANSI_CHARSET
          Font.Color = 7485192
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object btnDetail: TAdvToolButton
          Left = 500
          Top = 121
          Width = 97
          Height = 27
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
          Caption = #50836#44552#51333#47448#48324' '#45236#50669
          ImageIndex = 0
          Rounded = True
          OnClick = btnDetailClick
          Version = '1.6.1.0'
        end
        object Bevel1: TBevel
          Left = 336
          Top = 49
          Width = 97
          Height = 20
        end
        object Label1: TLabel
          Left = 360
          Top = 53
          Width = 60
          Height = 12
          Alignment = taCenter
          Caption = #52509#54624#51064#44148#49688
          Font.Charset = ANSI_CHARSET
          Font.Color = 7485192
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Bevel2: TBevel
          Left = 16
          Top = 126
          Width = 97
          Height = 20
          Visible = False
        end
        object Label2: TLabel
          Left = 40
          Top = 130
          Width = 48
          Height = 12
          Alignment = taCenter
          Caption = #55036#49552#52376#47532
          Font.Charset = ANSI_CHARSET
          Font.Color = 7485192
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          ParentFont = False
          Transparent = True
          Visible = False
        end
        object edtTot: TAdvEdit
          Left = 181
          Top = 10
          Width = 93
          Height = 21
          EditAlign = eaRight
          EditType = etMoney
          EmptyText = '0'
          EmptyTextStyle = []
          FocusColor = 16445929
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'MS Sans Serif'
          LabelFont.Style = []
          Lookup.Font.Charset = DEFAULT_CHARSET
          Lookup.Font.Color = clWindowText
          Lookup.Font.Height = -11
          Lookup.Font.Name = 'Arial'
          Lookup.Font.Style = []
          Lookup.Separator = ';'
          AutoSize = False
          Color = clWindow
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 0
          Text = '0'
          Visible = True
          Version = '3.3.2.0'
        end
        object edtCnt: TAdvEdit
          Left = 119
          Top = 10
          Width = 57
          Height = 21
          EditAlign = eaRight
          EditType = etMoney
          EmptyText = '0'
          EmptyTextStyle = []
          FocusColor = 16445929
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'MS Sans Serif'
          LabelFont.Style = []
          Lookup.Font.Charset = DEFAULT_CHARSET
          Lookup.Font.Color = clWindowText
          Lookup.Font.Height = -11
          Lookup.Font.Name = 'Arial'
          Lookup.Font.Style = []
          Lookup.Separator = ';'
          AutoSize = False
          Color = clWindow
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 1
          Text = '0'
          Visible = True
          Version = '3.3.2.0'
        end
        object edtReal: TAdvEdit
          Left = 439
          Top = 10
          Width = 110
          Height = 21
          EditAlign = eaRight
          EditType = etMoney
          EmptyText = '0'
          EmptyTextStyle = []
          FocusColor = 16445929
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'MS Sans Serif'
          LabelFont.Style = []
          Lookup.Font.Charset = DEFAULT_CHARSET
          Lookup.Font.Color = clWindowText
          Lookup.Font.Height = -11
          Lookup.Font.Name = 'Arial'
          Lookup.Font.Style = []
          Lookup.Separator = ';'
          AutoSize = False
          Color = clWindow
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 2
          Text = '0'
          Visible = True
          Version = '3.3.2.0'
        end
        object edtDCCnt: TAdvEdit
          Left = 119
          Top = 49
          Width = 57
          Height = 21
          EditAlign = eaRight
          EditType = etMoney
          EmptyText = '0'
          EmptyTextStyle = []
          FocusColor = 16445929
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'MS Sans Serif'
          LabelFont.Style = []
          Lookup.Font.Charset = DEFAULT_CHARSET
          Lookup.Font.Color = clWindowText
          Lookup.Font.Height = -11
          Lookup.Font.Name = 'Arial'
          Lookup.Font.Style = []
          Lookup.Separator = ';'
          AutoSize = False
          Color = clWindow
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 3
          Text = '0'
          Visible = True
          Version = '3.3.2.0'
        end
        object edtDC: TAdvEdit
          Left = 181
          Top = 49
          Width = 93
          Height = 21
          EditAlign = eaRight
          EditType = etMoney
          EmptyText = '0'
          EmptyTextStyle = []
          FocusColor = 16445929
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'MS Sans Serif'
          LabelFont.Style = []
          Lookup.Font.Charset = DEFAULT_CHARSET
          Lookup.Font.Color = clWindowText
          Lookup.Font.Height = -11
          Lookup.Font.Name = 'Arial'
          Lookup.Font.Style = []
          Lookup.Separator = ';'
          AutoSize = False
          Color = clWindow
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 4
          Text = '0'
          Visible = True
          Version = '3.3.2.0'
        end
        object edtLostCnt: TAdvEdit
          Left = 119
          Top = 88
          Width = 57
          Height = 21
          EditAlign = eaRight
          EditType = etMoney
          EmptyText = '0'
          EmptyTextStyle = []
          FocusColor = 16445929
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'MS Sans Serif'
          LabelFont.Style = []
          Lookup.Font.Charset = DEFAULT_CHARSET
          Lookup.Font.Color = clWindowText
          Lookup.Font.Height = -11
          Lookup.Font.Name = 'Arial'
          Lookup.Font.Style = []
          Lookup.Separator = ';'
          AutoSize = False
          Color = clWindow
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 5
          Text = '0'
          Visible = True
          Version = '3.3.2.0'
        end
        object edtLostAmt: TAdvEdit
          Left = 181
          Top = 88
          Width = 93
          Height = 21
          EditAlign = eaRight
          EditType = etMoney
          EmptyText = '0'
          EmptyTextStyle = []
          FocusColor = 16445929
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'MS Sans Serif'
          LabelFont.Style = []
          Lookup.Font.Charset = DEFAULT_CHARSET
          Lookup.Font.Color = clWindowText
          Lookup.Font.Height = -11
          Lookup.Font.Name = 'Arial'
          Lookup.Font.Style = []
          Lookup.Separator = ';'
          AutoSize = False
          Color = clWindow
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 6
          Text = '0'
          Visible = True
          Version = '3.3.2.0'
        end
        object edtGT1Cnt: TAdvEdit
          Left = 439
          Top = 88
          Width = 110
          Height = 21
          EditAlign = eaRight
          EditType = etMoney
          EmptyText = '0'
          EmptyTextStyle = []
          FocusColor = 16445929
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'MS Sans Serif'
          LabelFont.Style = []
          Lookup.Font.Charset = DEFAULT_CHARSET
          Lookup.Font.Color = clWindowText
          Lookup.Font.Height = -11
          Lookup.Font.Name = 'Arial'
          Lookup.Font.Style = []
          Lookup.Separator = ';'
          AutoSize = False
          Color = clWindow
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 7
          Text = '0'
          Visible = True
          Version = '3.3.2.0'
        end
        object edtTotDCCnt: TAdvEdit
          Left = 439
          Top = 49
          Width = 110
          Height = 21
          EditAlign = eaRight
          EditType = etMoney
          EmptyText = '0'
          EmptyTextStyle = []
          FocusColor = 16445929
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'MS Sans Serif'
          LabelFont.Style = []
          Lookup.Font.Charset = DEFAULT_CHARSET
          Lookup.Font.Color = clWindowText
          Lookup.Font.Height = -11
          Lookup.Font.Name = 'Arial'
          Lookup.Font.Style = []
          Lookup.Separator = ';'
          AutoSize = False
          Color = clWindow
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 8
          Text = '0'
          Visible = True
          Version = '3.3.2.0'
        end
        object edtDamageCnt: TAdvEdit
          Left = 119
          Top = 126
          Width = 57
          Height = 21
          EditAlign = eaRight
          EditType = etMoney
          EmptyText = '0'
          EmptyTextStyle = []
          FocusColor = 16445929
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'MS Sans Serif'
          LabelFont.Style = []
          Lookup.Font.Charset = DEFAULT_CHARSET
          Lookup.Font.Color = clWindowText
          Lookup.Font.Height = -11
          Lookup.Font.Name = 'Arial'
          Lookup.Font.Style = []
          Lookup.Separator = ';'
          AutoSize = False
          Color = clWindow
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 9
          Text = '0'
          Visible = False
          Version = '3.3.2.0'
        end
        object edtDamageAmt: TAdvEdit
          Left = 181
          Top = 126
          Width = 93
          Height = 21
          EditAlign = eaRight
          EditType = etMoney
          EmptyText = '0'
          EmptyTextStyle = []
          FocusColor = 16445929
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'MS Sans Serif'
          LabelFont.Style = []
          Lookup.Font.Charset = DEFAULT_CHARSET
          Lookup.Font.Color = clWindowText
          Lookup.Font.Height = -11
          Lookup.Font.Name = 'Arial'
          Lookup.Font.Style = []
          Lookup.Separator = ';'
          AutoSize = False
          Color = clWindow
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 10
          Text = '0'
          Visible = False
          Version = '3.3.2.0'
        end
      end
    end
    object TabSheet2: TAdvTabSheet
      Caption = #54000#53011#48156#47588
      Color = clBtnFace
      ColorTo = clNone
      TabColor = 16445929
      TabColorTo = 15587527
      object dgIssueTK: TDBAdvGrid
        Left = 12
        Top = 13
        Width = 617
        Height = 214
        Cursor = crDefault
        ColCount = 7
        DrawingStyle = gdsClassic
        RowCount = 2
        FixedRows = 1
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
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
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            HeaderFont.Charset = ANSI_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'Tahoma'
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
            FieldName = 'MName'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = #44540#47924#51088
            HeaderFont.Charset = ANSI_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'Tahoma'
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
            FieldName = 'TKType'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = #54000#53011#51333#47448
            HeaderFont.Charset = ANSI_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Style = []
            HeaderAlignment = taCenter
            PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
            PrintFont.Charset = ANSI_CHARSET
            PrintFont.Color = clWindowText
            PrintFont.Height = -12
            PrintFont.Name = #44404#47548#52404
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
            FieldName = 'IssueType'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = #48156#44553#51333#47448
            HeaderFont.Charset = ANSI_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Style = []
            HeaderAlignment = taCenter
            PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
            PrintFont.Charset = ANSI_CHARSET
            PrintFont.Color = clWindowText
            PrintFont.Height = -12
            PrintFont.Name = #44404#47548#52404
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
            FieldName = 'COLUMN1'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = #48156#47588#49688#47049
            HeaderFont.Charset = ANSI_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Style = []
            HeaderAlignment = taCenter
            PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
            PrintFont.Charset = DEFAULT_CHARSET
            PrintFont.Color = clWindowText
            PrintFont.Height = -11
            PrintFont.Name = 'MS Sans Serif'
            PrintFont.Style = []
            Width = 95
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
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = #48156#47588#52509#50529
            HeaderFont.Charset = ANSI_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Style = []
            HeaderAlignment = taCenter
            PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
            PrintFont.Charset = DEFAULT_CHARSET
            PrintFont.Color = clWindowText
            PrintFont.Height = -11
            PrintFont.Name = 'MS Sans Serif'
            PrintFont.Style = []
            Width = 95
          end
          item
            Alignment = taRightJustify
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            FieldName = 'COLUMN3'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = #50529#47732#44552#50529
            HeaderFont.Charset = ANSI_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Style = []
            HeaderAlignment = taCenter
            PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
            PrintFont.Charset = DEFAULT_CHARSET
            PrintFont.Color = clWindowText
            PrintFont.Height = -11
            PrintFont.Name = 'MS Sans Serif'
            PrintFont.Style = []
            Width = 95
          end>
        DataSource = dsCIssueTK
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
          100
          90
          90
          95
          95
          95)
      end
      object AdvPanel2: TAdvPanel
        Left = 12
        Top = 238
        Width = 616
        Height = 78
        BevelOuter = bvNone
        Color = 16445929
        Font.Charset = ANSI_CHARSET
        Font.Color = 7485192
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
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
        object Bevel4: TBevel
          Left = 212
          Top = 29
          Width = 97
          Height = 20
        end
        object Label4: TLabel
          Left = 236
          Top = 33
          Width = 48
          Height = 12
          Alignment = taCenter
          Caption = #48156#47588#52509#50529
          Font.Charset = ANSI_CHARSET
          Font.Color = 7485192
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Bevel9: TBevel
          Left = 12
          Top = 29
          Width = 97
          Height = 20
        end
        object Label9: TLabel
          Left = 36
          Top = 33
          Width = 48
          Height = 12
          Alignment = taCenter
          Caption = #48156#47588#49688#47049
          Font.Charset = ANSI_CHARSET
          Font.Color = 7485192
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Bevel10: TBevel
          Left = 412
          Top = 29
          Width = 97
          Height = 20
        end
        object Label10: TLabel
          Left = 436
          Top = 33
          Width = 48
          Height = 12
          Alignment = taCenter
          Caption = #50529#47732#44552#50529
          Font.Charset = ANSI_CHARSET
          Font.Color = 7485192
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object edtiCnt: TAdvEdit
          Left = 113
          Top = 29
          Width = 93
          Height = 21
          EditAlign = eaRight
          EditType = etMoney
          EmptyText = '0'
          EmptyTextStyle = []
          FocusColor = 16445929
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'MS Sans Serif'
          LabelFont.Style = []
          Lookup.Font.Charset = DEFAULT_CHARSET
          Lookup.Font.Color = clWindowText
          Lookup.Font.Height = -11
          Lookup.Font.Name = 'Arial'
          Lookup.Font.Style = []
          Lookup.Separator = ';'
          AutoSize = False
          Color = clWindow
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 0
          Text = '0'
          Visible = True
          Version = '3.3.2.0'
        end
        object edtiFAmt: TAdvEdit
          Left = 513
          Top = 29
          Width = 93
          Height = 21
          EditAlign = eaRight
          EditType = etMoney
          EmptyText = '0'
          EmptyTextStyle = []
          FocusColor = 16445929
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'MS Sans Serif'
          LabelFont.Style = []
          Lookup.Font.Charset = DEFAULT_CHARSET
          Lookup.Font.Color = clWindowText
          Lookup.Font.Height = -11
          Lookup.Font.Name = 'Arial'
          Lookup.Font.Style = []
          Lookup.Separator = ';'
          AutoSize = False
          Color = clWindow
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 1
          Text = '0'
          Visible = True
          Version = '3.3.2.0'
        end
        object edtiAmt: TAdvEdit
          Left = 313
          Top = 29
          Width = 93
          Height = 21
          EditAlign = eaRight
          EditType = etMoney
          EmptyText = '0'
          EmptyTextStyle = []
          FocusColor = 16445929
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'MS Sans Serif'
          LabelFont.Style = []
          Lookup.Font.Charset = DEFAULT_CHARSET
          Lookup.Font.Color = clWindowText
          Lookup.Font.Height = -11
          Lookup.Font.Name = 'Arial'
          Lookup.Font.Style = []
          Lookup.Separator = ';'
          AutoSize = False
          Color = clWindow
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 2
          Text = '0'
          Visible = True
          Version = '3.3.2.0'
        end
      end
    end
    object TabSheet3: TAdvTabSheet
      Caption = #52264#45800#44592#51228#50612
      Color = clBtnFace
      ColorTo = clNone
      TabColor = 16445929
      TabColorTo = 15587527
      object dgBar: TDBAdvGrid
        Left = 12
        Top = 13
        Width = 617
        Height = 214
        Cursor = crDefault
        ColCount = 7
        DrawingStyle = gdsClassic
        RowCount = 2
        FixedRows = 1
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
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
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            HeaderFont.Charset = ANSI_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'Tahoma'
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
            FieldName = 'UnitNo'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = #44592#44592#48264#54840
            HeaderFont.Charset = ANSI_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Style = []
            HeaderAlignment = taCenter
            PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
            PrintFont.Charset = DEFAULT_CHARSET
            PrintFont.Color = clWindowText
            PrintFont.Height = -11
            PrintFont.Name = 'MS Sans Serif'
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
            FieldName = 'MName'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = #44540#47924#51088
            HeaderFont.Charset = ANSI_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'Tahoma'
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
            Alignment = taRightJustify
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            FieldName = 'COLUMN1'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = #50676#47548
            HeaderFont.Charset = ANSI_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'Tahoma'
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
            Alignment = taRightJustify
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            FieldName = 'COLUMN2'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = #45803#55192
            HeaderFont.Charset = ANSI_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'Tahoma'
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
            Alignment = taRightJustify
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            FieldName = 'COLUMN3'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = #50676#47548#44256#51221
            HeaderFont.Charset = ANSI_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'Tahoma'
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
            Alignment = taRightJustify
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            FieldName = 'COLUMN4'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = #44256#51221#54644#51228
            HeaderFont.Charset = ANSI_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'Tahoma'
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
        DataSource = dsCBarProc
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
          70
          100
          100
          100
          100
          100)
      end
      object AdvPanel3: TAdvPanel
        Left = 12
        Top = 238
        Width = 616
        Height = 78
        BevelOuter = bvNone
        Color = 16445929
        Font.Charset = ANSI_CHARSET
        Font.Color = 7485192
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
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
        object Bevel6: TBevel
          Left = 164
          Top = 29
          Width = 65
          Height = 20
        end
        object Label6: TLabel
          Left = 184
          Top = 33
          Width = 24
          Height = 12
          Alignment = taCenter
          Caption = #45803#55192
          Font.Charset = ANSI_CHARSET
          Font.Color = 7485192
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Bevel7: TBevel
          Left = 12
          Top = 29
          Width = 65
          Height = 20
        end
        object Label7: TLabel
          Left = 32
          Top = 33
          Width = 24
          Height = 12
          Alignment = taCenter
          Caption = #50676#47548
          Font.Charset = ANSI_CHARSET
          Font.Color = 7485192
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Bevel11: TBevel
          Left = 316
          Top = 29
          Width = 65
          Height = 20
        end
        object Label11: TLabel
          Left = 324
          Top = 33
          Width = 48
          Height = 12
          Alignment = taCenter
          Caption = #50676#47548#44256#51221
          Font.Charset = ANSI_CHARSET
          Font.Color = 7485192
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Bevel12: TBevel
          Left = 468
          Top = 29
          Width = 65
          Height = 20
        end
        object Label12: TLabel
          Left = 476
          Top = 33
          Width = 48
          Height = 12
          Alignment = taCenter
          Caption = #44256#51221#54644#51228
          Font.Charset = ANSI_CHARSET
          Font.Color = 7485192
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object edtUp: TAdvEdit
          Left = 81
          Top = 29
          Width = 65
          Height = 21
          EditAlign = eaRight
          EditType = etMoney
          EmptyText = '0'
          EmptyTextStyle = []
          FocusColor = 16445929
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'MS Sans Serif'
          LabelFont.Style = []
          Lookup.Font.Charset = DEFAULT_CHARSET
          Lookup.Font.Color = clWindowText
          Lookup.Font.Height = -11
          Lookup.Font.Name = 'Arial'
          Lookup.Font.Style = []
          Lookup.Separator = ';'
          AutoSize = False
          Color = clWindow
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 0
          Text = '0'
          Visible = True
          Version = '3.3.2.0'
        end
        object edtLock: TAdvEdit
          Left = 385
          Top = 29
          Width = 65
          Height = 21
          EditAlign = eaRight
          EditType = etMoney
          EmptyText = '0'
          EmptyTextStyle = []
          FocusColor = 16445929
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'MS Sans Serif'
          LabelFont.Style = []
          Lookup.Font.Charset = DEFAULT_CHARSET
          Lookup.Font.Color = clWindowText
          Lookup.Font.Height = -11
          Lookup.Font.Name = 'Arial'
          Lookup.Font.Style = []
          Lookup.Separator = ';'
          AutoSize = False
          Color = clWindow
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 1
          Text = '0'
          Visible = True
          Version = '3.3.2.0'
        end
        object edtDown: TAdvEdit
          Left = 233
          Top = 29
          Width = 65
          Height = 21
          EditAlign = eaRight
          EditType = etMoney
          EmptyText = '0'
          EmptyTextStyle = []
          FocusColor = 16445929
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'MS Sans Serif'
          LabelFont.Style = []
          Lookup.Font.Charset = DEFAULT_CHARSET
          Lookup.Font.Color = clWindowText
          Lookup.Font.Height = -11
          Lookup.Font.Name = 'Arial'
          Lookup.Font.Style = []
          Lookup.Separator = ';'
          AutoSize = False
          Color = clWindow
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 2
          Text = '0'
          Visible = True
          Version = '3.3.2.0'
        end
        object edtUnLock: TAdvEdit
          Left = 537
          Top = 29
          Width = 65
          Height = 21
          EditAlign = eaRight
          EditType = etMoney
          EmptyText = '0'
          EmptyTextStyle = []
          FocusColor = 16445929
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'MS Sans Serif'
          LabelFont.Style = []
          Lookup.Font.Charset = DEFAULT_CHARSET
          Lookup.Font.Color = clWindowText
          Lookup.Font.Height = -11
          Lookup.Font.Name = 'Arial'
          Lookup.Font.Style = []
          Lookup.Separator = ';'
          AutoSize = False
          Color = clWindow
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 3
          Text = '0'
          Visible = True
          Version = '3.3.2.0'
        end
      end
    end
  end
  object AdvPanel4: TAdvPanel
    Left = 8
    Top = 382
    Width = 649
    Height = 72
    BevelOuter = bvNone
    Color = 16445929
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 7485192
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
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
    object btnClosing: TAdvToolButton
      Left = 328
      Top = 19
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
      Caption = #47560'  '#44048
      Glyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000320B0000320B000000010000000100005A5A5A005263
        6B00846B6B009C6B6B00636B7300A5737300A57B73007B7B7B00AD847B00AD8C
        8400B58C8400EFBD8400BD8C8C00C6948C00BD9C8C00C69C8C00F7BD8C00F7C6
        8C00738494007B84940084849400C6949400C69C9400CE9C9400D69C9400BDA5
        9400CEA59400CEAD9400F7C69400F7CE94009C9C9C00BD9C9C00CE9C9C00D69C
        9C00CEA59C00F7CE9C00F7D69C003973A500C6A5A500ADADA500D6ADA500D6B5
        A500D6BDA500F7D6A500C6ADAD00D6B5AD00D6C6AD00DEC6AD00E7C6AD00E7CE
        AD00F7D6AD00F7DEAD00FFDEAD001873B5002173B5006394B500E7CEB500EFD6
        B500EFDEB500F7DEB500FFE7B5001873BD00E7D6BD00F7DEBD00F7E7BD00FFE7
        BD00FFEFBD00FFF7BD00EFDEC600EFE7C600FFEFC600FFF7C600FFF7CE003184
        D600FFFFD600C6CEDE00F7EFDE00FFEFDE00FFFFDE00EFEFE700FFF7E700FFFF
        E700218CEF00F7F7EF00FFFFEF00FFFFF700FF00FF0031A5FF0039A5FF0042A5
        FF004AB5FF0052BDFF005ABDFF007BC6FF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00560004165656
        5656565656565656565656565656565656562725361217565656565656565656
        5656565656565656565637585236131756565656565656565656565656565656
        56565A5C59523613175656565656565656565656565656565656575B5C595236
        13175656565656565656565656565656565656575B5C59523614175656565656
        565656565656565656565656575B5C5952361417565656565656565656565656
        5656565656575B5C59523614565656565656565656565656565656565656575B
        5C5849015656030A222928201556565656565656565656575B5D4B1E02093E48
        4A4E4A4A44225656565656565656565656564F2C1A484A4E4A4A4A4E4E4E2905
        565656565656565656562C1A4241484A4A4A4E4E515E5E265656565656565656
        56560C3A3C32484A4A4E5154555E5E4C065656565656565656562942232B484A
        4A4E54555E55544E1956565656565656561531421123464A4A4E545555544E4E
        2E155656565656565615393C0B113B4A4A4E515454514E4E3E0E565656565656
        56153942100B23464A4E4E4E4E4E4A4E3E0E56565656565656153142230B1C2B
        464A4E4A4A4A4A4E2E1556565656565656562842413323232B40484A4A4A4A4A
        0E5656565656565656560C3A4E544C231D1C324040464A440556565656565656
        5656560F505E5E3F1C0B101C3242460E5656565656565656565656561F4F5448
        3C33333C4240165656565656565656565656565656062A404242424030155656
        565656565656565656565656565656080F222216565656565656}
      GlyphDisabled.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000000000000000000000010000000000005A5A5A005263
        6B00846B6B009C6B6B00636B7300A5737300A57B73007B7B7B00AD847B00AD8C
        8400B58C8400EFBD8400BD8C8C00C6948C00BD9C8C00C69C8C00F7BD8C00F7C6
        8C00738494007B84940084849400C6949400C69C9400CE9C9400D69C9400BDA5
        9400CEA59400CEAD9400F7C69400F7CE94009C9C9C00BD9C9C00CE9C9C00D69C
        9C00CEA59C00F7CE9C00F7D69C003973A500C6A5A500ADADA500D6ADA500D6B5
        A500D6BDA500F7D6A500C6ADAD00D6B5AD00D6C6AD00DEC6AD00E7C6AD00E7CE
        AD00F7D6AD00F7DEAD00FFDEAD001873B5002173B5006394B500E7CEB500EFD6
        B500EFDEB500F7DEB500FFE7B5001873BD00E7D6BD00F7DEBD00F7E7BD00FFE7
        BD00FFEFBD00FFF7BD00EFDEC600EFE7C600FFEFC600FFF7C600FFF7CE003184
        D600FFFFD600C6CEDE00F7EFDE00FFEFDE00FFFFDE00EFEFE700FFF7E700FFFF
        E700218CEF00F7F7EF00FFFFEF00FFFFF700FF00FF0031A5FF0039A5FF0042A5
        FF004AB5FF0052BDFF005ABDFF007BC6FF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0027141E272727
        272727272727272727272727272727272727271E1E1E27272727272727272727
        272727272727272727272727271E1E2727272727272727272727272727272727
        2727272C27271E1E272727272727272727272727272727272727272C2C27271E
        1E272727272727272727272727272727272727272C2C27271E27272727272727
        272727272727272727272727272C2C27271E2727272727272727272727272727
        2727272727272C2C27271E27272727272727272727272727272727272727272C
        2C271E1427271E272C2C2C2C2727272727272727272727272C2C4B271E274B4B
        4B4B4B4B4B2C2727272727272727272727274B2C2C4B4B4B4B4B4B4B4B4B2C1E
        272727272727272727272C2C4B4B4B4B4B4B4B4B4B4F4F2C2727272727272727
        2727274B4B4B4B4B4B4B4B4B4F4F4F4B1E2727272727272727272C4B4B4B4B4B
        4B4B4B4F4F4F4B4B272727272727272727274B4B2C4B4B4B4B4B4B4F4F4B4B4B
        2C2727272727272727274B4B2C2C4B4B4B4B4B4B4B4B4B4B4B27272727272727
        27274B4B2C2C4B4B4B4B4B4B4B4B4B4B4B2727272727272727274B4B4B2C2E4B
        4B4B4B4B4B4B4B4B2C2727272727272727272C4B4B4B4B4B4B4B4B4B4B4B4B4B
        27272727272727272727274B4B4B4B4B4B2E4B4B4B4B4B4B1E27272727272727
        272727274B4F4F4B2E2C2C2E4B4B4B27272727272727272727272727274B4B4B
        4B4B4B4B4B4B2727272727272727272727272727271E2C4B4B4B4B4B4B272727
        27272727272727272727272727272727272C2C27272727272727}
      ImageIndex = 0
      Rounded = True
      OnClick = btnClosingClick
      Version = '1.6.1.0'
    end
    object btnPrint: TAdvToolButton
      Left = 428
      Top = 19
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
      Caption = #51064'  '#49604
      Enabled = False
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF999697BDBBBC
        9D9A9A898687FF00FFFF00FF979596C6C6C6D0CFCFAFACAC989596FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF999697B7
        B5B6F0EFEFF4F3F3AAA7A79D9A9A4241424644456E6C6D999797BCBBBBDAD9D9
        E0E0E0C9C7C7A3A0A1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9896
        97A9A5A6E3E2E2FFFEFEFCFBFBEFEEEEA7A5A59E9C9C3332341212131C1C1D2A
        2A2C4745476D6A6C9A9898C5C4C4E2E1E1D4D3D3959192FF00FFFF00FFFF00FF
        FF00FF9A9899D8D5D5FCFBFBFBFAFAF8F7F7FBFAFAE7E5E6A3A0A0A3A0A0807F
        805453543332341E1E1F1616171A1A1C29292B454445736F70918F8FFF00FFFF
        00FFFF00FF8E8A8BC4C1C1F6F4F4FAF8F8F4F3F3F4F3F3E3E2E2B8B7B7989697
        8986878C8A8A9A9798A5A1A39F9D9D878686605F603D3C3D2222231415162B2A
        2C8A8788FF00FFFF00FFFF00FF8E8A8BEBEBEBF0F0F0EDEBEBD9D8D8B0ADAD96
        9293A6A4A4C7C6C6A4A1A1928F8F8B88898884868B8989969293A19F9EA19F9F
        918F906A696A5151528B8989FF00FFFF00FFFF00FF8E8A8BDEDDDDD0CFCFA7A5
        A5939091A7A5A5CAC9CAD5D7D5DCDADAE1E0E0CCCACABAB7B7A7A5A59A97988F
        8B8C8A8788898687918E8E9D9999A3A0A0918F8FFF00FFFF00FFFF00FF8E8A8B
        9E9C9D939191A9A7A7C7C7C7D1D3D3CECECEC9C9C9E6E5E5F6F4F4F3F3F3EDEB
        EBE0DEDECFCECEBFBDBDAFACACA19F9F9592928C8A8A8A8788868283FF00FFFF
        00FFFF00FF8E8A8BAAA7A9C9C7C7CFCFCFCBCBCBCACACAC6C6C6DADADAF4F3F3
        B5B2B4B6AAB4C4C1C2D8D7D7E1E1E1E2E2E2D9D9D9CECECEC1C0C0B4B2B2AAA7
        A7928F90FF00FFFF00FFFF00FF8E8A8BCACACACCCCCCCACACACACACAC7C7C7D7
        D7D7F4F3F3AFAAAC999E9866B06A9EA39D9995979C9A9AAAA9A9BBBABACCCBCB
        D1D1D1D1D1D1CFCFCF9A9999FF00FFFF00FFFF00FFFF00FFADABACD0D0D0CCCE
        CECECECEDEDEDEE3E2E2A4A1A1ABA9AAEEEEEDC7EDC9E5E9E5E0DDDEF8AF9AB0
        ADAF9F9D9D9591929A9798ABA9A9ABA9AAA39FA0FF00FFFF00FFFF00FFFF00FF
        FF00FFA19FA0BBBABACAC9C9B6B4B4999797BDBBBBF4F3F3F4F3F3F4EEF3EAE7
        E7E5E3E3E2E2E2E1E1E1D9D9D9CECECEBFBFBF9592938F8B8CFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF8A8788A9A7A7D1D1D1BFBFBF989999
        BABABAD3D1D1DEDDDDE1E0E0DEDEDEDCDCDCDDDDDDD7D7D7B5B5B5A7A4A5FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9D9A9CF3F4F4F4
        F3F2D9D5D4AAA7A7A7A9A9B4B7B8C7CBCCC9CCCCCCCECECCCCCCB6B5B6989697
        A7A4A5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFE9CECCFFE3D9FFDDCFFED5C7F8D3C6F3D1C6EDD1CAE6D4CFDED8D5D0
        D0D0B8B7B8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFDDB4B0FFE0D3FFD8C9FFCFC0FFC7B5FFC0AAFFBA
        A4FFB79FFCB099E5C5C1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDEB5B0FFE5D8FFD8C9FFCFC0
        FFC9B7FEC1ADFEBBA5FFB49CF7A691FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE6BFB8FF
        E5D8FFD8C9FFCFC0FFC9B7FEC1ADFEBBA5FFB59DEBA08FFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFE1BDB8FFE2D5FFD8C9FFCFC0FFC9B7FEC1ADFEBBA5FFB59DF8AF9AFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFE1BDB8FFE0D3FFD8C9FFCFC0FFC9B7FEC1ADFFBB
        A5F8AF9AF8AF9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFE0BAB5FFEDE2FFE0D3FFD8C9FFCFC0
        FEC9B7FEC2ADFFBDA6F8AF9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE1BDB8FFF0E5FF
        E5D8FFDECEFFD5C5FFCEBBFFC7B2EDAB9CF8AF9AFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCE9F
        9DE1BDB8E0B7B2E0B5ADE0B1A9E0ACA5E0AAA0DDA39AF8AF9AFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      GlyphDisabled.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000B5B5B5B5B5B5
        B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5
        B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5
        B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5ABABABBEBEBE
        ADADADA3A3A3B5B5B5B5B5B5ABABABC3C3C3C7C7C7B6B6B6ABABABB5B5B5B5B5
        B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5ABABABBB
        BBBBD7D7D7D9D9D9B4B4B4ADADAD808080828282969696ABABABBDBDBDCCCCCC
        D0D0D0C3C3C3B0B0B0B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5ABAB
        ABB3B3B3D1D1D1DFDFDFDDDDDDD7D7D7B2B2B2AEAEAE7979796969696E6E6E75
        7575838383959595ACACACC2C2C2D0D0D0C9C9C9A9A9A9B5B5B5B5B5B5B5B5B5
        B5B5B5ACACACCBCBCBDDDDDDDDDDDDDBDBDBDDDDDDD3D3D3B0B0B0B0B0B09F9F
        9F8989897979796F6F6F6B6B6B6D6D6D747474828282989898A7A7A7B5B5B5B5
        B5B5B5B5B5A5A5A5C1C1C1DADADADCDCDCD9D9D9D9D9D9D1D1D1BBBBBBABABAB
        A3A3A3A5A5A5ACACACB1B1B1AEAEAEA3A3A38F8F8F7E7E7E7171716A6A6A7575
        75A4A4A4B5B5B5B5B5B5B5B5B5A5A5A5D5D5D5D8D8D8D5D5D5CCCCCCB7B7B7A9
        A9A9B2B2B2C3C3C3B1B1B1A8A8A8A4A4A4A3A3A3A4A4A4A9A9A9AFAFAFAFAFAF
        A8A8A8949494888888A4A4A4B5B5B5B5B5B5B5B5B5A5A5A5CECECEC7C7C7B2B2
        B2A8A8A8B2B2B2C4C4C4CACACACDCDCDD0D0D0C5C5C5BCBCBCB2B2B2ACACACA6
        A6A6A4A4A4A3A3A3A7A7A7ADADADB0B0B0A7A7A7B5B5B5B5B5B5B5B5B5A5A5A5
        AEAEAEA8A8A8B3B3B3C3C3C3C9C9C9C7C7C7C4C4C4D2D2D2DADADAD9D9D9D5D5
        D5CFCFCFC7C7C7BEBEBEB6B6B6AFAFAFA9A9A9A5A5A5A4A4A4A1A1A1B5B5B5B5
        B5B5B5B5B5A5A5A5B4B4B4C3C3C3C7C7C7C5C5C5C5C5C5C3C3C3CDCDCDD9D9D9
        B9B9B9B8B8B8C1C1C1CBCBCBD0D0D0D1D1D1CCCCCCC7C7C7C0C0C0B9B9B9B4B4
        B4A8A8A8B5B5B5B5B5B5B5B5B5A5A5A5C5C5C5C6C6C6C5C5C5C5C5C5C3C3C3CB
        CBCBD9D9D9B6B6B6ADADADA0A0A0AFAFAFABABABADADADB4B4B4BDBDBDC5C5C5
        C8C8C8C8C8C8C7C7C7ACACACB5B5B5B5B5B5B5B5B5B5B5B5B6B6B6C8C8C8C6C6
        C6C7C7C7CFCFCFD1D1D1B1B1B1B5B5B5D6D6D6CACACAD3D3D3CFCFCFC0C0C0B7
        B7B7AEAEAEA9A9A9ACACACB4B4B4B5B5B5B0B0B0B5B5B5B5B5B5B5B5B5B5B5B5
        B5B5B5B0B0B0BDBDBDC4C4C4BABABAABABABBDBDBDD9D9D9D9D9D9D8D8D8D4D4
        D4D1D1D1D1D1D1D0D0D0CCCCCCC7C7C7BFBFBFA9A9A9A6A6A6B5B5B5B5B5B5B5
        B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5A4A4A4B3B3B3C8C8C8BFBFBFACACAC
        BDBDBDC8C8C8CECECED0D0D0CFCFCFCECECECECECECBCBCBBABABAB2B2B2B5B5
        B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5ADADADD9D9D9D9
        D9D9CBCBCBB4B4B4B4B4B4BBBBBBC5C5C5C5C5C5C6C6C6C6C6C6BABABAABABAB
        B2B2B2B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5
        B5B5B5B5CBCBCBD4D4D4D1D1D1CFCFCFCDCDCDCCCCCCCCCCCCCCCCCCCCCCCCC8
        C8C8BBBBBBB5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5
        B5B5B5B5B5B5B5B5B5B5B5B5C0C0C0D3D3D3D0D0D0CDCDCDC9C9C9C6C6C6C4C4
        C4C3C3C3C0C0C0C7C7C7B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5
        B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5C0C0C0D4D4D4D0D0D0CDCDCD
        CACACAC7C7C7C5C5C5C2C2C2BDBDBDB5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5
        B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5C4C4C4D4
        D4D4D0D0D0CDCDCDCACACAC7C7C7C5C5C5C2C2C2B9B9B9B5B5B5B5B5B5B5B5B5
        B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5
        B5B5B5B5C3C3C3D3D3D3D0D0D0CDCDCDCACACAC7C7C7C5C5C5C2C2C2C0C0C0B5
        B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5
        B5B5B5B5B5B5B5B5B5B5B5B5C3C3C3D3D3D3D0D0D0CDCDCDCACACAC7C7C7C5C5
        C5C0C0C0C0C0C0B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5
        B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5C2C2C2D7D7D7D3D3D3D0D0D0CDCDCD
        CACACAC7C7C7C5C5C5C0C0C0B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5
        B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5C3C3C3D8D8D8D4
        D4D4D1D1D1CECECECCCCCCC9C9C9BEBEBEC0C0C0B5B5B5B5B5B5B5B5B5B5B5B5
        B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B7B7
        B7C3C3C3C1C1C1C0C0C0BFBFBFBDBDBDBCBCBCB9B9B9C0C0C0B5B5B5B5B5B5B5
        B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5}
      ImageIndex = 0
      Rounded = True
      OnClick = btnPrintClick
      Version = '1.6.1.0'
    end
    object btnClose: TAdvToolButton
      Left = 528
      Top = 19
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
    object btnSearch: TAdvToolButton
      Left = 228
      Top = 19
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
      Caption = #51312'  '#54924
      Glyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000D30E0000D30E00000001000000010000BD633100C663
        3100CE633100CE6B3100BD633900C66B3900CE6B3900D66B3900D6733900CE6B
        4200C6734200CE734200D6734200DE734200BD734A00C6734A00CE734A00D673
        4A00D67B4A00DE7B4A00E77B4A00C6735200C67B5200D67B5200D6845200E784
        5200EF8C5200CE7B5A00EF8C5A00F78C5A0063636300BD846300CE846300D684
        6300EF8C6300FF9C63006B6B6B00736B6B00CE8C6B00DE946B00E7946B00FF9C
        6B00737373007B737300D6947300FFA573007B7B7B008C847B00BD947B00C694
        7B00DE9C7B00FFAD7B0094848400D69C8400E7A58400F7AD8400FFBD8400D6A5
        8C00DEA58C00E7A58C00E7AD8C00F7AD8C00FFBD8C00A5949400A59C9400AD9C
        9400C6A59400DEAD9400FFBD94009C9C9C00A59C9C00AD9C9C00A5A59C00ADA5
        9C00B5A59C00CEAD9C00DEAD9C00E7B59C00F7BD9C00F7C69C00FFCE9C00B5A5
        A500BDADA500D6B5A500DEBDA500FFD6A500ADADAD00DEBDAD00E7BDAD00EFC6
        AD00FFCEAD00C6BDB500CEBDB500E7C6B500EFC6B500FFD6B500FFE7B500D6C6
        BD00FFD6BD00FFE7BD00FFEFBD00C6C6C600CEC6C600DECEC600E7CEC600E7D6
        C600EFD6C600F7D6C600FFF7C600D6CECE00DECECE00D6D6CE00E7D6CE00EFD6
        CE00D6D6D600E7DED600EFDED600FFE7D600FFEFD600FFF7D600E7DEDE00EFDE
        DE00F7E7DE00FFEFDE00E7E7E700EFE7E700F7E7E700F7EFE700FFEFE700FFFF
        E700EFEFEF00F7EFEF00FFEFEF00F7F7EF00FFF7EF00F7F7F700FFF7F700FFFF
        F700FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008A8A8A8A8A8A
        8A56464749413F34252E8A8A8A8A8A8A8A8A8A8A8A8A8A5656707A7F8282827D
        74522B2A8A8A8A8A8A8A8A8A8A8A5670838282787C7C7C8282827D4A1E8A8A8A
        8A8A8A8A8A567D8282784B1F15162035677C82835C1E8A8A8A8A8A8A567F8282
        530F000031540A0004267082835B1E8A8A8A8A567A8782390401010E6D875D01
        01000F678283402A8A8A8A65878243000101010F6D8743020101000F73827A25
        8A8A8A7E877005010102020220320602020101002682874A458A6D87872C0101
        03020206202710020202010100688774248A74877D0A0506030202056D883202
        020202010135827F2F8A748B6805060602020205668B590602020306011B8285
        3F8A748B58060606020202023082883A06020306050F8387418A748B590B0C06
        02020202054285883602030606108588498A748B6A0C0C060302020202055387
        8518060606178788498A748B8019130C060B100602020A7D8B4D060C0C328B86
        468A7A898B371A1312617A3A0202097D8B580C0C0C6A8B7E488A7F748B75231C
        13618B7F27124387873A131328888B675B8A8A7A8B8B5A2D23327C8B887F8B8B
        73221C1C758B865B8A8A8A86748B895F3E334D7378787C74372929628B8B7045
        8A8A8A8A7F748B8B7660554F4F4E4E3E3844758B8B7A568A8A8A8A8A8A7A748B
        8B8981776460606375898B8B7F568A8A8A8A8A8A8A8A7F748B8B8B8B8B8B8B8B
        8B8B8874568A8A8A8A8A8A8A8A8A8A7F7483888B8B8B8B8B887F74568A8A8A8A
        8A8A8A8A8A8A8A8A7F7474747474747474747F8A8A8A8A8A8A8A}
      GlyphDisabled.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        0800000000004002000000000000000000000001000000000000BD633100C663
        3100CE633100CE6B3100BD633900C66B3900CE6B3900D66B3900D6733900CE6B
        4200C6734200CE734200D6734200DE734200BD734A00C6734A00CE734A00D673
        4A00D67B4A00DE7B4A00E77B4A00C6735200C67B5200D67B5200D6845200E784
        5200EF8C5200CE7B5A00EF8C5A00F78C5A0063636300BD846300CE846300D684
        6300EF8C6300FF9C63006B6B6B00736B6B00CE8C6B00DE946B00E7946B00FF9C
        6B00737373007B737300D6947300FFA573007B7B7B008C847B00BD947B00C694
        7B00DE9C7B00FFAD7B0094848400D69C8400E7A58400F7AD8400FFBD8400D6A5
        8C00DEA58C00E7A58C00E7AD8C00F7AD8C00FFBD8C00A5949400A59C9400AD9C
        9400C6A59400DEAD9400FFBD94009C9C9C00A59C9C00AD9C9C00A5A59C00ADA5
        9C00B5A59C00CEAD9C00DEAD9C00E7B59C00F7BD9C00F7C69C00FFCE9C00B5A5
        A500BDADA500D6B5A500DEBDA500FFD6A500ADADAD00DEBDAD00E7BDAD00EFC6
        AD00FFCEAD00C6BDB500CEBDB500E7C6B500EFC6B500FFD6B500FFE7B500D6C6
        BD00FFD6BD00FFE7BD00FFEFBD00C6C6C600CEC6C600DECEC600E7CEC600E7D6
        C600EFD6C600F7D6C600FFF7C600D6CECE00DECECE00D6D6CE00E7D6CE00EFD6
        CE00D6D6D600E7DED600EFDED600FFE7D600FFEFD600FFF7D600E7DEDE00EFDE
        DE00F7E7DE00FFEFDE00E7E7E700EFE7E700F7E7E700F7EFE700FFEFE700FFFF
        E700EFEFEF00F7EFEF00FFEFEF00F7F7EF00FFF7EF00F7F7F700FFF7F700FFFF
        F700FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00565656565656
        5656565656565648454556565656565656565656565656565666727272727272
        6D5B45455656565656565656565656667272726D727272727272725634565656
        5656565656567272726D5B484848565665727272653456565656565656727272
        5B4545455665454545566672725B345656565656727272564545454565726545
        45454565727256455656566572725B454545454565725B45454545456D727245
        5656567272664545454545455656454545454545567272565656657272564545
        4545454556564845454545454565726D45566D72724545454545454565725645
        454545454556727248566D786545454545454545657865454545454545487272
        56566D7865454545454545455672725B454545454545727256566D7865454845
        45454545455672725B4545454548727256566D78664848454545454545455B72
        725645454548727256566D78725648484545484545454572785B454848567872
        56567278785B56484865725B4545457278654848486678725656726D78725656
        4865787256485B72725B4848567278655B5656727878655B5656727872727878
        6D5656567278725B565656726D787866655B5B6D6D6D726D5B56566D78786656
        56565656726D7878726D65656565656565657278787256565656565656726D78
        787872726D6D6D6D7278787872565656565656565656726D7878787878787878
        7878726D5656565656565656565656726D7272787878787872726D5656565656
        5656565656565656726D6D6D6D6D6D6D6D6D7256565656565656}
      ImageIndex = 0
      Rounded = True
      OnClick = btnSearchClick
      Version = '1.6.1.0'
    end
    object edtPDate: TDateTimePicker
      Left = 123
      Top = 26
      Width = 97
      Height = 21
      Date = 39710.400472002300000000
      Time = 39710.400472002300000000
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 0
    end
  end
  object qryManager: TADOQuery
    Connection = dmTables.ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Manager')
    Left = 32
    Top = 72
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
  object qryCTKProc: TADOQuery
    Connection = dmTables.ADODB
    Parameters = <>
    SQL.Strings = (
      'Select ParkNo, UnitNo, MNo, TKType, '
      '          Count(*), Sum(TotFee), Sum(TotDC), Sum(RealFee)'
      'from TKProc Group By ParkNo, UnitNo, MNo, TKType')
    Left = 104
    Top = 72
    object qryCTKProcParkNo: TSmallintField
      FieldName = 'ParkNo'
    end
    object qryCTKProcUnitNo: TWordField
      FieldName = 'UnitNo'
    end
    object qryCTKProcMNo: TWordField
      FieldName = 'MNo'
    end
    object qryCTKProcTKType: TWordField
      FieldName = 'TKType'
      OnGetText = qryCTKProcTKTypeGetText
    end
    object qryCTKProcCOLUMN1: TIntegerField
      FieldName = 'COLUMN1'
      ReadOnly = True
    end
    object qryCTKProcCOLUMN2: TIntegerField
      FieldName = 'COLUMN2'
      ReadOnly = True
    end
    object qryCTKProcCOLUMN3: TIntegerField
      FieldName = 'COLUMN3'
      ReadOnly = True
    end
    object qryCTKProcCOLUMN4: TIntegerField
      FieldName = 'COLUMN4'
      ReadOnly = True
    end
    object qryCTKProcMName: TStringField
      FieldKind = fkLookup
      FieldName = 'MName'
      LookupDataSet = qryManager
      LookupKeyFields = 'MNo'
      LookupResultField = 'MName'
      KeyFields = 'MNo'
      OnGetText = qryCTKProcMNameGetText
      Size = 50
      Lookup = True
    end
  end
  object dsCTKProc: TDataSource
    DataSet = qryCTKProc
    Left = 104
    Top = 120
  end
  object dsCIssueTK: TDataSource
    DataSet = qryCIssueTK
    Left = 176
    Top = 120
  end
  object qryCIssueTK: TADOQuery
    Connection = dmTables.ADODB
    Parameters = <>
    SQL.Strings = (
      'Select MNo, TKType, IssueType,  Count(*), '
      '          Sum(IssueUnit), Sum(FValue)'
      'from IssueTK Group By MNo, TKType, IssueType')
    Left = 176
    Top = 72
    object qryCIssueTKMNo: TWordField
      FieldName = 'MNo'
    end
    object qryCIssueTKCOLUMN1: TIntegerField
      FieldName = 'COLUMN1'
      ReadOnly = True
    end
    object qryCIssueTKCOLUMN2: TIntegerField
      FieldName = 'COLUMN2'
      ReadOnly = True
    end
    object qryCIssueTKCOLUMN3: TIntegerField
      FieldName = 'COLUMN3'
      ReadOnly = True
    end
    object qryCIssueTKMName: TStringField
      FieldKind = fkLookup
      FieldName = 'MName'
      LookupDataSet = qryManager
      LookupKeyFields = 'MNo'
      LookupResultField = 'MName'
      KeyFields = 'MNo'
      OnGetText = qryCIssueTKMNameGetText
      Size = 50
      Lookup = True
    end
    object qryCIssueTKTKType: TWordField
      FieldName = 'TKType'
      OnGetText = qryCIssueTKTKTypeGetText
    end
    object qryCIssueTKIssueType: TWordField
      FieldName = 'IssueType'
      OnGetText = qryCIssueTKIssueTypeGetText
    end
  end
  object qryCBarProc: TADOQuery
    Connection = dmTables.ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select ParkNo, UnitNo, MNo, Sum(Up), Sum(Down), Sum(Lock), Sum(U' +
        'nLock) '
      'from BarProc Group By ParkNo, UnitNo, MNo')
    Left = 248
    Top = 72
    object qryCBarProcParkNo: TSmallintField
      FieldName = 'ParkNo'
    end
    object qryCBarProcUnitNo: TWordField
      FieldName = 'UnitNo'
    end
    object qryCBarProcMNo: TWordField
      FieldName = 'MNo'
    end
    object qryCBarProcCOLUMN1: TIntegerField
      FieldName = 'COLUMN1'
      ReadOnly = True
    end
    object qryCBarProcCOLUMN2: TIntegerField
      FieldName = 'COLUMN2'
      ReadOnly = True
    end
    object qryCBarProcCOLUMN3: TIntegerField
      FieldName = 'COLUMN3'
      ReadOnly = True
    end
    object qryCBarProcCOLUMN4: TIntegerField
      FieldName = 'COLUMN4'
      ReadOnly = True
    end
    object qryCBarProcMName: TStringField
      FieldKind = fkLookup
      FieldName = 'MName'
      LookupDataSet = qryManager
      LookupKeyFields = 'MNo'
      LookupResultField = 'MName'
      KeyFields = 'MNo'
      OnGetText = qryCBarProcMNameGetText
      Size = 50
      Lookup = True
    end
  end
  object dsCBarProc: TDataSource
    DataSet = qryCBarProc
    Left = 248
    Top = 120
  end
end
