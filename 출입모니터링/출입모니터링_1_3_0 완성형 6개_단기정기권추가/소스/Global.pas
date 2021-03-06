unit Global;

interface
uses
  Windows, SysUtils, Forms, WinInet, IniFiles, System.Classes,
  CodeSiteLogging, IdGlobal, Winapi.WinSock,
  System.DateUtils,
  idTCPclient;

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

  //>>{INI}==================================================================================

  // 'right'_ini
  ST_LIGHT_INI = packed record
    sIP           :string;  //iSetup.ReadString( 'PARKING', 'lightIP'      , '');
    nPort         :Integer; //iSetup.ReadInteger('PARKING', 'lightPort'    , 0 );
    nKeepTime     :Integer; //iSetup.ReadInteger('PARKING', 'lightKeepTime', 0 ) * 1000;
  end;

  // 'display'_ini
  ST_DISPLAY_INI = packed record
    nDisplaySize   :Integer; //--cal--iSetup.ReadInteger('DISPLAY', '전광판', 1);  //Added Woo.YH  0:2단4열(대우건설), 1:2단6열(일반)
    sIOSDsp        :string;  //iSetup.ReadString('DISPLAY', '정기차량문구', '  등록차량  ');  // 전체 12 // 한글(2)
    sIONDsp        :string;  //iSetup.ReadString('DISPLAY', '일반차량문구', ' 미등록차량 ');
    s4IOSDsp       :string;  //sIOSDsp;
    s4IONDsp       :string;  //sIONDsp;
    nUseDSPText    :Integer; //iSetup.ReadInteger('DISPLAY', '정기문구사용', 0);
    nAllDspStrUse  :Integer; //iSetup.ReadInteger('DISPLAY', 'AllDspStrUse', 1);

    sRecvInDsp     :string;  //tmpFixStrDspArr[0] := MG_StrTrim( aString(iSetup.ReadString( 'DISPLAY', 'RecvInDsp   '   , '222222222222' ) ), AnsiChar(39) );
    sRecvOutDsp    :string;  //tmpFixStrDspArr[1] := MG_StrTrim( aString(iSetup.ReadString( 'DISPLAY', 'RecvOutDsp  '  , '111111111111' ) ), AnsiChar(39) );
    sNomalInDsp    :string;  //tmpFixStrDspArr[2] := MG_StrTrim( aString(iSetup.ReadString( 'DISPLAY', 'NomalInDsp  '  , '222222222222' ) ), AnsiChar(39) );
    sNomalOutDsp   :string;  //tmpFixStrDspArr[3] := MG_StrTrim( aString(iSetup.ReadString( 'DISPLAY', 'NomalOutDsp ' , '111111111111' ) ), AnsiChar(39) );

    // 입/출차 정기문구색상, 일반문구색상..
    tmpFixStrDspArr: array[0..3] of String;
    fixStrDspArr   : array[0..3] of String;
  end;

  // '운영모드 시간 자동변경'_ini
  ST_AUTO_MODE_INI = packed record
    bMode          :Boolean; //iSetup.ReadBool(  'PARKING', '운영모드자동변경', False   );
    sOpenStart     :string;  //iSetup.ReadString('PARKING', '개방시작'        , '00:00' );
    sOpenEnd       :string;  //iSetup.ReadString('PARKING', '개방종료'        , '00:00' );
  end;


  // '블랙리스트의심기능'_ini
  ST_BLACK_INI = packed record
    nUse           :Integer; //iSetup.ReadInteger('PARKING', '블랙리스트의심사용', 0);
    nCount         :Integer; //iSetup.ReadInteger('PARKING', '블랙리스트의심입차회수', 0);
    nPanelShowTime :Integer; //iSetup.ReadInteger('PARKING', '블랙리스트의심창유지시간', 60);
  end;

  // '부제옵션'_ini
  ST_BUJAE_INI = packed record
    bUse           :Boolean; //iSetup.ReadBool(    'PARKING', '부제처리사용', False ); //Added LJH 190625 부제처리 옵션 사용여부 0: 사용안함, 1:사용
    bKind          :Integer; //iSetup.ReadInteger( 'PARKING', '부제처리종류', 0     ); //Added LJH 190625 부제처리 종류 설정 0: 부제사용안함, 1: 2부제, 2: 5부제, 3: 10부제
    b31Use         :Boolean; //iSetup.ReadBool(    'PARKING', '31일부제처리', False ); //Added LJH 190625 31일 부제적용할지 설정 0: 31일 부제미적용, 1: 31일 부제적용
  end;

  // '평택코레노'_ini
  ST_NITTO_INI = packed record
    sDbInfo        :string;  //nitto_DBInfoArr[0] := iSetup.ReadString( 'PARKING', 'nitto_dbInfo ','');
    sDbPort        :string;  //nitto_DBInfoArr[1] := iSetup.ReadString( 'PARKING', 'nitto_dbPort ','');
    sDbName        :string;  //nitto_DBInfoArr[2] := iSetup.ReadString( 'PARKING', 'nitto_dbName ','');
    sDbId          :string;  //nitto_DBInfoArr[3] := iSetup.ReadString( 'PARKING', 'nitto_dbId   ','');
    sDbPw          :string;  //nitto_DBInfoArr[4] := iSetup.ReadString( 'PARKING', 'nitto_dbPw   ','');
    DBInfoArr      :array[0..4] of string;
  end;

  // '스마트빌리지_ini'
  ST_SMARTVILLAGE_INI = packed record
    nUse           :Integer; // iSetup.ReadInteger( 'PARKING', 'smartVillageUse', 0 );
    nID            :Integer; // iSetup.ReadInteger( 'PARKING', 'smartVillageID' , 0 );
    nVisit         :Integer; // iSetup.ReadInteger( 'PARKING', 'smartVillagePoint' , 0 );
    nPoint         :Integer; // iSetup.ReadInteger( 'PARKING', 'smartVillagePoint' , 0 );
  end;

  // '아파트너_ini'
  ST_APTNER_INI = packed record
    nUse           :Integer; // iSetup.ReadInteger( 'PARKING', 'AptnerUse'        , 0  );

    sCode          :string;  // iSetup.ReadString(  'PARKING', 'AptnerCode'       , '' );
    sVisitAddr     :string;  // iSetup.ReadString(  'PARKING', 'AptnerVisitAddr'  , '' );
    sInCarAddr     :string;  // iSetup.ReadString(  'PARKING', 'AptnerInCarAddr'  , '' );
    sOutCarAddr    :string;  // iSetup.ReadString(  'PARKING', 'AptnerOutCarAddr' , '' );
    sVisitAuth     :string;  // iSetup.ReadString(  'PARKING', 'AptnerAuth'       , '' );
  end;

  ST_INI_INFO = packed record
    nInLprCount       :Integer;             // iSetup.ReadInteger('PARKING', '입차LPR수'          , 0    );
    nOutLprCount      :Integer;             // iSetup.ReadInteger('PARKING', '출차LPR수'          , 0    );
    nCurrUnitNo       :Integer;             // iSetup.ReadInteger('PARKING', 'UnitNo'             , 0    );
    nHostPort         :Integer;             // iSetup.ReadInteger('PARKING', 'Host Port'          , 0    );
    nHomeInfo_Port    :Integer;             // iSetup.ReadInteger('PARKING', 'HomeInfo Port'      , 25008);
    nHomeVisit        :Integer;             // iSetup.ReadInteger('PARKING', '홈넷방문자'         , 0    ); //Added Woo.YH 홈넷 방문자 연동  0:사용안함 , 1:사용
    nUseHomenetPoint  :Integer;             // iSetup.ReadInteger('PARKING', '홈넷포인트사용'     , 0    );
    nVisitLine        :Integer;             // iSetup.ReadInteger('PARKING', '방문자차로'         , 1    );
    nInLPR1           :Integer;            //iSetup.ReadInteger('PARKING', '입차LPR1', 1);    //우리네스 연동 채널
    nInLPR2           :Integer;            //iSetup.ReadInteger('PARKING', '입차LPR2', 2);    //우리네스 연동 채널
    blContests        :Integer;             // iSetup.ReadInteger('PARKING', 'blContests'         , 1    );
    blMusicRepeat     :Integer;             // iSetup.ReadInteger('PARKING', 'blMusicRepeat'      , 0    );
    blScreenAutoClose :Integer;             // iSetup.ReadInteger('PARKING', 'blScreenAutoClose'  , 0    );
    ShowSalesCarPass  :Integer;             // iSetup.ReadInteger('PARKING', 'ShowSalesCarPass'   , 0    );
    UseSalesCarPass   :Integer;             // iSetup.ReadInteger('PARKING', 'UseSalesCarPass'    , 0    );
    nDspInterval      :Integer;             // iSetup.ReadInteger('PARKING', 'DSPInterval'        , 90   );
    nApt              :Integer;             // iSetup.ReadInteger('PARKING', '아파트'             , 1    );
    nHomeinfo_Comp    :Integer;             // iSetup.ReadInteger('PARKING', '홈넷'               , 0    );
    nHomeinfo_Comp_SEC:Integer;              // iSetup.ReadInteger( 'PARKING', '홈넷2'             , 0    );
    nHomeinfo_ver     :Integer;             // iSetup.ReadInteger('PARKING', '홈넷버전'           , 0    );
    incheonKepco      :Integer;             // iSetup.ReadInteger('PARKING', 'incheonKepco'       , 0    );
    GroupBlockLPR     :Integer;             // iSetup.ReadInteger('PARKING', 'GroupBlockLPR'      , 0    );
    nBSoundUse        :Integer;             // iSetup.ReadInteger('PARKING', '블랙리스트소리사용' , 0    ); //Added LJH 190619 블랙리스트 소리파일 사용여부
    westLprNo         :Integer;             // iSetup.ReadInteger('PARKING', 'WestInLprUnitNo'    , 0    );
    AutoVisitOpen     :Integer;             // iSetup.ReadInteger('PARKING', 'AutoVisitOpen'      , 0    );
    mMirrorDsp        :Integer;             // iSetup.ReadInteger('PARKING', 'mMirrorDsp'         , 1    );
    nBlack            :Integer;             // iSetup.ReadInteger('PARKING', '블랙리스트'         , 0    );
    nBAlarmTime       :Integer;             // iSetup.ReadInteger('PARKING', 'Alarm Time'         , 10   ); //Addded Woo.YH 160415 블랙리스트알람시간 획득
    nGateActive       :Integer;             // iSetup.ReadInteger('PARKING', '차단기 제어여부'    , 1    );
    nGateControl      :Integer;             // iSetup.ReadInteger('PARKING', '차단기 제어'        , 1    );
    nVisitation       :Integer;             // iSetup.ReadInteger('PARKING', '방문증'             , 0    ); //Added Woo.YH 방문증  0:사용안함 , 1:사용
    nLogInUse         :Integer;             // iSetup.ReadInteger('PARKING', '로그인'             , 1    ); //Added Woo.YH 프로그램 시작시 로그인  0:사용안함 , 1:사용

    sDBIP             :string;              // iSetup.ReadString( 'PARKING', 'DB IP'              , ''                  );
    sDBID             :string;              // iSetup.ReadString( 'PARKING', 'DB ID'              , ''                  );
    sDBPW             :string;              // iSetup.ReadString( 'PARKING', 'DB PW'              , ''                  );
    sDBName           :string;              // iSetup.ReadString( 'PARKING', 'DB Name'            , ''                  );
    adminManager      :string;              // iSetup.ReadString( 'PARKING', '관리자ID'           , '(주)넥스파시스템'  );
    sImageDir         :string;              // iSetup.ReadString( 'PARKING', 'LPRImage'           , 'C:\LPRImage'       );
    sLogoFile         :string;              // iSetup.ReadString( 'PARKING', 'Logo File'          , ''                  );
    sHostIP           :string;   //MG_StrTrim( iSetup.ReadString( 'PARKING', 'Host IP'            , ''                  ), ' ' );
    sHomeInfo_IP      :string;   //MG_StrTrim( iSetup.ReadString( 'PARKING', 'HomeInfo IP'        , '10.10.10.10'       ), ' ' );
    sezVilleDong      :string;              // iSetup.ReadString( 'PARKING', 'ezVilleDong'        , '100'               );
    sezVilleHo        :string;              // iSetup.ReadString( 'PARKING', 'ezVilleHo'          , '900'               );
    sHomeInfo_ID      :string;              // iSetup.ReadString( 'PARKING', 'HomeInfo ID'        , 'wiju'              );
    sHomeInfo_PW      :string;              // iSetup.ReadString( 'PARKING', 'HomeInfo PW'        , 'wiju1234'          );
    sBAlarmFile       :string;              // iSetup.ReadString( 'PARKING', 'Alarm File'         , ''                  );
    SalesCarNumber    :string;              // iSetup.ReadString( 'PARKING', 'SalesCarNumber'     , '아,바,사,자'       );
    sGYDBIP           :string;              // iSetup.ReadString( 'PARKING', 'Gyeyoung DB IP'     , ''                  ); //Added Woo.YH 계영정보통신 DB연동
    sGYDBID           :string;              // iSetup.ReadString( 'PARKING', 'Gyeyoung DB ID'     , ''                  );
    sGYDBPW           :string;              // iSetup.ReadString( 'PARKING', 'Gyeyoung DB PW'     , ''                  );
    sGYDBName         :string;              // iSetup.ReadString( 'PARKING', 'Gyeyoung DB Name'   , ''                  );

    bMode             :Boolean;             // iSetup.ReadBool(   'PARKING', '개방운영'           , True  ); //Added Woo.YH 개방운영모드 1: 유인 0: 개방
    bModeUse          :Boolean;             // iSetup.ReadBool(   'PARKING', 'LPR별개방운영사용'  , False ); //Added LJH LPR별 별도 개방운영모드 옵션사용 0: 미사용, 1: 사용
    bMonitoring       :Boolean;             // iSetup.ReadBool(   'PARKING', '모니터링유무'       , false );
    bGYUse            :Boolean;             // iSetup.ReadBool(   'PARKING', 'Gyeyoung Option'    , false );
    bMiIn             :Boolean;             // iSetup.ReadBool(   'PARKING', 'MI_IN'              , False );
    bMI_IN_INOPEN     :Boolean;             // iSetup.ReadBool('PARKING', 'MI_IN_INOPEN', False);  //미인식 입차 오픈
    nImageTimeUse     :Integer;
    b6Proc            :Boolean;             // iSetup.ReadBool(   'PARKING', '6Proc'              , False );

    APTNER            : ST_APTNER_INI;      // 아파트너
    SMARTVILLAGE      : ST_SMARTVILLAGE_INI;// 스마트빌리지
    NITTO             : ST_NITTO_INI;       // 평택코레노 연동

    nEarthQuakeUse    : Integer;            // iSetup.ReadInteger( 'PARKING', '지진연동', 0 ); //지진연동(아크로포레스트)
    nEarthQuakeTimeUse    : Integer;            // iSetup.ReadInteger( 'PARKING', '지진연동시간', 0 ); //지진연동(아크로포레스트)

    sHomeAppIP        : string;             // iSetup.ReadString('PARKING','homeAppIP','');
    nHomeAppPort      : Integer;            // iSetup.ReadInteger('PARKING','homeAppPort',0);

    Bujae             : ST_BUJAE_INI;       // 부제옵션 불러오기
    CountBlack        : ST_BLACK_INI;       // 블랙리스트 의심기능

    bAutoNormalOutOpen: Boolean;            // iSetup.ReadBool('PARKING', '일반차량 출차자동개방', True); // Added by LJH 2019-07-29 17:01:00 일반차량 출차LPR 자동개방여부
    bAutoIOSOutOpen   : Boolean;            // iSetup.ReadBool('PARKING', '정기차량기간만료 출차자동개방', false);

    Auto              : ST_AUTO_MODE_INI;   // '운영모드 시간 자동변경'_ini

    display           : ST_DISPLAY_INI;     // 'display'_ini

    noSendHNetStr     : string;             // iSetup.ReadString('PARKING', 'noSendhNet', '');
    light             : ST_LIGHT_INI;       // 'light'_ini

    nCarNumber4       : Integer;            // iSetup.ReadInteger('PARKING','차량번호 4자리 인식여부',0); // 미인식 차량 자동개방여부
    nDayCust          : Integer;            // iSetup.ReadInteger('PARKING', '단기정기권사용', 0);        // 단기정기권사용 차량
    nCameraCh         : Integer;            // iSetup.ReadInteger('PARKING', 'CameraCHInout', 0);
    nCameraControl    : Integer;            // iSetup.ReadInteger('PARKING', 'CameraControl', 0);

    sHomeInfo_IP2     : string;             // MG_StrTrim(iSetup.ReadString('PARKING', 'HomeInfo IP2', '10.10.10.10'), ' ');
    nHomeInfo_Port2   : Integer;            // iSetup.ReadInteger('PARKING', 'HomeInfo Port2', 25008);
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

  //1.1.9	방문차량 등록 요청2(미들웨어 -> 넥스파)
  ST_VISIT_REG_REQ2 = packed record
    s_command    : string;
    s_dong       : string; //
    s_ho         : string; //
    s_car_number : string; // “차량번호”,
    s_date       : string; // "yyyyMMdd", // 등록(방문) 일
    s_edate      : string; // "yyyyMMdd", // 등록(방문)종료 일
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

  // 'visit_reg2'     >> 스마트빌리지 방문차량.등록.요청.응답
  ST_VISIT_REG_G2 = packed record
    req: ST_VISIT_REG_REQ2;
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

  //=========================================================================

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
    p_visit_reg2       : ST_VISIT_REG_G2;
    p_visit_del        : ST_VISIT_DEL_G;

    p_visit_favo_reg   : ST_VISIT_FAVO_REG_G;
    p_visit_favo_list  : ST_VISIT_FAVO_LIST_G;
    p_visit_favo_del   : ST_VISIT_FAVO_DEL_G;
    p_alias_single     : ST_ALIAS_SINGLE_G;

    p_car_alias_modify : ST_CAR_ALIAS_MODIFY_G; // add newly..
    p_find_car         : ST_FIND_CAR_G;         // add newly..

  end;

  //=========================================================================

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

  //20.07.14 세대 포인트 요청
  Park_Visitor_Point_Req = record
    nType     : Cardinal;
    nCmdId    : Cardinal;
    nReserved : Cardinal;
  end;

   //20.07.14 세대 포인트 응답
  Park_Visitor_Point_Rep = record
    nHeaderKey: Cardinal;
    nMsgType  : Cardinal;
    nMsgLength: Cardinal;
    nTown     : Cardinal;
    nDong     : Cardinal;
    nHo       : Cardinal;
    nReservedH: Cardinal;   //해더
    nType     : Cardinal;
    nCmdId    : Cardinal;
    nResult : Integer;
    nCurPoint : Cardinal;
    nTotPoint : Cardinal;
    nUsePoint : Cardinal;
    nPointType : Cardinal;
    nPointUnit : Cardinal;
    nReserved : Cardinal;
  end;
  //21.01.20 세대 포인트 사전 방문 차량 이력 요청
   Park_Visitor_Point_Log_Req = record
    nType     : Cardinal;
    nCmdId    : Cardinal;
    nLastIndex : Cardinal;
    nMaxCnt   : Cardinal;
    nReserved : Cardinal;
  end;

  // //세대 포인트 사전 방문 차량 응답  가변길이
  Park_Visitor_Point_Log_Info = record
    nIndex    : Cardinal;
    szCarNo   : Array[1..20] of AnsiChar;   //차량번호
    nInOut    : Cardinal;    //In : 1 , Out : 2
    nUsePoint : Cardinal;    //사용한 포인트
    //nInOut    : Array[1..4] of Cardinal;    //In : 1 , Out : 2
    //nUsePoint : Array[1..4] of Cardinal;    //사용한 포인트
    szIDate   : Array[1..16] of AnsiChar;   //입차 시각
    szODate   : Array[1..16] of AnsiChar;   //출차 시각
    nReserved : Cardinal;
  end;

  //세대 포인트 사전 방문 차량 응답 전문
  Park_Visitor_Point_Log_Rep = record
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
    nTotCount : Cardinal;  //총리스트 개수
    nReserved : Cardinal;
    //rPointListInfo : Array of Park_Visitor_Point_Log_Info;
    rPointListInfo : Array[1..6] of Park_Visitor_Point_Log_Info;
    //rListInfo2 : Array[1..6] of Park_Visitor_Point_Log_Info;
    //rListInfo2 : Array of Park_Visitor_Point_Log_Info;
    //rListInfo2 : Array[1..30] of Park_Visitor_Point_Log_Info;
  end;

   //세대 포인트 사전 방문 차량 응답 전문
  Park_Visitor_Point_Log_Rep0 = record
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
    nTotCount : Cardinal;  //총리스트 개수
    nReserved : Cardinal;
    rPointListInfo : Array[1..1] of Park_Visitor_Point_Log_Info;
  end;

  //세대 포인트 사전 방문 차량 응답 전문
  Park_Visitor_Point_Log_Rep1 = record
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
    nTotCount : Cardinal;  //총리스트 개수
    nReserved : Cardinal;
    rPointListInfo : Array[1..1] of Park_Visitor_Point_Log_Info;
  end;

    //세대 포인트 사전 방문 차량 응답 전문
  Park_Visitor_Point_Log_Rep2 = record
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
    nTotCount : Cardinal;  //총리스트 개수
    nReserved : Cardinal;
    rPointListInfo : Array[1..2] of Park_Visitor_Point_Log_Info;
  end;

   Park_Visitor_Point_Log_Rep3 = record
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
    nTotCount : Cardinal;  //총리스트 개수
    nReserved : Cardinal;
    rPointListInfo : Array[1..3] of Park_Visitor_Point_Log_Info;
  end;

   Park_Visitor_Point_Log_Rep4 = record
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
    nTotCount : Cardinal;  //총리스트 개수
    nReserved : Cardinal;
    rPointListInfo : Array[1..4] of Park_Visitor_Point_Log_Info;
  end;

   Park_Visitor_Point_Log_Rep5 = record
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
    nTotCount : Cardinal;  //총리스트 개수
    nReserved : Cardinal;
    rPointListInfo : Array[1..5] of Park_Visitor_Point_Log_Info;
  end;

  Park_Visitor_Point_Log_Rep6 = record
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
    nTotCount : Cardinal;  //총리스트 개수
    nReserved : Cardinal;
    rPointListInfo : Array[1..6] of Park_Visitor_Point_Log_Info;
  end;

  Park_Visitor_Point_Log_Rep7 = record
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
    nTotCount : Cardinal;  //총리스트 개수
    nReserved : Cardinal;
    rPointListInfo : Array[1..7] of Park_Visitor_Point_Log_Info;
  end;

    Park_Visitor_Point_Log_Rep8 = record
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
    nTotCount : Cardinal;  //총리스트 개수
    nReserved : Cardinal;
    rPointListInfo : Array[1..8] of Park_Visitor_Point_Log_Info;
  end;

    Park_Visitor_Point_Log_Rep9 = record
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
    nTotCount : Cardinal;  //총리스트 개수
    nReserved : Cardinal;
    rPointListInfo : Array[1..9] of Park_Visitor_Point_Log_Info;
  end;

  Park_Visitor_Point_Log_Rep10 = record
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
    nTotCount : Cardinal;  //총리스트 개수
    nReserved : Cardinal;
    rPointListInfo : Array[1..10] of Park_Visitor_Point_Log_Info;
  end;

  Park_Visitor_Point_Log_Rep11 = record
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
    nTotCount : Cardinal;  //총리스트 개수
    nReserved : Cardinal;
    rPointListInfo : Array[1..11] of Park_Visitor_Point_Log_Info;
  end;

  Park_Visitor_Point_Log_Rep12 = record
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
    nTotCount : Cardinal;  //총리스트 개수
    nReserved : Cardinal;
    rPointListInfo : Array[1..12] of Park_Visitor_Point_Log_Info;
  end;

  Park_Visitor_Point_Log_Rep13 = record
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
    nTotCount : Cardinal;  //총리스트 개수
    nReserved : Cardinal;
    rPointListInfo : Array[1..13] of Park_Visitor_Point_Log_Info;
  end;

   Park_Visitor_Point_Log_Rep14 = record
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
    nTotCount : Cardinal;  //총리스트 개수
    nReserved : Cardinal;
    rPointListInfo : Array[1..14] of Park_Visitor_Point_Log_Info;
  end;

   Park_Visitor_Point_Log_Rep15 = record
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
    nTotCount : Cardinal;  //총리스트 개수
    nReserved : Cardinal;
    rPointListInfo : Array[1..15] of Park_Visitor_Point_Log_Info;
  end;

     Park_Visitor_Point_Log_Rep16 = record
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
    nTotCount : Cardinal;  //총리스트 개수
    nReserved : Cardinal;
    rPointListInfo : Array[1..16] of Park_Visitor_Point_Log_Info;
  end;

     Park_Visitor_Point_Log_Rep17 = record
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
    nTotCount : Cardinal;  //총리스트 개수
    nReserved : Cardinal;
    rPointListInfo : Array[1..17] of Park_Visitor_Point_Log_Info;
  end;

  Park_Visitor_Point_Log_Rep18 = record
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
    nTotCount : Cardinal;  //총리스트 개수
    nReserved : Cardinal;
    rPointListInfo : Array[1..18] of Park_Visitor_Point_Log_Info;
  end;

  Park_Visitor_Point_Log_Rep19 = record
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
    nTotCount : Cardinal;  //총리스트 개수
    nReserved : Cardinal;
    rPointListInfo : Array[1..19] of Park_Visitor_Point_Log_Info;
  end;

  Park_Visitor_Point_Log_Rep20 = record
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
    nTotCount : Cardinal;  //총리스트 개수
    nReserved : Cardinal;
    rPointListInfo : Array[1..20] of Park_Visitor_Point_Log_Info;
  end;

  Park_Visitor_Point_Log_Rep21 = record
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
    nTotCount : Cardinal;  //총리스트 개수
    nReserved : Cardinal;
    rPointListInfo : Array[1..21] of Park_Visitor_Point_Log_Info;
  end;

  Park_Visitor_Point_Log_Rep22 = record
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
    nTotCount : Cardinal;  //총리스트 개수
    nReserved : Cardinal;
    rPointListInfo : Array[1..22] of Park_Visitor_Point_Log_Info;
  end;

  Park_Visitor_Point_Log_Rep23 = record
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
    nTotCount : Cardinal;  //총리스트 개수
    nReserved : Cardinal;
    rPointListInfo : Array[1..23] of Park_Visitor_Point_Log_Info;
  end;

  Park_Visitor_Point_Log_Rep24 = record
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
    nTotCount : Cardinal;  //총리스트 개수
    nReserved : Cardinal;
    rPointListInfo : Array[1..24] of Park_Visitor_Point_Log_Info;
  end;

  Park_Visitor_Point_Log_Rep25 = record
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
    nTotCount : Cardinal;  //총리스트 개수
    nReserved : Cardinal;
    rPointListInfo : Array[1..25] of Park_Visitor_Point_Log_Info;
  end;

  Park_Visitor_Point_Log_Rep26 = record
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
    nTotCount : Cardinal;  //총리스트 개수
    nReserved : Cardinal;
    rPointListInfo : Array[1..26] of Park_Visitor_Point_Log_Info;
  end;

  Park_Visitor_Point_Log_Rep27 = record
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
    nTotCount : Cardinal;  //총리스트 개수
    nReserved : Cardinal;
    rPointListInfo : Array[1..27] of Park_Visitor_Point_Log_Info;
  end;


  Park_Visitor_Point_Log_Rep28 = record
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
    nTotCount : Cardinal;  //총리스트 개수
    nReserved : Cardinal;
    rPointListInfo : Array[1..28] of Park_Visitor_Point_Log_Info;
  end;

  Park_Visitor_Point_Log_Rep29 = record
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
    nTotCount : Cardinal;  //총리스트 개수
    nReserved : Cardinal;
    rPointListInfo : Array[1..29] of Park_Visitor_Point_Log_Info;
  end;

  Park_Visitor_Point_Log_Rep30 = record
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
    nTotCount : Cardinal;  //총리스트 개수
    nReserved : Cardinal;
    rPointListInfo : Array[1..30] of Park_Visitor_Point_Log_Info;
  end;



   TR_PARK_VISITOR_POINT_LOG_REP_BODY = packed record
    nIndex    : Integer;                    // (M) 인덱스
    szCarNo   : array [0..19] of AnsiChar;  // (M)차량번호
    nInOUt    : Integer;                    // (M)In:1, Out:2
    nUsePoint : Integer;                    // (M)사용한 포인트 (포인트 미사용시 -1)
    szIDate   : array [0..15] of AnsiChar;  // (M)입차시각 (YYYYMMDDHHMMSS)
    szODate   : array [0..15] of AnsiChar;  // (M)출차시각 (YYYYMMDDHHMMSS)
    nReserved : Integer;                    // (O)예비변수
  end;

  TR_PARK_VISITOR_POINT_LOG_REP = packed record
    nHeaderKey: Cardinal;
    nMsgType  : Cardinal;
    nMsgLength: Cardinal;
    nTown     : Cardinal;
    nDong     : Cardinal;
    nHo       : Cardinal;
    nReservedH: Cardinal;   //해더

    nType     : Integer; // (M)명령타입
    nCmdId    : Integer; // (M)명령ID
    nCount    : Integer; // (M)리스트개수
    nTotCount : Integer; // (M)총 리스트 개수
    nReserved : Integer; // (O)예비변수
    LIST      : Array[1..6] of TR_PARK_VISITOR_POINT_LOG_REP_BODY;
  end;

