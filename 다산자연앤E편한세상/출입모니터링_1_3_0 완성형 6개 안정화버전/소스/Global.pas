unit Global;

interface
uses
  Windows, SysUtils, Forms, WinInet, IniFiles, System.Classes,
  CodeSiteLogging, IdGlobal, Winapi.WinSock, idTCPclient;

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

  //인쇄 후 블랙마크 자동검출 후 컷팅
  BlackAutoCut = AnsiChar($13) + AnsiChar($69);

  //방문증 글자 크기 설정
  FONT_SIZE = AnsiChar($1D) + AnsiChar($21) + AnsiChar($22);

  FONT_SIZE2 = AnsiChar($1D) + AnsiChar($21) + AnsiChar($01);

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
  ST_WTP = AnsiChar($1D) + AnsiChar($21) + AnsiChar($00);

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
            AnsiChar($08) + //정지시간
            //표출시간을 늘려달라는 요청으로 10초로 늘린다.. 20013-03-25
//            AnsiChar($14) + //정지시간
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


  SCColor24 = AnsiChar($01) + AnsiChar($01) + AnsiChar($01) + AnsiChar($01) +
            AnsiChar($01) + AnsiChar($01) + AnsiChar($01) + AnsiChar($01) +
            AnsiChar($02) + AnsiChar($02) + AnsiChar($02) + AnsiChar($02) +
            AnsiChar($02) + AnsiChar($02) + AnsiChar($02) + AnsiChar($02);

  NOColor24 = AnsiChar($02) + AnsiChar($02) + AnsiChar($02) + AnsiChar($02) +
            AnsiChar($02) + AnsiChar($02) + AnsiChar($02) + AnsiChar($02) +
            AnsiChar($03) + AnsiChar($03) + AnsiChar($03) + AnsiChar($03) +
            AnsiChar($03) + AnsiChar($03) + AnsiChar($03) + AnsiChar($03);

  YOColor24 = AnsiChar($02) + AnsiChar($02) + AnsiChar($02) + AnsiChar($02) +
            AnsiChar($02) + AnsiChar($02) + AnsiChar($02) + AnsiChar($02) +
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
  end;

  R_DCCnt = Record
    nDCNo: Integer;
    nDCUseCnt: Integer;
    nDCNowCnt: Integer;
  end;

  R_LPR = Record
    nUnitNo: Byte;
    sDSPIP: aString;
    nLprCnt: Byte; //순서
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

 RECBind = record
    nHomeVersion: Cardinal;
    nKind       : Cardinal;
    nVersion    : Array[0..3] of Cardinal;
    sID         : Array[1..40] of AnsiChar; //String[40];
    sPW         : Array[1..40] of AnsiChar; //String[40];
  end;

  RecKHeader = record
    nHeaderKey: Cardinal;
    nMsgType  : Cardinal;
    nMsgLength: Cardinal;
    nTown     : Cardinal;
    nDong     : Cardinal;
    nHo       : Cardinal;
    nReserved : Cardinal;
    nHomeVersion: Cardinal;
    nKind       : Cardinal;
    nVersion    : Array[0..3] of Cardinal;
    sID         : Array[1..40] of AnsiChar; //String[40];
    sPW         : Array[1..40] of AnsiChar; //String[40];
  end;

  RECAlive = record
    nHomeVersion: Cardinal;
    nKind       : Cardinal;
    nVersion    : Array[0..3] of Cardinal;
  end;

  RECKAlive = record
    nHeaderKey: Cardinal;
    nMsgType  : Cardinal;
    nMsgLength: Cardinal;
    nTown     : Cardinal;
    nDong     : Cardinal;
    nHo       : Cardinal;
    nReserved : Cardinal;
    nHomeVersion: Cardinal;
    nKind       : Cardinal;
    nVersion    : Array[0..3] of Cardinal;
  end;

  RECPark_Info = record
    sGateid  : Array[1..4] of AnsiChar;   //String[4];
    sManager : Array[1..4] of AnsiChar;   //String[4];
    sCardNo  : Array[1..40] of AnsiChar;  //String[40];
    nInOut   : Cardinal;
    sDate    : Array[1..16] of AnsiChar;  //String[16];
    sCarNo   : Array[1..12] of AnsiChar;  //String[12];
  end;

  RecKPark_Info = record
    nHeaderKey: Cardinal;
    nMsgType  : Cardinal;
    nMsgLength: Cardinal;
    nTown     : Cardinal;
    nDong     : Cardinal;
    nHo       : Cardinal;
    nReserved : Cardinal;
    sGateid  : Array[1..4] of AnsiChar;   //String[4];
    sManager : Array[1..4] of AnsiChar;   //String[4];
    sCardNo  : Array[1..40] of AnsiChar;  //String[40];
    nInOut   : Cardinal;
    sDate    : Array[1..16] of AnsiChar;  //String[16];
    sCarNo   : Array[1..12] of AnsiChar;  //String[12];
  end;

  RecCarInfo = record
    nCarIndex: Byte;
    sCarNo: AnsiString;
    sDate: AnsiString;
    nDateCnt: Byte;
  end;

  //added Woo.YH 방문자 리스트 요청 전문
  Park_Visitor_List_Req = record
    nType     : Cardinal;
    nCmdId    : Cardinal;
    nReserved : Cardinal;
  end;

    //test woo 방문자 리스트 응답 가변길이
  Park_Visitor_List_Info = record
    nIndex    : Cardinal;
    szCarNo   : Array[1..20] of AnsiChar;
    szFdate   : Array[1..16] of AnsiChar;
    szTdate   : Array[1..16] of AnsiChar;
  end;

  //added Woo.YH 방문자 리스트 응답 전문
  Park_Visitor_List_Rep = record
    nHeaderKey: Cardinal;
    nMsgType  : Cardinal;
    nMsgLength: Cardinal;
    nTown     : Cardinal;
    nDong     : Cardinal;
    nHo       : Cardinal;
    nReservedH: Cardinal;   //해더
    nType     : Cardinal;
    nCmdId    : Cardinal;
    nCount    : Cardinal;
    nReserved : Cardinal;
    rListInfo : Array[1..20] of Park_Visitor_List_Info;
  end;

  Park_Header = record
    nHeaderKey: Cardinal;
    nMsgType  : Cardinal;
    nMsgLength: Cardinal;
    nTown     : Cardinal;
    nDong     : Cardinal;
    nHo       : Cardinal;
    nReservedH: Cardinal; //해더
  end;


  Park_Recv = record              //수신용 최대88
    rHeader     : Park_Header;
    szRecv      : Array[1..500] of AnsiChar;
   end;

  //added Woo.YH 방문자 등록삭제수정 요청 전문
  Park_Visitor_Edit_Req = record
    nType     : Cardinal;
    nCmdId    : Cardinal;
    nAction   : Cardinal;
    nIndex    : Cardinal;
    szCarNo   : Array[1..20] of AnsiChar;
    szFdate   : Array[1..16] of AnsiChar;
    szTdate   : Array[1..16] of AnsiChar;
    nReserved : Cardinal;
  end;

  //added Woo.YH 방문자 등록삭제수정 응답 전문
  Park_Visitor_Edit_Rep = record
    nHeaderKey: Cardinal;
    nMsgType  : Cardinal;
    nMsgLength: Cardinal;
    nTown     : Cardinal;
    nDong     : Cardinal;
    nHo       : Cardinal;
    nReservedH: Cardinal;   //해더
    nType     : Cardinal;
    nCmdId    : Cardinal;
    nResult   : Integer;
    szError   : Array[1..40] of AnsiChar;
    nReserved : Cardinal;
  end;

  R_WebDC = Record
    nWebDCNo: Integer;
    nWebDCValue: Integer;
    sWebDCMessage: aString;
    nWebDCType: Integer;
    sSeq :aString;
    nSeq : Integer;
    nTypeCode : Integer;         //할인타입 종류(0 기본할인, 1 충전할인, 2 후불할인)
    sStoreName  : aString;       //할인처명
  end;


