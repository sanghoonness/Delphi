unit Global;

interface
uses
  Windows, SysUtils, Forms, IniFiles, WinInet, Imm, DBGrids, Dialogs, Excel2000, Clipbrd, ActiveX,
  ComObj, Variants;

Const
  ESC = AnsiChar($1B);
  LF  = AnsiChar($0A);
  NUL = AnsiChar($00);
  STX = AnsiChar($02);
  ETX = AnsiChar($03);

type
  aString = AnsiString;
  wString = WideString;
  //Ping용
  IPINFO = Record
    Ttl : Char;             // Time To Live
    Tos : Char;             // Type Of Service
    IPFlags : Char;         // IP flags
    OptSize : Char;         // Size of options data
    Options : pChar;    // Options data buffer
  end;

  ICMPECHO = Record
    Source : ULONG;          // Source address
    Status : ULONG;          // IP status
    RTTime : ULONG;          // Round trip time in milliseconds
    DataSize : SHORT ;       // Reply data size
    Reserved : SHORT ;       // Unknown
    pData    : Pchar;        // Reply data buffer
    ipInfo : IPINFO;         // Reply options
  end;
var
  //메뉴잠금으로 활용... 잠금해제시는 로그인 창 사용토록...
  bMenuLock: Boolean = True;

  sCurrRunDir: aString;               //프로그램 실행폴더
  sDBIP, sDBID, sDBPW, sDBName: aString;       //DB IP, ID, Password
  sClosingTime: aString = '00:00';    //마감기준시간

  bHolidayProc: Boolean = False;     //휴일주차요율 사용여부
  bSaturdayProc: Boolean = False;    //토요일주차요율 사용여부
  bAutoClosing: Boolean = False;     //자동마감여부
  bAutoReceipt: Boolean = False;     //영수증자동발급여부
  bZeorReceipt: Boolean = False;     //주차요금 0원시 영수증발급여부
  bTax: Boolean = True;              //부가세포함여부  True:포함,  False:부가세별도
  bSpecialTariff: Boolean = False;   //특정일자 지정주차요율 적용여부  False:적용안함,  True:적용
  bCommercialTariff: Boolean = False; //영업용차량 지정주차요율 적용여부 False:적용안함,  True:적용
  bParkingDayMax: Boolean = False;   //주차일수에 따른 일일최고요금 사용  False:사용안함,  True:사용함
  bExpireIO: Boolean = False;        //정기차량 기간만료후 출입허용여부  False:출입불가,  True:출입허용
  bAutoCalc: Boolean = True;         //LPR 시스템의 경우 자동요금계산 여부
  bZeroOpen: Boolean = False;        //주차요금 0원시 출구차단기 자동오픈 여부
  bCancel: Boolean = False;          //정산취소 가능여부
  bCancelCheck: Boolean = False;     //정산취소시 확인 메시지 표출여부
  bCancelSave: Boolean = False;      //정산취소시 정산취소테이블 저장여부
  bInterimClosing: Boolean = False;  //중간마감 가능여부
  bInterimPrint: Boolean = False;    //중가마감시 인쇄여부
  bClosingText: Boolean = False;     //마감시 텍스트파일 저장여부
  bClosingReprint: Boolean = False;  //마감내용 재출력 여부
  bReceiptReprint: Boolean = False;  //영수증 재출력 여부
  bManualIn: Boolean = False;        //수동입차 사용 여부
  bCredit: Boolean = False;          //신용카드 결재가능 여부
  bCashReceipt: Boolean = False;     //현금영수증 발급가능 여부
  bCarSearch: Boolean = False;       //LPR 시스템의 경우 차량검색 사용 여부
  bLprSearch: Boolean = False;       //LPR 시스템의 경우 입차차량검색 사용 여부
  bManualOpen: Boolean = False;      //차단기 수동개방 사유기재 여부

  nCurrParkNo: Word = 0;           //주차장번호
  nCurrUnitNo: Word = 0;           //기기번호  0:중앙관리컴퓨터, 1이상 요금계산기 등 장비번호
  nCurrMNo: Word = 0;              //근무자번호
  sCurrMName: String;              //근무자명
  nDayMaxType: Byte = 0;           //1일 최대요금 계산기준  0:24시기준,  1:입차시각부터 24시간
  nJulsaType: Byte = 0;            //절사처리여부  0:사용안함, 1:1원단위, 2:10원단위, 3:100원단위, 4:500원단위
  nRoundType: Byte = 0;            //반올림타입  0:절사,  1:절상
  nTimeDCType: Byte = 0;           //시간할인기준  0:출차시각기점할인,  1:입차시각기점할인
  nMoneyType: Byte = 0;            //화폐종류  0:원단위,  1:달러단위(소수점2자리표시)
  nDCReason: Byte = 0;             //할인시 할인사유기재여부  0:사용안함,  1:할인사유기재
  nLossTicket: Byte = 0;           //분실티켓처리 기준  0:입차시각입력,  1:고정요금
  nManagerAuthority: Byte = 0;     //근무자권한  0:Master,  1:관리자,  2:근무자,  3:정산원
  nDivisionType: Byte = 0;         //부제처리여부  0:사용안함,  1:10부제,  2:2부제,  3:요일제
  nDivisionProc: Byte = 0;         //부제적용방식  0:입차시만,  1:입출차모두적용
  aDivision: Array[1..8] of Boolean;  //부제적용요일  1:월요일.. 7:일요일, 8:공휴일    True시 부제적용
  nExpireDay: Byte = 0;            //정기차량 기간만료후 출입허용일수
  nFCProcType: Byte = 0;           //요금계산기운영방식  0:출구정산방식, 1:사전정산방식, 2:선정산방식
  sImageDir: aString;
  sErrRecv: aString;               //미인식입차 수신용...
  nPingTimeOut: Integer = 10;
  nLoginResult: Byte = 0;

  nApt : Integer = 0;              //0:아파트아님 , 1:아파트
  nStair : Integer = 0;              //0:층별사용안함 , 1:층별사용함

  nRegMoney : Integer = 0;

  //환경설정 저장용 IniFile
  iSetup: TIniFile;
  //ParkingReg: TRegIniFile;

  //미출차일반차량 보관기간
  nMichulKeep: Integer = 0;
  sPrvMichulKeep: String;

  sAlarmNameVip, sAlarmCompNameVip, sAlarmCarNoVip, sAlarmCarTypeVip, sAlarmFileVip, sAlarmYnVip: aString;

  // 알림
  sAlarmFile, sAlarmYn : aString;
  nAlarmTime: Byte = 0;
  nLoadTime: Byte = 0;
  // 부스 장애 알림 변수
  nUnitNo : Word;
  sStatusDate, sStatusTime  :aString;

  nAlarmTimeVip : Byte = 0;


  sImageIP: ansiString;  // 십리포 이미지 IP
  sDcfixed:  ansiString; //   고정할인보여주기여부
  sRfmaster:  ansiString; //   RF등록여부
  sCustInfoConfirm:  ansiString; //   차량수정시 처리부분
  sNotPassCar :  ansiString; //   미출차정산차량
  gGroupdateconvert :  ansiString; //   미출차정산차량
  gVisitRemark: Byte; //H1.0.00 1이면 방문사유  1이면 일반차량입출차내역에 방문사유 나옴
  gpasssecurity : ansiString; //1이면 암호강화 대소문자영문/숫자/특수문자 3개포함 8자리
  bBlockLPRUse : Boolean = False;  //LPR별 진입차단 옵션 사용유무
  nImageUse : Integer;//이미지 처리 여부
  nHomenet_Point  : Integer; //홈넷 포인트 사용 여부
  btnselect  : Integer = 0;
  gnRow  : Integer = 0;  //포인트 엑셀 업로드 변수
  DataCount : Integer;
  imSHanguelUse : Integer; //한글 키 사용 여부
  nHomenet_visit : Integer;//홈넷 사전방문

