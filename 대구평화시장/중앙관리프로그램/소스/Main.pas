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
  IdIOHandlerSocket, IdIOHandlerStack, idGlobal, AdvObj, AdvEdit, Vcl.MPlayer;

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
    N39: TMenuItem;
    N40: TMenuItem;
    N41: TMenuItem;
    tJasmine: TTimer;
    qryFTPTemp: TADOQuery;
    z1: TMenuItem;
    N37: TMenuItem;
    N38: TMenuItem;
    btnBar15: TAdvToolButton;
    btnBar16: TAdvToolButton;
    btnBar17: TAdvToolButton;
    btnBar18: TAdvToolButton;
    btnBar19: TAdvToolButton;
    btnBar20: TAdvToolButton;
    N42: TMenuItem;
    c1: TMenuItem;
    N43: TMenuItem;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    pnIONData: TPanel;
    dgIONData: TDBAdvGrid;
    Panel9: TButton;
    Panel6: TPanel;
    pnTKProc: TPanel;
    dgTKProc: TDBAdvGrid;
    Panel10: TButton;
    Panel7: TPanel;
    pnSIn: TPanel;
    dgSCIn: TDBAdvGrid;
    Panel11: TButton;
    Panel8: TPanel;
    pnSOut: TPanel;
    dgSCOut: TDBAdvGrid;
    Panel12: TButton;
    qryDeviceStatus: TADOQuery;
    ADOQuery1: TADOQuery;
    qryTemp: TADOQuery;
    Timer1: TTimer;
    tStart: TTimer;
    Panel15: TPanel;
    grdStatus: TDBAdvGrid;
    mp1: TMediaPlayer;
    DataSource1: TDataSource;
    qryDeviceStatusUnitNo: TSmallintField;
    qryDeviceStatusUnitName: TStringField;
    qryDeviceStatusDeviceName: TStringField;
    qryDeviceStatusDeviceStatus: TIntegerField;
    qryDeviceStatusDeviceStatusError: TStringField;
    qryDeviceStatusDeviceStatusDate: TStringField;
    qryDeviceStatusDeviceStatusTime: TStringField;
    btnClear: TButton;
    SpeedButton1: TSpeedButton;
    N44: TMenuItem;
    btnModify: TSpeedButton;
    t1: TMenuItem;
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
    procedure N40Click(Sender: TObject);
    procedure N41Click(Sender: TObject);
    procedure tJasmineTimer(Sender: TObject);
    procedure z1Click(Sender: TObject);
    procedure N37Click(Sender: TObject);
    procedure N38Click(Sender: TObject);
    procedure N42Click(Sender: TObject);
    procedure c1Click(Sender: TObject);
    procedure N43Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure tStartTimer(Sender: TObject);
    procedure grdStatusDblClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure mp1Notify(Sender: TObject);
    procedure N44Click(Sender: TObject);
    procedure btnModifyClick(Sender: TObject);
    procedure t1Click(Sender: TObject);
  private
    { Private declarations }
    procedure ICMPReply(ASender: TComponent; const ReplyStatus: TReplyStatus);
    function is_ping(IP: AnsiString): Boolean;
    procedure DBFieldAdd;
    procedure TxtToDB;
    procedure FTPPutFile;
    procedure FormAlign;
  public
    { Public declarations }
    procedure UnitCtrl(nCmd, nFCNo, nUnitNo, nMNo: Word; sData:AnsiString);
    procedure GridData;
  end;

var
  frmMain: TfrmMain;
  ping_success: Boolean = False;

implementation
uses
  Global, Tables, ParkInfo, UnitInfo, FeeItem, Tariff, DCInfo, Holiday, Gracetime,
  Manager, WP, SCGroup, CustInfo, NewSC, Login, AddSC, NProc, IONData, IOSData,
  SCData, NSCData, Card, CardAdd, RFSCGroup, RFSCCustInfo, NewRFSC, AddRFSC, Coupon,
  FreeIOData, CouponList, IOCnt, Recog, RFSCData, RFIOSData, RFNSCData, DailyReport,
  MonthlyReport, CarNoModify, IOSCnt, Freetime, ParkingTime, Analysis, InputData, ValetCard,
  ValIOCnt, Magam, IOVData, CGVData, DailyIOCnt, Alarm, APTKProc, VanList;

{$R *.dfm}

procedure TfrmMain.FTPPutFile;
var
  nFile, nErrFile: Integer;
  sFile, sErrFile, sWriteData: aString;
  FS: TFileStream;
begin
  try
    sFile:= 'C:\Jasmine\jasmin_car_re(' + IntToStr(nCurrJumCode) + ').log';
    sErrFile:= 'C:\Jasmine\jasmin_car_re(' + IntToStr(nCurrJumCode) + ')_msg.log';

    if sFTPResponse <> '' then
    begin
      if FileExists(wString(sFile)) then
      begin
        DeleteFile(wString(sFile));
      end;
      nFile:= FileCreate(wString(sFile));

      if nFile <> -1 then
      begin
        sWriteData := sFTPResponse;
        FileWrite(nFile, PAnsichar(sWriteData)^, Length(sWriteData));
        FileClose(nFile);
      end;
      sFTPResponse:= '';
    end;

    if sFTPError <> '' then
    begin
      if FileExists(wString(sErrFile)) then
      begin
        DeleteFile(wString(sErrFile));
      end;
      nErrFile:= FileCreate(wString(sErrFile));

      if nErrFile <> -1 then
      begin
        sWriteData := sFTPError;
        FileWrite(nErrFile, PAnsichar(sWriteData)^, Length(sWriteData));
        FileClose(nErrFile);
      end;
      sFTPError:= '';
    end;
  except
    on E: Exception do ExceptLogging('TfrmMain.FTPPutFile: ' + aString(E.Message));
  end;
