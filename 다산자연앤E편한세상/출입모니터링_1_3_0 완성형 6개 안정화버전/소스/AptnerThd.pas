unit AptnerThd;

interface

uses
  System.Classes, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, System.SysUtils, CodeSiteLogging, IdGlobal, Vcl.Forms, Winapi.Windows, IdStack, IdException,
  IdHTTP, IdURI, IdThread, Data.DBXJSON, IdSSLOpenSSL, Web.HTTPApp, Winapi.Messages, SyncObjs, System.Generics.Collections,
  System.IniFiles, Global;

type
  TaptnerInfo = record
    exeTag: Integer;
    aptner_Carno: string;
    aptner_Aptcode: string;
    aptner_Dong: string;
    aptner_Ho: string;
    aptner_IsResident: string;
  end;


  TAptnerThread = class(TThread)
  private
    { Private declarations }
    sendStrs: TStrings;
    guard: TCriticalSection;
    aptnQue: TQueue<TaptnerInfo>;
    procedure mzLog(inMsg: aString);
    procedure tcpSocketCreate;

  protected

    procedure Execute; override;

  public
    aptnInfo: TaptnerInfo;
    idHttp: TIdHTTP;
    LHandler: TIdSSLIOHandlerSocketOpenSSL;
    closeSignal: Integer;

    constructor Create(visitAuth,visitCheck,visitInCar,visitOutCar: string);
    destructor Destroy; override;
    procedure GiveInCarData(aptnObj: TaptnerInfo);
    procedure GiveOutCarData(aptnObj: TaptnerInfo);
    function ResponseCodeLog(inOutName: string; code: Integer): string;
    procedure AptnPush;
    procedure AptnPop;

  end;


implementation

const
//  APTNER_ADDRESS_VISITCHECK = 'https://devgtw.aptner.com/pc/visit/check?';
//  APTNER_ADDRESS_INCAR = 'https://devgtw.aptner.com/pc/access/in';
//  APTNER_ADDRESS_OUTCAR = 'https://devgtw.aptner.com/pc/access/out';

//  APTNER_AUTH_VISITCHECK = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJORVhQQSIsInJvbGVzIjoiUEMiLCJpc3MiOiJBUFRORVIiLCJleHAiOjMxNDE5NjE3NzQsImlkeCI6IiIsImlhdCI6MTU2NDAzODU3NH0.Dl7vkkeOA-QJH82AuBQux7rq5wsUVqr7F9o9h0BttiE';
//  APTNER_AUTH_INCAR =      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJORVhQQSIsInJvbGVzIjoiUEMiLCJpc3MiOiJBUFRORVIiLCJleHAiOjMxNDE5NjE3NzQsImlkeCI6IiIsImlhdCI6MTU2NDAzODU3NH0.Dl7vkkeOA-QJH82AuBQux7rq5wsUVqr7F9o9h0BttiE';
//  APTNER_AUTH_OUTCAR =     'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJORVhQQSIsInJvbGVzIjoiUEMiLCJpc3MiOiJBUFRORVIiLCJleHAiOjMxNDE5NjE3NzQsImlkeCI6IiIsImlhdCI6MTU2NDAzODU3NH0.Dl7vkkeOA-QJH82AuBQux7rq5wsUVqr7F9o9h0BttiE';

  INCAR = '????:';
  OUTCAR = '????:';

var
  APTNER_ADDRESS_VISITCHECK: string;
  APTNER_ADDRESS_INCAR: string;
  APTNER_ADDRESS_OUTCAR: string;
  APTNER_AUTH: string;

{ TTestThread }

procedure TAptnerThread.AptnPop;
var
  aptnObj: TaptnerInfo;
begin
  try
    if aptnQue.Count > 0 then begin
      aptnObj := aptnQue.Dequeue();
      if aptnObj.exeTag = 1 then begin
        GiveInCarData(aptnObj);
      end else if aptnObj.exeTag = 2 then begin
        GiveOutCarData(aptnObj);
      end else begin

      end;
      ZeroMemory(@aptnObj,SizeOf(aptnObj));
    end else begin

    end;
  except
  on E: Exception do mzLog(e.Message);
  end;
end;

procedure TAptnerThread.AptnPush;
begin
  try
    aptnQue.Enqueue(aptnInfo);
    ZeroMemory(@aptnInfo,SizeOf(aptnInfo));
  except
    on E: Exception do mzLog(e.Message);
  end;
end;