procedure ToggleHanMode;
procedure ExceptLogging(sMsg: aString);
procedure StatusLogging(sMsg: aString);
function NextModalDialog(Sender: TForm): Integer;
function MG_StrTrim(src: aString; delChar: aString): aString;
function MG_StrStrTrim(src: aString; delChar, delChar1: aString): aString;
function MG_GetString(str: aString; cFmt: aString): aString;
function MG_Replicate(data: aString; count:Integer): aString;
function MG_StrToStr(cStr: aString; cFmt:aString): aString;
function MG_Left  (cString: aString; cLen: integer): aString;
function MG_Center(cString: aString; cLen: integer): aString;
function MG_Right (cString: aString; cLen: integer): aString;
function MG_InsZero(cString: aString; cLen: integer): aString;
function MG_AddDate(cDate: aString; nDay: Integer): aString;
function MG_AddTime(sNowTime: aString; Hour, Min, Sec, MSec: SmallInt): aString;
function toHex(sMsg: aString): aString;
procedure StartProgress(fc, ls: aString; nTotCnt: Integer);
procedure SetProgress(nP: Integer);
procedure EndProgress;
function DownloadFileHTTP(RemoteFileName, LocalFileName: String): Boolean;
function MG_MakeStr(sStr: String): String;
function MG_StrConvert(sSrc, sOrg, sDet: aString): aString;
function MG_NumberCheck(sData: aString): Boolean;
function MessageBoxTimeOut(hWnd: HWND; lpText: PChar; lpCaption: PChar;uType: UINT; wLanguageId: WORD; dwMilliseconds: DWORD): Integer; stdcall;external user32 name 'MessageBoxTimeoutW';
procedure znSave_DBGridToExcel(vDBGrid: TDBGrid);//엑셀 변환
implementation
uses
  Progress;

