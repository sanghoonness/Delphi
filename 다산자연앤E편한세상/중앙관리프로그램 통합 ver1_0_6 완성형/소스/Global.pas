unit Global;

interface
uses
  Windows, SysUtils, Forms, IniFiles, WinInet,
  dbadvGrid, System.Win.ComObj, System.Variants, Dialogs, Vcl.Graphics, Excel2000, ActiveX,
  dbgrids, Clipbrd;

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


  //<<{INI}================================================================================

  ST_CAL_TEMP = packed record
    n_req_page,
    n_req_count,
    n_res_page,
    n_res_list_count,
    n_res_remain_page: Integer;
  end;

   //=========================================================================
  //1.1.1	입차 통보(넥스파 -> 미들웨어)
  ST_IN_REPORT = packed record
    s_command    : string;
    s_dong       : string; // "123",
    s_ho         : string; // "456"
    s_car_number : string; // "차량번호",
    s_date_time  : string; // "yyyyMMddHHmmss"
  end;

  //1.1.2	입차 통보 응답(1.1.1에 대한 응답)
  ST_IN_RES = packed record
    s_command    : string;
    s_status     : string; // "응답상태코드",
    s_message    : string; // "메시지"
  end;

  //1.1.3	출차 통보(넥스파 -> 미들웨어)
  ST_OUT_REPORT = packed record
    s_command    : string;
    s_dong       : string; // "123",
    s_ho         : string; // "456"
    s_car_number : string; // "차량번호",
    s_date_time  : string; // "yyyyMMddHHmmss"
  end;

  //1.1.4	출차 통보 응답(1.1.3에 대한 응답)
  ST_OUT_RES = packed record
    s_command    : string;
    s_status     : string; // "응답상태코드",
    s_message    : string; // "메시지"
  end;

  //1.1.5	입차 리스트 요청(미들웨어 -> 넥스파)
  ST_IN_LIST_REQ = packed record
    s_command    : string;
    s_dong       : string; //
    s_ho         : string; //
    s_type       : string; // "all/family/visitor" , 전체, 가족, 방문(등록) 향후 추가될 수 있음.
    s_page       : string; // “1”, //0 : 전체      , 0보다 클 경우 : count수만큼 가져올 첫 row index
    s_count      : string; // "10" //0 : 전체      , 0보다 클 경우 : 가져올 row count
  end;

  ST_CAR_LIST = packed record
    s_car_number : string; // "차량번호",
    s_type       : string; // " family/visitor",  // 가족, 방문 (향후 추가될 수 있음)
    s_date_time  : string; // “yyyyMMddHHmmss”,   //입차시간
  end;

  ST_CAR_LIST_SET = packed record
    n_count      : Integer;
    n_run_count  : Integer;
    n_count_1    : Integer; // 정기차량 고객 count
    n_count_2    : Integer; // 방문차량 고객 count
    LIST         : array of ST_CAR_LIST;
                   //array[0..999] of ST_CAR_LIST;
  end;

  //1.1.6	입차 리스트 응답 (1.1.5에 대한 응답)
  ST_IN_LIST_RES = packed record
    s_command    : string;
    s_page       : string; // "1"   //조회한 page 번호, 요청이 0이면 0
    s_list_count : string; // "10", //조회된 List의 자료 수, 요청한 count 보다 클수 없다.
    s_remain_page: string; // "1",  //조회된 page 이후 남아 있는 page 수, page가 0이면 0
    a_list       : ST_CAR_LIST_SET;
    s_status     : string; // "응답상태코드",
    s_message    : string; // "메시지"
  end;

  //1.1.7	방문차량 리스트 요청(미들웨어 -> 넥스파)
  ST_VISIT_LIST_REQ = packed record
    s_command    : string;
    s_dong       : string; //
    s_ho         : string; //
    s_page       : string; // “1”, //0 : 전체      , 0보다 클 경우 : count수만큼 가져올 첫 row index
    s_count      : string; // "10" //0 : 전체      , 0보다 클 경우 : 가져올 row count
  end;

  ST_VISIT_LIST = packed record
    s_dong       : string; // 이재영 선임님, 요청 추가 (2020-10-30)
    s_ho         : string; // 이재영 선임님, 요청 추가 (2020-10-30)
    s_reg_no     : string; // “방문차량식별키”,
    s_car_number : string; // "차량번호",
    s_date       : string; // “yyyyMMdd”, //등록(방문) 일
    s_term       : string; // "1", //방문일수
    s_visit_flag : string; // “y/n” //y:방문, n:미방문
  end;

  ST_VISIT_LIST_SET = packed record
    n_run_count ,
    n_count      : Integer;
    LIST         : array of ST_VISIT_LIST;
                   //array[0..999] of ST_VISIT_LIST;
  end;

  //1.1.8	방문차량 리스트 응답(1.1.7에 대한 응답)
  ST_VISIT_LIST_RES = packed record
    s_command    : string;
    s_page       : string; // "1"   //조회한 page 번호, 요청이 0이면 0
    s_list_count : string; // "10", //조회된 List의 자료 수, 요청한 count 보다 클수 없다.
    s_remain_page: string; // "1",  //조회된 page 이후 남아 있는 page 수, page가 0이면 0
    a_list       : ST_VISIT_LIST_SET;
    s_status     : string; // "응답상태코드",
    s_message    : string; // "메시지"
  end;

  //1.1.9	방문차량 등록 요청(미들웨어 -> 넥스파)
  ST_VISIT_REG_REQ = packed record
    s_command    : string;
    s_dong       : string; //
    s_ho         : string; //
    s_car_number : string; // “차량번호”,
    s_date       : string; // "yyyyMMdd", // 등록(방문) 일
    s_term       : string; // "1"         // 방문일수
  end;

  //1.1.10	방문차량 등록 응답(1.1.9에 대한 응답)
  ST_VISIT_REG_RES = packed record
    s_command    : string;
    s_reg_no     : string; // 'data'
    s_status     : string; // "응답상태코드",
    s_message    : string; // "메시지"
  end;

  //1.1.11	방문차량 삭제 요청(미들웨어 -> 넥스파)
  ST_VISIT_DEL_REQ = packed record
    s_command    : string;
    s_dong       : string; //
    s_ho         : string; //
    s_reg_no     : string; // “방문차량식별키”,
    s_car_number : string; // “차량번호”,
  end;

  //1.1.12	방문차량 삭제 응답(1.1.11에 대한 응답)
  ST_VISIT_DEL_RES = packed record
    s_command    : string;
    s_status     : string; // "응답상태코드",
    s_message    : string; // "메시지"
  end;

  //1.1.13	방문차량 즐겨찾기 리스트 요청(미들웨어 -> 넥스파)
  ST_VISIT_FAVO_LIST_REQ = packed record
    s_command    : string;
    s_dong       : string; //
    s_ho         : string; //
  end;

  ST_VISIT_FAVO_LIST = packed record
    s_dong       : string; //
    s_ho         : string; //
    s_reg_no     : string; // “방문차량즐겨찾기식별키”,
    s_car_number : string; // "차량번호",
    s_date_time  : string; // “yyyyMMddHHmmss”,
    s_register   : string; // "홍길동/월패드"
  end;

  ST_VISIT_FAVO_LIST_SET = packed record
    n_count      : Integer;
    n_run_count  : Integer;
    LIST         : array of ST_VISIT_FAVO_LIST; //array[0..999]
  end;

  //1.1.14	방문차량 즐겨찾기 리스트 응답(1.1.13에 대한 응답)
  ST_VISIT_FAVO_LIST_RES = packed record
    s_command    : string;
    a_list       : ST_VISIT_FAVO_LIST_SET;
    s_status     : string; // "응답상태코드",
    s_message    : string; // "메시지"
  end;

  //1.1.15	방문차량 즐겨찾기 등록 요청(미들웨어 -> 넥스파)
  ST_VISIT_FAVO_REG_REQ = packed record
    s_command    : string;
    s_dong       : string; //
    s_ho         : string; //
    s_car_number : string; // "차량번호",
    s_register   : string; // App에서 등록시 등록자명, 월패드에서 등록시 ‘월패드’
  end;

  //1.1.16	방문차량 즐겨찾기 등록 응답(1.1.13에 대한 응답)
  ST_VISIT_FAVO_REG_RES = packed record
    s_command    : string;
    s_status     : string; // "응답상태코드",
    s_message    : string; // "메시지"
  end;

  //1.1.17	방문차량 즐겨찾기 삭제 요청(미들웨어 -> 넥스파)
  ST_VISIT_FAVO_DEL_REQ = packed record
    s_command    : string;
    s_dong       : string; //
    s_ho         : string; //
    s_reg_no     : string; // "방문차량즐겨찾기식별키"
    s_car_number : string; // "차량번호",
  end;

  //1.1.18	방문차량 즐겨찾기 삭제 응답(1.1.15에 대한 응답)
  ST_VISIT_FAVO_DEL_RES = packed record
    s_command    : string;
    s_status     : string; // "응답상태코드",
    s_message    : string; // "메시지"
  end;

  ST_ALIAS_SINGLE_LIST = packed record
    s_car_number : string; // "차량번호"   , for Req(요청)
    s_alias      : string; // "차량 별명"  , for Res(응답)
  end;

  ST_ALIAS_SINGLE_LIST_SET = packed record
    n_count      : Integer;
    n_run_count  : Integer;
    LIST         : array of ST_ALIAS_SINGLE_LIST; // [0..999]
  end;

  //1.1.24	Alias 가져오기 요청
  ST_ALIAS_SINGLE_REQ = packed record
    s_command    : string;
    a_list       : ST_ALIAS_SINGLE_LIST_SET;
  end;

  //1.1.25	Alias 가져오기 응답
  ST_ALIAS_SINGLE_RES = packed record
    s_command    : string;
    a_list       : ST_ALIAS_SINGLE_LIST_SET;
    s_status     : string; // "응답상태코드",
    s_message    : string; // "메시지"
  end;

  //1.1.25	Alias 변경 요청
  ST_CAR_ALIAS_MODIFY_REQ = packed record
    s_command    : string;
    s_dong       : string; // "123",
    s_ho         : string; // "456",
    s_car_number : string; // "차량 번호",
    s_alias      : string; // "차량 별명"
  end;

  //1.1.24	Alias 변경 응답
  ST_CAR_ALIAS_MODIFY_RES = packed record
    s_command    : string;
    s_status     : string; // "응답상태코드",
    s_message    : string; // "메시지"
  end;

  //1.1.26	세대등록 차량찾기 요청
  ST_FIND_CAR_REQ = packed record
    s_command    : string;
    s_dong       : string; // "123",
    s_ho         : string; // "456",
  end;

  ST_FIND_CAR_LIST = packed record
    s_dong       : string; // "123",
    s_ho         : string; // "456",
    s_car_number : string; // "차량 번호",
    s_date       : string; // "yyyyMMdd", //등록(방문) 일
    s_alias      : string; // "차량 별명
  end;

  ST_FIND_CAR_LIST_SET = packed record
    n_count      : Integer;
    n_run_count  : Integer;
    LIST         : array of ST_FIND_CAR_LIST; //[0..999]
  end;

  //1.1.27	세대등록 차량찾기 응답
  ST_FIND_CAR_RES = packed record
    s_command    : string;
    a_list       : ST_FIND_CAR_LIST_SET;
    s_status     : string; // "응답상태코드",
    s_message    : string; // "메시지"
  end;

    //=========================================================================
  // 'alert_incar'   >> 입차.통보.응답
  ST_IN_G = packed record
    req: ST_IN_REPORT;
    res: ST_IN_RES;
  end;

  // 'alert_outcar'  >> 출차.통보.응답
  ST_OUT_G = packed record
    req: ST_OUT_REPORT;
    res: ST_OUT_RES;
  end;

  // 'incar_list'    >> 입차리스트.요청.응답
  ST_IN_LIST_G = packed record
    req: ST_IN_LIST_REQ;
    res: ST_IN_LIST_RES;
  end;

  // 'visit_list'    >> 방문차량리스트.요청.응답
  ST_VISIT_LIST_G = packed record
    req: ST_VISIT_LIST_REQ;
    res: ST_VISIT_LIST_RES;
  end;

  // 'visit_reg'     >> 방문차량.등록.요청.응답
  ST_VISIT_REG_G = packed record
    req: ST_VISIT_REG_REQ;
    res: ST_VISIT_REG_RES;
  end;

  // 'visit_del'     >> 방문차량.삭제.요청.응답
  ST_VISIT_DEL_G = packed record
    req: ST_VISIT_DEL_REQ;
    res: ST_VISIT_DEL_RES;
  end;

  // 'visit_favo_reg' >> 방문차량 즐켜찾기.등록.요청.응답
  ST_VISIT_FAVO_REG_G = packed record
    req: ST_VISIT_FAVO_REG_REQ;
    res: ST_VISIT_FAVO_REG_RES;
  end;

  // 'visit_favo_list' >> 방문차량 즐켜찾기 리스트.요청.응답
  ST_VISIT_FAVO_LIST_G = packed record
    req: ST_VISIT_FAVO_LIST_REQ;
    res: ST_VISIT_FAVO_LIST_RES;
  end;

  // 'visit_favo_del' >> 방문차량 즐켜찾기 .삭제.요청.응답
  ST_VISIT_FAVO_DEL_G = packed record
    req: ST_VISIT_FAVO_DEL_REQ;
    res: ST_VISIT_FAVO_DEL_RES;
  end;

  // 'alias_single' >> Alias 가져오기.요청.응답
  ST_ALIAS_SINGLE_G = packed record
    req: ST_ALIAS_SINGLE_REQ;
    res: ST_ALIAS_SINGLE_RES;
  end;

  // 'car_alias_modify' >> Alias 변경>요청.응답
  ST_CAR_ALIAS_MODIFY_G = packed record
    req: ST_CAR_ALIAS_MODIFY_REQ;
    res: ST_CAR_ALIAS_MODIFY_RES;
  end;

  // 'find_car' >> 세대등록 차량찾기>요청.응답
  ST_FIND_CAR_G = packed record
    req: ST_FIND_CAR_REQ;
    res: ST_FIND_CAR_RES;
  end;

   ST_MIDDLEWARE_JSON = packed record

    // 'alert_incar'      >> 입차.통보.응답
    // 'alert_outcar'     >> 출차.통보.응답
    // 'incar_list'       >> 입차리스트.요청.응답
    // 'visit_list'       >> 방문차량리스트.요청.응답
    // 'visit_reg'        >> 방문차량.등록.요청.응답
    // 'visit_del'        >> 방문차량.삭제.요청.응답
    // 'visit_favo_reg'   >> 방문차량 즐겨찾기.등록.요청.응답
    // 'visit_favo_list'  >> 방문차량 즐켜찾기 리스트.요청.응답
    // 'visit_favo_del'   >> 방문차량 즐겨찾기.삭제.요청.응답
    // 'alias_single'     >> Alias 가져오기.요청.응답
    // 'car_alias_modify' >> Alias 변경>요청.응답
    // 'find_car'         >> 세대등록 차량찾기>요청.응답

    s_command          : string;
    n_comm_type        : Integer; // 1:Req(Report), 2:Res

    p_in               : ST_IN_G;
    p_out              : ST_OUT_G;
    p_in_list          : ST_IN_LIST_G;
    p_visit_list       : ST_VISIT_LIST_G;
    p_visit_reg        : ST_VISIT_REG_G;
    p_visit_del        : ST_VISIT_DEL_G;

    p_visit_favo_reg   : ST_VISIT_FAVO_REG_G;
    p_visit_favo_list  : ST_VISIT_FAVO_LIST_G;
    p_visit_favo_del   : ST_VISIT_FAVO_DEL_G;
    p_alias_single     : ST_ALIAS_SINGLE_G;

    p_car_alias_modify : ST_CAR_ALIAS_MODIFY_G; // add newly..
    p_find_car         : ST_FIND_CAR_G;         // add newly..


  end;

