unit Global;

interface
uses
  Windows, SysUtils, Forms, WinInet, IniFiles;

const
  STX = AnsiChar($02);
  ETX = AnsiChar($03);
  ENQ = AnsiChar($05);
  ACK = AnsiChar($06);
  NAK = AnsiChar($15);
  DLE = AnsiChar($10);
  EOT = AnsiChar($04);
  CR  = AnsiChar($0D);
  DC4 = AnsiChar($14);

  //--------------Printer 관련 예약어 정의(PC)----------------------
  SO  = AnsiChar($0E);     //문자확대
  SI  = AnsiChar($0F);     //문자확대 취소
  LF  = AnsiChar($0A);     //종이전송
  CAN = AnsiChar($18);     //Clear
  DC3 = AnsiChar($13);     //적색인쇄
  DC1 = AnsiChar($11);     //초기화
  DC2 = AnsiChar($12);     //역상문자
  RS  = AnsiChar($1E);     //부저

  //Ping용
  IP_STATUS_BASE           = 11000;
  IP_SUCCESS               = 0;
  IP_BUF_TOO_SMALL         = IP_STATUS_BASE + 1;
  IP_DEST_NET_UNREACHABLE  = IP_STATUS_BASE + 2;
  IP_DEST_HOST_UNREACHABLE = IP_STATUS_BASE + 3;
  IP_DEST_PROT_UNREACHABLE = IP_STATUS_BASE + 4;
  IP_DEST_PORT_UNREACHABLE = IP_STATUS_BASE + 5;
  IP_NO_RESOURCES          = IP_STATUS_BASE + 6;
  IP_BAD_OPTION            = IP_STATUS_BASE + 7;
  IP_HW_ERROR              = IP_STATUS_BASE + 8;
  IP_PACKET_TOO_BIG        = IP_STATUS_BASE + 9;
  IP_REQ_TIMED_OUT         = IP_STATUS_BASE + 10;
  IP_BAD_REQ               = IP_STATUS_BASE + 11;
  IP_BAD_ROUTE             = IP_STATUS_BASE + 12;
  IP_TTL_EXPIRED_TRANSIT   = IP_STATUS_BASE + 13;
  IP_TTL_EXPIRED_REASSEM   = IP_STATUS_BASE + 14;
  IP_PARAM_PROBLEM         = IP_STATUS_BASE + 15;
  IP_SOURCE_QUENCH         = IP_STATUS_BASE + 16;
  IP_OPTION_TOO_BIG        = IP_STATUS_BASE + 17;
  IP_BAD_DESTINATION       = IP_STATUS_BASE + 18;
  IP_ADDR_DELETED          = IP_STATUS_BASE + 19;
  IP_SPEC_MTU_CHANGE       = IP_STATUS_BASE + 20;
  IP_MTU_CHANGE            = IP_STATUS_BASE + 21;
  IP_UNLOAD                = IP_STATUS_BASE + 22;
  IP_GENERAL_FAILURE       = IP_STATUS_BASE + 50;
  MAX_IP_STATUS            = IP_GENERAL_FAILURE;
  IP_PENDING               = IP_STATUS_BASE + 255;

  //WTP-100
  SO_WTP = AnsiChar($1D) + AnsiChar($21) + AnsiChar($11);
  SI_WTP = AnsiChar($1D) + AnsiChar($21) + AnsiChar($00);

  WTP_Cash_Open = AnsiChar($1B) + AnsiChar($70) + AnsiChar($00) + AnsiChar($50) + AnsiChar($00);
  WTP_Gate_Open = AnsiChar($1B) + AnsiChar($70) + AnsiChar($01) + AnsiChar($150) + AnsiChar($00);

  FullCut     = AnsiChar($1B)+AnsiChar($50)+AnsiChar($00);
  FullCut_WTP = AnsiChar($1B)+AnsiChar($69);

  ESC_f       = AnsiChar($1B)+AnsiChar($66)+AnsiChar($01); //Feed 구성명령
  ESC_O       = AnsiChar($1B)+AnsiChar($4E);           // 절취선 skip 취소

  //전광판용
  DSPSTX = DLE + STX + AnsiChar($00);
  DSPETX = DLE + ETX;

  EMDSP1  = AnsiChar($00) + //문구블록
            AnsiChar($01) + //표시방법
            AnsiChar($01) + //반복횟수
            AnsiChar($51) + //폰트크기
            AnsiChar($00) + //화면분할위치
            AnsiChar($00) + //완성형
            AnsiChar($80) + //분할화면효과없음
            AnsiChar($80) + //메인화면효과
            AnsiChar($00) + //속도
            AnsiChar($06) + //정지시간
            AnsiChar($00);  //문구수직위치

  EMDSP0  = AnsiChar($00) + //문구블록
            AnsiChar($01) + //표시방법
            AnsiChar($01) + //반복횟수
            AnsiChar($51) + //폰트크기
            AnsiChar($00) + //화면분할위치
            AnsiChar($00) + //완성형
            AnsiChar($80) + //분할화면효과없음
            AnsiChar($80) + //메인화면효과
            AnsiChar($00) + //속도
            AnsiChar($FF) + //정지시간
            AnsiChar($00);  //문구수직위치

  SCColor = AnsiChar($01) + AnsiChar($01) + AnsiChar($01) + AnsiChar($01) +
            AnsiChar($01) + AnsiChar($01) + AnsiChar($01) + AnsiChar($01) +
            AnsiChar($01) + AnsiChar($01) + AnsiChar($01) + AnsiChar($01) +
            AnsiChar($02) + AnsiChar($02) + AnsiChar($02) + AnsiChar($02) +
            AnsiChar($02) + AnsiChar($02) + AnsiChar($02) + AnsiChar($02) +
            AnsiChar($02) + AnsiChar($02) + AnsiChar($02) + AnsiChar($02);

  NOColor = AnsiChar($02) + AnsiChar($02) + AnsiChar($02) + AnsiChar($02) +
            AnsiChar($02) + AnsiChar($02) + AnsiChar($02) + AnsiChar($02) +
            AnsiChar($02) + AnsiChar($02) + AnsiChar($02) + AnsiChar($02) +
            AnsiChar($03) + AnsiChar($03) + AnsiChar($03) + AnsiChar($03) +
            AnsiChar($03) + AnsiChar($03) + AnsiChar($03) + AnsiChar($03) +
            AnsiChar($03) + AnsiChar($03) + AnsiChar($03) + AnsiChar($03);

  YOColor = AnsiChar($02) + AnsiChar($02) + AnsiChar($02) + AnsiChar($02) +
            AnsiChar($02) + AnsiChar($02) + AnsiChar($02) + AnsiChar($02) +
            AnsiChar($02) + AnsiChar($02) + AnsiChar($02) + AnsiChar($02) +
            AnsiChar($01) + AnsiChar($01) + AnsiChar($01) + AnsiChar($01) +
            AnsiChar($01) + AnsiChar($01) + AnsiChar($01) + AnsiChar($01) +
            AnsiChar($01) + AnsiChar($01) + AnsiChar($01) + AnsiChar($01);

