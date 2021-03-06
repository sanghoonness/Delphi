unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IniFiles, Menus, Buttons, ToolWin, ComCtrls, DB, ADODB,
  Grids, BaseGrid, AdvGrid, DBAdvGrid, ExtCtrls, sSpeedButton, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdTime, AdvToolBtn, ScktComp,
  IdRawBase, IdRawClient, IdIcmpClient, IdAntiFreezeBase, IdAntiFreeze,
  IdContext, IdCustomTCPServer, IdTCPServer, IdServerIOHandler,
  IdServerIOHandlerSocket, IdServerIOHandlerStack, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, idGlobal, AdvObj,Winsock,
  shellapi,  TlHelp32, PsAPI;

type
  TfrmMain = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N7: TMenuItem;
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
    N22: TMenuItem;
    N23: TMenuItem;
    mnuClose: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    N29: TMenuItem;
    mnuParkInfo: TMenuItem;
    mnuUnitInfo: TMenuItem;
    mnuFeeItem: TMenuItem;
    mnuTariff: TMenuItem;
    mnuDCInfo: TMenuItem;
    mnuHoliday: TMenuItem;
    mnuGracetime: TMenuItem;
    mnuManager: TMenuItem;
    mnuWP: TMenuItem;
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
    Panel2: TPanel;
    Panel3: TPanel;
    pnIONData: TPanel;
    dgIONData: TDBAdvGrid;
    Panel4: TPanel;
    pnTKProc: TPanel;
    dgTKProc: TDBAdvGrid;
    Panel5: TPanel;
    pnSIn: TPanel;
    dgSCIn: TDBAdvGrid;
    Panel6: TPanel;
    pnSOut: TPanel;
    dgSCOut: TDBAdvGrid;
    tCount: TTimer;
    btnLock: TsSpeedButton;
    RF2: TMenuItem;
    RF3: TMenuItem;
    RF4: TMenuItem;
    RF5: TMenuItem;
    RF6: TMenuItem;
    RF7: TMenuItem;
    RF8: TMenuItem;
    RF9: TMenuItem;
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
    Panel9: TButton;
    Panel10: TButton;
    Panel11: TButton;
    Panel12: TButton;
    btnCBar: TSpeedButton;
    pnCBar: TPanel;
    btnCBar1: TAdvToolButton;
    btnCBar2: TAdvToolButton;
    btnCBar3: TAdvToolButton;
    btnCBar4: TAdvToolButton;
    btnCBar5: TAdvToolButton;
    btnCBar6: TAdvToolButton;
    btnCBar7: TAdvToolButton;
    btnCBar8: TAdvToolButton;
    btnCBarClose: TAdvToolButton;
    btnCBar9: TAdvToolButton;
    btnCBar10: TAdvToolButton;
    Panel8: TPanel;
    mniBlack: TMenuItem;
    N37: TMenuItem;
    d1: TMenuItem;
    q2: TMenuItem;
    N38: TMenuItem;
    tmrIONAuto: TTimer;
    mnuq1: TMenuItem;
    N21: TMenuItem;
    c1: TMenuItem;
    N39: TMenuItem;
    N40: TMenuItem;
    N41: TMenuItem;
    N42: TMenuItem;
    N43: TMenuItem;
    d2: TMenuItem;
    N4: TMenuItem;
    N3: TMenuItem;
    N44: TMenuItem;
    N45: TMenuItem;
    N46: TMenuItem;
    N5: TMenuItem;
    N47: TMenuItem;
    N48: TMenuItem;
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
    procedure btnCBarCloseClick(Sender: TObject);
    procedure btnCBarClick(Sender: TObject);
    procedure btnCBar1Click(Sender: TObject);
    procedure btnCBar2Click(Sender: TObject);
    procedure btnCBar3Click(Sender: TObject);
    procedure btnCBar4Click(Sender: TObject);
    procedure btnCBar5Click(Sender: TObject);
    procedure btnCBar6Click(Sender: TObject);
    procedure btnCBar7Click(Sender: TObject);
    procedure btnCBar8Click(Sender: TObject);
    procedure btnCBar9Click(Sender: TObject);
    procedure btnCBar10Click(Sender: TObject);
    procedure N37Click(Sender: TObject);
    procedure d1Click(Sender: TObject);
    procedure q2Click(Sender: TObject);
    procedure N38Click(Sender: TObject);
    procedure tmrIONAutoTimer(Sender: TObject);
    procedure mnuq1Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure c1Click(Sender: TObject);
    procedure N39Click(Sender: TObject);
    procedure N40Click(Sender: TObject);
    procedure N41Click(Sender: TObject);
    procedure N42Click(Sender: TObject);
    procedure N43Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N44Click(Sender: TObject);
    procedure N45Click(Sender: TObject);
    procedure N46Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N47Click(Sender: TObject);
    procedure N48Click(Sender: TObject);
  private
    { Private declarations }
    procedure ICMPReply(ASender: TComponent; const ReplyStatus: TReplyStatus);
    function is_ping(IP: AnsiString): Boolean;
  public
    { Public declarations }
    procedure UnitCtrl(nCmd, nFCNo, nUnitNo, nMNo: Word; sData:AnsiString);
  end;

var
  frmMain: TfrmMain;
  ping_success: Boolean = False;
  function IcmpCreateFile : THandle; stdcall; external 'icmp.dll';
  function IcmpCloseHandle (icmpHandle : THandle) : boolean; stdcall; external 'icmp.dll';
  function IcmpSendEcho (IcmpHandle    : THandle;  DestinationAddress: LongInt;
                         RequestData   : Pointer;  RequestSize       : Smallint;
                         RequestOptions: pointer;  ReplyBuffer       : Pointer;
                         ReplySize     : DWORD;    Timeout           : DWORD): DWORD;
                         stdcall; external 'icmp.dll';
implementation
uses
  Global, Tables, ParkInfo, UnitInfo, FeeItem, Tariff, DCInfo, Holiday, Gracetime,
  Manager, WP, SCGroup, CustInfo, NewSC, Login, AddSC, NProc, IONData, IOSData, Custinfo_D,
  SCData, NSCData, Card, CardAdd, RFSCGroup, RFSCCustInfo, NewRFSC, AddRFSC, Coupon,
  FreeIOData, CouponList, IOCnt, Recog, RFSCData, RFIOSData, RFNSCData, DailyReport,
  MonthlyReport, CarNoModify, IOSCnt, Freetime, ParkingTime, NewBSC, BlackListInfo, IOBData,
  Parkinfo_Yo, BlackSearch, CarPossession, InOutCarList, Day_IOS_ION, Term_IOS_ION, Month_IOS_ION, Day2_IOS_ION, Condition_IOS_ION,
  NomalCar_Management, IOVisitStat, PDASearch, Homenet_Point, EasyOnHomeInfo, Visit_Info, VisitAmount, Visitinfo_insert, CustInfo_WP;

{$R *.dfm}

//12.22 ?????? ???? ????
Procedure GetPIDsByProgramName(AProcessName: string; IncludeSelf: Boolean; ResultList: TStringList);
var
  isFound: boolean;
  AHandle, AhProcess: THandle;
  ProcEntry32: TProcessEntry32;
  APath: array[0..MAX_PATH] of char;
begin
  AProcessName := ExtractFileName(AProcessName);
  ResultList.Clear;

  try
    AHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
    ProcEntry32.dwSize := Sizeof(TProcessEntry32);
    isFound := Process32First(AHandle, ProcEntry32);

    while isFound do
    begin
      AhProcess := OpenProcess(PROCESS_QUERY_INFORMATION or PROCESS_VM_READ, false, ProcEntry32.th32ProcessID);
      GetModuleFileNameEx(AhProcess, 0, @APath[0], sizeof(APath));
      CloseHandle(AhProcess);

      if (UpperCase(StrPas(APath)) <> UpperCase(AProcessName)) AND
         (UpperCase(StrPas(ProcEntry32.szExeFile)) <> UpperCase(AProcessName)) then
      begin
        isFound := Process32Next(AHandle, ProcEntry32);
        Continue;
      end;

      if ProcEntry32.th32ProcessID = GetCurrentProcessId then
      Begin
        if NOT IncludeSelf then
        begin
          isFound := Process32Next(AHandle, ProcEntry32);
          Continue;
        end;
      End;

      ResultList.Add(IntToStr(ProcEntry32.th32ProcessID));
      isFound := Process32Next(AHandle, ProcEntry32);
    end;
  finally
    CloseHandle(AHandle);
  end;
