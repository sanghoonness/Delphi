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
  object qryCustInfo: TADOQuery
    Connection = ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Custinfo')
    Left = 32
    Top = 88
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
      OnGetText = qryCustInfoStatusGetText
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
end