type
  aString = AnsiString;
  wString = WideString;

  R_GTime = Record
    GT1: aString; //회차시간
    GT2: aString; //정산후 출차시간
    GT3: aString; //토요일회차시작시각
    GT4: aString; //토요일회차종료시각
    GT5: aString; //토요일회차시간
    GT6: aString; //일요일회차시작시각
    GT7: aString; //일요일회차종료시각
    GT8: aString; //일요일회차시간
    GT9: Byte;    //기간만료정기차량출입허용일수
  end;

  R_DCProc = Record
    nDCNo: Integer;
    sDCName: aString;
    nDCAmt: Integer;
    nRealDCAmt: Integer;
    nDCType: Byte;
    nTime: Integer;
    sDCTKNo: aString;
    sDCTKIssueDate: aString;
    sDCTKIssueTime: aString;
    bWeb : Boolean;
    nSeq : Integer;
    sSeq : string;
  end;

  R_DCCnt = Record
    nDCNo: Integer;
    nDCUseCnt: Integer;
    nDCNowCnt: Integer;
  end;

  R_LPR = Record
    nUnitNo: Byte;
    sDSPIP: aString;
    nIO: Byte;  //1:입구, 2:출구
  end;

  R_Division = Record
    sSTTime : aString;
    sS1Min  : aString;
    nS1Value: Integer;
    nS1Loop : Integer;
    sS2Min  : aString;
    nS2Value: Integer;
    nS2Loop : Integer;
    sS3Min  : aString;
    nS3Value: Integer;
    nS3Loop : Integer;
    sS4Min  : aString;
    nS4Value: Integer;
    nS4Loop : Integer;
    sS5Min  : aString;
    nS5Value: Integer;
  end;

  R_Tariff = Record
    NormalTariff : Array[1..10] of R_Division; //평일요율을 저장
    SaturdayTariff: Array[1..10] of R_Division; //토요일요율을 저장
    HolidayTariff: Array[1..10] of R_Division; //휴일요율을 저장
  end;

  R_Tariff_Proc = Record
    bHuilProc   : Boolean; //휴일처리여부
    bWEProc     : Boolean; //토요일처리여부
    sWESTTime   : aString; //bWEProc = True일 경우 휴일요율적용시작시간.
    nDayMax     : Integer; //일일최고금액
    nTotMax     : Integer; //전체최고금액
    nNormalCnt  : Integer; //평일요율의 Division Count.
    nSaturdayCnt: Integer; //토요일요율의 Division Count.
    nHolidayCnt : Integer; //휴일요율의 Division Count.
    nNowNDiv    : Integer; //현재처리중인 평일요율의 Division.
    nNowSDiv    : Integer; //현재처리중인 토요일요율의 Division.
    nNOwHDiv    : Integer; //현재처리중인 휴일요율의 Division.
  end;

  RECReceipt = record
    sInOutTime: String;
    sRpt: String;
  end;

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

   //2018.01.09 AK프라자 로직 추가 시작//
    R_BarCodeDC = Record
    nBarCodeDCNo: Integer;
    sBarCodeDCMessage: aString;
  end;

    R_WebDC = Record
    nWebDCNo: Integer;
    nWebDCValue: Integer;
    sWebDCMessage: aString;
    nWebDCType: Integer;
    nSeq : Integer;
    sSeq : string;
  end;
    //2018.01.09 AK프라자 로직 추가 종료//