end;

procedure TfrmMain.grdStatusDblClick(Sender: TObject);
begin
  // ?????????? ????????
  try
    if MessageDlg('???????? ?????????????', mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;

    nUnitNo := 0;
    sStatusDate := '';
    sStatusTime := '';

    with qryDeviceStatus do
    begin
      nUnitNo :=  FieldByName('UnitNo').AsInteger;
      sStatusDate := FieldByName('DeviceStatusDate').AsString;
      sStatusTime := FieldByName('DeviceStatusTime').AsString;
    end;
    // ????????
    with qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('update DeviceStatus set DeviceStatus = 1 ');
      SQL.Add('where UnitNo = :pUnitNo ');
      SQL.Add('and DeviceStatusDate = :pDate and DeviceStatusTime = :pTime');
      Parameters.ParamByName('pUnitNo').Value := nUnitNo;
      Parameters.ParamByName('pDate').Value := sStatusDate;
      Parameters.ParamByName('pTime').Value := sStatusTime;
      ExecSQL;
    end;
    StatusLogging(IntToStr(nUnitNo) + '?? ???? ????????, ????????: ' + sStatusDate + ', ????????: ' + sStatusDate);
    GridData;
  except
    on E: Exception do StatusLogging('TfrmMain.grdStatusDblClick: ' + aString(E.Message));
  end;
end;

procedure TfrmMain.TxtToDB;
var
  fSL: TStringList;
  i: Integer;
  sTemp: String;
  sData, sFileDate, sFileTime: aString;
  nGroupNo, nIssueAmt, nJasmineDCTime, nJumCode, nValet: Integer;
  sGroupName, sName, sPhoneNo, sCarNo, sCompName, sTelNo, sBigo, sCarType,
  sIssueDate, sExpSDate, sExpEDate, sTKNo, sValetChk, sErrorLog: aString;
  nGoodCnt, nErrCnt, nDataChk: Integer;
  nTKNo: Cardinal;
begin
  try
  try
    sFileDate:= Copy(sLastFTPTime, 1, 10);
    sFileTime:= Copy(sLastFTPTime, 12, 8);
    iSetup.WriteString('PARKING', 'Last File', sFileDate + ' ' + sFileTime);
    fSL:= TStringList.Create;
    fSL.LoadFromFile('C:\Jasmine\jasmin_car.txt');
    sErrorLog:= '';
    nGoodCnt:= 0;
    nErrCnt:= 0;
    nTKNo:= GetTickCount;

    with qryFTPTemp do
    begin
      dmTables.ADODB.BeginTrans;
      Close;
      SQL.Clear;
      SQL.Add('Select * from GGroup where GroupNo = 999');
      Open;

      if RecordCount > 0 then
      begin
        //?????????? ?????? ?????? ???? ?????? ???????? ????...
        Close;
        SQL.Clear;
        SQL.Add('Delete from CustInfo where GroupNo = 999');
        ExecSQL;
      end
      else
      begin
        //?????????? ?????? ?????? ???? ???? ????...
        Close;
        SQL.Clear;
        SQL.Add('Insert into GGroup ');
        SQL.Add('(ParkNo, GroupNo, GroupName, APB, Status, Remark, ');
        SQL.Add('GroupType, UseFeeItem) ');
        SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8)');
        Parameters.ParamByName('N1').Value:= nCurrParkNo;
        Parameters.ParamByName('N2').Value:= 999;
        Parameters.ParamByName('N3').Value:= '????????????';
        Parameters.ParamByName('N4').Value:= 3;
        Parameters.ParamByName('N5').Value:= 0;
        Parameters.ParamByName('N6').Value:= '';
        Parameters.ParamByName('N7').Value:= 0;
        Parameters.ParamByName('N8').Value:= 0;
        ExecSql;
      end;

      for i := 0 to fSL.Count-1 do
      begin
        sData:= fSL[i];
        nGroupNo:= StrToInt(Copy(sData, 1, Pos('|', sData)-1));

        sTemp         := Copy(sData, Pos('|', sData)+1, Length(sData)- Pos('|', sData));
        sGroupName    := Copy(sTemp, 1, Pos('|', sTemp)-1);
        sTemp         := Copy(sTemp, Pos('|', sTemp)+1, Length(sTemp)- Pos('|', sTemp));
        sName         := Copy(sTemp, 1, Pos('|', sTemp)-1);
        sTemp         := Copy(sTemp, Pos('|', sTemp)+1, Length(sTemp)- Pos('|', sTemp));
        sPhoneNo      := Copy(sTemp, 1, Pos('|', sTemp)-1);
        sTemp         := Copy(sTemp, Pos('|', sTemp)+1, Length(sTemp)- Pos('|', sTemp));
        sCarNo        := MG_StrTrim(Copy(sTemp, 1, Pos('|', sTemp)-1), ' ');
        sTemp         := Copy(sTemp, Pos('|', sTemp)+1, Length(sTemp)- Pos('|', sTemp));
        sCompName     := Copy(sTemp, 1, Pos('|', sTemp)-1);
        sTemp         := Copy(sTemp, Pos('|', sTemp)+1, Length(sTemp)- Pos('|', sTemp));
        sTelNo        := Copy(sTemp, 1, Pos('|', sTemp)-1);
        sTemp         := Copy(sTemp, Pos('|', sTemp)+1, Length(sTemp)- Pos('|', sTemp));
        sBigo         := Copy(sTemp, 1, Pos('|', sTemp)-1);
        sTemp         := Copy(sTemp, Pos('|', sTemp)+1, Length(sTemp)- Pos('|', sTemp));
        sCarType      := Copy(sTemp, 1, Pos('|', sTemp)-1);
        sTemp         := Copy(sTemp, Pos('|', sTemp)+1, Length(sTemp)- Pos('|', sTemp));
        sIssueDate    := Copy(sTemp, 1, Pos('|', sTemp)-1);
        sTemp         := Copy(sTemp, Pos('|', sTemp)+1, Length(sTemp)- Pos('|', sTemp));
        nIssueAmt     := StrToInt(Copy(sTemp, 1, Pos('|', sTemp)-1));
        sTemp         := Copy(sTemp, Pos('|', sTemp)+1, Length(sTemp)- Pos('|', sTemp));
        sExpSDate     := Copy(sTemp, 1, Pos('|', sTemp)-1);
        sTemp         := Copy(sTemp, Pos('|', sTemp)+1, Length(sTemp)- Pos('|', sTemp));
        sExpEDate     := Copy(sTemp, 1, Pos('|', sTemp)-1);
        sTemp         := Copy(sTemp, Pos('|', sTemp)+1, Length(sTemp)- Pos('|', sTemp));
        sValetChk     := MG_StrTrim(Copy(sTemp, 1, Pos('|', sTemp)-1), ' ');
        sTemp         := Copy(sTemp, Pos('|', sTemp)+1, Length(sTemp)- Pos('|', sTemp));
        nJumCode      := StrToInt(Copy(sTemp, 1, Pos('|', sTemp)-1));
        sTemp         := Copy(sTemp, Pos('|', sTemp)+1, Length(sTemp)- Pos('|', sTemp));
        nJasmineDCTime:= StrToInt(MG_StrTrim(sTemp, ' '));
        Inc(nTKNo);
        sTKNo:= MG_InsZero(IntToStr(nTKNo), 10);

        if sValetChk =  'Y' then
          nValet:= 1
        else
          nValet:= 0;

        if nJumCode = 0 then
        begin
          //??????????...
          Close;
          SQL.Clear;
          SQL.Add('Select * from CustInfo where CarNo = :N1');
          Parameters.ParamByName('N1').Value:= sCarNo;
          Open;

          if RecordCount <= 0 then
          begin
            //???? ?????????????? ?????? Insert...
            Close;
            SQL.Clear;
            SQL.Add('Insert into CustInfo ');
            SQL.Add('(ParkNo, TKType, GroupNo, Name, TelNo, CarNo, CompName, ');
            SQL.Add('DeptName, Address, IssueDate, IssueAmt, Status, ExpDateF, ');
            SQL.Add('ExpDateT, WPNo, LastParkNo, LastUnitNo, LastUseDate, LastUseTime, ');
            SQL.Add('IOStatusNo, CurrAmt, TKNo, APB, CarType, Reserve1, ');
            SQL.Add('JumCode, JasmineDCTime, ValetChk, DataChk, UDate, UTime ) ');
            SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, ');
            SQL.Add(':N11, :N12, :N13, :N14, :N15, :N16, :N17, :N18, :N19, :N20, ');
            SQL.Add(':N21, :N22, :N23, :N24, :N25, :N26, :N27, :N28, :N29, :N30, :N31)');
            Parameters.ParamByName('N1' ).Value:= nCurrParkNo;
            Parameters.ParamByName('N2' ).Value:= 2;
            Parameters.ParamByName('N3' ).Value:= 999;
            Parameters.ParamByName('N4' ).Value:= sName;
            Parameters.ParamByName('N5' ).Value:= sPhoneNo;
            Parameters.ParamByName('N6' ).Value:= sCarNo;
            Parameters.ParamByName('N7' ).Value:= sCompName;
            Parameters.ParamByName('N8' ).Value:= sTelNo;
            Parameters.ParamByName('N9' ).Value:= sBigo;
            Parameters.ParamByName('N10').Value:= sIssueDate;
            Parameters.ParamByName('N11').Value:= nIssueAmt;
            Parameters.ParamByName('N12').Value:= 0;
            Parameters.ParamByName('N13').Value:= sExpSDate;
            Parameters.ParamByName('N14').Value:= sExpEDate;
            Parameters.ParamByName('N15').Value:= 1;
            Parameters.ParamByName('N16').Value:= 0;
            Parameters.ParamByName('N17').Value:= 0;
            Parameters.ParamByName('N18').Value:= FormatDateTime('YYYY-MM-DD', Now);
            Parameters.ParamByName('N19').Value:= FormatDateTime('HH:NN:SS', Now);
            Parameters.ParamByName('N20').Value:= 2;
            Parameters.ParamByName('N21').Value:= 0;
            Parameters.ParamByName('N22').Value:= sTKNo;
            Parameters.ParamByName('N23').Value:= 3;
            Parameters.ParamByName('N24').Value:= 1;
            Parameters.ParamByName('N25').Value:= sCarType;
            Parameters.ParamByName('N26').Value:= nJumCode;
            Parameters.ParamByName('N27').Value:= nJasmineDCTime;
            Parameters.ParamByName('N28').Value:= nValet;
            Parameters.ParamByName('N29').Value:= 1;
            Parameters.ParamByName('N30').Value:= sFileDate;
            Parameters.ParamByName('N31').Value:= sFileTime;
            ExecSql;
            Inc(nGoodCnt);
          end
          else
          begin
            Inc(nErrCnt);
            sErrorLog:= sErrorLog + MG_Left(sCarNo, 12) + '-?????????? ?????? ????' + #13#10;
          end;
        end
        else
        if nJumCode = nCurrJumCode then
        begin
          //??????????...
          Close;
          SQL.Clear;
          SQL.Add('Select * from CustInfo where CarNo = :N1');
          Parameters.ParamByName('N1').Value:= sCarNo;
          Open;

          if RecordCount <= 0 then
          begin
            //???? ?????????????? ?????? Insert...
            Close;
            SQL.Clear;
            SQL.Add('Insert into CustInfo ');
            SQL.Add('(ParkNo, TKType, GroupNo, Name, TelNo, CarNo, CompName, ');
            SQL.Add('DeptName, Address, IssueDate, IssueAmt, Status, ExpDateF, ');
            SQL.Add('ExpDateT, WPNo, LastParkNo, LastUnitNo, LastUseDate, LastUseTime, ');
            SQL.Add('IOStatusNo, CurrAmt, TKNo, APB, CarType, Reserve1, ');
            SQL.Add('JumCode, JasmineDCTime, ValetChk, DataChk, UDate, UTime ) ');
            SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, ');
            SQL.Add(':N11, :N12, :N13, :N14, :N15, :N16, :N17, :N18, :N19, :N20, ');
            SQL.Add(':N21, :N22, :N23, :N24, :N25, :N26, :N27, :N28, :N29, :N30, :N31)');
            Parameters.ParamByName('N1' ).Value:= nCurrParkNo;
            Parameters.ParamByName('N2' ).Value:= 2;
            Parameters.ParamByName('N3' ).Value:= 999;
            Parameters.ParamByName('N4' ).Value:= sName;
            Parameters.ParamByName('N5' ).Value:= sPhoneNo;
            Parameters.ParamByName('N6' ).Value:= sCarNo;
            Parameters.ParamByName('N7' ).Value:= sCompName;
            Parameters.ParamByName('N8' ).Value:= sTelNo;
            Parameters.ParamByName('N9' ).Value:= sBigo;
            Parameters.ParamByName('N10').Value:= sIssueDate;
            Parameters.ParamByName('N11').Value:= nIssueAmt;
            Parameters.ParamByName('N12').Value:= 0;
            Parameters.ParamByName('N13').Value:= sExpSDate;
            Parameters.ParamByName('N14').Value:= sExpEDate;
            Parameters.ParamByName('N15').Value:= 1;
            Parameters.ParamByName('N16').Value:= 0;
            Parameters.ParamByName('N17').Value:= 0;
            Parameters.ParamByName('N18').Value:= FormatDateTime('YYYY-MM-DD', Now);
            Parameters.ParamByName('N19').Value:= FormatDateTime('HH:NN:SS', Now);
            Parameters.ParamByName('N20').Value:= 2;
            Parameters.ParamByName('N21').Value:= 0;
            Parameters.ParamByName('N22').Value:= sTKNo;
            Parameters.ParamByName('N23').Value:= 3;
            Parameters.ParamByName('N24').Value:= 1;
            Parameters.ParamByName('N25').Value:= sCarType;
            Parameters.ParamByName('N26').Value:= nJumCode;
            Parameters.ParamByName('N27').Value:= nJasmineDCTime;
            Parameters.ParamByName('N28').Value:= nValet;
            Parameters.ParamByName('N29').Value:= 1;
            Parameters.ParamByName('N30').Value:= sFileDate;
            Parameters.ParamByName('N31').Value:= sFileTime;
            ExecSql;
            Inc(nGoodCnt);
          end
          else
          begin
            //???? ?????????????? ?????? ???????????????? ?????????????? ????...
            //?????????????? ???????????? ?????? ?????????? ????????????...
            nDataChk:= FieldByName('DataChk').AsInteger;

            if nDataChk = 1 then
            begin
              //???????????????? ????????...
              Close;
              SQL.Clear;
              SQL.Add('Update CustInfo ');
              SQL.Add('Set Name = :N1, TelNo = :N2, CompName = :N3, DeptName = :N4, ');
              SQL.Add('Address = :N5, Status = :N6, APB = :N7, Reserve1 = :N8, ');
              SQL.Add('ExpDateF = :N9, ExpDateT = :N10, JasmineDCTime = :N11, ValetChk = :N12, ');
              SQL.Add('UDate = :N13, UTime = :N14 ');
              SQL.Add('Where ParkNo = :N15 and TKType = :N16 and CarNo = :N17');
              Parameters.ParamByName('N1' ).Value:= sName;
              Parameters.ParamByName('N2' ).Value:= sPhoneNo;
              Parameters.ParamByName('N3' ).Value:= sCompName;
              Parameters.ParamByName('N4' ).Value:= sTelNo;
              Parameters.ParamByName('N5' ).Value:= sBigo;
              Parameters.ParamByName('N6' ).Value:= 0;
              Parameters.ParamByName('N7' ).Value:= 3;
              Parameters.ParamByName('N8' ).Value:= sCarType;
              Parameters.ParamByName('N9' ).Value:= sExpSDate;
              Parameters.ParamByName('N10').Value:= sExpEDate;
              Parameters.ParamByname('N11').Value:= nJasmineDCTime;
              Parameters.ParamByName('N12').Value:= nValet;
              Parameters.ParamByName('N13').Value:= sFileDate;
              Parameters.ParamByName('N14').Value:= sFileTime;
              Parameters.ParamByName('N15').Value:= nCurrParkNo;
              Parameters.ParamByName('N16').Value:= 2;
              Parameters.ParamByName('N17').Value:= sCarNo;
              ExecSql;
              Inc(nGoodCnt);
            end
            else
            begin
              Inc(nErrCnt);
              sErrorLog:= sErrorLog + MG_Left(sCarNo, 12) + '-?????????? ?????? ????' + #13#10;
            end;
          end;
        end;
      end;
      dmTables.ADODB.CommitTrans;
    end;
    sFTPResponse:= FormatDateTime('YYYYMMDDHHNNSS', Now) + '|' + IntToStr(nCurrJumCode) + '|' + IntToStr(nGoodCnt) + '|Y' + #13#10;

    if sErrorLog <> '' then
      sFTPError:= FormatDateTime('YYYYMMDDHHNNSS', Now) + '|' + IntToStr(nCurrJumCode) + '|' + IntToStr(nErrCnt) + '|N' + #13#10 + sErrorLog;
  except
    on E: Exception do
    begin
      dmTables.ADODB.RollbackTrans;
      ExceptLogging('TfrmMain.TxtToDB: ' + sCarNo + ' ?????? ' + aString(E.Message));
      sErrorLog:= sErrorLog + aString(E.Message) + #13#10;
      sFTPError:= FormatDateTime('YYYYMMDDHHNNSS', Now) + '|' + IntToStr(nCurrJumCode) + '|0|N' + #13#10 +
                  sErrorLog;
    end;
  end;

  finally
    fSL.Free;
  end;
