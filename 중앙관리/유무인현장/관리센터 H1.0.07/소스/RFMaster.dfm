object frmRFMaster: TfrmRFMaster
  Left = 0
  Top = 0
  Caption = 'frmRFMaster'
  ClientHeight = 584
  ClientWidth = 848
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
  object Panel1: TPanel
    Left = 0
    Top = 456
    Width = 849
    Height = 41
    TabOrder = 0
    object edtRFNo: TAdvEdit
      Left = 81
      Top = 10
      Width = 200
      Height = 20
      EmptyTextStyle = []
      FocusColor = clAqua
      LabelCaption = #52852#46300#48264#54840
      LabelPosition = lpLeftCenter
      LabelTransparent = True
      LabelAlwaysEnabled = True
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
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeMode = imSHanguel
      ImeName = 'Microsoft Office IME 2007'
      MaxLength = 20
      ParentFont = False
      TabOrder = 0
      Text = ''
      Visible = True
      Version = '3.3.2.0'
    end
    object edtRemark: TAdvEdit
      Left = 332
      Top = 10
      Width = 254
      Height = 20
      EmptyTextStyle = []
      FocusColor = clAqua
      LabelCaption = #48708'  '#44256
      LabelPosition = lpLeftCenter
      LabelTransparent = True
      LabelAlwaysEnabled = True
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
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeMode = imSHanguel
      ImeName = 'Microsoft Office IME 2007'
      MaxLength = 20
      ParentFont = False
      TabOrder = 1
      Text = ''
      Visible = True
      Version = '3.3.2.0'
    end
    object edtReserve1: TAdvEdit
      Left = 642
      Top = 10
      Width = 185
      Height = 20
      EmptyTextStyle = []
      FocusColor = clAqua
      LabelCaption = #48708'  '#44256' 2'
      LabelPosition = lpLeftCenter
      LabelTransparent = True
      LabelAlwaysEnabled = True
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
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeMode = imSHanguel
      ImeName = 'Microsoft Office IME 2007'
      MaxLength = 20
      ParentFont = False
      TabOrder = 2
      Text = ''
      Visible = True
      Version = '3.3.2.0'
    end
  end
  object pnl1: TPanel
    Left = -1
    Top = 0
    Width = 849
    Height = 441
    TabOrder = 1
    object dg1: TDBAdvGrid
      Left = 1
      Top = 1
      Width = 847
      Height = 439
      Cursor = crDefault
      Align = alClient
      ColCount = 4
      DrawingStyle = gdsClassic
      RowCount = 2
      FixedRows = 1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 0
      OnClick = dg1Click
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
      SearchFooter.HintFindNext = 'Find next occurrence'
      SearchFooter.HintFindPrev = 'Find previous occurrence'
      SearchFooter.HintHighlight = 'Highlight occurrences'
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
          EditLength = 80
          FieldName = 'RfData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = 'RF'#45936#51060#53552
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
          Width = 200
        end
        item
          Alignment = taCenter
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          EditLength = 100
          FieldName = 'Remark'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = #48708'  '#44256
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
          Alignment = taCenter
          Borders = []
          BorderPen.Color = clSilver
          CheckFalse = 'N'
          CheckTrue = 'Y'
          Color = clWindow
          EditLength = 50
          FieldName = 'Reserve1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Header = #48708'  '#44256' 2'
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
        end>
      DataSource = dsRFMaster
      InvalidPicture.Data = {
        055449636F6E0000010001002020200000000000A81000001600000028000000
        2000000040000000010020000000000000100000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000006A6A6B256A6A6B606A6A6B946A6A6BC06A6A6BE1
        6A6A6BF86A6A6BF86A6A6BE16A6A6BC06A6A6B946A6A6B606A6A6B2500000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000006A6A6B407575769E787879F19F9F9FF6C0C0C0FDDADADAFFEDEDEEFF
        FBFBFBFFFBFBFBFFEDEDEEFFDADADAFFC0C0C0FD9F9F9FF6787879F17575769E
        6A6A6B4000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000006A6A6B22
        7C7C7C98888889F0BDBDBDFCE9E9EBFED9D9E9FEB5B5DDFE8B8BCDFE595AB7FF
        3739A8FF2B2CA4FF4A49B1FF7171C1FFA1A2D7FFD3D3E8FFEAEAEBFEBEBEBFFC
        888889F07C7C7C986A6A6B220000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000006A6A6B43838383D8
        B7B7B8FAECECEFFEC0C0DFFF7977C4FF2221A0FF12129BFF1010A4FF0C0CA8FF
        0A0AACFF0A0AB4FF0A0AB9FF0D0DBEFF0F0FB1FF1111A6FF5656B8FFAEADDCFF
        ECECEFFEB7B7B8FA838383D86A6A6B4300000000000000000000000000000000
        00000000000000000000000000000000000000006A6A6B4E878788EAD3D3D3FE
        CACAE8FF4443B0FF171799FF11119CFF0C0C98FF0B0B9BFF0B0BA0FF0A0AA6FF
        0909ACFF0909B2FF0808BAFF0707BFFF0B09C8FF0D0DCEFF1111CCFF1010AFFF
        4A49B2FFCFCFEBFFD3D3D3FE878788EA6A6A6B4E000000000000000000000000
        000000000000000000000000000000006A6A6B43878788EAE1E1E1FFA8A8DAFF
        2323A0FF15159CFF0D0D92FF0C0C95FF0C0C99FF0B0B9EFF0B0BA0FF0A0AA6FF
        0909ACFF0909B2FF0808B8FF0808BCFF0808C3FF0C0CC9FF0C0CD0FF0D0DD6FF
        1313CFFF2222A9FFAFAFDEFFE1E1E1FF878788EA6A6A6B430000000000000000
        0000000000000000000000006A6A6B22838383D8D3D3D3FEA8A8D9FF2020A4FF
        13139BFF0C0C92FF0C0C95FF0C0C97FF0C0C99FF0B0B9EFF0B0BA0FF0A0AA4FF
        0A0AA9FF0909B0FF0808B4FF0808BBFF0707C0FF0A0AC6FF0909CCFF0C0CD3FF
        0D0DD8FF1313D3FF1A1AA8FFAEADDEFFD4D4D4FE838383D86A6A6B2200000000
        0000000000000000000000007C7C7C98B7B7B8FACACAE8FF2524A3FF13139FFF
        0C0C97FF0C0C95FF0C0C95FF0C0C91FF0C0C95FF0B0B9EFF0B0BA0FF0A0AA4FF
        0A0AA8FF0909ADFF0909B2FF0808B8FF0808BCFF0707C0FF0808BCFF0707C5FF
        0C0CD3FF0D0DD7FF1212D1FF2020A7FFCDCDEBFFB8B8B9FA7C7C7C9800000000
        00000000000000006A6A6B40888889F0ECECEFFE4545B1FF1616A4FF0B0B9BFF
        0C0C99FF0C0C96FF3333A2FFB9B9D0FF393A9BFF0C0C95FF0B0BA1FF0A0AA4FF
        0A0AA7FF0A0AABFF0909B0FF0808B4FF0808B7FF2F2FC2FFAEAEE2FF4B4BBFFF
        0707BEFF0B0BD1FF0C0CD3FF1413CCFF4848B1FFECECEFFE888889F06A6A6B40
        00000000000000007575769EBFBFBFFD9B9BD5FF1C1CA6FF0C0CA1FF0B0B9FFF
        0B0B9AFF3535A7FFB5B5BEFFE6E6DFFFEDEDEFFF3C3C9CFF0C0C97FF0A0AA4FF
        0A0AA6FF0A0AA9FF0909ADFF0909B0FF2626B5FFCECEDEFFFFFFFBFFEEEEF1FF
        4848BAFF0808BCFF0A0ACDFF0B0BCEFF1111ABFFBEC0E0FFBFC0BFFD7575769E
        000000006A6A6B25787879F1E3E3E5FE4646B2FF1414A8FF0A0AA4FF0B0BA0FF
        2121A9FFBDBDCAFFD0D0C8FFC5C5C5FFE3E3E1FFEDEDEFFF3E3E9EFF0C0C98FF
        0A0AA6FF0A0AA8FF0A0AA9FF2B2BB0FFC0C0CDFFEAEAE2FFEBEBEBFFFEFEF8FF
        EDEDEEFF2828BDFF0707C4FF0809C7FF0F0FC4FF8788CBFFEBEBECFE79797AF1
        6A6A6B256A6A6B609D9E9DF6D6D7E4FF3A3AB3FF1212ADFF0A0AA8FF0A0AA4FF
        1313AAFFABABCFFFD6D6CBFFCACACAFFC6C6C6FFE4E4E0FFEEEEEFFF3F3FA0FF
        0C0C99FF0A0AA6FF2828ABFFB2B2BFFFD8D8CEFFD6D6D8FFE0E0E0FFF6F5EDFF
        D1D1EDFF1E1CC0FF0707BEFF0707BFFF0707C0FF2120AAFFD3D5E9FE9FA0A0F6
        6A6A6B606A6A6B94BDBDBDFBBABBDCFF3A39B7FF2F2FB8FF0909ADFF0A0AA9FF
        0A0AA6FF1515ACFFADADCFFFD6D6CBFFCBCBCAFFC6C6C6FFE4E4E1FFEEEEEFFF
        3838A1FF2222A2FFACABB8FFC8C8C0FFC7C7C8FFCDCDCDFFE1E1D9FFC8CAE1FF
        2424BCFF0808B4FF0808B9FF0808BAFF0808BBFF0F0EABFFA1A2D5FEC0C0C0FC
        6A6A6B946A6A6BC0D9D8D7FE9999D1FF3838BBFF3636BCFF2C2CB7FF0909ADFF
        0A0AA9FF0A0AA4FF1C1CAFFFB1B1CFFFD6D6CBFFCCCCCBFFC7C7C7FFE4E4E1FF
        ECECEEFFACACB7FFC2C2BCFFBEBEBFFFC0C0C0FFCFCFC6FFC1C1D5FF2727B8FF
        0909ACFF0909B2FF0909B2FF0909B4FF0808B4FF0E0EB5FF6E6EBFFFD9D9D9FE
        6A6A6BC06A6A6BE1EBEAEBFF7D7CC7FF3838BFFF3434BEFF3536BEFF2A2AB8FF
        0909B0FF0909ACFF0A0AA8FF1C1CB1FFB2B2D0FFD7D7CCFFCBCBCBFFC7C7C8FF
        C8C8C3FFC6C6C3FFBFBFC1FFBDBDBDFFC5C5BCFFB8B8CEFF2929B5FF0A0AA8FF
        0909ACFF0909ADFF0909AFFF0909AFFF0909AFFF0C0CB0FF4747AFFFECECEDFF
        6A6A6BE16A6A6BF8F9F9F9FF6666C1FF3838C4FF3535C2FF3434C0FF3535BEFF
        3030BCFF1313B4FF0909ADFF0A0AA8FF1E1EB3FFAAAAD0FFD3D3CDFFCCCCCCFF
        C8C8C8FFC3C3C3FFC2C2C1FFC4C4BFFFB2B2CBFF2B2BB4FF0A0AA4FF0A0AA8FF
        0A0AA8FF0A0AA9FF0A0AA9FF0A0AA9FF0A0AA9FF0B0BA9FF3131A6FFFAFAFAFF
        6A6A6BF86A6A6BF8FBFBFBFF5959BEFF3B3BCAFF3A3AC8FF3737C4FF3535C2FF
        3636C0FF3636BEFF2323B8FF0909B1FF0A0AA7FF4949BEFFD6D6D4FFD3D3D1FF
        CDCDCDFFC8C8C8FFC4C4C3FFEDEDEDFF5F5FB3FF0C0C98FF0A0AA7FF0A0AA6FF
        0A0AA6FF0A0AA6FF0A0AA4FF0A0AA6FF0A0AA4FF0B0BA4FF2D2DA6FFFBFBFBFF
        6A6A6BF86A6A6BE1EDEDEEFF7F80CBFF4041CCFF3C3CCAFF3A3AC8FF383AC8FF
        3838C4FF3636C2FF3939C0FF2123B7FF4A4AC2FFCBCBDEFFE0E0DCFFD6D6D6FF
        D2D2D3FFCDCDCEFFC9C9C9FFE2E2E1FFF1F1F2FF4242A3FF0C0C99FF0A0AA4FF
        0A0AA4FF0A0AA4FF0B0BA3FF0B0BA3FF0B0BA1FF0E0EA1FF4443B0FFEDEDEEFF
        6A6A6BE16A6A6BC0DADADAFF9C9BD5FE4949CDFF3E3DD0FF3C3DCEFF3C3CCAFF
        3A3AC8FF3B39C7FF2828BDFF5C5CCCFFE5E5EDFFF4F4EDFFE5E5E6FFDEDEDEFF
        DCDCD9FFD9D9D3FFCDCDCDFFC8C8C8FFE5E5E1FFF1F1F3FF3F3FA0FF0C0C99FF
        0A0AA4FF0B0BA1FF0B0BA0FF0B0BA0FF0B0B9FFF1313A2FF6B6BC0FFDADADAFF
        6A6A6BC06A6A6B94C0C0C0FDBDBAE1FE5655CFFF4141D4FF3F3FD2FF3F3FCEFF
        3D3DCCFF2C2AC3FF5E5ED3FFEBEBF6FFFFFFFAFFF1F1F1FFEDEDEEFFF0F0E9FF
        D2D2E6FFBDBDD6FFDADAD3FFCFCFCFFFC9C9CAFFE5E5E2FFF1F1F3FF3A3AA0FF
        0C0C98FF0B0BA3FF0B0B9FFF0B0B9EFF0B0B9EFF1C1CA4FF9C9CD3FFC1C1C1FD
        6A6A6B946A6A6B609F9F9FF6DAD9EAFF6B6BCFFF4444D7FF4143D6FF4242D3FF
        3434CDFF6464DBFFEFEFFFFFFFFFFFFFFCFCFCFFF6F6F6FFFCFCF4FFE2E1F0FF
        5050CCFF4040C1FFC3C3DBFFE1E1D8FFD4D4D5FFCFCFCFFFE8E8E5FFF2F2F4FF
        4040A2FF0C0C99FF0F0FA2FF0F0FA0FF0F0F9DFF302FA9FFD1D1E8FEA0A0A0F6
        6A6A6B606A6A6B25787879F1E9E9EBFEA7A7DAFF6060DBFF4547DBFF3C3CD6FF
        5857DEFFF2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8E8F8FF5B5BD4FF
        2828BDFF2A2BBDFF4949C5FFC3C3DBFFE4E4DAFFD5D5D5FFCECED0FFE8E8E5FF
        F4F4F4FF4949AFFF2121A6FF2A2AA6FF2C2BA9FF5557B8FFEAEAECFE787879F1
        6A6A6B25000000007575769EBEBEBEFDC9CAE6FF7A79DBFF4C4CDFFF4141DBFF
        5757E0FFEAEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8E7FFFF5B5BD7FF2E2EC6FF
        3E3EC9FF3A3AC5FF2C2EC1FF4A49C8FFC2C2DDFFE3E3DAFFD5D5D4FFDADAD3FF
        CACBD9FF4747BBFF2525ADFF2C2BACFF3332AEFFA5A4D8FFBFBFBFFD7575769E
        00000000000000006A6A6B40888889F0ECECEFFE9696D6FF7B7BE3FF4D4BE0FF
        4141DBFF5F5FE6FFE7E7FFFFFFFFFFFFE9E9FFFF5A5ADCFF3333CAFF4242CFFF
        4040CBFF3D3DC9FF3D3EC8FF3030C2FF4848C9FFC0C0DDFFECEEDEFFD0D0E0FF
        5554C7FF2828B3FF3232B4FF3434B1FF5453B7FFECECEFFE888889F06A6A6B40
        0000000000000000000000007C7C7C98B7B7B8FAD0D0ECFF8F8FDBFF6868E3FF
        4E4EE2FF3E40DBFF6565E9FFB2B2F7FF6565E4FF393BD2FF4646D7FF4343D4FF
        4343D1FF4242CFFF4040CBFF3F3FCAFF3333C4FF4E4ECBFF9E9EE2FF5C5BCFFF
        292ABAFF3636BCFF3938B8FF3F3EB1FFCBCBE9FFB7B7B8FA7C7C7C9800000000
        0000000000000000000000006A6A6B22838383D8D3D3D3FEB5B5E2FF9E9EE4FF
        6766E2FF4E50E6FF4646E0FF3D3DDAFF4444DCFF4B4BDCFF4848DBFF4847D9FF
        4646D5FF4443D3FF4343D1FF4242CFFF4143CDFF3A3AC8FF312FC5FF3535C3FF
        3C3CC3FF3D3DBEFF403FB5FFACACDCFFD3D3D3FE838383D86A6A6B2200000000
        000000000000000000000000000000006A6A6B43878788EAE1E1E1FFB5B5E2FF
        A7A6E4FF7877E5FF5151E5FF4F4FE4FF4E4EE2FF4D4DE0FF4C4CDEFF4B4BDCFF
        4949DBFF4848D7FF4747D5FF4545D3FF4545D1FF4343CFFF4242CCFF3F3FCBFF
        4343C2FF4645B6FFADADDCFFE1E1E1FF878788EA6A6A6B430000000000000000
        00000000000000000000000000000000000000006A6A6B4E878788EAD3D3D3FE
        D0D0ECFFAAA9DFFFA2A2ECFF6565E3FF5151E6FF4F4FE4FF4F4DE4FF4D4DE0FF
        4D4DDFFF4D4DDCFF4C49DBFF4A4AD8FF4749D6FF4747D4FF4949CBFF4B4BC3FF
        8E8ED0FFCDCCE8FFD3D3D3FE878788EA6A6A6B4E000000000000000000000000
        0000000000000000000000000000000000000000000000006A6A6B43838383D8
        B7B7B8FAECECEFFEC3C2E5FFADAEE1FF9E9DE8FF6F6FE0FF5C5CE1FF5452E2FF
        5051E1FF4F4FDFFF4F4FDBFF5150D6FF5151CFFF5F5FC8FFA1A1D3FEC7C8E0FE
        E4E4E7FEB7B7B8FA838383D86A6A6B4300000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000006A6A6B22
        7C7C7C98888889F0BFBFBFFDEBEBECFED8D9EBFEBDBDE4FEA8A7DCFF9695D7FF
        8886D4FF7F7DCEFF8C8BD2FFA1A2D9FFC0BEE1FED9D9EAFEEAEAECFEBFBFBFFD
        888889F07C7C7C986A6A6B220000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000006A6A6B407575769E787879F19F9F9FF6C0C0C0FDDADADAFFEDEDEEFF
        FBFBFBFFFBFBFBFFEDEDEEFFDADADAFFC0C0C0FD9F9F9FF6787879F17575769E
        6A6A6B4000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000006A6A6B256A6A6B606A6A6B946A6A6BC06A6A6BE1
        6A6A6BF86A6A6BF86A6A6BE16A6A6BC06A6A6B946A6A6B606A6A6B2500000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000FFC003FFFF0000FFFC00003FF800001FF000000FE0000007C0000003
        C000000380000001800000010000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000080000001
        80000001C0000003C0000003E0000007F000000FF800001FFC00003FFF0000FF
        FFC003FF}
      ShowUnicode = False
      ColWidths = (
        20
        200
        150
        150)
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 565
    Width = 848
    Height = 19
    Panels = <>
  end
  object TPanel
    Left = 0
    Top = 505
    Width = 848
    Height = 51
    TabOrder = 3
    object btnClose: TBitBtn
      Left = 743
      Top = 8
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
      TabOrder = 0
      OnClick = btnCloseClick
    end
    object btnModify: TBitBtn
      Left = 435
      Top = 8
      Width = 97
      Height = 35
      Caption = #49688'  '#51221
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
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
      ParentFont = False
      TabOrder = 1
      OnClick = btnModifyClick
    end
    object btnDelete: TBitBtn
      Left = 538
      Top = 8
      Width = 97
      Height = 35
      Caption = #49325'  '#51228
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
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
      ParentFont = False
      TabOrder = 2
      OnClick = btnDeleteClick
    end
    object btnAllAdd: TBitBtn
      Left = 228
      Top = 8
      Width = 97
      Height = 35
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
      TabOrder = 3
      Visible = False
    end
    object btnAdd: TBitBtn
      Left = 332
      Top = 8
      Width = 97
      Height = 35
      Caption = #52628'  '#44032
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
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
      ParentFont = False
      TabOrder = 4
      OnClick = btnAddClick
    end
    object btnCancel: TBitBtn
      Left = 640
      Top = 8
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
      TabOrder = 5
      OnClick = btnCancelClick
    end
  end
  object qryRFMaster: TADOQuery
    Connection = dmTables.ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from RFMaster')
    Left = 56
    Top = 96
    object qryRFMasterRfData: TStringField
      FieldName = 'RfData'
      Size = 80
    end
    object qryRFMasterRemark: TStringField
      FieldName = 'Remark'
      Size = 100
    end
    object qryRFMasterReserve1: TStringField
      FieldName = 'Reserve1'
      Size = 50
    end
  end
  object dsRFMaster: TDataSource
    DataSet = qryRFMaster
    Left = 56
    Top = 160
  end
  object qryTemp: TADOQuery
    Connection = dmTables.ADODB
    CursorType = ctStatic
    Parameters = <>
    Left = 336
    Top = 112
    object StringField1: TStringField
      FieldName = 'RfData'
      Size = 80
    end
    object StringField2: TStringField
      FieldName = 'Remark'
      Size = 100
    end
    object StringField3: TStringField
      FieldName = 'Reserve1'
      Size = 50
    end
  end
end