var
  sCurrRunDir: aString;               //프로그램 실행폴더
  sDBIP, sDBID, sDBPW, sDBName, sHostIP, sLPRDspIP, sHostIP1: aString;  //DB IP
  nHostPort, nHostPort1: Word;

  sClosingTime: aString = '00:00';    //마감기준시간

  bHolidayProc: Boolean = False;     //휴일주차요율 사용여부
  bSaturdayProc: Boolean = False;    //토요일주차요율 사용여부
  bAutoClosing: Boolean = False;     //자동마감여부
  bAutoReceipt: Boolean = False;     //영수증자동발급여부
  bZeroReceipt: Boolean = False;     //주차요금 0원시 영수증발급여부
  bTax: Boolean = True;              //부가세포함여부  True:포함,  False:부가세별도
  bSpecialTariff: Boolean = False;   //특정일자 지정주차요율 적용여부  False:적용안함,  True:적용
  bCommercialTariff: Boolean = False; //영업용차량 지정주차요율 적용여부 False:적용안함,  True:적용
  bParkingDayMax: Boolean = False;   //주차일수에 따른 일일최고요금 사용  False:사용안함,  True:사용함
  bExpireIO: Boolean = False;        //정기차량 기간만료후 출입허용여부  False:출입불가,  True:출입허용
  bAutoCalc: Boolean = True;         //LPR 시스템의 경우 자동요금계산 여부
  bZeroOpen: Boolean = False;        //주차요금 0원시 출구차단기 자동오픈 여부
  bCancel: Boolean = False;          //정산취소 가능여부
  bCancelReason: Boolean = False;    //정산취소시 사유입력 여부
  sCancelReason: String;             //정산취소 사유
  bCancelCheck: Boolean = False;     //정산취소시 확인 메시지 표출여부
  bCancelSave: Boolean = False;      //정산취소시 정산취소테이블 저장여부
  bInterimClosing: Boolean = False;  //중간마감 가능여부
  bInterimPrint: Boolean = False;    //중간마감시 인쇄여부
  bClosingText: Boolean = False;     //마감시 텍스트파일 저장여부
  bClosingReprint: Boolean = False;  //마감내용 재출력 여부
  bReceiptReprint: Boolean = False;  //영수증 재출력 여부
  bManualIn: Boolean = False;        //수동입차 사용 여부
  bCredit: Boolean = False;          //신용카드 결재가능 여부
  bCashReceipt: Boolean = False;     //현금영수증 발급가능 여부
  bCarSearch: Boolean = False;       //LPR 시스템의 경우 차량검색 사용 여부
  bManualOpen: Boolean = False;      //차단기 수동개방 사유기재 여부
  bBarcodeDC: Boolean = False;       //바코드할인권 사용 여부

  nCurrParkNo: Word = 0;           //주차장번호
  nCurrUnitNo: Word = 0;           //기기번호  0:중앙관리컴퓨터, 1이상 요금계산기 등 장비번호
  nDayGubun  : Byte = 0;           //1일 최대요금 계산기준  0:24시기준,  1:입차시각부터 24시간
  nJulsaType: Byte = 0;            //절사처리여부  0:사용안함, 1:1원단위, 2:10원단위, 3:100원단위, 4:500원단위, 5:1000원단위
  nRoundType: Byte = 0;            //반올림타입  0:절사,  1:절상,  2:반올림
  nTimeDCType: Byte = 0;           //시간할인기준  0:입차시각기점할인,  1:출차시각기점할인
  nMoneyType: Byte = 0;            //화폐종류  0:원단위,  1:달러단위(소수점2자리표시)
  nDCCntMax: Byte = 0;             //할인키 전체적용가능 횟수
  nDCPerCnt: Byte = 0;             //할인키별 적용가능 횟수
  bDCReason: Boolean = False;      //할인시 할인사유기재여부  False:사용안함,  True:할인사유기재
  nLossTicket: Byte = 0;           //분실티켓처리 기준  0:고정요금, 1:입차시각입력
  nLossTicketAmt: Cardinal = 0;    //분실티켓 고정요금
  nManagerAuthority: Byte = 0;     //근무자권한  0:Master,  1:관리자,  2:근무자,  3:정산원
  nDivisionType: Byte = 0;         //부제처리여부  0:사용안함,  1:10부제,  2:2부제,  3:요일제
  nDivisionProc: Byte = 0;         //부제적용방식  0:입차시만,  1:입출차모두적용
  aDivision: Array[1..8] of Boolean;  //부제적용요일  1:월요일.. 7:일요일, 8:공휴일    True시 부제적용
  nExpireDay: Byte = 0;            //정기차량 기간만료후 출입허용일수
  nFCProcType: Byte = 0;           //요금계산기운영방식  0:출구정산방식, 1:사전정산방식, 2:선정산방식
  nCurrMNo: Byte = 0;              //현재 근무자번호
  sCurrMName: String;              //현재 근무자명
  bOperation: Boolean = True;      //정상운영모드:True,  개방운영모드:False;
  bTest: Boolean = False;          //테스트운영:True, 정상운영:False;  <- 정상운영모드시만 적용...

  nLoginResult: Byte = 0;

  GTime: R_GTime;
  DCProc: Array[1..50] of R_DCProc;
  RReceipt : Array[1..10] of RecReceipt;
  RDCCnt: Array[1..50] of R_DCCnt;
  nNInCnt, nNOutCnt, nSInCnt, nSOutCnt: Word;
  bInDsp, bOutDsp: Boolean;
  nModRow, nTKType, nCarType: Byte;

  //0:선택안함,  1:sgIn,  2:sgOut
  nGridCheck: Byte = 0;

  //메뉴잠금으로 활용... 잠금해제시는 로그인 창 사용토록...
  bMenuLock: Boolean = True;
  bSetupChange: Boolean = False; //환경설정 변경하였느냐~

  //요금계산 관련 변수들
  nMTot: Integer = 0;
  nMCreditTot: Integer = 0;
  nMCnt: Integer = 0;
  nMCreditCnt: Integer = 0;
  sDCOutTime, sPrtData, sProcTime, sPrtOutTime, sManualTKNo, sManualInTime: aString;
  nProcYogum, nDCYogum, nDCCnt, nUseBtnCnt: Cardinal;
  sFeeCalcInDateTime, sFeeCalcOutDateTime: aString;
  bMiProc: Boolean = False;
  bManualOut: Boolean = False;
  bClosing: Boolean = False;
  RTariff: R_Tariff;
  T_Proc: R_Tariff_Proc;

  //LPR 설치 여부...
  bLpr: Boolean = False;
  RLPR: Array[1..10] of R_LPR;
  sInLPRRecv1, sInLPRRecv2, sInLPRRecv3, sInLPRRecv4, sInLPRRecv5, sOutLPRRecv1, sOutLPRRecv2, sOutLPRRecv3,
  sImageDir, sOrgCarNo, sOrgDate, sOrgTime, sOrgFile, sCtrl: aString;
  nOrgUnitNo: Integer;

  nGroupType: Byte = 0;            //정기그룹종류  0:일반, 1:후불정기차량, 2:시간제정기차량, 3:금액제정기차량
  nUseFeeItem: Byte = 0;           //정기차량 사용요금종류

  nParkingMin: Cardinal = 0;       //주차시간
  nNowParkingMin: Cardinal = 0;    //정산취소시 저장용

  bFreeTime: Boolean = False;      //무료개방시간사용여부
  sFreeTimeS,                      //무료개방시간시작
  sFreeTimeE: AnsiString;          //무료개방시간종료
  bFreeTimeChk: Boolean = False;   //무료개방시작시간이 종료시간보다 작을때: False
                                   //무료개방시작시간이 종료시간보다 클때  : True

  sGeunmuStart: AnsiString;        //근무시작시각
  sGeunmuMagam: AnsiString;        //마감시각

  nPayType: Byte;                  //지불종류  1:현금,  2:신용카드
  bInDataZero: Boolean = False;    //입차자료 없음.

  //현재 출차하는 차량정보
  sNowLprFile1, sNowLprCarNo1, sNowLprFile2, sNowLprCarNo2, sNowIOTime, sNowInTKNo,
  sNowInDate, sNowInTime, sNowInCarNo, sNowOutDate, sNowOutTime, sNowInFile, sOutLprFile, sOutLocalFile,
  sOutLprCarNo, sLostInCarNo, sLostInDate, sLostInTime, sLostInFile, sLostInTKNo,
  sTimeDCOutDate, sTimeDCOutTime: aString;
  nNowLprNo, nNowLprInOut, nNowLprRecog1, nNowLprRecog2, nNowInUnitNo, nLostInUnitNo, nLostInRecog: Byte;

  //미인식처리인가...
  bLostProc: Boolean = False;

  //환경설정 저장용 IniFile
  iSetup: TIniFile;

  //시간설정용 변수...
  nChkTime: Cardinal;

  //출차차로 구분 변수...
  nNowCharo: Byte = 0;

  //입구차단기 오픈가능 여부...
  bInBarOpen1: Boolean = False;
  bInBarOpen2: Boolean = False;
  bInBarOpen3: Boolean = False;
  bInBarOpen4: Boolean = False;
  bInBarOpen5: Boolean = False;

  //회차차량이냐...
  bZeroOut: Boolean = False;

  sLogoFile: String;
  bDirectClose: Boolean = False;
  nSCRemain: Byte = 0;
  nPingTimeOut: Integer = 10;

  //마감종류(0:일자마감,  1:근무자마감)
  nClosingType: Byte = 0;

  // 출차시 며칠전까지의 자료에서 조회할지...
  // 0:제한없음,  0이상: x일전까지의 자료에서 조회
  nSeekDay: Byte = 0;

   //무인요금계산기용
  sOutApsIP, sApsRecv: aString;
  nOutApsPort: Integer = 0;

  //운영모드 0-유인운영,  1-무인운영...
  nFCMode : Byte = 0;
  bFCMode: Boolean = True;          //운영모드 설정 True : 유인운영 False : 무인운영
  sApsSendData: aString;
  nPosAmt, nPosCount : Cardinal;   //포스처리 금액, 포스처리 영수증 갯수.
  //무인요금계산기 정산여부...
  bApsPay    : Boolean = False;
  sAPSPayDate, sAPSPayTime: aString;
  bWebUse1 : Boolean = False;       //웹할인 유무  웹할인받음:True, 웹할인 안 받음:False;
  //바코드할인용 배열...
  RBarCodeDCData: Array[1..10] of R_BarCodeDC;
  //웹할인용 배열...
  RWebDCData: Array[1..10] of R_WebDC;
  //발행기용...
  sBarcodeTK: aString;
  sJumCode : aString;