procedure znSave_DBGridToExcel(vDBGrid: TDBGrid);
var
  excelApp, // excel application
  WorkBook, // excel workbook
  WorkSheet : Variant ; // excel sheet in workbook
  SaveDialog : TSaveDialog ;
  XL: Variant;
  i,k: integer;
  sData: string;
  Format : OleVariant;
begin
  // Initialize
  excelApp := Unassigned ;
  SaveDialog := nil ;

  try

    // Create save dialog and set it options
    SaveDialog := TSaveDialog.Create(vDBGrid.Parent) ;
    with SaveDialog do
    begin
      Title := '저장할 Excel 파일명을 입력하세요.';
      Filter := 'Excel files (*.xlsx)|*.xlsx';
      DefaultExt := 'xlsx';
      Options := [ofOverwritePrompt, ofPathMustExist, ofNoReadOnlyReturn, ofHideReadOnly];
    end ;

    // Execute save dialog
    if SaveDialog.Execute then
    begin

      // Delete entered filename if it exists
      If FileExists(SaveDialog.FileName) then
        DeleteFile(SaveDialog.FileName) ;

      // Create instance of excel
      try
        excelApp := CreateOLEObject('excel.Application') ;
      except
        MessageDLG('엑셀프로그램 실행시 오류 발생',mtError,[mbOK],0) ;
        Raise ;
      end ;

      excelApp.Visible := false ;
      excelApp.WorkBooks.Add ;
      WorkBook := excelApp.ActiveWorkBook ;

      try
        sData := '';
        //if (homenetuse = 0) and (DataCount = 1) then  //홈넷 포인트 사용 안할시
        for i := 0 to vDBGrid.Columns.Count - 1 do
        begin

          sData := sData+vDBGrid.Columns[i].Title.Caption+#9;
          //if vDBGrid.Columns[i].Field.DataType in [ftString,ftMemo,ftWideString] then
          //begin
            excelApp.Workbooks[excelApp.Workbooks.Count].WorkSheets['Sheet1'].Columns[i+1].Select;
            excelApp.Selection.NumberFormatLocal := '@';
          //end;
        end;
        sData := sData+#$D#$A;

        with vDBGrid do
        begin
          k := 0;
          DataSource.DataSet.First;
          while not DataSource.DataSet.Eof do
          begin
            inc(k);
            for i := 0 to Columns.Count - 1 do
              sData := sData+Columns[i].Field.AsString+#9;
            sData := sData+#$D#$A;
            DataSource.DataSet.Next;
          end;
        end;


        Clipboard.SetTextBuf(PChar(sData));
        excelApp.Cells[1,1].Pastespecial;