var
  g_s_home_net_ip : string;
  g_mid_json: ST_MIDDLEWARE_JSON;  // 김태현 >> 미들웨어 통신용, buffer..

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
  nUseHomenetPoint : Integer = 0; //홈넷 포인트 사용여부
  nhomenetCarCount : Integer = 0; //홈넷(코콤)사전방문 등록 차량댓수 제한 여부
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
  nLoginResult: Byte = 0;
  sBAlarmFile : String = '';       //블랙리스트 알람 소리 파일
  nBAlarmTime : Integer = 0;       //블랙리스트 알람 시간
  sIOSDsp, sIONDsp, s4IOSDsp, s4IONDsp: String;        //정기차량, 일반차량 입차 문구
  nGateActive : integer = 0;       //차단기 동작여부(0 동작안함, 1 동작)
  nGateControl : integer = 0;      //차단기 수동조작 옵션(0:버튼없음, 1:OPEN, 2:OPEN,CLOSE, 3: OPEN,CLOSE,LOCK,UNLOCK)
  nGateNo     : Integer = 0;       //십의 자리는 1입차 2출차
                                   //예) 입차1번 11 입차2번 12 .... 출차1번 21 출차2번 22 출차3번 23
  nVisitation : Integer = 0;       //방문증 0:사용안함 , 1:사용
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

  //20.07.16
  nDayCust : Integer;

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

  //홈넷 포인트 조회 추가
  nPointDate : aString;
  nAvailablePoint : Integer;
  nUsedPoint, nRemainPoint, nPointType, nPointUnit : Integer;
  nPointMonth : Integer;
  nPointDate2 :TDateTime;

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
  nHomeInfo_Comp, nHomeinfo_Comp_SEC : Integer;//현대통신:1          / 코콤:2    / 아이컨트롤스:3   / 계영정보통신:4
                           //삼성중공업 유비즈:5 / 이즈빌:6  / 한화(비쥬드림):7 / CVNET : 8 / 코맥스:9
                           //홈넷홈:10 / 경동원:11
                           //홈넷없음:0
  nHomeinfo_ver : Integer;//아이콘트롤스 new & old 프로토콜 버전
  sHomeInfo_IP, sHomeInfo_Temp, sLocalIP, sRecvHomeServer, sHomeInfo_ID, sHomeInfo_PW,sHomeInfo_IP2: aString;
  nHomeInfo_Port,nHomeInfo_Port2: Cardinal;
  bHomeInfo: Boolean = False;
  sHomeInfo : AnsiString;

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
  sezVilleDong, sezVilleHo, sezVilleDong2, sezVilleHo2, sHomeInfo_CarNo, sHomeInfo_CardNo, sHomeInfo_Dong, sHomeInfo_Ho,
  sHomeInfo_ShortCarNo, sHomeInfo_Data,sHomeInfo_Type: aString;

  bMiIn : Boolean = False;
  bMI_IN_INOPEN : Boolean = False;
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
  bAutoIOSOutOpen : Boolean = False;

  //아파트너 연동사용
  AptnerUse: Integer = 0;
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
  smartVillageVisit_Ver : Integer = 0; //방문차량 전문 버전
  smartVillageVisit : Integer = 0; //방문자 사용
  smartVillagePoint : Integer = 0; //포인트 사용

  //방문증발급과 동시에 차단기 오픈
  AutoVisitOpen: Integer;

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

  nsInLprCount : Integer; //입구 lpr 갯수
  nsOutLprCount : Integer; //출구 lpr 갯수
  inTime : Integer; //색상 깜빡거리기
  CarNumber4 : Integer;// 차량 번호 4자리 인식
  nParkingMin2 : Integer; //현대 통신 포인트

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
  //CarNumber4: Integer;

  //입/출차 정기문구색상,일반문구색상
  tmpFixStrDspArr: array[0..3] of String;
  fixStrDspArr: array[0..3] of String;
  //단기 정기권
  useDayCust : Integer;

  cameraCh, CameraControl: Integer; //lpr카메라 2개로 입/출차제어

  sOPT : aString;//참슬테크 명령어
  message_type,message_type2, nsKind : aString;//미들웨어 메시지 응답 값

  nEarthQuakeUse, nEarthQuakeTimeUse: Integer; //지진 사용 여부(아크로포레스트건)

  // 김태현 >> ini 설정정보 구조체로 취합..
  g_ini: ST_INI_INFO;

  nDisplayParkingTimeUse : Integer;  //전광판 주차시간 표출

  nbCheckVisit : Boolean; //포인트 사전방문차량 부족 여부

  nInLPR1,nInLPR2 : Word; //우리네스 연동 채널 번호

  nChannelNo : Integer; //이미지 번호 우리네스 연동 작업

  nsUnitNo  : Integer;//미들웨어 LPR 번호 , TKNO번호
  nsVisitDt, nsCardNo, nsLprFile1 : string;  //미들웨어 이미지 경로

  //홈넷 사전방문 설정
  svisitinfocount, svisitinfoTime,  svisitinfoDate, svisitinfoInsert : String;

  nVisitRoopCount2 : Integer;//코콤 포인트 이력 전문

  sMainLprIP, sOutMainLprIP, sMainRecv, sOutMainRecv : string; //메인 LPR IP 싱크 보조일때가 들어갈때

  IOS_Expiration : Integer;  //아파트너 방문증 입차 통보 여부(정기차량 기간만료)

  inDong, inHo, inValue, nStartdate, nEnddate, nStartdate2, nEnddate2: string; //홈넷사전방문, 앱사전방문, 방문증방문 동/호/사유 사용용도

  nImageTimeUse : Integer; //이미지 로드 시간 사용여부

  nsubDSPuse, nsubOutDSPuse : Integer; //보조 전광판 사용

  sDspSubIP, sDspOutSubIP : string; //보조 전광판 IP주소

  nVisitBarOpenUse : Integer; //모니터링 모드 상관없이 방문차량 차단기 제어 여부 옵션

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
function MG_InsNull2(cString: AnsiString; cLen: Integer): AnsiString;
function My_LocalIP : String;
function FindIntFromStr(AString: string): Integer;
procedure Delay(TickTime : Integer);
function RemoveCRLF (const aString : string) : string;
function BuildBCC(sData: aString): aString;
function KocomMakeString(nCnt: Byte; sDongHo: aString; sCarNo: aString; nIO: Byte): aString;
function ConnectTimeOut(pAddr: ansistring; uPort: Word;
    uTimeOut: Byte =3): Boolean;
