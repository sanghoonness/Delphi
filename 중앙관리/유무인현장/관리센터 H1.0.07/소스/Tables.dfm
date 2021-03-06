object dmTables: TdmTables
  OldCreateOrder = False
  Height = 320
  Width = 427
  object ADODB: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=nexpa1234;Persist Security Info=Tru' +
      'e;User ID=sa;Initial Catalog=PARKING;Data Source=127.0.0.1,42130'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 24
  end
  object dsCustInfo: TDataSource
    DataSet = qryCustInfo
    Left = 32
    Top = 152
  end
  object qryTemp: TADOQuery
    Connection = ADODB
    Parameters = <>
    Left = 112
    Top = 152
  end
  object qryWP: TADOQuery
    Connection = ADODB
    Parameters = <>
    SQL.Strings = (
      'Select * from WP')
    Left = 112
    Top = 88
  end
  object qryGroup: TADOQuery
    Connection = ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from GGroup')
    Left = 184
    Top = 88
    object qryGroupParkNo: TSmallintField
      FieldName = 'ParkNo'
    end
    object qryGroupGroupNo: TSmallintField
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
  object qryCustInfo_D: TADOQuery
    Connection = ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Custinfo')
    Left = 112
    Top = 208
    object SmallintField1: TSmallintField
      FieldName = 'ParkNo'
    end
    object WordField1: TWordField
      FieldName = 'TKType'
    end
    object SmallintField2: TSmallintField
      FieldName = 'GroupNo'
    end
    object StringField1: TStringField
      FieldName = 'TKNo'
      Size = 50
    end
    object StringField2: TStringField
      FieldName = 'Name'
      Size = 50
    end
    object StringField3: TStringField
      FieldName = 'TelNo'
      Size = 50
    end
    object StringField4: TStringField
      FieldName = 'CarNo'
      Size = 50
    end
    object StringField5: TStringField
      FieldName = 'CompName'
      Size = 50
    end
    object StringField6: TStringField
      FieldName = 'DeptName'
      Size = 50
    end
    object StringField7: TStringField
      FieldName = 'Address'
      Size = 100
    end
    object StringField8: TStringField
      FieldName = 'IssueDate'
      FixedChar = True
      Size = 10
    end
    object IntegerField1: TIntegerField
      FieldName = 'IssueAmt'
    end
    object WordField2: TWordField
      FieldName = 'Status'
    end
    object StringField9: TStringField
      FieldName = 'ExpDateF'
      FixedChar = True
      Size = 10
    end
    object StringField10: TStringField
      FieldName = 'ExpDateT'
      FixedChar = True
      Size = 10
    end
    object WordField3: TWordField
      FieldName = 'WPNo'
    end
    object SmallintField3: TSmallintField
      FieldName = 'LastParkNo'
    end
    object SmallintField4: TSmallintField
      FieldName = 'LastUnitNo'
    end
    object StringField11: TStringField
      FieldName = 'LastUseDate'
      FixedChar = True
      Size = 10
    end
    object StringField12: TStringField
      FieldName = 'LastUseTime'
      FixedChar = True
      Size = 8
    end
    object WordField4: TWordField
      FieldName = 'IOStatusNo'
    end
    object IntegerField2: TIntegerField
      FieldName = 'CurrAmt'
    end
    object WordField5: TWordField
      FieldName = 'APB'
    end
    object WordField6: TWordField
      FieldName = 'CarType'
    end
    object StringField13: TStringField
      FieldName = 'MarkNo'
      Size = 50
    end
    object WordField7: TWordField
      FieldName = 'HIType'
      OnGetText = qryCustInfoHITypeGetText
    end
    object StringField14: TStringField
      FieldName = 'HISTime'
      FixedChar = True
      Size = 5
    end
    object StringField15: TStringField
      FieldName = 'HIETime'
      FixedChar = True
      Size = 5
    end
    object StringField16: TStringField
      FieldName = 'Reserve1'
      Size = 50
    end
    object StringField17: TStringField
      FieldName = 'Reserve2'
      Size = 50
    end
    object StringField18: TStringField
      FieldName = 'Reserve3'
      Size = 50
    end
    object StringField19: TStringField
      FieldName = 'Reserve4'
      Size = 50
    end
    object StringField20: TStringField
      FieldName = 'Reserve5'
      Size = 50
    end
    object StringField21: TStringField
      FieldName = 'DelDate'
      Size = 10
    end
  end
  object dsCustInfo_D: TDataSource
    DataSet = qryCustInfo_D
    Left = 32
    Top = 208
  end
  object qryCustInfo: TADOQuery
    Connection = ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from custinfo')
    Left = 32
    Top = 96
    object qryCustInfoParkNo: TSmallintField
      FieldName = 'ParkNo'
    end
    object qryCustInfoTKType: TWordField
      FieldName = 'TKType'
    end
    object qryCustInfoGroupNo: TSmallintField
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
    object qryCustInfoLastUnitNo: TSmallintField
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
    object qryCustInfoCarType: TWordField
      FieldName = 'CarType'
    end
    object qryCustInfoMarkNo: TStringField
      FieldName = 'MarkNo'
      Size = 50
    end
    object qryCustInfoHIType: TWordField
      FieldName = 'HIType'
      OnGetText = qryCustInfoHITypeGetText
    end
    object qryCustInfoHISTime: TStringField
      FieldName = 'HISTime'
      FixedChar = True
      Size = 5
    end
    object qryCustInfoHIETime: TStringField
      FieldName = 'HIETime'
      FixedChar = True
      Size = 5
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
    object qryCustInfoPayType: TIntegerField
      FieldName = 'PayType'
      OnGetText = qryCustInfoPayTypeGetText
    end
  end
  object qryParkKind: TADOQuery
    AutoCalcFields = False
    Connection = ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from ParkKind')
    Left = 128
    Top = 256
    object qryParkKindUserParkNo: TIntegerField
      FieldName = 'UserParkNo'
    end
    object qryParkKindParkName: TStringField
      FieldName = 'ParkName'
      Size = 50
    end
    object qryParkKindReserve1: TStringField
      FieldName = 'Reserve1'
      Size = 50
    end
    object qryParkKindReserve2: TStringField
      FieldName = 'Reserve2'
      Size = 50
    end
    object qryParkKindReserve3: TStringField
      FieldName = 'Reserve3'
      Size = 50
    end
    object qryParkKindReserve4: TStringField
      FieldName = 'Reserve4'
      Size = 50
    end
    object qryParkKindReserve5: TStringField
      FieldName = 'Reserve5'
      Size = 50
    end
  end
  object qryGroup1: TADOQuery
    Connection = ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from GGroupDepth')
    Left = 203
    Top = 248
    object qryGroup1ParkNo: TSmallintField
      FieldName = 'ParkNo'
    end
    object qryGroup1GroupDepthNo: TAutoIncField
      FieldName = 'GroupDepthNo'
      ReadOnly = True
    end
    object qryGroup1GroupDepth: TSmallintField
      FieldName = 'GroupDepth'
    end
    object qryGroup1GroupName: TStringField
      FieldName = 'GroupName'
      Size = 40
    end
    object qryGroup1UseYn: TIntegerField
      FieldName = 'UseYn'
    end
    object qryGroup1DelYn: TIntegerField
      FieldName = 'DelYn'
    end
    object qryGroup1Reserve1: TStringField
      FieldName = 'Reserve1'
      Size = 50
    end
    object qryGroup1Reserve2: TStringField
      FieldName = 'Reserve2'
      Size = 50
    end
    object qryGroup1Reserve3: TStringField
      FieldName = 'Reserve3'
      Size = 50
    end
    object qryGroup1Reserve4: TStringField
      FieldName = 'Reserve4'
      Size = 50
    end
    object qryGroup1Reserve5: TStringField
      FieldName = 'Reserve5'
      Size = 50
    end
  end
  object qryGroup2: TADOQuery
    Connection = ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from GGroupDepth')
    Left = 259
    Top = 249
    object qryGroup2ParkNo: TSmallintField
      FieldName = 'ParkNo'
    end
    object qryGroup2GroupDepthNo: TAutoIncField
      FieldName = 'GroupDepthNo'
      ReadOnly = True
    end
    object qryGroup2GroupDepth: TSmallintField
      FieldName = 'GroupDepth'
    end
    object qryGroup2GroupName: TStringField
      FieldName = 'GroupName'
      Size = 40
    end
    object qryGroup2UseYn: TIntegerField
      FieldName = 'UseYn'
    end
    object qryGroup2DelYn: TIntegerField
      FieldName = 'DelYn'
    end
    object qryGroup2Reserve1: TStringField
      FieldName = 'Reserve1'
      Size = 50
    end
    object qryGroup2Reserve2: TStringField
      FieldName = 'Reserve2'
      Size = 50
    end
    object qryGroup2Reserve3: TStringField
      FieldName = 'Reserve3'
      Size = 50
    end
    object qryGroup2Reserve4: TStringField
      FieldName = 'Reserve4'
      Size = 50
    end
    object qryGroup2Reserve5: TStringField
      FieldName = 'Reserve5'
      Size = 50
    end
  end
  object qryGroup3: TADOQuery
    Connection = ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from GGroupDepth')
    Left = 307
    Top = 249
    object qryGroup3ParkNo: TSmallintField
      FieldName = 'ParkNo'
    end
    object qryGroup3GroupDepthNo: TAutoIncField
      FieldName = 'GroupDepthNo'
      ReadOnly = True
    end
    object qryGroup3GroupDepth: TSmallintField
      FieldName = 'GroupDepth'
    end
    object qryGroup3GroupName: TStringField
      FieldName = 'GroupName'
      Size = 40
    end
    object qryGroup3UseYn: TIntegerField
      FieldName = 'UseYn'
    end
    object qryGroup3DelYn: TIntegerField
      FieldName = 'DelYn'
    end
    object qryGroup3Reserve1: TStringField
      FieldName = 'Reserve1'
      Size = 50
    end
    object qryGroup3Reserve2: TStringField
      FieldName = 'Reserve2'
      Size = 50
    end
    object qryGroup3Reserve3: TStringField
      FieldName = 'Reserve3'
      Size = 50
    end
    object qryGroup3Reserve4: TStringField
      FieldName = 'Reserve4'
      Size = 50
    end
    object qryGroup3Reserve5: TStringField
      FieldName = 'Reserve5'
      Size = 50
    end
  end
  object qryGroup4: TADOQuery
    Connection = ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from GGroupDepth')
    Left = 371
    Top = 249
    object qryGroup4ParkNo: TSmallintField
      FieldName = 'ParkNo'
    end
    object qryGroup4GroupDepthNo: TAutoIncField
      FieldName = 'GroupDepthNo'
      ReadOnly = True
    end
    object qryGroup4GroupDepth: TSmallintField
      FieldName = 'GroupDepth'
    end
    object qryGroup4GroupName: TStringField
      FieldName = 'GroupName'
      Size = 40
    end
    object qryGroup4UseYn: TIntegerField
      FieldName = 'UseYn'
    end
    object qryGroup4DelYn: TIntegerField
      FieldName = 'DelYn'
    end
    object qryGroup4Reserve1: TStringField
      FieldName = 'Reserve1'
      Size = 50
    end
    object qryGroup4Reserve2: TStringField
      FieldName = 'Reserve2'
      Size = 50
    end
    object qryGroup4Reserve3: TStringField
      FieldName = 'Reserve3'
      Size = 50
    end
    object qryGroup4Reserve4: TStringField
      FieldName = 'Reserve4'
      Size = 50
    end
    object qryGroup4Reserve5: TStringField
      FieldName = 'Reserve5'
      Size = 50
    end
  end
  object dsDCInfo: TDataSource
    DataSet = qryDCInfo
    Left = 368
    Top = 144
  end
  object qryDCInfo: TADOQuery
    Connection = ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from dcinfo')
    Left = 368
    Top = 88
    object qryDCInfoParkNo: TSmallintField
      FieldName = 'ParkNo'
    end
    object qryDCInfoDCNo: TWordField
      FieldName = 'DCNo'
    end
    object qryDCInfoDCName: TStringField
      FieldName = 'DCName'
      Size = 50
    end
    object qryDCInfoDCValue: TIntegerField
      FieldName = 'DCValue'
    end
    object qryDCInfoDCValue1: TIntegerField
      FieldName = 'DCValue1'
    end
    object qryDCInfoDCType: TWordField
      FieldName = 'DCType'
    end
    object qryDCInfoDCUseCnt: TWordField
      FieldName = 'DCUseCnt'
    end
    object qryDCInfoVisibleCnt: TIntegerField
      FieldName = 'VisibleCnt'
    end
    object qryDCInfoRealUse: TWordField
      FieldName = 'RealUse'
    end
    object qryDCInfoButtonUse: TWordField
      FieldName = 'ButtonUse'
    end
    object qryDCInfoWebUse: TWordField
      FieldName = 'WebUse'
    end
    object qryDCInfoFixedUse: TWordField
      FieldName = 'FixedUse'
    end
    object qryDCInfoDCTypeCode: TWordField
      FieldName = 'DCTypeCode'
    end
    object qryDCInfoReserve1: TStringField
      FieldName = 'Reserve1'
      Size = 50
    end
    object qryDCInfoReserve2: TStringField
      FieldName = 'Reserve2'
      Size = 50
    end
    object qryDCInfoReserve3: TStringField
      FieldName = 'Reserve3'
      Size = 50
    end
    object qryDCInfoReserve4: TStringField
      FieldName = 'Reserve4'
      Size = 50
    end
    object qryDCInfoReserve5: TStringField
      FieldName = 'Reserve5'
      Size = 50
    end
    object qryDCInfoReserve6: TStringField
      FieldName = 'Reserve6'
      Size = 50
    end
    object qryDCInfoReserve7: TStringField
      FieldName = 'Reserve7'
      Size = 50
    end
    object qryDCInfoReserve8: TStringField
      FieldName = 'Reserve8'
      Size = 50
    end
    object qryDCInfoReserve9: TStringField
      FieldName = 'Reserve9'
      Size = 50
    end
    object qryDCInfoReserve10: TIntegerField
      FieldName = 'Reserve10'
    end
    object qryDCInfoPrintName: TStringField
      FieldName = 'PrintName'
      Size = 50
    end
  end
  object qryDcFixed: TADOQuery
    Connection = ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from dcFixed')
    Left = 182
    Top = 153
    object qryDcFixedParkNo: TSmallintField
      FieldName = 'ParkNo'
    end
    object qryDcFixedCarNo: TStringField
      FieldName = 'CarNo'
      Size = 50
    end
    object qryDcFixedDCNo: TWordField
      FieldName = 'DCNo'
    end
    object qryDcFixedName: TStringField
      FieldName = 'Name'
      Size = 50
    end
    object qryDcFixedTelNo: TStringField
      FieldName = 'TelNo'
      Size = 50
    end
    object qryDcFixedStartYmd: TStringField
      FieldName = 'StartYmd'
      FixedChar = True
      Size = 10
    end
    object qryDcFixedEndYmd: TStringField
      FieldName = 'EndYmd'
      FixedChar = True
      Size = 10
    end
    object qryDcFixedUseWeekDay: TStringField
      FieldName = 'UseWeekDay'
      FixedChar = True
      Size = 7
    end
    object qryDcFixedUseStartTime: TStringField
      FieldName = 'UseStartTime'
      FixedChar = True
      Size = 8
    end
    object qryDcFixedUseEndTime: TStringField
      FieldName = 'UseEndTime'
      FixedChar = True
      Size = 8
    end
    object qryDcFixedLimitedDayCount: TIntegerField
      FieldName = 'LimitedDayCount'
    end
    object qryDcFixedLimitedMonthCount: TIntegerField
      FieldName = 'LimitedMonthCount'
    end
    object qryDcFixedUseParkNo: TIntegerField
      FieldName = 'UseParkNo'
    end
    object qryDcFixedRemark: TStringField
      FieldName = 'Remark'
      Size = 100
    end
    object qryDcFixedRemark2: TStringField
      FieldName = 'Remark2'
      Size = 100
    end
    object qryDcFixedReserve1: TStringField
      FieldName = 'Reserve1'
      Size = 50
    end
    object qryDcFixedReserve2: TStringField
      FieldName = 'Reserve2'
      Size = 50
    end
    object qryDcFixedReserve3: TStringField
      FieldName = 'Reserve3'
      Size = 50
    end
    object qryDcFixedReserve4: TStringField
      FieldName = 'Reserve4'
      Size = 50
    end
    object qryDcFixedReserve5: TStringField
      Alignment = taCenter
      FieldName = 'Reserve5'
      Size = 50
    end
    object qryDcFixedMaxCount: TIntegerField
      FieldName = 'MaxCount'
    end
    object qryDcFixedUseYes: TIntegerField
      FieldName = 'UseYes'
    end
    object qryDcFixedDCName: TStringField
      FieldKind = fkLookup
      FieldName = 'DCName'
      LookupDataSet = qryDCInfo
      LookupKeyFields = 'DCNo'
      LookupResultField = 'DCName'
      KeyFields = 'DCNo'
      Lookup = True
    end
    object qryDcFixedSequnce: TAutoIncField
      FieldName = 'Sequnce'
      ReadOnly = True
    end
  end
end
