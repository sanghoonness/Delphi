object frmIONData: TfrmIONData
  Left = 482
  Top = 188
  Caption = #51077#52636#45236#50669
  ClientHeight = 633
  ClientWidth = 1300
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548#52404
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object sb1: TStatusBar
    Left = 0
    Top = 614
    Width = 1300
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1300
    Height = 487
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #44404#47548#52404
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object dg1: TDBAdvGrid
      Left = 1
      Top = 1
      Width = 1002
      Height = 485
      Cursor = crDefault
      Align = alClient
      ColCount = 13
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
      OnKeyUp = dg1KeyUp
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
          FieldName = 'InUnitName'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Header = #51077#52264#44592#44592
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
          FieldName = 'ProcDate'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Header = #51077#52264#51068#51088
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
          FieldName = 'ProcTime'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Header = #51077#52264#49884#44033
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
          Width = 80
        end
        item
          Alignment = taCenter
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'InCarNo1'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Header = #51077#52264#52264#47049#48264#54840
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
          FieldName = 'OutUnitName'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Header = #52636#52264#44592#44592
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
          Width = 68
        end
        item
          Alignment = taCenter
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'OutDate'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Header = #52636#52264#51068#51088
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
          Width = 79
        end
        item
          Alignment = taCenter
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'OutTime'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Header = #52636#52264#49884#44033
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
          Width = 58
        end
        item
          Alignment = taCenter
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'OutCarNo1'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Header = #52636#52264#52264#47049#48264#54840
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
          PrintFont.Name = 'Tahoma'
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
          FieldName = 'OutChk'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          Header = #52636#52264#49345#53468
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
          Width = 82
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
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = #48169#47928#49324#50976
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
          Width = 90
        end
        item
          Alignment = taCenter
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'Reserve2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = #46041
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
          Width = 64
        end
        item
          Alignment = taCenter
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'Reserve3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = #54840
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
          Width = 64
        end>
      DataSource = dsIONData
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
        80
        90
        68
        79
        58
        90
        82
        90
        64
        64)
    end
    object pnImg: TPanel
      Left = 1003
      Top = 1
      Width = 296
      Height = 485
      Align = alRight
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object imgIn: TImage
        Left = 5
        Top = 4
        Width = 284
        Height = 235
        Stretch = True
        OnDblClick = imgInDblClick
      end
      object imgOut: TImage
        Left = 6
        Top = 245
        Width = 283
        Height = 235
        Stretch = True
        OnDblClick = imgOutDblClick
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 487
    Width = 1300
    Height = 127
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 2
    object Panel2: TPanel
      Left = 7
      Top = 11
      Width = 1286
      Height = 69
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Bevel6: TBevel
        Left = 706
        Top = 10
        Width = 89
        Height = 20
      end
      object Bevel14: TBevel
        Left = 19
        Top = 10
        Width = 70
        Height = 20
      end
      object Label14: TLabel
        Left = 30
        Top = 14
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
      object Bevel1: TBevel
        Left = 226
        Top = 10
        Width = 70
        Height = 20
      end
      object Label2: TLabel
        Left = 237
        Top = 14
        Width = 48
        Height = 12
        Alignment = taCenter
        Caption = #52636#52264#49345#53468
        Font.Charset = ANSI_CHARSET
        Font.Color = 7485192
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Bevel2: TBevel
        Left = 450
        Top = 39
        Width = 70
        Height = 20
      end
      object Label4: TLabel
        Left = 693
        Top = 37
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
      object Label3: TLabel
        Left = 461
        Top = 43
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
      object Bevel3: TBevel
        Left = 451
        Top = 10
        Width = 70
        Height = 20
      end
      object Label1: TLabel
        Left = 462
        Top = 14
        Width = 48
        Height = 12
        Alignment = taCenter
        Caption = #52264#47049#48264#54840
        Font.Charset = ANSI_CHARSET
        Font.Color = 7485192
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Bevel4: TBevel
        Left = 229
        Top = 39
        Width = 70
        Height = 20
      end
      object Label5: TLabel
        Left = 246
        Top = 43
        Width = 36
        Height = 12
        Alignment = taCenter
        Caption = #51312'  '#54924
        Font.Charset = ANSI_CHARSET
        Font.Color = 7485192
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Bevel5: TBevel
        Left = 19
        Top = 39
        Width = 70
        Height = 20
      end
      object Label6: TLabel
        Left = 30
        Top = 43
        Width = 48
        Height = 12
        Alignment = taCenter
        Caption = #51312#54924#44592#51456
        Font.Charset = ANSI_CHARSET
        Font.Color = 7485192
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label7: TLabel
        Left = 717
        Top = 14
        Width = 72
        Height = 12
        Alignment = taCenter
        Caption = #51452#52264#49884#44036'('#48516')'
        Font.Charset = ANSI_CHARSET
        Font.Color = 7485192
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label8: TLabel
        Left = 860
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
      object cmbSearch: TComboBox
        Left = 92
        Top = 10
        Width = 105
        Height = 20
        ImeName = #54620#44397#50612'('#54620#44544')'
        ItemIndex = 0
        TabOrder = 0
        Text = #51068#51088#48324
        OnChange = cmbSearchChange
        Items.Strings = (
          #51068#51088#48324
          #49884#44036#45824#48324)
      end
      object cmbOutStatus: TComboBox
        Left = 299
        Top = 10
        Width = 120
        Height = 20
        DropDownCount = 10
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ImeName = #54620#44397#50612'('#54620#44544')'
        ItemIndex = 0
        ParentFont = False
        TabOrder = 1
        Text = #51204#52404
        Items.Strings = (
          #51204#52404
          #48120#52636#52264
          #51221#49345#52636#52264
          #54624#51064#52636#52264
          #47924#47308#52636#52264
          #52636#52264#54728#50857
          #47924#47308#49884#44036#52636#52264
          #48124#50896#52636#52264
          #48120#52636#52264#51221#47532)
      end
      object edtSDate: TAdvDateTimePicker
        Left = 522
        Top = 39
        Width = 89
        Height = 20
        Date = 39710.652071759260000000
        Format = ''
        Time = 39710.652071759260000000
        DoubleBuffered = True
        ImeName = 'Microsoft Office IME 2007'
        Kind = dkDate
        ParentDoubleBuffered = False
        TabOrder = 5
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
      object edtSTime: TAdvDateTimePicker
        Left = 611
        Top = 39
        Width = 81
        Height = 20
        Date = 39710.000000000000000000
        Format = 'HH:mm:ss'
        Time = 39710.000000000000000000
        DoubleBuffered = True
        ImeName = 'Microsoft Office IME 2007'
        Kind = dkTime
        ParentDoubleBuffered = False
        TabOrder = 6
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
      object edtEDate: TAdvDateTimePicker
        Left = 706
        Top = 39
        Width = 89
        Height = 20
        Date = 39710.652071759260000000
        Format = ''
        Time = 39710.652071759260000000
        DoubleBuffered = True
        ImeName = 'Microsoft Office IME 2007'
        Kind = dkDate
        ParentDoubleBuffered = False
        TabOrder = 7
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
      object edtETime: TAdvDateTimePicker
        Left = 795
        Top = 39
        Width = 81
        Height = 20
        Date = 39710.999988425920000000
        Format = 'HH:mm:ss'
        Time = 39710.999988425920000000
        DoubleBuffered = True
        ImeName = 'Microsoft Office IME 2007'
        Kind = dkTime
        ParentDoubleBuffered = False
        TabOrder = 8
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
      object edtCarNo: TEdit
        Left = 524
        Top = 10
        Width = 165
        Height = 20
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ImeMode = imSHanguel
        ImeName = 'Microsoft IME 2010'
        ParentFont = False
        TabOrder = 2
      end
      object cmbIO: TComboBox
        Left = 302
        Top = 39
        Width = 98
        Height = 20
        ImeName = #54620#44397#50612'('#54620#44544')'
        ItemIndex = 0
        TabOrder = 3
        Text = #51077#52264#52264#47049#48264#54840
        OnChange = cmbSearchChange
        Items.Strings = (
          #51077#52264#52264#47049#48264#54840
          #52636#52264#52264#47049#48264#54840)
      end
      object cmbType: TComboBox
        Left = 93
        Top = 39
        Width = 104
        Height = 20
        Style = csDropDownList
        ImeName = #54620#44397#50612'('#54620#44544')'
        ItemIndex = 0
        TabOrder = 4
        Text = #51077#52264#44592#51456
        Items.Strings = (
          #51077#52264#44592#51456
          #52636#52264#44592#51456)
      end
      object edtVisitTimeS: TEdit
        Left = 802
        Top = 10
        Width = 53
        Height = 20
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ImeMode = imSHanguel
        ImeName = 'Microsoft IME 2010'
        ParentFont = False
        TabOrder = 9
      end
      object edtVisitTimeE: TEdit
        Left = 876
        Top = 10
        Width = 53
        Height = 20
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ImeMode = imSHanguel
        ImeName = 'Microsoft IME 2010'
        ParentFont = False
        TabOrder = 10
      end
    end
    object btnSearch: TBitBtn
      Left = 998
      Top = 84
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
      Left = 792
      Top = 86
      Width = 97
      Height = 35
      Caption = #51064'  '#49604
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
      TabOrder = 2
      Visible = False
    end
    object btnClose: TBitBtn
      Left = 1196
      Top = 84
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
    object edtTotal: TPanel
      Left = 7
      Top = 84
      Width = 321
      Height = 35
      Alignment = taLeftJustify
      Caption = '  '#52509#51077#52264': 0'#44148'   '#52509#52636#52264': 0'#44148'   '#48120#52636#52264': 0'#44148
      TabOrder = 4
    end
    object btnExcel: TBitBtn
      Left = 1097
      Top = 84
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
    object btnDelete: TBitBtn
      Left = 895
      Top = 86
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
      TabOrder = 6
      Visible = False
      OnClick = btnDeleteClick
    end
  end
  object pnIONDataIn: TsPanel
    Left = 290
    Top = 1
    Width = 702
    Height = 634
    BevelInner = bvLowered
    BevelWidth = 2
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #44404#47548#52404
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 3
    Visible = False
    SkinData.SkinSection = 'PANEL'
    object sLabel28: TsLabel
      Left = 191
      Top = 18
      Width = 311
      Height = 19
      Alignment = taCenter
      AutoSize = False
      Caption = #51077#52264' '#52264#47049#48264#54840' '#54869#51064
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = #44404#47548#52404
      Font.Style = []
    end
    object Label9: TLabel
      Left = 58
      Top = 584
      Width = 92
      Height = 21
      Caption = #52264#47049#48264#54840
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = #44404#47548#52404
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object edtIONDataInCar: TEdit
      Left = 156
      Top = 580
      Width = 181
      Height = 29
      Color = clAqua
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = #44404#47548#52404
      Font.Style = [fsBold]
      ImeMode = imSHanguel
      ImeName = 'Microsoft Office IME 2007'
      MaxLength = 12
      ParentFont = False
      TabOrder = 0
      Text = #49436#50872'12'#44032'3456'
    end
    object btnIONInOK: TsButton
      Left = 351
      Top = 571
      Width = 322
      Height = 39
      Caption = #54869'  '#51064
      TabOrder = 1
      OnClick = btnIONInOKClick
      SkinData.SkinSection = 'BUTTON'
    end
    object Panel4: TPanel
      Left = 35
      Top = 47
      Width = 638
      Height = 502
      BevelInner = bvLowered
      TabOrder = 2
      object imgIONDataIn: TImage
        Left = 2
        Top = 2
        Width = 634
        Height = 498
        Align = alClient
        Stretch = True
        ExplicitWidth = 417
        ExplicitHeight = 417
      end
    end
  end
  object pnIONDataOut: TsPanel
    Left = 290
    Top = -9
    Width = 702
    Height = 634
    BevelInner = bvLowered
    BevelWidth = 2
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #44404#47548#52404
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 4
    Visible = False
    SkinData.SkinSection = 'PANEL'
    object sLabel1: TsLabel
      Left = 196
      Top = 18
      Width = 311
      Height = 19
      Alignment = taCenter
      AutoSize = False
      Caption = #52636#52264' '#52264#47049#48264#54840' '#54869#51064
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = #44404#47548#52404
      Font.Style = []
    end
    object Label10: TLabel
      Left = 55
      Top = 580
      Width = 92
      Height = 21
      Caption = #52264#47049#48264#54840
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = #44404#47548#52404
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object edtIONDataOutCar: TEdit
      Left = 153
      Top = 576
      Width = 181
      Height = 29
      Color = clAqua
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = #44404#47548#52404
      Font.Style = [fsBold]
      ImeMode = imSHanguel
      ImeName = 'Microsoft Office IME 2007'
      MaxLength = 12
      ParentFont = False
      TabOrder = 0
      Text = #49436#50872'12'#44032'3456'
    end
    object btnIONOutOK: TsButton
      Left = 351
      Top = 571
      Width = 322
      Height = 39
      Caption = #54869'  '#51064
      TabOrder = 1
      OnClick = btnIONOutOKClick
      SkinData.SkinSection = 'BUTTON'
    end
    object Panel5: TPanel
      Left = 35
      Top = 47
      Width = 638
      Height = 501
      BevelInner = bvLowered
      TabOrder = 2
      object imgIONDataOut: TImage
        Left = 2
        Top = 2
        Width = 634
        Height = 497
        Align = alClient
        Stretch = True
        ExplicitLeft = 0
        ExplicitTop = -4
        ExplicitWidth = 417
        ExplicitHeight = 361
      end
    end
  end
  object qryIONData: TADOQuery
    Connection = dmTables.ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from IONData')
    Left = 63
    Top = 74
    object qryIONDataParkNo: TSmallintField
      FieldName = 'ParkNo'
    end
    object qryIONDataUnitNo: TWordField
      FieldName = 'UnitNo'
    end
    object qryIONDataProcDate: TStringField
      FieldName = 'ProcDate'
      FixedChar = True
      Size = 10
    end
    object qryIONDataProcTime: TStringField
      FieldName = 'ProcTime'
      FixedChar = True
      Size = 8
    end
    object qryIONDataTKNo: TStringField
      FieldName = 'TKNo'
      Size = 50
    end
    object qryIONDataTKType: TWordField
      FieldName = 'TKType'
    end
    object qryIONDataCarTypeNo: TWordField
      FieldName = 'CarType'
    end
    object qryIONDataInImage: TStringField
      FieldName = 'InImage1'
      Size = 300
    end
    object qryIONDataInCarNo: TStringField
      FieldName = 'InCarNo1'
      Size = 50
    end
    object qryIONDataStatus: TWordField
      FieldName = 'Status'
      OnGetText = qryIONDataStatusGetText
    end
    object qryIONDataOutUnitNo: TWordField
      FieldName = 'OutUnitNo'
    end
    object qryIONDataOutDate: TStringField
      FieldName = 'OutDate'
      FixedChar = True
      Size = 10
    end
    object qryIONDataOutTime: TStringField
      FieldName = 'OutTime'
      FixedChar = True
      Size = 8
    end
    object qryIONDataOutChk: TWordField
      FieldName = 'OutChk'
      OnGetText = qryIONDataOutChkGetText
    end
    object qryIONDataOutImage: TStringField
      FieldName = 'OutImage1'
      Size = 300
    end
    object qryIONDataOutCarNo: TStringField
      FieldName = 'OutCarNo1'
      Size = 50
    end
    object qryIONDataReserve1: TStringField
      FieldName = 'Reserve1'
      Size = 50
    end
    object qryIONDataReserve2: TStringField
      FieldName = 'Reserve2'
      Size = 50
    end
    object qryIONDataReserve3: TStringField
      FieldName = 'Reserve3'
      Size = 50
    end
    object qryIONDataReserve4: TStringField
      FieldName = 'Reserve4'
      Size = 50
    end
    object qryIONDataReserve5: TStringField
      FieldName = 'Reserve5'
      Size = 50
    end
    object qryIONDataInRecog: TWordField
      FieldName = 'InRecog1'
    end
    object qryIONDataOutRecog: TWordField
      FieldName = 'OutRecog1'
    end
    object qryIONDataInImage2: TStringField
      FieldName = 'InImage2'
      Size = 300
    end
    object qryIONDataInCarNo2: TStringField
      FieldName = 'InCarNo2'
      Size = 50
    end
    object qryIONDataOutImage2: TStringField
      FieldName = 'OutImage2'
      Size = 300
    end
    object qryIONDataOutCarNo2: TStringField
      FieldName = 'OutCarNo2'
      Size = 50
    end
    object qryIONDataInRecog2: TWordField
      FieldName = 'InRecog2'
    end
    object qryIONDataOutRecog2: TWordField
      FieldName = 'OutRecog2'
    end
    object qryIONDataInUnitName: TStringField
      FieldKind = fkLookup
      FieldName = 'InUnitName'
      LookupDataSet = qryUnitInfo
      LookupKeyFields = 'UnitNo'
      LookupResultField = 'UnitName'
      KeyFields = 'UnitNo'
      Size = 50
      Lookup = True
    end
    object qryIONDataOutUnitName: TStringField
      FieldKind = fkLookup
      FieldName = 'OutUnitName'
      LookupDataSet = qryUnitInfo
      LookupKeyFields = 'UnitNo'
      LookupResultField = 'UnitName'
      KeyFields = 'OutUnitNo'
      Size = 50
      Lookup = True
    end
  end
  object dsIONData: TDataSource
    DataSet = qryIONData
    Left = 148
    Top = 73
  end
  object qryTemp: TADOQuery
    Connection = dmTables.ADODB
    Parameters = <>
    Left = 62
    Top = 138
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Excel files (*.xls)|*.xls'
    Left = 224
    Top = 72
  end
  object AdvGridExcelIO1: TAdvGridExcelIO
    AdvStringGrid = dg1
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
    Left = 147
    Top = 140
  end
  object qryUnitInfo: TADOQuery
    AutoCalcFields = False
    Connection = dmTables.ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from UnitInfo')
    Left = 61
    Top = 210
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
end