function IsPortActive(AHost : string; APort : string): boolean;
function MessageBoxTimeOut(hWnd: HWND; lpText: PAnsiChar; lpCaption: PChar; uType: UINT; wLanguageId: WORD; dwMilliseconds: DWORD): Integer; stdcall; external user32 name 'MessageBoxTimeoutA';

function IfRemainThen(c: Integer; a: Integer): integer; // 김태현 added..
function StringToDate( sString: string ): TDateTime;    // 김태현 copy from main form..

implementation

function StringToDate( sString: string ): TDateTime; // 김태현 copy from main form..
var
  sTempY,
  sTempM,
  sTempD,
  sTempH,
  sTempMm,
  sTempS  : String; //임시 년월일시분초
  sTemp   : String;
begin
  sTempY  := Copy( sString, 1, 4 );
  sTempM  := Copy( sString, 5, 2 );
  sTempD  := Copy( sString, 7, 2 );
  sTempH  := Copy( sString, 9, 2 );
  sTempMm := Copy( sString,11, 2 );

  Result  := EncodeDateTime( StrToInt( sTempY  ),
                             StrToInt( sTempM  ),
                             StrToInt( sTempD  ),
                             StrToInt( sTempH  ),
                             StrToInt( sTempMm ),
                             0,
                             0            );
