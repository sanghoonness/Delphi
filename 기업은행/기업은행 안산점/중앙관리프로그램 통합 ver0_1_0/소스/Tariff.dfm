object frmTariff: TfrmTariff
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #51452#52264#50836#50984' '#49444#51221
  ClientHeight = 476
  ClientWidth = 697
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
  object AdvPanel1: TAdvPanel
    Left = 0
    Top = 0
    Width = 697
    Height = 185
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    UseDockManager = True
    Version = '1.9.1.0'
    Caption.Color = clHighlight
    Caption.ColorTo = clNone
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clHighlightText
    Caption.Font.Height = -11
    Caption.Font.Name = 'Tahoma'
    Caption.Font.Style = []
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clWindowText
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    FullHeight = 0
    object dgTariff: TDBAdvGrid
      Left = 2
      Top = 2
      Width = 693
      Height = 181
      Cursor = crDefault
      Align = alClient
      ColCount = 22
      RowCount = 2
      FixedRows = 1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 0
      OnClick = dgTariffClick
      ActiveCellFont.Charset = DEFAULT_CHARSET
      ActiveCellFont.Color = clWindowText
      ActiveCellFont.Height = -11
      ActiveCellFont.Name = 'Tahoma'
      ActiveCellFont.Style = [fsBold]
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
      Version = '2.1.12.7'
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
          Alignment = taCenter
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'ParkNo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = #51452#52264#51109#48264#54840
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
          Width = 68
        end
        item
          Alignment = taCenter
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'DivNo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = #51452#52264#50836#50984#48264#54840
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
          Width = 80
        end
        item
          Alignment = taCenter
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          EditLength = 50
          FieldName = 'DivName'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = #51452#52264#50836#50984#47749
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
          Width = 68
        end
        item
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          EditLength = 50
          FieldName = 'FeeName'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
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
          Width = 61
        end
        item
          Alignment = taCenter
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'HolidayChk'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = #55092#51068#44396#48516
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
          FieldName = 'CarType'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = #52264#47049#51333#47448
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
          EditLength = 5
          FieldName = 'STTime'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = #49884#51089#49884#44033
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
          EditLength = 5
          FieldName = 'Sec1Min'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = #51201#50857#49884#44036'1'
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
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'Sec1Value'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = #51201#50857#50836#44552'1'
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
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'Sec1Loop'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = #48152#48373#54943#49688'1'
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
          EditLength = 5
          FieldName = 'Sec2Min'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = #51201#50857#49884#44036'2'
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
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'Sec2Value'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = #51201#50857#50836#44552'2'
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
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'Sec2Loop'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = #48152#48373#54943#49688'2'
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
          EditLength = 5
          FieldName = 'Sec3Min'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = #51201#50857#49884#44036'3'
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
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'Sec3Value'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = #51201#50857#50836#44552'3'
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
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'Sec3Loop'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = #48152#48373#54943#49688'3'
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
          EditLength = 5
          FieldName = 'Sec4Min'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = #51201#50857#49884#44036'4'
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
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'Sec4Value'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = #51201#50857#50836#44552'4'
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
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'Sec4Loop'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = #48152#48373#54943#49688'4'
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
          EditLength = 5
          FieldName = 'Sec5Min'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = #51201#50857#49884#44036'5'
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
          Alignment = taRightJustify
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'Sec5Value'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = #51201#50857#50836#44552'5'
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
      DataSource = dsTariff
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
        68
        80
        68
        61
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64)
    end
  end
  object AdvPanel2: TAdvPanel
    Left = 0
    Top = 185
    Width = 697
    Height = 104
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    UseDockManager = True
    Version = '1.9.1.0'
    Caption.Color = clHighlight
    Caption.ColorTo = clNone
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clHighlightText
    Caption.Font.Height = -11
    Caption.Font.Name = 'Tahoma'
    Caption.Font.Style = []
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clWindowText
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    FullHeight = 0
    object edtDivName: TAdvEdit
      Left = 554
      Top = 10
      Width = 119
      Height = 20
      FocusColor = clAqua
      LabelCaption = #51452#52264#50836#50984#47749
      LabelPosition = lpLeftCenter
      LabelTransparent = True
      LabelAlwaysEnabled = True
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = #44404#47548#52404
      LabelFont.Style = []
      Lookup.Separator = ';'
      Color = clWindow
      Enabled = True
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeMode = imSHanguel
      ImeName = 'Microsoft Office IME 2007'
      MaxLength = 50
      ParentFont = False
      TabOrder = 2
      Visible = True
      Version = '2.8.5.3'
    end
    object edtDivNo: TAdvSpinEdit
      Left = 322
      Top = 10
      Width = 119
      Height = 19
      Value = 0
      DateValue = 41013.947172488430000000
      HexValue = 0
      Enabled = True
      FocusColor = clAqua
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = #44404#47548#52404
      Font.Style = []
      IncrementFloat = 0.100000000000000000
      IncrementFloatPage = 1.000000000000000000
      LabelAlwaysEnabled = True
      LabelCaption = #51452#52264#50836#50984#48264#54840
      LabelPosition = lpLeftCenter
      LabelTransparent = True
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = #44404#47548#52404
      LabelFont.Style = []
      MaxValue = 255
      ParentFont = False
      TabOrder = 1
      Visible = True
      Version = '1.4.5.2'
    end
    object cmbFeeItem: TAdvComboBox
      Left = 82
      Top = 42
      Width = 119
      Height = 20
      Color = clWindow
      Version = '1.3.1.0'
      Visible = True
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
      LabelCaption = #50836#44552#51333#47448
      LabelPosition = lpLeftCenter
      LabelTransparent = True
      LabelAlwaysEnabled = True
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = #44404#47548#52404
      LabelFont.Style = []
      ParentFont = False
      TabOrder = 3
      OnChange = cmbFeeItemChange
    end
    object cmbCarType: TAdvComboBox
      Left = 322
      Top = 42
      Width = 119
      Height = 20
      Color = clWindow
      Version = '1.3.1.0'
      Visible = True
      FocusColor = clAqua
      DropWidth = 0
      Enabled = True
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeName = 'Microsoft Office IME 2007'
      ItemIndex = 1
      Items.Strings = (
        #44221#52264
        #49548#54805
        #51473#54805
        #45824#54805)
      LabelCaption = #52264#47049#51333#47448
      LabelPosition = lpLeftCenter
      LabelTransparent = True
      LabelAlwaysEnabled = True
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = #44404#47548#52404
      LabelFont.Style = []
      ParentFont = False
      TabOrder = 4
      Text = #49548#54805
    end
    object cmbHolidayChk: TAdvComboBox
      Left = 554
      Top = 42
      Width = 119
      Height = 20
      Color = clWindow
      Version = '1.3.1.0'
      Visible = True
      FocusColor = clAqua
      DropWidth = 0
      Enabled = True
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeName = 'Microsoft Office IME 2007'
      ItemIndex = 0
      Items.Strings = (
        #54217#51068
        #53664#50836#51068
        #55092#51068)
      LabelCaption = #55092#51068#50668#48512
      LabelPosition = lpLeftCenter
      LabelTransparent = True
      LabelAlwaysEnabled = True
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = #44404#47548#52404
      LabelFont.Style = []
      ParentFont = False
      TabOrder = 5
      Text = #54217#51068
    end
    object edtSTTime: TAdvMaskEdit
      Left = 82
      Top = 74
      Width = 119
      Height = 20
      Color = clWindow
      Enabled = True
      EditMask = '!90:00;1;_'
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeName = 'Microsoft Office IME 2007'
      MaxLength = 5
      ParentFont = False
      TabOrder = 6
      Text = '  :  '
      Visible = True
      AutoFocus = False
      Flat = False
      FlatLineColor = clBlack
      FlatParentColor = True
      ShowModified = False
      FocusColor = clAqua
      FocusBorder = False
      FocusFontColor = clBlack
      LabelCaption = #49884#51089#49884#44033
      LabelAlwaysEnabled = True
      LabelPosition = lpLeftCenter
      LabelMargin = 4
      LabelTransparent = True
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = #44404#47548#52404
      LabelFont.Style = []
      ModifiedColor = clRed
      SelectFirstChar = False
      Version = '2.8.5.3'
    end
    object cmbParkNo: TAdvComboBox
      Left = 82
      Top = 10
      Width = 121
      Height = 20
      Color = clWindow
      Version = '1.3.1.0'
      Visible = True
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
      TabOrder = 0
      OnChange = cmbParkNoChange
    end
  end
  object AdvPanel3: TAdvPanel
    Left = 0
    Top = 289
    Width = 697
    Height = 126
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 2
    UseDockManager = True
    Version = '1.9.1.0'
    Caption.Color = clHighlight
    Caption.ColorTo = clNone
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clHighlightText
    Caption.Font.Height = -11
    Caption.Font.Name = 'Tahoma'
    Caption.Font.Style = []
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clWindowText
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    FullHeight = 0
    object Label1: TLabel
      Left = 80
      Top = 14
      Width = 51
      Height = 12
      Alignment = taCenter
      AutoSize = False
      Caption = #51201#50857#49884#44036
      Transparent = True
      Layout = tlCenter
    end
    object Label2: TLabel
      Left = 35
      Top = 36
      Width = 51
      Height = 12
      Alignment = taCenter
      AutoSize = False
      Caption = 'STEP 1'
      Transparent = True
      Layout = tlCenter
    end
    object Label3: TLabel
      Left = 35
      Top = 64
      Width = 51
      Height = 12
      Alignment = taCenter
      AutoSize = False
      Caption = 'STEP 3'
      Transparent = True
      Layout = tlCenter
    end
    object Label4: TLabel
      Left = 35
      Top = 92
      Width = 51
      Height = 12
      Alignment = taCenter
      AutoSize = False
      Caption = 'STEP 5'
      Transparent = True
      Layout = tlCenter
    end
    object Label5: TLabel
      Left = 152
      Top = 14
      Width = 51
      Height = 12
      Alignment = taCenter
      AutoSize = False
      Caption = #51201#50857#50836#44552
      Transparent = True
      Layout = tlCenter
    end
    object Label6: TLabel
      Left = 234
      Top = 14
      Width = 51
      Height = 12
      Alignment = taCenter
      AutoSize = False
      Caption = #51201#50857#54924#49688
      Transparent = True
      Layout = tlCenter
    end
    object Label7: TLabel
      Left = 456
      Top = 14
      Width = 51
      Height = 12
      Alignment = taCenter
      AutoSize = False
      Caption = #51201#50857#49884#44036
      Transparent = True
      Layout = tlCenter
    end
    object Label8: TLabel
      Left = 528
      Top = 14
      Width = 51
      Height = 12
      Alignment = taCenter
      AutoSize = False
      Caption = #51201#50857#50836#44552
      Transparent = True
      Layout = tlCenter
    end
    object Label9: TLabel
      Left = 610
      Top = 14
      Width = 51
      Height = 12
      Alignment = taCenter
      AutoSize = False
      Caption = #51201#50857#54924#49688
      Transparent = True
      Layout = tlCenter
    end
    object Label10: TLabel
      Left = 411
      Top = 36
      Width = 51
      Height = 12
      Alignment = taCenter
      AutoSize = False
      Caption = 'STEP 2'
      Transparent = True
      Layout = tlCenter
    end
    object Label11: TLabel
      Left = 411
      Top = 64
      Width = 51
      Height = 12
      Alignment = taCenter
      AutoSize = False
      Caption = 'STEP 4'
      Transparent = True
      Layout = tlCenter
    end
    object edt12: TAdvMaskEdit
      Left = 88
      Top = 32
      Width = 41
      Height = 21
      Color = clWindow
      Enabled = True
      EditMask = '!99:99;1;_'
      ImeName = 'Microsoft Office IME 2007'
      MaxLength = 5
      TabOrder = 0
      Text = '  :  '
      Visible = True
      AutoFocus = False
      Flat = False
      FlatLineColor = clBlack
      FlatParentColor = True
      ShowModified = False
      FocusColor = clAqua
      FocusBorder = False
      FocusFontColor = clBlack
      LabelAlwaysEnabled = True
      LabelPosition = lpLeftTopLeft
      LabelMargin = 4
      LabelTransparent = True
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = #44404#47548#52404
      LabelFont.Style = []
      ModifiedColor = clRed
      SelectFirstChar = False
      Version = '2.8.5.3'
    end
    object edt22: TAdvMaskEdit
      Left = 464
      Top = 32
      Width = 41
      Height = 21
      Color = clWindow
      Enabled = True
      EditMask = '!99:99;1;_'
      ImeName = 'Microsoft Office IME 2007'
      MaxLength = 5
      TabOrder = 3
      Text = '  :  '
      Visible = True
      AutoFocus = False
      Flat = False
      FlatLineColor = clBlack
      FlatParentColor = True
      ShowModified = False
      FocusColor = clAqua
      FocusBorder = False
      FocusFontColor = clBlack
      LabelAlwaysEnabled = True
      LabelPosition = lpLeftTopLeft
      LabelMargin = 4
      LabelTransparent = True
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = #44404#47548#52404
      LabelFont.Style = []
      ModifiedColor = clRed
      SelectFirstChar = False
      Version = '2.8.5.3'
    end
    object edt32: TAdvMaskEdit
      Left = 88
      Top = 60
      Width = 41
      Height = 21
      Color = clWindow
      Enabled = True
      EditMask = '!99:99;1;_'
      ImeName = 'Microsoft Office IME 2007'
      MaxLength = 5
      TabOrder = 6
      Text = '  :  '
      Visible = True
      AutoFocus = False
      Flat = False
      FlatLineColor = clBlack
      FlatParentColor = True
      ShowModified = False
      FocusColor = clAqua
      FocusBorder = False
      FocusFontColor = clBlack
      LabelAlwaysEnabled = True
      LabelPosition = lpLeftTopLeft
      LabelMargin = 4
      LabelTransparent = True
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = #44404#47548#52404
      LabelFont.Style = []
      ModifiedColor = clRed
      SelectFirstChar = False
      Version = '2.8.5.3'
    end
    object edt42: TAdvMaskEdit
      Left = 464
      Top = 60
      Width = 41
      Height = 21
      Color = clWindow
      Enabled = True
      EditMask = '!99:99;1;_'
      ImeName = 'Microsoft Office IME 2007'
      MaxLength = 5
      TabOrder = 9
      Text = '  :  '
      Visible = True
      AutoFocus = False
      Flat = False
      FlatLineColor = clBlack
      FlatParentColor = True
      ShowModified = False
      FocusColor = clAqua
      FocusBorder = False
      FocusFontColor = clBlack
      LabelAlwaysEnabled = True
      LabelPosition = lpLeftTopLeft
      LabelMargin = 4
      LabelTransparent = True
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = #44404#47548#52404
      LabelFont.Style = []
      ModifiedColor = clRed
      SelectFirstChar = False
      Version = '2.8.5.3'
    end
    object edt52: TAdvMaskEdit
      Left = 88
      Top = 88
      Width = 41
      Height = 21
      Color = clWindow
      Enabled = True
      EditMask = '!99:99;1;_'
      ImeName = 'Microsoft Office IME 2007'
      MaxLength = 5
      TabOrder = 12
      Text = '  :  '
      Visible = True
      AutoFocus = False
      Flat = False
      FlatLineColor = clBlack
      FlatParentColor = True
      ShowModified = False
      FocusColor = clAqua
      FocusBorder = False
      FocusFontColor = clBlack
      LabelAlwaysEnabled = True
      LabelPosition = lpLeftTopLeft
      LabelMargin = 4
      LabelTransparent = True
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = #44404#47548#52404
      LabelFont.Style = []
      ModifiedColor = clRed
      SelectFirstChar = False
      Version = '2.8.5.3'
    end
    object edt13: TAdvSpinEdit
      Left = 147
      Top = 32
      Width = 66
      Height = 22
      Value = 0
      DateValue = 41013.947172488430000000
      HexValue = 0
      Enabled = True
      FocusColor = clAqua
      IncrementFloat = 0.100000000000000000
      IncrementFloatPage = 1.000000000000000000
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'MS Sans Serif'
      LabelFont.Style = []
      TabOrder = 1
      Visible = True
      Version = '1.4.5.2'
    end
    object edt14: TAdvSpinEdit
      Left = 229
      Top = 32
      Width = 66
      Height = 22
      Value = 0
      DateValue = 41013.947172488430000000
      HexValue = 0
      Enabled = True
      FocusColor = clAqua
      IncrementFloat = 0.100000000000000000
      IncrementFloatPage = 1.000000000000000000
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'MS Sans Serif'
      LabelFont.Style = []
      TabOrder = 2
      Visible = True
      Version = '1.4.5.2'
    end
    object edt23: TAdvSpinEdit
      Left = 523
      Top = 32
      Width = 66
      Height = 22
      Value = 0
      DateValue = 41013.947172488430000000
      HexValue = 0
      Enabled = True
      FocusColor = clAqua
      IncrementFloat = 0.100000000000000000
      IncrementFloatPage = 1.000000000000000000
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'MS Sans Serif'
      LabelFont.Style = []
      TabOrder = 4
      Visible = True
      Version = '1.4.5.2'
    end
    object edt24: TAdvSpinEdit
      Left = 605
      Top = 32
      Width = 66
      Height = 22
      Value = 0
      DateValue = 41013.947172488430000000
      HexValue = 0
      Enabled = True
      FocusColor = clAqua
      IncrementFloat = 0.100000000000000000
      IncrementFloatPage = 1.000000000000000000
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'MS Sans Serif'
      LabelFont.Style = []
      TabOrder = 5
      Visible = True
      Version = '1.4.5.2'
    end
    object edt33: TAdvSpinEdit
      Left = 147
      Top = 60
      Width = 66
      Height = 22
      Value = 0
      DateValue = 41013.947172488430000000
      HexValue = 0
      Enabled = True
      FocusColor = clAqua
      IncrementFloat = 0.100000000000000000
      IncrementFloatPage = 1.000000000000000000
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'MS Sans Serif'
      LabelFont.Style = []
      TabOrder = 7
      Visible = True
      Version = '1.4.5.2'
    end
    object edt34: TAdvSpinEdit
      Left = 229
      Top = 60
      Width = 66
      Height = 22
      Value = 0
      DateValue = 41013.947172488430000000
      HexValue = 0
      Enabled = True
      FocusColor = clAqua
      IncrementFloat = 0.100000000000000000
      IncrementFloatPage = 1.000000000000000000
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'MS Sans Serif'
      LabelFont.Style = []
      TabOrder = 8
      Visible = True
      Version = '1.4.5.2'
    end
    object edt43: TAdvSpinEdit
      Left = 523
      Top = 60
      Width = 66
      Height = 22
      Value = 0
      DateValue = 41013.947172488430000000
      HexValue = 0
      Enabled = True
      FocusColor = clAqua
      IncrementFloat = 0.100000000000000000
      IncrementFloatPage = 1.000000000000000000
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'MS Sans Serif'
      LabelFont.Style = []
      TabOrder = 10
      Visible = True
      Version = '1.4.5.2'
    end
    object edt44: TAdvSpinEdit
      Left = 605
      Top = 60
      Width = 66
      Height = 22
      Value = 0
      DateValue = 41013.947172488430000000
      HexValue = 0
      Enabled = True
      FocusColor = clAqua
      IncrementFloat = 0.100000000000000000
      IncrementFloatPage = 1.000000000000000000
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'MS Sans Serif'
      LabelFont.Style = []
      TabOrder = 11
      Visible = True
      Version = '1.4.5.2'
    end
    object edt53: TAdvSpinEdit
      Left = 147
      Top = 88
      Width = 66
      Height = 22
      Value = 0
      DateValue = 41013.947172488430000000
      HexValue = 0
      Enabled = True
      FocusColor = clAqua
      IncrementFloat = 0.100000000000000000
      IncrementFloatPage = 1.000000000000000000
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'MS Sans Serif'
      LabelFont.Style = []
      TabOrder = 13
      Visible = True
      Version = '1.4.5.2'
    end
  end
  object btnSave: TBitBtn
    Left = 248
    Top = 428
    Width = 97
    Height = 35
    Caption = #51200'  '#51109
    DoubleBuffered = True
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
    ParentDoubleBuffered = False
    TabOrder = 3
    OnClick = btnSaveClick
  end
  object btnCancel: TBitBtn
    Left = 360
    Top = 428
    Width = 97
    Height = 35
    Caption = #52712'  '#49548
    DoubleBuffered = True
    Enabled = False
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
    ParentDoubleBuffered = False
    TabOrder = 4
    OnClick = btnCancelClick
  end
  object btnDelete: TBitBtn
    Left = 472
    Top = 428
    Width = 97
    Height = 35
    Caption = #49325'  '#51228
    DoubleBuffered = True
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
    ParentDoubleBuffered = False
    TabOrder = 5
    OnClick = btnDeleteClick
  end
  object btnClose: TBitBtn
    Left = 584
    Top = 428
    Width = 97
    Height = 35
    Caption = #51333'  '#47308
    DoubleBuffered = True
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
    ParentDoubleBuffered = False
    TabOrder = 6
    OnClick = btnCloseClick
  end
  object qryFeeItem: TADOQuery
    Active = True
    Connection = dmTables.ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from FeeItem')
    Left = 88
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
  object qryTariff: TADOQuery
    Connection = dmTables.ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Tariff')
    Left = 144
    Top = 104
    object qryTariffParkNo: TSmallintField
      FieldName = 'ParkNo'
    end
    object qryTariffDivNo: TWordField
      FieldName = 'DivNo'
    end
    object qryTariffFeeNo: TWordField
      FieldName = 'FeeNo'
    end
    object qryTariffFeeName: TStringField
      FieldKind = fkLookup
      FieldName = 'FeeName'
      LookupDataSet = qryFeeItem
      LookupKeyFields = 'FeeNo'
      LookupResultField = 'FeeName'
      KeyFields = 'FeeNo'
      OnGetText = qryTariffFeeNameGetText
      Size = 50
      Lookup = True
    end
    object qryTariffHolidayChk: TWordField
      FieldName = 'HolidayChk'
      OnGetText = qryTariffHolidayChkGetText
    end
    object qryTariffCarTypeNo: TWordField
      FieldName = 'CarType'
      OnGetText = qryTariffCarTypeNoGetText
    end
    object qryTariffDivName: TStringField
      FieldName = 'DivName'
      Size = 50
    end
    object qryTariffSTTime: TStringField
      FieldName = 'STTime'
      FixedChar = True
      Size = 5
    end
    object qryTariffSec1Min: TStringField
      FieldName = 'Sec1Min'
      FixedChar = True
      Size = 5
    end
    object qryTariffSec1Value: TIntegerField
      FieldName = 'Sec1Value'
    end
    object qryTariffSec1Loop: TWordField
      FieldName = 'Sec1Loop'
    end
    object qryTariffSec2Min: TStringField
      FieldName = 'Sec2Min'
      FixedChar = True
      Size = 5
    end
    object qryTariffSec2Value: TIntegerField
      FieldName = 'Sec2Value'
    end
    object qryTariffSec2Loop: TWordField
      FieldName = 'Sec2Loop'
    end
    object qryTariffSec3Min: TStringField
      FieldName = 'Sec3Min'
      FixedChar = True
      Size = 5
    end
    object qryTariffSec3Value: TIntegerField
      FieldName = 'Sec3Value'
    end
    object qryTariffSec3Loop: TWordField
      FieldName = 'Sec3Loop'
    end
    object qryTariffSec4Min: TStringField
      FieldName = 'Sec4Min'
      FixedChar = True
      Size = 5
    end
    object qryTariffSec4Value: TIntegerField
      FieldName = 'Sec4Value'
    end
    object qryTariffSec4Loop: TWordField
      FieldName = 'Sec4Loop'
    end
    object qryTariffSec5Min: TStringField
      FieldName = 'Sec5Min'
      FixedChar = True
      Size = 5
    end
    object qryTariffSec5Value: TIntegerField
      FieldName = 'Sec5Value'
    end
    object qryTariffReserve1: TStringField
      FieldName = 'Reserve1'
      Size = 50
    end
    object qryTariffReserve2: TStringField
      FieldName = 'Reserve2'
      Size = 50
    end
    object qryTariffReserve3: TStringField
      FieldName = 'Reserve3'
      Size = 50
    end
    object qryTariffReserve4: TStringField
      FieldName = 'Reserve4'
      Size = 50
    end
    object qryTariffReserve5: TStringField
      FieldName = 'Reserve5'
      Size = 50
    end
  end
  object dsTariff: TDataSource
    DataSet = qryTariff
    Left = 144
    Top = 152
  end
  object qryTemp: TADOQuery
    Connection = dmTables.ADODB
    Parameters = <>
    Left = 88
    Top = 152
  end
end