var
  sCurrRunDir: aString;               //프로그램 실행폴더
  sDBIP, sDBID, sDBPW, sDBName, sHostIP, sParkName: aString;  //DB IP
  nHostPort,nDspInterval: Word;
  adminManager: aString = '(주)넥스파시스템';
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
  bMode: Boolean = True;             //운영모드 설정 True : 유인운영 False : 개방운영
  bModeUse: Boolean = False;         //LPR별 별도 개방운영모드 옵션사용 0: 미사용, 1: 사용
  bMonitoring : Boolean = False;     //모니터링용(DB저장유무) true : DB저장안함 , false :DB저장함

  nHomeVisit : Integer = 0;        //홈넷 연동 방문자 기능 사용 유무 1:사용, 0:미사용
  nVisitLine : Integer = 0;
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
  nApt : Integer = 0;              //0:아파트아님 , 1:아파트
  nBlack : Integer = 0;            //0:블랙리스트 사용안함, 1 : 블랙리스트사용
  nDisplaySize : Integer;          //0 : 2단4열(대우건설), 1 : 2단6열(일반)
  nUseDSPText : Integer;
  nDSPLeftUse : Integer;           //전광판 왼쪽이동 유무
  nDSPLeftText : string;           //전광판 왼쪽이동 변수
  nLoginResult: Byte = 0;
  sBAlarmFile : String = '';       //블랙리스트 알람 소리 파일
  nBAlarmTime : Integer = 0;       //블랙리스트 알람 시간
  sIOSDsp, sIONDsp, s4IOSDsp, s4IONDsp, sVISITDsp, s4VISITDsp: String;        //정기차량, 일반차량, 사전방문차량 입차 문구
  nGateActive : integer = 0;       //차단기 동작여부(0 동작안함, 1 동작)
  nGateControl : integer = 0;      //차단기 수동조작 옵션(0:버튼없음, 1:OPEN, 2:OPEN,CLOSE, 3: OPEN,CLOSE,LOCK,UNLOCK)
  nGateNo     : Integer = 0;       //십의 자리는 1입차 2출차
                                   //예) 입차1번 11 입차2번 12 .... 출차1번 21 출차2번 22 출차3번 23
  nVisitation  : Integer = 0;       //방문증 0:사용안함 , 1:사용
  nVisitation_IONUse : Integer = 0;
  nVisitation_IOSUse : Integer = 0; //정기차량기간만료시 방문증 사용
  nLogInUse   : Integer = 0;       //프로그램 시작시 로그인 0:사용안함,  1: 사용
  blContests: Integer = 0;         //블랙리스트 알림내용 = 1:차량번호, 2:차량번호+입차시간, 3:차량번호+입차시간+사유
  blMusicRepeat: Integer = 0;      //블랙리스트 소리알림 = 0:반복안함, 1:반복함
  blScreenAutoClose: Integer = 0;  // 블랙리스트 화면 자동닫힘 = 0:자동화면 닫히지않음, 1:자동화면닫힘(Alarm Time 적용)
  ShowSalesCarPass: Integer = 0; //영업차량 통과화면 사용유무 = 0:사용안함, 1:사용
  UseSalesCarPass: Integer = 0; //영업차량통과 적용유무 = 0:적용안함, 1:적용
  SalesCarNumber: string; //영업차량번호 공통번호
  incheonKepco: Integer = 0; //인천 한국전력용으로 출차시 할인권시간이 주차시간보다 클때만 자동출차 = 0:사용안함, 1:사용
  EachOperation: string = '1,1,1,1,1,1,1,1,1,1';  //전체 유인모드일때 개별로 입/출차가 동작할 수 있는기능 0:개방운영, 1:유인운영
  GroupBlockLPR: Integer = 0; //그룹별 특정 LPR 진입차단기능 0:사용안함, 1:사용
  nBSoundUse  : Integer = 0;       //블랙리스트 소리 사용   Added LJH 190619

  // Added by LJH 2019-10-23 09:26:42 운영모드 시간에따라 자동으로 변경
  bAutoMode : Boolean = False;       //운영모드자동변경옵션 사용
  sAutoOpenStart : String = '00:00'; //개방시작시간
  sAutoOpenEnd : String = '00:00';   //개방종료시간

  // Added by LJH 2019-10-23 17:05:31 특정기간 N회이상시 블랙리스트의심기능추가
  nCountBlackUse : Integer = 0;     //기능사용여부 0: 미사용, 1: 이번주, 2: 이번달, 3: 최근1주일, 4: 최근30일
  nCountBlack : Integer = 0;        //의심횟수 0: 미사용, 1이상 : 해당횟수 초과입차시 표출
  nCountPanelShowTime : Integer = 60; // 블랙리스트 의심창 자동 숨겨지는시간. 0: 안숨겨짐, 1이상 해당 시간(초) 이후 사라짐.

  noSendhNet: string; //세대통보 하지않을 UnitNo

  GTime: R_GTime;
  DCProc: Array[1..50] of R_DCProc;
  RReceipt : Array[1..10] of RecReceipt;
  RDCCnt: Array[1..50] of R_DCCnt;
  nNInCnt, nNOutCnt, nSInCnt, nSOutCnt: Word;
  bInDsp, bOutDsp: Boolean;
  nModRow, nTKType, nCarType: Byte;
  sMyIP : String; //내피시 아이피

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
  RLPR: Array[1..12] of R_LPR;
  sInLPRRecv1, sInLPRRecv2, sInLPRRecv3, sInLPRRecv4, sInLPRRecv5,
  sOutLPRRecv1, sOutLPRRecv2, sOutLPRRecv3, sOutLPRRecv4, sOutLPRRecv5,
  sImageDir, sOrgCarNo, sOrgDate, sOrgTime, sOrgFile, sCtrl: aString;
  nOrgUnitNo: Integer;

  nGroupType: Byte = 0;            //정기그룹종류  0:일반, 1:후불정기차량, 2:시간제정기차량, 3:금액제정기차량
  nUseFeeItem: Byte = 0;           //정기차량 사용요금종류

  nParkingMin: Cardinal = 0;       //주차시간
  nOverParkingMin: Cardinal = 0;   //초과된 주차시간
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
  sTimeDCOutDate, sTimeDCOutTime, sInMiFile, sOutMiFile,
  sTempFile1, sTempFile2, sTempFile3, sTempFile4, sTempFile5, sTempFile6, sTempFile7, sNowCarNo: aString;
  nNowLprNo, nNowLprInOut, nNowLprRecog1, nNowLprRecog2, nNowInUnitNo, nLostInUnitNo, nLostInRecog: Byte;

  //미인식처리인가...
  bLostProc: Boolean = False;

  //환경설정 저장용 IniFile
  iSetup: TIniFile;

  //통합환경설정
  iSetting : TIniFile;

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
  nPingTimeOut: Integer = 10;

  //세대통보용
  nHomeInfo_Comp : Integer;//현대통신:1          / 코콤:2    / 아이컨트롤스:3   / 계영정보통신:4
                           //삼성중공업 유비즈:5 / 이즈빌:6  / 한화(비쥬드림):7 / CVNET : 8 / 코맥스:9
                           //홈넷홈:10 / 경동원:11
                           //홈넷없음:0
  nHomeinfo_ver : Integer;//아이콘트롤스 new & old 프로토콜 버전
  sHomeInfo_IP, sHomeInfo_Temp, sLocalIP, sRecvHomeServer, sHomeInfo_ID, sHomeInfo_PW, sHomeInfo_ICon_IP: aString;
  nHomeInfo_Port: Cardinal;
  bHomeInfo: Boolean = False;
  sHomeInfo : AnsiString;

  nHomeinfo_DateUse : Integer; //아이콘트롤스 날짜 사용
  nHomeinfo_Period : aString; //아이콘트롤스 사전방문 기간 설정

  //코콤 LAN 세대통보용
  RBind: RECBind;
  RKHeader: RecKHeader;
  RAlive: RECAlive;
  RKAlive: RECKAlive;
  RPark_Info: RECPark_Info;
  RKPark_Info: RecKPark_Info;

   //코콤 세대통보...
  nGHeaderKey: Cardinal = 305419896;
  nGBind     : Cardinal = 285212672;
  nGAlive    : Cardinal = 285212676;
  nGPark_Info: Cardinal = 285212782;

  //이지빌용 동,호 저장 변수...
  sezVilleDong, sezVilleHo, sHomeInfo_CarNo, sHomeInfo_CardNo, sHomeInfo_Dong, sHomeInfo_Ho,
  sHomeInfo_ShortCarNo, sHomeInfo_Data,sHomeInfo_Type : aString;

  bMiIn: Boolean = False;
  b6Proc: Boolean = False;
{
  bSCWait   : Boolean = False;
  bNCInWait : Boolean = False;
  bNCOutWait: Boolean = False;
  }

  //세대통보 전송데이터
  sHomeInfo_SendData: String;

  //세대통보 수신데이터
  sHomeInfo_RecvData, sDemon_Recv: aString;

  //세대통보 입출구분(입차-1,  출차-2)
  nHomeInfo_InOut: Byte;

  //tHeartBeat 타이머에서 HeartBeat 전송 시 bHeartBeat를 False로 하여 전송하고
  //응답이 들어오면 bHeartBeat를 True로 변경한다.
  //tHeartBeat 타이머에서 HeartBeat 전송 전에 bHeartBeat가 False면 소켓을 끊었다 재접속한다.
  bHeartBeat: Boolean = True;

  RCarInfo: Array[1..250] of RecCarInfo;

  blockLprStrs: TStrings;  //해당 그룹에서 특정 lpr진입을 못하게 하기위한 lpr번호들

  //부제처리 관련 변수 Added LJH 190625
  bBujaeUse : Boolean = False;        //부제처리 기능 사용여부 :: True 사용, False 미사용
  bBujaeKind : Integer = 0;           //부제처리 종류 설정 0: 부제사용안함, 1: 2부제, 2: 5부제, 3: 10부제
  bBujae31Use : Boolean = False;      //부제처리 31일에 적용할지 :: True 부제적용, False 부제미적용

  // Modified by LJH 2019-07-29 16:59:36
  bAutoNormalOutOpen : Boolean = True;

  //아파트너 연동사용
  AptnerUse: Integer = 0;
  AptnerMonitorUse : Integer = 0; //아파트너 세대 알림 차량번호 수정시 사용 여부
  AptnerCode: string = '';
  AptnerVisitAddr: string = '';
  AptnerInCarAddr: string = '';
  AptnerOutCarAddr: string = '';
  AptnerVisitAuth: string = '';
  AptnerInCarAuth: string = '';
  AptnerOutCarAuth: string = '';

  noSendHNetStr: string; //홈넷전송예외PR 리스트

  //스마트빌리지 연동사용
  smartVillageUse: Integer = 0;
  smartVillageID: Integer = 0;

  //방문증발급과 동시에 차단기 오픈
  AutoVisitOpen: Integer;
  AutoVisitPrint:Integer;//사전방문차량 방문증 출력
  sAutoVisit: Integer;//방문증 수동 출력

  //홈넷앱 관려
  homeAppIP: string = '';
  homeAppPort: Integer = 0;

  //우노보드 위즈넷모듈 신호등 제어 TCP
  lightIP: string = '';
  lightPort: Integer = 0;
  lightKeepTime: Integer = 0;

  //1번 입/출차 전광판문구를 전체전광판에 전송할지 사용유무
  AllDspStrUse: Integer = 1;
  isMemberPass: Boolean = False;

  //코콤 시리얼 세대통보용...
  nKocomPort, nKocomBaudrate: Integer;
  sKocomRcv: aString;
  nReSend: Byte = 0;
  bReceive: Boolean = False;
  sShortCarNo: aString;

  //모니터링용 기본문구 전송안하도록
  mMirrorDsp: Integer = 1;

  sGYDBIP, sGYDBID, sGYDBPW, sGYDBName : aString;  //Added Woo.YH 160804 홈넷(계영정보통신) DB정보
  bGYUse : Boolean = False;

  //4자리인식(입차만)
  CarNumber4: Integer;

  //입/출차 정기문구색상,일반문구색상
  tmpFixStrDspArr: array[0..5] of String;
  fixStrDspArr: array[0..5] of String;
  //tmpFixStrDspArr: array[0..3] of String;
  //fixStrDspArr: array[0..3] of String;
  //방문증 내용 설정, 타이머, 위치 정렬
  nDafaultPrint, nDafaultPrintTime, nDafaultPrintlocation : Integer;
  //입/출차 전광판 기본문구색상 각각 제어
  tmpDefaultFixStrDspArr: array[0..3] of String;
  DefaultFixStrDspArr: array[0..3] of String;

  nfirewalluse : Integer; //방화벽 사용 여부

  nDafaultPrint_str : string; //방문증 문구 추가

  nsubDSPuse, nsubOutDSPuse : Integer; //보조 전광판 사용

  sDspSubIP, sDspOutSubIP : string; //보조 전광판 IP주소

  //홈넷 포인트 및 사전방문 설정
  sPointType, sUsePoint,
  svisitinfocount, svisitinfoTime,  svisitinfoDate, svisitinfoInsert : String;

  nisHoliday : Boolean;//휴일 출입처리

  sMainLprIP, sOutMainLprIP, sMainRecv, sOutMainRecv : string; //메인 LPR IP 싱크 보조일때가 들어갈때  데이터 값

  sTDate, eTDate : String;//방문증 기간 일자

  IOS_Expiration : Integer;//아파트너 방문증 입차 통보 여부(정기차량 기간만료)

  nLprDate, nLprTime : string;//방문증 수동 출력 날짜와 시간
  //웹할인용 배열...
  RWebDCData: Array[1..10] of R_WebDC;

  nWebDCUse : Integer; //웹할인 사용여부
  nIONOutUse : Integer; //일반차량 출차 개방 제한 사용 체크(방문증 출력시)
  nbackrecognition : Integer; //후면인식 처리

  nVisitstandard, nVisituse, nVisitcount, nVisitPrecount : Integer; //아이콘트롤스 사전차량 등록 횟수

  sIOSExpiryDsp : string; //정기 기간만료 차량 문구

