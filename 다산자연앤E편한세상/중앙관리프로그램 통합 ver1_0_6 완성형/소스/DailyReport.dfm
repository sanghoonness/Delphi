object frmDailyReport: TfrmDailyReport
  Left = 454
  Top = 260
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #51068#48324' '#45236#50669
  ClientHeight = 464
  ClientWidth = 667
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
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
        Top = 2
        Width = 616
        Height = 116
        Cursor = crDefault
        ColCount = 9
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
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = #52376#47532#44148#49688
            HeaderFont.Charset = ANSI_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -12
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Style = []
            HeaderAlignment = taCenter
            PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
            PrintFont.Charset = DEFAULT_CHARSET
            PrintFont.Color = clWindowText
            PrintFont.Height = -11
            PrintFont.Name = 'MS Sans Serif'
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
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = #51452#52264#44552#50529
            HeaderFont.Charset = ANSI_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -12
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Style = []
            HeaderAlignment = taCenter
            PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
            PrintFont.Charset = DEFAULT_CHARSET
            PrintFont.Color = clWindowText
            PrintFont.Height = -11
            PrintFont.Name = 'MS Sans Serif'
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
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = #54624#51064#44148#49688
            HeaderFont.Charset = ANSI_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -12
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Style = []
            HeaderAlignment = taCenter
            PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
            PrintFont.Charset = DEFAULT_CHARSET
            PrintFont.Color = clWindowText
            PrintFont.Height = -11
            PrintFont.Name = 'MS Sans Serif'
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
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = #54624#51064#44552#50529
            HeaderFont.Charset = ANSI_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -12
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Style = []
            HeaderAlignment = taCenter
            PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
            PrintFont.Charset = DEFAULT_CHARSET
            PrintFont.Color = clWindowText
            PrintFont.Height = -11
            PrintFont.Name = 'MS Sans Serif'
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
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = #48155#51008#44552#50529
            HeaderFont.Charset = ANSI_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -12
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Style = []
            HeaderAlignment = taCenter
            PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
            PrintFont.Charset = DEFAULT_CHARSET
            PrintFont.Color = clWindowText
            PrintFont.Height = -11
            PrintFont.Name = 'MS Sans Serif'
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
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = #49688#46041#52636#52264
            HeaderFont.Charset = ANSI_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -12
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Style = []
            HeaderAlignment = taCenter
            PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
            PrintFont.Charset = DEFAULT_CHARSET
            PrintFont.Color = clWindowText
            PrintFont.Height = -11
            PrintFont.Name = 'MS Sans Serif'
            PrintFont.Style = []
            Width = 56
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
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = #49688#46041#52636#52264#44552#50529
            HeaderFont.Charset = ANSI_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -12
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Style = []
            HeaderAlignment = taCenter
            PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
            PrintFont.Charset = DEFAULT_CHARSET
            PrintFont.Color = clWindowText
            PrintFont.Height = -11
            PrintFont.Name = 'MS Sans Serif'
            PrintFont.Style = []
            Width = 80
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
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = #54924#52264#44148#49688
            HeaderFont.Charset = ANSI_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -12
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Style = []
            HeaderAlignment = taCenter
            PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
            PrintFont.Charset = DEFAULT_CHARSET
            PrintFont.Color = clWindowText
            PrintFont.Height = -11
            PrintFont.Name = 'MS Sans Serif'
            PrintFont.Style = []
            Width = 64
          end>
        DataSource = dsTKProcClosing
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
          64
          64
          64
          64
          64
          56
          80
          64)
      end
      object AdvPanel1: TAdvPanel
        Left = 12
        Top = 214
        Width = 616
        Height = 109
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
        object Bevel3: TBevel
          Left = 16
          Top = 33
          Width = 97
          Height = 20
        end
        object Label3: TLabel
          Left = 40
          Top = 37
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
          Top = 56
          Width = 97
          Height = 20
        end
        object Label5: TLabel
          Left = 40
          Top = 60
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
          Left = 16
          Top = 79
          Width = 97
          Height = 20
        end
        object Label8: TLabel
          Left = 40
          Top = 83
          Width = 48
          Height = 12
          Alignment = taCenter
          Caption = #54924#52264#44148#49688
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
        object Bevel1: TBevel
          Left = 336
          Top = 33
          Width = 97
          Height = 20
        end
        object Label1: TLabel
          Left = 360
          Top = 37
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
          Left = 336
          Top = 56
          Width = 97
          Height = 20
          Visible = False
        end
        object Label2: TLabel
          Left = 360
          Top = 60
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
          Left = 501
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
          TabOrder = 2
          Text = '0'
          Visible = True
          Version = '3.3.2.0'
        end
        object edtDCCnt: TAdvEdit
          Left = 119
          Top = 33
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
          Top = 33
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
          Top = 56
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
          Top = 56
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
          Left = 119
          Top = 79
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
          TabOrder = 7
          Text = '0'
          Visible = True
          Version = '3.3.2.0'
        end
        object edtTotDCCnt: TAdvEdit
          Left = 439
          Top = 33
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
          TabOrder = 8
          Text = '0'
          Visible = True
          Version = '3.3.2.0'
        end
        object edtDamageCnt: TAdvEdit
          Left = 439
          Top = 56
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
          Left = 501
          Top = 56
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
      object DBAdvGrid1: TDBAdvGrid
        Left = 12
        Top = 119
        Width = 616
        Height = 93
        Cursor = crDefault
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
        TabOrder = 2
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
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            FieldName = 'FeeName'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = #50836#44552#51333#47448
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Style = []
            HeaderAlignment = taCenter
            PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
            PrintFont.Charset = DEFAULT_CHARSET
            PrintFont.Color = clWindowText
            PrintFont.Height = -11
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
            FieldName = 'COLUMN1'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = #52376#47532#44148#49688
            HeaderFont.Charset = ANSI_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -12
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Style = []
            HeaderAlignment = taCenter
            PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
            PrintFont.Charset = ANSI_CHARSET
            PrintFont.Color = clWindowText
            PrintFont.Height = -12
            PrintFont.Name = 'Tahoma'
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
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = #52376#47532#44552#50529
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Style = []
            HeaderAlignment = taCenter
            PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
            PrintFont.Charset = DEFAULT_CHARSET
            PrintFont.Color = clWindowText
            PrintFont.Height = -11
            PrintFont.Name = 'Tahoma'
            PrintFont.Style = []
            Width = 111
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
          150
          100
          111)
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
        ColCount = 5
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
            FieldName = 'MName'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #44404#47548#52404
            Font.Style = []
            Header = #44540#47924#51088
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'MS Sans Serif'
            HeaderFont.Style = []
            HeaderAlignment = taCenter
            PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
            PrintFont.Charset = DEFAULT_CHARSET
            PrintFont.Color = clWindowText
            PrintFont.Height = -11
            PrintFont.Name = 'MS Sans Serif'
            PrintFont.Style = []
            Width = 110
          end
          item
            Alignment = taRightJustify
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            FieldName = 'nIssue'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #44404#47548#52404
            Font.Style = []
            Header = #48156#47588#44148#49688
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'MS Sans Serif'
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
            Font.Height = -12
            Font.Name = #44404#47548#52404
            Font.Style = []
            Header = #48156#47588#44552#50529
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'MS Sans Serif'
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
            Font.Height = -12
            Font.Name = #44404#47548#52404
            Font.Style = []
            Header = #50529#47732#44552#50529
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'MS Sans Serif'
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
        DataSource = dsIssueClosing
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
          110
          100
          100
          100)
      end
      object AdvPanel2: TAdvPanel
        Left = 12
        Top = 238
        Width = 616
        Height = 78
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
          Caption = #48156#47588#44552#50529
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
          Caption = #48156#47588#44148#49688
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
        ColCount = 5
        DoubleBuffered = True
        DrawingStyle = gdsClassic
        RowCount = 2
        FixedRows = 1
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
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
            Alignment = taRightJustify
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            FieldName = 'UpCnt'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = #50676#47548
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'MS Sans Serif'
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
            Alignment = taRightJustify
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            FieldName = 'DownCnt'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = #45803#55192
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'MS Sans Serif'
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
            FieldName = 'LockCnt'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = #50676#47548#44256#51221
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'MS Sans Serif'
            HeaderFont.Style = []
            HeaderAlignment = taCenter
            PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
            PrintFont.Charset = DEFAULT_CHARSET
            PrintFont.Color = clWindowText
            PrintFont.Height = -11
            PrintFont.Name = 'MS Sans Serif'
            PrintFont.Style = []
            Width = 81
          end
          item
            Alignment = taRightJustify
            Borders = []
            BorderPen.Color = clSilver
            CheckFalse = 'N'
            CheckTrue = 'Y'
            Color = clWindow
            FieldName = 'UnLockCnt'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            Header = #44256#51221#54644#51228
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -11
            HeaderFont.Name = 'MS Sans Serif'
            HeaderFont.Style = []
            HeaderAlignment = taCenter
            PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
            PrintFont.Charset = DEFAULT_CHARSET
            PrintFont.Color = clWindowText
            PrintFont.Height = -11
            PrintFont.Name = 'MS Sans Serif'
            PrintFont.Style = []
            Width = 81
          end>
        DataSource = dsBarClosing
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
          93
          90
          81
          81)
      end
      object AdvPanel3: TAdvPanel
        Left = 12
        Top = 238
        Width = 616
        Height = 78
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
      Left = 16
      Top = 26
      Width = 97
      Height = 20
    end
    object Label14: TLabel
      Left = 40
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
    object edtPDate: TDateTimePicker
      Left = 119
      Top = 26
      Width = 97
      Height = 21
      Date = 39710.400472002300000000
      Time = 39710.400472002300000000
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 0
    end
    object btnSearch: TBitBtn
      Left = 260
      Top = 19
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
      TabOrder = 1
      OnClick = btnSearchClick
    end
    object btnPrint: TBitBtn
      Left = 399
      Top = 19
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
      TabOrder = 2
      OnClick = btnPrintClick
    end
    object btnClose: TBitBtn
      Left = 538
      Top = 19
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
      TabOrder = 3
      OnClick = btnCloseClick
    end
  end
  object qryTKProcClosing: TADOQuery
    Connection = dmTables.ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from TKProcClosing')
    Left = 40
    Top = 40
    object qryTKProcClosingParkNo: TSmallintField
      FieldName = 'ParkNo'
    end
    object qryTKProcClosingUnitNo: TSmallintField
      FieldName = 'UnitNo'
    end
    object qryTKProcClosingUnitName: TStringField
      FieldKind = fkLookup
      FieldName = 'UnitName'
      LookupDataSet = qryUnitInfo
      LookupKeyFields = 'UnitNo'
      LookupResultField = 'UnitName'
      KeyFields = 'UnitNo'
      Size = 50
      Lookup = True
    end
    object qryTKProcClosingCDate: TStringField
      FieldName = 'CDate'
      FixedChar = True
      Size = 10
    end
    object qryTKProcClosingProcDate: TStringField
      FieldName = 'ProcDate'
      FixedChar = True
      Size = 10
    end
    object qryTKProcClosingProcTime: TStringField
      FieldName = 'ProcTime'
      FixedChar = True
      Size = 8
    end
    object qryTKProcClosingClosingSeq: TWordField
      FieldName = 'ClosingSeq'
    end
    object qryTKProcClosingMNo: TWordField
      FieldName = 'MNo'
    end
    object qryTKProcClosingMName: TStringField
      FieldKind = fkLookup
      FieldName = 'MName'
      LookupDataSet = qryManager
      LookupKeyFields = 'MNo'
      LookupResultField = 'MName'
      KeyFields = 'MNo'
      Size = 50
      Lookup = True
    end
    object qryTKProcClosingProcCnt: TSmallintField
      FieldName = 'ProcCnt'
    end
    object qryTKProcClosingProcFee: TIntegerField
      FieldName = 'ProcFee'
    end
    object qryTKProcClosingProcDC: TIntegerField
      FieldName = 'ProcDC'
    end
    object qryTKProcClosingProcRealFee: TIntegerField
      FieldName = 'ProcRealFee'
    end
    object qryTKProcClosingLostCnt: TSmallintField
      FieldName = 'LostCnt'
    end
    object qryTKProcClosingLostAmt: TIntegerField
      FieldName = 'LostAmt'
    end
    object qryTKProcClosingDamageCnt: TSmallintField
      FieldName = 'DamageCnt'
    end
    object qryTKProcClosingDamageAmt: TIntegerField
      FieldName = 'DamageAmt'
    end
    object qryTKProcClosingDCCnt: TSmallintField
      FieldName = 'DCCnt'
    end
    object qryTKProcClosingGT1Cnt: TIntegerField
      FieldName = 'GT1Cnt'
    end
    object qryTKProcClosingTotDCCnt: TIntegerField
      FieldName = 'TotDCCnt'
    end
    object qryTKProcClosingUnPaidCnt: TSmallintField
      FieldName = 'UnPaidCnt'
    end
    object qryTKProcClosingUnpaid: TIntegerField
      FieldName = 'Unpaid'
    end
    object qryTKProcClosingReserve1: TStringField
      FieldName = 'Reserve1'
      Size = 50
    end
    object qryTKProcClosingReserve2: TStringField
      FieldName = 'Reserve2'
      Size = 50
    end
    object qryTKProcClosingReserve3: TStringField
      FieldName = 'Reserve3'
      Size = 50
    end
    object qryTKProcClosingReserve4: TStringField
      FieldName = 'Reserve4'
      Size = 50
    end
    object qryTKProcClosingReserve5: TStringField
      FieldName = 'Reserve5'
      Size = 50
    end
  end
  object dsTKProcClosing: TDataSource
    DataSet = qryTKProcClosing
    Left = 40
    Top = 88
  end
  object qryTemp: TADOQuery
    Connection = dmTables.ADODB
    Parameters = <>
    Left = 128
    Top = 88
  end
  object qryIssueClosing: TADOQuery
    Connection = dmTables.ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select IssueDate, MNo, Count(*) nIssue, Sum(IssueUnit), Sum(FVal' +
        'ue) '
      'from IssueTK '
      'Group By MNo, IssueDate ')
    Left = 216
    Top = 40
    object qryIssueClosingIssueDate: TStringField
      FieldName = 'IssueDate'
      FixedChar = True
      Size = 10
    end
    object qryIssueClosingMNo: TSmallintField
      FieldName = 'MNo'
    end
    object qryIssueClosingMName: TStringField
      FieldKind = fkLookup
      FieldName = 'MName'
      LookupDataSet = qryManager
      LookupKeyFields = 'MNo'
      LookupResultField = 'MName'
      KeyFields = 'MNo'
      Size = 50
      Lookup = True
    end
    object qryIssueClosingnIssue: TIntegerField
      FieldName = 'nIssue'
      ReadOnly = True
    end
    object qryIssueClosingCOLUMN1: TIntegerField
      FieldName = 'COLUMN1'
      ReadOnly = True
    end
    object qryIssueClosingCOLUMN2: TIntegerField
      FieldName = 'COLUMN2'
      ReadOnly = True
    end
  end
  object dsIssueClosing: TDataSource
    DataSet = qryIssueClosing
    Left = 216
    Top = 88
  end
  object qryBarClosing: TADOQuery
    Connection = dmTables.ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from BarClosing')
    Left = 304
    Top = 40
    object qryBarClosingParkNo: TSmallintField
      FieldName = 'ParkNo'
    end
    object qryBarClosingUnitNo: TSmallintField
      FieldName = 'UnitNo'
    end
    object qryBarClosingUnitName: TStringField
      FieldKind = fkLookup
      FieldName = 'UnitName'
      LookupDataSet = qryUnitInfo
      LookupKeyFields = 'UnitNo'
      LookupResultField = 'UnitName'
      KeyFields = 'UnitNo'
      Size = 50
      Lookup = True
    end
    object qryBarClosingCDate: TStringField
      FieldName = 'CDate'
      FixedChar = True
      Size = 10
    end
    object qryBarClosingProcDate: TStringField
      FieldName = 'ProcDate'
      FixedChar = True
      Size = 10
    end
    object qryBarClosingProcTime: TStringField
      FieldName = 'ProcTime'
      FixedChar = True
      Size = 8
    end
    object qryBarClosingClosingSeq: TWordField
      FieldName = 'ClosingSeq'
    end
    object qryBarClosingMNo: TWordField
      FieldName = 'MNo'
    end
    object qryBarClosingMName: TStringField
      FieldKind = fkLookup
      FieldName = 'MName'
      LookupDataSet = qryManager
      LookupKeyFields = 'MNo'
      LookupResultField = 'MName'
      KeyFields = 'MNo'
      Size = 50
      Lookup = True
    end
    object qryBarClosingUpCnt: TSmallintField
      FieldName = 'UpCnt'
    end
    object qryBarClosingDownCnt: TSmallintField
      FieldName = 'DownCnt'
    end
    object qryBarClosingLockCnt: TSmallintField
      FieldName = 'LockCnt'
    end
    object qryBarClosingUnLockCnt: TSmallintField
      FieldName = 'UnLockCnt'
    end
    object qryBarClosingReserve1: TStringField
      FieldName = 'Reserve1'
      Size = 50
    end
    object qryBarClosingReserve2: TStringField
      FieldName = 'Reserve2'
      Size = 50
    end
    object qryBarClosingReserve3: TStringField
      FieldName = 'Reserve3'
      Size = 50
    end
    object qryBarClosingReserve4: TStringField
      FieldName = 'Reserve4'
      Size = 50
    end
    object qryBarClosingReserve5: TStringField
      FieldName = 'Reserve5'
      Size = 50
    end
  end
  object dsBarClosing: TDataSource
    DataSet = qryBarClosing
    Left = 304
    Top = 88
  end
  object qryManager: TADOQuery
    Connection = dmTables.ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Manager')
    Left = 128
    Top = 40
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
  object qryUnitInfo: TADOQuery
    Connection = dmTables.ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from UnitInfo')
    Left = 128
    Top = 136
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
  object frxReport1: TfrxReport
    Version = '5.4.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41121.595423356500000000
    ReportOptions.LastChange = 41128.769460173610000000
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
    Left = 160
    Top = 256
    Datasets = <
      item
        DataSet = fBarClosing
        DataSetName = 'BarClosing'
      end
      item
        DataSet = fFeeItemClosing
        DataSetName = 'FeeItemClosing'
      end
      item
        DataSet = fIssueClosing
        DataSetName = 'IssueClosing'
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
        DataSet = fTKProcClosing
        DataSetName = 'TKProcClosing'
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
          Top = 1.779530000000001000
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
            #51068' '#48324' '#45236' '#50669)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 30.236220470000000000
        Top = 196.535560000000000000
        Width = 1046.929810000000000000
        DataSet = fTKProcClosing
        DataSetName = 'TKProcClosing'
        RowCount = 0
        object Memo14: TfrxMemoView
          Align = baClient
          Width = 1046.929810000000000000
          Height = 30.236220470000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clSilver
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
          Wysiwyg = False
        end
        object Memo15: TfrxMemoView
          Width = 86.929133859999990000
          Height = 30.236220470000000000
          DataField = 'ProcTime'
          DataSet = fTKProcClosing
          DataSetName = 'TKProcClosing'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[TKProcClosing."ProcTime"]')
          ParentFont = False
          Wysiwyg = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 87.110233780000000000
          Width = 75.590551180000000000
          Height = 30.236220470000000000
          DataField = 'ProcTime'
          DataSet = fTKProcClosing
          DataSetName = 'TKProcClosing'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[TKProcClosing."ProcTime"]')
          ParentFont = False
          Wysiwyg = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 163.275590550000000000
          Width = 124.724409450000000000
          Height = 30.236220470000000000
          DataField = 'UnitName'
          DataSet = fTKProcClosing
          DataSetName = 'TKProcClosing'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[TKProcClosing."UnitName"]')
          ParentFont = False
          WordWrap = False
          Wysiwyg = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 288.377952760000000000
          Width = 78.614173228346460000
          Height = 30.236220470000000000
          DataField = 'MName'
          DataSet = fTKProcClosing
          DataSetName = 'TKProcClosing'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[TKProcClosing."MName"]')
          ParentFont = False
          Wysiwyg = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 366.614173230000000000
          Width = 75.590551180000000000
          Height = 30.236220470000000000
          DataSet = fTKProcClosing
          DataSetName = 'TKProcClosing'
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
            '[TKProcClosing."ProcCnt"]'#44148)
          ParentFont = False
          Wysiwyg = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 442.204724410000000000
          Width = 90.330708660000000000
          Height = 30.236220470000000000
          DataSet = fTKProcClosing
          DataSetName = 'TKProcClosing'
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
            '[TKProcClosing."ProcFee"]'#50896)
          ParentFont = False
          Wysiwyg = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 609.259842519685000000
          Width = 86.929133860000000000
          Height = 30.236220470000000000
          DataSet = fTKProcClosing
          DataSetName = 'TKProcClosing'
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
            '[TKProcClosing."ProcDC"]'#50896)
          ParentFont = False
          Wysiwyg = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 695.811023620000000000
          Width = 98.267716540000000000
          Height = 30.236220470000000000
          DataSet = fTKProcClosing
          DataSetName = 'TKProcClosing'
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
            '[TKProcClosing."ProcRealFee"]'#50896)
          ParentFont = False
          Wysiwyg = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 793.700787400000000000
          Width = 75.590551180000000000
          Height = 30.236220470000000000
          DataSet = fTKProcClosing
          DataSetName = 'TKProcClosing'
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
            '[TKProcClosing."LostCnt"]'#44148)
          ParentFont = False
          Wysiwyg = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 869.291338580000000000
          Width = 94.488193860000000000
          Height = 30.236220470000000000
          DataSet = fTKProcClosing
          DataSetName = 'TKProcClosing'
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
            '[TKProcClosing."LostAmt"]'#50896)
          ParentFont = False
          Wysiwyg = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 963.645669290000000000
          Width = 83.149611180000000000
          Height = 30.236220470000000000
          DataSet = fTKProcClosing
          DataSetName = 'TKProcClosing'
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
            '[TKProcClosing."GT1Cnt"]'#44148)
          ParentFont = False
          Wysiwyg = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 532.913385826772000000
          Width = 75.590551180000000000
          Height = 30.236220470000000000
          DataSet = fTKProcClosing
          DataSetName = 'TKProcClosing'
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
            '[TKProcClosing."DCCnt"]'#44148)
          ParentFont = False
          Wysiwyg = False
          VAlign = vaCenter
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Height = 22.677165350000000000
        Top = 419.527830000000000000
        Width = 1046.929810000000000000
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Height = 49.889763780000000000
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
          Top = 22.677179999999990000
          Width = 1046.929810000000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = cl3DLight
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Top = 22.677179999999990000
          Width = 86.929133859999990000
          Height = 26.456710000000000000
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
        object Memo4: TfrxMemoView
          Left = 87.015745590000000000
          Top = 22.677179999999990000
          Width = 75.590551180000000000
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
        object Memo5: TfrxMemoView
          Left = 163.362202280000000000
          Top = 22.677179999999990000
          Width = 124.724490000000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #52376#47532#44592#44592)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 288.330891730000000000
          Top = 22.677179999999990000
          Width = 78.614173230000000000
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
        object Memo7: TfrxMemoView
          Left = 366.701021730000000000
          Top = 22.677179999999990000
          Width = 75.590600000000000000
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
        object Memo8: TfrxMemoView
          Left = 442.291621730000000000
          Top = 22.677179999999990000
          Width = 90.330708660000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
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
          Left = 533.000341729999900000
          Top = 22.677179999999990000
          Width = 75.590600000000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
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
          Left = 609.370471730000000000
          Top = 22.677179999999990000
          Width = 86.929190000000000000
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
        object Memo11: TfrxMemoView
          Left = 696.079191730000000000
          Top = 22.677179999999990000
          Width = 98.267780000000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
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
          Left = 793.787911730000000000
          Top = 22.677179999999990000
          Width = 75.590600000000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
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
          Left = 869.377950310000000000
          Top = 22.677179999999990000
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
            #49688#46041#52636#52264#44552#50529)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 963.866761730000000000
          Top = 22.677179999999990000
          Width = 83.149660000000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #54924#52264#44148#49688)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Header3: TfrxHeader
        FillType = ftBrush
        Height = 49.889763780000000000
        Top = 294.803340000000000000
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
          Top = 22.677180000000020000
          Width = 1046.929133860000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = cl3DLight
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo49: TfrxMemoView
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
            #52376#47532#51068#51088)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo52: TfrxMemoView
          Left = 86.929190000000000000
          Top = 22.677165350000000000
          Width = 117.165430000000000000
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
          Left = 204.094620000000000000
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
          Left = 298.582870000000000000
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
        object Memo123: TfrxMemoView
          Left = 393.071120000000000000
          Top = 22.677165350000000000
          Width = 653.858690000000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
      end
      object MasterData2: TfrxMasterData
        FillType = ftBrush
        Height = 30.236220472440900000
        Top = 366.614410000000000000
        Width = 1046.929810000000000000
        DataSet = fFeeItemClosing
        DataSetName = 'FeeItemClosing'
        RowCount = 0
        object Memo50: TfrxMemoView
          Align = baClient
          Width = 1046.929810000000000000
          Height = 30.236220472440900000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo55: TfrxMemoView
          Width = 86.929133860000000000
          Height = 30.236220470000000000
          DataField = 'ProcDate'
          DataSet = fFeeItemClosing
          DataSetName = 'FeeItemClosing'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[FeeItemClosing."ProcDate"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo58: TfrxMemoView
          Left = 86.929190000000000000
          Width = 117.165430000000000000
          Height = 30.236220470000000000
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
        object Memo59: TfrxMemoView
          Left = 204.094620000000000000
          Width = 94.488250000000000000
          Height = 30.236220470000000000
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
        object Memo60: TfrxMemoView
          Left = 298.582870000000000000
          Width = 94.488250000000000000
          Height = 30.236220470000000000
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
        object Memo124: TfrxMemoView
          Left = 393.071120000000000000
          Width = 653.858690000000000000
          Height = 30.236220470000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
      end
      object Header5: TfrxHeader
        FillType = ftBrush
        Height = 50.645669290000000000
        Top = 634.961040000000000000
        Width = 1046.929810000000000000
        object Memo61: TfrxMemoView
          Top = 0.677180000000021200
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
          Top = 23.354360000000040000
          Width = 1046.929133860000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = cl3DLight
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo63: TfrxMemoView
          Top = 23.433070870000050000
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
            #52376#47532#51068#51088)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo64: TfrxMemoView
          Left = 86.929190000000000000
          Top = 23.433070870000050000
          Width = 75.590551180000000000
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
          Left = 162.519790000000000000
          Top = 23.433070870000050000
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
            #52376#47532#44592#44592)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo66: TfrxMemoView
          Left = 257.008040000000000000
          Top = 23.433070870000050000
          Width = 75.590551180000000000
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
        object Memo67: TfrxMemoView
          Left = 332.598640000000000000
          Top = 23.433070870000050000
          Width = 75.590551180000000000
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
          Left = 408.189240000000000000
          Top = 23.433070870000050000
          Width = 75.590551180000000000
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
          Left = 483.779840000000000000
          Top = 23.433070870000050000
          Width = 75.590551180000000000
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
          Left = 559.370440000000000000
          Top = 23.433070870000050000
          Width = 75.590551180000000000
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
        object Memo127: TfrxMemoView
          Left = 634.961040000000000000
          Top = 23.433070870000050000
          Width = 411.968770000000100000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
      end
      object MasterData3: TfrxMasterData
        FillType = ftBrush
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = #44404#47548#52404
        Font.Style = []
        Height = 30.236220472440900000
        ParentFont = False
        Top = 706.772110000000000000
        Width = 1046.929810000000000000
        DataSet = fBarClosing
        DataSetName = 'BarClosing'
        RowCount = 0
        object Memo51: TfrxMemoView
          Align = baClient
          Width = 1046.929810000000000000
          Height = 30.236220472440900000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo71: TfrxMemoView
          Width = 86.929133860000000000
          Height = 30.236220470000000000
          DataField = 'ProcDate'
          DataSet = fBarClosing
          DataSetName = 'BarClosing'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[BarClosing."ProcDate"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo72: TfrxMemoView
          Left = 86.929190000000000000
          Width = 75.590551180000000000
          Height = 30.236220470000000000
          DataField = 'ProcTime'
          DataSet = fBarClosing
          DataSetName = 'BarClosing'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[BarClosing."ProcTime"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo73: TfrxMemoView
          Left = 162.519790000000000000
          Width = 94.488250000000000000
          Height = 30.236220470000000000
          DataField = 'UnitName'
          DataSet = fBarClosing
          DataSetName = 'BarClosing'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[BarClosing."UnitName"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo74: TfrxMemoView
          Left = 257.008040000000000000
          Width = 75.590551180000000000
          Height = 30.236220470000000000
          DataField = 'MName'
          DataSet = fBarClosing
          DataSetName = 'BarClosing'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[BarClosing."MName"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo75: TfrxMemoView
          Left = 332.598640000000000000
          Width = 75.590551180000000000
          Height = 30.236220470000000000
          DataSet = fBarClosing
          DataSetName = 'BarClosing'
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
            '[BarClosing."UpCnt"]'#44148)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo76: TfrxMemoView
          Left = 408.189240000000000000
          Width = 75.590551180000000000
          Height = 30.236220470000000000
          DataSet = fBarClosing
          DataSetName = 'BarClosing'
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
            '[BarClosing."DownCnt"]'#44148)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo77: TfrxMemoView
          Left = 483.779840000000000000
          Width = 75.590551180000000000
          Height = 30.236220470000000000
          DataSet = fBarClosing
          DataSetName = 'BarClosing'
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
            '[BarClosing."LockCnt"]'#44148)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo78: TfrxMemoView
          Left = 559.370440000000000000
          Width = 75.590551180000000000
          Height = 30.236220470000000000
          DataSet = fBarClosing
          DataSetName = 'BarClosing'
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
            '[BarClosing."UnLockCnt"]'#44148)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo128: TfrxMemoView
          Left = 634.961040000000000000
          Width = 411.968770000000200000
          Height = 30.236220470000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 842.835190000000000000
        Width = 1046.929810000000000000
        object Memo79: TfrxMemoView
          Left = 7.559060000000000000
          Top = 3.779530000000022000
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
      object Footer2: TfrxFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 249.448980000000000000
        Width = 1046.929810000000000000
      end
      object Footer4: TfrxFooter
        FillType = ftBrush
        Height = 22.677165350000000000
        Top = 759.685530000000000000
        Width = 1046.929810000000000000
      end
      object Header7: TfrxHeader
        FillType = ftBrush
        Height = 49.889763780000000000
        Top = 464.882190000000000000
        Width = 1046.929810000000000000
        object Memo31: TfrxMemoView
          Top = 22.677180000000020000
          Width = 1046.929133860000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = cl3DLight
          ParentFont = False
          VAlign = vaCenter
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
            #52376#47532#51068#51088)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 86.929190000000000000
          Top = 22.677165350000000000
          Width = 117.165430000000000000
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
        object Memo34: TfrxMemoView
          Left = 204.094620000000000000
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
          Left = 298.582870000000000000
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
          Left = 393.071120000000000000
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
        object Memo125: TfrxMemoView
          Left = 487.559370000000000000
          Top = 22.677165350000000000
          Width = 559.370440000000100000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
      end
      object MasterData7: TfrxMasterData
        FillType = ftBrush
        Height = 30.236220470000000000
        Top = 536.693260000000000000
        Width = 1046.929810000000000000
        DataSet = fIssueClosing
        DataSetName = 'IssueClosing'
        RowCount = 0
        object Memo36: TfrxMemoView
          Align = baClient
          Width = 1046.929810000000000000
          Height = 30.236220470000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Width = 86.929190000000000000
          Height = 30.236220470000000000
          DataField = 'IssueDate'
          DataSet = fIssueClosing
          DataSetName = 'IssueClosing'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[IssueClosing."IssueDate"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 86.929190000000000000
          Width = 117.165430000000000000
          Height = 30.236220470000000000
          DataField = 'MName'
          DataSet = fIssueClosing
          DataSetName = 'IssueClosing'
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[IssueClosing."MName"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Left = 204.094620000000000000
          Width = 94.488250000000000000
          Height = 30.236220470000000000
          DataSet = fIssueClosing
          DataSetName = 'IssueClosing'
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
            '[IssueClosing."nIssue"]'#44148)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Left = 298.582870000000000000
          Width = 94.488250000000000000
          Height = 30.236220470000000000
          DataSet = fIssueClosing
          DataSetName = 'IssueClosing'
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
            '[IssueClosing."COLUMN1"]'#50896)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 393.071120000000000000
          Width = 94.488250000000000000
          Height = 30.236220470000000000
          DataSet = fIssueClosing
          DataSetName = 'IssueClosing'
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
            '[IssueClosing."COLUMN2"]'#50896)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo126: TfrxMemoView
          Left = 487.559370000000000000
          Width = 559.370440000000000000
          Height = 30.236220470000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
      end
      object Footer7: TfrxFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 589.606680000000000000
        Width = 1046.929810000000000000
      end
      object Memo28: TfrxMemoView
        Top = 461.102660000000000000
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
        Height = 69.811070000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo45: TfrxMemoView
          Top = 1.779530000000001000
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
            #51068' '#48324' '#51665' '#44228)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 3.779530000000000000
          Top = 47.133889999999990000
          Width = 260.787570000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo27OnBeforePrint'
          VAlign = vaCenter
        end
      end
      object Header2: TfrxHeader
        FillType = ftBrush
        Height = 22.677165354330700000
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
      object Footer3: TfrxFooter
        FillType = ftBrush
        Height = 79.834718900000000000
        Top = 241.889920000000000000
        Width = 1046.929810000000000000
        object Memo56: TfrxMemoView
          Top = 0.464566929999989500
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
          Top = 0.031356929999986960
          Width = 222.992128430000000000
          Height = 26.834645670000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
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
          Top = 0.110236219999990200
          Width = 219.212598430000000000
          Height = 26.834645670000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #54624' '#51064' '#44552' '#50529)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo81: TfrxMemoView
          Left = 441.645950000000000000
          Top = 0.110236219999990200
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
            #52509#54624#51064#44148#49688)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo82: TfrxMemoView
          Left = 593.386210000000000000
          Top = 0.110236219999990200
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
            #48155' '#51008' '#44552' '#50529)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo83: TfrxMemoView
          Left = 744.787880000000000000
          Top = 0.110236219999990200
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
            #49688' '#46041' '#52636' '#52264)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo84: TfrxMemoView
          Left = 933.764380000000000000
          Width = 113.385802360000000000
          Height = 26.834645670000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
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
          Top = 26.921276929999890000
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
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<TKProcClosing."ProcCnt">,MasterData1)]'#44148)
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
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<TKProcClosing."ProcFee">,MasterData1)]'#50896)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo88: TfrxMemoView
          Left = 222.992270000000000000
          Top = 26.921245200000020000
          Width = 98.267731180000000000
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
            '[SUM(<TKProcClosing."DCCnt">,MasterData1)]'#44148)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo89: TfrxMemoView
          Left = 321.260050000000000000
          Top = 26.921245200000020000
          Width = 120.566929130000000000
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
            '[SUM(<TKProcClosing."ProcDC">,MasterData1)]'#50896)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo90: TfrxMemoView
          Left = 441.543600000000000000
          Top = 26.921298899999980000
          Width = 151.559055120000000000
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
            '[SUM(<TKProcClosing."TotDCCnt">,MasterData1)]'#44148)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo91: TfrxMemoView
          Left = 593.386210000000000000
          Top = 26.921245200000020000
          Width = 151.181200000000000000
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
            '[SUM(<TKProcClosing."ProcFee">,MasterData1)]'#50896)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo92: TfrxMemoView
          Left = 744.567410000000000000
          Top = 26.921245200000020000
          Width = 83.149606300000000000
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
            '[SUM(<TKProcClosing."LostCnt">,MasterData1)]'#44148)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo93: TfrxMemoView
          Left = 828.496600000000000000
          Top = 26.921245200000020000
          Width = 105.070866140000000000
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
            '[SUM(<TKProcClosing."LostAmt">,MasterData1)]'#50896)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo94: TfrxMemoView
          Left = 933.662030000000000000
          Top = 26.921245200000020000
          Width = 113.385851180000000000
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
            '[SUM(<TKProcClosing."GT1Cnt">,MasterData1)]'#44148)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Header4: TfrxHeader
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
      object MasterData5: TfrxMasterData
        FillType = ftBrush
        Height = 22.677111650000000000
        Top = 559.370440000000000000
        Visible = False
        Width = 1046.929810000000000000
        DataSet = fBarClosing
        DataSetName = 'BarClosing'
        RowCount = 0
      end
      object Footer5: TfrxFooter
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
          Top = 26.456692910000020000
          Width = 260.787401570000000000
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
            '[SUM(<BarClosing."UpCnt">,MasterData3)]'#44148)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo106: TfrxMemoView
          Left = 260.787570000000000000
          Top = 26.456710000000040000
          Width = 260.031496060000000000
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
            '[SUM(<BarClosing."DownCnt">,MasterData3)]'#44148)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo107: TfrxMemoView
          Left = 520.575140000000100000
          Top = 26.456710000000040000
          Width = 260.787401570000000000
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
            '[SUM(<BarClosing."LockCnt">,MasterData3)]'#44148)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo108: TfrxMemoView
          Left = 781.142240000000000000
          Top = 26.456710000000040000
          Width = 265.322834650000000000
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
            '[SUM(<BarClosing."UnLockCnt">,MasterData3)]'#44148)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo102: TfrxMemoView
          Top = 0.220469999999977500
          Width = 260.787401570000000000
          Height = 26.078740160000000000
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
        object Memo103: TfrxMemoView
          Left = 260.567100000000000000
          Width = 260.031496060000000000
          Height = 26.456710000000000000
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
        object Memo104: TfrxMemoView
          Left = 520.575140000000100000
          Top = 0.220469999999977500
          Width = 260.787401570000000000
          Height = 26.078740160000000000
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
        object Memo105: TfrxMemoView
          Left = 781.362710000000000000
          Top = 0.220469999999977500
          Width = 265.322834650000000000
          Height = 26.078740160000000000
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
      object Header6: TfrxHeader
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
      object MasterData6: TfrxMasterData
        FillType = ftBrush
        Height = 22.677111650000000000
        Top = 752.126470000000000000
        Visible = False
        Width = 1046.929810000000000000
        DataSet = fBarClosing
        DataSetName = 'BarClosing'
        RowCount = 0
      end
      object Footer6: TfrxFooter
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
          Top = 26.456692910000020000
          Width = 260.787401570000000000
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
            '[NInCnt."nInCnt"]'#44148)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo110: TfrxMemoView
          Left = 260.787570000000000000
          Top = 26.456710000000040000
          Width = 260.031496060000000000
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
            '[NOutCnt."nOutCnt"]'#44148)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo111: TfrxMemoView
          Left = 520.575140000000100000
          Top = 26.456710000000040000
          Width = 260.409448820000000000
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
            '[SInCnt."SInCnt"]'#44148)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo112: TfrxMemoView
          Left = 781.142240000000000000
          Top = 26.456710000000040000
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
          Font.Height = -12
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
          Font.Height = -12
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
          Left = 520.575140000000100000
          Width = 260.787401570000000000
          Height = 26.456692910000000000
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
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
          Font.Height = -12
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
        object Memo26: TfrxMemoView
          Left = 7.559060000000000000
          Top = 3.779530000000022000
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
        Height = 22.677180000000000000
        Top = 196.535560000000000000
        Visible = False
        Width = 1046.929810000000000000
        DataSet = fBarClosing
        DataSetName = 'BarClosing'
        RowCount = 0
      end
      object Header8: TfrxHeader
        FillType = ftBrush
        Height = 49.133890000000000000
        Top = 343.937230000000000000
        Width = 1046.929810000000000000
        object Memo43: TfrxMemoView
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
        object Memo44: TfrxMemoView
          Left = 260.787401570000000000
          Top = 22.677180000000020000
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
            #49888#44508#48156#44553' '#44552#50529)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo96: TfrxMemoView
          Top = 22.677180000000020000
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
            #49888#44508#48156#44553' '#44148#49688)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo117: TfrxMemoView
          Left = 520.818897640000100000
          Top = 22.677180000000020000
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
            #44592#44036#50672#51109' '#44148#49688)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo118: TfrxMemoView
          Left = 781.606299210000000000
          Top = 22.677180000000000000
          Width = 265.322834650000000000
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
            #44592#44036#50672#51109' '#44552#50529)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData8: TfrxMasterData
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
          Font.Height = -12
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
          Font.Height = -12
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
          Left = 520.818897640000100000
          Width = 260.787570000000000000
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
            '[SCAdd."nAddCnt"]'#44148)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo122: TfrxMemoView
          Left = 781.606299210000000000
          Width = 265.322834650000000000
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
            '[SCAdd."nAddAmt"]'#50896)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Footer8: TfrxFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 468.661720000000000000
        Width = 1046.929810000000000000
      end
    end
  end
  object fTKProcClosing: TfrxDBDataset
    UserName = 'TKProcClosing'
    CloseDataSource = False
    OpenDataSource = False
    DataSource = dsTKProcClosing
    BCDToCurrency = False
    Left = 40
    Top = 136
  end
  object fIssueClosing: TfrxDBDataset
    UserName = 'IssueClosing'
    CloseDataSource = False
    OpenDataSource = False
    DataSource = dsIssueClosing
    BCDToCurrency = False
    Left = 216
    Top = 136
  end
  object fBarClosing: TfrxDBDataset
    UserName = 'BarClosing'
    CloseDataSource = False
    OpenDataSource = False
    DataSource = dsBarClosing
    BCDToCurrency = False
    Left = 304
    Top = 136
  end
  object qryFeeItemClosing: TADOQuery
    Connection = dmTables.ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select ProcDate, FeeNo, Sum(FeeCnt), Sum(FeeAmt) '
      'from FeeDetail '
      'Group By ProcDate, FeeNo ')
    Left = 400
    Top = 40
    object qryFeeItemClosingProcDate: TStringField
      FieldName = 'ProcDate'
      FixedChar = True
      Size = 10
    end
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
      OnGetText = qryFeeItemClosingFeeNameGetText
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
  object qryFeeItem: TADOQuery
    Connection = dmTables.ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select ParkNo, FeeNo, FeeName from FeeItem')
    Left = 128
    Top = 184
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
  object dsFeeItemClosing: TDataSource
    DataSet = qryFeeItemClosing
    Left = 400
    Top = 88
  end
  object fFeeItemClosing: TfrxDBDataset
    UserName = 'FeeItemClosing'
    CloseDataSource = False
    OpenDataSource = False
    DataSource = dsFeeItemClosing
    BCDToCurrency = False
    Left = 400
    Top = 136
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
  object fNInCnt: TfrxDBDataset
    UserName = 'NInCnt'
    CloseDataSource = False
    OpenDataSource = False
    DataSource = dsNInCnt
    BCDToCurrency = False
    Left = 496
    Top = 136
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
  object fNOutCnt: TfrxDBDataset
    UserName = 'NOutCnt'
    CloseDataSource = False
    OpenDataSource = False
    DataSource = dsNOutCnt
    BCDToCurrency = False
    Left = 576
    Top = 136
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
  object fSInCnt: TfrxDBDataset
    UserName = 'SInCnt'
    CloseDataSource = False
    OpenDataSource = False
    DataSource = dsSInCnt
    BCDToCurrency = False
    Left = 496
    Top = 296
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
  object fSOutCnt: TfrxDBDataset
    UserName = 'SOutCnt'
    CloseDataSource = False
    OpenDataSource = False
    DataSource = dsSOutCnt
    BCDToCurrency = False
    Left = 576
    Top = 296
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
  object dsSCAdd: TDataSource
    DataSet = qrySCAdd
    Left = 400
    Top = 248
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
end
