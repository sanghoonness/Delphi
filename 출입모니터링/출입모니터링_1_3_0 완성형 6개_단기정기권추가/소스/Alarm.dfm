object frmAlarm: TfrmAlarm
  Left = 0
  Top = 0
  Caption = #48660#47001#47532#49828#53944' '#50508#46988
  ClientHeight = 151
  ClientWidth = 638
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
  object Label2: TLabel
    Left = 205
    Top = 237
    Width = 214
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = #52488'(60'#51060#54616#47196' '#51077#47141#54616#50668#51452#49464#50836'!!!)'
  end
  object Label1: TLabel
    Left = 205
    Top = 68
    Width = 214
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = #52488'(60'#51060#54616#47196' '#51077#47141#54616#50668#51452#49464#50836'!!!)'
  end
  object GroupBox1: TGroupBox
    Left = 600
    Top = 226
    Width = 601
    Height = 81
    Caption = #51068#48152#52264#47049' '#51077#52264' '#50508#46988
    TabOrder = 9
  end
  object Button2: TButton
    Left = 567
    Top = 208
    Width = 36
    Height = 20
    Caption = '...'
    TabOrder = 6
    OnClick = Button2Click
  end
  object edtAlarmN: TAdvEdit
    Left = 112
    Top = 208
    Width = 449
    Height = 20
    EmptyTextStyle = []
    LabelCaption = #50508#46988#54028#51068#44221#47196
    LabelPosition = lpLeftCenter
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
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #44404#47548#52404
    Font.Style = []
    ImeName = 'Microsoft Office IME 2007'
    ParentFont = False
    TabOrder = 7
    Text = ''
    Visible = True
    Version = '3.3.2.0'
  end
  object edtTimeN: TAdvEdit
    Left = 112
    Top = 234
    Width = 113
    Height = 20
    EditAlign = eaRight
    EditType = etNumeric
    EmptyTextStyle = []
    LabelCaption = #50508#46988#49884#44036
    LabelPosition = lpLeftCenter
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
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #44404#47548#52404
    Font.Style = []
    ImeMode = imSHanguel
    ImeName = 'Microsoft Office IME 2007'
    ParentFont = False
    TabOrder = 8
    Text = '0'
    Visible = True
    Version = '3.3.2.0'
  end
  object grpblack: TGroupBox
    Left = 16
    Top = 16
    Width = 601
    Height = 81
    Caption = #48660#47001#47532#49828#53944' '#50508#46988
    TabOrder = 5
  end
  object edtAlarmFile: TAdvEdit
    Left = 112
    Top = 42
    Width = 449
    Height = 20
    EmptyTextStyle = []
    LabelCaption = #50508#46988#54028#51068#44221#47196' '
    LabelPosition = lpLeftCenter
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
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #44404#47548#52404
    Font.Style = []
    ImeName = 'Microsoft Office IME 2007'
    ParentFont = False
    TabOrder = 0
    Text = ''
    Visible = True
    Version = '3.3.2.0'
  end
  object Button1: TButton
    Left = 567
    Top = 40
    Width = 36
    Height = 20
    Caption = '...'
    TabOrder = 1
    OnClick = Button1Click
  end
  object btnSave: TBitBtn
    Left = 398
    Top = 103
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
  object btnClose: TBitBtn
    Left = 520
    Top = 103
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
  object edtTime: TAdvEdit
    Left = 112
    Top = 66
    Width = 113
    Height = 20
    EditAlign = eaRight
    EditType = etNumeric
    EmptyTextStyle = []
    LabelCaption = #50508#46988#49884#44036
    LabelPosition = lpLeftCenter
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
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #44404#47548#52404
    Font.Style = []
    ImeMode = imSHanguel
    ImeName = 'Microsoft Office IME 2007'
    ParentFont = False
    TabOrder = 4
    Text = '0'
    Visible = True
    Version = '3.3.2.0'
  end
  object od1: TOpenDialog
    Left = 302
    Top = 222
  end
end