procedure ExceptLogging(sMsg: aString);
procedure ClosingLogging(sMsg: aString);
procedure InspectionLog(sMsg: aString);
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
function MG_InsSpace(cString: aString; cLen: integer): aString;
function MG_AddDate(cDate: aString; nDay: Integer): aString;
function MG_AddTime(sNowTime: aString; Hour, Min, Sec, MSec: SmallInt): aString;
function MG_ReplaceStr(src, cSrcChar, cDestChar: aString): aString;
function MG_MakeStr(sStr: aString): aString;
function toHex(sMsg: aString): aString;
procedure StartProgress(fc, ls: aString; nTotCnt: Integer);
procedure SetProgress(nP: Integer);
procedure EndProgress;
function DownloadFileHTTP(RemoteFileName, LocalFileName: String): Boolean;
function MakeDSPData(sCmd, sEffect, sColor, sData: aString): aString;
function MG_StrConvert(sSrc, sOrg, sDet: aString): aString;
function MG_NumberCheck(sData: aString): Boolean;

implementation
uses
  Progress;

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

procedure ClosingLogging(sMsg: aString);
var
  nFile: Integer;
  sFile: aString;
begin
   sFile := sCurrRunDir + '\Closing\' + aString(FormatDateTime('YYMMDDHHNNSS', Now)) + '.log';

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
      sFile := sMsg;
      FileWrite(nFile, PAnsichar(sFile)^, Length(sFile));
      FileClose(nFile);
   end;
