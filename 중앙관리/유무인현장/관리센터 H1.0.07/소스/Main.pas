unit Main;
// 버젼정보
// H1.0.01   설정에 따라 자료조회만 가져온다 , 층별사용여부 다시부활
// H1.0.02   정기권 등록/수정 시 ISSUETK 에 FVALUE에 발금금액 넣고 , 정기권 등록에서 발금금액 입력가능하게
//           정기권 수정시 발금금액가 월정금액 표출및 수정
// H1.0.03   층별출입내역 메뉴추가
// H1.0.04   카드조회 시간조회 및 차량번호검색기능
// H1.0.05   정기권 엑셀 같은차량 업데이트시 월정액 적용
// H1.0.06   정기권 갱신부분 수정
// H1.0.07   층별출입내역 (SpecialIONData) TKType 1 or 9 조건삭제
//           일반차량 출입내역 조회시 출차카운트에 미출차도 포함하도록 수정
//           차량번호를 통한 조회시 전방/후방 모두 검색되도록 수정
//           차량 검색시 정산 위치 표시
// H1.0.08   유무인시 LPR진입금지 구역 추가 및 아파트에 쓰이는 컬럼 자동추가
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IniFiles, Menus, Buttons, ToolWin, ComCtrls, DB, ADODB,
  Grids, BaseGrid, AdvGrid, DBAdvGrid, ExtCtrls, sSpeedButton, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdTime, AdvToolBtn, ScktComp,
  IdRawBase, IdRawClient, IdIcmpClient, IdAntiFreezeBase, IdAntiFreeze,
  IdContext, IdCustomTCPServer, IdTCPServer, IdServerIOHandler, idStack, IdException,
  IdServerIOHandlerSocket, IdServerIOHandlerStack, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, idGlobal, AdvObj, Vcl.MPlayer, AdvEdit;