var
  //메뉴잠금으로 활용... 잠금해제시는 로그인 창 사용토록...
  bMenuLock: Boolean = True;
  g_s_home_net_ip : string;
  g_mid_json: ST_MIDDLEWARE_JSON;  // 미들웨어 통신용, buffer..
  nDspInterval : Word;

  sCurrRunDir: aString;               //프로그램 실행폴더
  sDBIP, sDBID, sDBPW, sDBName: aString;       //DB IP, ID, Password
  sClosingTime: aString = '00:00';    //마감기준시간
  adminManager: aString = '(주)넥스파시스템';

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
  nVisitReason : Word = 0;
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
  nBujaeUse   : Integer = 0;       //부제 기능 사용여부 .. 0: 사용안함, 1: 사용
  bBlockLPRUse : Boolean = False;  //LPR별 진입차단 옵션 사용유무
  nApt : Integer = 0;              //0:아파트아님 , 1:아파트
  nYogumMode : Integer = 0;        //0:출입모니터링 현장, 1:요금계산기 현장
  Count : Integer = 0;
  //환경설정 저장용 IniFile
  iSetup: TIniFile;
  iSetup2: TIniFile;
  //ParkingReg: TRegIniFile;
  gnRow : Integer = 0; //포인트 엑셀 업로드 변수
  btnselect : Integer = 0;
  homenetuse : Integer = 0;//홈넷 설정
  PDAUSE : Integer = 0; //순찰패드 설정
  bIMageUse : Integer; //이미지 처리 0:처리안함 1:처리함
  nvisituse : Integer; //사전방문 설정(아이콘트롤스 홈넷 해당)

  DelCustinfoAll : Integer; //정기차량 선택 삭제 유무
  DataCount : Integer;
  smartVillagePoint : Integer;//미들웨어 스마트빌리지 포인트 동기화 사용 유무
  sHomeInfo_IP : string;
  nHomeInfo_Port : Integer;
  nAvailablePoint, nUsedPoint : Integer;
  nHomenet_visit : Integer;//홈넷 사전 방문 업체
  nWP : Integer; //정기차량 사용시간대별