end;

procedure InspectionLog(sMsg: aString);
var
  nFile: Integer;
  sFile: aString;
begin
   sFile := sCurrRunDir + '\Check\Check_' + aString(FormatDateTime('YYMMDD', Now)) + '.log';

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
  cBuf:= cString;
  dLen:= Length(cBuf);

  if cLen > dLen then Result:= cBuf + MG_Replicate(' ', cLen-dLen)
  else                Result:= Copy(cBuf, 1, cLen);
end;

function MG_Center(cString : aString; cLen : integer): aString;
var
  dLen: integer;
  cBuf: aString;
begin
  cBuf:= cString;
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
  cBuf:= cString;
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

function MG_InsSpace(cString: aString; cLen: integer): aString;
var
  dLen, cLoop, i: integer;
  cBuf: aString;
begin
  cBuf:= cString;
  dLen:= Length(cBuf);

  if dLen = 0 then
  begin
     for i:= 1 to cLen do cBuf:= cBuf + ' ';
     Result:= cBuf;
  end;

  if cLen > dLen then
  begin
    cLoop:= cLen - dLen;

    for i:= 1 to cLoop do cBuf:= cBuf + ' ';
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

function MG_ReplaceStr(src, cSrcChar, cDestChar: aString): aString;
var
  sBuf: aString;
  i   : Integer;
