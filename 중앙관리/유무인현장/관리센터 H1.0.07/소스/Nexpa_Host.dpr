program Nexpa_Host;

uses
  Forms,
  Main in 'Main.pas' {frmMain},
  Global in 'Global.pas',
  Tables in 'Tables.pas' {dmTables: TDataModule},
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
  CarNoModify in 'CarNoModify.pas' {frmCarNoModify},
  IOSCnt in 'IOSCnt.pas' {frmIOSCnt},
  Freetime in 'Freetime.pas' {frmFreetime},
  ParkingTime in 'ParkingTime.pas' {frmParkingTime},
  ParkInfo in 'ParkInfo.pas' {frmParkInfo},
  NewBSC in 'NewBSC.pas' {frmNewBSC},
  BlackListInfo in 'BlackListInfo.pas' {frmBlackListInfo},
  IOBData in 'IOBData.pas' {frmIOBData},
  Custinfo_D in 'Custinfo_D.Pas' {frmCustinfo_D},
  DClosingReport in 'DClosingReport.pas' {frmDClosingReport},
  WebDCReport in 'WebDCReport.pas' {frmWebDCReport},
  WebDiscountList in 'WebDiscountList.pas' {frmWebDCList},
  WebDiscountSum in 'WebDiscountSum.pas' {frmWebDCSum},
  DCDetailData in 'DCDetailData.pas' {FrmDCDetailData},
  IONTKProc in 'IONTKProc.pas' {frmIONTKProc},
  WebDisCountTime in 'WebDisCountTime.pas' {frmWebDisCountTime},
  WebDisCountTimeSum in 'WebDisCountTimeSum.pas' {frmWebDCTimeSum},
  DCTimeList in 'DCTimeList.pas' {frmDCTimeList},
  DCDayList in 'DCDayList.pas' {frmDCDayList},
  MonthlyReport in 'MonthlyReport.pas' {frmMonthlyReport},
  NewDCFix in 'NewDCFix.pas' {frmNewDcFix},
  DCFixed in 'DCFixed.pas' {frmDCFixed},
  RFMaster in 'RFMaster.pas' {frmRFMaster},
  NotPassCar in 'NotPassCar.pas' {frmNotPassCar},
  GateRule in 'GateRule.pas' {frmGateRule},
  GateRuleNew in 'GateRuleNew.pas' {frmGateRuleNew},
  IONNproc in 'IONNproc.pas' {frmIONNProc},
  MisuTKProc in 'MisuTKProc.pas' {frmMisuTKProc},
  VanListSum in 'VanListSum.pas' {frmVanListSum},
  UnitReport in 'UnitReport.pas' {frmUnitReport},
  Alarm_vip in 'Alarm_vip.pas' {frmAlarm_vip},
  Seek2 in 'Seek2.pas' {frmSeek2},
  Seek3 in 'Seek3.pas' {frmSeek3},
  SPIondata in 'SPIondata.pas' {frmSPIONData},
  IOAllData in 'IOAllData.pas' {frmIOAllData},
  Homenet_Point in 'Homenet_Point.pas' {frmHomenet_Point},
  IOVisitStat in 'IOVisitStat.pas' {frmIOVisitStat},
  Visit_Info in 'Visit_Info.pas' {frmVisit_Info};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := '????????????????';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TdmTables, dmTables);
  Application.CreateForm(TfrmSeek2, frmSeek2);
  Application.CreateForm(TfrmSeek3, frmSeek3);
  Application.CreateForm(TfrmIOAllData, frmIOAllData);
  Application.CreateForm(TfrmHomenet_Point, frmHomenet_Point);
  Application.CreateForm(TfrmIOVisitStat, frmIOVisitStat);
  Application.CreateForm(TfrmVisit_Info, frmVisit_Info);
  Application.Run;
end.