procedure ExceptLogging(sMsg: aString);
procedure HomeInfoLogging(sMsg: aString);

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

function mzExcelExport(dbgrd: TDBAdvGrid; colCnt: Integer): Boolean;
function mzExcelExport2(dbgrd, dbgrd2: TDBAdvGrid; colCnt, colCnt2: Integer): Boolean;
function MessageBoxTimeOut(hWnd: HWND; lpText: PChar; lpCaption: PChar;uType: UINT; wLanguageId: WORD; dwMilliseconds: DWORD): Integer; stdcall;external user32 name 'MessageBoxTimeoutW';
//procedure znSave_DBGridToExcel(vDBGrid: TDBadvGrid);//엑셀 변환
function IfRemainThen(c: Integer; a: Integer): integer;
procedure znSave_DBGridToExcel(vDBGrid: TDBGrid);//엑셀 변환

implementation
uses
  Progress;

function IfRemainThen(c: Integer; a: Integer): integer;
begin
  if a = 0 then
    Result := c
  else
    Result := c+1;
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

function mzExcelExport(dbgrd: TDBAdvGrid; colCnt: Integer): Boolean;
var
  xls, Range, arrData: Variant;
  RowCount, ColCount, i, j, xlCols: Integer;
  svDlg: TSaveDialog;
  MyDateString : String;
  MyFormatSetting : TFormatSettings;
  MyDateTime : TDateTime;
  myFormat: OleVariant;
  procedure KillExcel(var App: Variant);
  var
    ProcID: DWORD;
    hProc: THandle;
    hW: HWND;
  begin
    hW := App.Application.Hwnd;
    // close with usual methods
    App.DisplayAlerts := False;
    App.Workbooks.Close;
    App.Quit;
    App := Unassigned;
    // close with WinApi
    if not IsWindow(hW) then Exit; // already closed?
    GetWindowThreadProcessId(hW, ProcID);
    hProc := OpenProcess(PROCESS_TERMINATE, False, ProcID);
    TerminateProcess(hProc, 0);
  end;