//          Format := '@';
//          excelApp.Range['D1', 'D1'].NumberFormatLocal := Format;
        //excelApp.Range['A1', 'B1'].NumberFormat := Format;
        //excelApp.Range['A1', Chr(64+vDBGrid.Columns.Count)+IntToStr(k)].select;
        excelApp.Selection.Columns.AutoFit;
        excelApp.Range['A1', 'A1'].select;

      except on E: Exception do
        begin
          ShowMessage('Excel로 자료를 보내는 중 오류가 발생했습니다.'+E.Message);
          Exit;
        end;
      end;

      // Save excel spreadsheet
      WorkBook.SaveAs(SaveDialog.FileName) ;
      WorkBook.Close ;  // excel 메모리 해제

      // Status user
      ShowMessage('엑셀파일을 정상적으로 저장 하였습니다. '+SaveDialog.FileName) ;
    end;
    // 저장파일 실행
    //ShellExecute(Handle, PChar('OPEN'), PChar(SaveDialog.FileName), Nil, Nil, SW_SHOWMAXIMIZED);
    // Free save dialog
    SaveDialog.Free;

  except on E:Exception do // Exceptions
    begin
      // If excel was started, quit it.
      if (excelApp <> Unassigned) then
        excelApp.Quit ;

      if SaveDialog <> nil then
        SaveDialog.Free ;

      // Status user
      MessageDLG('엑셀저장시 오류 발생: '+E.Message, mtError,[mbOK],0) ;

      // Reraise exception
      raise;
    end;
  end; {try}
end;

procedure ToggleHanMode;
var
  Mode: HIMC;
  Conversion, Sentence: dword;
begin
  Mode := ImmGetContext(Application.Handle);
  ImmGetConversionStatus(Mode, Conversion, Sentence);
  if Conversion = IME_CMODE_ALPHANUMERIC then
    ImmSetConversionStatus(Mode, IME_CMODE_HANGEUL, IME_SMODE_NONE)
    //ImmSetConversionStatus(Mode, IME_CMODE_ALPHANUMERIC, IME_SMODE_NONE)
  else
    ImmSetConversionStatus(Mode, IME_CMODE_ALPHANUMERIC, IME_SMODE_NONE);
    //ImmSetConversionStatus(Mode, IME_CMODE_HANGEUL, IME_SMODE_NONE);
end;


procedure ExceptLogging(sMsg: aString);
var
  nFile: Integer;
  sFile: aString;
begin
   sFile := sCurrRunDir + '\Log\' + aString(FormatDateTime('YYMMDD', Now)) + '.log';

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
      sFile := '[' + aString(FormatDateTime('hh:nn:ss', Now)) + '] ' + sMsg + #13 + #10;
      FileWrite(nFile, PAnsichar(sFile)^, Length(sFile));
      FileClose(nFile);
   end;
end;


procedure StatusLogging(sMsg: aString);
var
  nFile: Integer;
  sFile: aString;
begin
   sFile := sCurrRunDir + '\DeviceStatus\' + aString(FormatDateTime('YYMMDD', Now)) + '.log';

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
      sFile := '[' + aString(FormatDateTime('hh:nn:ss', Now)) + '] ' + sMsg + #13 + #10;
      FileWrite(nFile, PAnsichar(sFile)^, Length(sFile));
      FileClose(nFile);
   end;
end;

function NextModalDialog(Sender: TForm): Integer;
begin
  try
    with Sender do
    begin
      ShowModal;
      Result:= ModalResult;
      Free;
    end;
  except
    on E: Exception do
    begin
      ExceptLogging('NextModalDialog: ' + aString(E.Message));
      Result:= 0;
    end;
  end;
end;

function MG_StrTrim(src:aString; delChar:aString): aString;
var
  sBuf: aString;
  i   : Integer;
begin
  sBuf:= '';

  for i:=1 to Length(src) do
    if src[i] <> delChar then sBuf:= sBuf + src[i];

  MG_StrTrim:= sBuf;
end;

function MG_StrStrTrim(src:aString; delChar, delChar1: aString):aString;
var
  sBuf, sImsi: aString;
  i: Integer;
begin
  sBuf:= '';

  for i:=1 to Length(src) do
    if src[i] <> delChar then sBuf:= sBuf + src[i];

  sImsi:= sBuf;
  sBuf:= '';

  for i:= 1 to Length(sImsi) do
    if sImsi[i] <> delChar1 then sBuf:= sBuf + sImsi[i];
  MG_StrStrTrim:= sBuf;
