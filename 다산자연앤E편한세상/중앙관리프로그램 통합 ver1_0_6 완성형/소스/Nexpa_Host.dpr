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
  MonthlyReport in 'MonthlyReport.pas' {frmMonthlyReport},
  CarNoModify in 'CarNoModify.pas' {frmCarNoModify},
  IOSCnt in 'IOSCnt.pas' {frmIOSCnt},
  Freetime in 'Freetime.pas' {frmFreetime},
  ParkingTime in 'ParkingTime.pas' {frmParkingTime},
  ParkInfo in 'ParkInfo.pas' {frmParkInfo},
  NewBSC in 'NewBSC.pas' {frmNewBSC},
  BlackListInfo in 'BlackListInfo.pas' {frmBlackListInfo},
  IOBData in 'IOBData.pas' {frmIOBData},
  Custinfo_D in 'Custinfo_D.Pas' {frmCustinfo_D},
  Seek2 in 'Seek2.pas' {frmSeek2},
  Parkinfo_Yo in 'Parkinfo_Yo.Pas' {frmParkInfo_yo},
  BlackSearch in 'BlackSearch.pas' {frmBlackSearch},
  GroupNumEdit in 'GroupNumEdit.pas' {frmGroupNumEdit},
  CarPossession in 'CarPossession.pas' {frmCarPossession},
  InOutCarList in 'InOutCarList.pas' {frmInOutCarList},
  Day_IOS_ION in 'Day_IOS_ION.pas' {Day_ION_IOS_Data},
  Month_IOS_ION in 'Month_IOS_ION.pas' {Month_IOS_ION_Data},
  Term_IOS_ION in 'Term_IOS_ION.pas' {Term_IOS_ION_Data},
  Day2_IOS_ION in 'Day2_IOS_ION.pas' {Day2_IOS_ION_Data},
  Condition_IOS_ION in 'Condition_IOS_ION.pas' {Condition_IOS_ION_Data},
  NomalCar_Management in 'NomalCar_Management.pas' {frmNomalCar_Management},
  IOVisitStat in 'IOVisitStat.pas' {frmIOVisitStat},
  PDASearch in 'PDASearch.pas' {frmPDASearch},
  Homenet_Point in 'Homenet_Point.pas' {frmHomenet_Point},
  IONCount in 'IONCount.pas' {frmIONCount},
  XSuperJSON in 'JSON_LIB\XSuperJSON.pas',
  XSuperObject in 'JSON_LIB\XSuperObject.pas',
  EasyOnHomeInfo in 'EasyOnHomeInfo.pas',
  Visit_Info in 'Visit_Info.pas' {frmVisit_Info},
  VisitAmount in 'VisitAmount.pas' {FrmVisitAmount},
  Visitinfo_insert in 'Visitinfo_insert.pas' {frmVisitinfo_insert},
  CustInfo_WP in 'CustInfo_WP.pas' {FrmCustInfo_WP};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := '????????????????';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TdmTables, dmTables);
  Application.CreateForm(TfrmGroupNumEdit, frmGroupNumEdit);
  Application.CreateForm(TfrmCarPossession, frmCarPossession);
  Application.CreateForm(TfrmInOutCarList, frmInOutCarList);
  Application.CreateForm(TDay_ION_IOS_Data, Day_ION_IOS_Data);
  Application.CreateForm(TMonth_IOS_ION_Data, Month_IOS_ION_Data);
  Application.CreateForm(TTerm_IOS_ION_Data, Term_IOS_ION_Data);
  Application.CreateForm(TDay2_IOS_ION_Data, Day2_IOS_ION_Data);
  Application.CreateForm(TCondition_IOS_ION_Data, Condition_IOS_ION_Data);
  Application.CreateForm(TfrmNomalCar_Management, frmNomalCar_Management);
  Application.CreateForm(TfrmIOVisitStat, frmIOVisitStat);
  Application.CreateForm(TfrmPDASearch, frmPDASearch);
  Application.CreateForm(TfrmHomenet_Point, frmHomenet_Point);
  Application.CreateForm(TfrmIONCount, frmIONCount);
  Application.CreateForm(TfrmVisit_Info, frmVisit_Info);
  Application.CreateForm(TFrmVisitAmount, FrmVisitAmount);
  Application.CreateForm(TfrmVisitinfo_insert, frmVisitinfo_insert);
  Application.CreateForm(TFrmCustInfo_WP, FrmCustInfo_WP);
  Application.Run;
end.
