object frmGateRuleNew: TfrmGateRuleNew
  Left = 0
  Top = 0
  Caption = #52636#51077#53685#51228#44288#47532
  ClientHeight = 198
  ClientWidth = 956
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
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 956
    Height = 196
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object btnPrint: TBitBtn
      Left = 110
      Top = 207
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
      TabOrder = 0
      Visible = False
    end
    object btnClose: TBitBtn
      Left = 850
      Top = 153
      Width = 97
      Height = 35
      Caption = #51333'  '#47308
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
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
      ParentFont = False
      TabOrder = 1
      OnClick = btnCloseClick
    end
    object btnSave: TBitBtn
      Left = 652
      Top = 153
      Width = 97
      Height = 35
      Caption = #51200'  '#51109
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
      TabOrder = 2
      OnClick = btnSaveClick
    end
    object btnCancel: TBitBtn
      Left = 751
      Top = 153
      Width = 97
      Height = 35
      Caption = #52712'  '#49548
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
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
      ParentFont = False
      TabOrder = 3
      OnClick = btnCancelClick
    end
    object Panel2: TPanel
      Left = 10
      Top = 9
      Width = 938
      Height = 136
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      object cmbTKType: TAdvComboBox
        Left = 137
        Top = 39
        Width = 90
        Height = 20
        Color = clWindow
        Version = '1.5.1.0'
        Visible = True
        Style = csDropDownList
        EmptyTextStyle = []
        DropWidth = 0
        Enabled = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ItemIndex = 0
        Items.Strings = (
          #49440#53469
          #51068#48152#52264#47049
          #51221#44592#52264#47049)
        LabelCaption = #52264#47049#51333#47448
        LabelPosition = lpLeftCenter
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -12
        LabelFont.Name = #44404#47548#52404
        LabelFont.Style = []
        ParentFont = False
        TabOrder = 0
        Text = #49440#53469
      end
      object cmbFeeNo: TAdvComboBox
        Left = 291
        Top = 39
        Width = 158
        Height = 20
        Color = clWindow
        Version = '1.5.1.0'
        Visible = True
        Style = csDropDownList
        EmptyTextStyle = []
        DropWidth = 0
        Enabled = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ItemIndex = -1
        LabelCaption = #50836#44552#51228
        LabelPosition = lpLeftCenter
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -12
        LabelFont.Name = #44404#47548#52404
        LabelFont.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object cmbIOType: TAdvComboBox
        Left = 595
        Top = 39
        Width = 86
        Height = 20
        Color = clWindow
        Version = '1.5.1.0'
        Visible = True
        Style = csDropDownList
        EmptyTextStyle = []
        DropWidth = 0
        Enabled = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ItemIndex = 0
        Items.Strings = (
          #51077#52264
          #52636#52264)
        LabelCaption = #52636#51077#44396#48516
        LabelPosition = lpLeftCenter
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -12
        LabelFont.Name = #44404#47548#52404
        LabelFont.Style = []
        ParentFont = False
        TabOrder = 2
        Text = #51077#52264
      end
      object edtNormalSTime: TAdvDateTimePicker
        Left = 134
        Top = 73
        Width = 93
        Height = 20
        Date = 39710.000000000000000000
        Format = 'HH:mm'
        Time = 39710.000000000000000000
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ImeName = 'Microsoft Office IME 2007'
        Kind = dkTime
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 3
        BorderStyle = bsSingle
        Ctl3D = True
        DateTime = 39710.000000000000000000
        Version = '1.2.0.6'
        LabelCaption = #54217#51068#52636#51077#49884#51089#49884#44036
        LabelPosition = lpLeftCenter
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -12
        LabelFont.Name = #44404#47548#52404
        LabelFont.Style = []
      end
      object edtNormalETime: TAdvDateTimePicker
        Left = 356
        Top = 73
        Width = 93
        Height = 20
        Date = 39710.000000000000000000
        Format = 'HH:mm'
        Time = 39710.000000000000000000
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ImeName = 'Microsoft Office IME 2007'
        Kind = dkTime
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 4
        BorderStyle = bsSingle
        Ctl3D = True
        DateTime = 39710.000000000000000000
        Version = '1.2.0.6'
        LabelCaption = #54217#51068#52636#51077#51333#47308#49884#44036
        LabelPosition = lpLeftCenter
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -12
        LabelFont.Name = #44404#47548#52404
        LabelFont.Style = []
      end
      object edtSaturdaySTime: TAdvDateTimePicker
        Left = 588
        Top = 73
        Width = 93
        Height = 20
        Date = 39710.000000000000000000
        Format = 'HH:mm'
        Time = 39710.000000000000000000
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ImeName = 'Microsoft Office IME 2007'
        Kind = dkTime
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 5
        BorderStyle = bsSingle
        Ctl3D = True
        DateTime = 39710.000000000000000000
        Version = '1.2.0.6'
        LabelCaption = #53664#50836#51068#52636#51077#49884#51089#49884#44036
        LabelPosition = lpLeftCenter
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -12
        LabelFont.Name = #44404#47548#52404
        LabelFont.Style = []
      end
      object edtSaturdayETime: TAdvDateTimePicker
        Left = 821
        Top = 73
        Width = 93
        Height = 20
        Date = 39710.000000000000000000
        Format = 'HH:mm'
        Time = 39710.000000000000000000
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ImeName = 'Microsoft Office IME 2007'
        Kind = dkTime
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 6
        BorderStyle = bsSingle
        Ctl3D = True
        DateTime = 39710.000000000000000000
        Version = '1.2.0.6'
        LabelCaption = #53664#50836#51068#52636#51077#51333#47308#49884#44036
        LabelPosition = lpLeftCenter
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -12
        LabelFont.Name = #44404#47548#52404
        LabelFont.Style = []
      end
      object edtSundaySTime: TAdvDateTimePicker
        Left = 134
        Top = 105
        Width = 93
        Height = 20
        Date = 39710.000000000000000000
        Format = 'HH:mm'
        Time = 39710.000000000000000000
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ImeName = 'Microsoft Office IME 2007'
        Kind = dkTime
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 7
        BorderStyle = bsSingle
        Ctl3D = True
        DateTime = 39710.000000000000000000
        Version = '1.2.0.6'
        LabelCaption = #51068#50836#51068#52636#51077#49884#51089#49884#44036
        LabelPosition = lpLeftCenter
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -12
        LabelFont.Name = #44404#47548#52404
        LabelFont.Style = []
      end
      object edtSundayETime: TAdvDateTimePicker
        Left = 356
        Top = 105
        Width = 93
        Height = 20
        Date = 39710.000000000000000000
        Format = 'HH:mm'
        Time = 39710.000000000000000000
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ImeName = 'Microsoft Office IME 2007'
        Kind = dkTime
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 8
        BorderStyle = bsSingle
        Ctl3D = True
        DateTime = 39710.000000000000000000
        Version = '1.2.0.6'
        LabelCaption = #51068#50836#51068#52636#51077#51333#47308#49884#44036
        LabelPosition = lpLeftCenter
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -12
        LabelFont.Name = #44404#47548#52404
        LabelFont.Style = []
      end
      object edtSpecialSTime: TAdvDateTimePicker
        Left = 588
        Top = 105
        Width = 93
        Height = 20
        Date = 39710.000000000000000000
        Format = 'HH:mm'
        Time = 39710.000000000000000000
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ImeName = 'Microsoft Office IME 2007'
        Kind = dkTime
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 9
        BorderStyle = bsSingle
        Ctl3D = True
        DateTime = 39710.000000000000000000
        Version = '1.2.0.6'
        LabelCaption = #53945#51221#51068#52636#51077#49884#51089#49884#44036
        LabelPosition = lpLeftCenter
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -12
        LabelFont.Name = #44404#47548#52404
        LabelFont.Style = []
      end
      object edtSpecialETime: TAdvDateTimePicker
        Left = 821
        Top = 105
        Width = 93
        Height = 20
        Date = 39710.000000000000000000
        Format = 'HH:mm'
        Time = 39710.000000000000000000
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ImeName = 'Microsoft Office IME 2007'
        Kind = dkTime
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 10
        BorderStyle = bsSingle
        Ctl3D = True
        DateTime = 39710.000000000000000000
        Version = '1.2.0.6'
        LabelCaption = #53945#51221#51068#52636#51077#51333#47308#49884#44036
        LabelPosition = lpLeftCenter
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -12
        LabelFont.Name = #44404#47548#52404
        LabelFont.Style = []
      end
      object cmbParkNo: TAdvComboBox
        Left = 137
        Top = 10
        Width = 90
        Height = 20
        Color = clWindow
        Version = '1.5.1.0'
        Visible = True
        Style = csDropDownList
        EmptyTextStyle = []
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
        TabOrder = 11
      end
    end
  end
  object qryFeeItem: TADOQuery
    Connection = dmTables.ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from feeitem')
    Left = 56
    Top = 152
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
  object qryTemp: TADOQuery
    Connection = dmTables.ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from FeeItem'
      '')
    Left = 144
    Top = 152
  end
end