end;
Function KillProcessByPIDList(PIDList: TStringList): Boolean;
Var
  KillProcessParam : String;
  I: Integer;
  CmdPID : PDWORD;
Begin
  Result := True;
  KillProcessParam := '/F /T ';
  for I := 0 to PIDList.Count - 1 do
  Begin
    KillProcessParam := KillProcessParam + '/PID ' + PIDList[I];
  End;
  ShellExecute(0, 'Open', 'TaskKill.exe', PChar(KillProcessParam), '', SW_HIDE);
End;

Function KillProcessByProgramName(AProcessName: String = ''; IncludeSelf: Boolean = False): Boolean;
Var
  PIDList : TStringList;
Begin
  Result := True;
  if AProcessName = '' then
  Begin
    AProcessName := Application.ExeName;
  End;
  AProcessName := ExtractFileName(AProcessName);

  PIDList := TStringList.Create;
  GetPIDsByProgramName(AProcessName, IncludeSelf, PIDList);
  while PIDList.Count > 0 do
  Begin
    KillProcessByPIDList(PIDList);
    PIDList.Clear;
    GetPIDsByProgramName(AProcessName, IncludeSelf, PIDList);
  End;
  FreeAndNil(PIDList);
End;

procedure OnAssertError(const Message, Filename: string; LineNumber: Integer; ErrorAddr: Pointer);
var
  nResult, nLogType: Integer;
  sMsg: string;
begin

  if (Pos('[HomeInfo]', Message) > 0) then
  begin
    nLogType := 10;
    sMsg := StringReplace(Message, '[HomeInfo]', '', [rfReplaceAll, rfIgnoreCase]);
  end
  else if (Pos('[Except]', Message) > 0) then
  begin
    nLogType := 10;
    sMsg := StringReplace(Message, '[Except]', '', [rfReplaceAll, rfIgnoreCase]);
  end
  else if (Pos('[Normal]', Message) > 0) then
  begin
    nLogType := 30;
    sMsg := StringReplace(Message, '[Normal]', '', [rfReplaceAll, rfIgnoreCase]);
  end
  else if (Pos('[Closing]', Message) > 0) then
  begin
    nLogType := 40;
    sMsg := StringReplace(Message, '[Closing]', '', [rfReplaceAll, rfIgnoreCase]);
  end
  else
  begin
    nLogType := 20;
    sMsg := Message;
  end;

  sMsg := Trim(Format('%s: Line: %d, %s', [ExtractFileName(Filename), LineNumber, sMsg]));

  if (Assigned(frmMain)) then
  begin
    case nLogType of      //--------------
      10: //[HomeInfo]
      //--------------
        begin
          HomeInfoLogging(sMsg);
        end;
      //--------------
      20: //[Except]
      //--------------
        begin
          ExceptLogging(sMsg);
        end;
      //--------------
      30: //[Normal]
      //--------------
        begin
          //NormalLogging(sMsg);
        end;
      //--------------
      40: //[Closing]
      //--------------
        begin
          //ClosingLogging(sMsg);
        end
    else
      begin
        //----------
        //[Normal]
        //----------
        //NormalLogging(sMsg);
      end;
    end
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
var
  sRecv, sRemortIP, sSend, sData: aString;
  nCmd, nUnitNo, nMNo: Word;
  i: Byte;
  bSend: Boolean;
begin
  try
    sRecv := AContext.Connection.IOHandler.ReadString
      (AContext.Connection.IOHandler.InputBuffer.Size, enUTF8);

    if Pos(STX, sRecv) > 0 then
      sErrRecv := sErrRecv
    else
      sErrRecv := sErrRecv + sRecv;

    if (Pos(STX, sErrRecv) <= 0) or (Pos(ETX, sErrRecv) <= 0) then
      Exit;

    sRemortIP := AContext.Binding.PeerIP;
    ExceptLogging('FC_Recv: ' + sErrRecv + ':' + sRemortIP);
    nCmd := StrToInt(Copy(sRecv, 2, 2));
    nUnitNo := StrToInt(Copy(sRecv, 4, 5));
    nMNo := StrToInt(Copy(sRecv, 9, 3));

    if Pos(ETX, sErrRecv) > 12 then
    begin
      // ???????? ??????...
      sData := Copy(sErrRecv, 12, Pos(ETX, sErrRecv) - 12);
    end
    else
      sData := '';

    bSend := False;

    {
    case nCmd of
      2:
        begin
          if not tRecog.Enabled then
            tRecog.Enabled:= True;
        end;
    end;
    }
    sErrRecv := '';
  except
    on E: Exception do
      ExceptLogging('TfrmMain.idTSExecute: ' + aString(E.Message));
  end;
end;

//function TfrmMain.is_ping(IP: AnsiString): Boolean;
//begin
//  Result:= False;
//  try
//    with ICMP do
//    begin
//      OnReply:= ICMPReply;
//      ReceiveTimeOut:= 2000;
//      Host:= wString(IP);
//      Ping;
//    end;
//    Result:= ping_success;
//  except
//    on E: Exception do ExceptLogging('TfrmMain.is_ping: ' + aString(E.Message));
//  end;
//end;
function TfrmMain.is_Ping(ip: AnsiString): Boolean;
var
   Handle : THandle;
   DW : DWORD;
   REP : ICMPECHO;
   IPLong: LongInt;
begin
     //Result := -1;
     Result:= False;
     //ExceptLogging('Ping ???? ????1-' + IntToStr(GetTickCount));

     Handle := IcmpCreateFile;

     if Handle = INVALID_HANDLE_VALUE then Exit;

     IPLong := inet_addr(PAnsiChar( ip ));
     DW := IcmpSendEcho(Handle, IPLong, nil, 0, nil, @rep, Sizeof(Rep), nPingTimeOut );

     //Result := rep.Status;

     if rep.status = 0 then
       Result:= True
     else
       Result:= False;

     //ExceptLogging('Ping ???? ????2-' + IntToStr(GetTickCount));
     IcmpCloseHandle(Handle);
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
      Parameters.ParamByName('N1').Value:= nUnitNo;//nFCNo;
      Open;

      if RecordCount > 0 then
      begin
        sFCIp:= MG_StrTrim(FieldByName('IPNo').AsString, ' ');
        nFCPort:= FieldByName('PortNo').AsInteger;

        if not idTC.Connected then
        begin
           idTC.Disconnect;
           idTC.Host:= sFCIp;
           idTC.Port:= nFCPort;
           idTC.Connect;
        end;

        if nCmd = 1 then
        begin
          idTC.IOHandler.WriteLnRFC('BAR_OPEN_1', enUTF8);
          ExceptLogging(inttostr(nUnitNo) + '?? ??????OPEN');
        end
        else if nCmd = 2 then
        begin
          idTC.IOHandler.WriteLnRFC('BAR_CLOSE_1', enUTF8);
          ExceptLogging(inttostr(nUnitNo) + '?? ??????CLOSE');
        end;

        if not is_Ping(sFCIP) then
        begin
          idTC.Disconnect;
          idTC.Host:= sFCIp;
          idTC.Port:= nFCPort;
          idTC.Connect;
        end;

