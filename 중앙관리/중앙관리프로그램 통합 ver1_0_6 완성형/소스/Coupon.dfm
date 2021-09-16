object frmCoupon: TfrmCoupon
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = #54624#51064#44428' '#48156#44553
  ClientHeight = 252
  ClientWidth = 446
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
    Left = 8
    Top = 8
    Width = 425
    Height = 186
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
    object cmbName: TAdvComboBox
      Left = 73
      Top = 18
      Width = 328
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
      ImeMode = imSHanguel
      ImeName = 'Microsoft Office IME 2007'
      ItemIndex = -1
      LabelCaption = #50629' '#52404' '#47749
      LabelPosition = lpLeftCenter
      LabelTransparent = True
      LabelAlwaysEnabled = True
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = #44404#47548#52404
      LabelFont.Style = []
      MaxLength = 16
      ParentFont = False
      TabOrder = 0
    end
    object edtExpDate: TAdvMaskEdit
      Left = 281
      Top = 80
      Width = 118
      Height = 20
      Color = clWindow
      Enabled = True
      EditMask = '!9999/99/99;1;_'
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeName = 'Microsoft Office IME 2007'
      MaxLength = 10
      ParentFont = False
      TabOrder = 4
      Text = '2012-12-31'
      Visible = True
      AutoFocus = False
      Flat = False
      FlatLineColor = clBlack
      FlatParentColor = True
      ShowModified = False
      FocusColor = clAqua
      FocusBorder = False
      FocusFontColor = clBlack
      LabelCaption = #50976#54952#44592#44036
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
    object edtIssueCnt: TAdvSpinEdit
      Left = 73
      Top = 49
      Width = 120
      Height = 19
      Value = 1
      FloatValue = 1.000000000000000000
      TimeValue = 0.041666666666666660
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
      LabelCaption = #48156#44553#47588#49688
      LabelPosition = lpLeftCenter
      LabelTransparent = True
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = #44404#47548#52404
      LabelFont.Style = []
      ParentFont = False
      TabOrder = 1
      Visible = True
      Version = '1.4.5.2'
      OnChange = edtIssueCntChange
      OnExit = edtIssueCntExit
    end
    object edtIssueUnit: TAdvSpinEdit
      Left = 281
      Top = 49
      Width = 120
      Height = 19
      Value = 0
      DateValue = 41068.427113344910000000
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
      LabelCaption = #48156#44553#45800#44032
      LabelPosition = lpLeftCenter
      LabelTransparent = True
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = #44404#47548#52404
      LabelFont.Style = []
      ParentFont = False
      TabOrder = 2
      Visible = True
      Version = '1.4.5.2'
      OnChange = edtIssueUnitChange
      OnExit = edtIssueUnitExit
    end
    object edtIssueAmt: TAdvSpinEdit
      Left = 73
      Top = 81
      Width = 120
      Height = 19
      Value = 0
      DateValue = 41068.427113344910000000
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
      LabelCaption = #48156#44553#44552#50529
      LabelPosition = lpLeftCenter
      LabelTransparent = True
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = #44404#47548#52404
      LabelFont.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      Visible = True
      Version = '1.4.5.2'
    end
    object cmbDCType: TAdvComboBox
      Left = 73
      Top = 114
      Width = 120
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
      ImeMode = imSHanguel
      ImeName = 'Microsoft Office IME 2007'
      ItemIndex = 0
      Items.Strings = (
        #44552#50529#54624#51064
        #49884#44036#54624#51064
        '%'#54624#51064)
      LabelCaption = #54624#51064#51333#47448
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
      Text = #44552#50529#54624#51064
      OnChange = cmbDCTypeChange
    end
    object edtDCAmt: TAdvSpinEdit
      Left = 281
      Top = 114
      Width = 120
      Height = 19
      Value = 0
      DateValue = 41068.427113344910000000
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
      LabelCaption = #54624#51064#44552#50529
      LabelPosition = lpLeftCenter
      LabelTransparent = True
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = #44404#47548#52404
      LabelFont.Style = []
      MaxValue = 999999
      ParentFont = False
      TabOrder = 6
      Visible = True
      Version = '1.4.5.2'
    end
    object edtSerial: TAdvSpinEdit
      Left = 73
      Top = 147
      Width = 121
      Height = 22
      Value = 0
      DateValue = 41068.427113344910000000
      HexValue = 0
      Enabled = True
      IncrementFloat = 0.100000000000000000
      IncrementFloatPage = 1.000000000000000000
      LabelAlwaysEnabled = True
      LabelCaption = #44288#47532#48264#54840
      LabelPosition = lpLeftCenter
      LabelTransparent = True
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      TabOrder = 7
      Visible = True
      Version = '1.4.5.2'
    end
  end
  object btnStart: TBitBtn
    Left = 207
    Top = 209
    Width = 97
    Height = 35
    Caption = #48156#44553#49884#51089
    DoubleBuffered = True
    Enabled = False
    Glyph.Data = {
      76060000424D7606000000000000360400002800000018000000180000000100
      08000000000040020000130B0000130B00000001000000010000A54A0000CE63
      0000DE7B0000006363003163630063636300E7A5630063009C0063319C00639C
      9C009C9C9C009CCECE00B5DEDE00FF00FF00FFCEFF00FFFFFF00FFFFFF00FFFF
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
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000D0D0D0D0D0D
      0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D
      0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D
      0D0D0D0D0D000000000000000000000000000000000000000D0D0D0D0D090909
      090909090909090909090909090909000D0D0D0D040404040404040404040404
      04040404040409000D0D0D0D0303030303030303030303030303030303030400
      0D0D0D0D090B0B0B0B0B0B0B0B0B0B0B0B0B0B09090A04000D0D0D0D0D090B0B
      0B0B0B0B0B0B0B0B0B0B0B0B0B0B04000D0D0D0D0D090F0F0F0C0F0F0F0C0F0F
      0F0C0F0F0F0B05000D0D0D0D0D090F0F0F0C0F0F0F0C0F0F0F0C0F0F0F0B0500
      0D0D0D0D0D090C0C0C07080808080C0C0C0C0C0C0C0B05000D0D0D0D0D090F0F
      0F080E0E0E080F0F0F0C0F0F0F0B05000D0D0D0D0D090F0F0F080E0E0E080F0F
      0F0C0F0F0F0B05000D0D0D0D0D090C0C0C08080808080C0C0C0C0C0C0C0B0500
      0D0D0D0D0D090F0F0F0C0F0F0F0C0F0F0F0C0F0F0F0B05000D0D0D0D0D090F0F
      0F0C0F0F0F0C0F0F0F0C0F0F0F0B05000D0D0D0D0D090B0B0B0B0B0B0B0B0B0B
      0B0B0B0B0B0B04000D0D0D0D0D04040404040404040404040404040404040401
      0D0D0D0D0D010101010101010101010101010101010101010D0D0D0D0D020202
      020202020202020202020202020201010D0D0D0D0D0D06060606060606060606
      06060606060606010D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D
      0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D}
    ParentDoubleBuffered = False
    TabOrder = 1
    OnClick = btnStartClick
  end
  object btnClose: TBitBtn
    Left = 331
    Top = 206
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
    TabOrder = 2
    OnClick = btnCloseClick
  end
  object comBarcode: TApdComPort
    OutSize = 60000
    TraceName = 'APRO.TRC'
    LogName = 'APRO.LOG'
    OnPortOpen = comBarcodePortOpen
    Left = 208
    Top = 16
  end
  object qryTemp: TADOQuery
    Connection = dmTables.ADODB
    CursorType = ctStatic
    Parameters = <>
    Left = 248
    Top = 16
  end
  object tCoupon: TTimer
    Enabled = False
    Interval = 700
    OnTimer = tCouponTimer
    Left = 208
    Top = 64
  end
end