end;

procedure TfrmMain.DBFieldAdd;
begin
  try
    with dmTables.qryAddField do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from INFORMATION_SCHEMA.COLUMNS where table_name = :N1 and column_name = :N2');
      Parameters.ParamByName('N1').Value:= 'CustInfo';
      Parameters.ParamByName('N2').Value:= 'JumCode';
      Open;

      if RecordCount <= 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('ALTER TABLE CustInfo ADD JumCode SmallInt Not Null DEFAULT ((0))');
        ExecSQL;
      end;

      Close;
      SQL.Clear;
      SQL.Add('select * from INFORMATION_SCHEMA.COLUMNS where table_name = :N1 and column_name = :N2');
      Parameters.ParamByName('N1').Value:= 'CustInfo';
      Parameters.ParamByName('N2').Value:= 'JasmineDCTime';
      Open;

      if RecordCount <= 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('ALTER TABLE CustInfo ADD JasmineDCTime SmallInt Not Null DEFAULT ((0))');
        ExecSQL;
      end;

      Close;
      SQL.Clear;
      SQL.Add('select * from INFORMATION_SCHEMA.COLUMNS where table_name = :N1 and column_name = :N2');
      Parameters.ParamByName('N1').Value:= 'CustInfo';
      Parameters.ParamByName('N2').Value:= 'ValetChk';
      Open;

      if RecordCount <= 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('ALTER TABLE CustInfo ADD ValetChk TinyInt Not Null DEFAULT ((1))');
        ExecSQL;
      end;

      Close;
      SQL.Clear;
      SQL.Add('select * from INFORMATION_SCHEMA.COLUMNS where table_name = :N1 and column_name = :N2');
      Parameters.ParamByName('N1').Value:= 'CustInfo';
      Parameters.ParamByName('N2').Value:= 'DataChk';
      Open;

      if RecordCount <= 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('ALTER TABLE CustInfo ADD DataChk TinyInt Not Null DEFAULT ((0))');
        ExecSQL;
      end;

      Close;
      SQL.Clear;
      SQL.Add('select * from INFORMATION_SCHEMA.COLUMNS where table_name = :N1 and column_name = :N2');
      Parameters.ParamByName('N1').Value:= 'CustInfo';
      Parameters.ParamByName('N2').Value:= 'UDate';
      Open;

      if RecordCount <= 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('ALTER TABLE CustInfo ADD UDate Char(10) Null');
        ExecSQL;
      end;

      Close;
      SQL.Clear;
      SQL.Add('select * from INFORMATION_SCHEMA.COLUMNS where table_name = :N1 and column_name = :N2');
      Parameters.ParamByName('N1').Value:= 'CustInfo';
      Parameters.ParamByName('N2').Value:= 'UTime';
      Open;

      if RecordCount <= 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('ALTER TABLE CustInfo ADD UTime Char(8) Null');
        ExecSQL;
      end;

      Close;
      SQL.Clear;
      SQL.Add('select * from INFORMATION_SCHEMA.COLUMNS where table_name = :N1 and column_name = :N2');
      Parameters.ParamByName('N1').Value:= 'IONData';
      Parameters.ParamByName('N2').Value:= 'JasmineDCTime';
      Open;

      if RecordCount <= 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('ALTER TABLE IONData ADD JasmineDCTime SmallInt Not Null DEFAULT ((0))');
        ExecSQL;
      end;

      Close;
      SQL.Clear;
      SQL.Add('select * from INFORMATION_SCHEMA.COLUMNS where table_name = :N1 and column_name = :N2');
      Parameters.ParamByName('N1').Value:= 'IONData';
      Parameters.ParamByName('N2').Value:= 'JasmineYN';
      Open;

      if RecordCount <= 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('ALTER TABLE IONData ADD JasmineYN TinyInt Not Null DEFAULT ((0))');
        ExecSQL;
      end;
    end;
  except
    on E: Exception do
    begin
      ExceptLogging('TfrmMain.DBFieldAdd: ' + aString(E.Message));
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

    case nCmd of
      2:
        begin
          if not tRecog.Enabled then
            tRecog.Enabled:= True;
        end;
    end;
    sErrRecv := '';
  except
    on E: Exception do
      ExceptLogging('TfrmMain.idTSExecute: ' + aString(E.Message));
  end;
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
          ExceptLogging('UnitCtrl(' + IntToStr(nCmd) + ')?? ???????? ????!');
      end;
    end;
  except
    on E: Exception do ExceptLogging('TfrmMain.UnitCtrl: ' + aString(E.Message));
  end;
