unit Tables;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TdmTables = class(TDataModule)
    ADODB: TADOConnection;
    qryLprProc: TADOQuery;
    qryNormal: TADOQuery;
    qryRecvLpr1: TADOQuery;
    qryRecvLpr2: TADOQuery;
    qryNormalOut1: TADOQuery;
    qryNormalOut2: TADOQuery;
    qryLost: TADOQuery;
    qryLostParkNo: TSmallintField;
    qryLostUnitNo: TWordField;
    qryLostUnitName: TStringField;
    qryLostProcDate: TStringField;
    qryLostProcTime: TStringField;
    qryLostTKNo: TStringField;
    qryLostTKType: TWordField;
    qryLostCarTypeNo: TWordField;
    qryLostInImage1: TStringField;
    qryLostInCarNo1: TStringField;
    qryLostInImage2: TStringField;
    qryLostInCarNo2: TStringField;
    qryLostStatus: TWordField;
    qryLostOutUnitNo: TWordField;
    qryLostOutDate: TStringField;
    qryLostOutTime: TStringField;
    qryLostOutChk: TWordField;
    qryLostOutImage1: TStringField;
    qryLostOutCarNo1: TStringField;
    qryLostOutImage2: TStringField;
    qryLostOutCarNo2: TStringField;
    qryLostInRecog1: TWordField;
    qryLostOutRecog1: TWordField;
    qryLostInRecog2: TWordField;
    qryLostOutRecog2: TWordField;
    qryLostReserve5: TStringField;
    qryLostReserve4: TStringField;
    qryLostReserve3: TStringField;
    qryLostReserve2: TStringField;
    qryLostReserve1: TStringField;
    dsLost: TDataSource;
    qryUnitInfo: TADOQuery;
    qryUnitInfoParkNo: TSmallintField;
    qryUnitInfoUnitNo: TWordField;
    qryUnitInfoUnitName: TStringField;
    qryUnitInfoUnitKind: TWordField;
    qryUnitInfoMyNo: TWordField;
    qryUnitInfoComPort: TWordField;
    qryUnitInfoBaudrate: TWordField;
    qryUnitInfoIPNo: TStringField;
    qryUnitInfoPortNo: TIntegerField;
    qryUnitInfoReserve1: TStringField;
    qryUnitInfoReserve2: TStringField;
    qryUnitInfoReserve3: TStringField;
    qryUnitInfoReserve4: TStringField;
    qryUnitInfoReserve5: TStringField;
    dsUnitInfo: TDataSource;
    qryHoliday: TADOQuery;
    qryHolidayParkNo: TSmallintField;
    qryHolidayHDate: TStringField;
    qryHolidayHName: TStringField;
    qryHolidayReserve1: TStringField;
    qryHolidayReserve2: TStringField;
    qryHolidayReserve3: TStringField;
    qryHolidayReserve4: TStringField;
    qryHolidayReserve5: TStringField;
    dsHoliday: TDataSource;
    qryHolidayHType: TWordField;
    qryReturnFee: TADOQuery;
    qryFeeCalc: TADOQuery;
    qryParkInfo: TADOQuery;
    dsParkInfo: TDataSource;
    qryParkInfoParkNo: TSmallintField;
    qryParkInfoParkName: TStringField;
    qryParkInfoParkAddr: TStringField;
    qryParkInfoRegNo: TStringField;
    qryParkInfoAdmin: TStringField;
    qryParkInfoTelephone: TStringField;
    qryParkInfoReceipt: TStringField;
    qryParkInfoDayMax: TIntegerField;
    qryParkInfoTotMax: TIntegerField;
    qryParkInfoCalcType: TWordField;
    qryParkInfoClosingTime: TStringField;
    qryParkInfoAutoClosing: TWordField;
    qryParkInfoHolidayProc: TWordField;
    qryParkInfoReceiptAuto: TWordField;
    qryParkInfoReceiptZero: TWordField;
    qryParkInfoTaxType: TWordField;
    qryParkInfoJunkType: TWordField;
    qryParkInfoRoundType: TWordField;
    qryParkInfoTimeDCType: TWordField;
    qryParkInfoCurrencyType: TWordField;
    qryParkInfoDCReason: TWordField;
    qryParkInfoLostCalc: TWordField;
    qryParkInfoLostAmount: TIntegerField;
    qryParkInfoSpecialTariff: TWordField;
    qryParkInfoCommercialCar: TWordField;
    qryParkInfoParkingDayMax: TWordField;
    qryParkInfoDCCntMax: TWordField;
    qryParkInfoVanIP: TStringField;
    qryParkInfoVanPort: TIntegerField;
    qryParkInfoReserve1: TStringField;
    qryParkInfoReserve2: TStringField;
    qryParkInfoReserve3: TStringField;
    qryParkInfoReserve4: TStringField;
    qryParkInfoReserve5: TStringField;
    qryTemp: TADOQuery;
    qryMoneyProc: TADOQuery;
    qryModify: TADOQuery;
    qryFeeItem: TADOQuery;
    qryBarProc: TADOQuery;
    qryFreeIO: TADOQuery;
    qryNormalIn1: TADOQuery;
    qryNormalIn2: TADOQuery;
    qryCancelData: TADOQuery;
    qryCtrl: TADOQuery;
    qryDCTemp: TADOQuery;
    qryRecvOutLpr1: TADOQuery;
    qryOutLpr1Proc: TADOQuery;
    qryRecvOutLpr2: TADOQuery;
    qryOutLpr2Proc: TADOQuery;
    qryRecvOutLpr3: TADOQuery;
    qryOutLpr3Proc: TADOQuery;
    qryRecvInLpr1: TADOQuery;
    qryInLpr1Proc: TADOQuery;
    qryRecvInLpr2: TADOQuery;
    qryInLpr2Proc: TADOQuery;
    qryRecvInLpr3: TADOQuery;
    qryInLpr3Proc: TADOQuery;
    qryRecvInLpr4: TADOQuery;
    qryInLpr4Proc: TADOQuery;
    qryRecvInLpr5: TADOQuery;
    qryInLpr5Proc: TADOQuery;
    qryMichulProc: TADOQuery;
    qrySCSearch: TADOQuery;
    dsSCSearch: TDataSource;
    qryManualOut: TADOQuery;
    qryGroupDelth: TADOQuery;
    qryparkcnt: TADOQuery;
    qrySCSearchName: TStringField;
    qrySCSearchCarNo: TStringField;
    qrySCSearchCompName: TStringField;
    qrySCSearchExpDateF: TStringField;
    qrySCSearchExpDateT: TStringField;
    qrySCSearch1: TADOQuery;
    qrySCSearch1Name: TStringField;
    qrySCSearch1CarNo: TStringField;
    qrySCSearch1CompName: TStringField;
    qrySCSearch1ExpDateF: TStringField;
    qrySCSearch1ExpDateT: TStringField;
    qryGGroup1: TADOQuery;
    qryGGroup1ParkNo: TSmallintField;
    qryGGroup1GroupNo: TSmallintField;
    qryGGroup1GroupName: TStringField;
    qryGGroup1APB: TWordField;
    qryGGroup1Status: TWordField;
    qryGGroup1Remark: TStringField;
    qryGGroup1GroupType: TWordField;
    qryGGroup1UseFeeItem: TWordField;
    qryGGroup1RF1: TWordField;
    qryGGroup1RF2: TWordField;
    qryGGroup1RF3: TWordField;
    qryGGroup1RF4: TWordField;
    qryGGroup1RF5: TWordField;
    qryGGroup1RF6: TWordField;
    qryGGroup1RF7: TWordField;
    qryGGroup1RF8: TWordField;
    qryGGroup1RF9: TWordField;
    qryGGroup1RF10: TWordField;
    qryGGroup1RF11: TWordField;
    qryGGroup1RF12: TWordField;
    qryGGroup1RF13: TWordField;
    qryGGroup1RF14: TWordField;
    qryGGroup1RF15: TWordField;
    qryGGroup1RF16: TWordField;
    qryGGroup1RF17: TWordField;
    qryGGroup1RF18: TWordField;
    qryGGroup1RF19: TWordField;
    qryGGroup1RF20: TWordField;
    qryGGroup1HIType: TWordField;
    qryGGroup1HISTime: TStringField;
    qryGGroup1HIETime: TStringField;
    qryGGroup1Reserve1: TStringField;
    qryGGroup1Reserve2: TStringField;
    qryGGroup1Reserve3: TStringField;
    qryGGroup1Reserve4: TStringField;
    qryGGroup1Reserve5: TStringField;
    qryGGroup1BujaeType: TWordField;
    qrySCSearch1GroupNo: TSmallintField;
    qryGGroup1useMiddle: TIntegerField;
    qrySCSearch1UseMiddle: TIntegerField;
    dsSCSearch1: TDataSource;
    qryLost1: TADOQuery;
    qryLost1InRecog1: TWordField;
    qryLost1UnitNo: TSmallintField;
    qryLost1InRecog2: TWordField;
    qryLost1InImage1: TStringField;
    qryLost1InImage2: TStringField;
    qryLost1UnitName: TStringField;
    qryLost1ProcDate: TStringField;
    qryLost1ProcTime: TStringField;
    qryLost1InCarNo1: TStringField;
    qryLost1INCARNo2: TStringField;
    qryLost1usemiddle: TIntegerField;
    dsLost1: TDataSource;
    qryLost1tkno: TStringField;
    qryOCSselect: TADOQuery;
    qryOCSproc: TADOQuery;
    qryOCS: TADOQuery;
    qryOCSDCInfo: TADOQuery;
    qryDbCheck: TADOQuery;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmTables: TdmTables;

implementation

{$R *.dfm}

end.