end;

function MG_GetString(str:aString; cFmt:aString): aString;
var
  sBuf: aString;
  i, sLen: Integer;
begin
  sBuf:= '';
  sLen:= Length(cFmt);

  for i:=1 to Length(str) do
  begin
    if      i > sLen      then sBuf:= sBuf + str[i]
    else if cFmt[i] = '#' then sBuf:= sBuf + str[i];
  end;

  MG_GetString:= sBuf;
end;

function MG_Replicate(data: aString; count:Integer): aString;
var
  sBuf: aString;
  i   : Integer;
begin
  sBuf:= '';

  for i:=1 to count do
    sBuf:= sBuf + data;
  Result:= sBuf;
end;

function MG_StrToStr(cStr: aString; cFmt: aString): aString;
var
  cBuf: aString;
  i, j, nSrcLen: Integer;
begin
  j      := 0;
  nSrcLen:= Length(cStr);
  cBuf   := '';

  for i:=1 to Length(cFmt) do
  begin
    case cFmt[i] of
         '#': begin
                j:= j + 1;
                if j > nSrcLen then cBuf:= cBuf + ' '
                else                cBuf:= cBuf + cStr[j];
              end;
         else  cBuf:= cBuf + cFmt[i];
    end;
  end;
  Result:= cBuf;
end;

function MG_Left(cString: aString; cLen: integer): aString;
var
  dLen: integer;
  cBuf: aString;
begin
  cBuf:= aString(Trim(wString(cString)));
  dLen:= Length(cBuf);

  if cLen > dLen then Result:= cBuf + MG_Replicate(' ', cLen-dLen)
  else                Result:= Copy(cBuf, 1, cLen);
end;

function MG_Center(cString : aString; cLen : integer): aString;
var
  dLen: integer;
  cBuf: aString;
begin
  cBuf:= aString(Trim(wString(cString)));
  dLen:= Length(cBuf);

  if cLen <= dLen then
  begin
    Result:= Copy(cBuf, 1, cLen);
    exit;
  end;
  dLen:= cLen - dLen;
  cBuf:= MG_Replicate(' ', Trunc(dLen/2)) + cBuf;
  dLen:= Length(cBuf);

  Result:= cBuf + MG_Replicate(' ', cLen - dLen);
end;

function MG_Right(cString: aString; cLen: integer): aString;
var
  dLen: integer;
  cBuf: aString;
begin
  cBuf:= aString(Trim(wString(cString)));
  dLen:= Length(cBuf);

  if cLen > dLen then Result:= MG_Replicate(' ', cLen-dLen) + cBuf
  else                Result:= Copy(cBuf, 1, cLen);
end;

function MG_InsZero(cString: aString; cLen: integer): aString;
var
  dLen, cLoop, i: integer;
  cBuf: aString;
begin
  cBuf:= aString(Trim(wString(cString)));
  dLen:= Length(cBuf);

  if dLen = 0 then
  begin
     for i:= 1 to cLen do cBuf:= '0' + cBuf;
     Result:= cBuf;
  end;

  if cLen > dLen then
  begin
    cLoop:= cLen - dLen;

    for i:= 1 to cLoop do cBuf:= '0' + cBuf;
    Result:= cBuf;
  end;
  Result:= cBuf;
end;

//cDate = YYYY-MM-DD
function MG_AddDate(cDate: aString; nDay: Integer): aString;
begin
  Result:= aString(FormatDateTime('YYYY-MM-DD', StrToDate(wString(cDate)) + nDay));
end;

function MG_AddTime(sNowTime: aString; Hour, Min, Sec, MSec: SmallInt): aString;
var
  TimeS: TTimeStamp;
begin
  TimeS:= DateTimeToTimeStamp(StrToDateTime(wString(sNowTime)));

  TimeS.Time:= TimeS.Time + ((Hour * 3600000 + Min * 60000 + Sec * 1000 + MSec));

  if TimeS.Time < 0 then
  begin
    Inc(TimeS.Time, 24*60*60*1000);
    Dec(TimeS.Date);
  end;

  Result:= aString(FormatDateTime('YYYY-MM-DD HH:NN:SS', TimeStampToDateTime(TimeS)));
