object frmNewRFSC: TfrmNewRFSC
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'RF'#51221#44592#44428' '#49888#44508#48156#44553
  ClientHeight = 322
  ClientWidth = 626
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
    Left = 9
    Top = 8
    Width = 608
    Height = 238
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #44404#47548#52404
    Font.Style = []
    ParentFont = False
    TabOrder = 0
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
    object Bevel2: TBevel
      Left = 13
      Top = 172
      Width = 77
      Height = 20
    end
    object Label3: TLabel
      Left = 16
      Top = 176
      Width = 72
      Height = 12
      Caption = #50976#54952#44592#44036#49884#51089
      Transparent = True
    end
    object Bevel3: TBevel
      Left = 213
      Top = 172
      Width = 77
      Height = 20
    end
    object Label4: TLabel
      Left = 219
      Top = 176
      Width = 66
      Height = 12
      Caption = #50976#54952#44592#44036' '#45149
      Transparent = True
    end
    object Bevel4: TBevel
      Left = 413
      Top = 172
      Width = 77
      Height = 20
    end
    object Label5: TLabel
      Left = 419
      Top = 176
      Width = 66
      Height = 12
      Caption = 'APB'#49324#50857#50668#48512
      Transparent = True
    end
    object Bevel5: TBevel
      Left = 13
      Top = 204
      Width = 77
      Height = 20
    end
    object Label6: TLabel
      Left = 28
      Top = 208
      Width = 48
      Height = 12
      Caption = #48156#44553#44552#50529
      Transparent = True
    end
    object Bevel6: TBevel
      Left = 213
      Top = 204
      Width = 77
      Height = 20
    end
    object Label7: TLabel
      Left = 222
      Top = 208
      Width = 60
      Height = 12
      Caption = #49324#50857#49884#44036#45824
      Transparent = True
    end
    object Bevel8: TBevel
      Left = 213
      Top = 76
      Width = 77
      Height = 20
    end
    object Label9: TLabel
      Left = 234
      Top = 80
      Width = 36
      Height = 12
      Caption = #49457'  '#47749
      Transparent = True
    end
    object Bevel10: TBevel
      Left = 413
      Top = 76
      Width = 77
      Height = 20
    end
    object Label10: TLabel
      Left = 428
      Top = 80
      Width = 48
      Height = 12
      Caption = #51204#54868#48264#54840
      Transparent = True
    end
    object Bevel11: TBevel
      Left = 13
      Top = 76
      Width = 77
      Height = 20
    end
    object Label11: TLabel
      Left = 28
      Top = 80
      Width = 48
      Height = 12
      Caption = #52264#47049#48264#54840
      Transparent = True
    end
    object Bevel12: TBevel
      Left = 13
      Top = 108
      Width = 77
      Height = 20
    end
    object Label12: TLabel
      Left = 34
      Top = 112
      Width = 36
      Height = 12
      Caption = #54924#49324#47749
      Transparent = True
    end
    object Bevel14: TBevel
      Left = 213
      Top = 108
      Width = 77
      Height = 20
    end
    object Label13: TLabel
      Left = 234
      Top = 112
      Width = 36
      Height = 12
      Caption = #48512#49436#47749
      Transparent = True
    end
    object Bevel15: TBevel
      Left = 13
      Top = 140
      Width = 77
      Height = 20
    end
    object Label14: TLabel
      Left = 34
      Top = 144
      Width = 36
      Height = 12
      Caption = #51452'  '#49548
      Transparent = True
    end
    object Bevel9: TBevel
      Left = 13
      Top = 44
      Width = 77
      Height = 20
    end
    object Label17: TLabel
      Left = 22
      Top = 48
      Width = 60
      Height = 12
      Caption = #51221#44592#44428#48264#54840
      Transparent = True
    end
    object edtGroupName: TEdit
      Left = 213
      Top = 12
      Width = 380
      Height = 20
      TabStop = False
      AutoSize = False
      ImeName = 'Microsoft Office IME 2007'
      MaxLength = 50
      ReadOnly = True
      TabOrder = 1
    end
    object cmbAPB: TComboBox
      Left = 496
      Top = 172
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
    object edtExpDateF: TMaskEdit
      Left = 96
      Top = 172
      Width = 99
      Height = 20
      AutoSize = False
      EditMask = '!9999/99/99;1;_'
      ImeName = 'Microsoft Office IME 2007'
      MaxLength = 10
      TabOrder = 10
      Text = '    -  -  '
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
    object edtExpDateT: TMaskEdit
      Left = 296
      Top = 172
      Width = 100
      Height = 20
      AutoSize = False
      EditMask = '!9999/99/99;1;_'
      ImeName = 'Microsoft Office IME 2007'
      MaxLength = 10
      TabOrder = 11
      Text = '    -  -  '
    end
    object edtAmount: TSpinEdit
      Left = 96
      Top = 204
      Width = 100
      Height = 21
      MaxValue = 0
      MinValue = 0
      TabOrder = 13
      Value = 0
    end
    object cmbWP: TComboBox
      Left = 296
      Top = 204
      Width = 100
      Height = 20
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 14
      OnChange = cmbWPChange
    end
    object edtWPName: TEdit
      Left = 404
      Top = 204
      Width = 191
      Height = 20
      TabStop = False
      AutoSize = False
      ImeName = 'Microsoft Office IME 2007'
      MaxLength = 50
      ReadOnly = True
      TabOrder = 15
    end
    object edtName: TEdit
      Left = 296
      Top = 76
      Width = 100
      Height = 20
      ImeMode = imSHanguel
      ImeName = 'Microsoft Office IME 2007'
      MaxLength = 50
      TabOrder = 5
    end
    object edtTelNo: TEdit
      Left = 496
      Top = 76
      Width = 100
      Height = 20
      ImeName = 'Microsoft Office IME 2007'
      MaxLength = 50
      TabOrder = 6
    end
    object edtCarNo: TEdit
      Left = 96
      Top = 76
      Width = 100
      Height = 20
      ImeMode = imSHanguel
      ImeName = 'Microsoft Office IME 2007'
      MaxLength = 50
      TabOrder = 4
    end
    object edtCompName: TEdit
      Left = 96
      Top = 108
      Width = 100
      Height = 20
      ImeMode = imSHanguel
      ImeName = 'Microsoft Office IME 2007'
      MaxLength = 50
      TabOrder = 7
    end
    object edtDeptName: TEdit
      Left = 296
      Top = 108
      Width = 100
      Height = 20
      ImeMode = imSHanguel
      ImeName = 'Microsoft Office IME 2007'
      MaxLength = 50
      TabOrder = 8
    end
    object edtAddress: TEdit
      Left = 96
      Top = 140
      Width = 500
      Height = 20
      ImeMode = imSHanguel
      ImeName = 'Microsoft Office IME 2007'
      MaxLength = 100
      TabOrder = 9
    end
    object edtTKNo: TEdit
      Left = 96
      Top = 44
      Width = 99
      Height = 20
      ImeName = 'Microsoft Office IME 2007'
      MaxLength = 20
      TabOrder = 2
      OnExit = edtTKNoExit
    end
    object edtMarkNo: TEdit
      Left = 213
      Top = 44
      Width = 381
      Height = 20
      TabStop = False
      AutoSize = False
      ImeName = 'Microsoft Office IME 2007'
      MaxLength = 50
      ReadOnly = True
      TabOrder = 3
    end
  end
  object btnSave: TBitBtn
    Left = 293
    Top = 257
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
    TabOrder = 1
    OnClick = btnSaveClick
  end
  object btnCancel: TBitBtn
    Left = 406
    Top = 257
    Width = 97
    Height = 35
    Caption = #52712'  '#49548
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
    TabOrder = 2
    OnClick = btnCancelClick
  end
  object btnClose: TBitBtn
    Left = 521
    Top = 252
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
  object sb1: TStatusBar
    Left = 0
    Top = 303
    Width = 626
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object qryCustInfo: TADOQuery
    Connection = dmTables.ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from CustInfo')
    Left = 152
    Top = 8
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
    Left = 200
    Top = 8
  end
  object qryGroup: TADOQuery
    Connection = dmTables.ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from GGroup')
    Left = 248
    Top = 8
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
    object qryGroupRF1: TWordField
      FieldName = 'RF1'
    end
    object qryGroupRF2: TWordField
      FieldName = 'RF2'
    end
    object qryGroupRF3: TWordField
      FieldName = 'RF3'
    end
    object qryGroupRF4: TWordField
      FieldName = 'RF4'
    end
    object qryGroupRF5: TWordField
      FieldName = 'RF5'
    end
    object qryGroupRF6: TWordField
      FieldName = 'RF6'
    end
    object qryGroupRF7: TWordField
      FieldName = 'RF7'
    end
    object qryGroupRF8: TWordField
      FieldName = 'RF8'
    end
    object qryGroupRF9: TWordField
      FieldName = 'RF9'
    end
    object qryGroupRF10: TWordField
      FieldName = 'RF10'
    end
    object qryGroupRF11: TWordField
      FieldName = 'RF11'
    end
    object qryGroupRF12: TWordField
      FieldName = 'RF12'
    end
    object qryGroupRF13: TWordField
      FieldName = 'RF13'
    end
    object qryGroupRF14: TWordField
      FieldName = 'RF14'
    end
    object qryGroupRF15: TWordField
      FieldName = 'RF15'
    end
    object qryGroupRF16: TWordField
      FieldName = 'RF16'
    end
    object qryGroupRF17: TWordField
      FieldName = 'RF17'
    end
    object qryGroupRF18: TWordField
      FieldName = 'RF18'
    end
    object qryGroupRF19: TWordField
      FieldName = 'RF19'
    end
    object qryGroupRF20: TWordField
      FieldName = 'RF20'
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
    Left = 152
    Top = 64
  end
end
