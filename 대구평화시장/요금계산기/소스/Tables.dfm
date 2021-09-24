object dmTables: TdmTables
  OldCreateOrder = False
  Height = 550
  Width = 590
  object ADODB: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=nexpa1234;Persist Security Info=Tru' +
      'e;User ID=sa;Initial Catalog=PARKING;Data Source=127.0.0.1,42130'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 24
  end
  object qryLprProc: TADOQuery
    Connection = ADODB
    CursorType = ctStatic
    Parameters = <>
    Left = 32
    Top = 80
  end
  object qryNormal: TADOQuery
    Connection = ADODB
    CursorType = ctStatic
    Parameters = <>
    Left = 112
    Top = 80
  end
  object qryRecvLpr1: TADOQuery
    Connection = ADODB
    CursorType = ctStatic
    Parameters = <>
    Left = 32
    Top = 128
  end
  object qryRecvLpr2: TADOQuery
    Connection = ADODB
    CursorType = ctStatic
    Parameters = <>
    Left = 112
    Top = 128
  end
  object qryNormalOut1: TADOQuery
    Connection = ADODB
    CursorType = ctStatic
    Parameters = <>
    Left = 32
    Top = 176
  end
  object qryNormalOut2: TADOQuery
    Connection = ADODB
    CursorType = ctStatic
    Parameters = <>
    Left = 112
    Top = 176
  end
  object qryLost: TADOQuery
    Connection = ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from IONData')
    Left = 376
    Top = 80
    object qryLostParkNo: TSmallintField
      FieldName = 'ParkNo'
    end
    object qryLostUnitNo: TWordField
      FieldName = 'UnitNo'
    end
    object qryLostUnitName: TStringField
      FieldKind = fkLookup
      FieldName = 'UnitName'
      LookupDataSet = qryUnitInfo
      LookupKeyFields = 'UnitNo'
      LookupResultField = 'UnitName'
      KeyFields = 'UnitNo'
      Size = 50
      Lookup = True
    end
    object qryLostProcDate: TStringField
      FieldName = 'ProcDate'
      FixedChar = True
      Size = 10
    end
    object qryLostProcTime: TStringField
      FieldName = 'ProcTime'
      FixedChar = True
      Size = 8
    end
    object qryLostTKNo: TStringField
      FieldName = 'TKNo'
      Size = 50
    end
    object qryLostTKType: TWordField
      FieldName = 'TKType'
    end
    object qryLostCarTypeNo: TWordField
      FieldName = 'CarType'
    end
    object qryLostInImage1: TStringField
      FieldName = 'InImage1'
      Size = 300
    end
    object qryLostInCarNo1: TStringField
      FieldName = 'InCarNo1'
      Size = 50
    end
    object qryLostInImage2: TStringField
      FieldName = 'InImage2'
      Size = 300
    end
    object qryLostInCarNo2: TStringField
      FieldName = 'InCarNo2'
      Size = 50
    end
    object qryLostStatus: TWordField
      FieldName = 'Status'
    end
    object qryLostOutUnitNo: TWordField
      FieldName = 'OutUnitNo'
    end
    object qryLostOutDate: TStringField
      FieldName = 'OutDate'
      FixedChar = True
      Size = 10
    end
    object qryLostOutTime: TStringField
      FieldName = 'OutTime'
      FixedChar = True
      Size = 8
    end
    object qryLostOutChk: TWordField
      FieldName = 'OutChk'
    end
    object qryLostOutImage1: TStringField
      FieldName = 'OutImage1'
      Size = 300
    end
    object qryLostOutCarNo1: TStringField
      FieldName = 'OutCarNo1'
      Size = 50
    end
    object qryLostOutImage2: TStringField
      FieldName = 'OutImage2'
      Size = 300
    end
    object qryLostOutCarNo2: TStringField
      FieldName = 'OutCarNo2'
      Size = 50
    end
    object qryLostInRecog1: TWordField
      FieldName = 'InRecog1'
    end
    object qryLostOutRecog1: TWordField
      FieldName = 'OutRecog1'
    end
    object qryLostInRecog2: TWordField
      FieldName = 'InRecog2'
    end
    object qryLostOutRecog2: TWordField
      FieldName = 'OutRecog2'
    end
    object qryLostReserve5: TStringField
      FieldName = 'Reserve5'
      Size = 50
    end
    object qryLostReserve4: TStringField
      FieldName = 'Reserve4'
      Size = 50
    end
    object qryLostReserve3: TStringField
      FieldName = 'Reserve3'
      Size = 50
    end
    object qryLostReserve2: TStringField
      FieldName = 'Reserve2'
      Size = 50
    end
    object qryLostReserve1: TStringField
      FieldName = 'Reserve1'
      Size = 50
    end
  end
  object dsLost: TDataSource
    DataSet = qryLost
    Left = 376
    Top = 128
  end
  object qryUnitInfo: TADOQuery
    Connection = ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from UnitInfo')
    Left = 320
    Top = 80
    object qryUnitInfoParkNo: TSmallintField
      FieldName = 'ParkNo'
    end
    object qryUnitInfoUnitNo: TWordField
      FieldName = 'UnitNo'
    end
    object qryUnitInfoUnitName: TStringField
      FieldName = 'UnitName'
      Size = 50
    end
    object qryUnitInfoUnitKind: TWordField
      FieldName = 'UnitKind'
    end
    object qryUnitInfoMyNo: TWordField
      FieldName = 'MyNo'
    end
    object qryUnitInfoComPort: TWordField
      FieldName = 'ComPort'
    end
    object qryUnitInfoBaudrate: TWordField
      FieldName = 'Baudrate'
    end
    object qryUnitInfoIPNo: TStringField
      FieldName = 'IPNo'
      Size = 50
    end
    object qryUnitInfoPortNo: TIntegerField
      FieldName = 'PortNo'
    end
    object qryUnitInfoReserve1: TStringField
      FieldName = 'Reserve1'
      Size = 50
    end
    object qryUnitInfoReserve2: TStringField
      FieldName = 'Reserve2'
      Size = 50
    end
    object qryUnitInfoReserve3: TStringField
      FieldName = 'Reserve3'
      Size = 50
    end
    object qryUnitInfoReserve4: TStringField
      FieldName = 'Reserve4'
      Size = 50
    end
    object qryUnitInfoReserve5: TStringField
      FieldName = 'Reserve5'
      Size = 50
    end
  end
  object dsUnitInfo: TDataSource
    DataSet = qryUnitInfo
    Left = 320
    Top = 128
  end
  object qryHoliday: TADOQuery
    Connection = ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Holiday')
    Left = 440
    Top = 80
    object qryHolidayParkNo: TSmallintField
      FieldName = 'ParkNo'
    end
    object qryHolidayHDate: TStringField
      FieldName = 'HDate'
      FixedChar = True
      Size = 10
    end
    object qryHolidayHName: TStringField
      FieldName = 'HName'
      Size = 50
    end
    object qryHolidayHType: TWordField
      FieldName = 'HType'
    end
    object qryHolidayReserve1: TStringField
      FieldName = 'Reserve1'
      Size = 50
    end
    object qryHolidayReserve2: TStringField
      FieldName = 'Reserve2'
      Size = 50
    end
    object qryHolidayReserve3: TStringField
      FieldName = 'Reserve3'
      Size = 50
    end
    object qryHolidayReserve4: TStringField
      FieldName = 'Reserve4'
      Size = 50
    end
    object qryHolidayReserve5: TStringField
      FieldName = 'Reserve5'
      Size = 50
    end
  end
  object dsHoliday: TDataSource
    DataSet = qryHoliday
    Left = 440
    Top = 128
  end
  object qryReturnFee: TADOQuery
    Connection = ADODB
    CursorType = ctStatic
    Parameters = <>
    Left = 184
    Top = 80
  end
  object qryFeeCalc: TADOQuery
    Connection = ADODB
    CursorType = ctStatic
    Parameters = <>
    Left = 184
    Top = 128
  end
  object qryParkInfo: TADOQuery
    Connection = ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from ParkInfo')
    Left = 256
    Top = 80
    object qryParkInfoParkNo: TSmallintField
      FieldName = 'ParkNo'
    end
    object qryParkInfoParkName: TStringField
      FieldName = 'ParkName'
      Size = 100
    end
    object qryParkInfoParkAddr: TStringField
      FieldName = 'ParkAddr'
      Size = 100
    end
    object qryParkInfoRegNo: TStringField
      FieldName = 'RegNo'
    end
    object qryParkInfoAdmin: TStringField
      FieldName = 'Admin'
      Size = 50
    end
    object qryParkInfoTelephone: TStringField
      FieldName = 'Telephone'
    end
    object qryParkInfoReceipt: TStringField
      FieldName = 'Receipt'
      Size = 100
    end
    object qryParkInfoDayMax: TIntegerField
      FieldName = 'DayMax'
    end
    object qryParkInfoTotMax: TIntegerField
      FieldName = 'TotMax'
    end
    object qryParkInfoCalcType: TWordField
      FieldName = 'CalcType'
    end
    object qryParkInfoClosingTime: TStringField
      FieldName = 'ClosingTime'
      FixedChar = True
      Size = 5
    end
    object qryParkInfoAutoClosing: TWordField
      FieldName = 'AutoClosing'
    end
    object qryParkInfoHolidayProc: TWordField
      FieldName = 'HolidayProc'
    end
    object qryParkInfoReceiptAuto: TWordField
      FieldName = 'ReceiptAuto'
    end
    object qryParkInfoReceiptZero: TWordField
      FieldName = 'ReceiptZero'
    end
    object qryParkInfoTaxType: TWordField
      FieldName = 'TaxType'
    end
    object qryParkInfoJunkType: TWordField
      FieldName = 'JunkType'
    end
    object qryParkInfoRoundType: TWordField
      FieldName = 'RoundType'
    end
    object qryParkInfoTimeDCType: TWordField
      FieldName = 'TimeDCType'
    end
    object qryParkInfoCurrencyType: TWordField
      FieldName = 'CurrencyType'
    end
    object qryParkInfoDCReason: TWordField
      FieldName = 'DCReason'
    end
    object qryParkInfoLostCalc: TWordField
      FieldName = 'LostCalc'
    end
    object qryParkInfoLostAmount: TIntegerField
      FieldName = 'LostAmount'
    end
    object qryParkInfoSpecialTariff: TWordField
      FieldName = 'SpecialTariff'
    end
    object qryParkInfoCommercialCar: TWordField
      FieldName = 'CommercialCar'
    end
    object qryParkInfoParkingDayMax: TWordField
      FieldName = 'ParkingDayMax'
    end
    object qryParkInfoDCCntMax: TWordField
      FieldName = 'DCCntMax'
    end
    object qryParkInfoVanIP: TStringField
      FieldName = 'VanIP'
      Size = 50
    end
    object qryParkInfoVanPort: TIntegerField
      FieldName = 'VanPort'
    end
    object qryParkInfoReserve1: TStringField
      FieldName = 'Reserve1'
      Size = 50
    end
    object qryParkInfoReserve2: TStringField
      FieldName = 'Reserve2'
      Size = 50
    end
    object qryParkInfoReserve3: TStringField
      FieldName = 'Reserve3'
      Size = 50
    end
    object qryParkInfoReserve4: TStringField
      FieldName = 'Reserve4'
      Size = 50
    end
    object qryParkInfoReserve5: TStringField
      FieldName = 'Reserve5'
      Size = 50
    end
  end
  object dsParkInfo: TDataSource
    DataSet = qryParkInfo
    Left = 256
    Top = 128
  end
  object qryTemp: TADOQuery
    Connection = ADODB
    CursorType = ctStatic
    Parameters = <>
    Left = 184
    Top = 176
  end
  object qryMoneyProc: TADOQuery
    Connection = ADODB
    CursorType = ctStatic
    Parameters = <>
    Left = 256
    Top = 176
  end
  object qryModify: TADOQuery
    Connection = ADODB
    CursorType = ctStatic
    Parameters = <>
    Left = 320
    Top = 176
  end
  object qryFeeItem: TADOQuery
    Connection = ADODB
    CursorType = ctStatic
    Parameters = <>
    Left = 376
    Top = 176
  end
  object qryBarProc: TADOQuery
    Connection = ADODB
    CursorType = ctStatic
    Parameters = <>
    Left = 440
    Top = 176
  end
  object qryFreeIO: TADOQuery
    Connection = ADODB
    CursorType = ctStatic
    Parameters = <>
    Left = 32
    Top = 232
  end
  object qryNormalIn1: TADOQuery
    Connection = ADODB
    CursorType = ctStatic
    Parameters = <>
    Left = 112
    Top = 232
  end
  object qryNormalIn2: TADOQuery
    Connection = ADODB
    CursorType = ctStatic
    Parameters = <>
    Left = 184
    Top = 232
  end
  object qryCancelData: TADOQuery
    Connection = ADODB
    CursorType = ctStatic
    Parameters = <>
    Left = 256
    Top = 232
  end
  object qryCtrl: TADOQuery
    Connection = ADODB
    CursorType = ctStatic
    Parameters = <>
    Left = 320
    Top = 232
  end
  object qryDCTemp: TADOQuery
    Connection = ADODB
    CursorType = ctStatic
    Parameters = <>
    Left = 376
    Top = 232
  end
  object qryRecvOutLpr1: TADOQuery
    Connection = ADODB
    CursorType = ctStatic
    Parameters = <>
    Left = 32
    Top = 296
  end
  object qryOutLpr1Proc: TADOQuery
    Connection = ADODB
    CursorType = ctStatic
    Parameters = <>
    Left = 119
    Top = 296
  end
  object qryRecvOutLpr2: TADOQuery
    Connection = ADODB
    CursorType = ctStatic
    Parameters = <>
    Left = 200
    Top = 296
  end
  object qryOutLpr2Proc: TADOQuery
    Connection = ADODB
    CursorType = ctStatic
    Parameters = <>
    Left = 288
    Top = 296
  end
  object qryRecvOutLpr3: TADOQuery
    Connection = ADODB
    CursorType = ctStatic
    Parameters = <>
    Left = 376
    Top = 296
  end
  object qryOutLpr3Proc: TADOQuery
    Connection = ADODB
    CursorType = ctStatic
    Parameters = <>
    Left = 464
    Top = 296
  end
  object qryRecvInLpr1: TADOQuery
    Connection = ADODB
    CursorType = ctStatic
    Parameters = <>
    Left = 32
    Top = 360
  end
  object qryInLpr1Proc: TADOQuery
    Connection = ADODB
    CursorType = ctStatic
    Parameters = <>
    Left = 31
    Top = 432
  end
  object qryRecvInLpr2: TADOQuery
    Connection = ADODB
    CursorType = ctStatic
    Parameters = <>
    Left = 120
    Top = 360
  end
  object qryInLpr2Proc: TADOQuery
    Connection = ADODB
    CursorType = ctStatic
    Parameters = <>
    Left = 119
    Top = 432
  end
  object qryRecvInLpr3: TADOQuery
    Connection = ADODB
    CursorType = ctStatic
    Parameters = <>
    Left = 200
    Top = 360
  end
  object qryInLpr3Proc: TADOQuery
    Connection = ADODB
    CursorType = ctStatic
    Parameters = <>
    Left = 199
    Top = 432
  end
  object qryRecvInLpr4: TADOQuery
    Connection = ADODB
    CursorType = ctStatic
    Parameters = <>
    Left = 288
    Top = 360
  end
  object qryInLpr4Proc: TADOQuery
    Connection = ADODB
    CursorType = ctStatic
    Parameters = <>
    Left = 287
    Top = 432
  end
  object qryRecvInLpr5: TADOQuery
    Connection = ADODB
    CursorType = ctStatic
    Parameters = <>
    Left = 376
    Top = 360
  end
  object qryInLpr5Proc: TADOQuery
    Connection = ADODB
    CursorType = ctStatic
    Parameters = <>
    Left = 375
    Top = 432
  end
  object qryMichulProc: TADOQuery
    Connection = ADODB
    CursorType = ctStatic
    Parameters = <>
    Left = 464
    Top = 360
  end
  object qrySCSearch: TADOQuery
    Connection = ADODB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select CarNo, Name, CompName, ExpDateF, ExpDateT from CustInfo w' +
        'here TKType = 2')
    Left = 503
    Top = 80
    object qrySCSearchCarNo: TStringField
      FieldName = 'CarNo'
      Size = 50
    end
    object qrySCSearchName: TStringField
      FieldName = 'Name'
      Size = 50
    end
    object qrySCSearchCompName: TStringField
      FieldName = 'CompName'
      Size = 50
    end
    object qrySCSearchExpDateF: TStringField
      FieldName = 'ExpDateF'
      FixedChar = True
      Size = 10
    end
    object qrySCSearchExpDateT: TStringField
      FieldName = 'ExpDateT'
      FixedChar = True
      Size = 10
    end
  end
  object dsSCSearch: TDataSource
    DataSet = qrySCSearch
    Left = 504
    Top = 128
  end
  object qryManualOut: TADOQuery
    Connection = ADODB
    CursorType = ctStatic
    Parameters = <>
    Left = 448
    Top = 232
  end
end
