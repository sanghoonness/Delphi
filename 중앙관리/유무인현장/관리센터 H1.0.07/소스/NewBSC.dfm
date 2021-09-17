object frmNewBSC: TfrmNewBSC
  Left = 0
  Top = 0
  Caption = #48660#47001#47532#49828#53944' '#46321#47197
  ClientHeight = 249
  ClientWidth = 523
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
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 507
    Height = 161
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Bevel11: TBevel
      Left = 22
      Top = 65
      Width = 100
      Height = 30
    end
    object Label11: TLabel
      Left = 39
      Top = 72
      Width = 64
      Height = 16
      Caption = #52264#47049#48264#54840
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Bevel1: TBevel
      Left = 22
      Top = 20
      Width = 100
      Height = 30
    end
    object Label1: TLabel
      Left = 30
      Top = 25
      Width = 80
      Height = 16
      Alignment = taCenter
      Caption = #51452#52264#51109#48264#54840
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Bevel2: TBevel
      Left = 22
      Top = 111
      Width = 100
      Height = 30
    end
    object Label2: TLabel
      Left = 42
      Top = 118
      Width = 64
      Height = 16
      Caption = #46321#47197#49324#50976
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object edtBCarNo: TEdit
      Left = 128
      Top = 64
      Width = 189
      Height = 31
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ImeMode = imSHanguel
      ImeName = 'Microsoft Office IME 2007'
      MaxLength = 50
      ParentFont = False
      TabOrder = 0
    end
    object cmbParkNo: TAdvComboBox
      Left = 128
      Top = 20
      Width = 120
      Height = 27
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
      Font.Height = -19
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeName = 'Microsoft Office IME 2007'
      ItemIndex = -1
      LabelPosition = lpLeftCenter
      LabelTransparent = True
      LabelAlwaysEnabled = True
      LabelFont.Charset = ANSI_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = #44404#47548#52404
      LabelFont.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object edtRegReason: TEdit
      Left = 128
      Top = 110
      Width = 369
      Height = 31
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ImeMode = imSHanguel
      ImeName = 'Microsoft Office IME 2007'
      MaxLength = 50
      ParentFont = False
      TabOrder = 2
    end
  end
  object sb1: TStatusBar
    Left = 0
    Top = 230
    Width = 523
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object btnSave: TBitBtn
    Left = 295
    Top = 184
    Width = 97
    Height = 35
    Caption = #51200'  '#51109
    Font.Charset = ANSI_CHARSET
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
  object btnClose: TBitBtn
    Left = 418
    Top = 184
    Width = 97
    Height = 35
    Caption = #51333'  '#47308
    Font.Charset = ANSI_CHARSET
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
    TabOrder = 3
    OnClick = btnCloseClick
  end
  object qryBlackList: TADOQuery
    Connection = dmTables.ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from BlackList')
    Left = 30
    Top = 176
    object qryBlackListParkNo: TSmallintField
      FieldName = 'ParkNo'
    end
    object qryBlackListBCarNo: TStringField
      FieldName = 'BCarNo'
    end
    object qryBlackListBRegDate: TStringField
      FieldName = 'BRegDate'
      FixedChar = True
      Size = 10
    end
    object qryBlackListBRegTime: TStringField
      FieldName = 'BRegTime'
      FixedChar = True
      Size = 8
    end
    object qryBlackListUnpaidAmt: TIntegerField
      FieldName = 'UnpaidAmt'
    end
    object qryBlackListMNo: TSmallintField
      FieldName = 'MNo'
    end
    object qryBlackListRegReason: TStringField
      FieldName = 'RegReason'
      Size = 100
    end
    object qryBlackListReserve1: TStringField
      FieldName = 'Reserve1'
      Size = 100
    end
    object qryBlackListReserve2: TStringField
      FieldName = 'Reserve2'
      Size = 100
    end
    object qryBlackListReserve3: TStringField
      FieldName = 'Reserve3'
      Size = 100
    end
    object qryBlackListReserve4: TStringField
      FieldName = 'Reserve4'
      Size = 50
    end
    object qryBlackListReserve5: TStringField
      FieldName = 'Reserve5'
      Size = 50
    end
  end
  object dsBlackList: TDataSource
    DataSet = qryBlackList
    Left = 94
    Top = 176
  end
end
