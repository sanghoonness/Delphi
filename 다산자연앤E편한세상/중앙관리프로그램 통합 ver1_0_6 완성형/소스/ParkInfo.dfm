object frmParkInfo: TfrmParkInfo
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #51452#52264#51109' '#49444#51221
  ClientHeight = 391
  ClientWidth = 1164
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
    Width = 1164
    Height = 201
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    UseDockManager = True
    Version = '2.3.0.0'
    Caption.Color = clHighlight
    Caption.ColorTo = clNone
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clWindowText
    Caption.Font.Height = -11
    Caption.Font.Name = 'Tahoma'
    Caption.Font.Style = []
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clWindowText
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    Text = ''
    FullHeight = 0
    object dgParkInfo: TDBAdvGrid
      Left = 2
      Top = 2
      Width = 1160
      Height = 197
      Cursor = crDefault
      Align = alClient
      ColCount = 11
      DrawingStyle = gdsClassic
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
      OnClick = dgParkInfoClick
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
          Width = 78
        end
        item
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          EditLength = 100
          FieldName = 'ParkName'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = #51452#52264#51109#47749
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
          Width = 100
        end
        item
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          EditLength = 50
          FieldName = 'Admin'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = #45824#54364#51088
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
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          EditLength = 20
          FieldName = 'RegNo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = #49324#50629#51088#46321#47197#48264#54840
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
          Width = 100
        end
        item
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          EditLength = 20
          FieldName = 'Telephone'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = #51204#54868#48264#54840
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
          Width = 100
        end
        item
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          EditLength = 100
          FieldName = 'ParkAddr'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = #51452#49548
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
          Width = 231
        end
        item
          Alignment = taCenter
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'AvailablePoint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = #44032#50857' '#54252#51064#53944
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          Name = 'AvailablePoint'
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
          FieldName = 'UsedPoint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = #49324#50857' '#54252#51064#53944
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Style = []
          HeaderAlignment = taCenter
          Name = 'UsedPoint'
          PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
          PrintFont.Charset = DEFAULT_CHARSET
          PrintFont.Color = clWindowText
          PrintFont.Height = -11
          PrintFont.Name = 'Tahoma'
          PrintFont.Style = []
          Width = 0
        end
        item
          Alignment = taCenter
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'PointDate'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = #54252#51064#53944#52649#51204#45216#51676
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
          Width = 85
        end
        item
          Alignment = taCenter
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          FieldName = 'PointMonth'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = #44060#50900
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
      DataSource = dsParkInfo
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
        78
        100
        80
        100
        100
        231
        64
        0
        85
        64)
    end
  end
  object AdvPanel2: TAdvPanel
    Left = 0
    Top = 201
    Width = 1164
    Height = 136
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    UseDockManager = True
    Version = '2.3.0.0'
    Caption.Color = clHighlight
    Caption.ColorTo = clNone
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clWindowText
    Caption.Font.Height = -11
    Caption.Font.Name = 'Tahoma'
    Caption.Font.Style = []
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clWindowText
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    Text = ''
    FullHeight = 0
    object Label1: TLabel
      Left = 921
      Top = 109
      Width = 4
      Height = 13
      Caption = '/'
    end
    object LabelPoint: TLabel
      Left = 798
      Top = 74
      Width = 113
      Height = 15
      AutoSize = False
      Caption = #54252#51064#53944' '#49884#44036
    end
    object edtParkNo: TAdvSpinEdit
      Left = 122
      Top = 15
      Width = 120
      Height = 22
      Value = 0
      DateValue = 41265.649598877320000000
      HexValue = 0
      FocusColor = clAqua
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      IncrementFloat = 0.100000000000000000
      IncrementFloatPage = 1.000000000000000000
      LabelAlwaysEnabled = True
      LabelCaption = #51452#52264#51109#48264#54840
      LabelPosition = lpLeftCenter
      LabelTransparent = True
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      MaxValue = 255
      ParentFont = False
      TabOrder = 0
      Visible = True
      Version = '1.6.0.0'
    end
    object edtParkName: TAdvEdit
      Left = 360
      Top = 16
      Width = 120
      Height = 21
      EmptyTextStyle = []
      FocusColor = clAqua
      LabelCaption = #51452#52264#51109#47749
      LabelPosition = lpLeftCenter
      LabelTransparent = True
      LabelAlwaysEnabled = True
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = 'Tahoma'
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
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImeMode = imSHanguel
      ImeName = 'Microsoft IME 2010'
      MaxLength = 100
      ParentFont = False
      TabOrder = 1
      Text = ''
      Visible = True
      Version = '3.3.2.0'
    end
    object edtAdmin: TAdvEdit
      Left = 594
      Top = 16
      Width = 120
      Height = 21
      EmptyTextStyle = []
      FocusColor = clAqua
      LabelCaption = #45824' '#54364' '#51088
      LabelPosition = lpLeftCenter
      LabelTransparent = True
      LabelAlwaysEnabled = True
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = 'Tahoma'
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
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImeMode = imSHanguel
      ImeName = 'Microsoft IME 2010'
      MaxLength = 50
      ParentFont = False
      TabOrder = 2
      Text = ''
      Visible = True
      Version = '3.3.2.0'
    end
    object edtRegNo: TAdvEdit
      Left = 122
      Top = 46
      Width = 120
      Height = 21
      EmptyTextStyle = []
      FocusColor = clAqua
      LabelCaption = #49324#50629#51088#46321#47197#48264#54840
      LabelPosition = lpLeftCenter
      LabelTransparent = True
      LabelAlwaysEnabled = True
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = 'Tahoma'
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
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImeMode = imSHanguel
      ImeName = 'Microsoft IME 2010'
      MaxLength = 20
      ParentFont = False
      TabOrder = 3
      Text = ''
      Visible = True
      Version = '3.3.2.0'
    end
    object edtTelephone: TAdvEdit
      Left = 360
      Top = 46
      Width = 120
      Height = 21
      EmptyTextStyle = []
      FocusColor = clAqua
      LabelCaption = #51204#54868#48264#54840
      LabelPosition = lpLeftCenter
      LabelTransparent = True
      LabelAlwaysEnabled = True
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = 'Tahoma'
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
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImeMode = imSHanguel
      ImeName = 'Microsoft IME 2010'
      MaxLength = 20
      ParentFont = False
      TabOrder = 4
      Text = ''
      Visible = True
      Version = '3.3.2.0'
    end
    object edtReceipt: TAdvEdit
      Left = 360
      Top = 137
      Width = 354
      Height = 21
      EmptyTextStyle = []
      FocusColor = clAqua
      LabelCaption = #50689#49688#51613#51064#49604#47928#44396
      LabelPosition = lpLeftCenter
      LabelTransparent = True
      LabelAlwaysEnabled = True
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = 'Tahoma'
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
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImeMode = imSHanguel
      ImeName = 'Microsoft Office IME 2007'
      MaxLength = 100
      ParentFont = False
      TabOrder = 6
      Text = ''
      Visible = False
      Version = '3.3.2.0'
    end
    object edtParkAddr: TAdvEdit
      Left = 122
      Top = 76
      Width = 592
      Height = 21
      EmptyTextStyle = []
      FocusColor = clAqua
      LabelCaption = #51452#49548
      LabelPosition = lpLeftCenter
      LabelTransparent = True
      LabelAlwaysEnabled = True
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = 'Tahoma'
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
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImeMode = imSHanguel
      ImeName = 'Microsoft IME 2010'
      MaxLength = 100
      ParentFont = False
      TabOrder = 5
      Text = ''
      Visible = True
      Version = '3.3.2.0'
    end
    object cmbCalcType: TAdvComboBox
      Left = 594
      Top = 162
      Width = 120
      Height = 21
      Color = clWindow
      Version = '1.5.1.0'
      Visible = False
      EmptyTextStyle = []
      FocusColor = clAqua
      DropWidth = 0
      Enabled = True
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImeName = 'Microsoft Office IME 2007'
      ItemIndex = 0
      Items.Strings = (
        '24'#49884' '#44592#51456
        #51077#52264#54980' 24'#49884#44036)
      LabelCaption = '1'#51068#44592#51456
      LabelPosition = lpLeftCenter
      LabelTransparent = True
      LabelAlwaysEnabled = True
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      ParentFont = False
      TabOrder = 9
      Text = '24'#49884' '#44592#51456
    end
    object cmbHolidayProc: TAdvComboBox
      Left = 122
      Top = 192
      Width = 120
      Height = 21
      Color = clWindow
      Version = '1.5.1.0'
      Visible = False
      EmptyTextStyle = []
      FocusColor = clAqua
      DropWidth = 0
      Enabled = True
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImeName = 'Microsoft Office IME 2007'
      ItemIndex = 0
      Items.Strings = (
        #52376#47532#50504#54632
        #52376#47532#54632)
      LabelCaption = #55092#51068#52376#47532#50668#48512
      LabelPosition = lpLeftCenter
      LabelTransparent = True
      LabelAlwaysEnabled = True
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      ParentFont = False
      TabOrder = 10
      Text = #52376#47532#50504#54632
    end
    object cmbAutoClosing: TAdvComboBox
      Left = 594
      Top = 192
      Width = 120
      Height = 21
      Color = clWindow
      Version = '1.5.1.0'
      Visible = False
      EmptyTextStyle = []
      FocusColor = clAqua
      DropWidth = 0
      Enabled = True
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImeName = 'Microsoft Office IME 2007'
      ItemIndex = 0
      Items.Strings = (
        #49324#50857#50504#54632
        #51088#46041#47560#44048)
      LabelCaption = #51088#46041#47560#44048
      LabelPosition = lpLeftCenter
      LabelTransparent = True
      LabelAlwaysEnabled = True
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      ParentFont = False
      TabOrder = 12
      Text = #49324#50857#50504#54632
    end
    object edtClosingTime: TAdvMaskEdit
      Left = 360
      Top = 192
      Width = 120
      Height = 21
      Color = clWindow
      Enabled = True
      EditMask = '!90:00;1;_'
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImeName = 'Microsoft Office IME 2007'
      MaxLength = 5
      ParentFont = False
      TabOrder = 11
      Text = '  :  '
      Visible = False
      AutoFocus = False
      Flat = False
      FlatLineColor = clBlack
      FlatParentColor = True
      ShowModified = False
      FocusColor = clAqua
      FocusBorder = False
      FocusFontColor = clBlack
      LabelCaption = #47560#44048#44592#51456#49884#44033
      LabelAlwaysEnabled = True
      LabelPosition = lpLeftCenter
      LabelMargin = 4
      LabelTransparent = True
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      ModifiedColor = clRed
      SelectFirstChar = False
      Version = '3.3.2.0'
    end
    object cmbReceipt: TAdvComboBox
      Left = 122
      Top = 221
      Width = 120
      Height = 21
      Color = clWindow
      Version = '1.5.1.0'
      Visible = False
      EmptyTextStyle = []
      FocusColor = clAqua
      DropWidth = 0
      Enabled = True
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImeName = 'Microsoft Office IME 2007'
      ItemIndex = 0
      Items.Strings = (
        #49688#46041#48156#44553
        #51088#46041#48156#44553)
      LabelCaption = #50689#49688#51613#48156#44553
      LabelPosition = lpLeftCenter
      LabelTransparent = True
      LabelAlwaysEnabled = True
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      ParentFont = False
      TabOrder = 13
      Text = #49688#46041#48156#44553
    end
    object cmbZeroReceipt: TAdvComboBox
      Left = 360
      Top = 221
      Width = 120
      Height = 21
      Color = clWindow
      Version = '1.5.1.0'
      Visible = False
      EmptyTextStyle = []
      FocusColor = clAqua
      DropWidth = 0
      Enabled = True
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImeName = 'Microsoft Office IME 2007'
      ItemIndex = 0
      Items.Strings = (
        #48156#44553#50504#54632
        #48156#44553#44032#45733)
      LabelCaption = '0'#50896#50689#49688#51613#48156#44553
      LabelPosition = lpLeftCenter
      LabelTransparent = True
      LabelAlwaysEnabled = True
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      ParentFont = False
      TabOrder = 14
      Text = #48156#44553#50504#54632
    end
    object cmbTax: TAdvComboBox
      Left = 594
      Top = 221
      Width = 120
      Height = 21
      Color = clWindow
      Version = '1.5.1.0'
      Visible = False
      EmptyTextStyle = []
      FocusColor = clAqua
      DropWidth = 0
      Enabled = True
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImeName = 'Microsoft Office IME 2007'
      ItemIndex = 0
      Items.Strings = (
        #48512#44032#49464#54252#54632
        #48512#44032#49464#48324#46020)
      LabelCaption = #48512#44032#49464
      LabelPosition = lpLeftCenter
      LabelTransparent = True
      LabelAlwaysEnabled = True
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      ParentFont = False
      TabOrder = 15
      Text = #48512#44032#49464#54252#54632
    end
    object cmbJunk: TAdvComboBox
      Left = 122
      Top = 251
      Width = 120
      Height = 21
      Color = clWindow
      Version = '1.5.1.0'
      Visible = False
      EmptyTextStyle = []
      FocusColor = clAqua
      DropWidth = 0
      Enabled = True
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImeName = 'Microsoft Office IME 2007'
      ItemIndex = 0
      Items.Strings = (
        #51208#49324#50630#51020
        #50896#45800#50948#51208#49324
        '10'#50896#45800#50948#51208#49324
        '100'#50896#45800#50948#51208#49324
        '500'#50896#45800#50948#51208#49324
        '1000'#50896#45800#50948#51208#49324)
      LabelCaption = #51208#49324#52376#47532
      LabelPosition = lpLeftCenter
      LabelTransparent = True
      LabelAlwaysEnabled = True
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      ParentFont = False
      TabOrder = 16
      Text = #51208#49324#50630#51020
    end
    object cmbRound: TAdvComboBox
      Left = 360
      Top = 251
      Width = 120
      Height = 21
      Color = clWindow
      Version = '1.5.1.0'
      Visible = False
      EmptyTextStyle = []
      FocusColor = clAqua
      DropWidth = 0
      Enabled = True
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImeName = 'Microsoft Office IME 2007'
      ItemIndex = 0
      Items.Strings = (
        #51208#49324
        #51208#49345
        #48152#50732#47548)
      LabelCaption = #48152#50732#47548#48169#49885
      LabelPosition = lpLeftCenter
      LabelTransparent = True
      LabelAlwaysEnabled = True
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      ParentFont = False
      TabOrder = 17
      Text = #51208#49324
    end
    object cmbTimeDC: TAdvComboBox
      Left = 594
      Top = 251
      Width = 120
      Height = 21
      Color = clWindow
      Version = '1.5.1.0'
      Visible = False
      EmptyTextStyle = []
      FocusColor = clAqua
      DropWidth = 0
      Enabled = True
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImeName = 'Microsoft Office IME 2007'
      ItemIndex = 1
      Items.Strings = (
        #51077#52264#49884#44033#44592#51456
        #52636#52264#49884#44033#44592#51456)
      LabelCaption = #49884#44036#54624#51064
      LabelPosition = lpLeftCenter
      LabelTransparent = True
      LabelAlwaysEnabled = True
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      ParentFont = False
      TabOrder = 18
      Text = #52636#52264#49884#44033#44592#51456
    end
    object cmbDCReason: TAdvComboBox
      Left = 122
      Top = 280
      Width = 120
      Height = 21
      Color = clWindow
      Version = '1.5.1.0'
      Visible = False
      EmptyTextStyle = []
      FocusColor = clAqua
      DropWidth = 0
      Enabled = True
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImeName = 'Microsoft Office IME 2007'
      ItemIndex = 0
      Items.Strings = (
        #44592#51116#50504#54632
        #49324#50976#44592#51116)
      LabelCaption = #54624#51064#49324#50976
      LabelPosition = lpLeftCenter
      LabelTransparent = True
      LabelAlwaysEnabled = True
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      ParentFont = False
      TabOrder = 19
      Text = #44592#51116#50504#54632
    end
    object cmbLostCalc: TAdvComboBox
      Left = 360
      Top = 280
      Width = 120
      Height = 21
      Color = clWindow
      Version = '1.5.1.0'
      Visible = False
      EmptyTextStyle = []
      FocusColor = clAqua
      DropWidth = 0
      Enabled = True
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImeName = 'Microsoft Office IME 2007'
      ItemIndex = 1
      Items.Strings = (
        #44256#51221#50836#44552
        #51077#52264#49884#44033#51077#47141)
      LabelCaption = #48516#49892#52376#47532
      LabelPosition = lpLeftCenter
      LabelTransparent = True
      LabelAlwaysEnabled = True
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      ParentFont = False
      TabOrder = 20
      Text = #51077#52264#49884#44033#51077#47141
    end
    object cmbSpecialTariff: TAdvComboBox
      Left = 122
      Top = 310
      Width = 120
      Height = 21
      Color = clWindow
      Version = '1.5.1.0'
      Visible = False
      EmptyTextStyle = []
      FocusColor = clAqua
      DropWidth = 0
      Enabled = True
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImeName = 'Microsoft Office IME 2007'
      ItemIndex = 0
      Items.Strings = (
        #49324#50857#50504#54632
        #49324#50857#54632)
      LabelCaption = #53945#51221#51068#51088#51648#51221#50836#50984
      LabelPosition = lpLeftCenter
      LabelTransparent = True
      LabelAlwaysEnabled = True
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      ParentFont = False
      TabOrder = 22
      Text = #49324#50857#50504#54632
    end
    object cmbCommercialCar: TAdvComboBox
      Left = 360
      Top = 310
      Width = 120
      Height = 21
      Color = clWindow
      Version = '1.5.1.0'
      Visible = False
      EmptyTextStyle = []
      FocusColor = clAqua
      DropWidth = 0
      Enabled = True
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImeName = 'Microsoft Office IME 2007'
      ItemIndex = 0
      Items.Strings = (
        #49324#50857#50504#54632
        #49324#50857#54632)
      LabelCaption = #50689#50629#52264#47049#51648#51221#50836#50984
      LabelPosition = lpLeftCenter
      LabelTransparent = True
      LabelAlwaysEnabled = True
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      ParentFont = False
      TabOrder = 23
      Text = #49324#50857#50504#54632
    end
    object cmbParkingDayMax: TAdvComboBox
      Left = 594
      Top = 310
      Width = 120
      Height = 21
      Color = clWindow
      Version = '1.5.1.0'
      Visible = False
      EmptyTextStyle = []
      FocusColor = clAqua
      DropWidth = 0
      Enabled = True
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImeName = 'Microsoft Office IME 2007'
      ItemIndex = 0
      Items.Strings = (
        #49324#50857#50504#54632
        #49324#50857#54632)
      LabelCaption = #51452#52264#51068#48324#52572#44256#50836#44552
      LabelPosition = lpLeftCenter
      LabelTransparent = True
      LabelAlwaysEnabled = True
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      ParentFont = False
      TabOrder = 24
      Text = #49324#50857#50504#54632
    end
    object edtDayMax: TAdvSpinEdit
      Left = 122
      Top = 162
      Width = 120
      Height = 22
      Value = 0
      DateValue = 41265.649598877320000000
      HexValue = 0
      IncrementFloat = 0.100000000000000000
      IncrementFloatPage = 1.000000000000000000
      LabelAlwaysEnabled = True
      LabelCaption = #51068#51068#52572#44256#44552#50529
      LabelPosition = lpLeftCenter
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      TabOrder = 7
      Visible = False
      Version = '1.6.0.0'
    end
    object edtTotMax: TAdvSpinEdit
      Left = 360
      Top = 162
      Width = 120
      Height = 22
      Value = 0
      DateValue = 41265.649598877320000000
      HexValue = 0
      IncrementFloat = 0.100000000000000000
      IncrementFloatPage = 1.000000000000000000
      LabelAlwaysEnabled = True
      LabelCaption = #51204#52404#52572#44256#44552#50529
      LabelPosition = lpLeftCenter
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      TabOrder = 8
      Visible = False
      Version = '1.6.0.0'
    end
    object edtDCCntMax: TAdvSpinEdit
      Left = 122
      Top = 339
      Width = 120
      Height = 22
      Hint = '0:'#47924#51228#54620#54624#51064#44032#45733
      Value = 0
      DateValue = 41265.649598877320000000
      HexValue = 0
      IncrementFloat = 0.100000000000000000
      IncrementFloatPage = 1.000000000000000000
      LabelAlwaysEnabled = True
      LabelCaption = #54624#51064#44032#45733#54943#49688
      LabelPosition = lpLeftCenter
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      TabOrder = 25
      Visible = False
      Version = '1.6.0.0'
    end
    object edtLostAmt: TAdvSpinEdit
      Left = 594
      Top = 280
      Width = 120
      Height = 22
      Hint = '0:'#47924#51228#54620#54624#51064#44032#45733
      Value = 0
      DateValue = 41265.649598877320000000
      HexValue = 0
      IncrementFloat = 0.100000000000000000
      IncrementFloatPage = 1.000000000000000000
      LabelAlwaysEnabled = True
      LabelCaption = #48516#49892#44256#51221#50836#44552
      LabelPosition = lpLeftCenter
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      TabOrder = 21
      Visible = False
      Version = '1.6.0.0'
    end
    object cmbCurrencyType: TAdvComboBox
      Left = 360
      Top = 339
      Width = 120
      Height = 21
      Color = clWindow
      Version = '1.5.1.0'
      Visible = False
      EmptyTextStyle = []
      FocusColor = clAqua
      DropWidth = 0
      Enabled = True
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImeName = 'Microsoft Office IME 2007'
      ItemIndex = 0
      Items.Strings = (
        #50896#45800#50948
        #45804#47084#45800#50948)
      LabelCaption = #54868#54224#45800#50948
      LabelPosition = lpLeftCenter
      LabelTransparent = True
      LabelAlwaysEnabled = True
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      ParentFont = False
      TabOrder = 26
      Text = #50896#45800#50948
    end
    object cmbSaturdayProc: TAdvComboBox
      Left = 594
      Top = 339
      Width = 120
      Height = 21
      Color = clWindow
      Version = '1.5.1.0'
      Visible = False
      EmptyTextStyle = []
      FocusColor = clAqua
      DropWidth = 0
      Enabled = True
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImeName = 'Microsoft Office IME 2007'
      ItemIndex = 0
      Items.Strings = (
        #52376#47532#50504#54632
        #52376#47532#54632)
      LabelCaption = #53664#50836#51068#52376#47532#50668#48512
      LabelPosition = lpLeftCenter
      LabelTransparent = True
      LabelAlwaysEnabled = True
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      ParentFont = False
      TabOrder = 27
      Text = #52376#47532#50504#54632
    end
    object cmbOperation: TAdvComboBox
      Left = 122
      Top = 369
      Width = 120
      Height = 21
      Color = clWindow
      Version = '1.5.1.0'
      Visible = False
      EmptyTextStyle = []
      FocusColor = clAqua
      DropWidth = 0
      Enabled = True
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImeName = 'Microsoft Office IME 2007'
      ItemIndex = 0
      Items.Strings = (
        #51221#49345#50868#50689
        #44060#48169#50868#50689)
      LabelCaption = #50868#50689#47784#46300
      LabelPosition = lpLeftCenter
      LabelTransparent = True
      LabelAlwaysEnabled = True
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      ParentFont = False
      TabOrder = 28
      Text = #51221#49345#50868#50689
    end
    object cbTest: TCheckBox
      Left = 312
      Top = 369
      Width = 89
      Height = 17
      Alignment = taLeftJustify
      Caption = #53580#49828#53944#50868#50689
      TabOrder = 29
      Visible = False
    end
    object cmbFreeTime: TAdvComboBox
      Left = 122
      Top = 399
      Width = 120
      Height = 21
      Color = clWindow
      Version = '1.5.1.0'
      Visible = False
      EmptyTextStyle = []
      FocusColor = clAqua
      DropWidth = 0
      Enabled = True
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImeName = 'Microsoft Office IME 2007'
      ItemIndex = 0
      Items.Strings = (
        #49324#50857#50504#54632
        #49324#50857#54632)
      LabelCaption = #47924#47308#44060#48169#49884#44036
      LabelPosition = lpLeftCenter
      LabelTransparent = True
      LabelAlwaysEnabled = True
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      ParentFont = False
      TabOrder = 30
      Text = #49324#50857#50504#54632
    end
    object edtFreeTimeS: TAdvMaskEdit
      Left = 360
      Top = 399
      Width = 120
      Height = 21
      Color = clWindow
      Enabled = True
      EditMask = '!90:00;1;_'
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImeName = 'Microsoft Office IME 2007'
      MaxLength = 5
      ParentFont = False
      TabOrder = 31
      Text = '  :  '
      Visible = False
      AutoFocus = False
      Flat = False
      FlatLineColor = clBlack
      FlatParentColor = True
      ShowModified = False
      FocusColor = clAqua
      FocusBorder = False
      FocusFontColor = clBlack
      LabelCaption = #47924#47308#44060#48169#49884#44036#49884#51089
      LabelAlwaysEnabled = True
      LabelPosition = lpLeftCenter
      LabelMargin = 4
      LabelTransparent = True
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      ModifiedColor = clRed
      SelectFirstChar = False
      Version = '3.3.2.0'
    end
    object edtFreeTimeE: TAdvMaskEdit
      Left = 594
      Top = 399
      Width = 120
      Height = 21
      Color = clWindow
      Enabled = True
      EditMask = '!90:00;1;_'
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImeName = 'Microsoft Office IME 2007'
      MaxLength = 5
      ParentFont = False
      TabOrder = 32
      Text = '  :  '
      Visible = False
      AutoFocus = False
      Flat = False
      FlatLineColor = clBlack
      FlatParentColor = True
      ShowModified = False
      FocusColor = clAqua
      FocusBorder = False
      FocusFontColor = clBlack
      LabelCaption = #47924#47308#44060#48169#49884#44036#51333#47308
      LabelAlwaysEnabled = True
      LabelPosition = lpLeftCenter
      LabelMargin = 4
      LabelTransparent = True
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      ModifiedColor = clRed
      SelectFirstChar = False
      Version = '3.3.2.0'
    end
    object edtAvailablePoint: TAdvSpinEdit
      Left = 794
      Top = 46
      Width = 120
      Height = 22
      Value = 0
      DateValue = 43964.724138136570000000
      HexValue = 0
      FocusColor = clAqua
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      IncrementFloat = 0.100000000000000000
      IncrementFloatPage = 1.000000000000000000
      LabelAlwaysEnabled = True
      LabelCaption = #44032#50857' '#54252#51064#53944
      LabelPosition = lpLeftCenter
      LabelTransparent = True
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      MaxValue = 255
      ParentFont = False
      TabOrder = 33
      Visible = True
      Version = '1.6.0.0'
      OnChange = edtAvailablePointChange
    end
    object edtUsedPoint: TAdvSpinEdit
      Left = 1029
      Top = 43
      Width = 120
      Height = 22
      Value = 0
      DateValue = 43964.724138136570000000
      HexValue = 0
      FocusColor = clAqua
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      IncrementFloat = 0.100000000000000000
      IncrementFloatPage = 1.000000000000000000
      LabelAlwaysEnabled = True
      LabelCaption = #49324#50857' '#54252#51064#53944
      LabelPosition = lpLeftCenter
      LabelTransparent = True
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      MaxValue = 255
      ParentFont = False
      TabOrder = 34
      Visible = False
      Version = '1.6.0.0'
    end
    object edtMonthPoint: TAdvSpinEdit
      Left = 795
      Top = 15
      Width = 120
      Height = 22
      Value = 0
      DateValue = 43977.541357222220000000
      HexValue = 0
      FocusColor = clAqua
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      IncrementFloat = 0.100000000000000000
      IncrementFloatPage = 1.000000000000000000
      LabelAlwaysEnabled = True
      LabelCaption = #44060#50900
      LabelPosition = lpLeftCenter
      LabelTransparent = True
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      MaxValue = 255
      ParentFont = False
      TabOrder = 35
      Visible = True
      Version = '1.6.0.0'
    end
    object edtVisitinfoCount: TAdvSpinEdit
      Left = 122
      Top = 103
      Width = 120
      Height = 22
      Value = 5
      FloatValue = 5.000000000000000000
      TimeValue = 0.208333333333333300
      HexValue = 0
      FocusColor = clAqua
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      IncrementFloat = 0.100000000000000000
      IncrementFloatPage = 1.000000000000000000
      LabelAlwaysEnabled = True
      LabelCaption = #48169#47928#44061#52264#47049' '#45824#49688
      LabelPosition = lpLeftCenter
      LabelTransparent = True
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      MaxValue = 255
      ParentFont = False
      TabOrder = 36
      Visible = True
      Version = '1.6.0.0'
    end
    object edtVisitinfoTime: TAdvSpinEdit
      Left = 360
      Top = 103
      Width = 120
      Height = 22
      Value = 48
      FloatValue = 48.000000000000000000
      HexValue = 0
      FocusColor = clAqua
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      IncrementFloat = 0.100000000000000000
      IncrementFloatPage = 1.000000000000000000
      LabelAlwaysEnabled = True
      LabelCaption = #46321#47197#51068
      LabelPosition = lpLeftCenter
      LabelTransparent = True
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      MaxValue = 255
      ParentFont = False
      TabOrder = 37
      Visible = True
      Version = '1.6.0.0'
    end
    object edtVisitinfoDate: TAdvSpinEdit
      Left = 594
      Top = 103
      Width = 120
      Height = 22
      Value = 7
      FloatValue = 7.000000000000000000
      TimeValue = 0.291666666666666700
      HexValue = 0
      FocusColor = clAqua
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      IncrementFloat = 0.100000000000000000
      IncrementFloatPage = 1.000000000000000000
      LabelAlwaysEnabled = True
      LabelCaption = #50696#50557#44032#45733#51068#51088
      LabelPosition = lpLeftCenter
      LabelTransparent = True
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      MaxValue = 255
      ParentFont = False
      TabOrder = 38
      Visible = True
      Version = '1.6.0.0'
    end
    object edtvisitinfoinsert: TAdvEdit
      Left = 792
      Top = 105
      Width = 123
      Height = 21
      EmptyTextStyle = []
      FocusColor = clAqua
      LabelCaption = #46321#47197#54943#49688' / '#44592#44036
      LabelPosition = lpLeftCenter
      LabelTransparent = True
      LabelAlwaysEnabled = True
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = 'Tahoma'
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
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImeMode = imSHanguel
      ImeName = 'Microsoft IME 2010'
      MaxLength = 50
      ParentFont = False
      TabOrder = 39
      Text = '10'
      Visible = True
      Version = '3.3.2.0'
    end
    object cmbvisitinfoinsert: TComboBox
      Left = 932
      Top = 105
      Width = 105
      Height = 21
      ImeName = #54620#44397#50612'('#54620#44544')'
      TabOrder = 40
      Text = #50900
      Items.Strings = (
        #51452
        #50900
        #45380)
    end
    object edtPointType: TAdvSpinEdit
      Left = 1029
      Top = 15
      Width = 120
      Height = 22
      Value = 0
      DateValue = 44216.336403506950000000
      HexValue = 0
      FocusColor = clAqua
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      IncrementFloat = 0.100000000000000000
      IncrementFloatPage = 1.000000000000000000
      LabelAlwaysEnabled = True
      LabelCaption = '1:'#52488'2:'#48516'3:'#49884'4:'#51068'5:'#44148
      LabelPosition = lpLeftCenter
      LabelTransparent = True
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      MaxValue = 255
      ParentFont = False
      TabOrder = 41
      Visible = False
      Version = '1.6.0.0'
    end
    object edtPointUnit: TAdvSpinEdit
      Left = 1028
      Top = 71
      Width = 120
      Height = 22
      Value = 0
      DateValue = 44216.549664976850000000
      HexValue = 0
      FocusColor = clAqua
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      IncrementFloat = 0.100000000000000000
      IncrementFloatPage = 1.000000000000000000
      LabelAlwaysEnabled = True
      LabelCaption = #54252#51064#53944#45800#50948
      LabelPosition = lpLeftCenter
      LabelTransparent = True
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      MaxValue = 255
      ParentFont = False
      TabOrder = 42
      Visible = False
      Version = '1.6.0.0'
    end
  end
  object btnSave: TBitBtn
    Left = 685
    Top = 343
    Width = 97
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
  object btnCancel: TBitBtn
    Left = 801
    Top = 344
    Width = 97
    Height = 35
    Caption = #52712'  '#49548
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
    TabOrder = 3
    OnClick = btnCancelClick
  end
  object btnDelete: TBitBtn
    Left = 917
    Top = 344
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
    TabOrder = 4
    OnClick = btnDeleteClick
  end
  object btnClose: TBitBtn
    Left = 1025
    Top = 344
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
  object qryParkInfo: TADOQuery
    Connection = dmTables.ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from ParkInfo')
    Left = 48
    Top = 40
    object qryParkInfoParkNo: TSmallintField
      FieldName = 'ParkNo'
    end
    object qryParkInfoParkName: TStringField
      FieldName = 'ParkName'
      Size = 100
    end
    object qryParkInfoParkAddr: TStringField
      FieldName = 'ParkAddr'
      Size = 100
    end
    object qryParkInfoRegNo: TStringField
      FieldName = 'RegNo'
    end
    object qryParkInfoAdmin: TStringField
      FieldName = 'Admin'
      Size = 50
    end
    object qryParkInfoTelephone: TStringField
      FieldName = 'Telephone'
    end
    object qryParkInfoReceipt: TStringField
      FieldName = 'Receipt'
      Size = 100
    end
    object qryParkInfoDayMax: TIntegerField
      FieldName = 'DayMax'
    end
    object qryParkInfoTotMax: TIntegerField
      FieldName = 'TotMax'
    end
    object qryParkInfoCalcType: TWordField
      FieldName = 'CalcType'
      OnGetText = qryParkInfoCalcTypeGetText
    end
    object qryParkInfoClosingTime: TStringField
      FieldName = 'ClosingTime'
      FixedChar = True
      Size = 5
    end
    object qryParkInfoAutoClosing: TWordField
      FieldName = 'AutoClosing'
      OnGetText = qryParkInfoAutoClosingGetText
    end
    object qryParkInfoHolidayProc: TWordField
      FieldName = 'HolidayProc'
      OnGetText = qryParkInfoHolidayProcGetText
    end
    object qryParkInfoSaturdayProc: TWordField
      FieldName = 'SaturdayProc'
      OnGetText = qryParkInfoSaturdayProcGetText
    end
    object qryParkInfoReceiptAuto: TWordField
      FieldName = 'ReceiptAuto'
      OnGetText = qryParkInfoReceiptAutoGetText
    end
    object qryParkInfoReceiptZero: TWordField
      FieldName = 'ReceiptZero'
      OnGetText = qryParkInfoReceiptZeroGetText
    end
    object qryParkInfoTaxType: TWordField
      FieldName = 'TaxType'
      OnGetText = qryParkInfoTaxTypeGetText
    end
    object qryParkInfoJunkType: TWordField
      FieldName = 'JunkType'
      OnGetText = qryParkInfoJunkTypeGetText
    end
    object qryParkInfoRoundType: TWordField
      FieldName = 'RoundType'
      OnGetText = qryParkInfoRoundTypeGetText
    end
    object qryParkInfoTimeDCType: TWordField
      FieldName = 'TimeDCType'
      OnGetText = qryParkInfoTimeDCTypeGetText
    end
    object qryParkInfoCurrencyType: TWordField
      FieldName = 'CurrencyType'
      OnGetText = qryParkInfoCurrencyTypeGetText
    end
    object qryParkInfoDCReason: TWordField
      FieldName = 'DCReason'
      OnGetText = qryParkInfoDCReasonGetText
    end
    object qryParkInfoLostCalc: TWordField
      FieldName = 'LostCalc'
      OnGetText = qryParkInfoLostCalcGetText
    end
    object qryParkInfoLoatAmount: TIntegerField
      FieldName = 'LostAmount'
    end
    object qryParkInfoSpecialTariff: TWordField
      FieldName = 'SpecialTariff'
      OnGetText = qryParkInfoSpecialTariffGetText
    end
    object qryParkInfoCommercialCar: TWordField
      FieldName = 'CommercialCar'
      OnGetText = qryParkInfoCommercialCarGetText
    end
    object qryParkInfoParkingDayMax: TWordField
      FieldName = 'ParkingDayMax'
      OnGetText = qryParkInfoParkingDayMaxGetText
    end
    object qryParkInfoDCCntMax: TWordField
      FieldName = 'DCCntMax'
      OnGetText = qryParkInfoDCCntMaxGetText
    end
    object qryParkInfoVanIP: TStringField
      FieldName = 'VanIP'
      Size = 50
    end
    object qryParkInfoVanPort: TIntegerField
      FieldName = 'VanPort'
    end
    object qryParkInfoReserve1: TStringField
      FieldName = 'Reserve1'
      Size = 50
    end
    object qryParkInfoReserve2: TStringField
      FieldName = 'Reserve2'
      Size = 50
    end
    object qryParkInfoReserve3: TStringField
      FieldName = 'Reserve3'
      Size = 50
    end
    object qryParkInfoReserve4: TStringField
      FieldName = 'Reserve4'
      Size = 50
    end
    object qryParkInfoReserve5: TStringField
      FieldName = 'Reserve5'
      OnGetText = qryParkInfoReserve5GetText
      Size = 50
    end
    object qryParkInfoAvailablePoint: TIntegerField
      FieldName = 'AvailablePoint'
    end
    object qryParkInfoUsedPoint: TIntegerField
      FieldName = 'UsedPoint'
    end
    object qryParkInfoPointDate: TStringField
      FieldName = 'PointDate'
    end
    object qryParkInfoPointMonth: TIntegerField
      FieldName = 'PointMonth'
    end
    object qryParkInfovisitinfoTime: TIntegerField
      FieldName = 'visitinfoTime'
    end
    object qryParkInfovisitinfoDate: TIntegerField
      FieldName = 'visitinfoDate'
    end
    object qryParkInfovisitinfocount: TIntegerField
      FieldName = 'visitinfocount'
    end
    object qryParkInfovisitinfoInsert: TStringField
      FieldName = 'visitinfoInsert'
    end
    object qryParkInfoPointType: TIntegerField
      FieldName = 'PointType'
    end
    object qryParkInfoPointUnit: TIntegerField
      FieldName = 'PointUnit'
    end
  end
  object dsParkInfo: TDataSource
    DataSet = qryParkInfo
    Left = 48
    Top = 88
  end
  object qryTemp: TADOQuery
    Connection = dmTables.ADODB
    Parameters = <>
    Left = 128
    Top = 40
  end
end
