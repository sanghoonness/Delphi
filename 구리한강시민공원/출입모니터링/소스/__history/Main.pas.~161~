unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, IdGlobal,
  Dialogs, StdCtrls, ExtCtrls, Menus, IdContext, ScktComp, IdServerIOHandler, IdServerIOHandlerSocket, IdServerIOHandlerStack,
  IdCustomTCPServer, IdTCPServer, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdTCPConnection, IdTCPClient, IdComponent, IdRawBase,
  IdRawClient, IdIcmpClient, IdBaseComponent, IdAntiFreezeBase, IdAntiFreeze, Grids, BaseGrid, AdvGrid, IniFiles, DB, ADODB, AdvToolBtn,
  Buttons, DBAdvGrid, sButton, Winsock, IdStack, IdException, jpeg, acPNG,
  AdvObj, AdvCombo,AdPort, OoMisc, IdURI, IdHTTP;

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
    nSCLprCnt: Byte;
    sSCDspIP: AnsiString;
    csSCLPR: TClientSocket;
    bBarOpen: Boolean;
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
    nNCLprCnt: Byte;
    sNCDspIP: AnsiString;
    csNCLPR: TClientSocket;
    bBarOpen: Boolean;
  end;

  TfrmMain = class(TForm)
    MainMenu1: TMainMenu;
    mnuSetup: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    mnuInDsp: TMenuItem;
    mnuOutDsp: TMenuItem;
    mnuClose: TMenuItem;
    IdAntiFreeze1: TIdAntiFreeze;
    ICMP: TIdIcmpClient;
    idTC: TIdTCPClient;
    idStack2: TIdIOHandlerStack;
    idTS: TIdTCPServer;
    IdStack1: TIdServerIOHandlerStack;
    csInLpr1: TClientSocket;
    csOutLpr1: TClientSocket;
    csInDsp1: TClientSocket;
    csOutDsp1: TClientSocket;
    qryMainTemp: TADOQuery;
    qry1: TADOQuery;
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
    tInDsp: TTimer;
    tOutDsp: TTimer;
    tInAlive1: TTimer;
    tOutAlive1: TTimer;
    tSCWait: TTimer;
    csInLpr2: TClientSocket;
    csInLpr3: TClientSocket;
    csInLpr4: TClientSocket;
    csInLpr5: TClientSocket;
    csOutLpr2: TClientSocket;
    csOutLpr3: TClientSocket;
    csInDsp2: TClientSocket;
    csInDsp3: TClientSocket;
    csInDsp4: TClientSocket;
    csInDsp5: TClientSocket;
    csOutDsp2: TClientSocket;
    csOutDsp3: TClientSocket;
    pnManualProc: TPanel;
    Label10: TLabel;
    Panel8: TPanel;
    Panel9: TPanel;
    imgManual: TImage;
    edtManualProcCarNo: TEdit;
    pnSManualProc: TPanel;
    dgManual: TDBAdvGrid;
    btnManualSeek: TBitBtn;
    btnManualSCOut: TBitBtn;
    btnClose: TBitBtn;
    pnSCSearch: TPanel;
    Label7: TLabel;
    DBAdvGrid1: TDBAdvGrid;
    btnSCOut: TsButton;
    btnSCCancel: TsButton;
    btnSC: TBitBtn;
    edtSCCarNo: TEdit;
    btnSCIn: TsButton;
    btnManualSCIn: TBitBtn;
    tNCInWait: TTimer;
    tNCOutWait: TTimer;
    qryCtrl: TADOQuery;
    csEZVille: TClientSocket;
    tEZVille: TTimer;
    tInAlive2: TTimer;
    tInAlive3: TTimer;
    tInAlive4: TTimer;
    tInAlive5: TTimer;
    tOutAlive2: TTimer;
    tOutAlive3: TTimer;
    PopupMenu1: TPopupMenu;
    mnu1_1: TMenuItem;
    mnu1_2: TMenuItem;
    pnOut1: TPanel;
    pnIn1: TPanel;
    imgIn1: TImage;
    btnIn1: TButton;
    Panel1: TPanel;
    edtInG1: TLabeledEdit;
    edtInDong1: TLabeledEdit;
    edtInCarNo1: TLabeledEdit;
    Image1: TImage;
    pnHomeInfo: TPanel;
    edtDong: TLabeledEdit;
    edtHo: TLabeledEdit;
    edtCar: TLabeledEdit;
    btnHomeInfoTest: TButton;
    Button1: TButton;
    cmbIO: TAdvComboBox;
    mnuHomeInfo: TMenuItem;
    ComPrn: TApdComPort;
    tStart: TTimer;
    idhtpJCom: TIdHTTP;
    tDbCheck: TTimer;
    procedure mnuCloseClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure mnuInDspClick(Sender: TObject);
    procedure mnuOutDspClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tInDspTimer(Sender: TObject);
    procedure tOutDspTimer(Sender: TObject);
    procedure tInAlive1Timer(Sender: TObject);
    procedure tOutAlive1Timer(Sender: TObject);
    procedure csInLpr1Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure tSCWaitTimer(Sender: TObject);
    procedure csOutLpr1Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure btnManualSeekClick(Sender: TObject);
    procedure edtManualProcCarNoKeyPress(Sender: TObject; var Key: Char);
    procedure dgManualClick(Sender: TObject);
    procedure btnManualSCOutClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure edtSCCarNoKeyPress(Sender: TObject; var Key: Char);
    procedure btnSCClick(Sender: TObject);
    procedure DBAdvGrid1Click(Sender: TObject);
    procedure btnSCCancelClick(Sender: TObject);
    procedure btnSCOutClick(Sender: TObject);
    procedure btnBarCloseClick(Sender: TObject);
    procedure btnSCInClick(Sender: TObject);
    procedure btnManualSCInClick(Sender: TObject);
    procedure tNCInWaitTimer(Sender: TObject);
    procedure tNCOutWaitTimer(Sender: TObject);
    procedure btnBar1Click(Sender: TObject);
    procedure btnBar2Click(Sender: TObject);
    procedure btnBar3Click(Sender: TObject);
    procedure btnBar4Click(Sender: TObject);
    procedure csEZVilleConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure csEZVilleDisconnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure csEZVilleRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure tEZVilleTimer(Sender: TObject);
    procedure tInAlive2Timer(Sender: TObject);
    procedure tInAlive3Timer(Sender: TObject);
    procedure tOutAlive2Timer(Sender: TObject);
    procedure csInLpr2Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure csInLpr3Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure csOutLpr2Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure idTSExecute(AContext: TIdContext);
    procedure mnu1_2Click(Sender: TObject);
    procedure mnu1_1Click(Sender: TObject);
    procedure edtInCarNo1KeyPress(Sender: TObject; var Key: Char);
    procedure mnuHomeInfoClick(Sender: TObject);
    procedure btnHomeInfoTestClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure csInDsp1Connect(Sender: TObject; Socket: TCustomWinSocket);
    procedure csInDsp1Disconnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure csInDsp1Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure csInDsp2Connect(Sender: TObject; Socket: TCustomWinSocket);
    procedure csInDsp2Disconnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure csInDsp2Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure csInDsp3Connect(Sender: TObject; Socket: TCustomWinSocket);
    procedure csInDsp3Disconnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure csInDsp3Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure csInDsp4Connect(Sender: TObject; Socket: TCustomWinSocket);
    procedure csInDsp4Disconnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure csInDsp4Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure csInDsp5Connect(Sender: TObject; Socket: TCustomWinSocket);
    procedure csInDsp5Disconnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure csInDsp5Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure csOutDsp1Connect(Sender: TObject; Socket: TCustomWinSocket);
    procedure csOutDsp1Disconnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure csOutDsp1Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure csOutDsp2Connect(Sender: TObject; Socket: TCustomWinSocket);
    procedure csOutDsp2Disconnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure csOutDsp2Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure csOutDsp3Connect(Sender: TObject; Socket: TCustomWinSocket);
    procedure csOutDsp3Disconnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure csOutDsp3Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure csDspError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure ComPrnTriggerAvail(CP: TObject; Count: Word);
    procedure csInLpr1Error(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure tStartTimer(Sender: TObject);
    procedure tDbCheckTimer(Sender: TObject);
  private
    { Private declarations }
    procedure ICMPReply(ASender: TComponent; const ReplyStatus: TReplyStatus);
    function is_ping(IP: AnsiString): Boolean;
    procedure UnitCtrl(nCmd, nFCNo, nUnitNo, nMNo: Word; sData: AnsiString);
    procedure prDelay(Time: Integer);
  public
    { Public declarations }
    procedure InOpen(csLPR: TClientSocket);
    Procedure OutOpen(csLPR: TClientSocket);
    procedure DspProc(nIO, nType: Byte; sData, sDspIP: AnsiString);
    procedure GridData(nIO, nListCnt: Byte; sResult: String);
    procedure NormalOut(sLprFile1, sLprCarNo1, sLprFile2, sLprCarNo2,
                        sIOTime: AnsiString; nLprNo, nLprInOut, nLprRecog1, nLprRecog2: Byte;
                        sDspIP: AnsiString; csLPR: TClientSocket; nListCnt: Byte);
    procedure NormalProc(sLprFile1, sLprCarNo1, sLprFile2, sLprCarNo2,
                         sIOTime: AnsiString; nLprNo, nLprInOut, nLprRecog1, nLprRecog2: Byte;
                         sDspIP: AnsiString; csLPR: TClientSocket; bOpen: Boolean; nListCnt: Byte);
    procedure HomeInfo_Proc(nInOut: Byte);
    function RecvLprProc(sLprFile1, sLprCarNo1, sLprFile2, sLprCarNo2,
                         sIOTime: AnsiString; nLprNo, nLprInOut, nLprRecog1, nLprRecog2: Byte;
                         sDspIP: AnsiString; csLPR: TClientSocket; bOpen: Boolean; nListCnt: Byte): String;
    procedure FormAlign;
    procedure GridClear;
    procedure WaitClear;
    procedure InitProc;
    function IntToBool(nNo: Integer): Boolean;
    function JCOMInTime(_sInCarNo, _sTKNo, _sInDate, _sInTime: AnsiString; _nCartype : Integer): string;     //제이컴에 입차데이터 전달
  end;

var
  frmMain: TfrmMain;

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

function IcmpCreateFile : THandle; stdcall; external 'icmp.dll';
function IcmpCloseHandle (icmpHandle : THandle) : boolean; stdcall; external 'icmp.dll';
function IcmpSendEcho (IcmpHandle    : THandle;  DestinationAddress: LongInt;
                       RequestData   : Pointer;  RequestSize       : Smallint;
                       RequestOptions: pointer;  ReplyBuffer       : Pointer;
                       ReplySize     : DWORD;    Timeout           : DWORD): DWORD;
                       stdcall; external 'icmp.dll';

implementation
uses
  Global, Tables, Login, InDspSet, DspSet, Setup, UnitInfo;

{$R *.dfm}

// nCmd: 1-BarOpen
procedure TfrmMain.UnitCtrl(nCmd, nFCNo, nUnitNo, nMNo: Word;
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
              with frmMain do
              begin
                if TClientSocket(FindComponent('csInLpr' + IntToStr(i))).Tag = nUnitNo then
                begin
                  if is_ping(TClientSocket(FindComponent('csInLpr' + IntToStr(i))).Host) and
                    TClientSocket(FindComponent('csInLpr' + IntToStr(i))).Active then
                  begin
                    sSend := 'BAR_OPEN-1';

                    if TClientSocket(FindComponent('csInLpr' + IntToStr(i))).Socket.Connected then
                    begin
                       TClientSocket(FindComponent('csInLpr' + IntToStr(i))).Socket.SendText(sSend);
                       bSend := True;
                    end
                    else
                      ExceptLogging(TClientSocket(FindComponent('csInLpr' + IntToStr(i))).Host +
                                    ': 차단기 원격제어시 네트워크 끊김!');
                    Break;
                  end
                  else
                    ExceptLogging(TClientSocket(FindComponent('csInLpr' + IntToStr(i))).Host +
                                  ': 차단기 원격제어시 네트워크 오류!');
                end;
              end;
            end;

            if not bSend then
              for i := 1 to 3 do
              begin
                with frmMain do
                begin
                  if TClientSocket(FindComponent('csOutLpr' + IntToStr(i))).Tag = nUnitNo then
                  begin
                    if is_ping(TClientSocket(FindComponent('csOutLpr' + IntToStr(i))).Host) and
                       TClientSocket(FindComponent('csOutLpr' + IntToStr(i))).Active then
                    begin
                      sSend := 'BAR_OPEN-1';

                      if TClientSocket(FindComponent('csOutLpr' + IntToStr(i))).Socket.Connected then
                      begin
                        TClientSocket(FindComponent('csOutLpr' + IntToStr(i))).Socket.SendText(sSend);
                        bSend := True;
                      end
                      else
                        ExceptLogging(TClientSocket(FindComponent('csOutLpr' + IntToStr(i))).Host +
                                      ': 차단기 원격제어시 네트워크 끊김!');

                      Break;
                    end
                    else
                      ExceptLogging(TClientSocket(FindComponent('csOutLpr' + IntToStr(i))).Host +
                                    ': 차단기 원격제어시 네트워크 오류!');
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
      ExceptLogging('TfrmMain.UnitCtrl: ' + aString(E.Message));
  end;
end;

procedure TfrmMain.InOpen(csLPR: TClientSocket);
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

procedure TfrmMain.OutOpen(csLPR: TClientSocket);
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

procedure TfrmMain.GridData(nIO, nListCnt: Byte; sResult: String);
var
  sCarNo, sName, sCompName, sDeptName, sExpDate, sStatus, sTemp, sIODate, sIOTime: String;
  nPos: Byte;
begin
  if Length(sResult) > 6 then
  begin
    nIO := StrToInt(Copy(sResult, 1, 1));
    sIODate := Copy(sResult, 2, Pos('^', sResult) - 2);
    sTemp := Copy(sResult, Pos('^', sResult) + 1, Length(sResult) - (Pos('^', sResult)));
    sIOTime := Copy(sTemp, 1, Pos('^', sTemp) - 1);
    sTemp := Copy(sTemp, Pos('^', sTemp) + 1, Length(sTemp) - (Pos('^', sTemp)));
    sCarNo := Copy(sTemp, 1, Pos('^', sTemp) - 1);
    sTemp := Copy(sTemp, Pos('^', sTemp) + 1, Length(sTemp) - (Pos('^', sTemp)));
    sName := Copy(sTemp, 1, Pos('^', sTemp) - 1);
    sTemp := Copy(sTemp, Pos('^', sTemp) + 1, Length(sTemp) - (Pos('^', sTemp)));
    sCompName := Copy(sTemp, 1, Pos('^', sTemp) - 1);
    sTemp := Copy(sTemp, Pos('^', sTemp) + 1, Length(sTemp) - (Pos('^', sTemp)));
    sDeptName:= Copy(sTemp, 1, Pos('^', sTemp) - 1);
    sTemp := Copy(sTemp, nPos + 1, (Length(sTemp) - (nPos)) + 2);
    sExpDate := Copy(sTemp, 1, Pos('^', sTemp) - 1);
    nPos := Pos('^', sTemp);
    sStatus := Copy(sTemp, nPos + 1, Length(sTemp) - nPos);

    if nIO = 1 then
    begin
      with frmMain do
      begin
        TLabeledEdit(FindComponent('edtInG' + IntToStr(nListCnt))).Color:= clBtnFace; //clWhite;
        TLabeledEdit(FindComponent('edtInG' + IntToStr(nListCnt))).Font.Color:= clBlack;
        TLabeledEdit(FindComponent('edtInG' + IntToStr(nListCnt))).Text:= '정기';
        TLabeledEdit(FindComponent('edtInDong' + IntToStr(nListCnt))).Color:= clBtnFace; //clWhite;
        TLabeledEdit(FindComponent('edtInDong' + IntToStr(nListCnt))).Font.Color:= clBlack;
        TLabeledEdit(FindComponent('edtInDong' + IntToStr(nListCnt))).Text:= sName;
        //TLabeledEdit(FindComponent('edtInDong' + IntToStr(nListCnt))).Text:= sCompName;
        TLabeledEdit(FindComponent('edtInCarNo' + IntToStr(nListCnt))).Color:= clBtnFace; //clWhite;
        TLabeledEdit(FindComponent('edtInCarNo' + IntToStr(nListCnt))).Font.Color:= clBlack;
        TLabeledEdit(FindComponent('edtInCarNo' + IntToStr(nListCnt))).Text:= sCarNo;
      end;
    end
    else
    begin
      with frmMain do
      begin
        TLabeledEdit(FindComponent('edtOutG' + IntToStr(nListCnt))).Color:= clBtnFace; //clWhite;
        TLabeledEdit(FindComponent('edtOutG' + IntToStr(nListCnt))).Font.Color:= clBlack;
        TLabeledEdit(FindComponent('edtOutG' + IntToStr(nListCnt))).Text:= '정기';
        TLabeledEdit(FindComponent('edtOutDong' + IntToStr(nListCnt))).Color:= clBtnFace; //clWhite;
        TLabeledEdit(FindComponent('edtOutDong' + IntToStr(nListCnt))).Font.Color:= clBlack;
        TLabeledEdit(FindComponent('edtOutDong' + IntToStr(nListCnt))).Text:= sName;
        //TLabeledEdit(FindComponent('edtOutDong' + IntToStr(nListCnt))).Text:= sCompName;
        TLabeledEdit(FindComponent('edtOutHo' + IntToStr(nListCnt))).Color:= clBtnFace; //clWhite;
        TLabeledEdit(FindComponent('edtOutHo' + IntToStr(nListCnt))).Font.Color:= clBlack;
        TLabeledEdit(FindComponent('edtOutHo' + IntToStr(nListCnt))).Text:= sDeptName;
        TLabeledEdit(FindComponent('edtOutCarNo' + IntToStr(nListCnt))).Color:= clBtnFace; //clWhite;
        TLabeledEdit(FindComponent('edtOutCarNo' + IntToStr(nListCnt))).Font.Color:= clBlack;
        TLabeledEdit(FindComponent('edtOutCarNo' + IntToStr(nListCnt))).Text:= sCarNo;
      end;
    end;
  end;
end;

// nIO: 1-입구, 2-출구    nType: 1-정기차량, 2-일반차량, 3-요금표시, 4-주차요금0원
procedure TfrmMain.csOutDsp1Connect(Sender: TObject; Socket: TCustomWinSocket);
begin
  ExceptLogging('OutDsp1_connect');
  if sOutDspBasic1 <> '' then
  begin
    ExceptLogging('OutDsp1_전광판문구전송');
    csOutDsp1.Socket.SendText(sOutDspBasic1);
    prDelay(nDspInterval);
  end;
end;

procedure TfrmMain.csOutDsp1Disconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  ExceptLogging('OutDsp1_Disconnect');
end;

procedure TfrmMain.csOutDsp1Read(Sender: TObject; Socket: TCustomWinSocket);
var
  sRecv: aString;
begin
  sRecv := Socket.ReceiveText;
  ExceptLogging('[Out]>DSP1 Recv: ' + sRecv);
  prDelay(nDspInterval);
  csOutDsp1 .Active:= False;
  sOutDspBasic1 := '';
end;

procedure TfrmMain.csOutDsp2Connect(Sender: TObject; Socket: TCustomWinSocket);
begin
  ExceptLogging('OutDsp2_connect');
  if sOutDspBasic2 <> '' then
  begin
    ExceptLogging('OutDsp2_전광판문구전송');
    prDelay(nDspInterval);
    csOutDsp2.Socket.SendText(sOutDspBasic2);
    prDelay(nDspInterval);
  end;
end;

procedure TfrmMain.csOutDsp2Disconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  ExceptLogging('OutDsp2_Disconnect');
end;

procedure TfrmMain.csOutDsp2Read(Sender: TObject; Socket: TCustomWinSocket);
var
  sRecv: aString;
begin
  sRecv := Socket.ReceiveText;
  ExceptLogging('[Out]>DSP2 Recv: ' + sRecv);
  prDelay(nDspInterval);
  csOutDsp2.Active:= False;
  sOutDspBasic2 := '';
end;


procedure TfrmMain.csOutDsp3Connect(Sender: TObject; Socket: TCustomWinSocket);
begin
  ExceptLogging('OutDsp3_connect');
  if sOutDspBasic3 <> '' then
  begin
    ExceptLogging('OutDsp3_전광판문구전송');
    prDelay(nDspInterval);
    csOutDsp3.Socket.SendText(sOutDspBasic3);
    prDelay(nDspInterval);
  end;
end;

procedure TfrmMain.csOutDsp3Disconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  ExceptLogging('OutDsp3_Disconnect');
end;

procedure TfrmMain.csOutDsp3Read(Sender: TObject; Socket: TCustomWinSocket);
var
  sRecv: aString;
begin
  sRecv := Socket.ReceiveText;
  ExceptLogging('[Out]>DSP3 Recv: ' + sRecv);
  prDelay(nDspInterval);
  csOutDsp3.Active:= False;
  sOutDspBasic3 := '';
end;

procedure TfrmMain.csOutLpr1Read(Sender: TObject; Socket: TCustomWinSocket);
var
  nNo: Word;
  sLprData, sLprIP, sDspIP: aString;
  csLPR: TClientSocket;
  sRecv, sExpDateF, sExpDateT, sCarNo1, sCarNo2, sShortCarNo: aString;
  i: Byte;
  sTime, sTemp, sResult, sTest, sDir, sLocal1, sLocal2: String;
  sFile1, sFile2, sImgFile1, sImgFile2: String;
  nRecog1, nRecog2, nIO, nListCnt, nCarNoLength: Byte;
  hr: HRESULT;
  sSend: aString;
begin
  {
  try
    tOutAlive1.Enabled := False;
    sRecv := Socket.ReceiveText;
    sOutLPRRecv1 := sRecv;
    ExceptLogging('LPR' + IntToStr(csOutLpr1.Tag) + ' Recv: ' + sOutLPRRecv1);

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
        sTempFile4:= sImgFile1;

        for i := 1 to 10 do
        begin
          if RLpr[i].nUnitNo = nNo then
          begin
            nIO := RLpr[i].nIO;
            nListCnt:= RLpr[i].nLprCnt;
          end;
        end;

        if nRecog1 = 1 then
        begin
          with dmTables.qryOutLpr1Proc do
          begin
            if not b6Proc then
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
            end
            else
            begin
              sShortCarNo:= Copy(sCarNo1, Length(sCarNo1) -3, 4);
              nCarNoLength:= Length(sCarNo1);
              Close;
              SQL.Clear;
              SQL.Add('Select * from ');
              SQL.Add('(Select * from CustInfo where SUBSTRING(CarNo, 4, 4) = :N1 or ');
              SQL.Add(' SUBSTRING(CarNo, 6, 4) = :N2 or SUBSTRING(CarNo, 5, 4) = :N7) d ');
              Parameters.ParamByName('N1').Value:= sShortCarNo;
              Parameters.ParamByName('N2').Value:= sShortCarNo;
              Parameters.ParamByName('N7').Value:= sShortCarNo;

              Case nCarNoLength of
                11: begin
                      SQL.Add('where SUBSTRING(d.CarNo, 5, 1) = :N3');
                      Parameters.ParamByName('N3').Value:= Copy(sCarNo1, 5, 1);
                    end;
                12: begin
                      SQL.Add('where SUBSTRING(d.CarNo, 3, 2) = :N4 or ');
                      SQL.Add('SUBSTRING(d.CarNo, 1, 2) = :N5');
                      Parameters.ParamByName('N4').Value:= Copy(sCarNo1, 5, 2);
                      Parameters.ParamByName('N5').Value:= Copy(sCarNo1, 5, 2);
                    end;
                8 : begin
                      SQL.Add('where SUBSTRING(d.CarNo, 3, 2) = :N4 or ');
                      SQL.Add('SUBSTRING(d.CarNo, 1, 2) = :N5');
                      Parameters.ParamByName('N4').Value:= Copy(sCarNo1, 1, 2);
                      Parameters.ParamByName('N5').Value:= Copy(sCarNo1, 1, 2);
                    end;
              end;
              Open;
            end;

            if RecordCount > 0 then
            begin
              // 등록된 정기차량이면...
              sCarNo1:= FieldByName('CarNO').AsString;
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

                  RSCWait[nSCWaitPoint].sSCFile1 := sImgFile1;
                  RSCWait[nSCWaitPoint].sSCCarNo1 := sCarNo1;
                  RSCWait[nSCWaitPoint].sSCFile2 := sImgFile2;
                  RSCWait[nSCWaitPoint].sSCCarNo2 := sCarNo2;
                  RSCWait[nSCWaitPoint].sSCIOTime := sTime;
                  RSCWait[nSCWaitPoint].nSCLprNo := nNo;
                  RSCWait[nSCWaitPoint].nSCInOut := nIO;
                  RSCWait[nSCWaitPoint].nSCLprCnt:= nListCnt;
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
                  sResult := RecvLprProc(sImgFile1, sCarNo1, sImgFile2, sCarNo2, sTime,
                                         nNo, nIO, nRecog1, nRecog2, sDspIP, csLPR, True, nListCnt);

                  GridData(nIO, nListCnt, sResult);
                end;
              end
              else
              begin
                // 만료된 정기차량...
                try
                  if FileExists(sImgFile1) then
                  begin
                    if nIO = 1 then
                    begin
                      with frmMain do
                      begin
                        TImage(FindComponent('imgIn' + IntToStr(nListCnt))).Picture.LoadFromFile(sImgFile1);
                      end;
                    end
                    else
                    if nIO = 2 then
                    begin
                      with frmMain do
                      begin
                        TImage(FindComponent('imgOut' + IntToStr(nListCnt))).Picture.LoadFromFile(sImgFile1);
                      end;
                    end;
                  end
                  else
                  begin
                    if nIO = 1 then
                    begin
                      with frmMain do
                      begin
                        TImage(FindComponent('imgIn' + IntToStr(nListCnt))).Picture.Assign(Nil);
                      end;
                    end
                    else
                    if nIO = 2 then
                    begin
                      with frmMain do
                      begin
                        TImage(FindComponent('imgOut' + IntToStr(nListCnt))).Picture.Assign(Nil);
                      end;
                    end;

                    ExceptLogging('File 없음: ' + sImgFile1);
                  end;
                except
                  on E: Exception do
                    ExceptLogging('이미지 로드 에러: ' + aString(E.Message));
                end;

                if nIO = 1 then
                begin
                  //입구...
                  with frmMain do
                  begin
                    TLabeledEdit(FindComponent('edtInG' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
                    TLabeledEdit(FindComponent('edtInG' + IntToStr(nListCnt))).Font.Color:= clRed;
                    TLabeledEdit(FindComponent('edtInG' + IntToStr(nListCnt))).Text:= '만료';
                    TLabeledEdit(FindComponent('edtInDong' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
                    TLabeledEdit(FindComponent('edtInDong' + IntToStr(nListCnt))).Font.Color:= clRed;
                    TLabeledEdit(FindComponent('edtInDong' + IntToStr(nListCnt))).Text:= '';
                    TLabeledEdit(FindComponent('edtInHo' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
                    TLabeledEdit(FindComponent('edtInHo' + IntToStr(nListCnt))).Font.Color:= clRed;
                    TLabeledEdit(FindComponent('edtInHo' + IntToStr(nListCnt))).Text:= '';
                    TLabeledEdit(FindComponent('edtInCarNo' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
                    TLabeledEdit(FindComponent('edtInCarNo' + IntToStr(nListCnt))).Font.Color:= clRed;
                    TLabeledEdit(FindComponent('edtInCarNo' + IntToStr(nListCnt))).Text:= sCarNo1;
                  end;
                  DspProc(1, 2, '기간만료차량' + MG_Left(sCarNo1, 12), sDspIP);
                end
                else if nIO = 2 then
                begin
                  //출구...
                  with frmMain do
                  begin
                    TLabeledEdit(FindComponent('edtOutG' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
                    TLabeledEdit(FindComponent('edtOutG' + IntToStr(nListCnt))).Font.Color:= clRed;
                    TLabeledEdit(FindComponent('edtOutG' + IntToStr(nListCnt))).Text:= '만료';
                    TLabeledEdit(FindComponent('edtOutDong' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
                    TLabeledEdit(FindComponent('edtOutDong' + IntToStr(nListCnt))).Font.Color:= clRed;
                    TLabeledEdit(FindComponent('edtOutDong' + IntToStr(nListCnt))).Text:= '';
                    TLabeledEdit(FindComponent('edtOutHo' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
                    TLabeledEdit(FindComponent('edtOutHo' + IntToStr(nListCnt))).Font.Color:= clRed;
                    TLabeledEdit(FindComponent('edtOutHo' + IntToStr(nListCnt))).Text:= '';
                    TLabeledEdit(FindComponent('edtOutCarNo' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
                    TLabeledEdit(FindComponent('edtOutCarNo' + IntToStr(nListCnt))).Font.Color:= clRed;
                    TLabeledEdit(FindComponent('edtOutCarNo' + IntToStr(nListCnt))).Text:= sCarNo1;
                  end;
                  DspProc(2, 2, '기간만료차량' + MG_Left(sCarNo1, 12), sDspIP);
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

                  RNCInWait[nNCInWaitPoint].sNCFile1 := sImgFile1;
                  RNCInWait[nNCInWaitPoint].sNCCarNo1 := sCarNo1;
                  RNCInWait[nNCInWaitPoint].sNCFile2 := sImgFile2;
                  RNCInWait[nNCInWaitPoint].sNCCarNo2 := sCarNo2;
                  RNCInWait[nNCInWaitPoint].sNCIOTime := sTime;
                  RNCInWait[nNCInWaitPoint].nNCLprNo := nNo;
                  RNCInWait[nNCInWaitPoint].nNCInOut := nIO;
                  RNCInWait[nNCInWaitPoint].nNCRecog1 := nRecog1;
                  RNCInWait[nNCInWaitPoint].nNCRecog2 := nRecog2;
                  RNCInWait[nNCInWaitPoint].sNCDspIP := sDspIP;
                  RNCInWait[nNCInWaitPoint].csNCLPR := csLPR;
                  RNCInWait[nNCInWaitPoint].nNCLprCnt:= nListCnt;
                  RNCInWait[nNCInWaitPoint].bBarOpen := bInBarOpen1;

                  if not tNCInWait.Enabled then
                    tNCInWait.Enabled := True;
                end
                else
                begin
                  //NormalProc(sImgFile1, sCarNo1, sImgFile2, sCarNo2, sTime, nNo, nIO,
                  //  nRecog1, nRecog2, sDspIP, csLPR, bInBarOpen1, nListCnt);
                  NormalProc(sImgFile1, sCarNo1, sImgFile2, sCarNo2, sTime, nNo, nIO,
                    nRecog1, nRecog2, sDspIP, csLPR, False, nListCnt);
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

                  RNCOutWait[nNCOutWaitPoint].sNCFile1 := sImgFile1;
                  RNCOutWait[nNCOutWaitPoint].sNCCarNo1 := sCarNo1;
                  RNCOutWait[nNCOutWaitPoint].sNCFile2 := sImgFile2;
                  RNCOutWait[nNCOutWaitPoint].sNCCarNo2 := sCarNo2;
                  RNCOutWait[nNCOutWaitPoint].sNCIOTime := sTime;
                  RNCOutWait[nNCOutWaitPoint].nNCLprNo := nNo;
                  RNCOutWait[nNCOutWaitPoint].nNCInOut := nIO;
                  RNCOutWait[nNCOutWaitPoint].nNCRecog1 := nRecog1;
                  RNCOutWait[nNCOutWaitPoint].nNCRecog2 := nRecog2;
                  RNCOutWait[nNCOutWaitPoint].sNCDspIP := sDspIP;
                  RNCOutWait[nNCOutWaitPoint].csNCLPR := csLPR;
                  RNCOutWait[nNCOutWaitPoint].nNCLprCnt:= nListCnt;
                  RNCOutWait[nNCOutWaitPoint].bBarOpen := True;

                  if not tNCOutWait.Enabled then
                    tNCOutWait.Enabled := True;
                end
                else
                begin
                  NormalProc(sImgFile1, sCarNo1, sImgFile2, sCarNo2, sTime, nNo, nIO,
                    nRecog1, nRecog2, sDspIP, csLPR, False, nListCnt);
                end;
              end;
            end;
          end;
        end
        else
        begin
          //미인식차량 처리...
          try
            if FileExists(sImgFile1) then
            begin
              if nIO = 1 then
              begin
                with frmMain do
                begin
                  TImage(FindComponent('imgIn' + IntToStr(nListCnt))).Picture.LoadFromFile(sImgFile1);
                end;
              end
              else
              if nIO = 2 then
              begin
                with frmMain do
                begin
                  TImage(FindComponent('imgOut' + IntToStr(nListCnt))).Picture.LoadFromFile(sImgFile1);
                end;
              end;
            end
            else
            begin
              if nIO = 1 then
              begin
                with frmMain do
                begin
                  TImage(FindComponent('imgIn' + IntToStr(nListCnt))).Picture.Assign(Nil);
                end;
              end
              else
              if nIO = 2 then
              begin
                with frmMain do
                begin
                  TImage(FindComponent('imgOut' + IntToStr(nListCnt))).Picture.Assign(Nil);
                end;
              end;

              ExceptLogging('File 없음: ' + sImgFile1);
            end;
          except
            on E: Exception do
              ExceptLogging('이미지 로드 에러: ' + aString(E.Message));
          end;

          if nIO = 1 then
          begin
            //입구...
            with frmMain do
            begin
              TLabeledEdit(FindComponent('edtInG' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
              TLabeledEdit(FindComponent('edtInG' + IntToStr(nListCnt))).Font.Color:= clRed;
              TLabeledEdit(FindComponent('edtInG' + IntToStr(nListCnt))).Text:= '미인식';
              TLabeledEdit(FindComponent('edtInDong' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
              TLabeledEdit(FindComponent('edtInDong' + IntToStr(nListCnt))).Font.Color:= clRed;
              TLabeledEdit(FindComponent('edtInDong' + IntToStr(nListCnt))).Text:= '';
              TLabeledEdit(FindComponent('edtInHo' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
              TLabeledEdit(FindComponent('edtInHo' + IntToStr(nListCnt))).Font.Color:= clRed;
              TLabeledEdit(FindComponent('edtInHo' + IntToStr(nListCnt))).Text:= '';
              TLabeledEdit(FindComponent('edtInCarNo' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
              TLabeledEdit(FindComponent('edtInCarNo' + IntToStr(nListCnt))).Font.Color:= clRed;
              TLabeledEdit(FindComponent('edtInCarNo' + IntToStr(nListCnt))).Text:= sCarNo1;
            end;
            DspProc(1, 2, ' 미인식차량 ' + MG_Left(sCarNo1, 12), sDspIP);
          end
          else if nIO = 2 then
          begin
            //출구...
            with frmMain do
            begin
              TLabeledEdit(FindComponent('edtOutG' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
              TLabeledEdit(FindComponent('edtOutG' + IntToStr(nListCnt))).Font.Color:= clRed;
              TLabeledEdit(FindComponent('edtOutG' + IntToStr(nListCnt))).Text:= '미인식';
              TLabeledEdit(FindComponent('edtOutDong' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
              TLabeledEdit(FindComponent('edtOutDong' + IntToStr(nListCnt))).Font.Color:= clRed;
              TLabeledEdit(FindComponent('edtOutDong' + IntToStr(nListCnt))).Text:= '';
              TLabeledEdit(FindComponent('edtOutHo' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
              TLabeledEdit(FindComponent('edtOutHo' + IntToStr(nListCnt))).Font.Color:= clRed;
              TLabeledEdit(FindComponent('edtOutHo' + IntToStr(nListCnt))).Text:= '';
              TLabeledEdit(FindComponent('edtOutCarNo' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
              TLabeledEdit(FindComponent('edtOutCarNo' + IntToStr(nListCnt))).Font.Color:= clRed;
              TLabeledEdit(FindComponent('edtOutCarNo' + IntToStr(nListCnt))).Text:= sCarNo1;
            end;
            DspProc(2, 2, ' 미인식차량 ' + MG_Left(sCarNo1, 12), sDspIP);
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
        if Socket.Connected then
        begin
          Socket.SendText(aString('TIME' + FormatDateTime('YYYYMMDDHHNNSS', Now)));
          ExceptLogging('시간동기화 전송');
        end;
      end;
    end;
    sOutLPRRecv1 := '';
  finally
    tOutAlive1.Enabled := True;
  end;
  }
end;

procedure TfrmMain.csOutLpr2Read(Sender: TObject; Socket: TCustomWinSocket);
var
  nNo: Word;
  sLprData, sLprIP, sDspIP: aString;
  csLPR: TClientSocket;
  sRecv, sExpDateF, sExpDateT, sCarNo1, sCarNo2, sShortCarNo: aString;
  i: Byte;
  sTime, sTemp, sResult, sTest, sDir, sLocal1, sLocal2: String;
  sFile1, sFile2, sImgFile1, sImgFile2: String;
  nRecog1, nRecog2, nIO, nListCnt, nCarNoLength: Byte;
  hr: HRESULT;
  sSend: aString;
begin
{
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
        sTempFile5:= sImgFile1;

        for i := 1 to 10 do
        begin
          if RLpr[i].nUnitNo = nNo then
          begin
            nIO := RLpr[i].nIO;
            nListCnt:= RLpr[i].nLprCnt;
          end;
        end;

        if nRecog1 = 1 then
        begin
          with dmTables.qryOutLpr2Proc do
          begin
            if not b6Proc then
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
            end
            else
            begin
              sShortCarNo:= Copy(sCarNo1, Length(sCarNo1) -3, 4);
              nCarNoLength:= Length(sCarNo1);
              Close;
              SQL.Clear;
              SQL.Add('Select * from ');
              SQL.Add('(Select * from CustInfo where SUBSTRING(CarNo, 4, 4) = :N1 or ');
              SQL.Add(' SUBSTRING(CarNo, 6, 4) = :N2 or SUBSTRING(CarNo, 5, 4) = :N7) d ');
              Parameters.ParamByName('N1').Value:= sShortCarNo;
              Parameters.ParamByName('N2').Value:= sShortCarNo;
              Parameters.ParamByName('N7').Value:= sShortCarNo;

              Case nCarNoLength of
                11: begin
                      SQL.Add('where SUBSTRING(d.CarNo, 5, 1) = :N3');
                      Parameters.ParamByName('N3').Value:= Copy(sCarNo1, 5, 1);
                    end;
                12: begin
                      SQL.Add('where SUBSTRING(d.CarNo, 3, 2) = :N4 or ');
                      SQL.Add('SUBSTRING(d.CarNo, 1, 2) = :N5');
                      Parameters.ParamByName('N4').Value:= Copy(sCarNo1, 5, 2);
                      Parameters.ParamByName('N5').Value:= Copy(sCarNo1, 5, 2);
                    end;
                8 : begin
                      SQL.Add('where SUBSTRING(d.CarNo, 3, 2) = :N4 or ');
                      SQL.Add('SUBSTRING(d.CarNo, 1, 2) = :N5');
                      Parameters.ParamByName('N4').Value:= Copy(sCarNo1, 1, 2);
                      Parameters.ParamByName('N5').Value:= Copy(sCarNo1, 1, 2);
                    end;
              end;
              Open;
            end;

            if RecordCount > 0 then
            begin
              // 등록된 정기차량이면...
              sCarNo1:= FieldByName('CarNO').AsString;
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

                  RSCWait[nSCWaitPoint].sSCFile1 := sImgFile1;
                  RSCWait[nSCWaitPoint].sSCCarNo1 := sCarNo1;
                  RSCWait[nSCWaitPoint].sSCFile2 := sImgFile2;
                  RSCWait[nSCWaitPoint].sSCCarNo2 := sCarNo2;
                  RSCWait[nSCWaitPoint].sSCIOTime := sTime;
                  RSCWait[nSCWaitPoint].nSCLprNo := nNo;
                  RSCWait[nSCWaitPoint].nSCInOut := nIO;
                  RSCWait[nSCWaitPoint].nSCLprCnt:= nListCnt;
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
                  sResult := RecvLprProc(sImgFile1, sCarNo1, sImgFile2, sCarNo2, sTime,
                                         nNo, nIO, nRecog1, nRecog2, sDspIP, csLPR, True, nListCnt);

                  GridData(nIO, nListCnt, sResult);
                end;
              end
              else
              begin
                // 만료된 정기차량...
                try
                  if FileExists(sImgFile1) then
                  begin
                    if nIO = 1 then
                    begin
                      with frmMain do
                      begin
                        TImage(FindComponent('imgIn' + IntToStr(nListCnt))).Picture.LoadFromFile(sImgFile1);
                      end;
                    end
                    else
                    if nIO = 2 then
                    begin
                      with frmMain do
                      begin
                        TImage(FindComponent('imgOut' + IntToStr(nListCnt))).Picture.LoadFromFile(sImgFile1);
                      end;
                    end;
                  end
                  else
                  begin
                    if nIO = 1 then
                    begin
                      with frmMain do
                      begin
                        TImage(FindComponent('imgIn' + IntToStr(nListCnt))).Picture.Assign(Nil);
                      end;
                    end
                    else
                    if nIO = 2 then
                    begin
                      with frmMain do
                      begin
                        TImage(FindComponent('imgOut' + IntToStr(nListCnt))).Picture.Assign(Nil);
                      end;
                    end;

                    ExceptLogging('File 없음: ' + sImgFile1);
                  end;
                except
                  on E: Exception do
                    ExceptLogging('이미지 로드 에러: ' + aString(E.Message));
                end;

                if nIO = 1 then
                begin
                  //입구...
                  with frmMain do
                  begin
                    TLabeledEdit(FindComponent('edtInG' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
                    TLabeledEdit(FindComponent('edtInG' + IntToStr(nListCnt))).Font.Color:= clRed;
                    TLabeledEdit(FindComponent('edtInG' + IntToStr(nListCnt))).Text:= '만료';
                    TLabeledEdit(FindComponent('edtInDong' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
                    TLabeledEdit(FindComponent('edtInDong' + IntToStr(nListCnt))).Font.Color:= clRed;
                    TLabeledEdit(FindComponent('edtInDong' + IntToStr(nListCnt))).Text:= '';
                    TLabeledEdit(FindComponent('edtInHo' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
                    TLabeledEdit(FindComponent('edtInHo' + IntToStr(nListCnt))).Font.Color:= clRed;
                    TLabeledEdit(FindComponent('edtInHo' + IntToStr(nListCnt))).Text:= '';
                    TLabeledEdit(FindComponent('edtInCarNo' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
                    TLabeledEdit(FindComponent('edtInCarNo' + IntToStr(nListCnt))).Font.Color:= clRed;
                    TLabeledEdit(FindComponent('edtInCarNo' + IntToStr(nListCnt))).Text:= sCarNo1;
                  end;
                  DspProc(1, 2, '기간만료차량' + MG_Left(sCarNo1, 12), sDspIP);
                end
                else if nIO = 2 then
                begin
                  //출구...
                  with frmMain do
                  begin
                    TLabeledEdit(FindComponent('edtOutG' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
                    TLabeledEdit(FindComponent('edtOutG' + IntToStr(nListCnt))).Font.Color:= clRed;
                    TLabeledEdit(FindComponent('edtOutG' + IntToStr(nListCnt))).Text:= '만료';
                    TLabeledEdit(FindComponent('edtOutDong' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
                    TLabeledEdit(FindComponent('edtOutDong' + IntToStr(nListCnt))).Font.Color:= clRed;
                    TLabeledEdit(FindComponent('edtOutDong' + IntToStr(nListCnt))).Text:= '';
                    TLabeledEdit(FindComponent('edtOutHo' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
                    TLabeledEdit(FindComponent('edtOutHo' + IntToStr(nListCnt))).Font.Color:= clRed;
                    TLabeledEdit(FindComponent('edtOutHo' + IntToStr(nListCnt))).Text:= '';
                    TLabeledEdit(FindComponent('edtOutCarNo' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
                    TLabeledEdit(FindComponent('edtOutCarNo' + IntToStr(nListCnt))).Font.Color:= clRed;
                    TLabeledEdit(FindComponent('edtOutCarNo' + IntToStr(nListCnt))).Text:= sCarNo1;
                  end;
                  DspProc(2, 2, '기간만료차량' + MG_Left(sCarNo1, 12), sDspIP);
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

                  RNCInWait[nNCInWaitPoint].sNCFile1 := sImgFile1;
                  RNCInWait[nNCInWaitPoint].sNCCarNo1 := sCarNo1;
                  RNCInWait[nNCInWaitPoint].sNCFile2 := sImgFile2;
                  RNCInWait[nNCInWaitPoint].sNCCarNo2 := sCarNo2;
                  RNCInWait[nNCInWaitPoint].sNCIOTime := sTime;
                  RNCInWait[nNCInWaitPoint].nNCLprNo := nNo;
                  RNCInWait[nNCInWaitPoint].nNCInOut := nIO;
                  RNCInWait[nNCInWaitPoint].nNCRecog1 := nRecog1;
                  RNCInWait[nNCInWaitPoint].nNCRecog2 := nRecog2;
                  RNCInWait[nNCInWaitPoint].sNCDspIP := sDspIP;
                  RNCInWait[nNCInWaitPoint].csNCLPR := csLPR;
                  RNCInWait[nNCInWaitPoint].nNCLprCnt:= nListCnt;
                  RNCInWait[nNCInWaitPoint].bBarOpen := bInBarOpen1;

                  if not tNCInWait.Enabled then
                    tNCInWait.Enabled := True;
                end
                else
                begin
                  NormalProc(sImgFile1, sCarNo1, sImgFile2, sCarNo2, sTime, nNo, nIO,
                    nRecog1, nRecog2, sDspIP, csLPR, False, nListCnt);
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

                  RNCOutWait[nNCOutWaitPoint].sNCFile1 := sImgFile1;
                  RNCOutWait[nNCOutWaitPoint].sNCCarNo1 := sCarNo1;
                  RNCOutWait[nNCOutWaitPoint].sNCFile2 := sImgFile2;
                  RNCOutWait[nNCOutWaitPoint].sNCCarNo2 := sCarNo2;
                  RNCOutWait[nNCOutWaitPoint].sNCIOTime := sTime;
                  RNCOutWait[nNCOutWaitPoint].nNCLprNo := nNo;
                  RNCOutWait[nNCOutWaitPoint].nNCInOut := nIO;
                  RNCOutWait[nNCOutWaitPoint].nNCRecog1 := nRecog1;
                  RNCOutWait[nNCOutWaitPoint].nNCRecog2 := nRecog2;
                  RNCOutWait[nNCOutWaitPoint].sNCDspIP := sDspIP;
                  RNCOutWait[nNCOutWaitPoint].csNCLPR := csLPR;
                  RNCOutWait[nNCOutWaitPoint].nNCLprCnt:= nListCnt;
                  RNCOutWait[nNCOutWaitPoint].bBarOpen := True;

                  if not tNCOutWait.Enabled then
                    tNCOutWait.Enabled := True;
                end
                else
                begin
                  NormalProc(sImgFile1, sCarNo1, sImgFile2, sCarNo2, sTime, nNo, nIO,
                    nRecog1, nRecog2, sDspIP, csLPR, False, nListCnt);
                end;
              end;
            end;
          end;
        end
        else
        begin
          //미인식차량 처리...
          try
            if FileExists(sImgFile1) then
            begin
              if nIO = 1 then
              begin
                with frmMain do
                begin
                  TImage(FindComponent('imgIn' + IntToStr(nListCnt))).Picture.LoadFromFile(sImgFile1);
                end;
              end
              else
              if nIO = 2 then
              begin
                with frmMain do
                begin
                  TImage(FindComponent('imgOut' + IntToStr(nListCnt))).Picture.LoadFromFile(sImgFile1);
                end;
              end;
            end
            else
            begin
              if nIO = 1 then
              begin
                with frmMain do
                begin
                  TImage(FindComponent('imgIn' + IntToStr(nListCnt))).Picture.Assign(Nil);
                end;
              end
              else
              if nIO = 2 then
              begin
                with frmMain do
                begin
                  TImage(FindComponent('imgOut' + IntToStr(nListCnt))).Picture.Assign(Nil);
                end;
              end;

              ExceptLogging('File 없음: ' + sImgFile1);
            end;
          except
            on E: Exception do
              ExceptLogging('이미지 로드 에러: ' + aString(E.Message));
          end;

          if nIO = 1 then
          begin
            //입구...
            with frmMain do
            begin
              TLabeledEdit(FindComponent('edtInG' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
              TLabeledEdit(FindComponent('edtInG' + IntToStr(nListCnt))).Font.Color:= clRed;
              TLabeledEdit(FindComponent('edtInG' + IntToStr(nListCnt))).Text:= '미인식';
              TLabeledEdit(FindComponent('edtInDong' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
              TLabeledEdit(FindComponent('edtInDong' + IntToStr(nListCnt))).Font.Color:= clRed;
              TLabeledEdit(FindComponent('edtInDong' + IntToStr(nListCnt))).Text:= '';
              TLabeledEdit(FindComponent('edtInHo' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
              TLabeledEdit(FindComponent('edtInHo' + IntToStr(nListCnt))).Font.Color:= clRed;
              TLabeledEdit(FindComponent('edtInHo' + IntToStr(nListCnt))).Text:= '';
              TLabeledEdit(FindComponent('edtInCarNo' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
              TLabeledEdit(FindComponent('edtInCarNo' + IntToStr(nListCnt))).Font.Color:= clRed;
              TLabeledEdit(FindComponent('edtInCarNo' + IntToStr(nListCnt))).Text:= sCarNo1;
            end;
            DspProc(1, 2, ' 미인식차량 ' + MG_Left(sCarNo1, 12), sDspIP);
          end
          else if nIO = 2 then
          begin
            //출구...
            with frmMain do
            begin
              TLabeledEdit(FindComponent('edtOutG' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
              TLabeledEdit(FindComponent('edtOutG' + IntToStr(nListCnt))).Font.Color:= clRed;
              TLabeledEdit(FindComponent('edtOutG' + IntToStr(nListCnt))).Text:= '미인식';
              TLabeledEdit(FindComponent('edtOutDong' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
              TLabeledEdit(FindComponent('edtOutDong' + IntToStr(nListCnt))).Font.Color:= clRed;
              TLabeledEdit(FindComponent('edtOutDong' + IntToStr(nListCnt))).Text:= '';
              TLabeledEdit(FindComponent('edtOutHo' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
              TLabeledEdit(FindComponent('edtOutHo' + IntToStr(nListCnt))).Font.Color:= clRed;
              TLabeledEdit(FindComponent('edtOutHo' + IntToStr(nListCnt))).Text:= '';
              TLabeledEdit(FindComponent('edtOutCarNo' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
              TLabeledEdit(FindComponent('edtOutCarNo' + IntToStr(nListCnt))).Font.Color:= clRed;
              TLabeledEdit(FindComponent('edtOutCarNo' + IntToStr(nListCnt))).Text:= sCarNo1;
            end;
            DspProc(2, 2, ' 미인식차량 ' + MG_Left(sCarNo1, 12), sDspIP);
          end;
        end;
      except
        on E: Exception do
          ExceptLogging('csOutLpr1Read: ' + aString(E.Message));
      end;
    end
    else
    begin
      if sOutLPRRecv2 = 'LPR_R' then
      begin
        if Socket.Connected then
        begin
          Socket.SendText(aString('TIME' + FormatDateTime('YYYYMMDDHHNNSS', Now)));
          ExceptLogging('시간동기화 전송');
        end;
      end;
    end;
    sOutLPRRecv2 := '';
  finally
    tOutAlive2.Enabled := True;
  end;
  }
end;

procedure TfrmMain.DBAdvGrid1Click(Sender: TObject);
begin
  if dmTables.qrySCSearch.RecordCount > 0 then
  begin
    sManualSCCarNo := dmTables.qrySCSearch.FieldByName('CarNo').AsString;
    btnSCIn.Enabled:= True;
    btnSCOut.Enabled := True;
  end
  else
    sManualSCCarNo := '';
end;

procedure TfrmMain.dgManualClick(Sender: TObject);
begin
  if dmTables.qrySCSearch.RecordCount > 0 then
  begin
    sManualSCCarNo := dmTables.qrySCSearch.FieldByName('CarNo').AsString;
    btnManualSCIn.Enabled:= True;
    btnManualSCOut.Enabled := True;
  end
  else
  begin
    sManualSCCarNo := '';
    btnManualSCIn.Enabled:= False;
    btnManualSCOut.Enabled := False;
  end;
end;

// nIO: 1-입구, 2-출구    nType: 1-정기차량, 2-일반차량, 3-요금표시, 4-주차요금0원
procedure TfrmMain.DspProc(nIO, nType: Byte; sData, sDspIP: aString);
var
  i: Byte;
  sSend: aString;
begin
  try
    case nType of
      1: sSend := MakeDSPData(AnsiChar($54), EMDSP1, SCCOLOR, MG_Left(sData, 24));
      2: sSend := MakeDSPData(AnsiChar($54), EMDSP1, NOCOLOR, MG_Left(sData, 24));
      3: sSend := MakeDSPData(AnsiChar($54), EMDSP0, YOCOLOR, MG_Left(sData, 24));
      4: sSend := MakeDSPData(AnsiChar($54), EMDSP1, YOCOLOR, MG_Left(sData, 24));
    end;

    if nIO = 1 then
    begin
      for i := 1 to 1 do
      begin
        with frmMain do
        begin
          if TClientSocket(FindComponent('csInDsp' + IntToStr(i))).Host = wString(sDspIP) then
          begin
            if is_ping(sDspIP) then begin
              case i  of
                1: sInDspBasic1:= sSend;
                2: sInDspBasic2:= sSend;
//                3: sInDspBasic3:= sSend;
//                4: sInDspBasic4:= sSend;
//                5: sInDspBasic5:= sSend;
              end;
              { TODO : 전광판 입차 }
              if TClientSocket(FindComponent('csInDsp' + IntToStr(i))).Active then
                TClientSocket(FindComponent('csInDsp' + IntToStr(i))).Active:= false;

              TClientSocket(FindComponent('csInDsp' + IntToStr(i))).Active:= True;
              ExceptLogging('전광판(' + sDspIP + '): '+sData);

            end
            else  // if is_ping(sDspIP) then begin
            ExceptLogging('전광판(' + sDspIP + ') 재전송');
            if is_ping(sDspIP) then
            begin
              TClientSocket(FindComponent('csInDsp' + IntToStr(i))).Active := True;
              prDelay(nDspInterval);
              if TClientSocket(FindComponent('csInDsp' + IntToStr(i))).Active then
              begin
                TClientSocket(FindComponent('csInDsp' + IntToStr(i))).Socket.SendText(sSend);
                prDelay(nDspInterval);
                ExceptLogging('전광판(' + sDspIP + '): '+sData);
                // TClientSocket(FindComponent('csInDsp' + IntToStr(i))).Active := False;
              end;
            end
            else
            begin
              ExceptLogging('전광판(' + sDspIP + ') 네트워크 에러');
  //            if chkNet(TClientSocket(FindComponent('csInDsp' + IntToStr(i))), '전광판 문구전송') then
  //            begin
  //              TClientSocket(FindComponent('csInDsp' + IntToStr(i))).Socket.SendText(sSend);
  //              ExceptLogging(TClientSocket(FindComponent('csInDsp' + IntToStr(i))).Host + ' 로 전광판 문구전송');
  //              TClientSocket(FindComponent('csInDsp' + IntToStr(i))).Active:= False;
  //            end;
            end;
          end;
        end;
      end;
    end
    else if nIO = 2 then
    begin
      for i := 1 to 3 do
      begin
        with frmMain do
        begin
          if TClientSocket(FindComponent('csOutDsp' + IntToStr(i))).Host = wString(sDspIP) then
          begin
            if is_ping(sDspIP) then
            begin
              TClientSocket(FindComponent('csOutDsp' + IntToStr(i))).Active := True;
              prDelay(nDspInterval);
              if TClientSocket(FindComponent('csOutDsp' + IntToStr(i))).Active then
              begin
                TClientSocket(FindComponent('csOutDsp' + IntToStr(i))).Socket.SendText(sSend);
                prDelay(nDspInterval);
                //TClientSocket(FindComponent('csOutDsp' + IntToStr(i))).Active := False;
              end;
            end
            else
            begin
              ExceptLogging('전광판(' + sDspIP + ') 네트워크 에러');
            end;
//            if chkNet(TClientSocket(FindComponent('csOutDsp' + IntToStr(i))), '전광판 문구전송') then
//            begin
//              TClientSocket(FindComponent('csOutDsp' + IntToStr(i))).Socket.SendText(sSend);
//              ExceptLogging(TClientSocket(FindComponent('csOutDsp' + IntToStr(i))).Host + ' 로 전광판 문구전송');
//              TClientSocket(FindComponent('csOutDsp' + IntToStr(i))).Active:= False;
//            end;
          end;
        end;
      end;
    end;
  except
    on E: Exception do ExceptLogging('DspProc: ' + aString(E.Message));
  end;

end;

procedure TfrmMain.edtInCarNo1KeyPress(Sender: TObject; var Key: Char);
var
  sIn, sResult, sTime, sTemp, sInputCarNo: aString;
  sDspIP: aString;
  i: Byte;
begin
  try
    if Key = #13 then
    begin
      if edtInCarNo1.Text = '' then
      begin
        ShowMessage('차량번호를 입력하여주세요!');
        edtInCarNo1.SetFocus;
        Exit;
      end;

      with dmTables.qrySCSearch do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select * from CustInfo where CarNo like ' + MG_MakeStr('%' + Trim(edtInCarNo1.Text) + '%'));
        Open;

        if RecordCount > 0 then
        begin
          First;
          sInputCarNo := dmTables.qrySCSearch.FieldByName('CarNo').AsString;
          sResult := RecvLprProc(sTempFile1, sInputCarNo, '', '', FormatDateTime('YYYY-MM-DD HH:NN:SS', Now),
                                 csInLpr1.Tag, 1, 2, 0, csInDsp1.Host, csInLpr1, True, 1);
          GridData(1, 1, sResult);
        end
        else
        begin
          sInputCarNo := '';
          ShowMessage('미등록차량입니다.');
        end;
      end;
    end;
  except
    on E: Exception do
      ExceptLogging('TfrmMain.edtInCarNo1KeyPress: ' + E.Message);
  end;
end;

procedure TfrmMain.edtManualProcCarNoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnManualSeekClick(Self);
end;

procedure TfrmMain.edtSCCarNoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnSCClick(Self);
end;

procedure TfrmMain.NormalOut(sLprFile1, sLprCarNo1, sLprFile2, sLprCarNo2,
  sIOTime: aString; nLprNo, nLprInOut, nLprRecog1, nLprRecog2: Byte;
  sDspIP: aString; csLPR: TClientSocket; nListCnt: Byte);
var
  sNow, sInCarNo, sInTKNo, sInDate, sInTime, sParking, sInFile, sImgFile1,
    sImgFile2, sLocalFile, sTime, sDir, sYogum, sTemp: aString;
  nDay, nHour, nMin, nOutCnt: Cardinal;
  nInUnitNo, i: Word;
  hr: HRESULT;
begin
  // 일반차량 출차처리...
  try
  try
    bNCOutProcWait := True;
    nowLpr := csLPR;
    sNow:= FormatDateTime('YYYY-MM-DD HH:NN:SS', Now);

    // DB Write...
    with dmTables.qryNormalOut2 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from IONCount Where ParkNo = :N1 and UnitNo = :N2 and ProcDate = :N3');
      Parameters.ParamByName('N1').Value := nCurrParkNo;
      Parameters.ParamByName('N2').Value := nLprNo;
      Parameters.ParamByName('N3').Value := Copy(sNow, 1, 10);
      Open;

      if RecordCount > 0 then
      begin
        Case StrToInt(FormatDateTime('HH', Now)) of
          0:
            nOutCnt := FieldByName('Out00').AsInteger + 1;
          1:
            nOutCnt := FieldByName('Out01').AsInteger + 1;
          2:
            nOutCnt := FieldByName('Out02').AsInteger + 1;
          3:
            nOutCnt := FieldByName('Out03').AsInteger + 1;
          4:
            nOutCnt := FieldByName('Out04').AsInteger + 1;
          5:
            nOutCnt := FieldByName('Out05').AsInteger + 1;
          6:
            nOutCnt := FieldByName('Out06').AsInteger + 1;
          7:
            nOutCnt := FieldByName('Out07').AsInteger + 1;
          8:
            nOutCnt := FieldByName('Out08').AsInteger + 1;
          9:
            nOutCnt := FieldByName('Out09').AsInteger + 1;
          10:
            nOutCnt := FieldByName('Out10').AsInteger + 1;
          11:
            nOutCnt := FieldByName('Out11').AsInteger + 1;
          12:
            nOutCnt := FieldByName('Out12').AsInteger + 1;
          13:
            nOutCnt := FieldByName('Out13').AsInteger + 1;
          14:
            nOutCnt := FieldByName('Out14').AsInteger + 1;
          15:
            nOutCnt := FieldByName('Out15').AsInteger + 1;
          16:
            nOutCnt := FieldByName('Out16').AsInteger + 1;
          17:
            nOutCnt := FieldByName('Out17').AsInteger + 1;
          18:
            nOutCnt := FieldByName('Out18').AsInteger + 1;
          19:
            nOutCnt := FieldByName('Out19').AsInteger + 1;
          20:
            nOutCnt := FieldByName('Out20').AsInteger + 1;
          21:
            nOutCnt := FieldByName('Out21').AsInteger + 1;
          22:
            nOutCnt := FieldByName('Out22').AsInteger + 1;
          23:
            nOutCnt := FieldByName('Out23').AsInteger + 1;
        end;
        Close;
        SQL.Clear;
        SQL.Add('Update IONCount ');

        Case StrToInt(FormatDateTime('HH', Now)) of
          0:
            SQL.Add('Set Out00 = :N1 ');
          1:
            SQL.Add('Set Out01 = :N1 ');
          2:
            SQL.Add('Set Out02 = :N1 ');
          3:
            SQL.Add('Set Out03 = :N1 ');
          4:
            SQL.Add('Set Out04 = :N1 ');
          5:
            SQL.Add('Set Out05 = :N1 ');
          6:
            SQL.Add('Set Out06 = :N1 ');
          7:
            SQL.Add('Set Out07 = :N1 ');
          8:
            SQL.Add('Set Out08 = :N1 ');
          9:
            SQL.Add('Set Out09 = :N1 ');
          10:
            SQL.Add('Set Out10 = :N1 ');
          11:
            SQL.Add('Set Out11 = :N1 ');
          12:
            SQL.Add('Set Out12 = :N1 ');
          13:
            SQL.Add('Set Out13 = :N1 ');
          14:
            SQL.Add('Set Out14 = :N1 ');
          15:
            SQL.Add('Set Out15 = :N1 ');
          16:
            SQL.Add('Set Out16 = :N1 ');
          17:
            SQL.Add('Set Out17 = :N1 ');
          18:
            SQL.Add('Set Out18 = :N1 ');
          19:
            SQL.Add('Set Out19 = :N1 ');
          20:
            SQL.Add('Set Out20 = :N1 ');
          21:
            SQL.Add('Set Out21 = :N1 ');
          22:
            SQL.Add('Set Out22 = :N1 ');
          23:
            SQL.Add('Set Out23 = :N1 ');
        end;
        SQL.Add('Where ParkNo = :N2 and UnitNo = :N3 and ProcDate = :N4');
        Parameters.ParamByName('N1').Value := nOutCnt;
        Parameters.ParamByName('N2').Value := nCurrParkNo;
        Parameters.ParamByName('N3').Value := nLprNo;
        Parameters.ParamByName('N4').Value := Copy(sNow, 1, 10);
        ExecSQL;
        Close;
      end
      else
      begin
        Close;
        SQL.Clear;
        SQL.Add('Insert Into IONCount ');
        SQL.Add('(ParkNo, UnitNo, ProcDate, In00, In01, In02, In03, In04, ');
        SQL.Add('In05, In06, In07, In08, In09, In10, In11, In12, In13, In14, ');
        SQL.Add('In15, In16, In17, In18, In19, In20, In21, In22, In23, Out00, ');
        SQL.Add('Out01, Out02, Out03, Out04, Out05, Out06, Out07, Out08, Out09, ');
        SQL.Add('Out10, Out11, Out12, Out13, Out14, Out15, Out16, Out17, Out18, ');
        SQL.Add('Out19, Out20, Out21, Out22, Out23) Values ');
        SQL.Add('(:N1, :N2, :N3, 0, 0, 0, 0, 0, 0, 0, ');
        SQL.Add('0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ');
        SQL.Add('0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)');
        Parameters.ParamByName('N1').Value := nCurrParkNo;
        Parameters.ParamByName('N2').Value := nLprNo;
        Parameters.ParamByName('N3').Value := Copy(sNow, 1, 10);
        ExecSQL;

        Close;
        SQL.Clear;
        SQL.Add('UpDate IONCount ');

        Case StrToInt(FormatDateTime('HH', Now)) of
          0:
            SQL.Add('Set Out00 = :N1 ');
          1:
            SQL.Add('Set Out01 = :N1 ');
          2:
            SQL.Add('Set Out02 = :N1 ');
          3:
            SQL.Add('Set Out03 = :N1 ');
          4:
            SQL.Add('Set Out04 = :N1 ');
          5:
            SQL.Add('Set Out05 = :N1 ');
          6:
            SQL.Add('Set Out06 = :N1 ');
          7:
            SQL.Add('Set Out07 = :N1 ');
          8:
            SQL.Add('Set Out08 = :N1 ');
          9:
            SQL.Add('Set Out09 = :N1 ');
          10:
            SQL.Add('Set Out10 = :N1 ');
          11:
            SQL.Add('Set Out11 = :N1 ');
          12:
            SQL.Add('Set Out12 = :N1 ');
          13:
            SQL.Add('Set Out13 = :N1 ');
          14:
            SQL.Add('Set Out14 = :N1 ');
          15:
            SQL.Add('Set Out15 = :N1 ');
          16:
            SQL.Add('Set Out16 = :N1 ');
          17:
            SQL.Add('Set Out17 = :N1 ');
          18:
            SQL.Add('Set Out18 = :N1 ');
          19:
            SQL.Add('Set Out19 = :N1 ');
          20:
            SQL.Add('Set Out20 = :N1 ');
          21:
            SQL.Add('Set Out21 = :N1 ');
          22:
            SQL.Add('Set Out22 = :N1 ');
          23:
            SQL.Add('Set Out23 = :N1 ');
        end;
        SQL.Add('Where ParkNo = :N2 and UnitNo = :N3 and ProcDate = :N4');
        Parameters.ParamByName('N1').Value := 1;
        Parameters.ParamByName('N2').Value := nCurrParkNo;
        Parameters.ParamByName('N3').Value := nLprNo;
        Parameters.ParamByName('N4').Value := Copy(sNow, 1, 10);
        ExecSQL;
      end;

      Close;
      SQL.Clear;
      SQL.Add('Select * from IONData where OutChk = :N1 and ');
      SQL.Add('((InCarNo1 = :N2) or (InCarNo2 = :N3)) ');
      SQL.Add('Order By ProcDate Desc, ProcTime Desc');
      Parameters.ParamByName('N1').Value := 0;
      Parameters.ParamByName('N2').Value := sLprCarNo1;
      Parameters.ParamByName('N3').Value := sLprCarNo1;
      Open;

      if RecordCount > 0 then
      begin
        nInUnitNo := FieldByName('UnitNo').AsInteger;
        sInTKNo := FieldByName('TKNo').AsString;

        if nLprRecog1 = 1 then
        begin
          sInCarNo := sLprCarNo1;
          sInFile := FieldByName('InImage1').AsString;
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
        sInDate := FieldByName('ProcDate').AsString;
        sInTime := FieldByName('ProcTime').AsString;
        sNowInDate := sInDate;
        sNowInTime := sInTime;

        // InData에 입차자료가 있으면...
        Close;
        SQL.Clear;
        SQL.Add('Update IONData Set OutUnitNo = :N1, OutDate = :N2, OutTime = :N3, OutChk = :N4, ');
        SQL.Add('OutImage1 = :N5, OutCarNo1 = :N6, OutImage2 = :N7, OutCarNo2 = :N8, ');
        SQL.Add('OutRecog1 = :N9, OutRecog2 = :N10, Reserve1 = :N16 ');
        SQL.Add('where ParkNo = :N11 and UnitNo = :N12 and ProcDate = :N13 and ProcTime = :N14 and TKNo = :N15');
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
        Parameters.ParamByName('N16').Value := '';
        ExecSQL;
      end
      else
      begin
        // InData에 입차자료가 없으면...
        sInTKNo:= MG_InsZero(IntToStr(GetTickCount), 10);

        Close;
        SQL.Clear;
        Close;
        SQL.Clear;
        SQL.Add('Insert Into IONData ');
        SQL.Add('(ParkNo, UnitNo, ProcDate, ProcTime, TKNo, TKType, CarType, InImage1, InCarNo1, ');
        SQL.Add('InImage2, InCarNo2, Status, InRecog1, InRecog2, OutUnitNo, OutDate, OutTime, OutChk, ');
        SQL.Add('OutImage1, OutCarNo1, OutImage2, OutCarNo2, OutRecog1, OutRecog2) ');
        SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, :N12, :N13, :N14, ');
        SQL.Add(':N15, :N16, :N17, :N18, :N19, :N20, :N21, :N22, :N23, :N24 ) ');
        Parameters.ParamByName('N1').Value := nCurrParkNo;
        Parameters.ParamByName('N2').Value := nLprNo;
        Parameters.ParamByName('N3').Value := Copy(sNow, 1, 10);
        Parameters.ParamByName('N4').Value := Copy(sNow, 12, 8);
        Parameters.ParamByName('N5').Value := sInTKNo;
        Parameters.ParamByName('N6').Value := 1;
        Parameters.ParamByName('N7').Value := 1;
        Parameters.ParamByName('N8').Value := '';
        Parameters.ParamByName('N9').Value := '';
        Parameters.ParamByName('N10').Value:= '';
        Parameters.ParamByName('N11').Value:= '';
        Parameters.ParamByName('N12').Value:= 1;
        Parameters.ParamByName('N13').Value:= 0;
        Parameters.ParamByName('N14').Value:= 0;
        Parameters.ParamByName('N15').Value:= nLprNo;
        Parameters.ParamByName('N16').Value:= Copy(sNow, 1, 10);
        Parameters.ParamByName('N17').Value:= Copy(sNow, 12, 8);
        Parameters.ParamByName('N18').Value:= 1;
        Parameters.ParamByName('N19').Value:= sLprFile1;
        Parameters.ParamByName('N20').Value:= sLprCarNo1;
        Parameters.ParamByName('N21').Value:= '';
        Parameters.ParamByName('N22').Value:= '';
        Parameters.ParamByName('N23').Value:= nLprRecog1;
        Parameters.ParamByName('N24').Value:= nLprRecog2;
        ExecSQL;
      end;
    end;
    NormalLogging('미등록차량 출차: ' + sLprCarNo1 + ' - ' + sLprFile1);

    try
      if FileExists(sLprFile1) then
      begin
        with frmMain do
        begin
          TImage(FindComponent('imgOut' + IntToStr(nListCnt))).Picture.LoadFromFile(sLprFile1);
        end;
      end
      else
      begin
        with frmMain do
        begin
          TImage(FindComponent('imgOut' + IntToStr(nListCnt))).Picture.Assign(Nil);
        end;
        ExceptLogging('File 없음: ' + sLprFile1);
      end;
    except
      on E: Exception do
        ExceptLogging('이미지 로드 에러(NormatOut): ' + aString(E.Message));
    end;

    with frmMain do
    begin
      TLabeledEdit(FindComponent('edtOutG' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
      TLabeledEdit(FindComponent('edtOutG' + IntToStr(nListCnt))).Font.Color:= clRed;
      TLabeledEdit(FindComponent('edtOutG' + IntToStr(nListCnt))).Text:= '일반';
      TLabeledEdit(FindComponent('edtOutDong' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
      TLabeledEdit(FindComponent('edtOutDong' + IntToStr(nListCnt))).Font.Color:= clRed;
      TLabeledEdit(FindComponent('edtOutDong' + IntToStr(nListCnt))).Text:= '';
      TLabeledEdit(FindComponent('edtOutHo' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
      TLabeledEdit(FindComponent('edtOutHo' + IntToStr(nListCnt))).Font.Color:= clRed;
      TLabeledEdit(FindComponent('edtOutHo' + IntToStr(nListCnt))).Text:= '';
      TLabeledEdit(FindComponent('edtOutCarNo' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
      TLabeledEdit(FindComponent('edtOutCarNo' + IntToStr(nListCnt))).Font.Color:= clRed;
      TLabeledEdit(FindComponent('edtOutCarNo' + IntToStr(nListCnt))).Text:= sLprCarNo1;
    end;

    DspProc(2, 2, '  일반차량  ' + MG_Left(sLprCarNo1, 12), sDspIP);
  except
    on E: Exception do
      ExceptLogging('NormalOut: ' + aString(E.Message));
  end;

  finally
    bNCOutProcWait := False;
  end;
end;

procedure TfrmMain.NormalProc(sLprFile1, sLprCarNo1, sLprFile2, sLprCarNo2,
  sIOTime: aString; nLprNo, nLprInOut, nLprRecog1, nLprRecog2: Byte;
  sDspIP: aString; csLPR: TClientSocket; bOpen: Boolean; nListCnt: Byte);
var
  sTKNo, sLprDate, sLprTime, sSend, sTemp: aString;
  nInCnt: Word;
begin
  try
    ExceptLogging('일반차량: ' + sLprCarNo1 + ', ' + sLprCarNo2);
    sLprDate := Copy(sIOTime, 1, 10);
    sLprTime := Copy(sIOTime, 12, 8);

    if nLprInOut = 1 then
    begin
      // 입차처리...
      try
        sGTKNo := '';
        bNCInProcWait := True;
        bSaveION := false;
        sTKNo := FormatDateTime('YYYYMMDDHHNNSS', Now)+ IntToStr(nCurrUnitNo);
        //sTKNo := MG_InsZero(IntToStr(GetTickCount), 10);
        sGTKNo := sTKNo;
        tStart.Enabled := True;
//        if ComPrn.Open and (sGTKNo <> '') then
//        begin
//           ComPrn.PutString(ReadInPutSignal);
//        end;
        with dmTables.qryNormal do
        begin
//          Close;
//          SQL.Clear;
//          SQL.Add('Select * from IONCount Where ParkNo = :N1 and UnitNo = :N2 and ProcDate = :N3');
//          Parameters.ParamByName('N1').Value := nCurrParkNo;
//          Parameters.ParamByName('N2').Value := nLprNo;
//          Parameters.ParamByName('N3').Value := Copy(sLprDate, 1, 10);
//          Open;
//
//          if RecordCount > 0 then
//          begin
//            Case StrToInt(FormatDateTime('HH', Now)) of
//              0:                  nInCnt := FieldByName('In00').AsInteger + 1;
//              1:                  nInCnt := FieldByName('In01').AsInteger + 1;
//              2:                  nInCnt := FieldByName('In02').AsInteger + 1;
//              3:                  nInCnt := FieldByName('In03').AsInteger + 1;
//              4:                  nInCnt := FieldByName('In04').AsInteger + 1;
//              5:                  nInCnt := FieldByName('In05').AsInteger + 1;
//              6:                  nInCnt := FieldByName('In06').AsInteger + 1;
//              7:                  nInCnt := FieldByName('In07').AsInteger + 1;
//              8:                  nInCnt := FieldByName('In08').AsInteger + 1;
//              9:                  nInCnt := FieldByName('In09').AsInteger + 1;
//              10:                 nInCnt := FieldByName('In10').AsInteger + 1;
//              11:                 nInCnt := FieldByName('In11').AsInteger + 1;
//              12:                 nInCnt := FieldByName('In12').AsInteger + 1;
//              13:                 nInCnt := FieldByName('In13').AsInteger + 1;
//              14:                 nInCnt := FieldByName('In14').AsInteger + 1;
//              15:                 nInCnt := FieldByName('In15').AsInteger + 1;
//              16:                 nInCnt := FieldByName('In16').AsInteger + 1;
//              17:                 nInCnt := FieldByName('In17').AsInteger + 1;
//              18:                 nInCnt := FieldByName('In18').AsInteger + 1;
//              19:                 nInCnt := FieldByName('In19').AsInteger + 1;
//              20:                 nInCnt := FieldByName('In20').AsInteger + 1;
//              21:                 nInCnt := FieldByName('In21').AsInteger + 1;
//              22:                 nInCnt := FieldByName('In22').AsInteger + 1;
//              23:                 nInCnt := FieldByName('In23').AsInteger + 1;
//            end;
//            Close;
//            SQL.Clear;
//            SQL.Add('Update IONCount ');
//
//            Case StrToInt(FormatDateTime('HH', Now)) of
//              0:                  SQL.Add('Set In00 = :N1 ');
//              1:                  SQL.Add('Set In01 = :N1 ');
//              2:                  SQL.Add('Set In02 = :N1 ');
//              3:                  SQL.Add('Set In03 = :N1 ');
//              4:                  SQL.Add('Set In04 = :N1 ');
//              5:                  SQL.Add('Set In05 = :N1 ');
//              6:                  SQL.Add('Set In06 = :N1 ');
//              7:                  SQL.Add('Set In07 = :N1 ');
//              8:                  SQL.Add('Set In08 = :N1 ');
//              9:                  SQL.Add('Set In09 = :N1 ');
//              10:                 SQL.Add('Set In10 = :N1 ');
//              11:                 SQL.Add('Set In11 = :N1 ');
//              12:                 SQL.Add('Set In12 = :N1 ');
//              13:                 SQL.Add('Set In13 = :N1 ');
//              14:                 SQL.Add('Set In14 = :N1 ');
//              15:                 SQL.Add('Set In15 = :N1 ');
//              16:                 SQL.Add('Set In16 = :N1 ');
//              17:                 SQL.Add('Set In17 = :N1 ');
//              18:                 SQL.Add('Set In18 = :N1 ');
//              19:                 SQL.Add('Set In19 = :N1 ');
//              20:                 SQL.Add('Set In20 = :N1 ');
//              21:                 SQL.Add('Set In21 = :N1 ');
//              22:                 SQL.Add('Set In22 = :N1 ');
//              23:                 SQL.Add('Set In23 = :N1 ');
//            end;
//            SQL.Add('Where ParkNo = :N2 and UnitNo = :N3 and ProcDate = :N4');
//            Parameters.ParamByName('N1').Value := nInCnt;
//            Parameters.ParamByName('N2').Value := nCurrParkNo;
//            Parameters.ParamByName('N3').Value := nLprNo;
//            Parameters.ParamByName('N4').Value := Copy(sLprDate, 1, 10);
//            ExecSQL;
//            Close;
//          end
//          else
//          begin
//            Close;
//            SQL.Clear;
//            SQL.Add('Insert Into IONCount ');
//            SQL.Add('(ParkNo, UnitNo, ProcDate, In00, In01, In02, In03, In04, ');
//            SQL.Add('In05, In06, In07, In08, In09, In10, In11, In12, In13, In14, ');
//            SQL.Add('In15, In16, In17, In18, In19, In20, In21, In22, In23, Out00, ');
//            SQL.Add('Out01, Out02, Out03, Out04, Out05, Out06, Out07, Out08, Out09, ');
//            SQL.Add('Out10, Out11, Out12, Out13, Out14, Out15, Out16, Out17, Out18, ');
//            SQL.Add('Out19, Out20, Out21, Out22, Out23) Values ');
//            SQL.Add('(:N1, :N2, :N3, 0, 0, 0, 0, 0, 0, 0, ');
//            SQL.Add('0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ');
//            SQL.Add('0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)');
//            Parameters.ParamByName('N1').Value := nCurrParkNo;
//            Parameters.ParamByName('N2').Value := nLprNo;
//            Parameters.ParamByName('N3').Value := Copy(sLprDate, 1, 10);
//            ExecSQL;
//
//            Close;
//            SQL.Clear;
//            SQL.Add('UpDate IONCount ');
//
//            Case StrToInt(FormatDateTime('HH', Now)) of
//              0:                  SQL.Add('Set In00 = :N1 ');
//              1:                  SQL.Add('Set In01 = :N1 ');
//              2:                  SQL.Add('Set In02 = :N1 ');
//              3:                  SQL.Add('Set In03 = :N1 ');
//              4:                  SQL.Add('Set In04 = :N1 ');
//              5:                  SQL.Add('Set In05 = :N1 ');
//              6:                  SQL.Add('Set In06 = :N1 ');
//              7:                  SQL.Add('Set In07 = :N1 ');
//              8:                  SQL.Add('Set In08 = :N1 ');
//              9:                  SQL.Add('Set In09 = :N1 ');
//              10:                 SQL.Add('Set In10 = :N1 ');
//              11:                 SQL.Add('Set In11 = :N1 ');
//              12:                 SQL.Add('Set In12 = :N1 ');
//              13:                 SQL.Add('Set In13 = :N1 ');
//              14:                 SQL.Add('Set In14 = :N1 ');
//              15:                 SQL.Add('Set In15 = :N1 ');
//              16:                 SQL.Add('Set In16 = :N1 ');
//              17:                 SQL.Add('Set In17 = :N1 ');
//              18:                 SQL.Add('Set In18 = :N1 ');
//              19:                 SQL.Add('Set In19 = :N1 ');
//              20:                 SQL.Add('Set In20 = :N1 ');
//              21:                 SQL.Add('Set In21 = :N1 ');
//              22:                 SQL.Add('Set In22 = :N1 ');
//              23:                 SQL.Add('Set In23 = :N1 ');
//            end;
//            SQL.Add('Where ParkNo = :N2 and UnitNo = :N3 and ProcDate = :N4');
//            Parameters.ParamByName('N1').Value := 1;
//            Parameters.ParamByName('N2').Value := nCurrParkNo;
//            Parameters.ParamByName('N3').Value := nLprNo;
//            Parameters.ParamByName('N4').Value := Copy(sLprDate, 1, 10);
//            ExecSQL;
//          end;

          Close;
          SQL.Clear;
          Close;
          SQL.Clear;
          SQL.Add('Insert Into IONData ');
          SQL.Add('(ParkNo, UnitNo, ProcDate, ProcTime, TKNo, TKType, CarType, InImage1, InCarNo1, ');
          SQL.Add('InImage2, InCarNo2, Status, InRecog1, InRecog2) ');
          SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, :N12, :N13, :N14)');
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
          bSaveION := True;
          try
            if FileExists(sLprFile1) then
            begin
              with frmMain do
              begin
                TImage(FindComponent('imgIn' + IntToStr(nListCnt))).Picture.LoadFromFile(sLprFile1);
              end;
            end
            else
            begin
              with frmMain do
              begin
                TImage(FindComponent('imgIn' + IntToStr(nListCnt))).Picture.Assign(Nil);
              end;
              ExceptLogging('File 없음: ' + sLprFile1);
            end;
          except
            on E: Exception do
              ExceptLogging('이미지 로드 에러: ' + aString(E.Message));
          end;
          NormalLogging('미등록차량 입차: ' + sLprCarNo1 + ' - ' + sLprFile1);

          with frmMain do
          begin
            TLabeledEdit(FindComponent('edtInG' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
            TLabeledEdit(FindComponent('edtInG' + IntToStr(nListCnt))).Font.Color:= clRed;
            TLabeledEdit(FindComponent('edtInG' + IntToStr(nListCnt))).Text:= '일반';
            TLabeledEdit(FindComponent('edtInDong' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
            TLabeledEdit(FindComponent('edtInDong' + IntToStr(nListCnt))).Font.Color:= clRed;
            TLabeledEdit(FindComponent('edtInDong' + IntToStr(nListCnt))).Text:= '';
            TLabeledEdit(FindComponent('edtInCarNo' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
            TLabeledEdit(FindComponent('edtInCarNo' + IntToStr(nListCnt))).Font.Color:= clRed;
            TLabeledEdit(FindComponent('edtInCarNo' + IntToStr(nListCnt))).Text:= sLprCarNo1;
          end;

//          if bOpen then
//            InOpen(csLPR);

          if (bOpen) and (bFullCar = False)then   //만차일 경우 차단기 오픈 안함
            InOpen(csLPR);

          //21.09.29 만차일 경우 전광판 표출 여부
          if bFullCar then
          begin
            DspProc(1, 2, '만차입니다  ' + MG_Left(sLprCarNo1, 12), sDspIP);
          end
          else
          begin
            DspProc(1, 2, '  일반차량  ' + MG_Left(sLprCarNo1, 12), sDspIP);
          end;

          if nLprRecog1 = 1 then         //정상인식시 제이컴 전송
          begin
            //Added Woo.YH  제이컴 입차데이터 전송
//            JCOMInTime(sLprCarNo1, sTKNo, sLprDate, sLprTime, 0);
          end;
          //DspProc(1, 2, '  일반차량  ' + MG_Left(sLprCarNo1, 12), sDspIP);
        end;
      finally
        bNCInProcWait := False;
      end;
    end
    else if nLprInOut = 2 then
    begin
      // 출차처리...
      NormalOut(sLprFile1, sLprCarNo1, sLprFile2, sLprCarNo2, sIOTime,
                nLprNo, nLprInOut, nLprRecog1, nLprRecog2, sDspIP, csLPR, nListCnt);
    end;
  except
    on E: Exception do
      ExceptLogging('NormalProc: ' + aString(E.Message));
  end;
end;

procedure TfrmMain.HomeInfo_Proc(nInOut: Byte);
var
  sSend: aString;
  sShortCarNo, sSendLength: aString;
  nSendLength: Integer;
  i: Byte;
begin
  try
    //울산 신천 엠코타운 - 현대통신 세대통보
    sSend:= '';

    if MG_NumberCheck(sHomeInfo_Dong) and MG_NumberCheck(sHomeInfo_Ho) then
    begin
      //동, 호수가 숫자인 경우만 세대통보 전송하도록 한다.
      sSend:= 'Type=PARKING&Dong=' + sHomeInfo_Dong + '&Ho=' + sHomeInfo_Ho + '&CarNo=' + sHomeInfo_ShortCarNo + '&DateTime=' +
             FormatDateTime('YYYYMMDDHHNN', Now) + '&InOut=';

      Case nInOut of
        1: sSend:= sSend + 'IN';
        2: sSend:= sSend + 'OUT';
      end;
      sSend:= MG_InsZero(IntToStr(Length(sSend)), 8) + sSend;

      if idTC.Connected then
        idTC.Disconnect;

      idTC.Host:= sHomeInfo_IP;
      idTC.Port:= nHomeInfo_Port;

      if is_Ping(sHomeInfo_IP) then
      begin
        idTC.Connect;

        if idTC.Connected then
        begin
          idTC.Socket.WriteLnRFC(sSend, enUTF8);
          idTC.Disconnect;
        end;

        case nInOut of
          1: HomeInfoLogging('입차 세대통보 전송: ' + sHomeInfo_Dong + '동 ' + sHomeInfo_Ho + '호 ' + sHomeInfo_ShortCarNo);
          2: HomeInfoLogging('출차 세대통보 전송: ' + sHomeInfo_Dong + '동 ' + sHomeInfo_Ho + '호 ' + sHomeInfo_ShortCarNo);
        end;
      end
      else
        ExceptLogging(sHomeInfo_IP + '로 세대통보 전송시 네트워크 에러!');
    end;
  except
    on E: Exception do HomeInfoLogging('세대통보전송시 에러: ' + aString(E.Message));
  end;
end;

//type
//  TSendData = packed record
//    dong: WORD;
//    ho: WORD;
//    command: ansiChar;
//    length: WORD;
//    InDate: array[1..20] of ansiChar;
//    //: array[1..8] of ansiChar;
//    IOType: array[1..2] of ansiChar;
//    CarNo: array[1..4] of ansiChar;
//    Temp: array[1..9] of ansiChar;
//  end;
//var
//
//  sShortCarNo, sSendLength: aString;
//  i: Byte;
//  tmpPchr : Pchar;
//  // :array of byte;
//  SendData : TSendData;
//  SendBuff : TIdBytes;
//  tmpStr: String;
//  tmpCnt: Integer;
//begin
//  try
//    ExceptLogging('홈넷차량정보, 차량번호: ' + sHomeInfo_ShortCarNo + ' 동: ' + sHomeInfo_Dong + ' 호: ' + sHomeInfo_Ho);
//    //김해율하아파트 -  세대통보
//
//    sShortCarNo:= sHomeInfo_ShortCarNo;
//    if MG_NumberCheck(sHomeInfo_Dong) and MG_NumberCheck(sHomeInfo_Ho) then
//    begin
//
//    FillChar(SendData, sizeof(SendData), ' '); //공백으로 초기화
//
//      SendData.ho := Swap(strtoint(sHomeInfo_Ho));
//      SendData.dong := Swap(strtoint(sHomeInfo_Dong));
//      SendData.command := chr(1);
//      SendData.length := Swap(35);
//      tmpStr := FormatDateTime('YYYY-MM-DD,HH:NN:SS,', NOW);
//      for tmpCnt := 1 to 20 do
//        SendData.InDate[tmpCnt] := AnsiChar(tmpStr[tmpCnt]);
//      Case nInOut of
//        1: SendData.IOType := '0,';
//        2: SendData.IOType := '1,';
//      end;
////      Case cmbIO.ItemIndex of
////        0: SendData.IOType := '0,';
////        1: SendData.IOType := '1,';
////      end;
//      tmpStr := sShortCarNo;
//      for tmpCnt := 1 to 4 do
//        SendData.CarNo[tmpCnt] := AnsiChar(tmpStr[tmpCnt]);
//
//      SendData.Temp := ',00000000';
//
//      if idTC.Connected then
//        idTC.Disconnect;
//
//      idTC.Host:= sHomeInfo_IP;
//      idTC.Port:= nHomeInfo_Port;
//      if is_Ping(sHomeInfo_IP) then
//      begin
//        idTC.Connect;
//
//        if idTC.Connected then
//        begin
//          SendBuff := RawToBytes(SendData, SizeOf(SendData));
//          idTC.IOHandler.Write(SendBuff);
//          idTC.Disconnect;
//        end;
//        case nInOut of
//          1: HomeInfoLogging('입차 세대통보 전송: ' + sHomeInfo_Dong + '동 ' + sHomeInfo_Ho + '호 ' + sHomeInfo_ShortCarNo);
//          2: HomeInfoLogging('출차 세대통보 전송: ' + sHomeInfo_Dong + '동 ' + sHomeInfo_Ho + '호 ' + sHomeInfo_ShortCarNo);
//        end;
////        case cmbIO.ItemIndex of
////          0: HomeInfoLogging('입차 세대통보 전송: ' + edtDong.Text + '동 ' + edtHo.Text + '호 ' + edtCar.Text);
////          1: HomeInfoLogging('출차 세대통보 전송: ' + edtDong.Text + '동 ' + edtHo.Text + '호 ' + edtCar.Text);
////        end;
//      end
//      else
//        ExceptLogging(sHomeInfo_IP + '로 세대통보 전송시 네트워크 에러!');
//    end;
//  except
//    on E: Exception do HomeInfoLogging('세대통보전송시 에러: ' + aString(E.Message));
//  end;
//end;


function TfrmMain.RecvLprProc(sLprFile1, sLprCarNo1, sLprFile2, sLprCarNo2,
  sIOTime: aString; nLprNo, nLprInOut, nLprRecog1, nLprRecog2: Byte;
  sDspIP: aString; csLPR: TClientSocket; bOpen: Boolean; nListCnt: Byte): String;
var
  sRecv, sSend, sName: aString;
  nSTXPos, nETXPos, nParkNo, nUnitNo: Integer;

  sCardNo, sLastUseTime, sSTime, sETime, sCarNo, sMarkNo, sGroupName,
    sSCInDate, sSCInTime, sCompName, sDeptName, sExpDateF, sExpDateT, sLprDate,
    sLprTime, sTemp, sInFile, sHISTime, sHIETime: aString;
  nInOut, nStatus, nAPB, nWP, nSYoil, nEYoil, nCarNo, nGroupNo, nHIType: Integer;
  nLastUnitNo: Byte;
  nIBCRC: Word;
  bHoliday: Boolean;
  nUseFlag, nLastStatus: Byte;
begin
  try
    try
      bSCProcWait := True;
      bHomeInfo:= True;
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
      bHoliday := False;
      sLprDate := Copy(sIOTime, 1, 10);
      sLprTime := Copy(sIOTime, 12, 8);

      with dmTables.qryRecvLpr1 do
      begin
        Close;
        SQL.Clear;

        if sLprCarNo2 <> '' then
        begin
          SQL.Add('Select * from CustInfo where (CarNo = :N1) or (CarNo = :N2) and TKType = 2');
          Parameters.ParamByName('N1').Value := sLprCarNo1;
          Parameters.ParamByName('N2').Value := sLprCarNo2;
        end
        else
        begin
          SQL.Add('Select * from CustInfo where CarNo = :N1 and TKType = 2');
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
          nHIType:= FieldByName('HIType').AsInteger;
          sHISTime:= FieldByName('HISTime').AsString;
          sHIETime:= FieldByName('HIETime').AsString;
          sCarNo := FieldByName('CarNo').AsString;
          sHomeInfo_CarNo:= MG_StrTrim(sCarNo, ' ');

          nStatus := 1;
          nAPB    := 3;

          if Length(sHomeInfo_CarNo) >= 4 then
          begin
            sHomeInfo_ShortCarNo:= Copy(sHomeInfo_CarNo, Length(sHomeInfo_CarNo)-3, 4);

            if not MG_NumberCheck(sHomeInfo_ShortCarNo) then
              sHomeInfo_ShortCarNo:= '0000';
          end
          else
            sHomeInfo_ShortCarNo:= '0000';

          sHomeInfo_Dong:= MG_StrTrim(sCompName, ' ');
          sHomeInfo_Ho:= MG_StrTrim(sDeptName, ' ');

          Result := sLprDate + '^' + sLprTime + '^' + sCarNo + '^' + sName + '^' + sCompName + '^' + sDeptName + '^' + sExpDateT + '까지^';
        end;
      end;

      if (nInOut <> 1) or (nHIType = 2) or
         ((nHIType = 1) and ((sHISTime > FormatDateTime('HH:NN', Now)) or (sHIETime < FormatDateTime('HH:NN', Now)))) then
        bHomeInfo:= False;

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
          end;
        end;

        try
          if FileExists(sLprFile1) then
          begin
            if nInOut = 1 then
            begin
              with frmMain do
              begin
                ExceptLogging('정기차량 이미지 가져오기 시작');
                TImage(FindComponent('imgIn' + IntToStr(nListCnt))).Picture.LoadFromFile(sLprFile1);
                ExceptLogging('정기차량 이미지 가져오기 끝');
              end;
            end
            else
            if nInOut = 2 then
            begin
              with frmMain do
              begin
                TImage(FindComponent('imgOut' + IntToStr(nListCnt))).Picture.LoadFromFile(sLprFile1);
              end;
            end;
          end
          else
          begin
            if nInOut = 1 then
            begin
              with frmMain do
              begin
                TImage(FindComponent('imgIn' + IntToStr(nListCnt))).Picture.Assign(Nil);
              end;
            end
            else
            if nInOut = 2 then
            begin
              with frmMain do
              begin
                TImage(FindComponent('imgOut' + IntToStr(nListCnt))).Picture.Assign(Nil);
              end;
            end;

            ExceptLogging('File 없음: ' + sLprFile1);
          end;
        except
          on E: Exception do
            ExceptLogging('이미지 로드 에러: ' + aString(E.Message));
        end;

        // 현재 사용기간내에 있으면...
        if (sExpDateF <= FormatDateTime('YYYY-MM-DD', Now)) and (sExpDateT >= FormatDateTime('YYYY-MM-DD', Now)) then
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
                    DspProc(1, 1, MG_Left(sGroupName, 12) + MG_Left(sCarNo, 12), sDspIP);

                    if bOpen then
                      InOpen(csLPR);

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
                          SQL.Add('InIOStatusNo, InImage1, InCarNo2, InImage2, TKNo) ' );
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
                        DspProc(1, 1, 'APB위반차량 ' + MG_Left(sCarNo, 12), sDspIP);
                        bHomeInfo:= False;
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
                        DspProc(1, 1, MG_Left(sGroupName, 12) + MG_Left(sCarNo, 12), sDspIP);

                        if bOpen then
                          InOpen(csLPR);

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
                      DspProc(1, 1, MG_Left(sGroupName, 12) + MG_Left(sCarNo, 12), sDspIP);

                      if bOpen then
                        InOpen(csLPR);

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
                      {DspProc(1, 1, MG_Left(sGroupName, 12) + MG_Left(sCarNo, 12), sDspIP); //원래 전광판 표출
                      //DspProc(1, 1, MG_Left(sGroupName, 12) + MG_Left(sCarNo, 12), sDspIP);

                      Result := '1' + Result + '입 차'; }
                      if bOpen then
                        InOpen(csLPR);

                      if bFullCar then
                      begin
                        DspProc(1, 2, '만차입니다  ' + MG_Left(sCarNo, 12), sDspIP);
                        Result := '1' + Result + '만 차';
                      end
                      else
                      begin
                        DspProc(1, 1, MG_Left(sGroupName, 12) + MG_Left(sCarNo, 12), sDspIP);
                        Result := '1' + Result + '입 차';
                      end;
                    end;
                  end;

                2:
                  begin // 기간만료
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

                    DspProc(1, 1, MG_Left(sGroupName, 12) + MG_Left(sCarNo, 12), sDspIP);

                    if bOpen then
                      InOpen(csLPR);

                    Result := '1' + Result + '입 차';
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
                    bHomeInfo:= False;
                    DspProc(1, 1, '봉쇄차 량   ' + MG_Left(sCarNo, 12), sDspIP);
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
              bHomeInfo:= False;
              DspProc(1, 1, '사용시간위반' + MG_Left(sCarNo, 12), sDspIP);
              Result := '1' + Result + 'WP위반';
              ExceptLogging('##### 사용시간대(WP) 위반 #####');
            end;

//            if bHomeInfo then
//              HomeInfo_Proc(nInOut);

          end
          else if nInOut = 2 then // 출구용
          begin
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
                      SQL.Add('OutCarNo1, OutIOStatusNo, OutImage2, OutCarNo2, TKNo) ' );
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
                    DspProc(2, 1, MG_Left(sGroupName, 12) + MG_Left(sCarNo, 12), sDspIP);

                    if bOpen then
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
                          SQL.Add(
                            'Update CustInfo Set LastParkNo = :N1, LastUnitNo = :N2, ');
                          SQL.Add(
                            'LastUseDate = :N3, LastUseTime = :N4, IOStatusNo = :N5, ');
                          SQL.Add(
                            'Status = :N6 where ParkNo = :N7 and TKType = :N8 and CarNo = :N9');
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
                          SQL.Add(
                            'Select * from IOSData where ((InCarNo1 = :N1) or (InCarNo2 = :N2)) ');
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
                              SQL.Add(
                                'Update IOSData Set OutUnitNo = :N1, OutDate = :N2, OutTime = :N3, ');
                              SQL.Add(
                                'OutIOStatusNo = :N4, OutImage1 = :N5, OutCarNo1 = :N6, OutImage2 = :N12, OutCarNo2 = :N13 ');
                              SQL.Add(
                                'where ((InCarNo1 = :N7) or (InCarNo2 = :N11)) and ');
                              SQL.Add(
                                'ProcDate = :N8 and ProcTime = :N9 and UnitNo = :N10');
                              Parameters.ParamByName('N1').Value := nUnitNo;
                              Parameters.ParamByName('N2').Value := sLprDate;
                              Parameters.ParamByName('N3').Value := sLprTime;
                              Parameters.ParamByName('N4').Value := 8;
                              Parameters.ParamByName('N5').Value := sLprFile1;
                              Parameters.ParamByName('N6').Value := sLprCarNo1;
                              Parameters.ParamByName('N7').Value := sCarNo;
                              Parameters.ParamByName('N8').Value := sSCInDate;
                              Parameters.ParamByName('N9').Value := sSCInTime;
                              Parameters.ParamByName('N10').Value :=
                                nLastUnitNo;
                              Parameters.ParamByName('N11').Value := sCarNo;
                              Parameters.ParamByName('N12').Value := sLprFile2;
                              Parameters.ParamByName('N13').Value := sLprCarNo2;
                              ExecSQL;
                            end
                            else
                            begin
                              // 최종입차된 자료가 없다.  이때는 출차자료를 입차자료와 동일하게 Insert한다.
                              Close;
                              SQL.Clear;
                              SQL.Add(
                                'Insert Into IOSData (ParkNo, UnitNo, ProcDate, ProcTime, TKType, ');
                              SQL.Add(
                                'CarType, GroupNo, GroupName, CompName, DeptName, Name, InCarNo1, ');
                              SQL.Add(
                                'InIOStatusNo, InImage1, OutUnitNo, OutDate, OutTime, OutImage1, ');
                              SQL.Add(
                                'OutCarNo1, OutIOStatusNo, OutImage2, OutCarNo2, TKNo) ');
                              SQL.Add(
                                'Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, ');
                              SQL.Add(
                                ':N12, :N13, :N14, :N15, :N16, :N17, :N18, :N19, :N20, :N21, :N22, :N23)');
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
                        bHomeInfo:= False;
                        Result := '2' + Result + 'APB위반';
                        DspProc(2, 1, 'APB위반차량 ' + MG_Left(sCarNo, 12), sDspIP);
                      end
                      else
                      begin
                        with qryRecvLpr2 do
                        begin
                          Close;
                          SQL.Clear;
                          SQL.Add(
                            'Update CustInfo Set LastParkNo = :N1, LastUnitNo = :N2, ');
                          SQL.Add(
                            'LastUseDate = :N3, LastUseTime = :N4, IOStatusNo = :N5, ');
                          SQL.Add(
                            'Status = :N6 where ParkNo = :N7 and TKType = :N8 and CarNo = :N9');
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
                          SQL.Add(
                            'Select * from IOSData where ((InCarNo1 = :N1) or (InCarNo2 = :N2)) ');
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
                              SQL.Add(
                                'Update IOSData Set OutUnitNo = :N1, OutDate = :N2, OutTime = :N3, ');
                              SQL.Add(
                                'OutIOStatusNo = :N4, OutImage1 = :N5, OutCarNo1 = :N6, OutImage2 = :12, OutCarNo2 = :N13 ');
                              SQL.Add(
                                'where ((InCarNo1 = :N7) or (InCarNo2 = :N11)) and ');
                              SQL.Add(
                                'ProcDate = :N8 and ProcTime = :N9 and UnitNo = :N10');
                              Parameters.ParamByName('N1').Value := nUnitNo;
                              Parameters.ParamByName('N2').Value := sLprDate;
                              Parameters.ParamByName('N3').Value := sLprTime;
                              Parameters.ParamByName('N4').Value := 2;
                              Parameters.ParamByName('N5').Value := sLprFile1;
                              Parameters.ParamByName('N6').Value := sLprCarNo1;
                              Parameters.ParamByName('N7').Value := sCarNo;
                              Parameters.ParamByName('N8').Value := sSCInDate;
                              Parameters.ParamByName('N9').Value := sSCInTime;
                              Parameters.ParamByName('N10').Value :=
                                nLastUnitNo;
                              Parameters.ParamByName('N11').Value := sCarNo;
                              Parameters.ParamByName('N12').Value := sLprFile2;
                              Parameters.ParamByName('N13').Value := sLprCarNo2;
                              ExecSQL;
                            end
                            else
                            begin
                              // 최종입차된 자료가 없다.  이때는 출차자료를 입차자료와 동일하게 Insert한다.
                              Close;
                              SQL.Clear;
                              SQL.Add(
                                'Insert Into IOSData (ParkNo, UnitNo, ProcDate, ProcTime, TKType, ');
                              SQL.Add(
                                'CarType, GroupNo, GroupName, CompName, DeptName, Name, InCarNo1, ');
                              SQL.Add(
                                'InIOStatusNo, InImage1, OutUnitNo, OutDate, OutTime, OutImage1, ');
                              SQL.Add(
                                'OutCarNo1, OutIOStatusNo, OutImage2, OutCarNo2, TKNo) ');
                              SQL.Add(
                                'Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, ');
                              SQL.Add(
                                ':N12, :N13, :N14, :N15, :N16, :N17, :N18, :N19, :N20, :N21, :N22, :N23)');
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
                        DspProc(2, 1, MG_Left(sGroupName, 12) + MG_Left(sCarNo, 12), sDspIP);

                        if bOpen then
                          OutOpen(csLPR);
                      end
                    end
                    else if nAPB = 2 then // 1회조정
                    begin
                      with qryRecvLpr2 do
                      begin
                        Close;
                        SQL.Clear;
                        SQL.Add(
                          'Update CustInfo Set LastParkNo = :N1, LastUnitNo = :N2, ');
                        SQL.Add(
                          'LastUseDate = :N3, LastUseTime = :N4, IOStatusNo = :N5, Status = :N6 ');
                        SQL.Add(
                          'APB = :N10 where ParkNo = :N7 and TKType = :N8 and CarNo = :N9');
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
                        SQL.Add(
                          'Select * from IOSData where ((InCarNo1 = :N1) or (InCarNo2 = :N2)) ');
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
                            SQL.Add(
                              'Update IOSData Set OutUnitNo = :N1, OutDate = :N2, OutTime = :N3, ');
                            SQL.Add(
                              'OutIOStatusNo = :N4, OutImage1 = :N5, OutCarNo1 = :N6, OutImage2 = :N12, OutCarNo2 = :N13 ');
                            SQL.Add(
                              'where ((InCarNo1 = :N7) or (InCarNo2 = :N11)) and ');
                            SQL.Add(
                              'ProcDate = :N8 and ProcTime = :N9 and UnitNo = :N10');
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
                          end
                          else
                          begin
                            // 최종입차된 자료가 없다.  이때는 출차자료를 입차자료와 동일하게 Insert한다.
                            Close;
                            SQL.Clear;
                            SQL.Add(
                              'Insert Into IOSData (ParkNo, UnitNo, ProcDate, ProcTime, TKType, ');
                            SQL.Add(
                              'CarType, GroupNo, GroupName, CompName, DeptName, Name, InCarNo1, ');
                            SQL.Add(
                              'InIOStatusNo, InImage1, OutUnitNo, OutDate, OutTime, OutImage1, ');
                            SQL.Add(
                              'OutCarNo1, OutIOStatusNo, OutImage2, OutCarNo2, TKNo) ');
                            SQL.Add(
                              'Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, ');
                            SQL.Add(
                              ':N12, :N13, :N14, :N15, :N16, :N17, :N18, :N19, :N20, :N21, :N22, :N23)');
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
                      DspProc(2, 1, MG_Left(sGroupName, 12) + MG_Left(sCarNo, 12), sDspIP);

                      if bOpen then
                        OutOpen(csLPR);
                    end
                    else if nAPB = 3 then // 사용안함
                    begin
                      with qryRecvLpr2 do
                      begin
                        Close;
                        SQL.Clear;
                        SQL.Add(
                          'Update CustInfo Set LastParkNo = :N1, LastUnitNo = :N2, ');
                        SQL.Add(
                          'LastUseDate = :N3, LastUseTime = :N4, IOStatusNo = :N5, ');
                        SQL.Add(
                          'Status = :N6 where ParkNo = :N7 and TKType = :N8 and CarNo = :N9');
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
                        SQL.Add(
                          'Select * from IOSData where ((InCarNo1 = :N1) or (InCarNo2 = :N2)) ');
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
                            SQL.Add(
                              'Update IOSData Set OutUnitNo = :N1, OutDate = :N2, OutTime = :N3, ');
                            SQL.Add(
                              'OutIOStatusNo = :N4, OutImage1 = :N5, OutCarNo1 = :N6, OutImage2 = :N12, OutCarNo2 = :N13 ');
                            SQL.Add(
                              'where ((InCarNo1 = :N7) or (InCarNo2 = :N11)) and ');
                            SQL.Add(
                              'ProcDate = :N8 and ProcTime = :N9 and UnitNo = :N10');
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
                          end
                          else
                          begin
                            // 최종입차된 자료가 없다.  이때는 출차자료를 입차자료와 동일하게 Insert한다.
                            Close;
                            SQL.Clear;
                            SQL.Add(
                              'Insert Into IOSData (ParkNo, UnitNo, ProcDate, ProcTime, TKType, ');
                            SQL.Add(
                              'CarType, GroupNo, GroupName, CompName, DeptName, Name, InCarNo1, ');
                            SQL.Add(
                              'InIOStatusNo, InImage1, OutUnitNo, OutDate, OutTime, OutImage1, ');
                            SQL.Add(
                              'OutCarNo1, OutIOStatusNo, OutImage2, OutCarNo2, TKNo) ');
                            SQL.Add(
                              'Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, ');
                            SQL.Add(
                              ':N12, :N13, :N14, :N15, :N16, :N17, :N18, :N19, :N20, :N21, :N22, :N23)');
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
                      DspProc(2, 1, MG_Left(sGroupName, 12) + MG_Left(sCarNo, 12), sDspIP);

                      if bOpen then
                        OutOpen(csLPR);
                    end;
                  end;

               2:
                begin // 기간만료
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

                  DspProc(2, 1, MG_Left(sGroupName, 12) + MG_Left(sCarNo, 12), sDspIP);

                  OutOpen(csLPR);
                end;

                3, 5:
                  begin // 전체봉쇄, 출차봉쇄
                    with qryRecvLpr2 do
                    begin
                      Close;
                      SQL.Clear;
                      SQL.Add(
                        'Update CustInfo Set LastParkNo = :N1, LastUnitNo = :N2, ');
                      SQL.Add(
                        'LastUseDate = :N3, LastUseTime = :N4, IOStatusNo = :N5 ');
                      SQL.Add(
                        'where ParkNo = :N6 and TKType = :N7 and CarNo = :N8');
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
                      SQL.Add(
                        'Select * from IOSData where ((InCarNo1 = :N1) or (InCarNo2 = :N2)) ');
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
                          SQL.Add('where ((InCarNo1 = :N7) or (InCarNo2 = :N11)) and ');
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
                        end
                        else
                        begin
                          // 최종입차된 자료가 없다.  이때는 출차자료를 입차자료와 동일하게 Insert한다.
                          Close;
                          SQL.Clear;
                          SQL.Add(
                            'Insert Into IOSData (ParkNo, UnitNo, ProcDate, ProcTime, TKType, ');
                          SQL.Add(
                            'CarType, GroupNo, GroupName, CompName, DeptName, Name, InCarNo1, ');
                          SQL.Add(
                            'InIOStatusNo, InImage1, OutUnitNo, OutDate, OutTime, OutImage1, ');
                          SQL.Add(
                            'OutCarNo1, OutIOStatusNo, OutImage2, OutCarNo2, TKNo) ');
                          SQL.Add(
                            'Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, ');
                          SQL.Add(
                            ':N12, :N13, :N14, :N15, :N16, :N17, :N18, :N19, :N20, :N21, :N22, :N23)');
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
                    bHomeInfo:= False;
                    Result := '2' + Result + '봉쇄중';
                    DspProc(2, 1, '  봉쇄차량  ' + MG_Left(sCarNo, 12), sDspIP);
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
                SQL.Add(
                  'Update CustInfo Set LastParkNo = :N1, LastUnitNo = :N2, ');
                SQL.Add(
                  'LastUseDate = :N3, LastUseTime = :N4, IOStatusNo = :N5 ');
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
                SQL.Add(
                  'Select * from IOSData where ((InCarNo1 = :N1) or (InCarNo2 = :N2)) Order By ProcDate Desc, ProcTime Desc');
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
                    SQL.Add(
                      'Update IOSData Set OutUnitNo = :N1, OutDate = :N2, OutTime = :N3, ');
                    SQL.Add(
                      'OutIOStatusNo = :N4, OutImage1 = :N5, OutCarNo1 = :N6, OutImage2 = :N12, OutCarNo2 = :N13 ');
                    SQL.Add
                      ('where ((InCarNo1 = :N7) or (InCarNo2 = :N11)) and ');
                    SQL.Add(
                      'ProcDate = :N8 and ProcTime = :N9 and UnitNo = :N10');
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
                  end
                  else
                  begin
                    // 최종입차된 자료가 없다.  이때는 출차자료를 입차자료와 동일하게 Insert한다.
                    Close;
                    SQL.Clear;
                    SQL.Add(
                      'Insert Into IOSData (ParkNo, UnitNo, ProcDate, ProcTime, TKType, ');
                    SQL.Add(
                      'CarType, GroupNo, GroupName, CompName, DeptName, Name, InCarNo1, ');
                    SQL.Add(
                      'InIOStatusNo, InImage1, OutUnitNo, OutDate, OutTime, OutImage1, ');
                    SQL.Add(
                      'OutCarNo1, OutIOStatusNo, OutImage2, OutCarNo2, TKNo) ');
                    SQL.Add(
                      'Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, ');
                    SQL.Add(
                      ':N12, :N13, :N14, :N15, :N16, :N17, :N18, :N19, :N20, :N21, :N22, :N23)');
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
              bHomeInfo:= False;
              Result := '2' + Result + '시간위반';
              DspProc(2, 1, '사용시간위반' + MG_Left(sCarNo, 12), sDspIP);
              ExceptLogging('##### 사용시간대(WP) 위반(출차) #####');
            end;
          end;

//          if bHomeInfo then
//            HomeInfo_Proc(nInOut);
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
            SQL.Add(
              'Select * from IOSData where ((InCarNo1 = :N1) or (InCarNo2 = :N2)) Order By ProcDate Desc, ProcTime Desc');
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
                SQL.Add(
                  'Update IOSData Set OutUnitNo = :N1, OutDate = :N2, OutTime = :N3, ');
                SQL.Add(
                  'OutIOStatusNo = :N4, OutImage1 = :N5, OutCarNo1 = :N6, OutImage2 = :N12, OutCarNo2 = :N13 ');
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
              end
              else
              begin
                // 최종입차된 자료가 없다.  이때는 출차자료를 입차자료와 동일하게 Insert한다.
                Close;
                SQL.Clear;
                SQL.Add(
                  'Insert Into IOSData (ParkNo, UnitNo, ProcDate, ProcTime, TKType, ');
                SQL.Add(
                  'CarType, GroupNo, GroupName, CompName, DeptName, Name, InCarNo1, ');
                SQL.Add(
                  'InIOStatusNo, InImage1, OutUnitNo, OutDate, OutTime, OutImage1, ');
                SQL.Add
                  ('OutCarNo1, OutIOStatusNo, OutImage2, OutCarNo2, TKNo) ');
                SQL.Add(
                  'Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, ');
                SQL.Add(
                  ':N12, :N13, :N14, :N15, :N16, :N17, :N18, :N19, :N20, :N21, :N22, :N23)');
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
            Result := '1' + Result + '기간만료';
            DspProc(1, 1, '사용기간위반' + MG_Left(sCarNo, 12), sDspIP);
          end
          else if nInOut = 2 then
          begin
            Result := '2' + Result + '기간만료';
            DspProc(2, 1, '사용기간위반' + MG_Left(sCarNo, 12), sDspIP);
          end;
          ExceptLogging('##### 사용기간 오류 - 사용시작일: ' + sExpDateF + ', 사용종료일: ' +
              sExpDateT + ' #####');
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

procedure TfrmMain.ICMPReply(ASender: TComponent; const ReplyStatus: TReplyStatus);
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

procedure TfrmMain.idTSExecute(AContext: TIdContext);
var
  sRecv: Char;
  sip: aString;
  i: Integer;
begin
  try
    sRecv:= AContext.Connection.IOHandler.ReadChar(enDefault);
    sip:= AContext.Binding.PeerIP;
    sRecvHomeServer:= sRecv;

    for i := 1 to AContext.Connection.IOHandler.InputBuffer.Size do
      sRecvHomeServer:= sRecvHomeServer + AContext.Connection.IOHandler.ReadChar(enDefault);

    ExceptLogging('<단지서버 수신데이터(' + sIP + ') ' + sRecvHomeServer);
  except
    on E: EIdSocketError do
    begin
      if E.LastError <> 10054 then ExceptLogging('TfrmMain.idTSExecute: ' + E.Message);
      Exit;
    end;

    on E: EIdConnClosedGracefully do Exit;

    on E: Exception do ExceptLogging('TfrmMain.idTSExecute: ' + E.Message);
  end;
end;

{
function TfrmMain.is_ping(IP: AnsiString): Boolean;
begin
  Result := False;
  try
    with ICMP do
    begin
      OnReply := ICMPReply;
      ReceiveTimeOut := 2000;
      Host := wString(IP);
      Ping;
    end;
    Result := ping_success;
  except
    on E: Exception do
      ExceptLogging('TfrmMain.is_ping: ' + aString(E.Message));
  end;
end;
}

function TfrmMain.is_Ping(ip: AnsiString): Boolean;
var
   Handle : THandle;
   DW : DWORD;
   REP : ICMPECHO;
   IPLong: LongInt;
begin
     //Result := -1;
     Result:= False;
     //ExceptLogging('Ping 시간 체크1-' + IntToStr(GetTickCount));

     Handle := IcmpCreateFile;

     if Handle = INVALID_HANDLE_VALUE then Exit;

     IPLong := inet_addr(PAnsiChar( ip ));
     DW := IcmpSendEcho(Handle, IPLong, nil, 0, nil, @rep, Sizeof(Rep), nPingTimeOut );

     //Result := rep.Status;

     if rep.status = 0 then
       Result:= True
     else
       Result:= False;

     //ExceptLogging('Ping 시간 체크2-' + IntToStr(GetTickCount));
     IcmpCloseHandle(Handle);
end;

function TfrmMain.JCOMInTime(_sInCarNo, _sTKNo, _sInDate, _sInTime: AnsiString;
  _nCartype: Integer): string;
var
  sSendData, sRecv : string;
  sJcomIP, sJComPort, sJcomParkID : string;//제이컴 아이피, 포트 , 주차장고유번호
  ssRecv : TStringStream;
begin
try
  ssRecv := TStringStream.Create('');
  _sInDate := StringReplace(_sInDate, '-', '', [rfReplaceAll]);
  _sInTime := StringReplace(_sInTime, ':', '', [rfReplaceAll]);

  with qryMainTemp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from ParkInfo');
    open;
    sJcomParkID := FieldByName('JComPN').AsString;
  end;

  sJcomIP   := iSetup.ReadString('PARKING', 'JCom IP', '');
  sJcomPort := iSetup.ReadString('PARKING', 'JCom Port', '');

  sSendData := 'http://' + sJcomIP + ':' + sJComPort + '/PMS/lpr.do?param={';
  sSendData := sSendData + 'SERVICENAME|PARKIN_TIME,';              //서비스명
  sSendData := sSendData + 'CARNO|' + _sInCarNo + ',';              //차량번호
  sSendData := sSendData + 'SERIALNO|' + _sTKNo + ',';              //고유키
  sSendData := sSendData + 'INDATE|'   + _sInDate + _sInTime + ','; //입차일시 YYYYMMDDHHMMSS

  sSendData := sSendData + 'PARKID|'   +  sJcomParkID;              //주차장고유번호
//  sSendData := sSendData + 'CARTYPE|'   +  '1';                     // 0이면 경차 1이면 일반 (구리한강시민공원만 경차인식기)  =>>> 빼달라고 함
  sSendData := sSendData + '}';

  idhtpJCom.Get(TIdURI.ParamsEncode(sSendData), ssRecv);
  sRecv := TEncoding.UTF8.GetString(ssRecv.Bytes, 0 , ssRecv.Size);
  FreeAndNil(ssRecv);

  ExceptLogging('TfrmMainNew.JCOMInTime: 송신전문 ' + sSendData);

  ExceptLogging('TfrmMainNew.JCOMInTime: 수신전문 ' + sRecv);

  except
    on E: Exception do
      ExceptLogging('TfrmMainNew.JCOMInTime: ' + aString(E.Message));
  end;
end;

procedure TfrmMain.btnBar1Click(Sender: TObject);
begin
  UnitCtrl(1, btnBar1.ImageIndex, btnBar1.Tag, nCurrMNo, '');
end;

procedure TfrmMain.btnBar2Click(Sender: TObject);
begin
  UnitCtrl(1, btnBar2.ImageIndex, btnBar2.Tag, nCurrMNo, '');
end;

procedure TfrmMain.btnBar3Click(Sender: TObject);
begin
  UnitCtrl(1, btnBar3.ImageIndex, btnBar3.Tag, nCurrMNo, '');
end;

procedure TfrmMain.btnBar4Click(Sender: TObject);
begin
  UnitCtrl(1, btnBar4.ImageIndex, btnBar4.Tag, nCurrMNo, '');
end;

procedure TfrmMain.btnBarCloseClick(Sender: TObject);
begin
  pnBar.Visible := False;
end;

procedure TfrmMain.btnCloseClick(Sender: TObject);
begin
  btnManualSCIn.Enabled:= False;
  btnManualSCOut.Enabled := False;
  dmTables.qrySCSearch.Close;
  pnManualProc.Visible:= False;
end;

procedure TfrmMain.btnHomeInfoTestClick(Sender: TObject);
var
  sSend: aString;
  sShortCarNo, sSendLength: aString;
  nSendLength: Integer;
  i: Byte;
begin
  try
    //울산 신천 엠코타운 - 현대통신 세대통보
    sSend:= '';
    sShortCarNo:= Copy(edtCar.Text, Length(aString(edtCar.Text))-3, 4);

    if MG_NumberCheck(edtDong.Text) and MG_NumberCheck(edtHo.Text) then
    begin
      //동, 호수가 숫자인 경우만 세대통보 전송하도록 한다.
      sSend:= 'Type=PARKING&Dong=' + edtDong.Text + '&Ho=' + edtHo.Text +
              '&CarNo=' + sShortCarNo + '&DateTime=' +
             FormatDateTime('YYYYMMDDHHNN', Now) + '&InOut=';

      Case cmbIO.ItemIndex of
        0: sSend:= sSend + 'IN';
        1: sSend:= sSend + 'OUT';
      end;
      sSend:= MG_InsZero(IntToStr(Length(sSend)), 8) + sSend;

      if idTC.Connected then
        idTC.Disconnect;

      idTC.Host:= sHomeInfo_IP;
      idTC.Port:= nHomeInfo_Port;

      if is_Ping(sHomeInfo_IP) then
      begin
        idTC.Connect;

        if idTC.Connected then
        begin
          idTC.Socket.WriteLnRFC(sSend, enUTF8);
          idTC.Disconnect;
        end;

        case cmbIO.ItemIndex of
          0: HomeInfoLogging('입차 세대통보 전송: ' + edtDong.Text + '동 ' +
                              edtHo.Text + '호 ' + edtCar.Text);
          1: HomeInfoLogging('출차 세대통보 전송: ' + edtDong.Text + '동 ' +
                             edtHo.Text + '호 ' + edtCar.Text);
        end;
      end
      else
        ExceptLogging(sHomeInfo_IP + '로 세대통보 전송시 네트워크 에러!');
    end
    else
    begin
      ShowMessage('동, 호 정보는 숫자로 입력되어야 합니다.');
      edtDong.SetFocus;
    end;
  except
    on E: Exception do HomeInfoLogging('세대통보전송시 에러: ' + aString(E.Message));
  end;
end;
//type
//  TSendData = packed record
//    dong: WORD;
//    ho: WORD;
//    command: ansiChar;
//    length: WORD;
//    InDate: array[1..20] of ansiChar;
//    //: array[1..8] of ansiChar;
//    IOType: array[1..2] of ansiChar;
//    CarNo: array[1..4] of ansiChar;
//    Temp: array[1..9] of ansiChar;
//  end;

//var
//  sShortCarNo, sSendLength: aString;
//  i: Byte;
//  tmpPchr : Pchar;
//  // :array of byte;
//  SendData : TSendData;
//  SendBuff : TIdBytes;
//tmpStr: String;
//  tmpCnt: Integer;
//  try
//    //김해율하아파트 -  세대통보
//
//    sShortCarNo:= Copy(edtCar.Text, Length(aString(edtCar.Text))-4, 4);
//    if MG_NumberCheck(edtDong.Text) and MG_NumberCheck(edtHo.Text) then
//    begin
//
//    FillChar(SendData, sizeof(SendData), ' '); //공백으로 초기화
//
//      SendData.ho := Swap(strtoint(edtHo.Text));
//      SendData.dong := Swap(strtoint(edtDong.Text));
//      SendData.command := chr(1);
//      SendData.length := Swap(35);
//      tmpStr := FormatDateTime('YYYY-MM-DD,HH:NN:SS,', NOW);
//      for tmpCnt := 1 to 20 do
//        SendData.InDate[tmpCnt] := AnsiChar(tmpStr[tmpCnt]);
//
//      Case cmbIO.ItemIndex of
//        0: SendData.IOType := '0,';
//        1: SendData.IOType := '1,';
//      end;
//      tmpStr := sShortCarNo;
//      for tmpCnt := 1 to 4 do
//        SendData.CarNo[tmpCnt] := AnsiChar(tmpStr[tmpCnt]);
//
////      SendData.CarNo := sShortCarNo;
//      SendData.Temp := ',00000000';
//
//      if idTC.Connected then
//        idTC.Disconnect;
//
//      idTC.Host:= sHomeInfo_IP;
//      idTC.Port:= nHomeInfo_Port;
//      if is_Ping(sHomeInfo_IP) then
//      begin
//        idTC.Connect;
//
//        if idTC.Connected then
//        begin
//          SendBuff := RawToBytes(SendData, SizeOf(SendData));
//          idTC.IOHandler.Write(SendBuff);
//          idTC.Disconnect;
//        end;
//
//        case cmbIO.ItemIndex of
//          0: HomeInfoLogging('입차 세대통보 전송: ' + edtDong.Text + '동 ' + edtHo.Text + '호 ' + edtCar.Text);
//          1: HomeInfoLogging('출차 세대통보 전송: ' + edtDong.Text + '동 ' + edtHo.Text + '호 ' + edtCar.Text);
//        end;
//      end
//      else
//        ExceptLogging(sHomeInfo_IP + '로 세대통보 전송시 네트워크 에러!');
//    end
//    else
//    begin
//      ShowMessage('동, 호 정보는 숫자로 입력되어야 합니다.');
//      edtDong.SetFocus;
//    end;
//  except
//    on E: Exception do HomeInfoLogging('세대통보전송시 에러: ' + aString(E.Message));
//  end;



procedure TfrmMain.btnManualSCInClick(Sender: TObject);
var
  sResult, sTime, sTemp, sDspIP: aString;
  i, nIO, nListCnt: Byte;
begin
  try
    // 정기차량 수동출차
    for i := 1 to 10 do
    begin
      if RLpr[i].nUnitNo = csInLpr1.Tag then
      begin
        sDspIP := RLpr[i].sDspIP;
        nIO := RLpr[i].nIO;
        nListCnt:= RLpr[i].nLprCnt;
        Break;
      end;
    end;
    sOutLprCarNo := sManualSCCarNo;
    sTime := FormatDateTime('YYYY-MM-DD HH:NN:SS', Now);

    if nIO = 1 then
      sResult := RecvLprProc(sInMiFile, sOutLprCarNo, '', '', sTime,
                             csInLpr1.Tag, nIO, 3, 3, sDspIP, csInLpr1, True, nListCnt)
    else
      sResult := RecvLprProc(sOutMiFile, sOutLprCarNo, '', '', sTime,
                             csOutLpr1.Tag, nIO, 3, 3, sDspIP, csOutLpr1, True, nListCnt);

    GridData(nIO, nListCnt, sResult);
    edtManualProcCarNo.Text:= '';
    btnManualSCIn.Enabled:= False;
    btnManualSCOut.Enabled:= False;
    dmTables.qrySCSearch.Close;
    pnManualProc.Visible := False;
  except
    on E: Exception do
      ExceptLogging('TfrmMain.btnSCInClick: ' + aString(E.Message));
  end;
end;

procedure TfrmMain.btnManualSCOutClick(Sender: TObject);
var
  sResult, sTime, sTemp, sDspIP: aString;
  i, nIO, nListCnt: Byte;
begin
  try
    // 정기차량 수동출차
    for i := 1 to 10 do
    begin
      if RLpr[i].nUnitNo = csOutLpr1.Tag then
      begin
        sDspIP := RLpr[i].sDspIP;
        nIO := RLpr[i].nIO;
        nListCnt:= RLpr[i].nLprCnt;
        Break;
      end;
    end;
    sOutLprCarNo := sManualSCCarNo;
    sTime := FormatDateTime('YYYY-MM-DD HH:NN:SS', Now);

    if nIO = 1 then
      sResult := RecvLprProc(sInMiFile, sOutLprCarNo, '', '', sTime,
                             csInLpr1.Tag, nIO, 3, 3, sDspIP, csInLpr1, True, nListCnt)
    else
      sResult := RecvLprProc(sOutMiFile, sOutLprCarNo, '', '', sTime,
                             csOutLpr1.Tag, nIO, 3, 3, sDspIP, csOutLpr1, True, nListCnt);

    GridData(nIO, nListCnt, sResult);
    edtManualProcCarNo.Text:= '';
    btnManualSCIn.Enabled:= False;
    btnManualSCOut.Enabled:= False;
    dmTables.qrySCSearch.Close;
    pnManualProc.Visible := False;
  except
    on E: Exception do
      ExceptLogging('TfrmMain.btnSCOutClick: ' + aString(E.Message));
  end;
end;

procedure TfrmMain.btnManualSeekClick(Sender: TObject);
var
  sIn, sResult, sTime, sTemp: aString;
  sDspIP: aString;
  i: Byte;
begin
  try
    if edtManualProcCarNo.Text = '' then
    begin
      ShowMessage('차량번호를 입력하여주세요!');
      edtManualProcCarNo.SetFocus;
      Exit;
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
        sManualSCCarNo := dmTables.qrySCSearch.FieldByName('CarNo').AsString;
        dgManual.SetFocus;
      end
      else
      begin
        sManualSCCarNo := '';
      end;
    end;
  except
    on E: Exception do
      ExceptLogging('TfrmMain.btnManualSeekClick: ' + E.Message);
  end;
end;

procedure TfrmMain.btnSCCancelClick(Sender: TObject);
begin
  sManualSCCarNo := '';
  btnSCIn.Enabled:= False;
  btnSCOut.Enabled:= False;
  edtSCCarNo.Text:= '';
  pnSCSearch.Visible := False;
end;

procedure TfrmMain.btnSCClick(Sender: TObject);
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
      ExceptLogging('TfrmMain.btnSCClick: ' + aString(E.Message));
  end;
end;

procedure TfrmMain.btnSCInClick(Sender: TObject);
var
  sResult, sTime, sTemp, sDspIP: aString;
  i, nIO, nListCnt: Byte;
begin
  try
    // 정기차량 수동출차
    for i := 1 to 10 do
    begin
      if RLpr[i].nUnitNo = csInLpr1.Tag then
      begin
        sDspIP := RLpr[i].sDspIP;
        nIO:= RLpr[i].nIO;
        nListCnt:= RLpr[i].nLprCnt;
        Break;
      end;
    end;
    sOutLprCarNo := sManualSCCarNo;
    sTime := FormatDateTime('YYYY-MM-DD HH:NN:SS', Now);

    if nIO = 1 then
      sResult := RecvLprProc(sInMiFile, sOutLprCarNo, '', '', sTime,
                             csInLpr1.Tag, nIO, 3, 3, sDspIP, csInLpr1, True, nListCnt)
    else
      sResult := RecvLprProc(sOutMiFile, sOutLprCarNo, '', '', sTime,
                             csOutLpr1.Tag, nIO, 3, 3, sDspIP, csOutLpr1, True, nListCnt);

    GridData(nIO, nListCnt, sResult);
    edtSCCarNo.Text:= '';
    btnSCIn.Enabled:= False;
    btnSCOut.Enabled := False;
    dmTables.qrySCSearch.Close;
    pnSCSearch.Visible := False;
  except
    on E: Exception do
      ExceptLogging('TfrmMain.btnSCInClick: ' + aString(E.Message));
  end;
end;

procedure TfrmMain.btnSCOutClick(Sender: TObject);
var
  sResult, sTime, sTemp, sDspIP: aString;
  i, nIO, nListCnt: Byte;
begin
  try
    // 정기차량 수동출차
    for i := 1 to 10 do
    begin
      if RLpr[i].nUnitNo = csOutLpr1.Tag then
      begin
        sDspIP := RLpr[i].sDspIP;
        nIO:= RLpr[i].nIO;
        nListCnt:= RLpr[i].nLprCnt;
        Break;
      end;
    end;
    sOutLprCarNo := sManualSCCarNo;
    sTime := FormatDateTime('YYYY-MM-DD HH:NN:SS', Now);

    if nIO = 1 then
      sResult := RecvLprProc(sInMiFile, sOutLprCarNo, '', '', sTime,
                             csInLpr1.Tag, nIO, 3, 3, sDspIP, csInLpr1, True, nListCnt)
    else
      sResult := RecvLprProc(sOutMiFile, sOutLprCarNo, '', '', sTime,
                             csOutLpr1.Tag, nIO, 3, 3, sDspIP, csOutLpr1, True, nListCnt);

    GridData(nIO, nListCnt, sResult);
    edtSCCarNo.Text:= '';
    btnSCIn.Enabled:= False;
    btnSCOut.Enabled := False;
    dmTables.qrySCSearch.Close;
    pnSCSearch.Visible := False;
  except
    on E: Exception do
      ExceptLogging('TfrmMain.btnSCOutClick: ' + aString(E.Message));
  end;
end;

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  pnHomeInfo.Visible:= False;
end;

procedure TfrmMain.ComPrnTriggerAvail(CP: TObject; Count: Word);
var
  sRecv: AnsiString;
  i: Integer;
begin
  try
    //HomeInfoLogging('경차센서 데이터' + toHex(ComPrn.GetChar));
    sRecv:= '';

    for i:= 1 to Count do
      sRecv:= sRecv + ComPrn.GetChar;
//    HomeInfoLogging('경차센서 데이터' + sRecv);
    sRecvTD:= sRecvTD + sRecv;

    if Pos(STX, sRecvTD) <= 0 then Exit;

    sRecvTD:= Copy(sRecvTD, Pos(STX, sRecvTD), Length(sRecvTD)-(Pos(STX, sRecvTD)-1));

    if Pos(ETX, sRecvTD) <= 0 then Exit;
    prDelay(50);
    if not bCount then
    begin
       nGCount := 0;
    end;
    HomeInfoLogging('< 발권기 데이터 수신: ' + sRecvTD);
    if bSaveION then
    begin
      HomeInfoLogging('< 일반차량 입차 데이터 저장');
    end;
    if Copy(sRecvTD, Pos(DC5, sRecvTD)+1, 2) = '00' then
    begin
      if bCount then
      begin
        if  nGCount < nGCountInterval  then
        begin
          ComPrn.PutString(ReadInPutSignal);
          HomeInfoLogging('< 일반차 데이터 카운터: ' +inttostr(nGCount));
          nGCount := nGCount + 1;
        end;
      end;
      HomeInfoLogging('< 일반차 데이터 수신: ' + toHex(sRecvTD));
      //TDRecvProc(sRecvTD);
    end
    else
    if Copy(sRecvTD, Pos(DC5, sRecvTD)+1, 2) = '10' then
    begin
      HomeInfoLogging('< 경차 데이터 수신: ' + toHex(sRecvTD));
      //업데이트 처리
      with dmTables.qryNormal do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select * from IONData where TKNo = :N1 ');
        Parameters.ParamByName('N1').Value := sGTKNo;
        Open;
        if RecordCount > 0 then
        begin
          Close;
          SQL.Clear;
          SQL.Add('Update IONData ');
          SQL.Add('Set CarType = :N1 where TKNo = :N2');
          Parameters.ParamByName('N1').Value := 0;
          Parameters.ParamByName('N2').Value := sGTKNo;
          ExecSQL;
          Close;
          bCount := False;
        end;
      end;
    end
    else
    if Copy(sRecvTD, Pos(DC5, sRecvTD)+1, 2) = '01' then
    begin
      if bCount then
      begin
        if  nGCount < nGCountInterval  then
        begin
          ComPrn.PutString(ReadInPutSignal);
          HomeInfoLogging('< 일반차 데이터 카운터: ' +inttostr(nGCount));
          nGCount := nGCount + 1;
        end;
      end;
      HomeInfoLogging('< 대형차 데이터 수신처리 안함: ' + toHex(sRecvTD));
      //업데이트 처리
//      with dmTables.qryNormal do
//      begin
//        Close;
//        SQL.Clear;
//        SQL.Add('select * from IONData where TKNo = :N1 ');
//        Parameters.ParamByName('N1').Value := sGTKNo;
//        Open;
//        if RecordCount > 0 then
//        begin
//          Close;
//          SQL.Clear;
//          SQL.Add('Update IONData ');
//          SQL.Add('Set CarType = :N1 where TKNo = :N2');
//          Parameters.ParamByName('N1').Value := 3;
//          Parameters.ParamByName('N2').Value := sGTKNo;
//          ExecSQL;
//          Close;
//          bCount := False;
//        end;
//      end;
    end;
    sRecvTD:= '';
  except
    on E: Exception do ExceptLogging('TfrmMain.comTDTriggerAvail: ' + E.Message);
  end;
end;

procedure TfrmMain.csDspError(Sender: TObject; Socket: TCustomWinSocket;
  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
var
  tmpCnt: Integer;
  tmpErrorCd: Integer;
  tmpMsg: String;
begin
  tmpErrorCd := ErrorCode;
  tmpMsg := '';

  Case ErrorCode of
    10049 : tmpMsg := '컨넥트 하려는 주소가 잘못';
    10053 : tmpMsg := '소프트웨어 때문에 연결이 중단되었습니다';
    10054 : tmpMsg := '상대편에 의해 연결이 강제로 종료되었을 경우 발생하는 오류';
    10060 : tmpMsg := '네트워크 타임아웃';
    10061 : tmpMsg := '서버가 죽었거나 클라이언트에서 접속환경이 잘못되었을때 나타나는 현상';
  else tmpMsg := '네트워크 기타 에러';
  end;
  ErrorCode := 0;

  ExceptLogging('SocketError > ErrorNo: [' + IntToStr(tmpErrorCd) + '] Host: ['
                                  + (Sender as TClientSocket).Host + '] Port: ['
                                  + intToStr((Sender as TClientSocket).Port) + '] Name: ['
                                  + (Sender as TClientSocket).Name + '] Msg: ['
                                  + tmpMsg + ']');
   if tmpErrorCd = 10057 then
   begin
     prDelay(nDspInterval);
     if (Sender as TClientSocket).Active then
     begin
       (Sender as TClientSocket).Active := False;
     end;
   end;
   if tmpErrorCd = 10049 then
   begin
     prDelay(nDspInterval);
    (Sender as TClientSocket).Active := True;
   end;
end;

procedure TfrmMain.csEZVilleConnect(Sender: TObject; Socket: TCustomWinSocket);
begin
  HomeInfoLogging('이지빌 단지서버 Connect');
end;

procedure TfrmMain.csEZVilleDisconnect(Sender: TObject; Socket: TCustomWinSocket);
begin
  HomeInfoLogging('이지빌 단지서버 Disconnect');
end;

procedure TfrmMain.csEZVilleRead(Sender: TObject; Socket: TCustomWinSocket);
var
  sRecv, sSend, sSendLength, sTemp: aString;
  nSendLength: Integer;
begin
  try
    //이지빌
    sHomeInfo_Temp:= Socket.ReceiveText;

    if sHomeInfo_Temp = '' then Exit;

    HomeInfoLogging('< 이지빌 수신(' + IntToStr(GetTickCount) + '): ' + sHomeInfo_Temp);

    if (Pos('$cmd=10', sHomeInfo_Temp) > 0) then
    begin
      //홈서버에서의 상태요청에 대한 응답...
      sSend:= Copy(sHomeInfo_Temp, 15, Length(sHomeInfo_Temp)-14) + '#dongho=' +
              //sezvilleDong + '&' + sezvilleho + '#ip=' + sLocalIP + '#status=0';
              sezvilleDong + '&' + sezvilleho + '#ip=' + sHomeInfo_IP + '#status=0';
      sTemp:= Copy(sSend, 1, Pos('cmd', sSend)-1) + 'cmd=11$' + Copy(sSend, Pos('target', sSend), Length(sSend)- (Pos('target', sSend)-1));
      sSend:= sTemp;
      sSendLength:= MG_InsZero(IntToStr(Length(sSend)+14), 4);
      nSendLength:= StrToInt(sSendLength);
      sSend:= '<start=' + sSendLength + '&0>' + sSend;

      if csEZVille.Socket.Connected then
      begin
        if csEZVille.Socket.SendText(sSend) = nSendLength then
        begin
          HomeInfoLogging('> 단지서버 상태요청에 대한 응답: ' + sSend);
        end
        else
        begin
          HomeInfoLogging('> 단지서버 상태요청에 대한 응답시 에러: ' + sSend);
        end;
      end
      else
      begin
        if MG_StrStrTrim(sHomeInfo_IP, ' ', '.') <> '' then
        begin
          if is_Ping(sHomeInfo_IP) then
          begin
            try
              csEZVille.Close;
              csEZVille.Open;

              if csEZVille.Socket.Connected then
              begin
                if csEZVille.Socket.SendText(sSend) = nSendLength then
                begin
                  HomeInfoLogging('> 단지서버 상태요청에 대한 응답(2): ' + sSend);
                end
                else
                begin
                  HomeInfoLogging('> 단지서버 상태요청에 대한 응답시 에러(2): ' + sSend);
                end;
              end
              else
                HomeInfoLogging('> 단지서버 상태요청에 대한 응답시 네트워크 에러');
            except
              on E: Exception do HomeInfoLogging('이지빌 상태요청에 대한 응답시 에러: ' + aString(E.Message));
            end;
          end
          else
            HomeInfoLogging('이지빌 단지서버로 상태요청에 대한 응답전송 시도시 Ping 안됨!');
        end;
      end;
    end;
    sHomeInfo_Temp:= '';
  except
    on E: EIdSocketError do
    begin
      if E.LastError <> 10054 then HomeInfoLogging('TfrmMain.csEZVilleRead: ' + E.Message);
      Exit;
    end;

    on E: EIdConnClosedGracefully do Exit;

    on E: Exception do HomeInfoLogging('TfrmMain.csEZVilleRead: ' + E.Message);
  end;
end;



procedure TfrmMain.csInDsp1Connect(Sender: TObject; Socket: TCustomWinSocket);
begin
  ExceptLogging('InDsp1_connect');
  if sInDspBasic1 <> '' then
  begin
    ExceptLogging('InDsp1_전광판문구전송');
    prDelay(nDspInterval);
    csInDsp1.Socket.SendText(sInDspBasic1);
    prDelay(nDspInterval);
  end;
end;

procedure TfrmMain.csInDsp1Disconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  ExceptLogging('InDsp1_Disconnect');
end;

procedure TfrmMain.csInDsp1Read(Sender: TObject; Socket: TCustomWinSocket);
var
  sRecv: aString;
begin
  sRecv := Socket.ReceiveText;
  ExceptLogging('[IN]>DSP1 Recv: ' + sRecv);
  prDelay(nDspInterval);
  csInDsp1.Active:= False;
  sInDspBasic1:= '';
end;

procedure TfrmMain.csInDsp2Connect(Sender: TObject; Socket: TCustomWinSocket);
begin
  ExceptLogging('InDsp2_connect');
  if sInDspBasic2 <> '' then
  begin
    ExceptLogging('InDsp2_전광판문구전송');
    prDelay(nDspInterval);
    csInDsp2.Socket.SendText(sInDspBasic2);
    prDelay(nDspInterval);
  end;
end;

procedure TfrmMain.csInDsp2Disconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  ExceptLogging('InDsp2_Disconnect');
end;

procedure TfrmMain.csInDsp2Read(Sender: TObject; Socket: TCustomWinSocket);
var
  sRecv: aString;
begin
  sRecv := Socket.ReceiveText;
  ExceptLogging('[IN]>DSP2 Recv: ' + sRecv);
  prDelay(nDspInterval);
  csInDsp2.Active:= False;
  sInDspBasic2:= '';
end;

procedure TfrmMain.csInDsp3Connect(Sender: TObject; Socket: TCustomWinSocket);
begin
  ExceptLogging('InDsp3_connect');
  if sInDspBasic3 <> '' then
  begin
    ExceptLogging('InDsp3_전광판문구전송');
    prDelay(nDspInterval);
    csInDsp3.Socket.SendText(sInDspBasic3);
    prDelay(nDspInterval);
  end;
end;

procedure TfrmMain.csInDsp3Disconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  ExceptLogging('InDsp3_Disconnect');
end;

procedure TfrmMain.csInDsp3Read(Sender: TObject; Socket: TCustomWinSocket);
var
  sRecv: aString;
begin
  sRecv := Socket.ReceiveText;
  ExceptLogging('[IN]>DSP3 Recv: ' + sRecv);
  prDelay(nDspInterval);
  csInDsp3.Active:= False;
  sInDspBasic3:= '';
end;

procedure TfrmMain.csInDsp4Connect(Sender: TObject; Socket: TCustomWinSocket);
begin
  ExceptLogging('InDsp4_connect');
  if sInDspBasic4 <> '' then
  begin
    ExceptLogging('InDsp4_전광판문구전송');
    prDelay(nDspInterval);
    csInDsp4.Socket.SendText(sInDspBasic4);
    prDelay(nDspInterval);
  end;
end;

procedure TfrmMain.csInDsp4Disconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  ExceptLogging('InDsp4_Disconnect');
end;

procedure TfrmMain.csInDsp4Read(Sender: TObject; Socket: TCustomWinSocket);
var
  sRecv: aString;
begin
  sRecv := Socket.ReceiveText;
  ExceptLogging('[IN]>DSP4 Recv: ' + sRecv);
  prDelay(nDspInterval);
  csInDsp4.Active:= False;
  sInDspBasic4:= '';
end;

procedure TfrmMain.csInDsp5Connect(Sender: TObject; Socket: TCustomWinSocket);
begin
  ExceptLogging('InDsp5_connect');
  if sInDspBasic5 <> '' then
  begin
    ExceptLogging('InDsp5_전광판문구전송');
    prDelay(nDspInterval);
    csInDsp5.Socket.SendText(sInDspBasic5);
    prDelay(nDspInterval);
  end;
end;

procedure TfrmMain.csInDsp5Disconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  ExceptLogging('InDsp5_Disconnect');
end;

procedure TfrmMain.csInDsp5Read(Sender: TObject; Socket: TCustomWinSocket);
var
  sRecv: aString;
begin
  sRecv := Socket.ReceiveText;
  ExceptLogging('[IN]>DSP5 Recv: ' + sRecv);
  prDelay(nDspInterval);
  csInDsp5.Active:= False;
  sInDspBasic5:= '';
end;

procedure TfrmMain.csInLpr1Error(Sender: TObject; Socket: TCustomWinSocket;
  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
  ExceptLogging('InLpr1_SocketError: ' + IntToStr(ErrorCode));
  ErrorCode := 0;
end;

procedure TfrmMain.csInLpr1Read(Sender: TObject; Socket: TCustomWinSocket);
var
  nNo: Word;
  sLprData, sLprIP, sDspIP: aString;
  csLPR: TClientSocket;
  sRecv, sExpDateF, sExpDateT, sCarNo1, sCarNo2, sShortCarNo: aString;
  i: Byte;
  sTime, sTemp, sResult, sTest, sDir, sLocal1, sLocal2: String;
  sFile1, sFile2, sImgFile1, sImgFile2: String;
  nRecog1, nRecog2, nIO, nListCnt, nCarNoLength: Byte;
  hr: HRESULT;
  sSend: aString;
  nParkArea, nUseArea : Integer;
begin
  try
    tInAlive1.Enabled := False;
    sRecv := Socket.ReceiveText;
    sInLPRRecv1 := sRecv;
    ExceptLogging('LPR' + IntToStr(csInLpr1.Tag) + ' Recv: ' + sInLPRRecv1);

    if Length(sInLPRRecv1) > 15 then
    begin
      nGCount := 0;
      bCount := true;
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
          //세종시 컨티넨탈에서는 NW를 처리하지 않기로 한다.  2012-09-09
          // 후면촬영결과가 전면촬영차량과 다르다. (새로운 차량이다)
          // NW제거
          sTemp := Copy(sLprData, Pos('#', sLprData) + 1, Length(sLprData) - Pos('#', sLprData));

          // CH제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos('#', sTemp));

          // 차량번호 추출
          sCarNo1 := Copy(sTemp, 1, Pos('#', sTemp) - 1);

          // 차량번호제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos('#', sTemp));

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
          sFile1 := 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr(sFile1, '\', '/');

          //세종시 컨티넨탈에서는 NW를 처리하지 않기로 한다.  2012-09-09
          Exit;
        end
        else if Copy(sLprData, 1, 2) = 'UP' then
        begin
          // 오인식으로 전면과 후면촬영결과가 다르다...
          // 이때는 CarNo1과 CarNo2, Image1, Image2를 구분하여 넣는다.
          // 전면차량번호와 입차일시를 가지고 DB검색하여 CarNo2와 Image2를 업데이트한다.

          // UP제거
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
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos('#', sTemp));

          // 파일명1 추출
          sFile1 := Copy(sTemp, 1, Pos('#', sTemp) - 1); // Copy(sTemp, Pos('#', sTemp)+1, Length(sTemp)-Pos('#', sTemp));
          sLocal1 := Copy(sFile1, Pos('CH', sFile1), Length(sFile1) -
              (Pos('CH', sFile1) - 1));
          sTime := MG_StrToStr(Copy(sFile1, Pos('_', sFile1) + 1, 14),
            '####-##-## ##:##:##');

          // 인식여부제거하여 파일명 추출
          sFile1 := 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr(sFile1, '\', '/');

          // 파일명1제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos('#', sTemp));

          // CH제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos('#', sTemp));

          // 차량번호2 추출
          sCarNo2 := Copy(sTemp, 1, Pos('#', sTemp) - 1);

          // 차량번호2제거
          sTemp := Copy(sTemp, Pos('#', sTemp) + 1, Length(sTemp) - Pos('#', sTemp));

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
        sTempFile1:= sImgFile1;

        for i := 1 to 10 do
        begin
          if RLpr[i].nUnitNo = nNo then
          begin
            nIO := RLpr[i].nIO;
            nListCnt:= RLpr[i].nLprCnt;
          end;
        end;

        if nRecog1 = 1 then
        begin
          with dmTables.qryInLpr1Proc do
          begin
//            if not b6Proc then
//            begin
//              Close;
//              SQL.Clear;
//              SQL.Add('Select * from CustInfo ');
//
//              if sCarNo2 <> '' then
//              begin
//                SQL.Add('where ((CarNo = :N1) or (CarNo = :N2)) and TKType = 2');
//                Parameters.ParamByName('N1').Value := sCarNo1;
//                Parameters.ParamByName('N2').Value := sCarNo2;
//                Open;
//              end
//              else
//              if sCarNo1 <> '' then
//              begin
//                SQL.Add('where CarNo = :N1 and TKType = 2');
//                Parameters.ParamByName('N1').Value := sCarNo1;
//                Open;
//              end;
//            end
//            else
//            begin
//              sShortCarNo:= Copy(sCarNo1, Length(sCarNo1) -3, 4);
//              nCarNoLength:= Length(sCarNo1);
//              Close;
//              SQL.Clear;
//              SQL.Add('Select * from ');
//              SQL.Add('(Select * from CustInfo where SUBSTRING(CarNo, 4, 4) = :N1 or ');
//              SQL.Add(' SUBSTRING(CarNo, 6, 4) = :N2 or SUBSTRING(CarNo, 5, 4) = :N7) d ');
//              Parameters.ParamByName('N1').Value:= sShortCarNo;
//              Parameters.ParamByName('N2').Value:= sShortCarNo;
//              Parameters.ParamByName('N7').Value:= sShortCarNo;
//
//              Case nCarNoLength of
//                11: begin
//                      SQL.Add('where SUBSTRING(d.CarNo, 3, 1) = :N3');
//                      Parameters.ParamByName('N3').Value:= Copy(sCarNo1, 5, 1);
//                    end;
//                12: begin
//                      SQL.Add('where SUBSTRING(d.CarNo, 3, 2) = :N4');
//                      Parameters.ParamByName('N4').Value:= Copy(sCarNo1, 5, 2);
//                    end;
//                8 : begin
//                      SQL.Add('where SUBSTRING(d.CarNo, 1, 2) = :N4');
//                      Parameters.ParamByName('N4').Value:= Copy(sCarNo1, 1, 2);
//                    end;
//              end;
//              Open;
//            end;
            //21.08.25 만차전광판 추가
            with dmTables.qryInLpr1Proc do
            begin
              nParkArea := 0;
              nUseArea  := 0;

              Close;
              SQL.Clear;
              SQL.Add('select ParkArea, UseArea from ParkCnt ');
              Open;

              if RecordCount > 0 then
              begin
                nParkArea := FieldByName('ParkArea').AsInteger;  //총주차면수
                nUseArea := FieldByName('UseArea').AsInteger;  //사용중인면수
                ExceptLogging('현재 총주차면수: ' + IntToStr(nParkArea)+ ' 현재 사용중인면수'+IntToStr(nUseArea));
                if nParkArea > nUseArea then  //사용중인면수가 총주차면수 작을 경우
                begin
                  bFullCar := False;
                  ExceptLogging('카운팅 전 총주차면수: ' + IntToStr(nParkArea)+ ' 사용중인면수'+IntToStr(nUseArea));
                end
                else //만차일경우
                begin
                   bFullCar := True;
                   ExceptLogging('카운팅 전 총주차면수(만차): ' + IntToStr(nParkArea)+ ' 사용중인면수'+IntToStr(nUseArea));
                end;
              end;
            end;

            Close;
            SQL.Clear;
            SQL.Add('Select * from CustInfo ');

            if sCarNo2 <> '' then
            begin
              SQL.Add('where ((CarNo = :N1) or (CarNo = :N2)) and ((ExpDateF <= :N3) and ');
              SQL.Add('(ExpDateT >= :N4)) and TKType = 2 and ParkNo = :N5');
              Parameters.ParamByName('N1').Value := sCarNo1;
              Parameters.ParamByName('N2').Value := sCarNo2;
              Parameters.ParamByName('N3').Value := FormatDateTime('YYYY-MM-DD', Now);
              Parameters.ParamByName('N4').Value := FormatDateTime('YYYY-MM-DD', Now);
              Parameters.ParamByName('N5').Value := nCurrParkNo;
              Open;
            end
            else
            if sCarNo1 <> '' then
            begin
              SQL.Add('where (CarNo = :N1) and ((ExpDateF <= :N3) and (ExpDateT >= :N4)) and ');
              SQL.Add('TKType = 2 and ParkNo = :N5');
              Parameters.ParamByName('N1').Value := sCarNo1;
              Parameters.ParamByName('N3').Value := FormatDateTime('YYYY-MM-DD', Now);
              Parameters.ParamByName('N4').Value := FormatDateTime('YYYY-MM-DD', Now);
              Parameters.ParamByName('N5').Value := nCurrParkNo;
              Open;
            end;
            if RecordCount > 0 then
            begin
              // 등록된 정기차량이면...
              sCarNo1:= FieldByName('CarNO').AsString;
              //sExpDateF:= FieldByName('ExpDateF').AsString;
              //sExpDateT:= FieldByName('ExpDateT').AsString;

              //if (sExpDateF <= FormatDateTime('YYYY-MM-DD', Now)) and
              //  (sExpDateT >= FormatDateTime('YYYY-MM-DD', Now)) then
              //begin
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
                RSCWait[nSCWaitPoint].nSCLprCnt:= nListCnt;
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
                sResult := RecvLprProc(sImgFile1, sCarNo1, sImgFile2, sCarNo2, sTime, nNo, nIO, nRecog1, nRecog2, sDspIP, csLPR, bInBarOpen1, nListCnt);
                GridData(nIO, nListCnt, sResult);
              end;
            end
            else
            begin
              if nIO = 1 then
              begin
                if bNCInProcWait then
                begin
                  if nNCInWaitPoint = 20 then
                    nNCInWaitPoint := 1
                  else
                    nNCInWaitPoint := nNCInWaitPoint + 1;

                  RNCInWait[nNCInWaitPoint].sNCFile1 := sImgFile1;
                  RNCInWait[nNCInWaitPoint].sNCCarNo1 := sCarNo1;
                  RNCInWait[nNCInWaitPoint].sNCFile2 := sImgFile2;
                  RNCInWait[nNCInWaitPoint].sNCCarNo2 := sCarNo2;
                  RNCInWait[nNCInWaitPoint].sNCIOTime := sTime;
                  RNCInWait[nNCInWaitPoint].nNCLprNo := nNo;
                  RNCInWait[nNCInWaitPoint].nNCInOut := nIO;
                  RNCInWait[nNCInWaitPoint].nNCRecog1 := nRecog1;
                  RNCInWait[nNCInWaitPoint].nNCRecog2 := nRecog2;
                  RNCInWait[nNCInWaitPoint].sNCDspIP := sDspIP;
                  RNCInWait[nNCInWaitPoint].csNCLPR := csLPR;
                  RNCInWait[nNCInWaitPoint].nNCLprCnt:= nListCnt;
                  RNCInWait[nNCInWaitPoint].bBarOpen := bInBarOpen1;

                  if not tNCInWait.Enabled then
                    tNCInWait.Enabled := True;
                end
                else
                begin
                  NormalProc(sImgFile1, sCarNo1, sImgFile2, sCarNo2, sTime, nNo, nIO, nRecog1, nRecog2, sDspIP, csLPR, true, nListCnt);
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

                  RNCOutWait[nNCOutWaitPoint].sNCFile1 := sImgFile1;
                  RNCOutWait[nNCOutWaitPoint].sNCCarNo1 := sCarNo1;
                  RNCOutWait[nNCOutWaitPoint].sNCFile2 := sImgFile2;
                  RNCOutWait[nNCOutWaitPoint].sNCCarNo2 := sCarNo2;
                  RNCOutWait[nNCOutWaitPoint].sNCIOTime := sTime;
                  RNCOutWait[nNCOutWaitPoint].nNCLprNo := nNo;
                  RNCOutWait[nNCOutWaitPoint].nNCInOut := nIO;
                  RNCOutWait[nNCOutWaitPoint].nNCRecog1 := nRecog1;
                  RNCOutWait[nNCOutWaitPoint].nNCRecog2 := nRecog2;
                  RNCOutWait[nNCOutWaitPoint].sNCDspIP := sDspIP;
                  RNCOutWait[nNCOutWaitPoint].csNCLPR := csLPR;
                  RNCOutWait[nNCOutWaitPoint].nNCLprCnt:= nListCnt;
                  RNCOutWait[nNCOutWaitPoint].bBarOpen := True;

                  if not tNCOutWait.Enabled then
                    tNCOutWait.Enabled := True;
                end
                else
                begin
                  NormalProc(sImgFile1, sCarNo1, sImgFile2, sCarNo2, sTime, nNo, nIO, nRecog1, nRecog2, sDspIP, csLPR, True, nListCnt);
                end;
              end;
            end;
          end;
        end
        else
        begin
          //미인식차량 처리...
          if nIO = 1 then
          begin
            if bNCInProcWait then
            begin
              if nNCInWaitPoint = 20 then
                nNCInWaitPoint := 1
              else
                nNCInWaitPoint := nNCInWaitPoint + 1;

              RNCInWait[nNCInWaitPoint].sNCFile1 := sImgFile1;
              RNCInWait[nNCInWaitPoint].sNCCarNo1 := sCarNo1;
              RNCInWait[nNCInWaitPoint].sNCFile2 := sImgFile2;
              RNCInWait[nNCInWaitPoint].sNCCarNo2 := sCarNo2;
              RNCInWait[nNCInWaitPoint].sNCIOTime := sTime;
              RNCInWait[nNCInWaitPoint].nNCLprNo := nNo;
              RNCInWait[nNCInWaitPoint].nNCInOut := nIO;
              RNCInWait[nNCInWaitPoint].nNCRecog1 := nRecog1;
              RNCInWait[nNCInWaitPoint].nNCRecog2 := nRecog2;
              RNCInWait[nNCInWaitPoint].sNCDspIP := sDspIP;
              RNCInWait[nNCInWaitPoint].csNCLPR := csLPR;
              RNCInWait[nNCInWaitPoint].nNCLprCnt:= nListCnt;
              RNCInWait[nNCInWaitPoint].bBarOpen := bInBarOpen1;

              if not tNCInWait.Enabled then
                tNCInWait.Enabled := True;
            end
            else
            begin
              //NormalProc(sImgFile1, sCarNo1, sImgFile2, sCarNo2, sTime, nNo, nIO, nRecog1, nRecog2, sDspIP, csLPR, bInBarOpen1, nListCnt);
//              NormalProc(sImgFile1, sCarNo1, sImgFile2, sCarNo2, sTime, nNo, nIO, nRecog1, nRecog2, sDspIP, csLPR, bMiIn, nListCnt);
              NormalProc(sImgFile1, sCarNo1, sImgFile2, sCarNo2, sTime, nNo, nIO, nRecog1, nRecog2, sDspIP, csLPR, true, nListCnt);
            end;
          end;
        end;

        //21.08.25 만차전광판 추가
        with dmTables.qryInLpr1Proc do
        begin
          nParkArea := 0;
          nUseArea  := 0;

          Close;
          SQL.Clear;
          SQL.Add('select ParkArea, UseArea from ParkCnt ');
          Open;

          if RecordCount > 0 then
          begin
            nParkArea := FieldByName('ParkArea').AsInteger;  //총주차면수
            nUseArea := FieldByName('UseArea').AsInteger;  //사용중인면수
            ExceptLogging('총주차면수: ' + IntToStr(nParkArea)+ ' 사용중인면수'+IntToStr(nUseArea));
            if nParkArea > nUseArea then  //사용중인면수가 총주차면수 작을 경우 카운팅
            begin
              Close;
              SQL.Clear;
              SQL.Add('update ParkCnt ');
              SQL.Add('set UseArea = :N1 ');
              Parameters.ParamByName('N1').Value := nUseArea + 1;
              ExecSQL;
              bFullCar := False;
              ExceptLogging('카운팅 후 총주차면수: ' + IntToStr(nParkArea)+ ' 사용중인면수'+IntToStr(nUseArea + 1));
            end
            else //만차일경우
            begin
               bFullCar := True;
               ExceptLogging('카운팅 후 총주차면수(만차): ' + IntToStr(nParkArea)+ ' 사용중인면수'+IntToStr(nUseArea));
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
        if Socket.Connected then
        begin
//          Socket.SendText(aString('TIME' + FormatDateTime('YYYYMMDDHHNNSS', Now)));
//          ExceptLogging('시간동기화 전송');
        end;
      end;
    end;
    sInLPRRecv1 := '';
  finally
    tInAlive1.Enabled := True;
  end;
end;

procedure TfrmMain.csInLpr2Read(Sender: TObject; Socket: TCustomWinSocket);
var
  nNo: Word;
  sLprData, sLprIP, sDspIP: aString;
  csLPR: TClientSocket;
  sRecv, sExpDateF, sExpDateT, sCarNo1, sCarNo2, sShortCarNo: aString;
  i: Byte;
  sTime, sTemp, sResult, sTest, sDir, sLocal1, sLocal2: String;
  sFile1, sFile2, sImgFile1, sImgFile2: String;
  nRecog1, nRecog2, nIO, nListCnt, nCarNoLength: Byte;
  hr: HRESULT;
  sSend: aString;
begin
  {
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
          //세종시 컨티넨탈에서는 NW를 처리하지 않기로 한다.  2012-09-09
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
          sFile1 := 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr(sFile1, '\', '/');

          //세종시 컨티넨탈에서는 NW를 처리하지 않기로 한다.  2012-09-09
          Exit;
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
        sTempFile2:= sImgFile1;

        for i := 1 to 10 do
        begin
          if RLpr[i].nUnitNo = nNo then
          begin
            nIO := RLpr[i].nIO;
            nListCnt:= RLpr[i].nLprCnt;
          end;
        end;

        if nRecog1 = 1 then
        begin
          with dmTables.qryInLpr2Proc do
          begin
            if not b6Proc then
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
            end
            else
            begin
              sShortCarNo:= Copy(sCarNo1, Length(sCarNo1) -3, 4);
              nCarNoLength:= Length(sCarNo1);
              Close;
              SQL.Clear;
              SQL.Add('Select * from ');
              SQL.Add('(Select * from CustInfo where SUBSTRING(CarNo, 4, 4) = :N1 or ');
              SQL.Add(' SUBSTRING(CarNo, 6, 4) = :N2 or SUBSTRING(CarNo, 5, 4) = :N7) d ');
              Parameters.ParamByName('N1').Value:= sShortCarNo;
              Parameters.ParamByName('N2').Value:= sShortCarNo;
              Parameters.ParamByName('N7').Value:= sShortCarNo;

              Case nCarNoLength of
                11: begin
                      SQL.Add('where SUBSTRING(d.CarNo, 5, 1) = :N3');
                      Parameters.ParamByName('N3').Value:= Copy(sCarNo1, 5, 1);
                    end;
                12: begin
                      SQL.Add('where SUBSTRING(d.CarNo, 3, 2) = :N4 or ');
                      SQL.Add('SUBSTRING(d.CarNo, 1, 2) = :N5');
                      Parameters.ParamByName('N4').Value:= Copy(sCarNo1, 5, 2);
                      Parameters.ParamByName('N5').Value:= Copy(sCarNo1, 5, 2);
                    end;
                8 : begin
                      SQL.Add('where SUBSTRING(d.CarNo, 3, 2) = :N4 or ');
                      SQL.Add('SUBSTRING(d.CarNo, 1, 2) = :N5');
                      Parameters.ParamByName('N4').Value:= Copy(sCarNo1, 1, 2);
                      Parameters.ParamByName('N5').Value:= Copy(sCarNo1, 1, 2);
                    end;
              end;
              Open;
            end;

            if RecordCount > 0 then
            begin
              // 등록된 정기차량이면...
              sCarNo1:= FieldByName('CarNO').AsString;
              //sExpDateF := FieldByName('ExpDateF').AsString;
              //sExpDateT := FieldByName('ExpDateT').AsString;

              //if (sExpDateF <= FormatDateTime('YYYY-MM-DD', Now)) and
              //  (sExpDateT >= FormatDateTime('YYYY-MM-DD', Now)) then
              //begin
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
                  RSCWait[nSCWaitPoint].nSCLprCnt:= nListCnt;
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
                  sResult := RecvLprProc(sImgFile1, sCarNo1, sImgFile2, sCarNo2, sTime,
                                         nNo, nIO, nRecog1, nRecog2, sDspIP, csLPR, bInBarOpen2, nListCnt);
                  GridData(nIO, nListCnt, sResult);
                end;
            end
            else
            begin
              // 정상인식시 일반차량 처리...
              try
                if FileExists(sImgFile1) then
                begin
                  if nIO = 1 then
                  begin
                    with frmMain do
                    begin
                      TImage(FindComponent('imgIn' + IntToStr(nListCnt))).Picture.LoadFromFile(sImgFile1);
                    end;
                  end
                  else
                  if nIO = 2 then
                  begin
                    with frmMain do
                    begin
                      TImage(FindComponent('imgOut' + IntToStr(nListCnt))).Picture.LoadFromFile(sImgFile1);
                    end;
                  end;
                end
                else
                begin
                  if nIO = 1 then
                  begin
                    with frmMain do
                    begin
                      TImage(FindComponent('imgIn' + IntToStr(nListCnt))).Picture.Assign(Nil);
                    end;
                  end
                  else
                  if nIO = 2 then
                  begin
                    with frmMain do
                    begin
                      TImage(FindComponent('imgOut' + IntToStr(nListCnt))).Picture.Assign(Nil);
                    end;
                  end;

                  ExceptLogging('File 없음: ' + sImgFile1);
                end;
              except
                on E: Exception do
                  ExceptLogging('이미지 로드 에러: ' + aString(E.Message));
              end;

              if nIO = 1 then
              begin
                //입구...
                with frmMain do
                begin
                  TLabeledEdit(FindComponent('edtInG' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
                  TLabeledEdit(FindComponent('edtInG' + IntToStr(nListCnt))).Font.Color:= clRed;
                  TLabeledEdit(FindComponent('edtInG' + IntToStr(nListCnt))).Text:= '일반';
                  TLabeledEdit(FindComponent('edtInDong' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
                  TLabeledEdit(FindComponent('edtInDong' + IntToStr(nListCnt))).Font.Color:= clRed;
                  TLabeledEdit(FindComponent('edtInDong' + IntToStr(nListCnt))).Text:= '';
                  TLabeledEdit(FindComponent('edtInHo' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
                  TLabeledEdit(FindComponent('edtInHo' + IntToStr(nListCnt))).Font.Color:= clRed;
                  TLabeledEdit(FindComponent('edtInHo' + IntToStr(nListCnt))).Text:= '';
                  TLabeledEdit(FindComponent('edtInCarNo' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
                  TLabeledEdit(FindComponent('edtInCarNo' + IntToStr(nListCnt))).Font.Color:= clRed;
                  TLabeledEdit(FindComponent('edtInCarNo' + IntToStr(nListCnt))).Text:= sCarNo1;
                end;
                DspProc(1, 2, ' 미등록차량 ' + MG_Left(sCarNo1, 12), sDspIP);
              end
              else if nIO = 2 then
              begin
                //출구...
                with frmMain do
                begin
                  TLabeledEdit(FindComponent('edtOutG' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
                  TLabeledEdit(FindComponent('edtOutG' + IntToStr(nListCnt))).Font.Color:= clRed;
                  TLabeledEdit(FindComponent('edtOutG' + IntToStr(nListCnt))).Text:= '일반';
                  TLabeledEdit(FindComponent('edtOutDong' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
                  TLabeledEdit(FindComponent('edtOutDong' + IntToStr(nListCnt))).Font.Color:= clRed;
                  TLabeledEdit(FindComponent('edtOutDong' + IntToStr(nListCnt))).Text:= '';
                  TLabeledEdit(FindComponent('edtOutHo' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
                  TLabeledEdit(FindComponent('edtOutHo' + IntToStr(nListCnt))).Font.Color:= clRed;
                  TLabeledEdit(FindComponent('edtOutHo' + IntToStr(nListCnt))).Text:= '';
                  TLabeledEdit(FindComponent('edtOutCarNo' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
                  TLabeledEdit(FindComponent('edtOutCarNo' + IntToStr(nListCnt))).Font.Color:= clRed;
                  TLabeledEdit(FindComponent('edtOutCarNo' + IntToStr(nListCnt))).Text:= sCarNo1;
                end;
                DspProc(2, 2, ' 미등록차량 ' + MG_Left(sCarNo1, 12), sDspIP);
              end;

              if nIO = 1 then
              begin
                if bNCInProcWait then
                begin
                  if nNCInWaitPoint = 20 then
                    nNCInWaitPoint := 1
                  else
                    nNCInWaitPoint := nNCInWaitPoint + 1;

                  RNCInWait[nNCInWaitPoint].sNCFile1 := sImgFile1;
                  RNCInWait[nNCInWaitPoint].sNCCarNo1 := sCarNo1;
                  RNCInWait[nNCInWaitPoint].sNCFile2 := sImgFile2;
                  RNCInWait[nNCInWaitPoint].sNCCarNo2 := sCarNo2;
                  RNCInWait[nNCInWaitPoint].sNCIOTime := sTime;
                  RNCInWait[nNCInWaitPoint].nNCLprNo := nNo;
                  RNCInWait[nNCInWaitPoint].nNCInOut := nIO;
                  RNCInWait[nNCInWaitPoint].nNCRecog1 := nRecog1;
                  RNCInWait[nNCInWaitPoint].nNCRecog2 := nRecog2;
                  RNCInWait[nNCInWaitPoint].sNCDspIP := sDspIP;
                  RNCInWait[nNCInWaitPoint].csNCLPR := csLPR;
                  RNCInWait[nNCInWaitPoint].nNCLprCnt:= nListCnt;
                  RNCInWait[nNCInWaitPoint].bBarOpen := bInBarOpen1;

                  if not tNCInWait.Enabled then
                    tNCInWait.Enabled := True;
                end
                else
                begin
                  NormalProc(sImgFile1, sCarNo1, sImgFile2, sCarNo2, sTime, nNo, nIO,
                    nRecog1, nRecog2, sDspIP, csLPR, False, nListCnt);
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

                  RNCOutWait[nNCOutWaitPoint].sNCFile1 := sImgFile1;
                  RNCOutWait[nNCOutWaitPoint].sNCCarNo1 := sCarNo1;
                  RNCOutWait[nNCOutWaitPoint].sNCFile2 := sImgFile2;
                  RNCOutWait[nNCOutWaitPoint].sNCCarNo2 := sCarNo2;
                  RNCOutWait[nNCOutWaitPoint].sNCIOTime := sTime;
                  RNCOutWait[nNCOutWaitPoint].nNCLprNo := nNo;
                  RNCOutWait[nNCOutWaitPoint].nNCInOut := nIO;
                  RNCOutWait[nNCOutWaitPoint].nNCRecog1 := nRecog1;
                  RNCOutWait[nNCOutWaitPoint].nNCRecog2 := nRecog2;
                  RNCOutWait[nNCOutWaitPoint].sNCDspIP := sDspIP;
                  RNCOutWait[nNCOutWaitPoint].csNCLPR := csLPR;
                  RNCOutWait[nNCOutWaitPoint].nNCLprCnt:= nListCnt;
                  RNCOutWait[nNCOutWaitPoint].bBarOpen := True;

                  if not tNCOutWait.Enabled then
                    tNCOutWait.Enabled := True;
                end
                else
                begin
                  NormalProc(sImgFile1, sCarNo1, sImgFile2, sCarNo2, sTime, nNo, nIO,
                    nRecog1, nRecog2, sDspIP, csLPR, False, nListCnt);
                end;
              end;
            end;
          end;
        end
        else
        begin
          //미인식차량 처리...
          if bMiIn then
          begin
            //미인식차량 입차시...
            if nIO = 1 then
            begin
              if bNCInProcWait then
              begin
                if nNCInWaitPoint = 20 then
                  nNCInWaitPoint := 1
                else
                  nNCInWaitPoint := nNCInWaitPoint + 1;

                RNCInWait[nNCInWaitPoint].sNCFile1 := sImgFile1;
                RNCInWait[nNCInWaitPoint].sNCCarNo1 := sCarNo1;
                RNCInWait[nNCInWaitPoint].sNCFile2 := sImgFile2;
                RNCInWait[nNCInWaitPoint].sNCCarNo2 := sCarNo2;
                RNCInWait[nNCInWaitPoint].sNCIOTime := sTime;
                RNCInWait[nNCInWaitPoint].nNCLprNo := nNo;
                RNCInWait[nNCInWaitPoint].nNCInOut := nIO;
                RNCInWait[nNCInWaitPoint].nNCRecog1 := nRecog1;
                RNCInWait[nNCInWaitPoint].nNCRecog2 := nRecog2;
                RNCInWait[nNCInWaitPoint].sNCDspIP := sDspIP;
                RNCInWait[nNCInWaitPoint].csNCLPR := csLPR;
                RNCInWait[nNCInWaitPoint].nNCLprCnt:= nListCnt;
                RNCInWait[nNCInWaitPoint].bBarOpen := bInBarOpen1;

                if not tNCInWait.Enabled then
                  tNCInWait.Enabled := True;
              end
              else
              begin
                //NormalProc(sImgFile1, sCarNo1, sImgFile2, sCarNo2, sTime, nNo, nIO,
                //  nRecog1, nRecog2, sDspIP, csLPR, bInBarOpen2, nListCnt);
                NormalProc(sImgFile1, sCarNo1, sImgFile2, sCarNo2, sTime, nNo, nIO,
                  nRecog1, nRecog2, sDspIP, csLPR, False, nListCnt);
              end;
            end;
          end
          else
          begin
            try
              if FileExists(sImgFile1) then
              begin
                if nIO = 1 then
                begin
                  with frmMain do
                  begin
                    TImage(FindComponent('imgIn' + IntToStr(nListCnt))).Picture.LoadFromFile(sImgFile1);
                  end;
                end
                else
                if nIO = 2 then
                begin
                  with frmMain do
                  begin
                    TImage(FindComponent('imgOut' + IntToStr(nListCnt))).Picture.LoadFromFile(sImgFile1);
                  end;
                end;
              end
              else
              begin
                if nIO = 1 then
                begin
                  with frmMain do
                  begin
                    TImage(FindComponent('imgIn' + IntToStr(nListCnt))).Picture.Assign(Nil);
                  end;
                end
                else
                if nIO = 2 then
                begin
                  with frmMain do
                  begin
                    TImage(FindComponent('imgOut' + IntToStr(nListCnt))).Picture.Assign(Nil);
                  end;
                end;

                ExceptLogging('File 없음: ' + sImgFile1);
              end;
            except
              on E: Exception do
                ExceptLogging('이미지 로드 에러: ' + aString(E.Message));
            end;

            if nIO = 1 then
            begin
              //입구...
              with frmMain do
              begin
                TLabeledEdit(FindComponent('edtInG' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
                TLabeledEdit(FindComponent('edtInG' + IntToStr(nListCnt))).Font.Color:= clRed;
                TLabeledEdit(FindComponent('edtInG' + IntToStr(nListCnt))).Text:= '미인식';
                TLabeledEdit(FindComponent('edtInDong' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
                TLabeledEdit(FindComponent('edtInDong' + IntToStr(nListCnt))).Font.Color:= clRed;
                TLabeledEdit(FindComponent('edtInDong' + IntToStr(nListCnt))).Text:= '';
                TLabeledEdit(FindComponent('edtInHo' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
                TLabeledEdit(FindComponent('edtInHo' + IntToStr(nListCnt))).Font.Color:= clRed;
                TLabeledEdit(FindComponent('edtInHo' + IntToStr(nListCnt))).Text:= '';
                TLabeledEdit(FindComponent('edtInCarNo' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
                TLabeledEdit(FindComponent('edtInCarNo' + IntToStr(nListCnt))).Font.Color:= clRed;
                TLabeledEdit(FindComponent('edtInCarNo' + IntToStr(nListCnt))).Text:= sCarNo1;
              end;
              DspProc(1, 2, ' 미인식차량 ' + MG_Left(sCarNo1, 12), sDspIP);
            end
            else if nIO = 2 then
            begin
              //출구...
              with frmMain do
              begin
                TLabeledEdit(FindComponent('edtOutG' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
                TLabeledEdit(FindComponent('edtOutG' + IntToStr(nListCnt))).Font.Color:= clRed;
                TLabeledEdit(FindComponent('edtOutG' + IntToStr(nListCnt))).Text:= '미인식';
                TLabeledEdit(FindComponent('edtOutDong' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
                TLabeledEdit(FindComponent('edtOutDong' + IntToStr(nListCnt))).Font.Color:= clRed;
                TLabeledEdit(FindComponent('edtOutDong' + IntToStr(nListCnt))).Text:= '';
                TLabeledEdit(FindComponent('edtOutHo' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
                TLabeledEdit(FindComponent('edtOutHo' + IntToStr(nListCnt))).Font.Color:= clRed;
                TLabeledEdit(FindComponent('edtOutHo' + IntToStr(nListCnt))).Text:= '';
                TLabeledEdit(FindComponent('edtOutCarNo' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
                TLabeledEdit(FindComponent('edtOutCarNo' + IntToStr(nListCnt))).Font.Color:= clRed;
                TLabeledEdit(FindComponent('edtOutCarNo' + IntToStr(nListCnt))).Text:= sCarNo1;
              end;
              DspProc(2, 2, ' 미인식차량 ' + MG_Left(sCarNo1, 12), sDspIP);
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
        if Socket.Connected then
        begin
          Socket.SendText(aString('TIME' + FormatDateTime('YYYYMMDDHHNNSS', Now)));
          ExceptLogging('시간동기화 전송');
        end;
      end;
    end;
    sInLPRRecv2 := '';
  finally
    tInAlive2.Enabled := True;
  end;
  }
end;

procedure TfrmMain.csInLpr3Read(Sender: TObject; Socket: TCustomWinSocket);
var
  nNo: Word;
  sLprData, sLprIP, sDspIP: aString;
  csLPR: TClientSocket;
  sRecv, sExpDateF, sExpDateT, sCarNo1, sCarNo2, sShortCarNo: aString;
  i: Byte;
  sTime, sTemp, sResult, sTest, sDir, sLocal1, sLocal2: String;
  sFile1, sFile2, sImgFile1, sImgFile2: String;
  nRecog1, nRecog2, nIO, nListCnt, nCarNoLength: Byte;
  hr: HRESULT;
  sSend: aString;
begin
  {
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
          //세종시 컨티넨탈에서는 NW를 처리하지 않기로 한다.  2012-09-09
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
          sFile1 := 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr(sFile1, '\', '/');

          //세종시 컨티넨탈에서는 NW를 처리하지 않기로 한다.  2012-09-09
          Exit;
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
        sTempFile3:= sImgFile1;

        for i := 1 to 10 do
        begin
          if RLpr[i].nUnitNo = nNo then
          begin
            nIO := RLpr[i].nIO;
            nListCnt:= RLpr[i].nLprCnt;
          end;
        end;

        if nRecog1 = 1 then
        begin
          with dmTables.qryInLpr3Proc do
          begin
            if not b6Proc then
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
            end
            else
            begin
              sShortCarNo:= Copy(sCarNo1, Length(sCarNo1) -3, 4);
              nCarNoLength:= Length(sCarNo1);
              Close;
              SQL.Clear;
              SQL.Add('Select * from ');
              SQL.Add('(Select * from CustInfo where SUBSTRING(CarNo, 4, 4) = :N1 or ');
              SQL.Add(' SUBSTRING(CarNo, 6, 4) = :N2 or SUBSTRING(CarNo, 5, 4) = :N7) d ');
              Parameters.ParamByName('N1').Value:= sShortCarNo;
              Parameters.ParamByName('N2').Value:= sShortCarNo;
              Parameters.ParamByName('N7').Value:= sShortCarNo;

              Case nCarNoLength of
                11: begin
                      SQL.Add('where SUBSTRING(d.CarNo, 5, 1) = :N3');
                      Parameters.ParamByName('N3').Value:= Copy(sCarNo1, 5, 1);
                    end;
                12: begin
                      SQL.Add('where SUBSTRING(d.CarNo, 3, 2) = :N4 or ');
                      SQL.Add('SUBSTRING(d.CarNo, 1, 2) = :N5');
                      Parameters.ParamByName('N4').Value:= Copy(sCarNo1, 5, 2);
                      Parameters.ParamByName('N5').Value:= Copy(sCarNo1, 5, 2);
                    end;
                8 : begin
                      SQL.Add('where SUBSTRING(d.CarNo, 3, 2) = :N4 or ');
                      SQL.Add('SUBSTRING(d.CarNo, 1, 2) = :N5');
                      Parameters.ParamByName('N4').Value:= Copy(sCarNo1, 1, 2);
                      Parameters.ParamByName('N5').Value:= Copy(sCarNo1, 1, 2);
                    end;
              end;
              Open;
            end;

            if RecordCount > 0 then
            begin
              // 등록된 정기차량이면...
              sCarNo1:= FieldByName('CarNO').AsString;
              //sExpDateF := FieldByName('ExpDateF').AsString;
              //sExpDateT := FieldByName('ExpDateT').AsString;

              //if (sExpDateF <= FormatDateTime('YYYY-MM-DD', Now)) and
              //  (sExpDateT >= FormatDateTime('YYYY-MM-DD', Now)) then
              //begin
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
                  RSCWait[nSCWaitPoint].nSCLprCnt:= nListCnt;
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
                  sResult := RecvLprProc(sImgFile1, sCarNo1, sImgFile2, sCarNo2, sTime,
                                         nNo, nIO, nRecog1, nRecog2, sDspIP, csLPR, bInBarOpen3, nListCnt);
                  GridData(nIO, nListCnt, sResult);
                end;
            end
            else
            begin
              // 정상인식시 일반차량 처리...
              try
                if FileExists(sImgFile1) then
                begin
                  if nIO = 1 then
                  begin
                    with frmMain do
                    begin
                      TImage(FindComponent('imgIn' + IntToStr(nListCnt))).Picture.LoadFromFile(sImgFile1);
                    end;
                  end
                  else
                  if nIO = 2 then
                  begin
                    with frmMain do
                    begin
                      TImage(FindComponent('imgOut' + IntToStr(nListCnt))).Picture.LoadFromFile(sImgFile1);
                    end;
                  end;
                end
                else
                begin
                  if nIO = 1 then
                  begin
                    with frmMain do
                    begin
                      TImage(FindComponent('imgIn' + IntToStr(nListCnt))).Picture.Assign(Nil);
                    end;
                  end
                  else
                  if nIO = 2 then
                  begin
                    with frmMain do
                    begin
                      TImage(FindComponent('imgOut' + IntToStr(nListCnt))).Picture.Assign(Nil);
                    end;
                  end;

                  ExceptLogging('File 없음: ' + sImgFile1);
                end;
              except
                on E: Exception do
                  ExceptLogging('이미지 로드 에러: ' + aString(E.Message));
              end;

              if nIO = 1 then
              begin
                //입구...
                with frmMain do
                begin
                  TLabeledEdit(FindComponent('edtInG' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
                  TLabeledEdit(FindComponent('edtInG' + IntToStr(nListCnt))).Font.Color:= clRed;
                  TLabeledEdit(FindComponent('edtInG' + IntToStr(nListCnt))).Text:= '일반';
                  TLabeledEdit(FindComponent('edtInDong' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
                  TLabeledEdit(FindComponent('edtInDong' + IntToStr(nListCnt))).Font.Color:= clRed;
                  TLabeledEdit(FindComponent('edtInDong' + IntToStr(nListCnt))).Text:= '';
                  TLabeledEdit(FindComponent('edtInHo' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
                  TLabeledEdit(FindComponent('edtInHo' + IntToStr(nListCnt))).Font.Color:= clRed;
                  TLabeledEdit(FindComponent('edtInHo' + IntToStr(nListCnt))).Text:= '';
                  TLabeledEdit(FindComponent('edtInCarNo' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
                  TLabeledEdit(FindComponent('edtInCarNo' + IntToStr(nListCnt))).Font.Color:= clRed;
                  TLabeledEdit(FindComponent('edtInCarNo' + IntToStr(nListCnt))).Text:= sCarNo1;
                end;
                DspProc(1, 2, ' 미등록차량 ' + MG_Left(sCarNo1, 12), sDspIP);
              end
              else if nIO = 2 then
              begin
                //출구...
                with frmMain do
                begin
                  TLabeledEdit(FindComponent('edtOutG' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
                  TLabeledEdit(FindComponent('edtOutG' + IntToStr(nListCnt))).Font.Color:= clRed;
                  TLabeledEdit(FindComponent('edtOutG' + IntToStr(nListCnt))).Text:= '일반';
                  TLabeledEdit(FindComponent('edtOutDong' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
                  TLabeledEdit(FindComponent('edtOutDong' + IntToStr(nListCnt))).Font.Color:= clRed;
                  TLabeledEdit(FindComponent('edtOutDong' + IntToStr(nListCnt))).Text:= '';
                  TLabeledEdit(FindComponent('edtOutHo' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
                  TLabeledEdit(FindComponent('edtOutHo' + IntToStr(nListCnt))).Font.Color:= clRed;
                  TLabeledEdit(FindComponent('edtOutHo' + IntToStr(nListCnt))).Text:= '';
                  TLabeledEdit(FindComponent('edtOutCarNo' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
                  TLabeledEdit(FindComponent('edtOutCarNo' + IntToStr(nListCnt))).Font.Color:= clRed;
                  TLabeledEdit(FindComponent('edtOutCarNo' + IntToStr(nListCnt))).Text:= sCarNo1;
                end;
                DspProc(2, 2, ' 미등록차량 ' + MG_Left(sCarNo1, 12), sDspIP);
              end;

              if nIO = 1 then
              begin
                if bNCInProcWait then
                begin
                  if nNCInWaitPoint = 20 then
                    nNCInWaitPoint := 1
                  else
                    nNCInWaitPoint := nNCInWaitPoint + 1;

                  RNCInWait[nNCInWaitPoint].sNCFile1 := sImgFile1;
                  RNCInWait[nNCInWaitPoint].sNCCarNo1 := sCarNo1;
                  RNCInWait[nNCInWaitPoint].sNCFile2 := sImgFile2;
                  RNCInWait[nNCInWaitPoint].sNCCarNo2 := sCarNo2;
                  RNCInWait[nNCInWaitPoint].sNCIOTime := sTime;
                  RNCInWait[nNCInWaitPoint].nNCLprNo := nNo;
                  RNCInWait[nNCInWaitPoint].nNCInOut := nIO;
                  RNCInWait[nNCInWaitPoint].nNCRecog1 := nRecog1;
                  RNCInWait[nNCInWaitPoint].nNCRecog2 := nRecog2;
                  RNCInWait[nNCInWaitPoint].sNCDspIP := sDspIP;
                  RNCInWait[nNCInWaitPoint].csNCLPR := csLPR;
                  RNCInWait[nNCInWaitPoint].nNCLprCnt:= nListCnt;
                  RNCInWait[nNCInWaitPoint].bBarOpen := bInBarOpen1;

                  if not tNCInWait.Enabled then
                    tNCInWait.Enabled := True;
                end
                else
                begin
                  NormalProc(sImgFile1, sCarNo1, sImgFile2, sCarNo2, sTime, nNo, nIO,
                    nRecog1, nRecog2, sDspIP, csLPR, False, nListCnt);
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

                  RNCOutWait[nNCOutWaitPoint].sNCFile1 := sImgFile1;
                  RNCOutWait[nNCOutWaitPoint].sNCCarNo1 := sCarNo1;
                  RNCOutWait[nNCOutWaitPoint].sNCFile2 := sImgFile2;
                  RNCOutWait[nNCOutWaitPoint].sNCCarNo2 := sCarNo2;
                  RNCOutWait[nNCOutWaitPoint].sNCIOTime := sTime;
                  RNCOutWait[nNCOutWaitPoint].nNCLprNo := nNo;
                  RNCOutWait[nNCOutWaitPoint].nNCInOut := nIO;
                  RNCOutWait[nNCOutWaitPoint].nNCRecog1 := nRecog1;
                  RNCOutWait[nNCOutWaitPoint].nNCRecog2 := nRecog2;
                  RNCOutWait[nNCOutWaitPoint].sNCDspIP := sDspIP;
                  RNCOutWait[nNCOutWaitPoint].csNCLPR := csLPR;
                  RNCOutWait[nNCOutWaitPoint].nNCLprCnt:= nListCnt;
                  RNCOutWait[nNCOutWaitPoint].bBarOpen := True;

                  if not tNCOutWait.Enabled then
                    tNCOutWait.Enabled := True;
                end
                else
                begin
                  NormalProc(sImgFile1, sCarNo1, sImgFile2, sCarNo2, sTime, nNo, nIO,
                    nRecog1, nRecog2, sDspIP, csLPR, False, nListCnt);
                end;
              end;
            end;
          end;
        end
        else
        begin
          //미인식차량 처리...
          if bMiIn then
          begin
            //미인식차량 입차시...
            if nIO = 1 then
            begin
              if bNCInProcWait then
              begin
                if nNCInWaitPoint = 20 then
                  nNCInWaitPoint := 1
                else
                  nNCInWaitPoint := nNCInWaitPoint + 1;

                RNCInWait[nNCInWaitPoint].sNCFile1 := sImgFile1;
                RNCInWait[nNCInWaitPoint].sNCCarNo1 := sCarNo1;
                RNCInWait[nNCInWaitPoint].sNCFile2 := sImgFile2;
                RNCInWait[nNCInWaitPoint].sNCCarNo2 := sCarNo2;
                RNCInWait[nNCInWaitPoint].sNCIOTime := sTime;
                RNCInWait[nNCInWaitPoint].nNCLprNo := nNo;
                RNCInWait[nNCInWaitPoint].nNCInOut := nIO;
                RNCInWait[nNCInWaitPoint].nNCRecog1 := nRecog1;
                RNCInWait[nNCInWaitPoint].nNCRecog2 := nRecog2;
                RNCInWait[nNCInWaitPoint].sNCDspIP := sDspIP;
                RNCInWait[nNCInWaitPoint].csNCLPR := csLPR;
                RNCInWait[nNCInWaitPoint].nNCLprCnt:= nListCnt;
                RNCInWait[nNCInWaitPoint].bBarOpen := bInBarOpen1;

                if not tNCInWait.Enabled then
                  tNCInWait.Enabled := True;
              end
              else
              begin
                //NormalProc(sImgFile1, sCarNo1, sImgFile2, sCarNo2, sTime, nNo, nIO,
                //  nRecog1, nRecog2, sDspIP, csLPR, bInBarOpen3, nListCnt);
                NormalProc(sImgFile1, sCarNo1, sImgFile2, sCarNo2, sTime, nNo, nIO,
                  nRecog1, nRecog2, sDspIP, csLPR, False, nListCnt);
              end;
            end;
          end
          else
          begin
            try
              if FileExists(sImgFile1) then
              begin
                if nIO = 1 then
                begin
                  with frmMain do
                  begin
                    TImage(FindComponent('imgIn' + IntToStr(nListCnt))).Picture.LoadFromFile(sImgFile1);
                  end;
                end
                else
                if nIO = 2 then
                begin
                  with frmMain do
                  begin
                    TImage(FindComponent('imgOut' + IntToStr(nListCnt))).Picture.LoadFromFile(sImgFile1);
                  end;
                end;
              end
              else
              begin
                if nIO = 1 then
                begin
                  with frmMain do
                  begin
                    TImage(FindComponent('imgIn' + IntToStr(nListCnt))).Picture.Assign(Nil);
                  end;
                end
                else
                if nIO = 2 then
                begin
                  with frmMain do
                  begin
                    TImage(FindComponent('imgOut' + IntToStr(nListCnt))).Picture.Assign(Nil);
                  end;
                end;

                ExceptLogging('File 없음: ' + sImgFile1);
              end;
            except
              on E: Exception do
                ExceptLogging('이미지 로드 에러: ' + aString(E.Message));
            end;

            if nIO = 1 then
            begin
              //입구...
              with frmMain do
              begin
                TLabeledEdit(FindComponent('edtInG' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
                TLabeledEdit(FindComponent('edtInG' + IntToStr(nListCnt))).Font.Color:= clRed;
                TLabeledEdit(FindComponent('edtInG' + IntToStr(nListCnt))).Text:= '미인식';
                TLabeledEdit(FindComponent('edtInDong' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
                TLabeledEdit(FindComponent('edtInDong' + IntToStr(nListCnt))).Font.Color:= clRed;
                TLabeledEdit(FindComponent('edtInDong' + IntToStr(nListCnt))).Text:= '';
                TLabeledEdit(FindComponent('edtInHo' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
                TLabeledEdit(FindComponent('edtInHo' + IntToStr(nListCnt))).Font.Color:= clRed;
                TLabeledEdit(FindComponent('edtInHo' + IntToStr(nListCnt))).Text:= '';
                TLabeledEdit(FindComponent('edtInCarNo' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
                TLabeledEdit(FindComponent('edtInCarNo' + IntToStr(nListCnt))).Font.Color:= clRed;
                TLabeledEdit(FindComponent('edtInCarNo' + IntToStr(nListCnt))).Text:= sCarNo1;
              end;
              DspProc(1, 2, ' 미인식차량 ' + MG_Left(sCarNo1, 12), sDspIP);
            end
            else if nIO = 2 then
            begin
              //출구...
              with frmMain do
              begin
                TLabeledEdit(FindComponent('edtOutG' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
                TLabeledEdit(FindComponent('edtOutG' + IntToStr(nListCnt))).Font.Color:= clRed;
                TLabeledEdit(FindComponent('edtOutG' + IntToStr(nListCnt))).Text:= '미인식';
                TLabeledEdit(FindComponent('edtOutDong' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
                TLabeledEdit(FindComponent('edtOutDong' + IntToStr(nListCnt))).Font.Color:= clRed;
                TLabeledEdit(FindComponent('edtOutDong' + IntToStr(nListCnt))).Text:= '';
                TLabeledEdit(FindComponent('edtOutHo' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
                TLabeledEdit(FindComponent('edtOutHo' + IntToStr(nListCnt))).Font.Color:= clRed;
                TLabeledEdit(FindComponent('edtOutHo' + IntToStr(nListCnt))).Text:= '';
                TLabeledEdit(FindComponent('edtOutCarNo' + IntToStr(nListCnt))).Color:= clBtnFace; //clBlue;
                TLabeledEdit(FindComponent('edtOutCarNo' + IntToStr(nListCnt))).Font.Color:= clRed;
                TLabeledEdit(FindComponent('edtOutCarNo' + IntToStr(nListCnt))).Text:= sCarNo1;
              end;
              DspProc(2, 2, ' 미인식차량 ' + MG_Left(sCarNo1, 12), sDspIP);
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
        if Socket.Connected then
        begin
          Socket.SendText(aString('TIME' + FormatDateTime('YYYYMMDDHHNNSS', Now)));
          ExceptLogging('시간동기화 전송');
        end;
      end;
    end;
    sInLPRRecv3 := '';
  finally
    tInAlive3.Enabled := True;
  end;
  }
end;

procedure TfrmMain.FormAlign;
begin
  pnBar.Top := (frmMain.ClientHeight - pnBar.Height) div 2;
  pnBar.Left := (frmMain.ClientWidth - pnBar.Width) div 2;
  pnManualProc.Top := (frmMain.ClientHeight - pnManualProc.Height) div 2;
  pnManualProc.Left := (frmMain.ClientWidth - pnManualProc.Width) div 2;
  pnSCSearch.Top := (frmMain.ClientHeight - pnSCSearch.Height) div 2;
  pnSCSearch.Left := (frmMain.ClientWidth - pnSCSearch.Width) div 2;
  pnHomeInfo.Top := (frmMain.ClientHeight - pnHomeInfo.Height) div 2;
  pnHomeInfo.Left := (frmMain.ClientWidth - pnHomeInfo.Width) div 2;
end;

function TfrmMain.IntToBool(nNo: Integer): Boolean;
begin
  if nNo = 0 then
    Result := False
  else
    Result := True;
end;

procedure TfrmMain.GridClear;
var
  i, j: Byte;
begin
  {
  with sgIn do
  begin
    Cells[0, 0] := '입차시각';
    Cells[1, 0] := '차량번호';
    Cells[2, 0] := '회사명';
    Cells[3, 0] := '성명';
    Cells[4, 0] := '유효기간';
    Cells[5, 0] := '출입상태';

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

  with sgOut do
  begin
    Cells[0, 0] := '출차시각';
    Cells[1, 0] := '차량번호';
    Cells[2, 0] := '회사명';
    Cells[3, 0] := '성명';
    Cells[4, 0] := '유효기간';
    Cells[5, 0] := '출입상태';

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
  }
end;

procedure TfrmMain.WaitClear;
var
  i: Byte;
begin
  for i := 1 to 20 do
  begin
    RSCWait[i].sSCFile1 := '';
    RSCWait[i].sSCCarNo1 := '';
    RSCWait[i].sSCFile2 := '';
    RSCWait[i].sSCCarNo2:= '';
    RSCWait[i].sSCIOTime:= '';
    RSCWait[i].nSCLprNo := 0;
    RSCWait[i].nSCInOut := 0;
    RSCWait[i].nSCLprCnt:= 0;
    RSCWait[i].nSCRecog1:= 0;
    RSCWait[i].nSCRecog2:= 0;
    RSCWait[i].sSCDspIP := '';
    RSCWait[i].bBarOpen := False;

    RNCInWait[i].sNCFile1 := '';
    RNCInWait[i].sNCCarNo1 := '';
    RNCInWait[i].sNCFile2 := '';
    RNCInWait[i].sNCCarNo2 := '';
    RNCInWait[i].sNCIOTime := '';
    RNCInWait[i].nNCLprNo := 0;
    RNCInWait[i].nNCInOut := 0;
    RNCInWait[i].nNCRecog1 := 0;
    RNCInWait[i].nNCRecog2 := 0;
    RNCInWait[i].nNCLprCnt:= 0;
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
    RNCOutWait[i].nNCLprCnt:= 0;
    RNCOutWait[i].sNCDspIP := '';
    RNCOutWait[i].bBarOpen := False;
  end;
end;

procedure TfrmMain.InitProc;
var
  i: Byte;
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

    with frmMain do
    begin
      //for i:= 1 to 3 do
      for i:= 1 to 1 do
      begin
        TLabeledEdit(FindComponent('edtInG' + IntToStr(i))).Text:= '';
        TLabeledEdit(FindComponent('edtInG' + IntToStr(i))).EditLabel.Caption:= '';
        TLabeledEdit(FindComponent('edtInDong' + IntToStr(i))).Text:= '';
        TLabeledEdit(FindComponent('edtInDong' + IntToStr(i))).EditLabel.Caption:= '';
        TLabeledEdit(FindComponent('edtInCarNo' + IntToStr(i))).Text:= '';
        TLabeledEdit(FindComponent('edtInCarNo' + IntToStr(i))).EditLabel.Caption:= '';
      end;
    end;
  except
    on E: Exception do ExceptLogging('TfrmMain.InitProc: ' + E.Message);
  end;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if not bDirectClose then
  begin
    if MessageDlg('프로그램을 종료할까요?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
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

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  try
    CreateFileMapping($FFFFFFFF, nil, PAGE_READWRITE, 0, 1, 'SC_IO');

    if GetLastError = ERROR_ALREADY_EXISTS then
    begin
      ShowMessage('정기차량 출입관리 프로그램이 이미 실행중입니다.'#13#13#10 + '확인하여주세요!');
      halt;
    end;
    sCurrRunDir := aString(ExtractFileDir(Application.ExeName));

    if not DirectoryExists('Log') then
      MkDir('Log');

    if not DirectoryExists('Non_Reg') then
      MkDir('Non_Reg');
  except
    on E: Exception do
      ExceptLogging('TfrmMain.FormCreate: ' + aString(E.Message));
  end;
end;

procedure TfrmMain.FormResize(Sender: TObject);
begin
  pnIn1.Width:= frmMain.ClientWidth div 2;
  edtInCarNo1.Width := pnIn1.Width div 2;
end;

procedure TfrmMain.FormShow(Sender: TObject);
var
  sDBString: aString;
  i, j: Integer;
  sTemp1, sTemp2: String;
  SystemTime: TSystemTime;
  sDateTime, sYear, sMonth, sDay, sHour, sMin, sSec, sError: String;
  idStack: TIdStack;
begin
  try
    ExceptLogging('Program Start!');
    FormAlign;
    GridClear;
    WaitClear;
    InitProc;

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
    sHomeInfo_IP:= MG_StrTrim(iSetup.ReadString('PARKING', 'HomeInfo IP', '10.10.10.10'), ' ');
    nHomeInfo_Port:= iSetup.ReadInteger('PARKING', 'HomeInfo Port', 25008);
    sezVilleDong:= iSetup.ReadString('PARKING', 'ezVilleDong', '100');
    sezVilleHo:= iSetup.ReadString('PARKING', 'ezVilleHo', '900');
    bMiIn:= iSetup.ReadBool('PARKING', 'MI_IN', False);
    b6Proc:= iSetup.ReadBool('PARKING', '6Proc', False);
    nDspInterval := iSetup.ReadInteger('PARKING', 'DSPInterval', 90);
    nArmInterval := iSetup.ReadInteger('PARKING', 'ArmInterval', 100);
    nGCountInterval := iSetup.ReadInteger('PARKING', 'CountInterval', 10);
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

    with qryMainTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from ParkInfo Order By ParkNo');
      Open;

      if RecordCount > 0 then
      begin
        nCurrParkNo := FieldByName('ParkNo').AsInteger;
      end
      else
        ExceptLogging('설치된 주차장이 없음!');
    end;
//    nLoginResult := 0;
//    NextModalDialog(TfrmLogin.Create(Self));
//
//    if nLoginResult = 0 then
//    begin
//      ShowMessage('로그인에 실패하여 프로그램을 종료합니다.');
//      bDirectClose:= True;
//      Close;
//      Exit;
//    end
//    else
//    begin
//      ExceptLogging('근무시작: ' + sCurrMName);
//    end;
//
//    if nManagerAuthority > 0 then
//      mnuSetup.Enabled := False;
    sCurrMName := '입차자동';
    nCurrMNo := 99;
    with qryMainTemp do
    begin
      for i := 1 to 10 do
      begin
        RLpr[i].nUnitNo := 0;
        RLpr[i].sDSPIP:= '';
        RLpr[i].nLprCnt:= 0;
        RLpr[i].nIO := 0;
      end;
      j := 1;

      sError := '';

      Close;
      SQL.Clear;
      SQL.Add('Select * ');
      SQL.Add('From UnitInfo Where UnitKind = :N1  and MyNo = :N2 and ParkNo = :N3 Order By ParkNo, UnitNo');
      Parameters.ParamByName('N1').Value := 8; // 입구LPR
      Parameters.ParamByName('N2').Value := nCurrUnitNo;
      Parameters.ParamByName('N3').Value := nCurrParkNo;
      Open;

      if RecordCount > 0 then
      begin
        i := 1;

        while not Eof do
        begin
          with frmMain do
          begin
            TClientSocket(FindComponent('csInLpr' + IntToStr(i))).Host := wString(MG_StrTrim(aString(FieldByName('IPNo').AsString), ' '));
            TClientSocket(FindComponent('csInLpr' + IntToStr(i))).Port := FieldByName('PortNo').AsInteger;
            TClientSocket(FindComponent('csInLpr' + IntToStr(i))).Tag := FieldByName('UnitNo').AsInteger;
            TButton(FindComponent('btnIn' + IntToStr(i))).Caption:= FieldByName('UnitName').AsString + '   |   F' + IntToStr((i*2)-1) +
                                                                    '-입력   |   F' + IntToStr(i*2) + '-차단기열림';

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
            RLpr[j].nLprCnt:= i;
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
      SQL.Add('From UnitInfo Where UnitKind = :N1 and MyNo = :N2 and ParkNo = :N3 Order By ParkNo, UnitNo');
      Parameters.ParamByName('N1').Value := 9; // 출구LPR
      Parameters.ParamByName('N2').Value := nCurrUnitNo;
      Parameters.ParamByName('N3').Value := nCurrParkNo;
      Open;

      if RecordCount > 0 then
      begin
        i := 1;

        while not Eof do
        begin
          with frmMain do
          begin
            TClientSocket(FindComponent('csOutLpr' + IntToStr(i))).Host := wString(MG_StrTrim(aString(FieldByName('IPNo').AsString), ' '));
            TClientSocket(FindComponent('csOutLpr' + IntToStr(i))).Port := FieldByName('PortNo').AsInteger;
            TClientSocket(FindComponent('csOutLpr' + IntToStr(i))).Tag := FieldByName('UnitNo').AsInteger;
            TButton(FindComponent('btnOut' + IntToStr(i))).Caption:= FieldByName('UnitName').AsString + '   |   F' + IntToStr((i*2)+3) +
                                                                    '-입력   |   F' + IntToStr((i*2)+4) + '-차단기열림';

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

            RLpr[j].nUnitNo:= FieldByName('UnitNo').AsInteger;
            RLpr[j].sDspIP := FieldByName('Reserve1').AsString;
            RLpr[j].nLprCnt:= i;
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
      SQL.Add('From UnitInfo Where UnitKind = :N1 and MyNo = :N2 Order By ParkNo, UnitNo');
      Parameters.ParamByName('N1').Value := 10; // 입구전광판
      Parameters.ParamByName('N2').Value := nCurrUnitNo;
      Open;

      if RecordCount > 0 then
      begin
        i := 1;

        while not Eof do
        begin
          with frmMain do
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
          with frmMain do
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

      Close;
      SQL.Clear;
      SQL.Add('Select ParkNo, UnitNo, UnitKind, ComPort, Baudrate ');
      SQL.Add('From UnitInfo Where UnitKind = :N1 and MyNo = :N2 and ParkNo = :N3 Order By ParkNo, UnitNo');
      Parameters.ParamByName('N1').Value := 20; // 경차판별기
      Parameters.ParamByName('N2').Value := nCurrUnitNo;
      Parameters.ParamByName('N3').Value := nCurrParkNo;
      Open;

      if RecordCount > 0 then begin
        try
          ComPrn.Open := False;
          ComPrn.ComNumber := FieldByName('ComPort').AsInteger;
          ComPrn.Baud := FieldByName('BaudRate').AsInteger;
          ComPrn.Open := True;
        except
          on E: Exception do
            ExceptLogging('경차판별기 센서 포트오픈 에러: ' + aString(E.Message));
        end;
      end else
        ExceptLogging('설치된 경차판결기가 없음!');

      if sError <> '' then
        ShowMessage(sError);

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
          with frmMain do
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
      tStart.Interval := nArmInterval;
      tDbCheck.Enabled := True;
//      Close;
//      SQL.Clear;
//      SQL.Add('Select * ');
//      SQL.Add('From UnitInfo Where UnitKind = :N1 and ParkNo = :N3 Order By ParkNo, UnitNo');
//      Parameters.ParamByName('N1').Value := 9; // 출구LPR
//      Parameters.ParamByName('N3').Value := nCurrParkNo;
//      Open;
//
//      if RecordCount > 0 then
//      begin
//        while not Eof do
//        begin
//          with frmMain do
//          begin
//            TAdvToolButton(FindComponent('btnBar' + IntToStr(i))).Caption := FieldByName('UnitName').AsString;
//            TAdvToolButton(FindComponent('btnBar' + IntToStr(i))).Hint := wString(MG_StrTrim(aString(FieldByName('IPNo').AsString), ' '));
//            TAdvToolButton(FindComponent('btnBar' + IntToStr(i))).GroupIndex := FieldByName('PortNo').AsInteger;
//            TAdvToolButton(FindComponent('btnBar' + IntToStr(i))).Tag := FieldByName('UnitNo').AsInteger;
//            TAdvToolButton(FindComponent('btnBar' + IntToStr(i))).ImageIndex := FieldByName('MyNo').AsInteger;
//            TAdvToolButton(FindComponent('btnBar' + IntToStr(i))).Visible := True;
//          end;
//          i := i + 1;
//          Next;
//        end;
//      end;

//      idTS.DefaultPort:= nHomeInfo_Port;
//      idTS.Active:= True;
//
////      현대통신용...
//      idTC.Host:= sHomeInfo_IP;
//      idTC.Port:= nHomeInfo_Port;
    end;
  except
    on E: Exception do ExceptLogging('TfrmMain.FormShow: ' + aString(E.Message));
  end;
end;

procedure TfrmMain.mnu1_1Click(Sender: TObject);
begin
  edtInCarNo1.ReadOnly:= False;
  edtInCarNo1.SetFocus;
  edtInCarNo1.SelectAll;
end;

procedure TfrmMain.mnu1_2Click(Sender: TObject);
var
  sSend: aString;
begin
  try
    if is_ping(csInLpr1.Host) and csInLpr1.Active then
    begin
      if csInLpr1.Socket.Connected then
      begin
        sSend := 'BAR_OPEN-1';
        csInLpr1.Socket.SendText(sSend);
      end
      else
        ExceptLogging(csInLpr1.Host + ' 차단기 오픈시 네트워크 끊김!');
    end
    else
      ExceptLogging(csInLpr1.Host + ' 차단기 오픈시 네트워크 오류!');
  except
    on E: Exception do ExceptLogging('TfrmMain.mnu1_2Click: ' + E.Message);
  end;
end;

procedure TfrmMain.mnuCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.mnuHomeInfoClick(Sender: TObject);
begin
  pnHomeInfo.Visible:= True;
  edtDong.SetFocus;
end;

procedure TfrmMain.mnuInDspClick(Sender: TObject);
begin
  NextModalDialog(TfrmInDspSet.Create(Self));
end;

procedure TfrmMain.mnuOutDspClick(Sender: TObject);
begin
  NextModalDialog(TfrmDspSet.Create(Self));
end;

procedure TfrmMain.N2Click(Sender: TObject);
begin
  NextModalDialog(TfrmSetup.Create(Self));

  if bSetupChange and (nCurrMNo <> 99) then
  begin
    ShowMessage('환경설정이 변경되어 프로그램을 종료합니다.'#13#10 + '프로그램을 다시 시작하여 주세요!');
    bDirectClose:= True;
    Close;
  end;
end;

procedure TfrmMain.N3Click(Sender: TObject);
begin
  NextModalDialog(TfrmUnitInfo.Create(Self));

  if bSetupChange and (nCurrMNo <> 99) then
  begin
    ShowMessage('환경설정이 변경되어 프로그램을 종료합니다.'#13#10 + '프로그램을 다시 시작하여 주세요!');
    bDirectClose:= True;
    Close;
  end;
end;

procedure TfrmMain.tDbCheckTimer(Sender: TObject);
var
  sDBString : String;
begin
  try
    with dmTables.qryDbCheck do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select parkno from parkinfo');
      Open;
    end;

  except
    on E: Exception do
    begin
      ExceptLogging('tDbCheckTimer : DB접속 오류 : ' + aString(E.Message));

      sDBIP  := iSetup.ReadString('PARKING', 'DB IP', '');
      sDBID  := iSetup.ReadString('PARKING', 'DB ID', '');
      sDBPW  := iSetup.ReadString('PARKING', 'DB PW', '');
      sDBName:= iSetup.ReadString('PARKING', 'DB Name', '');

      dmTables.ADODB.Connected := False;
      sDBString := 'Provider=SQLOLEDB.1;Persist Security Info=True;';
      sDBString := sDBString + 'User ID=' + sDBID;
      sDBString := sDBString + ';Password=' + sDBPW;
      sDBString := sDBString + ';Initial Catalog=' + sDBName;
      sDBString := sDBString + ';Data Source=' + sDBIP;
      dmTables.ADODB.ConnectionString := wString(sDBString);
      dmTables.ADODB.Connected := True;

      ExceptLogging('tDbCheckTimer : 재접속 시도 완료');
    end;
 end;
end;

procedure TfrmMain.tEZVilleTimer(Sender: TObject);
var
  sSend, sSendLength: aString;
  nSendLength: Integer;
begin
  try
    sSend:= '$version=2.0$dongho=' + sezVilleDong + '&' + sezVilleHo + '$cmd=10$target=server';
    sSendLength:= MG_InsZero(IntToStr(Length(sSend)+14), 4);
    nSendLength:= StrToInt(sSendLength);
    sSend:= '<start=' + sSendLength + '&0>' + sSend;

    if MG_StrStrTrim(sHomeInfo_IP, ' ', '.') <> '' then
    begin
      if is_Ping(sHomeInfo_IP) then
      begin
        if csEZVille.Socket.Connected then
        begin
          try
            if csEZVille.Socket.SendText(sSend) = nSendLength then
            begin
              HomeInfoLogging('> 단지서버 상태조회 전송: ' + sSend);
            end
            else
            begin
              HomeInfoLogging('> 단지서버 상태조회 전송시 에러: ' + sSend);
            end;
          except
            on E: Exception do HomeInfoLogging('단지서버 상태조회 전송시 에러: ' + aString(E.Message));
          end;
        end
        else
        begin
          csEZVille.Open;

          if csEZVille.Socket.Connected then
          begin
            try
              if csEZVille.Socket.SendText(sSend) = nSendLength then
              begin
                HomeInfoLogging('> 단지서버 상태조회 전송(2): ' + sSend);
              end
              else
              begin
                HomeInfoLogging('> 단지서버 상태조회 전송시 에러(2): ' + sSend);
              end;
            except
              on E: Exception do HomeInfoLogging('단지서버 상태조회 전송시 에러: ' + aString(E.Message));
            end;
          end
          else
            HomeInfoLogging('단지서버로 상태조회 전송시 네트워크 끊김!');
        end;
      end
      else
        HomeInfoLogging('단지서버로 상태조회 전송 시도시 Ping 안됨!');
    end;
  except
    on E: Exception do HomeInfoLogging('TfrmMain.tEzVilleTimer: ' + E.Message);
  end;
end;

procedure TfrmMain.tInAlive1Timer(Sender: TObject);
begin
  try
    if csInLpr1.Active then
    begin
      if is_ping(csInLpr1.Host) then
      begin
        if csInLpr1.Socket.Connected then
        begin
          csInLpr1.Socket.SendText('OK');
          ExceptLogging(IntToStr(csInLpr1.Tag) + '번 LPR OK 전송');
        end
        else
          ExceptLogging(IntToStr(csInLpr1.Tag) + '번 LPR OK 전송시 네트워크 끊김');
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

//      try
//        if csInLpr1.Active then
//        begin
//          if is_ping(csInLpr1.Host) then
//          begin
//            if csInLpr1.Socket.Connected then
//            begin
//              csInLpr1.Socket.SendText('TIME' + FormatDateTime('YYYYMMDDHHNNSS', Now));
//              ExceptLogging(IntToStr(csInLpr1.Tag) + '번 LPR 시간동기화 전송');
//            end
//            else
//              ExceptLogging(IntToStr(csInLpr1.Tag) + '번 LPR 시간동기화 전송시 네트워크 끊김');
//          end;
//        end;
//      except
//        on E: Exception do
//          ExceptLogging(IntToStr(csInLpr1.Tag) + '번 LPR 시간동기화 전송시 오류: ' + aString(E.Message));
//      end;
    end;
  except
    on E: Exception do
      ExceptLogging(IntToStr(csInLpr1.Tag) + '번 LPR OK 전송시 오류: ' + aString(E.Message));
  end;
end;

procedure TfrmMain.tInAlive2Timer(Sender: TObject);
begin
  try
    if csInLpr2.Active then
    begin
      if is_ping(csInLpr2.Host) then
      begin
        if csInLpr2.Socket.Connected then
        begin
          csInLpr2.Socket.SendText('OK');
          ExceptLogging(IntToStr(csInLpr2.Tag) + '번 LPR OK 전송');
        end
        else
          ExceptLogging(IntToStr(csInLpr2.Tag) + '번 LPR OK 전송시 네트워크 끊김');
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

//      try
//        if csInLpr2.Active then
//        begin
//          if is_ping(csInLpr2.Host) then
//          begin
//            if csInLpr2.Socket.Connected then
//            begin
//              csInLpr2.Socket.SendText('TIME' + FormatDateTime('YYYYMMDDHHNNSS', Now));
//              ExceptLogging(IntToStr(csInLpr2.Tag) + '번 LPR 시간동기화 전송');
//            end
//            else
//              ExceptLogging(IntToStr(csInLpr2.Tag) + '번 LPR 시간동기화 전송시 네트워크 끊김');
//          end;
//        end;
//      except
//        on E: Exception do
//          ExceptLogging(IntToStr(csInLpr2.Tag) + '번 LPR 시간동기화 전송시 오류: ' + aString(E.Message));
//      end;
    end;
  except
    on E: Exception do
      ExceptLogging(IntToStr(csInLpr2.Tag) + '번 LPR OK 전송시 오류: ' + aString(E.Message));
  end;
end;

procedure TfrmMain.tInAlive3Timer(Sender: TObject);
begin
  try
    if csInLpr3.Active then
    begin
      if is_ping(csInLpr3.Host) then
      begin
        if csInLpr3.Socket.Connected then
        begin
          csInLpr3.Socket.SendText('OK');
          ExceptLogging(IntToStr(csInLpr3.Tag) + '번 LPR OK 전송');
        end
        else
          ExceptLogging(IntToStr(csInLpr3.Tag) + '번 LPR OK 전송시 네트워크 끊김');
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
//
//      try
//        if csInLpr3.Active then
//        begin
//          if is_ping(csInLpr3.Host) then
//          begin
//            if csInLpr3.Socket.Connected then
//            begin
//              csInLpr3.Socket.SendText('TIME' + FormatDateTime('YYYYMMDDHHNNSS', Now));
//              ExceptLogging(IntToStr(csInLpr3.Tag) + '번 LPR 시간동기화 전송');
//            end
//            else
//              ExceptLogging(IntToStr(csInLpr3.Tag) + '번 LPR 시간동기화 전송시 네트워크 끊김');
//          end;
//        end;
//      except
//        on E: Exception do
//          ExceptLogging(IntToStr(csInLpr3.Tag) + '번 LPR 시간동기화 전송시 오류: ' + aString(E.Message));
//      end;
    end;
  except
    on E: Exception do
      ExceptLogging(IntToStr(csInLpr3.Tag) + '번 LPR OK 전송시 오류: ' + aString(E.Message));
  end;
end;

procedure TfrmMain.tInDspTimer(Sender: TObject);
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
      if MG_StrStrTrim(TClientSocket(FindComponent('csInDsp' + IntToStr(i))).Host, '.', ' ') <> '' then
      begin
        case i of
          1: sInDspBasic1:= sSend;
          2: sInDspBasic2:= sSend;
          3: sInDspBasic3:= sSend;
          4: sInDspBasic4:= sSend;
          5: sInDspBasic5:= sSend;
        end;
        if TClientSocket(FindComponent('csInDsp' + IntToStr(i))).Active then
          TClientSocket(FindComponent('csInDsp' + IntToStr(i))).Active:= false;

        TClientSocket(FindComponent('csInDsp' + IntToStr(i))).Active:= True;
      end;
    end;
//    for i := 1 to 5 do
//    begin
//      if TClientSocket(FindComponent('csInDsp' + IntToStr(i))).Active then
//      begin
//        TClientSocket(FindComponent('csInDsp' + IntToStr(i))).Socket.SendText(sSend);
//        prDelay(nDspInterval);
//        TClientSocket(FindComponent('csInDsp' + IntToStr(i))).Active := false;
//      end;
//    end;
  except
    on E: Exception do
      ExceptLogging('TfrmMain.tInDspTimer: ' + aString(E.Message));
  end;
end;

procedure TfrmMain.tNCInWaitTimer(Sender: TObject);
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
                     RNCInWait[nNCInWaitFlag].sNCFile2,
                     RNCInWait[nNCInWaitFlag].sNCCarNo2,
                     RNCInWait[nNCInWaitFlag].sNCIOTime,
                     RNCInWait[nNCInWaitFlag].nNCLprNo,
                     RNCInWait[nNCInWaitFlag].nNCInOut,
                     RNCInWait[nNCInWaitFlag].nNCRecog1,
                     RNCInWait[nNCInWaitFlag].nNCRecog2,
                     RNCInWait[nNCInWaitFlag].sNCDspIP,
                     RNCInWait[nNCInWaitFlag].csNCLPR,
                     RNCInWait[nNCInWaitFlag].bBarOpen,
                     RNCInWait[nNCInWaitFlag].nNCLprCnt);

          RNCInWait[nNCInWaitFlag].sNCFile1 := '';
          RNCInWait[nNCInWaitFlag].sNCCarNo1 := '';
          RNCInWait[nNCInWaitFlag].sNCFile2 := '';
          RNCInWait[nNCInWaitFlag].sNCCarNo2 := '';
          RNCInWait[nNCInWaitFlag].sNCIOTime := '';
          RNCInWait[nNCInWaitFlag].nNCLprNo := 0;
          RNCInWait[nNCInWaitFlag].nNCInOut := 0;
          RNCInWait[nNCInWaitFlag].nNCRecog1 := 0;
          RNCInWait[nNCInWaitFlag].nNCRecog2 := 0;
          RNCInWait[nNCInWaitFlag].nNCLprCnt:= 0;
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
      ExceptLogging('TfrmMain.tNCInWaitTimer: ' + aString(E.Message));
  end;
end;

procedure TfrmMain.tNCOutWaitTimer(Sender: TObject);
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
                     RNCOutWait[nNCOutWaitFlag].sNCFile2,
                     RNCOutWait[nNCOutWaitFlag].sNCCarNo2,
                     RNCOutWait[nNCOutWaitFlag].sNCIOTime,
                     RNCOutWait[nNCOutWaitFlag].nNCLprNo,
                     RNCOutWait[nNCOutWaitFlag].nNCInOut,
                     RNCOutWait[nNCOutWaitFlag].nNCRecog1,
                     RNCOutWait[nNCOutWaitFlag].nNCRecog2,
                     RNCOutWait[nNCOutWaitFlag].sNCDspIP,
                     RNCOutWait[nNCOutWaitFlag].csNCLPR,
                     RNCOutWait[nNCOutWaitFlag].bBarOpen,
                     RNCOutWait[nNCOutWaitFlag].nNCLprCnt);

          RNCOutWait[nNCOutWaitFlag].sNCFile1 := '';
          RNCOutWait[nNCOutWaitFlag].sNCCarNo1 := '';
          RNCOutWait[nNCOutWaitFlag].sNCFile2 := '';
          RNCOutWait[nNCOutWaitFlag].sNCCarNo2 := '';
          RNCOutWait[nNCOutWaitFlag].sNCIOTime := '';
          RNCOutWait[nNCOutWaitFlag].nNCLprNo := 0;
          RNCOutWait[nNCOutWaitFlag].nNCInOut := 0;
          RNCOutWait[nNCOutWaitFlag].nNCRecog1 := 0;
          RNCOutWait[nNCOutWaitFlag].nNCRecog2 := 0;
          RNCOutWait[nNCOutWaitFlag].nNCLprCnt:= 0;
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

procedure TfrmMain.tOutAlive1Timer(Sender: TObject);
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

//      try
//        if csOutLpr1.Active then
//        begin
//          if is_ping(csOutLpr1.Host) then
//          begin
//            csOutLpr1.Socket.SendText('TIME' + FormatDateTime('YYYYMMDDHHNNSS', Now));
//            ExceptLogging(IntToStr(csOutLpr1.Tag) + '번 LPR 시간동기화 전송');
//          end;
//        end;
//      except
//        on E: Exception do
//          ExceptLogging(IntToStr(csOutLpr1.Tag) + '번 LPR 시간동기화 전송시 오류: ' + aString(E.Message));
//      end;
    end;
  except
    on E: Exception do
      ExceptLogging(IntToStr(csOutLpr1.Tag) + '번 LPR OK 전송시 오류: ' + aString(E.Message));
  end;
end;

procedure TfrmMain.tOutAlive2Timer(Sender: TObject);
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

//      try
//        if csOutLpr2.Active then
//        begin
//          if is_ping(csOutLpr2.Host) then
//          begin
//            csOutLpr2.Socket.SendText('TIME' + FormatDateTime('YYYYMMDDHHNNSS', Now));
//            ExceptLogging(IntToStr(csOutLpr2.Tag) + '번 LPR 시간동기화 전송');
//          end;
//        end;
//      except
//        on E: Exception do
//          ExceptLogging(IntToStr(csOutLpr2.Tag) + '번 LPR 시간동기화 전송시 오류: ' + aString(E.Message));
//      end;
    end;
  except
    on E: Exception do
      ExceptLogging(IntToStr(csOutLpr2.Tag) + '번 LPR OK 전송시 오류: ' + aString(E.Message));
  end;
end;

procedure TfrmMain.tOutDspTimer(Sender: TObject);
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
      ExceptLogging('TfrmMain.tOutDspTimer: ' + aString(E.Message));
  end;
end;

procedure TfrmMain.tSCWaitTimer(Sender: TObject);
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
                                 RSCWait[nSCWaitFlag].sSCCarNo1,
                                 RSCWait[nSCWaitFlag].sSCFile2,
                                 RSCWait[nSCWaitFlag].sSCCarNo2,
                                 RSCWait[nSCWaitFlag].sSCIOTime,
                                 RSCWait[nSCWaitFlag].nSCLprNo,
                                 RSCWait[nSCWaitFlag].nSCInOut,
                                 RSCWait[nSCWaitFlag].nSCRecog1,
                                 RSCWait[nSCWaitFlag].nSCRecog2,
                                 RSCWait[nSCWaitFlag].sSCDspIP,
                                 RSCWait[nSCWaitFlag].csSCLPR,
                                 RSCWait[nSCWaitFlag].bBarOpen,
                                 RSCWait[nSCWaitFlag].nSCLprCnt);
          GridData(RSCWait[nSCWaitFlag].nSCInOut, RSCWait[nSCWaitFlag].nSCLprCnt, sResult);
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
      ExceptLogging('TfrmMain.tSCWaitTimer: ' + aString(E.Message));
  end;
end;

procedure TfrmMain.tStartTimer(Sender: TObject);
begin
  tStart.Enabled := False;
  if ComPrn.Open and (sGTKNo <> '') then
  begin
     ComPrn.PutString(ReadInPutSignal);
  end;
end;

procedure TfrmMain.prDelay(Time: Integer);
var
   PastCount: LongInt;
begin
     PastCount := GetTickCount;
     repeat
           Application.ProcessMessages;
     until ((GetTickCount-PastCount) >= LongInt(Time));
end;
end.