begin
  try
    try
      Result := False;
      RowCount := dbgrd.RowCount;
      ColCount := dbgrd.ColCount;
      arrData := VarArrayCreate([0, RowCount, 0, ColCount], varVariant);
      xls := CreateOLEObject('Excel.Application');
      xls.DisplayAlerts := False;
      xls.Visible := False;
      xls.Workbooks.Add;

      for i := 0 to RowCount do begin
        for j := 1 to colCnt do begin
          if Pos('-',dbgrd.Cells[j, i]) > 0 then begin
//            MyDateString := dbgrd.Cells[j, i];
//            GetLocaleFormatSettings( GetThreadLocale , MyFormatSetting );
//            MyFormatSetting.DateSeparator := '-';
//            MyFormatSetting.TwoDigitYearCenturyWindow := 50;
//            MyDateTime := StrToDateTime( MyDateString, MyFormatSetting );
//            arrData[i, j-1] := MyDateTime;
//          end else
          end;
              arrData[i, j-1] := dbgrd.Cells[j, i];  //그리드의 0번컬럼은 사용안하는데 엑셀의 0번컬럼도 한자리를 차지해서 0번부터 데이터가 들어가도록 처리
        end;
      end;
      Range := xls.WorkBooks[1].ActiveSheet.Range[xls.WorkBooks[1].ActiveSheet.Cells[1, 1], xls.WorkBooks[1].ActiveSheet.Cells[RowCount, ColCount]];
      //myFormat := 'yyyy-mm-dd';
      myFormat := '@';