constructor TAptnerThread.Create(visitAuth,visitCheck,visitInCar,visitOutCar: string);
begin
  tcpSocketCreate;
  FreeOnTerminate := False;
  inherited Create(False);
  Priority := tpNormal;
  guard := TCriticalSection.Create;
  aptnQue := TQueue<TaptnerInfo>.Create;
  APTNER_ADDRESS_VISITCHECK := visitCheck;
  APTNER_ADDRESS_INCAR := visitInCar;
  APTNER_ADDRESS_OUTCAR := visitOutCar;
  APTNER_AUTH := visitAuth;

end;

destructor TAptnerThread.Destroy;
begin
  try
    if Assigned(sendStrs) then begin
      FreeAndNil(sendStrs);
    end;
    if Assigned(idHttp) then begin
      idHttp.Disconnect;
      FreeAndNil(idHttp);
    end;
    FreeAndNil(aptnQue);
//    inherited Destroy;
  except
    on E: Exception do mzLog(e.Message);
  end;
end;

procedure TAptnerThread.Execute;
  procedure WaitForTimer(MilliSeconds :  LongInt);
  const
    _SECOND = -10000;
  var
    lBusy : LongInt;
    hTimer : HWND;
    liDueTime : LARGE_INTEGER;
  begin
    hTimer := CreateWaitableTimer(nil, True, 'WaitableTimer');
    if hTimer = 0 then Exit;
    liDueTime.QuadPart := _SECOND * MilliSeconds;
    SetWaitableTimer(hTimer, TLargeInteger(liDueTime), 0, nil, nil, False);
    repeat
            lBusy := MsgWaitForMultipleObjects(1, hTimer, False, INFINITE, QS_ALLINPUT);
            Application.ProcessMessages;
    until lBusy = WAIT_OBJECT_0;
    CloseHandle(hTimer);
  end;
begin
  { Place thread code here }
  while not Terminated do begin
    try
      if closeSignal = 1 then begin
        TerminateThread(Self.Handle,0);
      end;
  //          guard.Acquire;
  //          guard.Release;
  //          SYNCHRONIZE(Main.ShowGetThdData);
  //          PostMessage(Self.Handle, WM_ProcessNextItem, Self.Handle, 0);
  //          SendMessage(frmMain.Handle,WM_USER+1,0, 0);
  //        guard.Release;
      AptnPop;
      Application.ProcessMessages;
      WaitForTimer(100);
    except
      on E: Exception do begin
        WaitForSingleObject(handle, 10000);
        if Self.Suspended = True then self.Resume;
      end;
    end;
  end;
end;

procedure TAptnerThread.GiveInCarData(aptnObj: TaptnerInfo);  //exeTag = 1
  function URLEncode(const AStr: string): string;
  var
    LBytes: TBytes;
    LIndex: Integer;
  begin
    Result := '';
    LBytes := TEncoding.UTF8.GetBytes(AStr);
    for LIndex := Low(LBytes) to High(LBytes) do
      Result := Result + '%' + IntToHex(LBytes[LIndex], 2);
  end;

begin
  try
    try
      idHTTP.Request.ContentType := 'application/x-www-form-urlencoded';
      idHttp.Request.CustomHeaders.Values['Authorization'] := 'Bearer ' + APTNER_AUTH;
      sendStrs.Clear;
//      sendStrs.Add(TIdURI.ParamsEncode('kaptCode='+APTENR_TSETKAPT_CODE));
//      sendStrs.Add(TIdURI.ParamsEncode('carNo='+APTNER_TESTCAR_NO));
//      sendStrs.Add(TIdURI.ParamsEncode('dong='+(APTNER_TEST_DONG)));
//      sendStrs.Add(TIdURI.ParamsEncode('ho='+(APTNER_TEST_HO)));
      sendStrs.Values['kaptCode'] := aptnObj.aptner_Aptcode;
      sendStrs.Values['carNo'] := aptnObj.aptner_Carno;
      sendStrs.Values['dong'] := aptnObj.aptner_Dong;
      sendStrs.Values['ho'] := aptnObj.aptner_Ho;
      sendStrs.Values['IsResident'] := aptnObj.aptner_IsResident;
      mzLog('???????? ????????????: '+sendStrs.Text);
      idHttp.Post(APTNER_ADDRESS_INCAR,sendStrs);
      mzLog(ResponseCodeLog('???????? ????????????: ',idHttp.ResponseCode) + ',' + aptnObj.aptner_Carno);
    finally

    end;
  except
    on E1: EIdConnClosedGracefully do begin
      mzLog(e1.Message);
    end;
    on E2: EIdHTTPProtocolException do begin
      mzLog(e2.Message);
    end;
    on E3: Exception do begin
      mzLog(e3.Message);
    end;
  end;
