object frmAlarm_vip: TfrmAlarm_vip
  Left = 592
  Top = 378
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #50508#46988' '#49444#51221
  ClientHeight = 143
  ClientWidth = 619
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #44404#47548#52404
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 195
    Top = 60
    Width = 214
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = #52488'(60'#51060#54616#47196' '#51077#47141#54616#50668#51452#49464#50836'!!!)'
  end
  object edtFile: TAdvEdit
    Left = 80
    Top = 24
    Width = 473
    Height = 20
    EmptyTextStyle = []
    LabelCaption = #54028#51068#44221#47196' '
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
    Left = 557
    Top = 22
    Width = 36
    Height = 25
    Caption = '...'
    TabOrder = 1
    OnClick = Button1Click
  end
  object btnSave: TBitBtn
    Left = 392
    Top = 89
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
    Left = 498
    Top = 89
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
    Left = 80
    Top = 56
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
    Left = 24
    Top = 96
  end
end