type
  TfrmMain = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    mnuClose: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    N29: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    mnuParkInfo: TMenuItem;
    mnuUnitInfo: TMenuItem;
    mnuFeeItem: TMenuItem;
    mnuTariff: TMenuItem;
    mnuDCInfo: TMenuItem;
    mnuHoliday: TMenuItem;
    mnuGracetime: TMenuItem;
    mnuManager: TMenuItem;
    mnuWP: TMenuItem;
    mnuDivision: TMenuItem;
    mnuCaption: TMenuItem;
    mnuSpecialTariff: TMenuItem;
    mnuCommercialTariff: TMenuItem;
    mnuDayMax: TMenuItem;
    CoolBar1: TCoolBar;
    btnNewSC: TSpeedButton;
    btnAddSC: TSpeedButton;
    btnClose: TSpeedButton;
    qryIONData: TADOQuery;
    qryIONDataParkNo: TSmallintField;
    qryIONDataUnitNo: TWordField;
    qryIONDataProcDate: TStringField;
    qryIONDataProcTime: TStringField;
    qryIONDataTKNo: TStringField;
    qryIONDataTKType: TWordField;
    qryIONDataCarTypeNo: TWordField;
    qryIONDataStatus: TWordField;
    qryIONDataOutUnitNo: TWordField;
    qryIONDataOutDate: TStringField;
    qryIONDataOutTime: TStringField;
    qryIONDataOutChk: TWordField;
    qryIONDataReserve1: TStringField;
    qryIONDataReserve2: TStringField;
    qryIONDataReserve3: TStringField;
    qryIONDataReserve4: TStringField;
    qryIONDataReserve5: TStringField;
    dsIONData: TDataSource;
    qryMainTemp: TADOQuery;
    qryTKProc: TADOQuery;
    qryTKProcParkNo: TSmallintField;
    qryTKProcUnitNo: TWordField;
    qryTKProcProcDate: TStringField;
    qryTKProcProcTime: TStringField;
    qryTKProcTKType: TWordField;
    qryTKProcCarTypeNo: TWordField;
    qryTKProcFeeNo: TWordField;
    qryTKProcTKNo: TStringField;
    qryTKProcTKParkNo: TSmallintField;
    qryTKProcTKUnitNo: TWordField;
    qryTKProcInDate: TStringField;
    qryTKProcInTime: TStringField;
    qryTKProcParkingMin: TIntegerField;
    qryTKProcTotFee: TIntegerField;
    qryTKProcTotDC: TIntegerField;
    qryTKProcRealFee: TIntegerField;
    qryTKProcRecvAmt: TIntegerField;
    qryTKProcChange: TIntegerField;
    qryTKProcMNo: TWordField;
    qryTKProcChkClosing: TWordField;
    qryTKProcDCCnt: TWordField;
    qryTKProcUnPaid: TIntegerField;
    qryTKProcReserve1: TStringField;
    qryTKProcReserve2: TStringField;
    qryTKProcReserve3: TStringField;
    qryTKProcReserve4: TStringField;
    qryTKProcReserve5: TStringField;
    dsTKProc: TDataSource;
    qrySCIn: TADOQuery;
    qrySCInParkNo: TSmallintField;
    qrySCInUnitNo: TWordField;
    qrySCInProcDate: TStringField;
    qrySCInProcTime: TStringField;
    qrySCInTKType: TWordField;
    qrySCInCarTypeNo: TWordField;
    qrySCInGroupNo: TWordField;
    qrySCInGroupName: TStringField;
    qrySCInCompName: TStringField;
    qrySCInDeptName: TStringField;
    qrySCInName: TStringField;
    qrySCInInIOStatusNo: TWordField;
    qrySCInOutUnitNo: TWordField;
    qrySCInOutDate: TStringField;
    qrySCInOutTime: TStringField;
    qrySCInOutIOStatusNo: TWordField;
    qrySCInReserve1: TStringField;
    qrySCInReserve2: TStringField;
    qrySCInReserve3: TStringField;
    qrySCInReserve4: TStringField;
    qrySCInReserve5: TStringField;
    dsSCIn: TDataSource;
    qrySCOut: TADOQuery;
    qrySCOutParkNo: TSmallintField;
    qrySCOutUnitNo: TWordField;
    qrySCOutProcDate: TStringField;
    qrySCOutProcTime: TStringField;
    qrySCOutTKType: TWordField;
    qrySCOutCarTypeNo: TWordField;
    qrySCOutGroupNo: TWordField;
    qrySCOutGroupName: TStringField;
    qrySCOutCompName: TStringField;
    qrySCOutDeptName: TStringField;
    qrySCOutName: TStringField;
    qrySCOutInIOStatusNo: TWordField;
    qrySCOutOutUnitNo: TWordField;
    qrySCOutOutDate: TStringField;
    qrySCOutOutTime: TStringField;
    qrySCOutOutIOStatusNo: TWordField;
    qrySCOutReserve1: TStringField;
    qrySCOutReserve2: TStringField;
    qrySCOutReserve3: TStringField;
    qrySCOutReserve4: TStringField;
    qrySCOutReserve5: TStringField;
    dsSCOut: TDataSource;
    qryIONDataInImage1: TStringField;
    qryIONDataInCarNo1: TStringField;
    qryIONDataInImage2: TStringField;
    qryIONDataInCarNo2: TStringField;
    qryIONDataOutImage1: TStringField;
    qryIONDataOutCarNo1: TStringField;
    qryIONDataOutImage2: TStringField;
    qryIONDataOutCarNo2: TStringField;
    qryIONDataInRecog1: TWordField;
    qryIONDataOutRecog1: TWordField;
    qryIONDataInRecog2: TWordField;
    qryIONDataOutRecog2: TWordField;
    qryTKProcCarNo: TStringField;
    qryTKProcCommercialTariff: TWordField;
    qryTKProcSpecialTariff: TWordField;
    qrySCInTKNo: TStringField;
    qrySCInInImage1: TStringField;
    qrySCInInCarNo1: TStringField;
    qrySCInInImage2: TStringField;
    qrySCInInCarNo2: TStringField;
    qrySCInOutImage1: TStringField;
    qrySCInOutCarNo1: TStringField;
    qrySCInOutImage2: TStringField;
    qrySCInOutCarNo2: TStringField;
    qrySCInInRecog1: TWordField;
    qrySCInOutRecog1: TWordField;
    qrySCInInRecog2: TWordField;
    qrySCInOutRecog2: TWordField;
    qrySCOutTKNo: TStringField;
    qrySCOutInImage1: TStringField;
    qrySCOutInCarNo1: TStringField;
    qrySCOutInImage2: TStringField;
    qrySCOutInCarNo2: TStringField;
    qrySCOutOutImage1: TStringField;
    qrySCOutOutCarNo1: TStringField;
    qrySCOutOutImage2: TStringField;
    qrySCOutOutCarNo2: TStringField;
    qrySCOutInRecog1: TWordField;
    qrySCOutOutRecog1: TWordField;
    qrySCOutInRecog2: TWordField;
    qrySCOutOutRecog2: TWordField;
    sb1: TStatusBar;
    Panel1: TPanel;
    tCount: TTimer;
    btnLock: TsSpeedButton;
    N33: TMenuItem;
    RF2: TMenuItem;
    RF3: TMenuItem;
    RF4: TMenuItem;
    RF5: TMenuItem;
    RF6: TMenuItem;
    RF7: TMenuItem;
    RF8: TMenuItem;
    N34: TMenuItem;
    RF9: TMenuItem;
    N35: TMenuItem;
    lbOperation: TLabel;
    N36: TMenuItem;
    btnBar: TSpeedButton;
    pnBar: TPanel;
    btnBar1: TAdvToolButton;
    btnBar2: TAdvToolButton;
    btnBar3: TAdvToolButton;
    btnBar4: TAdvToolButton;
    btnBar5: TAdvToolButton;
    btnBar6: TAdvToolButton;
    btnBar7: TAdvToolButton;
    btnBar8: TAdvToolButton;
    btnBarClose: TAdvToolButton;
    btnBar9: TAdvToolButton;
    btnBar10: TAdvToolButton;
    Panel13: TPanel;
    qryCtrl: TADOQuery;
    IdAntiFreeze1: TIdAntiFreeze;
    ICMP: TIdIcmpClient;
    idTC: TIdTCPClient;
    idStack1: TIdIOHandlerStack;
    idStack2: TIdServerIOHandlerStack;
    idTS: TIdTCPServer;
    RF10: TMenuItem;
    RF11: TMenuItem;
    RF12: TMenuItem;
    sp1: TShape;
    tRecog: TTimer;
    qryRecogChk: TADOQuery;
    N17: TMenuItem;
    N25: TMenuItem;
    N32: TMenuItem;
    qryMainTemp2: TADOQuery;
    btnBar11: TAdvToolButton;
    btnBar12: TAdvToolButton;
    btnBar13: TAdvToolButton;
    btnBar14: TAdvToolButton;
    w1: TMenuItem;
    N40: TMenuItem;
    N37: TMenuItem;
    a1: TMenuItem;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    pnIONData: TPanel;
    dgIONData: TDBAdvGrid;
    Panel9: TButton;
    Panel5: TPanel;
    pnTKProc: TPanel;
    dgTKProc: TDBAdvGrid;
    Panel10: TButton;
    Panel6: TPanel;
    pnSIn: TPanel;
    dgSCIn: TDBAdvGrid;
    Panel11: TButton;
    Panel7: TPanel;
    pnSOut: TPanel;
    dgSCOut: TDBAdvGrid;
    Panel12: TButton;
    Panel8: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    btnClear: TButton;
    grdStatus: TDBAdvGrid;
    mp1: TMediaPlayer;
    qryDeviceStatus: TADOQuery;
    qryDeviceStatusUnitNo: TSmallintField;
    qryDeviceStatusUnitName: TStringField;
    qryDeviceStatusDeviceName: TStringField;
    qryDeviceStatusDeviceStatus: TIntegerField;
    qryDeviceStatusDeviceStatusError: TStringField;
    qryDeviceStatusDeviceStatusDate: TStringField;
    qryDeviceStatusDeviceStatusTime: TStringField;
    DataSource1: TDataSource;
    qryTemp: TADOQuery;
    ADOQuery1: TADOQuery;
    Timer1: TTimer;
    tStart: TTimer;
    SpeedButton1: TSpeedButton;
    t1: TMenuItem;
    N38: TMenuItem;
    d1: TMenuItem;
    N39: TMenuItem;
    d2: TMenuItem;
    N41: TMenuItem;
    N42: TMenuItem;
    w2: TMenuItem;
    q1: TMenuItem;
    N43: TMenuItem;
    N44: TMenuItem;
    N45: TMenuItem;
    g1: TMenuItem;
    N46: TMenuItem;
    d3: TMenuItem;
    N47: TMenuItem;
    R1: TMenuItem;
    N48: TMenuItem;
    c1: TMenuItem;
    N49: TMenuItem;
    N50: TMenuItem;
    d4: TMenuItem;
    a2: TMenuItem;
    z1: TMenuItem;
    Button1: TButton;
    pnAlarm: TPanel;
    edtAlarmName: TAdvEdit;
    edtAlarmCarNo: TAdvEdit;
    edtAlarmCarType: TAdvEdit;
    btn1: TButton;
    tStartVip: TTimer;
    tAlarmVip: TTimer;
    mp2: TMediaPlayer;
    btnVip: TSpeedButton;
    MenuSpIonda: TMenuItem;
    d5: TMenuItem;
    homenet_point: TMenuItem;
    N51: TMenuItem;
    nvisit_Info: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mnuCloseClick(Sender: TObject);
    procedure mnuParkInfoClick(Sender: TObject);
    procedure tCountTimer(Sender: TObject);
    procedure qryIONDataOutChkGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure mnuUnitInfoClick(Sender: TObject);
    procedure mnuFeeItemClick(Sender: TObject);
    procedure mnuDCInfoClick(Sender: TObject);
    procedure mnuTariffClick(Sender: TObject);
    procedure mnuHolidayClick(Sender: TObject);
    procedure mnuGracetimeClick(Sender: TObject);
    procedure mnuManagerClick(Sender: TObject);
    procedure mnuWPClick(Sender: TObject);
    procedure N26Click(Sender: TObject);
    procedure N27Click(Sender: TObject);
    procedure btnLockClick(Sender: TObject);
    procedure btnNewSCClick(Sender: TObject);
    procedure btnAddSCClick(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure RF8Click(Sender: TObject);
    procedure RF3Click(Sender: TObject);
    procedure RF4Click(Sender: TObject);
    procedure RF5Click(Sender: TObject);
    procedure N28Click(Sender: TObject);
    procedure N29Click(Sender: TObject);
    procedure RF6Click(Sender: TObject);
    procedure RF7Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N36Click(Sender: TObject);
    procedure btnBarCloseClick(Sender: TObject);
    procedure btnBar1Click(Sender: TObject);
    procedure btnBarClick(Sender: TObject);
    procedure btnBar2Click(Sender: TObject);
    procedure btnBar3Click(Sender: TObject);
    procedure btnBar4Click(Sender: TObject);
    procedure btnBar5Click(Sender: TObject);
    procedure btnBar6Click(Sender: TObject);
    procedure btnBar7Click(Sender: TObject);
    procedure btnBar8Click(Sender: TObject);
    procedure btnBar9Click(Sender: TObject);
    procedure btnBar10Click(Sender: TObject);
    procedure RF10Click(Sender: TObject);
    procedure RF11Click(Sender: TObject);
    procedure RF12Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure idTSExecute(AContext: TIdContext);
    procedure tRecogTimer(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N25Click(Sender: TObject);
    procedure N32Click(Sender: TObject);
    procedure Panel9Click(Sender: TObject);
    procedure Panel10Click(Sender: TObject);
    procedure Panel11Click(Sender: TObject);
    procedure Panel12Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btnBar11Click(Sender: TObject);
    procedure btnBar12Click(Sender: TObject);
    procedure btnBar13Click(Sender: TObject);
    procedure btnBar14Click(Sender: TObject);
    procedure w1Click(Sender: TObject);
    procedure N40Click(Sender: TObject);
    procedure N37Click(Sender: TObject);
    procedure a1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure tStartTimer(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure grdStatusDblClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure t1Click(Sender: TObject);
    procedure N38Click(Sender: TObject);
    procedure d1Click(Sender: TObject);
    procedure N39Click(Sender: TObject);
    procedure d2Click(Sender: TObject);
    procedure N41Click(Sender: TObject);
    procedure N42Click(Sender: TObject);
    procedure w2Click(Sender: TObject);
    procedure N43Click(Sender: TObject);
    procedure N44Click(Sender: TObject);
    procedure N45Click(Sender: TObject);
    procedure g1Click(Sender: TObject);
    procedure N46Click(Sender: TObject);
    procedure t2Click(Sender: TObject);
    procedure N47Click(Sender: TObject);
    procedure d3Click(Sender: TObject);
    procedure R1Click(Sender: TObject);
    procedure N48Click(Sender: TObject);
    procedure c1Click(Sender: TObject);
    procedure N50Click(Sender: TObject);
    procedure N49Click(Sender: TObject);
    procedure d4Click(Sender: TObject);
    procedure a2Click(Sender: TObject);
    procedure z1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure tStartVipTimer(Sender: TObject);
    procedure tAlarmVipTimer(Sender: TObject);
    procedure btnVipClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure mp2Notify(Sender: TObject);
    procedure MenuSpIondaClick(Sender: TObject);
    procedure d5Click(Sender: TObject);
    procedure homenet_pointClick(Sender: TObject);
    procedure N51Click(Sender: TObject);
    procedure nvisit_InfoClick(Sender: TObject);
  private
    { Private declarations }
    procedure ICMPReply(ASender: TComponent; const ReplyStatus: TReplyStatus);
    function is_ping(IP: AnsiString): Boolean;
    procedure DBFieldAdd;
  public
    { Public declarations }
    procedure UnitCtrl(nCmd, nFCNo, nUnitNo, nMNo: Word; sData:AnsiString);
    procedure GridData;
  end;

var
  frmMain: TfrmMain;
  ping_success: Boolean = False;

  // 메뉴표출여부
  nOnlySearchMenu: Byte; //H1.0.00 1이면 자료조회만 가능 0이면 모든조건가능

  nGateRuleMenu : Byte;
  nMisuMenu : Byte;
  nNProcMenu : Byte;
  nVanReport : Byte;
  nBlackList : Byte;

implementation
uses
  Global, Tables, ParkInfo, UnitInfo, FeeItem, Tariff, DCInfo, Holiday, Gracetime,
  Manager, WP, SCGroup, CustInfo, NewSC, Login, AddSC, NProc, IONData, IOSData,
  SCData, NSCData, Card, CardAdd, RFSCGroup, RFSCCustInfo, NewRFSC, AddRFSC, Coupon,
  FreeIOData, CouponList, IOCnt, Recog, RFSCData, RFIOSData, RFNSCData, DailyReport,
  MonthlyReport, CarNoModify, IOSCnt, Freetime, ParkingTime, Alarm_vip,
  DCDetailData,  Alarm, IONTKProc, VanList, WebDiscountList, WebDiscountSum,
  WebDCReport, UnitReport, DClosingReport, NewBSC, BlackListInfo, IOBData, WebDiscountTime, WebDiscountTimeSum
  , DCTimeList, DCDayList, DcFixed, NewDcFix,RFMaster,notpasscar, GateRule, GateRuleNew, IONNProc, MisuTKProc, VanListSum, SPIondata, IOAllData, Homenet_Point, IOVisitStat, Visit_Info;

{$R *.dfm}
// 버젼정리 일반버전
// 2019.08.02 H1 장비별 마간내역 -> 기간별 마감내역으로 이름변경 . 장비별 마감내역 쿼리수정 , 일일정산마감내역 보이지않게 수정
procedure TfrmMain.DBFieldAdd;
var
 ENDCM : string;
begin
  try
    ENDCM := ' 컬럼추가 완료';
    // iondata
    with dmTables.qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from INFORMATION_SCHEMA.COLUMNS where table_name = :N1 and column_name = :N2');
      Parameters.ParamByName('N1').Value:= 'IONData';
      Parameters.ParamByName('N2').Value:= 'Reserve6';
      Open;

      if RecordCount <= 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('ALTER TABLE IONData ADD Reserve6 Varchar(50) Null DEFAULT ((0))');
        ExecSQL;
      end;

      //  tblStoreDiscountPublish
      Close;
      SQL.Clear;
      SQL.Add('select * from INFORMATION_SCHEMA.COLUMNS where table_name = :N1 and column_name = :N2');
      Parameters.ParamByName('N1').Value:= 'tblStoreDiscountPublish';
      Parameters.ParamByName('N2').Value:= 'Reserve6';
      Open;

      if RecordCount <= 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('ALTER TABLE tblStoreDiscountPublish ADD Reserve6 Varchar(50) Null DEFAULT ((0))');
        ExecSQL;
      end;

      //  tblStoreDiscountPublish
      Close;
      SQL.Clear;
      SQL.Add('select * from INFORMATION_SCHEMA.COLUMNS where table_name = :N1 and column_name = :N2');
      Parameters.ParamByName('N1').Value:= 'tblStoreDiscountPublish';
      Parameters.ParamByName('N2').Value:= 'Reserve7';
      Open;

      if RecordCount <= 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('ALTER TABLE tblStoreDiscountPublish ADD Reserve7 Varchar(50) Null DEFAULT ((0))');
        ExecSQL;
      end;

      Close;
      SQL.Clear;
      SQL.Add('select * from INFORMATION_SCHEMA.COLUMNS where table_name = :N1 and column_name = :N2');
      Parameters.ParamByName('N1').Value:= 'DCDetail';
      Parameters.ParamByName('N2').Value:= 'Reserve6';
      Open;

      if RecordCount <= 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('ALTER TABLE DCDetail ADD Reserve6 Varchar(50) Null DEFAULT ((0))');
        ExecSQL;
      end;

      // issueTK payType
      Close;
      SQL.Clear;
      SQL.Add('select * from INFORMATION_SCHEMA.COLUMNS where table_name = :N1 and column_name = :N2');
      Parameters.ParamByName('N1').Value:= 'IssueTK';
      Parameters.ParamByName('N2').Value:= 'PayType';
      Open;

      if RecordCount <= 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('ALTER TABLE IssueTK ADD PayType int Null ');
        ExecSQL;
        ExceptLogging('IssueTK PayType 생성');
      end;

      // issueTK Reserve6
      Close;
      SQL.Clear;
      SQL.Add('select * from INFORMATION_SCHEMA.COLUMNS where table_name = :N1 and column_name = :N2');
      Parameters.ParamByName('N1').Value:= 'IssueTK';
      Parameters.ParamByName('N2').Value:= 'Reserve6';
      Open;

      if RecordCount <= 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('ALTER TABLE IssueTK ADD Reserve6 Varchar(50) Null DEFAULT ((0))');
        ExceptLogging('IssueTK Reserve6 생성');
        ExecSQL;
      end;

      // custinfo payType
      Close;
      SQL.Clear;
      SQL.Add('select * from INFORMATION_SCHEMA.COLUMNS where table_name = :N1 and column_name = :N2');
      Parameters.ParamByName('N1').Value:= 'CustInfo';
      Parameters.ParamByName('N2').Value:= 'PayType';
      Open;

      if RecordCount <= 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('ALTER TABLE CustInfo ADD PayType int Null ');
        ExecSQL;
        ExceptLogging('CustInfo PayType 생성');
      end;
    end;
  except
    on E: Exception do
    begin
      ExceptLogging('TfrmMain.DBFieldAdd: ' + aString(E.Message));
    end;
  end;

  //DB버전에 따라 필요한 컬럼이 없는 경우 자동으로 추가하는 기능 (아파트 버전)
  try
    with qryMainTemp do begin
      Close;
      SQL.Clear;
      SQL.Text := 'select count(*) from INFORMATION_SCHEMA.COLUMNS where table_name=:v1 and column_name=:v2';
      Parameters.ParamByName('v1').Value := 'GGroup';
      Parameters.ParamByName('v2').Value := 'BlockLPRNo';
      Open;
      if Fields[0].Value = 0 then begin
        Close;
        SQL.Text := 'ALTER TABLE GGroup ADD BlockLPRNo varchar(50) default null';
        ExecSQL;
        ExceptLogging('그룹별 진입차단'+ENDCM);
      end;
    end;
    with qryMainTemp do begin
      Close;
      SQL.Clear;
      SQL.Text := 'select count(*) from INFORMATION_SCHEMA.COLUMNS where table_name=:v1 and column_name=:v2';
      Parameters.ParamByName('v1').Value := 'GGroup';
      Parameters.ParamByName('v2').Value := 'SMSAlarm';
      Open;
      if Fields[0].Value = 0 then begin
        Close;
        SQL.Text := 'ALTER TABLE GGroup ADD SMSAlarm tinyint NOT NULL DEFAULT 0';
        ExecSQL;
        ExceptLogging('SMS기능'+ENDCM);
      end;
    end;
    with qryMainTemp do begin
      Close;
      SQL.Clear;
      SQL.Text := 'select count(*) from INFORMATION_SCHEMA.COLUMNS where table_name=:v1 and column_name=:v2';
      Parameters.ParamByName('v1').Value := 'ParkInfo';
      Parameters.ParamByName('v2').Value := 'DayBlockCnt';
      Open;
      if Fields[0].Value = 0 then begin
        Close;
        SQL.Text := 'ALTER TABLE ParkInfo ADD DayBlockCnt tinyint DEFAULT ((0))';
        ExecSQL;
        ExceptLogging('방문객입출차제한'+ENDCM);
      end;
    end;
    with qryMainTemp do begin
      Close;
      SQL.Clear;
      SQL.Text := 'select count(*) from INFORMATION_SCHEMA.COLUMNS where table_name=:v1 and column_name=:v2';
      Parameters.ParamByName('v1').Value := 'IONData';
      Parameters.ParamByName('v2').Value := 'ParkingMin';
      Open;
      if Fields[0].Value = 0 then begin
        Close;
        SQL.Text := 'ALTER TABLE IONData ADD ParkingMin int DEFAULT ((0))';
        ExecSQL;
        ExceptLogging('방문객 주차시간'+ENDCM);
      end;
    end;
    with qryMainTemp do begin
      Close;
      SQL.Clear;
      SQL.Text := 'select count(*) from INFORMATION_SCHEMA.COLUMNS where table_name=:v1 and column_name=:v2';
      Parameters.ParamByName('v1').Value := 'Custinfo';
      Parameters.ParamByName('v2').Value := 'BujaeType';
      Open;
      if Fields[0].Value = 0 then begin
        Close;
        SQL.Text := 'alter table Custinfo add BujaeType tinyint not null default 0';
        ExecSQL;
        ExceptLogging('정기권 부제'+ENDCM);
      end;
    end;
    with qryMainTemp do begin
      Close;
      SQL.Clear;
      SQL.Text := 'select count(*) from INFORMATION_SCHEMA.COLUMNS where table_name=:v1 and (column_name=:v2 or column_name=:v3) ';
      Parameters.ParamByName('v1').Value := 'Custinfo';
      Parameters.ParamByName('v2').Value := 'sAlias';
      Parameters.ParamByName('v3').Value := 'dtUpd';
      Open;
      if Fields[0].Value = 0 then begin
        Close;
        SQL.Text := 'alter table Custinfo add sAlias varchar(50) NOT NULL DEFAULT '''' ' +
                    'alter table Custinfo add dtUpd datetime  NOT NULL DEFAULT getdate() ';
        ExecSQL;
        ExceptLogging('정기권 별명(sAlias), 업데이트시각(dtUpd) '+ENDCM);
      end;
    end;

    with qryMainTemp do begin
      Close;
      SQL.Clear;
      SQL.Text := 'select count(*) from INFORMATION_SCHEMA.COLUMNS where table_name=:v1 and column_name=:v2';
      Parameters.ParamByName('v1').Value := 'ggroup';
      Parameters.ParamByName('v2').Value := 'BujaeType';
      Open;
      if Fields[0].Value = 0 then begin
        Close;
        SQL.Text := 'alter table ggroup add BujaeType tinyint not null default 0';
        ExecSQL;
        ExceptLogging('그룹별 부제'+ENDCM);
      end;
    end;
    with qryMainTemp do begin
      Close;
      SQL.Clear;
      SQL.Text := 'select count(*) from INFORMATION_SCHEMA.COLUMNS where table_name=:v1 and column_name=:v2';
      Parameters.ParamByName('v1').Value := 'parkinfo';
      Parameters.ParamByName('v2').Value := 'FullDspUse';
      Open;
      if Fields[0].Value = 0 then begin
        Close;
        SQL.Text := 'ALTER TABLE ParkInfo ADD FullDspUse tinyint default 0';
        ExecSQL;
        ExceptLogging('만차전광판 사용유무'+ENDCM);
      end;
    end;
    with qryMainTemp do begin
      Close;
      SQL.Clear;
      SQL.Text := 'select count(*) from INFORMATION_SCHEMA.COLUMNS where table_name=:v1 and column_name=:v2';
      Parameters.ParamByName('v1').Value := 'parkinfo';
      Parameters.ParamByName('v2').Value := 'IsMemberPass';
      Open;
      if Fields[0].Value = 0 then begin
        Close;
        SQL.Text := 'ALTER TABLE ParkInfo ADD IsMemberPass tinyint default 0';
        ExecSQL;
        ExceptLogging('만차여도 정기권 통과유무'+ENDCM);
      end;
    end;

    with qryMainTemp do begin
      Close;
      SQL.Clear;
      SQL.Text := 'select COUNT(*) from INFORMATION_SCHEMA.TABLES where table_name= :v1';// and column_name=:v2 and column_name=:v3 and column_name=:v4 and column_name=:v5';
      Parameters.ParamByName('v1').Value := 'VisitInfo';
      Open;
      if Fields[0].Value = 0 then begin
        Close;
        SQL.Text := 'CREATE TABLE '+Parameters.ParamByName('v1').Value + '('+
                                    'dong int not null,' +
                                    'ho int not null,' +
                                    'CarNo varchar(50) not null,' +
                                    'StartDateTime datetime not null, '+
                                    'EndDateTime datetime not null ) ';

        ExecSQL;
        ExceptLogging('현대통신사전방문차량Table 생성'+ENDCM);
      end;
    end;


    with qryMainTemp do begin
      Close;
      SQL.Clear;
      SQL.Text := 'select count(*) from INFORMATION_SCHEMA.COLUMNS where table_name=:v1 and column_name=:v2';
      Parameters.ParamByName('v1').Value := 'VisitInfo';
      Parameters.ParamByName('v2').Value := 'TKNo';
      Open;
      if Fields[0].Value = 0 then begin
        Close;
        SQL.Text := 'ALTER TABLE '+Parameters.ParamByName('v1').Value+' ADD '+Parameters.ParamByName('v2').Value+' varchar(50)';
        ExecSQL;
        ExceptLogging('현대통신 방문자컬럼'+ENDCM);
      end;
    end;

    with qryMainTemp do begin
      Close;
      SQL.Clear;
      SQL.Text := 'select count(*) from INFORMATION_SCHEMA.COLUMNS where table_name=:v1 and column_name=:v2';
      Parameters.ParamByName('v1').Value := 'ParkInfo';
      Parameters.ParamByName('v2').Value := 'PointDate';
      Open;
      if Fields[0].Value = 0 then begin
        Close;
        SQL.Text := 'ALTER TABLE '+Parameters.ParamByName('v1').Value+' ADD  '+Parameters.ParamByName('v2').Value+' VARCHAR(50)';
        ExecSQL;
        ExceptLogging('홈넷포인트 컬럼 추가'+ENDCM);
      end;
    end;


    with qryMainTemp do begin
      Close;
      SQL.Clear;
      SQL.Text := 'select count(*) from INFORMATION_SCHEMA.COLUMNS where table_name=:v1 and column_name=:v2';
      Parameters.ParamByName('v1').Value := 'IONData';
      Parameters.ParamByName('v2').Value := 'DelYN';
      Open;
      if Fields[0].Value = 0 then begin
        Close;
        //SQL.Text := 'ALTER TABLE '+Parameters.ParamByName('v1').Value+' ADD  '+Parameters.ParamByName('v2').Value+' VARCHAR(1) NOT NULL CONSTRAINT DF_ADDR DEFAULT ''N'' ';
        SQL.Text := 'ALTER TABLE '+Parameters.ParamByName('v1').Value+' ADD  '+Parameters.ParamByName('v2').Value+' VARCHAR(1) DEFAULT ''N'' ';
        ExecSQL;
        ExceptLogging('일반차량 삭제 컬럼 추가'+ENDCM);
      end;
    end;

    with qryMainTemp do begin
      Close;
      SQL.Clear;
      SQL.Text := 'select count(*) from INFORMATION_SCHEMA.COLUMNS where table_name=:v1 and (column_name=:v2 or column_name=:v3 or column_name=:v4) ';
      Parameters.ParamByName('v1').Value := 'parkinfo';
      Parameters.ParamByName('v2').Value := 'AvailablePoint';
      Parameters.ParamByName('v3').Value := 'UsedPoint';
      Parameters.ParamByName('v4').Value := 'PointMonth';
      Open;
      if Fields[0].Value = 0 then begin
        Close;
        SQL.Text := 'ALTER TABLE '+Parameters.ParamByName('v1').Value+' ADD '+Parameters.ParamByName('v2').Value+' int default 0 ' +
                    'ALTER TABLE '+Parameters.ParamByName('v1').Value+' ADD '+Parameters.ParamByName('v3').Value+' int default 0'  +
                    'ALTER TABLE '+Parameters.ParamByName('v1').Value+' ADD '+Parameters.ParamByName('v4').Value+' int default 0 ';
        ExecSQL;
        ExceptLogging('홈넷포인트조회'+ENDCM);
      end;
    end;

    with qryMainTemp do begin
      Close;
      SQL.Clear;
      SQL.Text := 'select COUNT(*) from INFORMATION_SCHEMA.TABLES where table_name= :v1';// and column_name=:v2 and column_name=:v3 and column_name=:v4 and column_name=:v5';
      Parameters.ParamByName('v1').Value := 'Visit_Point';
      Open;
      if Fields[0].Value = 0 then begin
        Close;
        SQL.Text := 'CREATE TABLE '+Parameters.ParamByName('v1').Value + '('+
                                    'dong VARCHAR(50) not null,' +
                                    'ho VARCHAR(50) not null,' +
                                    'AvailablePoint int not null,' +
                                    'UsedPoint int not null ) '+
                    'ALTER TABLE '+ Parameters.ParamByName('v1').Value + ' ADD  CONSTRAINT  [DF_Visit_Point_AvailablePoint] DEFAULT 0 FOR AvailablePoint '+
                    'ALTER TABLE '+ Parameters.ParamByName('v1').Value + ' ADD  CONSTRAINT  [DF_Visit_Point_UsedPoint] DEFAULT 0 FOR UsedPoint ';

        ExecSQL;
        ExceptLogging('홈넷포인트조회Table 생성'+ENDCM);
      end;
    end;

    with qryMainTemp do begin
      Close;
      SQL.Clear;
      SQL.Text := 'select COUNT(*) from INFORMATION_SCHEMA.TABLES where table_name= :v1';// and column_name=:v2 and column_name=:v3 and column_name=:v4 and column_name=:v5';
      Parameters.ParamByName('v1').Value := 'VisitInfo_ICon';
      Open;
      if Fields[0].Value = 0 then begin
        Close;
        SQL.Text := 'CREATE TABLE '+Parameters.ParamByName('v1').Value + '('+
                                    'dong VARCHAR(50) not null,' +
                                    'ho VARCHAR(50) not null,' +
                                    'CarNo varchar(50) not null,' +
                                    'StartDateTime varchar(19) not null, '+
                                    'period varchar(50) not null ) ';

        ExecSQL;
        ExceptLogging('아이콘트롤스 사전방문차량Table 생성'+ENDCM);
      end;
    end;

    with qryMainTemp do begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT	B.text                                  '+
                  'FROM	sys.sysobjects AS A WITH (NOLOCK)         '+
                  'INNER JOIN sys.syscomments AS B WITH (NOLOCK)  '+
                  'ON A.id = B.id                                 '+
                  'WHERE	A.name = :V1                            ';
      Parameters.ParamByName('v1').Value := 'GetSecondToTime';
      Open;
      //if Fields[0].Value = 0 then begin
      if RecordCount <= 0 then begin
        Close;
        SQL.Text := 'CREATE FUNCTION [dbo].[GetSecondToTime]'+#13#10+
                    '( @ss int                              '+#13#10+
                    ')                                      '+#13#10+
                    'RETURNS varchar(50)                    '+#13#10+
                    'AS                                     '+#13#10+
                    'BEGIN                                  '+#13#10+
                    'DECLARE @ResultVar varchar(50)         '+#13#10+
                    'select @ResultVar =                    '+#13#10+
                    'CONVERT(varchar(10),@ss/3600) + '':''  '+#13#10+
                    ' + right(''0''+CONVERT(varchar(2),(@ss%3600) / 60),2) + '':''  '+#13#10+
                    ' + right(''0''+CONVERT(varchar(2),@ss%60),2) + ''''            '+#13#10+
                    'RETURN @ResultVar                                              '+#13#10+
                    'END                                                            ';

        ExecSQL;
        ExceptLogging('저장 프로시저 함수 생성'+ENDCM);
      end;
    end;

    with qryMainTemp do begin
      Close;
      SQL.Clear;
      SQL.Text := 'select count(*) from INFORMATION_SCHEMA.COLUMNS where table_name=:v1 and column_name=:v2';
      Parameters.ParamByName('v1').Value := 'IOSData';
      Parameters.ParamByName('v2').Value := 'Reserve7';
      Open;
      if Fields[0].Value = 0 then begin
        Close;
        SQL.Text := 'ALTER TABLE '+Parameters.ParamByName('v1').Value+' ADD  '+Parameters.ParamByName('v2').Value+' VARCHAR(50) ';
        ExecSQL;
        ExceptLogging('단기 정기차량 컬럼 추가'+ENDCM);
      end;
    end;

    with qryMainTemp do begin
      Close;
      SQL.Clear;
      SQL.Text := 'select COUNT(*) from INFORMATION_SCHEMA.TABLES where table_name= :v1';// and column_name=:v2 and column_name=:v3 and column_name=:v4 and column_name=:v5';
      Parameters.ParamByName('v1').Value := 'tVisitfavo';
      Open;
      if Fields[0].Value = 0 then begin
        Close;
        SQL.Text := 'CREATE TABLE '+Parameters.ParamByName('v1').Value + '('+
                    'nReg_No int IDENTITY(1,1) NOT NULL, ' +  //'(PK:유효식별키)',
                    'nDong   int NOT NULL default -1, ' +  //  '(동)',
                    'nHo     int NOT NULL default -1, ' +  // '(호)',
                    'sCar_Number varchar(50)  NOT NULL default '''',  '+ //'(차량번호)',
                    'sRegister   varchar(50)  NOT NULL default '''',  '+ //'(등록자)',
                    'sDeleteYN   varchar(2)   NOT NULL default ''N'', '+  //(삭제.여부),
                    'dtUpd       datetime     NOT NULL default getdate(),   '+  // '(수정.일시)',
                    'dtReg       datetime     NOT NULL default getdate(),   '+  //'(등록.일시)',
                    'CONSTRAINT [PK_tVisitfavo] PRIMARY KEY CLUSTERED       '+
                    '(                                                      '+                    'nReg_No      ASC,                                      '+                    'nDong        ASC,                                      '+                    'nHo          ASC,                                      '+                    'sCar_Number  ASC                                       '+                    ')WITH ( PAD_INDEX = OFF,                               '+                    '        STATISTICS_NORECOMPUTE = OFF,                  '+                    '    IGNORE_DUP_KEY = OFF,                              '+                    '    ALLOW_ROW_LOCKS = ON,                              '+                    '    ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]               '+                    ') ON [PRIMARY]                                         ';        ExecSQL;
        ExceptLogging('방문차량 즐겨찾기 Table 생성 '+ENDCM);
      end;
    end;

    with qryMainTemp do begin
      Close;
      SQL.Clear;
      SQL.Text := 'select COUNT(*) from INFORMATION_SCHEMA.TABLES where table_name= :v1';// and column_name=:v2 and column_name=:v3 and column_name=:v4 and column_name=:v5';
      Parameters.ParamByName('v1').Value := 'CalamityBarControl';
      Open;
      if Fields[0].Value = 0 then begin
        Close;
        SQL.Text := 'CREATE TABLE '+Parameters.ParamByName('v1').Value + '('+
                                    'BarStatus varchar(50) NULL, ' +
                                    'ProcDate  datetime NULL     ' +
                                    ') ON [PRIMARY]               ';        ExecSQL;
        ExceptLogging('지진발생 Table 생성 '+ENDCM);
      end;
    end;

    with qryMainTemp do begin
        Close;
        SQL.Clear;
        SQL.Text := 'select count(*) from INFORMATION_SCHEMA.COLUMNS where table_name=:v1 and column_name=:v2';
        Parameters.ParamByName('v1').Value := 'ParkInfo';
        Parameters.ParamByName('v2').Value := 'visitinfocount';
        Open;
        if Fields[0].Value = 0 then begin
          Close;
          SQL.Text := 'ALTER TABLE '+Parameters.ParamByName('v1').Value+' ADD  '+Parameters.ParamByName('v2').Value+' int default 0 ';
          ExecSQL;
          ExceptLogging('사전방문 차량 대수'+ENDCM);
        end;
      end;

      with qryMainTemp do begin
        Close;
        SQL.Clear;
        SQL.Text := 'select count(*) from INFORMATION_SCHEMA.COLUMNS where table_name=:v1 and column_name=:v2';
        Parameters.ParamByName('v1').Value := 'ParkInfo';
        Parameters.ParamByName('v2').Value := 'visitinfoTime';
        Open;
        if Fields[0].Value = 0 then begin
          Close;
          SQL.Text := 'ALTER TABLE '+Parameters.ParamByName('v1').Value+' ADD  '+Parameters.ParamByName('v2').Value+' int default 0 ';
          ExecSQL;
          ExceptLogging('사전방문 차량 등록 가능 시간 '+ENDCM);
        end;
      end;

      with qryMainTemp do begin
        Close;
        SQL.Clear;
        SQL.Text := 'select count(*) from INFORMATION_SCHEMA.COLUMNS where table_name=:v1 and column_name=:v2';
        Parameters.ParamByName('v1').Value := 'ParkInfo';
        Parameters.ParamByName('v2').Value := 'visitinfoDate';
        Open;
        if Fields[0].Value = 0 then begin
          Close;
          SQL.Text := 'ALTER TABLE '+Parameters.ParamByName('v1').Value+' ADD  '+Parameters.ParamByName('v2').Value+' int default 0 ';
          ExecSQL;
          ExceptLogging('사전방문 예약가능일 '+ENDCM);
        end;
      end;

      with qryMainTemp do begin
        Close;
        SQL.Clear;
        SQL.Text := 'select count(*) from INFORMATION_SCHEMA.COLUMNS where table_name=:v1 and column_name=:v2';
        Parameters.ParamByName('v1').Value := 'ParkInfo';
        Parameters.ParamByName('v2').Value := 'visitinfoInsert';
        Open;
        if Fields[0].Value = 0 then begin
          Close;
          SQL.Text := 'ALTER TABLE '+Parameters.ParamByName('v1').Value+' ADD  '+Parameters.ParamByName('v2').Value+' VARCHAR(50) ';
          ExecSQL;
          ExceptLogging('사전방문 차량등록 횟수 '+ENDCM);
        end;
      end;

      with qryMainTemp do begin
        Close;
        SQL.Clear;
        SQL.Text := 'select count(*) from INFORMATION_SCHEMA.COLUMNS where table_name=:v1 and column_name=:v2';
        Parameters.ParamByName('v1').Value := 'ParkInfo';
        Parameters.ParamByName('v2').Value := 'PointType';
        Open;
        if Fields[0].Value = 0 then begin
          Close;
          SQL.Text := 'ALTER TABLE '+Parameters.ParamByName('v1').Value+' ADD  '+Parameters.ParamByName('v2').Value+' int default 0 ';
          ExecSQL;
          ExceptLogging('홈넷 포인트 타입  '+ENDCM);
        end;
      end;

      with qryMainTemp do begin
        Close;
        SQL.Clear;
        SQL.Text := 'select count(*) from INFORMATION_SCHEMA.COLUMNS where table_name=:v1 and column_name=:v2';
        Parameters.ParamByName('v1').Value := 'ParkInfo';
        Parameters.ParamByName('v2').Value := 'PointUnit';
        Open;
        if Fields[0].Value = 0 then begin
          Close;
          SQL.Text := 'ALTER TABLE '+Parameters.ParamByName('v1').Value+' ADD  '+Parameters.ParamByName('v2').Value+' int default 0 ';
          ExecSQL;
          ExceptLogging('홈넷 포인트 단위  '+ENDCM);
        end;
      end;

      with qryMainTemp do begin
        Close;
        SQL.Clear;
        SQL.Text := 'select count(*) from INFORMATION_SCHEMA.COLUMNS where table_name=:v1 and column_name=:v2';
        Parameters.ParamByName('v1').Value := 'IONData';
        Parameters.ParamByName('v2').Value := 'UsedPoint';
        Open;
        if Fields[0].Value = 0 then begin
          Close;
          SQL.Text := 'ALTER TABLE '+Parameters.ParamByName('v1').Value+' ADD  '+Parameters.ParamByName('v2').Value+' int default 0 ';
          ExecSQL;
          ExceptLogging('일반차량 홈넷 포인트이력 단위  '+ENDCM);
        end;
      end;

      with qryMainTemp do begin
        Close;
        SQL.Clear;
        SQL.Text := 'select count(*) from INFORMATION_SCHEMA.COLUMNS where table_name=:v1 and column_name=:v2';
        Parameters.ParamByName('v1').Value := 'CustInfo';
        Parameters.ParamByName('v2').Value := 'WeekUse';
        Open;
        if Fields[0].Value = 0 then begin
          Close;
          SQL.Text := 'ALTER TABLE '+Parameters.ParamByName('v1').Value+' ADD  '+Parameters.ParamByName('v2').Value+' Varchar(1) default ''N'' ';
          ExecSQL;
          ExceptLogging('휴일출입관리 단위  '+ENDCM);
        end;
      end;

      with qryMainTemp do begin
        Close;
        SQL.Clear;
        SQL.Text := 'select count(*) from INFORMATION_SCHEMA.COLUMNS where table_name=:v1 and column_name=:v2';
        Parameters.ParamByName('v1').Value := 'ParkInfo';
        Parameters.ParamByName('v2').Value := 'MiddleParkTime';
        Open;
        if Fields[0].Value = 0 then begin
          Close;
          SQL.Text := 'ALTER TABLE '+Parameters.ParamByName('v1').Value+' ADD  '+Parameters.ParamByName('v2').Value+' int default 0 ';
          ExecSQL;
          ExceptLogging('중간층 입차 필드  '+ENDCM);
        end;
      end;

      with qryMainTemp do begin
        Close;
        SQL.Clear;
        SQL.Text := 'select count(*) from INFORMATION_SCHEMA.COLUMNS where table_name=:v1 and column_name=:v2';
        Parameters.ParamByName('v1').Value := 'IONData';
        Parameters.ParamByName('v2').Value := 'VisitDong';
        Open;
        if Fields[0].Value = 0 then begin
          Close;
          SQL.Text := 'ALTER TABLE '+Parameters.ParamByName('v1').Value+' ADD  '+Parameters.ParamByName('v2').Value+' int default 0 ';
          ExecSQL;
          ExceptLogging('사전 방문 동 추가(무인)  '+ENDCM);
        end;
      end;

      with qryMainTemp do begin
        Close;
        SQL.Clear;
        SQL.Text := 'select count(*) from INFORMATION_SCHEMA.COLUMNS where table_name=:v1 and column_name=:v2';
        Parameters.ParamByName('v1').Value := 'IONData';
        Parameters.ParamByName('v2').Value := 'VisitHo';
        Open;
        if Fields[0].Value = 0 then begin
          Close;
          SQL.Text := 'ALTER TABLE '+Parameters.ParamByName('v1').Value+' ADD  '+Parameters.ParamByName('v2').Value+' int default 0 ';
          ExecSQL;
          ExceptLogging('사전 방문 호 추가(무인)  '+ENDCM);
        end;
      end;

      with qryMainTemp do begin
        Close;
        SQL.Clear;
        SQL.Text := 'select count(*) from INFORMATION_SCHEMA.COLUMNS where table_name=:v1 and column_name=:v2';
        Parameters.ParamByName('v1').Value := 'IONData';
        Parameters.ParamByName('v2').Value := 'VisitReason';
        Open;
        if Fields[0].Value = 0 then begin
          Close;
          SQL.Text := 'ALTER TABLE '+Parameters.ParamByName('v1').Value+' ADD  '+Parameters.ParamByName('v2').Value+' int default 0 ';
          ExecSQL;
          ExceptLogging('사전 방문 방문사유 추가(무인)  '+ENDCM);
        end;
      end;

       with qryMainTemp do begin
        Close;
        SQL.Clear;
        SQL.Text := 'select count(*) from INFORMATION_SCHEMA.COLUMNS where table_name=:v1 and column_name=:v2';
        Parameters.ParamByName('v1').Value := 'Visit_Point';
        Parameters.ParamByName('v2').Value := 'accumulatedPoint';
        Open;
        if Fields[0].Value = 0 then begin
          Close;
          SQL.Text := 'ALTER TABLE '+Parameters.ParamByName('v1').Value+' ADD  '+Parameters.ParamByName('v2').Value+' int default 0 ';
          ExecSQL;
          ExceptLogging('포인트 누적 단위  '+ENDCM);
        end;
      end;

      with qryMainTemp do begin
        Close;
        SQL.Clear;
        SQL.Text := 'select count(*) from INFORMATION_SCHEMA.COLUMNS where table_name=:v1 and column_name=:v2';
        Parameters.ParamByName('v1').Value := 'Visit_Point';
        Parameters.ParamByName('v2').Value := 'RemainPoint';
        Open;
        if Fields[0].Value = 0 then begin
          Close;
          SQL.Text := 'ALTER TABLE '+Parameters.ParamByName('v1').Value+' ADD  '+Parameters.ParamByName('v2').Value+' int default 0 ';
          ExecSQL;
          ExceptLogging('포인트 누적 단위2  '+ENDCM);
        end;
      end;

      with qryMainTemp do begin
        Close;
        SQL.Clear;
        SQL.Text := 'select COUNT(*) from INFORMATION_SCHEMA.TABLES where table_name= :v1';
        Parameters.ParamByName('v1').Value := 'CustInfo_D';
        Open;
        if Fields[0].Value = 0 then begin
          Close;
          SQL.Text := 'CREATE TABLE '+Parameters.ParamByName('v1').Value + '('+
                                      'ParkNo smallint NOT NULL,  ' +
                                      'TKType tinyint NOT NULL,   ' +
                                      'GroupNo smallint NOT NULL, ' +
                                      'TKNo [varchar](50) NOT NULL, '+
                                      '[Name] [varchar](50) NULL,   '+
                                      '[TelNo] [varchar](50) NULL,  '+
                                      '[CarNo] [varchar](50) NULL,   '+
                                      '[CompName] [varchar](50) NULL,'+
                                      '[DeptName] [varchar](50) NULL,'+
                                      '[Address] [varchar](100) NULL,'+
                                      '[IssueDate] [char](10) NOT NULL, '+
                                      '[IssueAmt] [int] NOT NULL,       '+
                                      '[Status] [tinyint] NOT NULL,     '+
                                      '[ExpDateF] [char](10) NOT NULL,  '+
                                      '[ExpDateT] [char](10) NOT NULL,  '+
                                      '[WPNo] [tinyint] NOT NULL,       '+
                                      '[LastParkNo] [smallint] NOT NULL, '+
                                      '[LastUnitNo] [smallint] NOT NULL, '+
                                      '[LastUseDate] [char](10) NOT NULL,'+
                                      '[LastUseTime] [char](8) NOT NULL, '+
                                      '[IOStatusNo] [tinyint] NOT NULL,  '+
                                      '[CurrAmt] [int] NOT NULL,         '+
                                      '[APB] [tinyint] NOT NULL,         '+
                                      '[CarType] [tinyint] NOT NULL,     '+
                                      '[MarkNo] [varchar](50) NULL,      '+
                                      '[HIType] [tinyint] NOT NULL,      '+
                                      '[HISTime] [char](5) NOT NULL,     '+
                                      '[HIETime] [char](5) NOT NULL,     '+
                                      '[Reserve1] [varchar](50) NULL,    '+
                                      '[Reserve2] [varchar](50) NULL,    '+
                                      '[Reserve3] [varchar](50) NULL,    '+
                                      '[Reserve4] [varchar](50) NULL,    '+
                                      '[Reserve5] [varchar](50) NULL,    '+
                                      '[BujaeType] [tinyint] NOT NULL,   '+
                                      '[JumCode] [smallint] NOT NULL,    '+
                                      '[JasmineDCTime] [smallint] NOT NULL,  '+
                                      '[ValetChk] [tinyint] NOT NULL,        '+
                                      '[DataChk] [tinyint] NOT NULL,         '+
                                      '[UDate] [char](10) NULL,              '+
                                      '[UTime] [char](8) NULL,               '+
                                      '[IOStart] [char](5) NULL,             '+
                                      '[IOEnd] [char](5) NULL,               '+
                                      '[sweek] [varchar](10) NULL,           '+
                                      '[DelDate] [char](10) NULL             '+
                                      ') ON [PRIMARY]                        ';

          ExecSQL;
          ExceptLogging('정기차량 백업 테이블 생성'+ENDCM);
        end;
      end;

      with qryMainTemp do begin
        Close;
        SQL.Clear;
        SQL.Text := 'select count(*) from INFORMATION_SCHEMA.COLUMNS where table_name=:v1 and column_name=:v2';
        Parameters.ParamByName('v1').Value := 'Visit_Point';
        Parameters.ParamByName('v2').Value := 'RemainPoint';
        Open;
        if Fields[0].Value = 0 then begin
          Close;
          SQL.Text := 'ALTER TABLE '+Parameters.ParamByName('v1').Value+' ADD  '+Parameters.ParamByName('v2').Value+' int default 0 ';
          ExecSQL;
          ExceptLogging('포인트 누적 단위2  '+ENDCM);
        end;
      end;


  except
    on E: Exception do begin
      ExceptLogging('TfrmMain.DBFieldAdd 2' + E.Message);
    end;
  end;

end;

procedure TfrmMain.ICMPReply(ASender: TComponent; const ReplyStatus: TReplyStatus);
begin
  case ReplyStatus.ReplyStatusType of
    rsTimeOut: ping_success:= False;
    rsErrorUnreachable: ping_success:= False;
    rsEcho: ping_success:= True;
  end;
end;

procedure TfrmMain.idTSExecute(AContext: TIdContext);
//var
//  sRecv, sRemortIP, sSend, sData: aString;
//  nCmd, nUnitNo, nMNo: Word;
//  i: Byte;
//  bSend: Boolean;
//begin
//  try
//    sRecv := AContext.Connection.IOHandler.ReadString
//      (AContext.Connection.IOHandler.InputBuffer.Size, enUTF8);
//
//    if Pos(STX, sRecv) > 0 then
//      sErrRecv := sErrRecv
//    else
//      sErrRecv := sErrRecv + sRecv;
//
//    if (Pos(STX, sErrRecv) <= 0) or (Pos(ETX, sErrRecv) <= 0) then
//      Exit;
//
//    sRemortIP := AContext.Binding.PeerIP;
//    ExceptLogging('FC_Recv: ' + sErrRecv + ':' + sRemortIP);
//    nCmd := StrToInt(Copy(sRecv, 2, 2));
//    nUnitNo := StrToInt(Copy(sRecv, 4, 5));
//    nMNo := StrToInt(Copy(sRecv, 9, 3));
//
//    if Pos(ETX, sErrRecv) > 12 then
//    begin
//      // 데이터가 있으면...
//      sData := Copy(sErrRecv, 12, Pos(ETX, sErrRecv) - 12);
//    end
//    else
//      sData := '';
//
//    bSend := False;
//
//    case nCmd of
//      2:
//        begin
//          if not tRecog.Enabled then
//            tRecog.Enabled:= True;
//        end;
//    end;
//    sErrRecv := '';
//  except
//    on E: Exception do
//      ExceptLogging('TfrmMain.idTSExecute: ' + aString(E.Message));
//  end;
//end;
var
  sRecv, sRemortIP, sData, sTemp: aString;
begin
  try
    sRecv:= AContext.Connection.IOHandler.ReadString(AContext.Connection.IOHandler.InputBuffer.Size, enUTF8);

    if Pos(STX, sRecv) > 0 then
      sErrRecv := sRecv
    else
      sErrRecv := sErrRecv + sRecv;

    if sRecv = 'OK' then
    begin
      AContext.Connection.Socket.WriteLn('OK', enUTF8);
      Exit;
    end;


    if (Pos(STX, sErrRecv) <= 0) or (Pos(ETX, sErrRecv) <= 0) then
      Exit;


    sRemortIP := AContext.Binding.PeerIP;
    ExceptLogging('FC_Recv: ' + sErrRecv + ':' + sRemortIP);

    // 데이터가 있으면...
    sData := sErrRecv;
    sAlarmNameVip := Copy(sData, 2, Pos(AnsiString('^'), AnsiString(sData)) - 2);
    ExceptLogging('이름 : ' + sAlarmNameVip);
    sTemp := Copy(sData, Pos(AnsiString('^'), AnsiString(sData)) + 1,
                  Length(sData) - (Pos(AnsiString('^'), AnsiString(sData))));
    sAlarmCompNameVip := Copy(sTemp, 1, Pos(AnsiString('^'), AnsiString(sTemp)) - 1);
    ExceptLogging('회사명 : '+sAlarmCompNameVip);
    sTemp := Copy(sTemp, Pos(AnsiString('^'), AnsiString(sTemp)) + 1,
                  Length(sTemp) - (Pos(AnsiString('^'), AnsiString(sTemp))));
    sAlarmCarNoVip := Copy(sTemp, 1, Pos(AnsiString('^'), AnsiString(sTemp)) - 1);
    ExceptLogging('차량번호 : '+sAlarmCarNoVip);
    sAlarmCarTypeVip := Copy(sTemp, Pos(AnsiString('^'), AnsiString(sTemp)) + 1,
                     (Pos(AnsiString(ETX), AnsiString(sTemp))-Pos(AnsiString('^'), AnsiString(sTemp))-1));
    ExceptLogging('차량종류 : '+sAlarmCarTypeVip);
//    sData := sErrRecv;
//    //sAlarmNameVip := Copy(sData, 2, Pos('^', sData) - 2);
//    sAlarmNameVip := Copy(sData, 1, Pos('^', sData) - 1);
//    ExceptLogging('이름 : ' + sAlarmNameVip);
//    sTemp := Copy(sData, Pos('^', sData) + 1, Length(sData) - (Pos('^', sData)));
//    sAlarmCompNameVip := Copy(sTemp, 1, Pos('^', sTemp) - 1);
//    ExceptLogging('회사명 : '+sAlarmCompNameVip);
//    sTemp := Copy(sTemp, Pos('^', sTemp) + 1, Length(sTemp) - (Pos('^', sTemp)));
//    sAlarmCarNoVip := Copy(sTemp, 1, Pos('^', sTemp) - 1);
//    ExceptLogging('차량번호 : '+sAlarmCompNameVip);
//    sTemp := Copy(sTemp, Pos('^', sTemp) + 1, Length(sTemp) - (Pos('^', sTemp)));
//    sAlarmCarTypeVip := Copy(sTemp, 1, Pos(':', sTemp) - 2);
//    ExceptLogging('차량종류 : '+sAlarmCarTypeVip);
////    sTemp := Copy(sTemp, Pos(ETX, sTemp) + 1, Length(sTemp) - (Pos(ETX, sTemp)));;
////    sAlarmCarTypeVip := Copy(sTemp, 1, Pos(ETX, sTemp) - 1);

    edtAlarmName.Text := sAlarmNameVip;
    ExceptLogging('이름 : ' + edtAlarmName.Text);
    edtAlarmCarNo.Text := sAlarmCarNoVip;
    ExceptLogging('회사명 : '+edtAlarmCarNo.Text);
    edtAlarmCarType.Text := sAlarmCarTypeVip;
    ExceptLogging('차량종류 : '+edtAlarmCarType.Text);

    if FileExists(mp2.FileName) then
    begin
      tAlarmVip.Enabled:= False;

      tStartVip.Enabled:= True;
      tAlarmVip.Enabled:= True;
    end
    else
      ExceptLogging('알람용 파일없음: ' + mp2.FileName);

    sErrRecv := '';
  except
    on E: EIdSocketError do
    begin
      if E.LastError <> 10054 then ExceptLogging('TfrmMain.idTSExecute: ' + E.Message);
      Exit;
    end;

    on E: EIdConnClosedGracefully do Exit;

    on E: Exception do ExceptLogging('TfrmMain.idTSExecute: ' + E.Message);
  end;


//var
//  sRecv, sRemortIP, sSend, sData: aString;
//  nCmd, nUnitNo, nMNo: Word;
//  i: Byte;
//  bSend: Boolean;
//begin
//  try
//    sRecv := AContext.Connection.IOHandler.ReadString
//      (AContext.Connection.IOHandler.InputBuffer.Size, enUTF8);
//
//    if Pos(STX, sRecv) > 0 then
//      sErrRecv := sErrRecv
//    else
//      sErrRecv := sErrRecv + sRecv;
//
//    if (Pos(STX, sErrRecv) <= 0) or (Pos(ETX, sErrRecv) <= 0) then
//      Exit;
//
//    sRemortIP := AContext.Binding.PeerIP;
//    ExceptLogging('FC_Recv: ' + sErrRecv + ':' + sRemortIP);
//    nCmd := StrToInt(Copy(sRecv, 2, 2));
//    nUnitNo := StrToInt(Copy(sRecv, 4, 5));
//    nMNo := StrToInt(Copy(sRecv, 9, 3));
//
//    if Pos(ETX, sErrRecv) > 12 then
//    begin
//      // 데이터가 있으면...
//      sData := Copy(sErrRecv, 12, Pos(ETX, sErrRecv) - 12);
//    end
//    else
//      sData := '';
//
//    bSend := False;
//
//    case nCmd of
//      2:
//        begin
//          if not tRecog.Enabled then
//            tRecog.Enabled:= True;
//        end;
//    end;
//    sErrRecv := '';
//  except
//    on E: Exception do
//      ExceptLogging('TfrmMain.idTSExecute: ' + aString(E.Message));
//  end;
end;

function TfrmMain.is_ping(IP: AnsiString): Boolean;
begin
  Result:= False;
  try
    with ICMP do
    begin
      OnReply:= ICMPReply;
      ReceiveTimeOut:= 2000;
      Host:= wString(IP);
      Ping;
    end;
    Result:= ping_success;
  except
    on E: Exception do ExceptLogging('TfrmMain.is_ping: ' + aString(E.Message));
  end;
end;



//nCmd: 1-BarOpen
procedure TfrmMain.UnitCtrl(nCmd, nFCNo, nUnitNo, nMNo: Word; sData:AnsiString);
var
  sFCIp, sSend: aString;
  nFCPort: Word;
  nResponse: Smallint;
begin
  try
    with qryCtrl do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from UnitInfo where UnitNo = :N1');
      Parameters.ParamByName('N1').Value:= nFCNo;
      Open;

      if RecordCount > 0 then
      begin
        sFCIp:= MG_StrTrim(FieldByName('IPNo').AsString, ' ');
        nFCPort:= FieldByName('PortNo').AsInteger;

        if is_Ping(sFCIP) then
        begin
          try
            idTC.Disconnect;
            idTC.Host:= sFCIp;
            idTC.Port:= nFCPort;
            idTC.Connect;

            if idTC.Connected then
            begin
              sSend:= STX + MG_InsZero(IntToStr(nCmd), 2) + MG_InsZero(IntToStr(nUnitNo), 5) +
                      MG_InsZero(IntToStr(nMNo), 3) + sData + ETX;
              idTC.IOHandler.WriteLnRFC(sSend, enUTF8);
              idTC.Disconnect;
            end;
          except
            on E: Exception do ExceptLogging('TfrmMain.UnitCtrl: ' + aString(E.Message));
          end;
        end
        else
          ExceptLogging('UnitCtrl(' + IntToStr(nCmd) + ')시 네트워크 오류!');
      end;
    end;
  except
    on E: Exception do ExceptLogging('TfrmMain.UnitCtrl: ' + aString(E.Message));
  end;
end;

procedure TfrmMain.w1Click(Sender: TObject);
begin
//  if bMenuLock then
//    ShowMessage('관리자 메뉴입니다. 먼저 잠금해제하세요!')
//  else
//  begin
//    if nManagerAuthority <= 2 then
//      NextModalDialog(TfrmGroupAddSC.Create(Self))
//    else
//      ShowMessage('관리자 메뉴입니다. 관리자권한으로 잠금해제하세요!');
//  end;
end;

procedure TfrmMain.w2Click(Sender: TObject);
begin
  NextModalDialog(TfrmDCDetailData.Create(Self));
end;

procedure TfrmMain.z1Click(Sender: TObject);
begin
  NextModalDialog(TfrmVanListSum.Create(Self));
end;

procedure TfrmMain.MenuSpIondaClick(Sender: TObject);
begin
  NextModalDialog(TfrmSPIONData.Create(Self));
end;

procedure TfrmMain.btnBar10Click(Sender: TObject);
var
  sReason: aString;
begin
  sReason:= InputBox('수동오픈사유', '차단기수동오픈사유를 입력하여주세요!', '');
  UnitCtrl(1, btnBar10.ImageIndex, btnBar10.Tag, nCurrMNo, sReason);
end;

procedure TfrmMain.btnBar11Click(Sender: TObject);
var
  sReason: aString;
begin
  sReason:= InputBox('수동오픈사유', '차단기수동오픈사유를 입력하여주세요!', '');
  UnitCtrl(1, btnBar11.ImageIndex, btnBar11.Tag, nCurrMNo, sReason);
end;

procedure TfrmMain.btnBar12Click(Sender: TObject);
var
  sReason: aString;
begin
  sReason:= InputBox('수동오픈사유', '차단기수동오픈사유를 입력하여주세요!', '');
  UnitCtrl(1, btnBar12.ImageIndex, btnBar12.Tag, nCurrMNo, sReason);
end;

procedure TfrmMain.btnBar13Click(Sender: TObject);
var
  sReason: aString;
begin
  sReason:= InputBox('수동오픈사유', '차단기수동오픈사유를 입력하여주세요!', '');
  UnitCtrl(1, btnBar13.ImageIndex, btnBar13.Tag, nCurrMNo, sReason);
end;

procedure TfrmMain.btnBar14Click(Sender: TObject);
var
  sReason: aString;
begin
  sReason:= InputBox('수동오픈사유', '차단기수동오픈사유를 입력하여주세요!', '');
  UnitCtrl(1, btnBar14.ImageIndex, btnBar14.Tag, nCurrMNo, sReason);
end;

procedure TfrmMain.btnBar1Click(Sender: TObject);
var
  sReason: aString;
begin
  sReason:= InputBox('수동오픈사유', '차단기수동오픈사유를 입력하여주세요!', '');
  UnitCtrl(1, btnBar1.ImageIndex, btnBar1.Tag, nCurrMNo, sReason);
end;

procedure TfrmMain.btnBar2Click(Sender: TObject);
var
  sReason: aString;
begin
  sReason:= InputBox('수동오픈사유', '차단기수동오픈사유를 입력하여주세요!', '');
  UnitCtrl(1, btnBar2.ImageIndex, btnBar2.Tag, nCurrMNo, sReason);
end;

procedure TfrmMain.btnBar3Click(Sender: TObject);
var
  sReason: aString;
begin
  sReason:= InputBox('수동오픈사유', '차단기수동오픈사유를 입력하여주세요!', '');
  UnitCtrl(1, btnBar3.ImageIndex, btnBar3.Tag, nCurrMNo, sReason);
end;

procedure TfrmMain.btnBar4Click(Sender: TObject);
var
  sReason: aString;
begin
  sReason:= InputBox('수동오픈사유', '차단기수동오픈사유를 입력하여주세요!', '');
  UnitCtrl(1, btnBar4.ImageIndex, btnBar4.Tag, nCurrMNo, sReason);
end;

procedure TfrmMain.btnBar5Click(Sender: TObject);
var
  sReason: aString;
begin
  sReason:= InputBox('수동오픈사유', '차단기수동오픈사유를 입력하여주세요!', '');
  UnitCtrl(1, btnBar5.ImageIndex, btnBar5.Tag, nCurrMNo, sReason);
end;

procedure TfrmMain.btnBar6Click(Sender: TObject);
var
  sReason: aString;
begin
  sReason:= InputBox('수동오픈사유', '차단기수동오픈사유를 입력하여주세요!', '');
  UnitCtrl(1, btnBar6.ImageIndex, btnBar6.Tag, nCurrMNo, sReason);
end;

procedure TfrmMain.btnBar7Click(Sender: TObject);
var
  sReason: aString;
begin
  sReason:= InputBox('수동오픈사유', '차단기수동오픈사유를 입력하여주세요!', '');
  UnitCtrl(1, btnBar7.ImageIndex, btnBar7.Tag, nCurrMNo, sReason);
end;

procedure TfrmMain.btnBar8Click(Sender: TObject);
var
  sReason: aString;
begin
  sReason:= InputBox('수동오픈사유', '차단기수동오픈사유를 입력하여주세요!', '');
  UnitCtrl(1, btnBar8.ImageIndex, btnBar8.Tag, nCurrMNo, sReason);
end;

procedure TfrmMain.btnBar9Click(Sender: TObject);
var
  sReason: aString;
begin
  sReason:= InputBox('수동오픈사유', '차단기수동오픈사유를 입력하여주세요!', '');
  UnitCtrl(1, btnBar9.ImageIndex, btnBar9.Tag, nCurrMNo, sReason);
end;

procedure TfrmMain.btnBarClick(Sender: TObject);
begin
  pnBar.Visible:= True;
end;

procedure TfrmMain.btnBarCloseClick(Sender: TObject);
begin
  pnBar.Visible:= False;
end;

procedure TfrmMain.btnClearClick(Sender: TObject);
begin
  // 전체 장애해제
  try
    StatusLogging('모든 장비 장애해제');
    if MessageDlg('전체 장비 장애해제 하시겠습니까?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;

    if (sAlarmYn = '1') then
    begin
      mp1.Stop;
      mp1.Rewind;
      mp1.Notify := False;
    end;

    with qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('update DeviceStatus set DeviceStatus = 1 ');
      ExecSQL;
    end;

    GridData;
  except
    on E: Exception do StatusLogging('TfrmMain.btnClearClick: ' + aString(E.Message));
  end;
end;

procedure TfrmMain.btnLockClick(Sender: TObject);
begin
  if bMenuLock then
  begin
    nLoginResult:= 0;
    NextModalDialog(TfrmLogin.Create(Self));

    Case nLoginResult of
      1:      begin
                btnLock.Caption:= '메뉴잠금';
                bMenuLock:= False;
              end;

      0:      begin
                ShowMessage('근무자확인에 실패하여 메뉴잠금을 해제할 수 없습니다.');
                Exit;
              end;
    end;

    case nManagerAuthority of
      0: begin
           N1.Enabled:= True;
           N2.Enabled:= True;
           N3.Enabled:= True;
           N7.Enabled:= True;
           N8.Enabled:= True;
           RF2.Enabled:= True;
           mnuParkInfo.Enabled:= True;
           mnuUnitInfo.Enabled:= True;
      end;

      1: begin
           N1.Enabled:= True;
           N2.Enabled:= True;
           N3.Enabled:= True;
           N7.Enabled:= True;
           N8.Enabled:= True;
           RF2.Enabled:= True;
           mnuParkInfo.Enabled:= False;
           mnuUnitInfo.Enabled:= False;
      end;

      2: begin
           N1.Enabled:= False;
           N2.Enabled:= True;
           N3.Enabled:= True;
           N7.Enabled:= True;
           N8.Enabled:= True;
           RF2.Enabled:= True;
      end;

      3: begin
           ShowMessage('프로그램 사용권한이 아닙니다.');
           Close;
           Exit;
      end;
    end;
  end
  else
  begin
    btnLock.Caption:= '메뉴잠금해제';
    bMenuLock:= True;
    nLoginResult:= 0;
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  try
    CreateFileMapping( $FFFFFFFF, nil, PAGE_READWRITE, 0, 1, 'Parking_HOST' );

    if GetLastError=ERROR_ALREADY_EXISTS then
    begin
      ShowMessage('주차관리프로그램이 이미 실행중입니다.'#13#13#10 + '확인하여주세요!');
      halt;
    end;
    sCurrRunDir:= aString(ExtractFileDir(Application.ExeName));

    if not DirectoryExists('Log') then MkDir('Log');
    if not DirectoryExists('DeviceStatus') then MkDir('DeviceStatus');
  except
    on E: Exception do ExceptLogging('TfrmMain.FormCreate: ' + aString(E.Message));
  end;
end;

procedure TfrmMain.FormResize(Sender: TObject);
begin
  //Panel3.Width:= frmMain.ClientWidth div 2;
  Panel4.Width:= Panel3.Width div 2;
  Panel6.Width:= Panel2.Width div 2;
  Panel2.Height:= (frmMain.ClientHeight - sb1.Height - CoolBar1.Height) div 4 * 3;
  Panel3.Height:= (Panel2.Height) div 2;
  dgIONData.Columns[1].Width := Panel4.Width div 7;
  dgIONData.Columns[2].Width := Panel4.Width div 7;
  dgIONData.Columns[3].Width := Panel4.Width div 7;
  dgIONData.Columns[4].Width := Panel4.Width div 7;
  dgIONData.Columns[5].Width := Panel4.Width div 7;
  dgIONData.Columns[6].Width := Panel4.Width div 7;
  dgSCIn.Columns[1].Width := Panel5.Width div 7;
  dgSCIn.Columns[2].Width := Panel5.Width div 7;
  dgSCIn.Columns[3].Width := Panel5.Width div 7;
  dgSCIn.Columns[4].Width := Panel5.Width div 7;
  dgSCIn.Columns[5].Width := Panel5.Width div 7;
  dgSCIn.Columns[6].Width := Panel5.Width div 7;
  dgSCOut.Columns[1].Width := Panel6.Width div 7;
  dgSCOut.Columns[2].Width := Panel6.Width div 7;
  dgSCOut.Columns[3].Width := Panel6.Width div 7;
  dgSCOut.Columns[4].Width := Panel6.Width div 7;
  dgSCOut.Columns[5].Width := Panel6.Width div 7;
  dgSCOut.Columns[6].Width := Panel6.Width div 7;
  grdStatus.Width := panel3.Width div 3 * 2;
  grdStatus.ColWidths[1] := grdStatus.Width div 7;
  grdStatus.ColWidths[2] := grdStatus.Width div 7;
  grdStatus.ColWidths[3] := grdStatus.Width div 7;
  grdStatus.ColWidths[4] := grdStatus.Width div 7;
  grdStatus.ColWidths[5] := grdStatus.Width div 7;
  grdStatus.ColWidths[6] := grdStatus.Width div 7;
  btnClear.Left := panel15.Width - btnClear.Width;   // 장애해제 버튼위치
end;

procedure TfrmMain.FormShow(Sender: TObject);
var
  sDBString: aString;
  SystemTime: TSystemTime;
  sDateTime, sYear, sMonth, sDay, sHour, sMin, sSec: String;
  i: Byte;
  nWeb : Integer;
begin
  try
    ExceptLogging('Program Start!');
    iSetup:= TIniFile.Create(ExtractFileDir(Application.ExeName) + '\ParkSet.ini');
    sDBIP:= aString(iSetup.ReadString('PARKING', 'DB IP', ''));
    sDBID:= aString(iSetup.ReadString('PARKING', 'DB ID', ''));
    sDBPW:= aString(iSetup.ReadString('PARKING', 'DB PW', ''));
    sDBName:= iSetup.ReadString('PARKING', 'DB Name', '');
    pnBar.Top:= (frmMain.ClientHeight - pnBar.Height) div 2;
    pnBar.Left:= (frmMain.ClientWidth - pnBar.Width) div 2;
    sImageDir:= 'C:\LPRImage';
    sAlarmFile:= iSetup.ReadString('PARKING', 'Alarm File', '');
    nLoadTime:= StrToInt(iSetup.ReadString('PARKING', 'Load Time', '20'));
    timer1.Interval:= nLoadTime * 1000;
    sAlarmYn := iSetup.ReadString('PARKING', 'AlarmYN', '');

    sAlarmYnVip := iSetup.ReadString('PARKING', 'AlarmYNVip', '');
    sAlarmFileVip:= iSetup.ReadString('PARKING', 'Alarm FileVip', '');
    nAlarmTimeVip := StrToInt(iSetup.ReadString('PARKING', 'Alarm TimeVip', '20'));

    sImageIP :=  iSetup.ReadString('PARKING', 'ImageIP', '0');
    nWeb := iSetup.ReadInteger('PARKING', 'web', 0);
    sDcfixed := iSetup.ReadString('PARKING', 'dcfixed', '');
    sRfmaster := iSetup.ReadString('PARKING', 'rfmaster', '');
    sCustInfoConfirm := iSetup.ReadString('PARKING', 'custinfoconfirm', '');
    sNotPassCar := iSetup.ReadString('PARKING', 'notpasscar', '');
    gGroupdateconvert := iSetup.ReadString('PARKING', 'groupdateconvert', '');
    gpasssecurity := iSetup.ReadString('PARKING', 'passsecurity', '');

    // 메뉴표출여부
    gVisitRemark := iSetup.ReadInteger('PARKING', '방문사유', 0);
    nGateRuleMenu := iSetup.ReadInteger('PARKING', '출입통제메뉴', 0);
    nMisuMenu := iSetup.ReadInteger('PARKING', '미수차량메뉴', 0);
    nNProcMenu := iSetup.ReadInteger('PARKING', '정산처리내역메뉴', 0);
    nVanReport := iSetup.ReadInteger('PARKING', '카드사별집계내역', 0);
    nBlackList := iSetup.ReadInteger('PARKING', '블랙리스트', 0);
    nApt        := iSetup.ReadInteger('PARKING', '아파트', 1);
    nStair     := iSetup.ReadInteger('PARKING', '층별처리여부', 0); // H1.0.01
    nRegMoney   := iSetup.ReadInteger('PARKING', '정기권월별체크', 1);
    nOnlySearchMenu:= iSetup.ReadInteger('PARKING', '자료조회만가능여부', 0);
    //nOnlySearchMenu:= iSetup.ReadInteger('PARKING', '자료조회만가능여부', 0);
    nImageUse := iSetup.ReadInteger('PARKING', '이미지처리', 0);
    nHomenet_Point := iSetup.ReadInteger('PARKING', '홈넷포인트', 0);
    nHomenet_visit  := iSetup.ReadInteger('PARKING', '홈넷사전방문', 0);

    bBlockLPRUse   := iSetup.ReadBool('PARKING', 'LPR별진입차단사용', False);
    imSHanguelUse  := iSetup.ReadInteger('PARKING', '한글키사용', 0);

    if sImageIP <> '0' then
      ExceptLogging('이미지경로IP > ' + sImageIP);

    timer1.Enabled := true;
    tAlarmVip.Interval := nAlarmTimeVip*1000;


    // 알람사용 할거면
    if (sAlarmYn = '1') then
    begin
      if FileExists(sAlarmFile) then
      begin
        mp1.FileName:= sAlarmFile;
        mp1.Open;
      end;
      ExceptLogging('알람 사용');
    end
    else
    begin
      ExceptLogging('알람 사용 안함');
    end;

    if (sAlarmYnVip = '0') then
    begin
      btnVip.Visible := False;
      btnLock.Left  := btnLock.Left - 80;
      btnClose.Left := btnClose.Left - 80;
    end
    else
    begin
      if FileExists(sAlarmFileVip) then
      begin
        mp2.FileName:= sAlarmFileVip;
        mp2.Open;
      end;
    end;

    if sDBIP = '' then
      sDBIP:= aString(InputBox('DB설정 입력', 'DB IP 또는 DB서버명을 입력하여주세요', ''));

    if sDBID = '' then
      sDBID:= aString(InputBox('DB ID 입력', 'DB 접속용 ID를 입력하여주세요', ''));

    if sDBPW = '' then
      sDBPW:= aString(InputBox('DB Password 입력', 'DB 접속용 Password를 입력하여주세요', ''));

    if sDBName = '' then
      sDBName := aString(InputBox('DB Name 입력', 'DB명을  입력하여주세요', ''));

    if (sDBIP <> '') and (sDBID <> '') and (sDBPW <> '') and (sDBName <> '') then
    begin
      try
        //DB연결...
        dmTables.ADODB.Connected := False;
        sDBString := 'Provider=SQLOLEDB.1;Persist Security Info=False;';
        sDBString := sDBString + 'User ID=' + sDBID;
        sDBString := sDBString + ';Password=' + sDBPW;
        sDBString := sDBString + ';Initial Catalog=' + sDBName;
        sDBString := sDBString + ';Data Source=' + sDBIP;
        dmTables.ADODB.ConnectionString:= wString(sDBString);
        dmTables.ADODB.Connected:= True;
      except
        on E: Exception do
        begin
          ExceptLogging('DB Connect Error:' + aString(E.Message));
          ShowMessage('데이터베이스 연결에 실패하였습니다. 확인하여주세요.');
          Exit;
        end;
      end;
      iSetup.WriteString('PARKING', 'DB IP', wString(sDBIP));
      iSetup.WriteString('PARKING', 'DB ID', wString(sDBID));
      iSetup.WriteString('PARKING', 'DB PW', wString(sDBPW));
      iSetup.WriteString('PARKING', 'DB Name', sDBName);
    end;

    if (sDBIP = '') then
    begin
      ShowMessage('DB IP 또는 서버명을 입력하여주세요.'#13#10 +
                  'DB 연결이 안되면 프로그램을 정상적으로 실행할 수 없습니다.');
      Exit;
    end;

    if (sDBID = '') then
    begin
      ShowMessage('DB 접속용 ID를 입력하여주세요.'#13#10 +
                  'DB 연결이 안되면 프로그램을 정상적으로 실행할 수 없습니다.');
      Exit;
    end;

    if (sDBPW = '') then
    begin
      ShowMessage('DB 접속용 Password를 입력하여주세요.'#13#10 +
                  'DB 연결이 안되면 프로그램을 정상적으로 실행할 수 없습니다.');
      Exit;
    end;

    if (sDBName = '') then
    begin
      ShowMessage('DB명을 입력하여주세요.'#13#10 + 'DB 연결이 안되면 프로그램을 정상적으로 실행할 수 없습니다.');
      Exit;
    end;
    DBFieldAdd;

    with qryMainTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from ParkInfo Order By ParkNo');
      Open;

      if RecordCount > 0 then
      begin
        nCurrParkNo:= FieldByName('ParkNo').AsInteger;
        nMichulKeep:= FieldByName('MichulKeep').AsInteger;
        tCount.Enabled:= True;

        if FieldByName('Reserve1').AsString = '개방운영' then
          lbOperation.Visible:= True;
      end
      else
        ExceptLogging('설치된 주차장이 없음!');

      ExceptLogging(IntToStr(nCurrParkNo));

      Close;
      SQL.Clear;
      SQL.Add('Select * from UnitInfo Where UnitKind = :N1 and ParkNo = :N2 Order By ParkNo, UnitNo');
      Parameters.ParamByName('N1').Value:= 8;  //입구LPR
      Parameters.ParamByName('N2').Value:= nCurrParkNo;
      Open;

//       if RecordCount > 0 then
//      begin
//        i:= 1;
//
//             while not Eof do
//             begin
//          with frmMain do
//          begin
//            TAdvToolButton(FindComponent('btnBar' + IntToStr(i))).Caption:= FieldByName('UnitName').AsString;
//            TAdvToolButton(FindComponent('btnBar' + IntToStr(i))).Hint:=
//              wString(MG_StrTrim(aString(FieldByName('IPNo').AsString), ' '));
//            TAdvToolButton(FindComponent('btnBar' + IntToStr(i))).GroupIndex:= FieldByName('PortNo').AsInteger;
//            TAdvToolButton(FindComponent('btnBar' + IntToStr(i))).Tag:= FieldByName('UnitNo').AsInteger;
//            TAdvToolButton(FindComponent('btnBar' + IntToStr(i))).ImageIndex:= FieldByName('MyNo').AsInteger;
//            TAdvToolButton(FindComponent('btnBar' + IntToStr(i))).Visible:= True;
//          end;
//          i:= i+1;
//          Next;
//        end;
//        btnBar.Enabled:= True;
//      end;   */

      Close;
      SQL.Clear;
      SQL.Add('Select * from UnitInfo Where UnitKind = :N1 and ParkNo = :N2 Order By ParkNo, UnitNo');
      Parameters.ParamByName('N1').Value:= 9;  //출구LPR
      Parameters.ParamByName('N2').Value:= nCurrParkNo;
      Open;

//      if RecordCount > 0 then
 //     begin
  //      while not Eof do
   //     begin
    //      with frmMain do
     //     begin
      //      TAdvToolButton(FindComponent('btnBar' + IntToStr(i))).Caption:= FieldByName('UnitName').AsString;
       //     TAdvToolButton(FindComponent('btnBar' + IntToStr(i))).Hint:=
       //       wString(MG_StrTrim(aString(FieldByName('IPNo').AsString), ' '));
        //    TAdvToolButton(FindComponent('btnBar' + IntToStr(i))).GroupIndex:= FieldByName('PortNo').AsInteger;
         //   TAdvToolButton(FindComponent('btnBar' + IntToStr(i))).Tag:= FieldByName('UnitNo').AsInteger;
  //          TAdvToolButton(FindComponent('btnBar' + IntToStr(i))).ImageIndex:= FieldByName('MyNo').AsInteger;
  //          TAdvToolButton(FindComponent('btnBar' + IntToStr(i))).Visible:= True;
  //        end;
  //        i:= i+1;
  //        Next;
  //      end;
  //      btnBar.Enabled:= True;
  //    end;

      Close;
      SQL.Clear;


      SQL.Add('select convert(varchar(30), getdate(), 120) tnow');
      Open;

      sDateTime:= FieldByName('tNow').AsString;
      sYear:= Copy(sDateTime, 1, 4);
      sMonth:= Copy(sDateTime, 6, 2);
      sDay:= Copy(sDateTime, 9, 2);
      sHour:= Copy(sDateTime, 12, 2);
      sMin:= Copy(sDateTime, 15, 2);
      sSec:= Copy(sDateTime, 18, 2);

      with SystemTime do
      begin
        wYear:= StrToInt(sYear);
        wMonth:= StrToInt(sMonth);
        wDay:= StrToInt(sDay);
        wDayOfWeek:= DayOfWeek(now)-1;
        wHour:= StrToInt(sHour);
        wMinute:= StrToInt(sMin);
        wSecond:= StrToInt(sSec);
        wMilliseconds:= 0;
      end;
      SetLocalTime(SystemTime);
    end;

    nLoginResult := 0;
    NextModalDialog(TfrmLogin.Create(Self));

    if nLoginResult = 0 then
    begin
      ShowMessage('로그인에 실패하여 프로그램을 종료합니다.');
      Close;
      Exit;
    end;

    case nManagerAuthority of
      0: begin
           N1.Enabled:= True;
           N2.Enabled:= True;
           N3.Enabled:= True;
           N7.Enabled:= True;
           N8.Enabled:= True;
           RF2.Enabled:= True;
           mnuParkInfo.Enabled:= True;
           mnuUnitInfo.Enabled:= True;
      end;

      1: begin
           N1.Enabled:= True;
           N2.Enabled:= True;
           N3.Enabled:= True;
           N7.Enabled:= True;
           N8.Enabled:= True;
           RF2.Enabled:= True;
           mnuParkInfo.Enabled:= False;
           mnuUnitInfo.Enabled:= False;
      end;

      2: begin
           N1.Enabled:= False;
           N2.Enabled:= True;
           N3.Enabled:= True;
           N7.Enabled:= True;
           N8.Enabled:= True;
           RF2.Enabled:= True;
      end;

      3: begin
           ShowMessage('프로그램 사용권한이 아닙니다.');
           Close;
           Exit;
      end;
    end;

    if nOnlySearchMenu =1 then
    begin
      N1.Enabled:= False;
      N2.Enabled:= False;
      btnNewSC.Enabled:= False;
      btnLock.Enabled:= False;
    end;

    idTS.Active:= True;

    // ini 파일에서 web 사용여부를 설정한다. 0: 사용안함, 1: 사용
    // 사용여부에 따라서 메뉴 표출
    if nWeb = 0 then
    begin
      d1.Visible := false; // 웹 업체별 할인내역
      N39.Visible := false; // 웹 업체별 할인집계내역
      d2.Visible := false; // 업체별 후불 마감내역
    end;
    if nStair = 0 then
    begin
      MenuSpIonda.Visible := false; // cmdqufdlehd
    end;


    if sRfmaster = '0' then
    begin
      R1.Visible := false; // RF등록 안보이기
    end;

    if sDcfixed  ='0' then
    begin
      d3.Visible := false;
      N47.Visible := false;

    end;

    if sNotPassCar  ='0' then
    begin
       N48.Visible := false;
    end;

    if nApt = 1 then
    begin
      dgSCIn.Columns[4].Header := '동';
      dgSCIn.Columns[5].Header := '호';

      dgSCOut.Columns[4].Header := '동';
      dgSCOut.Columns[5].Header := '호';
    end
    else
    begin
       N51.Visible := False;
    end;

    if nGateRuleMenu = 0 then c1.Visible := false;
    if nMisuMenu = 0 then a2.Visible := false;
    if nNProcMenu = 0 then d4.Visible := false;
    if nVanReport = 0 then z1.Visible := false;
    if nBlackList = 0 then q1.Visible := false;

    if nHomenet_Point = 0 then homenet_point.Visible := false;//홈넷 포인트 사용 여부

    if nHomenet_visit = 0 then nvisit_info.Visible := false; //사전방문 (홈넷)


  except
    on E: Exception do ExceptLogging('TfrmMain.FormShow: ' + aString(E.Message));
  end;
end;

procedure TfrmMain.g1Click(Sender: TObject);
begin
  NextModalDialog(TfrmWebDiscountTime.Create(Self));
end;

procedure TfrmMain.grdStatusDblClick(Sender: TObject);
begin
  // 더블클릭시 장애해제
  try
    if MessageDlg('장애해제 하시겠습니까?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;

    nUnitNo := 0;
    sStatusDate := '';
    sStatusTime := '';

    with qryDeviceStatus do
    begin
      nUnitNo :=  FieldByName('UnitNo').AsInteger;
      sStatusDate := FieldByName('DeviceStatusDate').AsString;
      sStatusTime := FieldByName('DeviceStatusTime').AsString;
    end;
    // 장애해제
    with qryTemp do
    begin
      DisableControls;
      try
        Close;
        SQL.Clear;
        SQL.Add('update DeviceStatus set DeviceStatus = 1 ');
        SQL.Add('where UnitNo = :pUnitNo ');
        SQL.Add('and DeviceStatusDate = :pDate and DeviceStatusTime = :pTime');
        Parameters.ParamByName('pUnitNo').Value := nUnitNo;
        Parameters.ParamByName('pDate').Value := sStatusDate;
        Parameters.ParamByName('pTime').Value := sStatusTime;
        ExecSQL;
      finally
        EnableControls;
      end;

    end;
    StatusLogging(IntToStr(nUnitNo) + '번 부스 장애해제, 발생일자: ' + sStatusDate + ', 발생시간: ' + sStatusDate);
    GridData;
  except
    on E: Exception do StatusLogging('TfrmMain.grdStatusDblClick: ' + aString(E.Message));
  end;
end;

procedure TfrmMain.N40Click(Sender: TObject);
begin
  NextModalDialog(TfrmDCDetailData.Create(Self));
end;

procedure TfrmMain.N41Click(Sender: TObject);
begin
  NextModalDialog(TfrmUnitReport.Create(Self));
end;

procedure TfrmMain.N42Click(Sender: TObject);
begin
  NextModalDialog(TfrmDClosingReport.Create(Self));
end;

procedure TfrmMain.N43Click(Sender: TObject);
begin
  if bMenuLock then
    ShowMessage('관리자 메뉴입니다. 먼저 잠금해제하세요!')
  else
  begin
    if nManagerAuthority <= 2 then
      NextModalDialog(TfrmNewBSC.Create(Self))
    else
      ShowMessage('관리자 메뉴입니다. 관리자권한으로 잠금해제하세요!');
  end;
end;

procedure TfrmMain.N44Click(Sender: TObject);
begin
 if bMenuLock then
   ShowMessage('관리자 메뉴입니다. 먼저 잠금해제하세요!')
 else
 begin
   if nManagerAuthority <= 2 then
     NextModalDialog(TfrmBlackListInfo.Create(Self))
   else
     ShowMessage('관리자 메뉴입니다. 관리자권한으로 잠금해제하세요!');
 end;
end;

procedure TfrmMain.N45Click(Sender: TObject);
begin
  NextModalDialog(TfrmIOBData.Create(Self));
end;

procedure TfrmMain.N46Click(Sender: TObject);
begin
  NextModalDialog(TfrmWebDCTimeSum.Create(Self));
end;


procedure TfrmMain.N47Click(Sender: TObject);
begin
  NextModalDialog(TfrmDCFixed.Create(Self));
end;


procedure TfrmMain.N48Click(Sender: TObject);
begin
  NextModalDialog(TfrmNotPassCar.Create(Self));
end;

procedure TfrmMain.N49Click(Sender: TObject);
begin
  NextModalDialog(TfrmGateRuleNew.Create(Self));
end;

procedure TfrmMain.N50Click(Sender: TObject);
begin
  NextModalDialog(TfrmGateRule.Create(Self));
end;

procedure TfrmMain.N51Click(Sender: TObject);
begin
     NextModalDialog(TfrmIOVisitStat.Create(Self));
end;

procedure TfrmMain.mnuCloseClick(Sender: TObject);
begin
  ExceptLogging('Program Close');
  dmTables.ADODB.Connected:= False;
  Close;
end;

procedure TfrmMain.mnuDCInfoClick(Sender: TObject);
begin
  NextModalDialog(TfrmDCInfo.Create(Self));
end;

procedure TfrmMain.mnuFeeItemClick(Sender: TObject);
begin
  NextModalDialog(TfrmFeeItem.Create(Self));
end;

procedure TfrmMain.mnuGracetimeClick(Sender: TObject);
begin
  NextModalDialog(TfrmGracetime.Create(Self));
end;

procedure TfrmMain.mnuHolidayClick(Sender: TObject);
begin
  NextModalDialog(TfrmHoliday.Create(Self));
end;

procedure TfrmMain.mnuManagerClick(Sender: TObject);
begin
  NextModalDialog(TfrmManager.Create(Self));
end;

procedure TfrmMain.mnuParkInfoClick(Sender: TObject);
begin
  NextModalDialog(TfrmParkInfo.Create(Self));
end;

procedure TfrmMain.mnuTariffClick(Sender: TObject);
begin
  NextModalDialog(TfrmTariff.Create(Self));
end;

procedure TfrmMain.mnuUnitInfoClick(Sender: TObject);
begin
  NextModalDialog(TfrmUnitInfo.Create(Self));
end;

procedure TfrmMain.mnuWPClick(Sender: TObject);
begin
  NextModalDialog(TfrmWP.Create(Self));
end;

procedure TfrmMain.mp2Notify(Sender: TObject);
begin
  if mp2.NotifyValue = nvSuccessful then
    mp2.Play;
end;

procedure TfrmMain.N10Click(Sender: TObject);
begin
  NextModalDialog(TfrmDailyReport.Create(Self));
end;

procedure TfrmMain.N11Click(Sender: TObject);
begin
  NextModalDialog(TfrmMonthlyReport.Create(Self));
end;

procedure TfrmMain.N12Click(Sender: TObject);
begin
  NextModalDialog(TfrmNProc.Create(Self));
end;

procedure TfrmMain.N13Click(Sender: TObject);
begin
  NextModalDialog(TfrmIONData.Create(Self));
end;

procedure TfrmMain.N14Click(Sender: TObject);
begin
  NextModalDialog(TfrmSCData.Create(Self));
end;

procedure TfrmMain.N15Click(Sender: TObject);
begin
  NextModalDialog(TfrmIOSData.Create(Self));
end;

procedure TfrmMain.N16Click(Sender: TObject);
begin
  NextModalDialog(TfrmNSCData.Create(Self));
end;

procedure TfrmMain.N17Click(Sender: TObject);
begin
  NextModalDialog(TfrmCarNoModify.Create(Self));
end;

procedure TfrmMain.N18Click(Sender: TObject);
begin
  NextModalDialog(TfrmIOCnt.Create(Self));
end;

procedure TfrmMain.N19Click(Sender: TObject);
begin
  NextModalDialog(TfrmParkingTime.Create(Self));
end;

procedure TfrmMain.N20Click(Sender: TObject);
begin
  NextModalDialog(TfrmFreeIOData.Create(Self));
end;

procedure TfrmMain.N23Click(Sender: TObject);
begin
  NextModalDialog(TfrmCouponList.Create(Self));
end;

procedure TfrmMain.N25Click(Sender: TObject);
begin
  NextModalDialog(TfrmIOSCnt.Create(Self));
end;

procedure TfrmMain.N26Click(Sender: TObject);
begin
  NextModalDialog(TfrmSCGroup.Create(Self));
end;

procedure TfrmMain.N27Click(Sender: TObject);
begin
  NextModalDialog(TfrmCustInfo.Create(Self));
end;

procedure TfrmMain.N28Click(Sender: TObject);
begin
  if bMenuLock then
    ShowMessage('관리자 메뉴입니다. 먼저 잠금해제하세요!')
  else
  begin
    if nManagerAuthority <= 2 then
      NextModalDialog(TfrmNewSC.Create(Self))
    else
      ShowMessage('관리자 메뉴입니다. 관리자권한으로 잠금해제하세요!');
  end;
end;

procedure TfrmMain.N29Click(Sender: TObject);
begin
  if bMenuLock then
    ShowMessage('관리자 메뉴입니다. 먼저 잠금해제하세요!')
  else
  begin
    if nManagerAuthority <= 2 then
      NextModalDialog(TfrmAddSC.Create(Self))
    else
      ShowMessage('관리자 메뉴입니다. 관리자권한으로 잠금해제하세요!');
  end;
end;

procedure TfrmMain.N32Click(Sender: TObject);
begin
  NextModalDialog(TfrmFreetime.Create(Self));
end;

procedure TfrmMain.N36Click(Sender: TObject);
begin
  //인식률 조회
  NextModalDialog(TfrmRecog.Create(Self));
end;

procedure TfrmMain.N37Click(Sender: TObject);
begin
 // NextModalDialog(TfrmDCData.Create(Self));
end;

procedure TfrmMain.N38Click(Sender: TObject);
begin
  NextModalDialog(TfrmIONTKProc.Create(Self));
end;

// 웹 업체별 할인집계내역
procedure TfrmMain.N39Click(Sender: TObject);
begin
  NextModalDialog(TfrmWebDCSum.Create(Self));
end;

procedure TfrmMain.N7Click(Sender: TObject);
begin
  //쿠폰발매...
  NextModalDialog(TfrmCoupon.Create(Self));
end;

procedure TfrmMain.nvisit_InfoClick(Sender: TObject);
begin
   NextModalDialog(TfrmVisit_Info.Create(Self));
end;

procedure TfrmMain.Panel10Click(Sender: TObject);
var
  nNCnt, nNAmt: Integer;
begin
    with qryTKProc do
    begin
      DisableControls;
      try
        Close;
        SQL.Clear;
        SQL.Add('Select * from TKProc where ProcDate = :N1 Order By ProcTime Desc');
        Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', Now);
        Open;


        if RecordCount > 0 then
          dgTKProc.ScrollBars:= ssBoth
        else
          dgTKProc.ScrollBars:= ssNone;
      finally
         EnableControls;
      end;

    end;

    with qryMainTemp do
    begin
      DisableControls;
      try
        Close;
        SQL.Clear;
        SQL.Add('Select Count(*) nCnt from TKProc where ProcDate = :N1');
        Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', Now);
        Open;

        nNCnt:= FieldByName('nCnt').AsInteger;

        Close;
        SQL.Clear;
        SQL.Add('Select Sum(RecvAmt) nAmt from TKProc Group By ProcDate Having ProcDate = :N1');
        Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', Now);
        Open;

        nNAmt:= FieldByName('nAmt').AsInteger;
        Close;
      finally
         EnableControls;
      end;
    end;
    pnTKProc.Caption:= IntToStr(nNCnt) + '건  ' + IntToStr(nNAmt) + '원';
end;

procedure TfrmMain.Panel11Click(Sender: TObject);
var
  nSIn: Integer;
begin
    with qrySCIn do
    begin
      try
        DisableControls;
        Close;
        SQL.Clear;
        SQL.Add('Select * from IOSData where ProcDate = :N1 and InIOStatusNo = :N2 Order By ProcTime Desc');
        Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', Now);
        Parameters.ParamByName('N2').Value:= 1;
        Open;

        if RecordCount > 0 then
        begin
          dgSCIn.ScrollBars:= ssBoth;
        end
        else
          dgSCIn.ScrollBars:= ssNone;

        nSIn:= RecordCount;
      finally
          EnableControls;
      end;

    end;
    pnSIn.Caption:= '총 ' + IntToStr(nSIn) + '대 입차';
end;

procedure TfrmMain.Panel12Click(Sender: TObject);
var
  nSOut: Integer;
begin
    with qrySCOut do
    begin
      DisableControls;
      try
        Close;
        SQL.Clear;
        SQL.Add('Select * from IOSData where OutDate = :N1 and OutIOStatusNo = :N2 Order By OutTime Desc');
        Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', Now);
        Parameters.ParamByName('N2').Value:= 2;
        Open;
        if RecordCount > 0 then
          dgSCOut.ScrollBars:= ssBoth
        else
          dgSCOut.ScrollBars:= ssNone;

        nSOut:= RecordCount;
      finally
          EnableControls;
      end;
    end;
    pnSOut.Caption:= '총 ' + IntToStr(nSOut) + '대 출차';
end;

procedure TfrmMain.Panel9Click(Sender: TObject);
var
  nNIn, nNOut: Integer;
begin
    with qryIONData do
    begin
      DisableControls;
      try
        Close;
        SQL.Clear;
        SQL.Add('Select * from IONData where ProcDate = :N1 Order By ProcTime Desc');
        Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', Now);
        Open;

        if RecordCount > 0 then
          dgIONData.ScrollBars:= ssBoth
        else
          dgIONData.ScrollBars:= ssNone;
      finally
         EnableControls;
      end;
    end;

    with qryMainTemp do
    begin
      DisableControls;
      try
        Close;
        SQL.Clear;
        SQL.Add('Select Count(*) nIn from IONData where ProcDate = :N1 and Status = :N2 and OutChk <> :N3');
        Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', Now);
        Parameters.ParamByName('N2').Value:= 1;
        Parameters.ParamByName('N3').Value:= 7;
        Open;

        nNIn:= FieldByName('nIn').AsInteger;

        Close;
        SQL.Clear;
        SQL.Add('Select Count(*) nOut from IONData where OutDate = :N1 and Status = :N2 and OutChk > :N3 ');
        SQL.Add('and OutChk <> 7');
        Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', Now);
        Parameters.ParamByName('N2').Value:= 1;
        Parameters.ParamByName('N3').Value:= 0;
        Open;

        nNOut:= FieldByName('nOut').AsInteger;
      finally
         EnableControls;
      end;
    end;
    pnIONData.Caption:= '입차 : ' + IntToStr(nNIn) + '대,  출차 : ' + IntToStr(nNOut) + '대';
end;

procedure TfrmMain.qryIONDataOutChkGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Case qryIONDataOutChk.Value of
    0: Text:= '미출차';
    1: Text:= '정상출차';
    2: Text:= '할인출차';
    3: Text:= '무료출차';
    4: Text:= '출차허용';
    5: Text:= '무료시간출차';
    6: Text:= '민원출차';
    7: Text:= '미출차정리';
  end;
end;

procedure TfrmMain.R1Click(Sender: TObject);
begin
  NextModalDialog(TfrmRFMaster.Create(Self));
end;

procedure TfrmMain.RF10Click(Sender: TObject);
begin
  NextModalDialog(TfrmRFSCData.Create(Self));
end;

procedure TfrmMain.RF11Click(Sender: TObject);
begin
  NextModalDialog(TfrmRFIOSData.Create(Self));
end;

procedure TfrmMain.RF12Click(Sender: TObject);
begin
  NextModalDialog(TfrmRFNSCData.Create(Self));
end;

procedure TfrmMain.RF3Click(Sender: TObject);
begin
  NextModalDialog(TfrmCardAdd.Create(Self));
end;

procedure TfrmMain.RF4Click(Sender: TObject);
begin
  NextModalDialog(TfrmRFSCGroup.Create(Self));
end;

procedure TfrmMain.RF5Click(Sender: TObject);
begin
  NextModalDialog(TfrmRFSCCustInfo.Create(Self));
end;

procedure TfrmMain.RF6Click(Sender: TObject);
begin
  NextModalDialog(TfrmNewRFSC.Create(Self));
end;

procedure TfrmMain.RF7Click(Sender: TObject);
begin
  NextModalDialog(TfrmAddRFSC.Create(Self));
end;

procedure TfrmMain.RF8Click(Sender: TObject);
begin
  NextModalDialog(TfrmCard.Create(Self));
end;

procedure TfrmMain.SpeedButton1Click(Sender: TObject);
begin
  NextModalDialog(TfrmAlarm.Create(Self));

  if FileExists(sAlarmFile) then
  begin
    if (sAlarmYn = '1') then
    begin
      mp1.FileName:= sAlarmFile;
      mp1.Open;
    end;
  end;
end;

procedure TfrmMain.btnNewSCClick(Sender: TObject);
begin
  if bMenuLock then
    ShowMessage('관리자 메뉴입니다. 먼저 잠금해제하세요!')
  else
  begin
    if nManagerAuthority <= 2 then
      NextModalDialog(TfrmNewSC.Create(Self))
    else
      ShowMessage('관리자 메뉴입니다. 관리자권한으로 잠금해제하세요!');
  end;
end;

procedure TfrmMain.btnVipClick(Sender: TObject);
begin
  NextModalDialog(TfrmAlarm_Vip.Create(Self));

  if FileExists(sAlarmFileVip) then
  begin
    mp2.FileName:= sAlarmFileVip;
    mp2.Open;
    tStartVip.Interval:= nAlarmTimeVip * 1000;
  end;

end;

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  // 파일삭제
  // DeleteFile(pChar('C:\88888.JPG'));        //test woo
  // 폴더삭제
  RemoveDirectory(PChar('C:\Apache24\htdocs\MSImage\2017\10'));
end;

procedure TfrmMain.c1Click(Sender: TObject);
begin

end;

// 웹 업체별 할인내역
procedure TfrmMain.d1Click(Sender: TObject);
begin
  NextModalDialog(TfrmWebDCList.Create(Self));
end;

procedure TfrmMain.d2Click(Sender: TObject);
begin
  NextModalDialog(TfrmWebDCReport.Create(Self));
end;

procedure TfrmMain.d3Click(Sender: TObject);
begin
   NextModalDialog(TfrmNewDcFix.Create(Self));
end;

procedure TfrmMain.d4Click(Sender: TObject);
begin
  NextModalDialog(TfrmIONNProc.Create(Self));
end;

procedure TfrmMain.d5Click(Sender: TObject);
begin
   NextModalDialog(TfrmIOAllData.Create(Self));
end;

procedure TfrmMain.a1Click(Sender: TObject);
begin
 // NextModalDialog(TfrmDailySales.Create(Self));
end;

procedure TfrmMain.a2Click(Sender: TObject);
begin
  NextModalDialog(TfrmMisuTKProc.Create(Self));
end;

procedure TfrmMain.btn1Click(Sender: TObject);
begin
  tAlarmVip.Enabled:= False;
  mp2.Stop;
  ExceptLogging('btn1Click : VIP 알람 소리 종료');
  mp2.Rewind;
  edtAlarmName.Text:= '';
  edtAlarmCarNo.Text:= '';
  edtAlarmCarType.Text:= '';
  pnAlarm.Visible:= False;
  ExceptLogging('btn1Click : VIP 알람 판넬 표시 종료');
end;

procedure TfrmMain.btnAddSCClick(Sender: TObject);
begin
  if bMenuLock then
    ShowMessage('관리자 메뉴입니다. 먼저 잠금해제하세요!')
  else
  begin
    if nManagerAuthority <= 2 then
      NextModalDialog(TfrmAddSC.Create(Self))
    else
      ShowMessage('관리자 메뉴입니다. 관리자권한으로 잠금해제하세요!');
  end;
end;

procedure TfrmMain.t1Click(Sender: TObject);
begin
  NextModalDialog(TfrmVanList.Create(Self))
end;

procedure TfrmMain.t2Click(Sender: TObject);
begin
  NextModalDialog(TfrmDCTimeList.Create(Self));
end;

procedure TfrmMain.tAlarmVipTimer(Sender: TObject);
begin
  tAlarmVip.Enabled:= False;
  pnAlarm.Visible:= False;
  ExceptLogging('tAlarmVipTimer : VIP 알람 판넬 표시 종료');
  mp2.Stop;
  ExceptLogging('tAlarmVipTimer : VIP 알람 소리 종료');
  mp2.Rewind;
  edtAlarmName.Text:= '';
  edtAlarmCarNo.Text:= '';
  edtAlarmCarType.Text:= '';
end;

procedure TfrmMain.tCountTimer(Sender: TObject);
var
  sTempTime: aString;
begin
  try
    with qryRecogChk do
//    begin
//      Close;
//      SQL.Clear;
//      SQL.Add('Select Count(*) nRecogCnt from IONData where ProcDate = :N1 and ');
//      SQL.Add('(InRecog1 > 1) and OutChk = :N2 and (Reserve1 IS NULL)');
//      Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', Now);
//      Parameters.ParamByName('N2').Value:= 0;
//      Open;
//
//      if FieldByName('nRecogCnt').AsInteger > 0 then
//      begin
//        if not tRecog.Enabled then
//          tRecog.Enabled:= True;
//      end
//      else
//      begin
//        sp1.Visible:= False;
//        tRecog.Enabled:= False;
//      end;
//      Close;
//    end;

    if nMichulKeep > 0 then
    begin
      sTempTime:= FormatDateTime('YYYY-MM-DD', Now);

      if sPrvMichulKeep < sTempTime then
      begin
        with qryMainTemp2 do
        begin
          DisableControls;
          try
            Close;
            SQL.Clear;
            SQL.Add('Update IONData Set OutChk = :N1, Reserve1 = :N2 where ProcDate < :N3 and OutChk = 0');
            Parameters.ParamByName('N1').Value:= 7;
            Parameters.ParamByName('N2').Value:= '자동미출차정리(' + sTempTime + ')';
            Parameters.ParamByName('N3').Value:= MG_AddDate(sTempTime, -nMichulKeep);
            ExecSQL;
          finally
            EnableControls;
          end;
        end;
        sPrvMichulKeep:= sTempTime;
      end;
    end;
  except
    on E: Exception do ExceptLogging('TfrmMain.tCountTimer: ' + aString(E.Message));
  end;
end;

procedure TfrmMain.Timer1Timer(Sender: TObject);
begin
  // 20초마다 타이머돌려서 장비에러 표출
  GridData;
end;

procedure TfrmMain.tRecogTimer(Sender: TObject);
begin
  //sp1.Visible:= True;

//  if tRecog.Tag = 0 then
//  begin
//    sp1.Brush.Color:= clBlue;
//    sp1.Pen.Color:= clRed;
//    tRecog.Tag:= 1;
//  end
//  else
//  begin
//    sp1.Brush.Color:= clRed;
//    sp1.Pen.Color:= clBlue;
//    tRecog.Tag:= 0;
//  end;
end;

procedure TfrmMain.tStartTimer(Sender: TObject);
begin
  if (sAlarmYn = '1') then
  begin
    tStart.Enabled:= False;
    mp1.Play;
    mp1.Notify := True;
  end;
end;

procedure TfrmMain.tStartVipTimer(Sender: TObject);
var
   AlarmTime : string;
   AlarmTime_Pause : Integer;
begin
  tStartVip.Enabled := False;
  if (sAlarmYnVip = '1') then
  begin
    pnAlarm.Visible := True;
    ExceptLogging('tStartVipTimer : VIP 알람 판넬 표시 시작');
    mp2.Play;
    ExceptLogging('tStartVipTimer : VIP 알람 소리 시작');
    mp2.Notify := True;
  end;
end;

procedure TfrmMain.GridData;
var
  sCarNo, sIOTime, sStatus, sTemp, sDate, sTime: String;
  i: Byte;
begin
  try
    // formShow 할때 DeviceStatus 테이블 조회
    with qryDeviceStatus do
    begin
      DisableControls;
      try
        Close;
        SQL.Clear;
        SQL.Add('Select * From DeviceStatus ');
        SQL.Add('where DeviceStatus = 0 order by DeviceStatusDate, DeviceStatusTime');
        Open;
      finally
         EnableControls;
      end;

      if (sAlarmYn = '1') then
      begin
        if RecordCount > 0 then
        begin
          // 데이터가 존재하면 타이머 true
          if FileExists(mp1.FileName) then
          begin
            tStart.Enabled:= True;
          end
          else
            StatusLogging('알람용 파일없음: ' + mp1.FileName);
        end
        else
        begin
          mp1.Notify := False;
          mp1.Stop;
          mp1.Rewind;
        end;
      end;
    end;
  except
    on E: Exception do StatusLogging('TfrmMain.GridData: ' + aString(E.Message));
  end;
end;
//홈넷 포인트 조회
procedure TfrmMain.homenet_pointClick(Sender: TObject);
begin
     NextModalDialog(TfrmHomenet_Point.Create(Self));
end;

end.