end;

procedure TfrmMain.z1Click(Sender: TObject);
begin
  NextModalDialog(TfrmValetCard.Create(Self));
end;

procedure TfrmMain.btnBar10Click(Sender: TObject);
var
  sReason: aString;
begin
  sReason:= InputBox('????????????', '???????????????????? ??????????????!', '');
  UnitCtrl(1, btnBar10.ImageIndex, btnBar10.Tag, nCurrMNo, sReason);
end;

procedure TfrmMain.btnBar11Click(Sender: TObject);
var
  sReason: aString;
begin
  sReason:= InputBox('????????????', '???????????????????? ??????????????!', '');
  UnitCtrl(1, btnBar11.ImageIndex, btnBar11.Tag, nCurrMNo, sReason);
end;

procedure TfrmMain.btnBar12Click(Sender: TObject);
var
  sReason: aString;
begin
  sReason:= InputBox('????????????', '???????????????????? ??????????????!', '');
  UnitCtrl(1, btnBar12.ImageIndex, btnBar12.Tag, nCurrMNo, sReason);
end;

procedure TfrmMain.btnBar13Click(Sender: TObject);
var
  sReason: aString;
begin
  sReason:= InputBox('????????????', '???????????????????? ??????????????!', '');
  UnitCtrl(1, btnBar13.ImageIndex, btnBar13.Tag, nCurrMNo, sReason);