//        if is_Ping(sFCIP) then
//        begin
//          try
//            //idTC.Disconnect;
//            //idTC.Host:= sFCIp;
//            //idTC.Port:= nFCPort;
//            //idTC.Connect;
//
//              if Count = 0 then
//              begin
//                 idTC.Disconnect;
//                 idTC.Host:= sFCIp;
//                 idTC.Port:= nFCPort;
//                 idTC.Connect;
//              end;
//
////            if idTC.Connected then
////            begin
////              sSend:= STX + MG_InsZero(IntToStr(nCmd), 2) + MG_InsZero(IntToStr(nUnitNo), 5) +
////                      MG_InsZero(IntToStr(nMNo), 3) + sData + ETX;
//              if nCmd = 1 then
//              begin
//                idTC.IOHandler.WriteLnRFC('BAR_OPEN_1', enUTF8);
//                ExceptLogging(inttostr(nUnitNo) + '?? ??????OPEN');
//
//              end
//              else if nCmd = 2 then
//              begin
//                idTC.IOHandler.WriteLnRFC('BAR_CLOSE_1', enUTF8);
//                ExceptLogging(inttostr(nUnitNo) + '?? ??????CLOSE');
//              end;
//              //idTC.IOHandler.WriteLnRFC(sSend, enUTF8);
//              idTC.Disconnect;
//              Count := Count + 1;
////            end
//
//            if not idTC.Connected then
//            begin
//              idTC.Disconnect;
//              idTC.Host:= sFCIp;
//              idTC.Port:= nFCPort;
//              idTC.Connect;
//              Count := Count + 1;
//            end;
//          except
//            on E: Exception do ExceptLogging('TfrmMain.UnitCtrl: ' + aString(E.Message));
//          end;
//        end
//        else
//          ExceptLogging('UnitCtrl(' + IntToStr(nCmd) + ')?? ???????? ????!');

      end;
    end;
  except
    on E: Exception do ExceptLogging('TfrmMain.UnitCtrl: ' + aString(E.Message));
  end;
end;

procedure TfrmMain.btnBar10Click(Sender: TObject);
var
  sReason: aString;
begin
  sReason:= InputBox('????????????', '???????????????????? ??????????????!', '');
  UnitCtrl(1, btnBar10.ImageIndex, btnBar10.Tag, nCurrMNo, sReason);
end;

procedure TfrmMain.btnBar1Click(Sender: TObject);
var
  sReason: aString;
begin
  sReason:= InputBox('????????????', '???????????????????? ??????????????!', '');
  UnitCtrl(1, btnBar1.ImageIndex, btnBar1.Tag, nCurrMNo, sReason);
end;

procedure TfrmMain.btnBar2Click(Sender: TObject);
var
  sReason: aString;
begin
  sReason:= InputBox('????????????', '???????????????????? ??????????????!', '');
  UnitCtrl(1, btnBar2.ImageIndex, btnBar2.Tag, nCurrMNo, sReason);
end;

procedure TfrmMain.btnBar3Click(Sender: TObject);
var
  sReason: aString;
begin
  sReason:= InputBox('????????????', '???????????????????? ??????????????!', '');
  UnitCtrl(1, btnBar3.ImageIndex, btnBar3.Tag, nCurrMNo, sReason);
end;

procedure TfrmMain.btnBar4Click(Sender: TObject);
var
  sReason: aString;
begin
  sReason:= InputBox('????????????', '???????????????????? ??????????????!', '');
  UnitCtrl(1, btnBar4.ImageIndex, btnBar4.Tag, nCurrMNo, sReason);
end;

procedure TfrmMain.btnBar5Click(Sender: TObject);
var
  sReason: aString;
begin
  sReason:= InputBox('????????????', '???????????????????? ??????????????!', '');
  UnitCtrl(1, btnBar5.ImageIndex, btnBar5.Tag, nCurrMNo, sReason);
end;

procedure TfrmMain.btnBar6Click(Sender: TObject);
var
  sReason: aString;
begin
  sReason:= InputBox('????????????', '???????????????????? ??????????????!', '');
  UnitCtrl(1, btnBar6.ImageIndex, btnBar6.Tag, nCurrMNo, sReason);
end;

procedure TfrmMain.btnBar7Click(Sender: TObject);
var
  sReason: aString;
begin
  sReason:= InputBox('????????????', '???????????????????? ??????????????!', '');
  UnitCtrl(1, btnBar7.ImageIndex, btnBar7.Tag, nCurrMNo, sReason);
end;

procedure TfrmMain.btnBar8Click(Sender: TObject);
var
  sReason: aString;
begin
  sReason:= InputBox('????????????', '???????????????????? ??????????????!', '');
  UnitCtrl(1, btnBar8.ImageIndex, btnBar8.Tag, nCurrMNo, sReason);
end;

procedure TfrmMain.btnBar9Click(Sender: TObject);
var
  sReason: aString;
begin
  sReason:= InputBox('????????????', '???????????????????? ??????????????!', '');
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

procedure TfrmMain.btnCBarCloseClick(Sender: TObject);
begin
  pnCBar.Visible:= False;
end;

procedure TfrmMain.btnLockClick(Sender: TObject);
begin
  if bMenuLock then
  begin
    NextModalDialog(TfrmLogin.Create(Self));

    Case nLoginResult of
      1:      begin
                btnLock.Caption:= '????????';
                bMenuLock:= False;
              end;

      0:      begin
                ShowMessage('???????????? ???????? ?????????? ?????? ?? ????????.');
                Exit;
              end;
    end;

    case nManagerAuthority of
      0: begin
           N1.Enabled:= True;
           N2.Enabled:= True;
//           N3.Enabled:= True;
           N7.Enabled:= True;
//           N8.Enabled:= True;
           RF2.Enabled:= True;
           mnuParkInfo.Enabled:= True;
           mnuUnitInfo.Enabled:= True;
      end;

      1: begin
           N1.Enabled:= True;
           N2.Enabled:= True;
//           N3.Enabled:= True;
           N7.Enabled:= True;
//           N8.Enabled:= True;
           RF2.Enabled:= True;
           mnuParkInfo.Enabled:= False;
           mnuUnitInfo.Enabled:= False;
      end;

      2: begin
           N1.Enabled:= False;
           N2.Enabled:= True;
//           N3.Enabled:= True;
           N7.Enabled:= True;
