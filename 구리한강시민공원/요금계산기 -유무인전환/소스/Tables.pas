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
    qrySCSearchCarNo: TStringField;
    qrySCSearchName: TStringField;
    qrySCSearchCompName: TStringField;
    qrySCSearchExpDateF: TStringField;
    qrySCSearchExpDateT: TStringField;
    qryManualOut: TADOQuery;
    qryDbCheck: TADOQuery;
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