end;

function IfRemainThen(c: Integer; a: Integer): integer; // 김태현 added..
begin
  if a = 0 then
    Result := c
  else
    Result := c+1;
end;

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

function MG_InsNull2(cString: AnsiString; cLen: Integer): AnsiString;
var
  dLen: integer;
  cBuf: AnsiString;
begin
  cBuf:= cString;
  dLen:= Length(cBuf);

  if cLen > dLen then Result:= cBuf + MG_Replicate(AnsiChar($01), cLen-dLen)
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

initialization
  // 김태현 - buffer 초기화..
  SetLength( g_mid_json.p_alias_single    .req.a_list.LIST, 0 );
  SetLength( g_mid_json.p_alias_single    .res.a_list.LIST, 0 );
  SetLength( g_mid_json.p_in_list         .res.a_list.LIST, 0 );
  SetLength( g_mid_json.p_find_car        .res.a_list.LIST, 0 );
  SetLength( g_mid_json.p_visit_favo_list .res.a_list.LIST, 0 );
  SetLength( g_mid_json.p_visit_list      .res.a_list.LIST, 0 );

  FillChar( g_mid_json, SizeOf( ST_MIDDLEWARE_JSON ), #0 );
  FillChar( g_ini     , SizeOf( ST_INI_INFO        ), #0 );

  g_s_home_net_ip := '';

end.