//           N8.Enabled:= True;
           RF2.Enabled:= True;
      end;

      3: begin
           ShowMessage('???????? ?????????? ????????.');
           Close;
           Exit;
      end;
    end;
  end
  else
  begin
    if nLoginResult = 1 then
    begin
      btnLock.Caption:= '????????????';
      bMenuLock:= True;
    end;
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  try
    KillProcessByProgramName;
    CreateFileMapping( $FFFFFFFF, nil, PAGE_READWRITE, 0, 1, 'Parking_HOST' );

    if GetLastError=ERROR_ALREADY_EXISTS then
    begin
      ShowMessage('?????????????????? ???? ????????????.'#13#13#10 + '??????????????!');
      halt;
    end;
    sCurrRunDir:= aString(ExtractFileDir(Application.ExeName));

    if not DirectoryExists('Log') then MkDir('Log');
  except
    on E: Exception do ExceptLogging('TfrmMain.FormCreate: ' + aString(E.Message));
  end;
end;

procedure TfrmMain.FormResize(Sender: TObject);
begin
  pnBar.Top:= (frmMain.ClientHeight - pnBar.Height) div 2;
  pnBar.Left:= (frmMain.ClientWidth - pnBar.Width) div 2;
  pnCBar.Top:= (frmMain.ClientHeight - pnCBar.Height) div 2;
  pnCBar.Left:= (frmMain.ClientWidth - pnCBar.Width) div 2;
  Panel3.Width:= (frmMain.ClientWidth - 12) div 2;
  Panel5.Width:= Panel3.Width;
  Panel2.Height:= (frmMain.ClientHeight - 94) div 2;
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
  frmMain.Refresh;
end;

procedure TfrmMain.FormShow(Sender: TObject);
var
  sDBString: aString;
  SystemTime: TSystemTime;
  sDateTime, sYear, sMonth, sDay, sHour, sMin, sSec: String;
  i: Byte;
  nBlackUse : Integer;

  function GetFileVersion(sFilePath: string): string;
  var
    Size, Size2: DWord;
    Pt, Pt2: Pointer;
  begin
    Result := '';
    Size := GetFileVersionInfoSize(pChar(sFilePath), Size2);
    if Size > 0 then
    begin
      GetMem(Pt, Size);
      try
        GetFileVersionInfo(pChar(sFilePath), 0, Size, Pt);
        VerQueryValue (Pt, '\', Pt2, Size2);
        with TVSFixedFileInfo(Pt2^) do
        begin
          Result := Format('%d.%d.%d.%d', [HiWord(dwFileVersionMS), LoWord(dwFileVersionMS), HiWord(dwFileVersionLS), LoWord(dwFileVersionLS)]);
        end;
      finally
        FreeMem(Pt);
      end;
    end;
  end;

  procedure CheckDataBaseColumn;
  const
    ENDCM = ' ???????? ????';
  begin
    //DB?????? ???? ?????? ?????? ???? ???? ???????? ???????? ????
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
          ExceptLogging('?????? ????????'+ENDCM);
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
          ExceptLogging('SMS????'+ENDCM);
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
          ExceptLogging('????????????????'+ENDCM);
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
          ExceptLogging('?????? ????????'+ENDCM);
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
          ExceptLogging('?????? ????'+ENDCM);
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
          ExceptLogging('?????? ????(sAlias), ????????????(dtUpd) '+ENDCM);
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
          ExceptLogging('?????? ????'+ENDCM);
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
          ExceptLogging('?????????? ????????'+ENDCM);
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
          ExceptLogging('???????? ?????? ????????'+ENDCM);
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
          ExceptLogging('????????????????????Table ????'+ENDCM);
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
          ExceptLogging('???????? ??????????'+ENDCM);
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
          ExceptLogging('?????????????? ???? ????'+ENDCM);
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
          SQL.Text := 'ALTER TABLE '+Parameters.ParamByName('v1').Value+' ADD  '+Parameters.ParamByName('v2').Value+' VARCHAR(1) NOT NULL CONSTRAINT DF_ADDR DEFAULT ''N'' ';
          ExecSQL;
          ExceptLogging('?????????? ???? ???? ????'+ENDCM);
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
          ExceptLogging('??????????????????'+ENDCM);
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
          ExceptLogging('??????????Table ????'+ENDCM);
        end;
      end;

      with qryMainTemp do begin
        Close;
        SQL.Clear;
        SQL.Text := 'select count(*) from INFORMATION_SCHEMA.COLUMNS where table_name=:v1 and column_name=:v2';
        Parameters.ParamByName('v1').Value := 'Visit_Point';
        Parameters.ParamByName('v2').Value := 'startdatetime';
        Open;
        if Fields[0].Value = 0 then begin
          Close;
          SQL.Text := 'ALTER TABLE '+Parameters.ParamByName('v1').Value+' ADD  '+Parameters.ParamByName('v2').Value+' dateTime  ';
          ExecSQL;
          ExceptLogging('??????????startdatetime ????'+ENDCM);
        end;
      end;

      with qryMainTemp do begin
        Close;
        SQL.Clear;
        SQL.Text := 'select count(*) from INFORMATION_SCHEMA.COLUMNS where table_name=:v1 and column_name=:v2';
        Parameters.ParamByName('v1').Value := 'Visit_Point';
        Parameters.ParamByName('v2').Value := 'PointType';
        Open;
        if Fields[0].Value = 0 then begin
          Close;
          SQL.Text := 'ALTER TABLE '+Parameters.ParamByName('v1').Value+' ADD  '+Parameters.ParamByName('v2').Value+' int default 2 ';
          ExecSQL;
          ExceptLogging('?????????? PointType ????'+ENDCM);
        end;
      end;

      with qryMainTemp do begin
        Close;
        SQL.Clear;
        SQL.Text := 'select count(*) from INFORMATION_SCHEMA.COLUMNS where table_name=:v1 and column_name=:v2';
        Parameters.ParamByName('v1').Value := 'Visit_Point';
        Parameters.ParamByName('v2').Value := 'PointUnit';
        Open;
        if Fields[0].Value = 0 then begin
          Close;
          SQL.Text := 'ALTER TABLE '+Parameters.ParamByName('v1').Value+' ADD  '+Parameters.ParamByName('v2').Value+' int default 1 ';
          ExecSQL;
          ExceptLogging('??????????PointUnit  ????'+ENDCM);
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
          ExceptLogging('???????????? ????????????Table ????'+ENDCM);
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
          ExceptLogging('???? ???????? ???? ????'+ENDCM);
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
          ExceptLogging('???? ???????? ???? ????'+ENDCM);
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
                      'nReg_No int IDENTITY(1,1) NOT NULL, ' +  //'(PK:??????????)',
                      'nDong   int NOT NULL default -1, ' +  //  '(??)',
                      'nHo     int NOT NULL default -1, ' +  // '(??)',
                      'sCar_Number varchar(50)  NOT NULL default '''',  '+ //'(????????)',
                      'sRegister   varchar(50)  NOT NULL default '''',  '+ //'(??????)',
                      'sDeleteYN   varchar(2)   NOT NULL default ''N'', '+  //(????.????),
                      'dtUpd       datetime     NOT NULL default getdate(),   '+  // '(????.????)',
                      'dtReg       datetime     NOT NULL default getdate(),   '+  //'(????.????)',
                      'CONSTRAINT [PK_tVisitfavo] PRIMARY KEY CLUSTERED       '+
                      '(                                                      '+                      'nReg_No      ASC,                                      '+                      'nDong        ASC,                                      '+                      'nHo          ASC,                                      '+                      'sCar_Number  ASC                                       '+                      ')WITH ( PAD_INDEX = OFF,                               '+                      '        STATISTICS_NORECOMPUTE = OFF,                  '+                      '    IGNORE_DUP_KEY = OFF,                              '+                      '    ALLOW_ROW_LOCKS = ON,                              '+                      '    ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]               '+                      ') ON [PRIMARY]                                         ';          ExecSQL;
          ExceptLogging('???????? ???????? Table ???? '+ENDCM);
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
                                      ') ON [PRIMARY]               ';          ExecSQL;
          ExceptLogging('???????? Table ???? '+ENDCM);
        end;
      end;

      with qryMainTemp do begin
        Close;
        SQL.Clear;
        SQL.Text := 'select COUNT(*) from INFORMATION_SCHEMA.TABLES where table_name= :v1';// and column_name=:v2 and column_name=:v3 and column_name=:v4 and column_name=:v5';
        Parameters.ParamByName('v1').Value := 'VisitInfo_SmartVillage';
        Open;
        if Fields[0].Value = 0 then begin
          Close;
          SQL.Text := 'CREATE TABLE '+Parameters.ParamByName('v1').Value + '('+
                                      'vtype VARCHAR(50) not null,' +
                                      'vcarno VARCHAR(50) not null,' +
                                      'vstartDt varchar(50) not null,' +
                                      'vendDt varchar(19) not null, '+
                                      'vupdateDt varchar(50) not null, '+
                                      'vordNo int IDENTITY(0,1) NOT NULL, '+
                                      'vmodifiedAt varchar(100) NULL) ';

          ExecSQL;
          ExceptLogging('???????????? ????????????Table ????'+ENDCM);
        end;
      end;
      //???????? ????

      with qryMainTemp do begin
        Close;
        SQL.Clear;
        SQL.Text := 'select COUNT(*) from INFORMATION_SCHEMA.TABLES where table_name= :v1';
        Parameters.ParamByName('v1').Value := 'PDAPatrolData';
        Open;
        if Fields[0].Value = 0 then begin
          Close;
          SQL.Text := 'CREATE TABLE '+Parameters.ParamByName('v1').Value + '('+
                                      'ParkNo smallint NOT NULL,' +
                                      'PatrolDate char(10) NOT NULL,' +
                                      'PatrolTime char(8) NOT NULL,' +
                                      'PatrolCode int NOT NULL, '+
                                      'PatrolName varchar(50) NOT NULL, '+
                                      '[CarNo] [varchar](50) NOT NULL,  '+
                                      '[CarType] [smallint] NOT NULL,      '+
                                      '[PatrolImage] [varchar](300) NULL,  '+
                                      '[PatrolRemark] [varchar](100) NULL, '+
                                      '[Reserve1] [varchar](50) NULL,      '+
                                      '[Reserve2] [varchar](50) NULL,      '+
                                      '[Reserve3] [varchar](50) NULL,      '+
                                      '[Reserve4] [varchar](50) NULL,      '+
                                      '[Reserve5] [varchar](50) NULL,      '+
                                      ' CONSTRAINT [PK_PDAPatrolData] PRIMARY KEY CLUSTERED   '+
                                      '(                                                      '+
                                      '	[ParkNo] ASC,                                         '+
                                      '	[PatrolDate] ASC,                                     '+
                                      '	[PatrolTime] ASC,                                     '+
                                      '	[PatrolCode] ASC                                      '+
                                      ')WITH (PAD_INDEX = ON, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]  '+
                                      ') ON [PRIMARY]                                         ';

          ExecSQL;
          ExceptLogging('???????? Table ????'+ENDCM);
        end;
      end;

      with qryMainTemp do begin
        Close;
        SQL.Clear;
        SQL.Text :=  'select name '+
                     'FROM sys.sql_logins '+
                     'where name = :v1 ';
                    {'SELECT Roles.Name, Roles.Type_Desc, Members.Name MemberName, Members.Type_Desc        '+
                    'FROM sys.server_role_members RoleMembers                                              '+
                    'INNER JOIN sys.server_principals Roles ON Roles.Principal_Id = RoleMembers.Role_Principal_Id         '+
                    'INNER JOIN sys.server_principals Members ON Members.Principal_Id = RoleMembers.Member_Principal_Id   '+
                    'where Members.name like :v1  '; }
        Parameters.ParamByName('v1').Value := 'siview';
        open;
        //if Fields[0].Value = 0 then begin
        if RecordCount = 0 then begin
          Close;
          SQL.Text := 'exec sp_addlogin ''siview'', ''siview'' ';
          ExecSQL;
          ExceptLogging('???????? ?????? ????');
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
          ExceptLogging('???????? ???? ????'+ENDCM);
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
          ExceptLogging('???????? ???? ???? ???? ???? '+ENDCM);
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
          ExceptLogging('???????? ?????????? '+ENDCM);
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
          ExceptLogging('???????? ???????? ???? '+ENDCM);
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
          ExceptLogging('???? ?????? ????  '+ENDCM);
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
          ExceptLogging('???? ?????? ????  '+ENDCM);
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
          ExceptLogging('???????? ???? ?????????? ????  '+ENDCM);
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
          ExceptLogging('???????????? ????  '+ENDCM);
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
          ExceptLogging('?????? ???? ????  '+ENDCM);
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
          ExceptLogging('?????? ???? ????2  '+ENDCM);
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
          ExceptLogging('???????? ???? ?????? ????'+ENDCM);
        end;
      end;

      with qryMainTemp do begin
        Close;
        SQL.Clear;
        SQL.Text := 'select COUNT(*) from INFORMATION_SCHEMA.TABLES where table_name= :v1';
        Parameters.ParamByName('v1').Value := 'Visitinfo_insert_icon';
        Open;
        if Fields[0].Value = 0 then begin
          Close;
          SQL.Text := 'CREATE TABLE '+Parameters.ParamByName('v1').Value + '('+
                                      'dong [varchar](50) NOT NULL, '+
                                      'ho [varchar](50) NOT NULL,   '+
                                      'visit_insert_standard int default 0, '+
                                      'visit_insert_use int default 0,      '+
                                      'visit_insert_count int default 0,    '+
                                      'visit_insert_precount int default 0  '+
                                      ') ON [PRIMARY]                       ';

          ExecSQL;
          ExceptLogging('????????????(????) ???????? ???? ?????? ????'+ENDCM);
        end;
      end;

      with qryMainTemp do begin
        Close;
        SQL.Clear;
        SQL.Text := 'select count(*) from INFORMATION_SCHEMA.COLUMNS where table_name=:v1 and column_name=:v2';
        Parameters.ParamByName('v1').Value := 'IOSData';
        Parameters.ParamByName('v2').Value := 'ParkingMin';
        Open;
        if Fields[0].Value = 0 then begin
          Close;
          SQL.Text := 'ALTER TABLE '+Parameters.ParamByName('v1').Value+' ADD  '+Parameters.ParamByName('v2').Value+' int default 0 ';
          ExecSQL;
          ExceptLogging('???????? ParkingMin  ????'+ENDCM);
        end;
      end;

    except
      on E: Exception do begin
        ExceptLogging(TfrmMain(Sender).Name + E.Message);
      end;
    end;
  end;
begin
  try
    ExceptLogging('Program Start!');
    iSetup:= TIniFile.Create(ExtractFileDir(Application.ExeName) + '\ParkSet.ini');
    adminManager := aString(iSetup.ReadString('PARKING', '??????ID', '(??)????????????'));
    sDBIP:= aString(iSetup.ReadString('PARKING', 'DB IP', ''));
    sDBID:= aString(iSetup.ReadString('PARKING', 'DB ID', ''));
    sDBPW:= aString(iSetup.ReadString('PARKING', 'DB PW', ''));
    sDBName:= iSetup.ReadString('PARKING', 'DB Name', '');
    pnBar.Top:= (frmMain.ClientHeight - pnBar.Height) div 2;
    pnBar.Left:= (frmMain.ClientWidth - pnBar.Width) div 2;
    sImageDir:= 'C:\LPRImage';
    nApt        := iSetup.ReadInteger('PARKING', '??????', 1);
    nBlackUse   := iSetup.ReadInteger('PARKING', '??????????', 0);
    nYogumMode  := iSetup.ReadInteger('PARKING', '????????', 0);    //0:???????????? ????, 1:?????????? ????
    nCurrUnitNo := iSetup.ReadInteger('PARKING', 'UnitNo', 0);
    nVisitReason   := iSetup.ReadInteger('PARKING', '????????', 0);
    nBujaeUse      := iSetup.ReadInteger('PARKING', '????????', 0);
    bBlockLPRUse   := iSetup.ReadBool('PARKING', 'LPR??????????????', False);
    bIMageUse   := iSetup.ReadInteger('PARKING', '??????????', 1);
    PDAUSE   := iSetup.ReadInteger('PARKING', '????????', 0);
    homenetuse   := iSetup.ReadInteger('PARKING', '????', 0);
    nvisituse   := iSetup.ReadInteger('PARKING', '????????', 0);
    DelCustinfoAll := iSetup.ReadInteger('PARKING', '????????????????', 0);
    smartVillagePoint := iSetup.ReadInteger('PARKING', '????????????', 0);
    sHomeInfo_IP := MG_StrTrim(iSetup.ReadString('PARKING', 'HomeInfo IP', '10.10.10.10'), ' ');
    nHomeInfo_Port := iSetup.ReadInteger('PARKING', 'HomeInfo Port', 25008);
    nHomenet_visit  := iSetup.ReadInteger('PARKING', '????????????', 0);
    nWP  := iSetup.ReadInteger('PARKING', '????????????????????', 0);
    if nBlackUse = 1 then                                //?????????? ?????? ???????? ????
      mniBlack.Visible := True;

    if nYogumMode = 1 then
    begin
      mnuFeeItem.Visible:= true;
      mnuTariff.Visible := True;
      mnuDCInfo.Visible := True;
      mnuHoliday.Visible:= True;
      mnuGracetime.Visible:= True;
      mnuWP.Visible     := True;
      N32.Visible       := True; //????????????????
      N10.Visible       := True; //????????????
      N11.Visible       := True; //????????????
      N12.Visible       := True; //????????????
      N19.Visible       := True; //?????????? ????
      N17.Visible       := True; //?????? ???????? ???????? ????
      N20.Visible       := True; //???????? ????????
      N43.Visible := True; //?????? ????(????,????)????

      Panel3.Width:= frmMain.ClientWidth div 2;
      Panel5.Width:= Panel3.Width;
      Panel2.Visible := True;
      Panel2.Height:= (frmMain.ClientHeight - sb1.Height - CoolBar1.Height) div 2;
    end;

    if sDBIP = '' then
      sDBIP:= aString(InputBox('DB???? ????', 'DB IP ???? DB???????? ??????????????', ''));

    if sDBID = '' then
      sDBID:= aString(InputBox('DB ID ????', 'DB ?????? ID?? ??????????????', ''));

    if sDBPW = '' then
      sDBPW:= aString(InputBox('DB Password ????', 'DB ?????? Password?? ??????????????', ''));

    if sDBName = '' then
      sDBName := aString(InputBox('DB Name ????', 'DB????  ??????????????', ''));

    if (sDBIP <> '') and (sDBID <> '') and (sDBPW <> '') and (sDBName <> '') then
    begin
      try
        //DB????...
        dmTables.ADODB.Connected := False;
        sDBString := 'Provider=SQLOLEDB.1;Persist Security Info=False;';
        sDBString := sDBString + 'User ID=' + sDBID;
        sDBString := sDBString + ';Password=' + sDBPW;
        sDBString := sDBString + ';Initial Catalog=' + sDBName;
        sDBString := sDBString + ';Data Source=' + sDBIP;
        dmTables.ADODB.ConnectionString:= wString(sDBString);
        dmTables.ADODB.Connected:= True;
        CheckDataBaseColumn; //DB???? ???????? ???? ???? ????????
      except
        on E: Exception do
        begin
          ExceptLogging('DB Connect Error:' + aString(E.Message));
          ShowMessage('???????????? ?????? ??????????????. ??????????????.');
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
      ShowMessage('DB IP ???? ???????? ??????????????.'#13#10 +
                  'DB ?????? ?????? ?????????? ?????????? ?????? ?? ????????.');
      Exit;
    end;

    if (sDBID = '') then
    begin
      ShowMessage('DB ?????? ID?? ??????????????.'#13#10 +
                  'DB ?????? ?????? ?????????? ?????????? ?????? ?? ????????.');
      Exit;
    end;

    if (sDBPW = '') then
    begin
      ShowMessage('DB ?????? Password?? ??????????????.'#13#10 +
                  'DB ?????? ?????? ?????????? ?????????? ?????? ?? ????????.');
      Exit;
    end;

    if (sDBName = '') then
    begin
      ShowMessage('DB???? ??????????????.'#13#10 + 'DB ?????? ?????? ?????????? ?????????? ?????? ?? ????????.');
      Exit;
    end;

    with qryMainTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from ParkInfo Order By ParkNo');
      Open;

      if RecordCount > 0 then
      begin
        nCurrParkNo:= FieldByName('ParkNo').AsInteger;
       // tCount.Enabled:= True;

        if FieldByName('Reserve1').AsString = '????????' then
          lbOperation.Visible:= True;
      end
      else
        ExceptLogging('?????? ???????? ????!');
    end;

    nLoginResult := 0;
    NextModalDialog(TfrmLogin.Create(Self));

    if nLoginResult = 0 then
    begin
      ShowMessage('???????? ???????? ?????????? ??????????.');
      Close;
      Exit;
    end;

    case nManagerAuthority of
      0: begin
           N1.Enabled:= True;
           N2.Enabled:= True;
//           N3.Enabled:= True;
           N7.Enabled:= True;
//           N8.Enabled:= True;
           RF2.Enabled:= True;
           mnuParkInfo.Enabled:= True;
           mnuUnitInfo.Enabled:= True;
      end;

      1: begin
           N1.Enabled:= True;
           N2.Enabled:= True;
//           N3.Enabled:= True;
           N7.Enabled:= True;
//           N8.Enabled:= True;
           RF2.Enabled:= True;
           mnuParkInfo.Enabled:= False;
           mnuUnitInfo.Enabled:= False;
      end;

      2: begin
           N1.Enabled:= False;
           N2.Enabled:= True;
//           N3.Enabled:= True;
           N7.Enabled:= True;
//           N8.Enabled:= True;
           RF2.Enabled:= True;
      end;

      3: begin
           ShowMessage('???????? ?????????? ????????.');
           Close;
           Exit;
      end;
    end;
    idTS.Active:= True;


    if nApt = 1 then
    begin
      dgSCIn.Columns[4].Header := '??';
      dgSCIn.Columns[5].Header := '??';

      dgSCOut.Columns[4].Header := '??';
      dgSCOut.Columns[5].Header := '??';

      N3.Visible := True;
      d2.Visible := True;
      N21.Visible := True;
      c1.Visible := True;
    end;

    if (PDAUSE = 1) then
    begin
       N44.Visible := True;
    end;

    if (homenetuse = 1)   then
    begin
       N45.Visible := True;
    end;


    with qryMainTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from ParkInfo Order By ParkNo');
      Open;

      if RecordCount > 0 then
      begin
        nCurrParkNo:= FieldByName('ParkNo').AsInteger;
       // tCount.Enabled:= True;

        if FieldByName('Reserve1').AsString = '????????' then
          lbOperation.Visible:= True;
      end
      else
        ExceptLogging('?????? ???????? ????!');

      {Close;
      SQL.Clear;
      SQL.Add('Select * from UnitInfo Where UnitKind = :N1 and ParkNo = :N2 Order By ParkNo, UnitNo');
      Parameters.ParamByName('N1').Value:= 8;  //????LPR
      Parameters.ParamByName('N2').Value:= nCurrParkNo;
      Open;

      if RecordCount > 0 then
      begin
        i:= 1;

        while not Eof do
        begin
          with frmMain do
          begin
            TAdvToolButton(FindComponent('btnBar' + IntToStr(i))).Caption:= FieldByName('UnitName').AsString;
            TAdvToolButton(FindComponent('btnBar' + IntToStr(i))).Hint:=
              wString(MG_StrTrim(aString(FieldByName('IPNo').AsString), ' '));
            TAdvToolButton(FindComponent('btnBar' + IntToStr(i))).GroupIndex:= FieldByName('PortNo').AsInteger;
            TAdvToolButton(FindComponent('btnBar' + IntToStr(i))).Tag:= FieldByName('UnitNo').AsInteger;
            TAdvToolButton(FindComponent('btnBar' + IntToStr(i))).ImageIndex:= FieldByName('MyNo').AsInteger;
            TAdvToolButton(FindComponent('btnBar' + IntToStr(i))).Visible:= True;
            TAdvToolButton(FindComponent('btnCBar' + IntToStr(i))).Caption:= FieldByName('UnitName').AsString;
            TAdvToolButton(FindComponent('btnCBar' + IntToStr(i))).Hint:=
              wString(MG_StrTrim(aString(FieldByName('IPNo').AsString), ' '));
            TAdvToolButton(FindComponent('btnCBar' + IntToStr(i))).GroupIndex:= FieldByName('PortNo').AsInteger;
            TAdvToolButton(FindComponent('btnCBar' + IntToStr(i))).Tag:= FieldByName('UnitNo').AsInteger;
            TAdvToolButton(FindComponent('btnCBar' + IntToStr(i))).ImageIndex:= FieldByName('MyNo').AsInteger;
            TAdvToolButton(FindComponent('btnCBar' + IntToStr(i))).Visible:= True;
          end;
          i:= i+1;
          Next;
        end;
        btnBar.Enabled:= True;
        btnCBar.Enabled:= True;
      end;}

      {Close;
      SQL.Clear;
      SQL.Add('Select * from UnitInfo Where UnitKind = :N1 and ParkNo = :N2 Order By ParkNo, UnitNo');
      Parameters.ParamByName('N1').Value:= 9;  //????LPR
      Parameters.ParamByName('N2').Value:= nCurrParkNo;
      Open;

      if RecordCount > 0 then
      begin
        while not Eof do
        begin
          with frmMain do
          begin
            if TAdvToolButton(FindComponent('btnBar' + IntToStr(i))) <> nil then begin
              TAdvToolButton(FindComponent('btnBar' + IntToStr(i))).Caption:= FieldByName('UnitName').AsString;
              TAdvToolButton(FindComponent('btnBar' + IntToStr(i))).Hint:=
                wString(MG_StrTrim(aString(FieldByName('IPNo').AsString), ' '));
              TAdvToolButton(FindComponent('btnBar' + IntToStr(i))).GroupIndex:= FieldByName('PortNo').AsInteger;
              TAdvToolButton(FindComponent('btnBar' + IntToStr(i))).Tag:= FieldByName('UnitNo').AsInteger;
              TAdvToolButton(FindComponent('btnBar' + IntToStr(i))).ImageIndex:= FieldByName('MyNo').AsInteger;
              TAdvToolButton(FindComponent('btnBar' + IntToStr(i))).Visible:= True;
            end;
            if TAdvToolButton(FindComponent('btnCBar' + IntToStr(i))) <> nil then begin
              TAdvToolButton(FindComponent('btnCBar' + IntToStr(i))).Caption:= FieldByName('UnitName').AsString;
              TAdvToolButton(FindComponent('btnCBar' + IntToStr(i))).Hint:=
                wString(MG_StrTrim(aString(FieldByName('IPNo').AsString), ' '));
              TAdvToolButton(FindComponent('btnCBar' + IntToStr(i))).GroupIndex:= FieldByName('PortNo').AsInteger;
              TAdvToolButton(FindComponent('btnCBar' + IntToStr(i))).Tag:= FieldByName('UnitNo').AsInteger;
              TAdvToolButton(FindComponent('btnCBar' + IntToStr(i))).ImageIndex:= FieldByName('MyNo').AsInteger;
              TAdvToolButton(FindComponent('btnCBar' + IntToStr(i))).Visible:= True;
            end;
          end;
          i:= i+1;
          Next;
        end;
        btnBar.Enabled:= True;
        btnCBar.Enabled:= True;
      end;}

      //???????? ???????????? ?????? ??????
      if (Length(sHomeInfo_IP) > 0) and (nHomeInfo_Port > 0) then
      begin
        EasyOnHome.HomeInfo_Proc_EasyOnConn(sHomeInfo_IP, nHomeInfo_Port);
      end;

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

      if nHomenet_visit = 0 then //????????????
      begin
        N46.Visible := False;
      end;

      if nvisituse = 0 then   //???????? ???? ????(????????????- ????)
      begin
        N47.Visible := False;
      end;

      if nWP = 1 then  //???????? ???? ?????? ????
      begin
          mnuWP.Visible := True;
          N48.Visible := True;
      end;

      Caption := Caption + ' ' + GetFileVersion('./Nexpa_Host.exe');
    end;
  except
    on E: Exception do ExceptLogging('TfrmMain.FormShow: ' + aString(E.Message));
  end;
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
  if nYogumMode = 0 then
  begin
    NextModalDialog(TfrmParkInfo.Create(Self));
  end
  else if nYogumMode = 1 then
  begin
    NextModalDialog(TfrmParkInfo_yo.Create(Self));
  end;


end;

procedure TfrmMain.mnuq1Click(Sender: TObject);
begin
  NextModalDialog(TfrmBlackSearch.Create(Self));
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

procedure TfrmMain.N21Click(Sender: TObject);
begin
  NextModalDialog(TfrmCarPossession.Create(Self));
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
    ShowMessage('?????? ??????????. ???? ??????????????!')
  else
  begin
    if nManagerAuthority <= 2 then
      NextModalDialog(TfrmNewSC.Create(Self))
    else
      ShowMessage('?????? ??????????. ?????????????? ??????????????!');
  end;
end;

procedure TfrmMain.N29Click(Sender: TObject);
begin
  if bMenuLock then
    ShowMessage('?????? ??????????. ???? ??????????????!')
  else
  begin
    if nManagerAuthority <= 2 then
      NextModalDialog(TfrmAddSC.Create(Self))
    else
      ShowMessage('?????? ??????????. ?????????????? ??????????????!');
  end;
end;

procedure TfrmMain.N32Click(Sender: TObject);
begin
  NextModalDialog(TfrmFreetime.Create(Self));
end;

procedure TfrmMain.N36Click(Sender: TObject);
begin
  //?????? ????
  NextModalDialog(TfrmRecog.Create(Self));
end;

procedure TfrmMain.N37Click(Sender: TObject);
begin
//  if bMenuLock then
//    ShowMessage('?????? ??????????. ???? ??????????????!')
//  else
//  begin
//    if nManagerAuthority <= 2 then
//      NextModalDialog(TfrmNewBSC.Create(Self))
//    else
//      ShowMessage('?????? ??????????. ?????????????? ??????????????!');
//  end;
      NextModalDialog(TfrmNewBSC.Create(Self))
end;

procedure TfrmMain.N38Click(Sender: TObject);
begin
   NextModalDialog(TfrmCustInfo_D.Create(Self));
end;

procedure TfrmMain.N39Click(Sender: TObject);
begin
    //?????? ????(????, ????) ????
    NextModalDialog(TDay_ION_IOS_Data.Create(Self));
end;

procedure TfrmMain.N3Click(Sender: TObject);
begin
  NextModalDialog(TfrmIOVisitStat.Create(Self));
end;

procedure TfrmMain.N40Click(Sender: TObject);
begin
   //?????? ????(????, ????) ????
    NextModalDialog(TTerm_IOS_ION_Data.Create(Self));
end;

procedure TfrmMain.N41Click(Sender: TObject);
begin
   //???? ????(????, ????) ????
   NextModalDialog(TMonth_IOS_ION_Data.Create(Self));
end;

procedure TfrmMain.N42Click(Sender: TObject);
begin
 //???? ????(????, ????)????
  NextModalDialog(TDay2_IOS_ION_Data.Create(Self));
end;

procedure TfrmMain.N43Click(Sender: TObject);
begin
   //?????? ????(????, ????)????
   NextModalDialog(TCondition_IOS_ION_Data.Create(Self));
end;

procedure TfrmMain.N44Click(Sender: TObject);
begin
  NextModalDialog(TfrmPDASearch.Create(Self));
end;

procedure TfrmMain.N45Click(Sender: TObject);
begin
  NextModalDialog(TfrmHomenet_Point.Create(Self));
end;

procedure TfrmMain.N46Click(Sender: TObject);
begin
   NextModalDialog(TfrmVisit_Info.Create(Self));
end;

procedure TfrmMain.N47Click(Sender: TObject);
begin
   NextModalDialog(TfrmVisitinfo_insert.Create(Self));
end;

procedure TfrmMain.N48Click(Sender: TObject);
begin
   NextModalDialog(TFrmCustInfo_WP.Create(Self));
end;

procedure TfrmMain.N4Click(Sender: TObject);
begin
  NextModalDialog(TfrmNomalCar_Management.Create(Self));
end;

procedure TfrmMain.N5Click(Sender: TObject);
begin
   NextModalDialog(TFrmVisitAmount.Create(Self));
end;

procedure TfrmMain.N7Click(Sender: TObject);
begin
  //????????...
  NextModalDialog(TfrmCoupon.Create(Self));
end;

procedure TfrmMain.Panel10Click(Sender: TObject);
var
  nNCnt, nNAmt: Integer;
begin
    with qryTKProc do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from TKProc where ProcDate = :N1 Order By ProcTime Desc');
      Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', Now);
      Open;

      if RecordCount > 0 then
        dgTKProc.ScrollBars:= ssBoth
      else
        dgTKProc.ScrollBars:= ssNone;
    end;

    with qryMainTemp do
    begin
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
    end;
    pnTKProc.Caption:= IntToStr(nNCnt) + '??  ' + IntToStr(nNAmt) + '??';
end;

procedure TfrmMain.Panel11Click(Sender: TObject);
var
  nSIn: Integer;
begin
    with qrySCIn do
    begin
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
    end;
    pnSIn.Caption:= '?? ' + IntToStr(nSIn) + '?? ????';
end;

procedure TfrmMain.Panel12Click(Sender: TObject);
var
  nSOut: Integer;
begin
    with qrySCOut do
    begin
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
    end;
    pnSOut.Caption:= '?? ' + IntToStr(nSOut) + '?? ????';
end;

procedure TfrmMain.Panel9Click(Sender: TObject);
var
  nNIn, nNOut: Integer;
begin
    with qryIONData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from IONData where ProcDate = :N1 Order By ProcTime Desc');
      Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', Now);
      Open;

      if RecordCount > 0 then
        dgIONData.ScrollBars:= ssBoth
      else
        dgIONData.ScrollBars:= ssNone;
    end;

    with qryMainTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select Count(*) nIn from IONData where ProcDate = :N1 and Status = :N2');
      Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', Now);
      Parameters.ParamByName('N2').Value:= 1;
      Open;

      nNIn:= FieldByName('nIn').AsInteger;

      Close;
      SQL.Clear;
      SQL.Add('Select Count(*) nOut from IONData where OutDate = :N1 and Status = :N2 and OutChk > :N3');
      Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', Now);
      Parameters.ParamByName('N2').Value:= 1;
      Parameters.ParamByName('N3').Value:= 0;
      Open;

      nNOut:= FieldByName('nOut').AsInteger;
    end;
    pnIONData.Caption:= '???? : ' + IntToStr(nNIn) + '??,  ???? : ' + IntToStr(nNOut) + '??';
end;

procedure TfrmMain.q2Click(Sender: TObject);
begin
  NextModalDialog(TfrmIOBData.Create(Self));
end;

procedure TfrmMain.qryIONDataOutChkGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Case qryIONDataOutChk.Value of
    0: Text:= '??????';
    1: Text:= '????????';
    2: Text:= '????????';
    3: Text:= '????????';
    4: Text:= '????????';
    5: Text:= '????????????';
    6: Text:= '????????';
    7: Text:= '??????????';
  end;
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

procedure TfrmMain.btnCBar10Click(Sender: TObject);
var
  sReason: aString;
begin
  sReason:= InputBox('????????????', '???????????????????? ??????????????!', '');
  UnitCtrl(2, btnBar10.ImageIndex, btnBar10.Tag, nCurrMNo, sReason);
end;

procedure TfrmMain.btnCBar1Click(Sender: TObject);
var
  sReason: aString;
begin
  sReason:= InputBox('????????????', '???????????????????? ??????????????!', '');
  UnitCtrl(2, btnBar1.ImageIndex, btnBar1.Tag, nCurrMNo, sReason);
end;

procedure TfrmMain.btnCBar2Click(Sender: TObject);
var
  sReason: aString;
begin
  sReason:= InputBox('????????????', '???????????????????? ??????????????!', '');
  UnitCtrl(2, btnBar2.ImageIndex, btnBar2.Tag, nCurrMNo, sReason);
end;

procedure TfrmMain.btnCBar3Click(Sender: TObject);
var
  sReason: aString;
begin
  sReason:= InputBox('????????????', '???????????????????? ??????????????!', '');
  UnitCtrl(2, btnBar3.ImageIndex, btnBar3.Tag, nCurrMNo, sReason);
end;

procedure TfrmMain.btnCBar4Click(Sender: TObject);
var
  sReason: aString;
begin
  sReason:= InputBox('????????????', '???????????????????? ??????????????!', '');
  UnitCtrl(2, btnBar4.ImageIndex, btnBar4.Tag, nCurrMNo, sReason);
end;

procedure TfrmMain.btnCBar5Click(Sender: TObject);
var
  sReason: aString;
begin
  sReason:= InputBox('????????????', '???????????????????? ??????????????!', '');
  UnitCtrl(2, btnBar5.ImageIndex, btnBar5.Tag, nCurrMNo, sReason);
end;

procedure TfrmMain.btnCBar6Click(Sender: TObject);
var
  sReason: aString;
begin
  sReason:= InputBox('????????????', '???????????????????? ??????????????!', '');
  UnitCtrl(2, btnBar6.ImageIndex, btnBar6.Tag, nCurrMNo, sReason);
end;

procedure TfrmMain.btnCBar7Click(Sender: TObject);
var
  sReason: aString;
begin
  sReason:= InputBox('????????????', '???????????????????? ??????????????!', '');
  UnitCtrl(2, btnBar7.ImageIndex, btnBar7.Tag, nCurrMNo, sReason);
end;

procedure TfrmMain.btnCBar8Click(Sender: TObject);
var
  sReason: aString;
begin
  sReason:= InputBox('????????????', '???????????????????? ??????????????!', '');
  UnitCtrl(2, btnBar8.ImageIndex, btnBar8.Tag, nCurrMNo, sReason);
end;

procedure TfrmMain.btnCBar9Click(Sender: TObject);
var
  sReason: aString;
begin
  sReason:= InputBox('????????????', '???????????????????? ??????????????!', '');
  UnitCtrl(2, btnBar9.ImageIndex, btnBar9.Tag, nCurrMNo, sReason);
end;

procedure TfrmMain.btnCBarClick(Sender: TObject);
begin
  pnCBar.Visible:= True;
end;

procedure TfrmMain.btnNewSCClick(Sender: TObject);
begin
  if bMenuLock then
    ShowMessage('?????? ??????????. ???? ??????????????!')
  else
  begin
    if nManagerAuthority <= 2 then
      NextModalDialog(TfrmNewSC.Create(Self))
    else
      ShowMessage('?????? ??????????. ?????????????? ??????????????!');
  end;
end;

procedure TfrmMain.c1Click(Sender: TObject);
begin
  NextModalDialog(TfrmInOutCarList.Create(Self));
end;

procedure TfrmMain.d1Click(Sender: TObject);
begin
// if bMenuLock then
//   ShowMessage('?????? ??????????. ???? ??????????????!')
// else
// begin
//   if nManagerAuthority <= 2 then
//     NextModalDialog(TfrmBlackListInfo.Create(Self))
//   else
//     ShowMessage('?????? ??????????. ?????????????? ??????????????!');
// end;
     NextModalDialog(TfrmBlackListInfo.Create(Self))
end;

procedure TfrmMain.btnAddSCClick(Sender: TObject);
begin
  if bMenuLock then
    ShowMessage('?????? ??????????. ???? ??????????????!')
  else
  begin
    if nManagerAuthority <= 2 then
      NextModalDialog(TfrmAddSC.Create(Self))
    else
      ShowMessage('?????? ??????????. ?????????????? ??????????????!');
  end;
end;

procedure TfrmMain.tCountTimer(Sender: TObject);
begin
  try
    with qryRecogChk do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select Count(*) nRecogCnt from IONData where ProcDate = :N1 and ');
      SQL.Add('((InRecog1 > 1) or (InRecog2 > 1))');
      Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', Now);
      Open;

      if FieldByName('nRecogCnt').AsInteger > 0 then
      begin
        if not tRecog.Enabled then
          tRecog.Enabled:= True;
      end
      else
      begin
        sp1.Visible:= False;
        tRecog.Enabled:= False;
      end;
      Close;
    end;
  except
    on E: Exception do ExceptLogging('TfrmMain.tCountTimer: ' + aString(E.Message));
  end;
end;

procedure TfrmMain.tmrIONAutoTimer(Sender: TObject);
begin
  Panel11.Click;
  Panel12.Click;
end;

procedure TfrmMain.tRecogTimer(Sender: TObject);
begin
  //sp1.Visible:= True;

  if tRecog.Tag = 0 then
  begin
    sp1.Brush.Color:= clBlue;
    sp1.Pen.Color:= clRed;
    tRecog.Tag:= 1;
  end
  else
  begin
    sp1.Brush.Color:= clRed;
    sp1.Pen.Color:= clBlue;
    tRecog.Tag:= 0;
  end;
end;
initialization
  AssertErrorProc := OnAssertError;

end.