end;

procedure TfrmMain.btnBar14Click(Sender: TObject);
var
  sReason: aString;
begin
  sReason:= InputBox('????????????', '???????????????????? ??????????????!', '');
  UnitCtrl(1, btnBar14.ImageIndex, btnBar14.Tag, nCurrMNo, sReason);
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

procedure TfrmMain.btnClearClick(Sender: TObject);
begin
  // ???? ????????
  try
    StatusLogging('???? ???? ????????');
    if MessageDlg('???? ???? ???????? ?????????????', mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;

    mp1.Stop;
    mp1.Rewind;
    mp1.Notify := False;

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

procedure TfrmMain.btnModifyClick(Sender: TObject);
begin
  NextModalDialog(TfrmCarNoModify.Create(Self));
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  try
    CreateFileMapping( $FFFFFFFF, nil, PAGE_READWRITE, 0, 1, 'Parking_HOST' );

    if GetLastError=ERROR_ALREADY_EXISTS then
    begin
      ShowMessage('?????????????????? ???? ????????????.'#13#13#10 + '??????????????!');
      halt;
    end;
    sCurrRunDir:= aString(ExtractFileDir(Application.ExeName));

    if not DirectoryExists('Log') then MkDir('Log');
    if not DirectoryExists('DeviceStatus') then  MkDir('DeviceStatus');
  except
    on E: Exception do ExceptLogging('TfrmMain.FormCreate: ' + aString(E.Message));
  end;
end;

procedure TfrmMain.FormResize(Sender: TObject);
begin
  Panel7.Width:= frmMain.ClientWidth div 2;
  Panel5.Width:= Panel4.Width div 2;
  Panel2.Height:= (frmMain.ClientHeight - sb1.Height - CoolBar1.Height) div 4 * 3;
  Panel4.Height:= (Panel2.Height) div 2;
  dgSCIn.Columns[1].Width := panel7.Width div 6;
  dgSCIn.Columns[2].Width := panel7.Width div 6;
  dgSCIn.Columns[3].Width := panel7.Width div 6;
  dgSCIn.Columns[4].Width := panel7.Width div 6;
  dgSCIn.Columns[5].Width := panel7.Width div 6;
  dgSCOut.Columns[1].Width := panel8.Width div 6;
  dgSCOut.Columns[2].Width := panel8.Width div 6;
  dgSCOut.Columns[3].Width := panel8.Width div 6;
  dgSCOut.Columns[4].Width := panel8.Width div 6;
  dgSCOut.Columns[5].Width := panel8.Width div 6;
  dgIONData.Columns[1].Width := panel5.Width div 7;
  dgIONData.Columns[2].Width := panel5.Width div 7;
  dgIONData.Columns[3].Width := panel5.Width div 7;
  dgIONData.Columns[4].Width := panel5.Width div 7;
  dgIONData.Columns[5].Width := panel5.Width div 7;
  dgIONData.Columns[6].Width := panel5.Width div 7;
  grdStatus.Width := panel3.Width div 3 * 2;
  grdStatus.ColWidths[1] := grdStatus.Width div 7;
  grdStatus.ColWidths[2] := grdStatus.Width div 7;
  grdStatus.ColWidths[3] := grdStatus.Width div 7;
  grdStatus.ColWidths[4] := grdStatus.Width div 7;
  grdStatus.ColWidths[5] := grdStatus.Width div 7;
  grdStatus.ColWidths[6] := grdStatus.Width div 7;
  btnClear.Left := panel15.Width - btnClear.Width;   // ???????? ????????
end;

procedure TfrmMain.FormShow(Sender: TObject);
var
  sDBString: aString;
  SystemTime: TSystemTime;
  sDateTime, sYear, sMonth, sDay, sHour, sMin, sSec: String;
  i: Byte;
begin
  try
    ExceptLogging('Program Start!');
    iSetup:= TIniFile.Create(ExtractFileDir(Application.ExeName) + '\ParkSet.ini');
    sDBIP:= aString(iSetup.ReadString('PARKING', 'DB IP', ''));
    sDBID:= aString(iSetup.ReadString('PARKING', 'DB ID', ''));
    sDBPW:= aString(iSetup.ReadString('PARKING', 'DB PW', ''));
    sDBName:= iSetup.ReadString('PARKING', 'DB Name', '');
    sLastFTPTime:= iSetup.ReadString('PARKING', 'FTP File', '');
    nCurrJumCode:= iSetup.ReadInteger('PARKING', 'Jum Code', 410);
    nValetUnitNo :=  iSetup.ReadInteger('PARKING', 'ValetUnitNo', 0);
    pnBar.Top:= (frmMain.ClientHeight - pnBar.Height) div 2;
    pnBar.Left:= (frmMain.ClientWidth - pnBar.Width) div 2;
    sImageDir:= 'C:\LPRImage';
    sAlarmFile:= iSetup.ReadString('PARKING', 'Alarm File', '');
    nLoadTime:= StrToInt(iSetup.ReadString('PARKING', 'Load Time', '20'));
    timer1.Interval:= nLoadTime * 1000;

    if FileExists(sAlarmFile) then
    begin
      mp1.FileName:= sAlarmFile;
      mp1.Open;
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

        if FieldByName('Reserve1').AsString = '????????' then
          lbOperation.Visible:= True;
      end
      else
        ExceptLogging('?????? ???????? ????!');

      Close;
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
          end;
          i:= i+1;
          Next;
        end;
        btnBar.Enabled:= True;
      end;

      Close;
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
            TAdvToolButton(FindComponent('btnBar' + IntToStr(i))).Caption:= FieldByName('UnitName').AsString;
            TAdvToolButton(FindComponent('btnBar' + IntToStr(i))).Hint:= wString(MG_StrTrim(aString(FieldByName('IPNo').AsString), ' '));
            TAdvToolButton(FindComponent('btnBar' + IntToStr(i))).GroupIndex:= FieldByName('PortNo').AsInteger;
            TAdvToolButton(FindComponent('btnBar' + IntToStr(i))).Tag:= FieldByName('UnitNo').AsInteger;
            TAdvToolButton(FindComponent('btnBar' + IntToStr(i))).ImageIndex:= FieldByName('MyNo').AsInteger;
            TAdvToolButton(FindComponent('btnBar' + IntToStr(i))).Visible:= True;
          end;
          i:= i+1;
          Next;
        end;
        btnBar.Enabled:= True;
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
           ShowMessage('???????? ?????????? ????????.');
           Close;
           Exit;
      end;
    end;
    idTS.Active:= True;
    FormAlign;
    // ??????????????????
    GridData;
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

procedure TfrmMain.mp1Notify(Sender: TObject);
begin
  with mp1 do
  begin
    if NotifyValue = nvSuccessful then
    begin
      Notify := True;
      Play;
    end;
  end;
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
  NextModalDialog(TfrmValIOCnt.Create(Self));
end;

procedure TfrmMain.N38Click(Sender: TObject);
begin
  NextModalDialog(TfrmAPTKProc.Create(Self));
end;

procedure TfrmMain.N40Click(Sender: TObject);
begin
  NextModalDialog(TfrmInputData.Create(Self));
end;

procedure TfrmMain.N41Click(Sender: TObject);
begin
  NextModalDialog(TfrmAnalysis.Create(Self));
end;

procedure TfrmMain.N42Click(Sender: TObject);
begin
  NextModalDialog(TfrmIOVData.Create(Self));
end;

procedure TfrmMain.N43Click(Sender: TObject);
begin
  NextModalDialog(TfrmDailyIOCnt.Create(Self));
end;

procedure TfrmMain.N44Click(Sender: TObject);
begin
  NextModalDialog(TfrmMagam.Create(Self));
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
      SQL.Add('Select * from IOSData where ProcDate = :N1 and InIOStatusNo = :N2 ');
      SQL.Add('Order By ProcTime Desc');
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
      //SQL.Add('Select Count(*) nIn from IONData where ProcDate = :N1 and Status = :N2 and OutChk <> :N3');
      SQL.Add('Select Count(*) nIn from IONData where ProcDate = :N1 and Status = :N2');               // ????????????????
      Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', Now);
      Parameters.ParamByName('N2').Value:= 1;
     // Parameters.ParamByName('N3').Value:= 7;
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
    end;
    pnIONData.Caption:= '???? : ' + IntToStr(nNIn) + '??,  ???? : ' + IntToStr(nNOut) + '??';
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

procedure TfrmMain.SpeedButton1Click(Sender: TObject);
begin
  NextModalDialog(TfrmAlarm.Create(Self));

  if FileExists(sAlarmFile) then
  begin
    mp1.FileName:= sAlarmFile;
    mp1.Open;
  end;
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
  NextModalDialog(TfrmCGVData.Create(Self));
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

procedure TfrmMain.t1Click(Sender: TObject);
begin
  NextModalDialog(TfrmVanList.Create(Self));
end;

procedure TfrmMain.tCountTimer(Sender: TObject);
var
  sTempTime: aString;
begin
  try
    with qryRecogChk do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select Count(*) nRecogCnt from IONData where ProcDate = :N1 and ');
      SQL.Add('(InRecog1 > 1) and Reserve1 <> :N2 and OutChk = :N3');
      Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', Now);
      Parameters.ParamByName('N2').Value:= '????????';
      Parameters.ParamByName('N3').Value:= 0;
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

    if nMichulKeep > 0 then
    begin
      sTempTime:= FormatDateTime('YYYY-MM-DD', Now);

      if sPrvMichulKeep < sTempTime then
      begin
        with qryMainTemp2 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Update IONData Set OutChk = :N1, Reserve1 = :N2 where ProcDate < :N3 and OutChk = 0');
          Parameters.ParamByName('N1').Value:= 7;
          Parameters.ParamByName('N2').Value:= '??????????????(' + sTempTime + ')';
          Parameters.ParamByName('N3').Value:= MG_AddDate(sTempTime, -nMichulKeep);
          ExecSQL;
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
  // 20?????? ???????????? ???????? ????
  GridData;
end;

// 5?????? timer ?????? ?????? ????
procedure TfrmMain.tJasmineTimer(Sender: TObject);
var
  sFileTime: aString;
  hFile: THandle;
begin
  try
    sJasmineFile:= 'C:\Jasmine\jasmin_car.txt';

    if FileExists(sJasmineFile) then
    begin
      hFile:= FileOpen(sJasmineFile, fmOpenRead or fmShareDenyNone);
      Try
        sFileTime:= FormatDateTime('YYYY-MM-DD HH:NN:SS', FileDateTODateTime(FileGetDate(hFile)));

        if sLastFTPTime < sFileTime then
        begin
          iSetup.WriteString('PARKING', 'FTP File', sFileTime);      // FTP File -> ?????? ??????(?) ????
          sLastFTPTime:= sFileTime;

          //DB?? ???????? ??????.
          TxtToDB;
          FTPPutFile;
        end;
      Finally
        FileClose(hFile);
      end;
    end
    else
      ExceptLogging('jasmine_car ???? ????');
  except
    on E: Exception do ExceptLogging('TfrmMain.tJasmineTimer: ' + aString(E.Message));
  end;
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

procedure TfrmMain.tStartTimer(Sender: TObject);
begin
  tStart.Enabled:= False;
  mp1.Play;
  mp1.Notify := True;
end;

procedure TfrmMain.FormAlign;
begin
  with grdStatus do
  begin
    ColWidths[0] := 30;
    ColWidths[1] := 70;   Alignments[1, 0] := taCenter;   // ????????
    ColWidths[2] := 150;  Alignments[2, 0] := taCenter;   // ??????
    ColWidths[3] := 100;  Alignments[3, 0] := taCenter;   // ??????
    ColWidths[4] := 200;  Alignments[4, 0] := taCenter;   // ????????
    ColWidths[5] := 100;  Alignments[5, 0] := taCenter;   // ????????
    ColWidths[6] := 100;  Alignments[6, 0] := taCenter;   // ????????
  end;
end;

procedure TfrmMain.GridData;
var
  sCarNo, sIOTime, sStatus, sTemp, sDate, sTime: String;
  i: Byte;
begin
  try

    // formShow ???? DeviceStatus ?????? ????
    with qryDeviceStatus do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * From DeviceStatus ');
      SQL.Add('where DeviceStatus = 0 order by DeviceStatusDate, DeviceStatusTime');
      Open;

      if RecordCount > 0 then
      begin
        // ???????? ???????? ?????? true
        if FileExists(mp1.FileName) then
        begin
          tStart.Enabled:= True;
        end
        else
          StatusLogging('?????? ????????: ' + mp1.FileName);
      end
      else
      begin
        mp1.Notify := False;
        mp1.Stop;
        mp1.Rewind;
      end;
    end;
  except
    on E: Exception do StatusLogging('TfrmMain.GridData: ' + aString(E.Message));
  end;
end;

end.
