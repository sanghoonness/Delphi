object frmNewSC: TfrmNewSC
  Left = 544
  Top = 317
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #51221#44592#52264#47049' '#46321#47197
  ClientHeight = 312
  ClientWidth = 625
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #44404#47548#52404
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sb1: TStatusBar
    Left = 0
    Top = 293
    Width = 625
    Height = 19
    Panels = <>
    SimplePanel = True
    ExplicitTop = 298
  end
  object btnSave: TBitBtn
    Left = 307
    Top = 250
    Width = 97
    Height = 35
    Caption = #51200'  '#51109'(&S)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #44404#47548#52404
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
    OnClick = btnSaveClick
  end
  object btnCancel: TBitBtn
    Left = 414
    Top = 250
    Width = 97
    Height = 35
    Caption = #52712'  '#49548'(&C)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #44404#47548#52404
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
    TabOrder = 2
    OnClick = btnCancelClick
  end
  object btnClose: TBitBtn
    Left = 519
    Top = 250
    Width = 97
    Height = 35
    Caption = #51333'  '#47308'(&X)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #44404#47548#52404
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
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 608
    Height = 233
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #44404#47548#52404
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    object Bevel1: TBevel
      Left = 13
      Top = 12
      Width = 77
      Height = 20
    end
    object Label2: TLabel
      Left = 28
      Top = 16
      Width = 48
      Height = 12
      Caption = #44536#47353#48264#54840
      Transparent = True
    end
    object Bevel3: TBevel
      Left = 213
      Top = 164
      Width = 77
      Height = 20
    end
    object Label4: TLabel
      Left = 219
      Top = 168
      Width = 66
      Height = 12
      Caption = #50976#54952#44592#44036' '#45149
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Bevel4: TBevel
      Left = 13
      Top = 135
      Width = 77
      Height = 20
    end
    object Label5: TLabel
      Left = 19
      Top = 139
      Width = 66
      Height = 12
      Caption = 'APB'#49324#50857#50668#48512
      Transparent = True
    end
    object Bevel5: TBevel
      Left = 413
      Top = 163
      Width = 77
      Height = 20
    end
    object Label6: TLabel
      Left = 428
      Top = 167
      Width = 48
      Height = 12
      Caption = #48156#44553#44552#50529
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Bevel6: TBevel
      Left = 213
      Top = 135
      Width = 77
      Height = 20
    end
    object Label7: TLabel
      Left = 222
      Top = 139
      Width = 60
      Height = 12
      Caption = #49324#50857#49884#44036#45824
      Transparent = True
    end
    object Bevel8: TBevel
      Left = 213
      Top = 44
      Width = 77
      Height = 20
    end
    object Label9: TLabel
      Left = 234
      Top = 48
      Width = 36
      Height = 12
      Caption = #49457'  '#47749
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Bevel10: TBevel
      Left = 413
      Top = 44
      Width = 77
      Height = 20
    end
    object Label10: TLabel
      Left = 433
      Top = 48
      Width = 36
      Height = 12
      Caption = #50672#46973#52376
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Bevel11: TBevel
      Left = 13
      Top = 44
      Width = 77
      Height = 20
    end
    object Label11: TLabel
      Left = 28
      Top = 48
      Width = 48
      Height = 12
      Caption = #52264#47049#48264#54840
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Bevel12: TBevel
      Left = 213
      Top = 76
      Width = 77
      Height = 20
    end
    object Label12: TLabel
      Left = 234
      Top = 80
      Width = 36
      Height = 12
      Caption = #49548'  '#49549
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Bevel14: TBevel
      Left = 413
      Top = 77
      Width = 77
      Height = 20
    end
    object Label13: TLabel
      Left = 433
      Top = 81
      Width = 36
      Height = 12
      Caption = #48512#49436#47749
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Bevel15: TBevel
      Left = 13
      Top = 106
      Width = 77
      Height = 20
    end
    object Label14: TLabel
      Left = 34
      Top = 110
      Width = 36
      Height = 12
      Caption = #48708'  '#44256
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Bevel7: TBevel
      Left = 213
      Top = 247
      Width = 77
      Height = 20
      Visible = False
    end
    object Label1: TLabel
      Left = 228
      Top = 251
      Width = 48
      Height = 12
      Caption = #44288#47532#48264#54840
      Transparent = True
      Visible = False
    end
    object Bevel9: TBevel
      Left = 13
      Top = 76
      Width = 77
      Height = 20
    end
    object Label8: TLabel
      Left = 27
      Top = 80
      Width = 48
      Height = 12
      Caption = #52264#47049#51333#47448
      Transparent = True
    end
    object Bevel13: TBevel
      Left = 405
      Top = 247
      Width = 77
      Height = 20
      Visible = False
    end
    object Label15: TLabel
      Left = 414
      Top = 251
      Width = 60
      Height = 12
      Caption = #51452#52264#51109#44396#48516
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object Bevel16: TBevel
      Left = 13
      Top = 164
      Width = 77
      Height = 20
    end
    object Label16: TLabel
      Left = 16
      Top = 168
      Width = 72
      Height = 12
      Caption = #50976#54952#44592#44036#49884#51089
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label3: TLabel
      Left = 29
      Top = 251
      Width = 48
      Height = 12
      Caption = #48156#47131#50668#48512
      Transparent = True
      Visible = False
    end
    object Bevel2: TBevel
      Left = 14
      Top = 247
      Width = 77
      Height = 20
      Visible = False
    end
    object Bevel17: TBevel
      Left = 13
      Top = 194
      Width = 77
      Height = 20
    end
    object Label17: TLabel
      Left = 16
      Top = 198
      Width = 72
      Height = 12
      Caption = #50976#54952#44592#44036#49440#53469
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object edtGroupName: TEdit
      Left = 213
      Top = 12
      Width = 383
      Height = 20
      TabStop = False
      AutoSize = False
      ImeName = 'Microsoft Office IME 2007'
      MaxLength = 50
      ReadOnly = True
      TabOrder = 1
    end
    object cmbAPB: TComboBox
      Left = 96
      Top = 135
      Width = 98
      Height = 20
      Enabled = False
      ImeName = 'Microsoft Office IME 2007'
      ItemIndex = 2
      TabOrder = 12
      Text = #49324#50857#50504#54632
      Items.Strings = (
        #51088#46041
        '1'#54924#51312#51221
        #49324#50857#50504#54632)
    end
    object cmbGroupNo: TComboBox
      Left = 96
      Top = 12
      Width = 99
      Height = 20
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 0
      OnChange = cmbGroupNoChange
    end
    object edtAmount: TSpinEdit
      Left = 496
      Top = 163
      Width = 100
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      MaxValue = 0
      MinValue = 0
      ParentFont = False
      TabOrder = 11
      Value = 0
    end
    object cmbWP: TComboBox
      Left = 296
      Top = 135
      Width = 100
      Height = 20
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 13
      OnChange = cmbWPChange
    end
    object edtWPName: TEdit
      Left = 404
      Top = 135
      Width = 191
      Height = 20
      TabStop = False
      AutoSize = False
      ImeName = 'Microsoft Office IME 2007'
      MaxLength = 50
      ReadOnly = True
      TabOrder = 14
    end
    object edtName: TEdit
      Left = 296
      Top = 44
      Width = 100
      Height = 20
      ImeMode = imSHanguel
      ImeName = 'Microsoft IME 2010'
      MaxLength = 50
      TabOrder = 3
    end
    object edtTelNo: TEdit
      Left = 496
      Top = 44
      Width = 100
      Height = 20
      ImeName = 'Microsoft IME 2010'
      MaxLength = 50
      TabOrder = 4
    end
    object edtCarNo: TEdit
      Left = 96
      Top = 44
      Width = 100
      Height = 20
      ImeMode = imSHanguel
      ImeName = 'Microsoft IME 2010'
      MaxLength = 50
      TabOrder = 2
    end
    object edtCompName: TEdit
      Left = 296
      Top = 76
      Width = 100
      Height = 20
      ImeMode = imSHanguel
      ImeName = 'Microsoft IME 2010'
      MaxLength = 50
      TabOrder = 6
    end
    object edtDeptName: TEdit
      Left = 496
      Top = 77
      Width = 100
      Height = 20
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeMode = imSHanguel
      ImeName = 'Microsoft IME 2010'
      MaxLength = 50
      ParentFont = False
      TabOrder = 7
    end
    object edtAddress: TEdit
      Left = 96
      Top = 106
      Width = 499
      Height = 20
      ImeMode = imSHanguel
      ImeName = 'Microsoft IME 2010'
      MaxLength = 100
      TabOrder = 8
    end
    object edtTKNo: TEdit
      Left = 296
      Top = 247
      Width = 100
      Height = 20
      ImeName = 'Microsoft Office IME 2007'
      MaxLength = 4
      TabOrder = 16
      Visible = False
    end
    object edtCarType: TEdit
      Left = 96
      Top = 76
      Width = 100
      Height = 20
      ImeMode = imSHanguel
      ImeName = 'Microsoft IME 2010'
      MaxLength = 50
      TabOrder = 5
    end
    object edtExpDateF: TAdvDateTimePicker
      Left = 96
      Top = 164
      Width = 99
      Height = 20
      Date = 39710.652071759260000000
      Format = ''
      Time = 39710.652071759260000000
      DoubleBuffered = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeName = 'Microsoft Office IME 2007'
      Kind = dkDate
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 9
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
    object edtExpDateT: TAdvDateTimePicker
      Left = 296
      Top = 164
      Width = 99
      Height = 20
      Date = 39710.652071759260000000
      Format = ''
      Time = 39710.652071759260000000
      DoubleBuffered = True
      ImeName = 'Microsoft Office IME 2007'
      Kind = dkDate
      ParentDoubleBuffered = False
      TabOrder = 10
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
    object cmbParkGubun: TComboBox
      Left = 488
      Top = 247
      Width = 100
      Height = 20
      ImeName = 'Microsoft Office IME 2007'
      ItemIndex = 0
      TabOrder = 15
      Text = 'VIP'
      Visible = False
      OnChange = cmbWPChange
      Items.Strings = (
        'VIP'
        #50668#44428
        #48372#51312)
    end
    object cmbValetChk: TComboBox
      Left = 96
      Top = 247
      Width = 97
      Height = 20
      ItemIndex = 0
      TabOrder = 17
      Text = #48156#47131#48520#44032
      Visible = False
      Items.Strings = (
        #48156#47131#48520#44032
        #48156#47131#44032#45733)
    end
    object Button1: TButton
      Left = 96
      Top = 192
      Width = 75
      Height = 25
      Caption = #51068#51452#51068
      TabOrder = 18
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 176
      Top = 192
      Width = 75
      Height = 25
      Caption = '1'#44060#50900
      TabOrder = 19
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 256
      Top = 192
      Width = 75
      Height = 25
      Caption = '2'#44060#50900
      TabOrder = 20
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 336
      Top = 192
      Width = 75
      Height = 25
      Caption = '3'#44060#50900
      TabOrder = 21
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 416
      Top = 192
      Width = 75
      Height = 25
      Caption = '6'#44060#50900
      TabOrder = 22
      OnClick = Button5Click
    end
  end
  object qryCustInfo: TADOQuery
    Connection = dmTables.ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from CustInfo')
    Left = 88
    Top = 240
    object qryCustInfoParkNo: TSmallintField
      FieldName = 'ParkNo'
    end
    object qryCustInfoTKType: TWordField
      FieldName = 'TKType'
    end
    object qryCustInfoGroupNo: TWordField
      FieldName = 'GroupNo'
    end
    object qryCustInfoTKNo: TStringField
      FieldName = 'TKNo'
      Size = 50
    end
    object qryCustInfoName: TStringField
      FieldName = 'Name'
      Size = 50
    end
    object qryCustInfoTelNo: TStringField
      FieldName = 'TelNo'
      Size = 50
    end
    object qryCustInfoCarNo: TStringField
      FieldName = 'CarNo'
      Size = 50
    end
    object qryCustInfoCompName: TStringField
      FieldName = 'CompName'
      Size = 50
    end
    object qryCustInfoDeptName: TStringField
      FieldName = 'DeptName'
      Size = 50
    end
    object qryCustInfoAddress: TStringField
      FieldName = 'Address'
      Size = 100
    end
    object qryCustInfoIssueDate: TStringField
      FieldName = 'IssueDate'
      FixedChar = True
      Size = 10
    end
    object qryCustInfoIssueAmt: TIntegerField
      FieldName = 'IssueAmt'
    end
    object qryCustInfoStatus: TWordField
      FieldName = 'Status'
    end
    object qryCustInfoExpDateF: TStringField
      FieldName = 'ExpDateF'
      FixedChar = True
      Size = 10
    end
    object qryCustInfoExpDateT: TStringField
      FieldName = 'ExpDateT'
      FixedChar = True
      Size = 10
    end
    object qryCustInfoWPNo: TWordField
      FieldName = 'WPNo'
    end
    object qryCustInfoLastParkNo: TSmallintField
      FieldName = 'LastParkNo'
    end
    object qryCustInfoLastUnitNo: TWordField
      FieldName = 'LastUnitNo'
    end
    object qryCustInfoLastUseDate: TStringField
      FieldName = 'LastUseDate'
      FixedChar = True
      Size = 10
    end
    object qryCustInfoLastUseTime: TStringField
      FieldName = 'LastUseTime'
      FixedChar = True
      Size = 8
    end
    object qryCustInfoIOStatusNo: TWordField
      FieldName = 'IOStatusNo'
    end
    object qryCustInfoCurrAmt: TIntegerField
      FieldName = 'CurrAmt'
    end
    object qryCustInfoAPB: TWordField
      FieldName = 'APB'
    end
    object qryCustInfoCarTypeNo: TWordField
      FieldName = 'CarType'
    end
    object qryCustInfoMarkNo: TStringField
      FieldName = 'MarkNo'
      Size = 50
    end
    object qryCustInfoReserve1: TStringField
      FieldName = 'Reserve1'
      Size = 50
    end
    object qryCustInfoReserve2: TStringField
      FieldName = 'Reserve2'
      Size = 50
    end
    object qryCustInfoReserve3: TStringField
      FieldName = 'Reserve3'
      Size = 50
    end
    object qryCustInfoReserve4: TStringField
      FieldName = 'Reserve4'
      Size = 50
    end
    object qryCustInfoReserve5: TStringField
      FieldName = 'Reserve5'
      Size = 50
    end
  end
  object qry1: TADOQuery
    Connection = dmTables.ADODB
    Parameters = <>
    Left = 144
    Top = 240
  end
  object qryGroup: TADOQuery
    Connection = dmTables.ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from GGroup')
    Left = 200
    Top = 240
    object qryGroupParkNo: TSmallintField
      FieldName = 'ParkNo'
    end
    object qryGroupGroupNo: TWordField
      FieldName = 'GroupNo'
    end
    object qryGroupGroupName: TStringField
      FieldName = 'GroupName'
      Size = 50
    end
    object qryGroupAPB: TWordField
      FieldName = 'APB'
    end
    object qryGroupStatus: TWordField
      FieldName = 'Status'
    end
    object qryGroupRemark: TStringField
      FieldName = 'Remark'
      Size = 255
    end
    object qryGroupGroupType: TWordField
      FieldName = 'GroupType'
    end
    object qryGroupUseFeeItem: TWordField
      FieldName = 'UseFeeItem'
    end
    object qryGroupReserve1: TStringField
      FieldName = 'Reserve1'
      Size = 50
    end
    object qryGroupReserve2: TStringField
      FieldName = 'Reserve2'
      Size = 50
    end
    object qryGroupReserve3: TStringField
      FieldName = 'Reserve3'
      Size = 50
    end
    object qryGroupReserve4: TStringField
      FieldName = 'Reserve4'
      Size = 50
    end
    object qryGroupReserve5: TStringField
      FieldName = 'Reserve5'
      Size = 50
    end
  end
  object dsCustInfo: TDataSource
    DataSet = qryCustInfo
    Left = 24
    Top = 240
  end
end