//      xls.ActiveSheet.Range[xls.WorkBooks[1].ActiveSheet.Cells[2, 1], xls.WorkBooks[1].ActiveSheet.Cells[RowCount, 2]].NumberFormat := myFormat;
      xls.ActiveSheet.Range[xls.WorkBooks[1].ActiveSheet.Cells[1, 1], xls.WorkBooks[1].ActiveSheet.Cells[RowCount, ColCount]].NumberFormat := myFormat;

      Range.Value := arrData;

      xls.Cells.rows.autofit;
      xls.cells.columns.autofit;
      xls.ActiveSheet.Range[xls.ActiveSheet.Cells[1,1],xls.ActiveSheet.Cells[1,colCnt]].borders.color := clBlack;
      xls.ActiveSheet.Range[xls.ActiveSheet.Cells[1,1],xls.ActiveSheet.Cells[1,colCnt]].Interior.color := clSilver;//RGB(192,192,192);
      xls.ActiveSheet.Range[xls.ActiveSheet.Cells[1,1],xls.ActiveSheet.Cells[1,colCnt]].select;
      xls.Selection.HorizontalAlignment := Integer($FFFFEFF4);//integer($FFFFEFC8); //xlRight

      svDlg := TSaveDialog.Create(nil);
      svDlg.Title := '엑셀 내보내기 화면';
      svDlg.InitialDir := GetCurrentDir;
      svDlg.Filter := 'Excel files (*.xlsx)|*.xlsx';
      svDlg.FilterIndex := 1;
      svDlg.DefaultExt := 'xlsx';
      if svDlg.Execute then begin
        xls.WorkBooks[1].saveas(svDlg.FileName);
        MessageBoxTimeOut(Application.Handle, '엑셀파일로 저장완료!', '', 0, 0, 5000);
      end else begin
        xls.ActiveWorkBook.Saved := True;
      end;
      Result := true;
    except
      on E: Exception do
      begin
        ExceptLogging('TfrmCustInfo.btnTestClick: ' + aString(E.Message));
      end;
    end;
    KillExcel(xls);
  finally
    if VarIsEmpty(xls) = false then begin
      FreeAndNil(svDlg);