begin
  sBuf:= '';

  for i:=1 to Length(src) do
  begin
    if src[i] = cSrcChar then sBuf:= sBuf + cDestChar
    else                      sBuf:= sBuf + src[i];
  end;
  Result:= sBuf;
end;

function MG_MakeStr(sStr: aString): aString;
begin
  Result:= AnsiChar(39) + sStr + AnsiChar(39);
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
  BLOCK_SIZE = 4086;

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
  Result := True;
  TotalBytesRead := 0;

  GetMem(pBuffer, BLOCK_SIZE);

  AssignFile(LocalFile, LocalFileName);
  ReWrite(LocalFile, 1);

  hInet := InternetOpen(nil, INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);

  if (hInet <> nil) then
  begin
    hURL := InternetOpenUrl(hInet, PChar(RemoteFileName), nil, 0, INTERNET_FLAG_RELOAD, 0);

    if (hURL <> nil) then
    begin
      repeat
        begin
          Res := InternetReadFile(hURL, pBuffer, BLOCK_SIZE, BytesRead);
          BlockWrite(LocalFile, pBuffer^, BytesRead, BytesWritten);
          TotalBytesRead := TotalBytesRead + BytesRead;
        end;
      until (BytesRead = 0) and (Res);
      InternetCloseHandle(hURL);
      CloseFile(LocalFile);
    end
    else
    begin
      ExceptLogging(aString('Failure during InternetOpenUrl ' + pchar(hInet)));
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

  if (Result) then
    ExceptLogging('파일다운로드 완료.');
end;

function MakeDSPData(sCmd, sEffect, sColor, sData: aString): aString;
var
  sSend, sLen: aString;
begin
  sSend:= sCmd + sEffect + sColor + sData;
  sLen:= aString(IntToHex(Length(sSend), 4));
  sLen:= AnsiChar(StrToInt(aString('$' + Copy(sLen, 1, 2)))) + AnsiChar(StrToInt(aString('$' + Copy(sLen, 3, 2))));
  Result:= DSPSTX + sLen + sSend + DSPETX;
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