procedure NormalLogging(sMsg: aString);
procedure ExceptLogging(sMsg: aString; isStartEnd: boolean=False);
procedure HomeInfoLogging(sMsg: aString);
procedure ClosingLogging(sMsg: aString);
procedure InspectionLog(sMsg: aString);
procedure CreateCodesiteLog(logName: string; isView: Boolean=False);
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
function DownloadFileHTTP(RemoteFileName, LocalFileName: String): Boolean;
function MakeDSPData(sCmd, sEffect, sColor, sData: aString): aString;
function MG_StrConvert(sSrc, sOrg, sDet: aString): aString;
function MG_NumberCheck(sData: aString): Boolean;
function MG_InsNull(cString: AnsiString; cLen: Integer): AnsiString;
function My_LocalIP : String;
function LocalIPList: String;
function FindIntFromStr(AString: string): Integer;
procedure Delay(TickTime : Integer);
function RemoveCRLF (const aString : string) : string;
function BuildBCC(sData: aString): aString;
function KocomMakeString(nCnt: Byte; sDongHo: aString; sCarNo: aString; nIO: Byte): aString;
function ConnectTimeOut(pAddr: ansistring; uPort: Word;
    uTimeOut: Byte =3): Boolean;
function IsPortActive(AHost : string; APort : string): boolean;
function MessageBoxTimeOut(hWnd: HWND; lpText: PAnsiChar; lpCaption: PChar; uType: UINT; wLanguageId: WORD; dwMilliseconds: DWORD): Integer; stdcall; external user32 name 'MessageBoxTimeoutA';

