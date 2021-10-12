object frmFreetime: TfrmFreetime
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #47924#47308#44060#48169#49884#44036' '#49444#51221
  ClientHeight = 164
  ClientWidth = 489
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
    Width = 473
    Height = 97
    BevelInner = bvLowered
    TabOrder = 0
    object cmbFreeTime: TAdvComboBox
      Left = 130
      Top = 20
      Width = 80
      Height = 21
      Color = clWindow
      Version = '1.3.1.0'
      Visible = True
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
      TabOrder = 0
      Text = #49324#50857#50504#54632
    end
    object edtFreeTimeS: TAdvMaskEdit
      Left = 130
      Top = 52
      Width = 80
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
      TabOrder = 1
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
      Version = '2.8.5.3'
    end
    object edtFreeTimeE: TAdvMaskEdit
      Left = 340
      Top = 52
      Width = 80
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
      TabOrder = 2
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
      Version = '2.8.5.3'
    end
  end
  object btnSave: TBitBtn
    Left = 264
    Top = 117
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
    TabOrder = 1
    OnClick = btnSaveClick
  end
  object btnClose: TBitBtn
    Left = 384
    Top = 117
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
  object qryFreetime: TADOQuery
    Connection = dmTables.ADODB
    Parameters = <>
    Left = 280
    Top = 8
  end
end