//      xls.ActiveWorkBook.Saved:= 1;
      xls.ActiveWorkBook.Close(SaveChanges:= 0);
      xls.quit;
//      Range := Unassigned;
//      arrData := Unassigned;
//      xls := Unassigned;
//      VarClear(xls);
//      VarClear(Range);
//      VarClear(arrData);
    end;
  end;
end;

function mzExcelExport2(dbgrd, dbgrd2: TDBAdvGrid; colCnt, colCnt2: Integer): Boolean;
var
  xls, Range, Range2, arrData, arrData2, arrData3: Variant;
  RowCount, RowCount2, ColCount, ColCount2, i, j, xlCols: Integer;
  svDlg: TSaveDialog;
  myFormat, myFormat2: OleVariant;

  procedure KillExcel(var App: Variant);
  var
    ProcID: DWORD;
    hProc: THandle;
    hW: HWND;
  begin
    hW := App.Application.Hwnd;
    // close with usual methods
    App.DisplayAlerts := False;
    App.Workbooks.Close;
    App.Quit;
    App := Unassigned;
    // close with WinApi
    if not IsWindow(hW) then Exit; // already closed?
    GetWindowThreadProcessId(hW, ProcID);
    hProc := OpenProcess(PROCESS_TERMINATE, False, ProcID);
    TerminateProcess(hProc, 0);
  end;