implementation

function IsPortActive(AHost : string; APort : string): boolean;
var
  IdTCPClient : TIdTCPClient;
begin
  Result := False;
  try
    IdTCPClient := TIdTCPClient.Create(nil);
    try
      IdTCPClient.Host := AHost;
      IdTCPClient.Port := strtoint(APort);
      IdTCPClient.ConnectTimeout:=50;
      IdTCPClient.Connect;
      Result := True;
    finally
      IdTCPClient.Free;
    end;
  except
    //Ignore exceptions
  end;
end;

function ConnectTimeOut(pAddr: ansistring; uPort: Word;
  uTimeOut: Byte =3): Boolean;
Var
  hSocket   :TSocket;
  Addr      :TSockAddrIn;
  uFalg     :u_long;
  WriteDset :TFDset;
  ExceptDset:TFDset;
  TimeVal   :TTimeVal;
begin
  Result               := False;
  Addr.sin_family      := AF_INET;
  Addr.sin_port        := htons(uPort);
  Addr.sin_addr.s_addr := inet_addr(PAnsiChar(pAddr));
  if (Addr.sin_addr.s_addr = SOCKET_ERROR) then Exit;
  hSocket  := socket(AF_INET, SOCK_STREAM, 0);

  uFalg  := 1;
  if ioctlsocket(hSocket, FIONBIO, uFalg) = NO_ERROR then
  begin
    uFalg := 0;
    if ioctlsocket(hSocket, FIONBIO, uFalg) = NO_ERROR then
    begin
      Result := True;
      FD_ZERO(WriteDset);
      FD_ZERO(ExceptDset);
      FD_SET(hSocket, WriteDset);
      FD_SET(hSocket, ExceptDset);
      TimeVal.tv_sec  := uTimeOut;
      TimeVal.tv_usec := 0;
      select(0, nil, @WriteDset, @ExceptDset, @TimeVal);
      if (FD_ISSET(hSocket, WriteDset)) then
        Result := True;
        Exit;
    end else begin

    end;
  end;
  shutdown(hSocket, SD_BOTH);
  closesocket(hSocket);
