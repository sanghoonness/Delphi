 unit MainNew;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvShapeButton, ExtCtrls, StdCtrls, datelbl, acPNG, jpeg,
  AdvGlowButton, AdvOfficeStatusBar, AdvEdit, Menus, ScktComp, IdComponent,
  IdRawBase, IdRawClient, IdIcmpClient, IdBaseComponent, IdAntiFreezeBase,
  IdAntiFreeze, OoMisc, AdPort, DB, ADODB, Grids, BaseGrid, AdvGrid, ComCtrls,
  Buttons, DBAdvGrid, sCustomComboEdit, sTooledit, Mask, sMaskEdit, sButton,
  sLabel, sPanel, IniFiles, advlued, AdvToolBtn, AdvSmoothButton, IdContext,
  IdServerIOHandler, IdServerIOHandlerSocket, IdServerIOHandlerStack, IdStack, IdException,
  IdCustomTCPServer, IdTCPServer, IdGlobal, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdTCPConnection, IdTCPClient, DateUtils, Winsock, AdvObj;

type
  R_SCWait = Record
    sSCFile1: AnsiString;
    sSCCarNo1: AnsiString;
    sSCFile2: AnsiString;
    sSCCarNo2: AnsiString;
    sSCIOTime: AnsiString;
    nSCLprNo: Byte;
    nSCInOut: Byte;
    nSCRecog1: Byte;
    nSCRecog2: Byte;
    sSCDspIP: AnsiString;
    csSCLPR: TClientSocket;
    bBarOpen: Boolean;
    nBujae: Byte;
  end;

  R_NCWait = Record
    sNCFile1: AnsiString;
    sNCCarNo1: AnsiString;
    sNCFile2: AnsiString;
    sNCCarNo2: AnsiString;
    sNCIOTime: AnsiString;
    nNCLprNo: Byte;
    nNCInOut: Byte;
    nNCRecog1: Byte;
    nNCRecog2: Byte;
    nNCCharo: Byte;
    sNCDspIP: AnsiString;
    csNCLPR: TClientSocket;
    bBarOpen: Boolean;
  end;

  TfrmMainNew = class(TForm)
    imgMain: TImage;
    btnClose: TAdvShapeButton;
    btnMinimize: TAdvShapeButton;
    btnSetup: TAdvShapeButton;
    Image1: TImage;
    DateLabel1: TDateLabel;
    DateLabel2: TDateLabel;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    btnCancel: TAdvShapeButton;
    btnReceipt: TAdvShapeButton;
    btnProc: TAdvShapeButton;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    btn1: TAdvShapeButton;
    edtMName: TAdvEdit;
    btn2: TAdvShapeButton;
    btn3: TAdvShapeButton;
    btn4: TAdvShapeButton;
    btn5: TAdvShapeButton;
    btn6: TAdvShapeButton;
    btn7: TAdvShapeButton;
    btn8: TAdvShapeButton;
    btn9: TAdvShapeButton;
    btn10: TAdvShapeButton;
    btn11: TAdvShapeButton;
    btn12: TAdvShapeButton;
    btn13: TAdvShapeButton;
    btn14: TAdvShapeButton;
    btn15: TAdvShapeButton;
    btn16: TAdvShapeButton;
    btnCarSearch: TAdvShapeButton;
    btnClosing: TAdvShapeButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lbInTime: TLabel;
    lbOutTime: TLabel;
    lbParkingTime: TLabel;
    lbCarNo: TLabel;
    imgOut: TImage;
    imgIn: TImage;
    lbOutCarNo: TLabel;
    lbInCarNo: TLabel;
    lbYogum1: TLabel;
    lbYogum2: TLabel;
    lbYogum3: TLabel;
    lbYogum4: TLabel;
    lbYogum5: TLabel;
    lbYogum6: TLabel;
    lbDCName: TLabel;
    pnSetup: TPopupMenu;
    mnuSetup: TMenuItem;
    mnuUnitInfo: TMenuItem;
    mnuInDsp: TMenuItem;
    mnuOutDsp: TMenuItem;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    qryMainTemp: TADOQuery;
    qry1: TADOQuery;
    ComPrn: TApdComPort;
    IdAntiFreeze1: TIdAntiFreeze;
    ICMP: TIdIcmpClient;
    csInLpr1: TClientSocket;
    csInLpr2: TClientSocket;
    csInLpr3: TClientSocket;
    csOutLpr1: TClientSocket;
    csOutLpr2: TClientSocket;
    csOutLpr3: TClientSocket;
    csInDsp1: TClientSocket;
    csInDsp2: TClientSocket;
    csInDsp3: TClientSocket;
    csOutDsp1: TClientSocket;
    csOutDsp2: TClientSocket;
    csOutDsp3: TClientSocket;
    tInDsp: TTimer;
    tOutDsp: TTimer;
    edtDCYogum: TAdvEdit;
    edtTotYogum: TAdvEdit;
    edtProcYogum: TAdvEdit;
    btnManualIn: TAdvShapeButton;
    btnManualOut: TAdvShapeButton;
    sgIn: TAdvStringGrid;
    sgOut: TAdvStringGrid;
    pnModify: TsPanel;
    sLabel28: TsLabel;
    Label4: TLabel;
    edtMCarNo: TEdit;
    btnMOK: TsButton;
    btnMCancel: TsButton;
    Panel2: TPanel;
    imgModify: TImage;
    pnManualOut: TsPanel;
    sLabel32: TsLabel;
    btnManualOutOk: TsButton;
    btnManualOutCancel: TsButton;
    edtOutTime: TsMaskEdit;
    edtOutDate: TsDateEdit;
    pnManual: TsPanel;
    sLabel31: TsLabel;
    Label6: TLabel;
    edtManualCarNo: TEdit;
    btnManualOK: TsButton;
    btnManualCancel: TsButton;
    pnlReceipt: TsPanel;
    sLabelReceipt: TsLabel;
    lbReceipt: TListBox;
    pnLost: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Label20: TLabel;
    Panel35: TPanel;
    Label42: TLabel;
    imgLost: TImage;
    dgLost: TDBAdvGrid;
    Panel1: TPanel;
    Label41: TLabel;
    btnLostProc: TBitBtn;
    edtLostCarNo: TEdit;
    btnSeek: TBitBtn;
    lbMCnt: TLabel;
    lbMTot: TLabel;
    PopupMenu1: TPopupMenu;
    mnuDetail: TMenuItem;
    mnuDC1: TMenuItem;
    mnuDC2: TMenuItem;
    mnuDC3: TMenuItem;
    mnuDC4: TMenuItem;
    mnuDC5: TMenuItem;
    mnuDC6: TMenuItem;
    mnuDC7: TMenuItem;
    mnuDC8: TMenuItem;
    mnuDC9: TMenuItem;
    mnuDC10: TMenuItem;
    mnuDC11: TMenuItem;
    mnuDC12: TMenuItem;
    mnuDC13: TMenuItem;
    mnuDC14: TMenuItem;
    mnuDC15: TMenuItem;
    mnuDC16: TMenuItem;
    mnuReceipt: TMenuItem;
    edtDC: TEdit;
    edtBarcode: TAdvEdit;
    btnLostCancel: TsButton;
    csInLpr4: TClientSocket;
    csInLpr5: TClientSocket;
    tAlive: TTimer;
    Button4: TButton;
    csInDsp4: TClientSocket;
    csInDsp5: TClientSocket;
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
    Panel13: TPanel;
    btnBar9: TAdvToolButton;
    btnBar10: TAdvToolButton;
    idTS: TIdTCPServer;
    IdStack1: TIdServerIOHandlerStack;
    idTC: TIdTCPClient;
    idStack2: TIdIOHandlerStack;
    qryCtrl: TADOQuery;
    imgLogo: TImage;
    tSCWait: TTimer;
    tNCInWait: TTimer;
    tNCOutWait: TTimer;
    lbMCreditCnt: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lbMCreditTot: TLabel;
    edtCharo: TEdit;
    btnBar: TAdvShapeButton;
    btnSCSearch: TAdvShapeButton;
    pnSCSearch: TPanel;
    DBAdvGrid1: TDBAdvGrid;
    btnSCOut: TsButton;
    btnSCCancel: TsButton;
    btnSC: TBitBtn;
    edtSCCarNo: TEdit;
    Label7: TLabel;
    mnuSCSearch: TMenuItem;
    mnuBarProc: TMenuItem;
    mnuClosing: TMenuItem;
    mnuCarSearch: TMenuItem;
    mnuManualIn: TMenuItem;
    mnuManualOut: TMenuItem;
    tInAlive1: TTimer;
    tInAlive2: TTimer;
    tInAlive3: TTimer;
    tInAlive4: TTimer;
    tInAlive5: TTimer;
    tOutAlive1: TTimer;
    tOutAlive2: TTimer;
    tOutAlive3: TTimer;
    lbOutCarType: TLabel;
    pnManualProc: TPanel;
    Panel4: TPanel;
    Panel3: TPanel;
    imgManual: TImage;
    pnNManualProc: TPanel;
    Label10: TLabel;
    edtManualProcCarNo: TEdit;
    Panel6: TPanel;
    Label11: TLabel;
    imgNManual: TImage;
    dgNManualProc: TDBAdvGrid;
    Label12: TLabel;
    edtManualProcDate: TDateTimePicker;
    pnSManualProc: TPanel;
    DBAdvGrid2: TDBAdvGrid;
    btnManualSeek: TBitBtn;
    btnManualProc: TBitBtn;
    btnManualSCOut: TBitBtn;
    edtManualOutTime: TsMaskEdit;
    btnManualOutProc: TBitBtn;
    btnManualProcCancel: TsButton;
    mnuSearch: TMenuItem;
    lblBujae: TLabel;
    btnop: TPanel;
    comScanner: TApdComPort;
    csAps: TClientSocket;
    qryBarcodeDC: TADOQuery;
    csAKPos: TClientSocket;
    lb1: TLabel;
    label5: TLabel;
    procedure btnCloseClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure mnuSetupClick(Sender: TObject);
    procedure mnuUnitInfoClick(Sender: TObject);
    procedure mnuInDspClick(Sender: TObject);
    procedure mnuOutDspClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tInDspTimer(Sender: TObject);
    procedure tOutDspTimer(Sender: TObject);
    procedure edtProcYogumChange(Sender: TObject);
    procedure csInLpr1Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure csInLpr2Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure csInLpr3Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure csOutLpr1Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure csOutLpr2Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure csOutLpr3Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure btnReceiptClick(Sender: TObject);
    procedure btnProcClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure btn8Click(Sender: TObject);
    procedure btn9Click(Sender: TObject);
    procedure btn10Click(Sender: TObject);
    procedure btn11Click(Sender: TObject);
    procedure btn12Click(Sender: TObject);
    procedure btn13Click(Sender: TObject);
    procedure btn14Click(Sender: TObject);
    procedure btn15Click(Sender: TObject);
    procedure btn16Click(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnManualInClick(Sender: TObject);
    procedure btnManualOutClick(Sender: TObject);
    procedure btnManualOutOkClick(Sender: TObject);
    procedure btnManualOutCancelClick(Sender: TObject);
    procedure btnCarSearchClick(Sender: TObject);
    procedure dgLostClick(Sender: TObject);
    procedure btnSeekClick(Sender: TObject);
    procedure btnLostProcClick(Sender: TObject);
    procedure btnClosingClick(Sender: TObject);
    procedure btnBarClick(Sender: TObject);
    procedure edtBarcodeKeyPress(Sender: TObject; var Key: Char);
    procedure btnLostCancelClick(Sender: TObject);
    procedure edtOutTimeKeyPress(Sender: TObject; var Key: Char);
    procedure csInLpr4Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure csInLpr5Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure Button4Click(Sender: TObject);
    procedure btnBarCloseClick(Sender: TObject);
    procedure btnMinimizeClick(Sender: TObject);
    procedure idTSExecute(AContext: TIdContext);
    procedure btnBar1Click(Sender: TObject);
    procedure sgInDblClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure btnMOKClick(Sender: TObject);
    procedure btnMCancelClick(Sender: TObject);
    procedure btnBar2Click(Sender: TObject);
    procedure btnBar3Click(Sender: TObject);
    procedure btnBar4Click(Sender: TObject);
    procedure btnBar5Click(Sender: TObject);
    procedure btnBar6Click(Sender: TObject);
    procedure btnBar7Click(Sender: TObject);
    procedure btnBar8Click(Sender: TObject);
    procedure btnBar9Click(Sender: TObject);
    procedure btnBar10Click(Sender: TObject);
    procedure mnuDetailClick(Sender: TObject);
    procedure lbReceiptDblClick(Sender: TObject);
    procedure btnManualOKClick(Sender: TObject);
    procedure btnManualCancelClick(Sender: TObject);
    procedure edtManualCarNoKeyPress(Sender: TObject; var Key: Char);
    procedure tSCWaitTimer(Sender: TObject);
    procedure tNCInWaitTimer(Sender: TObject);
    procedure tNCOutWaitTimer(Sender: TObject);
    procedure btnSCCancelClick(Sender: TObject);
    procedure btnSCClick(Sender: TObject);
    procedure btnSCOutClick(Sender: TObject);
    procedure DBAdvGrid1Click(Sender: TObject);
    procedure btnSCSearchClick(Sender: TObject);
    procedure mnuSCSearchClick(Sender: TObject);
    procedure mnuBarProcClick(Sender: TObject);
    procedure mnuClosingClick(Sender: TObject);
    procedure mnuCarSearchClick(Sender: TObject);
    procedure mnuManualInClick(Sender: TObject);
    procedure mnuManualOutClick(Sender: TObject);
    procedure edtLostCarNoKeyPress(Sender: TObject; var Key: Char);
    procedure tInAlive1Timer(Sender: TObject);
    procedure tInAlive2Timer(Sender: TObject);
    procedure tInAlive3Timer(Sender: TObject);
    procedure tInAlive4Timer(Sender: TObject);
    procedure tInAlive5Timer(Sender: TObject);
    procedure tOutAlive1Timer(Sender: TObject);
    procedure tOutAlive2Timer(Sender: TObject);
    procedure tOutAlive3Timer(Sender: TObject);
    procedure btnManualSeekClick(Sender: TObject);
    procedure dgNManualProcClick(Sender: TObject);
    procedure btnManualProcClick(Sender: TObject);
    procedure btnManualSCOutClick(Sender: TObject);
    procedure edtSCCarNoKeyPress(Sender: TObject; var Key: Char);
    procedure edtManualProcCarNoKeyPress(Sender: TObject; var Key: Char);
    procedure btnManualOutProcClick(Sender: TObject);
    procedure edtManualOutTimeKeyPress(Sender: TObject; var Key: Char);
    procedure DBAdvGrid2Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnManualProcCancelClick(Sender: TObject);
    procedure mnuSearchClick(Sender: TObject);
    procedure csInDsp1Error(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure csOutDsp1Error(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure csOutDsp2Error(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure csOutDsp3Error(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure csInDsp2Error(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure csInDsp3Error(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure csAKPosConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure csAKPosDisconnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure csAKPosError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure csAKPosRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure csApsConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure csApsDisconnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure csApsError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure csApsRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure comScannerTriggerAvail(CP: TObject; Count: Word);
    procedure btnopClick(Sender: TObject);
    procedure csInLpr1Error(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
  private
    { Private declarations }
    procedure ClearFormData;
    procedure T_ProcClear;
    procedure ClearGTime;
    procedure ClearDCProc;
    procedure InOpen(csLPR: TClientSocket);
    Procedure OutOpen(csLPR: TClientSocket);
    procedure FormAlign;
    procedure dcBtnClick(dcBtn: TAdvShapeButton; dcMnu: TMenuItem);
    procedure btnClick(btn: TAdvShapeButton; mnu: TMenuItem);
    function IntToBool(nNo: Integer): Boolean;
    procedure ICMPReply(ASender: TComponent; const ReplyStatus: TReplyStatus);
    function is_ping(IP: AnsiString): Boolean;
    procedure UnitCtrl(nCmd, nFCNo, nUnitNo, nMNo: Word; sData: AnsiString);
    function JulsaProc(nOrgAmt: Integer): Integer;
    procedure BarcodeProc(sSerial, sExpDate, sDCType, sDCAmt: AnsiString);
    procedure BarcodeProc1(sJumcode, sDeviceCode, sDCNo, sIssueDate,sSerialNumber, sBarcodeData: AnsiString);

    procedure MinwonProc(csLPR: TClientSocket);
    procedure FreeTimeProc(csLPR: TClientSocket);
  public
    { Public declarations }
    function RecvLprProc(sLprFile1, sLprCarNo1, sLprFile2, sLprCarNo2,
      sIOTime: AnsiString; nLprNo, nLprInOut, nLprRecog1, nLprRecog2: Byte;
      sDspIP: AnsiString; csLPR: TClientSocket; bOpen: Boolean): String;
    procedure MichulProc(sCarNo, sProcDate, sProcTime: AnsiString);
    procedure NormalOut(sLprFile1, sLprCarNo1, sLprFile2, sLprCarNo2,
      sIOTime: AnsiString; nLprNo, nLprInOut, nLprRecog1, nLprRecog2: Byte;
      sDspIP: AnsiString; csLPR: TClientSocket);
    procedure NormalProc(sLprFile1, sLprCarNo1, sLprFile2, sLprCarNo2,
      sIOTime: AnsiString; nLprNo, nLprInOut, nLprRecog1, nLprRecog2: Byte;
      sDspIP: AnsiString; csLPR: TClientSocket; bOpen: Boolean);
    function chkHoliday(sDate: AnsiString): Boolean;
    procedure DCEnable(bCheck: Boolean);
    procedure MoneyProc(csLPR: TClientSocket);
    // nIO: 1-입구, 2-출구    nType: 1-정기차량, 2-일반차량, 3-요금표시, 4-주차요금0원
    procedure DspProc(nIO, nType: Byte; sData, sDspIP: AnsiString);
    procedure ManualOut(sLprFile1, sLprCarNo1, sLprFile2, sLprCarNo2,
      sIOTime: AnsiString; nLprNo, nLprInOut, nLprRecog1, nLprRecog2: Byte);
    procedure GridClear;
    procedure GridData(sResult: String);
    procedure NGridData(sResult: String);
    procedure PartGridData(sResult: String);
    procedure CancelDataProc;
    procedure WaitClear;
    procedure InitProc;
    function GracetimeCheck(sInTime, sNow: AnsiString): Boolean;
    procedure AlarmProc(sSCName, sSCCompName, sSCCarNo, sSCCarType: AnsiString);
    function HuilCheck: Boolean;
    procedure SCNormalOut(sLprFile1, sLprCarNo1, sLprFile2, sLprCarNo2,
                          sIOTime: AnsiString; nLprNo, nLprInOut, nLprRecog1, nLprRecog2: Byte;
                          sDspIP: AnsiString; csLPR: TClientSocket;
                          sInDate, sInTime, sInFile: AnsiString; nInUnitNo: Byte);
    //2018.01.09 AK프라자 로직 추가 시작//
    procedure WebDCProc(sWebDC: String);
    procedure BarCodeDCProc(sCarNo: String);
    procedure BarCodeDCDetail(nCnt: Integer);
    procedure WebDCDetail(nCnt: Integer);
    procedure FcModeChange(nMode: Byte);
    procedure DCProcess(sNowTKno,CarNo: String);
//    procedure AlarmProc(sSCName, sSCCompName, sSCCarNo, sSCCarType: AnsiString);
    function RequestAkPlaza(_sJumCode, _sCarNo, _sBarcodePosNo, _sBarcodeSerialNo, _sBarcodeIssueDate : string): Integer;
    procedure VIPDCProc(sCarNo: String);
    procedure CulcureDCProc(sCarNo: String);
    function  FindNumber(Target : string): string;
    //2018.01.09 AK프라자 로직 추가 종료//

  end;

var
  frmMainNew: TfrmMainNew;
  bLostProc: Boolean = False;
  sChkDateTime, sNextDateTime, sInDate, sInTime, sOutDate, sOutTime, sChkDate,
    sChkTime, sNextTime: AnsiString;
  nYogum, nTotYogum, nItemMax, nTotMax, nDayCnt, nItemMax0, nTotMax0: Cardinal;
  nFeeNo: Word = 0;
  nDCList: Byte = 0;
  nowLpr, ManualLpr: TClientSocket;
  ping_success: Boolean = False;

  // 정기차량 처리대기용 변수들
  bSCProcWait: Boolean = False;
  nSCWaitFlag: Byte = 0; // 처리할 데이터 위치
  nSCWaitPoint: Byte = 0; // 대기 데이터 위치
  RSCWait: Array [1 .. 20] of R_SCWait;

  // 일반차량 처리대기용 변수들
  bNCInProcWait: Boolean = False;
  bNCOutProcWait: Boolean = False;
  nNCInWaitFlag: Byte = 0; // 처리할 데이터 위치
  nNCInWaitPoint: Byte = 0; // 대기 데이터 위치
  nNCOutWaitFlag: Byte = 0; // 처리할 데이터 위치
  nNCOutWaitPoint: Byte = 0; // 대기 데이터 위치
  RNCInWait: Array [1 .. 20] of R_NCWait;
  RNCOutWait: Array [1 .. 20] of R_NCWait;

  // 정기차량 수동출차 차량번호
  sManualSCCarNo: String;

  //2018.01.09 AK프라자 로직 추가 시작//
  iAKPos : Integer;
  nAKPosPORT :Integer;
  sAKPosIP  : AnsiString;
  //2018.01.09 AK프라자 로직 추가 종료//

function DBConnect(pDBIP: Pointer): Boolean; StdCall; external 'Tariff.dll';
function FeeCalc(nParkNo: Integer; nFeeNo: Integer; pInDateTime: Pointer;
  pOutDateTime: Pointer): Integer; StdCall; external 'Tariff.dll';
function ReturnFee(nParkNo: Integer; nFeeNo: Integer; pInDateTime: Pointer;
  pOutDateTime: Pointer): Integer; StdCall; external 'Tariff.dll';

function IcmpCreateFile : THandle; stdcall; external 'icmp.dll';
function IcmpCloseHandle (icmpHandle : THandle) : boolean; stdcall; external 'icmp.dll';
function IcmpSendEcho (IcmpHandle    : THandle;  DestinationAddress: LongInt;
                       RequestData   : Pointer;  RequestSize       : Smallint;
                       RequestOptions: pointer;  ReplyBuffer       : Pointer;
                       ReplySize     : DWORD;    Timeout           : DWORD): DWORD;
                       stdcall; external 'icmp.dll';

implementation

uses
  Global, Tables, Login, Setup, UnitInfo, Closing, InDspSet, DspSet, PaySelect;
{$R *.dfm}

procedure TfrmMainNew.AlarmProc(sSCName, sSCCompName, sSCCarNo, sSCCarType: AnsiString);
var
  sSend: aString;
begin
  try
    if is_ping(sHostIP) then
    begin
      try
        idTC.Disconnect;
        idTC.Host := sHostIP;
        idTC.Port := nHostPort;
        idTC.Connect;

        if idTC.Connected then
        begin
          sSend := STX + sSCName + '^' + sSCCompName + '^' + sSCCarNo + '^' + sSCCarType + ETX;
//          idTC.IOHandler.WriteLnRFC(sSend, IndyTextEncoding_OSDefault);
          idTC.IOHandler.WriteLnRFC(sSend, enUTF8);
          idTC.Disconnect;
          ExceptLogging('정기차량 알람정보 전송: ' + Copy(sSend, 2, Length(sSend)-2));
        end;
      except
        on E: Exception do
          ExceptLogging('TfrmMainNew.AlarmProc: ' + aString(E.Message));
      end;
    end
    else
      ExceptLogging('정기차량 알람정보 전송시 네트워크 오류!' + sHostIP );
    if sHostIP1 <> '' then begin

      if is_ping(sHostIP1) then
      begin
        try
          idTC.Disconnect;
          idTC.Host := sHostIP1;
          idTC.Port := nHostPort1;
          idTC.Connect;

          if idTC.Connected then
          begin
            sSend := STX + sSCName + '^' + sSCCompName + '^' + sSCCarNo + '^' + sSCCarType + ETX;
            idTC.IOHandler.WriteLnRFC(sSend, enUTF8);
            idTC.Disconnect;
            ExceptLogging('정기차량 알람정보 전송: ' + Copy(sSend, 2, Length(sSend)-2));
          end;
        except
          on E: Exception do
            ExceptLogging('TfrmMainNew.AlarmProc: ' + aString(E.Message));
        end;
      end
      else
        ExceptLogging('정기차량 알람정보 전송시 네트워크 오류!'+ sHostIP1 );
    end;
  except
    on E: EIdSocketError do
    begin
      if E.LastError <> 10054 then ExceptLogging('TfrmMainNew.AlarmProc: ' + E.Message);
      Exit;
    end;

    on E: EIdConnClosedGracefully do Exit;

    on E: Exception do ExceptLogging('TfrmMainNew.AlarmProc: ' + E.Message);
  end;
end;
//var
//  sSend: aString;
//begin
//  try
//    if is_ping(sHostIP) then
//    begin
//      try
//        idTC.Disconnect;
//        idTC.Host := sHostIP;
//        idTC.Port := nHostPort;
//        idTC.Connect;
//
//        if idTC.Connected then
//        begin
//          sSend := STX + sSCName + '^' + sSCCompName + '^' + sSCCarNo + '^' + sSCCarType + ETX;
//          idTC.IOHandler.WriteLnRFC(sSend, enUTF8);
//          idTC.Disconnect;
//          ExceptLogging('정기차량 알람정보 전송: ' + Copy(sSend, 2, Length(sSend)-2));
//        end;
//      except
//        on E: Exception do
//          ExceptLogging('TfrmMainNew.AlarmProc: ' + aString(E.Message));
//      end;
//    end
//    else
//      ExceptLogging('정기차량 알람정보 전송시 네트워크 오류!');
//  except
//    on E: EIdSocketError do
//    begin
//      if E.LastError <> 10054 then ExceptLogging('TfrmMainNew.AlarmProc: ' + E.Message);
//      Exit;
//    end;
//
//    on E: EIdConnClosedGracefully do Exit;
//
//    on E: Exception do ExceptLogging('TfrmMainNew.AlarmProc: ' + E.Message);
//  end;
//end;

function TfrmMainNew.GracetimeCheck(sInTime: AnsiString; sNow: AnsiString): Boolean;
begin
  try
    Result:= False;

    case DayOfWeek(Now) of
      1: begin
           if ((FormatDateTime('HH:NN', Now) >= GTime.GT6) and (FormatDateTime('HH:NN', Now) <= GTime.GT7)) then
           begin
             if (FormatDateTime('YYYY-MM-DD HH:NN', StrToDateTime(sInTime) + StrToTime(GTime.GT8)) >= Copy(sNow, 1, 16)) then
               Result:= True
             else
               Result:= False;
           end
           else
           begin
             if FormatDateTime('YYYY-MM-DD HH:NN', StrToDateTime(sInTime) + StrToTime(GTime.GT1)) >= Copy(sNow, 1, 16) then
               Result:= True
             else
               Result:= False;
           end;
      end;

      2..6: begin
              if FormatDateTime('YYYY-MM-DD HH:NN', StrToDateTime(sInTime) + StrToTime(GTime.GT1)) >= Copy(sNow, 1, 16) then
                Result:= True
              else
                Result:= False;
      end;

      7: begin
           if ((FormatDateTime('HH:NN', Now) >= GTime.GT3) and (FormatDateTime('HH:NN', Now) <= GTime.GT4)) then
           begin
             if (FormatDateTime('YYYY-MM-DD HH:NN', StrToDateTime(sInTime) + StrToTime(GTime.GT5)) >= Copy(sNow, 1, 16)) then
               Result:= True
             else
               Result:= False;
           end
           else
           begin
             if FormatDateTime('YYYY-MM-DD HH:NN', StrToDateTime(sInTime) + StrToTime(GTime.GT1)) >= Copy(sNow, 1, 16) then
               Result:= True
             else
               Result:= False;
           end;
      end;
    end;
  except
    on E: Exception do ExceptLogging('TfrmMainNew.GracetimeCheck: ' + E.Message);
  end;
end;

procedure TfrmMainNew.InitProc;
begin
  try
    //제어판의 시간형식 설정...
    SetLocaleInfo(LOCALE_SYSTEM_DEFAULT, LOCALE_STIMEFORMAT, 'HH:mm:ss');
//    DateSeparator  := '-';
//    TimeSeparator  := ':';
//    ShortDateFormat:= 'YYYY-MM-DD';
//    LongDateFormat := 'YYYY-MM-DD';
//    ShortTimeFormat:= 'HH:NN:SS';
//    LongTimeFormat := 'HH:NN:SS';
  except
    on E: Exception do ExceptLogging('TfrmMainNew.InitProc: ' + E.Message);
  end;
end;

procedure TfrmMainNew.FreeTimeProc(csLPR: TClientSocket);
var
  i, nOutCnt: Integer;
  sParkName, sParkAddr, sRegNo, sAdmin, sTelephone, sReceipt, sCarNo: String;
  sSend: String;
begin
  try
    nMCnt := nMCnt + 1;
    lbMCnt.Caption := FormatFloat('#,##0', nMCnt) + ' 건';
    // nMTot := nMTot + StrToInt(MG_StrTrim(edtProcYogum.Text, ','));
    // lbMTot.Caption := IntToStr(nMTot) + ' 원';
    nOutCnt := 0;

    // DB Write...
    with dmTables.qryMoneyProc do
    begin
//      Close;
//      SQL.Clear;
//      SQL.Add(
//        'Select * from IONCount Where ParkNo = :N1 and UnitNo = :N2 and ProcDate = :N3');
//      Parameters.ParamByName('N1').Value := nCurrParkNo;
//      Parameters.ParamByName('N2').Value := nNowLprNo;
//      Parameters.ParamByName('N3').Value := FormatDateTime('YYYY-MM-DD', Now);
//      Open;
//
//      if RecordCount > 0 then
//      begin
//        Case StrToInt(FormatDateTime('HH', Now)) of
//          0:
//            nOutCnt := FieldByName('Out00').AsInteger + 1;
//          1:
//            nOutCnt := FieldByName('Out01').AsInteger + 1;
//          2:
//            nOutCnt := FieldByName('Out02').AsInteger + 1;
//          3:
//            nOutCnt := FieldByName('Out03').AsInteger + 1;
//          4:
//            nOutCnt := FieldByName('Out04').AsInteger + 1;
//          5:
//            nOutCnt := FieldByName('Out05').AsInteger + 1;
//          6:
//            nOutCnt := FieldByName('Out06').AsInteger + 1;
//          7:
//            nOutCnt := FieldByName('Out07').AsInteger + 1;
//          8:
//            nOutCnt := FieldByName('Out08').AsInteger + 1;
//          9:
//            nOutCnt := FieldByName('Out09').AsInteger + 1;
//          10:
//            nOutCnt := FieldByName('Out10').AsInteger + 1;
//          11:
//            nOutCnt := FieldByName('Out11').AsInteger + 1;
//          12:
//            nOutCnt := FieldByName('Out12').AsInteger + 1;
//          13:
//            nOutCnt := FieldByName('Out13').AsInteger + 1;
//          14:
//            nOutCnt := FieldByName('Out14').AsInteger + 1;
//          15:
//            nOutCnt := FieldByName('Out15').AsInteger + 1;
//          16:
//            nOutCnt := FieldByName('Out16').AsInteger + 1;
//          17:
//            nOutCnt := FieldByName('Out17').AsInteger + 1;
//          18:
//            nOutCnt := FieldByName('Out18').AsInteger + 1;
//          19:
//            nOutCnt := FieldByName('Out19').AsInteger + 1;
//          20:
//            nOutCnt := FieldByName('Out20').AsInteger + 1;
//          21:
//            nOutCnt := FieldByName('Out21').AsInteger + 1;
//          22:
//            nOutCnt := FieldByName('Out22').AsInteger + 1;
//          23:
//            nOutCnt := FieldByName('Out23').AsInteger + 1;
//        end;
//        Close;
//        SQL.Clear;
//        SQL.Add('Update IONCount ');
//
//        Case StrToInt(FormatDateTime('HH', Now)) of
//          0:
//            SQL.Add('Set Out00 = :N1 ');
//          1:
//            SQL.Add('Set Out01 = :N1 ');
//          2:
//            SQL.Add('Set Out02 = :N1 ');
//          3:
//            SQL.Add('Set Out03 = :N1 ');
//          4:
//            SQL.Add('Set Out04 = :N1 ');
//          5:
//            SQL.Add('Set Out05 = :N1 ');
//          6:
//            SQL.Add('Set Out06 = :N1 ');
//          7:
//            SQL.Add('Set Out07 = :N1 ');
//          8:
//            SQL.Add('Set Out08 = :N1 ');
//          9:
//            SQL.Add('Set Out09 = :N1 ');
//          10:
//            SQL.Add('Set Out10 = :N1 ');
//          11:
//            SQL.Add('Set Out11 = :N1 ');
//          12:
//            SQL.Add('Set Out12 = :N1 ');
//          13:
//            SQL.Add('Set Out13 = :N1 ');
//          14:
//            SQL.Add('Set Out14 = :N1 ');
//          15:
//            SQL.Add('Set Out15 = :N1 ');
//          16:
//            SQL.Add('Set Out16 = :N1 ');
//          17:
//            SQL.Add('Set Out17 = :N1 ');
//          18:
//            SQL.Add('Set Out18 = :N1 ');
//          19:
//            SQL.Add('Set Out19 = :N1 ');
//          20:
//            SQL.Add('Set Out20 = :N1 ');
//          21:
//            SQL.Add('Set Out21 = :N1 ');
//          22:
//            SQL.Add('Set Out22 = :N1 ');
//          23:
//            SQL.Add('Set Out23 = :N1 ');
//        end;
//        SQL.Add('Where ParkNo = :N2 and UnitNo = :N3 and ProcDate = :N4');
//        Parameters.ParamByName('N1').Value := nOutCnt;
//        Parameters.ParamByName('N2').Value := nCurrParkNo;
//        Parameters.ParamByName('N3').Value := nNowLprNo;
//        Parameters.ParamByName('N4').Value := FormatDateTime('YYYY-MM-DD', Now);
//        ExecSQL;
//        Close;
//      end
//      else
//      begin
//        Close;
//        SQL.Clear;
//        SQL.Add('Insert Into IONCount ');
//        SQL.Add('(ParkNo, UnitNo, ProcDate, In00, In01, In02, In03, In04, ');
//        SQL.Add('In05, In06, In07, In08, In09, In10, In11, In12, In13, In14, ');
//        SQL.Add
//          ('In15, In16, In17, In18, In19, In20, In21, In22, In23, Out00, ');
//        SQL.Add(
//          'Out01, Out02, Out03, Out04, Out05, Out06, Out07, Out08, Out09, ');
//        SQL.Add(
//          'Out10, Out11, Out12, Out13, Out14, Out15, Out16, Out17, Out18, ');
//        SQL.Add('Out19, Out20, Out21, Out22, Out23) Values ');
//        SQL.Add('(:N1, :N2, :N3, 0, 0, 0, 0, 0, 0, 0, ');
//        SQL.Add(
//          '0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ');
//        SQL.Add('0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)');
//        Parameters.ParamByName('N1').Value := nCurrParkNo;
//        Parameters.ParamByName('N2').Value := nNowLprNo;
//        Parameters.ParamByName('N3').Value := FormatDateTime('YYYY-MM-DD', Now);
//        ExecSQL;
//
//        Close;
//        SQL.Clear;
//        SQL.Add('UpDate IONCount ');
//
//        Case StrToInt(FormatDateTime('HH', Now)) of
//          0:
//            SQL.Add('Set Out00 = :N1 ');
//          1:
//            SQL.Add('Set Out01 = :N1 ');
//          2:
//            SQL.Add('Set Out02 = :N1 ');
//          3:
//            SQL.Add('Set Out03 = :N1 ');
//          4:
//            SQL.Add('Set Out04 = :N1 ');
//          5:
//            SQL.Add('Set Out05 = :N1 ');
//          6:
//            SQL.Add('Set Out06 = :N1 ');
//          7:
//            SQL.Add('Set Out07 = :N1 ');
//          8:
//            SQL.Add('Set Out08 = :N1 ');
//          9:
//            SQL.Add('Set Out09 = :N1 ');
//          10:
//            SQL.Add('Set Out10 = :N1 ');
//          11:
//            SQL.Add('Set Out11 = :N1 ');
//          12:
//            SQL.Add('Set Out12 = :N1 ');
//          13:
//            SQL.Add('Set Out13 = :N1 ');
//          14:
//            SQL.Add('Set Out14 = :N1 ');
//          15:
//            SQL.Add('Set Out15 = :N1 ');
//          16:
//            SQL.Add('Set Out16 = :N1 ');
//          17:
//            SQL.Add('Set Out17 = :N1 ');
//          18:
//            SQL.Add('Set Out18 = :N1 ');
//          19:
//            SQL.Add('Set Out19 = :N1 ');
//          20:
//            SQL.Add('Set Out20 = :N1 ');
//          21:
//            SQL.Add('Set Out21 = :N1 ');
//          22:
//            SQL.Add('Set Out22 = :N1 ');
//          23:
//            SQL.Add('Set Out23 = :N1 ');
//        end;
//        SQL.Add('Where ParkNo = :N2 and UnitNo = :N3 and ProcDate = :N4');
//        Parameters.ParamByName('N1').Value := 1;
//        Parameters.ParamByName('N2').Value := nCurrParkNo;
//        Parameters.ParamByName('N3').Value := nNowLprNo;
//        Parameters.ParamByName('N4').Value := FormatDateTime('YYYY-MM-DD', Now);
//        ExecSQL;
//        Close;
//      end;

      Close;
      SQL.Clear;
      SQL.Add('Select * from TKProc where ParkNo = :N1 and UnitNo = :N2 and ');
      SQL.Add('ProcDate = :N3 and ProcTime = :N4 and TKNo = :N5');
      Parameters.ParamByName('N1').Value := nCurrParkNo;
      Parameters.ParamByName('N2').Value := nCurrUnitNo;
      Parameters.ParamByName('N3').Value := FormatDateTime('YYYY-MM-DD', Now);
      Parameters.ParamByName('N4').Value := FormatDateTime('HH:NN:SS', Now);
      Parameters.ParamByName('N5').Value := sNowInTKNo;
      Open;

      if RecordCount <= 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('Insert Into TKProc ');
        SQL.Add
          ('(ParkNo, UnitNo, ProcDate, ProcTime, TKType, CarType, FeeNo, ');
        SQL.Add
          ('TKNo, TKParkNo, TKUnitNo, CarNo, InDate, InTime, ParkingMin, ');
        SQL.Add
          ('TotFee, TotDC, RealFee, RecvAmt, Change, DCCnt, MNo, UnPaid, ');
        SQL.Add('ChkClosing, CommercialTariff, SpecialTariff, PayType, Reserve2) ');
        SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, ');
        SQL.Add(':N11, :N12, :N13, :N14, :N15, :N16, :N17, :N18, :N19, :N20, ');
        SQL.Add(':N21, :N22, :N23, :N24, :N25, :N26, :N27)');
        Parameters.ParamByName('N1').Value := nCurrParkNo;
        Parameters.ParamByName('N2').Value := nCurrUnitNo;
        Parameters.ParamByName('N3').Value := FormatDateTime('YYYY-MM-DD', Now);
        Parameters.ParamByName('N4').Value := FormatDateTime('HH:NN:SS', Now);
        Parameters.ParamByName('N5').Value := nTKType;
        Parameters.ParamByName('N6').Value := 1;
        Parameters.ParamByName('N7').Value := nFeeNo;
        Parameters.ParamByName('N8').Value := sNowInTKNo;
        Parameters.ParamByName('N9').Value := nCurrParkNo;
        Parameters.ParamByName('N10').Value := nNowInUnitNo;
        Parameters.ParamByName('N11').Value := sNowInCarNo;
        Parameters.ParamByName('N12').Value := sNowInDate;
        Parameters.ParamByName('N13').Value := sNowInTime;
        Parameters.ParamByName('N14').Value := nParkingMin;
        Parameters.ParamByName('N15').Value := StrToInt
          (MG_StrTrim(edtTotYogum.Text, ','));
        Parameters.ParamByName('N16').Value := StrToInt
          (MG_StrTrim(edtTotYogum.Text, ','));
        Parameters.ParamByName('N17').Value := 0;
        Parameters.ParamByName('N18').Value := 0;
        Parameters.ParamByName('N19').Value := 0;
        Parameters.ParamByName('N20').Value := 0;
        Parameters.ParamByName('N21').Value := nCurrMNo;
        Parameters.ParamByName('N22').Value := 0;
        Parameters.ParamByName('N23').Value := 0;
        Parameters.ParamByName('N24').Value := 0;
        Parameters.ParamByName('N25').Value := 0;
        Parameters.ParamByName('N26').Value := 1;
        Parameters.ParamByName('N27').Value := '무료시간출차';
        ExecSQL;
      end;

      Close;
      SQL.Clear;
      SQL.Add(
        'Select * from IONData Where ParkNo = :N1 and UnitNo = :N2 and ProcDate = :N3 and ');
      SQL.Add('ProcTime = :N4 and TKNo = :N5');
      Parameters.ParamByName('N1').Value := nCurrParkNo;
      Parameters.ParamByName('N2').Value := nNowInUnitNo;
      Parameters.ParamByName('N3').Value := sNowInDate;
      Parameters.ParamByName('N4').Value := sNowInTime;
      Parameters.ParamByName('N5').Value := sNowInTKNo;
      Open;

      if RecordCount > 0 then
      begin
        // InData에 입차자료가 있으면...
        Close;
        SQL.Clear;
        SQL.Add(
          'Update IONData Set OutUnitNo = :N1, OutDate = :N2, OutTime = :N3, OutChk = :N4, ');
        SQL.Add(
          'OutImage1 = :N5, OutCarNo1 = :N6, OutImage2 = :N7, OutCarNo2 = :N8, '
          );
        SQL.Add('OutRecog1 = :N9, OutRecog2 = :N10, Reserve1 = :N16 ');
        SQL.Add(
          'where ParkNo = :N11 and UnitNo = :N12 and ProcDate = :N13 and ProcTime = :N14 and TKNo = :N15');
        Parameters.ParamByName('N1').Value := nNowLprNo;
        Parameters.ParamByName('N2').Value := FormatDateTime('YYYY-MM-DD', Now);
        Parameters.ParamByName('N3').Value := FormatDateTime('HH:NN:SS', Now);

        // 무료시간출차...
        Parameters.ParamByName('N4').Value := 5;
        Parameters.ParamByName('N5').Value := sNowLprFile1;
        Parameters.ParamByName('N6').Value := sNowLprCarNo1;
        Parameters.ParamByName('N7').Value := sNowLprFile2;
        Parameters.ParamByName('N8').Value := sNowLprCarNo2;
        Parameters.ParamByName('N9').Value := nNowLprRecog1;
        Parameters.ParamByName('N10').Value := nNowLprRecog2;
        Parameters.ParamByName('N11').Value := nCurrParkNo;
        Parameters.ParamByName('N12').Value := nNowInUnitNo;
        Parameters.ParamByName('N13').Value := sNowInDate;
        Parameters.ParamByName('N14').Value := sNowInTime;
        Parameters.ParamByName('N15').Value := sNowInTKNo;

        if bMiProc then
          Parameters.ParamByName('N16').Value := '미인식처리'
        else if bManualOut then
          Parameters.ParamByName('N16').Value := '수동출차'
        else
          Parameters.ParamByName('N16').Value := '';
        ExecSQL;
      end
      else
      begin
        // InData에 발권자료가 없으면...
        Close;
        SQL.Clear;
        SQL.Add('Insert Into IONData ');
        SQL.Add('(ParkNo, UnitNo, ProcDate, ProcTime, TKNo, TKType, CarType, ');
        SQL.Add('InImage1, InCarNo1, InImage2, InCarNo2, Status, OutUnitNo, ');
        SQL.Add(
          'OutDate, OutTime, OutChk, OutImage1, OutCarNo1, OutImage2, OutCarNo2, ');
        SQL.Add('InRecog1, OutRecog1, InRecog2, OutRecog2, Reserve1) ');
        SQL.Add(
          'Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, ');
        SQL.Add(':N12, :N13, :N14, :N15, :N16, :N17, :N18, :N19, :N20, ');
        SQL.Add(':N21, :N22, :N23, :N24, :N25)');
        Parameters.ParamByName('N1').Value := nCurrParkNo;
        Parameters.ParamByName('N2').Value := nNowInUnitNo;
        Parameters.ParamByName('N3').Value := sNowInDate;
        Parameters.ParamByName('N4').Value := sNowInTime;
        Parameters.ParamByName('N5').Value := sNowInTKNo;
        Parameters.ParamByName('N6').Value := nTKType;
        Parameters.ParamByName('N7').Value := 1;
        Parameters.ParamByName('N8').Value := '';
        Parameters.ParamByName('N9').Value := '';
        Parameters.ParamByName('N10').Value := '';
        Parameters.ParamByName('N11').Value := '';
        Parameters.ParamByName('N12').Value := 1;
        Parameters.ParamByName('N13').Value := nNowLprNo;
        Parameters.ParamByName('N14').Value := FormatDateTime
          ('YYYY-MM-DD', Now);
        Parameters.ParamByName('N15').Value := FormatDateTime('HH:NN:SS', Now);

        // 무료시간출차...
        Parameters.ParamByName('N16').Value := 5;
        Parameters.ParamByName('N17').Value := sNowLprFile1;
        Parameters.ParamByName('N18').Value := sNowLprCarNo1;
        Parameters.ParamByName('N19').Value := sNowLprFile2;
        Parameters.ParamByName('N20').Value := sNowLprCarNo2;
        Parameters.ParamByName('N21').Value := 3;
        Parameters.ParamByName('N22').Value := 3;
        Parameters.ParamByName('N23').Value := nNowLprRecog1;
        Parameters.ParamByName('N24').Value := nNowLprRecog2;

        if bMiProc then
          Parameters.ParamByName('N25').Value := '미인식처리'
        else if bManualOut then
          Parameters.ParamByName('N25').Value := '수동출차'
        else
          Parameters.ParamByName('N25').Value := '';
        ExecSQL;
      end;
//      Close;
//      SQL.Clear;
//      SQL.Add('Select * from IONCount where ProcDate = :N1 and UnitNo = :N2');
//      Parameters.ParamByName('N1').Value := FormatDateTime('YYYY-MM-DD', Now);
//      Parameters.ParamByName('N2').Value := nNowLprNo;
//      Open;
//      nNOutCnt := 0;
//
//      for i := 0 to 23 do
//        nNOutCnt := nNOutCnt + FieldByName('Out' + MG_InsZero(IntToStr(i), 2))
//          .AsInteger;
    end;
    NGridData('2' + sNowInCarNo + '^' + FormatDateTime('YYYY-MM-DD', Now)
        + ' ' + FormatDateTime('HH:NN:SS', Now) + '^0원');

    // 차단기 열림.
    OutOpen(csLPR);

    if bAutoReceipt and (sPrtData <> '') then
    begin
      btnReceiptClick(Self);
    end;
    InspectionLog('무료시간출차_정산요금: 0');
    ClearFormData;
  except
    on E: Exception do
      ExceptLogging('FreeTimeProc: ' + aString(E.Message));
  end;
end;

procedure TfrmMainNew.MinwonProc(csLPR: TClientSocket);
var
  i, nOutCnt: Integer;
  sParkName, sParkAddr, sRegNo, sAdmin, sTelephone, sReceipt, sCarNo: String;
  sSend: String;
begin
  try
    nMCnt := nMCnt + 1;
    lbMCnt.Caption := FormatFloat('#,##0', nMCnt) + ' 건';
    // nMTot := nMTot + StrToInt(MG_StrTrim(edtProcYogum.Text, ','));
    // lbMTot.Caption := IntToStr(nMTot) + ' 원';
    nOutCnt := 0;
    ClearDCProc;

    // DB Write...
    with dmTables.qryMoneyProc do
    begin
//      Close;
//      SQL.Clear;
//      SQL.Add(
//        'Select * from IONCount Where ParkNo = :N1 and UnitNo = :N2 and ProcDate = :N3');
//      Parameters.ParamByName('N1').Value := nCurrParkNo;
//      Parameters.ParamByName('N2').Value := nNowLprNo;
//      Parameters.ParamByName('N3').Value := sNowOutDate;
//      Open;
//
//      if RecordCount > 0 then
//      begin
//        Case StrToInt(FormatDateTime('HH', Now)) of
//          0:
//            nOutCnt := FieldByName('Out00').AsInteger + 1;
//          1:
//            nOutCnt := FieldByName('Out01').AsInteger + 1;
//          2:
//            nOutCnt := FieldByName('Out02').AsInteger + 1;
//          3:
//            nOutCnt := FieldByName('Out03').AsInteger + 1;
//          4:
//            nOutCnt := FieldByName('Out04').AsInteger + 1;
//          5:
//            nOutCnt := FieldByName('Out05').AsInteger + 1;
//          6:
//            nOutCnt := FieldByName('Out06').AsInteger + 1;
//          7:
//            nOutCnt := FieldByName('Out07').AsInteger + 1;
//          8:
//            nOutCnt := FieldByName('Out08').AsInteger + 1;
//          9:
//            nOutCnt := FieldByName('Out09').AsInteger + 1;
//          10:
//            nOutCnt := FieldByName('Out10').AsInteger + 1;
//          11:
//            nOutCnt := FieldByName('Out11').AsInteger + 1;
//          12:
//            nOutCnt := FieldByName('Out12').AsInteger + 1;
//          13:
//            nOutCnt := FieldByName('Out13').AsInteger + 1;
//          14:
//            nOutCnt := FieldByName('Out14').AsInteger + 1;
//          15:
//            nOutCnt := FieldByName('Out15').AsInteger + 1;
//          16:
//            nOutCnt := FieldByName('Out16').AsInteger + 1;
//          17:
//            nOutCnt := FieldByName('Out17').AsInteger + 1;
//          18:
//            nOutCnt := FieldByName('Out18').AsInteger + 1;
//          19:
//            nOutCnt := FieldByName('Out19').AsInteger + 1;
//          20:
//            nOutCnt := FieldByName('Out20').AsInteger + 1;
//          21:
//            nOutCnt := FieldByName('Out21').AsInteger + 1;
//          22:
//            nOutCnt := FieldByName('Out22').AsInteger + 1;
//          23:
//            nOutCnt := FieldByName('Out23').AsInteger + 1;
//        end;
//        Close;
//        SQL.Clear;
//        SQL.Add('Update IONCount ');
//
//        Case StrToInt(FormatDateTime('HH', Now)) of
//          0:
//            SQL.Add('Set Out00 = :N1 ');
//          1:
//            SQL.Add('Set Out01 = :N1 ');
//          2:
//            SQL.Add('Set Out02 = :N1 ');
//          3:
//            SQL.Add('Set Out03 = :N1 ');
//          4:
//            SQL.Add('Set Out04 = :N1 ');
//          5:
//            SQL.Add('Set Out05 = :N1 ');
//          6:
//            SQL.Add('Set Out06 = :N1 ');
//          7:
//            SQL.Add('Set Out07 = :N1 ');
//          8:
//            SQL.Add('Set Out08 = :N1 ');
//          9:
//            SQL.Add('Set Out09 = :N1 ');
//          10:
//            SQL.Add('Set Out10 = :N1 ');
//          11:
//            SQL.Add('Set Out11 = :N1 ');
//          12:
//            SQL.Add('Set Out12 = :N1 ');
//          13:
//            SQL.Add('Set Out13 = :N1 ');
//          14:
//            SQL.Add('Set Out14 = :N1 ');
//          15:
//            SQL.Add('Set Out15 = :N1 ');
//          16:
//            SQL.Add('Set Out16 = :N1 ');
//          17:
//            SQL.Add('Set Out17 = :N1 ');
//          18:
//            SQL.Add('Set Out18 = :N1 ');
//          19:
//            SQL.Add('Set Out19 = :N1 ');
//          20:
//            SQL.Add('Set Out20 = :N1 ');
//          21:
//            SQL.Add('Set Out21 = :N1 ');
//          22:
//            SQL.Add('Set Out22 = :N1 ');
//          23:
//            SQL.Add('Set Out23 = :N1 ');
//        end;
//        SQL.Add('Where ParkNo = :N2 and UnitNo = :N3 and ProcDate = :N4');
//        Parameters.ParamByName('N1').Value := nOutCnt;
//        Parameters.ParamByName('N2').Value := nCurrParkNo;
//        Parameters.ParamByName('N3').Value := nNowLprNo;
//        Parameters.ParamByName('N4').Value := sNowOutDate;
//        ExecSQL;
//        Close;
//      end
//      else
//      begin
//        Close;
//        SQL.Clear;
//        SQL.Add('Insert Into IONCount ');
//        SQL.Add('(ParkNo, UnitNo, ProcDate, In00, In01, In02, In03, In04, ');
//        SQL.Add('In05, In06, In07, In08, In09, In10, In11, In12, In13, In14, ');
//        SQL.Add
//          ('In15, In16, In17, In18, In19, In20, In21, In22, In23, Out00, ');
//        SQL.Add(
//          'Out01, Out02, Out03, Out04, Out05, Out06, Out07, Out08, Out09, ');
//        SQL.Add(
//          'Out10, Out11, Out12, Out13, Out14, Out15, Out16, Out17, Out18, ');
//        SQL.Add('Out19, Out20, Out21, Out22, Out23) Values ');
//        SQL.Add('(:N1, :N2, :N3, 0, 0, 0, 0, 0, 0, 0, ');
//        SQL.Add(
//          '0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ');
//        SQL.Add('0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)');
//        Parameters.ParamByName('N1').Value := nCurrParkNo;
//        Parameters.ParamByName('N2').Value := nNowLprNo;
//        Parameters.ParamByName('N3').Value := sNowOutDate;
//        ExecSQL;
//
//        Close;
//        SQL.Clear;
//        SQL.Add('UpDate IONCount ');
//
//        Case StrToInt(FormatDateTime('HH', Now)) of
//          0:
//            SQL.Add('Set Out00 = :N1 ');
//          1:
//            SQL.Add('Set Out01 = :N1 ');
//          2:
//            SQL.Add('Set Out02 = :N1 ');
//          3:
//            SQL.Add('Set Out03 = :N1 ');
//          4:
//            SQL.Add('Set Out04 = :N1 ');
//          5:
//            SQL.Add('Set Out05 = :N1 ');
//          6:
//            SQL.Add('Set Out06 = :N1 ');
//          7:
//            SQL.Add('Set Out07 = :N1 ');
//          8:
//            SQL.Add('Set Out08 = :N1 ');
//          9:
//            SQL.Add('Set Out09 = :N1 ');
//          10:
//            SQL.Add('Set Out10 = :N1 ');
//          11:
//            SQL.Add('Set Out11 = :N1 ');
//          12:
//            SQL.Add('Set Out12 = :N1 ');
//          13:
//            SQL.Add('Set Out13 = :N1 ');
//          14:
//            SQL.Add('Set Out14 = :N1 ');
//          15:
//            SQL.Add('Set Out15 = :N1 ');
//          16:
//            SQL.Add('Set Out16 = :N1 ');
//          17:
//            SQL.Add('Set Out17 = :N1 ');
//          18:
//            SQL.Add('Set Out18 = :N1 ');
//          19:
//            SQL.Add('Set Out19 = :N1 ');
//          20:
//            SQL.Add('Set Out20 = :N1 ');
//          21:
//            SQL.Add('Set Out21 = :N1 ');
//          22:
//            SQL.Add('Set Out22 = :N1 ');
//          23:
//            SQL.Add('Set Out23 = :N1 ');
//        end;
//        SQL.Add('Where ParkNo = :N2 and UnitNo = :N3 and ProcDate = :N4');
//        Parameters.ParamByName('N1').Value := 1;
//        Parameters.ParamByName('N2').Value := nCurrParkNo;
//        Parameters.ParamByName('N3').Value := nNowLprNo;
//        Parameters.ParamByName('N4').Value := sNowOutDate;
//        ExecSQL;
//        Close;
//      end;

      Close;
      SQL.Clear;
      SQL.Add('Select * from TKProc where ParkNo = :N1 and UnitNo = :N2 and ');
      SQL.Add('ProcDate = :N3 and ProcTime = :N4 and TKNo = :N5');
      Parameters.ParamByName('N1').Value := nCurrParkNo;
      Parameters.ParamByName('N2').Value := nCurrUnitNo;
      Parameters.ParamByName('N3').Value := sNowOutDate;
      Parameters.ParamByName('N4').Value := sNowOutTime;
      Parameters.ParamByName('N5').Value := sNowInTKNo;
      Open;

      if RecordCount <= 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('Insert Into TKProc ');
        SQL.Add
          ('(ParkNo, UnitNo, ProcDate, ProcTime, TKType, CarType, FeeNo, ');
        SQL.Add
          ('TKNo, TKParkNo, TKUnitNo, CarNo, InDate, InTime, ParkingMin, ');
        SQL.Add
          ('TotFee, TotDC, RealFee, RecvAmt, Change, DCCnt, MNo, UnPaid, ');
        SQL.Add(
          'ChkClosing, CommercialTariff, SpecialTariff, PayType, Reserve1) ');
        SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, ');
        SQL.Add(':N11, :N12, :N13, :N14, :N15, :N16, :N17, :N18, :N19, :N20, ');
        SQL.Add(':N21, :N22, :N23, :N24, :N25, :N26, :N27)');
        Parameters.ParamByName('N1').Value := nCurrParkNo;
        Parameters.ParamByName('N2').Value := nCurrUnitNo;
        Parameters.ParamByName('N3').Value := sNowOutDate;
        Parameters.ParamByName('N4').Value := sNowOutTime;
        Parameters.ParamByName('N5').Value := nTKType;
        Parameters.ParamByName('N6').Value := 1;
        Parameters.ParamByName('N7').Value := nFeeNo;
        Parameters.ParamByName('N8').Value := sNowInTKNo;
        Parameters.ParamByName('N9').Value := nCurrParkNo;
        Parameters.ParamByName('N10').Value := nNowInUnitNo;
        Parameters.ParamByName('N11').Value := sNowInCarNo;
        Parameters.ParamByName('N12').Value := sNowInDate;
        Parameters.ParamByName('N13').Value := sNowInTime;
        Parameters.ParamByName('N14').Value := nParkingMin;
        Parameters.ParamByName('N15').Value := StrToInt
          (MG_StrTrim(edtTotYogum.Text, ','));
        Parameters.ParamByName('N16').Value := StrToInt
          (MG_StrTrim(edtTotYogum.Text, ','));
        Parameters.ParamByName('N17').Value := 0;
        Parameters.ParamByName('N18').Value := 0;
        Parameters.ParamByName('N19').Value := 0;
        Parameters.ParamByName('N20').Value := 1;
        Parameters.ParamByName('N21').Value := nCurrMNo;
        Parameters.ParamByName('N22').Value := 0;
        Parameters.ParamByName('N23').Value := 0;
        Parameters.ParamByName('N24').Value := 0;
        Parameters.ParamByName('N25').Value := 0;
        Parameters.ParamByName('N26').Value := 1;
        Parameters.ParamByName('N27').Value := '민원처리';
        ExecSQL;
      end;

      Close;
      SQL.Clear;
      SQL.Add(
        'Select * from IONData Where ParkNo = :N1 and UnitNo = :N2 and ProcDate = :N3 and ');
      SQL.Add('ProcTime = :N4 and TKNo = :N5');
      Parameters.ParamByName('N1').Value := nCurrParkNo;
      Parameters.ParamByName('N2').Value := nNowInUnitNo;
      Parameters.ParamByName('N3').Value := sNowInDate;
      Parameters.ParamByName('N4').Value := sNowInTime;
      Parameters.ParamByName('N5').Value := sNowInTKNo;
      Open;

      if RecordCount > 0 then
      begin
        // InData에 입차자료가 있으면...
        Close;
        SQL.Clear;
        SQL.Add(
          'Update IONData Set OutUnitNo = :N1, OutDate = :N2, OutTime = :N3, OutChk = :N4, ');
        SQL.Add(
          'OutImage1 = :N5, OutCarNo1 = :N6, OutImage2 = :N7, OutCarNo2 = :N8, '
          );
        SQL.Add('OutRecog1 = :N9, OutRecog2 = :N10, Reserve1 = :N16 ');
        SQL.Add(
          'where ParkNo = :N11 and UnitNo = :N12 and ProcDate = :N13 and ProcTime = :N14 and TKNo = :N15');
        Parameters.ParamByName('N1').Value := nNowLprNo;
        Parameters.ParamByName('N2').Value := sNowOutDate;
        Parameters.ParamByName('N3').Value := sNowOutTime;

        // 민원출차...
        Parameters.ParamByName('N4').Value := 6;
        Parameters.ParamByName('N5').Value := sNowLprFile1;
        Parameters.ParamByName('N6').Value := sNowLprCarNo1;
        Parameters.ParamByName('N7').Value := sNowLprFile2;
        Parameters.ParamByName('N8').Value := sNowLprCarNo2;
        Parameters.ParamByName('N9').Value := nNowLprRecog1;
        Parameters.ParamByName('N10').Value := nNowLprRecog2;
        Parameters.ParamByName('N11').Value := nCurrParkNo;
        Parameters.ParamByName('N12').Value := nNowInUnitNo;
        Parameters.ParamByName('N13').Value := sNowInDate;
        Parameters.ParamByName('N14').Value := sNowInTime;
        Parameters.ParamByName('N15').Value := sNowInTKNo;

        if bMiProc then
          Parameters.ParamByName('N16').Value := '미인식처리'
        else if bManualOut then
          Parameters.ParamByName('N16').Value := '수동출차'
        else
          Parameters.ParamByName('N16').Value := '';
        ExecSQL;
      end
      else
      begin
        // InData에 발권자료가 없으면...
        Close;
        SQL.Clear;
        SQL.Add('Insert Into IONData ');
        SQL.Add('(ParkNo, UnitNo, ProcDate, ProcTime, TKNo, TKType, CarType, ');
        SQL.Add('InImage1, InCarNo1, InImage2, InCarNo2, Status, OutUnitNo, ');
        SQL.Add(
          'OutDate, OutTime, OutChk, OutImage1, OutCarNo1, OutImage2, OutCarNo2, ');
        SQL.Add('InRecog1, OutRecog1, InRecog2, OutRecog2, Reserve1) ');
        SQL.Add(
          'Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, ');
        SQL.Add(':N12, :N13, :N14, :N15, :N16, :N17, :N18, :N19, :N20, ');
        SQL.Add(':N21, :N22, :N23, :N24, :N25)');
        Parameters.ParamByName('N1').Value := nCurrParkNo;
        Parameters.ParamByName('N2').Value := nNowInUnitNo;
        Parameters.ParamByName('N3').Value := sNowInDate;
        Parameters.ParamByName('N4').Value := sNowInTime;
        Parameters.ParamByName('N5').Value := sNowInTKNo;
        Parameters.ParamByName('N6').Value := nTKType;
        Parameters.ParamByName('N7').Value := 1;
        Parameters.ParamByName('N8').Value := '';
        Parameters.ParamByName('N9').Value := '';
        Parameters.ParamByName('N10').Value := '';
        Parameters.ParamByName('N11').Value := '';
        Parameters.ParamByName('N12').Value := 1;
        Parameters.ParamByName('N13').Value := nNowLprNo;
        Parameters.ParamByName('N14').Value := sNowOutDate;
        Parameters.ParamByName('N15').Value := sNowOutTime;

        // 민원출차...
        Parameters.ParamByName('N16').Value := 6;
        Parameters.ParamByName('N17').Value := sNowLprFile1;
        Parameters.ParamByName('N18').Value := sNowLprCarNo1;
        Parameters.ParamByName('N19').Value := sNowLprFile2;
        Parameters.ParamByName('N20').Value := sNowLprCarNo2;
        Parameters.ParamByName('N21').Value := 3;
        Parameters.ParamByName('N22').Value := 3;
        Parameters.ParamByName('N23').Value := nNowLprRecog1;
        Parameters.ParamByName('N24').Value := nNowLprRecog2;

        if bMiProc then
          Parameters.ParamByName('N25').Value := '미인식처리'
        else if bManualOut then
          Parameters.ParamByName('N25').Value := '수동출차'
        else
          Parameters.ParamByName('N25').Value := '';
        ExecSQL;
      end;
//      Close;
//      SQL.Clear;
//      SQL.Add('Select * from IONCount where ProcDate = :N1 and UnitNo = :N2');
//      Parameters.ParamByName('N1').Value := sNowOutDate;
//      Parameters.ParamByName('N2').Value := nNowLprNo;
//      Open;
//      nNOutCnt := 0;
//
//      for i := 0 to 23 do
//        nNOutCnt := nNOutCnt + FieldByName('Out' + MG_InsZero(IntToStr(i), 2))
//          .AsInteger;
    end;
    NGridData('2' + sNowInCarNo + '^' + sNowOutDate + ' ' + sNowOutTime +
        '^0원');

    // 차단기 열림.
    OutOpen(csLPR);

    if bAutoReceipt and (sPrtData <> '') then
    begin
      btnReceiptClick(Self);
    end;
    InspectionLog('민원출차_정산요금: 0');
    ClearFormData;
  except
    on E: Exception do
      ExceptLogging('MinwonProc: ' + aString(E.Message));
  end;
end;

// nCmd: 1-BarOpen
procedure TfrmMainNew.UnitCtrl(nCmd, nFCNo, nUnitNo, nMNo: Word;
  sData: AnsiString);
var
  sFCIp, sSend: aString;
  nFCPort: Word;
  nResponse: Smallint;
  i: Byte;
  bSend: Boolean;
begin
  try
    if nFCNo = nCurrUnitNo then
    begin
      // 현재 요금계산기에 연결된 LPR이면 LPR을 찾아서 명령 전송...
      bSend := False;

      case nCmd of
        1:
          begin
            for i := 1 to 5 do
            begin
              with frmMainNew do
              begin
                if TClientSocket(FindComponent('csInLpr' + IntToStr(i))).Tag = nUnitNo then
                begin
                  if is_ping(TClientSocket(FindComponent('csInLpr' + IntToStr(i))).Host) and
                     TClientSocket(FindComponent('csInLpr' + IntToStr(i))).Active then
                  begin
                    sSend := 'BAR_OPEN-1';
                    TClientSocket(FindComponent('csInLpr' + IntToStr(i))).Socket.SendText(sSend);
                    bSend := True;
                    Break;
                  end
                  else
                    ExceptLogging(TClientSocket(FindComponent('csInLpr' + IntToStr(i))).Host + ': 차단기 원격제어시 네트워크 오류!');
                end;
              end;
            end;

            if not bSend then
              for i := 1 to 3 do
              begin
                with frmMainNew do
                begin
                  if TClientSocket(FindComponent('csOutLpr' + IntToStr(i))).Tag = nUnitNo then
                  begin
                    if is_ping(TClientSocket(FindComponent('csOutLpr' + IntToStr(i))).Host) and
                       TClientSocket(FindComponent('csOutLpr' + IntToStr(i))).Active then
                    begin
                      sSend := 'BAR_OPEN-1';
                      TClientSocket(FindComponent('csOutLpr' + IntToStr(i))).Socket.SendText(sSend);
                      bSend := True;
                      Break;
                    end
                    else
                      ExceptLogging(TClientSocket(FindComponent('csOutLpr' + IntToStr(i))).Host + ': 차단기 원격제어시 네트워크 오류!');
                  end;
                end;
              end;

            if bSend then
            begin
              with dmTables.qryBarProc do
              begin
                Close;
                SQL.Clear;
                SQL.Add('Insert BarProc ');
                SQL.Add(
                  '(ParkNo, UnitNo, ProcDate, ProcTime, Up, MNo, ChkClosing, ProcReason) ');
                SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8)');
                Parameters.ParamByName('N1').Value := nCurrParkNo;
                Parameters.ParamByName('N2').Value := nUnitNo;
                Parameters.ParamByName('N3').Value := FormatDateTime
                  ('YYYY-MM-DD', Now);
                Parameters.ParamByName('N4').Value := FormatDateTime
                  ('HH:NN:SS', Now);
                Parameters.ParamByName('N5').Value := 1;
                Parameters.ParamByName('N6').Value := nMNo;
                Parameters.ParamByName('N7').Value := 0;

                if sData <> '' then
                  Parameters.ParamByName('N8').Value := sData
                else
                  Parameters.ParamByName('N8').Value := '수동오픈';
                ExecSQL;
              end;
            end;
          end;
      end;
    end
    else
    begin
      // 다른 요금계산기에 연결된 LPR이면 해당 요금계산기로 명령 전송...
      with qryCtrl do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select * from UnitInfo where UnitNo = :N1');
        Parameters.ParamByName('N1').Value := nFCNo;
        Open;

        if RecordCount > 0 then
        begin
          sFCIp := MG_StrTrim(FieldByName('IPNo').AsString, ' ');
          nFCPort := FieldByName('PortNo').AsInteger;

          if is_ping(sFCIp) then
          begin
            try
              idTC.Disconnect;
              idTC.Host := sFCIp;
              idTC.Port := nFCPort;
              idTC.Connect;

              if idTC.Connected then
              begin
                sSend := STX + MG_InsZero(IntToStr(nCmd), 2) + MG_InsZero
                  (IntToStr(nUnitNo), 5) + MG_InsZero(IntToStr(nMNo), 3)
                  + sData + ETX;
                idTC.IOHandler.WriteLnRFC(sSend, enDefault);
                idTC.Disconnect;
              end;
            except
              on E: Exception do
                ExceptLogging('TfrmMain.UnitCtrl: ' + aString(E.Message));
            end;
          end
          else
            ExceptLogging('UnitCtrl(' + IntToStr(nCmd) + ')시 네트워크 오류!');
        end;
      end;
    end;
  except
    on E: Exception do
      ExceptLogging('TfrmMainNew.UnitCtrl: ' + aString(E.Message));
  end;
end;

procedure TfrmMainNew.VIPDCProc(sCarNo: String);
var
  nTotCnt, nDCNo, nDCValue, nDCCnt,nParnas, i, j, nTemp1, nTemp2, nDiscountMoney: Integer;
  sTempWeb, sTemp, sDCName, sUpche, sWebInfo,sShortCarNo: String;
  nDCInfoNo, nTimeDC , nValue,nValue1,nJulsa,nPerDC : Integer;
  nDCType: Byte;
  sName,sYogum: aString;
begin
  try
    i := 0;
    sShortCarNo :=Copy(sCarNo, Length(sCarNo) -3, 4);
    with dmTables.qryDCTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select top(1) car_no_1 + car_no_2 as carno, Park_time  from dbo.AK_BICARMTB ');
      SQL.Add(' where Car_No_1 + Car_NO_2 = :N1 and park_time is not null and ');
      SQL.Add(' ((SVC_DATE_FR <= :N2) and (SVC_DATE_TO >= :N3)) ') ;
      SQL.Add(' order by park_type ') ;
      Parameters.ParamByName('N1').Value:= sCarNo;
      Parameters.ParamByName('N2').Value:= FormatDateTime('YYYYMMDD', Now);
      Parameters.ParamByName('N3').Value:= FormatDateTime('YYYYMMDD', Now);
      Open;
      if RecordCount > 0 then
      begin
        nPosAmt := FieldByName('Park_time').AsInteger ;
      end
      else
      begin
        ExceptLogging('VIP할인없음');
        Exit;
      end;
    end;
    try
      with dmTables.qryDCTemp do begin
        Close;
        SQL.Clear;
        SQL.Add('Select * from DCInfo where DCNo = :N1');
        Parameters.ParamByName('N1').Value:= 98;
        Open;

        if RecordCount > 0 then begin
          nDCInfoNo :=  FieldByName('DCNo').AsInteger;
          sName:= FieldByName('DCName').AsString;
        end;
        if nPosAmt = 0 then
        begin
          nDCType:= 2;
          nValue := 100;
        end
        else
        begin
          nDCType:= 1;
          nValue := nPosAmt;
        end;
      end;
      if nProcYogum > 0 then begin
        Case nDCType of
          0:
            begin // 금액할인.
              nDCCnt := nDCCnt + 1;

              if nProcYogum >= nValue then begin
                nProcYogum := nProcYogum - nValue;
                nJulsa := JulsaProc(nProcYogum);
                nProcYogum := nProcYogum - nJulsa;
                nDCYogum := nDCYogum + nValue;
                nDCYogum := nDCYogum + nJulsa;

                edtProcYogum.Text := FormatFloat('#,##0', nProcYogum);
                edtDCYogum.Text := IntToStr(nDCYogum);
                edtDCYogum.AutoThousandSeparator := True;
                sYogum := IntToStr(nProcYogum);

                for i := 1 to 6 do begin
                  with frmMainNew do
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Visible := False;
                end;

                for i := 1 to Length(sYogum) do begin
                  with frmMainNew do begin
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Visible := True;
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Caption := Copy(sYogum, Length(sYogum) - (i - 1), 1);
                  end;
                end;
                lbDCName.Caption := sName;

                with DCProc[nDCCnt] do begin
                  nDCNo       := nDCInfoNo;
                  sDCName     := sName;
                  nDCAmt      := nValue + nJulsa;
                  nRealDCAmt  := nValue + nJulsa;
                  nDCType     := 0;
                end;
              end else begin
                nDCYogum := nDCYogum + nProcYogum;
                edtDCYogum.Text := IntToStr(nDCYogum);
                edtDCYogum.AutoThousandSeparator := True;

                for i := 6 downto 2 do begin
                  with frmMainNew do begin
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Visible := False;
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Caption := '0';
                  end;
                end;
                lbYogum1.Caption := '0';
                lbDCName.Caption := sName;

                with DCProc[nDCCnt] do begin
                  nDCNo := nDCInfoNo;
                  sDCName := sName;
                  nDCAmt := nValue;
                  nRealDCAmt := nProcYogum;
                  nDCType     := 0;
                end;
                nProcYogum := 0;
                edtProcYogum.Text := '0';
              end;
            end;

          1:    { TODO  : 웹할인 - 시간할인 }
            begin // 시간할인.
              nDCCnt := nDCCnt + 1;
              sDCOutTime := MG_AddTime(sDCOutTime, 0, -nvalue, 0, 0);

              nTimeDC := nProcYogum - ReturnFee(nCurrParkNo, nFeeNo, PAnsiChar(Copy(aString(lbInTime.Caption), 1, 16)),
                                                PAnsiChar(Copy(sDCOutTime, 1, 16)));

              if nProcYogum >= nTimeDC then begin
                nProcYogum := nProcYogum - nTimeDC;
                nJulsa := JulsaProc(nProcYogum);
                nProcYogum := nProcYogum - nJulsa;
                nDCYogum := nDCYogum + nTimeDC;
                nDCYogum := nDCYogum + nJulsa;
                edtProcYogum.Text := FormatFloat('#,##0', nProcYogum);
                edtDCYogum.Text := IntToStr(nDCYogum);
                edtDCYogum.AutoThousandSeparator := True;
                sYogum := IntToStr(nProcYogum);

                for i := 1 to 6 do begin
                  with frmMainNew do
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Visible := False;
                end;

                for i := 1 to Length(sYogum) do begin
                  with frmMainNew do begin
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Visible := True;
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Caption :=
                      Copy(sYogum, Length(sYogum) - (i - 1), 1);
                  end;
                end;
                lbDCName.Caption := sName;

                with DCProc[nDCCnt] do begin
                  nDCNo := nDCInfoNo;
                  sDCName := sName;
                  nDCAmt := nTimeDC + nJulsa;
                  nRealDCAmt := nTimeDC + nJulsa;
                  nDCType     := 1;
                end;
              end else begin
                nDCYogum := nDCYogum + nTimeDC;
                edtDCYogum.Text := IntToStr(nDCYogum);
                edtDCYogum.AutoThousandSeparator := True;

                for i := 6 downto 2 do begin
                  with frmMainNew do begin
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Visible := False;
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Caption := '0';
                  end;
                end;
                lbYogum1.Caption := '0';
                lbDCName.Caption := sName;

                with DCProc[nDCCnt] do begin
                  nDCNo := nDCInfoNo;
                  sDCName := sName;
                  nDCAmt := nTimeDC;
                  nRealDCAmt := nProcYogum;
                  nDCType     := 1;
                end;
                nProcYogum := 0;
                edtProcYogum.Text := '0';
              end;
            end;

          2:
            begin // 퍼센트할인.
              nDCCnt := nDCCnt + 1;
              nPerDC := (nProcYogum * nValue) div 100;

              if nProcYogum >= nPerDC then begin
                nProcYogum := nProcYogum - nPerDC;
                nJulsa := JulsaProc(nProcYogum);
                nProcYogum := nProcYogum - nJulsa;
                nDCYogum := nDCYogum + nPerDC;
                nDCYogum := nDCYogum + nJulsa;
                edtProcYogum.Text := FormatFloat('#,##0', nProcYogum);
                edtDCYogum.Text := IntToStr(nDCYogum);
                edtDCYogum.AutoThousandSeparator := True;
                sYogum := IntToStr(nProcYogum);

                for i := 1 to 6 do begin
                  with frmMainNew do
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Visible := False;
                end;

                for i := 1 to Length(sYogum) do begin
                  with frmMainNew do begin
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Visible := True;
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Caption :=
                      Copy(sYogum, Length(sYogum) - (i - 1), 1);
                  end;
                end;
                lbDCName.Caption := sName;

                with DCProc[nDCCnt] do begin
                  nDCNo := nDCInfoNo;
                  sDCName := sName;
                  nDCAmt := nPerDC + nJulsa;
                  nRealDCAmt := nPerDC + nJulsa;
                  nDCType     := 2;
                end;
              end else begin
                nDCYogum := nDCYogum + nPerDC;
                edtDCYogum.Text := IntToStr(nDCYogum);
                edtDCYogum.AutoThousandSeparator := True;

                for i := 6 downto 2 do begin
                  with frmMainNew do begin
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Visible := False;
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Caption := '0';
                  end;
                end;
                lbYogum1.Caption := '0';
                lbDCName.Caption := sName;

                with DCProc[nDCCnt] do begin
                  nDCNo := nDCInfoNo;
                  sDCName := sName;
                  nDCAmt := nPerDC;
                  nRealDCAmt := nProcYogum;
                  nDCType     := 2;
                end;
                nProcYogum := 0;
                edtProcYogum.Text := '0';
              end;
            end;
        end;

        InspectionLog('VIP할인요금: ' + edtDCYogum.Text);
        lbDCName.Caption:= 'VIP할인';
      end;
    except
      on E: Exception do ExceptLogging('TfrmMainNew.VIPDCProc: ' + aString(E.Message));
    end;
  except
    on E: Exception do ExceptLogging('TfrmMainNew.VIPDCProc: ' + aString(E.Message));
  end;
end;

procedure TfrmMainNew.CancelDataProc;
begin
  with dmTables.qryCancelData do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Insert Into CancelData ');
    SQL.Add(
      '(ParkNo, UnitNo, CanelDate, CancelTime, MNo, InDate, InTime, InImage1, InCarNo1, ');
    SQL.Add(
      'InImage2, InCarNo2, TKNo, OutImage1, OutCarNo1, OutImage2, OutCarNo2, ');
    SQL.Add('ParkingMin, ParkingAmt, DCAmt, CancelReason) ');
    SQL.Add(
      'Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, :N12, '
      );
    SQL.Add(':N13, :N14, :N15, :N16, :N17, :N18, :N19, :N20)');
    Parameters.ParamByName('N1').Value := nCurrParkNo;
    Parameters.ParamByName('N2').Value := nCurrUnitNo;
    Parameters.ParamByName('N3').Value := FormatDateTime('YYYY-MM-DD', Now);
    Parameters.ParamByName('N4').Value := FormatDateTime('HH:NN:SS', Now);
    Parameters.ParamByName('N5').Value := nCurrMNo;
    Parameters.ParamByName('N6').Value := sNowInDate;
    Parameters.ParamByName('N7').Value := sNowInTime;
    Parameters.ParamByName('N8').Value := sNowInFile;
    Parameters.ParamByName('N9').Value := sNowInCarNo;
    Parameters.ParamByName('N10').Value := '';
    Parameters.ParamByName('N11').Value := '';
    Parameters.ParamByName('N12').Value := sNowInTKNo;
    Parameters.ParamByName('N13').Value := sNowLprFile1;
    Parameters.ParamByName('N14').Value := sNowLprCarNo1;
    Parameters.ParamByName('N15').Value := sNowLprFile2;
    Parameters.ParamByName('N16').Value := sNowLprCarNo2;
    Parameters.ParamByName('N17').Value := nNowParkingMin;
    Parameters.ParamByName('N18').Value := StrToInt
      (MG_StrTrim(edtProcYogum.Text, ','));
    Parameters.ParamByName('N19').Value := StrToInt
      (MG_StrTrim(edtDCYogum.Text, ','));
    Parameters.ParamByName('N20').Value := sCancelReason;
    ExecSQL;
  end;
end;

procedure TfrmMainNew.ICMPReply(ASender: TComponent;
  const ReplyStatus: TReplyStatus);
begin
  case ReplyStatus.ReplyStatusType of
    rsTimeOut:
      ping_success := False;
    rsErrorUnreachable:
      ping_success := False;
    rsEcho:
      ping_success := True;
  end;
end;

procedure TfrmMainNew.idTSExecute(AContext: TIdContext);
var
  sRecv, sRemortIP, sSend, sData: aString;
  nCmd, nUnitNo, nMNo: Word;
  i: Byte;
  bSend: Boolean;
begin
  try
    sRecv := AContext.Connection.IOHandler.ReadString(AContext.Connection.IOHandler.InputBuffer.Size, enUTF8);

    if Pos(STX, sRecv) > 0 then
      sCtrl := sRecv
    else
      sCtrl := sCtrl + sRecv;

    if (Pos(STX, sCtrl) <= 0) or (Pos(ETX, sCtrl) <= 0) then
      Exit;

    sRemortIP := AContext.Binding.PeerIP;
    ExceptLogging('CtrlRecv: ' + sCtrl + ':' + sRemortIP);
    nCmd := StrToInt(Copy(sRecv, 2, 2));
    nUnitNo := StrToInt(Copy(sRecv, 4, 5));
    nMNo := StrToInt(Copy(sRecv, 9, 3));

    if Pos(ETX, sCtrl) > 12 then
    begin
      // 데이터가 있으면...
      sData := Copy(sCtrl, 12, Pos(ETX, sCtrl) - 12);
    end
    else
      sData := '';

    bSend := False;

    case nCmd of
      1:
        begin
          for i := 1 to 5 do
          begin
            with frmMainNew do
            begin
              if TClientSocket(FindComponent('csInLpr' + IntToStr(i))).Tag = nUnitNo then
              begin
                if is_ping(TClientSocket(FindComponent('csInLpr' + IntToStr(i))).Host) and
                   TClientSocket(FindComponent('csInLpr' + IntToStr(i))).Active then
                begin
                  sSend := 'BAR_OPEN-1';
                  TClientSocket(FindComponent('csInLpr' + IntToStr(i))).Socket.SendText(sSend);
                  ExceptLogging('CtrlRecv: 차단기 원격 오픈' + 'csInLpr' + IntToStr(i));
                  bSend := True;
                  Break;
                end
                else
                  ExceptLogging(TClientSocket(FindComponent('csInLpr' + IntToStr(i))).Host + ': 차단기 원격제어시 네트워크 오류!');
              end;
            end;
          end;

          if not bSend then
            for i := 1 to 3 do
            begin
              with frmMainNew do
              begin
                if TClientSocket(FindComponent('csOutLpr' + IntToStr(i))).Tag = nUnitNo then
                begin
                  if is_ping(TClientSocket(FindComponent('csOutLpr' + IntToStr(i))).Host) and
                     TClientSocket(FindComponent('csOutLpr' + IntToStr(i))).Active then
                  begin
                    sSend := 'BAR_OPEN-1';
                    TClientSocket(FindComponent('csOutLpr' + IntToStr(i))).Socket.SendText(sSend);
                    ExceptLogging('CtrlRecv: 차단기 원격 오픈' + 'csOutLpr' + IntToStr(i));
                    bSend := True;
                    Break;
                  end
                  else
                    ExceptLogging(TClientSocket(FindComponent('csOutLpr' + IntToStr(i))).Host + ': 차단기 원격제어시 네트워크 오류!');
                end;
              end;
            end;

          if bSend then
          begin
            with dmTables.qryBarProc do
            begin
              Close;
              SQL.Clear;
              SQL.Add('Insert BarProc ');
              SQL.Add('(ParkNo, UnitNo, ProcDate, ProcTime, Up, MNo, ChkClosing, ProcReason) ');
              SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8)');
              Parameters.ParamByName('N1').Value := nCurrParkNo;
              Parameters.ParamByName('N2').Value := nUnitNo;
              Parameters.ParamByName('N3').Value := FormatDateTime('YYYY-MM-DD', Now);
              Parameters.ParamByName('N4').Value := FormatDateTime('HH:NN:SS', Now);
              Parameters.ParamByName('N5').Value := 1;
              Parameters.ParamByName('N6').Value := nMNo;
              Parameters.ParamByName('N7').Value := 0;

              if sData <> '' then
                Parameters.ParamByName('N8').Value := sData
              else
                Parameters.ParamByName('N8').Value := '원격제어';
              ExecSQL;
            end;
          end;
        end;
    end;

    sCtrl := '';
  except
    on E: Exception do
      ExceptLogging('TfrmMainNew.idTSExecute: ' + aString(E.Message));
  end;
end;

function TfrmMainNew.is_Ping(ip: AnsiString): Boolean;
var
   Handle : THandle;
   DW : DWORD;
   REP : ICMPECHO;
   IPLong: LongInt;
begin
  Result:= False;
  ExceptLogging('Ping 시간 체크1-' + IntToStr(GetTickCount));

  Handle := IcmpCreateFile;

  if Handle = INVALID_HANDLE_VALUE then Exit;

  IPLong := inet_addr(PAnsiChar( ip ));
  DW := IcmpSendEcho(Handle, IPLong, nil, 0, nil, @rep, Sizeof(Rep), nPingTimeOut );

  if rep.status = 0 then
    Result:= True
  else
    Result:= False;

  ExceptLogging('Ping 시간 체크2-' + IntToStr(GetTickCount));
  IcmpCloseHandle(Handle);
end;

{
function TfrmMainNew.is_ping(IP: AnsiString): Boolean;
begin
  Result := False;
  ExceptLogging('Ping 시간 체크1-' + IntToStr(GetTickCount));

  try
    with ICMP do
    begin
      OnReply := ICMPReply;
      ReceiveTimeOut := 5;
      //Host := wString(IP);
      Host := IP;
      Ping;
    end;
    Result := ping_success;
    ExceptLogging('Ping 시간 체크2-' + IntToStr(GetTickCount));
  except
    on E: Exception do
      ExceptLogging('TfrmMain.is_ping: ' + aString(E.Message));
  end;
end;
}

function TfrmMainNew.IntToBool(nNo: Integer): Boolean;
begin
  if nNo = 0 then
    Result := False
  else
    Result := True;
end;

// 절사처리
function TfrmMainNew.JulsaProc(nOrgAmt: Integer): Integer;
var
  nJulsaAmt: Integer;
begin
  try
    Result := 0;

    case nJulsaType of
      0:
        begin
          // 사용안함.
          nJulsaAmt := 0;
        end;

      1:
        begin
          // 1원단위
          case nRoundType of
            0:
              nJulsaAmt := nOrgAmt mod 10;
            1:
              begin
                nJulsaAmt := nOrgAmt mod 10;

                if nJulsaAmt > 0 then
                begin
                  nJulsaAmt := nJulsaAmt + (10 - nJulsaAmt);
                  nJulsaAmt := nJulsaAmt * -1;
                end
                else
                  nJulsaAmt := 0;
              end;
            2:
              begin
                nJulsaAmt := nOrgAmt mod 10;

                if nJulsaAmt >= 5 then
                begin
                  nJulsaAmt := nJulsaAmt + (10 - nJulsaAmt);
                  nJulsaAmt := nJulsaAmt * -1;
                end;
              end;
          end;
        end;

      2:
        begin
          // 10원단위
          case nRoundType of
            0:
              nJulsaAmt := nOrgAmt mod 10;
            1:
              begin
                nJulsaAmt := nOrgAmt mod 10;

                if nJulsaAmt > 0 then
                begin
                  nJulsaAmt := nJulsaAmt + (10 - nJulsaAmt);
                  nJulsaAmt := nJulsaAmt * -1;
                end
                else
                  nJulsaAmt := 0;
              end;
            2:
              begin
                nJulsaAmt := nOrgAmt mod 10;

                if nJulsaAmt >= 5 then
                begin
                  nJulsaAmt := nJulsaAmt + (10 - nJulsaAmt);
                  nJulsaAmt := nJulsaAmt * -1;
                end;
              end;
          end;
        end;

      3:
        begin
          // 100원단위
          case nRoundType of
            0:
              nJulsaAmt := nOrgAmt mod 100;
            1:
              begin
                nJulsaAmt := nOrgAmt mod 100;

                if nJulsaAmt > 0 then
                begin
                  nJulsaAmt := nJulsaAmt + (100 - nJulsaAmt);
                  nJulsaAmt := nJulsaAmt * -1;
                end
                else
                  nJulsaAmt := 0;
              end;
            2:
              begin
                nJulsaAmt := nOrgAmt mod 100;

                if nJulsaAmt >= 50 then
                begin
                  nJulsaAmt := nJulsaAmt + (100 - nJulsaAmt);
                  nJulsaAmt := nJulsaAmt * -1;
                end;
              end;
          end;
        end;

      4:
        begin
          // 500원단위
          case nRoundType of
            0:
              nJulsaAmt := nOrgAmt mod 500;
            1:
              begin
                nJulsaAmt := nOrgAmt mod 500;

                if nJulsaAmt > 0 then
                begin
                  nJulsaAmt := nJulsaAmt + (500 - nJulsaAmt);
                  nJulsaAmt := nJulsaAmt * -1;
                end
                else
                  nJulsaAmt := 0;
              end;
            2:
              begin
                nJulsaAmt := nOrgAmt mod 500;

                if nJulsaAmt >= 250 then
                begin
                  nJulsaAmt := nJulsaAmt + (500 - nJulsaAmt);
                  nJulsaAmt := nJulsaAmt * -1;
                end;
              end;
          end;
        end;

      5:
        begin
          // 1000원단위
          case nRoundType of
            0:
              nJulsaAmt := nOrgAmt mod 1000;
            1:
              begin
                nJulsaAmt := nOrgAmt mod 1000;

                if nJulsaAmt > 0 then
                begin
                  nJulsaAmt := nJulsaAmt + (1000 - nJulsaAmt);
                  nJulsaAmt := nJulsaAmt * -1;
                end
                else
                  nJulsaAmt := 0;
              end;
            2:
              begin
                nJulsaAmt := nOrgAmt mod 1000;

                if nJulsaAmt >= 500 then
                begin
                  nJulsaAmt := nJulsaAmt + (1000 - nJulsaAmt);
                  nJulsaAmt := nJulsaAmt * -1;
                end;
              end;
          end;
        end;
    end;
    Result := nJulsaAmt;
  except
    on E: Exception do
      ExceptLogging('TfrmMainNew.JulsaProc: ' + aString(E.Message));
  end;
end;

procedure TfrmMainNew.lbReceiptDblClick(Sender: TObject);
var
  i, nSel: Integer;
  sSend: aString;
begin
  nSel := 0;

  for i := 0 to (lbReceipt.Items.Count - 1) do
  begin
    if lbReceipt.Selected[i] then
      nSel := i + 1;
  end;
  sSend := RReceipt[nSel].sRpt;

  if ComPrn.Open and (sSend <> '') then
  begin
    ComPrn.PutString(sSend);
    sSend := '';
  end;
  mnuDetailClick(Self);
end;

procedure TfrmMainNew.dcBtnClick(dcBtn: TAdvShapeButton; dcMnu: TMenuItem);
var
  nTimeDC, // 시간할인시 할인된 금액.
  nPerDC, // 퍼센트할인시 할인된 금액.
  nJulsa: Integer;
  sName, sYogum: aString;
  i: Byte;
begin
  try
    if nProcYogum > 0 then
    begin
      sName := dcBtn.Text;

      Case dcBtn.GroupIndex of
        0:
          begin // 금액할인.
            nDCCnt := nDCCnt + 1;

            if nProcYogum >= StrToInt(dcBtn.Hint) then
            begin
              nProcYogum := nProcYogum - StrToInt(dcBtn.Hint);
              nJulsa := JulsaProc(nProcYogum);
              nProcYogum := nProcYogum - nJulsa;
              nDCYogum := nDCYogum + StrToInt(dcBtn.Hint);
              nDCYogum := nDCYogum + nJulsa;

              //edtProcYogum.Text := IntToStr(nProcYogum);
              edtProcYogum.Text := FormatFloat('#,##0', nProcYogum);
              //edtProcYogum.AutoThousandSeparator := True;
              edtDCYogum.Text := IntToStr(nDCYogum);
              edtDCYogum.AutoThousandSeparator := True;
              sYogum := IntToStr(nProcYogum);

              for i := 1 to 6 do
              begin
                with frmMainNew do
                  TLabel(FindComponent('lbYogum' + IntToStr(i))).Visible := False;
              end;

              for i := 1 to Length(sYogum) do
              begin
                with frmMainNew do
                begin
                  TLabel(FindComponent('lbYogum' + IntToStr(i))).Visible := True;
                  TLabel(FindComponent('lbYogum' + IntToStr(i))).Caption := Copy(sYogum, Length(sYogum) - (i - 1), 1);
                end;
              end;
              lbDCName.Caption := sName;

              with DCProc[nDCCnt] do
              begin
                nDCNo := dcBtn.Tag - 100;
                sDCName := sName;
                nDCAmt := StrToInt(dcBtn.Hint) + nJulsa;
                nRealDCAmt := StrToInt(dcBtn.Hint) + nJulsa;
                nDCType := 0;
              end;
            end
            else
            begin
              nDCYogum := nDCYogum + nProcYogum;
              edtDCYogum.Text := IntToStr(nDCYogum);
              edtDCYogum.AutoThousandSeparator := True;

              for i := 6 downto 2 do
              begin
                with frmMainNew do
                begin
                  TLabel(FindComponent('lbYogum' + IntToStr(i)))
                    .Visible := False;
                  TLabel(FindComponent('lbYogum' + IntToStr(i))).Caption := '0';
                end;
              end;
              lbYogum1.Caption := '0';
              lbDCName.Caption := sName;

              with DCProc[nDCCnt] do
              begin
                nDCNo := dcBtn.Tag - 100;
                sDCName := sName;
                nDCAmt := StrToInt(dcBtn.Hint);
                nRealDCAmt := nProcYogum;
                nDCType := 0;
              end;
              nProcYogum := 0;
              edtProcYogum.Text := '0';
            end;
          end;

        1:
          begin // 시간할인.
            nDCCnt := nDCCnt + 1;
            sDCOutTime := MG_AddTime(sDCOutTime, 0, -StrToInt(dcBtn.Hint), 0, 0);

            nTimeDC := nProcYogum - ReturnFee(nCurrParkNo, nFeeNo, PAnsiChar(Copy(aString(lbInTime.Caption), 1, 16)),
                                              PAnsiChar(Copy(sDCOutTime, 1, 16)));

            //nTimeDC := ReturnFee(nCurrParkNo, nFeeNo, PAnsiChar(Copy(sDCOutTime, 1, 16)),
            //  PAnsiChar(sNowOutDate + ' ' + Copy(sNowOutTime, 1, 5)));

            if nProcYogum >= nTimeDC then
            begin
              nProcYogum := nProcYogum - nTimeDC;
              nJulsa := JulsaProc(nProcYogum);
              nProcYogum := nProcYogum - nJulsa;
              nDCYogum := nDCYogum + nTimeDC;
              nDCYogum := nDCYogum + nJulsa;
              //edtProcYogum.Text := IntToStr(nProcYogum);
              edtProcYogum.Text := FormatFloat('#,##0', nProcYogum);
              //edtProcYogum.AutoThousandSeparator := True;
              edtDCYogum.Text := IntToStr(nDCYogum);
              edtDCYogum.AutoThousandSeparator := True;
              sYogum := IntToStr(nProcYogum);

              for i := 1 to 6 do
              begin
                with frmMainNew do
                  TLabel(FindComponent('lbYogum' + IntToStr(i)))
                    .Visible := False;
              end;

              for i := 1 to Length(sYogum) do
              begin
                with frmMainNew do
                begin
                  TLabel(FindComponent('lbYogum' + IntToStr(i)))
                    .Visible := True;
                  TLabel(FindComponent('lbYogum' + IntToStr(i))).Caption := Copy
                    (sYogum, Length(sYogum) - (i - 1), 1);
                end;
              end;
              lbDCName.Caption := sName;

              with DCProc[nDCCnt] do
              begin
                nDCNo := dcBtn.Tag - 100;
                sDCName := sName;
                nDCAmt := nTimeDC + nJulsa;
                nRealDCAmt := nTimeDC + nJulsa;
                nDCType := 1;
              end;
            end
            else
            begin
              nDCYogum := nDCYogum + nTimeDC;
              edtDCYogum.Text := IntToStr(nDCYogum);
              edtDCYogum.AutoThousandSeparator := True;

              for i := 6 downto 2 do
              begin
                with frmMainNew do
                begin
                  TLabel(FindComponent('lbYogum' + IntToStr(i)))
                    .Visible := False;
                  TLabel(FindComponent('lbYogum' + IntToStr(i))).Caption := '0';
                end;
              end;
              lbYogum1.Caption := '0';
              lbDCName.Caption := sName;

              with DCProc[nDCCnt] do
              begin
                nDCNo := dcBtn.Tag - 100;
                sDCName := sName;
                nDCAmt := nTimeDC;
                nRealDCAmt := nProcYogum;
                nDCType := 1;
              end;
              nProcYogum := 0;
              edtProcYogum.Text := '0';
            end;
          end;

        2:
          begin // 퍼센트할인.
            nDCCnt := nDCCnt + 1;
            nPerDC := (nProcYogum * StrToInt(dcBtn.Hint)) div 100;

            if nProcYogum >= nPerDC then
            begin
              nProcYogum := nProcYogum - nPerDC;
              nJulsa := JulsaProc(nProcYogum);
              nProcYogum := nProcYogum - nJulsa;
              nDCYogum := nDCYogum + nPerDC;
              nDCYogum := nDCYogum + nJulsa;
              //edtProcYogum.Text := IntToStr(nProcYogum);
              edtProcYogum.Text := FormatFloat('#,##0', nProcYogum);
              //edtProcYogum.AutoThousandSeparator := True;
              edtDCYogum.Text := IntToStr(nDCYogum);
              edtDCYogum.AutoThousandSeparator := True;
              sYogum := IntToStr(nProcYogum);

              for i := 1 to 6 do
              begin
                with frmMainNew do
                  TLabel(FindComponent('lbYogum' + IntToStr(i)))
                    .Visible := False;
              end;

              for i := 1 to Length(sYogum) do
              begin
                with frmMainNew do
                begin
                  TLabel(FindComponent('lbYogum' + IntToStr(i)))
                    .Visible := True;
                  TLabel(FindComponent('lbYogum' + IntToStr(i))).Caption := Copy
                    (sYogum, Length(sYogum) - (i - 1), 1);
                end;
              end;
              lbDCName.Caption := sName;

              with DCProc[nDCCnt] do
              begin
                nDCNo := dcBtn.Tag - 100;
                sDCName := sName;
                nDCAmt := nPerDC + nJulsa;
                nRealDCAmt := nPerDC + nJulsa;
                nDCType := 2;
              end;
            end
            else
            begin
              nDCYogum := nDCYogum + nPerDC;
              edtDCYogum.Text := IntToStr(nDCYogum);
              edtDCYogum.AutoThousandSeparator := True;

              for i := 6 downto 2 do
              begin
                with frmMainNew do
                begin
                  TLabel(FindComponent('lbYogum' + IntToStr(i)))
                    .Visible := False;
                  TLabel(FindComponent('lbYogum' + IntToStr(i))).Caption := '0';
                end;
              end;
              lbYogum1.Caption := '0';
              lbDCName.Caption := sName;

              with DCProc[nDCCnt] do
              begin
                nDCNo := dcBtn.Tag - 100;
                sDCName := sName;
                nDCAmt := nPerDC;
                nRealDCAmt := nProcYogum;
                nDCType := 2;
              end;
              nProcYogum := 0;
              edtProcYogum.Text := '0';
            end;
          end;
      end;
      InspectionLog('할인요금: ' + edtDCYogum.Text);

      // 할인키별 적용가능횟수 처리...
      for i := 1 to 50 do
      begin
        if RDCCnt[i].nDCNo = dcBtn.Tag then
        begin
          RDCCnt[i].nDCNowCnt := RDCCnt[i].nDCNowCnt + 1;

          if (RDCCnt[i].nDCUseCnt <> 0) and
            (RDCCnt[i].nDCUseCnt = RDCCnt[i].nDCNowCnt) then
          begin
            dcBtn.Enabled := False;
            dcMnu.Enabled := False;
          end;
        end;
      end;

      if edtDC.Text = '' then
      begin
        edtDC.Text := sName;
      end
      else
      begin
        edtDC.Text := edtDC.Text + ', ' + sName;
      end;
    end;
  except
    on E: Exception do
      ExceptLogging('dcBtnClick: ' + aString(E.Message));
  end;
end;

procedure TfrmMainNew.btnBar10Click(Sender: TObject);
var
  sReason: aString;
begin
  if bManualOpen then
    sReason := InputBox('수동오픈사유', '차단기수동오픈사유를 입력하여주세요!', '')
  else
    sReason := '';

  UnitCtrl(1, btnBar10.ImageIndex, btnBar10.Tag, nCurrMNo, sReason);
  pnBar.Visible := False;
end;

procedure TfrmMainNew.btnBar1Click(Sender: TObject);
var
  sReason: aString;
begin
  if bManualOpen then
    sReason := InputBox('수동오픈사유', '차단기수동오픈사유를 입력하여주세요!', '')
  else
    sReason := '';

  UnitCtrl(1, btnBar1.ImageIndex, btnBar1.Tag, nCurrMNo, sReason);
  pnBar.Visible := False;
end;

procedure TfrmMainNew.btnBar2Click(Sender: TObject);
var
  sReason: aString;
begin
  if bManualOpen then
    sReason := InputBox('수동오픈사유', '차단기수동오픈사유를 입력하여주세요!', '')
  else
    sReason := '';

  UnitCtrl(1, btnBar2.ImageIndex, btnBar2.Tag, nCurrMNo, sReason);
  pnBar.Visible := False;
end;

procedure TfrmMainNew.btnBar3Click(Sender: TObject);
var
  sReason: aString;
begin
  if bManualOpen then
    sReason := InputBox('수동오픈사유', '차단기수동오픈사유를 입력하여주세요!', '')
  else
    sReason := '';

  UnitCtrl(1, btnBar3.ImageIndex, btnBar3.Tag, nCurrMNo, sReason);
  pnBar.Visible := False;
end;

procedure TfrmMainNew.btnBar4Click(Sender: TObject);
var
  sReason: aString;
begin
  if bManualOpen then
    sReason := InputBox('수동오픈사유', '차단기수동오픈사유를 입력하여주세요!', '')
  else
    sReason := '';

  UnitCtrl(1, btnBar4.ImageIndex, btnBar4.Tag, nCurrMNo, sReason);
  pnBar.Visible := False;
end;

procedure TfrmMainNew.btnBar5Click(Sender: TObject);
var
  sReason: aString;
begin
  if bManualOpen then
    sReason := InputBox('수동오픈사유', '차단기수동오픈사유를 입력하여주세요!', '')
  else
    sReason := '';

  UnitCtrl(1, btnBar5.ImageIndex, btnBar5.Tag, nCurrMNo, sReason);
  pnBar.Visible := False;
end;

procedure TfrmMainNew.btnBar6Click(Sender: TObject);
var
  sReason: aString;
begin
  if bManualOpen then
    sReason := InputBox('수동오픈사유', '차단기수동오픈사유를 입력하여주세요!', '')
  else
    sReason := '';

  UnitCtrl(1, btnBar6.ImageIndex, btnBar6.Tag, nCurrMNo, sReason);
  pnBar.Visible := False;
end;

procedure TfrmMainNew.btnBar7Click(Sender: TObject);
var
  sReason: aString;
begin
  if bManualOpen then
    sReason := InputBox('수동오픈사유', '차단기수동오픈사유를 입력하여주세요!', '')
  else
    sReason := '';

  UnitCtrl(1, btnBar7.ImageIndex, btnBar7.Tag, nCurrMNo, sReason);
  pnBar.Visible := False;
end;

procedure TfrmMainNew.btnBar8Click(Sender: TObject);
var
  sReason: aString;
begin
  if bManualOpen then
    sReason := InputBox('수동오픈사유', '차단기수동오픈사유를 입력하여주세요!', '')
  else
    sReason := '';

  UnitCtrl(1, btnBar8.ImageIndex, btnBar8.Tag, nCurrMNo, sReason);
  pnBar.Visible := False;
end;

procedure TfrmMainNew.btnBar9Click(Sender: TObject);
var
  sReason: aString;
begin
  if bManualOpen then
    sReason := InputBox('수동오픈사유', '차단기수동오픈사유를 입력하여주세요!', '')
  else
    sReason := '';

  UnitCtrl(1, btnBar9.ImageIndex, btnBar9.Tag, nCurrMNo, sReason);
  pnBar.Visible := False;
end;

procedure TfrmMainNew.btnBarClick(Sender: TObject);
begin
  try
    pnBar.Visible := True;
  except
    on E: Exception do
      ExceptLogging('TfrmMain.btnBarClick: ' + aString(E.Message));
  end;
end;

procedure TfrmMainNew.btnBarCloseClick(Sender: TObject);
begin
  pnBar.Visible := False;
end;

procedure TfrmMainNew.btnCarSearchClick(Sender: TObject);
begin
  try
    dmTables.qryUnitInfo.Open;
    imgLost.Picture.Assign(Nil);
    edtLostCarNo.Text := '';
    pnLost.Visible := True;
    edtLostCarNo.SetFocus;
    edtLostCarNo.SelectAll;
  except
    on E: Exception do
      ExceptLogging('TfrmMain.btnLostClick: ' + aString(E.Message));
  end;
end;

procedure TfrmMainNew.btnClosingClick(Sender: TObject);
begin
  bClosing := False;
  NextModalDialog(TfrmClosing.Create(Self));

  if bClosing then
  begin
    nLoginResult := 0;
    NextModalDialog(TfrmLogin.Create(Self));

    if nLoginResult <> 1 then
    begin
      ShowMessage('근무자확인에 실패하여 프로그램을 종료합니다.');
      Close;
      Exit;
    end
    else
    begin
      ExceptLogging('근무시작: ' + sCurrMName);
      edtMName.Text := '근무자 - ' + sCurrMName;

      bAutoCalc := IntToBool(iSetup.ReadInteger('PARKING', '자동요금계산', 1));
      bZeroOpen := IntToBool(iSetup.ReadInteger('PARKING', '0원자동오픈', 1));
      bClosingText := IntToBool(iSetup.ReadInteger('PARKING', '마감내용파일저장', 0));
      bClosingReprint := IntToBool(iSetup.ReadInteger('PARKING', '마감재출력', 0));
      bReceiptReprint := IntToBool(iSetup.ReadInteger('PARKING', '영수증재출력', 0));
      bCarSearch := IntToBool(iSetup.ReadInteger('PARKING', '차량검색', 1));
      bManualIn := IntToBool(iSetup.ReadInteger('PARKING', '수동입차', 0));
      nFCProcType := iSetup.ReadInteger('PARKING', '정산방식', 0);
      bCancel := IntToBool(iSetup.ReadInteger('PARKING', '정산취소', 1));
      bCancelReason := IntToBool(iSetup.ReadInteger('PARKING', '정산취소사유입력', 0));
      bCancelCheck := IntToBool(iSetup.ReadInteger('PARKING', '정산취소확인', 0));
      bCancelSave := IntToBool(iSetup.ReadInteger('PARKING', '정산취소로그저장', 0));
      bManualOpen := IntToBool(iSetup.ReadInteger('PARKING', '수동개방사유입력', 0));
      bCredit := IntToBool(iSetup.ReadInteger('PARKING', '신용카드결재', 0));
      bCashReceipt := IntToBool(iSetup.ReadInteger('PARKING', '현금영수증발행', 0));
      bBarcodeDC := IntToBool(iSetup.ReadInteger('PARKING', '바코드할인권사용', 0));
      bInterimClosing := IntToBool(iSetup.ReadInteger('PARKING', '중간마감', 0));
      bInterimPrint := IntToBool(iSetup.ReadInteger('PARKING', '중간마감출력', 0));

      if not bCredit then
      begin
        Label8.Top := 413;
        lbMCnt.Top := 413;
        lbMTot.Top := 413;
        Label9.Top := 464;
        lbMCreditCnt.Top := 464;
        lbMCreditTot.Top := 464;
        Label9.Visible := False;
        lbMCreditCnt.Visible := False;
        lbMCreditTot.Visible := False;
      end
      else
      begin
        Label8.Caption:= '현    금:'
      end;

      with qryMainTemp do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select * from ParkInfo where ParkNo = :N1 Order By ParkNo');
        Parameters.ParamByName('N1').Value := nCurrParkNo;
        Open;

        if RecordCount > 0 then
        begin
          nItemMax0 := FieldByName('DayMax').AsInteger;
          nTotMax0 := FieldByName('TotMax').AsInteger;
          nDCCntMax := FieldByName('DCCntMax').AsInteger;
          bZeroReceipt := IntToBool(FieldByName('ReceiptZero').AsInteger);
          bAutoReceipt := IntToBool(FieldByName('ReceiptAuto').AsInteger);
          nJulsaType := FieldByName('JunkType').AsInteger;
          nRoundType := FieldByName('RoundType').AsInteger;
          bTax := not IntToBool(FieldByName('TaxType').AsInteger);
          nTimeDCType := FieldByName('TimeDCType').AsInteger;
          bDCReason := IntToBool(FieldByName('DCReason').AsInteger);
          nLossTicket := FieldByName('LostCalc').AsInteger;
          nLossTicketAmt := FieldByName('LostAmount').AsInteger;

          if FieldByName('Reserve1').AsString <> '정상운영' then
            bOperation := False;

          if FieldByName('Reserve2').AsString = '테스트' then
            bTest := True;

          if FieldByName('Reserve5').AsString = '1' then
          begin
            bFreeTime := True;
            sFreeTimeS := FieldByName('Reserve3').AsString;
            sFreeTimeE := FieldByName('Reserve4').AsString;

            if sFreeTimeS > sFreeTimeE then
              bFreeTimeChk := True;
          end;
        end
        else
          ExceptLogging('설치된 주차장이 없음!');
      end;

      with dmTables.qryTemp do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select Sum(RealFee), Count(*) from TKProc where ProcDate = :N1 and ');
        SQL.Add('MNo = :N2 and ChkClosing = :N3 and PayType = :N4');
        Parameters.ParamByName('N1').Value := FormatDateTime('YYYY-MM-DD', Now);
        Parameters.ParamByName('N2').Value := nCurrMNo;
        Parameters.ParamByName('N3').Value := 0;
        Parameters.ParamByName('N4').Value := 1;
        Open;

        if RecordCount > 0 then
        begin
          nMTot := FieldByName('COLUMN1').AsInteger;
          nMCnt := FieldByName('COLUMN2').AsInteger;
          lbMTot.Caption := FormatFloat('#,##0', nMTot) + ' 원';
          lbMCnt.Caption := FormatFloat('#,##0', nMCnt) + ' 건';
        end
        else
        begin
          lbMTot.Caption := '0 원';
          lbMCnt.Caption := '0 건';
        end;

        Close;
        SQL.Clear;
        SQL.Add('Select Sum(RealFee), Count(*) from TKProc where ProcDate = :N1 and ');
        SQL.Add('MNo = :N2 and ChkClosing = :N3 and PayType = :N4');
        Parameters.ParamByName('N1').Value := FormatDateTime('YYYY-MM-DD', Now);
        Parameters.ParamByName('N2').Value := nCurrMNo;
        Parameters.ParamByName('N3').Value := 0;
        Parameters.ParamByName('N4').Value := 2;
        Open;

        if RecordCount > 0 then
        begin
          nMCreditTot := FieldByName('COLUMN1').AsInteger;
          nMCreditCnt := FieldByName('COLUMN2').AsInteger;
          lbMCreditTot.Caption := FormatFloat('#,##0', nMCreditTot) + ' 원';
          lbMCreditCnt.Caption := FormatFloat('#,##0', nMCreditCnt) + ' 건';
        end
        else
        begin
          lbMCreditTot.Caption := '0 원';
          lbMCreditCnt.Caption := '0 건';
        end;
      end;

      sGeunmuStart := iSetup.ReadString('PARKING', IntToStr(nCurrMNo) + '_근무시작', '');
      sGeunmuMagam := iSetup.ReadString('PARKING', IntToStr(nCurrMNo) + '_마감', '');

      if sGeunmuStart = '' then
      begin
        sGeunmuStart := FormatDateTime('YYYY-MM-DD HH:NN:SS', Now);
        iSetup.WriteString('PARKING', IntToStr(nCurrMNo) + '_근무시작', sGeunmuStart);
      end
      else
      begin
        if sGeunmuStart < sGeunmuMagam then
        begin
          sGeunmuStart := FormatDateTime('YYYY-MM-DD HH:NN:SS', Now);
          iSetup.WriteString('PARKING', IntToStr(nCurrMNo) + '_근무시작', sGeunmuStart);
        end;
      end;
    end;
  end;
end;

procedure TfrmMainNew.btnManualCancelClick(Sender: TObject);
begin
  edtManualCarNo.Text := '';
  pnManual.Visible := False;
end;

procedure TfrmMainNew.btnManualInClick(Sender: TObject);
begin
  pnManual.Visible := True;
  edtManualCarNo.Text := '';
  edtManualCarNo.SetFocus;
  edtManualCarNo.SelectAll;
end;

procedure TfrmMainNew.btnManualOutClick(Sender: TObject);
begin
  pnManualOut.Visible := True;
  edtOutDate.Date := Now;
  edtOutTime.Text := '';
  edtOutTime.SetFocus;
  edtOutTime.SelectAll;
end;

procedure TfrmMainNew.btnSCClick(Sender: TObject);
begin
  try
    if edtSCCarNo.Text = '' then
    begin
      ShowMessage('차량번호를 입력하여주세요!');
      edtSCCarNo.SetFocus;
      Exit;
    end;

    with dmTables.qrySCSearch do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from CustInfo where CarNo like ' + MG_MakeStr
          ('%' + Trim(edtSCCarNo.Text) + '%'));
      Open;
    end;
  except
    on E: Exception do
      ExceptLogging('TfrmMainNew.btnSCClick: ' + aString(E.Message));
  end;
end;

procedure TfrmMainNew.btnSCOutClick(Sender: TObject);
var
  sResult, sTime, sTemp, sDspIP: aString;
  i: Byte;
begin
  try
    // 정기차량 수동출차
    for i := 1 to 10 do
    begin
      if RLpr[i].nUnitNo = nowLpr.Tag then
      begin
        sDspIP := RLpr[i].sDspIP;
        Break;
      end;
    end;
    sOutLprCarNo := sManualSCCarNo;
    sTime := FormatDateTime('YYYY-MM-DD HH:NN:SS', Now);
    sResult := RecvLprProc(sOutLprFile, sOutLprCarNo, '', '', sTime,
      nowLpr.Tag, 2, 3, 3, sDspIP, nowLpr, True);
    GridData(sResult);
    ClearFormData;
    btnSCOut.Enabled := False;
    dmTables.qrySCSearch.Close;
    pnSCSearch.Visible := False;
  except
    on E: Exception do
      ExceptLogging('TfrmMainNew.btnSCOutClick: ' + aString(E.Message));
  end;
end;

procedure TfrmMainNew.btnSCSearchClick(Sender: TObject);
begin
  sManualSCCarNo := '';
  edtSCCarNo.Text := '';
  btnSCOut.Enabled := False;
  pnSCSearch.Visible := True;
  edtSCCarNo.SetFocus;
  edtSCCarNo.SelectAll;
end;

procedure TfrmMainNew.btn10Click(Sender: TObject);
begin
  btnClick(btn10, mnuDC10);
end;

procedure TfrmMainNew.btn11Click(Sender: TObject);
begin
  btnClick(btn11, mnuDC11);
end;

procedure TfrmMainNew.btn12Click(Sender: TObject);
begin
  btnClick(btn12, mnuDC12);
end;

procedure TfrmMainNew.btn13Click(Sender: TObject);
begin
  btnClick(btn13, mnuDC13);
end;

procedure TfrmMainNew.btn14Click(Sender: TObject);
begin
  btnClick(btn14, mnuDC14);
end;

procedure TfrmMainNew.btn15Click(Sender: TObject);
begin
  btnClick(btn15, mnuDC15);
end;

procedure TfrmMainNew.btn16Click(Sender: TObject);
begin
  btnClick(btn16, mnuDC16);
end;

procedure TfrmMainNew.btn1Click(Sender: TObject);
begin
  btnClick(btn1, mnuDC1);
end;

procedure TfrmMainNew.btn2Click(Sender: TObject);
begin
  btnClick(btn2, mnuDC2);
end;

procedure TfrmMainNew.btn3Click(Sender: TObject);
begin
  btnClick(btn3, mnuDC3);
end;

procedure TfrmMainNew.btn4Click(Sender: TObject);
begin
  btnClick(btn4, mnuDC4);
end;

procedure TfrmMainNew.btn5Click(Sender: TObject);
begin
  btnClick(btn5, mnuDC5);
end;

procedure TfrmMainNew.btn6Click(Sender: TObject);
begin
  btnClick(btn6, mnuDC6);
end;

procedure TfrmMainNew.btn7Click(Sender: TObject);
begin
  btnClick(btn7, mnuDC7);
end;

procedure TfrmMainNew.btn8Click(Sender: TObject);
begin
  btnClick(btn8, mnuDC8);
end;

procedure TfrmMainNew.btn9Click(Sender: TObject);
begin
  btnClick(btn9, mnuDC9);
end;

procedure TfrmMainNew.btnCancelClick(Sender: TObject);
begin
  if bCancelCheck then
  begin
    if MessageDlg('정산을 취소할까요?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      if bCancelReason then
      begin
        // 정산취소 사유입력
        sCancelReason := InputBox('정산취소사유', '정산취소사유를 입력하여주세요!', '');
      end;

      if bCancelSave then
      begin
        // 정산취소 데이터 저장
        CancelDataProc;
      end;
      InspectionLog('정산취소');
      lblBujae.Caption := '';
      ClearFormData;
    end;
  end
  else
  begin
    if bCancelReason then
    begin
      // 정산취소 사유입력
      sCancelReason := InputBox('정산취소사유', '정산취소사유를 입력하여주세요!', '');
    end;

    if bCancelSave then
    begin
      // 정산취소 데이터 저장
      CancelDataProc;
    end;
    InspectionLog('정산취소');
    lblBujae.Caption := '';
    ClearFormData;
  end;
end;

procedure TfrmMainNew.btnClick(btn: TAdvShapeButton; mnu: TMenuItem);
var
  sYogum, sFeeName: aString;
  i: Byte;
begin
  try
    if btn.Tag = 255 then
    begin
      // 민원처리...
      MinwonProc(nowLpr);
      Exit;
    end
    else if btn.Tag > 100 then
    begin
      nProcYogum := StrToInt(MG_StrTrim(edtProcYogum.Text, ','));
      nDCYogum := StrToInt(MG_StrTrim(edtDCYogum.Text, ','));
      dcBtnClick(btn, mnu);
    end
    else
    begin
      ClearDCProc;
      lbDCName.Caption := '';

      for i := 1 to 15 do
      begin
        with frmMainNew do
        begin
          if TAdvShapeButton(FindComponent('btn' + IntToStr(i))).Tag > 100 then
          begin
            TAdvShapeButton(FindComponent('btn' + IntToStr(i))).Enabled := True;
            TMenuItem(FindComponent('mnuDC' + IntToStr(i))).Enabled := True;
          end;
        end;
      end;
      {
        nDCYogum:= 0;
        edtDCYogum.Text:= '0';
        edtDC.Text:= '';
        }

      if btn.Tag <> 0 then
      begin
        with dmTables.qryFeeItem do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Select * from FeeItem where ParkNo = :N1 and FeeNo = :N2');
          Parameters.ParamByName('N1').Value := nCurrParkNo;
          Parameters.ParamByName('N2').Value := btn.Tag;
          Open;

          if RecordCount > 0 then
          begin
            nFeeNo := btn.Tag;
            sFeeName := FieldByName('FeeName').AsString;
            nItemMax := FieldByName('ItemMax').AsInteger;
            nTotMax := FieldByName('TotMax').AsInteger;
          end
          else
          begin
            nFeeNo := 0;
            sFeeName := '';
            nItemMax := 0;
            nTotMax := 0;
          end;
          InspectionLog(sFeeName + ' 선택');
        end;

        {
          for i := 2 to 15 do
          begin
          with frmMainNew do
          begin
          if TAdvShapeButton(FindComponent('btn' + IntToStr(i))).Tag > 100 then
          begin
          TAdvShapeButton(FindComponent('btn' + IntToStr(i))).Enabled := False;
          TMenuItem(FindComponent('mnuDC' + IntToStr(i))).Enabled := False;
          end;
          end;
          end;
          }
      end
      else
      begin
        nFeeNo := 0;
        nItemMax := nItemMax0;
        nTotMax := nTotMax0;
        InspectionLog('일반요금 선택');

        {
          for i := 2 to 15 do
          begin
          with frmMainNew do
          begin
          if TAdvShapeButton(FindComponent('btn' + IntToStr(i))).Tag > 100 then
          begin
          TAdvShapeButton(FindComponent('btn' + IntToStr(i))).Enabled := False;
          TMenuItem(FindComponent('mnuDC' + IntToStr(i))).Enabled := False;
          end;
          end;
          end;
          }
      end;

      //주차요금 계산전에 기존 할인자료 등 클리어한다.
      for i := 1 to 50 do
        RDCCnt[i].nDCNowCnt := 0;

      ClearGTime;
      ClearDCProc;

//2018.01.09 AK프라자 로직 추가 시작//
      if not bApsPay then
      begin
        if bFreeTime then
        begin
          if sFreeTimeE > Copy(sNowInTime, 1, 5) then
            nTotYogum := FeeCalc(nCurrParkNo, nFeeNo, PAnsiChar(sNowInDate + ' ' + sFreeTimeE),
                                 PAnsiChar(Copy(aString(lbOutTime.Caption), 1, 16)))
          else
            nTotYogum := FeeCalc(nCurrParkNo, nFeeNo, PAnsiChar(sNowInDate + ' ' + Copy(sNowInTime, 1, 5)),
                                 PAnsiChar(Copy(aString(lbOutTime.Caption), 1, 16)));
        end
        else
          nTotYogum := FeeCalc(nCurrParkNo, nFeeNo, PAnsiChar(sNowInDate + ' ' + Copy(sNowInTime, 1, 5)),
                               PAnsiChar(Copy(aString(lbOutTime.Caption), 1, 16)));
      end
      else
      begin
        if bFreeTime then
        begin
          if sFreeTimeE > Copy(sAPSPayTime, 1, 5) then
            nTotYogum := FeeCalc(nCurrParkNo, nFeeNo, PAnsiChar(sAPSPayDate + ' ' + sFreeTimeE),
                                 PAnsiChar(Copy(aString(lbOutTime.Caption), 1, 16)))
          else
            nTotYogum := FeeCalc(nCurrParkNo, nFeeNo, PAnsiChar(sAPSPayDate + ' ' + Copy(sAPSPayTime, 1, 5)),
                                 PAnsiChar(Copy(aString(lbOutTime.Caption), 1, 16)));
        end
        else
        begin
          nTotYogum := FeeCalc(nCurrParkNo, nFeeNo, PAnsiChar(sAPSPayDate + ' ' + Copy(sAPSPayTime, 1, 5)),
                               PAnsiChar(Copy(aString(lbOutTime.Caption), 1, 16)));
        end;
      end;
      //2018.01.09 AK프라자 로직 추가 종료//
//      if bFreeTime then
//      begin
//        if sFreeTimeE > Copy(sNowInTime, 1, 5) then
//          nTotYogum := FeeCalc(nCurrParkNo, nFeeNo, PAnsiChar(Copy(aString(lbInTime.Caption), 1, 11) + sFreeTimeE),
//                               PAnsiChar(Copy(aString(lbOutTime.Caption), 1, 16)))
//        else
//          nTotYogum := FeeCalc(nCurrParkNo, nFeeNo, PAnsiChar(Copy(aString(lbInTime.Caption), 1, 16)),
//                               PAnsiChar(Copy(aString(lbOutTime.Caption), 1, 16)));
//      end
//      else
//        nTotYogum := FeeCalc(nCurrParkNo, nFeeNo, PAnsiChar(Copy(aString(lbInTime.Caption), 1, 16)),
//                             PAnsiChar(Copy(aString(lbOutTime.Caption), 1, 16)));
      nProcYogum := nTotYogum;
      edtTotYogum.Text := IntToStr(nTotYogum);
      edtTotYogum.AutoThousandSeparator := True;
      //edtProcYogum.Text := IntToStr(nTotYogum);
      edtProcYogum.Text := FormatFloat('#,##0', nTotYogum);
      //edtProcYogum.AutoThousandSeparator := True;
      InspectionLog('주차요금: ' + edtTotYogum.Text);
      sYogum := IntToStr(nTotYogum);

      //2018.01.09 AK프라자 로직 추가 시작//
      DCProcess(sNowInTKNo,sNowLprCarNo1);
      //2018.01.09 AK프라자 로직 추가 종료//
      sYogum := IntToStr(nTotYogum);

      for i := 1 to 6 do
        TLabel(FindComponent('lbYogum' + IntToStr(i))).Visible := False;

      for i := 1 to Length(sYogum) do
      begin
        TLabel(FindComponent('lbYogum' + IntToStr(i))).Visible := True;
        TLabel(FindComponent('lbYogum' + IntToStr(i))).Caption := Copy
          (sYogum, Length(sYogum) - (i - 1), 1);
      end;
    end;
  except
    on E: Exception do
      ExceptLogging('TfrmMainNew.btnClick: ' + aString(E.Message));
  end;
end;

procedure TfrmMainNew.FcModeChange(nMode: Byte);
begin
  try
    if nMode = 1 then
    begin
      //무인운영
      nFCMode:= 1;
      btnOp.Tag:= 1;
      btnOp.Font.Color:= clRed;
      btnOp.Caption:= '무인운영';
      iSetup.WriteInteger('PARKING', '유인운영', 0);
      with qryMainTemp do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Insert Into ProcData ');
        SQL.Add('(ParkNo, UnitNo, ProcDate, ProcTime, MNo ,ProcReason) ');
        SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6)');
        Parameters.ParamByName('N1').Value := nCurrParkNo;
        Parameters.ParamByName('N2').Value := nCurrUnitNo;
        Parameters.ParamByName('N3').Value := FormatDateTime('YYYY-MM-DD', Now);
        Parameters.ParamByName('N4').Value := FormatDateTime('HH:NN:SS', Now);
        Parameters.ParamByName('N5').Value := nCurrMNo;
        Parameters.ParamByName('N6').Value := '무인운영';
        ExecSQL;
      end;
      csOutDsp1.Active:= False;
    end
    else
    begin
      //유인운영
      nFCMode:= 0;
      btnOp.Tag:= 0;
      btnOp.Font.Color:= clBlue;
      btnOp.Caption:= '유인운영';
      if csOutDsp1.Active = false then
      begin
        csOutDsp1.Active := true;
      end;

      iSetup.WriteInteger('PARKING', '유인운영', 1);
      with qryMainTemp do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Insert Into ProcData ');
        SQL.Add('(ParkNo, UnitNo, ProcDate, ProcTime, MNo ,ProcReason) ');
        SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6)');
        Parameters.ParamByName('N1').Value := nCurrParkNo;
        Parameters.ParamByName('N2').Value := nCurrUnitNo;
        Parameters.ParamByName('N3').Value := FormatDateTime('YYYY-MM-DD', Now);
        Parameters.ParamByName('N4').Value := FormatDateTime('HH:NN:SS', Now);
        Parameters.ParamByName('N5').Value := nCurrMNo;
        Parameters.ParamByName('N6').Value := '유인운영';
        ExecSQL;
      end;
    end;
  except
    on E: Exception do ExceptLogging('FcModeChange: ' + aString(E.Message));
  end;
end;


function TfrmMainNew.FindNumber(Target: string): string;
var
 i, nCnt, dLen: Integer;
 dStr: string;
begin

  dLen := Length(Target);
  for i := 1 to dLen do begin
    if not(Target[i] in['0'..'9']) then Continue;

    for nCnt := i to dLen do begin
      if not(Target[nCnt] in['0'..'9']) then Continue;
      dStr := dStr + Target[nCnt];
    end;

    Result := dStr;
    Break;
  end;
end;

procedure TfrmMainNew.FormAlign;
begin
  pnlReceipt.Top := (frmMainNew.ClientHeight - pnlReceipt.Height) div 2;
  pnlReceipt.Left := (frmMainNew.ClientWidth - pnlReceipt.Width) div 2;
  pnModify.Top := (frmMainNew.ClientHeight - pnModify.Height) div 2;
  pnModify.Left := (frmMainNew.ClientWidth - pnModify.Width) div 2;
  pnManual.Top := (frmMainNew.ClientHeight - pnManual.Height) div 2;
  pnManual.Left := (frmMainNew.ClientWidth - pnManual.Width) div 2;
  pnManualOut.Top := (frmMainNew.ClientHeight - pnManualOut.Height) div 2;
  pnManualOut.Left := (frmMainNew.ClientWidth - pnManualOut.Width) div 2;
  pnLost.Top := (frmMainNew.ClientHeight - pnLost.Height) div 2;
  pnLost.Left := (frmMainNew.ClientWidth - pnLost.Width) div 2;
  pnBar.Top := (frmMainNew.ClientHeight - pnBar.Height) div 2;
  pnBar.Left := (frmMainNew.ClientWidth - pnBar.Width) div 2;
  pnSCSearch.Top := (frmMainNew.ClientHeight - pnSCSearch.Height) div 2;
  pnSCSearch.Left := (frmMainNew.ClientWidth - pnSCSearch.Width) div 2;
  pnManualProc.Top := (frmMainNew.ClientHeight - pnManualProc.Height) div 2;
  pnManualProc.Left := (frmMainNew.ClientWidth - pnManualProc.Width) div 2;
end;

procedure TfrmMainNew.PartGridData(sResult: String);
var
  sCarNo, sIOTime, sStatus, sTemp, sDate, sTime: String;
  nPos: Byte;
begin
  sCarNo := Copy(sResult, 2, Pos('^', sResult) - 2);
  sTemp := Copy(sResult, Pos('^', sResult) + 1, Length(sResult) -
      (Pos('^', sResult)));
  sIOTime := Copy(sTemp, 1, Pos('^', sTemp) - 1);
  sDate := Copy(sIOTime, 1, 10);
  sTime := Copy(sIOTime, 12, 8);
  nPos := Pos('^', sTemp);
  sStatus := Copy(sTemp, nPos + 1, Length(sTemp) - nPos);

  with sgIn do
  begin
    InsertRows(1, 1, True);
    Cells[0, 1] := '일반차량';
    Cells[1, 1] := sDate;
    Cells[2, 1] := sTime;
    Cells[3, 1] := sCarNo;
    Cells[4, 1] := '';
    Cells[5, 1] := '';
    Cells[6, 1] := '';
    Cells[7, 1] := sStatus;
  end;
  sgIn.Alignments[0, 1] := taCenter;
  sgIn.Alignments[1, 1] := taCenter;
  sgIn.Alignments[2, 1] := taCenter;
  sgIn.Alignments[3, 1] := taCenter;
  sgIn.Alignments[4, 1] := taCenter;
  sgIn.Alignments[5, 1] := taCenter;
  sgIn.Alignments[6, 1] := taCenter;
  sgIn.Alignments[7, 1] := taCenter;
  sgIn.RowColor[1] := clRed;
end;

procedure TfrmMainNew.NGridData(sResult: String);
var
  sCarNo, sIOTime, sStatus, sTemp, sDate, sTime: String;
  nPos, nIO: Byte;
begin
  if Length(sResult) > 4 then
  begin
    nIO := StrToInt(Copy(sResult, 1, 1));
    sCarNo := Copy(sResult, 2, Pos('^', sResult) - 2);
    sTemp := Copy(sResult, Pos('^', sResult) + 1, Length(sResult) -
        (Pos('^', sResult)));
    sIOTime := Copy(sTemp, 1, Pos('^', sTemp) - 1);
    sDate := Copy(sIOTime, 1, 10);
    sTime := Copy(sIOTime, 12, 8);
    nPos := Pos('^', sTemp);
    sStatus := Copy(sTemp, nPos + 1, Length(sTemp) - nPos);

    if nIO = 1 then
    begin
      with sgIn do
      begin
        InsertRows(1, 1, True);
        Cells[0, 1] := '일반차량';
        Cells[1, 1] := sDate;
        Cells[2, 1] := sTime;
        Cells[3, 1] := sCarNo;
        Cells[4, 1] := '';
        Cells[5, 1] := '';
        Cells[6, 1] := '';
        Cells[7, 1] := sStatus;
      end;
      sgIn.Alignments[0, 1] := taCenter;
      sgIn.Alignments[1, 1] := taCenter;
      sgIn.Alignments[2, 1] := taCenter;
      sgIn.Alignments[3, 1] := taCenter;
      sgIn.Alignments[4, 1] := taCenter;
      sgIn.Alignments[5, 1] := taCenter;
      sgIn.Alignments[6, 1] := taCenter;
      sgIn.Alignments[7, 1] := taCenter;
    end
    else
    begin
      with sgOut do
      begin
        InsertRows(1, 1, True);
        Cells[0, 1] := '일반차량';
        Cells[1, 1] := sDate;
        Cells[2, 1] := sTime;
        Cells[3, 1] := sCarNo;
        Cells[4, 1] := '';
        Cells[5, 1] := '';
        Cells[6, 1] := '';
        Cells[7, 1] := sStatus;
      end;
      sgOut.Alignments[0, 1] := taCenter;
      sgOut.Alignments[1, 1] := taCenter;
      sgOut.Alignments[2, 1] := taCenter;
      sgOut.Alignments[3, 1] := taCenter;
      sgOut.Alignments[4, 1] := taCenter;
      sgOut.Alignments[5, 1] := taCenter;
      sgOut.Alignments[6, 1] := taCenter;
      sgOut.Alignments[7, 1] := taCenter;
    end;
  end;
end;

procedure TfrmMainNew.GridData(sResult: String);
var
  sCarNo, sName, sCompName, sExpDate, sStatus, sTemp, sIODate, sIOTime: String;
  nPos, nIO: Byte;
begin
  if Length(sResult) > 6 then
  begin
    nIO := StrToInt(Copy(sResult, 1, 1));
    sIODate := Copy(sResult, 2, Pos('^', sResult) - 2);
    sTemp := Copy(sResult, Pos('^', sResult) + 1, Length(sResult) -
        (Pos('^', sResult)));
    sIOTime := Copy(sTemp, 1, Pos('^', sTemp) - 1);
    sTemp := Copy(sTemp, Pos('^', sTemp) + 1, Length(sTemp) - (Pos('^', sTemp))
      );
    sCarNo := Copy(sTemp, 1, Pos('^', sTemp) - 1);
    sTemp := Copy(sTemp, Pos('^', sTemp) + 1, Length(sTemp) - (Pos('^', sTemp))
      );
    sName := Copy(sTemp, 1, Pos('^', sTemp) - 1);
    sTemp := Copy(sTemp, Pos('^', sTemp) + 1, Length(sTemp) - (Pos('^', sTemp))
      );
    sCompName := Copy(sTemp, 1, Pos('^', sTemp) - 1);
    nPos := Pos('^', sTemp);
    sTemp := Copy(sTemp, nPos + 1, (Length(sTemp) - (nPos)) + 2);
    sExpDate := Copy(sTemp, 1, Pos('^', sTemp) - 1);
    nPos := Pos('^', sTemp);
    sStatus := Copy(sTemp, nPos + 1, Length(sTemp) - nPos);

    if nIO = 1 then
    begin
      with sgIn do
      begin
        InsertRows(1, 1, True);
        Cells[0, 1] := '정기차량';
        Cells[1, 1] := sIODate;
        Cells[2, 1] := sIOTime;
        Cells[3, 1] := sCarNo;
        Cells[4, 1] := sCompName;
        Cells[5, 1] := sName;
        Cells[6, 1] := sExpDate;
        Cells[7, 1] := sStatus;
      end;
      sgIn.Alignments[0, 1] := taCenter;
      sgIn.Alignments[1, 1] := taCenter;
      sgIn.Alignments[2, 1] := taCenter;
      sgIn.Alignments[3, 1] := taCenter;
      sgIn.Alignments[4, 1] := taCenter;
      sgIn.Alignments[5, 1] := taCenter;
      sgIn.Alignments[6, 1] := taCenter;
      sgIn.Alignments[7, 1] := taCenter;
    end
    else
    begin
      with sgOut do
      begin
        InsertRows(1, 1, True);
        Cells[0, 1] := '정기차량';
        Cells[1, 1] := sIODate;
        Cells[2, 1] := sIOTime;
        Cells[3, 1] := sCarNo;
        Cells[4, 1] := sCompName;
        Cells[5, 1] := sName;
        Cells[6, 1] := sExpDate;
        Cells[7, 1] := sStatus;
      end;
      sgOut.Alignments[0, 1] := taCenter;
      sgOut.Alignments[1, 1] := taCenter;
      sgOut.Alignments[2, 1] := taCenter;
      sgOut.Alignments[3, 1] := taCenter;
      sgOut.Alignments[4, 1] := taCenter;
      sgOut.Alignments[5, 1] := taCenter;
      sgOut.Alignments[6, 1] := taCenter;
      sgOut.Alignments[7, 1] := taCenter;
    end;
  end;
end;

procedure TfrmMainNew.WaitClear;
var
  i: Byte;
begin
  for i := 1 to 20 do
  begin
    RSCWait[i].sSCFile1 := '';
    RSCWait[i].sSCCarNo1 := '';
    RSCWait[i].sSCFile2 := '';
    RSCWait[i].sSCCarNo2 := '';
    RSCWait[i].sSCIOTime := '';
    RSCWait[i].nSCLprNo := 0;
    RSCWait[i].nSCInOut := 0;
    RSCWait[i].nSCRecog1 := 0;
    RSCWait[i].nSCRecog2 := 0;
    RSCWait[i].sSCDspIP := '';
    RSCWait[i].bBarOpen := False;
  end;

  for i := 1 to 20 do
  begin
    RNCInWait[i].sNCFile1 := '';
    RNCInWait[i].sNCCarNo1 := '';
    RNCInWait[i].sNCFile2 := '';
    RNCInWait[i].sNCCarNo2 := '';
    RNCInWait[i].sNCIOTime := '';
    RNCInWait[i].nNCLprNo := 0;
    RNCInWait[i].nNCInOut := 0;
    RNCInWait[i].nNCRecog1 := 0;
    RNCInWait[i].nNCRecog2 := 0;
    RNCInWait[i].sNCDspIP := '';
    RNCInWait[i].bBarOpen := False;

    RNCOutWait[i].sNCFile1 := '';
    RNCOutWait[i].sNCCarNo1 := '';
    RNCOutWait[i].sNCFile2 := '';
    RNCOutWait[i].sNCCarNo2 := '';
    RNCOutWait[i].sNCIOTime := '';
    RNCOutWait[i].nNCLprNo := 0;
    RNCOutWait[i].nNCInOut := 0;
    RNCOutWait[i].nNCRecog1 := 0;
    RNCOutWait[i].nNCRecog2 := 0;
    RNCOutWait[i].sNCDspIP := '';
    RNCOutWait[i].bBarOpen := False;
  end;
end;

procedure TfrmMainNew.WebDCDetail(nCnt: Integer);
var
  nTimeDC, // 시간할인시 할인된 금액.
  nPerDC, // 퍼센트할인시 할인된 금액.
  nJulsa, nValue, nTimeDC1: Integer;
  sName, sYogum, sUpche, sCheckDate: aString;
  i, nChk, nDCType: Byte;
begin
  try
//    sCheckDate:= MG_AddDate(sNowInDate, 1);
    with dmTables.qryDCTemp do begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from DCInfo where DCNo = :N1');
      Parameters.ParamByName('N1').Value:= RWebDCData[nCnt].nWebDCNo;
      Open;

      if RecordCount > 0 then begin
        nDCType:= FieldByName('DCType').AsInteger;
        sName:= FieldByName('DCName').AsString;
        nValue:= FieldByName('DCValue').AsInteger;
      end;
    end;
//    sName:= RWebDCData[nCnt].sWebDCName;
//    nValue:= RWebDCData[nCnt].nWebDCValue;
//    sUpChe:= RWebDCData[nCnt].sWebName;
    InspectionLog('웹할인: ' + IntToStr(RWebDCData[nCnt].nWebDCNo) + ', ' +
                               IntToStr(nValue) + ', ' +
                               sName );

      if nProcYogum > 0 then begin
        Case nDCType of
          0:
            begin // 금액할인.
              nDCCnt := nDCCnt + 1;

              if nProcYogum >= nValue then begin
                nProcYogum := nProcYogum - nValue;
                nJulsa := JulsaProc(nProcYogum);
                nProcYogum := nProcYogum - nJulsa;
                nDCYogum := nDCYogum + nValue;
                nDCYogum := nDCYogum + nJulsa;

                edtProcYogum.Text := FormatFloat('#,##0', nProcYogum);
                edtDCYogum.Text := IntToStr(nDCYogum);
                edtDCYogum.AutoThousandSeparator := True;
                sYogum := IntToStr(nProcYogum);

                for i := 1 to 6 do begin
                  with frmMainNew do
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Visible := False;
                end;

                for i := 1 to Length(sYogum) do begin
                  with frmMainNew do begin
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Visible := True;
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Caption := Copy(sYogum, Length(sYogum) - (i - 1), 1);
                  end;
                end;
                lbDCName.Caption := sName;

                with DCProc[nDCCnt] do begin
                  nDCNo := RWebDCData[nCnt].nWebDCNo;
                  sDCName := sName;
                  nDCAmt := nValue + nJulsa;
                  nRealDCAmt := nValue + nJulsa;
                  nDCType := 0;
                  bWeb := True;
                  nSeq := RWebDCData[nCnt].nSeq;
                  sSeq := RWebDCData[nCnt].sSeq;
                end;
              end else begin
                nDCYogum := nDCYogum + nProcYogum;
                edtDCYogum.Text := IntToStr(nDCYogum);
                edtDCYogum.AutoThousandSeparator := True;

                for i := 6 downto 2 do begin
                  with frmMainNew do begin
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Visible := False;
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Caption := '0';
                  end;
                end;
                lbYogum1.Caption := '0';
                lbDCName.Caption := sName;

                with DCProc[nDCCnt] do begin
                  nDCNo := RWebDCData[nCnt].nWebDCNo;
                  sDCName := sName;
                  nDCAmt := nValue;
                  nRealDCAmt := nProcYogum;
                  nDCType := 0;
                  bWeb := True;
                  nSeq := RWebDCData[nCnt].nSeq;
                  sSeq := RWebDCData[nCnt].sSeq;
                end;
                nProcYogum := 0;
                edtProcYogum.Text := '0';
              end;
            end;

          1:    { TODO  : 웹할인 - 시간할인 }
            begin // 시간할인.
              nDCCnt := nDCCnt + 1;
              sDCOutTime := MG_AddTime(sDCOutTime, 0, -nValue, 0, 0);

              nTimeDC := nProcYogum - FeeCalc(nCurrParkNo, nFeeNo, PAnsiChar(Copy(aString(lbInTime.Caption), 1, 16)),
                                                  PAnsiChar(Copy(sDCOutTime, 1, 16)));

              if nProcYogum >= nTimeDC then begin
                nProcYogum := nProcYogum - nTimeDC;
                nJulsa := JulsaProc(nProcYogum);
                nProcYogum := nProcYogum - nJulsa;
                nDCYogum := nDCYogum + nTimeDC;
                nDCYogum := nDCYogum + nJulsa;
                edtProcYogum.Text := FormatFloat('#,##0', nProcYogum);
                edtDCYogum.Text := IntToStr(nDCYogum);
                edtDCYogum.AutoThousandSeparator := True;
                sYogum := IntToStr(nProcYogum);

                for i := 1 to 6 do begin
                  with frmMainNew do
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Visible := False;
                end;

                for i := 1 to Length(sYogum) do begin
                  with frmMainNew do begin
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Visible := True;
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Caption :=
                      Copy(sYogum, Length(sYogum) - (i - 1), 1);
                  end;
                end;
                lbDCName.Caption := sName;

                with DCProc[nDCCnt] do begin
                  nDCNo := RWebDCData[nCnt].nWebDCNo;
                  sDCName := sName;
                  nDCAmt := nTimeDC + nJulsa;
                  nRealDCAmt := nTimeDC + nJulsa;
                  nDCType := 1;
                  bWeb := True;
                  nSeq := RWebDCData[nCnt].nSeq;
                  sSeq := RWebDCData[nCnt].sSeq;
                end;
              end else begin
                nDCYogum := nDCYogum + nTimeDC;
                edtDCYogum.Text := IntToStr(nDCYogum);
                edtDCYogum.AutoThousandSeparator := True;

                for i := 6 downto 2 do begin
                  with frmMainNew do begin
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Visible := False;
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Caption := '0';
                  end;
                end;
                lbYogum1.Caption := '0';
                lbDCName.Caption := sName;

                with DCProc[nDCCnt] do begin
                  nDCNo := RWebDCData[nCnt].nWebDCNo;
                  sDCName := sName;
                  nDCAmt := nTimeDC;
                  nRealDCAmt := nProcYogum;
                  nDCType := 1;
                  bWeb := True;
                  nSeq := RWebDCData[nCnt].nSeq;
                  sSeq := RWebDCData[nCnt].sSeq;
                end;
                nProcYogum := 0;
                edtProcYogum.Text := '0';
              end;
            end;

          2:
            begin // 퍼센트할인.
              nDCCnt := nDCCnt + 1;
              nPerDC := (nProcYogum * nValue) div 100;

              if nProcYogum >= nPerDC then begin
                nProcYogum := nProcYogum - nPerDC;
                nJulsa := JulsaProc(nProcYogum);
                nProcYogum := nProcYogum - nJulsa;
                nDCYogum := nDCYogum + nPerDC;
                nDCYogum := nDCYogum + nJulsa;
                edtProcYogum.Text := FormatFloat('#,##0', nProcYogum);
                edtDCYogum.Text := IntToStr(nDCYogum);
                edtDCYogum.AutoThousandSeparator := True;
                sYogum := IntToStr(nProcYogum);

                for i := 1 to 6 do begin
                  with frmMainNew do
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Visible := False;
                end;

                for i := 1 to Length(sYogum) do begin
                  with frmMainNew do begin
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Visible := True;
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Caption :=
                      Copy(sYogum, Length(sYogum) - (i - 1), 1);
                  end;
                end;
                lbDCName.Caption := sName;

                with DCProc[nDCCnt] do begin
                  nDCNo := RWebDCData[nCnt].nWebDCNo;
                  sDCName := sName;
                  nDCAmt := nPerDC + nJulsa;
                  nRealDCAmt := nPerDC + nJulsa;
                  nDCType := 2;
                  bWeb := True;
                  nSeq := RWebDCData[nCnt].nSeq;
                  sSeq := RWebDCData[nCnt].sSeq;
                end;
              end else begin
                nDCYogum := nDCYogum + nPerDC;
                edtDCYogum.Text := IntToStr(nDCYogum);
                edtDCYogum.AutoThousandSeparator := True;

                for i := 6 downto 2 do begin
                  with frmMainNew do begin
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Visible := False;
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Caption := '0';
                  end;
                end;
                lbYogum1.Caption := '0';
                lbDCName.Caption := sName;

                with DCProc[nDCCnt] do begin
                  nDCNo := RWebDCData[nCnt].nWebDCNo;
                  sDCName := sName;
                  nDCAmt := nPerDC;
                  nRealDCAmt := nProcYogum;
                  nDCType := 2;
                  bWeb := True;
                  nSeq := RWebDCData[nCnt].nSeq;
                  sSeq := RWebDCData[nCnt].sSeq;
                end;
                nProcYogum := 0;
                edtProcYogum.Text := '0';
              end;
            end;
        end;
        InspectionLog('웹할인요금: ' + edtDCYogum.Text);
        lbDCName.Caption:= '웹할인';
      end;
  except
    on E: Exception do ExceptLogging('TfrmMainNew.WebDCDetail: ' + aString(E.Message));
  end;
end;


procedure TfrmMainNew.WebDCProc(sWebDC: String);
var
  nTotCnt, nDCNo, nDCValue, nDCCnt,nParnas, i, j, nTemp1, nTemp2, nDiscountMoney: Integer;
  sTempWeb, sTemp, sDCName, sUpche, sWebInfo: String;
begin
  try
    i := 0;
    with dmTables.qryDCTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from tblstorediscountpublish where norkey = :N1 and DelYn = 0 and outYmd is null ');
      Parameters.ParamByName('N1').Value:= sWebDC;
      Open;
      if RecordCount >0 then
      begin
        bWebUse1 := True;
        while not Eof do
        begin
          i := i + 1;
//          ShowMessage(IntToStr(i));
          RWebDCData[i].nWebDCNo := StrToInt(trim(FieldByName('DiscountCode').AsString));
          RWebDCData[i].nWebDCValue := FieldByName('DiscountValue').AsInteger;
          RWebDCData[i].sWebDCMessage := FieldByName('DiscountName').AsString;
          RWebDCData[i].nWebDCType := FieldByName('DiscountType').AsInteger;
          RWebDCData[i].nSeq := i;
          RWebDCData[i].sSeq := FieldByName('Sequence').AsString;
          Next;
        end;
      end;
    end;

    nTotCnt:= i;
    if nTotCnt > 0 then
    begin
      for j := 1 to nTotCnt do
        WebDCDetail(j);
    end;
  except
    on E: Exception do ExceptLogging('TfrmMainNew.WebDCProc: ' + aString(E.Message));
  end;
end;

procedure TfrmMainNew.GridClear;
var
  i, j: Byte;
begin
  with sgIn do
  begin
    Cells[0, 0] := '차량종류';
    Cells[1, 0] := '입차일자';
    Cells[2, 0] := '입차시각';
    Cells[3, 0] := '차량번호';
    Cells[4, 0] := '회사명';
    Cells[5, 0] := '성명';
    Cells[6, 0] := '유효기간';
    Cells[7, 0] := '출입상태';

    for i := 1 to RowCount - 1 do
    begin
      for j := 0 to ColCount - 1 do
      begin
        Cells[j, i] := '';
      end;
    end;
  end;
  sgIn.Alignments[0, 0] := taCenter;
  sgIn.Alignments[1, 0] := taCenter;
  sgIn.Alignments[2, 0] := taCenter;
  sgIn.Alignments[3, 0] := taCenter;
  sgIn.Alignments[4, 0] := taCenter;
  sgIn.Alignments[5, 0] := taCenter;
  sgIn.Alignments[6, 0] := taCenter;
  sgIn.Alignments[7, 0] := taCenter;

  with sgOut do
  begin
    Cells[0, 0] := '차량종류';
    Cells[1, 0] := '출차일자';
    Cells[2, 0] := '출차시각';
    Cells[3, 0] := '차량번호';
    Cells[4, 0] := '회사명';
    Cells[5, 0] := '성명';
    Cells[6, 0] := '유효기간';
    Cells[7, 0] := '주차요금';

    for i := 1 to RowCount - 1 do
    begin
      for j := 0 to ColCount - 1 do
      begin
        Cells[j, i] := '';
      end;
    end;
  end;
  sgOut.Alignments[0, 0] := taCenter;
  sgOut.Alignments[1, 0] := taCenter;
  sgOut.Alignments[2, 0] := taCenter;
  sgOut.Alignments[3, 0] := taCenter;
  sgOut.Alignments[4, 0] := taCenter;
  sgOut.Alignments[5, 0] := taCenter;
  sgOut.Alignments[6, 0] := taCenter;
  sgOut.Alignments[7, 0] := taCenter;
end;

procedure TfrmMainNew.T_ProcClear;
begin
  with T_Proc do
  begin
    bHuilProc := False;
    bWEProc := False;
    sWESTTime := '';
    nDayMax := 0;
    nTotMax := 0;
    nNormalCnt := 0;
    nHolidayCnt := 0;
    nNowNDiv := 1;
    nNowHDiv := 1;
  end;
  nYogum := 0;
  sChkDateTime := '';
  sNextDateTime := '';
end;

procedure TfrmMainNew.ClearGTime;
begin
  with GTime do
  begin
    GT1 := '00:00';
    GT2 := '00:00';
    GT3 := '00:00';
    GT4 := '23:59';
    GT5 := '00:00';
    GT6 := '00:00';
    GT7 := '23:59';
    GT8 := '00:00';
    GT9 := 0;
  end;
end;

procedure TfrmMainNew.comScannerTriggerAvail(CP: TObject; Count: Word);
var
  sRecv, sTime: AnsiString;
  i: Integer;
  tTime: TDateTime;
  nTDUnitNo: Byte;
  nDCNo: Integer;
  sBarcodeData, sBarcodePosNo, sBarcodeSerialNo, sBarcodeIssueDate,  sBarcodeJumCode,   sBarcodeDeviceCode,
    sBarcodeDCType, sBarcodeDCAmt, sBarcodeDCName,sDCNo: aString;
  sTDTKNo, sTDTKDate, sTDTKTime,sShortCarNo: aString;
  nReturnVal : Integer;
begin
  try
    sRecv:= '';

    for i:= 1 to Count do
      sRecv:= sRecv + comScanner.GetChar;

    sBarcodeTK:= sBarcodeTK + sRecv;
    ExceptLogging('< 바코드 데이터 수신: ' + toHex(sBarcodeTK));

    if Pos(CR, sBarcodeTK) <= 0 then begin
//    if Pos(CR, sBarcodeTK) <= 0 then begin
      Exit;
    end;

    //바코드할인권은 13자리,  바코드주차권은 18자리
    //바코드할인권 기존 13자리에서 16자리로 변경
//    if Length(sBarcodeTK) < 13 then begin
    ShowMessage(IntToStr(Length(sBarcodeTK)));
    if Length(sBarcodeTK) < 17 then begin
        sBarcodeTK:= '';
        Exit;
    end;
    //바코드할인권...
    //16자리의 정의
    //예) 9913071601000002   -> 앞에 처음 두자리는 할인권 식별자며 99로 들어온 16자리 바코드는 할인권으로 간주함
    //                       -> 앞에서 세번쨰부터 1자리인 1은 장비코드 처리
    //                       -> 앞에서 네번째부터 2자리인 30은 할인코드 사용(01~99)
    //                       -> 앞에서 여섯번째자리 부터 6글자는 발행일자로 YYMMDD
    //                       -> 그 다음 다섯자리는 일련번호
    if Length(sBarcodeTK) = 17 then begin
      if not MG_NumberCheck(Copy(sBarcodeTK,1,16)) then
      begin
        ShowMessage('할인권 데이터 오류입니다.' + #13#10 + '할인권을 다시 읽혀주세요!');
        sBarcodeTK:= '';
        Exit;
      end;
      sBarcodeJumCode   := Copy(sBarcodeTK,  1, 2);
      sBarcodeDeviceCode:= Copy(sBarcodeTK,  3, 1);
      sDCNo             := Copy(sBarcodeTK,  4, 2);
      sBarcodeIssueDate := Copy(sBarcodeTK,  6, 6);
      sBarcodeSerialNo  := Copy(sBarcodeTK, 12, 5);
      sBarcodeData      := Copy(sBarcodeTK,  1,16);
      BarcodeProc1(sBarcodeJumCode, sBarcodeDeviceCode, sDCNo, sBarcodeIssueDate,sBarcodeSerialNo,sBarcodeData);
      sBarcodeTK:= '';
    end;
    //바코드할인권...
    //18자리의 정의
    //예) 911801220000010001   -> 앞에 처음 두자리는 할인권 식별자며 점코드로 해당 점코드와 같을경우 할인권으로 간주함
    //                         -> 앞에서 세번쨰부터 6자리인 180122은 포스처리일자를 뜻함
    //                         -> 앞에서 아홉번째부터 6자리인 000001은 포스번호 사용
    //                         -> 그 다음 네자리는 일련번호
    if Length(sBarcodeTK) = 19 then
    begin
      with qryBarcodeDC do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select * from PosData where BarCodeNo = :N1');
        Parameters.ParamByName('N1').Value := sBarcodeTK;
        Open;
        if RecordCount > 0 then
        begin
          ShowMessage('이미 적용된 할인권입니다.' + #13#10 + '확인하여주세요!');
          sBarcodeTK:= '';
          Exit;
        end;
      end;
      sBarcodeData        := Copy(sBarcodeTK  , 1, 18);
      sBarcodeJumCode     := Copy(sBarcodeData, 1,  2);
      sBarcodeIssueDate   := Copy(sBarcodeData, 3,  6);
      sBarcodePosNo       := Copy(sBarcodeData, 9,  6);
      sBarcodeSerialNo    := Copy(sBarcodeData,15,  4);
      if sBarcodeJumCode <> sJumCode then
      begin
        ShowMessage('할인권 데이터 오류입니다.' + #13#10 + '확인하여주세요!');
        sBarcodeTK:= '';
        Exit;
      end;
      if sBarcodeIssueDate <> FormatDateTime('YYMMDD', Now) then
      begin
        ShowMessage('할인권 데이터 오류입니다.' + #13#10 + '확인하여주세요!');
        sBarcodeTK:= '';
        Exit;
      end;
      if Copy(sBarcodeData,1,2) = sJumCode then
      begin
        sBarcodeJumCode     := Copy(sBarcodeData,  1, 2);
        sBarcodeIssueDate   := Copy(sBarcodeData,  3, 6);
        sBarcodePosNo       := Copy(sBarcodeData,  9, 6);
        sBarcodeSerialNo    := Copy(sBarcodeData, 15, 4);
        csAKPos.Address     := sAKPosIP;
        csAKPos.Port        := nAKPosPORT;
        csAKPos.Active      := True;
        sShortCarNo:= Copy(sNowLprCarNo1, Length(sNowLprCarNo1) -3, 4);
        nReturnVal := RequestAkPlaza(sBarcodeJumCode, sShortCarNo, sBarcodePosNo, sBarcodeSerialNo, sBarcodeIssueDate);
        if nReturnVal = 1 then
        begin
          ExceptLogging('AKPos 데이터 정상전달');
        end
        else
        begin
          ExceptLogging('AKPOS 데이터 전달실패');
        end;
        sBarcodeTK:= '';
      end
      else begin
        ShowMessage('할인권 데이터 오류입니다.' + #13#10 + '확인하여주세요!');
        sBarcodeTK:= '';
        Exit;
      end;
    end;
    sBarcodeTK:= '';
  except
    on E: Exception  do ExceptLogging('TfrmMainNew.comScannerTriggerAvail: ' + aString(E.Message));
  end;
end;


procedure TfrmMainNew.csAKPosConnect(Sender: TObject; Socket: TCustomWinSocket);
begin
  ExceptLogging('csAKPosConnect');
end;

procedure TfrmMainNew.csAKPosDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  ExceptLogging('csAKPosDisconnect');
end;

procedure TfrmMainNew.csAKPosError(Sender: TObject; Socket: TCustomWinSocket;
  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
   ExceptLogging('AKPos운영시스템 소켓 에러 : ' + IntToStr(ErrorCode));
//   csAKPos.Socket.Close;
//   FreeAndNil(csAKPos);
//   csAKPos := TClientSocket.Create(nil);
//   csAKPos.Address := sAKPosIP;
//   csAKPos.Port    := nAKPosPORT;
//   csAKPos.ClientType := ctNonBlocking;
//
//   csAKPos.OnConnect := csAKPosConnect;
//   csAKPos.OnDisconnect := csAKPosDisconnect;
//   csAKPos.OnError := csAKPosError;
//   csAKPos.OnRead := csAKPosRead;
//   csAKPos.Open;

   ErrorCode := 0;
end;

procedure TfrmMainNew.csAKPosRead(Sender: TObject; Socket: TCustomWinSocket);
var
 sAKPosRecv : string;
 sShortCarNo : aString;
 iReturnVal     : Integer;
  sHeader              //Header       : '0110'
, sTerminalID          //터미널ID     : 000 + 점코드(2자리)
, sRequestDate         //전문요청일   : 당일표출
, sRequestTime         //전문용청시간 : 당일시간
, sRespones_Code       //응답코드     :응답코드표에 따라 처리
, sStore               //점           : 점코드(2자리)
, sSale_Ymd            //포스거래일자 : YYMMDD
, sPos_No              //포스번호     : 6자리
, sReceipt_No          //영수증번호   : 4자리
, sCarNo               //차량번호     : 뒤에 4자리 앞에 나머지 자리는 스패이스로 채움
, sSale_Amt            //정산금액     : SPACE(10)자리
, sNormal              //정상/반품    : SPACE(2)자리
, sRemark  :string;    //비고         : SPACE(40)자리

begin
  sAKPosRecv := csAKPos.Socket.ReceiveText;
  ExceptLogging('csAKPosRead : 응답전문 [' + sAKPosRecv + ']');
  sHeader           := Copy(sAKPosRecv,1,4);
  sTerminalID       := Copy(sAKPosRecv,5,5);
  sRequestDate      := Copy(sAKPosRecv,10,8);
  sRequestTime      := Copy(sAKPosRecv,18,6);
  sRespones_Code    := Copy(sAKPosRecv,24,2);
  sStore            := Copy(sAKPosRecv,26,2);
  sSale_Ymd         := Copy(sAKPosRecv,28,6);
  sPos_No           := Copy(sAKPosRecv,34,6);
  sReceipt_No       := Copy(sAKPosRecv,40,4);
  sCarNo            := Copy(sAKPosRecv,44,9);
  sSale_Amt         := Copy(sAKPosRecv,53,10);
  sNormal           := Copy(sAKPosRecv,63,2);
  sRemark           := Copy(sAKPosRecv,65,40);

  if Length(sAKPosRecv) <> 104 then
  begin
    ExceptLogging('csAKPosRead : 응답전문길이 오류');
    csAKPos.Active := False;
    Exit;
  end;
  if sRespones_Code ='00' then
  begin
    with qryBarcodeDC do
    begin
      sShortCarNo:= Copy(sNowLprCarNo1, Length(sNowLprCarNo1) -3, 4);
  //    StringOfChar(' ', 9- Length(sShortCarNo)) + sShortCarNo;
      Close;
      SQL.Clear;
      Close;
      SQL.Clear;
      SQL.Add('Insert Into PosData ');
      SQL.Add('(JumCode, SaleDate, PosNumber, RECPT_No, CarNo, ProcDate, ProcTime, ProcAmt, BarCodeNo) ');
      SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9 ) ');
      Parameters.ParamByName('N1').Value := sStore;
      Parameters.ParamByName('N2').Value := sSale_Ymd;
      Parameters.ParamByName('N3').Value := sPos_No;
      Parameters.ParamByName('N4').Value := sReceipt_No;
      Parameters.ParamByName('N5').Value := sShortCarNo;
      Parameters.ParamByName('N6').Value := '20'+ Copy(sRequestDate,1,2) + '-'+  Copy(sRequestDate,3,2) + '-'+  Copy(sRequestDate,5,2) ;
      Parameters.ParamByName('N7').Value := Copy(sRequestTime,1,2) + ':'+  Copy(sRequestTime,3,2) + ':'+  Copy(sRequestTime,5,2) ;
      if sNormal ='01' then
      begin
        Parameters.ParamByName('N8').Value := StrToInt(sSale_Amt);
      end
      else if sNormal = '02' then
      begin
        Parameters.ParamByName('N8').Value := -(StrToInt(sSale_Amt));
      end
      else
      begin
        Parameters.ParamByName('N8').Value := 0;
      end;
      Parameters.ParamByName('N9').Value := sStore + sSale_Ymd + sPos_No + sReceipt_No;
      ExecSQL;
    end;
    btn1Click(Self);
  end
  else
  begin
    Label5.Caption:= '비정상데이터입니다.';
  end;
  csAKPos.Active := False;
end;


procedure TfrmMainNew.csApsConnect(Sender: TObject; Socket: TCustomWinSocket);
begin
  ExceptLogging('APS Connect');

  if sApsSendData <> '' then
  begin
    csAps.Socket.SendText(sApsSendData);
    ExceptLogging('운영모드 변경 전송: ' + sApsSendData);
    sApsSendData:= '';
  end;
end;

procedure TfrmMainNew.csApsDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  ExceptLogging('APS Disconnect');
end;

procedure TfrmMainNew.csApsError(Sender: TObject; Socket: TCustomWinSocket;
  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
  ExceptLogging('Aps SocketError: ' + IntToStr(ErrorCode));
  ErrorCode := 0;
end;

procedure TfrmMainNew.csApsRead(Sender: TObject; Socket: TCustomWinSocket);
var
  sRecv: aString;
begin
  //무인요금계산기에서 응답이 들어오면 운영모드를 변경한다...
  try
    sRecv:= Socket.ReceiveText;

    if Pos(STX, sRecv) > 0 then
      sApsRecv := sRecv
    else
      sApsRecv := sApsRecv + sRecv;

    if (Pos(STX, sApsRecv) <= 0) or (Pos(ETX, sApsRecv) <= 0) then
      Exit;

    ExceptLogging('무인정산기 수신 데이터: ' + sApsRecv);

    if sApsRecv = (STX + 'START OK' + ETX) then
    begin
      //무인운영
      FcModeChange(1);
    end
    else
    if sApsRecv = (STX + 'END OK' + ETX) then
    begin
      //유인운영
      FcModeChange(0);
    end;
  except
    on E: Exception do ExceptLogging('csApsRead: ' + aString(E.Message));
  end;
end;

procedure TfrmMainNew.csInDsp1Error(Sender: TObject; Socket: TCustomWinSocket;
  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
  ExceptLogging('csInDsp1Error: ' + IntToStr(ErrorCode));
  ErrorCode := 0;
end;

procedure TfrmMainNew.csInDsp2Error(Sender: TObject; Socket: TCustomWinSocket;
  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
  ExceptLogging('csInDsp2Error: ' + IntToStr(ErrorCode));
  ErrorCode := 0;
end;

procedure TfrmMainNew.csInDsp3Error(Sender: TObject; Socket: TCustomWinSocket;
  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
  ExceptLogging('csInDsp3Error: ' + IntToStr(ErrorCode));
  ErrorCode := 0;
end;

procedure TfrmMainNew.csInLpr1Error(Sender: TObject; Socket: TCustomWinSocket;
  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
    ExceptLogging('csInLpr1Error' + IntToStr(ErrorCode));
    ErrorCode := 0;
end;

procedure TfrmMainNew.csInLpr1Read(Sender: TObject; Socket: TCustomWinSocket);
var
  nNo: Word;
  sLprData, sLprIP, sDspIP: aString;
  csLPR: TClientSocket;
  sRecv: aString;
  i: Byte;
  sCarNo1, sCarNo2, sTime, sTemp, sResult, sTest, sDir, sLocal1,
    sLocal2: String;
  sFile1, sFile2, sImgFile1, sImgFile2: String;
  nRecog1, nRecog2, nIO: Byte;
  hr: HRESULT;
  sSend: aString;
begin
  try
    tInAlive1.Enabled := False;
    sRecv := Socket.ReceiveText;
    sInLPRRecv1 := sRecv;
    ExceptLogging('LPR' + IntToStr(csInLpr1.Tag) + ' Recv: ' + sInLPRRecv1);

    if Length(sInLPRRecv1) > 15 then
    begin
      for i := 1 to 10 do
      begin
        if RLpr[i].nUnitNo = csInLpr1.Tag then
        begin
          sDspIP := RLpr[i].sDspIP;
          Break;
        end;
      end;

      nNo := csInLpr1.Tag;
      sLprData := sInLPRRecv1;
      sLprIP := csInLpr1.Host;
      sDspIP := sDspIP;
      csLPR := csInLpr1;

      try
        sCarNo1 := '';
        sCarNo2 := '';
        sFile1 := '';
        sFile2 := '';
        nRecog1 := 0;
        nRecog2 := 0;

        // NW, NP, UP가 올 경우는 차단기를 오픈하지 않는다. 2012-06-15...
        bInBarOpen1 := False;

        if Copy(sLprData, 1, 2) = 'NW' then
        begin
          // 후면촬영결과가 전면촬영차량과 다르다. (새로운 차량이다)
          // NW제거
          sTemp := Copy(sLprData, Pos('#', sLprData) + 1, Length(sLprData) - Pos
              ('#', sLprData));

          // CH제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 차량번호 추출
          sCarNo1 := Copy(sTemp, 1, Pos('#', sTemp) - 1);

          // 차량번호제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 인식여부 추출
          if (Copy(sTemp, 1, 1) = 'N') or (Copy(sTemp, 1, 1) = 'O') then
            nRecog1 := 1
          else if Copy(sTemp, 1, 1) = 'P' then
            nRecog1 := 2
          else
            nRecog1 := 3;

          sFile1 := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));
          sLocal1 := Copy(sFile1, Pos('CH', sFile1), Length(sFile1) -
              (Pos('CH', sFile1) - 1));
          sTime := MG_StrToStr(Copy(sFile1, Pos('_', sFile1) + 1, 14),
            '####-##-## ##:##:##');

          // 인식여부제거하여 파일명 추출
          sFile1 := 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr
            (sFile1, '\', '/');
        end
        else if Copy(sLprData, 1, 2) = 'UP' then
        begin
          // 오인식으로 전면과 후면촬영결과가 다르다...
          // 이때는 CarNo1과 CarNo2, Image1, Image2를 구분하여 넣는다.
          // 전면차량번호와 입차일시를 가지고 DB검색하여 CarNo2와 Image2를 업데이트한다.

          // UP제거
          sTemp := Copy(sLprData, Pos('#', sLprData) + 1, Length(sLprData) - Pos
              ('#', sLprData));

          // CH제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 차량번호1 추출
          sCarNo1 := Copy(sTemp, 1, Pos('#', sTemp) - 1);

          // 차량번호1제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 인식여부1 추출
          if (Copy(sTemp, 1, 1) = 'N') or (Copy(sTemp, 1, 1) = 'O') then
            nRecog1 := 1
          else if Copy(sTemp, 1, 1) = 'P' then
            nRecog1 := 2
          else
            nRecog1 := 3;

          // 인식여부1제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 파일명1 추출
          sFile1 := Copy(sTemp, 1, Pos('#', sTemp) - 1); // Copy(sTemp, Pos('#', sTemp)+1, Length(sTemp)-Pos('#', sTemp));
          sLocal1 := Copy(sFile1, Pos('CH', sFile1), Length(sFile1) -
              (Pos('CH', sFile1) - 1));
          sTime := MG_StrToStr(Copy(sFile1, Pos('_', sFile1) + 1, 14),
            '####-##-## ##:##:##');

          // 인식여부제거하여 파일명 추출
          sFile1 := 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr
            (sFile1, '\', '/');

          // 파일명1제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // CH제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 차량번호2 추출
          sCarNo2 := Copy(sTemp, 1, Pos('#', sTemp) - 1);

          // 차량번호2제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 인식여부2 추출
          if (Copy(sTemp, 1, 1) = 'N') or (Copy(sTemp, 1, 1) = 'O') then
            nRecog2 := 1
          else if Copy(sTemp, 1, 1) = 'P' then
            nRecog2 := 2
          else
            nRecog2 := 3;

          sLocal2 := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));
          sLocal2 := Copy(sLocal2, Pos('CH', sLocal2), Length(sLocal2) -
              (Pos('CH', sLocal2) - 1));

          // 인식여부2제거하여 파일명2 추출
          sFile2 := 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr
            (Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos('#', sTemp)),
            '\', '/');

          with dmTables.qryRecvInLPR1 do
          begin
            Close;
            SQL.Clear;
            SQL.Add(
              'Select * from IONData where ProcDate = :N1 and ProcTime = :N2 and InCarNo1 = :N3');
            Parameters.ParamByName('N1').Value := Copy(sTime, 1, 10);
            Parameters.ParamByName('N2').Value := Copy(sTime, 12, 8);
            Parameters.ParamByName('N3').Value := sCarNo1;
            Open;

            if RecordCount > 0 then
            begin
              Close;
              SQL.Clear;
              SQL.Add(
                'Update IONData Set InCarNo2 = :N1, InImage2 = :N2, InRecog2 = :N6 ');
              SQL.Add(
                'where ProcDate = :N3 and ProcTime = :N4 and InCarNo1 = :N5');
              Parameters.ParamByName('N1').Value := sCarNo2;
              Parameters.ParamByName('N2').Value := sFile2;
              Parameters.ParamByName('N3').Value := Copy(sTime, 1, 10);
              Parameters.ParamByName('N4').Value := Copy(sTime, 12, 8);
              Parameters.ParamByName('N5').Value := sCarNo1;
              Parameters.ParamByName('N6').Value := nRecog2;
              ExecSQL;
            end;
          end;
          //Exit;
        end
        else if Copy(sLprData, 1, 2) = 'NP' then
        begin
          // 전면촬영된 차량과 후면촬영된 차량이 다르다.
          // 이때는 CarNo2를 개별차량으로 하여 신규입차처리한다.
          // CarNo2, File2, Recog2, Time2 로 신규입차 처리.

          // NP제거
          sTemp := Copy(sLprData, Pos('#', sLprData) + 1, Length(sLprData) - Pos
              ('#', sLprData));

          // CH제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 차량번호1 추출
          sCarNo1 := Copy(sTemp, 1, Pos('#', sTemp) - 1);

          // 차량번호1제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 인식여부1 추출
          if (Copy(sTemp, 1, 1) = 'N') or (Copy(sTemp, 1, 1) = 'O') then
            nRecog1 := 1
          else if Copy(sTemp, 1, 1) = 'P' then
            nRecog1 := 2
          else
            nRecog1 := 3;

          // 인식여부1제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 파일명1 추출
          sFile1 := Copy(sTemp, 1, Pos('#', sTemp) - 1); // Copy(sTemp, Pos('#', sTemp)+1, Length(sTemp)-Pos('#', sTemp));
          sLocal1 := Copy(sFile1, Pos('CH', sFile1), Length(sFile1) -
              (Pos('CH', sFile1) - 1));
          sTime := MG_StrToStr(Copy(sFile1, Pos('_', sFile1) + 1, 14),
            '####-##-## ##:##:##');

          // 인식여부제거하여 파일명 추출
          sFile1 := 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr
            (sFile1, '\', '/');

          // 파일명1제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // CH제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 차량번호2 추출
          sCarNo2 := Copy(sTemp, 1, Pos('#', sTemp) - 1);

          // 차량번호2제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 인식여부2 추출
          if (Copy(sTemp, 1, 1) = 'N') or (Copy(sTemp, 1, 1) = 'O') then
            nRecog2 := 1
          else if Copy(sTemp, 1, 1) = 'P' then
            nRecog2 := 2
          else
            nRecog2 := 3;

          sLocal2 := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));
          sLocal2 := Copy(sLocal2, Pos('CH', sLocal2), Length(sLocal2) -
              (Pos('CH', sLocal2) - 1));
          sFile2 := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));
          sTime := MG_StrToStr(Copy(sFile2, Pos('_', sFile2) + 1, 14),
            '####-##-## ##:##:##');

          // 인식여부2제거하여 파일명2 추출
          sFile2 := 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr
            (sFile2, '\', '/');
          sCarNo1 := sCarNo2;
          sFile1 := sFile2;
          nRecog1 := nRecog2;
          sLocal1 := sLocal2;
          sCarNo2 := '';
          sFile2 := '';
          nRecog2 := 0;
          sLocal2 := '';
        end
        else
        begin
          bInBarOpen1 := True;

          // CH제거
          sTemp := Copy(sLprData, Pos('#', sLprData) + 1, Length(sLprData) - Pos
              ('#', sLprData));

          // 차량번호 추출
          sCarNo1 := Copy(sTemp, 1, Pos('#', sTemp) - 1);

          // 차량번호제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 인식여부 추출
          if (Copy(sTemp, 1, 1) = 'N') or (Copy(sTemp, 1, 1) = 'O') then
            nRecog1 := 1
          else if Copy(sTemp, 1, 1) = 'P' then
            nRecog1 := 2
          else
            nRecog1 := 3;

          // 인식여부제거하여 파일명 추출
          sFile1 := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));
          sLocal1 := Copy(sFile1, Pos('CH', sFile1), Length(sFile1) -
              (Pos('CH', sFile1) - 1));
          sTime := MG_StrToStr(Copy(sFile1, Pos('_', sFile1) + 1, 14),
            '####-##-## ##:##:##');

          // 인식여부제거하여 파일명 추출
          sFile1 := 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr
            (sFile1, '\', '/');
        end;
        ExceptLogging('LPR Check: ' + sCarNo1 + ',' + sFile1 + ',' + IntToStr
            (nRecog1) + ',' + sCarNo2 + ',' + sFile2 + ',' + IntToStr(nRecog2)
            + ', ' + sTime);
        sDir := sImageDir + '\' + Copy(sTime, 1, 4) + '\' + Copy(sTime, 6, 2)
          + '\' + Copy(sTime, 9, 2) + '\' + IntToStr(nNo);

        if not DirectoryExists(sDir) then
        begin
          if not ForceDirectories(sDir) then
            ExceptLogging('이미지저장폴더 생성실패: ' + sDir);
        end;

        sImgFile1 := sDir + '\' + sLocal1;
        sImgFile2 := sDir + '\' + sLocal2;

        if sFile1 <> '' then
        begin
          sTemp := Copy(sFile1, 6, Length(sFile1) - 5);
          sImgFile1 := Copy(sTemp, 1, Pos(':9080', sTemp) - 1);
          sImgFile1 := sImgFile1 + Copy(sTemp, Pos(':9080', sTemp) + 5, Length
              (sTemp) - (Pos(':9080', sTemp) + 4));
          sImgFile1 := MG_StrConvert(sImgFile1, '/', '\');
          ExceptLogging('File: ' + sImgFile1);
        end;

        if sFile2 <> '' then
        begin
          sTemp := Copy(sFile2, 6, Length(sFile2) - 5);
          sImgFile2 := Copy(sTemp, 1, Pos(':9080', sTemp) - 1);
          sImgFile2 := sImgFile2 + Copy(sTemp, Pos(':9080', sTemp) + 5, Length
              (sTemp) - (Pos(':9080', sTemp) + 4));
          sImgFile2 := MG_StrConvert(sImgFile2, '/', '\');
          ExceptLogging('File: ' + sImgFile2);
        end;

        for i := 1 to 10 do
        begin
          if RLpr[i].nUnitNo = nNo then
            nIO := RLpr[i].nIO;
        end;

        with dmTables.qryInLpr1Proc do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Select * from CustInfo ');

          if sCarNo2 <> '' then
          begin
            SQL.Add('where ((CarNo = :N1) or (CarNo = :N2)) and ((ExpDateF <= :N3) and (ExpDateT >= :N4)) and TKType = 2');
            SQL.Add(' order by GroupNo desc ');
            Parameters.ParamByName('N1').Value := sCarNo1;
            Parameters.ParamByName('N2').Value := sCarNo2;
            Parameters.ParamByName('N3').Value := FormatDateTime('YYYY-MM-DD', Now);
            Parameters.ParamByName('N4').Value := FormatDateTime('YYYY-MM-DD', Now);
            Open;
          end
          else
          if sCarNo1 <> '' then
          begin
            SQL.Add('where (CarNo = :N1) and ((ExpDateF <= :N3) and (ExpDateT >= :N4)) and TKType = 2');
            SQL.Add(' order by GroupNo desc ');
            Parameters.ParamByName('N1').Value := sCarNo1;
            Parameters.ParamByName('N3').Value := FormatDateTime('YYYY-MM-DD', Now);
            Parameters.ParamByName('N4').Value := FormatDateTime('YYYY-MM-DD', Now);
            Open;
          end;

          if RecordCount > 0 then
          begin
            // 등록된 정기차량이면...
            // 유효기간이 만료되지 않은 사용가능한 정기차량이면...
            if bSCProcWait then
            begin
              if nSCWaitPoint = 20 then
                nSCWaitPoint := 1
              else
                nSCWaitPoint := nSCWaitPoint + 1;

              RSCWait[nSCWaitPoint].sSCFile1 := sFile1;
              RSCWait[nSCWaitPoint].sSCCarNo1 := sCarNo1;
              RSCWait[nSCWaitPoint].sSCFile2 := sFile2;
              RSCWait[nSCWaitPoint].sSCCarNo2 := sCarNo2;
              RSCWait[nSCWaitPoint].sSCIOTime := sTime;
              RSCWait[nSCWaitPoint].nSCLprNo := nNo;
              RSCWait[nSCWaitPoint].nSCInOut := nIO;
              RSCWait[nSCWaitPoint].nSCRecog1 := nRecog1;
              RSCWait[nSCWaitPoint].nSCRecog2 := nRecog2;
              RSCWait[nSCWaitPoint].sSCDspIP := sDspIP;
              RSCWait[nSCWaitPoint].csSCLPR := csLPR;
              RSCWait[nSCWaitPoint].bBarOpen := bInBarOpen1;

              if not tSCWait.Enabled then
                tSCWait.Enabled := True;
            end
            else
            begin
              sResult := RecvLprProc(sFile1, sCarNo1, sFile2, sCarNo2, sTime,
                nNo, nIO, nRecog1, nRecog2, sDspIP, csLPR, bInBarOpen1);

              // 입차시의 이미지는 표시하지 않는다.  2012-05-07 UI 관련 미팅시 송우식 과장...
              // 일반차량 출차시 출차이미지와 함께 입차이미지를 표시한다....
              GridData(sResult);
            end;
          end
          else
          begin
            // 일반차량 처리...
            if nIO = 1 then
            begin
              if bNCInProcWait then
              begin
                if nNCInWaitPoint = 20 then
                  nNCInWaitPoint := 1
                else
                  nNCInWaitPoint := nNCInWaitPoint + 1;

                RNCInWait[nNCInWaitPoint].sNCFile1 := sFile1;
                RNCInWait[nNCInWaitPoint].sNCCarNo1 := sCarNo1;
                RNCInWait[nNCInWaitPoint].sNCFile2 := sFile2;
                RNCInWait[nNCInWaitPoint].sNCCarNo2 := sCarNo2;
                RNCInWait[nNCInWaitPoint].sNCIOTime := sTime;
                RNCInWait[nNCInWaitPoint].nNCLprNo := nNo;
                RNCInWait[nNCInWaitPoint].nNCInOut := nIO;
                RNCInWait[nNCInWaitPoint].nNCRecog1 := nRecog1;
                RNCInWait[nNCInWaitPoint].nNCRecog2 := nRecog2;
                RNCInWait[nNCInWaitPoint].sNCDspIP := sDspIP;
                RNCInWait[nNCInWaitPoint].csNCLPR := csLPR;
                RNCInWait[nNCInWaitPoint].bBarOpen := bInBarOpen1;

                if not tNCInWait.Enabled then
                  tNCInWait.Enabled := True;
              end
              else
              begin
                NormalProc(sFile1, sCarNo1, sFile2, sCarNo2, sTime, nNo, nIO,
                  nRecog1, nRecog2, sDspIP, csLPR, bInBarOpen1);
              end;
            end
            else if nIO = 2 then
            begin
              if bNCOutProcWait then
              begin
                if nNCOutWaitPoint = 20 then
                  nNCOutWaitPoint := 1
                else
                  nNCOutWaitPoint := nNCOutWaitPoint + 1;

                RNCOutWait[nNCOutWaitPoint].sNCFile1 := sFile1;
                RNCOutWait[nNCOutWaitPoint].sNCCarNo1 := sCarNo1;
                RNCOutWait[nNCOutWaitPoint].sNCFile2 := sFile2;
                RNCOutWait[nNCOutWaitPoint].sNCCarNo2 := sCarNo2;
                RNCOutWait[nNCOutWaitPoint].sNCIOTime := sTime;
                RNCOutWait[nNCOutWaitPoint].nNCLprNo := nNo;
                RNCOutWait[nNCOutWaitPoint].nNCInOut := nIO;
                RNCOutWait[nNCOutWaitPoint].nNCRecog1 := nRecog1;
                RNCOutWait[nNCOutWaitPoint].nNCRecog2 := nRecog2;
                RNCOutWait[nNCOutWaitPoint].sNCDspIP := sDspIP;
                RNCOutWait[nNCOutWaitPoint].csNCLPR := csLPR;
                RNCOutWait[nNCOutWaitPoint].bBarOpen := True;

                if not tNCOutWait.Enabled then
                  tNCOutWait.Enabled := True;
              end
              else
              begin
                NormalProc(sFile1, sCarNo1, sFile2, sCarNo2, sTime, nNo, nIO,
                  nRecog1, nRecog2, sDspIP, csLPR, True);
              end;
            end;
          end;
        end;
      except
        on E: Exception do
          ExceptLogging('csInLpr1Read: ' + aString(E.Message));
      end;
    end
    else
    begin
      if sInLPRRecv1 = 'LPR_R' then
      begin
        Socket.SendText(aString('TIME' + FormatDateTime('YYYYMMDDHHNNSS', Now))
          );
        ExceptLogging('시간동기화 전송');
      end;
    end;
    sInLPRRecv1 := '';
  finally
    tInAlive1.Enabled := True;
  end;
end;

procedure TfrmMainNew.csInLpr2Read(Sender: TObject; Socket: TCustomWinSocket);
var
  nNo: Word;
  sLprData, sLprIP, sDspIP: aString;
  csLPR: TClientSocket;
  sRecv: aString;
  i: Byte;
  sCarNo1, sCarNo2, sTime, sTemp, sResult, sTest, sDir, sLocal1,
    sLocal2: String;
  sFile1, sFile2, sImgFile1, sImgFile2: String;
  nRecog1, nRecog2, nIO: Byte;
  hr: HRESULT;
  sSend: aString;
begin
  try
    tInAlive2.Enabled := False;
    sRecv := Socket.ReceiveText;
    sInLPRRecv2 := sRecv;
    ExceptLogging('LPR' + IntToStr(csInLpr2.Tag) + ' Recv: ' + sInLPRRecv2);

    if Length(sInLPRRecv2) > 15 then
    begin
      for i := 1 to 10 do
      begin
        if RLpr[i].nUnitNo = csInLpr2.Tag then
        begin
          sDspIP := RLpr[i].sDspIP;
          Break;
        end;
      end;

      nNo := csInLpr2.Tag;
      sLprData := sInLPRRecv2;
      sLprIP := csInLpr2.Host;
      sDspIP := sDspIP;
      csLPR := csInLpr2;

      try
        sCarNo1 := '';
        sCarNo2 := '';
        sFile1 := '';
        sFile2 := '';
        nRecog1 := 0;
        nRecog2 := 0;

        // NW, NP, UP가 올 경우는 차단기를 오픈하지 않는다. 2012-06-15...
        bInBarOpen2 := False;

        if Copy(sLprData, 1, 2) = 'NW' then
        begin
          // 후면촬영결과가 전면촬영차량과 다르다. (새로운 차량이다)
          // NW제거
          sTemp := Copy(sLprData, Pos('#', sLprData) + 1, Length(sLprData) - Pos
              ('#', sLprData));

          // CH제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 차량번호 추출
          sCarNo1 := Copy(sTemp, 1, Pos('#', sTemp) - 1);

          // 차량번호제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 인식여부 추출
          if (Copy(sTemp, 1, 1) = 'N') or (Copy(sTemp, 1, 1) = 'O') then
            nRecog1 := 1
          else if Copy(sTemp, 1, 1) = 'P' then
            nRecog1 := 2
          else
            nRecog1 := 3;

          sFile1 := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));
          sLocal1 := Copy(sFile1, Pos('CH', sFile1), Length(sFile1) -
              (Pos('CH', sFile1) - 1));
          sTime := MG_StrToStr(Copy(sFile1, Pos('_', sFile1) + 1, 14),
            '####-##-## ##:##:##');

          // 인식여부제거하여 파일명 추출
          sFile1 := 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr
            (sFile1, '\', '/');
        end
        else if Copy(sLprData, 1, 2) = 'UP' then
        begin
          // 오인식으로 전면과 후면촬영결과가 다르다...
          // 이때는 CarNo1과 CarNo2, Image1, Image2를 구분하여 넣는다.
          // 전면차량번호와 입차일시를 가지고 DB검색하여 CarNo2와 Image2를 업데이트한다.

          // UP제거
          sTemp := Copy(sLprData, Pos('#', sLprData) + 1, Length(sLprData) - Pos
              ('#', sLprData));

          // CH제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 차량번호1 추출
          sCarNo1 := Copy(sTemp, 1, Pos('#', sTemp) - 1);

          // 차량번호1제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 인식여부1 추출
          if (Copy(sTemp, 1, 1) = 'N') or (Copy(sTemp, 1, 1) = 'O') then
            nRecog1 := 1
          else if Copy(sTemp, 1, 1) = 'P' then
            nRecog1 := 2
          else
            nRecog1 := 3;

          // 인식여부1제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 파일명1 추출
          sFile1 := Copy(sTemp, 1, Pos('#', sTemp) - 1); // Copy(sTemp, Pos('#', sTemp)+1, Length(sTemp)-Pos('#', sTemp));
          sLocal1 := Copy(sFile1, Pos('CH', sFile1), Length(sFile1) -
              (Pos('CH', sFile1) - 1));
          sTime := MG_StrToStr(Copy(sFile1, Pos('_', sFile1) + 1, 14),
            '####-##-## ##:##:##');

          // 인식여부제거하여 파일명 추출
          sFile1 := 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr
            (sFile1, '\', '/');

          // 파일명1제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // CH제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 차량번호2 추출
          sCarNo2 := Copy(sTemp, 1, Pos('#', sTemp) - 1);

          // 차량번호2제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 인식여부2 추출
          if (Copy(sTemp, 1, 1) = 'N') or (Copy(sTemp, 1, 1) = 'O') then
            nRecog2 := 1
          else if Copy(sTemp, 1, 1) = 'P' then
            nRecog2 := 2
          else
            nRecog2 := 3;

          sLocal2 := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));
          sLocal2 := Copy(sLocal2, Pos('CH', sLocal2), Length(sLocal2) -
              (Pos('CH', sLocal2) - 1));

          // 인식여부2제거하여 파일명2 추출
          sFile2 := 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr
            (Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos('#', sTemp)),
            '\', '/');

          with dmTables.qryRecvInLPR2 do
          begin
            Close;
            SQL.Clear;
            SQL.Add(
              'Select * from IONData where ProcDate = :N1 and ProcTime = :N2 and InCarNo1 = :N3');
            Parameters.ParamByName('N1').Value := Copy(sTime, 1, 10);
            Parameters.ParamByName('N2').Value := Copy(sTime, 12, 8);
            Parameters.ParamByName('N3').Value := sCarNo1;
            Open;

            if RecordCount > 0 then
            begin
              Close;
              SQL.Clear;
              SQL.Add(
                'Update IONData Set InCarNo2 = :N1, InImage2 = :N2, InRecog2 = :N6 ');
              SQL.Add(
                'where ProcDate = :N3 and ProcTime = :N4 and InCarNo1 = :N5');
              Parameters.ParamByName('N1').Value := sCarNo2;
              Parameters.ParamByName('N2').Value := sFile2;
              Parameters.ParamByName('N3').Value := Copy(sTime, 1, 10);
              Parameters.ParamByName('N4').Value := Copy(sTime, 12, 8);
              Parameters.ParamByName('N5').Value := sCarNo1;
              Parameters.ParamByName('N6').Value := nRecog2;
              ExecSQL;
            end;
          end;
          Exit;
        end
        else if Copy(sLprData, 1, 2) = 'NP' then
        begin
          // 전면촬영된 차량과 후면촬영된 차량이 다르다.
          // 이때는 CarNo2를 개별차량으로 하여 신규입차처리한다.
          // CarNo2, File2, Recog2, Time2 로 신규입차 처리.

          // NP제거
          sTemp := Copy(sLprData, Pos('#', sLprData) + 1, Length(sLprData) - Pos
              ('#', sLprData));

          // CH제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 차량번호1 추출
          sCarNo1 := Copy(sTemp, 1, Pos('#', sTemp) - 1);

          // 차량번호1제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 인식여부1 추출
          if (Copy(sTemp, 1, 1) = 'N') or (Copy(sTemp, 1, 1) = 'O') then
            nRecog1 := 1
          else if Copy(sTemp, 1, 1) = 'P' then
            nRecog1 := 2
          else
            nRecog1 := 3;

          // 인식여부1제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 파일명1 추출
          sFile1 := Copy(sTemp, 1, Pos('#', sTemp) - 1); // Copy(sTemp, Pos('#', sTemp)+1, Length(sTemp)-Pos('#', sTemp));
          sLocal1 := Copy(sFile1, Pos('CH', sFile1), Length(sFile1) -
              (Pos('CH', sFile1) - 1));
          sTime := MG_StrToStr(Copy(sFile1, Pos('_', sFile1) + 1, 14),
            '####-##-## ##:##:##');

          // 인식여부제거하여 파일명 추출
          sFile1 := 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr
            (sFile1, '\', '/');

          // 파일명1제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // CH제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 차량번호2 추출
          sCarNo2 := Copy(sTemp, 1, Pos('#', sTemp) - 1);

          // 차량번호2제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 인식여부2 추출
          if (Copy(sTemp, 1, 1) = 'N') or (Copy(sTemp, 1, 1) = 'O') then
            nRecog2 := 1
          else if Copy(sTemp, 1, 1) = 'P' then
            nRecog2 := 2
          else
            nRecog2 := 3;

          sLocal2 := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));
          sLocal2 := Copy(sLocal2, Pos('CH', sLocal2), Length(sLocal2) -
              (Pos('CH', sLocal2) - 1));
          sFile2 := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));
          sTime := MG_StrToStr(Copy(sFile2, Pos('_', sFile2) + 1, 14),
            '####-##-## ##:##:##');

          // 인식여부2제거하여 파일명2 추출
          sFile2 := 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr
            (sFile2, '\', '/');
          sCarNo1 := sCarNo2;
          sFile1 := sFile2;
          nRecog1 := nRecog2;
          sLocal1 := sLocal2;
          sCarNo2 := '';
          sFile2 := '';
          nRecog2 := 0;
          sLocal2 := '';
        end
        else
        begin
          bInBarOpen2 := True;

          // CH제거
          sTemp := Copy(sLprData, Pos('#', sLprData) + 1, Length(sLprData) - Pos
              ('#', sLprData));

          // 차량번호 추출
          sCarNo1 := Copy(sTemp, 1, Pos('#', sTemp) - 1);

          // 차량번호제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 인식여부 추출
          if (Copy(sTemp, 1, 1) = 'N') or (Copy(sTemp, 1, 1) = 'O') then
            nRecog1 := 1
          else if Copy(sTemp, 1, 1) = 'P' then
            nRecog1 := 2
          else
            nRecog1 := 3;

          // 인식여부제거하여 파일명 추출
          sFile1 := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));
          sLocal1 := Copy(sFile1, Pos('CH', sFile1), Length(sFile1) -
              (Pos('CH', sFile1) - 1));
          sTime := MG_StrToStr(Copy(sFile1, Pos('_', sFile1) + 1, 14),
            '####-##-## ##:##:##');

          // 인식여부제거하여 파일명 추출
          sFile1 := 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr
            (sFile1, '\', '/');
        end;
        ExceptLogging('LPR Check: ' + sCarNo1 + ',' + sFile1 + ',' + IntToStr
            (nRecog1) + ',' + sCarNo2 + ',' + sFile2 + ',' + IntToStr(nRecog2)
            + ', ' + sTime);
        sDir := sImageDir + '\' + Copy(sTime, 1, 4) + '\' + Copy(sTime, 6, 2)
          + '\' + Copy(sTime, 9, 2) + '\' + IntToStr(nNo);

        if not DirectoryExists(sDir) then
        begin
          if not ForceDirectories(sDir) then
            ExceptLogging('이미지저장폴더 생성실패: ' + sDir);
        end;

        sImgFile1 := sDir + '\' + sLocal1;
        sImgFile2 := sDir + '\' + sLocal2;

        if sFile1 <> '' then
        begin
          sTemp := Copy(sFile1, 6, Length(sFile1) - 5);
          sImgFile1 := Copy(sTemp, 1, Pos(':9080', sTemp) - 1);
          sImgFile1 := sImgFile1 + Copy(sTemp, Pos(':9080', sTemp) + 5, Length
              (sTemp) - (Pos(':9080', sTemp) + 4));
          sImgFile1 := MG_StrConvert(sImgFile1, '/', '\');
          ExceptLogging('File: ' + sImgFile1);
        end;

        if sFile2 <> '' then
        begin
          sTemp := Copy(sFile2, 6, Length(sFile2) - 5);
          sImgFile2 := Copy(sTemp, 1, Pos(':9080', sTemp) - 1);
          sImgFile2 := sImgFile2 + Copy(sTemp, Pos(':9080', sTemp) + 5, Length
              (sTemp) - (Pos(':9080', sTemp) + 4));
          sImgFile2 := MG_StrConvert(sImgFile2, '/', '\');
          ExceptLogging('File: ' + sImgFile2);
        end;

        for i := 1 to 10 do
        begin
          if RLpr[i].nUnitNo = nNo then
            nIO := RLpr[i].nIO;
        end;

        with dmTables.qryInLpr2Proc do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Select * from CustInfo ');

          if sCarNo2 <> '' then
          begin
            SQL.Add('where ((CarNo = :N1) or (CarNo = :N2)) and ((ExpDateF <= :N3) and (ExpDateT >= :N4)) and TKType = 2');
            SQL.Add(' order by GroupNo desc ');
            Parameters.ParamByName('N1').Value := sCarNo1;
            Parameters.ParamByName('N2').Value := sCarNo2;
            Parameters.ParamByName('N3').Value := FormatDateTime('YYYY-MM-DD', Now);
            Parameters.ParamByName('N4').Value := FormatDateTime('YYYY-MM-DD', Now);
            Open;
          end
          else
          if sCarNo1 <> '' then
          begin
            SQL.Add('where (CarNo = :N1) and ((ExpDateF <= :N3) and (ExpDateT >= :N4)) and TKType = 2');
            SQL.Add(' order by GroupNo desc ');
            Parameters.ParamByName('N1').Value := sCarNo1;
            Parameters.ParamByName('N3').Value := FormatDateTime('YYYY-MM-DD', Now);
            Parameters.ParamByName('N4').Value := FormatDateTime('YYYY-MM-DD', Now);
            Open;
          end;

          if RecordCount > 0 then
          begin
            // 등록된 정기차량이면...
            // 유효기간이 만료되지 않은 사용가능한 정기차량이면...
            if bSCProcWait then
            begin
              if nSCWaitPoint = 20 then
                nSCWaitPoint := 1
              else
                nSCWaitPoint := nSCWaitPoint + 1;

              RSCWait[nSCWaitPoint].sSCFile1 := sFile1;
              RSCWait[nSCWaitPoint].sSCCarNo1 := sCarNo1;
              RSCWait[nSCWaitPoint].sSCFile2 := sFile2;
              RSCWait[nSCWaitPoint].sSCCarNo2 := sCarNo2;
              RSCWait[nSCWaitPoint].sSCIOTime := sTime;
              RSCWait[nSCWaitPoint].nSCLprNo := nNo;
              RSCWait[nSCWaitPoint].nSCInOut := nIO;
              RSCWait[nSCWaitPoint].nSCRecog1 := nRecog1;
              RSCWait[nSCWaitPoint].nSCRecog2 := nRecog2;
              RSCWait[nSCWaitPoint].sSCDspIP := sDspIP;
              RSCWait[nSCWaitPoint].csSCLPR := csLPR;
              RSCWait[nSCWaitPoint].bBarOpen := bInBarOpen2;

              if not tSCWait.Enabled then
                tSCWait.Enabled := True;
            end
            else
            begin
              sResult := RecvLprProc(sFile1, sCarNo1, sFile2, sCarNo2, sTime,
                nNo, nIO, nRecog1, nRecog2, sDspIP, csLPR, bInBarOpen2);

              // 입차시의 이미지는 표시하지 않는다.  2012-05-07 UI 관련 미팅시 송우식 과장...
              // 일반차량 출차시 출차이미지와 함께 입차이미지를 표시한다....
              GridData(sResult);
            end;
          end
          else
          begin
            // 일반차량 처리...
            if nIO = 1 then
            begin
              if bNCInProcWait then
              begin
                if nNCInWaitPoint = 20 then
                  nNCInWaitPoint := 1
                else
                  nNCInWaitPoint := nNCInWaitPoint + 1;

                RNCInWait[nNCInWaitPoint].sNCFile1 := sFile1;
                RNCInWait[nNCInWaitPoint].sNCCarNo1 := sCarNo1;
                RNCInWait[nNCInWaitPoint].sNCFile2 := sFile2;
                RNCInWait[nNCInWaitPoint].sNCCarNo2 := sCarNo2;
                RNCInWait[nNCInWaitPoint].sNCIOTime := sTime;
                RNCInWait[nNCInWaitPoint].nNCLprNo := nNo;
                RNCInWait[nNCInWaitPoint].nNCInOut := nIO;
                RNCInWait[nNCInWaitPoint].nNCRecog1 := nRecog1;
                RNCInWait[nNCInWaitPoint].nNCRecog2 := nRecog2;
                RNCInWait[nNCInWaitPoint].sNCDspIP := sDspIP;
                RNCInWait[nNCInWaitPoint].csNCLPR := csLPR;
                RNCInWait[nNCInWaitPoint].bBarOpen := bInBarOpen2;

                if not tNCInWait.Enabled then
                  tNCInWait.Enabled := True;
              end
              else
              begin
                NormalProc(sFile1, sCarNo1, sFile2, sCarNo2, sTime, nNo, nIO,
                  nRecog1, nRecog2, sDspIP, csLPR, bInBarOpen2);
              end;
            end
            else if nIO = 2 then
            begin
              if bNCOutProcWait then
              begin
                if nNCOutWaitPoint = 20 then
                  nNCOutWaitPoint := 1
                else
                  nNCOutWaitPoint := nNCOutWaitPoint + 1;

                RNCOutWait[nNCOutWaitPoint].sNCFile1 := sFile1;
                RNCOutWait[nNCOutWaitPoint].sNCCarNo1 := sCarNo1;
                RNCOutWait[nNCOutWaitPoint].sNCFile2 := sFile2;
                RNCOutWait[nNCOutWaitPoint].sNCCarNo2 := sCarNo2;
                RNCOutWait[nNCOutWaitPoint].sNCIOTime := sTime;
                RNCOutWait[nNCOutWaitPoint].nNCLprNo := nNo;
                RNCOutWait[nNCOutWaitPoint].nNCInOut := nIO;
                RNCOutWait[nNCOutWaitPoint].nNCRecog1 := nRecog1;
                RNCOutWait[nNCOutWaitPoint].nNCRecog2 := nRecog2;
                RNCOutWait[nNCOutWaitPoint].sNCDspIP := sDspIP;
                RNCOutWait[nNCOutWaitPoint].csNCLPR := csLPR;
                RNCOutWait[nNCOutWaitPoint].bBarOpen := True;

                if not tNCOutWait.Enabled then
                  tNCOutWait.Enabled := True;
              end
              else
              begin
                NormalProc(sFile1, sCarNo1, sFile2, sCarNo2, sTime, nNo, nIO,
                  nRecog1, nRecog2, sDspIP, csLPR, True);
              end;
            end;
          end;
        end;
      except
        on E: Exception do
          ExceptLogging('csInLpr2Read: ' + aString(E.Message));
      end;
    end
    else
    begin
      if sInLPRRecv2 = 'LPR_R' then
      begin
        Socket.SendText(aString('TIME' + FormatDateTime('YYYYMMDDHHNNSS', Now))
          );
        ExceptLogging('시간동기화 전송');
      end;
    end;
    sInLPRRecv2 := '';
  finally
    tInAlive2.Enabled := True;
  end;
end;

procedure TfrmMainNew.csInLpr3Read(Sender: TObject; Socket: TCustomWinSocket);
var
  nNo: Word;
  sLprData, sLprIP, sDspIP: aString;
  csLPR: TClientSocket;
  sRecv: aString;
  i: Byte;
  sCarNo1, sCarNo2, sTime, sTemp, sResult, sTest, sDir, sLocal1,
    sLocal2: String;
  sFile1, sFile2, sImgFile1, sImgFile2: String;
  nRecog1, nRecog2, nIO: Byte;
  hr: HRESULT;
  sSend: aString;
begin
  try
    tInAlive3.Enabled := False;
    sRecv := Socket.ReceiveText;
    sInLPRRecv3 := sRecv;
    ExceptLogging('LPR' + IntToStr(csInLpr3.Tag) + ' Recv: ' + sInLPRRecv3);

    if Length(sInLPRRecv3) > 15 then
    begin
      for i := 1 to 10 do
      begin
        if RLpr[i].nUnitNo = csInLpr3.Tag then
        begin
          sDspIP := RLpr[i].sDspIP;
          Break;
        end;
      end;

      nNo := csInLpr3.Tag;
      sLprData := sInLPRRecv3;
      sLprIP := csInLpr3.Host;
      sDspIP := sDspIP;
      csLPR := csInLpr3;

      try
        sCarNo1 := '';
        sCarNo2 := '';
        sFile1 := '';
        sFile2 := '';
        nRecog1 := 0;
        nRecog2 := 0;

        // NW, NP, UP가 올 경우는 차단기를 오픈하지 않는다. 2012-06-15...
        bInBarOpen3 := False;

        if Copy(sLprData, 1, 2) = 'NW' then
        begin
          // 후면촬영결과가 전면촬영차량과 다르다. (새로운 차량이다)
          // NW제거
          sTemp := Copy(sLprData, Pos('#', sLprData) + 1, Length(sLprData) - Pos
              ('#', sLprData));

          // CH제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 차량번호 추출
          sCarNo1 := Copy(sTemp, 1, Pos('#', sTemp) - 1);

          // 차량번호제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 인식여부 추출
          if (Copy(sTemp, 1, 1) = 'N') or (Copy(sTemp, 1, 1) = 'O') then
            nRecog1 := 1
          else if Copy(sTemp, 1, 1) = 'P' then
            nRecog1 := 2
          else
            nRecog1 := 3;

          sFile1 := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));
          sLocal1 := Copy(sFile1, Pos('CH', sFile1), Length(sFile1) -
              (Pos('CH', sFile1) - 1));
          sTime := MG_StrToStr(Copy(sFile1, Pos('_', sFile1) + 1, 14),
            '####-##-## ##:##:##');

          // 인식여부제거하여 파일명 추출
          sFile1 := 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr
            (sFile1, '\', '/');
        end
        else if Copy(sLprData, 1, 2) = 'UP' then
        begin
          // 오인식으로 전면과 후면촬영결과가 다르다...
          // 이때는 CarNo1과 CarNo2, Image1, Image2를 구분하여 넣는다.
          // 전면차량번호와 입차일시를 가지고 DB검색하여 CarNo2와 Image2를 업데이트한다.

          // UP제거
          sTemp := Copy(sLprData, Pos('#', sLprData) + 1, Length(sLprData) - Pos
              ('#', sLprData));

          // CH제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 차량번호1 추출
          sCarNo1 := Copy(sTemp, 1, Pos('#', sTemp) - 1);

          // 차량번호1제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 인식여부1 추출
          if (Copy(sTemp, 1, 1) = 'N') or (Copy(sTemp, 1, 1) = 'O') then
            nRecog1 := 1
          else if Copy(sTemp, 1, 1) = 'P' then
            nRecog1 := 2
          else
            nRecog1 := 3;

          // 인식여부1제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 파일명1 추출
          sFile1 := Copy(sTemp, 1, Pos('#', sTemp) - 1); // Copy(sTemp, Pos('#', sTemp)+1, Length(sTemp)-Pos('#', sTemp));
          sLocal1 := Copy(sFile1, Pos('CH', sFile1), Length(sFile1) -
              (Pos('CH', sFile1) - 1));
          sTime := MG_StrToStr(Copy(sFile1, Pos('_', sFile1) + 1, 14),
            '####-##-## ##:##:##');

          // 인식여부제거하여 파일명 추출
          sFile1 := 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr
            (sFile1, '\', '/');

          // 파일명1제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // CH제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 차량번호2 추출
          sCarNo2 := Copy(sTemp, 1, Pos('#', sTemp) - 1);

          // 차량번호2제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 인식여부2 추출
          if (Copy(sTemp, 1, 1) = 'N') or (Copy(sTemp, 1, 1) = 'O') then
            nRecog2 := 1
          else if Copy(sTemp, 1, 1) = 'P' then
            nRecog2 := 2
          else
            nRecog2 := 3;

          sLocal2 := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));
          sLocal2 := Copy(sLocal2, Pos('CH', sLocal2), Length(sLocal2) -
              (Pos('CH', sLocal2) - 1));

          // 인식여부2제거하여 파일명2 추출
          sFile2 := 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr
            (Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos('#', sTemp)),
            '\', '/');

          with dmTables.qryRecvInLPR3 do
          begin
            Close;
            SQL.Clear;
            SQL.Add(
              'Select * from IONData where ProcDate = :N1 and ProcTime = :N2 and InCarNo1 = :N3');
            Parameters.ParamByName('N1').Value := Copy(sTime, 1, 10);
            Parameters.ParamByName('N2').Value := Copy(sTime, 12, 8);
            Parameters.ParamByName('N3').Value := sCarNo1;
            Open;

            if RecordCount > 0 then
            begin
              Close;
              SQL.Clear;
              SQL.Add(
                'Update IONData Set InCarNo2 = :N1, InImage2 = :N2, InRecog2 = :N6 ');
              SQL.Add(
                'where ProcDate = :N3 and ProcTime = :N4 and InCarNo1 = :N5');
              Parameters.ParamByName('N1').Value := sCarNo2;
              Parameters.ParamByName('N2').Value := sFile2;
              Parameters.ParamByName('N3').Value := Copy(sTime, 1, 10);
              Parameters.ParamByName('N4').Value := Copy(sTime, 12, 8);
              Parameters.ParamByName('N5').Value := sCarNo1;
              Parameters.ParamByName('N6').Value := nRecog2;
              ExecSQL;
            end;
          end;
          Exit;
        end
        else if Copy(sLprData, 1, 2) = 'NP' then
        begin
          // 전면촬영된 차량과 후면촬영된 차량이 다르다.
          // 이때는 CarNo2를 개별차량으로 하여 신규입차처리한다.
          // CarNo2, File2, Recog2, Time2 로 신규입차 처리.

          // NP제거
          sTemp := Copy(sLprData, Pos('#', sLprData) + 1, Length(sLprData) - Pos
              ('#', sLprData));

          // CH제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 차량번호1 추출
          sCarNo1 := Copy(sTemp, 1, Pos('#', sTemp) - 1);

          // 차량번호1제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 인식여부1 추출
          if (Copy(sTemp, 1, 1) = 'N') or (Copy(sTemp, 1, 1) = 'O') then
            nRecog1 := 1
          else if Copy(sTemp, 1, 1) = 'P' then
            nRecog1 := 2
          else
            nRecog1 := 3;

          // 인식여부1제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 파일명1 추출
          sFile1 := Copy(sTemp, 1, Pos('#', sTemp) - 1); // Copy(sTemp, Pos('#', sTemp)+1, Length(sTemp)-Pos('#', sTemp));
          sLocal1 := Copy(sFile1, Pos('CH', sFile1), Length(sFile1) -
              (Pos('CH', sFile1) - 1));
          sTime := MG_StrToStr(Copy(sFile1, Pos('_', sFile1) + 1, 14),
            '####-##-## ##:##:##');

          // 인식여부제거하여 파일명 추출
          sFile1 := 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr
            (sFile1, '\', '/');

          // 파일명1제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // CH제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 차량번호2 추출
          sCarNo2 := Copy(sTemp, 1, Pos('#', sTemp) - 1);

          // 차량번호2제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 인식여부2 추출
          if (Copy(sTemp, 1, 1) = 'N') or (Copy(sTemp, 1, 1) = 'O') then
            nRecog2 := 1
          else if Copy(sTemp, 1, 1) = 'P' then
            nRecog2 := 2
          else
            nRecog2 := 3;

          sLocal2 := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));
          sLocal2 := Copy(sLocal2, Pos('CH', sLocal2), Length(sLocal2) -
              (Pos('CH', sLocal2) - 1));
          sFile2 := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));
          sTime := MG_StrToStr(Copy(sFile2, Pos('_', sFile2) + 1, 14),
            '####-##-## ##:##:##');

          // 인식여부2제거하여 파일명2 추출
          sFile2 := 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr
            (sFile2, '\', '/');
          sCarNo1 := sCarNo2;
          sFile1 := sFile2;
          nRecog1 := nRecog2;
          sLocal1 := sLocal2;
          sCarNo2 := '';
          sFile2 := '';
          nRecog2 := 0;
          sLocal2 := '';
        end
        else
        begin
          bInBarOpen3 := True;

          // CH제거
          sTemp := Copy(sLprData, Pos('#', sLprData) + 1, Length(sLprData) - Pos
              ('#', sLprData));

          // 차량번호 추출
          sCarNo1 := Copy(sTemp, 1, Pos('#', sTemp) - 1);

          // 차량번호제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 인식여부 추출
          if (Copy(sTemp, 1, 1) = 'N') or (Copy(sTemp, 1, 1) = 'O') then
            nRecog1 := 1
          else if Copy(sTemp, 1, 1) = 'P' then
            nRecog1 := 2
          else
            nRecog1 := 3;

          // 인식여부제거하여 파일명 추출
          sFile1 := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));
          sLocal1 := Copy(sFile1, Pos('CH', sFile1), Length(sFile1) -
              (Pos('CH', sFile1) - 1));
          sTime := MG_StrToStr(Copy(sFile1, Pos('_', sFile1) + 1, 14),
            '####-##-## ##:##:##');

          // 인식여부제거하여 파일명 추출
          sFile1 := 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr
            (sFile1, '\', '/');
        end;
        ExceptLogging('LPR Check: ' + sCarNo1 + ',' + sFile1 + ',' + IntToStr
            (nRecog1) + ',' + sCarNo2 + ',' + sFile2 + ',' + IntToStr(nRecog2)
            + ', ' + sTime);
        sDir := sImageDir + '\' + Copy(sTime, 1, 4) + '\' + Copy(sTime, 6, 2)
          + '\' + Copy(sTime, 9, 2) + '\' + IntToStr(nNo);

        if not DirectoryExists(sDir) then
        begin
          if not ForceDirectories(sDir) then
            ExceptLogging('이미지저장폴더 생성실패: ' + sDir);
        end;

        sImgFile1 := sDir + '\' + sLocal1;
        sImgFile2 := sDir + '\' + sLocal2;

        if sFile1 <> '' then
        begin
          sTemp := Copy(sFile1, 6, Length(sFile1) - 5);
          sImgFile1 := Copy(sTemp, 1, Pos(':9080', sTemp) - 1);
          sImgFile1 := sImgFile1 + Copy(sTemp, Pos(':9080', sTemp) + 5, Length
              (sTemp) - (Pos(':9080', sTemp) + 4));
          sImgFile1 := MG_StrConvert(sImgFile1, '/', '\');
          ExceptLogging('File: ' + sImgFile1);
        end;

        if sFile2 <> '' then
        begin
          sTemp := Copy(sFile2, 6, Length(sFile2) - 5);
          sImgFile2 := Copy(sTemp, 1, Pos(':9080', sTemp) - 1);
          sImgFile2 := sImgFile2 + Copy(sTemp, Pos(':9080', sTemp) + 5, Length
              (sTemp) - (Pos(':9080', sTemp) + 4));
          sImgFile2 := MG_StrConvert(sImgFile2, '/', '\');
          ExceptLogging('File: ' + sImgFile2);
        end;

        for i := 1 to 10 do
        begin
          if RLpr[i].nUnitNo = nNo then
            nIO := RLpr[i].nIO;
        end;

        with dmTables.qryInLpr3Proc do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Select * from CustInfo ');

          if sCarNo2 <> '' then
          begin
            SQL.Add('where ((CarNo = :N1) or (CarNo = :N2)) and ((ExpDateF <= :N3) and (ExpDateT >= :N4)) and TKType = 2');
            SQL.Add(' order by GroupNo desc ');
            Parameters.ParamByName('N1').Value := sCarNo1;
            Parameters.ParamByName('N2').Value := sCarNo2;
            Parameters.ParamByName('N3').Value := FormatDateTime('YYYY-MM-DD', Now);
            Parameters.ParamByName('N4').Value := FormatDateTime('YYYY-MM-DD', Now);
            Open;
          end
          else
          if sCarNo1 <> '' then
          begin
            SQL.Add('where (CarNo = :N1) and ((ExpDateF <= :N3) and (ExpDateT >= :N4)) and TKType = 2');
            SQL.Add(' order by GroupNo desc ');
            Parameters.ParamByName('N1').Value := sCarNo1;
            Parameters.ParamByName('N3').Value := FormatDateTime('YYYY-MM-DD', Now);
            Parameters.ParamByName('N4').Value := FormatDateTime('YYYY-MM-DD', Now);
            Open;
          end;

          if RecordCount > 0 then
          begin
            // 등록된 정기차량이면...
            // 유효기간이 만료되지 않은 사용가능한 정기차량이면...
            if bSCProcWait then
            begin
              if nSCWaitPoint = 20 then
                nSCWaitPoint := 1
              else
                nSCWaitPoint := nSCWaitPoint + 1;

              RSCWait[nSCWaitPoint].sSCFile1 := sFile1;
              RSCWait[nSCWaitPoint].sSCCarNo1 := sCarNo1;
              RSCWait[nSCWaitPoint].sSCFile2 := sFile2;
              RSCWait[nSCWaitPoint].sSCCarNo2 := sCarNo2;
              RSCWait[nSCWaitPoint].sSCIOTime := sTime;
              RSCWait[nSCWaitPoint].nSCLprNo := nNo;
              RSCWait[nSCWaitPoint].nSCInOut := nIO;
              RSCWait[nSCWaitPoint].nSCRecog1 := nRecog1;
              RSCWait[nSCWaitPoint].nSCRecog2 := nRecog2;
              RSCWait[nSCWaitPoint].sSCDspIP := sDspIP;
              RSCWait[nSCWaitPoint].csSCLPR := csLPR;
              RSCWait[nSCWaitPoint].bBarOpen := bInBarOpen3;

              if not tSCWait.Enabled then
                tSCWait.Enabled := True;
            end
            else
            begin
              sResult := RecvLprProc(sFile1, sCarNo1, sFile2, sCarNo2, sTime,
                nNo, nIO, nRecog1, nRecog2, sDspIP, csLPR, bInBarOpen3);

              // 입차시의 이미지는 표시하지 않는다.  2012-05-07 UI 관련 미팅시 송우식 과장...
              // 일반차량 출차시 출차이미지와 함께 입차이미지를 표시한다....
              GridData(sResult);
            end;
          end
          else
          begin
            // 일반차량 처리...
            if nIO = 1 then
            begin
              if bNCInProcWait then
              begin
                if nNCInWaitPoint = 20 then
                  nNCInWaitPoint := 1
                else
                  nNCInWaitPoint := nNCInWaitPoint + 1;

                RNCInWait[nNCInWaitPoint].sNCFile1 := sFile1;
                RNCInWait[nNCInWaitPoint].sNCCarNo1 := sCarNo1;
                RNCInWait[nNCInWaitPoint].sNCFile2 := sFile2;
                RNCInWait[nNCInWaitPoint].sNCCarNo2 := sCarNo2;
                RNCInWait[nNCInWaitPoint].sNCIOTime := sTime;
                RNCInWait[nNCInWaitPoint].nNCLprNo := nNo;
                RNCInWait[nNCInWaitPoint].nNCInOut := nIO;
                RNCInWait[nNCInWaitPoint].nNCRecog1 := nRecog1;
                RNCInWait[nNCInWaitPoint].nNCRecog2 := nRecog2;
                RNCInWait[nNCInWaitPoint].sNCDspIP := sDspIP;
                RNCInWait[nNCInWaitPoint].csNCLPR := csLPR;
                RNCInWait[nNCInWaitPoint].bBarOpen := bInBarOpen3;

                if not tNCInWait.Enabled then
                  tNCInWait.Enabled := True;
              end
              else
              begin
                NormalProc(sFile1, sCarNo1, sFile2, sCarNo2, sTime, nNo, nIO,
                  nRecog1, nRecog2, sDspIP, csLPR, bInBarOpen3);
              end;
            end
            else if nIO = 2 then
            begin
              if bNCOutProcWait then
              begin
                if nNCOutWaitPoint = 20 then
                  nNCOutWaitPoint := 1
                else
                  nNCOutWaitPoint := nNCOutWaitPoint + 1;

                RNCOutWait[nNCOutWaitPoint].sNCFile1 := sFile1;
                RNCOutWait[nNCOutWaitPoint].sNCCarNo1 := sCarNo1;
                RNCOutWait[nNCOutWaitPoint].sNCFile2 := sFile2;
                RNCOutWait[nNCOutWaitPoint].sNCCarNo2 := sCarNo2;
                RNCOutWait[nNCOutWaitPoint].sNCIOTime := sTime;
                RNCOutWait[nNCOutWaitPoint].nNCLprNo := nNo;
                RNCOutWait[nNCOutWaitPoint].nNCInOut := nIO;
                RNCOutWait[nNCOutWaitPoint].nNCRecog1 := nRecog1;
                RNCOutWait[nNCOutWaitPoint].nNCRecog2 := nRecog2;
                RNCOutWait[nNCOutWaitPoint].sNCDspIP := sDspIP;
                RNCOutWait[nNCOutWaitPoint].csNCLPR := csLPR;
                RNCOutWait[nNCOutWaitPoint].bBarOpen := True;

                if not tNCOutWait.Enabled then
                  tNCOutWait.Enabled := True;
              end
              else
              begin
                NormalProc(sFile1, sCarNo1, sFile2, sCarNo2, sTime, nNo, nIO,
                  nRecog1, nRecog2, sDspIP, csLPR, True);
              end;
            end;
          end;
        end;
      except
        on E: Exception do
          ExceptLogging('csInLpr3Read: ' + aString(E.Message));
      end;
    end
    else
    begin
      if sInLPRRecv3 = 'LPR_R' then
      begin
        Socket.SendText(aString('TIME' + FormatDateTime('YYYYMMDDHHNNSS', Now))
          );
        ExceptLogging('시간동기화 전송');
      end;
    end;
    sInLPRRecv3 := '';
  finally
    tInAlive3.Enabled := True;
  end;
end;

procedure TfrmMainNew.csInLpr4Read(Sender: TObject; Socket: TCustomWinSocket);
var
  nNo: Word;
  sLprData, sLprIP, sDspIP: aString;
  csLPR: TClientSocket;
  sRecv: aString;
  i: Byte;
  sCarNo1, sCarNo2, sTime, sTemp, sResult, sTest, sDir, sLocal1,
    sLocal2: String;
  sFile1, sFile2, sImgFile1, sImgFile2: String;
  nRecog1, nRecog2, nIO: Byte;
  hr: HRESULT;
  sSend: aString;
begin
  try
    tInAlive4.Enabled := False;
    sRecv := Socket.ReceiveText;
    sInLPRRecv4 := sRecv;
    ExceptLogging('LPR' + IntToStr(csInLpr4.Tag) + ' Recv: ' + sInLPRRecv4);

    if Length(sInLPRRecv4) > 15 then
    begin
      for i := 1 to 10 do
      begin
        if RLpr[i].nUnitNo = csInLpr4.Tag then
        begin
          sDspIP := RLpr[i].sDspIP;
          Break;
        end;
      end;

      nNo := csInLpr4.Tag;
      sLprData := sInLPRRecv4;
      sLprIP := csInLpr4.Host;
      sDspIP := sDspIP;
      csLPR := csInLpr4;

      try
        sCarNo1 := '';
        sCarNo2 := '';
        sFile1 := '';
        sFile2 := '';
        nRecog1 := 0;
        nRecog2 := 0;

        bInBarOpen4 := False;

        if Copy(sLprData, 1, 2) = 'NW' then
        begin
          // 후면촬영결과가 전면촬영차량과 다르다. (새로운 차량이다)
          // NW제거
          sTemp := Copy(sLprData, Pos('#', sLprData) + 1, Length(sLprData) - Pos
              ('#', sLprData));

          // CH제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 차량번호 추출
          sCarNo1 := Copy(sTemp, 1, Pos('#', sTemp) - 1);

          // 차량번호제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 인식여부 추출
          if (Copy(sTemp, 1, 1) = 'N') or (Copy(sTemp, 1, 1) = 'O') then
            nRecog1 := 1
          else if Copy(sTemp, 1, 1) = 'P' then
            nRecog1 := 2
          else
            nRecog1 := 3;

          sFile1 := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));
          sLocal1 := Copy(sFile1, Pos('CH', sFile1), Length(sFile1) -
              (Pos('CH', sFile1) - 1));
          sTime := MG_StrToStr(Copy(sFile1, Pos('_', sFile1) + 1, 14),
            '####-##-## ##:##:##');

          // 인식여부제거하여 파일명 추출
          sFile1 := 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr
            (sFile1, '\', '/');
        end
        else if Copy(sLprData, 1, 2) = 'UP' then
        begin
          // 오인식으로 전면과 후면촬영결과가 다르다...
          // 이때는 CarNo1과 CarNo2, Image1, Image2를 구분하여 넣는다.
          // 전면차량번호와 입차일시를 가지고 DB검색하여 CarNo2와 Image2를 업데이트한다.

          // UP제거
          sTemp := Copy(sLprData, Pos('#', sLprData) + 1, Length(sLprData) - Pos
              ('#', sLprData));

          // CH제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 차량번호1 추출
          sCarNo1 := Copy(sTemp, 1, Pos('#', sTemp) - 1);

          // 차량번호1제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 인식여부1 추출
          if (Copy(sTemp, 1, 1) = 'N') or (Copy(sTemp, 1, 1) = 'O') then
            nRecog1 := 1
          else if Copy(sTemp, 1, 1) = 'P' then
            nRecog1 := 2
          else
            nRecog1 := 3;

          // 인식여부1제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 파일명1 추출
          sFile1 := Copy(sTemp, 1, Pos('#', sTemp) - 1); // Copy(sTemp, Pos('#', sTemp)+1, Length(sTemp)-Pos('#', sTemp));
          sLocal1 := Copy(sFile1, Pos('CH', sFile1), Length(sFile1) -
              (Pos('CH', sFile1) - 1));
          sTime := MG_StrToStr(Copy(sFile1, Pos('_', sFile1) + 1, 14),
            '####-##-## ##:##:##');

          // 인식여부제거하여 파일명 추출
          sFile1 := 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr
            (sFile1, '\', '/');

          // 파일명1제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // CH제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 차량번호2 추출
          sCarNo2 := Copy(sTemp, 1, Pos('#', sTemp) - 1);

          // 차량번호2제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 인식여부2 추출
          if (Copy(sTemp, 1, 1) = 'N') or (Copy(sTemp, 1, 1) = 'O') then
            nRecog2 := 1
          else if Copy(sTemp, 1, 1) = 'P' then
            nRecog2 := 2
          else
            nRecog2 := 3;

          sLocal2 := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));
          sLocal2 := Copy(sLocal2, Pos('CH', sLocal2), Length(sLocal2) -
              (Pos('CH', sLocal2) - 1));

          // 인식여부2제거하여 파일명2 추출
          sFile2 := 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr
            (Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos('#', sTemp)),
            '\', '/');

          with dmTables.qryRecvInLPR4 do
          begin
            Close;
            SQL.Clear;
            SQL.Add(
              'Select * from IONData where ProcDate = :N1 and ProcTime = :N2 and InCarNo1 = :N3');
            Parameters.ParamByName('N1').Value := Copy(sTime, 1, 10);
            Parameters.ParamByName('N2').Value := Copy(sTime, 12, 8);
            Parameters.ParamByName('N3').Value := sCarNo1;
            Open;

            if RecordCount > 0 then
            begin
              Close;
              SQL.Clear;
              SQL.Add(
                'Update IONData Set InCarNo2 = :N1, InImage2 = :N2, InRecog2 = :N6 ');
              SQL.Add(
                'where ProcDate = :N3 and ProcTime = :N4 and InCarNo1 = :N5');
              Parameters.ParamByName('N1').Value := sCarNo2;
              Parameters.ParamByName('N2').Value := sFile2;
              Parameters.ParamByName('N3').Value := Copy(sTime, 1, 10);
              Parameters.ParamByName('N4').Value := Copy(sTime, 12, 8);
              Parameters.ParamByName('N5').Value := sCarNo1;
              Parameters.ParamByName('N6').Value := nRecog2;
              ExecSQL;
            end;
          end;
          Exit;
        end
        else if Copy(sLprData, 1, 2) = 'NP' then
        begin
          // 전면촬영된 차량과 후면촬영된 차량이 다르다.
          // 이때는 CarNo2를 개별차량으로 하여 신규입차처리한다.
          // CarNo2, File2, Recog2, Time2 로 신규입차 처리.

          // NP제거
          sTemp := Copy(sLprData, Pos('#', sLprData) + 1, Length(sLprData) - Pos
              ('#', sLprData));

          // CH제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 차량번호1 추출
          sCarNo1 := Copy(sTemp, 1, Pos('#', sTemp) - 1);

          // 차량번호1제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 인식여부1 추출
          if (Copy(sTemp, 1, 1) = 'N') or (Copy(sTemp, 1, 1) = 'O') then
            nRecog1 := 1
          else if Copy(sTemp, 1, 1) = 'P' then
            nRecog1 := 2
          else
            nRecog1 := 3;

          // 인식여부1제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 파일명1 추출
          sFile1 := Copy(sTemp, 1, Pos('#', sTemp) - 1); // Copy(sTemp, Pos('#', sTemp)+1, Length(sTemp)-Pos('#', sTemp));
          sLocal1 := Copy(sFile1, Pos('CH', sFile1), Length(sFile1) -
              (Pos('CH', sFile1) - 1));
          sTime := MG_StrToStr(Copy(sFile1, Pos('_', sFile1) + 1, 14),
            '####-##-## ##:##:##');

          // 인식여부제거하여 파일명 추출
          sFile1 := 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr
            (sFile1, '\', '/');

          // 파일명1제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // CH제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 차량번호2 추출
          sCarNo2 := Copy(sTemp, 1, Pos('#', sTemp) - 1);

          // 차량번호2제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 인식여부2 추출
          if (Copy(sTemp, 1, 1) = 'N') or (Copy(sTemp, 1, 1) = 'O') then
            nRecog2 := 1
          else if Copy(sTemp, 1, 1) = 'P' then
            nRecog2 := 2
          else
            nRecog2 := 3;

          sLocal2 := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));
          sLocal2 := Copy(sLocal2, Pos('CH', sLocal2), Length(sLocal2) -
              (Pos('CH', sLocal2) - 1));
          sFile2 := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));
          sTime := MG_StrToStr(Copy(sFile2, Pos('_', sFile2) + 1, 14),
            '####-##-## ##:##:##');

          // 인식여부2제거하여 파일명2 추출
          sFile2 := 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr
            (sFile2, '\', '/');
          sCarNo1 := sCarNo2;
          sFile1 := sFile2;
          nRecog1 := nRecog2;
          sLocal1 := sLocal2;
          sCarNo2 := '';
          sFile2 := '';
          nRecog2 := 0;
          sLocal2 := '';
        end
        else
        begin
          bInBarOpen4 := True;

          // CH제거
          sTemp := Copy(sLprData, Pos('#', sLprData) + 1, Length(sLprData) - Pos
              ('#', sLprData));

          // 차량번호 추출
          sCarNo1 := Copy(sTemp, 1, Pos('#', sTemp) - 1);

          // 차량번호제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 인식여부 추출
          if (Copy(sTemp, 1, 1) = 'N') or (Copy(sTemp, 1, 1) = 'O') then
            nRecog1 := 1
          else if Copy(sTemp, 1, 1) = 'P' then
            nRecog1 := 2
          else
            nRecog1 := 3;

          // 인식여부제거하여 파일명 추출
          sFile1 := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));
          sLocal1 := Copy(sFile1, Pos('CH', sFile1), Length(sFile1) -
              (Pos('CH', sFile1) - 1));
          sTime := MG_StrToStr(Copy(sFile1, Pos('_', sFile1) + 1, 14),
            '####-##-## ##:##:##');

          // 인식여부제거하여 파일명 추출
          sFile1 := 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr
            (sFile1, '\', '/');
        end;
        ExceptLogging('LPR Check: ' + sCarNo1 + ',' + sFile1 + ',' + IntToStr
            (nRecog1) + ',' + sCarNo2 + ',' + sFile2 + ',' + IntToStr(nRecog2)
            + ', ' + sTime);
        sDir := sImageDir + '\' + Copy(sTime, 1, 4) + '\' + Copy(sTime, 6, 2)
          + '\' + Copy(sTime, 9, 2) + '\' + IntToStr(nNo);

        if not DirectoryExists(sDir) then
        begin
          if not ForceDirectories(sDir) then
            ExceptLogging('이미지저장폴더 생성실패: ' + sDir);
        end;

        sImgFile1 := sDir + '\' + sLocal1;
        sImgFile2 := sDir + '\' + sLocal2;

        if sFile1 <> '' then
        begin
          sTemp := Copy(sFile1, 6, Length(sFile1) - 5);
          sImgFile1 := Copy(sTemp, 1, Pos(':9080', sTemp) - 1);
          sImgFile1 := sImgFile1 + Copy(sTemp, Pos(':9080', sTemp) + 5, Length
              (sTemp) - (Pos(':9080', sTemp) + 4));
          sImgFile1 := MG_StrConvert(sImgFile1, '/', '\');
          ExceptLogging('File: ' + sImgFile1);
        end;

        if sFile2 <> '' then
        begin
          sTemp := Copy(sFile2, 6, Length(sFile2) - 5);
          sImgFile2 := Copy(sTemp, 1, Pos(':9080', sTemp) - 1);
          sImgFile2 := sImgFile2 + Copy(sTemp, Pos(':9080', sTemp) + 5, Length
              (sTemp) - (Pos(':9080', sTemp) + 4));
          sImgFile2 := MG_StrConvert(sImgFile2, '/', '\');
          ExceptLogging('File: ' + sImgFile2);
        end;

        for i := 1 to 10 do
        begin
          if RLpr[i].nUnitNo = nNo then
            nIO := RLpr[i].nIO;
        end;

        with dmTables.qryInLpr4Proc do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Select * from CustInfo ');

          if sCarNo2 <> '' then
          begin
            SQL.Add('where ((CarNo = :N1) or (CarNo = :N2)) and ((ExpDateF <= :N3) and (ExpDateT >= :N4)) and TKType = 2');
            SQL.Add(' order by GroupNo desc ');
            Parameters.ParamByName('N1').Value := sCarNo1;
            Parameters.ParamByName('N2').Value := sCarNo2;
            Parameters.ParamByName('N3').Value := FormatDateTime('YYYY-MM-DD', Now);
            Parameters.ParamByName('N4').Value := FormatDateTime('YYYY-MM-DD', Now);
            Open;
          end
          else
          if sCarNo1 <> '' then
          begin
            SQL.Add('where (CarNo = :N1) and ((ExpDateF <= :N3) and (ExpDateT >= :N4)) and TKType = 2');
            SQL.Add(' order by GroupNo desc ');
            Parameters.ParamByName('N1').Value := sCarNo1;
            Parameters.ParamByName('N3').Value := FormatDateTime('YYYY-MM-DD', Now);
            Parameters.ParamByName('N4').Value := FormatDateTime('YYYY-MM-DD', Now);
            Open;
          end;

          if RecordCount > 0 then
          begin
            // 등록된 정기차량이면...
            // 유효기간이 만료되지 않은 사용가능한 정기차량이면...
            if bSCProcWait then
            begin
              if nSCWaitPoint = 20 then
                nSCWaitPoint := 1
              else
                nSCWaitPoint := nSCWaitPoint + 1;

              RSCWait[nSCWaitPoint].sSCFile1 := sFile1;
              RSCWait[nSCWaitPoint].sSCCarNo1 := sCarNo1;
              RSCWait[nSCWaitPoint].sSCFile2 := sFile2;
              RSCWait[nSCWaitPoint].sSCCarNo2 := sCarNo2;
              RSCWait[nSCWaitPoint].sSCIOTime := sTime;
              RSCWait[nSCWaitPoint].nSCLprNo := nNo;
              RSCWait[nSCWaitPoint].nSCInOut := nIO;
              RSCWait[nSCWaitPoint].nSCRecog1 := nRecog1;
              RSCWait[nSCWaitPoint].nSCRecog2 := nRecog2;
              RSCWait[nSCWaitPoint].sSCDspIP := sDspIP;
              RSCWait[nSCWaitPoint].csSCLPR := csLPR;
              RSCWait[nSCWaitPoint].bBarOpen := bInBarOpen4;

              if not tSCWait.Enabled then
                tSCWait.Enabled := True;
            end
            else
            begin
              sResult := RecvLprProc(sFile1, sCarNo1, sFile2, sCarNo2, sTime,
                nNo, nIO, nRecog1, nRecog2, sDspIP, csLPR, bInBarOpen4);

              // 입차시의 이미지는 표시하지 않는다.  2012-05-07 UI 관련 미팅시 송우식 과장...
              // 일반차량 출차시 출차이미지와 함께 입차이미지를 표시한다....
              GridData(sResult);
            end;
          end
          else
          begin
            // 일반차량 처리...
            if nIO = 1 then
            begin
              if bNCInProcWait then
              begin
                if nNCInWaitPoint = 20 then
                  nNCInWaitPoint := 1
                else
                  nNCInWaitPoint := nNCInWaitPoint + 1;

                RNCInWait[nNCInWaitPoint].sNCFile1 := sFile1;
                RNCInWait[nNCInWaitPoint].sNCCarNo1 := sCarNo1;
                RNCInWait[nNCInWaitPoint].sNCFile2 := sFile2;
                RNCInWait[nNCInWaitPoint].sNCCarNo2 := sCarNo2;
                RNCInWait[nNCInWaitPoint].sNCIOTime := sTime;
                RNCInWait[nNCInWaitPoint].nNCLprNo := nNo;
                RNCInWait[nNCInWaitPoint].nNCInOut := nIO;
                RNCInWait[nNCInWaitPoint].nNCRecog1 := nRecog1;
                RNCInWait[nNCInWaitPoint].nNCRecog2 := nRecog2;
                RNCInWait[nNCInWaitPoint].sNCDspIP := sDspIP;
                RNCInWait[nNCInWaitPoint].csNCLPR := csLPR;
                RNCInWait[nNCInWaitPoint].bBarOpen := bInBarOpen4;

                if not tNCInWait.Enabled then
                  tNCInWait.Enabled := True;
              end
              else
              begin
                NormalProc(sFile1, sCarNo1, sFile2, sCarNo2, sTime, nNo, nIO,
                  nRecog1, nRecog2, sDspIP, csLPR, bInBarOpen4);
              end;
            end
            else if nIO = 2 then
            begin
              if bNCOutProcWait then
              begin
                if nNCOutWaitPoint = 20 then
                  nNCOutWaitPoint := 1
                else
                  nNCOutWaitPoint := nNCOutWaitPoint + 1;

                RNCOutWait[nNCOutWaitPoint].sNCFile1 := sFile1;
                RNCOutWait[nNCOutWaitPoint].sNCCarNo1 := sCarNo1;
                RNCOutWait[nNCOutWaitPoint].sNCFile2 := sFile2;
                RNCOutWait[nNCOutWaitPoint].sNCCarNo2 := sCarNo2;
                RNCOutWait[nNCOutWaitPoint].sNCIOTime := sTime;
                RNCOutWait[nNCOutWaitPoint].nNCLprNo := nNo;
                RNCOutWait[nNCOutWaitPoint].nNCInOut := nIO;
                RNCOutWait[nNCOutWaitPoint].nNCRecog1 := nRecog1;
                RNCOutWait[nNCOutWaitPoint].nNCRecog2 := nRecog2;
                RNCOutWait[nNCOutWaitPoint].sNCDspIP := sDspIP;
                RNCOutWait[nNCOutWaitPoint].csNCLPR := csLPR;
                RNCOutWait[nNCOutWaitPoint].bBarOpen := True;

                if not tNCOutWait.Enabled then
                  tNCOutWait.Enabled := True;
              end
              else
              begin
                NormalProc(sFile1, sCarNo1, sFile2, sCarNo2, sTime, nNo, nIO,
                  nRecog1, nRecog2, sDspIP, csLPR, True);
              end;
            end;
          end;
        end;
      except
        on E: Exception do
          ExceptLogging('csInLpr4Read: ' + aString(E.Message));
      end;
    end
    else
    begin
      if sInLPRRecv4 = 'LPR_R' then
      begin
        Socket.SendText(aString('TIME' + FormatDateTime('YYYYMMDDHHNNSS', Now))
          );
        ExceptLogging('시간동기화 전송');
      end;
    end;
    sInLPRRecv4 := '';
  finally
    tInAlive4.Enabled := True;
  end;
end;

procedure TfrmMainNew.csInLpr5Read(Sender: TObject; Socket: TCustomWinSocket);
var
  nNo: Word;
  sLprData, sLprIP, sDspIP: aString;
  csLPR: TClientSocket;
  sRecv: aString;
  i: Byte;
  sCarNo1, sCarNo2, sTime, sTemp, sResult, sTest, sDir, sLocal1,
    sLocal2: String;
  sFile1, sFile2, sImgFile1, sImgFile2: String;
  nRecog1, nRecog2, nIO: Byte;
  hr: HRESULT;
  sSend: aString;
begin
  try
    tInAlive5.Enabled := False;
    sRecv := Socket.ReceiveText;
    sInLPRRecv5 := sRecv;
    ExceptLogging('LPR' + IntToStr(csInLpr5.Tag) + ' Recv: ' + sInLPRRecv5);

    if Length(sInLPRRecv5) > 15 then
    begin
      for i := 1 to 10 do
      begin
        if RLpr[i].nUnitNo = csInLpr5.Tag then
        begin
          sDspIP := RLpr[i].sDspIP;
          Break;
        end;
      end;

      nNo := csInLpr5.Tag;
      sLprData := sInLPRRecv5;
      sLprIP := csInLpr5.Host;
      sDspIP := sDspIP;
      csLPR := csInLpr5;

      try
        sCarNo1 := '';
        sCarNo2 := '';
        sFile1 := '';
        sFile2 := '';
        nRecog1 := 0;
        nRecog2 := 0;

        bInBarOpen5 := False;

        if Copy(sLprData, 1, 2) = 'NW' then
        begin
          // 후면촬영결과가 전면촬영차량과 다르다. (새로운 차량이다)
          // NW제거
          sTemp := Copy(sLprData, Pos('#', sLprData) + 1, Length(sLprData) - Pos
              ('#', sLprData));

          // CH제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 차량번호 추출
          sCarNo1 := Copy(sTemp, 1, Pos('#', sTemp) - 1);

          // 차량번호제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 인식여부 추출
          if (Copy(sTemp, 1, 1) = 'N') or (Copy(sTemp, 1, 1) = 'O') then
            nRecog1 := 1
          else if Copy(sTemp, 1, 1) = 'P' then
            nRecog1 := 2
          else
            nRecog1 := 3;

          sFile1 := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));
          sLocal1 := Copy(sFile1, Pos('CH', sFile1), Length(sFile1) -
              (Pos('CH', sFile1) - 1));
          sTime := MG_StrToStr(Copy(sFile1, Pos('_', sFile1) + 1, 14),
            '####-##-## ##:##:##');

          // 인식여부제거하여 파일명 추출
          sFile1 := 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr
            (sFile1, '\', '/');
        end
        else if Copy(sLprData, 1, 2) = 'UP' then
        begin
          // 오인식으로 전면과 후면촬영결과가 다르다...
          // 이때는 CarNo1과 CarNo2, Image1, Image2를 구분하여 넣는다.
          // 전면차량번호와 입차일시를 가지고 DB검색하여 CarNo2와 Image2를 업데이트한다.

          // UP제거
          sTemp := Copy(sLprData, Pos('#', sLprData) + 1, Length(sLprData) - Pos
              ('#', sLprData));

          // CH제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 차량번호1 추출
          sCarNo1 := Copy(sTemp, 1, Pos('#', sTemp) - 1);

          // 차량번호1제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 인식여부1 추출
          if (Copy(sTemp, 1, 1) = 'N') or (Copy(sTemp, 1, 1) = 'O') then
            nRecog1 := 1
          else if Copy(sTemp, 1, 1) = 'P' then
            nRecog1 := 2
          else
            nRecog1 := 3;

          // 인식여부1제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 파일명1 추출
          sFile1 := Copy(sTemp, 1, Pos('#', sTemp) - 1); // Copy(sTemp, Pos('#', sTemp)+1, Length(sTemp)-Pos('#', sTemp));
          sLocal1 := Copy(sFile1, Pos('CH', sFile1), Length(sFile1) -
              (Pos('CH', sFile1) - 1));
          sTime := MG_StrToStr(Copy(sFile1, Pos('_', sFile1) + 1, 14),
            '####-##-## ##:##:##');

          // 인식여부제거하여 파일명 추출
          sFile1 := 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr
            (sFile1, '\', '/');

          // 파일명1제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // CH제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 차량번호2 추출
          sCarNo2 := Copy(sTemp, 1, Pos('#', sTemp) - 1);

          // 차량번호2제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 인식여부2 추출
          if (Copy(sTemp, 1, 1) = 'N') or (Copy(sTemp, 1, 1) = 'O') then
            nRecog2 := 1
          else if Copy(sTemp, 1, 1) = 'P' then
            nRecog2 := 2
          else
            nRecog2 := 3;

          sLocal2 := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));
          sLocal2 := Copy(sLocal2, Pos('CH', sLocal2), Length(sLocal2) -
              (Pos('CH', sLocal2) - 1));

          // 인식여부2제거하여 파일명2 추출
          sFile2 := 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr
            (Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos('#', sTemp)),
            '\', '/');

          with dmTables.qryRecvInLPR5 do
          begin
            Close;
            SQL.Clear;
            SQL.Add(
              'Select * from IONData where ProcDate = :N1 and ProcTime = :N2 and InCarNo1 = :N3');
            Parameters.ParamByName('N1').Value := Copy(sTime, 1, 10);
            Parameters.ParamByName('N2').Value := Copy(sTime, 12, 8);
            Parameters.ParamByName('N3').Value := sCarNo1;
            Open;

            if RecordCount > 0 then
            begin
              Close;
              SQL.Clear;
              SQL.Add(
                'Update IONData Set InCarNo2 = :N1, InImage2 = :N2, InRecog2 = :N6 ');
              SQL.Add(
                'where ProcDate = :N3 and ProcTime = :N4 and InCarNo1 = :N5');
              Parameters.ParamByName('N1').Value := sCarNo2;
              Parameters.ParamByName('N2').Value := sFile2;
              Parameters.ParamByName('N3').Value := Copy(sTime, 1, 10);
              Parameters.ParamByName('N4').Value := Copy(sTime, 12, 8);
              Parameters.ParamByName('N5').Value := sCarNo1;
              Parameters.ParamByName('N6').Value := nRecog2;
              ExecSQL;
            end;
          end;
          Exit;
        end
        else if Copy(sLprData, 1, 2) = 'NP' then
        begin
          // 전면촬영된 차량과 후면촬영된 차량이 다르다.
          // 이때는 CarNo2를 개별차량으로 하여 신규입차처리한다.
          // CarNo2, File2, Recog2, Time2 로 신규입차 처리.

          // NP제거
          sTemp := Copy(sLprData, Pos('#', sLprData) + 1, Length(sLprData) - Pos
              ('#', sLprData));

          // CH제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 차량번호1 추출
          sCarNo1 := Copy(sTemp, 1, Pos('#', sTemp) - 1);

          // 차량번호1제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 인식여부1 추출
          if (Copy(sTemp, 1, 1) = 'N') or (Copy(sTemp, 1, 1) = 'O') then
            nRecog1 := 1
          else if Copy(sTemp, 1, 1) = 'P' then
            nRecog1 := 2
          else
            nRecog1 := 3;

          // 인식여부1제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 파일명1 추출
          sFile1 := Copy(sTemp, 1, Pos('#', sTemp) - 1); // Copy(sTemp, Pos('#', sTemp)+1, Length(sTemp)-Pos('#', sTemp));
          sLocal1 := Copy(sFile1, Pos('CH', sFile1), Length(sFile1) -
              (Pos('CH', sFile1) - 1));
          sTime := MG_StrToStr(Copy(sFile1, Pos('_', sFile1) + 1, 14),
            '####-##-## ##:##:##');

          // 인식여부제거하여 파일명 추출
          sFile1 := 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr
            (sFile1, '\', '/');

          // 파일명1제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // CH제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 차량번호2 추출
          sCarNo2 := Copy(sTemp, 1, Pos('#', sTemp) - 1);

          // 차량번호2제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 인식여부2 추출
          if (Copy(sTemp, 1, 1) = 'N') or (Copy(sTemp, 1, 1) = 'O') then
            nRecog2 := 1
          else if Copy(sTemp, 1, 1) = 'P' then
            nRecog2 := 2
          else
            nRecog2 := 3;

          sLocal2 := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));
          sLocal2 := Copy(sLocal2, Pos('CH', sLocal2), Length(sLocal2) -
              (Pos('CH', sLocal2) - 1));
          sFile2 := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));
          sTime := MG_StrToStr(Copy(sFile2, Pos('_', sFile2) + 1, 14),
            '####-##-## ##:##:##');

          // 인식여부2제거하여 파일명2 추출
          sFile2 := 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr
            (sFile2, '\', '/');
          sCarNo1 := sCarNo2;
          sFile1 := sFile2;
          nRecog1 := nRecog2;
          sLocal1 := sLocal2;
          sCarNo2 := '';
          sFile2 := '';
          nRecog2 := 0;
          sLocal2 := '';
        end
        else
        begin
          bInBarOpen5 := True;

          // CH제거
          sTemp := Copy(sLprData, Pos('#', sLprData) + 1, Length(sLprData) - Pos
              ('#', sLprData));

          // 차량번호 추출
          sCarNo1 := Copy(sTemp, 1, Pos('#', sTemp) - 1);

          // 차량번호제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 인식여부 추출
          if (Copy(sTemp, 1, 1) = 'N') or (Copy(sTemp, 1, 1) = 'O') then
            nRecog1 := 1
          else if Copy(sTemp, 1, 1) = 'P' then
            nRecog1 := 2
          else
            nRecog1 := 3;

          // 인식여부제거하여 파일명 추출
          sFile1 := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));
          sLocal1 := Copy(sFile1, Pos('CH', sFile1), Length(sFile1) -
              (Pos('CH', sFile1) - 1));
          sTime := MG_StrToStr(Copy(sFile1, Pos('_', sFile1) + 1, 14),
            '####-##-## ##:##:##');

          // 인식여부제거하여 파일명 추출
          sFile1 := 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr
            (sFile1, '\', '/');
        end;
        ExceptLogging('LPR Check: ' + sCarNo1 + ',' + sFile1 + ',' + IntToStr
            (nRecog1) + ',' + sCarNo2 + ',' + sFile2 + ',' + IntToStr(nRecog2)
            + ', ' + sTime);
        sDir := sImageDir + '\' + Copy(sTime, 1, 4) + '\' + Copy(sTime, 6, 2)
          + '\' + Copy(sTime, 9, 2) + '\' + IntToStr(nNo);

        if not DirectoryExists(sDir) then
        begin
          if not ForceDirectories(sDir) then
            ExceptLogging('이미지저장폴더 생성실패: ' + sDir);
        end;

        sImgFile1 := sDir + '\' + sLocal1;
        sImgFile2 := sDir + '\' + sLocal2;

        if sFile1 <> '' then
        begin
          sTemp := Copy(sFile1, 6, Length(sFile1) - 5);
          sImgFile1 := Copy(sTemp, 1, Pos(':9080', sTemp) - 1);
          sImgFile1 := sImgFile1 + Copy(sTemp, Pos(':9080', sTemp) + 5, Length
              (sTemp) - (Pos(':9080', sTemp) + 4));
          sImgFile1 := MG_StrConvert(sImgFile1, '/', '\');
          ExceptLogging('File: ' + sImgFile1);
        end;

        if sFile2 <> '' then
        begin
          sTemp := Copy(sFile2, 6, Length(sFile2) - 5);
          sImgFile2 := Copy(sTemp, 1, Pos(':9080', sTemp) - 1);
          sImgFile2 := sImgFile2 + Copy(sTemp, Pos(':9080', sTemp) + 5, Length
              (sTemp) - (Pos(':9080', sTemp) + 4));
          sImgFile2 := MG_StrConvert(sImgFile2, '/', '\');
          ExceptLogging('File: ' + sImgFile2);
        end;

        for i := 1 to 10 do
        begin
          if RLpr[i].nUnitNo = nNo then
            nIO := RLpr[i].nIO;
        end;

        with dmTables.qryInLpr5Proc do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Select * from CustInfo ');

          if sCarNo2 <> '' then
          begin
            SQL.Add('where ((CarNo = :N1) or (CarNo = :N2)) and ((ExpDateF <= :N3) and (ExpDateT >= :N4)) and TKType = 2');
            SQL.Add(' order by GroupNo desc ');
            Parameters.ParamByName('N1').Value := sCarNo1;
            Parameters.ParamByName('N2').Value := sCarNo2;
            Parameters.ParamByName('N3').Value := FormatDateTime('YYYY-MM-DD', Now);
            Parameters.ParamByName('N4').Value := FormatDateTime('YYYY-MM-DD', Now);
            Open;
          end
          else
          if sCarNo1 <> '' then
          begin
            SQL.Add('where (CarNo = :N1) and ((ExpDateF <= :N3) and (ExpDateT >= :N4)) and TKType = 2');
            SQL.Add(' order by GroupNo desc ');
            Parameters.ParamByName('N1').Value := sCarNo1;
            Parameters.ParamByName('N3').Value := FormatDateTime('YYYY-MM-DD', Now);
            Parameters.ParamByName('N4').Value := FormatDateTime('YYYY-MM-DD', Now);
            Open;
          end;

          if RecordCount > 0 then
          begin
            // 등록된 정기차량이면...
            // 유효기간이 만료되지 않은 사용가능한 정기차량이면...
            if bSCProcWait then
            begin
              if nSCWaitPoint = 20 then
                nSCWaitPoint := 1
              else
                nSCWaitPoint := nSCWaitPoint + 1;

              RSCWait[nSCWaitPoint].sSCFile1 := sFile1;
              RSCWait[nSCWaitPoint].sSCCarNo1 := sCarNo1;
              RSCWait[nSCWaitPoint].sSCFile2 := sFile2;
              RSCWait[nSCWaitPoint].sSCCarNo2 := sCarNo2;
              RSCWait[nSCWaitPoint].sSCIOTime := sTime;
              RSCWait[nSCWaitPoint].nSCLprNo := nNo;
              RSCWait[nSCWaitPoint].nSCInOut := nIO;
              RSCWait[nSCWaitPoint].nSCRecog1 := nRecog1;
              RSCWait[nSCWaitPoint].nSCRecog2 := nRecog2;
              RSCWait[nSCWaitPoint].sSCDspIP := sDspIP;
              RSCWait[nSCWaitPoint].csSCLPR := csLPR;
              RSCWait[nSCWaitPoint].bBarOpen := bInBarOpen5;

              if not tSCWait.Enabled then
                tSCWait.Enabled := True;
            end
            else
            begin
              sResult := RecvLprProc(sFile1, sCarNo1, sFile2, sCarNo2, sTime,
                nNo, nIO, nRecog1, nRecog2, sDspIP, csLPR, bInBarOpen5);

              // 입차시의 이미지는 표시하지 않는다.  2012-05-07 UI 관련 미팅시 송우식 과장...
              // 일반차량 출차시 출차이미지와 함께 입차이미지를 표시한다....
              GridData(sResult);
            end;
          end
          else
          begin
            // 일반차량 처리...
            if nIO = 1 then
            begin
              if bNCInProcWait then
              begin
                if nNCInWaitPoint = 20 then
                  nNCInWaitPoint := 1
                else
                  nNCInWaitPoint := nNCInWaitPoint + 1;

                RNCInWait[nNCInWaitPoint].sNCFile1 := sFile1;
                RNCInWait[nNCInWaitPoint].sNCCarNo1 := sCarNo1;
                RNCInWait[nNCInWaitPoint].sNCFile2 := sFile2;
                RNCInWait[nNCInWaitPoint].sNCCarNo2 := sCarNo2;
                RNCInWait[nNCInWaitPoint].sNCIOTime := sTime;
                RNCInWait[nNCInWaitPoint].nNCLprNo := nNo;
                RNCInWait[nNCInWaitPoint].nNCInOut := nIO;
                RNCInWait[nNCInWaitPoint].nNCRecog1 := nRecog1;
                RNCInWait[nNCInWaitPoint].nNCRecog2 := nRecog2;
                RNCInWait[nNCInWaitPoint].sNCDspIP := sDspIP;
                RNCInWait[nNCInWaitPoint].csNCLPR := csLPR;
                RNCInWait[nNCInWaitPoint].bBarOpen := bInBarOpen5;

                if not tNCInWait.Enabled then
                  tNCInWait.Enabled := True;
              end
              else
              begin
                NormalProc(sFile1, sCarNo1, sFile2, sCarNo2, sTime, nNo, nIO,
                  nRecog1, nRecog2, sDspIP, csLPR, bInBarOpen5);
              end;
            end
            else if nIO = 2 then
            begin
              if bNCOutProcWait then
              begin
                if nNCOutWaitPoint = 20 then
                  nNCOutWaitPoint := 1
                else
                  nNCOutWaitPoint := nNCOutWaitPoint + 1;

                RNCOutWait[nNCOutWaitPoint].sNCFile1 := sFile1;
                RNCOutWait[nNCOutWaitPoint].sNCCarNo1 := sCarNo1;
                RNCOutWait[nNCOutWaitPoint].sNCFile2 := sFile2;
                RNCOutWait[nNCOutWaitPoint].sNCCarNo2 := sCarNo2;
                RNCOutWait[nNCOutWaitPoint].sNCIOTime := sTime;
                RNCOutWait[nNCOutWaitPoint].nNCLprNo := nNo;
                RNCOutWait[nNCOutWaitPoint].nNCInOut := nIO;
                RNCOutWait[nNCOutWaitPoint].nNCRecog1 := nRecog1;
                RNCOutWait[nNCOutWaitPoint].nNCRecog2 := nRecog2;
                RNCOutWait[nNCOutWaitPoint].sNCDspIP := sDspIP;
                RNCOutWait[nNCOutWaitPoint].csNCLPR := csLPR;
                RNCOutWait[nNCOutWaitPoint].bBarOpen := True;

                if not tNCOutWait.Enabled then
                  tNCOutWait.Enabled := True;
              end
              else
              begin
                NormalProc(sFile1, sCarNo1, sFile2, sCarNo2, sTime, nNo, nIO,
                  nRecog1, nRecog2, sDspIP, csLPR, True);
              end;
            end;
          end;
        end;
      except
        on E: Exception do
          ExceptLogging('csInLpr5Read: ' + aString(E.Message));
      end;
    end
    else
    begin
      if sInLPRRecv5 = 'LPR_R' then
      begin
        Socket.SendText(aString('TIME' + FormatDateTime('YYYYMMDDHHNNSS', Now))
          );
        ExceptLogging('시간동기화 전송');
      end;
    end;
    sInLPRRecv5 := '';
  finally
    tInAlive5.Enabled := True;
  end;
end;

procedure TfrmMainNew.csOutDsp1Error(Sender: TObject; Socket: TCustomWinSocket;
  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
  ExceptLogging('csOutDsp1Error: ' + IntToStr(ErrorCode));
  ErrorCode := 0;
end;

procedure TfrmMainNew.csOutDsp2Error(Sender: TObject; Socket: TCustomWinSocket;
  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
  ExceptLogging('csOutDsp2Error: ' + IntToStr(ErrorCode));
  ErrorCode := 0;
end;

procedure TfrmMainNew.csOutDsp3Error(Sender: TObject; Socket: TCustomWinSocket;
  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
  ExceptLogging('csOutDsp3Error: ' + IntToStr(ErrorCode));
  ErrorCode := 0;
end;

procedure TfrmMainNew.csOutLpr1Read(Sender: TObject; Socket: TCustomWinSocket);
var
  nNo, nTempInUnitNo: Word;
  sLprData, sLprIP, sDspIP: aString;
  csLPR: TClientSocket;
  sRecv, sExpDateF, sExpDateT, sTempInDate, sTempInTime, sTempInFile: aString;
  i: Byte;
  sCarNo1, sCarNo2, sTime, sTemp, sResult, sTest, sDir, sLocal1,
    sLocal2: String;
  sFile1, sFile2, sImgFile1, sImgFile2: String;
  nRecog1, nRecog2, nIO, NBujae : Byte;
  hr: HRESULT;
  sSend: aString;
begin
  try
    tOutAlive1.Enabled := False;
    sRecv := Socket.ReceiveText;
    sOutLPRRecv1 := sRecv;
    ExceptLogging('LPR' + IntToStr(csOutLpr1.Tag) + ' Recv: ' + sOutLPRRecv1);

    if nFCMode = 1 then begin
      exit;
    end;

    if Length(sOutLPRRecv1) > 15 then
    begin
      for i := 1 to 10 do
      begin
        if RLpr[i].nUnitNo = csOutLpr1.Tag then
        begin
          sDspIP := RLpr[i].sDspIP;
          Break;
        end;
      end;
      nNo := csOutLpr1.Tag;
      sLprData := sOutLPRRecv1;
      sLprIP := csOutLpr1.Host;
      sDspIP := sDspIP;
      csLPR := csOutLpr1;

      try
        sCarNo1 := '';
        sCarNo2 := '';
        sFile1 := '';
        sFile2 := '';
        nRecog1 := 0;
        nRecog2 := 0;

        if Copy(sLprData, 1, 2) = 'NW' then
        begin
          // 후면촬영결과가 전면촬영차량과 다르다. (새로운 차량이다)
          // NW제거
          sTemp := Copy(sLprData, Pos('#', sLprData) + 1, Length(sLprData) - Pos
              ('#', sLprData));

          // CH제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 차량번호 추출
          sCarNo1 := Copy(sTemp, 1, Pos('#', sTemp) - 1);

          // 차량번호제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 인식여부 추출
          if (Copy(sTemp, 1, 1) = 'N') or (Copy(sTemp, 1, 1) = 'O') then
            nRecog1 := 1
          else if Copy(sTemp, 1, 1) = 'P' then
            nRecog1 := 2
          else
            nRecog1 := 3;

          sFile1 := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));
          sLocal1 := Copy(sFile1, Pos('CH', sFile1), Length(sFile1) -
              (Pos('CH', sFile1) - 1));
          sTime := MG_StrToStr(Copy(sFile1, Pos('_', sFile1) + 1, 14),
            '####-##-## ##:##:##');

          // 인식여부제거하여 파일명 추출
          sFile1 := 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr
            (sFile1, '\', '/');
        end
        else if Copy(sLprData, 1, 2) = 'UP' then
        begin
          // 오인식으로 전면과 후면촬영결과가 다르다...
          // 이때는 CarNo1과 CarNo2, Image1, Image2를 구분하여 넣는다.
          // 전면차량번호와 입차일시를 가지고 DB검색하여 CarNo2와 Image2를 업데이트한다.

          // UP제거
          sTemp := Copy(sLprData, Pos('#', sLprData) + 1, Length(sLprData) - Pos
              ('#', sLprData));

          // CH제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 차량번호1 추출
          sCarNo1 := Copy(sTemp, 1, Pos('#', sTemp) - 1);

          // 차량번호1제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 인식여부1 추출
          if (Copy(sTemp, 1, 1) = 'N') or (Copy(sTemp, 1, 1) = 'O') then
            nRecog1 := 1
          else if Copy(sTemp, 1, 1) = 'P' then
            nRecog1 := 2
          else
            nRecog1 := 3;

          // 인식여부1제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 파일명1 추출
          sFile1 := Copy(sTemp, 1, Pos('#', sTemp) - 1); // Copy(sTemp, Pos('#', sTemp)+1, Length(sTemp)-Pos('#', sTemp));
          sLocal1 := Copy(sFile1, Pos('CH', sFile1), Length(sFile1) -
              (Pos('CH', sFile1) - 1));
          sTime := MG_StrToStr(Copy(sFile1, Pos('_', sFile1) + 1, 14),
            '####-##-## ##:##:##');

          // 인식여부제거하여 파일명 추출
          sFile1 := 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr
            (sFile1, '\', '/');

          // 파일명1제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // CH제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 차량번호2 추출
          sCarNo2 := Copy(sTemp, 1, Pos('#', sTemp) - 1);

          // 차량번호2제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 인식여부2 추출
          if (Copy(sTemp, 1, 1) = 'N') or (Copy(sTemp, 1, 1) = 'O') then
            nRecog2 := 1
          else if Copy(sTemp, 1, 1) = 'P' then
            nRecog2 := 2
          else
            nRecog2 := 3;

          sLocal2 := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));
          sLocal2 := Copy(sLocal2, Pos('CH', sLocal2), Length(sLocal2) -
              (Pos('CH', sLocal2) - 1));

          // 인식여부2제거하여 파일명2 추출
          sFile2 := 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr
            (Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos('#', sTemp)),
            '\', '/');

          with dmTables.qryRecvOutLPR1 do
          begin
            Close;
            SQL.Clear;
            SQL.Add('Select * from IONData where ProcDate = :N1 and ProcTime = :N2 and InCarNo1 = :N3');
            Parameters.ParamByName('N1').Value := Copy(sTime, 1, 10);
            Parameters.ParamByName('N2').Value := Copy(sTime, 12, 8);
            Parameters.ParamByName('N3').Value := sCarNo1;
            Open;

            if RecordCount > 0 then
            begin
              Close;
              SQL.Clear;
              SQL.Add('Update IONData Set InCarNo2 = :N1, InImage2 = :N2, InRecog2 = :N6 ');
              SQL.Add('where ProcDate = :N3 and ProcTime = :N4 and InCarNo1 = :N5');
              Parameters.ParamByName('N1').Value := sCarNo2;
              Parameters.ParamByName('N2').Value := sFile2;
              Parameters.ParamByName('N3').Value := Copy(sTime, 1, 10);
              Parameters.ParamByName('N4').Value := Copy(sTime, 12, 8);
              Parameters.ParamByName('N5').Value := sCarNo1;
              Parameters.ParamByName('N6').Value := nRecog2;
              ExecSQL;
            end;
          end;
          Exit;
        end
        else if Copy(sLprData, 1, 2) = 'NP' then
        begin
          // 전면촬영된 차량과 후면촬영된 차량이 다르다.
          // 이때는 CarNo2를 개별차량으로 하여 신규입차처리한다.
          // CarNo2, File2, Recog2, Time2 로 신규입차 처리.

          // NP제거
          sTemp := Copy(sLprData, Pos('#', sLprData) + 1, Length(sLprData) - Pos('#', sLprData));

          // CH제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos('#', sTemp));

          // 차량번호1 추출
          sCarNo1 := Copy(sTemp, 1, Pos('#', sTemp) - 1);

          // 차량번호1제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos('#', sTemp));

          // 인식여부1 추출
          if (Copy(sTemp, 1, 1) = 'N') or (Copy(sTemp, 1, 1) = 'O') then
            nRecog1 := 1
          else if Copy(sTemp, 1, 1) = 'P' then
            nRecog1 := 2
          else
            nRecog1 := 3;

          // 인식여부1제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 파일명1 추출
          sFile1 := Copy(sTemp, 1, Pos('#', sTemp) - 1); // Copy(sTemp, Pos('#', sTemp)+1, Length(sTemp)-Pos('#', sTemp));
          sLocal1 := Copy(sFile1, Pos('CH', sFile1), Length(sFile1) - (Pos('CH', sFile1) - 1));
          sTime := MG_StrToStr(Copy(sFile1, Pos('_', sFile1) + 1, 14), '####-##-## ##:##:##');

          // 인식여부제거하여 파일명 추출
          sFile1 := 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr(sFile1, '\', '/');

          // 파일명1제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos('#', sTemp));

          // CH제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos('#', sTemp));

          // 차량번호2 추출
          sCarNo2 := Copy(sTemp, 1, Pos('#', sTemp) - 1);

          // 차량번호2제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 인식여부2 추출
          if (Copy(sTemp, 1, 1) = 'N') or (Copy(sTemp, 1, 1) = 'O') then
            nRecog2 := 1
          else if Copy(sTemp, 1, 1) = 'P' then
            nRecog2 := 2
          else
            nRecog2 := 3;

          sLocal2 := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));
          sLocal2 := Copy(sLocal2, Pos('CH', sLocal2), Length(sLocal2) -
              (Pos('CH', sLocal2) - 1));
          sFile2 := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));
          sTime := MG_StrToStr(Copy(sFile2, Pos('_', sFile2) + 1, 14),
            '####-##-## ##:##:##');

          // 인식여부2제거하여 파일명2 추출
          sFile2 := 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr
            (sFile2, '\', '/');
          sCarNo1 := sCarNo2;
          sFile1 := sFile2;
          nRecog1 := nRecog2;
          sLocal1 := sLocal2;
          sCarNo2 := '';
          sFile2 := '';
          nRecog2 := 0;
          sLocal2 := '';
        end
        else
        begin
          // CH제거
          sTemp := Copy(sLprData, Pos('#', sLprData) + 1, Length(sLprData) - Pos
              ('#', sLprData));

          // 차량번호 추출
          sCarNo1 := Copy(sTemp, 1, Pos('#', sTemp) - 1);

          // 차량번호제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 인식여부 추출
          if (Copy(sTemp, 1, 1) = 'N') or (Copy(sTemp, 1, 1) = 'O') then
            nRecog1 := 1
          else if Copy(sTemp, 1, 1) = 'P' then
            nRecog1 := 2
          else
            nRecog1 := 3;

          // 인식여부제거하여 파일명 추출
          sFile1 := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));
          sLocal1 := Copy(sFile1, Pos('CH', sFile1), Length(sFile1) -
              (Pos('CH', sFile1) - 1));
          sTime := MG_StrToStr(Copy(sFile1, Pos('_', sFile1) + 1, 14),
            '####-##-## ##:##:##');

          // 인식여부제거하여 파일명 추출
          sFile1 := 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr
            (sFile1, '\', '/');
        end;
        ExceptLogging('LPR Check: ' + sCarNo1 + ',' + sFile1 + ',' + IntToStr
            (nRecog1) + ',' + sCarNo2 + ',' + sFile2 + ',' + IntToStr(nRecog2)
            + ', ' + sTime);
        sDir := sImageDir + '\' + Copy(sTime, 1, 4) + '\' + Copy(sTime, 6, 2)
          + '\' + Copy(sTime, 9, 2) + '\' + IntToStr(nNo);

        if not DirectoryExists(sDir) then
        begin
          if not ForceDirectories(sDir) then
            ExceptLogging('이미지저장폴더 생성실패: ' + sDir);
        end;

        sImgFile1 := sDir + '\' + sLocal1;
        sImgFile2 := sDir + '\' + sLocal2;

        if sFile1 <> '' then
        begin
          sTemp := Copy(sFile1, 6, Length(sFile1) - 5);
          sImgFile1 := Copy(sTemp, 1, Pos(':9080', sTemp) - 1);
          sImgFile1 := sImgFile1 + Copy(sTemp, Pos(':9080', sTemp) + 5, Length
              (sTemp) - (Pos(':9080', sTemp) + 4));
          sImgFile1 := MG_StrConvert(sImgFile1, '/', '\');
          ExceptLogging('File: ' + sImgFile1);
        end;

        if sFile2 <> '' then
        begin
          sTemp := Copy(sFile2, 6, Length(sFile2) - 5);
          sImgFile2 := Copy(sTemp, 1, Pos(':9080', sTemp) - 1);
          sImgFile2 := sImgFile2 + Copy(sTemp, Pos(':9080', sTemp) + 5, Length
              (sTemp) - (Pos(':9080', sTemp) + 4));
          sImgFile2 := MG_StrConvert(sImgFile2, '/', '\');
          ExceptLogging('File: ' + sImgFile2);
        end;

        for i := 1 to 10 do
        begin
          if RLpr[i].nUnitNo = nNo then
            nIO := RLpr[i].nIO;
        end;

        with dmTables.qryOutLpr1Proc do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Select * from CustInfo ');

          if sCarNo2 <> '' then
          begin
            SQL.Add('where ((CarNo = :N1) or (CarNo = :N2)) and TKType = 2');
            Parameters.ParamByName('N1').Value := sCarNo1;
            Parameters.ParamByName('N2').Value := sCarNo2;
            Open;
          end
          else
          if sCarNo1 <> '' then
          begin
            SQL.Add('where CarNo = :N1 and TKType = 2');
            Parameters.ParamByName('N1').Value := sCarNo1;
            Open;
          end;

          if RecordCount > 0 then
          begin
            // 등록된 정기차량이면...
            sExpDateF := FieldByName('ExpDateF').AsString;
            sExpDateT := FieldByName('ExpDateT').AsString;
            nBujae := FieldByName('BujaeType').AsInteger;

            if (sExpDateF <= FormatDateTime('YYYY-MM-DD', Now)) and (sExpDateT >= FormatDateTime('YYYY-MM-DD', Now)) then
            begin
              // 사용가능한 정기차량이면...
              if bSCProcWait then
              begin
                if nSCWaitPoint = 20 then
                  nSCWaitPoint := 1
                else
                  nSCWaitPoint := nSCWaitPoint + 1;

                RSCWait[nSCWaitPoint].sSCFile1 := sFile1;
                RSCWait[nSCWaitPoint].sSCCarNo1 := sCarNo1;
                RSCWait[nSCWaitPoint].sSCFile2 := sFile2;
                RSCWait[nSCWaitPoint].sSCCarNo2 := sCarNo2;
                RSCWait[nSCWaitPoint].sSCIOTime := sTime;
                RSCWait[nSCWaitPoint].nSCLprNo := nNo;
                RSCWait[nSCWaitPoint].nSCInOut := nIO;
                RSCWait[nSCWaitPoint].nSCRecog1 := nRecog1;
                RSCWait[nSCWaitPoint].nSCRecog2 := nRecog2;
                RSCWait[nSCWaitPoint].sSCDspIP := sDspIP;
                RSCWait[nSCWaitPoint].csSCLPR := csLPR;
                RSCWait[nSCWaitPoint].bBarOpen := True;
                RSCWait[nSCWaitPoint].nBujae := nBujae;

                if not tSCWait.Enabled then
                  tSCWait.Enabled := True;
              end
              else
              begin
                Close;
                SQL.Clear;
                SQL.Add('Select * from IOSData ');
                SQL.Add('where ((InCarNo1 = :N1) or (InCarNo2 = :N2)) ');
                SQL.Add('Order By ProcDate Desc, ProcTime Desc');
                Parameters.ParamByName('N1').Value := sCarNo1;
                Parameters.ParamByName('N2').Value := sCarNo1;
                Open;

                lblBujae.Visible := false;

                if RecordCount > 0 then
                  First;

                  if FieldByName('OutDate').AsString= '' then begin
                     // 정기차량중에 부제 타입을 처리하는가 안하는가를 판단 0일때 부재 상관없이 상시 통과, 1일때 주말에 요금 부과
                     if (nBujae = 1)  then begin
                        if HuilCheck then begin
                          lblBujae.Visible := true;
                          sTempInDate := FieldByName('ProcDate').AsString;
                          sTempInTime := FieldByName('ProcTime').AsString;
                          nTempInUnitNo := FieldByName('UnitNo').AsInteger;
                          sTempInFile := FieldByName('InImage1').AsString;

                          Close;
                          SQL.Clear;
                          SQL.Add('Update IOSData Set OutUnitNo = :N1, OutDate = :N2, OutTime = :N3, ');
                          SQL.Add('OutIOStatusNo = :N4, OutImage1 = :N5, OutCarNo1 = :N6 ');
                          SQL.Add('where ((InCarNo1 = :N7) or (InCarNo2 = :N11)) and ');
                          SQL.Add('ProcDate = :N8 and ProcTime = :N9 and UnitNo = :N10');
                          Parameters.ParamByName('N1').Value := nNo;
                          Parameters.ParamByName('N2').Value := Copy(sTime, 1, 10);
                          Parameters.ParamByName('N3').Value := Copy(sTime, 12, 8);
                          Parameters.ParamByName('N4').Value := 20;
                          Parameters.ParamByName('N5').Value := sFile1;
                          Parameters.ParamByName('N6').Value := sCarNo1;
                          Parameters.ParamByName('N7').Value := sCarNo1;
                          Parameters.ParamByName('N8').Value := sTempInDate;
                          Parameters.ParamByName('N9').Value := sTempInTime;
                          Parameters.ParamByName('N10').Value := nTempInUnitNo;
                          Parameters.ParamByName('N11').Value := sCarNo1;
                          ExecSQL;
                          nNowCharo := 1;
                          SCNormalOut(sFile1, sCarNo1, sFile2, sCarNo2, sTime, nNo, nIO, nRecog1, nRecog2, sDspIP, csLPR,
                                      sTempInDate, sTempInTime, sTempInFile, nTempInUnitNo);

                        end
                        else begin
                          sResult := RecvLprProc(sFile1, sCarNo1, sFile2, sCarNo2, sTime, nNo, nIO, nRecog1, nRecog2, sDspIP, csLPR, True);

                          GridData(sResult);
                        end;

                     end
                     else begin
                        sResult := RecvLprProc(sFile1, sCarNo1, sFile2, sCarNo2, sTime, nNo, nIO, nRecog1, nRecog2, sDspIP, csLPR, True);

                        GridData(sResult);
                     end;
                  end
                  else begin
                    sResult := RecvLprProc(sFile1, sCarNo1, sFile2, sCarNo2, sTime, nNo, nIO, nRecog1, nRecog2, sDspIP, csLPR, True);

                    // 입차시의 이미지는 표시하지 않는다.  2012-05-07 UI 관련 미팅시 송우식 과장...
                    // 일반차량 출차시 출차이미지와 함께 입차이미지를 표시한다....
                    GridData(sResult);
                  end;
              end;
            end
            else
            begin
              // 일반차량처리...
              if nIO = 1 then
              begin
                if bNCInProcWait then
                begin
                  if nNCInWaitPoint = 20 then
                    nNCInWaitPoint := 1
                  else
                    nNCInWaitPoint := nNCInWaitPoint + 1;

                  RNCInWait[nNCInWaitPoint].sNCFile1 := sFile1;
                  RNCInWait[nNCInWaitPoint].sNCCarNo1 := sCarNo1;
                  RNCInWait[nNCInWaitPoint].sNCFile2 := sFile2;
                  RNCInWait[nNCInWaitPoint].sNCCarNo2 := sCarNo2;
                  RNCInWait[nNCInWaitPoint].sNCIOTime := sTime;
                  RNCInWait[nNCInWaitPoint].nNCLprNo := nNo;
                  RNCInWait[nNCInWaitPoint].nNCInOut := nIO;
                  RNCInWait[nNCInWaitPoint].nNCRecog1 := nRecog1;
                  RNCInWait[nNCInWaitPoint].nNCRecog2 := nRecog2;
                  RNCInWait[nNCInWaitPoint].sNCDspIP := sDspIP;
                  RNCInWait[nNCInWaitPoint].csNCLPR := csLPR;
                  RNCInWait[nNCInWaitPoint].bBarOpen := True;

                  if not tNCInWait.Enabled then
                    tNCInWait.Enabled := True;
                end
                else
                begin
                  NormalProc(sFile1, sCarNo1, sFile2, sCarNo2, sTime, nNo, nIO,
                    nRecog1, nRecog2, sDspIP, csLPR, True);
                end;
              end
              else if nIO = 2 then
              begin
                if bNCOutProcWait then
                begin
                  if nNCOutWaitPoint = 20 then
                    nNCOutWaitPoint := 1
                  else
                    nNCOutWaitPoint := nNCOutWaitPoint + 1;

                  RNCOutWait[nNCOutWaitPoint].sNCFile1 := sFile1;
                  RNCOutWait[nNCOutWaitPoint].sNCCarNo1 := sCarNo1;
                  RNCOutWait[nNCOutWaitPoint].sNCFile2 := sFile2;
                  RNCOutWait[nNCOutWaitPoint].sNCCarNo2 := sCarNo2;
                  RNCOutWait[nNCOutWaitPoint].sNCIOTime := sTime;
                  RNCOutWait[nNCOutWaitPoint].nNCLprNo := nNo;
                  RNCOutWait[nNCOutWaitPoint].nNCInOut := nIO;
                  RNCOutWait[nNCOutWaitPoint].nNCRecog1 := nRecog1;
                  RNCOutWait[nNCOutWaitPoint].nNCRecog2 := nRecog2;
                  RNCOutWait[nNCOutWaitPoint].nNCCharo := 1;
                  RNCOutWait[nNCOutWaitPoint].sNCDspIP := sDspIP;
                  RNCOutWait[nNCOutWaitPoint].csNCLPR := csLPR;
                  RNCOutWait[nNCOutWaitPoint].bBarOpen := True;

                  if not tNCOutWait.Enabled then
                    tNCOutWait.Enabled := True;
                end
                else
                begin
                  nNowCharo := 1;
                  NormalProc(sFile1, sCarNo1, sFile2, sCarNo2, sTime, nNo, nIO,
                    nRecog1, nRecog2, sDspIP, csLPR, True);
                end;
              end;
            end;
          end
          else
          begin
            // 일반차량 처리...
            if nIO = 1 then
            begin
              if bNCInProcWait then
              begin
                if nNCInWaitPoint = 20 then
                  nNCInWaitPoint := 1
                else
                  nNCInWaitPoint := nNCInWaitPoint + 1;

                RNCInWait[nNCInWaitPoint].sNCFile1 := sFile1;
                RNCInWait[nNCInWaitPoint].sNCCarNo1 := sCarNo1;
                RNCInWait[nNCInWaitPoint].sNCFile2 := sFile2;
                RNCInWait[nNCInWaitPoint].sNCCarNo2 := sCarNo2;
                RNCInWait[nNCInWaitPoint].sNCIOTime := sTime;
                RNCInWait[nNCInWaitPoint].nNCLprNo := nNo;
                RNCInWait[nNCInWaitPoint].nNCInOut := nIO;
                RNCInWait[nNCInWaitPoint].nNCRecog1 := nRecog1;
                RNCInWait[nNCInWaitPoint].nNCRecog2 := nRecog2;
                RNCInWait[nNCInWaitPoint].sNCDspIP := sDspIP;
                RNCInWait[nNCInWaitPoint].csNCLPR := csLPR;
                RNCInWait[nNCInWaitPoint].bBarOpen := True;

                if not tNCInWait.Enabled then
                  tNCInWait.Enabled := True;
              end
              else
              begin
                NormalProc(sFile1, sCarNo1, sFile2, sCarNo2, sTime, nNo, nIO,
                  nRecog1, nRecog2, sDspIP, csLPR, True);
              end;
            end
            else if nIO = 2 then
            begin
              if bNCOutProcWait then
              begin
                if nNCOutWaitPoint = 20 then
                  nNCOutWaitPoint := 1
                else
                  nNCOutWaitPoint := nNCOutWaitPoint + 1;

                RNCOutWait[nNCOutWaitPoint].sNCFile1 := sFile1;
                RNCOutWait[nNCOutWaitPoint].sNCCarNo1 := sCarNo1;
                RNCOutWait[nNCOutWaitPoint].sNCFile2 := sFile2;
                RNCOutWait[nNCOutWaitPoint].sNCCarNo2 := sCarNo2;
                RNCOutWait[nNCOutWaitPoint].sNCIOTime := sTime;
                RNCOutWait[nNCOutWaitPoint].nNCLprNo := nNo;
                RNCOutWait[nNCOutWaitPoint].nNCInOut := nIO;
                RNCOutWait[nNCOutWaitPoint].nNCRecog1 := nRecog1;
                RNCOutWait[nNCOutWaitPoint].nNCRecog2 := nRecog2;
                RNCOutWait[nNCOutWaitPoint].nNCCharo := 1;
                RNCOutWait[nNCOutWaitPoint].sNCDspIP := sDspIP;
                RNCOutWait[nNCOutWaitPoint].csNCLPR := csLPR;
                RNCOutWait[nNCOutWaitPoint].bBarOpen := True;

                if not tNCOutWait.Enabled then
                  tNCOutWait.Enabled := True;
              end
              else
              begin
                nNowCharo := 1;
                NormalProc(sFile1, sCarNo1, sFile2, sCarNo2, sTime, nNo, nIO,
                  nRecog1, nRecog2, sDspIP, csLPR, True);
              end;
            end;
          end;
        end;
      except
        on E: Exception do
          ExceptLogging('csOutLpr1Read: ' + aString(E.Message));
      end;
    end
    else
    begin
      if sOutLPRRecv1 = 'LPR_R' then
      begin
        Socket.SendText(aString('TIME' + FormatDateTime('YYYYMMDDHHNNSS', Now)));
        ExceptLogging('시간동기화 전송');
      end;
    end;
    sOutLPRRecv1 := '';
  finally
    tOutAlive1.Enabled := True;
  end;
end;


procedure TfrmMainNew.csOutLpr2Read(Sender: TObject; Socket: TCustomWinSocket);
var
  nNo: Word;
  sLprData, sLprIP, sDspIP: aString;
  csLPR: TClientSocket;
  sRecv, sExpDateF, sExpDateT: aString;
  i: Byte;
  sCarNo1, sCarNo2, sTime, sTemp, sResult, sTest, sDir, sLocal1,
    sLocal2: String;
  sFile1, sFile2, sImgFile1, sImgFile2: String;
  nRecog1, nRecog2, nIO: Byte;
  hr: HRESULT;
  sSend: aString;
begin
  try
    tOutAlive2.Enabled := False;
    sRecv := Socket.ReceiveText;
    sOutLPRRecv2 := sRecv;
    ExceptLogging('LPR' + IntToStr(csOutLpr2.Tag) + ' Recv: ' + sOutLPRRecv2);

    if Length(sOutLPRRecv2) > 15 then
    begin
      for i := 1 to 10 do
      begin
        if RLpr[i].nUnitNo = csOutLpr2.Tag then
        begin
          sDspIP := RLpr[i].sDspIP;
          Break;
        end;
      end;
      nNo := csOutLpr2.Tag;
      sLprData := sOutLPRRecv2;
      sLprIP := csOutLpr2.Host;
      sDspIP := sDspIP;
      csLPR := csOutLpr2;

      try
        sCarNo1 := '';
        sCarNo2 := '';
        sFile1 := '';
        sFile2 := '';
        nRecog1 := 0;
        nRecog2 := 0;

        if Copy(sLprData, 1, 2) = 'NW' then
        begin
          // 후면촬영결과가 전면촬영차량과 다르다. (새로운 차량이다)
          // NW제거
          sTemp := Copy(sLprData, Pos('#', sLprData) + 1, Length(sLprData) - Pos
              ('#', sLprData));

          // CH제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 차량번호 추출
          sCarNo1 := Copy(sTemp, 1, Pos('#', sTemp) - 1);

          // 차량번호제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 인식여부 추출
          if (Copy(sTemp, 1, 1) = 'N') or (Copy(sTemp, 1, 1) = 'O') then
            nRecog1 := 1
          else if Copy(sTemp, 1, 1) = 'P' then
            nRecog1 := 2
          else
            nRecog1 := 3;

          sFile1 := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));
          sLocal1 := Copy(sFile1, Pos('CH', sFile1), Length(sFile1) -
              (Pos('CH', sFile1) - 1));
          sTime := MG_StrToStr(Copy(sFile1, Pos('_', sFile1) + 1, 14),
            '####-##-## ##:##:##');

          // 인식여부제거하여 파일명 추출
          sFile1 := 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr
            (sFile1, '\', '/');
        end
        else if Copy(sLprData, 1, 2) = 'UP' then
        begin
          // 오인식으로 전면과 후면촬영결과가 다르다...
          // 이때는 CarNo1과 CarNo2, Image1, Image2를 구분하여 넣는다.
          // 전면차량번호와 입차일시를 가지고 DB검색하여 CarNo2와 Image2를 업데이트한다.

          // UP제거
          sTemp := Copy(sLprData, Pos('#', sLprData) + 1, Length(sLprData) - Pos
              ('#', sLprData));

          // CH제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 차량번호1 추출
          sCarNo1 := Copy(sTemp, 1, Pos('#', sTemp) - 1);

          // 차량번호1제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 인식여부1 추출
          if (Copy(sTemp, 1, 1) = 'N') or (Copy(sTemp, 1, 1) = 'O') then
            nRecog1 := 1
          else if Copy(sTemp, 1, 1) = 'P' then
            nRecog1 := 2
          else
            nRecog1 := 3;

          // 인식여부1제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 파일명1 추출
          sFile1 := Copy(sTemp, 1, Pos('#', sTemp) - 1); // Copy(sTemp, Pos('#', sTemp)+1, Length(sTemp)-Pos('#', sTemp));
          sLocal1 := Copy(sFile1, Pos('CH', sFile1), Length(sFile1) -
              (Pos('CH', sFile1) - 1));
          sTime := MG_StrToStr(Copy(sFile1, Pos('_', sFile1) + 1, 14),
            '####-##-## ##:##:##');

          // 인식여부제거하여 파일명 추출
          sFile1 := 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr
            (sFile1, '\', '/');

          // 파일명1제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // CH제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 차량번호2 추출
          sCarNo2 := Copy(sTemp, 1, Pos('#', sTemp) - 1);

          // 차량번호2제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 인식여부2 추출
          if (Copy(sTemp, 1, 1) = 'N') or (Copy(sTemp, 1, 1) = 'O') then
            nRecog2 := 1
          else if Copy(sTemp, 1, 1) = 'P' then
            nRecog2 := 2
          else
            nRecog2 := 3;

          sLocal2 := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));
          sLocal2 := Copy(sLocal2, Pos('CH', sLocal2), Length(sLocal2) -
              (Pos('CH', sLocal2) - 1));

          // 인식여부2제거하여 파일명2 추출
          sFile2 := 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr
            (Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos('#', sTemp)),
            '\', '/');

          with dmTables.qryRecvOutLPR2 do
          begin
            Close;
            SQL.Clear;
            SQL.Add(
              'Select * from IONData where ProcDate = :N1 and ProcTime = :N2 and InCarNo1 = :N3');
            Parameters.ParamByName('N1').Value := Copy(sTime, 1, 10);
            Parameters.ParamByName('N2').Value := Copy(sTime, 12, 8);
            Parameters.ParamByName('N3').Value := sCarNo1;
            Open;

            if RecordCount > 0 then
            begin
              Close;
              SQL.Clear;
              SQL.Add(
                'Update IONData Set InCarNo2 = :N1, InImage2 = :N2, InRecog2 = :N6 ');
              SQL.Add(
                'where ProcDate = :N3 and ProcTime = :N4 and InCarNo1 = :N5');
              Parameters.ParamByName('N1').Value := sCarNo2;
              Parameters.ParamByName('N2').Value := sFile2;
              Parameters.ParamByName('N3').Value := Copy(sTime, 1, 10);
              Parameters.ParamByName('N4').Value := Copy(sTime, 12, 8);
              Parameters.ParamByName('N5').Value := sCarNo1;
              Parameters.ParamByName('N6').Value := nRecog2;
              ExecSQL;
            end;
          end;
          Exit;
        end
        else if Copy(sLprData, 1, 2) = 'NP' then
        begin
          // 전면촬영된 차량과 후면촬영된 차량이 다르다.
          // 이때는 CarNo2를 개별차량으로 하여 신규입차처리한다.
          // CarNo2, File2, Recog2, Time2 로 신규입차 처리.

          // NP제거
          sTemp := Copy(sLprData, Pos('#', sLprData) + 1, Length(sLprData) - Pos
              ('#', sLprData));

          // CH제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 차량번호1 추출
          sCarNo1 := Copy(sTemp, 1, Pos('#', sTemp) - 1);

          // 차량번호1제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 인식여부1 추출
          if (Copy(sTemp, 1, 1) = 'N') or (Copy(sTemp, 1, 1) = 'O') then
            nRecog1 := 1
          else if Copy(sTemp, 1, 1) = 'P' then
            nRecog1 := 2
          else
            nRecog1 := 3;

          // 인식여부1제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 파일명1 추출
          sFile1 := Copy(sTemp, 1, Pos('#', sTemp) - 1); // Copy(sTemp, Pos('#', sTemp)+1, Length(sTemp)-Pos('#', sTemp));
          sLocal1 := Copy(sFile1, Pos('CH', sFile1), Length(sFile1) -
              (Pos('CH', sFile1) - 1));
          sTime := MG_StrToStr(Copy(sFile1, Pos('_', sFile1) + 1, 14),
            '####-##-## ##:##:##');

          // 인식여부제거하여 파일명 추출
          sFile1 := 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr
            (sFile1, '\', '/');

          // 파일명1제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // CH제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 차량번호2 추출
          sCarNo2 := Copy(sTemp, 1, Pos('#', sTemp) - 1);

          // 차량번호2제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 인식여부2 추출
          if (Copy(sTemp, 1, 1) = 'N') or (Copy(sTemp, 1, 1) = 'O') then
            nRecog2 := 1
          else if Copy(sTemp, 1, 1) = 'P' then
            nRecog2 := 2
          else
            nRecog2 := 3;

          sLocal2 := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));
          sLocal2 := Copy(sLocal2, Pos('CH', sLocal2), Length(sLocal2) -
              (Pos('CH', sLocal2) - 1));
          sFile2 := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));
          sTime := MG_StrToStr(Copy(sFile2, Pos('_', sFile2) + 1, 14),
            '####-##-## ##:##:##');

          // 인식여부2제거하여 파일명2 추출
          sFile2 := 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr
            (sFile2, '\', '/');
          sCarNo1 := sCarNo2;
          sFile1 := sFile2;
          nRecog1 := nRecog2;
          sLocal1 := sLocal2;
          sCarNo2 := '';
          sFile2 := '';
          nRecog2 := 0;
          sLocal2 := '';
        end
        else
        begin
          // CH제거
          sTemp := Copy(sLprData, Pos('#', sLprData) + 1, Length(sLprData) - Pos
              ('#', sLprData));

          // 차량번호 추출
          sCarNo1 := Copy(sTemp, 1, Pos('#', sTemp) - 1);

          // 차량번호제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 인식여부 추출
          if (Copy(sTemp, 1, 1) = 'N') or (Copy(sTemp, 1, 1) = 'O') then
            nRecog1 := 1
          else if Copy(sTemp, 1, 1) = 'P' then
            nRecog1 := 2
          else
            nRecog1 := 3;

          // 인식여부제거하여 파일명 추출
          sFile1 := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));
          sLocal1 := Copy(sFile1, Pos('CH', sFile1), Length(sFile1) -
              (Pos('CH', sFile1) - 1));
          sTime := MG_StrToStr(Copy(sFile1, Pos('_', sFile1) + 1, 14),
            '####-##-## ##:##:##');

          // 인식여부제거하여 파일명 추출
          sFile1 := 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr
            (sFile1, '\', '/');
        end;
        ExceptLogging('LPR Check: ' + sCarNo1 + ',' + sFile1 + ',' + IntToStr
            (nRecog1) + ',' + sCarNo2 + ',' + sFile2 + ',' + IntToStr(nRecog2)
            + ', ' + sTime);
        sDir := sImageDir + '\' + Copy(sTime, 1, 4) + '\' + Copy(sTime, 6, 2)
          + '\' + Copy(sTime, 9, 2) + '\' + IntToStr(nNo);

        if not DirectoryExists(sDir) then
        begin
          if not ForceDirectories(sDir) then
            ExceptLogging('이미지저장폴더 생성실패: ' + sDir);
        end;

        sImgFile1 := sDir + '\' + sLocal1;
        sImgFile2 := sDir + '\' + sLocal2;

        if sFile1 <> '' then
        begin
          sTemp := Copy(sFile1, 6, Length(sFile1) - 5);
          sImgFile1 := Copy(sTemp, 1, Pos(':9080', sTemp) - 1);
          sImgFile1 := sImgFile1 + Copy(sTemp, Pos(':9080', sTemp) + 5, Length
              (sTemp) - (Pos(':9080', sTemp) + 4));
          sImgFile1 := MG_StrConvert(sImgFile1, '/', '\');
          ExceptLogging('File: ' + sImgFile1);
        end;

        if sFile2 <> '' then
        begin
          sTemp := Copy(sFile2, 6, Length(sFile2) - 5);
          sImgFile2 := Copy(sTemp, 1, Pos(':9080', sTemp) - 1);
          sImgFile2 := sImgFile2 + Copy(sTemp, Pos(':9080', sTemp) + 5, Length
              (sTemp) - (Pos(':9080', sTemp) + 4));
          sImgFile2 := MG_StrConvert(sImgFile2, '/', '\');
          ExceptLogging('File: ' + sImgFile2);
        end;

        for i := 1 to 10 do
        begin
          if RLpr[i].nUnitNo = nNo then
            nIO := RLpr[i].nIO;
        end;

        with dmTables.qryOutLpr2Proc do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Select * from CustInfo ');

          if sCarNo2 <> '' then
          begin
            SQL.Add('where ((CarNo = :N1) or (CarNo = :N2)) and TKType = 2');
            Parameters.ParamByName('N1').Value := sCarNo1;
            Parameters.ParamByName('N2').Value := sCarNo2;
            Open;
          end
          else
          if sCarNo1 <> '' then
          begin
            SQL.Add('where CarNo = :N1 and TKType = 2');
            Parameters.ParamByName('N1').Value := sCarNo1;
            Open;
          end;

          if RecordCount > 0 then
          begin
            // 등록된 정기차량이면...
            sExpDateF := FieldByName('ExpDateF').AsString;
            sExpDateT := FieldByName('ExpDateT').AsString;

            if (sExpDateF <= FormatDateTime('YYYY-MM-DD', Now)) and
              (sExpDateT >= FormatDateTime('YYYY-MM-DD', Now)) then
            begin
              // 사용가능한 정기차량이면...
              if bSCProcWait then
              begin
                if nSCWaitPoint = 20 then
                  nSCWaitPoint := 1
                else
                  nSCWaitPoint := nSCWaitPoint + 1;

                RSCWait[nSCWaitPoint].sSCFile1 := sFile1;
                RSCWait[nSCWaitPoint].sSCCarNo1 := sCarNo1;
                RSCWait[nSCWaitPoint].sSCFile2 := sFile2;
                RSCWait[nSCWaitPoint].sSCCarNo2 := sCarNo2;
                RSCWait[nSCWaitPoint].sSCIOTime := sTime;
                RSCWait[nSCWaitPoint].nSCLprNo := nNo;
                RSCWait[nSCWaitPoint].nSCInOut := nIO;
                RSCWait[nSCWaitPoint].nSCRecog1 := nRecog1;
                RSCWait[nSCWaitPoint].nSCRecog2 := nRecog2;
                RSCWait[nSCWaitPoint].sSCDspIP := sDspIP;
                RSCWait[nSCWaitPoint].csSCLPR := csLPR;
                RSCWait[nSCWaitPoint].bBarOpen := True;

                if not tSCWait.Enabled then
                  tSCWait.Enabled := True;
              end
              else
              begin
                sResult := RecvLprProc(sFile1, sCarNo1, sFile2, sCarNo2, sTime,
                  nNo, nIO, nRecog1, nRecog2, sDspIP, csLPR, True);

                // 입차시의 이미지는 표시하지 않는다.  2012-05-07 UI 관련 미팅시 송우식 과장...
                // 일반차량 출차시 출차이미지와 함께 입차이미지를 표시한다....
                GridData(sResult);
              end;
            end
            else
            begin
              // 일반차량 처리...
              if nIO = 1 then
              begin
                if bNCInProcWait then
                begin
                  if nNCInWaitPoint = 20 then
                    nNCInWaitPoint := 1
                  else
                    nNCInWaitPoint := nNCInWaitPoint + 1;

                  RNCInWait[nNCInWaitPoint].sNCFile1 := sFile1;
                  RNCInWait[nNCInWaitPoint].sNCCarNo1 := sCarNo1;
                  RNCInWait[nNCInWaitPoint].sNCFile2 := sFile2;
                  RNCInWait[nNCInWaitPoint].sNCCarNo2 := sCarNo2;
                  RNCInWait[nNCInWaitPoint].sNCIOTime := sTime;
                  RNCInWait[nNCInWaitPoint].nNCLprNo := nNo;
                  RNCInWait[nNCInWaitPoint].nNCInOut := nIO;
                  RNCInWait[nNCInWaitPoint].nNCRecog1 := nRecog1;
                  RNCInWait[nNCInWaitPoint].nNCRecog2 := nRecog2;
                  RNCInWait[nNCInWaitPoint].sNCDspIP := sDspIP;
                  RNCInWait[nNCInWaitPoint].csNCLPR := csLPR;
                  RNCInWait[nNCInWaitPoint].bBarOpen := True;

                  if not tNCInWait.Enabled then
                    tNCInWait.Enabled := True;
                end
                else
                begin
                  NormalProc(sFile1, sCarNo1, sFile2, sCarNo2, sTime, nNo, nIO,
                    nRecog1, nRecog2, sDspIP, csLPR, True);
                end;
              end
              else if nIO = 2 then
              begin
                if bNCOutProcWait then
                begin
                  if nNCOutWaitPoint = 20 then
                    nNCOutWaitPoint := 1
                  else
                    nNCOutWaitPoint := nNCOutWaitPoint + 1;

                  RNCOutWait[nNCOutWaitPoint].sNCFile1 := sFile1;
                  RNCOutWait[nNCOutWaitPoint].sNCCarNo1 := sCarNo1;
                  RNCOutWait[nNCOutWaitPoint].sNCFile2 := sFile2;
                  RNCOutWait[nNCOutWaitPoint].sNCCarNo2 := sCarNo2;
                  RNCOutWait[nNCOutWaitPoint].sNCIOTime := sTime;
                  RNCOutWait[nNCOutWaitPoint].nNCLprNo := nNo;
                  RNCOutWait[nNCOutWaitPoint].nNCInOut := nIO;
                  RNCOutWait[nNCOutWaitPoint].nNCRecog1 := nRecog1;
                  RNCOutWait[nNCOutWaitPoint].nNCRecog2 := nRecog2;
                  RNCOutWait[nNCOutWaitPoint].nNCCharo := 2;
                  RNCOutWait[nNCOutWaitPoint].sNCDspIP := sDspIP;
                  RNCOutWait[nNCOutWaitPoint].csNCLPR := csLPR;
                  RNCOutWait[nNCOutWaitPoint].bBarOpen := True;

                  if not tNCOutWait.Enabled then
                    tNCOutWait.Enabled := True;
                end
                else
                begin
                  nNowCharo := 2;
                  NormalProc(sFile1, sCarNo1, sFile2, sCarNo2, sTime, nNo, nIO,
                    nRecog1, nRecog2, sDspIP, csLPR, True);
                end;
              end;
            end;
          end
          else
          begin
            // 일반차량 처리...
            if nIO = 1 then
            begin
              if bNCInProcWait then
              begin
                if nNCInWaitPoint = 20 then
                  nNCInWaitPoint := 1
                else
                  nNCInWaitPoint := nNCInWaitPoint + 1;

                RNCInWait[nNCInWaitPoint].sNCFile1 := sFile1;
                RNCInWait[nNCInWaitPoint].sNCCarNo1 := sCarNo1;
                RNCInWait[nNCInWaitPoint].sNCFile2 := sFile2;
                RNCInWait[nNCInWaitPoint].sNCCarNo2 := sCarNo2;
                RNCInWait[nNCInWaitPoint].sNCIOTime := sTime;
                RNCInWait[nNCInWaitPoint].nNCLprNo := nNo;
                RNCInWait[nNCInWaitPoint].nNCInOut := nIO;
                RNCInWait[nNCInWaitPoint].nNCRecog1 := nRecog1;
                RNCInWait[nNCInWaitPoint].nNCRecog2 := nRecog2;
                RNCInWait[nNCInWaitPoint].sNCDspIP := sDspIP;
                RNCInWait[nNCInWaitPoint].csNCLPR := csLPR;
                RNCInWait[nNCInWaitPoint].bBarOpen := True;

                if not tNCInWait.Enabled then
                  tNCInWait.Enabled := True;
              end
              else
              begin
                NormalProc(sFile1, sCarNo1, sFile2, sCarNo2, sTime, nNo, nIO,
                  nRecog1, nRecog2, sDspIP, csLPR, True);
              end;
            end
            else if nIO = 2 then
            begin
              if bNCOutProcWait then
              begin
                if nNCOutWaitPoint = 20 then
                  nNCOutWaitPoint := 1
                else
                  nNCOutWaitPoint := nNCOutWaitPoint + 1;

                RNCOutWait[nNCOutWaitPoint].sNCFile1 := sFile1;
                RNCOutWait[nNCOutWaitPoint].sNCCarNo1 := sCarNo1;
                RNCOutWait[nNCOutWaitPoint].sNCFile2 := sFile2;
                RNCOutWait[nNCOutWaitPoint].sNCCarNo2 := sCarNo2;
                RNCOutWait[nNCOutWaitPoint].sNCIOTime := sTime;
                RNCOutWait[nNCOutWaitPoint].nNCLprNo := nNo;
                RNCOutWait[nNCOutWaitPoint].nNCInOut := nIO;
                RNCOutWait[nNCOutWaitPoint].nNCRecog1 := nRecog1;
                RNCOutWait[nNCOutWaitPoint].nNCRecog2 := nRecog2;
                RNCOutWait[nNCOutWaitPoint].nNCCharo := 2;
                RNCOutWait[nNCOutWaitPoint].sNCDspIP := sDspIP;
                RNCOutWait[nNCOutWaitPoint].csNCLPR := csLPR;
                RNCOutWait[nNCOutWaitPoint].bBarOpen := True;

                if not tNCOutWait.Enabled then
                  tNCOutWait.Enabled := True;
              end
              else
              begin
                nNowCharo := 2;
                NormalProc(sFile1, sCarNo1, sFile2, sCarNo2, sTime, nNo, nIO,
                  nRecog1, nRecog2, sDspIP, csLPR, True);
              end;
            end;
          end;
        end;
      except
        on E: Exception do
          ExceptLogging('csOutLpr2Read: ' + aString(E.Message));
      end;
    end
    else
    begin
      if sOutLPRRecv2 = 'LPR_R' then
      begin
        Socket.SendText(aString('TIME' + FormatDateTime('YYYYMMDDHHNNSS', Now))
          );
        ExceptLogging('시간동기화 전송');
      end;
    end;
    sOutLPRRecv2 := '';
  finally
    tOutAlive2.Enabled := True;
  end;
end;

procedure TfrmMainNew.csOutLpr3Read(Sender: TObject; Socket: TCustomWinSocket);
var
  nNo: Word;
  sLprData, sLprIP, sDspIP: aString;
  csLPR: TClientSocket;
  sRecv, sExpDateF, sExpDateT: aString;
  i: Byte;
  sCarNo1, sCarNo2, sTime, sTemp, sResult, sTest, sDir, sLocal1,
    sLocal2: String;
  sFile1, sFile2, sImgFile1, sImgFile2: String;
  nRecog1, nRecog2, nIO: Byte;
  hr: HRESULT;
  sSend: aString;
begin
  try
    tOutAlive3.Enabled := False;
    sRecv := Socket.ReceiveText;
    sOutLPRRecv3 := sRecv;
    ExceptLogging('LPR' + IntToStr(csOutLpr3.Tag) + ' Recv: ' + sOutLPRRecv3);

    if Length(sOutLPRRecv3) > 15 then
    begin
      for i := 1 to 10 do
      begin
        if RLpr[i].nUnitNo = csOutLpr3.Tag then
        begin
          sDspIP := RLpr[i].sDspIP;
          Break;
        end;
      end;

      nNo := csOutLpr3.Tag;
      sLprData := sOutLPRRecv3;
      sLprIP := csOutLpr3.Host;
      sDspIP := sDspIP;
      csLPR := csOutLpr3;

      try
        sCarNo1 := '';
        sCarNo2 := '';
        sFile1 := '';
        sFile2 := '';
        nRecog1 := 0;
        nRecog2 := 0;

        if Copy(sLprData, 1, 2) = 'NW' then
        begin
          // 후면촬영결과가 전면촬영차량과 다르다. (새로운 차량이다)
          // NW제거
          sTemp := Copy(sLprData, Pos('#', sLprData) + 1, Length(sLprData) - Pos
              ('#', sLprData));

          // CH제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 차량번호 추출
          sCarNo1 := Copy(sTemp, 1, Pos('#', sTemp) - 1);

          // 차량번호제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 인식여부 추출
          if (Copy(sTemp, 1, 1) = 'N') or (Copy(sTemp, 1, 1) = 'O') then
            nRecog1 := 1
          else if Copy(sTemp, 1, 1) = 'P' then
            nRecog1 := 2
          else
            nRecog1 := 3;

          sFile1 := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));
          sLocal1 := Copy(sFile1, Pos('CH', sFile1), Length(sFile1) -
              (Pos('CH', sFile1) - 1));
          sTime := MG_StrToStr(Copy(sFile1, Pos('_', sFile1) + 1, 14),
            '####-##-## ##:##:##');

          // 인식여부제거하여 파일명 추출
          sFile1 := 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr
            (sFile1, '\', '/');
        end
        else if Copy(sLprData, 1, 2) = 'UP' then
        begin
          // 오인식으로 전면과 후면촬영결과가 다르다...
          // 이때는 CarNo1과 CarNo2, Image1, Image2를 구분하여 넣는다.
          // 전면차량번호와 입차일시를 가지고 DB검색하여 CarNo2와 Image2를 업데이트한다.

          // UP제거
          sTemp := Copy(sLprData, Pos('#', sLprData) + 1, Length(sLprData) - Pos
              ('#', sLprData));

          // CH제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 차량번호1 추출
          sCarNo1 := Copy(sTemp, 1, Pos('#', sTemp) - 1);

          // 차량번호1제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 인식여부1 추출
          if (Copy(sTemp, 1, 1) = 'N') or (Copy(sTemp, 1, 1) = 'O') then
            nRecog1 := 1
          else if Copy(sTemp, 1, 1) = 'P' then
            nRecog1 := 2
          else
            nRecog1 := 3;

          // 인식여부1제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 파일명1 추출
          sFile1 := Copy(sTemp, 1, Pos('#', sTemp) - 1); // Copy(sTemp, Pos('#', sTemp)+1, Length(sTemp)-Pos('#', sTemp));
          sLocal1 := Copy(sFile1, Pos('CH', sFile1), Length(sFile1) -
              (Pos('CH', sFile1) - 1));
          sTime := MG_StrToStr(Copy(sFile1, Pos('_', sFile1) + 1, 14),
            '####-##-## ##:##:##');

          // 인식여부제거하여 파일명 추출
          sFile1 := 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr
            (sFile1, '\', '/');

          // 파일명1제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // CH제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 차량번호2 추출
          sCarNo2 := Copy(sTemp, 1, Pos('#', sTemp) - 1);

          // 차량번호2제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 인식여부2 추출
          if (Copy(sTemp, 1, 1) = 'N') or (Copy(sTemp, 1, 1) = 'O') then
            nRecog2 := 1
          else if Copy(sTemp, 1, 1) = 'P' then
            nRecog2 := 2
          else
            nRecog2 := 3;

          sLocal2 := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));
          sLocal2 := Copy(sLocal2, Pos('CH', sLocal2), Length(sLocal2) -
              (Pos('CH', sLocal2) - 1));

          // 인식여부2제거하여 파일명2 추출
          sFile2 := 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr
            (Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos('#', sTemp)),
            '\', '/');

          with dmTables.qryRecvOutLPR3 do
          begin
            Close;
            SQL.Clear;
            SQL.Add(
              'Select * from IONData where ProcDate = :N1 and ProcTime = :N2 and InCarNo1 = :N3');
            Parameters.ParamByName('N1').Value := Copy(sTime, 1, 10);
            Parameters.ParamByName('N2').Value := Copy(sTime, 12, 8);
            Parameters.ParamByName('N3').Value := sCarNo1;
            Open;

            if RecordCount > 0 then
            begin
              Close;
              SQL.Clear;
              SQL.Add(
                'Update IONData Set InCarNo2 = :N1, InImage2 = :N2, InRecog2 = :N6 ');
              SQL.Add(
                'where ProcDate = :N3 and ProcTime = :N4 and InCarNo1 = :N5');
              Parameters.ParamByName('N1').Value := sCarNo2;
              Parameters.ParamByName('N2').Value := sFile2;
              Parameters.ParamByName('N3').Value := Copy(sTime, 1, 10);
              Parameters.ParamByName('N4').Value := Copy(sTime, 12, 8);
              Parameters.ParamByName('N5').Value := sCarNo1;
              Parameters.ParamByName('N6').Value := nRecog2;
              ExecSQL;
            end;
          end;
          Exit;
        end
        else if Copy(sLprData, 1, 2) = 'NP' then
        begin
          // 전면촬영된 차량과 후면촬영된 차량이 다르다.
          // 이때는 CarNo2를 개별차량으로 하여 신규입차처리한다.
          // CarNo2, File2, Recog2, Time2 로 신규입차 처리.

          // NP제거
          sTemp := Copy(sLprData, Pos('#', sLprData) + 1, Length(sLprData) - Pos
              ('#', sLprData));

          // CH제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 차량번호1 추출
          sCarNo1 := Copy(sTemp, 1, Pos('#', sTemp) - 1);

          // 차량번호1제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 인식여부1 추출
          if (Copy(sTemp, 1, 1) = 'N') or (Copy(sTemp, 1, 1) = 'O') then
            nRecog1 := 1
          else if Copy(sTemp, 1, 1) = 'P' then
            nRecog1 := 2
          else
            nRecog1 := 3;

          // 인식여부1제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 파일명1 추출
          sFile1 := Copy(sTemp, 1, Pos('#', sTemp) - 1); // Copy(sTemp, Pos('#', sTemp)+1, Length(sTemp)-Pos('#', sTemp));
          sLocal1 := Copy(sFile1, Pos('CH', sFile1), Length(sFile1) -
              (Pos('CH', sFile1) - 1));
          sTime := MG_StrToStr(Copy(sFile1, Pos('_', sFile1) + 1, 14),
            '####-##-## ##:##:##');

          // 인식여부제거하여 파일명 추출
          sFile1 := 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr
            (sFile1, '\', '/');

          // 파일명1제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // CH제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 차량번호2 추출
          sCarNo2 := Copy(sTemp, 1, Pos('#', sTemp) - 1);

          // 차량번호2제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 인식여부2 추출
          if (Copy(sTemp, 1, 1) = 'N') or (Copy(sTemp, 1, 1) = 'O') then
            nRecog2 := 1
          else if Copy(sTemp, 1, 1) = 'P' then
            nRecog2 := 2
          else
            nRecog2 := 3;

          sLocal2 := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));
          sLocal2 := Copy(sLocal2, Pos('CH', sLocal2), Length(sLocal2) -
              (Pos('CH', sLocal2) - 1));
          sFile2 := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));
          sTime := MG_StrToStr(Copy(sFile2, Pos('_', sFile2) + 1, 14),
            '####-##-## ##:##:##');

          // 인식여부2제거하여 파일명2 추출
          sFile2 := 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr
            (sFile2, '\', '/');
          sCarNo1 := sCarNo2;
          sFile1 := sFile2;
          nRecog1 := nRecog2;
          sLocal1 := sLocal2;
          sCarNo2 := '';
          sFile2 := '';
          nRecog2 := 0;
          sLocal2 := '';
        end
        else
        begin
          // CH제거
          sTemp := Copy(sLprData, Pos('#', sLprData) + 1, Length(sLprData) - Pos
              ('#', sLprData));

          // 차량번호 추출
          sCarNo1 := Copy(sTemp, 1, Pos('#', sTemp) - 1);

          // 차량번호제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));

          // 인식여부 추출
          if (Copy(sTemp, 1, 1) = 'N') or (Copy(sTemp, 1, 1) = 'O') then
            nRecog1 := 1
          else if Copy(sTemp, 1, 1) = 'P' then
            nRecog1 := 2
          else
            nRecog1 := 3;

          // 인식여부제거하여 파일명 추출
          sFile1 := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos
              ('#', sTemp));
          sLocal1 := Copy(sFile1, Pos('CH', sFile1), Length(sFile1) -
              (Pos('CH', sFile1) - 1));
          sTime := MG_StrToStr(Copy(sFile1, Pos('_', sFile1) + 1, 14),
            '####-##-## ##:##:##');

          // 인식여부제거하여 파일명 추출
          sFile1 := 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr
            (sFile1, '\', '/');
        end;
        ExceptLogging('LPR Check: ' + sCarNo1 + ',' + sFile1 + ',' + IntToStr
            (nRecog1) + ',' + sCarNo2 + ',' + sFile2 + ',' + IntToStr(nRecog2)
            + ', ' + sTime);
        sDir := sImageDir + '\' + Copy(sTime, 1, 4) + '\' + Copy(sTime, 6, 2)
          + '\' + Copy(sTime, 9, 2) + '\' + IntToStr(nNo);

        if not DirectoryExists(sDir) then
        begin
          if not ForceDirectories(sDir) then
            ExceptLogging('이미지저장폴더 생성실패: ' + sDir);
        end;

        sImgFile1 := sDir + '\' + sLocal1;
        sImgFile2 := sDir + '\' + sLocal2;

        if sFile1 <> '' then
        begin
          sTemp := Copy(sFile1, 6, Length(sFile1) - 5);
          sImgFile1 := Copy(sTemp, 1, Pos(':9080', sTemp) - 1);
          sImgFile1 := sImgFile1 + Copy(sTemp, Pos(':9080', sTemp) + 5, Length
              (sTemp) - (Pos(':9080', sTemp) + 4));
          sImgFile1 := MG_StrConvert(sImgFile1, '/', '\');
          ExceptLogging('File: ' + sImgFile1);
        end;

        if sFile2 <> '' then
        begin
          sTemp := Copy(sFile2, 6, Length(sFile2) - 5);
          sImgFile2 := Copy(sTemp, 1, Pos(':9080', sTemp) - 1);
          sImgFile2 := sImgFile2 + Copy(sTemp, Pos(':9080', sTemp) + 5, Length
              (sTemp) - (Pos(':9080', sTemp) + 4));
          sImgFile2 := MG_StrConvert(sImgFile2, '/', '\');
          ExceptLogging('File: ' + sImgFile2);
        end;

        for i := 1 to 10 do
        begin
          if RLpr[i].nUnitNo = nNo then
            nIO := RLpr[i].nIO;
        end;

        with dmTables.qryOutLpr3Proc do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Select * from CustInfo ');

          if sCarNo2 <> '' then
          begin
            SQL.Add('where ((CarNo = :N1) or (CarNo = :N2)) and TKType = 2');
            Parameters.ParamByName('N1').Value := sCarNo1;
            Parameters.ParamByName('N2').Value := sCarNo2;
            Open;
          end
          else
          if sCarNo1 <> '' then
          begin
            SQL.Add('where CarNo = :N1 and TKType = 2');
            Parameters.ParamByName('N1').Value := sCarNo1;
            Open;
          end;

          if RecordCount > 0 then
          begin
            // 등록된 정기차량이면...
            sExpDateF := FieldByName('ExpDateF').AsString;
            sExpDateT := FieldByName('ExpDateT').AsString;

            if (sExpDateF <= FormatDateTime('YYYY-MM-DD', Now)) and
              (sExpDateT >= FormatDateTime('YYYY-MM-DD', Now)) then
            begin
              // 사용가능한 정기차량이면...
              if bSCProcWait then
              begin
                if nSCWaitPoint = 20 then
                  nSCWaitPoint := 1
                else
                  nSCWaitPoint := nSCWaitPoint + 1;

                RSCWait[nSCWaitPoint].sSCFile1 := sFile1;
                RSCWait[nSCWaitPoint].sSCCarNo1 := sCarNo1;
                RSCWait[nSCWaitPoint].sSCFile2 := sFile2;
                RSCWait[nSCWaitPoint].sSCCarNo2 := sCarNo2;
                RSCWait[nSCWaitPoint].sSCIOTime := sTime;
                RSCWait[nSCWaitPoint].nSCLprNo := nNo;
                RSCWait[nSCWaitPoint].nSCInOut := nIO;
                RSCWait[nSCWaitPoint].nSCRecog1 := nRecog1;
                RSCWait[nSCWaitPoint].nSCRecog2 := nRecog2;
                RSCWait[nSCWaitPoint].sSCDspIP := sDspIP;
                RSCWait[nSCWaitPoint].csSCLPR := csLPR;
                RSCWait[nSCWaitPoint].bBarOpen := True;

                if not tSCWait.Enabled then
                  tSCWait.Enabled := True;
              end
              else
              begin
                sResult := RecvLprProc(sFile1, sCarNo1, sFile2, sCarNo2, sTime,
                  nNo, nIO, nRecog1, nRecog2, sDspIP, csLPR, True);

                // 입차시의 이미지는 표시하지 않는다.  2012-05-07 UI 관련 미팅시 송우식 과장...
                // 일반차량 출차시 출차이미지와 함께 입차이미지를 표시한다....
                GridData(sResult);
              end;
            end
            else
            begin
              // 일반차량 처리...
              if nIO = 1 then
              begin
                if bNCInProcWait then
                begin
                  if nNCInWaitPoint = 20 then
                    nNCInWaitPoint := 1
                  else
                    nNCInWaitPoint := nNCInWaitPoint + 1;

                  RNCInWait[nNCInWaitPoint].sNCFile1 := sFile1;
                  RNCInWait[nNCInWaitPoint].sNCCarNo1 := sCarNo1;
                  RNCInWait[nNCInWaitPoint].sNCFile2 := sFile2;
                  RNCInWait[nNCInWaitPoint].sNCCarNo2 := sCarNo2;
                  RNCInWait[nNCInWaitPoint].sNCIOTime := sTime;
                  RNCInWait[nNCInWaitPoint].nNCLprNo := nNo;
                  RNCInWait[nNCInWaitPoint].nNCInOut := nIO;
                  RNCInWait[nNCInWaitPoint].nNCRecog1 := nRecog1;
                  RNCInWait[nNCInWaitPoint].nNCRecog2 := nRecog2;
                  RNCInWait[nNCInWaitPoint].sNCDspIP := sDspIP;
                  RNCInWait[nNCInWaitPoint].csNCLPR := csLPR;
                  RNCInWait[nNCInWaitPoint].bBarOpen := True;

                  if not tNCInWait.Enabled then
                    tNCInWait.Enabled := True;
                end
                else
                begin
                  NormalProc(sFile1, sCarNo1, sFile2, sCarNo2, sTime, nNo, nIO,
                    nRecog1, nRecog2, sDspIP, csLPR, True);
                end;
              end
              else if nIO = 2 then
              begin
                if bNCOutProcWait then
                begin
                  if nNCOutWaitPoint = 20 then
                    nNCOutWaitPoint := 1
                  else
                    nNCOutWaitPoint := nNCOutWaitPoint + 1;

                  RNCOutWait[nNCOutWaitPoint].sNCFile1 := sFile1;
                  RNCOutWait[nNCOutWaitPoint].sNCCarNo1 := sCarNo1;
                  RNCOutWait[nNCOutWaitPoint].sNCFile2 := sFile2;
                  RNCOutWait[nNCOutWaitPoint].sNCCarNo2 := sCarNo2;
                  RNCOutWait[nNCOutWaitPoint].sNCIOTime := sTime;
                  RNCOutWait[nNCOutWaitPoint].nNCLprNo := nNo;
                  RNCOutWait[nNCOutWaitPoint].nNCInOut := nIO;
                  RNCOutWait[nNCOutWaitPoint].nNCRecog1 := nRecog1;
                  RNCOutWait[nNCOutWaitPoint].nNCRecog2 := nRecog2;
                  RNCOutWait[nNCOutWaitPoint].nNCCharo := 3;
                  RNCOutWait[nNCOutWaitPoint].sNCDspIP := sDspIP;
                  RNCOutWait[nNCOutWaitPoint].csNCLPR := csLPR;
                  RNCOutWait[nNCOutWaitPoint].bBarOpen := True;

                  if not tNCOutWait.Enabled then
                    tNCOutWait.Enabled := True;
                end
                else
                begin
                  nNowCharo := 3;
                  NormalProc(sFile1, sCarNo1, sFile2, sCarNo2, sTime, nNo, nIO,
                    nRecog1, nRecog2, sDspIP, csLPR, True);
                end;
              end;
            end;
          end
          else
          begin
            // 일반차량 처리...
            if nIO = 1 then
            begin
              if bNCInProcWait then
              begin
                if nNCInWaitPoint = 20 then
                  nNCInWaitPoint := 1
                else
                  nNCInWaitPoint := nNCInWaitPoint + 1;

                RNCInWait[nNCInWaitPoint].sNCFile1 := sFile1;
                RNCInWait[nNCInWaitPoint].sNCCarNo1 := sCarNo1;
                RNCInWait[nNCInWaitPoint].sNCFile2 := sFile2;
                RNCInWait[nNCInWaitPoint].sNCCarNo2 := sCarNo2;
                RNCInWait[nNCInWaitPoint].sNCIOTime := sTime;
                RNCInWait[nNCInWaitPoint].nNCLprNo := nNo;
                RNCInWait[nNCInWaitPoint].nNCInOut := nIO;
                RNCInWait[nNCInWaitPoint].nNCRecog1 := nRecog1;
                RNCInWait[nNCInWaitPoint].nNCRecog2 := nRecog2;
                RNCInWait[nNCInWaitPoint].sNCDspIP := sDspIP;
                RNCInWait[nNCInWaitPoint].csNCLPR := csLPR;
                RNCInWait[nNCInWaitPoint].bBarOpen := True;

                if not tNCInWait.Enabled then
                  tNCInWait.Enabled := True;
              end
              else
              begin
                NormalProc(sFile1, sCarNo1, sFile2, sCarNo2, sTime, nNo, nIO,
                  nRecog1, nRecog2, sDspIP, csLPR, True);
              end;
            end
            else if nIO = 2 then
            begin
              if bNCOutProcWait then
              begin
                if nNCOutWaitPoint = 20 then
                  nNCOutWaitPoint := 1
                else
                  nNCOutWaitPoint := nNCOutWaitPoint + 1;

                RNCOutWait[nNCOutWaitPoint].sNCFile1 := sFile1;
                RNCOutWait[nNCOutWaitPoint].sNCCarNo1 := sCarNo1;
                RNCOutWait[nNCOutWaitPoint].sNCFile2 := sFile2;
                RNCOutWait[nNCOutWaitPoint].sNCCarNo2 := sCarNo2;
                RNCOutWait[nNCOutWaitPoint].sNCIOTime := sTime;
                RNCOutWait[nNCOutWaitPoint].nNCLprNo := nNo;
                RNCOutWait[nNCOutWaitPoint].nNCInOut := nIO;
                RNCOutWait[nNCOutWaitPoint].nNCRecog1 := nRecog1;
                RNCOutWait[nNCOutWaitPoint].nNCRecog2 := nRecog2;
                RNCOutWait[nNCOutWaitPoint].nNCCharo := 3;
                RNCOutWait[nNCOutWaitPoint].sNCDspIP := sDspIP;
                RNCOutWait[nNCOutWaitPoint].csNCLPR := csLPR;
                RNCOutWait[nNCOutWaitPoint].bBarOpen := True;

                if not tNCOutWait.Enabled then
                  tNCOutWait.Enabled := True;
              end
              else
              begin
                nNowCharo := 3;
                NormalProc(sFile1, sCarNo1, sFile2, sCarNo2, sTime, nNo, nIO,
                  nRecog1, nRecog2, sDspIP, csLPR, True);
              end;
            end;
          end;
        end;
      except
        on E: Exception do
          ExceptLogging('csOutLpr3Read: ' + aString(E.Message));
      end;
    end
    else
    begin
      if sOutLPRRecv3 = 'LPR_R' then
      begin
        Socket.SendText(aString('TIME' + FormatDateTime('YYYYMMDDHHNNSS', Now))
          );
        ExceptLogging('시간동기화 전송');
      end;
    end;
    sOutLPRRecv3 := '';
  finally
    tOutAlive3.Enabled := True;
  end;
end;

procedure TfrmMainNew.CulcureDCProc(sCarNo: String);
var
  nTotCnt, nDCNo, nDCValue, nDCCnt,nParnas, i, j, nTemp1, nTemp2, nDiscountMoney: Integer;
  sTempWeb, sTemp, sDCName, sUpche, sWebInfo,sShortCarNo: String;
  nDCInfoNo, nTimeDC , nValue,nValue1,nJulsa,nPerDC : Integer;
  nDCType: Byte;
  sName,sYogum: aString;
begin
  try
    i := 0;
    sShortCarNo :=Copy(sCarNo, Length(sCarNo) -3, 4);
    with dmTables.qryDCTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select Car_NO  from dbo.AK_BAPARKTB ');
      SQL.Add(' where CAR_NO = :N1 and PARK_FG = :N2 and CONVERT(int, dc_time) = 0 ')  ;
//      SQL.Add('select Car_NO  from dbo.AK_BAPARKTB ');
//      SQL.Add(' where CAR_NO = :N1 and PARK_FG = :N2 and CONVERT(int, dc_time) = 0 and  ');
//      SQL.Add(' ((SALE_YMD <= :N3) and (SALE_YMD >= :N4))  ')
      Parameters.ParamByName('N1').Value:= sCarNo;
      Parameters.ParamByName('N2').Value:= '04';
//      Parameters.ParamByName('N4').Value:= Copy(sNowInDate,1,4) + Copy(sNowInDate,6,2) + Copy(sNowInDate,9,2) ;
//      Parameters.ParamByName('N3').Value:=  Copy(sNowOutDate,1,4) + Copy(sNowOutDate,6,2) + Copy(sNowOutDate,9,2) ;
      Open;
      if RecordCount > 0 then
      begin
        nPosAmt := 0;
      end
      else
      begin
        Close;
        SQL.Clear;
        SQL.Add('select COUNT(*) as Culturecnt, SUM(CONVERT(int, dc_time)) as SumDCTime  from dbo.AK_BAPARKTB ');
        SQL.Add(' where CAR_NO = :N1 and PARK_FG = :N2  group by CAR_NO ');
        Parameters.ParamByName('N1').Value:= sCarNo;
        Parameters.ParamByName('N2').Value:= '03';
//        Parameters.ParamByName('N4').Value:= Copy(sNowInDate,1,4) + Copy(sNowInDate,6,2) + Copy(sNowInDate,9,2) ;
//        Parameters.ParamByName('N3').Value:=  Copy(sNowOutDate,1,4) + Copy(sNowOutDate,6,2) + Copy(sNowOutDate,9,2) ;
        Open;
        if RecordCount > 0 then
        begin
          nPosAmt := FieldByName('SumDCTime').AsInteger ;
        end
        else
        begin
          ExceptLogging('문화센터 할인 없음');
//          exit;
        end;

        Close;
        SQL.Clear;
        SQL.Add('select COUNT(*) as Culturecnt, SUM(CONVERT(int, dc_time)) as SumDCTime  from dbo.AK_BAPARKTB ');
        SQL.Add(' where CAR_NO = :N1 and ((SALE_YMD <= :N3) and (SALE_YMD >= :N4))  and (PARK_FG = :N5 or PARK_FG = :N6 ) group by CAR_NO ');
        Parameters.ParamByName('N1').Value:= sCarNo;
        Parameters.ParamByName('N4').Value:= Copy(sNowInDate,1,4) + Copy(sNowInDate,6,2) + Copy(sNowInDate,9,2) ;
        Parameters.ParamByName('N3').Value:=  Copy(sNowOutDate,1,4) + Copy(sNowOutDate,6,2) + Copy(sNowOutDate,9,2) ;
        Parameters.ParamByName('N5').Value:= '01';
        Parameters.ParamByName('N6').Value:= '02';
        Open;
        if RecordCount > 0 then
        begin
          nPosAmt := nPosAmt + FieldByName('SumDCTime').AsInteger ;
        end
        else
        begin
          ExceptLogging('구매할인 없음');
        end;
        if nPosAmt = 0 then
        begin
          ExceptLogging('할인적용없음');
          Exit;
        end;

      end;
    end;
    try
      with dmTables.qryDCTemp do begin
        Close;
        SQL.Clear;
        SQL.Add('Select * from DCInfo where DCNo = :N1');
        Parameters.ParamByName('N1').Value:= 97;
        Open;

        if RecordCount > 0 then begin
          nDCInfoNo :=  FieldByName('DCNo').AsInteger;
          sName:= FieldByName('DCName').AsString;
          if nPosAmt = 0 then
          begin
            nDCType:= 2;
            nValue := 100;
          end
          else
          begin
            nDCType:= 1;
            nValue := nPosAmt;
          end;
        end
        else
        begin
          ExceptLogging('문화센터 할인 없음');
          exit;
        end;
      end;
      if nProcYogum > 0 then begin
        Case nDCType of
          0:
            begin // 금액할인.
              nDCCnt := nDCCnt + 1;

              if nProcYogum >= nValue then begin
                nProcYogum := nProcYogum - nValue;
                nJulsa := JulsaProc(nProcYogum);
                nProcYogum := nProcYogum - nJulsa;
                nDCYogum := nDCYogum + nValue;
                nDCYogum := nDCYogum + nJulsa;

                edtProcYogum.Text := FormatFloat('#,##0', nProcYogum);
                edtDCYogum.Text := IntToStr(nDCYogum);
                edtDCYogum.AutoThousandSeparator := True;
                sYogum := IntToStr(nProcYogum);

                for i := 1 to 6 do begin
                  with frmMainNew do
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Visible := False;
                end;

                for i := 1 to Length(sYogum) do begin
                  with frmMainNew do begin
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Visible := True;
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Caption := Copy(sYogum, Length(sYogum) - (i - 1), 1);
                  end;
                end;
                lbDCName.Caption := sName;

                with DCProc[nDCCnt] do begin
                  nDCNo       := nDCInfoNo;
                  sDCName     := sName;
                  nDCAmt      := nValue + nJulsa;
                  nRealDCAmt  := nValue + nJulsa;
                  nDCType     := 0;
                end;
              end else begin
                nDCYogum := nDCYogum + nProcYogum;
                edtDCYogum.Text := IntToStr(nDCYogum);
                edtDCYogum.AutoThousandSeparator := True;

                for i := 6 downto 2 do begin
                  with frmMainNew do begin
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Visible := False;
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Caption := '0';
                  end;
                end;
                lbYogum1.Caption := '0';
                lbDCName.Caption := sName;

                with DCProc[nDCCnt] do begin
                  nDCNo := nDCInfoNo;
                  sDCName := sName;
                  nDCAmt := nValue;
                  nRealDCAmt := nProcYogum;
                  nDCType     := 0;
                end;
                nProcYogum := 0;
                edtProcYogum.Text := '0';
              end;
            end;

          1:    { TODO  : 웹할인 - 시간할인 }
            begin // 시간할인.
              nDCCnt := nDCCnt + 1;
              sDCOutTime := MG_AddTime(sDCOutTime, 0, -nvalue, 0, 0);

              nTimeDC := nProcYogum - ReturnFee(nCurrParkNo, nFeeNo, PAnsiChar(Copy(aString(lbInTime.Caption), 1, 16)),
                                                PAnsiChar(Copy(sDCOutTime, 1, 16)));

              if nProcYogum >= nTimeDC then begin
                nProcYogum := nProcYogum - nTimeDC;
                nJulsa := JulsaProc(nProcYogum);
                nProcYogum := nProcYogum - nJulsa;
                nDCYogum := nDCYogum + nTimeDC;
                nDCYogum := nDCYogum + nJulsa;
                edtProcYogum.Text := FormatFloat('#,##0', nProcYogum);
                edtDCYogum.Text := IntToStr(nDCYogum);
                edtDCYogum.AutoThousandSeparator := True;
                sYogum := IntToStr(nProcYogum);

                for i := 1 to 6 do begin
                  with frmMainNew do
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Visible := False;
                end;

                for i := 1 to Length(sYogum) do begin
                  with frmMainNew do begin
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Visible := True;
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Caption :=
                      Copy(sYogum, Length(sYogum) - (i - 1), 1);
                  end;
                end;
                lbDCName.Caption := sName;

                with DCProc[nDCCnt] do begin
                  nDCNo := nDCInfoNo;
                  sDCName := sName;
                  nDCAmt := nTimeDC + nJulsa;
                  nRealDCAmt := nTimeDC + nJulsa;
                  nDCType     := 1;
                end;
              end else begin
                nDCYogum := nDCYogum + nTimeDC;
                edtDCYogum.Text := IntToStr(nDCYogum);
                edtDCYogum.AutoThousandSeparator := True;

                for i := 6 downto 2 do begin
                  with frmMainNew do begin
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Visible := False;
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Caption := '0';
                  end;
                end;
                lbYogum1.Caption := '0';
                lbDCName.Caption := sName;

                with DCProc[nDCCnt] do begin
                  nDCNo := nDCInfoNo;
                  sDCName := sName;
                  nDCAmt := nTimeDC;
                  nRealDCAmt := nProcYogum;
                  nDCType     := 1;
                end;
                nProcYogum := 0;
                edtProcYogum.Text := '0';
              end;
            end;

          2:
            begin // 퍼센트할인.
              nDCCnt := nDCCnt + 1;
              nPerDC := (nProcYogum * nValue) div 100;

              if nProcYogum >= nPerDC then begin
                nProcYogum := nProcYogum - nPerDC;
                nJulsa := JulsaProc(nProcYogum);
                nProcYogum := nProcYogum - nJulsa;
                nDCYogum := nDCYogum + nPerDC;
                nDCYogum := nDCYogum + nJulsa;
                edtProcYogum.Text := FormatFloat('#,##0', nProcYogum);
                edtDCYogum.Text := IntToStr(nDCYogum);
                edtDCYogum.AutoThousandSeparator := True;
                sYogum := IntToStr(nProcYogum);

                for i := 1 to 6 do begin
                  with frmMainNew do
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Visible := False;
                end;

                for i := 1 to Length(sYogum) do begin
                  with frmMainNew do begin
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Visible := True;
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Caption :=
                      Copy(sYogum, Length(sYogum) - (i - 1), 1);
                  end;
                end;
                lbDCName.Caption := sName;

                with DCProc[nDCCnt] do begin
                  nDCNo := nDCInfoNo;
                  sDCName := sName;
                  nDCAmt := nPerDC + nJulsa;
                  nRealDCAmt := nPerDC + nJulsa;
                  nDCType     := 2;
                end;
              end else begin
                nDCYogum := nDCYogum + nPerDC;
                edtDCYogum.Text := IntToStr(nDCYogum);
                edtDCYogum.AutoThousandSeparator := True;

                for i := 6 downto 2 do begin
                  with frmMainNew do begin
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Visible := False;
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Caption := '0';
                  end;
                end;
                lbYogum1.Caption := '0';
                lbDCName.Caption := sName;

                with DCProc[nDCCnt] do begin
                  nDCNo := nDCInfoNo;
                  sDCName := sName;
                  nDCAmt := nPerDC;
                  nRealDCAmt := nProcYogum;
                  nDCType     := 2;
                end;
                nProcYogum := 0;
                edtProcYogum.Text := '0';
              end;
            end;
        end;

        InspectionLog('VIP할인요금: ' + edtDCYogum.Text);
        lbDCName.Caption:= 'VIP할인';
      end;
    except
      on E: Exception do ExceptLogging('TfrmMainNew.VIPDCProc: ' + aString(E.Message));
    end;
  except
    on E: Exception do ExceptLogging('TfrmMainNew.VIPDCProc: ' + aString(E.Message));
  end;

end;

procedure TfrmMainNew.DBAdvGrid1Click(Sender: TObject);
begin
  if dmTables.qrySCSearch.RecordCount > 0 then
  begin
    sManualSCCarNo := dmTables.qrySCSearch.FieldByName('CarNo').AsString;
    btnSCOut.Enabled := True;
  end
  else
    sManualSCCarNo := '';
end;

procedure TfrmMainNew.DBAdvGrid2Click(Sender: TObject);
begin
  if dmTables.qrySCSearch.RecordCount > 0 then
  begin
    sManualSCCarNo := dmTables.qrySCSearch.FieldByName('CarNo').AsString;
    btnManualSCOut.Enabled := True;
  end
  else
  begin
    sManualSCCarNo := '';
    btnManualSCOut.Enabled := False;
  end;
end;

procedure TfrmMainNew.BarCodeDCDetail(nCnt: Integer);
var
  nTimeDC, // 시간할인시 할인된 금액.
  nPerDC, // 퍼센트할인시 할인된 금액.
  nJulsa, nValue,nValue1, nTimeDC1,nTypeCode: Integer;
  sName, sYogum, sUpche, sCheckDate: aString;
  i, nChk, nDCType: Byte;
begin
  try
    with dmTables.qryDCTemp do begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from DCInfo where DCNo = :N1');
      Parameters.ParamByName('N1').Value:= RBarCodeDCData[nCnt].nBarCodeDCNo;
      Open;

      if RecordCount > 0 then begin
        nDCType:= FieldByName('DCType').AsInteger;
        sName:= FieldByName('DCName').AsString;
        nValue:= FieldByName('DCValue').AsInteger;
      end;
    end;
    InspectionLog('웹할인: ' + IntToStr(RBarCodeDCData[nCnt].nBarCodeDCNo) + ', ' +
                               IntToStr(nValue) + ', ' +
                               sName );

      if nProcYogum > 0 then begin
        Case nDCType of
          0:
            begin // 금액할인.
              nDCCnt := nDCCnt + 1;

              if nProcYogum >= nValue then begin
                nProcYogum := nProcYogum - nValue;
                nJulsa := JulsaProc(nProcYogum);
                nProcYogum := nProcYogum - nJulsa;
                nDCYogum := nDCYogum + nValue;
                nDCYogum := nDCYogum + nJulsa;

                edtProcYogum.Text := FormatFloat('#,##0', nProcYogum);
                edtDCYogum.Text := IntToStr(nDCYogum);
                edtDCYogum.AutoThousandSeparator := True;
                sYogum := IntToStr(nProcYogum);

                for i := 1 to 6 do begin
                  with frmMainNew do
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Visible := False;
                end;

                for i := 1 to Length(sYogum) do begin
                  with frmMainNew do begin
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Visible := True;
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Caption := Copy(sYogum, Length(sYogum) - (i - 1), 1);
                  end;
                end;
                lbDCName.Caption := sName;

                with DCProc[nDCCnt] do begin
                  nDCNo       := RBarCodeDCData[nCnt].nBarCodeDCNo;
                  sDCName     := sName;
                  nDCAmt      := nValue + nJulsa;
                  nRealDCAmt  := nValue + nJulsa;
                  nDCType     := 0;
                end;
              end else begin
                nDCYogum := nDCYogum + nProcYogum;
                edtDCYogum.Text := IntToStr(nDCYogum);
                edtDCYogum.AutoThousandSeparator := True;

                for i := 6 downto 2 do begin
                  with frmMainNew do begin
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Visible := False;
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Caption := '0';
                  end;
                end;
                lbYogum1.Caption := '0';
                lbDCName.Caption := sName;

                with DCProc[nDCCnt] do begin
                  nDCNo := RBarCodeDCData[nCnt].nBarCodeDCNo;
                  sDCName := sName;
                  nDCAmt := nValue;
                  nRealDCAmt := nProcYogum;
                  nDCType     := 0;
                end;
                nProcYogum := 0;
                edtProcYogum.Text := '0';
              end;
            end;

          1:    { TODO  : 웹할인 - 시간할인 }
            begin // 시간할인.
              nDCCnt := nDCCnt + 1;
              sDCOutTime := MG_AddTime(sDCOutTime, 0, -nValue, 0, 0);

              nTimeDC := nProcYogum - FeeCalc(nCurrParkNo, nFeeNo, PAnsiChar(Copy(aString(lbInTime.Caption), 1, 16)),
                                                  PAnsiChar(Copy(sDCOutTime, 1, 16)));

              if nProcYogum >= nTimeDC then begin
                nProcYogum := nProcYogum - nTimeDC;
                nJulsa := JulsaProc(nProcYogum);
                nProcYogum := nProcYogum - nJulsa;
                nDCYogum := nDCYogum + nTimeDC;
                nDCYogum := nDCYogum + nJulsa;
                edtProcYogum.Text := FormatFloat('#,##0', nProcYogum);
                edtDCYogum.Text := IntToStr(nDCYogum);
                edtDCYogum.AutoThousandSeparator := True;
                sYogum := IntToStr(nProcYogum);

                for i := 1 to 6 do begin
                  with frmMainNew do
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Visible := False;
                end;

                for i := 1 to Length(sYogum) do begin
                  with frmMainNew do begin
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Visible := True;
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Caption :=
                      Copy(sYogum, Length(sYogum) - (i - 1), 1);
                  end;
                end;
                lbDCName.Caption := sName;

                with DCProc[nDCCnt] do begin
                  nDCNo := RBarCodeDCData[nCnt].nBarCodeDCNo;
                  sDCName := sName;
                  nDCAmt := nTimeDC + nJulsa;
                  nRealDCAmt := nTimeDC + nJulsa;
                  nDCType     := 1;
                end;
              end else begin
                nDCYogum := nDCYogum + nTimeDC;
                edtDCYogum.Text := IntToStr(nDCYogum);
                edtDCYogum.AutoThousandSeparator := True;

                for i := 6 downto 2 do begin
                  with frmMainNew do begin
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Visible := False;
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Caption := '0';
                  end;
                end;
                lbYogum1.Caption := '0';
                lbDCName.Caption := sName;

                with DCProc[nDCCnt] do begin
                  nDCNo := RBarCodeDCData[nCnt].nBarCodeDCNo;
                  sDCName := sName;
                  nDCAmt := nTimeDC;
                  nRealDCAmt := nProcYogum;
                  nDCType     := 1;
                end;
                nProcYogum := 0;
                edtProcYogum.Text := '0';
              end;
            end;

          2:
            begin // 퍼센트할인.
              nDCCnt := nDCCnt + 1;
              nPerDC := (nProcYogum * nValue) div 100;

              if nProcYogum >= nPerDC then begin
                nProcYogum := nProcYogum - nPerDC;
                nJulsa := JulsaProc(nProcYogum);
                nProcYogum := nProcYogum - nJulsa;
                nDCYogum := nDCYogum + nPerDC;
                nDCYogum := nDCYogum + nJulsa;
                edtProcYogum.Text := FormatFloat('#,##0', nProcYogum);
                edtDCYogum.Text := IntToStr(nDCYogum);
                edtDCYogum.AutoThousandSeparator := True;
                sYogum := IntToStr(nProcYogum);

                for i := 1 to 6 do begin
                  with frmMainNew do
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Visible := False;
                end;

                for i := 1 to Length(sYogum) do begin
                  with frmMainNew do begin
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Visible := True;
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Caption :=
                      Copy(sYogum, Length(sYogum) - (i - 1), 1);
                  end;
                end;
                lbDCName.Caption := sName;

                with DCProc[nDCCnt] do begin
                  nDCNo := RBarCodeDCData[nCnt].nBarCodeDCNo;
                  sDCName := sName;
                  nDCAmt := nPerDC + nJulsa;
                  nRealDCAmt := nPerDC + nJulsa;
                  nDCType     := 2;
                end;
              end else begin
                nDCYogum := nDCYogum + nPerDC;
                edtDCYogum.Text := IntToStr(nDCYogum);
                edtDCYogum.AutoThousandSeparator := True;

                for i := 6 downto 2 do begin
                  with frmMainNew do begin
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Visible := False;
                    TLabel(FindComponent('lbYogum' + IntToStr(i))).Caption := '0';
                  end;
                end;
                lbYogum1.Caption := '0';
                lbDCName.Caption := sName;

                with DCProc[nDCCnt] do begin
                  nDCNo := RBarCodeDCData[nCnt].nBarCodeDCNo;
                  sDCName := sName;
                  nDCAmt := nPerDC;
                  nRealDCAmt := nProcYogum;
                  nDCType     := 2;
                end;
                nProcYogum := 0;
                edtProcYogum.Text := '0';
              end;
            end;
        end;
        InspectionLog('Pos할인요금: ' + edtDCYogum.Text);
        lbDCName.Caption:= 'POS할인';
      end;
  except
    on E: Exception do ExceptLogging('TfrmMainNew.WebDCDetail: ' + aString(E.Message));
  end;
end;

procedure TfrmMainNew.BarCodeDCProc(sCarNo: String);
var
  nTotCnt, nDCNo, nDCValue, nDCCnt,nParnas, i, j, nTemp1, nTemp2, nDiscountMoney: Integer;
  sTempWeb, sTemp, sDCName, sUpche, sWebInfo,sShortCarNo,sSixCarNo: String;
begin
  try
    i := 0;
    nPosAmt := 0;
    nPosCount := 0;
    sShortCarNo :=Copy(sCarNo, Length(sCarNo) -3, 4);
    sSixCarNo := FindNumber(sCarNo);
    with dmTables.qryDCTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select count(*) as PosCount, Sum(ProcAmt) as PosProcAmt from PosData where SaleDate = :N1  ');
//      SQL.Add( ' and CarNo = :N4 ');
      SQL.Add( ' and CarNo like ' + MG_MakeStr('%' + Trim(sSixCarNo) + '%'));
      Parameters.ParamByName('N1').Value:= FormatDateTime('YYMMDD', Now);
//      Parameters.ParamByName('N4').Value:= sSixCarNo;
      if bApsPay then
      begin
        SQL.Add(' and ProcDate = :N2 and ProcTime >= :N3 ') ;
        Parameters.ParamByName('N2').Value:= Copy(sApsPayDate,1,4) + '-' + Copy(sApsPayDate,5,2) + '-' +  Copy(sApsPayDate,7,2);
        Parameters.ParamByName('N3').Value:= Copy(sAPSPayTime,1,2) + ':' + Copy(sAPSPayTime,3,2) + ':' +  Copy(sAPSPayTime,5,2);;
      end;
      Open;
      if RecordCount > 0 then
      begin
        nPosCount  := FieldByName('PosCount').AsInteger ;
        nPosAmt    :=  FieldByName('PosProcAmt').AsInteger;
        if nPosCount > 0 then
        begin
          nPosCount  := FieldByName('PosCount').AsInteger ;
          nPosAmt    :=  FieldByName('PosProcAmt').AsInteger;
        end
        else
        begin
          Close;
          SQL.Clear;
          SQL.Add('Select count(*) as PosCount, Sum(ProcAmt) as PosProcAmt from PosData where SaleDate = :N1  ');
          Parameters.ParamByName('N1').Value:= FormatDateTime('YYMMDD', Now);
  //        SQL.Add( ' and CarNo = :N4 ') ;
          SQL.Add( ' and CarNo like ' + MG_MakeStr('%' + Trim(sShortCarNo) + '%'));
  //        Parameters.ParamByName('N4').Value:= sShortCarNo;
          if bApsPay then
          begin
            SQL.Add(' and ProcDate = :N2 and ProcTime >= :N3 ') ;
            Parameters.ParamByName('N2').Value:= Copy(sApsPayDate,1,4) + '-' + Copy(sApsPayDate,5,2) + '-' +  Copy(sApsPayDate,7,2);
            Parameters.ParamByName('N3').Value:= Copy(sAPSPayTime,1,2) + ':' + Copy(sAPSPayTime,3,2) + ':' +  Copy(sAPSPayTime,5,2);;
          end;
          Open;
          if RecordCount > 0 then
          begin
            nPosCount := FieldByName('PosCount').AsInteger ;
            nPosAmt  :=  FieldByName('PosProcAmt').AsInteger;
          end
          else
          begin
            nPosAmt := 0;
            nPosCount := 0;
          end;
        end;
      end
      else
      begin
        nPosAmt := 0;
        nPosCount := 0;
      end;

      Close;
      SQL.Clear;
      SQL.Add('Select * from DcMoneyInfo where (SmallDiscountMoney <= :N1) and (BigDiscountMoney >= :N2) ') ;
      Parameters.ParamByName('N1').Value:= nPosAmt;
      Parameters.ParamByName('N2').Value:= nPosAmt;
      Open;
      if RecordCount > 0 then
      begin
        i := i + 1 ;
        RBarCodeDCData[i].nBarCodeDCNo :=  FieldByName('DcNo').AsInteger;
        RBarCodeDCData[i].sBarCodeDCMessage := FieldByName('discountMessage').AsString;
      end;
    end;

    nTotCnt:= i;
    if nTotCnt > 0 then
    begin
      for j := 1 to nTotCnt do
        BarCodeDCDetail(j);
    end;
  except
    on E: Exception do ExceptLogging('TfrmMainNew.BarCodeDCProc: ' + aString(E.Message));
  end;
end;

procedure TfrmMainNew.BarcodeProc(sSerial, sExpDate, sDCType,
  sDCAmt: AnsiString);
var
  nTimeDC, // 시간할인시 할인된 금액.
  nPerDC, // 퍼센트할인시 할인된 금액.
  nJulsa: Integer;
  sName, sYogum: aString;
  i: Byte;
begin
  try
    if sExpDate < FormatDateTime('YYMMDD', Now) then
    begin
      ShowMessage('유효기간이 경과된 할인권입니다.  유효기간:20' + MG_StrToStr
          (sExpDate, '##-##-##'));
      Exit;
    end;

    for i := 1 to 50 do
    begin
      if DCProc[i].sDCTKNo = sSerial then
      begin
        ShowMessage('방금 사용된 할인권입니다.');
        Exit;
      end;
    end;

    with dmTables.qryDCTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from DCDetail where DCTKNo = :N1');
      Parameters.ParamByName('N1').Value := sSerial;
      Open;

      if RecordCount > 0 then
      begin
        ShowMessage('이미 사용된 할인권입니다.');
        Exit;
      end;
    end;

    if nProcYogum > 0 then
    begin
      // sName := '할인권할인';

      Case StrToInt(sDCType) of
        0:
          begin // 금액할인.
            nDCCnt := nDCCnt + 1;

            if StrToInt(sDCAmt) = 1200 then
              sDCAmt := '1800';

            if StrToInt(sDCAmt) = 2400 then
              sDCAmt := '3600';

            sName := IntToStr(StrToInt(sDCAmt)) + '원 할인';

            if nProcYogum >= StrToInt(sDCAmt) then
            begin
              nProcYogum := nProcYogum - StrToInt(sDCAmt);
              nJulsa := JulsaProc(nProcYogum);
              nProcYogum := nProcYogum - nJulsa;
              nDCYogum := nDCYogum + StrToInt(sDCAmt);
              nDCYogum := nDCYogum + nJulsa;

              //edtProcYogum.Text := IntToStr(nProcYogum);
              edtProcYogum.Text := FormatFloat('#,##0', nProcYogum);
              //edtProcYogum.AutoThousandSeparator := True;
              edtDCYogum.Text := IntToStr(nDCYogum);
              edtDCYogum.AutoThousandSeparator := True;
              sYogum := IntToStr(nProcYogum);

              for i := 1 to 6 do
              begin
                with frmMainNew do
                  TLabel(FindComponent('lbYogum' + IntToStr(i)))
                    .Visible := False;
              end;

              for i := 1 to Length(sYogum) do
              begin
                with frmMainNew do
                begin
                  TLabel(FindComponent('lbYogum' + IntToStr(i)))
                    .Visible := True;
                  TLabel(FindComponent('lbYogum' + IntToStr(i))).Caption := Copy
                    (sYogum, Length(sYogum) - (i - 1), 1);
                end;
              end;
              lbDCName.Caption := sName; // edtDCYogum.Text + '원';

              with DCProc[nDCCnt] do
              begin
                nDCNo := 0;
                sDCName := sName;
                nDCAmt := StrToInt(sDCAmt) + nJulsa;
                nRealDCAmt := StrToInt(sDCAmt) + nJulsa;
                sDCTKNo := sSerial;
                nDCType := 0;
              end;
            end
            else
            begin
              nDCYogum := nDCYogum + nProcYogum;
              edtDCYogum.Text := IntToStr(nDCYogum);

              for i := 6 downto 2 do
              begin
                with frmMainNew do
                begin
                  TLabel(FindComponent('lbYogum' + IntToStr(i)))
                    .Visible := False;
                  TLabel(FindComponent('lbYogum' + IntToStr(i))).Caption := '0';
                end;
              end;
              lbYogum1.Caption := '0';
              lbDCName.Caption := sName; // edtDCYogum.Text + '원';

              with DCProc[nDCCnt] do
              begin
                nDCNo := 0;
                sDCName := sName;
                nDCAmt := StrToInt(sDCAmt);
                nRealDCAmt := nProcYogum;
                sDCTKNo := sSerial;
                nDCType := 0;
              end;
              nProcYogum := 0;
              edtProcYogum.Text := '0';
            end;
          end;

        1:
          begin // 시간할인.
            nDCCnt := nDCCnt + 1;
            sName := IntToStr(StrToInt(sDCAmt)) + '분 할인';
            sDCOutTime := MG_AddTime(sDCOutTime, 0, -StrToInt(sDCAmt), 0, 0);
            // nTimeDC := ReturnFee(nCurrParkNo, nFeeNo, PAnsiChar(Copy(sDCOutTime, 1, 16)),
            // PAnsiChar(sNowOutDate + ' ' + Copy(sNowOutTime, 1, 5)));
            nTimeDC := ReturnFee
              (nCurrParkNo, nFeeNo, PAnsiChar(Copy(sDCOutTime, 1, 16)),
              PAnsiChar(sTimeDCOutDate + ' ' + Copy(sTimeDCOutTime, 1, 5)));
            sTimeDCOutDate := Copy(sDCOutTime, 1, 10);
            sTimeDCOutTime := Copy(sDCOutTime, 12, 8);

            if nProcYogum >= nTimeDC then
            begin
              nProcYogum := nProcYogum - nTimeDC;
              nJulsa := JulsaProc(nProcYogum);
              nProcYogum := nProcYogum - nJulsa;
              nDCYogum := nDCYogum + nTimeDC;
              nDCYogum := nDCYogum + nJulsa;
              //edtProcYogum.Text := IntToStr(nProcYogum);
              edtProcYogum.Text := FormatFloat('#,##0', nProcYogum);
              //edtProcYogum.AutoThousandSeparator := True;
              edtDCYogum.Text := IntToStr(nDCYogum);
              edtDCYogum.AutoThousandSeparator := True;
              sYogum := IntToStr(nProcYogum);

              for i := 1 to 6 do
              begin
                with frmMainNew do
                  TLabel(FindComponent('lbYogum' + IntToStr(i)))
                    .Visible := False;
              end;

              for i := 1 to Length(sYogum) do
              begin
                with frmMainNew do
                begin
                  TLabel(FindComponent('lbYogum' + IntToStr(i)))
                    .Visible := True;
                  TLabel(FindComponent('lbYogum' + IntToStr(i))).Caption := Copy
                    (sYogum, Length(sYogum) - (i - 1), 1);
                end;
              end;
              lbDCName.Caption := sName; // edtDCYogum.Text + '원';

              with DCProc[nDCCnt] do
              begin
                nDCNo := 0;
                sDCName := sName;
                nDCAmt := nTimeDC + nJulsa;
                nRealDCAmt := nTimeDC + nJulsa;
                sDCTKNo := sSerial;
                nDCType := 1;
              end;
            end
            else
            begin
              nDCYogum := nDCYogum + nTimeDC;
              edtDCYogum.Text := IntToStr(nDCYogum);

              for i := 6 downto 2 do
              begin
                with frmMainNew do
                begin
                  TLabel(FindComponent('lbYogum' + IntToStr(i)))
                    .Visible := False;
                  TLabel(FindComponent('lbYogum' + IntToStr(i))).Caption := '0';
                end;
              end;
              lbYogum1.Caption := '0';
              lbDCName.Caption := sName; // edtDCYogum.Text + '원';

              with DCProc[nDCCnt] do
              begin
                nDCNo := 0;
                sDCName := sName;
                nDCAmt := nTimeDC;
                nRealDCAmt := nProcYogum;
                sDCTKNo := sSerial;
                nDCType := 1;
              end;
              nProcYogum := 0;
              edtProcYogum.Text := '0';
            end;
          end;

        2:
          begin // 퍼센트할인.
            nDCCnt := nDCCnt + 1;
            sName := IntToStr(StrToInt(sDCAmt)) + '% 할인';
            nPerDC := (nProcYogum * StrToInt(sDCAmt)) div 100;

            if nProcYogum >= nPerDC then
            begin
              nProcYogum := nProcYogum - nPerDC;
              nJulsa := JulsaProc(nProcYogum);
              nProcYogum := nProcYogum - nJulsa;
              nDCYogum := nDCYogum + nPerDC;
              nDCYogum := nDCYogum + nJulsa;
              //edtProcYogum.Text := IntToStr(nProcYogum);
              edtProcYogum.Text := FormatFloat('#,##0', nProcYogum);
              //edtProcYogum.AutoThousandSeparator := True;
              edtDCYogum.Text := IntToStr(nDCYogum);
              edtDCYogum.AutoThousandSeparator := True;
              sYogum := IntToStr(nProcYogum);

              for i := 1 to 6 do
              begin
                with frmMainNew do
                  TLabel(FindComponent('lbYogum' + IntToStr(i)))
                    .Visible := False;
              end;

              for i := 1 to Length(sYogum) do
              begin
                with frmMainNew do
                begin
                  TLabel(FindComponent('lbYogum' + IntToStr(i)))
                    .Visible := True;
                  TLabel(FindComponent('lbYogum' + IntToStr(i))).Caption := Copy
                    (sYogum, Length(sYogum) - (i - 1), 1);
                end;
              end;
              lbDCName.Caption := sName; // edtDCYogum.Text + '원';

              with DCProc[nDCCnt] do
              begin
                nDCNo := 0;
                sDCName := sName;
                nDCAmt := nPerDC + nJulsa;
                nRealDCAmt := nPerDC + nJulsa;
                sDCTKNo := sSerial;
                nDCType := 2;
              end;
            end
            else
            begin
              nDCYogum := nDCYogum + nPerDC;
              edtDCYogum.Text := IntToStr(nDCYogum);

              for i := 6 downto 2 do
              begin
                with frmMainNew do
                begin
                  TLabel(FindComponent('lbYogum' + IntToStr(i)))
                    .Visible := False;
                  TLabel(FindComponent('lbYogum' + IntToStr(i))).Caption := '0';
                end;
              end;
              lbYogum1.Caption := '0';
              lbDCName.Caption := sName; // edtDCYogum.Text + '원';

              with DCProc[nDCCnt] do
              begin
                nDCNo := 0;
                sDCName := sName;
                nDCAmt := nPerDC;
                nRealDCAmt := nProcYogum;
                sDCTKNo := sSerial;
                nDCType := 2;
              end;
              nProcYogum := 0;
              edtProcYogum.Text := '0';
            end;
          end;
      end;

      if edtDC.Text = '' then
      begin
        edtDC.Text := sName;
      end
      else
      begin
        edtDC.Text := edtDC.Text + ', ' + sName;
      end;
    end;
  except
    on E: Exception do
      ExceptLogging('BarcodeProc: ' + aString(E.Message));
  end;
end;

procedure TfrmMainNew.BarcodeProc1(sJumcode, sDeviceCode, sDCNo, sIssueDate,
  sSerialNumber, sBarcodeData: AnsiString);
var
  nTimeDC, // 시간할인시 할인된 금액.
  nPerDC, // 퍼센트할인시 할인된 금액.
  nJulsa,nDCType,nValue: Integer;
  sName, sYogum: aString;
  i: Byte;
begin
  try
    for i := 1 to 50 do
    begin
      if DCProc[i].sDCTKNo = sBarcodeData then
      begin
        ShowMessage('방금 사용된 할인권입니다.');
        Exit;
      end;
    end;

    with dmTables.qryDCTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from DCDetail where DCTKNo = :N1');
      Parameters.ParamByName('N1').Value := sBarcodeData;
      Open;

      if RecordCount > 0 then
      begin
        ShowMessage('이미 사용된 할인권입니다.');
        Exit;
      end;
    end;

    with dmTables.qryDCTemp do begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from DCInfo where DCNo = :N1');
      Parameters.ParamByName('N1').Value:= StrToInt(sDCNo);
      Open;

      if RecordCount > 0 then begin
        nDCType:= FieldByName('DCType').AsInteger;
        sName:= FieldByName('DCName').AsString;
        nValue:= FieldByName('DCValue').AsInteger;
      end;
    end;

    if nProcYogum > 0 then
    begin
      // sName := '할인권할인';

      Case nDCType of
        0:
          begin // 금액할인.
            nDCCnt := nDCCnt + 1;

            sName := IntToStr(nValue) + '원 할인';

            if nProcYogum >= nValue then
            begin
              nProcYogum := nProcYogum - nValue;
              nJulsa := JulsaProc(nProcYogum);
              nProcYogum := nProcYogum - nJulsa;
              nDCYogum := nDCYogum + nValue;
              nDCYogum := nDCYogum + nJulsa;

              //edtProcYogum.Text := IntToStr(nProcYogum);
              edtProcYogum.Text := FormatFloat('#,##0', nProcYogum);
              //edtProcYogum.AutoThousandSeparator := True;
              edtDCYogum.Text := IntToStr(nDCYogum);
              edtDCYogum.AutoThousandSeparator := True;
              sYogum := IntToStr(nProcYogum);

              for i := 1 to 6 do
              begin
                with frmMainNew do
                  TLabel(FindComponent('lbYogum' + IntToStr(i)))
                    .Visible := False;
              end;

              for i := 1 to Length(sYogum) do
              begin
                with frmMainNew do
                begin
                  TLabel(FindComponent('lbYogum' + IntToStr(i)))
                    .Visible := True;
                  TLabel(FindComponent('lbYogum' + IntToStr(i))).Caption := Copy
                    (sYogum, Length(sYogum) - (i - 1), 1);
                end;
              end;
              lbDCName.Caption := sName; // edtDCYogum.Text + '원';

              with DCProc[nDCCnt] do
              begin
                nDCNo := 0;
                sDCName := sName;
                nDCAmt := nValue + nJulsa;
                nRealDCAmt := nValue + nJulsa;
                sDCTKNo := sBarcodeData;
                nDCType := 0;
              end;
            end
            else
            begin
              nDCYogum := nDCYogum + nProcYogum;
              edtDCYogum.Text := IntToStr(nDCYogum);

              for i := 6 downto 2 do
              begin
                with frmMainNew do
                begin
                  TLabel(FindComponent('lbYogum' + IntToStr(i)))
                    .Visible := False;
                  TLabel(FindComponent('lbYogum' + IntToStr(i))).Caption := '0';
                end;
              end;
              lbYogum1.Caption := '0';
              lbDCName.Caption := sName; // edtDCYogum.Text + '원';

              with DCProc[nDCCnt] do
              begin
                nDCNo := 0;
                sDCName := sName;
                nDCAmt := nValue;
                nRealDCAmt := nProcYogum;
                sDCTKNo := sBarcodeData;
                nDCType := 0;
              end;
              nProcYogum := 0;
              edtProcYogum.Text := '0';
            end;
          end;

        1:
          begin // 시간할인.
            nDCCnt := nDCCnt + 1;
            sName := IntToStr(nValue) + '분 할인';
            sDCOutTime := MG_AddTime(sDCOutTime, 0, -nValue, 0, 0);

            nTimeDC := nProcYogum - FeeCalc(nCurrParkNo, nFeeNo, PAnsiChar(Copy(aString(lbInTime.Caption), 1, 16)),
                                                PAnsiChar(Copy(sDCOutTime, 1, 16)));

            if nProcYogum >= nTimeDC then
            begin
              nProcYogum := nProcYogum - nTimeDC;
              nJulsa := JulsaProc(nProcYogum);
              nProcYogum := nProcYogum - nJulsa;
              nDCYogum := nDCYogum + nTimeDC;
              nDCYogum := nDCYogum + nJulsa;
              //edtProcYogum.Text := IntToStr(nProcYogum);
              edtProcYogum.Text := FormatFloat('#,##0', nProcYogum);
              //edtProcYogum.AutoThousandSeparator := True;
              edtDCYogum.Text := IntToStr(nDCYogum);
              edtDCYogum.AutoThousandSeparator := True;
              sYogum := IntToStr(nProcYogum);

              for i := 1 to 6 do
              begin
                with frmMainNew do
                  TLabel(FindComponent('lbYogum' + IntToStr(i)))
                    .Visible := False;
              end;

              for i := 1 to Length(sYogum) do
              begin
                with frmMainNew do
                begin
                  TLabel(FindComponent('lbYogum' + IntToStr(i)))
                    .Visible := True;
                  TLabel(FindComponent('lbYogum' + IntToStr(i))).Caption := Copy
                    (sYogum, Length(sYogum) - (i - 1), 1);
                end;
              end;
              lbDCName.Caption := sName; // edtDCYogum.Text + '원';

              with DCProc[nDCCnt] do
              begin
                nDCNo := 0;
                sDCName := sName;
                nDCAmt := nTimeDC + nJulsa;
                nRealDCAmt := nTimeDC + nJulsa;
                sDCTKNo := sBarcodeData;
                nDCType := 1;
              end;
            end
            else
            begin
              nDCYogum := nDCYogum + nTimeDC;
              edtDCYogum.Text := IntToStr(nDCYogum);

              for i := 6 downto 2 do
              begin
                with frmMainNew do
                begin
                  TLabel(FindComponent('lbYogum' + IntToStr(i)))
                    .Visible := False;
                  TLabel(FindComponent('lbYogum' + IntToStr(i))).Caption := '0';
                end;
              end;
              lbYogum1.Caption := '0';
              lbDCName.Caption := sName; // edtDCYogum.Text + '원';

              with DCProc[nDCCnt] do
              begin
                nDCNo := 0;
                sDCName := sName;
                nDCAmt := nTimeDC;
                nRealDCAmt := nProcYogum;
                sDCTKNo := sBarcodeData;
                nDCType := 1;
              end;
              nProcYogum := 0;
              edtProcYogum.Text := '0';
            end;
          end;

        2:
          begin // 퍼센트할인.
            nDCCnt := nDCCnt + 1;
            sName := IntToStr(nValue) + '% 할인';
            nPerDC := (nProcYogum * nValue) div 100;

            if nProcYogum >= nPerDC then
            begin
              nProcYogum := nProcYogum - nPerDC;
              nJulsa := JulsaProc(nProcYogum);
              nProcYogum := nProcYogum - nJulsa;
              nDCYogum := nDCYogum + nPerDC;
              nDCYogum := nDCYogum + nJulsa;
              //edtProcYogum.Text := IntToStr(nProcYogum);
              edtProcYogum.Text := FormatFloat('#,##0', nProcYogum);
              //edtProcYogum.AutoThousandSeparator := True;
              edtDCYogum.Text := IntToStr(nDCYogum);
              edtDCYogum.AutoThousandSeparator := True;
              sYogum := IntToStr(nProcYogum);

              for i := 1 to 6 do
              begin
                with frmMainNew do
                  TLabel(FindComponent('lbYogum' + IntToStr(i)))
                    .Visible := False;
              end;

              for i := 1 to Length(sYogum) do
              begin
                with frmMainNew do
                begin
                  TLabel(FindComponent('lbYogum' + IntToStr(i)))
                    .Visible := True;
                  TLabel(FindComponent('lbYogum' + IntToStr(i))).Caption := Copy
                    (sYogum, Length(sYogum) - (i - 1), 1);
                end;
              end;
              lbDCName.Caption := sName; // edtDCYogum.Text + '원';

              with DCProc[nDCCnt] do
              begin
                nDCNo := 0;
                sDCName := sName;
                nDCAmt := nPerDC + nJulsa;
                nRealDCAmt := nPerDC + nJulsa;
                sDCTKNo := sBarcodeData;
                nDCType := 2;
              end;
            end
            else
            begin
              nDCYogum := nDCYogum + nPerDC;
              edtDCYogum.Text := IntToStr(nDCYogum);

              for i := 6 downto 2 do
              begin
                with frmMainNew do
                begin
                  TLabel(FindComponent('lbYogum' + IntToStr(i)))
                    .Visible := False;
                  TLabel(FindComponent('lbYogum' + IntToStr(i))).Caption := '0';
                end;
              end;
              lbYogum1.Caption := '0';
              lbDCName.Caption := sName; // edtDCYogum.Text + '원';

              with DCProc[nDCCnt] do
              begin
                nDCNo := 0;
                sDCName := sName;
                nDCAmt := nPerDC;
                nRealDCAmt := nProcYogum;
                sDCTKNo := sBarcodeData;
                nDCType := 2;
              end;
              nProcYogum := 0;
              edtProcYogum.Text := '0';
            end;
          end;
      end;

      if edtDC.Text = '' then
      begin
        edtDC.Text := sName;
      end
      else
      begin
        edtDC.Text := edtDC.Text + ', ' + sName;
      end;
    end;
  except
    on E: Exception do
      ExceptLogging('BarcodeProc: ' + aString(E.Message));
  end;
end;


procedure TfrmMainNew.edtBarcodeKeyPress(Sender: TObject; var Key: Char);
var
  sBarcodeData, sNo, sExp, sType, sAmt: aString;
begin
  if (Key = #13) and btnProc.Enabled then
  begin
    if (edtBarcode.Text = '') then
      btnProcClick(Self)
    else
    begin
      // 할인권 처리...
      sBarcodeData := edtBarcode.Text;

      if Length(sBarcodeData) < 20 then
      begin
        ShowMessage('할인권 데이터 오류입니다.' + #13#10 + '할인권을 다시 읽혀주세요!');
        edtBarcode.Text := '';
        edtBarcode.SetFocus;
        Exit;
      end
      else
      begin
        if not MG_NumberCheck(sBarcodeData) then
        begin
          ShowMessage('할인권 데이터 오류입니다.' + #13#10 + '할인권을 다시 읽혀주세요!');
          edtBarcode.Text := '';
          edtBarcode.SetFocus;
          Exit;
        end;
        sNo := Copy(sBarcodeData, 1, 7);
        sExp := Copy(sBarcodeData, 8, 6);
        sType := Copy(sBarcodeData, 14, 1);
        sAmt := Copy(sBarcodeData, 15, 6);
        edtBarcode.Text := '';

        BarcodeProc(sNo, sExp, sType, sAmt);
      end;
    end;
  end
  else if (Key = #27) and btnCancel.Enabled then
  begin
    btnCancelClick(Self);
  end
  else
  begin
    edtBarcode.Text := edtBarcode.Text + Key;
  end;
end;

procedure TfrmMainNew.edtLostCarNoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnSeekClick(Self);
end;

procedure TfrmMainNew.edtManualCarNoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnManualOKClick(Self);
end;

procedure TfrmMainNew.edtManualOutTimeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnManualOutProcClick(Self);
end;

procedure TfrmMainNew.edtManualProcCarNoKeyPress
  (Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnManualSeekClick(Self);
end;

procedure TfrmMainNew.edtOutTimeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnManualOutOkClick(Self);
end;

procedure TfrmMainNew.edtProcYogumChange(Sender: TObject);
var
  sDspIP: aString;
  i: Byte;
begin
  for i := 1 to 10 do
  begin
    if RLpr[i].nUnitNo = nowLpr.Tag then
    begin
      sDspIP := RLpr[i].sDspIP;
      Break;
    end;
  end;

  if edtProcYogum.Text <> '0' then
    DspProc(2, 3, '주차요금    ' + MG_Right(edtProcYogum.Text + '원', 12), sDspIP)
  else
    DspProc(2, 4, '주차요금    ' + MG_Right(edtProcYogum.Text + '원', 12), sDspIP);
end;

procedure TfrmMainNew.edtSCCarNoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnSCClick(Self);
end;

procedure TfrmMainNew.ClearDCProc;
var
  i: Integer;
begin
  //2018.01.09 AK프라자 로직 추가 시작//
  for i := 1 to 50 do
  begin
    with DCProc[i] do
    begin
      nDCNo := 0;
      sDCName := '';
      nDCAmt := 0;
      nRealDCAmt := 0;
      nDCType := 0;
      nTime := 0;
      sDCTKNo := '';
      sDCTKIssueDate := '';
      sDCTKIssueTime := '';
      bWeb := false;
      sSeq := '';
      nSeq := 0;
    end;
    RDCCnt[i].nDCNowCnt := 0;
  end;
  for i := 1 to 10 do
  begin
    with RWebDCData[i] do
    begin
      nWebDCNo := 0;
      nWebDCValue := 0;
      sWebDCMessage:= '';
      nWebDCType := 0;
      sSeq := '';
      nSeq := 0;
    end;
    with RBarCodeDCData[i] do
    begin
      nBarCodeDCNo := 0;
      sBarCodeDCMessage := '';;
    end;
  end;
  //2018.01.09 AK프라자 로직 추가 종료//
//  for i := 1 to 50 do
//  begin
//    with DCProc[i] do
//    begin
//      nDCNo := 0;
//      sDCName := '';
//      nDCAmt := 0;
//      nRealDCAmt := 0;
//      nDCType := 0;
//      nTime := 0;
//      sDCTKNo := '';
//      sDCTKIssueDate := '';
//      sDCTKIssueTime := '';
//      bWeb := false;
//      sSeq := '';
//      nSeq := 0;
//    end;
//    RDCCnt[i].nDCNowCnt := 0;
//  end;
  sDCOutTime:= sNowOutDate + ' ' + sNowOutTime;
  nDCCnt := 0;
  nDCYogum := 0;
  edtDCYogum.Text := '0';
  edtDC.Text := '';
end;


procedure TfrmMainNew.Button4Click(Sender: TObject);
var
  nInCnt, nLprNo: Word;
  sLprDate: String;
begin
  AlarmProc('차량', '백화점', '12가1234', '정기챠랑');
end;

procedure TfrmMainNew.ClearFormData;
var
  i: Byte;
begin
  nPayType := 1;
  lbDCName.Caption := '';
  //lbOutCarNo.Caption := '';
  //lbOutCarType.Caption:= '';
  lbInCarNo.Caption := '';
  nDCCnt := 0;
  nParkingMin := 0;
  nProcYogum := 0;
  nDCYogum := 0;
  nFeeNo := 0;
  nTKType := 1;
  edtProcYogum.Text := '0';
  edtDCYogum.Text := '0';
  edtTotYogum.Text := '0';
  edtDC.Text := '';
  sNowInDate := '';
  sNowInTime := '';
  sCancelReason := '';
  sTimeDCOutDate := '';
  sTimeDCOutTime := '';
  edtBarcode.Text := '';
  bMiProc := False;
  edtCharo.Color := clWhite;
  edtCharo.Text := '';

  for i := 1 to 6 do
  begin
    TLabel(FindComponent('lbYogum' + IntToStr(i))).Caption := '0';
    TLabel(FindComponent('lbYogum' + IntToStr(i))).Visible := False;
  end;

  for i := 1 to 16 do
  begin
    TAdvShapeButton(FindComponent('btn' + IntToStr(i))).Enabled := False;
    TMenuItem(FindComponent('mnuDC' + IntToStr(i))).Enabled := False;
  end;

  for i := 1 to 50 do
    RDCCnt[i].nDCNowCnt := 0;

  ClearGTime;
  ClearDCProc;
  btnCancel.Enabled := False;
  btnProc.Enabled := False;

  if bNCOutProcWait then
  begin
    bNCOutProcWait := False;

    if nNCOutWaitPoint <> nNCOutWaitFlag then
    begin
      tNCOutWait.Enabled := True;
    end;
  end;

end;

procedure TfrmMainNew.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMainNew.btnLostCancelClick(Sender: TObject);
begin
  bMiProc := False;
  dmTables.qryLost.Close;
  imgLost.Picture.Assign(Nil);
  pnLost.Visible := False;
end;

procedure TfrmMainNew.btnLostProcClick(Sender: TObject);
var
  sResult: aString;
  sDspIP: aString;
  i: Byte;
begin
  for i := 1 to 10 do
  begin
    if RLpr[i].nUnitNo = nowLpr.Tag then
    begin
      sDspIP := RLpr[i].sDspIP;
      Break;
    end;
  end;

  //sNowIOTime, nNowLprNo, nNowLprInOut, nNowLprRecog1, nNowLprRecog2, sDspIP, nowLpr
  //를 선언해서 처리해야 한다...

  try
    pnLost.Visible := False;
    bMiProc := True;

    with dmTables.qryLprProc do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from CustInfo ');
      SQL.Add('where CarNo = :N1');
      Parameters.ParamByName('N1').Value := sLostInCarNo;
      Open;

      if RecordCount > 0 then
      begin
        // 등록된 정기차량이면...    nNowLprInOut -> 2 변경 (15.10.16)
        sResult := RecvLprProc(sNowLprFile1, sLostInCarNo, sNowLprFile2,
          sNowLprCarNo2, sNowIOTime, nNowLprNo, 2, nNowLprRecog1,
          nNowLprRecog2, sDspIP, nowLpr, True);
        imgIn.Picture := imgOut.Picture;
        GridData(sResult);
        ClearFormData;
      end
      else
      begin
        // 일반차량 처리...   nNowLprInOut -> 2 변경 (15.10.16)
        NormalProc(sNowLprFile1, sLostInCarNo, '', '', sNowIOTime, nNowLprNo,
          2, nNowLprRecog1, nNowLprRecog2, sDspIP, nowLpr, True);
        imgIn.Picture := imgLost.Picture;
      end;
    end;
    dmTables.qryLost.Close;
  except
    on E: Exception do
      ExceptLogging('TfrmMain.btnLostProcClick: ' + aString(E.Message));
  end;
end;

procedure TfrmMainNew.btnManualOKClick(Sender: TObject);
var
  sTKNo, sProcDate, sProcTime, sInCarNo: String;
begin
  try
    sTKNo := MG_InsZero(IntToStr(GetTickCount), 10);
    sProcDate := FormatDateTime('YYYY-MM-DD', Now);
    sProcTime := FormatDateTime('HH:NN:SS', Now);
    sInCarNo := MG_StrTrim(edtManualCarNo.Text, ' ');

    with dmTables do
    begin
      with qryDCTemp do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Insert Into IONData ');
        SQL.Add('(ParkNo, UnitNo, ProcDate, ProcTime, TKNo, TKType, ');
        SQL.Add('CarType, Status, OutChk, InImage1, InCarNo1, Reserve2) ');
        SQL.Add(
          'Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, :N12)');
        Parameters.ParamByName('N1').Value := nCurrParkNo;
        Parameters.ParamByName('N2').Value := nCurrUnitNo;
        Parameters.ParamByName('N3').Value := sProcDate;
        Parameters.ParamByName('N4').Value := sProcTime;
        Parameters.ParamByName('N5').Value := sTKNo;
        Parameters.ParamByName('N6').Value := 1;
        Parameters.ParamByName('N7').Value := 1;
        Parameters.ParamByName('N8').Value := 1;
        Parameters.ParamByName('N9').Value := 0;
        Parameters.ParamByName('N10').Value := '';
        Parameters.ParamByName('N11').Value := sInCarNo;
        Parameters.ParamByName('N12').Value := '수동입차';
        ExecSQL;
      end;
      ExceptLogging('수동입차: ' + sProcDate + ', ' + sProcTime + ', ' + sInCarNo);
      ShowMessage('수동입차처리를 완료하였습니다.');
    end;
    // InOpen;
    NGridData('1' + sInCarNo + '^' + sProcDate + ' ' + sProcTime + '^수동입차');
    pnManual.Visible := False;
  except
    on E: Exception do
      ExceptLogging('TfrmMain.btnManualOKClick: ' + E.Message);
  end
end;

procedure TfrmMainNew.btnManualOutCancelClick(Sender: TObject);
begin
  edtOutTime.Text := '';
  pnManualOut.Visible := False;
end;

procedure TfrmMainNew.btnManualOutOkClick(Sender: TObject);
var
  sCheck: TDateTime;
begin
  try
    try
      sCheck := StrToTime(edtOutTime.Text + ':00');
    except
      on E: Exception do
      begin
        ShowMessage('입차시각을 정확히 입력하여주세요!');
        edtOutTime.SetFocus;
        edtOutTime.SelectAll;
        Exit;
      end;
    end;

    if (FormatDateTime('YYYY-MM-DD', Now) = edtOutDate.Text) and (edtOutTime.Text > FormatDateTime('HH:NN', Now)) then
    begin
      ShowMessage('입차시각을 정확히 입력하여주세요!');
      edtOutTime.SetFocus;
      edtOutTime.SelectAll;
      Exit;
    end;
    nTKType := 9;
    nCarType := 1;
//    sManualTKNo := MG_InsZero(IntToStr(GetTickCount), 10);
    sManualTKNo :=  FormatDateTime('YYYYMMDDHHNNSSZZZ', Now)+ IntToStr(nCurrUnitNo);
    sNowInTKNo := sManualTKNo;
    sManualInTime := FormatDateTime('YYYY-MM-DD', edtOutDate.Date)
      + ' ' + edtOutTime.Text + ':00';
    sNowInDate := Copy(sManualInTime, 1, 10);
    sNowInTime := Copy(sManualInTime, 12, 8);
    sNowLprCarNo1 := '수동출차';
    sNowLprCarNo2 := '수동출차';
    ManualOut(sNowLprFile1, sNowLprCarNo1, sNowLprFile2, sNowLprCarNo2,
      sNowIOTime, nNowLprNo, 2, nNowLprRecog1, nNowLprRecog2);
    pnManualOut.Visible := False;
  except
    on E: Exception do
      ExceptLogging('TfrmMain.btnManualOutOkClick: ' + E.Message);
  end;
end;

procedure TfrmMainNew.btnManualOutProcClick(Sender: TObject);
var
  sCheck: TDateTime;
begin
  try
    try
      sCheck := StrToTime(edtManualOutTime.Text + ':00');
    except
      on E: Exception do
      begin
        ShowMessage('입차시각을 정확히 입력하여주세요!');
        edtManualOutTime.SetFocus;
        edtManualOutTime.SelectAll;
        Exit;
      end;
    end;

    if (FormatDateTime('YYYY-MM-DD', Now) = FormatDateTime('YYYY-MM-DD', edtManualProcDate.Date)) and
       (edtManualOutTime.Text > FormatDateTime('HH:NN', Now)) then
    begin
      ShowMessage('입차시각을 정확히 입력하여주세요!');
      edtManualOutTime.SetFocus;
      edtManualOutTime.SelectAll;
      Exit;
    end;

    nTKType := 9;
    nCarType := 1;
//    sManualTKNo := MG_InsZero(IntToStr(GetTickCount), 10);
    sManualTKNo :=  FormatDateTime('YYYYMMDDHHNNSSZZZ', Now)+ IntToStr(nCurrUnitNo);
    sNowInTKNo := sManualTKNo;
    sManualInTime := FormatDateTime('YYYY-MM-DD', edtManualProcDate.Date)
      + ' ' + edtManualOutTime.Text + ':00';
    sNowInDate := Copy(sManualInTime, 1, 10);
    sNowInTime := Copy(sManualInTime, 12, 8);
    sNowLprCarNo1 := '수동출차';
    sNowLprCarNo2 := '수동출차';
    ManualOut(sNowLprFile1, sNowLprCarNo1, sNowLprFile2, sNowLprCarNo2,
      sNowIOTime, nNowLprNo, 2, nNowLprRecog1, nNowLprRecog2);
    edtManualProcCarNo.Text:= '';
    pnManualProc.Visible := False;
  except
    on E: Exception do
      ExceptLogging('TfrmMain.btnManualOutProcClick: ' + E.Message);
  end;
end;

procedure TfrmMainNew.btnManualProcCancelClick(Sender: TObject);
begin
  btnManualSCOut.Enabled := False;
  btnManualProc.Enabled := False;
  dmTables.qryLost.Close;
  dmTables.qrySCSearch.Close;
  edtManualProcCarNo.Text:= '';
  pnManualProc.Visible := False;
  ClearFormData;
end;

procedure TfrmMainNew.btnManualProcClick(Sender: TObject);
var
  sResult: aString;
  sDspIP: aString;
  i: Byte;
begin
  for i := 1 to 10 do
  begin
    if RLpr[i].nUnitNo = nowLpr.Tag then
    begin
      sDspIP := RLpr[i].sDspIP;
      Break;
    end;
  end;

  try
    edtManualProcCarNo.Text:= '';
    pnManualProc.Visible := False;
    bMiProc := True;

    with dmTables.qryLprProc do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from CustInfo ');
      SQL.Add('where CarNo = :N1');
      Parameters.ParamByName('N1').Value := sLostInCarNo;
      Open;

      if RecordCount > 0 then
      begin
        // 등록된 정기차량이면...
        sResult := RecvLprProc(sNowLprFile1, sLostInCarNo, sNowLprFile2,
          sNowLprCarNo2, sNowIOTime, nNowLprNo, nNowLprInOut, nNowLprRecog1,
          nNowLprRecog2, sDspIP, nowLpr, True);
        imgIn.Picture := imgOut.Picture;
        GridData(sResult);
        ClearFormData;
      end
      else
      begin
        // 일반차량 처리...
        NormalProc(sNowLprFile1, sLostInCarNo, '', '', sNowIOTime, nNowLprNo,
          nNowLprInOut, nNowLprRecog1, nNowLprRecog2, sDspIP, nowLpr, True);
      end;
    end;
    btnManualSCOut.Enabled := False;
    btnManualProc.Enabled := False;
    dmTables.qryLost.Close;
    dmTables.qrySCSearch.Close;
  except
    on E: Exception do
      ExceptLogging('TfrmMain.btnManualProcClick: ' + aString(E.Message));
  end;
end;

procedure TfrmMainNew.btnManualSCOutClick(Sender: TObject);
var
  sResult, sTime, sTemp, sDspIP: aString;
  i: Byte;
begin
  try
    // 정기차량 수동출차
    for i := 1 to 10 do
    begin
      if RLpr[i].nUnitNo = nowLpr.Tag then
      begin
        sDspIP := RLpr[i].sDspIP;
        Break;
      end;
    end;
    sOutLprCarNo := sManualSCCarNo;
    sTime := FormatDateTime('YYYY-MM-DD HH:NN:SS', Now);
    sResult := RecvLprProc(sOutLprFile, sOutLprCarNo, '', '', sTime,
      nowLpr.Tag, 2, 3, 3, sDspIP, nowLpr, True);
    GridData(sResult);
    ClearFormData;
    btnManualSCOut.Enabled := False;
    btnManualProc.Enabled := False;
    dmTables.qryLost.Close;
    dmTables.qrySCSearch.Close;
    edtManualProcCarNo.Text:= '';
    pnManualProc.Visible := False;
  except
    on E: Exception do
      ExceptLogging('TfrmMainNew.btnSCOutClick: ' + aString(E.Message));
  end;
end;

procedure TfrmMainNew.btnManualSeekClick(Sender: TObject);
var
  sIn, sResult, sTime, sTemp: aString;
  sDspIP: aString;
  i: Byte;
begin
  for i := 1 to 10 do
  begin
    if RLpr[i].nUnitNo = nowLpr.Tag then
    begin
      sDspIP := RLpr[i].sDspIP;
      Break;
    end;
  end;

  try
    if edtManualProcCarNo.Text = '' then
    begin
      ShowMessage('차량번호를 입력하여주세요!');
      edtManualProcCarNo.SetFocus;
      Exit;
    end;

    // 일반차량을 조회일자부터 오늘날짜까지 조회토록 한다...
    with dmTables.qryLost do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from IONData where OutChk = :N1 and TKType = :N2 and Status = :N3 and ');
      SQL.Add('((ProcDate >= :N4) and (ProcDate <= :N5)) and ');
      SQL.Add('((InCarNo1 like ' + MG_MakeStr('%' + Trim(edtManualProcCarNo.Text) + '%') + ') or ');
      SQL.Add('(InCarNo2 like ' + MG_MakeStr('%' + Trim(edtManualProcCarNo.Text) + '%') + ')) ');
      SQL.Add('Order By ProcDate Desc, ProcTime Desc');
      Parameters.ParamByName('N1').Value := 0;
      Parameters.ParamByName('N2').Value := 1;
      Parameters.ParamByName('N3').Value := 1;

      if nSeekDay > 0 then
        Parameters.ParamByName('N4').Value := MG_AddDate(FormatDateTime('YYYY-MM-DD', Now), nSeekDay*-1)
      else
        Parameters.ParamByName('N4').Value := '2012-01-01';
      Parameters.ParamByName('N5').Value := FormatDateTime('YYYY-MM-DD', Now);
      Open;

      if RecordCount > 0 then
      begin
        First;
        btnManualProc.Enabled := True;
        dgNManualProc.SetFocus;
        dgNManualProcClick(Self);
      end;
    end;

    with dmTables.qrySCSearch do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from CustInfo where CarNo like ' + MG_MakeStr('%' + Trim(edtManualProcCarNo.Text) + '%'));
      Open;

      if RecordCount > 0 then
      begin
        First;
        btnManualSCOut.Enabled := True;
        sManualSCCarNo := dmTables.qrySCSearch.FieldByName('CarNo').AsString;
      end
      else
      begin
        sManualSCCarNo := '';
        btnManualSCOut.Enabled := False;
      end;
    end;
  except
    on E: Exception do
      ExceptLogging('TfrmMainNew.btnManualSeekClick: ' + E.Message);
  end;
end;

procedure TfrmMainNew.btnMCancelClick(Sender: TObject);
begin
  edtMCarNo.Text := '';
  pnModify.Visible := False;
  imgModify.Picture.Assign(Nil);
  nGridCheck := 0;
end;

procedure TfrmMainNew.btnMinimizeClick(Sender: TObject);
begin
  frmMainNew.WindowState := wsMinimized;
end;

procedure TfrmMainNew.btnMOKClick(Sender: TObject);
var
  sCardNo, sName, sCompName, sDeptName, sGroupName, sCarType, sCarNo, sExpDateT: aString;
  nGroupNo, i: Integer;
  bAlarm, bSC: Boolean;
begin
  try
    bSC:= False;
    bAlarm:= False;

    with dmTables.qryModify do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from CustInfo where CarNo = :N1 and ');
      SQL.Add('ExpDateF <= :N2 and ExpDateT >= :N3 and TKType = :N4');
      Parameters.ParamByName('N1').Value := MG_StrTrim(edtMCarNo.Text, ' ');
      Parameters.ParamByName('N2').Value := FormatDateTime('YYYY-MM-DD', Now);
      Parameters.ParamByName('N3').Value := FormatDateTime('YYYY-MM-DD', Now);
      Parameters.ParamByName('N4').Value := 2;
      Open;

      if RecordCount > 0 then
      begin
        // 정기차량 처리
        bSC:= True;
        sCardNo := FieldByName('TKNo').AsString;
        nGroupNo := FieldByName('GroupNo').AsInteger;
        sName := FieldByName('Name').AsString;
        sCompName := FieldByName('CompName').AsString;
        sDeptName := FieldByName('DeptName').AsString;
        sCarType:= FieldByName('Reserve1').AsString;
        sCarNo:= FieldByName('CarNo').AsString;
        sExpDateT:= FieldByName('ExpDateT').AsString;

        Close;
        SQL.Clear;
        SQL.Add('Select * from GGroup where ParkNo = :N1 and GroupNo = :N2 and Reserve1 is null');
        Parameters.ParamByName('N1').Value := nCurrParkNo;
        Parameters.ParamByName('N2').Value := nGroupNo;
        Open;

        if RecordCount > 0 then
        begin
          sGroupName := FieldByName('GroupName').AsString;

          if FieldByName('HIType').AsInteger = 1 then
            bAlarm:= True;

          if bAlarm then
            AlarmProc(sName, sCompName, sCarNo, sCarType);
        end;

        Close;
        SQL.Clear;
        SQL.Add('Update CustInfo Set LastParkNo = :N1, LastUnitNo = :N2, ');
        SQL.Add('LastUseDate = :N3, LastUseTime = :N4, IOStatusNo = :N5 ');
        SQL.Add('where ParkNo = :N6 and TKType = :N7 and TKNo = :N8');
        Parameters.ParamByName('N1').Value := nCurrParkNo;
        Parameters.ParamByName('N2').Value := nOrgUnitNo;
        Parameters.ParamByName('N3').Value := sOrgDate;
        Parameters.ParamByName('N4').Value := sOrgTime;
        Parameters.ParamByName('N5').Value := 1;
        Parameters.ParamByName('N6').Value := nCurrParkNo;
        Parameters.ParamByName('N7').Value := 2;
        Parameters.ParamByName('N8').Value := sCardNo;
        ExecSQL;

        Close;
        SQL.Clear;
        SQL.Add
          ('Select * from IOSData where ParkNo = :N1 and UnitNo = :N2 and ');
        SQL.Add('ProcDate = :N3 and ProcTime = :N4 and TKNo = :N5');
        Parameters.ParamByName('N1').Value := nCurrParkNo;
        Parameters.ParamByName('N2').Value := nOrgUnitNo;
        Parameters.ParamByName('N3').Value := sOrgDate;
        Parameters.ParamByName('N4').Value := sOrgTime;
        Parameters.ParamByName('N5').Value := sCardNo;
        Open;

        if RecordCount <= 0 then
        begin
          Close;
          SQL.Clear;
          SQL.Add(
            'Insert Into IOSData (ParkNo, UnitNo, ProcDate, ProcTime, TKNo, TKType, ');
          SQL.Add(
            'CarType, GroupNo, GroupName, CompName, DeptName, Name, InCarNo1, InIOStatusNo, ');
          SQL.Add('InImage1, InRecog1, Reserve1, Reserve2) ');
          SQL.Add(
            'Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, :N12, :N13, :N14, :N15, :N16, :N17, :N18)');
          Parameters.ParamByName('N1').Value := nCurrParkNo;
          Parameters.ParamByName('N2').Value := nOrgUnitNo;
          Parameters.ParamByName('N3').Value := sOrgDate;
          Parameters.ParamByName('N4').Value := sOrgTime;
          Parameters.ParamByName('N5').Value := sCardNo;
          Parameters.ParamByName('N6').Value := 2;
          Parameters.ParamByName('N7').Value := 2;
          Parameters.ParamByName('N8').Value := nGroupNo;
          Parameters.ParamByName('N9').Value := sGroupName;
          Parameters.ParamByName('N10').Value := sCompName;
          Parameters.ParamByName('N11').Value := sDeptName;
          Parameters.ParamByName('N12').Value := sName;
          Parameters.ParamByName('N13').Value := MG_StrTrim
            (edtMCarNo.Text, ' ');
          Parameters.ParamByName('N14').Value := 1;
          Parameters.ParamByName('N15').Value := sOrgFile;
          Parameters.ParamByName('N16').Value := 4;
          Parameters.ParamByName('N17').Value := FormatDateTime
            ('YYYY-MM-DD HH:NN:SS', Now);
          Parameters.ParamByName('N18').Value := IntToStr(nCurrMNo);
          ExecSQL;
        end;

        Close;
        SQL.Clear;
        SQL.Add(
          'Delete from IONData where ParkNo = :N1 and ProcDate = :N2 and ProcTime = :N3 and ');
        SQL.Add('((InCarNo1 = :N4) or (InCarNo2 = :N5))');
        Parameters.ParamByName('N1').Value := nCurrParkNo;
        Parameters.ParamByName('N2').Value := sOrgDate;
        Parameters.ParamByName('N3').Value := sOrgTime;
        Parameters.ParamByName('N4').Value := sOrgCarNo;
        Parameters.ParamByName('N5').Value := sOrgCarNo;
        //Parameters.ParamByName('N4').Value := MG_StrTrim(edtMCarNo.Text, ' ');
        //Parameters.ParamByName('N5').Value := MG_StrTrim(edtMCarNo.Text, ' ');
        ExecSQL;
      end
      else
      begin
        // 일반차량 처리
        Close;
        SQL.Clear;
        SQL.Add(
          'Update IONData Set InCarNo1 = :N1, Reserve5 = :N7, Reserve4 = :N8, Reserve3 = :N9, InRecog1 = 1 ');
        SQL.Add(
          'Where ParkNo = :N2 and ProcDate = :N3 and ProcTime = :N4 and InCarNo1 = :N5');
        Parameters.ParamByName('N1').Value := MG_StrTrim(edtMCarNo.Text, ' ');
        Parameters.ParamByName('N2').Value := nCurrParkNo;
        Parameters.ParamByName('N3').Value := sOrgDate;
        Parameters.ParamByName('N4').Value := sOrgTime;
        Parameters.ParamByName('N5').Value := sOrgCarNo;
        Parameters.ParamByName('N7').Value := '차량번호수정';
        Parameters.ParamByName('N8').Value := FormatDateTime
          ('YYYY-MM-DD HH:NN:SS', Now);
        Parameters.ParamByName('N9').Value := IntToStr(nCurrMNo);
        ExecSQL;

        Close;
        SQL.Clear;
        SQL.Add(
          'Update IONData Set InCarNo2 = :N1, Reserve5 = :N7, Reserve4 = :N8, Reserve3 = :N9, InRecog2 = 1 ');
        SQL.Add(
          'Where ParkNo = :N2 and ProcDate = :N3 and ProcTime = :N4 and InCarNo2 = :N5');
        Parameters.ParamByName('N1').Value := MG_StrTrim(edtMCarNo.Text, ' ');
        Parameters.ParamByName('N2').Value := nCurrParkNo;
        Parameters.ParamByName('N3').Value := sOrgDate;
        Parameters.ParamByName('N4').Value := sOrgTime;
        Parameters.ParamByName('N5').Value := sOrgCarNo;
        Parameters.ParamByName('N7').Value := '차량번호수정';
        Parameters.ParamByName('N8').Value := FormatDateTime
          ('YYYY-MM-DD HH:NN:SS', Now);
        Parameters.ParamByName('N9').Value := IntToStr(nCurrMNo);
        ExecSQL;
      end;

      if nGridCheck = 1 then
      begin
        for i := 2 to sgIn.RowCount do
        begin
          if (MG_StrTrim(sgIn.Cells[3, i - 1], ' ') = sOrgCarNo) and
            (sgIn.Cells[1, i - 1] = sOrgDate) and
            (sgIn.Cells[2, i - 1] = sOrgTime) then
          begin
            sgIn.Cells[3, i - 1] := MG_StrTrim(edtMCarNo.Text, ' ');
            sgIn.RowColor[i - 1] := clWhite;

            if bSC then
            begin
              sgIn.Cells[0, i -1]:= '정기차량';
              sgIn.Cells[4, i -1]:= sCompName;
              sgIn.Cells[5, i -1]:= sName;
              sgIn.Cells[6, i -1]:= sExpDateT;
            end;
          end;
        end;
      end
      else if nGridCheck = 2 then
      begin
        sgOut.RemoveRows(nModRow, 1);
      end;

      edtMCarNo.Text := '';
      imgModify.Picture.Assign(Nil);
      pnModify.Visible := False;
      nGridCheck := 0;
      sOrgCarNo := '';
      sOrgDate := '';
      sOrgTime := '';
      sOrgFile := '';
      nOrgUnitNo := 0;

      // 메시지 없애달라는 요청... 2012-06-30  황이성 주임
      // ShowMessage('차량번호 수정을 완료하였습니다.');
    end;
  except
    on E: Exception do
      ExceptLogging('TfrmMain.btnMOKClick: ' + E.Message);
  end;
end;

procedure TfrmMainNew.btnopClick(Sender: TObject);
var
  sMode : astring;
begin
  if btnOp.Tag = 0 then
  begin
    sApsSendData:= STX + 'START' + ETX;
  end
  else
  begin
    sApsSendData:= STX + 'END' + ETX;
  end;

  if csAps.Active then
    csAps.Active:= False;

  if is_Ping(sOutApsIP) then
  begin
    csAps.Active:= True;
  end
  else
    ExceptLogging('무인요금계산기 Ping 안됨');
end;

procedure TfrmMainNew.btnProcClick(Sender: TObject);
begin
  if bCredit then
  begin
    if nProcYogum > 0 then
      NextModalDialog(TfrmPaySelect.Create(Self))
    else
      nPayType := 1;
  end;

  if nPayType > 0 then
    MoneyProc(nowLpr)
  else
    btnProc.SetFocus;
end;

procedure TfrmMainNew.btnReceiptClick(Sender: TObject);
var
  i: Byte;
begin
  if ComPrn.Open and (sPrtData <> '') then
    ComPrn.PutString(sPrtData);

  if not bReceiptReprint then
  begin
    sPrtData := '';
    btnReceipt.Enabled := False;
  end;
end;

procedure TfrmMainNew.btnSeekClick(Sender: TObject);
var
  sIn, sResult, sTime, sTemp: aString;
  sDspIP: aString;
  i: Byte;
begin
  for i := 1 to 10 do
  begin
    if RLpr[i].nUnitNo = nowLpr.Tag then
    begin
      sDspIP := RLpr[i].sDspIP;
      Break;
    end;
  end;

  try
    if edtLostCarNo.Text = '' then
    begin
      ShowMessage('차량번호를 입력하여주세요!');
      edtLostCarNo.SetFocus;
      Exit;
    end;

    with dmTables.qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from CustInfo where CarNo = :N1');
      Parameters.ParamByName('N1').Value := edtLostCarNo.Text;
      Open;

      if RecordCount > 0 then
      begin
        // 정기차량 처리
        sOutLprCarNo := edtLostCarNo.Text;
        sTime := FormatDateTime('YYYY-MM-DD HH:NN:SS', Now);
        sResult := RecvLprProc(sOutLprFile, sOutLprCarNo, '', '', sTime,
          nowLpr.Tag, 2, 3, 3, sDspIP, nowLpr, True);
        GridData(sResult);
        ClearFormData;
        pnLost.Visible := False;
      end
      else
      begin
        // 조회일자부터 오늘날짜까지 조회토록 한다...
        with dmTables.qryLost do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Select * from IONData where OutChk = :N1 and TKType = :N2 and Status = :N3 and ');
          SQL.Add('((ProcDate >= :N4) and (ProcDate <= :N5)) and ');
          SQL.Add('((InCarNo1 like ' + MG_MakeStr('%' + Trim(edtLostCarNo.Text) + '%') + ') or ');
          SQL.Add('(InCarNo2 like ' + MG_MakeStr('%' + Trim(edtLostCarNo.Text) + '%') + ')) ');
          SQL.Add('Order By ProcDate Desc, ProcTime Desc');
          Parameters.ParamByName('N1').Value := 0;
          Parameters.ParamByName('N2').Value := 1;
          Parameters.ParamByName('N3').Value := 1;

          if nSeekDay > 0 then
            Parameters.ParamByName('N4').Value := MG_AddDate(FormatDateTime('YYYY-MM-DD', Now), nSeekDay*-1)
          else
            Parameters.ParamByName('N4').Value := '2012-01-01';

          Parameters.ParamByName('N5').Value := FormatDateTime('YYYY-MM-DD', Now);
          Open;

          if RecordCount > 0 then
          begin
            First;
            btnLostProc.Enabled := True;
            dgLost.SetFocus;
            dgLostClick(Self);
          end;
        end;
      end;
    end;
  except
    on E: Exception do
      ExceptLogging('TfrmMainNew.btnSeekClick: ' + E.Message);
  end;
end;

procedure TfrmMainNew.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if not bDirectClose then
  begin
    if MessageDlg('요금계산기 프로그램을 종료할까요?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      ExceptLogging('Program Close');
      CanClose := True;
    end
    else
      CanClose := False;
  end
  else
  begin
    ExceptLogging('Program Close');
    CanClose := True;
  end;
end;

procedure TfrmMainNew.FormCreate(Sender: TObject);
begin
  try
    CreateFileMapping($FFFFFFFF, nil, PAGE_READWRITE, 0, 1, 'Parking_FC');

    if GetLastError = ERROR_ALREADY_EXISTS then
    begin
      ShowMessage('요금계산기프로그램이 이미 실행중입니다.'#13#13#10 + '확인하여주세요!');
      halt;
    end;
    sCurrRunDir := aString(ExtractFileDir(Application.ExeName));

    if not DirectoryExists('Log') then
      MkDir('Log');
    if not DirectoryExists('Check') then
      MkDir('Check');
    if not DirectoryExists('Temp') then
      MkDir('Temp');
    if not DirectoryExists('Closing') then
      MkDir('Closing');
  except
    on E: Exception do
      ExceptLogging('TfrmMain.FormCreate: ' + aString(E.Message));
  end;
end;

procedure TfrmMainNew.FormKeyPress(Sender: TObject; var Key: Char);
var
  sCheck: String;
begin
  if (Key = #13) and btnProc.Enabled then
    btnProcClick(Self);

  if (Key = #27) then
  begin
    if pnSCSearch.Visible then
      btnSCCancelClick(Self)
    else if pnBar.Visible then
      btnBarCloseClick(Self)
    else if pnLost.Visible then
      btnLostCancelClick(Self)
    else if pnManual.Visible then
      btnManualCancelClick(Self)
    else if pnManualOut.Visible then
      btnManualOutCancelClick(Self)
    else
    begin
      if btnCancel.Enabled then
        btnCancelClick(Self);
    end;
    frmMainNew.SetFocus;
  end;
end;

procedure TfrmMainNew.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = 80) and mnuReceipt.Enabled then
    btnReceiptClick(Self);
end;

procedure TfrmMainNew.FormShow(Sender: TObject);
var
  sDBString: aString;
  i, j: Integer;
  sTemp1, sTemp2: String;
  SystemTime: TSystemTime;
  sDateTime, sYear, sMonth, sDay, sHour, sMin, sSec, sError: String;
begin
  try
    ExceptLogging('Program Start!');
    FormAlign;
    GridClear;
    WaitClear;
    ClearFormData;
    InitProc;

    lbInTime.Caption := '';
    lbOutTime.Caption := '';
    lbParkingTime.Caption := '';
    lbDCName.Caption := '';
    lbOutCarNo.Caption := '';
    lbInCarNo.Caption := '';
    lbCarNo.Caption := '';

    iSetup := TIniFile.Create(ExtractFileDir(Application.ExeName) + '\ParkSet.ini');
    sDBIP  := iSetup.ReadString('PARKING', 'DB IP', '');
    sDBID  := iSetup.ReadString('PARKING', 'DB ID', '');
    sDBPW  := iSetup.ReadString('PARKING', 'DB PW', '');
    sDBName:= iSetup.ReadString('PARKING', 'DB Name', '');
    nCurrUnitNo := iSetup.ReadInteger('PARKING', 'UnitNo', 0);
    sImageDir := iSetup.ReadString('PARKING', 'LPRImage', 'C:\LPRImage');
    sLogoFile := iSetup.ReadString('PARKING', 'Logo File', '');
    sHostIP := MG_StrTrim(iSetup.ReadString('PARKING', 'Host IP', ''), ' ');
    nHostPort := iSetup.ReadInteger('PARKING', 'Host Port', 0);

    sHostIP1 := MG_StrTrim(iSetup.ReadString('PARKING', 'Host1 IP', ''), ' ');
    nHostPort1 := iSetup.ReadInteger('PARKING', 'Host1 Port', 0);


    //2018.01.09 AK프라자 로직 추가 시작//
    sJumCode := iSetup.ReadString('PARKING', '점코드', '91');
    iAKPos := iSetup.ReadInteger('PARKING', 'AKPos', 0);
    sAKPosIP := iSetup.ReadString('PARKING', 'AKPos IP', '');
    nAKPosPORT := iSetup.ReadInteger('PARKING', 'AKPos PORT', 5000);
    bFCMode := IntToBool(iSetup.ReadInteger('PARKING', '유인운영', 1));
    //2018.01.09 AK프라자 로직 추가 종료//

    if not DirectoryExists(sImageDir) then
    begin
      if not ForceDirectories(sImageDir) then
        ExceptLogging('이미지저장폴더 생성실패: ' + sImageDir);
    end;

    if sDBIP = '' then
      sDBIP := aString(InputBox('DB설정 입력', 'DB IP 또는 DB서버명을 입력하여주세요', ''));

    if sDBID = '' then
      sDBID := aString(InputBox('DB ID 입력', 'DB 접속용 ID를 입력하여주세요', ''));

    if sDBPW = '' then
      sDBPW := aString(InputBox('DB Password 입력', 'DB 접속용 Password를 입력하여주세요', ''));

    if sDBName = '' then
      sDBName := aString(InputBox('DB Name 입력', 'DB명을  입력하여주세요', ''));

    if (sDBIP <> '') and (sDBID <> '') and (sDBPW <> '') and (sDBName <> '') then
    begin
      try
        // DB연결...
        dmTables.ADODB.Connected := False;
        sDBString := 'Provider=SQLOLEDB.1;Persist Security Info=True;';
        sDBString := sDBString + 'User ID=' + sDBID;
        sDBString := sDBString + ';Password=' + sDBPW;
        sDBString := sDBString + ';Initial Catalog=' + sDBName;
        sDBString := sDBString + ';Data Source=' + sDBIP;
        dmTables.ADODB.ConnectionString := wString(sDBString);
        dmTables.ADODB.Connected := True;
      except
        on E: Exception do
        begin
          ExceptLogging('DB Connect Error:' + aString(E.Message));
          ShowMessage('데이터베이스 연결에 실패하였습니다. 확인하여주세요.');
          Exit;
        end;
      end;
      iSetup.WriteString('PARKING', 'DB IP', sDBIP);
      iSetup.WriteString('PARKING', 'DB ID', sDBID);
      iSetup.WriteString('PARKING', 'DB PW', sDBPW);
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
      ShowMessage('DB명을 입력하여주세요.'#13#10 +
          'DB 연결이 안되면 프로그램을 정상적으로 실행할 수 없습니다.');
      Exit;
    end;
    bAutoCalc := IntToBool(iSetup.ReadInteger('PARKING', '자동요금계산', 1));
    bZeroOpen := IntToBool(iSetup.ReadInteger('PARKING', '0원자동오픈', 1));
    bClosingText := IntToBool(iSetup.ReadInteger('PARKING', '마감내용파일저장', 0));
    bClosingReprint := IntToBool(iSetup.ReadInteger('PARKING', '마감재출력', 0));
    bReceiptReprint := IntToBool(iSetup.ReadInteger('PARKING', '영수증재출력', 0));
    bCarSearch := IntToBool(iSetup.ReadInteger('PARKING', '차량검색', 1));
    bManualIn := IntToBool(iSetup.ReadInteger('PARKING', '수동입차', 0));
    nFCProcType := iSetup.ReadInteger('PARKING', '정산방식', 0);
    bCancel := IntToBool(iSetup.ReadInteger('PARKING', '정산취소', 1));
    bCancelReason := IntToBool(iSetup.ReadInteger('PARKING', '정산취소사유입력', 0));
    bCancelCheck := IntToBool(iSetup.ReadInteger('PARKING', '정산취소확인', 0));
    bCancelSave := IntToBool(iSetup.ReadInteger('PARKING', '정산취소로그저장', 0));
    bManualOpen := IntToBool(iSetup.ReadInteger('PARKING', '수동개방사유입력', 0));
    bCredit := IntToBool(iSetup.ReadInteger('PARKING', '신용카드결재', 0));
    bCashReceipt := IntToBool(iSetup.ReadInteger('PARKING', '현금영수증발행', 0));
    bBarcodeDC := IntToBool(iSetup.ReadInteger('PARKING', '바코드할인권사용', 0));
    bInterimClosing := IntToBool(iSetup.ReadInteger('PARKING', '중간마감', 0));
    bInterimPrint := IntToBool(iSetup.ReadInteger('PARKING', '중간마감출력', 0));

    if not bCredit then
    begin
      Label8.Top := 413;
      lbMCnt.Top := 413;
      lbMTot.Top := 413;
      Label9.Top := 464;
      lbMCreditCnt.Top := 464;
      lbMCreditTot.Top := 464;
      Label9.Visible := False;
      lbMCreditCnt.Visible := False;
      lbMCreditTot.Visible := False;
    end
    else
    begin
      Label8.Caption:= '현    금:'
    end;

    with qryMainTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select convert(varchar(30), getdate(), 120) tnow');
      Open;

      sDateTime := FieldByName('tNow').AsString;
      sYear := Copy(sDateTime, 1, 4);
      sMonth := Copy(sDateTime, 6, 2);
      sDay := Copy(sDateTime, 9, 2);
      sHour := Copy(sDateTime, 12, 2);
      sMin := Copy(sDateTime, 15, 2);
      sSec := Copy(sDateTime, 18, 2);

      with SystemTime do
      begin
        wYear := StrToInt(sYear);
        wMonth := StrToInt(sMonth);
        wDay := StrToInt(sDay);
        wDayOfWeek := DayOfWeek(Now) - 1;
        wHour := StrToInt(sHour);
        wMinute := StrToInt(sMin);
        wSecond := StrToInt(sSec);
        wMilliseconds := 0;
      end;
      SetLocalTime(SystemTime);

      nChkTime := GetTickCount + 3600000;

      Close;
      SQL.Clear;
      SQL.Add('Select * from ParkInfo Order By ParkNo');
      Open;

      if RecordCount > 0 then
      begin
        nCurrParkNo := FieldByName('ParkNo').AsInteger;
        nItemMax0 := FieldByName('DayMax').AsInteger;
        nTotMax0 := FieldByName('TotMax').AsInteger;
        nDCCntMax := FieldByName('DCCntMax').AsInteger;
        bZeroReceipt := IntToBool(FieldByName('ReceiptZero').AsInteger);
        bAutoReceipt := IntToBool(FieldByName('ReceiptAuto').AsInteger);
        nJulsaType := FieldByName('JunkType').AsInteger;
        nRoundType := FieldByName('RoundType').AsInteger;
        bTax := not IntToBool(FieldByName('TaxType').AsInteger);
        nTimeDCType := FieldByName('TimeDCType').AsInteger;
        bDCReason := IntToBool(FieldByName('DCReason').AsInteger);
        nLossTicket := FieldByName('LostCalc').AsInteger;
        nLossTicketAmt := FieldByName('LostAmount').AsInteger;
        nSCRemain:= FieldByName('RemainDsp').AsInteger;
        nClosingType:= FieldByName('ClosingType').AsInteger;
        nSeekDay:= FieldByName('SeekDay').AsInteger;

        if FieldByName('Reserve1').AsString <> '정상운영' then
          bOperation := False;

        if FieldByName('Reserve2').AsString = '테스트' then
          bTest := True;

        if FieldByName('Reserve5').AsString = '1' then
        begin
          bFreeTime := True;
          sFreeTimeS := FieldByName('Reserve3').AsString;
          sFreeTimeE := FieldByName('Reserve4').AsString;

          if sFreeTimeS > sFreeTimeE then
            bFreeTimeChk := True;
        end;
      end
      else
        ExceptLogging('설치된 주차장이 없음!');
    end;
    nLoginResult := 0;
    NextModalDialog(TfrmLogin.Create(Self));

    if nLoginResult = 0 then
    begin
      ShowMessage('로그인에 실패하여 프로그램을 종료합니다.');
      bDirectClose:= True;
      Close;
      Exit;
    end
    else
    begin
      DBConnect(PAnsiChar(sDBIP));
      ExceptLogging('근무시작: ' + sCurrMName);
      edtMName.Text := ' 근무자 - ' + sCurrMName;
    end;

    if (sLogoFile <> '') and FileExists(sLogoFile) then
      imgLogo.Picture.LoadFromFile(sLogoFile);

    if nManagerAuthority > 1 then
      btnSetup.Enabled := False;

    if not bCarSearch then
      btnCarSearch.Enabled := False;

    if not bManualIn then
      btnManualIn.Enabled := False;

    sGeunmuStart := iSetup.ReadString('PARKING', IntToStr(nCurrMNo) + '_근무시작',
      '');
    sGeunmuMagam := iSetup.ReadString('PARKING', IntToStr(nCurrMNo) + '_마감',
      '');

    if sGeunmuStart = '' then
    begin
      sGeunmuStart := FormatDateTime('YYYY-MM-DD HH:NN:SS', Now);
      iSetup.WriteString('PARKING', IntToStr(nCurrMNo) + '_근무시작', sGeunmuStart);
    end
    else
    begin
      if sGeunmuStart < sGeunmuMagam then
      begin
        sGeunmuStart := FormatDateTime('YYYY-MM-DD HH:NN:SS', Now);
        iSetup.WriteString('PARKING', IntToStr(nCurrMNo) + '_근무시작',
          sGeunmuStart);
      end;
    end;

    with qryMainTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add(
        'Select Sum(RealFee), Count(*) from TKProc where ProcDate = :N1 and ');
      SQL.Add('MNo = :N2 and ChkClosing = :N3 and PayType = :N4');
      Parameters.ParamByName('N1').Value := FormatDateTime('YYYY-MM-DD', Now);
      Parameters.ParamByName('N2').Value := nCurrMNo;
      Parameters.ParamByName('N3').Value := 0;
      Parameters.ParamByName('N4').Value := 1;
      Open;

      if RecordCount > 0 then
      begin
        nMTot := FieldByName('COLUMN1').AsInteger;
        nMCnt := FieldByName('COLUMN2').AsInteger;
        lbMTot.Caption := FormatFloat('#,##0', nMTot) + ' 원';
        lbMCnt.Caption := FormatFloat('#,##0', nMCnt) + ' 건';
      end
      else
      begin
        lbMTot.Caption := '0 원';
        lbMCnt.Caption := '0 건';
      end;

      Close;
      SQL.Clear;
      SQL.Add(
        'Select Sum(RealFee), Count(*) from TKProc where ProcDate = :N1 and ');
      SQL.Add('MNo = :N2 and ChkClosing = :N3 and PayType = :N4');
      Parameters.ParamByName('N1').Value := FormatDateTime('YYYY-MM-DD', Now);
      Parameters.ParamByName('N2').Value := nCurrMNo;
      Parameters.ParamByName('N3').Value := 0;
      Parameters.ParamByName('N4').Value := 2;
      Open;

      if RecordCount > 0 then
      begin
        nMCreditTot := FieldByName('COLUMN1').AsInteger;
        nMCreditCnt := FieldByName('COLUMN2').AsInteger;
        lbMCreditTot.Caption := FormatFloat('#,##0', nMCreditTot) + ' 원';
        lbMCreditCnt.Caption := FormatFloat('#,##0', nMCreditCnt) + ' 건';
      end
      else
      begin
        lbMCreditTot.Caption := '0 원';
        lbMCreditCnt.Caption := '0 건';
      end;

      //2018.01.19 AK프라자 로직 추가 시작//
      Close;
      SQL.Clear;
      SQL.Add('Select ParkNo, UnitNo, UnitKind, ComPort, Baudrate, IPNo, PortNo ');
      SQL.Add('From UnitInfo Where UnitKind = :N1 and MyNo = :N2 and ParkNo = :N3 Order By ParkNo, UnitNo');
      Parameters.ParamByName('N1').Value := 13; // 출구무인...
      Parameters.ParamByName('N2').Value := nCurrUnitNo;
      Parameters.ParamByName('N3').Value := nCurrParkNo;
      Open;

      if RecordCount > 0 then
      begin
        sOutApsIp  := MG_StrTrim(FieldByName('IPNo').AsString, ' ');
        nOutApsPort:= FieldByName('PortNo').AsInteger;
        csAps.Host := sOutApsIP;
        csAps.Port := nOutApsPort;
        ExceptLogging('출구무인정산기: IP-' + sOutApsIp + ', Port-' + IntToStr(nOutApsPort));
      end
      else
        ExceptLogging('설치된 출구무인정산기 없음!');

      Close;
      SQL.Clear;
      SQL.Add('Select ParkNo, UnitNo, UnitKind, ComPort, Baudrate ');
      SQL.Add('From UnitInfo Where UnitKind = :N1 and MyNo = :N2 and ParkNo = :N3 Order By ParkNo, UnitNo');
      Parameters.ParamByName('N1').Value := 17; // 바코드스캐너
      Parameters.ParamByName('N2').Value := nCurrUnitNo;
      Parameters.ParamByName('N3').Value := nCurrParkNo;
      Open;

      if RecordCount > 0 then
      begin
        try
          comScanner.Open := False;
          comScanner.ComNumber := FieldByName('ComPort').AsInteger;
          comScanner.Baud := FieldByName('BaudRate').AsInteger;
          comScanner.Open := True;
        except
          on E: Exception do
            ExceptLogging('바코드스캐너 포트오픈 에러: ' + aString(E.Message));
        end;
      end
      else
        ExceptLogging('바코드스캐너가 없음!');
      //2018.01.19 AK프라자 로직 추가 종료//

      Close;
      SQL.Clear;
      SQL.Add('Select ParkNo, UnitNo, UnitKind, ComPort, Baudrate ');
      SQL.Add(
        'From UnitInfo Where UnitKind = :N1 and MyNo = :N2 and ParkNo = :N3 Order By ParkNo, UnitNo');
      Parameters.ParamByName('N1').Value := 6; // 영수증프린터
      Parameters.ParamByName('N2').Value := nCurrUnitNo;
      Parameters.ParamByName('N3').Value := nCurrParkNo;
      Open;

      if RecordCount > 0 then
      begin
        try
          ComPrn.Open := False;
          ComPrn.ComNumber := FieldByName('ComPort').AsInteger;
          ComPrn.Baud := FieldByName('BaudRate').AsInteger;
          ComPrn.Open := True;
        except
          on E: Exception do
            ExceptLogging('영수증프린터 포트오픈 에러: ' + aString(E.Message));
        end;
      end
      else
        ExceptLogging('설치된 영수증프린터가 없음!');

      for i := 1 to 10 do
      begin
        RLpr[i].nUnitNo := 0;
        RLpr[i].nIO := 0;
      end;
      j := 1;

      sError := '';

      Close;
      SQL.Clear;
      SQL.Add('Select * ');
      SQL.Add(
        'From UnitInfo Where UnitKind = :N1  and MyNo = :N2 and ParkNo = :N3 Order By ParkNo, UnitNo');
      Parameters.ParamByName('N1').Value := 8; // 입구LPR
      Parameters.ParamByName('N2').Value := nCurrUnitNo;
      Parameters.ParamByName('N3').Value := nCurrParkNo;
      Open;

      if RecordCount > 0 then
      begin
        i := 1;

        while not Eof do
        begin
          with frmMainNew do
          begin
            TClientSocket(FindComponent('csInLpr' + IntToStr(i))).Host := wString(MG_StrTrim(aString(FieldByName('IPNo').AsString), ' '));
            TClientSocket(FindComponent('csInLpr' + IntToStr(i))).Port := FieldByName('PortNo').AsInteger;
            TClientSocket(FindComponent('csInLpr' + IntToStr(i))).Tag := FieldByName('UnitNo').AsInteger;

            TTimer(FindComponent('tInAlive' + IntToStr(i))).Enabled := True;

            if is_ping(TClientSocket(FindComponent('csInLpr' + IntToStr(i))).Host) then
            begin
              try
                TClientSocket(FindComponent('csInLpr' + IntToStr(i))).Active := True;
              except
                on E: Exception do sError := sError + FieldByName('UnitName').AsString + ' 네트워크 오류입니다. 확인하여주세요!' + #13#10;
              end;
            end
            else
              sError := sError + FieldByName('UnitName').AsString + ' 네트워크 오류입니다. 확인하여주세요!' + #13#10;

            RLpr[j].nUnitNo := FieldByName('UnitNo').AsInteger;
            RLpr[j].sDspIP := FieldByName('Reserve1').AsString;
            RLpr[j].nIO := 1;
          end;
          i := i + 1;
          j := j + 1;

          if i > 5 then
            Break;
          Next;
        end;
        bLPR := True;
      end
      else
        ExceptLogging('설치된 입구 LPR이 없음!');

      Close;
      SQL.Clear;
      SQL.Add('Select * ');
      SQL.Add(
        'From UnitInfo Where UnitKind = :N1 and MyNo = :N2 and ParkNo = :N3 Order By ParkNo, UnitNo');
      Parameters.ParamByName('N1').Value := 9; // 출구LPR
      Parameters.ParamByName('N2').Value := nCurrUnitNo;
      Parameters.ParamByName('N3').Value := nCurrParkNo;
      Open;

      if RecordCount > 0 then
      begin
        i := 1;
        nowLpr := csOutLpr1;

        while not Eof do
        begin
          with frmMainNew do
          begin
            TClientSocket(FindComponent('csOutLpr' + IntToStr(i))).Host := wString(MG_StrTrim(aString(FieldByName('IPNo').AsString), ' '));
            TClientSocket(FindComponent('csOutLpr' + IntToStr(i))).Port := FieldByName('PortNo').AsInteger;
            TClientSocket(FindComponent('csOutLpr' + IntToStr(i))).Tag := FieldByName('UnitNo').AsInteger;

            TTimer(FindComponent('tOutAlive' + IntToStr(i))).Enabled := True;

            if is_ping(TClientSocket(FindComponent('csOutLpr' + IntToStr(i))).Host) then
            begin
              try
                TClientSocket(FindComponent('csOutLpr' + IntToStr(i))).Active := True;
              except
                on E: Exception do sError := sError + FieldByName('UnitName').AsString + ' 네트워크 오류입니다. 확인하여주세요!' + #13#10;
              end;
            end
            else
              sError := sError + FieldByName('UnitName').AsString + ' 네트워크 오류입니다. 확인하여주세요!' + #13#10;

            RLpr[j].nUnitNo := FieldByName('UnitNo').AsInteger;
            RLpr[j].sDspIP := FieldByName('Reserve1').AsString;
            RLpr[j].nIO := 2;
          end;
          i := i + 1;
          j := j + 1;

          if i > 3 then
            Break;
          Next;
        end;
        bLPR := True;
      end
      else
        ExceptLogging('설치된 출구 LPR이 없음!');

      Close;
      SQL.Clear;
      SQL.Add('Select * ');
      SQL.Add(
        'From UnitInfo Where UnitKind = :N1 and MyNo = :N2 Order By ParkNo, UnitNo');
      Parameters.ParamByName('N1').Value := 10; // 입구전광판
      Parameters.ParamByName('N2').Value := nCurrUnitNo;
      Open;

      if RecordCount > 0 then
      begin
        i := 1;

        while not Eof do
        begin
          with frmMainNew do
          begin
            sTemp1 := wString(MG_StrTrim(aString(FieldByName('IPNo').AsString), ' '));
            TClientSocket(FindComponent('csInDsp' + IntToStr(i))).Host := wString(MG_StrTrim(aString(FieldByName('IPNo').AsString), ' '));
            TClientSocket(FindComponent('csInDsp' + IntToStr(i))).Port := FieldByName('PortNo').AsInteger;
            TClientSocket(FindComponent('csInDsp' + IntToStr(i))).Tag := FieldByName('UnitNo').AsInteger;

            if is_ping(TClientSocket(FindComponent('csInDsp' + IntToStr(i))).Host) then
            begin
              try
                TClientSocket(FindComponent('csInDsp' + IntToStr(i))).Active := True;
              except
                on E: Exception do sError := sError + FieldByName('UnitName').AsString + ' 네트워크 오류입니다. 확인하여주세요!' + #13#10;
              end;
            end
            else
              sError := sError + FieldByName('UnitName').AsString + ' 네트워크 오류입니다. 확인하여주세요!' + #13#10;
          end;
          i := i + 1;

          if i > 5 then
            Break;
          Next;
        end;
        bInDsp := True;
        mnuInDsp.Enabled := True;
        tInDsp.Enabled := True;
      end
      else
      begin
        bInDsp := False;
        ExceptLogging('설치된 입구전광판이 없음!');
      end;

      Close;
      SQL.Clear;
      SQL.Add('Select * ');
      SQL.Add(
        'From UnitInfo Where UnitKind = :N1 and MyNo = :N2 Order By ParkNo, UnitNo');
      Parameters.ParamByName('N1').Value := 11; // 출구전광판
      Parameters.ParamByName('N2').Value := nCurrUnitNo;
      Open;

      if RecordCount > 0 then
      begin
        i := 1;

        while not Eof do
        begin
          with frmMainNew do
          begin
            TClientSocket(FindComponent('csOutDsp' + IntToStr(i))).Host := wString(MG_StrTrim(aString(FieldByName('IPNo').AsString), ' '));
            TClientSocket(FindComponent('csOutDsp' + IntToStr(i))).Port := FieldByName('PortNo').AsInteger;
            TClientSocket(FindComponent('csOutDsp' + IntToStr(i))).Tag := FieldByName('UnitNo').AsInteger;

            if is_ping(TClientSocket(FindComponent('csOutDsp' + IntToStr(i))).Host) then
            begin
              try
                TClientSocket(FindComponent('csOutDsp' + IntToStr(i))).Active := True;
              except
                on E: Exception do sError := sError + FieldByName('UnitName').AsString + ' 네트워크 오류입니다. 확인하여주세요!' + #13#10;
              end;
            end
            else
              sError := sError + FieldByName('UnitName').AsString +
                ' 네트워크 오류입니다. 확인하여주세요!' + #13#10;
          end;
          i := i + 1;

          if i > 3 then
            Break;
          Next;
        end;
        bOutDsp := True;
        mnuOutDsp.Enabled := True;
        tOutDsp.Enabled := True;
      end
      else
      begin
        bOutDsp := False;
        ExceptLogging('설치된 출구전광판이 없음!');
      end;

      if sError <> '' then
        ShowMessage(sError);

      with lbReceipt do
      begin
        Items.Clear;

        for i := 1 to 10 do
        begin
          if RReceipt[i].sInOutTime <> '' then
            Items.Add(RReceipt[i].sInOutTime);
        end;
      end;
      nUseBtnCnt := 0;

      Close;
      SQL.Clear;
      SQL.Add('Select * from FeeItem where ParkNo = :N1 Order By FeeNo');
      Parameters.ParamByName('N1').Value := nCurrParkNo;
      Open;
      i := 2;

      if RecordCount > 0 then
      begin
        nUseBtnCnt := RecordCount;

        while not Eof do
        begin
          with frmMainNew do
          begin
            TAdvShapeButton(FindComponent('btn' + IntToStr(i))).Font.Color :=
              clGreen;
            TAdvShapeButton(FindComponent('btn' + IntToStr(i))).Text :=
              FieldByName('FeeName').AsString;
            TAdvShapeButton(FindComponent('btn' + IntToStr(i))).Tag :=
              FieldByName('FeeNo').AsInteger;
            TMenuItem(FindComponent('mnuDC' + IntToStr(i))).Caption :=
              FieldByName('FeeName').AsString;
            TMenuItem(FindComponent('mnuDC' + IntToStr(i))).Visible := True;
          end;
          Inc(i);
          Next;
        end;
      end;
      nFeeNo := 0;
      nItemMax := 0;
      nTotMax := 0;

      for j := 1 to 50 do
      begin
        RDCCnt[j].nDCNo := 0;
        RDCCnt[j].nDCUseCnt := 0;
        RDCCnt[j].nDCNowCnt := 0;
      end;

      Close;
      SQL.Clear;
//      SQL.Add('Select * from DCInfo where ParkNo = :N2 Order By DCNo');
      SQL.Add('Select * from DCInfo where ParkNo = :N2 and RealUse = 1 and ButtonUse = 1 Order By VisibleCnt asc, DCNo asc ');
      Parameters.ParamByName('N2').Value := nCurrParkNo;
      Open;

      if RecordCount > 0 then
      begin
        nDCList := RecordCount;
        nUseBtnCnt := nUseBtnCnt + nDCList;
        j := 1;
        First;

        while not Eof do
        begin
          with frmMainNew do
          begin
            TAdvShapeButton(FindComponent('btn' + IntToStr(i))).Font.Color := clWhite;
            TAdvShapeButton(FindComponent('btn' + IntToStr(i))).Text := FieldByName('DCName').AsString;
            TAdvShapeButton(FindComponent('btn' + IntToStr(i))).Tag := FieldByName('DCNo').AsInteger + 100;
            TAdvShapeButton(FindComponent('btn' + IntToStr(i))).GroupIndex := FieldByName('DCType').AsInteger;
            TAdvShapeButton(FindComponent('btn' + IntToStr(i))).Hint := IntToStr(FieldByName('DCValue').AsInteger);
            TAdvShapeButton(FindComponent('btn' + IntToStr(i))).ComponentIndex := FieldByName('DCUseCnt').AsInteger;
            TMenuItem(FindComponent('mnuDC' + IntToStr(i))).Caption := FieldByName('DCName').AsString;
            TMenuItem(FindComponent('mnuDC' + IntToStr(i))).Visible := True;

            RDCCnt[j].nDCNo := FieldByName('DCNo').AsInteger + 100;
            RDCCnt[j].nDCUseCnt := FieldByName('DCUseCnt').AsInteger;
          end;
          Inc(i);
          Inc(j);
          Next;
        end;
      end;

      // 민원처리 버튼...
      btn16.Font.Color := clRed;
      btn16.Text := '민원처리';
      btn16.Tag := 255;
      btn16.Enabled := True;

      Close;
      SQL.Clear;
      SQL.Add('Select * ');
      SQL.Add(
        'From UnitInfo Where UnitKind = :N1 and ParkNo = :N3 Order By ParkNo, UnitNo');
      Parameters.ParamByName('N1').Value := 8; // 입구LPR
      Parameters.ParamByName('N3').Value := nCurrParkNo;
      Open;

      if RecordCount > 0 then
      begin
        i := 1;

        while not Eof do
        begin
          with frmMainNew do
          begin
            TAdvToolButton(FindComponent('btnBar' + IntToStr(i))).Caption := FieldByName('UnitName').AsString;
            TAdvToolButton(FindComponent('btnBar' + IntToStr(i))).Hint := wString(MG_StrTrim(aString(FieldByName('IPNo').AsString), ' '));
            TAdvToolButton(FindComponent('btnBar' + IntToStr(i))).GroupIndex := FieldByName('PortNo').AsInteger;
            TAdvToolButton(FindComponent('btnBar' + IntToStr(i))).Tag := FieldByName('UnitNo').AsInteger;
            TAdvToolButton(FindComponent('btnBar' + IntToStr(i))).ImageIndex := FieldByName('MyNo').AsInteger;
            TAdvToolButton(FindComponent('btnBar' + IntToStr(i))).Visible := True;
          end;
          i := i + 1;
          Next;
        end;
      end;

      Close;
      SQL.Clear;
      SQL.Add('Select * ');
      SQL.Add(
        'From UnitInfo Where UnitKind = :N1 and ParkNo = :N3 Order By ParkNo, UnitNo');
      Parameters.ParamByName('N1').Value := 9; // 출구LPR
      Parameters.ParamByName('N3').Value := nCurrParkNo;
      Open;

      if RecordCount > 0 then
      begin
        while not Eof do
        begin
          with frmMainNew do
          begin
            TAdvToolButton(FindComponent('btnBar' + IntToStr(i))).Caption := FieldByName('UnitName').AsString;
            TAdvToolButton(FindComponent('btnBar' + IntToStr(i))).Hint := wString(MG_StrTrim(aString(FieldByName('IPNo').AsString), ' '));
            TAdvToolButton(FindComponent('btnBar' + IntToStr(i))).GroupIndex := FieldByName('PortNo').AsInteger;
            TAdvToolButton(FindComponent('btnBar' + IntToStr(i))).Tag := FieldByName('UnitNo').AsInteger;
            TAdvToolButton(FindComponent('btnBar' + IntToStr(i))).ImageIndex := FieldByName('MyNo').AsInteger;
            TAdvToolButton(FindComponent('btnBar' + IntToStr(i))).Visible := True;
          end;
          i := i + 1;
          Next;
        end;
      end;

      Close;
      SQL.Clear;
      SQL.Add('Select * from UnitInfo where UnitNo = :N1');
      Parameters.ParamByName('N1').Value := nCurrUnitNo;
      Open;

      if RecordCount > 0 then
      begin
        idTS.Active := False;
        idTS.DefaultPort := FieldByName('PortNo').AsInteger;
        idTS.Active := True;
      end;
    end;

    //2018.01.09 AK프라자 로직 추가 시작//
    if bFCMode then
    begin
      FcModeChange(0);
    end
    else
    begin
      FcModeChange(1);
    end;
    //2018.01.09 AK프라자 로직 추가 종료//

    ClearFormData;
    GridClear;
  except
    on E: Exception do
      ExceptLogging('TfrmMainNew.FormShow: ' + aString(E.Message));
  end;
end;

procedure TfrmMainNew.mnuSetupClick(Sender: TObject);
begin
  NextModalDialog(TfrmSetup.Create(Self));

  if bSetupChange and (nCurrMNo <> 99) then
  begin
    ShowMessage('환경설정이 변경되어 프로그램을 종료합니다.'#13#10 + '프로그램을 다시 시작하여 주세요!');
    bDirectClose:= True;
    Close;
  end;
end;

procedure TfrmMainNew.mnuUnitInfoClick(Sender: TObject);
begin
  NextModalDialog(TfrmUnitInfo.Create(Self));

  if bSetupChange and (nCurrMNo <> 99) then
  begin
    ShowMessage('환경설정이 변경되어 프로그램을 종료합니다.'#13#10 + '프로그램을 다시 시작하여 주세요!');
    bDirectClose:= True;
    Close;
  end;
end;

procedure TfrmMainNew.mnuSCSearchClick(Sender: TObject);
begin
  btnSCSearchClick(Self);
end;

procedure TfrmMainNew.mnuBarProcClick(Sender: TObject);
begin
  btnBarClick(Self);
end;

procedure TfrmMainNew.mnuClosingClick(Sender: TObject);
begin
  btnClosingClick(Self);
end;

procedure TfrmMainNew.mnuCarSearchClick(Sender: TObject);
begin
  btnCarSearchClick(Self);
end;

procedure TfrmMainNew.mnuManualInClick(Sender: TObject);
begin
  btnManualInClick(Self);
end;

procedure TfrmMainNew.mnuManualOutClick(Sender: TObject);
begin
  btnManualOutClick(Self);
end;

procedure TfrmMainNew.mnuSearchClick(Sender: TObject);
begin
  edtManualProcDate.Date := Now;
  pnManualProc.Visible := True;
  edtManualProcCarNo.SetFocus;
end;

procedure TfrmMainNew.mnuDetailClick(Sender: TObject);
begin
  // 영수증...
  if mnuDetail.Tag = 0 then
  begin
    mnuDetail.Tag := 1;
    pnlReceipt.Visible := True;
    mnuDetail.Caption := '지난 영수증 숨기기';
  end
  else
  begin
    mnuDetail.Tag := 0;
    pnlReceipt.Visible := False;
    mnuDetail.Caption := '지난 영수증 보기';
  end;
end;

procedure TfrmMainNew.mnuInDspClick(Sender: TObject);
begin
  NextModalDialog(TfrmInDspSet.Create(Self));
end;

procedure TfrmMainNew.mnuOutDspClick(Sender: TObject);
begin
  NextModalDialog(TfrmDspSet.Create(Self));
end;

procedure TfrmMainNew.tInAlive1Timer(Sender: TObject);
begin
  try
    if csInLpr1.Active then
    begin
      if is_ping(csInLpr1.Host) then
      begin
        csInLpr1.Socket.SendText('OK');
        ExceptLogging(IntToStr(csInLpr1.Tag) + '번 LPR OK 전송');
      end;
    end
    else
    begin
      if (csInLpr1.Host <> '') and is_ping(csInLpr1.Host) then
        csInLpr1.Active := True;
    end;

    if nChkTime < GetTickCount then
    begin
      nChkTime := GetTickCount + 3600000;

      try
        if csInLpr1.Active then
        begin
          if is_ping(csInLpr1.Host) then
          begin
            csInLpr1.Socket.SendText
              ('TIME' + FormatDateTime('YYYYMMDDHHNNSS', Now));
            ExceptLogging(IntToStr(csInLpr1.Tag) + '번 LPR 시간동기화 전송');
          end;
        end;
      except
        on E: Exception do
          ExceptLogging(IntToStr(csInLpr1.Tag)
              + '번 LPR 시간동기화 전송시 오류: ' + aString(E.Message));
      end;
    end;
  except
    on E: Exception do
      ExceptLogging(IntToStr(csInLpr1.Tag) + '번 LPR OK 전송시 오류: ' + aString
          (E.Message));
  end;
end;

procedure TfrmMainNew.tInAlive2Timer(Sender: TObject);
begin
  try
    if csInLpr2.Active then
    begin
      if is_ping(csInLpr2.Host) then
      begin
        csInLpr2.Socket.SendText('OK');
        ExceptLogging(IntToStr(csInLpr2.Tag) + '번 LPR OK 전송');
      end;
    end
    else
    begin
      if (csInLpr2.Host <> '') and is_ping(csInLpr2.Host) then
        csInLpr2.Active := True;
    end;

    if nChkTime < GetTickCount then
    begin
      nChkTime := GetTickCount + 3600000;

      try
        if csInLpr2.Active then
        begin
          if is_ping(csInLpr2.Host) then
          begin
            csInLpr2.Socket.SendText
              ('TIME' + FormatDateTime('YYYYMMDDHHNNSS', Now));
            ExceptLogging(IntToStr(csInLpr2.Tag) + '번 LPR 시간동기화 전송');
          end;
        end;
      except
        on E: Exception do
          ExceptLogging(IntToStr(csInLpr2.Tag)
              + '번 LPR 시간동기화 전송시 오류: ' + aString(E.Message));
      end;
    end;
  except
    on E: Exception do
      ExceptLogging(IntToStr(csInLpr2.Tag) + '번 LPR OK 전송시 오류: ' + aString
          (E.Message));
  end;
end;

procedure TfrmMainNew.tInAlive3Timer(Sender: TObject);
begin
  try
    if csInLpr3.Active then
    begin
      if is_ping(csInLpr3.Host) then
      begin
        csInLpr3.Socket.SendText('OK');
        ExceptLogging(IntToStr(csInLpr3.Tag) + '번 LPR OK 전송');
      end;
    end
    else
    begin
      if (csInLpr3.Host <> '') and is_ping(csInLpr3.Host) then
        csInLpr3.Active := True;
    end;

    if nChkTime < GetTickCount then
    begin
      nChkTime := GetTickCount + 3600000;

      try
        if csInLpr3.Active then
        begin
          if is_ping(csInLpr3.Host) then
          begin
            csInLpr3.Socket.SendText
              ('TIME' + FormatDateTime('YYYYMMDDHHNNSS', Now));
            ExceptLogging(IntToStr(csInLpr3.Tag) + '번 LPR 시간동기화 전송');
          end;
        end;
      except
        on E: Exception do
          ExceptLogging(IntToStr(csInLpr3.Tag)
              + '번 LPR 시간동기화 전송시 오류: ' + aString(E.Message));
      end;
    end;
  except
    on E: Exception do
      ExceptLogging(IntToStr(csInLpr3.Tag) + '번 LPR OK 전송시 오류: ' + aString
          (E.Message));
  end;
end;

procedure TfrmMainNew.tInAlive4Timer(Sender: TObject);
begin
  try
    if csInLpr4.Active then
    begin
      if is_ping(csInLpr4.Host) then
      begin
        csInLpr4.Socket.SendText('OK');
        ExceptLogging(IntToStr(csInLpr4.Tag) + '번 LPR OK 전송');
      end;
    end
    else
    begin
      if (csInLpr4.Host <> '') and is_ping(csInLpr4.Host) then
        csInLpr4.Active := True;
    end;

    if nChkTime < GetTickCount then
    begin
      nChkTime := GetTickCount + 3600000;

      try
        if csInLpr4.Active then
        begin
          if is_ping(csInLpr4.Host) then
          begin
            csInLpr4.Socket.SendText
              ('TIME' + FormatDateTime('YYYYMMDDHHNNSS', Now));
            ExceptLogging(IntToStr(csInLpr4.Tag) + '번 LPR 시간동기화 전송');
          end;
        end;
      except
        on E: Exception do
          ExceptLogging(IntToStr(csInLpr4.Tag)
              + '번 LPR 시간동기화 전송시 오류: ' + aString(E.Message));
      end;
    end;
  except
    on E: Exception do
      ExceptLogging(IntToStr(csInLpr4.Tag) + '번 LPR OK 전송시 오류: ' + aString
          (E.Message));
  end;
end;

procedure TfrmMainNew.tInAlive5Timer(Sender: TObject);
begin
  try
    if csInLpr5.Active then
    begin
      if is_ping(csInLpr5.Host) then
      begin
        csInLpr5.Socket.SendText('OK');
        ExceptLogging(IntToStr(csInLpr5.Tag) + '번 LPR OK 전송');
      end;
    end
    else
    begin
      if (csInLpr5.Host <> '') and is_ping(csInLpr5.Host) then
        csInLpr5.Active := True;
    end;

    if nChkTime < GetTickCount then
    begin
      nChkTime := GetTickCount + 3600000;

      try
        if csInLpr5.Active then
        begin
          if is_ping(csInLpr5.Host) then
          begin
            csInLpr5.Socket.SendText
              ('TIME' + FormatDateTime('YYYYMMDDHHNNSS', Now));
            ExceptLogging(IntToStr(csInLpr5.Tag) + '번 LPR 시간동기화 전송');
          end;
        end;
      except
        on E: Exception do
          ExceptLogging(IntToStr(csInLpr5.Tag)
              + '번 LPR 시간동기화 전송시 오류: ' + aString(E.Message));
      end;
    end;
  except
    on E: Exception do
      ExceptLogging(IntToStr(csInLpr5.Tag) + '번 LPR OK 전송시 오류: ' + aString
          (E.Message));
  end;
end;

procedure TfrmMainNew.tInDspTimer(Sender: TObject);
var
  sSend, sDspData, sSpeed, sTime, sEffect: aString;
  sDsp1, sDsp2, sColor1, sColor2, sTemp1, sTemp2: aString;
  i: Byte;
begin
  try
    tInDsp.Enabled := False;
    sSend := '';
    sSpeed := MG_InsZero(IntToStr(iSetup.ReadInteger('PARKING', 'IN_DSP_SPEED', 0)), 2);
    sTime := MG_InsZero(IntToStr(iSetup.ReadInteger('PARKING', 'IN_DSP_TIME', 0)), 2);

    sDsp1 := MG_StrTrim(aString(iSetup.ReadString('PARKING', 'IN_DSP_1_1', '')), AnsiChar(39));
    sDsp2 := MG_StrTrim(aString(iSetup.ReadString('PARKING', 'IN_DSP_1_2', '')), AnsiChar(39));
    sTemp1 := iSetup.ReadString('PARKING', 'IN_DSP_COLOR_1_1', '');
    sTemp2 := iSetup.ReadString('PARKING', 'IN_DSP_COLOR_1_2', '');
    sColor1 := '';
    sColor2 := '';

    for i := 1 to 12 do
    begin
      sColor1 := sColor1 + AnsiChar(StrToInt('$0' + Copy(sTemp1, i, 1)));
    end;

    for i := 1 to 12 do
    begin
      sColor2 := sColor2 + AnsiChar(StrToInt('$0' + Copy(sTemp2, i, 1)));
    end;

    sEffect := AnsiChar($00) + // AnsiChar(StrToInt('$' + edtDspNo.Text)) + //문구블록
      AnsiChar($00) + // 배경이미지
      AnsiChar($00) + // 문구저장위치
      AnsiChar($61) + // AnsiChar(StrToInt('$' + edttt.Text)) + //폰트크기
      AnsiChar($00) + // 화면분할위치
      AnsiChar($00) + // 완성형
      AnsiChar($80) + // 분할화면효과없음
      AnsiChar($01) + // 메인화면효과
      AnsiChar(StrToInt('$' + sSpeed)) + // 속도
      AnsiChar(StrToInt('$' + sTime)) + // 정지시간
      AnsiChar($00); // 문구수직위치
    sSend := MakeDSPData(AnsiChar($53), sEffect, sColor1 + sColor2,
      sDsp1 + sDsp2);

    for i := 1 to 5 do
    begin
      if TClientSocket(FindComponent('csInDsp' + IntToStr(i))).Active then
        TClientSocket(FindComponent('csInDsp' + IntToStr(i))).Socket.SendText(sSend);
    end;
  except
    on E: Exception do
      ExceptLogging('TfrmMainNew.tInDspTimer: ' + aString(E.Message));
  end;
end;

procedure TfrmMainNew.tNCInWaitTimer(Sender: TObject);
begin
  try
    tNCInWait.Enabled := False;

    if not bNCInProcWait then
    begin
      ExceptLogging('일반차량 입차대기자료 처리: ' + IntToStr(nNCInWaitFlag)
          + ', ' + IntToStr(nNCInWaitPoint));

      if nNCInWaitPoint <> nNCInWaitFlag then
      begin
        if nNCInWaitFlag = 20 then
          nNCInWaitFlag := 1
        else
          nNCInWaitFlag := nNCInWaitFlag + 1;

        if RNCInWait[nNCInWaitFlag].sNCIOTime <> '' then
        begin
          NormalProc(RNCInWait[nNCInWaitFlag].sNCFile1,
            RNCInWait[nNCInWaitFlag].sNCCarNo1,
            RNCInWait[nNCInWaitFlag].sNCFile2, RNCInWait[nNCInWaitFlag]
              .sNCCarNo2, RNCInWait[nNCInWaitFlag].sNCIOTime,
            RNCInWait[nNCInWaitFlag].nNCLprNo,
            RNCInWait[nNCInWaitFlag].nNCInOut, RNCInWait[nNCInWaitFlag]
              .nNCRecog1, RNCInWait[nNCInWaitFlag].nNCRecog2,
            RNCInWait[nNCInWaitFlag].sNCDspIP, RNCInWait[nNCInWaitFlag]
              .csNCLPR, RNCInWait[nNCInWaitFlag].bBarOpen);

          RNCInWait[nNCInWaitFlag].sNCFile1 := '';
          RNCInWait[nNCInWaitFlag].sNCCarNo1 := '';
          RNCInWait[nNCInWaitFlag].sNCFile2 := '';
          RNCInWait[nNCInWaitFlag].sNCCarNo2 := '';
          RNCInWait[nNCInWaitFlag].sNCIOTime := '';
          RNCInWait[nNCInWaitFlag].nNCLprNo := 0;
          RNCInWait[nNCInWaitFlag].nNCInOut := 0;
          RNCInWait[nNCInWaitFlag].nNCRecog1 := 0;
          RNCInWait[nNCInWaitFlag].nNCRecog2 := 0;
          RNCInWait[nNCInWaitFlag].sNCDspIP := '';
          RNCInWait[nNCInWaitFlag].bBarOpen := False;
        end;

        if nNCInWaitPoint <> nNCInWaitFlag then
          tNCInWait.Enabled := True;
      end
      else
        tNCInWait.Enabled := False;
    end
    else
      tNCInWait.Enabled := True;
  except
    on E: Exception do
      ExceptLogging('TfrmMainNew.tNCInWaitTimer: ' + aString(E.Message));
  end;
end;

procedure TfrmMainNew.tNCOutWaitTimer(Sender: TObject);
begin
  try
    tNCOutWait.Enabled := False;

    if not bNCOutProcWait then
    begin
      ExceptLogging('일반차량 출차대기자료 처리: ' + IntToStr(nNCOutWaitFlag)
          + ', ' + IntToStr(nNCOutWaitPoint));

      if nNCOutWaitPoint <> nNCOutWaitFlag then
      begin
        if nNCOutWaitFlag = 20 then
          nNCOutWaitFlag := 1
        else
          nNCOutWaitFlag := nNCOutWaitFlag + 1;

        if RNCOutWait[nNCOutWaitFlag].sNCIOTime <> '' then
        begin
          nNowCharo := RNCOutWait[nNCOutWaitPoint].nNCCharo;
          NormalProc(RNCOutWait[nNCOutWaitFlag].sNCFile1,
            RNCOutWait[nNCOutWaitFlag].sNCCarNo1,
            RNCOutWait[nNCOutWaitFlag].sNCFile2, RNCOutWait[nNCOutWaitFlag]
              .sNCCarNo2, RNCOutWait[nNCOutWaitFlag].sNCIOTime,
            RNCOutWait[nNCOutWaitFlag].nNCLprNo, RNCOutWait[nNCOutWaitFlag]
              .nNCInOut, RNCOutWait[nNCOutWaitFlag].nNCRecog1,
            RNCOutWait[nNCOutWaitFlag].nNCRecog2,
            RNCOutWait[nNCOutWaitFlag].sNCDspIP,
            RNCOutWait[nNCOutWaitFlag].csNCLPR, RNCOutWait[nNCOutWaitFlag]
              .bBarOpen);

          RNCOutWait[nNCOutWaitFlag].sNCFile1 := '';
          RNCOutWait[nNCOutWaitFlag].sNCCarNo1 := '';
          RNCOutWait[nNCOutWaitFlag].sNCFile2 := '';
          RNCOutWait[nNCOutWaitFlag].sNCCarNo2 := '';
          RNCOutWait[nNCOutWaitFlag].sNCIOTime := '';
          RNCOutWait[nNCOutWaitFlag].nNCLprNo := 0;
          RNCOutWait[nNCOutWaitFlag].nNCInOut := 0;
          RNCOutWait[nNCOutWaitFlag].nNCRecog1 := 0;
          RNCOutWait[nNCOutWaitFlag].nNCRecog2 := 0;
          RNCOutWait[nNCOutWaitFlag].sNCDspIP := '';
          RNCOutWait[nNCOutWaitFlag].bBarOpen := False;
        end;

        if nNCOutWaitPoint <> nNCOutWaitFlag then
          tNCOutWait.Enabled := True;
      end
      else
      begin
        tNCOutWait.Enabled := False;
      end;
    end
    else
      tNCOutWait.Enabled := True;
  except
    on E: Exception do
      ExceptLogging('TfrmMainNew.tNCOutWaitTimer: ' + aString(E.Message));
  end;
end;

procedure TfrmMainNew.tOutAlive1Timer(Sender: TObject);
begin
  try
    if csOutLpr1.Active then
    begin
      if is_ping(csOutLpr1.Host) then
      begin
        csOutLpr1.Socket.SendText('OK');
        ExceptLogging(IntToStr(csOutLpr1.Tag) + '번 LPR OK 전송');
      end;
    end
    else
    begin
      if (csOutLpr1.Host <> '') and is_ping(csOutLpr1.Host) then
        csOutLpr1.Active := True;
    end;

    if nChkTime < GetTickCount then
    begin
      nChkTime := GetTickCount + 3600000;

      try
        if csOutLpr1.Active then
        begin
          if is_ping(csOutLpr1.Host) then
          begin
            csOutLpr1.Socket.SendText
              ('TIME' + FormatDateTime('YYYYMMDDHHNNSS', Now));
            ExceptLogging(IntToStr(csOutLpr1.Tag) + '번 LPR 시간동기화 전송');
          end;
        end;
      except
        on E: Exception do
          ExceptLogging(IntToStr(csOutLpr1.Tag)
              + '번 LPR 시간동기화 전송시 오류: ' + aString(E.Message));
      end;
    end;
  except
    on E: Exception do
      ExceptLogging(IntToStr(csOutLpr1.Tag) + '번 LPR OK 전송시 오류: ' + aString
          (E.Message));
  end;
end;

procedure TfrmMainNew.tOutAlive2Timer(Sender: TObject);
begin
  try
    if csOutLpr2.Active then
    begin
      if is_ping(csOutLpr2.Host) then
      begin
        csOutLpr2.Socket.SendText('OK');
        ExceptLogging(IntToStr(csOutLpr2.Tag) + '번 LPR OK 전송');
      end;
    end
    else
    begin
      if (csOutLpr2.Host <> '') and is_ping(csOutLpr2.Host) then
        csOutLpr2.Active := True;
    end;

    if nChkTime < GetTickCount then
    begin
      nChkTime := GetTickCount + 3600000;

      try
        if csOutLpr2.Active then
        begin
          if is_ping(csOutLpr2.Host) then
          begin
            csOutLpr2.Socket.SendText
              ('TIME' + FormatDateTime('YYYYMMDDHHNNSS', Now));
            ExceptLogging(IntToStr(csOutLpr2.Tag) + '번 LPR 시간동기화 전송');
          end;
        end;
      except
        on E: Exception do
          ExceptLogging(IntToStr(csOutLpr2.Tag)
              + '번 LPR 시간동기화 전송시 오류: ' + aString(E.Message));
      end;
    end;
  except
    on E: Exception do
      ExceptLogging(IntToStr(csOutLpr2.Tag) + '번 LPR OK 전송시 오류: ' + aString
          (E.Message));
  end;
end;

procedure TfrmMainNew.tOutAlive3Timer(Sender: TObject);
begin
  try
    if csOutLpr3.Active then
    begin
      if is_ping(csOutLpr3.Host) then
      begin
        csOutLpr3.Socket.SendText('OK');
        ExceptLogging(IntToStr(csOutLpr3.Tag) + '번 LPR OK 전송');
      end;
    end
    else
    begin
      if (csOutLpr3.Host <> '') and is_ping(csOutLpr3.Host) then
        csOutLpr3.Active := True;
    end;

    if nChkTime < GetTickCount then
    begin
      nChkTime := GetTickCount + 3600000;

      try
        if csOutLpr3.Active then
        begin
          if is_ping(csOutLpr3.Host) then
          begin
            csOutLpr3.Socket.SendText
              ('TIME' + FormatDateTime('YYYYMMDDHHNNSS', Now));
            ExceptLogging(IntToStr(csOutLpr3.Tag) + '번 LPR 시간동기화 전송');
          end;
        end;
      except
        on E: Exception do
          ExceptLogging(IntToStr(csOutLpr3.Tag)
              + '번 LPR 시간동기화 전송시 오류: ' + aString(E.Message));
      end;
    end;
  except
    on E: Exception do
      ExceptLogging(IntToStr(csOutLpr3.Tag) + '번 LPR OK 전송시 오류: ' + aString
          (E.Message));
  end;
end;

procedure TfrmMainNew.tOutDspTimer(Sender: TObject);
var
  sSend, sDspData, sSpeed, sTime, sEffect: aString;
  sDsp1, sDsp2, sColor1, sColor2, sTemp1, sTemp2: aString;
  i: Byte;
begin
  try
    tOutDsp.Enabled := False;
    sSend := '';
    sSpeed := MG_InsZero(IntToStr(iSetup.ReadInteger('PARKING', 'DSP_SPEED', 0))
        , 2);
    sTime := MG_InsZero(IntToStr(iSetup.ReadInteger('PARKING', 'DSP_TIME', 0)),
      2);

    sDsp1 := MG_StrTrim(aString(iSetup.ReadString('PARKING', 'DSP_1_1', '')),
      AnsiChar(39));
    sDsp2 := MG_StrTrim(aString(iSetup.ReadString('PARKING', 'DSP_1_2', '')),
      AnsiChar(39));
    sTemp1 := iSetup.ReadString('PARKING', 'DSP_COLOR_1_1', '');
    sTemp2 := iSetup.ReadString('PARKING', 'DSP_COLOR_1_2', '');
    sColor1 := '';
    sColor2 := '';

    for i := 1 to 12 do
    begin
      sColor1 := sColor1 + AnsiChar(StrToInt('$0' + Copy(sTemp1, i, 1)));
    end;

    for i := 1 to 12 do
    begin
      sColor2 := sColor2 + AnsiChar(StrToInt('$0' + Copy(sTemp2, i, 1)));
    end;

    sEffect := AnsiChar($00) + // AnsiChar(StrToInt('$' + edtDspNo.Text)) + //문구블록
      AnsiChar($00) + // 배경이미지
      AnsiChar($00) + // 문구저장위치
      AnsiChar($61) + // AnsiChar(StrToInt('$' + edttt.Text)) + //폰트크기
      AnsiChar($00) + // 화면분할위치
      AnsiChar($00) + // 완성형
      AnsiChar($80) + // 분할화면효과없음
      AnsiChar($01) + // 메인화면효과
      AnsiChar(StrToInt('$' + sSpeed)) + // 속도
      AnsiChar(StrToInt('$' + sTime)) + // 정지시간
      AnsiChar($00); // 문구수직위치
    sSend := MakeDSPData(AnsiChar($53), sEffect, sColor1 + sColor2,
      sDsp1 + sDsp2);

    for i := 1 to 3 do
    begin
      if TClientSocket(FindComponent('csOutDsp' + IntToStr(i))).Active then
        TClientSocket(FindComponent('csOutDsp' + IntToStr(i))).Socket.SendText
          (sSend);
    end;
  except
    on E: Exception do
      ExceptLogging('TfrmMainNew.tOutDspTimer: ' + aString(E.Message));
  end;
end;

procedure TfrmMainNew.tSCWaitTimer(Sender: TObject);
var
  sResult: String;
begin
  try
    tSCWait.Enabled := False;

    if not bSCProcWait then
    begin
      ExceptLogging('정기차량 대기자료 처리: ' + IntToStr(nSCWaitFlag) + ', ' + IntToStr
          (nSCWaitPoint));

      if nSCWaitPoint <> nSCWaitFlag then
      begin
        if nSCWaitFlag = 20 then
          nSCWaitFlag := 1
        else
          nSCWaitFlag := nSCWaitFlag + 1;

        if RSCWait[nSCWaitFlag].sSCIOTime <> '' then
        begin
          sResult := RecvLprProc(RSCWait[nSCWaitFlag].sSCFile1,
            RSCWait[nSCWaitFlag].sSCCarNo1, RSCWait[nSCWaitFlag].sSCFile2,
            RSCWait[nSCWaitFlag].sSCCarNo2, RSCWait[nSCWaitFlag].sSCIOTime,
            RSCWait[nSCWaitFlag].nSCLprNo, RSCWait[nSCWaitFlag].nSCInOut,
            RSCWait[nSCWaitFlag].nSCRecog1, RSCWait[nSCWaitFlag].nSCRecog2,
            RSCWait[nSCWaitFlag].sSCDspIP, RSCWait[nSCWaitFlag].csSCLPR,
            RSCWait[nSCWaitFlag].bBarOpen);
          GridData(sResult);
          RSCWait[nSCWaitFlag].sSCFile1 := '';
          RSCWait[nSCWaitFlag].sSCCarNo1 := '';
          RSCWait[nSCWaitFlag].sSCFile2 := '';
          RSCWait[nSCWaitFlag].sSCCarNo2 := '';
          RSCWait[nSCWaitFlag].sSCIOTime := '';
          RSCWait[nSCWaitFlag].nSCLprNo := 0;
          RSCWait[nSCWaitFlag].nSCInOut := 0;
          RSCWait[nSCWaitFlag].nSCRecog1 := 0;
          RSCWait[nSCWaitFlag].nSCRecog2 := 0;
          RSCWait[nSCWaitFlag].sSCDspIP := '';
          RSCWait[nSCWaitFlag].bBarOpen := False;
        end;

        if nSCWaitPoint <> nSCWaitFlag then
          tSCWait.Enabled := True;
      end
      else
        tSCWait.Enabled := False;
    end
    else
      tSCWait.Enabled := True;
  except
    on E: Exception do
      ExceptLogging('TfrmMainNew.tSCWaitTimer: ' + aString(E.Message));
  end;
end;

function TfrmMainNew.RecvLprProc(sLprFile1, sLprCarNo1, sLprFile2, sLprCarNo2,
  sIOTime: aString; nLprNo, nLprInOut, nLprRecog1, nLprRecog2: Byte;
  sDspIP: aString; csLPR: TClientSocket; bOpen: Boolean): String;
var
  sRecv, sSend, sName, sFileIP: aString;
  nSTXPos, nETXPos, nParkNo, nUnitNo: Integer;

  sCardNo, sLastUseTime, sSTime, sETime, sCarNo, sMarkNo, sGroupName, sDspGroup,
  sSCInDate, sSCInTime, sCompName, sDeptName, sExpDateF, sExpDateT, sLprDate,
  sLprTime, sTemp, sInFile, sCarType: aString;
  nInOut, nStatus, nAPB, nWP, nSYoil, nEYoil, nCarNo, nGroupNo: Integer;
  nLastUnitNo: Byte;
  nIBCRC: Word;
  bHoliday, bAlarm: Boolean;
  nUseFlag, nLastStatus: Byte;
  nDayBetween: Cardinal;
begin
  try
    try
      bSCProcWait := True;
      // 정기차량 처리....
      ExceptLogging('정기차량시작: ' + sLprCarNo1 + ', ' + sLprCarNo2);
      Result := '^^^^^^';
      nParkNo := nCurrParkNo;
      nUnitNo := nLprNo;
      nInOut := nLprInOut;
      nCarNo := 0;
      nLastUnitNo := 0;
      sCardNo := '';
      sMarkNo := '';
      sCarType:= '';
      bHoliday := False;
      bAlarm:= False;
      sLprDate := Copy(sIOTime, 1, 10);
      sLprTime := Copy(sIOTime, 12, 8);

      with dmTables.qryRecvLpr1 do
      begin
        Close;
        SQL.Clear;

        if sLprCarNo2 <> '' then
        begin
          SQL.Add('Select * from CustInfo where (CarNo = :N1) or (CarNo = :N2) and TKType = 2');
          SQL.Add(' order by GroupNo desc ');
          Parameters.ParamByName('N1').Value := sLprCarNo1;
          Parameters.ParamByName('N2').Value := sLprCarNo2;
        end
        else
        begin
          SQL.Add('Select * from CustInfo where CarNo = :N1 and TKType = 2');
          SQL.Add(' order by GroupNo desc ');
          Parameters.ParamByName('N1').Value := sLprCarNo1;
        end;
        Open;

        if RecordCount > 0 then
        begin
          sCardNo := FieldByName('TKNo').AsString;
          sMarkNo := FieldByName('MarkNo').AsString;
          nStatus := FieldByName('Status').AsInteger;
          nAPB := FieldByName('APB').AsInteger;
          nLastStatus := FieldByName('IOStatusNo').AsInteger;
          sLastUseTime := FieldByName('LastUseDate').AsString + ' ' + FieldByName('LastUseTime').AsString;
          nWP := FieldByName('WPNo').AsInteger;
          nGroupNo := FieldByName('GroupNo').AsInteger;
          sName := FieldByName('Name').AsString;
          nLastUnitNo := FieldByName('LastUnitNo').AsInteger;
          sCompName := FieldByName('CompName').AsString;
          sDeptName := FieldByName('DeptName').AsString;
          sExpDateF := FieldByName('ExpDateF').AsString;
          sExpDateT := FieldByName('ExpDateT').AsString;
          sCarNo := FieldByName('CarNo').AsString;
          sCarType:= FieldByName('Reserve1').AsString;

          Result := sLprDate + '^' + sLprTime + '^' + sCarNo + '^' + sName +
            '^' + sCompName + '^' + sExpDateT + '까지^';
        end;
      end;

      if sExpDateT = FormatDateTime('YYYY-MM-DD', Now) then
        nDayBetween:= 0
      else
        nDayBetween:= DaysBetween(Now, StrToDate(sExpDateT))+1;

      with dmTables do
      begin
        nSYoil := 1;
        nEYoil := 7;
        sSTime := '00:00';
        sETime := '23:59';

        with qryRecvLpr2 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Select * from GGroup where ParkNo = :N1 and GroupNo = :N2');
          Parameters.ParamByName('N1').Value := nCurrParkNo;
          Parameters.ParamByName('N2').Value := nGroupNo;
          Open;

          if RecordCount > 0 then
          begin
            sGroupName := FieldByName('GroupName').AsString;
            nGroupType := FieldByName('GroupType').AsInteger;
            nUseFeeItem := FieldByName('UseFeeItem').AsInteger;
            sDspGroup:= sGroupName;

            if FieldByName('HIType').AsInteger = 1 then
              bAlarm:= True;
          end;
        end;

        // 현재 사용기간내에 있으면...
        if (sExpDateF <= FormatDateTime('YYYY-MM-DD', Now)) and
          (sExpDateT >= FormatDateTime('YYYY-MM-DD', Now)) then
        begin
          // 입출구 구분(입구용:1, 출구용:2)
          if nInOut = 1 then
          begin
            if ((nSYoil <= DayOfWeek(Now)) and (nEYoil >= DayOfWeek(Now)) and
                (sSTime <= FormatDateTime('HH:NN', Now)) and
                (sETime >= FormatDateTime('HH:NN', Now))) then
            begin
              // 상태(발매:0, 사용중:1, 전체봉쇄:3, 입차봉쇄:4, 출차봉쇄:5)
              Case nStatus of
                0:
                  begin // 발매
                    with qryRecvLpr2 do
                    begin
                      Close;
                      SQL.Clear;
                      SQL.Add('Update CustInfo Set LastParkNo = :N1, LastUnitNo = :N2, ');
                      SQL.Add('LastUseDate = :N3, LastUseTime = :N4, IOStatusNo = :N5, Status = :N6 ');

                      // APB가 "1회조정(2)" 이면 APB를 "자동(1)"으로 변경한다.
                      if nAPB = 2 then
                        SQL.Add(', APB = :N10 ');

                      SQL.Add('where ParkNo = :N7 and TKType = :N8 and CarNo = :N9');
                      Parameters.ParamByName('N1').Value := nCurrParkNo;
                      Parameters.ParamByName('N2').Value := nUnitNo;
                      Parameters.ParamByName('N3').Value := sLprDate;
                      Parameters.ParamByName('N4').Value := sLprTime;
                      Parameters.ParamByName('N5').Value := 1;
                      Parameters.ParamByName('N6').Value := 1;
                      Parameters.ParamByName('N7').Value := nCurrParkNo;
                      Parameters.ParamByName('N8').Value := 2;
                      Parameters.ParamByName('N9').Value := sCarNo;

                      if nAPB = 2 then
                        Parameters.ParamByName('N10').Value := 1;
                      ExecSQL;

                      Close;
                      SQL.Clear;
                      SQL.Add('Insert Into IOSData (ParkNo, UnitNo, ProcDate, ProcTime, TKType, ');
                      SQL.Add('CarType, GroupNo, GroupName, CompName, DeptName, Name, InCarNo1, ');
                      SQL.Add('InIOStatusNo, InImage1, InCarNo2, InImage2, TKNo) ');
                      SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, ');
                      SQL.Add(':N12, :N13, :N14, :N15, :N16, :N17)');
                      Parameters.ParamByName('N1').Value := nParkNo;
                      Parameters.ParamByName('N2').Value := nUnitNo;
                      Parameters.ParamByName('N3').Value := sLprDate;
                      Parameters.ParamByName('N4').Value := sLprTime;
                      Parameters.ParamByName('N5').Value := 2;
                      Parameters.ParamByName('N6').Value := 2;
                      Parameters.ParamByName('N7').Value := nGroupNo;
                      Parameters.ParamByName('N8').Value := sGroupName;
                      Parameters.ParamByName('N9').Value := sCompName;
                      Parameters.ParamByName('N10').Value := sDeptName;
                      Parameters.ParamByName('N11').Value := sName;
                      Parameters.ParamByName('N12').Value := sLprCarNo1;
                      Parameters.ParamByName('N13').Value := 1;
                      Parameters.ParamByName('N14').Value := sLprFile1;
                      Parameters.ParamByName('N15').Value := sLprCarNo2;
                      Parameters.ParamByName('N16').Value := sLprFile2;
                      Parameters.ParamByName('N17').Value := sCardNo;
                      ExecSQL;
                    end;

                    if nGroupNo = 999 then
                    begin
                      DspProc(1, 1, MG_Center('VIP 차량', 12) + MG_Left(sCarNo, 12), sDspIP);
                      ExceptLogging('전광판문구' + MG_Center('VIP 차량', 12) + MG_Left(sCarNo, 12));
                    end
                    else
                    begin
                      if nSCRemain >= nDayBetween then
                      begin
                        DspProc(1, 1, MG_Right(IntToStr(nDayBetween) + '일남음', 12) + MG_Left(sCarNo, 12), sDspIP);
                        ExceptLogging('전광판문구' +MG_Right(IntToStr(nDayBetween) + '일남음', 12) + MG_Left(sCarNo, 12));
                      end
                      else
                      begin
                        DspProc(1, 1, MG_Left(sDspGroup, 12) + MG_Left(sCarNo, 12), sDspIP);
                        ExceptLogging('전광판문구' + MG_Left(sDspGroup, 12) + MG_Left(sCarNo, 12));
                      end;
                    end;

                    if bOpen then
                      InOpen(csLPR);

                    if bAlarm then
                      AlarmProc(sName, sCompName, sCarNo, sCarType);

                    Result := '1' + Result + '입 차';
                  end;

                1, 5:
                  begin // 정상, 출차봉쇄
                    if nAPB = 1 then // 자동
                    begin
                      if (nLastStatus = 1) or (nLastStatus = 8) then
                      // 주차장, APB위반 입차거부
                      begin
                        with qryRecvLpr2 do
                        begin
                          Close;
                          SQL.Clear;
                          SQL.Add('Update CustInfo Set LastParkNo = :N1, LastUnitNo = :N2, ');
                          SQL.Add( 'LastUseDate = :N3, LastUseTime = :N4, IOStatusNo = :N5 ');
                          SQL.Add( 'where ParkNo = :N6 and TKType = :N7 and CarNo = :N8');
                          Parameters.ParamByName('N1').Value := nParkNo;
                          Parameters.ParamByName('N2').Value := nUnitNo;
                          Parameters.ParamByName('N3').Value := sLprDate;
                          Parameters.ParamByName('N4').Value := sLprTime;
                          Parameters.ParamByName('N5').Value := 9;
                          Parameters.ParamByName('N6').Value := nParkNo;
                          Parameters.ParamByName('N7').Value := 2;
                          Parameters.ParamByName('N8').Value := sCarNo;
                          ExecSQL;

                          Close;
                          SQL.Clear;
                          SQL.Add('Insert Into IOSData (ParkNo, UnitNo, ProcDate, ProcTime, TKType, ');
                          SQL.Add('CarType, GroupNo, GroupName, CompName, DeptName, Name, InCarNo1, ');
                          SQL.Add('InIOStatusNo, InImage1, InCarNo2, InImage2, TKNo) ');
                          SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, :N12, ');
                          SQL.Add(':N13, :N14, :N15, :N16, :N17)');
                          Parameters.ParamByName('N1').Value := nParkNo;
                          Parameters.ParamByName('N2').Value := nUnitNo;
                          Parameters.ParamByName('N3').Value := sLprDate;
                          Parameters.ParamByName('N4').Value := sLprTime;
                          Parameters.ParamByName('N5').Value := 2;
                          Parameters.ParamByName('N6').Value := 2;
                          Parameters.ParamByName('N7').Value := nGroupNo;
                          Parameters.ParamByName('N8').Value := sGroupName;
                          Parameters.ParamByName('N9').Value := sCompName;
                          Parameters.ParamByName('N10').Value := sDeptName;
                          Parameters.ParamByName('N11').Value := sName;
                          Parameters.ParamByName('N12').Value := sLprCarNo1;
                          Parameters.ParamByName('N13').Value := 7;
                          Parameters.ParamByName('N14').Value := sLprFile1;
                          Parameters.ParamByName('N15').Value := sLprCarNo2;
                          Parameters.ParamByName('N16').Value := sLprFile2;
                          Parameters.ParamByName('N17').Value := sCardNo;
                          ExecSQL;
                        end;

                        if nSCRemain >= nDayBetween then
                        begin
                          DspProc(1, 1, MG_Right(IntToStr(nDayBetween) + '일남음', 12) + MG_Left(sCarNo, 12), sDspIP);
                          ExceptLogging('전광판문구' +MG_Right(IntToStr(nDayBetween) + '일남음', 12) + MG_Left(sCarNo, 12));
                        end
                        else
                        begin
                          DspProc(1, 1, 'APB위반차량 ' + MG_Left(sCarNo, 12), sDspIP);
                          ExceptLogging('전광판문구' +'APB위반차량 ' + MG_Left(sCarNo, 12));
                        end;

                        Result := '1' + Result + 'APB위반';
                        ExceptLogging('##### APB 위반 차량 #####');
                      end
                      else
                      begin
                        // 최종사용상태가 주차장 또는 APB위반 입차거부가 아니면 입차처리한다.
                        with qryRecvLpr2 do
                        begin
                          Close;
                          SQL.Clear;
                          SQL.Add('Update CustInfo Set LastParkNo = :N1, LastUnitNo = :N2, ');
                          SQL.Add('LastUseDate = :N3, LastUseTime = :N4, IOStatusNo = :N5, ');
                          SQL.Add('Status = :N6 where ParkNo = :N7 and TKType = :N8 and CarNo = :N9');
                          Parameters.ParamByName('N1').Value := nParkNo;
                          Parameters.ParamByName('N2').Value := nUnitNo;
                          Parameters.ParamByName('N3').Value := sLprDate;
                          Parameters.ParamByName('N4').Value := sLprTime;
                          Parameters.ParamByName('N5').Value := 1;
                          Parameters.ParamByName('N6').Value := 1;
                          Parameters.ParamByName('N7').Value := nParkNo;
                          Parameters.ParamByName('N8').Value := 2;
                          Parameters.ParamByName('N9').Value := sCarNo;
                          ExecSQL;

                          Close;
                          SQL.Clear;
                          SQL.Add('Insert Into IOSData (ParkNo, UnitNo, ProcDate, ProcTime, TKType, ');
                          SQL.Add('CarType, GroupNo, GroupName, CompName, DeptName, Name, InCarNo1, ');
                          SQL.Add('InIOStatusNo, InImage1, InCarNo2, InImage2, TKNo) ');
                          SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, :N12, ');
                          SQL.Add(':N13, :N14, :N15, :N16, :N17)');
                          Parameters.ParamByName('N1').Value := nParkNo;
                          Parameters.ParamByName('N2').Value := nUnitNo;
                          Parameters.ParamByName('N3').Value := sLprDate;
                          Parameters.ParamByName('N4').Value := sLprTime;
                          Parameters.ParamByName('N5').Value := 2;
                          Parameters.ParamByName('N6').Value := 2;
                          Parameters.ParamByName('N7').Value := nGroupNo;
                          Parameters.ParamByName('N8').Value := sGroupName;
                          Parameters.ParamByName('N9').Value := sCompName;
                          Parameters.ParamByName('N10').Value := sDeptName;
                          Parameters.ParamByName('N11').Value := sName;
                          Parameters.ParamByName('N12').Value := sLprCarNo1;
                          Parameters.ParamByName('N13').Value := 1;
                          Parameters.ParamByName('N14').Value := sLprFile1;
                          Parameters.ParamByName('N15').Value := sLprCarNo2;
                          Parameters.ParamByName('N16').Value := sLprFile2;
                          Parameters.ParamByName('N17').Value := sCardNo;
                          ExecSQL;
                        end;

                        if nGroupNo = 999 then
                        begin
                          DspProc(1, 1, MG_Center('VIP 차량', 12) + MG_Left(sCarNo, 12), sDspIP);
                          ExceptLogging('전광판문구' + MG_Center('VIP 차량', 12) + MG_Left(sCarNo, 12));
                        end
                        else
                        begin
                          if nSCRemain >= nDayBetween then
                          begin
                            DspProc(1, 1, MG_Right(IntToStr(nDayBetween) + '일남음', 12) + MG_Left(sCarNo, 12), sDspIP);
                            ExceptLogging('전광판문구' +MG_Right(IntToStr(nDayBetween) + '일남음', 12) + MG_Left(sCarNo, 12));
                          end
                          else
                          begin
                            DspProc(1, 1, MG_Left(sDspGroup, 12) + MG_Left(sCarNo, 12), sDspIP);
                            ExceptLogging('전광판문구' + MG_Left(sDspGroup, 12) + MG_Left(sCarNo, 12));
                          end;
                        end;

                        if bOpen then
                          InOpen(csLPR);

                        if bAlarm then
                          AlarmProc(sName, sCompName, sCarNo, sCarType);

                        Result := '1' + Result + '입 차';
                      end;
                    end
                    else if nAPB = 2 then
                    begin
                      // APB가 1회조정이면 APB를 자동으로 변경한다.
                      with qryRecvLpr2 do
                      begin
                        Close;
                        SQL.Clear;
                        SQL.Add('Update CustInfo Set LastParkNo = :N1, LastUnitNo = :N2, ');
                        SQL.Add('LastUseDate = :N3, LastUseTime = :N4, IOStatusNo = :N5, ');
                        SQL.Add('Status = :N6, APB = :N10 where ParkNo = :N7 and TKType = :N8 and CarNo = :N9');
                        Parameters.ParamByName('N1').Value := nParkNo;
                        Parameters.ParamByName('N2').Value := nUnitNo;
                        Parameters.ParamByName('N3').Value := sLprDate;
                        Parameters.ParamByName('N4').Value := sLprTime;
                        Parameters.ParamByName('N5').Value := 1;
                        Parameters.ParamByName('N6').Value := 1;
                        Parameters.ParamByName('N7').Value := nParkNo;
                        Parameters.ParamByName('N8').Value := 2;
                        Parameters.ParamByName('N9').Value := sCarNo;
                        Parameters.ParamByName('N10').Value := 1;
                        ExecSQL;

                        Close;
                        SQL.Clear;
                        SQL.Add('Insert Into IOSData (ParkNo, UnitNo, ProcDate, ProcTime, TKType, ');
                        SQL.Add('CarType, GroupNo, GroupName, CompName, DeptName, Name, InCarNo1, ');
                        SQL.Add('InIOStatusNo, InImage1, InCarNo2, InImage2, TKNo) ');
                        SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, :N12, ');
                        SQL.Add(':N13, :N14, :N15, :N16, :N17)');
                        Parameters.ParamByName('N1').Value := nParkNo;
                        Parameters.ParamByName('N2').Value := nUnitNo;
                        Parameters.ParamByName('N3').Value := sLprDate;
                        Parameters.ParamByName('N4').Value := sLprTime;
                        Parameters.ParamByName('N5').Value := 2;
                        Parameters.ParamByName('N6').Value := 2;
                        Parameters.ParamByName('N7').Value := nGroupNo;
                        Parameters.ParamByName('N8').Value := sGroupName;
                        Parameters.ParamByName('N9').Value := sCompName;
                        Parameters.ParamByName('N10').Value := sDeptName;
                        Parameters.ParamByName('N11').Value := sName;
                        Parameters.ParamByName('N12').Value := sLprCarNo1;
                        Parameters.ParamByName('N13').Value := 1;
                        Parameters.ParamByName('N14').Value := sLprFile1;
                        Parameters.ParamByName('N15').Value := sLprCarNo2;
                        Parameters.ParamByName('N16').Value := sLprFile2;
                        Parameters.ParamByName('N17').Value := sCardNo;
                        ExecSQL;
                      end;

                      if nGroupNo = 999 then
                      begin
                        DspProc(1, 1, MG_Center('VIP 차량', 12) + MG_Left(sCarNo, 12), sDspIP);
                        ExceptLogging('전광판문구' + MG_Center('VIP 차량', 12) + MG_Left(sCarNo, 12));
                      end
                      else
                      begin
                        if nSCRemain >= nDayBetween then
                        begin
                          DspProc(1, 1, MG_Right(IntToStr(nDayBetween) + '일남음', 12) + MG_Left(sCarNo, 12), sDspIP);
                          ExceptLogging('전광판문구' +MG_Right(IntToStr(nDayBetween) + '일남음', 12) + MG_Left(sCarNo, 12));
                        end
                        else
                        begin
                          DspProc(1, 1, MG_Left(sDspGroup, 12) + MG_Left(sCarNo, 12), sDspIP);
                          ExceptLogging('전광판문구' + MG_Left(sDspGroup, 12) + MG_Left(sCarNo, 12));
                        end;
                      end;

                      if bOpen then
                        InOpen(csLPR);

                      if bAlarm then
                        AlarmProc(sName, sCompName, sCarNo, sCarType);

                      Result := '1' + Result + '입 차';
                    end
                    else if nAPB = 3 then
                    begin
                      // APB사용안함이면 입차처리한다.
                      with qryRecvLpr2 do
                      begin
                        Close;
                        SQL.Clear;
                        SQL.Add('Update CustInfo Set LastParkNo = :N1, LastUnitNo = :N2, ');
                        SQL.Add('LastUseDate = :N3, LastUseTime = :N4, IOStatusNo = :N5, ');
                        SQL.Add('Status = :N6 where ParkNo = :N7 and TKType = :N8 and CarNo = :N9');
                        Parameters.ParamByName('N1').Value := nParkNo;
                        Parameters.ParamByName('N2').Value := nUnitNo;
                        Parameters.ParamByName('N3').Value := sLprDate;
                        Parameters.ParamByName('N4').Value := sLprTime;
                        Parameters.ParamByName('N5').Value := 1;
                        Parameters.ParamByName('N6').Value := 1;
                        Parameters.ParamByName('N7').Value := nParkNo;
                        Parameters.ParamByName('N8').Value := 2;
                        Parameters.ParamByName('N9').Value := sCarNo;
                        ExecSQL;

                        Close;
                        SQL.Clear;
                        SQL.Add('Insert Into IOSData (ParkNo, UnitNo, ProcDate, ProcTime, TKType, ');
                        SQL.Add('CarType, GroupNo, GroupName, CompName, DeptName, Name, InCarNo1, ');
                        SQL.Add('InIOStatusNo, InImage1, InCarNo2, InImage2, TKNo) ');
                        SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, :N12, ');
                        SQL.Add(':N13, :N14, :N15, :N16, :N17)');
                        Parameters.ParamByName('N1').Value := nParkNo;
                        Parameters.ParamByName('N2').Value := nUnitNo;
                        Parameters.ParamByName('N3').Value := sLprDate;
                        Parameters.ParamByName('N4').Value := sLprTime;
                        Parameters.ParamByName('N5').Value := 2;
                        Parameters.ParamByName('N6').Value := 2;
                        Parameters.ParamByName('N7').Value := nGroupNo;
                        Parameters.ParamByName('N8').Value := sGroupName;
                        Parameters.ParamByName('N9').Value := sCompName;
                        Parameters.ParamByName('N10').Value := sDeptName;
                        Parameters.ParamByName('N11').Value := sName;
                        Parameters.ParamByName('N12').Value := sLprCarNo1;
                        Parameters.ParamByName('N13').Value := 1;
                        Parameters.ParamByName('N14').Value := sLprFile1;
                        Parameters.ParamByName('N15').Value := sLprCarNo2;
                        Parameters.ParamByName('N16').Value := sLprFile2;
                        Parameters.ParamByName('N17').Value := sCardNo;
                        ExecSQL;
                      end;

                      if nGroupNo = 999 then
                      begin
                        DspProc(1, 1, MG_Center('VIP 차량', 12) + MG_Left(sCarNo, 12), sDspIP);
                        ExceptLogging('전광판문구' + MG_Center('VIP 차량', 12) + MG_Left(sCarNo, 12));
                      end
                      else
                      begin
                        if nSCRemain >= nDayBetween then
                        begin
                          DspProc(1, 1, MG_Right(IntToStr(nDayBetween) + '일남음', 12) + MG_Left(sCarNo, 12), sDspIP);
                          ExceptLogging('전광판문구' +MG_Right(IntToStr(nDayBetween) + '일남음', 12) + MG_Left(sCarNo, 12));
                        end
                        else
                        begin
                          DspProc(1, 1, MG_Left(sDspGroup, 12) + MG_Left(sCarNo, 12), sDspIP);
                          ExceptLogging('전광판문구' + MG_Left(sDspGroup, 12) + MG_Left(sCarNo, 12));
                        end;
                      end;

                      if bOpen then
                        InOpen(csLPR);

                      if bAlarm then
                        AlarmProc(sName, sCompName, sCarNo, sCarType);

                      Result := '1' + Result + '입 차';
                    end;
                  end;

                3, 4:
                  begin // 전체봉쇄, 입차봉쇄
                    with qryRecvLpr2 do
                    begin
                      Close;
                      SQL.Clear;
                      SQL.Add('Update CustInfo Set LastParkNo = :N1, LastUnitNo = :N2, ');
                      SQL.Add('LastUseDate = :N3, LastUseTime = :N4, IOStatusNo = :N5 ');
                      SQL.Add('where ParkNo = :N6 and TKType = :N7 and CarNo = :N8');
                      Parameters.ParamByName('N1').Value := nParkNo;
                      Parameters.ParamByName('N2').Value := nUnitNo;
                      Parameters.ParamByName('N3').Value := sLprDate;
                      Parameters.ParamByName('N4').Value := sLprTime;
                      Parameters.ParamByName('N5').Value := 9;
                      Parameters.ParamByName('N6').Value := nParkNo;
                      Parameters.ParamByName('N7').Value := 2;
                      Parameters.ParamByName('N8').Value := sCarNo;
                      ExecSQL;

                      Close;
                      SQL.Clear;
                      SQL.Add('Insert Into IOSData (ParkNo, UnitNo, ProcDate, ProcTime, TKType, ');
                      SQL.Add('CarType, GroupNo, GroupName, CompName, DeptName, Name, InCarNo1, ');
                      SQL.Add('InIOStatusNo, InImage1, InCarNo2, InImage2, TKNo) ');
                      SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, :N12, ');
                      SQL.Add(':N13, :N14, :N15, :N16, :N17)');
                      Parameters.ParamByName('N1').Value := nParkNo;
                      Parameters.ParamByName('N2').Value := nUnitNo;
                      Parameters.ParamByName('N3').Value := sLprDate;
                      Parameters.ParamByName('N4').Value := sLprTime;
                      Parameters.ParamByName('N5').Value := 2;
                      Parameters.ParamByName('N6').Value := 2;
                      Parameters.ParamByName('N7').Value := nGroupNo;
                      Parameters.ParamByName('N8').Value := sGroupName;
                      Parameters.ParamByName('N9').Value := sCompName;
                      Parameters.ParamByName('N10').Value := sDeptName;
                      Parameters.ParamByName('N11').Value := sName;
                      Parameters.ParamByName('N12').Value := sLprCarNo1;
                      Parameters.ParamByName('N13').Value := 9;
                      Parameters.ParamByName('N14').Value := sLprFile1;
                      Parameters.ParamByName('N15').Value := sLprCarNo2;
                      Parameters.ParamByName('N16').Value := sLprFile2;
                      Parameters.ParamByName('N17').Value := sCardNo;
                      ExecSQL;
                    end;
                    if nGroupNo = 999 then
                    begin
                      DspProc(1, 1, MG_Center('VIP 차량', 12) + MG_Left(sCarNo, 12), sDspIP);
                      ExceptLogging('전광판문구' + MG_Center('VIP 차량', 12) + MG_Left(sCarNo, 12));
                    end
                    else
                    begin
                      if nSCRemain >= nDayBetween then
                      begin
                        DspProc(1, 1, MG_Right(IntToStr(nDayBetween) + '일남음', 12) + MG_Left(sCarNo, 12), sDspIP);
                        ExceptLogging('전광판문구' + MG_Right(IntToStr(nDayBetween) + '일남음', 12) + MG_Left(sCarNo, 12));
                      end
                      else
                      begin
                        DspProc(1, 1, '봉쇄차량    ' + MG_Left(sCarNo, 12), sDspIP);
                        ExceptLogging('전광판문구' + '봉쇄차량    ' + MG_Left(sCarNo, 12));
                      end;
                    end;

                    Result := '1' + Result + '봉쇄차량';
                    ExceptLogging('##### 전체 또는 입차봉쇄 카드 #####');
                  end;
              end;
            end
            else
            begin
              with qryRecvLpr2 do
              begin
                Close;
                SQL.Clear;
                SQL.Add('Update CustInfo Set LastParkNo = :N1, LastUnitNo = :N2, ');
                SQL.Add('LastUseDate = :N3, LastUseTime = :N4, IOStatusNo = :N5 ');
                SQL.Add('where ParkNo = :N7 and TKType = :N8 and CarNo = :N9');
                Parameters.ParamByName('N1').Value := nParkNo;
                Parameters.ParamByName('N2').Value := nUnitNo;
                Parameters.ParamByName('N3').Value := sLprDate;
                Parameters.ParamByName('N4').Value := sLprTime;
                Parameters.ParamByName('N5').Value := 18;
                Parameters.ParamByName('N7').Value := nParkNo;
                Parameters.ParamByName('N8').Value := 2;
                Parameters.ParamByName('N9').Value := sCarNo;
                ExecSQL;

                Close;
                SQL.Clear;
                SQL.Add('Insert Into IOSData (ParkNo, UnitNo, ProcDate, ProcTime, TKType, ');
                SQL.Add('CarType, GroupNo, GroupName, CompName, DeptName, Name, InCarNo1, ');
                SQL.Add('InIOStatusNo, InImage1, InCarNo2, InImage2, TKNo) ');
                SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, :N12, ');
                SQL.Add(':N13, :N14, :N15, :N16, :N17)');
                Parameters.ParamByName('N1').Value := nParkNo;
                Parameters.ParamByName('N2').Value := nUnitNo;
                Parameters.ParamByName('N3').Value := sLprDate;
                Parameters.ParamByName('N4').Value := sLprTime;
                Parameters.ParamByName('N5').Value := 2;
                Parameters.ParamByName('N6').Value := 2;
                Parameters.ParamByName('N7').Value := nGroupNo;
                Parameters.ParamByName('N8').Value := sGroupName;
                Parameters.ParamByName('N9').Value := sCompName;
                Parameters.ParamByName('N10').Value := sDeptName;
                Parameters.ParamByName('N11').Value := sName;
                Parameters.ParamByName('N12').Value := sLprCarNo1;
                Parameters.ParamByName('N13').Value := 5;
                Parameters.ParamByName('N14').Value := sLprFile1;
                Parameters.ParamByName('N15').Value := sLprCarNo2;
                Parameters.ParamByName('N16').Value := sLprFile2;
                Parameters.ParamByName('N17').Value := sCardNo;
                ExecSQL;
              end;
              if nGroupNo = 999 then
              begin
                DspProc(1, 1, MG_Center('VIP 차량', 12) + MG_Left(sCarNo, 12), sDspIP);
                ExceptLogging('전광판문구' + MG_Center('VIP 차량', 12) + MG_Left(sCarNo, 12));
              end
              else
              begin
                if nSCRemain >= nDayBetween then
                begin
                  DspProc(1, 1, MG_Right(IntToStr(nDayBetween) + '일남음', 12) + MG_Left(sCarNo, 12), sDspIP);
                  ExceptLogging('전광판문구' + MG_Right(IntToStr(nDayBetween) + '일남음', 12) + MG_Left(sCarNo, 12));
                end
                else
                begin
                  DspProc(1, 1, '사용시간위반' + MG_Left(sCarNo, 12), sDspIP);
                  ExceptLogging('전광판문구' + '사용시간위반' + MG_Left(sCarNo, 12));
                end;
              end;

              Result := '1' + Result + 'WP위반';
              ExceptLogging('##### 사용시간대(WP) 위반 #####');
            end;
          end
          else if nInOut = 2 then // 출구용
          begin
            sTemp := Copy(sLprFile1, 6, Length(sLprFile1) - 5);
            sLprFile1 := Copy(sTemp, 1, Pos(':9080', sTemp) - 1);
            sLprFile1 := sLprFile1 + Copy(sTemp, Pos(':9080', sTemp) + 5, Length(sTemp) - (Pos(':9080', sTemp) + 4));
            sLprFile1 := MG_StrConvert(sLprFile1, '/', '\');
            lbOutCarType.Caption := '정기차량';
            lbOutCarNo.Caption := sCarNo;
            sFileIP:= Copy(sLprFile1, 3, Pos('\MSImage', sLprFile1)-3);

            try
              if is_ping(sFileIP) then
              begin
                if FileExists(sLprFile1) then
                begin
                  imgOut.Picture.LoadFromFile(sLprFile1);
                end
                else
                begin
                  imgOut.Picture.Assign(Nil);
                  ExceptLogging('File 없음: ' + sLprFile1);
                end;
              end
              else
              begin
                imgOut.Picture.Assign(Nil);
                ExceptLogging('File 없음: ' + sLprFile1);
              end;
            except
              on E: Exception do
                ExceptLogging('이미지 로드 에러: ' + aString(E.Message));
            end;

            if ((nSYoil <= DayOfWeek(Now)) and (nEYoil >= DayOfWeek(Now)) and
                (sSTime <= FormatDateTime('HH:NN', Now)) and
                (sETime >= FormatDateTime('HH:NN', Now))) then
            begin
              Case nStatus of
                0:
                  begin // 발매
                    with qryRecvLpr2 do
                    begin
                      Close;
                      SQL.Clear;
                      SQL.Add('Update CustInfo Set LastParkNo = :N1, LastUnitNo = :N2, ');
                      SQL.Add('LastUseDate = :N3, LastUseTime = :N4, IOStatusNo = :N5, Status = :N6 ');

                      // APB가 "1회조정(2)" 이면 APB를 "자동(1)"으로 변경한다.
                      if nAPB = 2 then
                        SQL.Add(', APB = :N10 ');

                      SQL.Add('where ParkNo = :N7 and TKType = :N8 and CarNo = :N9');
                      Parameters.ParamByName('N1').Value := nParkNo;
                      Parameters.ParamByName('N2').Value := nUnitNo;
                      Parameters.ParamByName('N3').Value := sLprDate;
                      Parameters.ParamByName('N4').Value := sLprTime;
                      Parameters.ParamByName('N5').Value := 2;
                      Parameters.ParamByName('N6').Value := 1;
                      Parameters.ParamByName('N7').Value := nParkNo;
                      Parameters.ParamByName('N8').Value := 2;
                      Parameters.ParamByName('N9').Value := sCarNo;

                      if nAPB = 2 then
                        Parameters.ParamByName('N10').Value := 1;
                      ExecSQL;

                      Close;
                      SQL.Clear;
                      SQL.Add('Insert Into IOSData (ParkNo, UnitNo, ProcDate, ProcTime, TKType, ');
                      SQL.Add('CarType, GroupNo, GroupName, CompName, DeptName, Name, InCarNo1, ');
                      SQL.Add('InIOStatusNo, InImage1, OutUnitNo, OutDate, OutTime, OutImage1, ');
                      SQL.Add('OutCarNo1, OutIOStatusNo, OutImage2, OutCarNo2, TKNo) ');
                      SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, ');
                      SQL.Add(':N12, :N13, :N14, :N15, :N16, :N17, :N18, :N19, :N20, :N21, :N22, :N23)');
                      Parameters.ParamByName('N1').Value := nParkNo;
                      Parameters.ParamByName('N2').Value := nUnitNo;
                      Parameters.ParamByName('N3').Value := sLprDate;
                      Parameters.ParamByName('N4').Value := sLprTime;
                      Parameters.ParamByName('N5').Value := 2;
                      Parameters.ParamByName('N6').Value := 2;
                      Parameters.ParamByName('N7').Value := nGroupNo;
                      Parameters.ParamByName('N8').Value := sGroupName;
                      Parameters.ParamByName('N9').Value := sCompName;
                      Parameters.ParamByName('N10').Value := sDeptName;
                      Parameters.ParamByName('N11').Value := sName;
                      Parameters.ParamByName('N12').Value := sCarNo;
                      Parameters.ParamByName('N13').Value := 1;
                      Parameters.ParamByName('N14').Value := '';
                      Parameters.ParamByName('N15').Value := nUnitNo;
                      Parameters.ParamByName('N16').Value := sLprDate;
                      Parameters.ParamByName('N17').Value := sLprTime;
                      Parameters.ParamByName('N18').Value := sLprFile1;
                      Parameters.ParamByName('N19').Value := sLprCarNo1;
                      Parameters.ParamByName('N20').Value := 2;
                      Parameters.ParamByName('N21').Value := sLprFile2;
                      Parameters.ParamByName('N22').Value := sLprCarNo2;
                      Parameters.ParamByName('N23').Value := sCardNo;
                      ExecSQL;
                    end;
                    Result := '2' + Result + '출 차';

                    if nGroupNo = 999 then
                    begin
                      DspProc(2, 1, MG_Center('VIP 차량', 12) + MG_Left(sCarNo, 12), sDspIP);
                      ExceptLogging('전광판문구' + MG_Center('VIP 차량', 12) + MG_Left(sCarNo, 12));
                    end
                    else
                    begin
                      if nSCRemain >= nDayBetween then
                      begin
                        DspProc(2, 1, MG_Right(IntToStr(nDayBetween) + '일남음', 12) + MG_Left(sCarNo, 12), sDspIP);
                        ExceptLogging('전광판문구' + MG_Right(IntToStr(nDayBetween) + '일남음', 12) + MG_Left(sCarNo, 12));
                      end
                      else
                      begin
                        //DspProc(2, 1, '정기등록차량' + MG_Left(sCarNo, 12), sDspIP);
                        DspProc(2, 1, MG_Left(sDspGroup, 12) + MG_Left(sCarNo, 12), sDspIP);
                        ExceptLogging('전광판문구' + MG_Left(sDspGroup, 12) + MG_Left(sCarNo, 12));
                      end;
                    end;

                    OutOpen(csLPR);
                  end;

                1, 4:
                  begin // 사용중, 입차봉쇄
                    if nAPB = 1 then // 자동
                    begin
                      if (nLastStatus = 2) or (nLastStatus = 9) then
                      // 외부, APB위반 출차거부
                      begin
                        with qryRecvLpr2 do
                        begin
                          Close;
                          SQL.Clear;
                          SQL.Add('Update CustInfo Set LastParkNo = :N1, LastUnitNo = :N2, ');
                          SQL.Add('LastUseDate = :N3, LastUseTime = :N4, IOStatusNo = :N5, ');
                          SQL.Add('Status = :N6 where ParkNo = :N7 and TKType = :N8 and CarNo = :N9');
                          Parameters.ParamByName('N1').Value := nParkNo;
                          Parameters.ParamByName('N2').Value := nUnitNo;
                          Parameters.ParamByName('N3').Value := sLprDate;
                          Parameters.ParamByName('N4').Value := sLprTime;
                          Parameters.ParamByName('N5').Value := 8;
                          Parameters.ParamByName('N6').Value := 1;
                          Parameters.ParamByName('N7').Value := nParkNo;
                          Parameters.ParamByName('N8').Value := 2;
                          Parameters.ParamByName('N9').Value := sCarNo;
                          ExecSQL;

                          Close;
                          SQL.Clear;
                          SQL.Add('Select * from IOSData where ((InCarNo1 = :N1) or (InCarNo2 = :N2)) ');
                          SQL.Add('Order By ProcDate Desc, ProcTime Desc');
                          Parameters.ParamByName('N1').Value := sCarNo;
                          Parameters.ParamByName('N2').Value := sCarNo;
                          Open;

                          if RecordCount > 0 then
                          begin
                            First;

                            if FieldByName('OutDate').AsString = '' then
                            begin
                              // 최종입차후 출차되지 않은 자료가 있다. 이때는 출차일시 자료를 Update한다.
                              sSCInDate := FieldByName('ProcDate').AsString;
                              sSCInTime := FieldByName('ProcTime').AsString;
                              nLastUnitNo := FieldByName('UnitNo').AsInteger;
                              sInFile := FieldByName('InImage1').AsString;

                              Close;
                              SQL.Clear;
                              SQL.Add('Update IOSData Set OutUnitNo = :N1, OutDate = :N2, OutTime = :N3, ');
                              SQL.Add('OutIOStatusNo = :N4, OutImage1 = :N5, OutCarNo1 = :N6, OutImage2 = :N12, OutCarNo2 = :N13 ');
                              SQL.Add('where ((InCarNo1 = :N7) or (InCarNo2 = :N11)) and ');
                              SQL.Add('ProcDate = :N8 and ProcTime = :N9 and UnitNo = :N10');
                              Parameters.ParamByName('N1').Value := nUnitNo;
                              Parameters.ParamByName('N2').Value := sLprDate;
                              Parameters.ParamByName('N3').Value := sLprTime;
                              Parameters.ParamByName('N4').Value := 8;
                              Parameters.ParamByName('N5').Value := sLprFile1;
                              Parameters.ParamByName('N6').Value := sLprCarNo1;
                              Parameters.ParamByName('N7').Value := sCarNo;
                              Parameters.ParamByName('N8').Value := sSCInDate;
                              Parameters.ParamByName('N9').Value := sSCInTime;
                              Parameters.ParamByName('N10').Value := nLastUnitNo;
                              Parameters.ParamByName('N11').Value := sCarNo;
                              Parameters.ParamByName('N12').Value := sLprFile2;
                              Parameters.ParamByName('N13').Value := sLprCarNo2;
                              ExecSQL;

                              sTemp := Copy(sInFile, 6, Length(sInFile) - 5);
                              sInFile := Copy(sTemp, 1, Pos(':9080', sTemp) - 1);
                              sInFile := sInFile + Copy(sTemp, Pos(':9080', sTemp) + 5, Length(sTemp) - (Pos(':9080', sTemp) + 4));
                              sInFile := MG_StrConvert(sInFile, '/', '\');
                              ExceptLogging('File: ' + sInFile);
                              sFileIP:= Copy(sInFile, 3, Pos('\MSImage', sInFile)-3);

// 2015-10-28 배은화 수정
// 출차할때 입차이미지 로드시 지연되는 현상으로 인해 로직 제거
//                              try
//                                if is_ping(sFileIP) then
//                                begin
//                                  if FileExists(sInFile) then
//                                  begin
//                                    imgIn.Picture.LoadFromFile(sInFile);
//                                  end
//                                  else
//                                  begin
//                                    imgIn.Picture.Assign(Nil);
//                                    ExceptLogging('File 없음: ' + sInFile);
//                                  end;
//                                end
//                                else
//                                begin
//                                  imgIn.Picture.Assign(Nil);
//                                  ExceptLogging('File 없음: ' + sInFile);
//                                end;
//                              except
//                                on E: Exception do
//                                  ExceptLogging('File Load: (' + sInFile + ') ' + aString(E.Message));
//                              end;
                            end
                            else
                            begin
                              // 최종입차된 자료가 없다.  이때는 출차자료를 입차자료와 동일하게 Insert한다.
                              Close;
                              SQL.Clear;
                              SQL.Add('Insert Into IOSData (ParkNo, UnitNo, ProcDate, ProcTime, TKType, ');
                              SQL.Add('CarType, GroupNo, GroupName, CompName, DeptName, Name, InCarNo1, ');
                              SQL.Add('InIOStatusNo, InImage1, OutUnitNo, OutDate, OutTime, OutImage1, ');
                              SQL.Add('OutCarNo1, OutIOStatusNo, OutImage2, OutCarNo2, TKNo) ');
                              SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, ');
                              SQL.Add(':N12, :N13, :N14, :N15, :N16, :N17, :N18, :N19, :N20, :N21, :N22, :N23)');
                              Parameters.ParamByName('N1').Value := nParkNo;
                              Parameters.ParamByName('N2').Value := nUnitNo;
                              Parameters.ParamByName('N3').Value := sLprDate;
                              Parameters.ParamByName('N4').Value := sLprTime;
                              Parameters.ParamByName('N5').Value := 2;
                              Parameters.ParamByName('N6').Value := 2;
                              Parameters.ParamByName('N7').Value := nGroupNo;
                              Parameters.ParamByName('N8').Value := sGroupName;
                              Parameters.ParamByName('N9').Value := sCompName;
                              Parameters.ParamByName('N10').Value := sDeptName;
                              Parameters.ParamByName('N11').Value := sName;
                              Parameters.ParamByName('N12').Value := sCarNo;
                              Parameters.ParamByName('N13').Value := 8;
                              Parameters.ParamByName('N14').Value := '';
                              Parameters.ParamByName('N15').Value := nUnitNo;
                              Parameters.ParamByName('N16').Value := sLprDate;
                              Parameters.ParamByName('N17').Value := sLprTime;
                              Parameters.ParamByName('N18').Value := sLprFile1;
                              Parameters.ParamByName('N19').Value := sLprCarNo1;
                              Parameters.ParamByName('N20').Value := 8;
                              Parameters.ParamByName('N21').Value := sLprFile2;
                              Parameters.ParamByName('N22').Value := sLprCarNo2;
                              Parameters.ParamByName('N23').Value := sCardNo;
                              ExecSQL;
                            end;
                          end;
                        end;
                        Result := '2' + Result + 'APB위반';

                        if nGroupNo = 999 then
                        begin
                          DspProc(2, 1, MG_Center('VIP 차량', 12) + MG_Left(sCarNo, 12), sDspIP);
                          ExceptLogging('전광판문구' + MG_Center('VIP 차량', 12) + MG_Left(sCarNo, 12));
                        end
                        else
                        begin
                          if nSCRemain >= nDayBetween then
                          begin
                            DspProc(2, 1, MG_Right(IntToStr(nDayBetween) + '일남음', 12) + MG_Left(sCarNo, 12), sDspIP);
                          end
                          else
                          begin
                            DspProc(2, 1, 'APB위반차량 ' + MG_Left(sCarNo, 12), sDspIP);
                          end;
                        end;
                      end
                      else
                      begin
                        with qryRecvLpr2 do
                        begin
                          Close;
                          SQL.Clear;
                          SQL.Add('Update CustInfo Set LastParkNo = :N1, LastUnitNo = :N2, ');
                          SQL.Add('LastUseDate = :N3, LastUseTime = :N4, IOStatusNo = :N5, ');
                          SQL.Add('Status = :N6 where ParkNo = :N7 and TKType = :N8 and CarNo = :N9');
                          Parameters.ParamByName('N1').Value := nParkNo;
                          Parameters.ParamByName('N2').Value := nUnitNo;
                          Parameters.ParamByName('N3').Value := sLprDate;
                          Parameters.ParamByName('N4').Value := sLprTime;
                          Parameters.ParamByName('N5').Value := 2;
                          Parameters.ParamByName('N6').Value := 1;
                          Parameters.ParamByName('N7').Value := nParkNo;
                          Parameters.ParamByName('N8').Value := 2;
                          Parameters.ParamByName('N9').Value := sCarNo;
                          ExecSQL;

                          Close;
                          SQL.Clear;
                          SQL.Add('Select * from IOSData where ((InCarNo1 = :N1) or (InCarNo2 = :N2)) ');
                          SQL.Add('Order By ProcDate Desc, ProcTime Desc');
                          Parameters.ParamByName('N1').Value := sCarNo;
                          Parameters.ParamByName('N2').Value := sCarNo;
                          Open;

                          if RecordCount > 0 then
                          begin
                            First;

                            if FieldByName('OutDate').AsString = '' then
                            begin
                              // 최종입차후 출차되지 않은 자료가 있다. 이때는 출차일시 자료를 Update한다.
                              sSCInDate := FieldByName('ProcDate').AsString;
                              sSCInTime := FieldByName('ProcTime').AsString;
                              nLastUnitNo := FieldByName('UnitNo').AsInteger;
                              sInFile := FieldByName('InImage1').AsString;

                              Close;
                              SQL.Clear;
                              SQL.Add('Update IOSData Set OutUnitNo = :N1, OutDate = :N2, OutTime = :N3, ');
                              SQL.Add('OutIOStatusNo = :N4, OutImage1 = :N5, OutCarNo1 = :N6, OutImage2 = :12, OutCarNo2 = :N13 ');
                              SQL.Add('where ((InCarNo1 = :N7) or (InCarNo2 = :N11)) and ');
                              SQL.Add('ProcDate = :N8 and ProcTime = :N9 and UnitNo = :N10');
                              Parameters.ParamByName('N1').Value := nUnitNo;
                              Parameters.ParamByName('N2').Value := sLprDate;
                              Parameters.ParamByName('N3').Value := sLprTime;
                              Parameters.ParamByName('N4').Value := 2;
                              Parameters.ParamByName('N5').Value := sLprFile1;
                              Parameters.ParamByName('N6').Value := sLprCarNo1;
                              Parameters.ParamByName('N7').Value := sCarNo;
                              Parameters.ParamByName('N8').Value := sSCInDate;
                              Parameters.ParamByName('N9').Value := sSCInTime;
                              Parameters.ParamByName('N10').Value := nLastUnitNo;
                              Parameters.ParamByName('N11').Value := sCarNo;
                              Parameters.ParamByName('N12').Value := sLprFile2;
                              Parameters.ParamByName('N13').Value := sLprCarNo2;
                              ExecSQL;

                              sTemp := Copy(sInFile, 6, Length(sInFile) - 5);
                              sInFile := Copy(sTemp, 1, Pos(':9080', sTemp) - 1);
                              sInFile := sInFile + Copy(sTemp, Pos(':9080', sTemp) + 5, Length(sTemp) - (Pos(':9080', sTemp) + 4));
                              sInFile := MG_StrConvert(sInFile, '/', '\');
                              ExceptLogging('File: ' + sInFile);
                              sFileIP:= Copy(sInFile, 3, Pos('\MSImage', sInFile)-3);
// 2015-10-28 배은화 수정
// 출차할때 입차이미지 로드시 지연되는 현상으로 인해 로직 제거
//                              try
//                                if is_ping(sFileIP) then
//                                begin
//                                  if FileExists(sInFile) then
//                                  begin
//                                    imgIn.Picture.LoadFromFile(sInFile);
//                                  end
//                                  else
//                                  begin
//                                    imgIn.Picture.Assign(Nil);
//                                    ExceptLogging('File 없음: ' + sInFile);
//                                  end;
//                                end
//                                else
//                                begin
//                                  imgIn.Picture.Assign(Nil);
//                                  ExceptLogging('File 없음: ' + sInFile);
//                                end;
//                              except
//                                on E: Exception do
//                                  ExceptLogging('File Load: (' + sInFile + ') ' + aString(E.Message));
//                              end;
                            end
                            else
                            begin
                              // 최종입차된 자료가 없다.  이때는 출차자료를 입차자료와 동일하게 Insert한다.
                              Close;
                              SQL.Clear;
                              SQL.Add('Insert Into IOSData (ParkNo, UnitNo, ProcDate, ProcTime, TKType, ');
                              SQL.Add('CarType, GroupNo, GroupName, CompName, DeptName, Name, InCarNo1, ');
                              SQL.Add('InIOStatusNo, InImage1, OutUnitNo, OutDate, OutTime, OutImage1, ');
                              SQL.Add('OutCarNo1, OutIOStatusNo, OutImage2, OutCarNo2, TKNo) ');
                              SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, ');
                              SQL.Add(':N12, :N13, :N14, :N15, :N16, :N17, :N18, :N19, :N20, :N21, :N22, :N23)');
                              Parameters.ParamByName('N1').Value := nParkNo;
                              Parameters.ParamByName('N2').Value := nUnitNo;
                              Parameters.ParamByName('N3').Value := sLprDate;
                              Parameters.ParamByName('N4').Value := sLprTime;
                              Parameters.ParamByName('N5').Value := 2;
                              Parameters.ParamByName('N6').Value := 2;
                              Parameters.ParamByName('N7').Value := nGroupNo;
                              Parameters.ParamByName('N8').Value := sGroupName;
                              Parameters.ParamByName('N9').Value := sCompName;
                              Parameters.ParamByName('N10').Value := sDeptName;
                              Parameters.ParamByName('N11').Value := sName;
                              Parameters.ParamByName('N12').Value := sCarNo;
                              Parameters.ParamByName('N13').Value := 1;
                              Parameters.ParamByName('N14').Value := '';
                              Parameters.ParamByName('N15').Value := nUnitNo;
                              Parameters.ParamByName('N16').Value := sLprDate;
                              Parameters.ParamByName('N17').Value := sLprTime;
                              Parameters.ParamByName('N18').Value := sLprFile1;
                              Parameters.ParamByName('N19').Value := sLprCarNo1;
                              Parameters.ParamByName('N20').Value := 2;
                              Parameters.ParamByName('N21').Value := sLprFile2;
                              Parameters.ParamByName('N22').Value := sLprCarNo2;
                              Parameters.ParamByName('N23').Value := sCardNo;
                              ExecSQL;
                            end;
                          end;
                        end;
                        Result := '2' + Result + '출 차';
                        if nGroupNo = 999 then
                        begin
                          DspProc(2, 1, MG_Center('VIP 차량', 12) + MG_Left(sCarNo, 12), sDspIP);
                          ExceptLogging('전광판문구' + MG_Center('VIP 차량', 12) + MG_Left(sCarNo, 12));
                        end
                        else
                        begin
                          if nSCRemain >= nDayBetween then
                          begin
                            DspProc(2, 1, MG_Right(IntToStr(nDayBetween) + '일남음', 12) + MG_Left(sCarNo, 12), sDspIP);
                            ExceptLogging('전광판문구' + MG_Right(IntToStr(nDayBetween) + '일남음', 12) + MG_Left(sCarNo, 12));
                          end
                          else
                          begin
                            //DspProc(2, 1, '정기등록차량' + MG_Left(sCarNo, 12), sDspIP);
                            DspProc(2, 1, MG_Left(sDspGroup, 12) + MG_Left(sCarNo, 12), sDspIP);
                            ExceptLogging('전광판문구' + MG_Left(sDspGroup, 12) + MG_Left(sCarNo, 12));
                          end;
                        end;

                        OutOpen(csLPR);
                      end
                    end
                    else if nAPB = 2 then // 1회조정
                    begin
                      with qryRecvLpr2 do
                      begin
                        Close;
                        SQL.Clear;
                        SQL.Add('Update CustInfo Set LastParkNo = :N1, LastUnitNo = :N2, ');
                        SQL.Add('LastUseDate = :N3, LastUseTime = :N4, IOStatusNo = :N5, Status = :N6 ');
                        SQL.Add('APB = :N10 where ParkNo = :N7 and TKType = :N8 and CarNo = :N9');
                        Parameters.ParamByName('N1').Value := nParkNo;
                        Parameters.ParamByName('N2').Value := nUnitNo;
                        Parameters.ParamByName('N3').Value := sLprDate;
                        Parameters.ParamByName('N4').Value := sLprTime;
                        Parameters.ParamByName('N5').Value := 2;
                        Parameters.ParamByName('N6').Value := 1;
                        Parameters.ParamByName('N7').Value := nParkNo;
                        Parameters.ParamByName('N8').Value := 2;
                        Parameters.ParamByName('N9').Value := sCarNo;
                        Parameters.ParamByName('N10').Value := 1;
                        ExecSQL;

                        Close;
                        SQL.Clear;
                        SQL.Add('Select * from IOSData where ((InCarNo1 = :N1) or (InCarNo2 = :N2)) ');
                        SQL.Add('Order By ProcDate Desc, ProcTime Desc');
                        Parameters.ParamByName('N1').Value := sCarNo;
                        Parameters.ParamByName('N2').Value := sCarNo;
                        Open;

                        if RecordCount > 0 then
                        begin
                          First;

                          if FieldByName('OutDate').AsString = '' then
                          begin
                            // 최종입차후 출차되지 않은 자료가 있다. 이때는 출차일시 자료를 Update한다.
                            sSCInDate := FieldByName('ProcDate').AsString;
                            sSCInTime := FieldByName('ProcTime').AsString;
                            nLastUnitNo := FieldByName('UnitNo').AsInteger;
                            sInFile := FieldByName('InImage1').AsString;

                            Close;
                            SQL.Clear;
                            SQL.Add('Update IOSData Set OutUnitNo = :N1, OutDate = :N2, OutTime = :N3, ');
                            SQL.Add('OutIOStatusNo = :N4, OutImage1 = :N5, OutCarNo1 = :N6, OutImage2 = :N12, OutCarNo2 = :N13 ');
                            SQL.Add('where ((InCarNo1 = :N7) or (InCarNo2 = :N11)) and ');
                            SQL.Add('ProcDate = :N8 and ProcTime = :N9 and UnitNo = :N10');
                            Parameters.ParamByName('N1').Value := nUnitNo;
                            Parameters.ParamByName('N2').Value := sLprDate;
                            Parameters.ParamByName('N3').Value := sLprTime;
                            Parameters.ParamByName('N4').Value := 2;
                            Parameters.ParamByName('N5').Value := sLprFile1;
                            Parameters.ParamByName('N6').Value := sLprCarNo1;
                            Parameters.ParamByName('N7').Value := sCarNo;
                            Parameters.ParamByName('N8').Value := sSCInDate;
                            Parameters.ParamByName('N9').Value := sSCInTime;
                            Parameters.ParamByName('N10').Value := nLastUnitNo;
                            Parameters.ParamByName('N11').Value := sCarNo;
                            Parameters.ParamByName('N12').Value := sLprFile2;
                            Parameters.ParamByName('N13').Value := sLprCarNo2;
                            ExecSQL;

                            sTemp := Copy(sInFile, 6, Length(sInFile) - 5);
                            sInFile := Copy(sTemp, 1, Pos(':9080', sTemp) - 1);
                            sInFile := sInFile + Copy(sTemp, Pos(':9080', sTemp) + 5, Length(sTemp) - (Pos(':9080', sTemp) + 4));
                            sInFile := MG_StrConvert(sInFile, '/', '\');
                            ExceptLogging('File: ' + sInFile);
                            sFileIP:= Copy(sInFile, 3, Pos('\MSImage', sInFile)-3);
// 2015-10-28 배은화 수정
// 출차할때 입차이미지 로드시 지연되는 현상으로 인해 로직 제거
//                            try
//                              if is_ping(sFileIP) then
//                              begin
//                                if FileExists(sInFile) then
//                                begin
//                                  imgIn.Picture.LoadFromFile(sInFile);
//                                end
//                                else
//                                begin
//                                  imgIn.Picture.Assign(Nil);
//                                  ExceptLogging('File 없음: ' + sInFile);
//                                end;
//                              end
//                              else
//                              begin
//                                imgIn.Picture.Assign(Nil);
//                                ExceptLogging('File 없음: ' + sInFile);
//                              end;
//                            except
//                              on E: Exception do
//                                ExceptLogging('File Load: (' + sInFile + ') ' + aString(E.Message));
//                            end;
                          end
                          else
                          begin
                            // 최종입차된 자료가 없다.  이때는 출차자료를 입차자료와 동일하게 Insert한다.
                            Close;
                            SQL.Clear;
                            SQL.Add('Insert Into IOSData (ParkNo, UnitNo, ProcDate, ProcTime, TKType, ');
                            SQL.Add('CarType, GroupNo, GroupName, CompName, DeptName, Name, InCarNo1, ');
                            SQL.Add('InIOStatusNo, InImage1, OutUnitNo, OutDate, OutTime, OutImage1, ');
                            SQL.Add('OutCarNo1, OutIOStatusNo, OutImage2, OutCarNo2, TKNo) ');
                            SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, ');
                            SQL.Add(':N12, :N13, :N14, :N15, :N16, :N17, :N18, :N19, :N20, :N21, :N22, :N23)');
                            Parameters.ParamByName('N1').Value := nParkNo;
                            Parameters.ParamByName('N2').Value := nUnitNo;
                            Parameters.ParamByName('N3').Value := sLprDate;
                            Parameters.ParamByName('N4').Value := sLprTime;
                            Parameters.ParamByName('N5').Value := 2;
                            Parameters.ParamByName('N6').Value := 2;
                            Parameters.ParamByName('N7').Value := nGroupNo;
                            Parameters.ParamByName('N8').Value := sGroupName;
                            Parameters.ParamByName('N9').Value := sCompName;
                            Parameters.ParamByName('N10').Value := sDeptName;
                            Parameters.ParamByName('N11').Value := sName;
                            Parameters.ParamByName('N12').Value := sCarNo;
                            Parameters.ParamByName('N13').Value := 1;
                            Parameters.ParamByName('N14').Value := '';
                            Parameters.ParamByName('N15').Value := nUnitNo;
                            Parameters.ParamByName('N16').Value := sLprDate;
                            Parameters.ParamByName('N17').Value := sLprTime;
                            Parameters.ParamByName('N18').Value := sLprFile1;
                            Parameters.ParamByName('N19').Value := sLprCarNo1;
                            Parameters.ParamByName('N20').Value := 2;
                            Parameters.ParamByName('N21').Value := sLprFile2;
                            Parameters.ParamByName('N22').Value := sLprCarNo2;
                            Parameters.ParamByName('N23').Value := sCardNo;
                            ExecSQL;
                          end;
                        end;
                      end;
                      Result := '2' + Result + '출 차';
                      if nGroupNo = 999 then
                      begin
                        DspProc(2, 1, MG_Center('VIP 차량', 12) + MG_Left(sCarNo, 12), sDspIP);
                        ExceptLogging('전광판문구' + MG_Center('VIP 차량', 12) + MG_Left(sCarNo, 12));
                      end
                      else
                      begin
                        if nSCRemain >= nDayBetween then
                        begin
                          DspProc(2, 1, MG_Right(IntToStr(nDayBetween) + '일남음', 12) + MG_Left(sCarNo, 12), sDspIP);
                          ExceptLogging('전광판문구' + MG_Center('VIP 차량', 12) + MG_Left(sCarNo, 12));
                        end
                        else
                        begin
                          //DspProc(2, 1, '정기등록차량' + MG_Left(sCarNo, 12), sDspIP);
                          DspProc(2, 1, MG_Left(sDspGroup, 12) + MG_Left(sCarNo, 12), sDspIP);
                          ExceptLogging('전광판문구' + MG_Center('VIP 차량', 12) + MG_Left(sCarNo, 12));
                        end;
                      end;

                      OutOpen(csLPR);
                    end
                    else if nAPB = 3 then // 사용안함
                    begin
                      with qryRecvLpr2 do
                      begin
                        Close;
                        SQL.Clear;
                        SQL.Add('Update CustInfo Set LastParkNo = :N1, LastUnitNo = :N2, ');
                        SQL.Add('LastUseDate = :N3, LastUseTime = :N4, IOStatusNo = :N5, ');
                        SQL.Add('Status = :N6 where ParkNo = :N7 and TKType = :N8 and CarNo = :N9');
                        Parameters.ParamByName('N1').Value := nParkNo;
                        Parameters.ParamByName('N2').Value := nUnitNo;
                        Parameters.ParamByName('N3').Value := sLprDate;
                        Parameters.ParamByName('N4').Value := sLprTime;
                        Parameters.ParamByName('N5').Value := 2;
                        Parameters.ParamByName('N6').Value := 1;
                        Parameters.ParamByName('N7').Value := nParkNo;
                        Parameters.ParamByName('N8').Value := 2;
                        Parameters.ParamByName('N9').Value := sCarNo;
                        ExecSQL;

                        Close;
                        SQL.Clear;
                        SQL.Add('Select * from IOSData where ((InCarNo1 = :N1) or (InCarNo2 = :N2)) ');
                        SQL.Add('Order By ProcDate Desc, ProcTime Desc');
                        Parameters.ParamByName('N1').Value := sCarNo;
                        Parameters.ParamByName('N2').Value := sCarNo;
                        Open;

                        if RecordCount > 0 then
                        begin
                          First;

                          if FieldByName('OutDate').AsString = '' then
                          begin
                            // 최종입차후 출차되지 않은 자료가 있다. 이때는 출차일시 자료를 Update한다.
                            sSCInDate := FieldByName('ProcDate').AsString;
                            sSCInTime := FieldByName('ProcTime').AsString;
                            nLastUnitNo := FieldByName('UnitNo').AsInteger;
                            sInFile := FieldByName('InImage1').AsString;

                            Close;
                            SQL.Clear;
                            SQL.Add('Update IOSData Set OutUnitNo = :N1, OutDate = :N2, OutTime = :N3, ');
                            SQL.Add('OutIOStatusNo = :N4, OutImage1 = :N5, OutCarNo1 = :N6, OutImage2 = :N12, OutCarNo2 = :N13 ');
                            SQL.Add('where ((InCarNo1 = :N7) or (InCarNo2 = :N11)) and ');
                            SQL.Add('ProcDate = :N8 and ProcTime = :N9 and UnitNo = :N10');
                            Parameters.ParamByName('N1').Value := nUnitNo;
                            Parameters.ParamByName('N2').Value := sLprDate;
                            Parameters.ParamByName('N3').Value := sLprTime;
                            Parameters.ParamByName('N4').Value := 2;
                            Parameters.ParamByName('N5').Value := sLprFile1;
                            Parameters.ParamByName('N6').Value := sLprCarNo1;
                            Parameters.ParamByName('N7').Value := sCarNo;
                            Parameters.ParamByName('N8').Value := sSCInDate;
                            Parameters.ParamByName('N9').Value := sSCInTime;
                            Parameters.ParamByName('N10').Value := nLastUnitNo;
                            Parameters.ParamByName('N11').Value := sCarNo;
                            Parameters.ParamByName('N12').Value := sLprFile2;
                            Parameters.ParamByName('N13').Value := sLprCarNo2;
                            ExecSQL;

                            sTemp := Copy(sInFile, 6, Length(sInFile) - 5);
                            sInFile := Copy(sTemp, 1, Pos(':9080', sTemp) - 1);
                            sInFile := sInFile + Copy(sTemp, Pos(':9080', sTemp) + 5, Length(sTemp) - (Pos(':9080', sTemp) + 4));
                            sInFile := MG_StrConvert(sInFile, '/', '\');
                            ExceptLogging('File: ' + sInFile);
                            sFileIP:= Copy(sInFile, 3, Pos('\MSImage', sInFile)-3);
 // 2015-10-28 배은화 수정
// 출차할때 입차이미지 로드시 지연되는 현상으로 인해 로직 제거
//                            try
//                              if is_ping(sFileIP) then
//                              begin
//                                if FileExists(sInFile) then
//                                begin
//                                  imgIn.Picture.LoadFromFile(sInFile);
//                                end
//                                else
//                                begin
//                                  imgIn.Picture.Assign(Nil);
//                                  ExceptLogging('File 없음: ' + sInFile);
//                                end;
//                              end
//                              else
//                              begin
//                                imgIn.Picture.Assign(Nil);
//                                ExceptLogging('File 없음: ' + sInFile);
//                              end;
//                            except
//                              on E: Exception do
//                                ExceptLogging('File Load: (' + sInFile + ') ' + aString(E.Message));
//                            end;
                          end
                          else
                          begin
                            // 최종입차된 자료가 없다.  이때는 출차자료를 입차자료와 동일하게 Insert한다.
                            Close;
                            SQL.Clear;
                            SQL.Add( 'Insert Into IOSData (ParkNo, UnitNo, ProcDate, ProcTime, TKType, ');
                            SQL.Add( 'CarType, GroupNo, GroupName, CompName, DeptName, Name, InCarNo1, ');
                            SQL.Add('InIOStatusNo, InImage1, OutUnitNo, OutDate, OutTime, OutImage1, ');
                            SQL.Add('OutCarNo1, OutIOStatusNo, OutImage2, OutCarNo2, TKNo) ');
                            SQL.Add( 'Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, ');
                            SQL.Add(':N12, :N13, :N14, :N15, :N16, :N17, :N18, :N19, :N20, :N21, :N22, :N23)');
                            Parameters.ParamByName('N1').Value := nParkNo;
                            Parameters.ParamByName('N2').Value := nUnitNo;
                            Parameters.ParamByName('N3').Value := sLprDate;
                            Parameters.ParamByName('N4').Value := sLprTime;
                            Parameters.ParamByName('N5').Value := 2;
                            Parameters.ParamByName('N6').Value := 2;
                            Parameters.ParamByName('N7').Value := nGroupNo;
                            Parameters.ParamByName('N8').Value := sGroupName;
                            Parameters.ParamByName('N9').Value := sCompName;
                            Parameters.ParamByName('N10').Value := sDeptName;
                            Parameters.ParamByName('N11').Value := sName;
                            Parameters.ParamByName('N12').Value := sCarNo;
                            Parameters.ParamByName('N13').Value := 1;
                            Parameters.ParamByName('N14').Value := '';
                            Parameters.ParamByName('N15').Value := nUnitNo;
                            Parameters.ParamByName('N16').Value := sLprDate;
                            Parameters.ParamByName('N17').Value := sLprTime;
                            Parameters.ParamByName('N18').Value := sLprFile1;
                            Parameters.ParamByName('N19').Value := sLprCarNo1;
                            Parameters.ParamByName('N20').Value := 2;
                            Parameters.ParamByName('N21').Value := sLprFile2;
                            Parameters.ParamByName('N22').Value := sLprCarNo2;
                            Parameters.ParamByName('N23').Value := sCardNo;
                            ExecSQL;
                          end;
                        end;
                      end;
                      Result := '2' + Result + '출 차';
                      if nGroupNo = 999 then
                      begin
                        DspProc(2, 1, MG_Center('VIP 차량', 12) + MG_Left(sCarNo, 12), sDspIP);
                        ExceptLogging('전광판문구' + MG_Center('VIP 차량', 12) + MG_Left(sCarNo, 12));
                      end
                      else
                      begin
                        if nSCRemain >= nDayBetween then
                        begin
                          DspProc(2, 1, MG_Right(IntToStr(nDayBetween) + '일남음', 12) + MG_Left(sCarNo, 12), sDspIP);
                          ExceptLogging('전광판문구' + MG_Right(IntToStr(nDayBetween) + '일남음', 12) + MG_Left(sCarNo, 12));
                        end
                        else
                        begin
                          //DspProc(2, 1, '정기등록차량' + MG_Left(sCarNo, 12), sDspIP);
                          DspProc(2, 1, MG_Left(sDspGroup, 12) + MG_Left(sCarNo, 12), sDspIP);
                          ExceptLogging('전광판문구' + MG_Left(sDspGroup, 12) + MG_Left(sCarNo, 12));
                        end;
                      end;

                      OutOpen(csLPR);
                    end;
                  end;

                3, 5:
                  begin // 전체봉쇄, 출차봉쇄
                    with qryRecvLpr2 do
                    begin
                      Close;
                      SQL.Clear;
                      SQL.Add('Update CustInfo Set LastParkNo = :N1, LastUnitNo = :N2, ');
                      SQL.Add( 'LastUseDate = :N3, LastUseTime = :N4, IOStatusNo = :N5 ');
                      SQL.Add( 'where ParkNo = :N6 and TKType = :N7 and CarNo = :N8');
                      Parameters.ParamByName('N1').Value := nParkNo;
                      Parameters.ParamByName('N2').Value := nUnitNo;
                      Parameters.ParamByName('N3').Value := sLprDate;
                      Parameters.ParamByName('N4').Value := sLprTime;
                      Parameters.ParamByName('N5').Value := 10;
                      Parameters.ParamByName('N6').Value := nParkNo;
                      Parameters.ParamByName('N7').Value := 2;
                      Parameters.ParamByName('N8').Value := sCarNo;
                      ExecSQL;

                      Close;
                      SQL.Clear;
                      SQL.Add('Select * from IOSData where ((InCarNo1 = :N1) or (InCarNo2 = :N2)) ');
                      SQL.Add('Order By InDate Desc, InTime Desc');
                      Parameters.ParamByName('N1').Value := sCarNo;
                      Parameters.ParamByName('N2').Value := sCarNo;
                      Open;

                      if RecordCount > 0 then
                      begin
                        First;

                        if FieldByName('OutDate').AsString = '' then
                        begin
                          // 최종입차후 출차되지 않은 자료가 있다. 이때는 출차일시 자료를 Update한다.
                          sSCInDate := FieldByName('ProcDate').AsString;
                          sSCInTime := FieldByName('ProcTime').AsString;
                          nLastUnitNo := FieldByName('UnitNo').AsInteger;
                          sInFile := FieldByName('InImage1').AsString;

                          Close;
                          SQL.Clear;
                          SQL.Add('Update IOSData Set OutUnitNo = :N1, OutDate = :N2, OutTime = :N3, ');
                          SQL.Add('OutIOStatusNo = :N4, OutImage1 = :N5, OutCarNo1 = :N6, OutImage2 = :N12, OutCarNo2 = :N13 ');
                          SQL.Add('where ((InCarNo1 = :N7) or (InCarNo2 = :N11)) and ' );
                          SQL.Add('ProcDate = :N8 and ProcTime = :N9 and UnitNo = :N10');
                          Parameters.ParamByName('N1').Value := nUnitNo;
                          Parameters.ParamByName('N2').Value := sLprDate;
                          Parameters.ParamByName('N3').Value := sLprTime;
                          Parameters.ParamByName('N4').Value := 10;
                          Parameters.ParamByName('N5').Value := sLprFile1;
                          Parameters.ParamByName('N6').Value := sLprCarNo1;
                          Parameters.ParamByName('N7').Value := sCarNo;
                          Parameters.ParamByName('N8').Value := sSCInDate;
                          Parameters.ParamByName('N9').Value := sSCInTime;
                          Parameters.ParamByName('N10').Value := nLastUnitNo;
                          Parameters.ParamByName('N11').Value := sCarNo;
                          Parameters.ParamByName('N12').Value := sLprFile2;
                          Parameters.ParamByName('N13').Value := sLprCarNo2;
                          ExecSQL;

                          sTemp := Copy(sInFile, 6, Length(sInFile) - 5);
                          sInFile := Copy(sTemp, 1, Pos(':9080', sTemp) - 1);
                          sInFile := sInFile + Copy(sTemp, Pos(':9080', sTemp) + 5, Length(sTemp) - (Pos(':9080', sTemp) + 4));
                          sInFile := MG_StrConvert(sInFile, '/', '\');
                          ExceptLogging('File: ' + sInFile);
                          sFileIP:= Copy(sInFile, 3, Pos('\MSImage', sInFile)-3);
 // 2015-10-28 배은화 수정
// 출차할때 입차이미지 로드시 지연되는 현상으로 인해 로직 제거
//                          try
//                            if is_ping(sFileIP) then
//                            begin
//                              if FileExists(sInFile) then
//                              begin
//                                imgIn.Picture.LoadFromFile(sInFile);
//                              end
//                              else
//                              begin
//                                imgIn.Picture.Assign(Nil);
//                                ExceptLogging('File 없음: ' + sInFile);
//                              end;
//                            end
//                            else
//                            begin
//                              imgIn.Picture.Assign(Nil);
//                              ExceptLogging('File 없음: ' + sInFile);
//                            end;
//                          except
//                            on E: Exception do
//                              ExceptLogging('File Load: (' + sInFile + ') ' + aString(E.Message));
//                          end;
                        end
                        else
                        begin
                          // 최종입차된 자료가 없다.  이때는 출차자료를 입차자료와 동일하게 Insert한다.
                          Close;
                          SQL.Clear;
                          SQL.Add( 'Insert Into IOSData (ParkNo, UnitNo, ProcDate, ProcTime, TKType, ');
                          SQL.Add('CarType, GroupNo, GroupName, CompName, DeptName, Name, InCarNo1, ');
                          SQL.Add('InIOStatusNo, InImage1, OutUnitNo, OutDate, OutTime, OutImage1, ');
                          SQL.Add('OutCarNo1, OutIOStatusNo, OutImage2, OutCarNo2, TKNo) ');
                          SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, ');
                          SQL.Add(':N12, :N13, :N14, :N15, :N16, :N17, :N18, :N19, :N20, :N21, :N22, :N23)');
                          Parameters.ParamByName('N1').Value := nParkNo;
                          Parameters.ParamByName('N2').Value := nUnitNo;
                          Parameters.ParamByName('N3').Value := sLprDate;
                          Parameters.ParamByName('N4').Value := sLprTime;
                          Parameters.ParamByName('N5').Value := 2;
                          Parameters.ParamByName('N6').Value := 2;
                          Parameters.ParamByName('N7').Value := nGroupNo;
                          Parameters.ParamByName('N8').Value := sGroupName;
                          Parameters.ParamByName('N9').Value := sCompName;
                          Parameters.ParamByName('N10').Value := sDeptName;
                          Parameters.ParamByName('N11').Value := sName;
                          Parameters.ParamByName('N12').Value := sCarNo;
                          Parameters.ParamByName('N13').Value := 10;
                          Parameters.ParamByName('N14').Value := '';
                          Parameters.ParamByName('N15').Value := nUnitNo;
                          Parameters.ParamByName('N16').Value := sLprDate;
                          Parameters.ParamByName('N17').Value := sLprTime;
                          Parameters.ParamByName('N18').Value := sLprFile1;
                          Parameters.ParamByName('N19').Value := sLprCarNo1;
                          Parameters.ParamByName('N20').Value := 10;
                          Parameters.ParamByName('N21').Value := sLprFile2;
                          Parameters.ParamByName('N22').Value := sLprCarNo2;
                          Parameters.ParamByName('N23').Value := sCardNo;
                          ExecSQL;
                        end;
                      end;
                    end;
                    Result := '2' + Result + '봉쇄중';
                    if nGroupNo = 999 then
                    begin
                      DspProc(2, 1, MG_Center('VIP 차량', 12) + MG_Left(sCarNo, 12), sDspIP);
                      ExceptLogging('전광판문구' + MG_Center('VIP 차량', 12) + MG_Left(sCarNo, 12));
                    end
                    else
                    begin
                      if nSCRemain >= nDayBetween then
                      begin
                        DspProc(2, 1, MG_Right(IntToStr(nDayBetween) + '일남음', 12) + MG_Left(sCarNo, 12), sDspIP);
                        ExceptLogging('전광판문구' + MG_Right(IntToStr(nDayBetween) + '일남음', 12) + MG_Left(sCarNo, 12));
                      end
                      else
                      begin
                        DspProc(2, 1, '  봉쇄차량  ' + MG_Left(sCarNo, 12), sDspIP);
                        ExceptLogging('전광판문구' + '  봉쇄차량  ' + MG_Left(sCarNo, 12));
                      end;
                    end;

                    ExceptLogging('##### 전체 또는 출차봉쇄 카드(출차) #####');
                  end;
              end;
            end
            else
            begin
              with qryRecvLpr2 do
              begin
                Close;
                SQL.Clear;
                SQL.Add('Update CustInfo Set LastParkNo = :N1, LastUnitNo = :N2, ');
                SQL.Add('LastUseDate = :N3, LastUseTime = :N4, IOStatusNo = :N5 ');
                SQL.Add('where ParkNo = :N7 and TKType = :N8 and CarNo = :N9');
                Parameters.ParamByName('N1').Value := nParkNo;
                Parameters.ParamByName('N2').Value := nUnitNo;
                Parameters.ParamByName('N3').Value := sLprDate;
                Parameters.ParamByName('N4').Value := sLprTime;
                Parameters.ParamByName('N5').Value := 6;
                Parameters.ParamByName('N7').Value := nParkNo;
                Parameters.ParamByName('N8').Value := 2;
                Parameters.ParamByName('N9').Value := sCarNo;
                ExecSQL;

                Close;
                SQL.Clear;
                SQL.Add('Select * from IOSData where ((InCarNo1 = :N1) or (InCarNo2 = :N2)) Order By ProcDate Desc, ProcTime Desc');
                Parameters.ParamByName('N1').Value := sCarNo;
                Parameters.ParamByName('N2').Value := sCarNo;
                Open;

                if RecordCount > 0 then
                begin
                  First;

                  if FieldByName('OutDate').AsString = '' then
                  begin
                    // 최종입차후 출차되지 않은 자료가 있다. 이때는 출차일시 자료를 Update한다.
                    sSCInDate := FieldByName('ProcDate').AsString;
                    sSCInTime := FieldByName('ProcTime').AsString;
                    nLastUnitNo := FieldByName('UnitNo').AsInteger;
                    sInFile := FieldByName('InImage1').AsString;

                    Close;
                    SQL.Clear;
                    SQL.Add('Update IOSData Set OutUnitNo = :N1, OutDate = :N2, OutTime = :N3, ');
                    SQL.Add('OutIOStatusNo = :N4, OutImage1 = :N5, OutCarNo1 = :N6, OutImage2 = :N12, OutCarNo2 = :N13 ');
                    SQL.Add('where ((InCarNo1 = :N7) or (InCarNo2 = :N11)) and ');
                    SQL.Add('ProcDate = :N8 and ProcTime = :N9 and UnitNo = :N10');
                    Parameters.ParamByName('N1').Value := nUnitNo;
                    Parameters.ParamByName('N2').Value := sLprDate;
                    Parameters.ParamByName('N3').Value := sLprTime;
                    Parameters.ParamByName('N4').Value := 6;
                    Parameters.ParamByName('N5').Value := sLprFile1;
                    Parameters.ParamByName('N6').Value := sLprCarNo1;
                    Parameters.ParamByName('N7').Value := sCarNo;
                    Parameters.ParamByName('N8').Value := sSCInDate;
                    Parameters.ParamByName('N9').Value := sSCInTime;
                    Parameters.ParamByName('N10').Value := nLastUnitNo;
                    Parameters.ParamByName('N11').Value := sCarNo;
                    Parameters.ParamByName('N12').Value := sLprFile2;
                    Parameters.ParamByName('N13').Value := sLprCarNo2;
                    ExecSQL;

                    sTemp := Copy(sInFile, 6, Length(sInFile) - 5);
                    sInFile := Copy(sTemp, 1, Pos(':9080', sTemp) - 1);
                    sInFile := sInFile + Copy(sTemp, Pos(':9080', sTemp) + 5, Length(sTemp) - (Pos(':9080', sTemp) + 4));
                    sInFile := MG_StrConvert(sInFile, '/', '\');
                    ExceptLogging('File: ' + sInFile);
                    sFileIP:= Copy(sInFile, 3, Pos('\MSImage', sInFile)-3);
// 2015-10-28 배은화 수정
// 출차할때 입차이미지 로드시 지연되는 현상으로 인해 로직 제거
//                    try
//                      if is_ping(sFileIP) then
//                      begin
//                        if FileExists(sInFile) then
//                        begin
//                          imgIn.Picture.LoadFromFile(sInFile);
//                        end
//                        else
//                        begin
//                          imgIn.Picture.Assign(Nil);
//                          ExceptLogging('File 없음: ' + sInFile);
//                        end;
//                      end
//                      else
//                      begin
//                        imgIn.Picture.Assign(Nil);
//                        ExceptLogging('File 없음: ' + sInFile);
//                      end;
//                    except
//                      on E: Exception do
//                        ExceptLogging('File Load: (' + sInFile + ') ' + aString(E.Message));
//                    end;
                  end
                  else
                  begin
                    // 최종입차된 자료가 없다.  이때는 출차자료를 입차자료와 동일하게 Insert한다.
                    Close;
                    SQL.Clear;
                    SQL.Add('Insert Into IOSData (ParkNo, UnitNo, ProcDate, ProcTime, TKType, ');
                    SQL.Add('CarType, GroupNo, GroupName, CompName, DeptName, Name, InCarNo1, ');
                    SQL.Add('InIOStatusNo, InImage1, OutUnitNo, OutDate, OutTime, OutImage1, ');
                    SQL.Add('OutCarNo1, OutIOStatusNo, OutImage2, OutCarNo2, TKNo) ');
                    SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, ');
                    SQL.Add(':N12, :N13, :N14, :N15, :N16, :N17, :N18, :N19, :N20, :N21, :N22, :N23)');
                    Parameters.ParamByName('N1').Value := nParkNo;
                    Parameters.ParamByName('N2').Value := nUnitNo;
                    Parameters.ParamByName('N3').Value := sLprDate;
                    Parameters.ParamByName('N4').Value := sLprTime;
                    Parameters.ParamByName('N5').Value := 2;
                    Parameters.ParamByName('N6').Value := 2;
                    Parameters.ParamByName('N7').Value := nGroupNo;
                    Parameters.ParamByName('N8').Value := sGroupName;
                    Parameters.ParamByName('N9').Value := sCompName;
                    Parameters.ParamByName('N10').Value := sDeptName;
                    Parameters.ParamByName('N11').Value := sName;
                    Parameters.ParamByName('N12').Value := sCarNo;
                    Parameters.ParamByName('N13').Value := 6;
                    Parameters.ParamByName('N14').Value := '';
                    Parameters.ParamByName('N15').Value := nUnitNo;
                    Parameters.ParamByName('N16').Value := sLprDate;
                    Parameters.ParamByName('N17').Value := sLprTime;
                    Parameters.ParamByName('N18').Value := sLprFile1;
                    Parameters.ParamByName('N19').Value := sLprCarNo1;
                    Parameters.ParamByName('N20').Value := 6;
                    Parameters.ParamByName('N21').Value := sLprFile2;
                    Parameters.ParamByName('N22').Value := sLprCarNo2;
                    Parameters.ParamByName('N23').Value := sCardNo;
                    ExecSQL;
                  end;
                end;
              end;
              Result := '2' + Result + '시간위반';
              if nGroupNo = 999 then
              begin
                DspProc(2, 1, MG_Center('VIP 차량', 12) + MG_Left(sCarNo, 12), sDspIP);
                ExceptLogging('전광판문구' + MG_Center('VIP 차량', 12) + MG_Left(sCarNo, 12));
              end
              else
              begin
                if nSCRemain >= nDayBetween then
                begin
                  DspProc(2, 1, MG_Right(IntToStr(nDayBetween) + '일남음', 12) + MG_Left(sCarNo, 12), sDspIP) ;
                  ExceptLogging('전광판문구' + MG_Right(IntToStr(nDayBetween) + '일남음', 12) + MG_Left(sCarNo, 12));
                end
                else
                begin
                  DspProc(2, 1, '사용시간위반' + MG_Left(sCarNo, 12), sDspIP);
                  ExceptLogging('전광판문구' + '사용시간위반' + MG_Left(sCarNo, 12));
                end;
              end;

              ExceptLogging('##### 사용시간대(WP) 위반(출차) #####');
            end;
          end
          else if nInOut = 3 then // 재인식기
          begin
            //
          end;
        end
        else
        begin
          // 카드사용기간 오류처리..
          with qryRecvLpr2 do
          begin
            Close;
            SQL.Clear;
            SQL.Add('Update CustInfo Set LastParkNo = :N1, LastUnitNo = :N2, ');
            SQL.Add('LastUseDate = :N3, LastUseTime = :N4, IOStatusNo = :N5 ');
            SQL.Add('where ParkNo = :N6 and TKType = :N7 and CarNo = :N8');
            Parameters.ParamByName('N1').Value := nParkNo;
            Parameters.ParamByName('N2').Value := nUnitNo;
            Parameters.ParamByName('N3').Value := sLprDate;
            Parameters.ParamByName('N4').Value := sLprTime;
            Parameters.ParamByName('N5').Value := 3;
            Parameters.ParamByName('N6').Value := nParkNo;
            Parameters.ParamByName('N7').Value := 2;
            Parameters.ParamByName('N8').Value := sCarNo;
            ExecSQL;

            Close;
            SQL.Clear;
            SQL.Add( 'Select * from IOSData where ((InCarNo1 = :N1) or (InCarNo2 = :N2)) Order By ProcDate Desc, ProcTime Desc');
            Parameters.ParamByName('N1').Value := sCarNo;
            Parameters.ParamByName('N2').Value := sCarNo;
            Open;

            if RecordCount > 0 then
            begin
              First;

              if FieldByName('OutDate').AsString = '' then
              begin
                // 최종입차후 출차되지 않은 자료가 있다. 이때는 출차일시 자료를 Update한다.
                sSCInDate := FieldByName('ProcDate').AsString;
                sSCInTime := FieldByName('ProcTime').AsString;
                nLastUnitNo := FieldByName('UnitNo').AsInteger;
                sInFile := FieldByName('InImage1').AsString;

                Close;
                SQL.Clear;
                SQL.Add('Update IOSData Set OutUnitNo = :N1, OutDate = :N2, OutTime = :N3, ');
                SQL.Add('OutIOStatusNo = :N4, OutImage1 = :N5, OutCarNo1 = :N6, OutImage2 = :N12, OutCarNo2 = :N13 ');
                SQL.Add('where ((InCarNo1 = :N7) or (InCarNo2 = :N11)) and ');
                SQL.Add('ProcDate = :N8 and ProcTime = :N9 and UnitNo = :N10');
                Parameters.ParamByName('N1').Value := nUnitNo;
                Parameters.ParamByName('N2').Value := sLprDate;
                Parameters.ParamByName('N3').Value := sLprTime;
                Parameters.ParamByName('N4').Value := 3;
                Parameters.ParamByName('N5').Value := sLprFile1;
                Parameters.ParamByName('N6').Value := sLprCarNo1;
                Parameters.ParamByName('N7').Value := sCarNo;
                Parameters.ParamByName('N8').Value := sSCInDate;
                Parameters.ParamByName('N9').Value := sSCInTime;
                Parameters.ParamByName('N10').Value := nLastUnitNo;
                Parameters.ParamByName('N11').Value := sCarNo;
                Parameters.ParamByName('N12').Value := sLprFile2;
                Parameters.ParamByName('N13').Value := sLprCarNo2;
                ExecSQL;

                sTemp := Copy(sInFile, 6, Length(sInFile) - 5);
                sInFile := Copy(sTemp, 1, Pos(':9080', sTemp) - 1);
                sInFile := sInFile + Copy(sTemp, Pos(':9080', sTemp) + 5, Length(sTemp) -  (Pos(':9080', sTemp) + 4));
                sInFile := MG_StrConvert(sInFile, '/', '\');
                ExceptLogging('File: ' + sInFile);
                sFileIP:= Copy(sInFile, 3, Pos('\MSImage', sInFile)-3);

// 2015-10-28 배은화 수정
// 출차할때 입차이미지 로드시 지연되는 현상으로 인해 로직 제거
//                try
//                  if is_ping(sFileIP) then
//                  begin
//                    if FileExists(sInFile) then
//                    begin
//                      imgIn.Picture.LoadFromFile(sInFile);
//                    end
//                    else
//                    begin
//                      imgIn.Picture.Assign(Nil);
//                      ExceptLogging('File 없음: ' + sInFile);
//                    end;
//                  end
//                  else
//                  begin
//                    imgIn.Picture.Assign(Nil);
//                    ExceptLogging('File 없음: ' + sInFile);
//                  end;
//                except
//                  on E: Exception do
//                    ExceptLogging('File Load: (' + sInFile + ') ' + aString(E.Message));
//                end;
              end
              else
              begin
                // 최종입차된 자료가 없다.  이때는 출차자료를 입차자료와 동일하게 Insert한다.
                Close;
                SQL.Clear;
                SQL.Add('Insert Into IOSData (ParkNo, UnitNo, ProcDate, ProcTime, TKType, ');
                SQL.Add('CarType, GroupNo, GroupName, CompName, DeptName, Name, InCarNo1, ');
                SQL.Add('InIOStatusNo, InImage1, OutUnitNo, OutDate, OutTime, OutImage1, ');
                SQL.Add('OutCarNo1, OutIOStatusNo, OutImage2, OutCarNo2, TKNo) ');
                SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, ');
                SQL.Add(':N12, :N13, :N14, :N15, :N16, :N17, :N18, :N19, :N20, :N21, :N22, :N23)');
                Parameters.ParamByName('N1').Value := nParkNo;
                Parameters.ParamByName('N2').Value := nUnitNo;
                Parameters.ParamByName('N3').Value := sLprDate;
                Parameters.ParamByName('N4').Value := sLprTime;
                Parameters.ParamByName('N5').Value := 2;
                Parameters.ParamByName('N6').Value := 2;
                Parameters.ParamByName('N7').Value := nGroupNo;
                Parameters.ParamByName('N8').Value := sGroupName;
                Parameters.ParamByName('N9').Value := sCompName;
                Parameters.ParamByName('N10').Value := sDeptName;
                Parameters.ParamByName('N11').Value := sName;
                Parameters.ParamByName('N12').Value := sCarNo;
                Parameters.ParamByName('N13').Value := 3;
                Parameters.ParamByName('N14').Value := '';
                Parameters.ParamByName('N15').Value := nUnitNo;
                Parameters.ParamByName('N16').Value := sLprDate;
                Parameters.ParamByName('N17').Value := sLprTime;
                Parameters.ParamByName('N18').Value := sLprFile1;
                Parameters.ParamByName('N19').Value := sLprCarNo1;
                Parameters.ParamByName('N20').Value := 3;
                Parameters.ParamByName('N21').Value := sLprFile2;
                Parameters.ParamByName('N22').Value := sLprCarNo2;
                Parameters.ParamByName('N23').Value := sCardNo;
                ExecSQL;
              end;
            end;
          end;

          if nInOut = 1 then
          begin
            Result := '1' + Result + '유효기간';
            DspProc(1, 1, '사용기간위반' + MG_Left(sCarNo, 12), sDspIP);
            ExceptLogging('전광판문구' + '사용기간위반' + MG_Left(sCarNo, 12));
          end
          else if nInOut = 2 then
          begin
            Result := '2' + Result + '유효기간';
            DspProc(2, 1, '사용기간위반' + MG_Left(sCarNo, 12), sDspIP);
            ExceptLogging('전광판문구' + '사용기간위반' + MG_Left(sCarNo, 12));
          end;
          ExceptLogging('##### 사용기간 오류 - 사용시작일: ' + sExpDateF + ', 사용종료일: ' + sExpDateT + ' #####');
        end;
      end;
      ExceptLogging('정기차량처리: ' + sLprCarNo1 + ', ' + sLprCarNo2);
    except
      on E: Exception do
        ExceptLogging('RecvLprProc: ' + aString(E.Message));
    end;

  finally
    bSCProcWait := False;
  end;
end;

//2018.01.09 AK프라자 로직 추가 시작//
function TfrmMainNew.RequestAkPlaza(_sJumCode, _sCarNo, _sBarcodePosNo,
  _sBarcodeSerialNo, _sBarcodeIssueDate: string): Integer;
var
  sRequestNormal : string;
    sHeader              //Header       : '0100'
  , sTerminalID          //터미널ID     : 000 + 점코드(2자리)
  , sRequestDate         //전문요청일   : 당일표출
  , sRequestTime         //전문용청시간 : 당일시간
  , sRespones_Code       //응답코드     :응답코드표에 따라 처리
  , sStore               //점           : 점코드(2자리)
  , sSale_Ymd            //포스거래일자 : YYMMDD
  , sPos_No              //포스번호     : 6자리
  , sReceipt_No          //영수증번호   : 4자리
  , sCarNo               //차량번호     : 뒤에 4자리 앞에 나머지 자리는 스패이스로 채움
  , sSale_Amt            //정산금액     : SPACE(10)자리
  , sNormal              //정상/반품    : SPACE(2)자리
  , sRemark  :string;    //비고         : SPACE(40)자리
  sTemp : string;
  iRequest  : Integer;                   //요청 후 리턴값
begin
  ExceptLogging('RequestAKPos : Start');
  sRequestNormal := '';
  sHeader          :=  '0100';
  sTerminalID      :=  StringOfChar('0', 5- Length(_sjumcode)) + _sJumCode;
  sRequestDate     :=  FormatDateTime('YYYYMMDD', Now);
  sRequestTime     :=  FormatDateTime('HHNNSS', Now);
  sRespones_Code   :=  '00';
  sStore           :=  _sJumCode;
  sSale_Ymd        :=  _sBarcodeIssueDate;
  sPos_No          :=  _sBarcodePosNo;
  _sBarcodeSerialNo:=  _sBarcodeSerialNo;
  sCarNo           :=  StringOfChar(' ', 9- Length(_sCarNo)) + _sCarNo;
  sSale_Amt        :=  StringOfChar(' ', 10) ;
  sNormal          :=  StringOfChar(' ', 2) ;
  sRemark          :=  StringOfChar(' ', 40) ;
  sRequestNormal   := sHeader + sTerminalID + sRequestDate + sRequestTime + sRespones_Code + sStore + sSale_Ymd + sPos_No
                    + _sBarcodeSerialNo + sCarNo + sSale_Amt + sNormal + sRemark ;
  ExceptLogging('RequestAKPos : 요청전문 [' + sRequestNormal + ']');

  //Added Roy 180117

  csAKPos.Port := nAKPosPORT;
  csAKPos.Address := sAKPosIP;
//  if csAKPos.Socket.Connected = False then
//  begin
//    csAKPos.Active := True;
//  end;
  try
    if(csAKPos.Socket.Connected = True) then
    begin
       ExceptLogging('RequestAKPos : 정상연결');
       iRequest:= csAKPos.Socket.SendText(sRequestNormal);
       if(iRequest = 104) then
       begin
       //정상 송신              .
         ExceptLogging('RequestAKPos : 요청전문 정상 송신');
         Result := 1;
       end
       else
       begin
         ExceptLogging('RequestAKPos : 요청전문 송신 실패');
         Result := -1;
       end;
    end
    else
    begin
      ExceptLogging('RequestAKPos : 소켓연결 실패');
      Result := -1;
    end;
  except
    on E:Exception do
    begin
      ExceptLogging('RequestAKPos : 소켓통신 예외발생 : ' + E.Message);
      Result := -1;
    end;
  end;

  ExceptLogging('RequestAKPos : End');
end;
//2018.01.09 AK프라자 로직 추가 종료//

procedure TfrmMainNew.btnSCCancelClick(Sender: TObject);
begin
  sManualSCCarNo := '';
  pnSCSearch.Visible := False;
end;

procedure TfrmMainNew.sgInDblClickCell(Sender: TObject; ARow, ACol: Integer);
var
  sTemp, sFileIP, sTempFile: aString;
begin
  if ARow > 0 then
  begin
    nGridCheck := 1;
    nModRow := ARow;

    if (MG_StrTrim(sgIn.Cells[7, ARow], ' ') = '입차') then
    begin
      if sgIn.Cells[0, ARow] <> '일반차량' then
      begin
        ShowMessage('일반차량의 차량번호만 수정이 가능합니다.');
        Exit;
      end;
      sOrgCarNo := MG_StrTrim(sgIn.Cells[3, ARow], ' ');
      sOrgDate := sgIn.Cells[1, ARow];
      sOrgTime := sgIn.Cells[2, ARow];
      edtMCarNo.Text := sOrgCarNo;

      with dmTables.qryTemp do
      begin
        Close;
        SQL.Clear;
        SQL.Add(
          'Select * from IONdata where ParkNo = :N1 and ((InCarNo1 = :N2) or ');
        SQL.Add('(InCarNo2 = :N3)) and ProcDate = :N4 and ProcTime = :N5');
        Parameters.ParamByName('N1').Value := nCurrParkNo;
        Parameters.ParamByName('N2').Value := sOrgCarNo;
        Parameters.ParamByName('N3').Value := sOrgCarNo;
        Parameters.ParamByName('N4').Value := sOrgDate;
        Parameters.ParamByName('N5').Value := sOrgTime;
        Open;

        if RecordCount > 0 then
        begin
          sOrgFile := FieldByName('InImage1').AsString;
          nOrgUnitNo := FieldByName('UnitNo').AsInteger;
        end;
      end;

      try
        sTemp := Copy(sOrgFile, 6, Length(sOrgFile) - 5);
        sTempFile := Copy(sTemp, 1, Pos(':9080', sTemp) - 1);
        sTempFile := sTempFile + Copy(sTemp, Pos(':9080', sTemp) + 5, Length
            (sTemp) - (Pos(':9080', sTemp) + 4));
        sTempFile := MG_StrConvert(sTempFile, '/', '\');
        ExceptLogging('File: ' + sTempFile);
        sFileIP:= Copy(sTempFile, 3, Pos('\MSImage', sTempFile)-3);

        if is_ping(sFileIP) then
        begin
          if FileExists(sTempFile) then
          begin
            imgModify.Picture.LoadFromFile(sTempFile);
          end
          else
          begin
            imgModify.Picture.Assign(Nil);
            ExceptLogging('File 없음: ' + sTempFile);
          end;
        end
        else
        begin
          imgModify.Picture.Assign(Nil);
          ExceptLogging('File 없음: ' + sTempFile);
        end;
      except
        on E: Exception do
          ExceptLogging('sgInDblClickCell_ModifyImageLoad: ' + aString(E.Message));
      end;
      pnModify.Visible := True;
      edtMCarNo.SetFocus;
      edtMCarNo.SelectAll;
    end
    else
      ShowMessage('입차 차량번호만 수정이 가능합니다.');
  end;
end;

procedure TfrmMainNew.MichulProc(sCarNo, sProcDate, sProcTime: AnsiString);
begin
  if (sCarNo <> '') and (sCarNo <> '0000000000') then
  begin
    try
      with dmTables.qryMichulProc do
      begin
        Close;
        SQL.Clear;
        SQL.Add
          ('Update IONData Set OutChk = :N1, OutDate = :N2, OutTime = :N3 ');
        SQL.Add('where ((InCarNo1 = :N4) or (InCarNo2 = :N5)) and OutChk = 0');
        Parameters.ParamByName('N1').Value := 7;
        Parameters.ParamByName('N2').Value := sProcDate;
        Parameters.ParamByName('N3').Value := sProcTime;
        Parameters.ParamByName('N4').Value := sCarNo;
        Parameters.ParamByName('N5').Value := sCarNo;
        ExecSQL;
      end;
    except
      on E: Exception do
        ExceptLogging('TfrmMainNew.MichulProc: ' + aString(E.Message));
    end;
  end;
end;

procedure TfrmMainNew.NormalOut(sLprFile1, sLprCarNo1, sLprFile2, sLprCarNo2,
  sIOTime: aString; nLprNo, nLprInOut, nLprRecog1, nLprRecog2: Byte;
  sDspIP: aString; csLPR: TClientSocket);
var
  sNow, sInCarNo, sInTKNo, sInDate, sInTime, sParking, sInFile, sImgFile1,
    sImgFile2, sLocalFile, sTime, sDir, sYogum, sTemp, sFileIP: aString;
  nDay, nHour, nMin, nOutCnt: Cardinal;
  nInUnitNo, i: Word;
  hr: HRESULT;
begin
  // 일반차량 출차처리...
  try
    bNCOutProcWait := True;
    nowLpr := csLPR;
    //2018.01.09 AK프라자 로직 추가 시작//
    bApsPay := false;
    //2018.01.09 AK프라자 로직 추가 종료//
    lbOutCarType.Caption := '일반차량';

    if (not bMiProc) then
    begin
      if ((sLprCarNo1 = '0000000000') and (sLprCarNo2 = '')) or
        ((sLprCarNo2 = '0000000000') and (sLprCarNo1 = '')) or
        ((sLprCarNo1 = '0000000000') and (sLprCarNo2 = '0000000000')) or
        ((sLprCarNo1 = '') and (sLprCarNo2 = '')) or
        ((Pos('X', sLprCarNo1) > 0) and (sLprCarNo2 = '')) or
        ((Pos('X', sLprCarNo2) > 0) and (sLprCarNo1 = '')) then
      begin
        if bTest then
        begin
          OutOpen(nowLpr);
          bNCOutProcWait := False;
          Exit;
        end;

        if bFreeTime then
        begin
          if bFreeTimeChk then
          begin
            // 시작시각이 크다.
            if (sFreeTimeS <= FormatDateTime('HH:NN', Now)) or
              (sFreeTimeE >= FormatDateTime('HH:NN', Now)) then
            begin
              OutOpen(nowLpr);
              bNCOutProcWait := False;
              Exit;
            end;
          end
          else
          begin
            if (sFreeTimeS <= FormatDateTime('HH:NN', Now)) and
              (sFreeTimeE >= FormatDateTime('HH:NN', Now)) then
            begin
              OutOpen(nowLpr);
              bNCOutProcWait := False;
              Exit;
            end;
          end;
        end;

        if bOperation then
        begin
          case nNowCharo of
            1:
              edtCharo.Color := clWhite;
            2:
              edtCharo.Color := clYellow;
            3:
              edtCharo.Color := clAqua;
          end;
          edtCharo.Text := IntToStr(nNowCharo) + '번 차로';

          // 미인식차량 처리...
          sTemp := Copy(sLprFile1, 6, Length(sLprFile1) - 5);
          sLprFile1 := Copy(sTemp, 1, Pos(':9080', sTemp) - 1);
          sLprFile1 := sLprFile1 + Copy(sTemp, Pos(':9080', sTemp) + 5, Length
              (sTemp) - (Pos(':9080', sTemp) + 4));
          sLprFile1 := MG_StrConvert(sLprFile1, '/', '\');
          sFileIP:= Copy(sLprFile1, 3, Pos('\MSImage', sLprFile1)-3);

          try
            if is_ping(sFileIP) then
            begin
              if FileExists(sLprFile1) then
              begin
                imgOut.Picture.LoadFromFile(sLprFile1);
                imgManual.Picture.LoadFromFile(sLprFile1);
              end
              else
              begin
                imgOut.Picture.Assign(Nil);
                imgManual.Picture.Assign(Nil);
                ExceptLogging('File 없음: ' + sLprFile1);
              end;
            end
            else
            begin
              imgOut.Picture.Assign(Nil);
              imgManual.Picture.Assign(Nil);
              ExceptLogging('File 없음: ' + sLprFile1);
            end;
          except
            on E: Exception do
              ExceptLogging('이미지 로드 에러: ' + aString(E.Message));
          end;
          // ShowMessage('미인식차량입니다. 차량검색 또는 수동출차로 처리하여주세요!');
          edtManualProcDate.Date := Now;
          pnManualProc.Visible := True;
          edtManualProcCarNo.SetFocus;
        end;

        sNowLprFile1 := sLprFile1;
        sNowLprCarNo1 := sLprCarNo1;
        sNowLprFile2 := sLprFile2;
        sNowLprCarNo2 := sLprCarNo2;
        sNowIOTime := sIOTime;
        nNowLprNo := nLprNo;
        nNowLprInOut := nLprInOut;
        nNowLprRecog1 := nLprRecog1;
        nNowLprRecog2 := nLprRecog2;
        sNowInTKNo := '';
        nNowInUnitNo := nCurrUnitNo;
        sNowInDate := '';
        sNowInTime := '';
        sNowInCarNo := '';
        sNowOutDate := '';
        sNowOutTime := '';
        sNowInFile := '';
        Exit;
      end;
    end;

    with dmTables.qryNormalOut1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from Gracetime where ParkNo = :N1');
      Parameters.ParamByName('N1').Value := nCurrParkNo;
      Open;

      if RecordCount > 0 then
        with GTime do
        begin
          GT1 := FieldByName('GT1').AsString;
          GT2 := FieldByName('GT2').AsString;
          GT3 := FieldByName('GT3').AsString;
          GT4 := FieldByName('GT4').AsString;
          GT5 := FieldByName('GT5').AsString;
          GT6 := FieldByName('GT6').AsString;
          GT7 := FieldByName('GT7').AsString;
          GT8 := FieldByName('GT8').AsString;
          GT9 := FieldByName('GT9').AsInteger;
        end
        else
          ClearGTime;

//      if bOperation then
//      begin
//        Close;
//        SQL.Clear;
//        //사전정산 및 출차 안한 자료 검색
//        SQL.Add('Select * from IONData where OutChk = :N1 and ');
//      end
//      else
//      begin
//        Close;
//        SQL.Clear;
//        SQL.Add('Select * from FreeIOData where OutChk = :N1 and ');
//      end;
      //2018.01.09 AK프라자 로직 추가 시작//
      if bOperation then
      begin
        Close;
        SQL.Clear;
        //사전정산 및 출차 안한 자료 검색
        SQL.Add('Select * from IONData where ((OutChk = :N1) or (OutChk = :N9)) and ');
//        SQL.Add('Select * from IONData where OutChk = :N1 and ');
      end
      else
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select * from FreeIOData where ((OutChk = :N1) or (OutChk = :N9)) and ');
//        SQL.Add('Select * from FreeIOData where OutChk = :N1 and ');
      end;
      //2018.01.09 AK프라자 로직 추가 종료//

      if not bMiProc then
      begin
        if sLprCarNo2 <> '' then
        begin
          SQL.Add('((InCarNo1 = :N2) or (InCarNo2 = :N3) or (InCarNo1 = :N4) or (InCarNo2 = :N5)) ');
          Parameters.ParamByName('N1').Value := 0;
          Parameters.ParamByName('N2').Value := sLprCarNo1;
          Parameters.ParamByName('N3').Value := sLprCarNo1;
          Parameters.ParamByName('N4').Value := sLprCarNo2;
          Parameters.ParamByName('N5').Value := sLprCarNo2;
          Parameters.ParamByName('N9').Value := 8;
        end
        else
        begin
          SQL.Add('((InCarNo1 = :N2) or (InCarNo2 = :N3)) ');
          Parameters.ParamByName('N1').Value := 0;
          Parameters.ParamByName('N2').Value := sLprCarNo1;
          Parameters.ParamByName('N3').Value := sLprCarNo1;
          Parameters.ParamByName('N9').Value := 8;
        end;

        if nSeekDay > 0 then
        begin
          SQL.Add(' and ProcDate >= :N8 ');
          Parameters.ParamByName('N8').Value := MG_AddDate(FormatDateTime('YYYY-MM-DD', Now), nSeekDay*-1)
        end;
      end
      else
      begin
        SQL.Add('((InCarNo1 = :N2) or (InCarNo2 = :N3)) ');
        SQL.Add('and ProcDate = :N6 and ProcTime = :N7 ');
        Parameters.ParamByName('N2').Value := sLostInCarNo;
        Parameters.ParamByName('N3').Value := sLostInCarNo;
        Parameters.ParamByName('N1').Value := 0;
        Parameters.ParamByName('N6').Value := sLostInDate;
        Parameters.ParamByName('N7').Value := sLostInTime;
        Parameters.ParamByName('N9').Value := 8;
      end;
      SQL.Add('Order By ProcDate Desc, ProcTime Desc');
      Open;

      if RecordCount > 0 then
      begin
        nInUnitNo := FieldByName('UnitNo').AsInteger;
        nNowInUnitNo := nInUnitNo;

        //2018.01.09 AK프라자 로직 추가 시작//
        if FieldByName('OutChk').AsInteger =8 then
          bApsPay := True
        else
          bApsPay := False;
        //2018.01.09 AK프라자 로직 추가 종료//


        if bOperation then
        begin
          sInTKNo := FieldByName('TKNo').AsString;
          sNowInTKNo := sInTKNo;
        end;

        if nLprRecog1 = 1 then
        begin
          sInCarNo := sLprCarNo1;
          sInFile := FieldByName('InImage1').AsString;
          sTime := Copy(sInFile, Pos('_', sInFile) + 1, 14);
          sNowInCarNo := sInCarNo;
          sNowInFile := sInFile;
        end
        else if nLprRecog2 = 1 then
        begin
          sInCarNo := sLprCarNo2;
          sInFile := FieldByName('InImage2').AsString;
          sTime := Copy(sInFile, Pos('_', sInFile) + 1, 14);
          sNowInCarNo := sInCarNo;
          sNowInFile := sInFile;
        end
        else
        begin
          sInCarNo := sLprCarNo1;
          sInFile := FieldByName('InImage1').AsString;
          sTime := Copy(sInFile, Pos('_', sInFile) + 1, 14);
          sNowInCarNo := sInCarNo;
          sNowInFile := sInFile;
        end;
        //2018.01.09 AK프라자 로직 추가 시작//
        if not bApsPay then
        begin
          sInDate := FieldByName('ProcDate').AsString;
          sInTime := FieldByName('ProcTime').AsString;
        end
        else
        begin
          sInDate := FieldByName('ProcDate').AsString;
          sInTime := FieldByName('ProcTime').AsString;
          sApsPayDate := FieldByName('OutDate').AsString;
          sAPSPayTime := FieldByName('OutTime').AsString;
        end;
        sNowInDate := sInDate;
        sNowInTime := sInTime;
        //2018.01.09 AK프라자 로직 추가 종료//

//        sInDate := FieldByName('ProcDate').AsString;
//        sInTime := FieldByName('ProcTime').AsString;
//        sNowInDate := sInDate;
//        sNowInTime := sInTime;
      end
      else
      begin
        // 입차자료 없음...
        sNowLprFile1 := sLprFile1;
        sNowLprCarNo1 := sLprCarNo1;
        sNowLprFile2 := sLprFile2;
        sNowLprCarNo2 := sLprCarNo2;
        sNowIOTime := sIOTime;
        nNowLprNo := nLprNo;
        nNowLprInOut := nLprInOut;
        nNowLprRecog1 := nLprRecog1;
        nNowLprRecog2 := nLprRecog2;
        sNowInTKNo := '';
        nNowInUnitNo := 0;
        sNowInDate := '';
        sNowInTime := '';
        sNowInCarNo := '';
        sNowInFile := '';
        ExceptLogging('입차자료 없음');

        if bTest then
        begin
          OutOpen(nowLpr);
          bNCOutProcWait := False;
          Exit;
        end;

        if bFreeTime then
        begin
          if bFreeTimeChk then
          begin
            // 시작시각이 크다.
            if (sFreeTimeS <= FormatDateTime('HH:NN', Now)) or
              (sFreeTimeE >= FormatDateTime('HH:NN', Now)) then
            begin
              OutOpen(nowLpr);
              bNCOutProcWait := False;
              Exit;
            end;
          end
          else
          begin
            if (sFreeTimeS <= FormatDateTime('HH:NN', Now)) and
              (sFreeTimeE >= FormatDateTime('HH:NN', Now)) then
            begin
              OutOpen(nowLpr);
              bNCOutProcWait := False;
              Exit;
            end;
          end;
        end;

        if bOperation then
        begin
          bInDataZero := True;

          sTemp := Copy(sLprFile1, 6, Length(sLprFile1) - 5);
          sLprFile1 := Copy(sTemp, 1, Pos(':9080', sTemp) - 1);
          sLprFile1 := sLprFile1 + Copy(sTemp, Pos(':9080', sTemp) + 5, Length
              (sTemp) - (Pos(':9080', sTemp) + 4));
          sLprFile1 := MG_StrConvert(sLprFile1, '/', '\');
          sFileIP:= Copy(sLprFile1, 3, Pos('\MSImage', sLprFile1)-3);

          try
            if is_ping(sFileIP) then
            begin
              if FileExists(sLprFile1) then
              begin
                imgOut.Picture.LoadFromFile(sLprFile1);
                imgManual.Picture.LoadFromFile(sLprFile1);
              end
              else
              begin
                imgOut.Picture.Assign(Nil);
                imgManual.Picture.Assign(Nil);
                ExceptLogging('File 없음: ' + sLprFile1);
              end;
            end
            else
            begin
              imgOut.Picture.Assign(Nil);
              imgManual.Picture.Assign(Nil);
              ExceptLogging('File 없음: ' + sLprFile1);
            end;
          except
            on E: Exception do
              ExceptLogging('이미지 로드 에러: ' + aString(E.Message));
          end;
          // ShowMessage('입차자료가 없습니다. 확인하여주세요!');
          edtManualProcDate.Date := Now;
          pnManualProc.Visible := True;
          edtManualProcCarNo.SetFocus;
        end;
        Exit;
      end;
    end;
    sDir := sImageDir + '\' + Copy(sTime, 1, 4) + '\' + Copy(sTime, 5, 2)
      + '\' + Copy(sTime, 7, 2) + '\' + IntToStr(nInUnitNo);

    if not DirectoryExists(sDir) then
    begin
      if not ForceDirectories(sDir) then
        ExceptLogging('이미지저장폴더 생성실패: ' + sDir);
    end;

    sTemp := Copy(sInFile, 6, Length(sInFile) - 5);
    sInFile := Copy(sTemp, 1, Pos(':9080', sTemp) - 1);
    sInFile := sInFile + Copy(sTemp, Pos(':9080', sTemp) + 5, Length(sTemp) - (Pos(':9080', sTemp) + 4));
    sInFile := MG_StrConvert(sInFile, '/', '\');
    sNowInFile := sInFile;
    ExceptLogging('File: ' + sInFile);
    sFileIP:= Copy(sInFile, 3, Pos('\MSImage', sInFile)-3);

// 2015-10-28 배은화 수정
// 출차할때 입차이미지 로드시 지연되는 현상으로 인해 로직 제거
//    try
//      if is_ping(sFileIP) then
//      begin
//        if FileExists(sInFile) then
//        begin
//          imgIn.Picture.LoadFromFile(sInFile);
//        end
//        else
//        begin
//          imgIn.Picture.Assign(Nil);
//          ExceptLogging('File 없음: ' + sInFile);
//        end;
//      end
//      else
//      begin
//        imgIn.Picture.Assign(Nil);
//        ExceptLogging('File 없음: ' + sInFile);
//      end;
//    except
//      on E: Exception do
//        ExceptLogging('File Load: (' + sInFile + ') ' + aString(E.Message));
//    end;

    // 화면표시
    lbInCarNo.Caption := sInCarNo;

    case nNowCharo of
      1:
        edtCharo.Color := clWhite;
      2:
        edtCharo.Color := clYellow;
      3:
        edtCharo.Color := clAqua;
    end;
    edtCharo.Text := IntToStr(nNowCharo) + '번 차로';

    //2018.01.09 AK프라자 로직 추가 시작//
    if (sInDate < '2012-06-04') or ((sInDate = '2012-06-04') and
        (sInTime < '07:00:00')) then
    begin
      if FormatDateTime('YYYY-MM-DD HH:NN:SS', Now) > '2016-03-01 07:00:00' then
        lbInTime.Caption := '2016-03-01 07:00:00'
      else begin
        if not bApsPay then
          lbInTime.Caption := sInDate + ' ' + sInTime
        else
          lbInTime.Caption := sApsPayDate + ' ' + sAPSPayTime
      end;
    end
    else
    begin
      if not bApsPay then
        lbInTime.Caption := sInDate + ' ' + sInTime
      else
        lbInTime.Caption := sApsPayDate + ' ' + sAPSPayTime
    end;
    //2018.01.09 AK프라자 로직 추가 종료//

//    if (sInDate < '2012-06-04') or ((sInDate = '2012-06-04') and
//        (sInTime < '07:00:00')) then
//    begin
//      if FormatDateTime('YYYY-MM-DD HH:NN:SS', Now) > '2012-06-04 07:00:00' then
//        lbInTime.Caption := '2012-06-04 07:00:00'
//      else
//        lbInTime.Caption := sInDate + ' ' + sInTime;
//    end
//    else
//      lbInTime.Caption := sInDate + ' ' + sInTime;

    sNow := FormatDateTime('YYYY-MM-DD HH:NN:SS', Now);
    lbOutTime.Caption := sNow;
    sParking := '';
    nParkingMin := 0;
    nParkingMin := Trunc
      ((StrToDateTime(MG_AddTime(Copy(sNow, 1, 16), 0, 1, 0, 0) + ':01')
          - StrToDateTime(lbInTime.Caption)) * 24 * 60);
    nNowParkingMin := nParkingMin;
    nDay := nParkingMin div (24 * 60);
    nHour := (nParkingMin mod (24 * 60)) div 60;
    nMin := (nParkingMin mod (24 * 60)) mod 60;

    if nDay > 0 then
      sParking := sParking + IntToStr(nDay) + '일 ';
    if nHour > 0 then
      sParking := sParking + IntToStr(nHour) + '시간 ';
    if nMin > 0 then
      sParking := sParking + IntToStr(nMin) + '분';
    lbParkingTime.Caption := sParking;
    InspectionLog('출차정보: ' + sInCarNo + ', ' + lbInTime.Caption + ', ' + sNow);

    if bFreeTime then
    begin
      if bFreeTimeChk then
      begin
        // 시작시각이 크다.
        if (sFreeTimeS <= FormatDateTime('HH:NN', Now)) or
          (sFreeTimeE >= FormatDateTime('HH:NN', Now)) then
        begin
          FreeTimeProc(nowLpr);
          // MichulProc(sInCarNo);
          bNCOutProcWait := False;
          Exit;
        end;
      end
      else
      begin
        if (sFreeTimeS <= FormatDateTime('HH:NN', Now)) and
          (sFreeTimeE >= FormatDateTime('HH:NN', Now)) then
        begin
          FreeTimeProc(nowLpr);
          // MichulProc(sInCarNo);
          bNCOutProcWait := False;
          Exit;
        end;
      end;
    end;
    //2018.01.09 AK프라자 로직 추가 시작//
    //if (FormatDateTime('YYYY-MM-DD HH:NN', StrToDateTime(Copy(lbInTime.Caption, 1, 16)) + StrToTime(GTime.GT1)) > Copy(sNow, 1, 16)) or
//    if GracetimeCheck(Copy(lbInTime.Caption, 1, 16), Copy(sNow, 1, 16)) or
//       (Copy(lbInTime.Caption, 1, 16) = Copy(sNow, 1, 16)) then
    if
        //일요일 또는 휴일
       (((chkHoliday(Copy(sNow, 1, 10))) or ((DayOfWeek(Now) = 1))) and
       (FormatDateTime('YYYY-MM-DD HH:NN',
        StrToDateTime(Copy(lbInTime.Caption, 1, 16)) + StrToTime(GTime.GT8)) >= Copy(sNow, 1, 16)) or
       (Copy(lbInTime.Caption, 1, 16) = Copy(sNow, 1, 16)) and (not bApsPay)) or

       //토요일
       ((not chkHoliday(Copy(sNow, 1, 10))) and ((DayOfWeek(Now) = 7)) and
       (FormatDateTime('YYYY-MM-DD HH:NN',
        StrToDateTime(Copy(lbInTime.Caption, 1, 16)) + StrToTime(GTime.GT5)) >= Copy(sNow, 1, 16)) or
       (Copy(lbInTime.Caption, 1, 16) = Copy(sNow, 1, 16))  and (not bApsPay)) or

       //평일
       (((not chkHoliday(Copy(sNow, 1, 10))) and ((DayOfWeek(Now) >= 2) and (DayOfWeek(Now) <= 6))) and
       (FormatDateTime('YYYY-MM-DD HH:NN',
        StrToDateTime(Copy(lbInTime.Caption, 1, 16)) + StrToTime(GTime.GT1)) >= Copy(sNow, 1, 16)) or
       (Copy(lbInTime.Caption, 1, 16) = Copy(sNow, 1, 16)) and (not bApsPay)) or

       //사전무인정산
       ((FormatDateTime('YYYY-MM-DD HH:NN',
        StrToDateTime(Copy(lbInTime.Caption, 1, 16)) + StrToTime(GTime.GT2)) >= Copy(sNow, 1, 16))
        and bApsPay)
    then
    //2018.01.09 AK프라자 로직 추가 종료//
    begin
      // 회차허용차량...
      // DB Write...
      with dmTables.qryNormalOut2 do
      begin

        if bOperation then
        begin
          // 정상운영시 처리...
          Close;
          SQL.Clear;
          SQL.Add(
            'Select * from TKProc where ParkNo = :N1 and UnitNo = :N2 and ');
          SQL.Add('ProcDate = :N3 and ProcTime = :N4 and TKNo = :N5');
          Parameters.ParamByName('N1').Value := nCurrParkNo;
          Parameters.ParamByName('N2').Value := nCurrUnitNo;
          Parameters.ParamByName('N3').Value := Copy(sNow, 1, 10);
          Parameters.ParamByName('N4').Value := Copy(sNow, 12, 8);
          Parameters.ParamByName('N5').Value := sInTKNo;
          Open;

          if RecordCount <= 0 then
          begin
            Close;
            SQL.Clear;
            SQL.Add('Insert Into TKProc ');
            SQL.Add(
              '(ParkNo, UnitNo, ProcDate, ProcTime, TKType, CarType, FeeNo, ');
            SQL.Add(
              'TKNo, TKParkNo, TKUnitNo, CarNo, InDate, InTime, ParkingMin, ');
            SQL.Add(
              'TotFee, TotDC, RealFee, RecvAmt, Change, DCCnt, MNo, UnPaid, ');
            SQL.Add('ChkClosing, CommercialTariff, SpecialTariff, PayType, Reserve2) ');
            SQL.Add(
              'Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, ');
            SQL.Add(
              ':N11, :N12, :N13, :N14, :N15, :N16, :N17, :N18, :N19, :N20, ');
            SQL.Add(':N21, :N22, :N23, :N24, :N25, :N26, :N27)');
            Parameters.ParamByName('N1').Value := nCurrParkNo;
            Parameters.ParamByName('N2').Value := nCurrUnitNo;
            Parameters.ParamByName('N3').Value := Copy(sNow, 1, 10);
            Parameters.ParamByName('N4').Value := Copy(sNow, 12, 8);
            Parameters.ParamByName('N5').Value := nTKType;
            Parameters.ParamByName('N6').Value := nCarType;
            Parameters.ParamByName('N7').Value := nFeeNo;
            Parameters.ParamByName('N8').Value := sInTKNo;
            Parameters.ParamByName('N9').Value := nCurrParkNo;
            Parameters.ParamByName('N10').Value := nInUnitNo;
            Parameters.ParamByName('N11').Value := sInCarNo;
            Parameters.ParamByName('N12').Value := sInDate;
            Parameters.ParamByName('N13').Value := sInTime;
            Parameters.ParamByName('N14').Value := nParkingMin;
            Parameters.ParamByName('N15').Value := 0;
            Parameters.ParamByName('N16').Value := 0;
            Parameters.ParamByName('N17').Value := 0;
            Parameters.ParamByName('N18').Value := 0;
            Parameters.ParamByName('N19').Value := 0;
            Parameters.ParamByName('N20').Value := 0;
            Parameters.ParamByName('N21').Value := nCurrMNo;
            Parameters.ParamByName('N22').Value := 0;
            Parameters.ParamByName('N23').Value := 0;
            Parameters.ParamByName('N24').Value := 0;
            Parameters.ParamByName('N25').Value := 0;
            Parameters.ParamByName('N26').Value := 1;
            Parameters.ParamByName('N27').Value := '회차';
            ExecSQL;
          end;

          Close;
          SQL.Clear;
          SQL.Add(
            'Select * from IONData Where ParkNo = :N1 and UnitNo = :N2 and ProcDate = :N3 and ');
          SQL.Add('ProcTime = :N4 and TKNo = :N5');
          Parameters.ParamByName('N1').Value := nCurrParkNo;
          Parameters.ParamByName('N2').Value := nInUnitNo;
          Parameters.ParamByName('N3').Value := sInDate;
          Parameters.ParamByName('N4').Value := sInTime;
          Parameters.ParamByName('N5').Value := sInTKNo;
          Open;

          if RecordCount > 0 then
          begin
            // InData에 입차자료가 있으면...
            Close;
            SQL.Clear;
            SQL.Add(
              'Update IONData Set OutUnitNo = :N1, OutDate = :N2, OutTime = :N3, OutChk = :N4, ');
            SQL.Add(
              'OutImage1 = :N5, OutCarNo1 = :N6, OutImage2 = :N7, OutCarNo2 = :N8, ');
            SQL.Add('OutRecog1 = :N9, OutRecog2 = :N10, Reserve1 = :N16 ');
            SQL.Add(
              'where ParkNo = :N11 and UnitNo = :N12 and ProcDate = :N13 and ProcTime = :N14 and TKNo = :N15');
            Parameters.ParamByName('N1').Value := nLprNo;
            Parameters.ParamByName('N2').Value := Copy(sNow, 1, 10);
            Parameters.ParamByName('N3').Value := Copy(sNow, 12, 8);
            Parameters.ParamByName('N4').Value := 4;
            Parameters.ParamByName('N5').Value := sLprFile1;
            Parameters.ParamByName('N6').Value := sLprCarNo1;
            Parameters.ParamByName('N7').Value := sLprFile2;
            Parameters.ParamByName('N8').Value := sLprCarNo2;
            Parameters.ParamByName('N9').Value := nLprRecog1;
            Parameters.ParamByName('N10').Value := nLprRecog2;
            Parameters.ParamByName('N11').Value := nCurrParkNo;
            Parameters.ParamByName('N12').Value := nInUnitNo;
            Parameters.ParamByName('N13').Value := sInDate;
            Parameters.ParamByName('N14').Value := sInTime;
            Parameters.ParamByName('N15').Value := sInTKNo;

            if bMiProc then
              Parameters.ParamByName('N16').Value := '미인식처리'
            else if bManualOut then
              Parameters.ParamByName('N16').Value := '수동출차'
            else
              Parameters.ParamByName('N16').Value := '';
            ExecSQL;

            //2018.01.09 AK프라자 로직 추가 시작//
            //웹할인 처리 안된 자료를 출차 기준으로 업데이트 한다.
            Close;
            SQL.Clear;
            SQL.Add
              ('Update tblStoreDiscountPublish Set OutYmd = :N1, OutHms = :N2, Remark = :N3 ');
            SQL.Add('where NorKey = :N4 and DelYn = 0 and outYmd is null ');
            Parameters.ParamByName('N1').Value := sNowOutDate;
            Parameters.ParamByName('N2').Value := sNowOutTime;
            Parameters.ParamByName('N3').Value := '회차';
            Parameters.ParamByName('N4').Value := sNowInTKNo;
            ExecSQL;
            //2018.01.09 AK프라자 로직 추가 종료//

          end
          else
          begin
            // InData에 입차자료가 없으면...
            ExceptLogging('TfrmMain.NormalOut: 입차자료없음-' + sLprCarNo1 + ', ' +
                sLprCarNo2);
          end;
        end
        else
        begin
          // 개방운영시 처리...
          Close;
          SQL.Clear;
          SQL.Add(
            'Select * from FreeIOData Where ParkNo = :N1 and UnitNo = :N2 and ProcDate = :N3 and ');
          SQL.Add('ProcTime = :N4 ');
          Parameters.ParamByName('N1').Value := nCurrParkNo;
          Parameters.ParamByName('N2').Value := nInUnitNo;
          Parameters.ParamByName('N3').Value := sInDate;
          Parameters.ParamByName('N4').Value := sInTime;
          Open;

          if RecordCount > 0 then
          begin
            // InData에 입차자료가 있으면...
            Close;
            SQL.Clear;
            SQL.Add(
              'Update FreeIOData Set OutUnitNo = :N1, OutDate = :N2, OutTime = :N3, OutChk = :N4, ');
            SQL.Add(
              'OutImage1 = :N5, OutCarNo1 = :N6, OutImage2 = :N7, OutCarNo2 = :N8, ');
            SQL.Add(
              'OutRecog1 = :N9, OutRecog2 = :N10, Reserve1 = :N15, ParkingMin = :N16, ParkingAmt = :N17 ');
            SQL.Add(
              'where ParkNo = :N11 and UnitNo = :N12 and ProcDate = :N13 and ProcTime = :N14');
            Parameters.ParamByName('N1').Value := nLprNo;
            Parameters.ParamByName('N2').Value := Copy(sNow, 1, 10);
            Parameters.ParamByName('N3').Value := Copy(sNow, 12, 8);
            Parameters.ParamByName('N4').Value := 4;
            Parameters.ParamByName('N5').Value := sLprFile1;
            Parameters.ParamByName('N6').Value := sLprCarNo1;
            Parameters.ParamByName('N7').Value := sLprFile2;
            Parameters.ParamByName('N8').Value := sLprCarNo2;
            Parameters.ParamByName('N9').Value := nLprRecog1;
            Parameters.ParamByName('N10').Value := nLprRecog2;
            Parameters.ParamByName('N11').Value := nCurrParkNo;
            Parameters.ParamByName('N12').Value := nInUnitNo;
            Parameters.ParamByName('N13').Value := sInDate;
            Parameters.ParamByName('N14').Value := sInTime;

            if bMiProc then
              Parameters.ParamByName('N15').Value := '미인식처리'
            else if bManualOut then
              Parameters.ParamByName('N15').Value := '수동출차'
            else
              Parameters.ParamByName('N15').Value := '';

            Parameters.ParamByName('N16').Value := nParkingMin;
            Parameters.ParamByName('N17').Value := 0;
            ExecSQL;
          end
          else
          begin
            // InData에 입차자료가 없으면...
            ExceptLogging('TfrmMain.NormalOut: 입차자료없음-' + sLprCarNo1 + ', ' +
                sLprCarNo2);
          end;
        end;

//        Close;
//        SQL.Clear;
//        SQL.Add('Select * from IONCount where ProcDate = :N1');
//        Parameters.ParamByName('N1').Value := FormatDateTime('YYYY-MM-DD', Now);
//        Open;
//        nNOutCnt := 0;
//
//        for i := 0 to 23 do
//          nNOutCnt := nNOutCnt + FieldByName('Out' + MG_InsZero(IntToStr(i), 2))
//            .AsInteger;
      end;

      for i := 1 to 6 do
      begin
        TLabel(FindComponent('lbYogum' + IntToStr(i))).Visible := False;
      end;
      lbYogum1.Caption := '0';
      lbYogum1.Visible := True;
//
//      DspProc(2, 1, '회차허용차량' + MG_Left(sInCarNo, 12), sDspIP);
      OutOpen(csLPR);
//      NGridData('2' + sInCarNo + '^' + Copy(sNow, 1, 10) + ' ' + Copy
//          (sNow, 12, 8) + '^회차차량');

     //2018.01.09 AK프라자 로직 추가 시작//
      if not bApsPay then
      begin
        NGridData('2' + sInCarNo + '^' + Copy(sNow, 1, 10) + ' ' + Copy(sNow, 12, 8) + '^회차차량');
        DspProc(2, 1, '회차허용차량' + MG_Left(sInCarNo, 12), sDspIP);
        InspectionLog('회차차량');
      end
      else
      begin
        NGridData('2' + sInCarNo + '^' + Copy(sNow, 1, 10) + ' ' + Copy(sNow, 12, 8) + '^사전정산차량');
        DspProc(2, 1, '사전정산차량' + MG_Left(sInCarNo, 12), sDspIP);
        InspectionLog('사전정산차량');
      end;
      //2018.01.09 AK프라자 로직 추가 종료//

      sPrtData := '';
      InspectionLog('회차차량');
      // MichulProc(sInCarNo);
      ClearFormData;
    end
    else
    begin
      sNowLprFile1 := sLprFile1;
      sNowLprCarNo1 := sLprCarNo1;
      sNowLprFile2 := sLprFile2;
      sNowLprCarNo2 := sLprCarNo2;
      sNowIOTime := sIOTime;
      nNowLprNo := nLprNo;
      nNowLprInOut := nLprInOut;
      nNowLprRecog1 := nLprRecog1;
      nNowLprRecog2 := nLprRecog2;
      sNowInTKNo := sInTKNo;
      nNowInUnitNo := nInUnitNo;
      sNowInDate := sInDate;
      sNowInTime := sInTime;
      sNowInCarNo := sInCarNo;
      sNowOutDate := Copy(sNow, 1, 10);
      sNowOutTime := Copy(sNow, 12, 8);
      sTimeDCOutDate := sNowOutDate;
      sTimeDCOutTime := sNowOutTime;

      //주차요금 계산전에 기존 할인자료 등 클리어한다.
      for i := 1 to 50 do
        RDCCnt[i].nDCNowCnt := 0;

      ClearGTime;
      ClearDCProc;
//2018.01.09 AK프라자 로직 추가 시작//
      if not bApsPay then
      begin
        if bFreeTime then
        begin
          if sFreeTimeE > Copy(sNowInTime, 1, 5) then
            nTotYogum := FeeCalc(nCurrParkNo, nFeeNo, PAnsiChar(sNowInDate + ' ' + sFreeTimeE),
                                 PAnsiChar(Copy(sNow, 1, 16)))
          else
            nTotYogum := FeeCalc(nCurrParkNo, nFeeNo, PAnsiChar(sNowInDate + ' ' + Copy(sNowInTime, 1, 5)),
                                 PAnsiChar(Copy(sNow, 1, 16)));
        end
        else
          nTotYogum := FeeCalc(nCurrParkNo, nFeeNo, PAnsiChar(sNowInDate + ' ' + Copy(sNowInTime, 1, 5)),
                               PAnsiChar(Copy(sNow, 1, 16)));
      end
      else
      begin
        if bFreeTime then
        begin
          if sFreeTimeE > Copy(sAPSPayTime, 1, 5) then
            nTotYogum := FeeCalc(nCurrParkNo, nFeeNo, PAnsiChar(sAPSPayDate + ' ' + sFreeTimeE),
                                 PAnsiChar(Copy(sNow, 1, 16)))
          else
            nTotYogum := FeeCalc(nCurrParkNo, nFeeNo, PAnsiChar(sAPSPayDate + ' ' + Copy(sAPSPayTime, 1, 5)),
                                 PAnsiChar(Copy(sNow, 1, 16)));
        end
        else
        begin
          nTotYogum := FeeCalc(nCurrParkNo, nFeeNo, PAnsiChar(sAPSPayDate + ' ' + Copy(sAPSPayTime, 1, 5)),
                               PAnsiChar(Copy(sNow, 1, 16)));
        end;
      end;

      nProcYogum := nTotYogum;
      edtTotYogum.Text := IntToStr(nTotYogum);
      edtTotYogum.AutoThousandSeparator := True;
      //edtProcYogum.Text := IntToStr(nTotYogum);
      edtProcYogum.Text := FormatFloat('#,##0', nTotYogum);
      sProcTime := sNow;
      sDCOutTime := sNow;
      DCProcess(sNowInTKNo,sLprCarNo1);
      sYogum := IntToStr(nProcYogum);
      //2018.01.09 AK프라자 로직 추가 종료//

//      if bFreeTime then
//      begin
//        if sFreeTimeE > Copy(sNowInTime, 1, 5) then
//          nTotYogum := FeeCalc(nCurrParkNo, nFeeNo, PAnsiChar(sNowInDate + ' ' + sFreeTimeE),
//                               PAnsiChar(Copy(sNow, 1, 16)))
//        else
//          nTotYogum := FeeCalc(nCurrParkNo, nFeeNo, PAnsiChar(sNowInDate + ' ' + Copy(sNowInTime, 1, 5)),
//                               PAnsiChar(Copy(sNow, 1, 16)));
//      end
//      else
//        nTotYogum := FeeCalc(nCurrParkNo, nFeeNo, PAnsiChar(sNowInDate + ' ' + Copy(sNowInTime, 1, 5)),
//                             PAnsiChar(Copy(sNow, 1, 16)));
//
//      nProcYogum := nTotYogum;
//      edtTotYogum.Text := IntToStr(nTotYogum);
//      edtTotYogum.AutoThousandSeparator := True;
//      //edtProcYogum.Text := IntToStr(nTotYogum);
//      edtProcYogum.Text := FormatFloat('#,##0', nTotYogum);
//      //edtProcYogum.AutoThousandSeparator := True;
//      sYogum := IntToStr(nTotYogum);

      for i := 1 to 6 do
        TLabel(FindComponent('lbYogum' + IntToStr(i))).Visible := False;

      for i := 1 to Length(sYogum) do
      begin
        TLabel(FindComponent('lbYogum' + IntToStr(i))).Visible := True;
        TLabel(FindComponent('lbYogum' + IntToStr(i))).Caption := Copy
          (sYogum, Length(sYogum) - (i - 1), 1);
      end;

      if bOperation then
      begin
        for i := 1 to nUseBtnCnt do
        begin
          TAdvShapeButton(FindComponent('btn' + IntToStr(i))).Enabled := True;
          TMenuItem(FindComponent('mnuDC' + IntToStr(i))).Enabled := True;
        end;
      end;
      lbOutCarType.Caption := '일반차량';

      //if edtProcYogum.Text <> '0' then
      //  DspProc(2, 3, '주차요금    ' + MG_Right(edtProcYogum.Text + '원', 12), sDspIP)
      //else
      if edtProcYogum.Text = '0' then
        DspProc(2, 4, '회차허용차량' + MG_Left(sInCarNo, 12), sDspIP);

      InspectionLog('주차요금: ' + edtProcYogum.Text);

      if bOperation then
      begin
        // 정상운영시 처리...
        if nProcYogum > 0 then
        begin
          btnProc.Enabled := True;

          if bCancel then
            btnCancel.Enabled := True;
          DCEnable(True);

          if bBarcodeDC then
          begin
            edtBarcode.Text := '';
            edtBarcode.SetFocus;
          end;
          sProcTime := sNow;
          sDCOutTime := sNow;

          if bTest then
          begin
            nPayType := 1;
            MoneyProc(nowLpr);
          end;
        end
        else
        begin
          if bZeroOpen then
          begin
            // 주차요금 0원시 자동오픈이면...
            bZeroOut := True;
            MoneyProc(nowLpr);
            bZeroOut := False;
          end;
        end;
      end
      else
      begin
        // 개방운영시 처리...
        // DB Write...
        with dmTables.qryNormalOut2 do
        begin
//          Close;
//          SQL.Clear;
//          SQL.Add(
//            'Select * from IONCount Where ParkNo = :N1 and UnitNo = :N2 and ProcDate = :N3');
//          Parameters.ParamByName('N1').Value := nCurrParkNo;
//          Parameters.ParamByName('N2').Value := nLprNo;
//          Parameters.ParamByName('N3').Value := Copy(sNow, 1, 10);
//          Open;
//
//          if RecordCount > 0 then
//          begin
//            Case StrToInt(FormatDateTime('HH', Now)) of
//              0:
//                nOutCnt := FieldByName('Out00').AsInteger + 1;
//              1:
//                nOutCnt := FieldByName('Out01').AsInteger + 1;
//              2:
//                nOutCnt := FieldByName('Out02').AsInteger + 1;
//              3:
//                nOutCnt := FieldByName('Out03').AsInteger + 1;
//              4:
//                nOutCnt := FieldByName('Out04').AsInteger + 1;
//              5:
//                nOutCnt := FieldByName('Out05').AsInteger + 1;
//              6:
//                nOutCnt := FieldByName('Out06').AsInteger + 1;
//              7:
//                nOutCnt := FieldByName('Out07').AsInteger + 1;
//              8:
//                nOutCnt := FieldByName('Out08').AsInteger + 1;
//              9:
//                nOutCnt := FieldByName('Out09').AsInteger + 1;
//              10:
//                nOutCnt := FieldByName('Out10').AsInteger + 1;
//              11:
//                nOutCnt := FieldByName('Out11').AsInteger + 1;
//              12:
//                nOutCnt := FieldByName('Out12').AsInteger + 1;
//              13:
//                nOutCnt := FieldByName('Out13').AsInteger + 1;
//              14:
//                nOutCnt := FieldByName('Out14').AsInteger + 1;
//              15:
//                nOutCnt := FieldByName('Out15').AsInteger + 1;
//              16:
//                nOutCnt := FieldByName('Out16').AsInteger + 1;
//              17:
//                nOutCnt := FieldByName('Out17').AsInteger + 1;
//              18:
//                nOutCnt := FieldByName('Out18').AsInteger + 1;
//              19:
//                nOutCnt := FieldByName('Out19').AsInteger + 1;
//              20:
//                nOutCnt := FieldByName('Out20').AsInteger + 1;
//              21:
//                nOutCnt := FieldByName('Out21').AsInteger + 1;
//              22:
//                nOutCnt := FieldByName('Out22').AsInteger + 1;
//              23:
//                nOutCnt := FieldByName('Out23').AsInteger + 1;
//            end;
//            Close;
//            SQL.Clear;
//            SQL.Add('Update IONCount ');
//
//            Case StrToInt(FormatDateTime('HH', Now)) of
//              0:
//                SQL.Add('Set Out00 = :N1 ');
//              1:
//                SQL.Add('Set Out01 = :N1 ');
//              2:
//                SQL.Add('Set Out02 = :N1 ');
//              3:
//                SQL.Add('Set Out03 = :N1 ');
//              4:
//                SQL.Add('Set Out04 = :N1 ');
//              5:
//                SQL.Add('Set Out05 = :N1 ');
//              6:
//                SQL.Add('Set Out06 = :N1 ');
//              7:
//                SQL.Add('Set Out07 = :N1 ');
//              8:
//                SQL.Add('Set Out08 = :N1 ');
//              9:
//                SQL.Add('Set Out09 = :N1 ');
//              10:
//                SQL.Add('Set Out10 = :N1 ');
//              11:
//                SQL.Add('Set Out11 = :N1 ');
//              12:
//                SQL.Add('Set Out12 = :N1 ');
//              13:
//                SQL.Add('Set Out13 = :N1 ');
//              14:
//                SQL.Add('Set Out14 = :N1 ');
//              15:
//                SQL.Add('Set Out15 = :N1 ');
//              16:
//                SQL.Add('Set Out16 = :N1 ');
//              17:
//                SQL.Add('Set Out17 = :N1 ');
//              18:
//                SQL.Add('Set Out18 = :N1 ');
//              19:
//                SQL.Add('Set Out19 = :N1 ');
//              20:
//                SQL.Add('Set Out20 = :N1 ');
//              21:
//                SQL.Add('Set Out21 = :N1 ');
//              22:
//                SQL.Add('Set Out22 = :N1 ');
//              23:
//                SQL.Add('Set Out23 = :N1 ');
//            end;
//            SQL.Add('Where ParkNo = :N2 and UnitNo = :N3 and ProcDate = :N4');
//            Parameters.ParamByName('N1').Value := nOutCnt;
//            Parameters.ParamByName('N2').Value := nCurrParkNo;
//            Parameters.ParamByName('N3').Value := nLprNo;
//            Parameters.ParamByName('N4').Value := Copy(sNow, 1, 10);
//            ExecSQL;
//            Close;
//          end
//          else
//          begin
//            Close;
//            SQL.Clear;
//            SQL.Add('Insert Into IONCount ');
//            SQL.Add
//              ('(ParkNo, UnitNo, ProcDate, In00, In01, In02, In03, In04, ');
//            SQL.Add(
//              'In05, In06, In07, In08, In09, In10, In11, In12, In13, In14, ');
//            SQL.Add(
//              'In15, In16, In17, In18, In19, In20, In21, In22, In23, Out00, ');
//            SQL.Add(
//              'Out01, Out02, Out03, Out04, Out05, Out06, Out07, Out08, Out09, '
//              );
//            SQL.Add(
//              'Out10, Out11, Out12, Out13, Out14, Out15, Out16, Out17, Out18, '
//              );
//            SQL.Add('Out19, Out20, Out21, Out22, Out23) Values ');
//            SQL.Add('(:N1, :N2, :N3, 0, 0, 0, 0, 0, 0, 0, ');
//            SQL.Add(
//              '0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ');
//            SQL.Add('0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)');
//            Parameters.ParamByName('N1').Value := nCurrParkNo;
//            Parameters.ParamByName('N2').Value := nLprNo;
//            Parameters.ParamByName('N3').Value := Copy(sNow, 1, 10);
//            ExecSQL;
//
//            Close;
//            SQL.Clear;
//            SQL.Add('UpDate IONCount ');
//
//            Case StrToInt(FormatDateTime('HH', Now)) of
//              0:                  SQL.Add('Set Out00 = :N1 ');
//              1:                  SQL.Add('Set Out01 = :N1 ');
//              2:                  SQL.Add('Set Out02 = :N1 ');
//              3:                  SQL.Add('Set Out03 = :N1 ');
//              4:                  SQL.Add('Set Out04 = :N1 ');
//              5:                  SQL.Add('Set Out05 = :N1 ');
//              6:                  SQL.Add('Set Out06 = :N1 ');
//              7:                  SQL.Add('Set Out07 = :N1 ');
//              8:                  SQL.Add('Set Out08 = :N1 ');
//              9:                  SQL.Add('Set Out09 = :N1 ');
//              10:                 SQL.Add('Set Out10 = :N1 ');
//              11:                 SQL.Add('Set Out11 = :N1 ');
//              12:                 SQL.Add('Set Out12 = :N1 ');
//              13:                 SQL.Add('Set Out13 = :N1 ');
//              14:                 SQL.Add('Set Out14 = :N1 ');
//              15:                 SQL.Add('Set Out15 = :N1 ');
//              16:                 SQL.Add('Set Out16 = :N1 ');
//              17:                 SQL.Add('Set Out17 = :N1 ');
//              18:                 SQL.Add('Set Out18 = :N1 ');
//              19:                 SQL.Add('Set Out19 = :N1 ');
//              20:                 SQL.Add('Set Out20 = :N1 ');
//              21:                 SQL.Add('Set Out21 = :N1 ');
//              22:                 SQL.Add('Set Out22 = :N1 ');
//              23:                 SQL.Add('Set Out23 = :N1 ');
//            end;
//            SQL.Add('Where ParkNo = :N2 and UnitNo = :N3 and ProcDate = :N4');
//            Parameters.ParamByName('N1').Value := 1;
//            Parameters.ParamByName('N2').Value := nCurrParkNo;
//            Parameters.ParamByName('N3').Value := nLprNo;
//            Parameters.ParamByName('N4').Value := Copy(sNow, 1, 10);
//            ExecSQL;
//          end;

          Close;
          SQL.Clear;
          SQL.Add(
            'Select * from FreeIOData Where ParkNo = :N1 and UnitNo = :N2 and ProcDate = :N3 and ');
          SQL.Add('ProcTime = :N4 ');
          Parameters.ParamByName('N1').Value := nCurrParkNo;
          Parameters.ParamByName('N2').Value := nInUnitNo;
          Parameters.ParamByName('N3').Value := sInDate;
          Parameters.ParamByName('N4').Value := sInTime;
          Open;

          if RecordCount > 0 then
          begin
            // InData에 입차자료가 있으면...
            Close;
            SQL.Clear;
            SQL.Add('Update FreeIOData Set OutUnitNo = :N1, OutDate = :N2, OutTime = :N3, OutChk = :N4, ');
            SQL.Add('OutImage1 = :N5, OutCarNo1 = :N6, OutImage2 = :N7, OutCarNo2 = :N8, ');
            SQL.Add(
              'OutRecog1 = :N9, OutRecog2 = :N10, Reserve3 = :N15, ParkingMin = :N16, ParkingAmt = :N17 ');
            SQL.Add(
              'where ParkNo = :N11 and UnitNo = :N12 and ProcDate = :N13 and ProcTime = :N14');
            Parameters.ParamByName('N1').Value := nLprNo;
            Parameters.ParamByName('N2').Value := Copy(sNow, 1, 10);
            Parameters.ParamByName('N3').Value := Copy(sNow, 12, 8);
            Parameters.ParamByName('N4').Value := 4;
            Parameters.ParamByName('N5').Value := sLprFile1;
            Parameters.ParamByName('N6').Value := sLprCarNo1;
            Parameters.ParamByName('N7').Value := sLprFile2;
            Parameters.ParamByName('N8').Value := sLprCarNo2;
            Parameters.ParamByName('N9').Value := nLprRecog1;
            Parameters.ParamByName('N10').Value := nLprRecog2;
            Parameters.ParamByName('N11').Value := nCurrParkNo;
            Parameters.ParamByName('N12').Value := nInUnitNo;
            Parameters.ParamByName('N13').Value := sInDate;
            Parameters.ParamByName('N14').Value := sInTime;
            Parameters.ParamByName('N15').Value := '';
            Parameters.ParamByName('N16').Value := nParkingMin;
            Parameters.ParamByName('N17').Value := nTotYogum;
            ExecSQL;
          end
          else
          begin
            // InData에 입차자료가 없으면...
            ExceptLogging('TfrmMain.NormalOut: 입차자료없음-' + sLprCarNo1 + ', ' + sLprCarNo2);
          end;

          Close;
          SQL.Clear;
          SQL.Add('Select * from IONCount where ProcDate = :N1');
          Parameters.ParamByName('N1').Value := FormatDateTime('YYYY-MM-DD', Now);
          Open;
          nNOutCnt := 0;

          for i := 0 to 23 do
            nNOutCnt := nNOutCnt + FieldByName('Out' + MG_InsZero(IntToStr(i), 2)).AsInteger;
        end;
        OutOpen(csLPR);
        NGridData('2' + sInCarNo + '^' + Copy(sNow, 1, 10) + ' ' + Copy(sNow, 12, 8) + '^0원');
        sPrtData := '';
        // MichulProc(sInCarNo);
        bNCOutProcWait := False;
      end;
    end;
  except
    on E: Exception do
      ExceptLogging('NormalOut: ' + aString(E.Message));
  end;
end;

procedure TfrmMainNew.NormalProc(sLprFile1, sLprCarNo1, sLprFile2, sLprCarNo2,
  sIOTime: aString; nLprNo, nLprInOut, nLprRecog1, nLprRecog2: Byte;
  sDspIP: aString; csLPR: TClientSocket; bOpen: Boolean);
var
  sTKNo, sLprDate, sLprTime, sSend, sTemp, sFileIP: aString;
  nInCnt: Word;
  bVip : Boolean;
begin
  try
    ExceptLogging('일반차량: ' + sLprCarNo1 + ', ' + sLprCarNo2);
    sLprDate := Copy(sIOTime, 1, 10);
    sLprTime := Copy(sIOTime, 12, 8);

    if nLprInOut = 1 then
    begin
      // 입차처리...
      try
        bNCInProcWait := True;

        // 동일한 차량번호로 입차된 기존 미출차차량은 미출차정리로 처리...
        if (sLprCarNo1 <> '') and (sLprCarNo1 <> '0000000000') then
          MichulProc(sLprCarNo1, sLprDate, sLprTime);

        if (sLprCarNo2 <> '') and (sLprCarNo2 <> '0000000000') then
          MichulProc(sLprCarNo2, sLprDate, sLprTime);

        sTKNo := MG_InsZero(IntToStr(GetTickCount), 10);

        with dmTables.qryNormal do
        begin
          Close;
          SQL.Clear;
          SQL.Add(
            'Select * from IONCount Where ParkNo = :N1 and UnitNo = :N2 and ProcDate = :N3');
          Parameters.ParamByName('N1').Value := nCurrParkNo;
          Parameters.ParamByName('N2').Value := nLprNo;
          Parameters.ParamByName('N3').Value := Copy(sLprDate, 1, 10);
          Open;

          if RecordCount > 0 then
          begin
            Case StrToInt(FormatDateTime('HH', Now)) of
              0:
                nInCnt := FieldByName('In00').AsInteger + 1;
              1:
                nInCnt := FieldByName('In01').AsInteger + 1;
              2:
                nInCnt := FieldByName('In02').AsInteger + 1;
              3:
                nInCnt := FieldByName('In03').AsInteger + 1;
              4:
                nInCnt := FieldByName('In04').AsInteger + 1;
              5:
                nInCnt := FieldByName('In05').AsInteger + 1;
              6:
                nInCnt := FieldByName('In06').AsInteger + 1;
              7:
                nInCnt := FieldByName('In07').AsInteger + 1;
              8:
                nInCnt := FieldByName('In08').AsInteger + 1;
              9:
                nInCnt := FieldByName('In09').AsInteger + 1;
              10:
                nInCnt := FieldByName('In10').AsInteger + 1;
              11:
                nInCnt := FieldByName('In11').AsInteger + 1;
              12:
                nInCnt := FieldByName('In12').AsInteger + 1;
              13:
                nInCnt := FieldByName('In13').AsInteger + 1;
              14:
                nInCnt := FieldByName('In14').AsInteger + 1;
              15:
                nInCnt := FieldByName('In15').AsInteger + 1;
              16:
                nInCnt := FieldByName('In16').AsInteger + 1;
              17:
                nInCnt := FieldByName('In17').AsInteger + 1;
              18:
                nInCnt := FieldByName('In18').AsInteger + 1;
              19:
                nInCnt := FieldByName('In19').AsInteger + 1;
              20:
                nInCnt := FieldByName('In20').AsInteger + 1;
              21:
                nInCnt := FieldByName('In21').AsInteger + 1;
              22:
                nInCnt := FieldByName('In22').AsInteger + 1;
              23:
                nInCnt := FieldByName('In23').AsInteger + 1;
            end;
            Close;
            SQL.Clear;
            SQL.Add('Update IONCount ');

            Case StrToInt(FormatDateTime('HH', Now)) of
              0:
                SQL.Add('Set In00 = :N1 ');
              1:
                SQL.Add('Set In01 = :N1 ');
              2:
                SQL.Add('Set In02 = :N1 ');
              3:
                SQL.Add('Set In03 = :N1 ');
              4:
                SQL.Add('Set In04 = :N1 ');
              5:
                SQL.Add('Set In05 = :N1 ');
              6:
                SQL.Add('Set In06 = :N1 ');
              7:
                SQL.Add('Set In07 = :N1 ');
              8:
                SQL.Add('Set In08 = :N1 ');
              9:
                SQL.Add('Set In09 = :N1 ');
              10:
                SQL.Add('Set In10 = :N1 ');
              11:
                SQL.Add('Set In11 = :N1 ');
              12:
                SQL.Add('Set In12 = :N1 ');
              13:
                SQL.Add('Set In13 = :N1 ');
              14:
                SQL.Add('Set In14 = :N1 ');
              15:
                SQL.Add('Set In15 = :N1 ');
              16:
                SQL.Add('Set In16 = :N1 ');
              17:
                SQL.Add('Set In17 = :N1 ');
              18:
                SQL.Add('Set In18 = :N1 ');
              19:
                SQL.Add('Set In19 = :N1 ');
              20:
                SQL.Add('Set In20 = :N1 ');
              21:
                SQL.Add('Set In21 = :N1 ');
              22:
                SQL.Add('Set In22 = :N1 ');
              23:
                SQL.Add('Set In23 = :N1 ');
            end;
            SQL.Add('Where ParkNo = :N2 and UnitNo = :N3 and ProcDate = :N4');
            Parameters.ParamByName('N1').Value := nInCnt;
            Parameters.ParamByName('N2').Value := nCurrParkNo;
            Parameters.ParamByName('N3').Value := nLprNo;
            Parameters.ParamByName('N4').Value := Copy(sLprDate, 1, 10);
            ExecSQL;
            Close;
          end
          else
          begin
            Close;
            SQL.Clear;
            SQL.Add('Insert Into IONCount ');
            SQL.Add
              ('(ParkNo, UnitNo, ProcDate, In00, In01, In02, In03, In04, ');
            SQL.Add(
              'In05, In06, In07, In08, In09, In10, In11, In12, In13, In14, ');
            SQL.Add(
              'In15, In16, In17, In18, In19, In20, In21, In22, In23, Out00, ');
            SQL.Add(
              'Out01, Out02, Out03, Out04, Out05, Out06, Out07, Out08, Out09, '
              );
            SQL.Add(
              'Out10, Out11, Out12, Out13, Out14, Out15, Out16, Out17, Out18, '
              );
            SQL.Add('Out19, Out20, Out21, Out22, Out23) Values ');
            SQL.Add('(:N1, :N2, :N3, 0, 0, 0, 0, 0, 0, 0, ');
            SQL.Add(
              '0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ');
            SQL.Add('0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)');
            Parameters.ParamByName('N1').Value := nCurrParkNo;
            Parameters.ParamByName('N2').Value := nLprNo;
            Parameters.ParamByName('N3').Value := Copy(sLprDate, 1, 10);
            ExecSQL;

            Close;
            SQL.Clear;
            SQL.Add('UpDate IONCount ');

            Case StrToInt(FormatDateTime('HH', Now)) of
              0:
                SQL.Add('Set In00 = :N1 ');
              1:
                SQL.Add('Set In01 = :N1 ');
              2:
                SQL.Add('Set In02 = :N1 ');
              3:
                SQL.Add('Set In03 = :N1 ');
              4:
                SQL.Add('Set In04 = :N1 ');
              5:
                SQL.Add('Set In05 = :N1 ');
              6:
                SQL.Add('Set In06 = :N1 ');
              7:
                SQL.Add('Set In07 = :N1 ');
              8:
                SQL.Add('Set In08 = :N1 ');
              9:
                SQL.Add('Set In09 = :N1 ');
              10:
                SQL.Add('Set In10 = :N1 ');
              11:
                SQL.Add('Set In11 = :N1 ');
              12:
                SQL.Add('Set In12 = :N1 ');
              13:
                SQL.Add('Set In13 = :N1 ');
              14:
                SQL.Add('Set In14 = :N1 ');
              15:
                SQL.Add('Set In15 = :N1 ');
              16:
                SQL.Add('Set In16 = :N1 ');
              17:
                SQL.Add('Set In17 = :N1 ');
              18:
                SQL.Add('Set In18 = :N1 ');
              19:
                SQL.Add('Set In19 = :N1 ');
              20:
                SQL.Add('Set In20 = :N1 ');
              21:
                SQL.Add('Set In21 = :N1 ');
              22:
                SQL.Add('Set In22 = :N1 ');
              23:
                SQL.Add('Set In23 = :N1 ');
            end;
            SQL.Add('Where ParkNo = :N2 and UnitNo = :N3 and ProcDate = :N4');
            Parameters.ParamByName('N1').Value := 1;
            Parameters.ParamByName('N2').Value := nCurrParkNo;
            Parameters.ParamByName('N3').Value := nLprNo;
            Parameters.ParamByName('N4').Value := Copy(sLprDate, 1, 10);
            ExecSQL;
          end;

          Close;
          SQL.Clear;
          SQL.Add('Select top(1) car_no_1 + car_no_2 as carno, Park_time  from dbo.AK_BICARMTB ');
          SQL.Add(' where Car_No_1 + Car_NO_2 = :N1 and park_time is not null and ');
          SQL.Add(' ((SVC_DATE_FR <= :N2) and (SVC_DATE_TO >= :N3)) ') ;
          SQL.Add(' order by park_type ') ;
          Parameters.ParamByName('N1').Value:= sLprCarNo1;
          Parameters.ParamByName('N2').Value:= FormatDateTime('YYYYMMDD', Now);
          Parameters.ParamByName('N3').Value:= FormatDateTime('YYYYMMDD', Now);
          Open;
          if RecordCount > 0 then
          begin
            bVip := True ;
          end
          else
          begin
            bVip := false;
          end;

          if bOperation then
          begin
            // 정상운영...
            Close;
            SQL.Clear;
            Close;
            SQL.Clear;
            SQL.Add('Insert Into IONData ');
            SQL.Add(
              '(ParkNo, UnitNo, ProcDate, ProcTime, TKNo, TKType, CarType, InImage1, InCarNo1, ');
            SQL.Add('InImage2, InCarNo2, Status, InRecog1, InRecog2) ');
            SQL.Add(
              'Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, :N12, :N13, :N14)');
            Parameters.ParamByName('N1').Value := nCurrParkNo;
            Parameters.ParamByName('N2').Value := nLprNo;
            Parameters.ParamByName('N3').Value := sLprDate;
            Parameters.ParamByName('N4').Value := sLprTime;
            Parameters.ParamByName('N5').Value := sTKNo;
            Parameters.ParamByName('N6').Value := 1;
            Parameters.ParamByName('N7').Value := 1;
            Parameters.ParamByName('N8').Value := sLprFile1;
            Parameters.ParamByName('N9').Value := sLprCarNo1;
            Parameters.ParamByName('N10').Value := sLprFile2;
            Parameters.ParamByName('N11').Value := sLprCarNo2;
            Parameters.ParamByName('N12').Value := 1;
            Parameters.ParamByName('N13').Value := nLprRecog1;
            Parameters.ParamByName('N14').Value := nLprRecog2;
            ExecSQL;
          end
          else
          begin
            // 개방운영
            Close;
            SQL.Clear;
            Close;
            SQL.Clear;
            SQL.Add('Insert Into FreeIOData ');
            SQL.Add(
              '(ParkNo, UnitNo, ProcDate, ProcTime, TKType, CarType, InImage1, InCarNo1, ');
            SQL.Add('InImage2, InCarNo2, InRecog1, InRecog2) ');
            SQL.Add(
              'Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, :N12)');
            Parameters.ParamByName('N1').Value := nCurrParkNo;
            Parameters.ParamByName('N2').Value := nLprNo;
            Parameters.ParamByName('N3').Value := sLprDate;
            Parameters.ParamByName('N4').Value := sLprTime;
            Parameters.ParamByName('N5').Value := 1;
            Parameters.ParamByName('N6').Value := 1;
            Parameters.ParamByName('N7').Value := sLprFile1;
            Parameters.ParamByName('N8').Value := sLprCarNo1;
            Parameters.ParamByName('N9').Value := sLprFile2;
            Parameters.ParamByName('N10').Value := sLprCarNo2;
            Parameters.ParamByName('N11').Value := nLprRecog1;
            Parameters.ParamByName('N12').Value := nLprRecog2;
            ExecSQL;
          end;

          if (nLprRecog1 = 1) or (nLprRecog2 = 1) then
          begin
            if nLprRecog1 = 1 then
            begin
              if bVip then
              begin
                NGridData('1' + sLprCarNo1 + '^' + sLprDate + ' ' + sLprTime +
                    '^입 차');
                DspProc(1, 2, MG_Center('VIP 차량', 12) + MG_Left(sLprCarNo1, 12),
                  sDspIP);
              end
              else
              begin
                NGridData('1' + sLprCarNo1 + '^' + sLprDate + ' ' + sLprTime +
                    '^입 차');
                DspProc(1, 2, MG_Left('일반차량', 12) + MG_Left(sLprCarNo1, 12),
                  sDspIP);
              end;
            end
            else if nLprRecog2 = 1 then
            begin
              if bVip then
              begin
                NGridData('1' + sLprCarNo2 + '^' + sLprDate + ' ' + sLprTime +
                    '^입 차');
                DspProc(1, 2, MG_Center('VIP 차량', 12) + MG_Left(sLprCarNo2, 12),
                  sDspIP);
              end
              else
              begin
                NGridData('1' + sLprCarNo2 + '^' + sLprDate + ' ' + sLprTime +
                    '^입 차');
                DspProc(1, 2, MG_Left('일반차량', 12) + MG_Left(sLprCarNo2, 12),
                  sDspIP);
              end;
            end;
          end
          else
          begin
            PartGridData('1' + sLprCarNo1 + '^' + sLprDate + ' ' + sLprTime +
                '^입 차');
            DspProc(1, 2, MG_Left('일반차량', 12) + MG_Left(sLprCarNo1, 12),
              sDspIP);
          end;


          if bOpen then
            InOpen(csLPR);

          ExceptLogging('일반차량입차: ' + sLprCarNo1 + ', ' + sLprCarNo2);
        end;
      finally
        bNCInProcWait := False;

        // 입차시의 이미지는 표시하지 않는다.  2012-05-07 UI 관련 미팅시 송우식 과장...
        // 일반차량 출차시 출차이미지와 함께 입차이미지를 표시한다....
      end;
    end
    else if nLprInOut = 2 then
    begin
      // 출차처리...
      try
        NormalOut(sLprFile1, sLprCarNo1, sLprFile2, sLprCarNo2, sIOTime,
          nLprNo, nLprInOut, nLprRecog1, nLprRecog2, sDspIP, csLPR);
        ExceptLogging('일반차량출차: ' + sLprCarNo1 + ', ' + sLprCarNo2);
      finally
        sTemp := Copy(sLprFile1, 6, Length(sLprFile1) - 5);
        sLprFile1 := Copy(sTemp, 1, Pos(':9080', sTemp) - 1);
        sLprFile1 := sLprFile1 + Copy(sTemp, Pos(':9080', sTemp) + 5, Length
            (sTemp) - (Pos(':9080', sTemp) + 4));
        sLprFile1 := MG_StrConvert(sLprFile1, '/', '\');

        sTemp := Copy(sLprFile2, 6, Length(sLprFile2) - 5);
        sLprFile2 := Copy(sTemp, 1, Pos(':9080', sTemp) - 1);
        sLprFile2 := sLprFile2 + Copy(sTemp, Pos(':9080', sTemp) + 5, Length
            (sTemp) - (Pos(':9080', sTemp) + 4));
        sLprFile2 := MG_StrConvert(sLprFile2, '/', '\');

        try
          if nLprRecog1 = 1 then
          begin
            lbCarNo.Caption := sLprCarNo1;
            lbOutCarNo.Caption := sLprCarNo1;
            sFileIP:= Copy(sLprFile1, 3, Pos('\MSImage', sLprFile1)-3);

            if is_ping(sFileIP) then
            begin
              if FileExists(sLprFile1) then
              begin
                imgOut.Picture.LoadFromFile(sLprFile1);
              end
              else
              begin
                imgOut.Picture.Assign(Nil);
                ExceptLogging('파일없음: ' + sLprFile1);
              end;
            end
            else
            begin
              imgOut.Picture.Assign(Nil);
              ExceptLogging('파일없음: ' + sLprFile1);
            end;
          end
          else if nLprRecog2 = 1 then
          begin
            lbCarNo.Caption := sLprCarNo2;
            lbOutCarNo.Caption := sLprCarNo2;
            sFileIP:= Copy(sLprFile2, 3, Pos('\MSImage', sLprFile2)-3);

            if is_ping(sFileIP) then
            begin
              if FileExists(sLprFile2) then
              begin
                imgOut.Picture.LoadFromFile(sLprFile2);
              end
              else
              begin
                imgOut.Picture.Assign(Nil);
                ExceptLogging('파일없음: ' + sLprFile2);
              end;
            end
            else
            begin
              imgOut.Picture.Assign(Nil);
              ExceptLogging('파일없음: ' + sLprFile2);
            end;
          end
          else
          begin
            lbCarNo.Caption := sLprCarNo1;
            lbOutCarNo.Caption := sLprCarNo1;
            sFileIP:= Copy(sLprFile1, 3, Pos('\MSImage', sLprFile1)-3);

            if is_ping(sFileIP) then
            begin
              if FileExists(sLprFile1) then
              begin
                imgOut.Picture.LoadFromFile(sLprFile1);
              end
              else
              begin
                imgOut.Picture.Assign(Nil);
                ExceptLogging('파일없음: ' + sLprFile1);
              end;
            end
            else
            begin
              imgOut.Picture.Assign(Nil);
              ExceptLogging('파일없음: ' + sLprFile1);
            end;
          end;
        except
          on E: Exception do
            ExceptLogging('이미지 로드 에러: ' + aString(E.Message));
        end;
      end;
    end;
  except
    on E: Exception do
      ExceptLogging('NormalProc: ' + aString(E.Message));
  end;
end;

function TfrmMainNew.chkHoliday(sDate: aString): Boolean; // 휴일: True, 평일
begin
  with dmTables.qryHoliday do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * from Holiday where ParkNo = :N1 and HDate = :N2');
    Parameters.ParamByName('N1').Value := 1;
    Parameters.ParamByName('N2').Value := sDate;
    Open;
    if RecordCount > 0 then
      Result := True
    else
      Result := False;
  end;
end;

procedure TfrmMainNew.DCEnable(bCheck: Boolean);
var
  i: Byte;
begin
  for i := 1 to 16 do
  begin
    with frmMainNew do
    begin
      TMenuItem(FindComponent('mnuDC' + IntToStr(i))).Enabled := bCheck;
      TAdvShapeButton(FindComponent('btn' + IntToStr(i))).Enabled := bCheck;
    end;
  end;
end;

//2018.01.09 AK프라자 로직 추가 시작//
procedure TfrmMainNew.DCProcess(sNowTKno, CarNo: String);
begin
  VIPDCProc(CarNo);
  CulcureDCProc(CarNo);
  //바코드 관련 데이터 가지고 오기
  BarCodeDCProc(CarNo);
  //웹관련 데이터 가지고 오기
  WebDCProc(sNowTKno);
end;
//2018.01.09 AK프라자 로직 추가 종료//

procedure TfrmMainNew.dgLostClick(Sender: TObject);
var
  sIn, sTime, sDir, sTemp, sFileIP: aString;
  nNo: Byte;
begin
  try
    if dmTables.qryLost.RecordCount > 0 then
      with dmTables.qryLost do
      begin
        nNo := FieldByName('UnitNo').AsInteger;

        if FieldByName('InRecog1').AsInteger = 1 then
        begin
          sIn := FieldByName('InImage1').AsString;
          sTime := Copy(sIn, Pos('_', sIn) + 1, 14);
          sLostInCarNo := FieldByName('InCarNo1').AsString;
          nLostInRecog := 1;
        end
        else if FieldByName('InRecog2').AsInteger = 1 then
        begin
          sIn := FieldByName('InImage2').AsString;
          sTime := Copy(sIn, Pos('_', sIn) + 1, 14);
          sLostInCarNo := FieldByName('InCarNo2').AsString;
          nLostInRecog := 1;
        end
        else
        begin
          sIn := FieldByName('InImage1').AsString;
          sTime := Copy(sIn, Pos('_', sIn) + 1, 14);
          sLostInCarNo := FieldByName('InCarNo1').AsString;
          nLostInRecog := FieldByName('InRecog1').AsInteger;
        end;
        sDir := sImageDir + '\' + Copy(sTime, 1, 4) + '\' + Copy(sTime, 5, 2)
          + '\' + Copy(sTime, 7, 2) + '\' + IntToStr(nNo);
        sLostInDate := FieldByName('ProcDate').AsString;
        sLostInTime := FieldByName('ProcTime').AsString;
        nLostInUnitNo := nNo;
        sLostInFile := sIn;
        sLostInTKNo := FieldByName('TKNo').AsString;

        if not DirectoryExists(sDir) then
        begin
          if not ForceDirectories(sDir) then
            ExceptLogging('이미지저장폴더 생성실패: ' + sDir);
        end;

        try
          sTemp := Copy(sIn, 6, Length(sIn) - 5);
          sIn := Copy(sTemp, 1, Pos(':9080', sTemp) - 1);
          sIn := sIn + Copy(sTemp, Pos(':9080', sTemp) + 5, Length(sTemp) -
              (Pos(':9080', sTemp) + 4));
          sIn := MG_StrConvert(sIn, '/', '\');
          ExceptLogging('File: ' + sIn);
          sFileIP:= Copy(sIn, 3, Pos('\MSImage', sIn)-3);

          if is_ping(sFileIP) then
          begin
            if FileExists(sIn) then
            begin
              imgLost.Picture.LoadFromFile(sIn);
            end
            else
            begin
              imgLost.Picture.Assign(Nil);
              ExceptLogging('File 없음: ' + sIn);
            end;
          end
          else
          begin
            imgLost.Picture.Assign(Nil);
            ExceptLogging('File 없음: ' + sIn);
          end;
        except
          on E: Exception do
            ExceptLogging('TfrmMain.Lost_FileDownload: ' + aString(E.Message));
        end;
      end;
  except
    on E: Exception do
      ExceptLogging('TfrmMain.dgLostClick: ' + E.Message);
  end;
end;

procedure TfrmMainNew.dgNManualProcClick(Sender: TObject);
var
  sIn, sTime, sDir, sTemp, sFileIP: aString;
  nNo: Byte;
begin
  try
    if dmTables.qryLost.RecordCount > 0 then
      with dmTables.qryLost do
      begin
        nNo := FieldByName('UnitNo').AsInteger;

        if FieldByName('InRecog1').AsInteger = 1 then
        begin
          sIn := FieldByName('InImage1').AsString;
          sTime := Copy(sIn, Pos('_', sIn) + 1, 14);
          sLostInCarNo := FieldByName('InCarNo1').AsString;
          nLostInRecog := 1;
        end
        else if FieldByName('InRecog2').AsInteger = 1 then
        begin
          sIn := FieldByName('InImage2').AsString;
          sTime := Copy(sIn, Pos('_', sIn) + 1, 14);
          sLostInCarNo := FieldByName('InCarNo2').AsString;
          nLostInRecog := 1;
        end
        else
        begin
          sIn := FieldByName('InImage1').AsString;
          sTime := Copy(sIn, Pos('_', sIn) + 1, 14);
          sLostInCarNo := FieldByName('InCarNo1').AsString;
          nLostInRecog := FieldByName('InRecog1').AsInteger;
        end;
        sDir := sImageDir + '\' + Copy(sTime, 1, 4) + '\' + Copy(sTime, 5, 2)
          + '\' + Copy(sTime, 7, 2) + '\' + IntToStr(nNo);
        sLostInDate := FieldByName('ProcDate').AsString;
        sLostInTime := FieldByName('ProcTime').AsString;
        nLostInUnitNo := nNo;
        sLostInFile := sIn;
        sLostInTKNo := FieldByName('TKNo').AsString;

        if not DirectoryExists(sDir) then
        begin
          if not ForceDirectories(sDir) then
            ExceptLogging('이미지저장폴더 생성실패: ' + sDir);
        end;

        try
          sTemp := Copy(sIn, 6, Length(sIn) - 5);
          sIn := Copy(sTemp, 1, Pos(':9080', sTemp) - 1);
          sIn := sIn + Copy(sTemp, Pos(':9080', sTemp) + 5, Length(sTemp) -
              (Pos(':9080', sTemp) + 4));
          sIn := MG_StrConvert(sIn, '/', '\');
          ExceptLogging('File: ' + sIn);
          sFileIP:= Copy(sIn, 3, Pos('\MSImage', sIn)-3);

          if is_ping(sFileIP) then
          begin
            if FileExists(sIn) then
            begin
              imgIn.Picture.LoadFromFile(sIn);
              imgNManual.Picture.LoadFromFile(sIn);
            end
            else
            begin
              imgIn.Picture.Assign(Nil);
              imgNManual.Picture.Assign(Nil);
              ExceptLogging('File 없음: ' + sIn);
            end;
          end
          else
          begin
            imgIn.Picture.Assign(Nil);
            imgNManual.Picture.Assign(Nil);
            ExceptLogging('File 없음: ' + sIn);
          end;
        except
          on E: Exception do
            ExceptLogging('TfrmMain.Lost_FileDownload: ' + aString(E.Message)
              );
        end;
      end;
  except
    on E: Exception do
      ExceptLogging('TfrmMain.dgNManualProcClick: ' + E.Message);
  end;
end;

procedure TfrmMainNew.InOpen(csLPR: TClientSocket);
begin
  try
    if is_ping(csLpr.Host) then
    begin
      csLPR.Socket.SendText('BAR_OPEN_1');     // 바오픈
      ExceptLogging('입구차단기 Open');
    end
    else begin
      ExceptLogging(csLpr.Host + ' LPR 차단기 오픈시 네트워크 오류!');
      if is_ping(csLpr.Host) then
      begin
        csLPR.Socket.SendText('BAR_OPEN_1');
        ExceptLogging('입구차단기 ReOpen');
      end
      else
        ExceptLogging(csLpr.Host + ' LPR 차단기 재오픈시 네트워크 오류!');
    end;
  except
    on E: Exception do
      ExceptLogging('InOpen: ' + aString(E.Message));
  end;
end;

procedure TfrmMainNew.OutOpen(csLPR: TClientSocket);
begin
  try
    if is_Ping(csLpr.Host) then
    begin
      csLPR.Socket.SendText('BAR_OPEN_1');
      ExceptLogging('출구차단기 Open');
    end
    else begin
      ExceptLogging(csLpr.Host + ' LPR 차단기 오픈시 네트워크 오류!');
      if is_ping(csLpr.Host) then
      begin
        csLPR.Socket.SendText('BAR_OPEN_1');
        ExceptLogging('출구차단기 ReOpen');
      end
      else
        ExceptLogging(csLpr.Host + ' LPR 차단기 재오픈시 네트워크 오류!');
    end;
  except
    on E: Exception do
      ExceptLogging('OutOpen: ' + aString(E.Message));
  end;
end;

procedure TfrmMainNew.MoneyProc(csLPR: TClientSocket);
var
  i, nOutCnt: Integer;
  sParkName, sParkAddr, sRegNo, sAdmin, sTelephone, sReceipt, sCarNo: String;
  sSend: String;
begin
  // 현금으로 계산...
  try
    if nPayType = 1 then
    begin
      nMCnt := nMCnt + 1;
      lbMCnt.Caption := FormatFloat('#,##0', nMCnt) + ' 건';
      nMTot := nMTot + StrToInt(MG_StrTrim(edtProcYogum.Text, ','));
      lbMTot.Caption := FormatFloat('#,##0', nMTot) + ' 원';
    end
    else if nPayType = 2 then
    begin
      nMCreditCnt := nMCreditCnt + 1;
      lbMCreditCnt.Caption := FormatFloat('#,##0', nMCreditCnt) + ' 건';
      nMCreditTot := nMCreditTot + StrToInt(MG_StrTrim(edtProcYogum.Text, ','));
      lbMCreditTot.Caption := FormatFloat('#,##0', nMCreditTot) + ' 원';
    end;
    nOutCnt := 0;

    // DB Write...
    with dmTables.qryMoneyProc do
    begin
//      Close;
//      SQL.Clear;
//      SQL.Add(
//        'Select * from IONCount Where ParkNo = :N1 and UnitNo = :N2 and ProcDate = :N3');
//      Parameters.ParamByName('N1').Value := nCurrParkNo;
//      Parameters.ParamByName('N2').Value := nNowLprNo;
//      Parameters.ParamByName('N3').Value := sNowOutDate;
//      Open;
//
//      if RecordCount > 0 then
//      begin
//        Case StrToInt(FormatDateTime('HH', Now)) of
//          0:             nOutCnt := FieldByName('Out00').AsInteger + 1;
//          1:             nOutCnt := FieldByName('Out01').AsInteger + 1;
//          2:             nOutCnt := FieldByName('Out02').AsInteger + 1;
//          3:             nOutCnt := FieldByName('Out03').AsInteger + 1;
//          4:             nOutCnt := FieldByName('Out04').AsInteger + 1;
//          5:             nOutCnt := FieldByName('Out05').AsInteger + 1;
//          6:             nOutCnt := FieldByName('Out06').AsInteger + 1;
//          7:             nOutCnt := FieldByName('Out07').AsInteger + 1;
//          8:             nOutCnt := FieldByName('Out08').AsInteger + 1;
//          9:             nOutCnt := FieldByName('Out09').AsInteger + 1;
//          10:            nOutCnt := FieldByName('Out10').AsInteger + 1;
//          11:            nOutCnt := FieldByName('Out11').AsInteger + 1;
//          12:            nOutCnt := FieldByName('Out12').AsInteger + 1;
//          13:            nOutCnt := FieldByName('Out13').AsInteger + 1;
//          14:            nOutCnt := FieldByName('Out14').AsInteger + 1;
//          15:            nOutCnt := FieldByName('Out15').AsInteger + 1;
//          16:            nOutCnt := FieldByName('Out16').AsInteger + 1;
//          17:            nOutCnt := FieldByName('Out17').AsInteger + 1;
//          18:            nOutCnt := FieldByName('Out18').AsInteger + 1;
//          19:            nOutCnt := FieldByName('Out19').AsInteger + 1;
//          20:            nOutCnt := FieldByName('Out20').AsInteger + 1;
//          21:            nOutCnt := FieldByName('Out21').AsInteger + 1;
//          22:            nOutCnt := FieldByName('Out22').AsInteger + 1;
//          23:            nOutCnt := FieldByName('Out23').AsInteger + 1;
//        end;
//        Close;
//        SQL.Clear;
//        SQL.Add('Update IONCount ');
//
//        Case StrToInt(FormatDateTime('HH', Now)) of
//          0:              SQL.Add('Set Out00 = :N1 ');
//          1:              SQL.Add('Set Out01 = :N1 ');
//          2:              SQL.Add('Set Out02 = :N1 ');
//          3:              SQL.Add('Set Out03 = :N1 ');
//          4:              SQL.Add('Set Out04 = :N1 ');
//          5:              SQL.Add('Set Out05 = :N1 ');
//          6:              SQL.Add('Set Out06 = :N1 ');
//          7:              SQL.Add('Set Out07 = :N1 ');
//          8:              SQL.Add('Set Out08 = :N1 ');
//          9:              SQL.Add('Set Out09 = :N1 ');
//          10:             SQL.Add('Set Out10 = :N1 ');
//          11:             SQL.Add('Set Out11 = :N1 ');
//          12:             SQL.Add('Set Out12 = :N1 ');
//          13:             SQL.Add('Set Out13 = :N1 ');
//          14:             SQL.Add('Set Out14 = :N1 ');
//          15:             SQL.Add('Set Out15 = :N1 ');
//          16:             SQL.Add('Set Out16 = :N1 ');
//          17:             SQL.Add('Set Out17 = :N1 ');
//          18:             SQL.Add('Set Out18 = :N1 ');
//          19:             SQL.Add('Set Out19 = :N1 ');
//          20:             SQL.Add('Set Out20 = :N1 ');
//          21:             SQL.Add('Set Out21 = :N1 ');
//          22:             SQL.Add('Set Out22 = :N1 ');
//          23:             SQL.Add('Set Out23 = :N1 ');
//        end;
//        SQL.Add('Where ParkNo = :N2 and UnitNo = :N3 and ProcDate = :N4');
//        Parameters.ParamByName('N1').Value := nOutCnt;
//        Parameters.ParamByName('N2').Value := nCurrParkNo;
//        Parameters.ParamByName('N3').Value := nNowLprNo;
//        Parameters.ParamByName('N4').Value := sNowOutDate;
//        ExecSQL;
//        Close;
//      end
//      else
//      begin
//        Close;
//        SQL.Clear;
//        SQL.Add('Insert Into IONCount ');
//        SQL.Add('(ParkNo, UnitNo, ProcDate, In00, In01, In02, In03, In04, ');
//        SQL.Add('In05, In06, In07, In08, In09, In10, In11, In12, In13, In14, ');
//        SQL.Add('In15, In16, In17, In18, In19, In20, In21, In22, In23, Out00, ');
//        SQL.Add('Out01, Out02, Out03, Out04, Out05, Out06, Out07, Out08, Out09, ');
//        SQL.Add('Out10, Out11, Out12, Out13, Out14, Out15, Out16, Out17, Out18, ');
//        SQL.Add('Out19, Out20, Out21, Out22, Out23) Values ');
//        SQL.Add('(:N1, :N2, :N3, 0, 0, 0, 0, 0, 0, 0, ');
//        SQL.Add('0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ');
//        SQL.Add('0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)');
//        Parameters.ParamByName('N1').Value := nCurrParkNo;
//        Parameters.ParamByName('N2').Value := nNowLprNo;
//        Parameters.ParamByName('N3').Value := sNowOutDate;
//        ExecSQL;
//
//        Close;
//        SQL.Clear;
//        SQL.Add('UpDate IONCount ');
//
//        Case StrToInt(FormatDateTime('HH', Now)) of
//          0:               SQL.Add('Set Out00 = :N1 ');
//          1:               SQL.Add('Set Out01 = :N1 ');
//          2:               SQL.Add('Set Out02 = :N1 ');
//          3:               SQL.Add('Set Out03 = :N1 ');
//          4:               SQL.Add('Set Out04 = :N1 ');
//          5:               SQL.Add('Set Out05 = :N1 ');
//          6:               SQL.Add('Set Out06 = :N1 ');
//          7:               SQL.Add('Set Out07 = :N1 ');
//          8:               SQL.Add('Set Out08 = :N1 ');
//          9:               SQL.Add('Set Out09 = :N1 ');
//          10:              SQL.Add('Set Out10 = :N1 ');
//          11:              SQL.Add('Set Out11 = :N1 ');
//          12:              SQL.Add('Set Out12 = :N1 ');
//          13:              SQL.Add('Set Out13 = :N1 ');
//          14:              SQL.Add('Set Out14 = :N1 ');
//          15:              SQL.Add('Set Out15 = :N1 ');
//          16:              SQL.Add('Set Out16 = :N1 ');
//          17:              SQL.Add('Set Out17 = :N1 ');
//          18:              SQL.Add('Set Out18 = :N1 ');
//          19:              SQL.Add('Set Out19 = :N1 ');
//          20:              SQL.Add('Set Out20 = :N1 ');
//          21:              SQL.Add('Set Out21 = :N1 ');
//          22:              SQL.Add('Set Out22 = :N1 ');
//          23:              SQL.Add('Set Out23 = :N1 ');
//        end;
//        SQL.Add('Where ParkNo = :N2 and UnitNo = :N3 and ProcDate = :N4');
//        Parameters.ParamByName('N1').Value := 1;
//        Parameters.ParamByName('N2').Value := nCurrParkNo;
//        Parameters.ParamByName('N3').Value := nNowLprNo;
//        Parameters.ParamByName('N4').Value := sNowOutDate;
//        ExecSQL;
//        Close;
//      end;

      Close;
      SQL.Clear;
      SQL.Add('Select * from TKProc where ParkNo = :N1 and UnitNo = :N2 and ');
      SQL.Add('ProcDate = :N3 and ProcTime = :N4 and TKNo = :N5');
      Parameters.ParamByName('N1').Value := nCurrParkNo;
      Parameters.ParamByName('N2').Value := nCurrUnitNo;
      Parameters.ParamByName('N3').Value := sNowOutDate;
      Parameters.ParamByName('N4').Value := sNowOutTime;
      Parameters.ParamByName('N5').Value := sNowInTKNo;
      Open;

      if RecordCount <= 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('Insert Into TKProc ');
        SQL.Add('(ParkNo, UnitNo, ProcDate, ProcTime, TKType, CarType, FeeNo, ');
        SQL.Add('TKNo, TKParkNo, TKUnitNo, CarNo, InDate, InTime, ParkingMin, ');
        SQL.Add('TotFee, TotDC, RealFee, RecvAmt, Change, DCCnt, MNo, UnPaid, ');
        SQL.Add('ChkClosing, CommercialTariff, SpecialTariff, PayType, Reserve2) ');
        SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, ');
        SQL.Add(':N11, :N12, :N13, :N14, :N15, :N16, :N17, :N18, :N19, :N20, ');
        SQL.Add(':N21, :N22, :N23, :N24, :N25, :N26, :N27)');
        Parameters.ParamByName('N1').Value := nCurrParkNo;
        Parameters.ParamByName('N2').Value := nCurrUnitNo;
        Parameters.ParamByName('N3').Value := sNowOutDate;
        Parameters.ParamByName('N4').Value := sNowOutTime;
        Parameters.ParamByName('N5').Value := nTKType;
        Parameters.ParamByName('N6').Value := 1;
        Parameters.ParamByName('N7').Value := nFeeNo;
        Parameters.ParamByName('N8').Value := sNowInTKNo;
        Parameters.ParamByName('N9').Value := nCurrParkNo;
        Parameters.ParamByName('N10').Value := nNowInUnitNo;
        Parameters.ParamByName('N11').Value := sNowInCarNo;
        Parameters.ParamByName('N12').Value := sNowInDate;
        Parameters.ParamByName('N13').Value := sNowInTime;
        Parameters.ParamByName('N14').Value := nParkingMin;
        Parameters.ParamByName('N15').Value := StrToInt(MG_StrTrim(edtTotYogum.Text, ','));
        Parameters.ParamByName('N16').Value := StrToInt(MG_StrTrim(edtDCYogum.Text, ','));
        Parameters.ParamByName('N17').Value := StrToInt(MG_StrTrim(edtProcYogum.Text, ','));
        Parameters.ParamByName('N18').Value := StrToInt(MG_StrTrim(edtProcYogum.Text, ','));
        Parameters.ParamByName('N19').Value := 0;
        Parameters.ParamByName('N20').Value := nDCCnt;
        Parameters.ParamByName('N21').Value := nCurrMNo;
        Parameters.ParamByName('N22').Value := 0;
        Parameters.ParamByName('N23').Value := 0;
        Parameters.ParamByName('N24').Value := 0;
        Parameters.ParamByName('N25').Value := 0;
        Parameters.ParamByName('N26').Value := nPayType;

        if bZeroOut then
          Parameters.ParamByName('N27').Value := '회차'
        else
          Parameters.ParamByName('N27').Value := '';
        ExecSQL;
      end;

      if nDCCnt > 0 then
      begin
        for i := 1 to nDCCnt do
        begin
          //if DCProc[i].nDCAmt > 0 then
          if DCProc[i].sDCName <> '' then
          begin
            Close;
            SQL.Clear;
            SQL.Add('Insert Into DCDetail ');
            SQL.Add('(ParkNo, UnitNo, ProcDate, ProcTime, DCSeq, TKNo, CarNo, ');
            SQL.Add('DCNo, DCAmt, RealDCAmt, DCTKNo, DCTKIssueDate, DCTKIssueTime, DCType, MNo, ChkClosing, Reserve5) ');
            SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, :N12, :N13, :N14, :N15, :N16, :N17)');
            Parameters.ParamByName('N1').Value := nCurrParkNo;
            Parameters.ParamByName('N2').Value := nCurrUnitNo;
            Parameters.ParamByName('N3').Value := sNowOutDate;
            Parameters.ParamByName('N4').Value := sNowOutTime;
            Parameters.ParamByName('N5').Value := i;
            Parameters.ParamByName('N6').Value := sNowInTKNo;
            Parameters.ParamByName('N7').Value := sNowInCarNo;
            Parameters.ParamByName('N8').Value := DCProc[i].nDCNo;
            Parameters.ParamByName('N9').Value := DCProc[i].nDCAmt;
            Parameters.ParamByName('N10').Value := DCProc[i].nRealDCAmt;
            Parameters.ParamByName('N11').Value := DCProc[i].sDCTKNo;
            Parameters.ParamByName('N12').Value := DCProc[i].sDCTKIssueDate;
            Parameters.ParamByName('N13').Value := DCProc[i].sDCTKIssueTime;
            Parameters.ParamByName('N14').Value := DCProc[i].nDCType;
            Parameters.ParamByName('N15').Value := nCurrMNo;
            Parameters.ParamByName('N16').Value := 0;
            Parameters.ParamByName('N17').Value := DCProc[i].sDCName;
            ExecSQL;
          end;

          //2018.01.09 AK프라자 로직 추가 시작//
          if DCProc[i].sSeq <>'' then
          begin
            Close;
            SQL.Clear;
            SQL.Add
              ('Update tblStoreDiscountPublish Set OutYmd = :N1, OutHms = :N2, Reserve5 = :N3 ');
            SQL.Add('where NorKey = :N4 and DelYn = 0 and outYmd is null ');
            SQL.Add(' and  Sequence = :N5 ');
            Parameters.ParamByName('N1').Value := sNowOutDate;
            Parameters.ParamByName('N2').Value := sNowOutTime;
            Parameters.ParamByName('N3').Value := DCProc[i].nSeq;
            Parameters.ParamByName('N4').Value := sNowInTKNo;
            Parameters.ParamByName('N5').Value := DCProc[i].sSeq;
            ExecSQL;
          end;
          //2018.01.09 AK프라자 로직 추가 종료//
        end;
      end;

      //2018.01.09 AK프라자 로직 추가 시작//
      //웹할인 처리 안된 자료를 출차 기준으로 업데이트 한다.
      Close;
      SQL.Clear;
      SQL.Add
        ('Update tblStoreDiscountPublish Set OutYmd = :N1, OutHms = :N2, Remark = :N3 ');
      SQL.Add('where NorKey = :N4 and DelYn = 0 and outYmd is null ');
      Parameters.ParamByName('N1').Value := sNowOutDate;
      Parameters.ParamByName('N2').Value := sNowOutTime;
      Parameters.ParamByName('N3').Value := '할인적용0원';
      Parameters.ParamByName('N4').Value := sNowInTKNo;
      ExecSQL;
      //2018.01.09 AK프라자 로직 추가 종료//

      Close;
      SQL.Clear;
      SQL.Add('Select * from IONData Where ParkNo = :N1 and UnitNo = :N2 and ProcDate = :N3 and ');
      SQL.Add('ProcTime = :N4 and TKNo = :N5');
      Parameters.ParamByName('N1').Value := nCurrParkNo;
      Parameters.ParamByName('N2').Value := nNowInUnitNo;
      Parameters.ParamByName('N3').Value := sNowInDate;
      Parameters.ParamByName('N4').Value := sNowInTime;
      Parameters.ParamByName('N5').Value := sNowInTKNo;
      Open;

      if RecordCount > 0 then
      begin
        // InData에 입차자료가 있으면...
        Close;
        SQL.Clear;
        SQL.Add('Update IONData Set OutUnitNo = :N1, OutDate = :N2, OutTime = :N3, OutChk = :N4, ');
        SQL.Add('OutImage1 = :N5, OutCarNo1 = :N6, OutImage2 = :N7, OutCarNo2 = :N8, ' );
        SQL.Add('OutRecog1 = :N9, OutRecog2 = :N10, Reserve1 = :N16 ');
        SQL.Add('where ParkNo = :N11 and UnitNo = :N12 and ProcDate = :N13 and ProcTime = :N14 and TKNo = :N15');
        Parameters.ParamByName('N1').Value := nNowLprNo;
        Parameters.ParamByName('N2').Value := sNowOutDate;
        Parameters.ParamByName('N3').Value := sNowOutTime;

        if nDCCnt > 0 then
        begin
          // 할인처리
          if StrToInt(MG_StrTrim(edtProcYogum.Text, ',')) > 0 then
          begin
            // 할인처리후 유료출차
            Parameters.ParamByName('N4').Value := 2;
          end
          else
          begin
            // 무료출차
            Parameters.ParamByName('N4').Value := 3;
          end;
        end
        else
        begin
          //할인을 하지않고
          if StrToInt(MG_StrTrim(edtProcYogum.Text, ',')) > 0 then
          begin
            // 주차요금이 있으면 정상출차
            Parameters.ParamByName('N4').Value := 1;
          end
          else
          begin
            // 주차요금이 없으면 무료출차
            Parameters.ParamByName('N4').Value := 3;
          end;
        end;
        Parameters.ParamByName('N5').Value := sNowLprFile1;
        Parameters.ParamByName('N6').Value := sNowLprCarNo1;
        Parameters.ParamByName('N7').Value := sNowLprFile2;
        Parameters.ParamByName('N8').Value := sNowLprCarNo2;
        Parameters.ParamByName('N9').Value := nNowLprRecog1;
        Parameters.ParamByName('N10').Value := nNowLprRecog2;
        Parameters.ParamByName('N11').Value := nCurrParkNo;
        Parameters.ParamByName('N12').Value := nNowInUnitNo;
        Parameters.ParamByName('N13').Value := sNowInDate;
        Parameters.ParamByName('N14').Value := sNowInTime;
        Parameters.ParamByName('N15').Value := sNowInTKNo;

        if bMiProc then
          Parameters.ParamByName('N16').Value := '미인식처리'
        else if bManualOut then
          Parameters.ParamByName('N16').Value := '수동출차'
        else
          Parameters.ParamByName('N16').Value := '';
        ExecSQL;
      end
      else
      begin
        // InData에 발권자료가 없으면...
        Close;
        SQL.Clear;
        SQL.Add('Insert Into IONData ');
        SQL.Add('(ParkNo, UnitNo, ProcDate, ProcTime, TKNo, TKType, CarType, ');
        SQL.Add('InImage1, InCarNo1, InImage2, InCarNo2, Status, OutUnitNo, ');
        SQL.Add('OutDate, OutTime, OutChk, OutImage1, OutCarNo1, OutImage2, OutCarNo2, ');
        SQL.Add('InRecog1, OutRecog1, InRecog2, OutRecog2, Reserve1) ');
        SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, ');
        SQL.Add(':N12, :N13, :N14, :N15, :N16, :N17, :N18, :N19, :N20, ');
        SQL.Add(':N21, :N22, :N23, :N24, :N25)');
        Parameters.ParamByName('N1').Value := nCurrParkNo;
        Parameters.ParamByName('N2').Value := nNowInUnitNo;
        Parameters.ParamByName('N3').Value := sNowInDate;
        Parameters.ParamByName('N4').Value := sNowInTime;
        Parameters.ParamByName('N5').Value := sNowInTKNo;
        Parameters.ParamByName('N6').Value := nTKType;
        Parameters.ParamByName('N7').Value := 1;
        Parameters.ParamByName('N8').Value := '';
        Parameters.ParamByName('N9').Value := '';
        Parameters.ParamByName('N10').Value := '';
        Parameters.ParamByName('N11').Value := '';
        Parameters.ParamByName('N12').Value := 1;
        Parameters.ParamByName('N13').Value := nNowLprNo;
        Parameters.ParamByName('N14').Value := sNowOutDate;
        Parameters.ParamByName('N15').Value := sNowOutTime;

        if nDCCnt > 0 then
        begin
          // 할인처리
          if StrToInt(MG_StrTrim(edtProcYogum.Text, ',')) > 0 then
          begin
            // 할인처리후 유료출차
            Parameters.ParamByName('N16').Value := 2;
          end
          else
          begin
            // 무료출차
            Parameters.ParamByName('N16').Value := 3;
          end;
        end
        else
        begin
          // 할인처리 안함. 정상출차
          Parameters.ParamByName('N16').Value := 1;
        end;
        Parameters.ParamByName('N17').Value := sNowLprFile1;
        Parameters.ParamByName('N18').Value := sNowLprCarNo1;
        Parameters.ParamByName('N19').Value := sNowLprFile2;
        Parameters.ParamByName('N20').Value := sNowLprCarNo2;
        Parameters.ParamByName('N21').Value := 3;
        Parameters.ParamByName('N22').Value := 3;
        Parameters.ParamByName('N23').Value := nNowLprRecog1;
        Parameters.ParamByName('N24').Value := nNowLprRecog2;

        if bMiProc then
          Parameters.ParamByName('N25').Value := '미인식처리'
        else if bManualOut then
          Parameters.ParamByName('N25').Value := '수동출차'
        else
          Parameters.ParamByName('N25').Value := '';
        ExecSQL;
      end;
      Close;
      SQL.Clear;
      SQL.Add('Select * from IONCount where ProcDate = :N1 and UnitNo = :N2');
      Parameters.ParamByName('N1').Value := sNowOutDate;
      Parameters.ParamByName('N2').Value := nNowLprNo;
      Open;
      nNOutCnt := 0;

      for i := 0 to 23 do
        nNOutCnt := nNOutCnt + FieldByName('Out' + MG_InsZero(IntToStr(i), 2))
          .AsInteger;
    end;

    if bZeroOut then
      NGridData('2' + sNowInCarNo + '^' + sNowOutDate + ' ' + sNowOutTime + '^회차차량')
    else
      NGridData('2' + sNowInCarNo + '^' + sNowOutDate + ' ' + sNowOutTime + '^' + edtProcYogum.Text + '원');
    // MichulProc(sNowInCarNo);

    //if (bZeroReceipt and (StrToInt(MG_StrTrim(edtTotYogum.Text, ',')) > 0)) or
    if bZeroReceipt or
      (StrToInt(MG_StrTrim(edtProcYogum.Text, ',')) > 0) then
    begin
      if ComPrn.Open and (StrToInt(MG_StrTrim(edtProcYogum.Text, ',')) > 0) then
        ComPrn.PutString(WTP_Cash_Open);

      with dmTables.qryMoneyProc do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select * from ParkInfo where ParkNo = :N1');
        Parameters.ParamByName('N1').Value := nCurrParkNo;
        Open;

        if RecordCount > 0 then
        begin
          sParkName := FieldByName('ParkName').AsString;
          sParkAddr := FieldByName('ParkAddr').AsString;
          sRegNo := FieldByName('RegNo').AsString;
          sAdmin := FieldByName('Admin').AsString;
          sTelephone := FieldByName('Telephone').AsString;
          sReceipt := FieldByName('Receipt').AsString;
        end;
      end;

      // 영수증인쇄...
      sPrtData := '';
      sPrtData :=
        '========================================' + LF + LF + LF + CR + SO_WTP;
      sPrtData := sPrtData + '    영   수   증' + LF + LF + LF + CR + SI_WTP;

      if Length(sParkName) > 29 then
      begin
        sPrtData := sPrtData + '주차장명 : ' + Copy(sParkName, 1, 29) + LF + CR;

        if Length(sParkName) < 58 then
          sPrtData := sPrtData + '           ' + Copy(sParkName, 30, Length(sParkName) - 29) + LF + CR
        else
        begin
          if Length(sParkName) < 87 then
          begin
            sPrtData := sPrtData + '           ' + Copy(sParkName, 30, 29) + LF + CR;
            sPrtData := sPrtData + '           ' + Copy(sParkName, 60, Length(sParkName) - 58) + LF + CR;
          end
          else
          begin
            sPrtData := sPrtData + '           ' + Copy(sParkName, 30, 29) + LF + CR;
            sPrtData := sPrtData + '           ' + Copy(sParkName, 59, 29) + LF + CR;
            sPrtData := sPrtData + '           ' + Copy(sParkName, 88, Length(sParkName) - 87) + LF + CR;
          end;
        end;
      end
      else
        sPrtData := sPrtData + '주차장명 : ' + sParkName + LF + CR;

      if Length(sParkAddr) > 29 then
      begin
        sPrtData := sPrtData + ' 주   소 : ' + Copy(sParkAddr, 1, 29) + LF + CR;

        if Length(sParkAddr) < 58 then
          sPrtData := sPrtData + '           ' + Copy(sParkAddr, 30, Length(sParkAddr) - 29) + LF + CR
        else
        begin
          if Length(sParkAddr) < 87 then
          begin
            sPrtData := sPrtData + '           ' + Copy(sParkAddr, 30, 29) + LF + CR;
            sPrtData := sPrtData + '           ' + Copy(sParkAddr, 60, Length(sParkAddr) - 58) + LF + CR;
          end
          else
          begin
            sPrtData := sPrtData + '           ' + Copy(sParkAddr, 30, 29) + LF + CR;
            sPrtData := sPrtData + '           ' + Copy(sParkAddr, 59, 29) + LF + CR;
            sPrtData := sPrtData + '           ' + Copy(sParkAddr, 88, Length(sParkAddr) - 87) + LF + CR;
          end;
        end;
      end
      else
        sPrtData := sPrtData + ' 주   소 : ' + sParkAddr + LF + CR;

      sPrtData := sPrtData + '등록번호 : ' + sRegNo + LF + CR;

      if Length(sAdmin) > 29 then
      begin
        sPrtData := sPrtData + '대표자명 : ' + Copy(sAdmin, 1, 29) + LF + CR;
        sPrtData := sPrtData + '           ' + Copy(sAdmin, 30, Length(sAdmin) - 29) + LF + CR;
      end
      else
        sPrtData := sPrtData + '대표자명 : ' + sAdmin + LF + CR;

      sPrtData := sPrtData + '전화번호 : ' + sTelephone + LF + CR;
      sPrtData := sPrtData + '입차일시 : ' + sNowInDate + ' ' + sNowInTime + LF + CR;
      sPrtData := sPrtData + '출차일시 : ' + sNowOutDate + ' ' + sNowOutTime + LF + CR;
      sPrtData := sPrtData + '주차시간 : ' + lbParkingTime.Caption + LF + CR;
      sPrtData := sPrtData + '근 무 자 : ' + sCurrMName + LF + CR;
      sPrtData := sPrtData + '차량번호 : ' + sNowLprCarNo1 + LF + CR;

      //if edtDCYogum.Text <> '0' then
      if nDCCnt > 0 then
      begin
        sPrtData := sPrtData + '전체요금 : ' + edtTotYogum.Text + '원' + LF + CR;
        sPrtData := sPrtData + '할인금액 : ' + edtDCYogum.Text + '원' + LF + CR;

        if nDCCnt > 0 then
          for i := 1 to nDCCnt do
            //if DCProc[i].nDCAmt > 0 then
            if DCProc[i].sDCName <> '' then
            begin
              if i = 1 then
                sPrtData:= sPrtData + '할인내용 : ' + DCProc[i].sDCName + LF + CR
              else
                sPrtData := sPrtData + '           ' + DCProc[i].sDCName + LF + CR;
            end;
        {
        if Length(aString(edtDC.Text)) > 29 then
        begin
          sPrtData := sPrtData + '할인내용 : ' + Copy(aString(edtDC.Text), 1, 29)
            + LF + CR;
          sPrtData := sPrtData + '           ' + Copy
            (aString(edtDC.Text), 30, Length(aString(edtDC.Text)) - 29)
            + LF + CR;
        end
        else
          sPrtData := sPrtData + '할인내용 : ' + edtDC.Text + LF + CR;
        }

        sPrtData := sPrtData + '받은금액 : ' + edtProcYogum.Text + '원' + LF + LF + LF + CR;
      end
      else
        sPrtData := sPrtData + '주차요금 : ' + edtProcYogum.Text + '원' + LF + LF + LF + CR;

      if Length(sReceipt) > 40 then
      begin
        sPrtData := sPrtData + Copy(sReceipt, 1, 40) + LF + CR;

        if Length(sReceipt) < 80 then
          sPrtData := sPrtData + Copy(sReceipt, 41, Length(sReceipt) - 40) + LF + LF + LF + LF + LF + LF + LF + LF
        else
        begin
          sPrtData := sPrtData + Copy(sReceipt, 41, 40) + LF + CR;
          sPrtData := sPrtData + Copy(sReceipt, 81, Length(sReceipt) - 80) + LF + LF + LF + LF + LF + LF + LF + LF;
        end;
      end
      else
        sPrtData := sPrtData + sReceipt + LF + LF + LF + LF + LF + LF + LF + LF;

      sPrtData := sPrtData + FullCut_WTP;

      if lbReceipt.Count = 10 then
        lbReceipt.Items.Delete(lbReceipt.Count - 1);
      lbReceipt.Items.Insert(0, sPrtOutTime + '  ' + MG_Left(sNowLprCarNo1, 12) + '  주차요금: ' + edtProcYogum.Text + '원');

      if RReceipt[9].sInOutTime <> '' then
      begin
        RReceipt[10].sInOutTime := RReceipt[9].sInOutTime;
        RReceipt[10].sRpt := RReceipt[9].sRpt;
      end;

      if RReceipt[8].sInOutTime <> '' then
      begin
        RReceipt[9].sInOutTime := RReceipt[8].sInOutTime;
        RReceipt[9].sRpt := RReceipt[8].sRpt;
      end;

      if RReceipt[7].sInOutTime <> '' then
      begin
        RReceipt[8].sInOutTime := RReceipt[7].sInOutTime;
        RReceipt[8].sRpt := RReceipt[7].sRpt;
      end;

      if RReceipt[6].sInOutTime <> '' then
      begin
        RReceipt[7].sInOutTime := RReceipt[6].sInOutTime;
        RReceipt[7].sRpt := RReceipt[6].sRpt;
      end;

      if RReceipt[5].sInOutTime <> '' then
      begin
        RReceipt[6].sInOutTime := RReceipt[5].sInOutTime;
        RReceipt[6].sRpt := RReceipt[5].sRpt;
      end;

      if RReceipt[4].sInOutTime <> '' then
      begin
        RReceipt[5].sInOutTime := RReceipt[4].sInOutTime;
        RReceipt[5].sRpt := RReceipt[4].sRpt;
      end;

      if RReceipt[3].sInOutTime <> '' then
      begin
        RReceipt[4].sInOutTime := RReceipt[3].sInOutTime;
        RReceipt[4].sRpt := RReceipt[3].sRpt;
      end;

      if RReceipt[2].sInOutTime <> '' then
      begin
        RReceipt[3].sInOutTime := RReceipt[2].sInOutTime;
        RReceipt[3].sRpt := RReceipt[2].sRpt;
      end;

      if RReceipt[1].sInOutTime <> '' then
      begin
        RReceipt[2].sInOutTime := RReceipt[1].sInOutTime;
        RReceipt[2].sRpt := RReceipt[1].sRpt;
      end;

      RReceipt[1].sInOutTime := sPrtOutTime + '  주차요금: ' + edtProcYogum.Text + '원';
      RReceipt[1].sRpt := sPrtData;
      btnReceipt.Enabled := True;
    end
    else
    begin
      sPrtData := '';
      btnReceipt.Enabled := False;
    end;

    // 차단기 열림.
    OutOpen(nowLpr);
    InspectionLog('영수증: ' + sPrtData);

    if bAutoReceipt and (sPrtData <> '') then
    begin
      btnReceiptClick(Self);
    end;
    InspectionLog('정산요금: ' + edtProcYogum.Text);

    lblBujae.Caption := '';
    ClearFormData;
  except
    on E: Exception do
      ExceptLogging('MoneyProc: ' + aString(E.Message));
  end;
end;

// nIO: 1-입구, 2-출구    nType: 1-정기차량, 2-일반차량, 3-요금표시, 4-주차요금0원
procedure TfrmMainNew.DspProc(nIO, nType: Byte; sData, sDspIP: aString);
var
  i: Byte;
  sSend: aString;
begin
  try
    case nType of
      1:
        sSend := MakeDSPData(AnsiChar($54), EMDSP1, SCCOLOR, MG_Left(sData, 24));
      2:
        sSend := MakeDSPData(AnsiChar($54), EMDSP1, NOCOLOR, MG_Left(sData, 24));
      3:
        sSend := MakeDSPData(AnsiChar($54), EMDSP0, YOCOLOR, MG_Left(sData, 24));
      4:
        sSend := MakeDSPData(AnsiChar($54), EMDSP1, YOCOLOR, MG_Left(sData, 24));
    end;

    if nIO = 1 then
    begin
      for i := 1 to 5 do
      begin
        with frmMainNew do
        begin
          if TClientSocket(FindComponent('csInDsp' + IntToStr(i))).Host = wString(sDspIP) then
          begin
            if is_ping(sDspIP) then
            begin
              if TClientSocket(FindComponent('csInDsp' + IntToStr(i))).Active then
                TClientSocket(FindComponent('csInDsp' + IntToStr(i))).Socket.SendText(sSend);
            end
            else
              ExceptLogging('전광판(' + sDspIP + ') 네트워크 에러');
          end;
        end;
      end;
    end
    else if nIO = 2 then
    begin
      for i := 1 to 3 do
      begin
        with frmMainNew do
        begin
          if TClientSocket(FindComponent('csOutDsp' + IntToStr(i))).Host = wString(sDspIP) then
          begin
            if is_ping(sDspIP) then
            begin
              if TClientSocket(FindComponent('csOutDsp' + IntToStr(i))).Active then
                TClientSocket(FindComponent('csOutDsp' + IntToStr(i))).Socket.SendText(sSend);
            end
            else
            begin
              ExceptLogging('전광판(' + sDspIP + ') 네트워크 에러');
            end;
          end;
        end;
      end;
    end;
  except
    on E: Exception do
      ExceptLogging('DspProc: ' + aString(E.Message));
  end;
end;

procedure TfrmMainNew.ManualOut(sLprFile1, sLprCarNo1, sLprFile2, sLprCarNo2,
  sIOTime: AnsiString; nLprNo, nLprInOut, nLprRecog1, nLprRecog2: Byte);
var
  sNow, sInCarNo, sInTKNo, sInDate, sInTime, sParking, sInFile, sImgFile1,
    sImgFile2, sLocalFile, sTime, sDir, sYogum: aString;
  nDay, nHour, nMin, nOutCnt: Cardinal;
  nInUnitNo, i: Word;
  hr: HRESULT;
  sDspIP: aString;
begin
  try
    for i := 1 to 10 do
    begin
      if RLpr[i].nUnitNo = nowLpr.Tag then
      begin
        sDspIP := RLpr[i].sDspIP;
        Break;
      end;
    end;
  except
    on E: Exception do
    begin
      ShowMessage('LPR 설정을 확인하여 주세요!');
      Exit;
    end;
  end;
    //2018.01.09 AK프라자 로직 추가 시작//
  bApsPay := false;
  //2018.01.09 AK프라자 로직 추가 종료//

  // 일반차량 출차처리...
  try
    with dmTables.qryManualOut do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from Gracetime where ParkNo = :N1');
      Parameters.ParamByName('N1').Value := nCurrParkNo;
      Open;

      if RecordCount > 0 then
        with GTime do
        begin
          GT1 := FieldByName('GT1').AsString;
          GT2 := FieldByName('GT2').AsString;
          GT3 := FieldByName('GT3').AsString;
          GT4 := FieldByName('GT4').AsString;
          GT5 := FieldByName('GT5').AsString;
          GT6 := FieldByName('GT6').AsString;
          GT7 := FieldByName('GT7').AsString;
          GT8 := FieldByName('GT8').AsString;
          GT9 := FieldByName('GT9').AsInteger;
        end
        else
          ClearGTime;
    end;

    // 화면표시
    lbCarNo.Caption := sLprCarNo1;
    lbOutCarNo.Caption := sLprCarNo1;
    lbInTime.Caption := sManualInTime;
    sNow := FormatDateTime('YYYY-MM-DD HH:NN:SS', Now);
    lbOutTime.Caption := sNow;
    sParking := '';
    nParkingMin := 0;
    nParkingMin := Trunc((StrToDateTime(MG_AddTime(Copy(sNow, 1, 16), 0, 1, 0, 0) + ':01') - StrToDateTime(lbInTime.Caption)) * 24 * 60);
    nDay := nParkingMin div (24 * 60);
    nHour := (nParkingMin mod (24 * 60)) div 60;
    nMin := (nParkingMin mod (24 * 60)) mod 60;

    if nDay > 0 then
      sParking := sParking + IntToStr(nDay) + '일 ';
    if nHour > 0 then
      sParking := sParking + IntToStr(nHour) + '시간 ';
    if nMin > 0 then
      sParking := sParking + IntToStr(nMin) + '분';
    lbParkingTime.Caption := sParking;

    if bFreeTime then
    begin
      if bFreeTimeChk then
      begin
        // 시작시각이 크다.
        if (sFreeTimeS <= FormatDateTime('HH:NN', Now)) or
          (sFreeTimeE >= FormatDateTime('HH:NN', Now)) then
        begin
          FreeTimeProc(nowLpr);
          // MichulProc(sInCarNo);
          bNCOutProcWait := False;
          Exit;
        end;
      end
      else
      begin
        if (sFreeTimeS <= FormatDateTime('HH:NN', Now)) and
          (sFreeTimeE >= FormatDateTime('HH:NN', Now)) then
        begin
          FreeTimeProc(nowLpr);
          // MichulProc(sInCarNo);
          bNCOutProcWait := False;
          Exit;
        end;
      end;
    end;

    {
    if (bFreeTime and
       (FormatDateTime('YYYY-MM-DD HH:NN', StrToDateTime(Copy(lbInTime.Caption, 1, 11) + sFreeTimeE)
        + StrToTime(GTime.GT1)) > Copy(sNow, 1, 16)) or
       (Copy(lbInTime.Caption, 1, 16) = Copy(sNow, 1, 16))) or
       ((not bFreeTime) and
       (FormatDateTime('YYYY-MM-DD HH:NN', StrToDateTime(Copy(lbInTime.Caption, 1, 16)) + StrToTime(GTime.GT1)) > Copy(sNow, 1, 16)) or
       (Copy(lbInTime.Caption, 1, 16) = Copy(sNow, 1, 16))) then
    }

    //if (FormatDateTime('YYYY-MM-DD HH:NN', StrToDateTime(Copy(lbInTime.Caption, 1, 16)) + StrToTime(GTime.GT1)) > Copy(sNow, 1, 16)) or
//    if GracetimeCheck(Copy(lbInTime.Caption, 1, 16), Copy(sNow, 1, 16)) or
//       (Copy(lbInTime.Caption, 1, 16) = Copy(sNow, 1, 16)) then
    //2018.01.09 AK프라자 로직 추가 시작//
    if
        //일요일 또는 휴일
       (((chkHoliday(Copy(sNow, 1, 10))) or ((DayOfWeek(Now) = 1))) and
       (FormatDateTime('YYYY-MM-DD HH:NN',
        StrToDateTime(Copy(lbInTime.Caption, 1, 16)) + StrToTime(GTime.GT8)) >= Copy(sNow, 1, 16)) or
       (Copy(lbInTime.Caption, 1, 16) = Copy(sNow, 1, 16)) and (not bApsPay)) or

       //토요일
       ((not chkHoliday(Copy(sNow, 1, 10))) and ((DayOfWeek(Now) = 7)) and
       (FormatDateTime('YYYY-MM-DD HH:NN',
        StrToDateTime(Copy(lbInTime.Caption, 1, 16)) + StrToTime(GTime.GT5)) >= Copy(sNow, 1, 16)) or
       (Copy(lbInTime.Caption, 1, 16) = Copy(sNow, 1, 16))  and (not bApsPay)) or

       //평일
       (((not chkHoliday(Copy(sNow, 1, 10))) and ((DayOfWeek(Now) >= 2) and (DayOfWeek(Now) <= 6))) and
       (FormatDateTime('YYYY-MM-DD HH:NN',
        StrToDateTime(Copy(lbInTime.Caption, 1, 16)) + StrToTime(GTime.GT1)) >= Copy(sNow, 1, 16)) or
       (Copy(lbInTime.Caption, 1, 16) = Copy(sNow, 1, 16)) and (not bApsPay)) or

       //사전무인정산
       ((FormatDateTime('YYYY-MM-DD HH:NN',
        StrToDateTime(Copy(lbInTime.Caption, 1, 16)) + StrToTime(GTime.GT2)) >= Copy(sNow, 1, 16))
        and bApsPay)                   then
    //2018.01.09 AK프라자 로직 추가 종료//
    begin
      //회차차량
      // DB Write...
      with dmTables.qryManualOut do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select * from TKProc where ParkNo = :N1 and UnitNo = :N2 and ');
        SQL.Add('ProcDate = :N3 and ProcTime = :N4 and TKNo = :N5');
        Parameters.ParamByName('N1').Value := nCurrParkNo;
        Parameters.ParamByName('N2').Value := nCurrUnitNo;
        Parameters.ParamByName('N3').Value := Copy(sNow, 1, 10);
        Parameters.ParamByName('N4').Value := Copy(sNow, 12, 8);
        Parameters.ParamByName('N5').Value := sManualTKNo;
        Open;

        if RecordCount <= 0 then
        begin
          Close;
          SQL.Clear;
          SQL.Add('Insert Into TKProc ');
          SQL.Add('(ParkNo, UnitNo, ProcDate, ProcTime, TKType, CarType, FeeNo, ');
          SQL.Add('TKNo, TKParkNo, TKUnitNo, CarNo, InDate, InTime, ParkingMin, ');
          SQL.Add('TotFee, TotDC, RealFee, RecvAmt, Change, DCCnt, MNo, UnPaid, ');
          SQL.Add('ChkClosing, CommercialTariff, SpecialTariff, PayType, Reserve2) ');
          SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, ');
          SQL.Add(':N11, :N12, :N13, :N14, :N15, :N16, :N17, :N18, :N19, :N20, ');
          SQL.Add(':N21, :N22, :N23, :N24, :N25, :N26, :N27)');
          Parameters.ParamByName('N1').Value := nCurrParkNo;
          Parameters.ParamByName('N2').Value := nCurrUnitNo;
          Parameters.ParamByName('N3').Value := Copy(sNow, 1, 10);
          Parameters.ParamByName('N4').Value := Copy(sNow, 12, 8);
          Parameters.ParamByName('N5').Value := nTKType;
          Parameters.ParamByName('N6').Value := nCarType;
          Parameters.ParamByName('N7').Value := nFeeNo;
          Parameters.ParamByName('N8').Value := sManualTKNo;
          Parameters.ParamByName('N9').Value := nCurrParkNo;
          Parameters.ParamByName('N10').Value := nCurrUnitNo;
          Parameters.ParamByName('N11').Value := sLprCarNo1;
          Parameters.ParamByName('N12').Value := Copy(sManualInTime, 1, 10);
          Parameters.ParamByName('N13').Value := Copy(sManualInTime, 12, 8);
          Parameters.ParamByName('N14').Value := nParkingMin;
          Parameters.ParamByName('N15').Value := 0;
          Parameters.ParamByName('N16').Value := 0;
          Parameters.ParamByName('N17').Value := 0;
          Parameters.ParamByName('N18').Value := 0;
          Parameters.ParamByName('N19').Value := 0;
          Parameters.ParamByName('N20').Value := 0;
          Parameters.ParamByName('N21').Value := nCurrMNo;
          Parameters.ParamByName('N22').Value := 0;
          Parameters.ParamByName('N23').Value := 0;
          Parameters.ParamByName('N24').Value := 0;
          Parameters.ParamByName('N25').Value := 0;
          Parameters.ParamByName('N26').Value := 1;
          Parameters.ParamByName('N27').Value := '회차';
          ExecSQL;
        end;

        Close;
        SQL.Clear;
        SQL.Add('Insert Into IONData ');
        SQL.Add('(ParkNo, UnitNo, ProcDate, ProcTime, TKNo, TKType, CarType, ');
        SQL.Add('InImage1, InCarNo1, InImage2, InCarNo2, Status, OutUnitNo, ');
        SQL.Add('OutDate, OutTime, OutChk, OutImage1, OutCarNo1, OutImage2, OutCarNo2, ');
        SQL.Add('InRecog1, OutRecog1, InRecog2, OutRecog2) ');
        SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, ');
        SQL.Add(':N12, :N13, :N14, :N15, :N16, :N17, :N18, :N19, :N20, ');
        SQL.Add(':N21, :N22, :N23, :N24)');
        Parameters.ParamByName('N1').Value := nCurrParkNo;
        Parameters.ParamByName('N2').Value := nCurrUnitNo;
        Parameters.ParamByName('N3').Value := Copy(sManualInTime, 1, 10);
        Parameters.ParamByName('N4').Value := Copy(sManualInTime, 12, 8);
        Parameters.ParamByName('N5').Value := sManualTKNo;
        Parameters.ParamByName('N6').Value := nTKType;
        Parameters.ParamByName('N7').Value := nCarType;
        Parameters.ParamByName('N8').Value := '';
        Parameters.ParamByName('N9').Value := '';
        Parameters.ParamByName('N10').Value := '';
        Parameters.ParamByName('N11').Value := '';
        Parameters.ParamByName('N12').Value := 1;
        Parameters.ParamByName('N13').Value := nLprNo;
        Parameters.ParamByName('N14').Value := Copy(sNow, 1, 10);
        Parameters.ParamByName('N15').Value := Copy(sNow, 12, 8);
        Parameters.ParamByName('N16').Value := 4;
        Parameters.ParamByName('N17').Value := sLprFile1;
        Parameters.ParamByName('N18').Value := sLprCarNo1;
        Parameters.ParamByName('N19').Value := sLprFile2;
        Parameters.ParamByName('N20').Value := sLprCarNo2;
        Parameters.ParamByName('N21').Value := 3;
        Parameters.ParamByName('N22').Value := nLprRecog1;
        Parameters.ParamByName('N23').Value := 3;
        Parameters.ParamByName('N24').Value := nLprRecog2;
        ExecSQL;

        Close;
        SQL.Clear;
        SQL.Add('Select * from IONCount where ProcDate = :N1');
        Parameters.ParamByName('N1').Value := FormatDateTime('YYYY-MM-DD', Now);
        Open;
        nNOutCnt := 0;

        for i := 0 to 23 do
          nNOutCnt := nNOutCnt + FieldByName('Out' + MG_InsZero(IntToStr(i), 2))
            .AsInteger;
      end;
      DspProc(2, 1, '회차허용차량' + MG_Left(sLprCarNo1, 12), sDspIP);
      OutOpen(nowLpr);
      NGridData('2' + sInCarNo + '^' + Copy(sNow, 1, 10) + ' ' + Copy
          (sNow, 12, 8) + '^회차차량');
      sPrtData := '';
      ClearFormData;
    end
    else
    begin
      sNowLprFile1 := sLprFile1;
      sNowLprCarNo1 := sLprCarNo1;
      sNowLprFile2 := sLprFile2;
      sNowLprCarNo2 := sLprCarNo2;
      sNowIOTime := sIOTime;
      nNowLprNo := nLprNo;
      nNowLprInOut := nLprInOut;
      nNowLprRecog1 := nLprRecog1;
      nNowLprRecog2 := nLprRecog2;
      sNowInTKNo := sManualTKNo;
      nNowInUnitNo := nCurrUnitNo;
      sNowInDate := Copy(sManualInTime, 1, 10);
      sNowInTime := Copy(sManualInTime, 12, 8);
      sNowInCarNo := sLprCarNo1;
      sNowOutDate := Copy(sNow, 1, 10);
      sNowOutTime := Copy(sNow, 12, 8);

      //주차요금 계산전에 기존 할인자료 등 클리어한다.
      for i := 1 to 50 do
        RDCCnt[i].nDCNowCnt := 0;

      ClearGTime;
      ClearDCProc;

      if bFreeTime then
      begin
        if sFreeTimeE > Copy(sNowInTime, 1, 5) then
          nTotYogum := FeeCalc(nCurrParkNo, nFeeNo, PAnsiChar(sNowInDate + ' ' + sFreeTimeE),
                               PAnsiChar(Copy(sNow, 1, 16)))
        else
          nTotYogum := FeeCalc(nCurrParkNo, nFeeNo, PAnsiChar(sNowInDate + ' ' + Copy(sNowInTime, 1, 5)),
                               PAnsiChar(Copy(sNow, 1, 16)));
      end
      else
        nTotYogum := FeeCalc(nCurrParkNo, nFeeNo, PAnsiChar(sNowInDate + ' ' + Copy(sNowInTime, 1, 5)),
                             PAnsiChar(Copy(sNow, 1, 16)));

      nProcYogum := nTotYogum;
      edtTotYogum.Text := IntToStr(nTotYogum);
      edtTotYogum.AutoThousandSeparator := True;
      edtProcYogum.Text := FormatFloat('#,##0', nTotYogum);
      //edtProcYogum.AutoThousandSeparator := True;
      sYogum := IntToStr(nTotYogum);

      for i := 1 to 6 do
        TLabel(FindComponent('lbYogum' + IntToStr(i))).Visible := False;

      for i := 1 to Length(sYogum) do
      begin
        TLabel(FindComponent('lbYogum' + IntToStr(i))).Visible := True;
        TLabel(FindComponent('lbYogum' + IntToStr(i))).Caption := Copy
          (sYogum, Length(sYogum) - (i - 1), 1);
      end;

      for i := 1 to nUseBtnCnt do
      begin
        TAdvShapeButton(FindComponent('btn' + IntToStr(i))).Enabled := True;
        TMenuItem(FindComponent('mnuDC' + IntToStr(i))).Enabled := True;
      end;
      lbOutCarType.Caption := '일반차량';

      //if edtProcYogum.Text <> '0' then
      //  DspProc(2, 3, '주차요금    ' + MG_Right(edtProcYogum.Text + '원', 12), sDspIP)
      //else
      if edtProcYogum.Text = '0' then
        DspProc(2, 4, '회차허용차량' + MG_Left(sLprCarNo1, 12), sDspIP);

      btnProc.Enabled := True;

      if bCancel then
        btnCancel.Enabled := True;

      DCEnable(True);

      if bBarcodeDC then
      begin
        edtBarcode.Text := '';
        edtBarcode.SetFocus;
      end;
      sProcTime := sNow;
      sDCOutTime := sNow;

      if bTest then
      begin
        nPayType := 1;
        MoneyProc(nowLpr);
      end;
    end;
  except
    on E: Exception do
      ExceptLogging('ManualOut: ' + aString(E.Message));
  end;
end;

function TfrmMainNew.HuilCheck;
begin
  try
    Result:= False;

    if (DayOfWeek(Now) = 1) or (DayOfWeek(Now) = 7) then
      Result:= True
    else
      Result:= False

  except
    on E: Exception do ExceptLogging('TfrmMain.HuilCheck: ' + aString(E.Message));
  end;
end;

procedure TfrmMainNew.SCNormalOut(sLprFile1, sLprCarNo1, sLprFile2, sLprCarNo2,
                                  sIOTime: AnsiString; nLprNo, nLprInOut, nLprRecog1, nLprRecog2: Byte;
                                  sDspIP: AnsiString; csLPR: TClientSocket;
                                  sInDate, sInTime, sInFile: AnsiString; nInUnitNo: Byte);
var
  sTKNo, sDateTimeNow : aString;
begin
  try
    with dmTables do begin
      ADODB.BeginTrans;
      sTKNo := MG_InsZero(IntToStr(GetTickCount), 10);
//      FormatDateTime('YYYY-MM-DD HH:NN:SS', Now);
      sDateTimeNow   := FormatDateTime('YYYY-MM-DD', Now);
      if sInDate = sDateTimeNow then

      else begin
        sInDate := sDateTimeNow;
        sInTime := '00:00:00';
      end;
      sIOTime := sInDate + ' ' + sInTime;
      //'2014-10-19 15:39:21'
      with qrySCNormal do begin
        { TODO : 여기서 진입시간초과된 정기차량의 입차자료를 IONData에 Insert한다 }
        //여기서 진입시간초과된 정기차량의 입차자료를 IONData에 Insert한다...
        Close;
        SQL.Clear;
        Close;
        SQL.Clear;
        SQL.Add('Insert Into IONData ');
        SQL.Add('(ParkNo, UnitNo, ProcDate, ProcTime, TKNo, TKType, CarType, InImage1, InCarNo1, ');
        SQL.Add('InImage2, InCarNo2, Status, InRecog1, InRecog2) ');
        SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, :N12, :N13, :N14)');
        Parameters.ParamByName('N1').Value := nCurrParkNo;
        Parameters.ParamByName('N2').Value := nInUnitNo;
        Parameters.ParamByName('N3').Value := sInDate;
        Parameters.ParamByName('N4').Value := sInTime;
        Parameters.ParamByName('N5').Value := sTKNo;
        Parameters.ParamByName('N6').Value := 1;
        Parameters.ParamByName('N7').Value := 1;
        Parameters.ParamByName('N8').Value := sInFile;
        Parameters.ParamByName('N9').Value := sLprCarNo1;
        Parameters.ParamByName('N10').Value := sLprFile2;
        Parameters.ParamByName('N11').Value := sLprCarNo2;
        Parameters.ParamByName('N12').Value := 1;
        Parameters.ParamByName('N13').Value := nLprRecog1;
        Parameters.ParamByName('N14').Value := nLprRecog2;
        ExecSQL;
      end;
      ADODB.CommitTrans;
    end;

    if bNCOutProcWait then begin
      if nNCOutWaitPoint = 20 then
        nNCOutWaitPoint := 1
      else
        nNCOutWaitPoint := nNCOutWaitPoint + 1;

      RNCOutWait[nNCOutWaitPoint].sNCFile1 := sLprFile1;
      RNCOutWait[nNCOutWaitPoint].sNCCarNo1 := sLprCarNo1;
      RNCOutWait[nNCOutWaitPoint].sNCFile2 := sLprFile2;
      RNCOutWait[nNCOutWaitPoint].sNCCarNo2 := sLprCarNo2;
      RNCOutWait[nNCOutWaitPoint].sNCIOTime := sIOTime;
      RNCOutWait[nNCOutWaitPoint].nNCLprNo := nLprNo;
      RNCOutWait[nNCOutWaitPoint].nNCInOut := 2;
      RNCOutWait[nNCOutWaitPoint].nNCRecog1 := nLPRRecog1;
      RNCOutWait[nNCOutWaitPoint].nNCRecog2 := nLPRRecog2;
      RNCOutWait[nNCOutWaitPoint].nNCCharo := nNowCharo;
      RNCOutWait[nNCOutWaitPoint].sNCDspIP := sDspIP;
      RNCOutWait[nNCOutWaitPoint].csNCLPR := csLPR;
      RNCOutWait[nNCOutWaitPoint].bBarOpen := True;

      if not tNCOutWait.Enabled then
        tNCOutWait.Enabled := True;
    end else begin
      NormalProc(sLPRFile1, sLPRCarNo1, sLPRFile2, sLPRCarNo2, sIOTime, nLPRNo, 2,
        nLPRRecog1, nLPRRecog2, sDspIP, csLPR, True);
    end;
  except
    on E: Exception do
    begin
      dmTables.ADODB.RollbackTrans;
      ExceptLogging('TfrmMainNew.SCNormalOut: ' + aString(E.Message));
    end;
  end;
end;
end.