begin
  try
    try
      Result := False;
      RowCount := dbgrd.RowCount;
      ColCount := dbgrd.ColCount;
      RowCount2 := dbgrd2.RowCount;
      ColCount2 := dbgrd2.ColCount;
      arrData := VarArrayCreate([0, RowCount, 0, ColCount], varVariant);
      arrData2 := VarArrayCreate([0, RowCount2, 0, ColCount2], varVariant);
      xls := CreateOLEObject('Excel.Application');
      xls.DisplayAlerts := False;
      xls.Visible := false;
      xls.Workbooks.Add;
      //첫번째 그리드
      for i := 0 to RowCount do begin
        for j := 1 to colCnt do begin
          arrData[i, j-1] := dbgrd.Cells[j, i];  //그리드의 0번컬럼은 사용안하는데 엑셀의 0번컬럼도 한자리를 차지해서 0번부터 데이터가 들어가도록 처리
        end;
      end;

      Range := xls.WorkBooks[1].ActiveSheet.Range[xls.WorkBooks[1].ActiveSheet.Cells[1, 1], xls.WorkBooks[1].ActiveSheet.Cells[RowCount, ColCount]];
      //Range := xls.WorkBooks[1].ActiveSheet.Range[xls.WorkBooks[1].ActiveSheet.Cells[1, cellnum], xls.WorkBooks[1].ActiveSheet.Cells[RowCount, ColCount]];

      //myFormat := 'yyyy-mm-dd';
      myFormat := '@';
      //myFormat2 := '@';
      xls.ActiveSheet.Range[xls.WorkBooks[1].ActiveSheet.Cells[1, 1], xls.WorkBooks[1].ActiveSheet.Cells[RowCount, ColCount]].NumberFormat := myFormat;

      Range.Value := arrData;

      xls.Cells.rows.autofit;
      xls.cells.columns.autofit;
      xls.ActiveSheet.Range[xls.ActiveSheet.Cells[1,1],xls.ActiveSheet.Cells[1,colCnt]].borders.color := clBlack;
      xls.ActiveSheet.Range[xls.ActiveSheet.Cells[1,1],xls.ActiveSheet.Cells[1,colCnt]].Interior.color := clSilver;//RGB(192,192,192);
      xls.ActiveSheet.Range[xls.ActiveSheet.Cells[1,1],xls.ActiveSheet.Cells[1,colCnt]].select;

      //두번째 그리드
      {for i := 0 to RowCount2 do begin
        for j := 1 to colCnt2 do begin
          //arrData2[i, j-1] := dbgrd2.Cells[j, i];  //그리드의 0번컬럼은 사용안하는데 엑셀의 0번컬럼도 한자리를 차지해서 0번부터 데이터가 들어가도록 처리
          arrData2[i, j] := dbgrd2.Cells[j, i];
        end;
      end;}

      for i := 0  to RowCount2  do begin
        for j := 1  to colCnt2  do begin
          arrData2[i, j-1] := dbgrd2.Cells[j, i];  //그리드의 0번컬럼은 사용안하는데 엑셀의 0번컬럼도 한자리를 차지해서 0번부터 데이터가 들어가도록 처리
        end;
      end;

      Range := xls.WorkBooks[1].ActiveSheet.Range[xls.WorkBooks[1].ActiveSheet.Cells[1, ColCount], xls.WorkBooks[1].ActiveSheet.Cells[RowCount2, ColCount2]];
      //myFormat := 'yyyy-mm-dd';
      myFormat := '@';
      //myFormat2 := '@';
      xls.ActiveSheet.Range[xls.WorkBooks[1].ActiveSheet.Cells[1, ColCount], xls.WorkBooks[1].ActiveSheet.Cells[RowCount2, ColCount2]].NumberFormat := myFormat;

      Range.Value := arrData2;

      xls.Cells.rows.autofit;
      xls.cells.columns.autofit;
      xls.ActiveSheet.Range[xls.ActiveSheet.Cells[1,6],xls.ActiveSheet.Cells[1,colCnt2+1]].borders.color := clBlack;
      xls.ActiveSheet.Range[xls.ActiveSheet.Cells[1,6],xls.ActiveSheet.Cells[1,colCnt2+1]].Interior.color := clSilver;//RGB(192,192,192);
      xls.ActiveSheet.Range[xls.ActiveSheet.Cells[1,6],xls.ActiveSheet.Cells[1,colCnt2+1]].select;