end;

function BuildBCC(sData: aString): aString;
var
  i: Integer;
  Sum: Byte;
  sChk: aString;
begin
  Sum:= 0;

  for i:= 1 to Length(sData) do Sum:= Sum + Ord(sData[i]);

  sChk:= AnsiChar(Sum);
  Result:= sChk;
end;

//nCnt: 재전송회수 1~3, nIO: 1-입차, 2-출차
function KocomMakeString(nCnt: Byte; sDongHo: aString; sCarNo: aString; nIO: Byte): aString;
var
  sData: aString;
  i: Byte;
begin
  sData:= AnsiChar($D8);

  Case nCnt of
    1: sData:= sData + AnsiChar($E4);
    2: sData:= sData + AnsiChar($E5);
    3: sData:= sData + AnsiChar($E6);
  end;
  sData:= sData + AnsiChar($00) + AnsiChar($01) + AnsiChar($01) +
          AnsiChar($01) + AnsiChar($00) + AnsiChar($00) + AnsiChar($82);

  for i:= 1 to 4 do
  begin
    sData:= sData + AnsiChar(StrToInt('$' + Copy(sDongHo, (i*2)-1, 2)));
  end;
  sData:= sData + AnsiChar($09) + AnsiChar($01) + AnsiChar(StrToInt('$' + Copy(sCarNo, 1, 2))) +
          AnsiChar(StrToInt('$' + Copy(sCarNo, 3, 2))) + AnsiChar(StrToInt('$0' + IntToStr(nIO)));
  sData:= sData + AnsiChar(StrToInt('$' + Copy(FormatDateTime('YYYY', Now), 1, 2))) +
          AnsiChar(StrToInt('$' + Copy(FormatDateTime('YYYY', Now), 3, 2))) +
          AnsiChar(StrToInt('$' + FormatDateTime('MM', Now))) +
          AnsiChar(StrToInt('$' + FormatDateTime('DD', Now))) +
          AnsiChar(StrToInt('$' + FormatDateTime('HH', Now))) +
          AnsiChar(StrToInt('$' + FormatDateTime('NN', Now))) + AnsiChar($00) + AnsiChar($00) + AnsiChar($00);
  Result:= AnsiChar($AA) + AnsiChar($55) + sData + BuildBCC(sData);