end;

function toHex(sMsg: aString): aString;
var
  i, nLen: Integer;
begin
  Result:= '';
  nLen:= Length(sMsg);

  for i:= 1 to nLen do
  begin
    Result:= Result + aString(IntToHex(ord(sMsg[i]), 2)) + ' ';
  end;
end;

procedure StartProgress(fc, ls: aString; nTotCnt: Integer);
begin
  frmProgress:= TfrmProgress.Create(NIL);

  with frmProgress do
  begin
    Label1.Caption:= wString(ls);
    Caption:= wString(fc);
    Refresh;
    Show;
    Gauge1.MinValue:= 0;
    Gauge1.MaxValue:= nTotCnt;
    Gauge1.Progress:= 0;
    UpDate;
  end;
end;

procedure SetProgress(nP: Integer);
begin
  with frmProgress do
  begin
    Gauge1.Progress := Gauge1.Progress + nP;
    Update;
  end;
end;

procedure EndProgress;
begin
  frmProgress.Free;
end;

function DownloadFileHTTP(RemoteFileName, LocalFileName: String): Boolean;
const
  BLOCK_SIZE = 8192;

var
  hInet: HINTERNET;
  hURL: HINTERNET;
  Res: Boolean;
  pBuffer: Pointer;
  BytesRead: Cardinal;
  BytesWritten: LongInt;
  TotalBytesRead: Cardinal;
  LocalFile: file;
begin
  //Screen.Cursor:= crHourglass;

  Result := True;
  TotalBytesRead := 0;

  GetMem(pBuffer, BLOCK_SIZE);

  AssignFile(LocalFile, LocalFileName);
  ReWrite(LocalFile, 1);

  hInet := InternetOpen(nil, INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);
  //hInet := InternetOpen(nil, INTERNET_OPEN_TYPE_DIRECT, nil, nil, 0);

  if (hInet <> nil) then
  begin
    //INTERNET_FLAG_RAW_DATA
    hURL := InternetOpenUrl(hInet, PChar(RemoteFileName), nil, 0, INTERNET_FLAG_RELOAD, 0);
    //hURL := InternetOpenUrl(hInet, PChar(RemoteFileName), nil, 0, INTERNET_FLAG_RAW_DATA, 0);

    if (hURL <> nil) then
    begin
      repeat
        begin
          Res := InternetReadFile(hURL, pBuffer, BLOCK_SIZE, BytesRead);
          BlockWrite(LocalFile, pBuffer^, BytesRead, BytesWritten);
          TotalBytesRead := TotalBytesRead + BytesRead;
       //   UpdateStatus(TotalBytesRead);
        end;
      until (BytesRead = 0) and (Res);
      InternetCloseHandle(hURL);
      CloseFile(LocalFile);
    end
    else
    begin
      ExceptLogging('Failure during InternetOpenUrl ' + pchar(hInet));
      Result := False;
    end;
    InternetCloseHandle(hInet);

  end
  else
  begin
    ExceptLogging('Failure during InternetOpen');
    Result := False;
  end;

  FreeMem(pBuffer);

  //Screen.Cursor := crDefault;

  if (Result) then
    ExceptLogging('파일다운로드 완료.');
end;

function MG_MakeStr(sStr: String): String;
begin
  Result:= Chr(39) + sStr + Chr(39);
end;

function MG_StrConvert(sSrc, sOrg, sDet: aString): aString;
var
  sBuf: aString;
  i   : Integer;
begin
  sBuf:= '';

  for i:=1 to Length(sSrc) do
    if sSrc[i] = sOrg then
      sBuf:= sBuf + sDet
    else
      sBuf:= sBuf + sSrc[i];

  MG_StrConvert:= sBuf;
end;

function MG_NumberCheck(sData: aString): Boolean;
var
  i: Integer;
begin
  Result:= True;

  for i := 1 to Length(sData) do
  begin
    if (sData[i] < '0') or (sData[i] > '9') then
    begin
      Result:= False;
      Exit;
    end;
  end;
end;

end.
