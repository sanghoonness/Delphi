program Nexpa_Host;

uses
  Forms,
  Main in 'Main.pas' {frmMain},
  Global in 'Global.pas',
  Tables in 'Tables.pas' {dmTables: TDataModule},
  ParkInfo in 'ParkInfo.pas' {frmParkInfo},
  UnitInfo in 'UnitInfo.pas' {frmUnitInfo},
  FeeItem in 'FeeItem.pas' {frmFeeItem},
  Tariff in 'Tariff.pas' {frmTariff},
  DCInfo in 'DCInfo.pas' {frmDCInfo},
  Holiday in 'Holiday.pas' {frmHoliday},
  Gracetime in 'Gracetime.pas' {frmGracetime},
  Manager in 'Manager.pas' {frmManager},
  WP in 'WP.pas' {frmWP},
  SCGroup in 'SCGroup.pas' {frmSCGroup},
  CustInfo in 'CustInfo.pas' {frmCustInfo},
  Progress in 'Progress.pas' {frmProgress},
  NewSC in 'NewSC.pas' {frmNewSC},
  Login in 'Login.pas' {frmLogin},
  AddSC in 'AddSC.pas' {frmAddSC},
  NProc in 'NProc.pas' {frmNProc},
  IONData in 'IONData.pas' {frmIONData},
  IOSData in 'IOSData.pas' {frmIOSData},
  SCData in 'SCData.pas' {frmSCData},
  NSCData in 'NSCData.pas' {frmNSCData},
  Card in 'Card.pas' {frmCard},
  CardAdd in 'CardAdd.pas' {frmCardAdd},
  RFSCGroup in 'RFSCGroup.pas' {frmRFSCGroup},
  RFSCCustInfo in 'RFSCCustInfo.pas' {frmRFSCCustInfo},
  RFSeek in 'RFSeek.pas' {frmRFSeek},
  NewRFSC in 'NewRFSC.pas' {frmNewRFSC},
  AddRFSC in 'AddRFSC.pas' {frmAddRFSC},
  Coupon in 'Coupon.pas' {frmCoupon},
  FreeIOData in 'FreeIOData.pas' {frmFreeIOData},
  CouponList in 'CouponList.pas' {frmCouponList},
  IOCnt in 'IOCnt.pas' {frmIOCnt},
  Recog in 'Recog.pas' {frmRecog},
  RFSCData in 'RFSCData.pas' {frmRFSCData},
  RFIOSData in 'RFIOSData.pas' {frmRFIOSData},
  RFNSCData in 'RFNSCData.pas' {frmRFNSCData},
  DailyReport in 'DailyReport.pas' {frmDailyReport},
  FeeDetail in 'FeeDetail.pas' {frmFeeDetail},
  Seek in 'Seek.pas' {frmSeek},
  MonthlyReport in 'MonthlyReport.pas' {frmMonthlyReport},
  CarNoModify in 'CarNoModify.pas' {frmCarNoModify},
  IOSCnt in 'IOSCnt.pas' {frmIOSCnt},
  Freetime in 'Freetime.pas' {frmFreetime},
  ParkingTime in 'ParkingTime.pas' {frmParkingTime},
  Analysis in 'Analysis.pas' {frmAnalysis},
  InputData in 'InputData.pas' {frmInputData},
  ValetCard in 'ValetCard.pas' {frmValetCard},
  Magam in 'Magam.pas' {frmMagam},
  ValIOCnt in 'ValIOCnt.pas' {frmValIOCnt},
  IOVData in 'IOVData.pas' {frmIOVData},
  CGVData in 'CGVData.pas' {frmCGVData},
  CGVDCCnt in 'CGVDCCnt.pas' {frmCGVDCCnt},
  DailyIOCnt in 'DailyIOCnt.pas' {frmDailyIOCnt},
  Alarm in 'Alarm.pas' {frmAlarm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := '????????????????';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TdmTables, dmTables);
  Application.Run;
end.