end;

function RemoveCRLF (const aString : string) : string;
var  i, j : integer;
begin
  result := aString;
  j := 0;
  for i := 1 to Length (result) do begin
    if (not (result [i] in [#10, #13])) then begin
      inc (j);
      result [j] := result [i];
    end;
  end;
  SetLength (result, j);
end;

procedure Delay(TickTime : Integer);
var
  Past,Now: Integer;
begin
  Past := GetTickCount;
  repeat
   Now := GetTickCount;
   Application.ProcessMessages;
  Until Now > Past + TickTime;
end;


procedure NormalLogging(sMsg: aString);
var
  nFile: Integer;
  sFile: aString;
begin
   sFile := sCurrRunDir + '\Non_Reg\' + aString(FormatDateTime('YYMMDD', Now)) + '_Non_Reg.log';

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

procedure ExceptLogging(sMsg: aString; isStartEnd: boolean=False);
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
      if isStartEnd = True then
        sFile := '**************************************************************' + #13#10 + '[' + aString(FormatDateTime('hh:nn:ss', Now)) + '] ' + sMsg + #13 + #10
      else
        sFile := '[' + aString(FormatDateTime('hh:nn:ss', Now)) + '] ' + sMsg + #13 + #10;
      FileWrite(nFile, PAnsichar(sFile)^, Length(sFile));
      FileClose(nFile);
   end;
end;

procedure HomeInfoLogging(sMsg: aString);
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
  cBuf:= cString;        // ex) 서초엠코
  dLen:= Length(cBuf);   // 8

  if dLen = 0 then
  begin
     for i:= 1 to cLen do cBuf:= cBuf + ' ';
     Result:= cBuf;
  end;

  // 12 > 8
  if cLen > dLen then
  begin
    cLoop:= cLen - dLen;   // 4

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

  if sData = '' then
  begin
    Result:= False;
    Exit;
  end;

  for i := 1 to Length(sData) do
  begin
    if (sData[i] < '0') or (sData[i] > '9') then
    begin
      Result:= False;
      Exit;
    end;
  end;
end;


function MG_InsNull(cString: AnsiString; cLen: Integer): AnsiString;
var
  dLen: integer;
  cBuf: AnsiString;
begin
  cBuf:= cString;
  dLen:= Length(cBuf);

  if cLen > dLen then Result:= cBuf + MG_Replicate(AnsiChar($00), cLen-dLen)
  else                Result:= Copy(cBuf, 1, cLen);
end;

function My_LocalIP : String;
var
  wData: WSADATA;
  HostName: String;
  pHostInfo: pHostEnt;
begin
  WSAStartup(MAKEWORD(2, 2), wData);

  GetHostName(PAnsiChar(HostName), 512);
  pHostInfo := GetHostByName(PAnsiChar(HostName));
  if Assigned(pHostInfo) then
    Result := IntToStr(ord(pHostInfo.h_addr_list^[0]))
      + '.' + IntToStr(ord(pHostInfo.h_addr_list^[1])) + '.' + IntToStr
      (ord(pHostInfo.h_addr_list^[2])) + '.' + IntToStr
      (ord(pHostInfo.h_addr_list^[3]))
  else
    Result := '';
  WSACleanup;
end;

function LocalIPList : String;
type
  TaPInAddr = array[0..10] of PInAddr;
  PaPInAddr = ^TaPInAddr;
var
  phe: PHostEnt;
  pptr: PaPInAddr;
  Buffer: array[0..63] of Char;
  HostName: String;
  I: Integer;
  WSAData: TWSAData;
begin
  WSAStartup(MakeWord(2, 2), WSAData);
  GetHostName(PAnsiChar(HostName), 512);
  phe := GetHostByName(PAnsiChar(HostName));
  if phe = nil then Exit;
  pPtr := PaPInAddr(phe^.h_addr_list);
  I := 0;
  while pPtr^[I] <> nil do
  begin
    if sHomeInfo_ICon_IP = inet_ntoa(pptr^[I]^) then
    begin
       Result := inet_ntoa(pptr^[I]^);
    end;
    //Result := inet_ntoa(pptr^[I]^);
    Inc(I);
  end;
  WSACleanUp;
end;

procedure CreateCodesiteLog(logName: string; isView: Boolean=False);
var
  Dest: TCodeSiteDestination;
begin
  Dest := TCodeSiteDestination.Create(Application);
  Dest.LogFile.Active := True;
  Dest.LogFile.FileName := FormatDateTime('yyyy-mm-dd',now)+logName+'.csl';
  if DirectoryExists(ExtractFilePath(Application.ExeName)+'Log') then begin

  end else begin
    MkDir(ExtractFilePath(Application.ExeName)+'Log');
  end;
  Dest.LogFile.FilePath := ExtractFilePath(Application.ExeName)+'Log';
  Dest.Viewer.Active := isView;
  CodeSite.Destination := Dest;
end;

function FindIntFromStr(AString: string): Integer;
var
  I: Integer;
  TempString: string;
begin
  TempString := '';
  AString := Trim(AString);
  if AString <> '' then
    for I := 1 to Length(AString) do
      if (AString[I] in ['0'..'9']) then
        TempString := TempString + AString[I];
  Result := StrToIntDef(Trim(TempString),0);
end;


end.
