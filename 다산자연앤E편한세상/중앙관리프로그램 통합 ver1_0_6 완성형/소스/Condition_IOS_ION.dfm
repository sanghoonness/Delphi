object Condition_IOS_ION_Data: TCondition_IOS_ION_Data
  Left = 0
  Top = 0
  Caption = #51312#44148#48324' '#51077#52264'('#52636#52264','#51221#49328')'#54788#54889
  ClientHeight = 678
  ClientWidth = 655
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object tab_main: TsTabControl
    Left = 0
    Top = 0
    Width = 655
    Height = 678
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    Tabs.Strings = (
      ' '#51068#48324' '
      ' '#50836#51068#48324' '
      ' '#44592#44036#48324
      ' '#50900#48324)
    TabIndex = 0
    OnChange = tab_mainChange
    object Day_Panel: TsPanel
      Left = 3
      Top = 25
      Width = 646
      Height = 650
      Align = alCustom
      Color = cl3DLight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      object Title: TPanel
        Left = 1
        Top = 1
        Width = 644
        Height = 23
        Align = alTop
        Caption = #49884#44036#45824#48324'('#51648#54616','#53440#50892','#51648#49345','#51204#52404')'#51077#52264'('#52636#52264','#51221#49328')'#54788#54889
        TabOrder = 0
      end
      object TitleDay: TPanel
        Left = 1
        Top = 24
        Width = 644
        Height = 23
        Align = alTop
        Alignment = taRightJustify
        Caption = '00'#45380' '#50900' '#51068
        TabOrder = 1
      end
      object TitleCount: TPanel
        Left = 1
        Top = 47
        Width = 644
        Height = 27
        Align = alTop
        Alignment = taRightJustify
        Caption = #44592#51456':'#45824#49688
        TabOrder = 2
        object Label2: TLabel
          Left = 26
          Top = 4
          Width = 22
          Height = 16
          Alignment = taCenter
          Caption = #51109#49548
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object ParkNo_ComBox: TComboBox
          Left = 67
          Top = 1
          Width = 126
          Height = 24
          TabOrder = 0
          Text = #51204#52404
          Items.Strings = (
            #51648#54616
            #53440#50892
            #51648#49345
            #51204#52404)
        end
      end
      object Panel1: TPanel
        Left = 1
        Top = 594
        Width = 644
        Height = 55
        Align = alBottom
        TabOrder = 3
        object Bevel2: TBevel
          Left = 8
          Top = 16
          Width = 70
          Height = 20
        end
        object Label8: TLabel
          Left = 17
          Top = 21
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
        object Label13: TLabel
          Left = 185
          Top = 15
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
        object edtSDate: TAdvDateTimePicker
          Left = 82
          Top = 15
          Width = 103
          Height = 24
          Date = 39710.652071759260000000
          Format = ''
          Time = 39710.652071759260000000
          DoubleBuffered = True
          ImeName = 'Microsoft Office IME 2007'
          Kind = dkDate
          ParentDoubleBuffered = False
          TabOrder = 0
          OnCloseUp = edtSDateCloseUp
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
          Left = 310
          Top = 10
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
        object btnExcel: TBitBtn
          Left = 415
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
          TabOrder = 2
          OnClick = btnExcelClick
        end
        object btnClose: TBitBtn
          Left = 522
          Top = 10
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
        object edtEdate: TAdvDateTimePicker
          Left = 199
          Top = 15
          Width = 105
          Height = 24
          Date = 39710.652071759260000000
          Format = ''
          Time = 39710.652071759260000000
          DoubleBuffered = True
          ImeName = 'Microsoft Office IME 2007'
          Kind = dkDate
          ParentDoubleBuffered = False
          TabOrder = 4
          OnCloseUp = edtEdateCloseUp
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
      end
      object sgCount: TAdvStringGrid
        Left = 2
        Top = 80
        Width = 308
        Height = 159
        Cursor = crDefault
        Align = alCustom
        DefaultColWidth = 65
        DefaultRowHeight = 21
        DrawingStyle = gdsClassic
        RowCount = 26
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goColSizing, goRowSelect]
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 4
        GridLineColor = 15062992
        HoverRowCells = [hcNormal, hcSelected]
        HintColor = clYellow
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'MS Sans Serif'
        ActiveCellFont.Style = []
        ActiveCellColor = 10344697
        ActiveCellColorTo = 6210033
        AutoSize = True
        CellNode.ShowTree = False
        ColumnHeaders.Strings = (
          ' '#49884#44036
          ' '#51648#54616
          ' '#53440#50892
          ' '#51648#49345
          ' '#54633#44228)
        ControlLook.FixedGradientFrom = 16513526
        ControlLook.FixedGradientTo = 15260626
        ControlLook.FixedGradientHoverFrom = clGray
        ControlLook.FixedGradientHoverTo = clWhite
        ControlLook.FixedGradientDownFrom = clGray
        ControlLook.FixedGradientDownTo = clSilver
        ControlLook.ControlStyle = csClassic
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
        DefaultAlignment = taCenter
        EnhRowColMove = False
        ExcelStyleDecimalSeparator = True
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
        FixedColWidth = 65
        FixedFont.Charset = ANSI_CHARSET
        FixedFont.Color = clWindowText
        FixedFont.Height = -12
        FixedFont.Name = #44404#47548#52404
        FixedFont.Style = []
        FloatFormat = '%.2f'
        Navigation.AllowInsertRow = True
        Navigation.AllowDeleteRow = True
        Navigation.AdvanceOnEnter = True
        Navigation.AdvanceInsert = True
        Navigation.AdvanceAuto = True
        Navigation.InsertPosition = pInsertAfter
        PrintSettings.DateFormat = 'dd/mm/yyyy'
        PrintSettings.Font.Charset = DEFAULT_CHARSET
        PrintSettings.Font.Color = clWindowText
        PrintSettings.Font.Height = -11
        PrintSettings.Font.Name = 'MS Sans Serif'
        PrintSettings.Font.Style = []
        PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
        PrintSettings.FixedFont.Color = clWindowText
        PrintSettings.FixedFont.Height = -11
        PrintSettings.FixedFont.Name = 'Tahoma'
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
        PrintSettings.Borders = pbNoborder
        PrintSettings.Centered = False
        PrintSettings.PagePrefix = 'page'
        PrintSettings.PageNumSep = '/'
        RowHeaders.Strings = (
          ''
          '00 ~ 01'#49884
          '01 ~ 02'#49884
          '02 ~ 03'#49884
          '03 ~ 04'#49884
          '04 ~ 05'#49884
          '05 ~ 06'#49884
          '06 ~ 07'#49884
          '07 ~ 08'#49884
          '08 ~ 09'#49884
          '09 ~ 10'#49884
          '10 ~ 11'#49884
          '11 ~ 12'#49884
          '12 ~ 13'#49884
          '13 ~ 14'#49884
          '14 ~ 15'#49884
          '15 ~ 16'#49884
          '16 ~ 17'#49884
          '17 ~ 18'#49884
          '18 ~ 19'#49884
          '19 ~ 20'#49884
          '20 ~ 21'#49884
          '21 ~ 22'#49884
          '22 ~ 23'#49884
          '23 ~ 24'#49884
          #54633' '#44228)
        ScrollBarAlways = saBoth
        ScrollWidth = 16
        SearchFooter.Color = 16773091
        SearchFooter.ColorTo = 16765615
        SearchFooter.FindNextCaption = 'Find next'
        SearchFooter.FindPrevCaption = 'Find previous'
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
        SelectionColor = 6210033
        SortSettings.DefaultFormat = ssAutomatic
        URLColor = clBlack
        Version = '7.2.8.0'
        WordWrap = False
        ColWidths = (
          65
          42
          42
          42
          42)
        RowHeights = (
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21)
      end
      object sgcount2: TAdvStringGrid
        Left = 324
        Top = 80
        Width = 307
        Height = 160
        Cursor = crDefault
        Align = alCustom
        ColCount = 9
        DefaultColWidth = 67
        DefaultRowHeight = 21
        DrawingStyle = gdsClassic
        RowCount = 26
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goColSizing, goRowSelect]
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 5
        GridLineColor = 15062992
        HoverRowCells = [hcNormal, hcSelected]
        HintColor = clYellow
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'MS Sans Serif'
        ActiveCellFont.Style = []
        ActiveCellColor = 10344697
        ActiveCellColorTo = 6210033
        AutoSize = True
        CellNode.ShowTree = False
        ColumnHeaders.Strings = (
          ' '#49884#44036
          ' '#50900
          ' '#54868
          ' '#49688
          ' '#47785
          ' '#44552
          ' '#53664
          ' '#51068
          ' '#54633#44228)
        ControlLook.FixedGradientFrom = 16513526
        ControlLook.FixedGradientTo = 15260626
        ControlLook.FixedGradientHoverFrom = clGray
        ControlLook.FixedGradientHoverTo = clWhite
        ControlLook.FixedGradientDownFrom = clGray
        ControlLook.FixedGradientDownTo = clSilver
        ControlLook.ControlStyle = csClassic
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
        DefaultAlignment = taCenter
        EnhRowColMove = False
        ExcelStyleDecimalSeparator = True
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
        FixedColWidth = 67
        FixedFont.Charset = ANSI_CHARSET
        FixedFont.Color = clWindowText
        FixedFont.Height = -12
        FixedFont.Name = #44404#47548#52404
        FixedFont.Style = []
        FloatFormat = '%.2f'
        Navigation.AllowInsertRow = True
        Navigation.AllowDeleteRow = True
        Navigation.AdvanceOnEnter = True
        Navigation.AdvanceInsert = True
        Navigation.AdvanceAuto = True
        Navigation.InsertPosition = pInsertAfter
        PrintSettings.DateFormat = 'dd/mm/yyyy'
        PrintSettings.Font.Charset = DEFAULT_CHARSET
        PrintSettings.Font.Color = clWindowText
        PrintSettings.Font.Height = -11
        PrintSettings.Font.Name = 'MS Sans Serif'
        PrintSettings.Font.Style = []
        PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
        PrintSettings.FixedFont.Color = clWindowText
        PrintSettings.FixedFont.Height = -11
        PrintSettings.FixedFont.Name = 'Tahoma'
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
        PrintSettings.Borders = pbNoborder
        PrintSettings.Centered = False
        PrintSettings.PagePrefix = 'page'
        PrintSettings.PageNumSep = '/'
        RowHeaders.Strings = (
          ''
          '00 ~ 01'#49884
          '01 ~ 02'#49884
          '02 ~ 03'#49884
          '03 ~ 04'#49884
          '04 ~ 05'#49884
          '05 ~ 06'#49884
          '06 ~ 07'#49884
          '07 ~ 08'#49884
          '08 ~ 09'#49884
          '09 ~ 10'#49884
          '10 ~ 11'#49884
          '11 ~ 12'#49884
          '12 ~ 13'#49884
          '13 ~ 14'#49884
          '14 ~ 15'#49884
          '15 ~ 16'#49884
          '16 ~ 17'#49884
          '17 ~ 18'#49884
          '18 ~ 19'#49884
          '19 ~ 20'#49884
          '20 ~ 21'#49884
          '21 ~ 22'#49884
          '22 ~ 23'#49884
          '23 ~ 24'#49884
          #54633' '#44228)
        ScrollBarAlways = saBoth
        ScrollWidth = 16
        SearchFooter.Color = 16773091
        SearchFooter.ColorTo = 16765615
        SearchFooter.FindNextCaption = 'Find next'
        SearchFooter.FindPrevCaption = 'Find previous'
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
        SelectionColor = 6210033
        SortSettings.DefaultFormat = ssAutomatic
        URLColor = clBlack
        Version = '7.2.8.0'
        WordWrap = False
        ColWidths = (
          67
          30
          30
          30
          30
          30
          30
          30
          42)
        RowHeights = (
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21)
      end
      object sgcount3: TAdvStringGrid
        Left = 3
        Top = 407
        Width = 307
        Height = 158
        Cursor = crDefault
        Align = alCustom
        DefaultColWidth = 65
        DefaultRowHeight = 21
        DrawingStyle = gdsClassic
        RowCount = 26
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goColSizing, goRowSelect]
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 6
        GridLineColor = 15062992
        HoverRowCells = [hcNormal, hcSelected]
        HintColor = clYellow
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'MS Sans Serif'
        ActiveCellFont.Style = []
        ActiveCellColor = 10344697
        ActiveCellColorTo = 6210033
        AutoSize = True
        CellNode.ShowTree = False
        ColumnHeaders.Strings = (
          ' '#49884#44036
          ' 1'
          ' 2'
          ' 3'
          ' 4'
          ' 5'
          ' 6'
          ' 7'
          ' 8'
          ' 9'
          ' 10'
          ' 11'
          ' 12'
          ' 13'
          ' 14'
          ' 15'
          ' 16'
          ' 17'
          ' 18'
          ' 19'
          ' 20 '
          ' 21'
          ' 22'
          ' 23'
          ' 24'
          ' 25'
          ' 26'
          ' 27'
          ' 28'
          ' 29'
          ' 30'
          ' 31'
          ' '#54633#44228)
        ControlLook.FixedGradientFrom = 16513526
        ControlLook.FixedGradientTo = 15260626
        ControlLook.FixedGradientHoverFrom = clGray
        ControlLook.FixedGradientHoverTo = clWhite
        ControlLook.FixedGradientDownFrom = clGray
        ControlLook.FixedGradientDownTo = clSilver
        ControlLook.ControlStyle = csClassic
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
        DefaultAlignment = taCenter
        EnhRowColMove = False
        ExcelStyleDecimalSeparator = True
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
        FixedColWidth = 65
        FixedFont.Charset = ANSI_CHARSET
        FixedFont.Color = clWindowText
        FixedFont.Height = -12
        FixedFont.Name = #44404#47548#52404
        FixedFont.Style = []
        FloatFormat = '%.2f'
        Navigation.AllowInsertRow = True
        Navigation.AllowDeleteRow = True
        Navigation.AdvanceOnEnter = True
        Navigation.AdvanceInsert = True
        Navigation.AdvanceAuto = True
        Navigation.InsertPosition = pInsertAfter
        PrintSettings.DateFormat = 'dd/mm/yyyy'
        PrintSettings.Font.Charset = DEFAULT_CHARSET
        PrintSettings.Font.Color = clWindowText
        PrintSettings.Font.Height = -11
        PrintSettings.Font.Name = 'MS Sans Serif'
        PrintSettings.Font.Style = []
        PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
        PrintSettings.FixedFont.Color = clWindowText
        PrintSettings.FixedFont.Height = -11
        PrintSettings.FixedFont.Name = 'Tahoma'
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
        PrintSettings.Borders = pbNoborder
        PrintSettings.Centered = False
        PrintSettings.PagePrefix = 'page'
        PrintSettings.PageNumSep = '/'
        RowHeaders.Strings = (
          ''
          '00 ~ 01'#49884
          '01 ~ 02'#49884
          '02 ~ 03'#49884
          '03 ~ 04'#49884
          '04 ~ 05'#49884
          '05 ~ 06'#49884
          '06 ~ 07'#49884
          '07 ~ 08'#49884
          '08 ~ 09'#49884
          '09 ~ 10'#49884
          '10 ~ 11'#49884
          '11 ~ 12'#49884
          '12 ~ 13'#49884
          '13 ~ 14'#49884
          '14 ~ 15'#49884
          '15 ~ 16'#49884
          '16 ~ 17'#49884
          '17 ~ 18'#49884
          '18 ~ 19'#49884
          '19 ~ 20'#49884
          '20 ~ 21'#49884
          '21 ~ 22'#49884
          '22 ~ 23'#49884
          '23 ~ 24'#49884
          #54633' '#44228)
        ScrollBarAlways = saBoth
        ScrollWidth = 16
        SearchFooter.Color = 16773091
        SearchFooter.ColorTo = 16765615
        SearchFooter.FindNextCaption = 'Find next'
        SearchFooter.FindPrevCaption = 'Find previous'
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
        SelectionColor = 6210033
        SortSettings.DefaultFormat = ssAutomatic
        URLColor = clBlack
        Version = '7.2.8.0'
        WordWrap = False
        ColWidths = (
          65
          24
          24
          24
          24)
        RowHeights = (
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21)
      end
      object sgcount4: TAdvStringGrid
        Left = 324
        Top = 407
        Width = 307
        Height = 159
        Cursor = crDefault
        Align = alCustom
        DefaultColWidth = 65
        DefaultRowHeight = 21
        DrawingStyle = gdsClassic
        RowCount = 26
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goColSizing, goRowSelect]
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 7
        GridLineColor = 15062992
        HoverRowCells = [hcNormal, hcSelected]
        HintColor = clYellow
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'MS Sans Serif'
        ActiveCellFont.Style = []
        ActiveCellColor = 10344697
        ActiveCellColorTo = 6210033
        AutoSize = True
        CellNode.ShowTree = False
        ColumnHeaders.Strings = (
          ' '#49884#44036
          ' 1'#50900
          ' 2'#50900
          ' 3'#50900
          ' 4'#50900
          ' 5'
          ' 6'
          ' 7'
          ' 8'
          ' 9'
          ' 10'
          ' 11'
          ' 12'
          ' 13'
          ' 14'
          ' 15'
          ' 16'
          ' 17'
          ' 18'
          ' 19'
          ' 20 '
          ' 21'
          ' 22'
          ' 23'
          ' 24'
          ' 25'
          ' 26'
          ' 27'
          ' 28'
          ' 29'
          ' 30'
          ' 31'
          ' '#54633#44228)
        ControlLook.FixedGradientFrom = 16513526
        ControlLook.FixedGradientTo = 15260626
        ControlLook.FixedGradientHoverFrom = clGray
        ControlLook.FixedGradientHoverTo = clWhite
        ControlLook.FixedGradientDownFrom = clGray
        ControlLook.FixedGradientDownTo = clSilver
        ControlLook.ControlStyle = csClassic
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
        DefaultAlignment = taCenter
        EnhRowColMove = False
        ExcelStyleDecimalSeparator = True
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
        FixedColWidth = 65
        FixedFont.Charset = ANSI_CHARSET
        FixedFont.Color = clWindowText
        FixedFont.Height = -12
        FixedFont.Name = #44404#47548#52404
        FixedFont.Style = []
        FloatFormat = '%.2f'
        Navigation.AllowInsertRow = True
        Navigation.AllowDeleteRow = True
        Navigation.AdvanceOnEnter = True
        Navigation.AdvanceInsert = True
        Navigation.AdvanceAuto = True
        Navigation.InsertPosition = pInsertAfter
        PrintSettings.DateFormat = 'dd/mm/yyyy'
        PrintSettings.Font.Charset = DEFAULT_CHARSET
        PrintSettings.Font.Color = clWindowText
        PrintSettings.Font.Height = -11
        PrintSettings.Font.Name = 'MS Sans Serif'
        PrintSettings.Font.Style = []
        PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
        PrintSettings.FixedFont.Color = clWindowText
        PrintSettings.FixedFont.Height = -11
        PrintSettings.FixedFont.Name = 'Tahoma'
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
        PrintSettings.Borders = pbNoborder
        PrintSettings.Centered = False
        PrintSettings.PagePrefix = 'page'
        PrintSettings.PageNumSep = '/'
        RowHeaders.Strings = (
          ''
          '00 ~ 01'#49884
          '01 ~ 02'#49884
          '02 ~ 03'#49884
          '03 ~ 04'#49884
          '04 ~ 05'#49884
          '05 ~ 06'#49884
          '06 ~ 07'#49884
          '07 ~ 08'#49884
          '08 ~ 09'#49884
          '09 ~ 10'#49884
          '10 ~ 11'#49884
          '11 ~ 12'#49884
          '12 ~ 13'#49884
          '13 ~ 14'#49884
          '14 ~ 15'#49884
          '15 ~ 16'#49884
          '16 ~ 17'#49884
          '17 ~ 18'#49884
          '18 ~ 19'#49884
          '19 ~ 20'#49884
          '20 ~ 21'#49884
          '21 ~ 22'#49884
          '22 ~ 23'#49884
          '23 ~ 24'#49884
          #54633' '#44228)
        ScrollBarAlways = saBoth
        ScrollWidth = 16
        SearchFooter.Color = 16773091
        SearchFooter.ColorTo = 16765615
        SearchFooter.FindNextCaption = 'Find next'
        SearchFooter.FindPrevCaption = 'Find previous'
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
        SelectionColor = 6210033
        SortSettings.DefaultFormat = ssAutomatic
        URLColor = clBlack
        Version = '7.2.8.0'
        WordWrap = False
        ColWidths = (
          65
          36
          36
          36
          36)
        RowHeights = (
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21
          21)
      end
    end
  end
  object qryTemp: TADOQuery
    Connection = dmTables.ADODB
    Parameters = <>
    Left = 152
    Top = 144
  end
  object qryCount: TADOQuery
    Connection = dmTables.ADODB
    CursorType = ctStatic
    Parameters = <>
    Left = 152
    Top = 88
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Excel files (*.xls)|*.xls'
    Left = 216
    Top = 88
  end
  object eCount: TAdvGridExcelIO
    AdvStringGrid = sgCount
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
    Top = 144
  end
end