end;

procedure TAptnerThread.GiveOutCarData(aptnObj: TaptnerInfo);  //exeTag = 2
begin
  try
    try
      idHTTP.Request.ContentType := 'application/x-www-form-urlencoded';
      idHttp.Request.CustomHeaders.Values['Authorization'] := 'Bearer ' + APTNER_AUTH;
      sendStrs.Clear;
      sendStrs.Values['kaptCode'] := aptnObj.aptner_Aptcode;
      sendStrs.Values['carNo'] := aptnObj.aptner_Carno;
      sendStrs.Values['dong'] := aptnObj.aptner_Dong;
      sendStrs.Values['ho'] := aptnObj.aptner_Ho;
      mzLog('???????? ????????????: '+sendStrs.Text);
      idHttp.Post(APTNER_ADDRESS_OUTCAR,sendStrs);
      ResponseCodeLog('????',idHttp.ResponseCode);
//      ZeroMemory(Pointer(aptnInfo.recvArr),Length(aptnInfo.recvArr) * SizeOf(string));
      mzLog(ResponseCodeLog('???????? ????????????: ',idHttp.ResponseCode) + ',' + aptnObj.aptner_Carno);
    finally
//      LHandler.InputBuffer.Clear;
    end;
  except
    on E: Exception do begin
      mzLog(e.Message);
    end;
  end;
end;

procedure TAptnerThread.mzLog(inMsg: aString);
var
  nFile: Integer;
  sFile: aString;
begin
   sFile := sCurrRunDir + '\Log\' + aString(FormatDateTime('YYMMDD', Now)) + '_HomeInfo.log';

   if FileExists(wString(sFile)) then
   begin
      nFile := FileOpen(wString(sFile), fmOpenWrite);
      FileSeek(nFile, 0, 2);
   end
   else
   begin
      nFile := FileCreate(wString(sFile));
   end;

   if nFile <> -1 then
   begin
      sFile := '[' + aString(FormatDateTime('hh:nn:ss', Now)) + '] ' + '<????????> ' + inMsg + #13 + #10;
      FileWrite(nFile, PAnsichar(sFile)^, Length(sFile));
      FileClose(nFile);
   end;
end;

function TAptnerThread.ResponseCodeLog(inOutName: string; code: Integer): string;
begin
  case code of
    200:
      Result := (inOutName+':????,'+IntToStr(code));
    400:
      Result := (inOutName+':Bad Request,'+IntToStr(code));
    401:
      Result := (inOutName+':Unauthorized,'+IntToStr(code));
    403:
      Result := (inOutName+':Forbidden,'+IntToStr(code));
    404:
      Result := (inOutName+':Resource Not Found,'+IntToStr(code));
    405:
      Result := (inOutName+':Method Not Allowed,'+IntToStr(code));
    416:
      Result := (inOutName+':Invalid Parameter,'+IntToStr(code));
    500:
      Result := (inOutName+':Internal Server Error,'+IntToStr(code));
    else
      Result := (inOutName+':?? ?? ???? ????!,'+IntToStr(code));
  end;

end;

procedure TAptnerThread.tcpSocketCreate;
begin
  try
    if idHttp <> nil then FreeAndNil(idHttp);
    idHttp := TIdHTTP.Create(nil);
    LHandler := TIdSSLIOHandlerSocketOpenSSL.Create(idHttp);
//    LHandler.SSLOptions.Method := sslvTLSv1;
    idHttp.IOHandler := LHandler;
//    idHttp.ConnectTimeout := 3000;
//    idHttp.ReadTimeout := 3000;
    idHttp.HandleRedirects := True; // ?????? ???? ????
//    idHttp.RedirectMaximum := 10;
    idHttp.AllowCookies    := True; // ?????? ?????????? SSO ???? ????
    idHttp.Request.BasicAuthentication := False;
    idHttp.ProtocolVersion := pv1_1;
    idHttp.HTTPOptions := [hoForceEncodeParams];
    idHttp.Request.CharSet := 'utf-8';
    idHttp.Request.ContentType := 'application/x-www-form-urlencoded';

    sendStrs := TStringList.Create;
  except
    on ex: Exception do begin
      if Assigned(LHandler) then begin
        FreeAndNil(LHandler);
      end;
      if Assigned(idHttp) then begin
        idHttp.Disconnect;
        FreeAndNil(idHttp);
      end;
      mzLog(ex.Message);
    end;
  end;
end;


end.