//      xls.ActiveSheet.Range[xls.ActiveSheet.Cells[RowCount + 1,1],xls.ActiveSheet.Cells[RowCount + 1,colCnt2 + 1]].borders.color := clBlack;
//      xls.ActiveSheet.Range[xls.ActiveSheet.Cells[RowCount + 1,1],xls.ActiveSheet.Cells[RowCount + 1,colCnt2 + 1]].Interior.color := clSilver;//RGB(192,192,192);
//      xls.ActiveSheet.Range[xls.ActiveSheet.Cells[RowCount + 1,1],xls.ActiveSheet.Cells[RowCount + 1,colCnt2 + 1]].select;

      xls.Selection.HorizontalAlignment := Integer($FFFFEFF4);//integer($FFFFEFC8); //xlRight

      svDlg := TSaveDialog.Create(nil);
      svDlg.Title := '엑셀 내보내기 화면';
      svDlg.InitialDir := GetCurrentDir;
      svDlg.Filter := 'Excel files (*.xlsx)|*.xlsx';
      svDlg.FilterIndex := 1;
      svDlg.DefaultExt := 'xlsx';
      if svDlg.Execute then begin
        xls.WorkBooks[1].saveas(svDlg.FileName);
        MessageBoxTimeOut(Application.Handle, '엑셀파일로 저장완료!', '', 0, 0, 5000);
      end else begin
        xls.ActiveWorkBook.Saved := True;
      end;
      Result := true;
    except
      on E: Exception do
      begin
        ExceptLogging('TfrmCustInfo.btnTestClick: ' + aString(E.Message));
      end;
    end;
    KillExcel(xls);
  finally
    if VarIsEmpty(xls) = false then begin
      FreeAndNil(svDlg);

      xls.ActiveWorkBook.Close(SaveChanges:= 0);
      xls.quit;

    end;
  end;
end;

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
        if (homenetuse = 0) then  //홈넷 포인트 사용 안할시
        begin
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
        end
        else   //홈넷 포인트 사용 시
        begin
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
