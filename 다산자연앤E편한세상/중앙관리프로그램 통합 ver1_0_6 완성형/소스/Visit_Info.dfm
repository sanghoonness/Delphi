object frmVisit_Info: TfrmVisit_Info
  Left = 0
  Top = 0
  Caption = #49324#51204#48169#47928#52264#47049' '#51312#54924
  ClientHeight = 544
  ClientWidth = 784
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
  object dg1: TDBGrid
    Left = 8
    Top = 8
    Width = 761
    Height = 401
    DataSource = dsVisit_Info
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'dong'
        Title.Alignment = taCenter
        Title.Caption = #46041
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ho'
        Title.Alignment = taCenter
        Title.Caption = #54840
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CarNo'
        Title.Alignment = taCenter
        Title.Caption = #52264#47049#48264#54840
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 120
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'visitstart'
        Title.Alignment = taCenter
        Title.Caption = #48169#47928#51077#52264#51068#51088
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 200
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'visitend'
        Title.Alignment = taCenter
        Title.Caption = #48169#47928#52636#52264#51068#51088
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 200
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 8
    Top = 415
    Width = 761
    Height = 74
    TabOrder = 1
    object Bevel1: TBevel
      Left = 14
      Top = 12
      Width = 35
      Height = 20
    end
    object Label3: TLabel
      Left = 25
      Top = 16
      Width = 12
      Height = 12
      Alignment = taCenter
      Caption = #46041
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Bevel2: TBevel
      Left = 123
      Top = 12
      Width = 35
      Height = 20
    end
    object Label1: TLabel
      Left = 135
      Top = 16
      Width = 12
      Height = 12
      Alignment = taCenter
      Caption = #54840
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Bevel3: TBevel
      Left = 232
      Top = 12
      Width = 67
      Height = 20
    end
    object Label2: TLabel
      Left = 241
      Top = 17
      Width = 48
      Height = 12
      Alignment = taCenter
      Caption = #52264#47049#48264#54840
      Font.Charset = ANSI_CHARSET
      Font.Color = 7485192
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Bevel4: TBevel
      Left = 15
      Top = 45
      Width = 70
      Height = 20
    end
    object Label4: TLabel
      Left = 25
      Top = 51
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
    object Label5: TLabel
      Left = 188
      Top = 43
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
    object edtdong: TEdit
      Left = 55
      Top = 12
      Width = 66
      Height = 20
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeMode = imSHanguel
      ImeName = 'Microsoft IME 2010'
      ParentFont = False
      TabOrder = 0
    end
    object edtho: TEdit
      Left = 164
      Top = 12
      Width = 66
      Height = 20
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeMode = imSHanguel
      ImeName = 'Microsoft IME 2010'
      ParentFont = False
      TabOrder = 1
    end
    object edtCarNo: TEdit
      Left = 299
      Top = 12
      Width = 86
      Height = 20
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeMode = imSHanguel
      ImeName = 'Microsoft IME 2010'
      ParentFont = False
      TabOrder = 2
    end
    object edtSDate: TAdvDateTimePicker
      Left = 91
      Top = 45
      Width = 89
      Height = 20
      Date = 39710.652071759260000000
      Format = ''
      Time = 39710.652071759260000000
      DoubleBuffered = True
      ImeName = 'Microsoft Office IME 2007'
      Kind = dkDate
      ParentDoubleBuffered = False
      TabOrder = 3
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
    object edtEDate: TAdvDateTimePicker
      Left = 203
      Top = 45
      Width = 89
      Height = 20
      Date = 39710.652071759260000000
      Format = ''
      Time = 39710.652071759260000000
      DoubleBuffered = True
      ImeName = 'Microsoft Office IME 2007'
      Kind = dkDate
      ParentDoubleBuffered = False
      TabOrder = 4
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
  object btnSearch: TBitBtn
    Left = 464
    Top = 495
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
    TabOrder = 2
    OnClick = btnSearchClick
  end
  object btnClose: TBitBtn
    Left = 672
    Top = 495
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
  object BtnExcel: TBitBtn
    Left = 569
    Top = 495
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
    TabOrder = 4
    OnClick = BtnExcelClick
  end
  object qryVisit_Info: TADOQuery
    Connection = dmTables.ADODB
    Parameters = <>
    Left = 40
    Top = 64
    object qryVisit_Infodong: TStringField
      FieldName = 'dong'
    end
    object qryVisit_Infoho: TStringField
      FieldName = 'ho'
    end
    object qryVisit_InfoCarNo: TStringField
      FieldName = 'CarNo'
    end
    object qryVisit_Infovisitstart: TStringField
      FieldName = 'visitstart'
    end
    object qryVisit_Infovisitend: TStringField
      FieldName = 'visitend'
    end
  end
  object dsVisit_Info: TDataSource
    DataSet = qryVisit_Info
    Left = 40
    Top = 120
  end
end
