unit EasyOnHomeInfo;

{$DEFINE JSON_NEW}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack,
  IdServerIOHandler, IdServerIOHandlerSocket, IdServerIOHandlerStack,
  IdTCPConnection, IdTCPClient, IdBaseComponent, IdComponent, IdCustomTCPServer,
  IdTCPServer, Vcl.ComCtrls, IdGlobal, Vcl.ExtCtrls, CodeSiteLogging, IdContext,
  Winapi.WinSock, System.JSON, System.Win.ScktComp,
  //{$IFDEF JSON_NEW}
    Global,
    XSuperJSON,   // 김태현 추가..
    XSuperObject, // 김태현 추가..
  //{$ENDIF}
  DateUtils;

type
  TEasyOnHomeInfo = class(TForm)
  private
    function is_Ping(ip: AnsiString): Boolean;
    procedure csEasyConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure csEasyDisconnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure csEasyError(Sender: TObject; Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure csEasyRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure prDelay(Time: Integer);

    //{$IFDEF JSON_NEW}
      function fSendDataToMiddleware( sIP: string; nPort: Integer; sJson: string ): Integer;

      function fParsingJsonOfMiddleware( s_command: string; var st_mid_json: ST_MIDDLEWARE_JSON; AJson: ISuperObject ): Boolean;
      {
      function fJsonToSendToMiddleware( buf: ST_IN_LIST_G          ): string; overload;
      function fJsonToSendToMiddleware( buf: ST_VISIT_LIST_G       ): string; overload;
      function fJsonToSendToMiddleware( buf: ST_VISIT_REG_G        ): string; overload;
      function fJsonToSendToMiddleware( buf: ST_VISIT_DEL_G        ): string; overload;
      function fJsonToSendToMiddleware( buf: ST_VISIT_FAVO_REG_G   ): string; overload;
      function fJsonToSendToMiddleware( buf: ST_VISIT_FAVO_LIST_G  ): string; overload;
      function fJsonToSendToMiddleware( buf: ST_VISIT_FAVO_DEL_G   ): string; overload;
      function fJsonToSendToMiddleware( buf: ST_ALIAS_SINGLE_G     ): string; overload;
      function fJsonToSendToMiddleware( buf: ST_CAR_ALIAS_MODIFY_G ): string; overload;
      function fJsonToSendToMiddleware( buf: ST_FIND_CAR_G         ): string; overload;
      }
    //{$ENDIF}

    procedure Do_check_home_net_connection();
    procedure Init_json_buffer();

  public
    function fJsonToSendToMiddleware( buf: ST_IN_LIST_G          ): string; overload; // move for debugging..
    function fJsonToSendToMiddleware( buf: ST_VISIT_LIST_G       ): string; overload; // move for debugging..
    function fJsonToSendToMiddleware( buf: ST_VISIT_REG_G        ): string; overload; // move for debugging..
    function fJsonToSendToMiddleware( buf: ST_VISIT_DEL_G        ): string; overload; // move for debugging..
    function fJsonToSendToMiddleware( buf: ST_VISIT_FAVO_REG_G   ): string; overload; // move for debugging..
    function fJsonToSendToMiddleware( buf: ST_VISIT_FAVO_LIST_G  ): string; overload; // move for debugging..
    function fJsonToSendToMiddleware( buf: ST_VISIT_FAVO_DEL_G   ): string; overload; // move for debugging..
    function fJsonToSendToMiddleware( buf: ST_ALIAS_SINGLE_G     ): string; overload; // move for debugging..
    function fJsonToSendToMiddleware( buf: ST_CAR_ALIAS_MODIFY_G ): string; overload; // move for debugging..
    function fJsonToSendToMiddleware( buf: ST_FIND_CAR_G         ): string; overload; // move for debugging..

    //function Homeinfo_proc_EasyOn(ip: string; port: Integer; dong, ho, carNum, status: string): string;
    function Homeinfo_proc_EasyOn(ip: string; port: Integer; dong, ho, carNum, status, kind: string): string;
    function HomeInfo_Proc_EasyOnConn(ip: string; port: Integer): Boolean;
  end;

function IcmpCreateFile: THandle; stdcall; external 'icmp.dll';

function IcmpCloseHandle(icmpHandle: THandle): boolean; stdcall; external 'icmp.dll';

function IcmpSendEcho(IcmpHandle: THandle; DestinationAddress: LongInt; RequestData: Pointer; RequestSize: Smallint; RequestOptions: pointer; ReplyBuffer: Pointer; ReplySize: DWORD; Timeout: DWORD): DWORD; stdcall; external 'icmp.dll';

var
  EasyOnHome : TEasyOnHomeInfo;
  idTC       : TIdTCPClient;
  sendJSON   : TJSONObject;
  csEasy     : TClientSocket;
  recvThd    : TThread;
//ackJson,
  sourceJSON : TJSONObject;
  sendList   : TList;

implementation

uses
  {$IFNDEF JSON_NEW}
    Global,
  {$ENDIF}
  Tables,
  Main;
var
  sTKNo : string;

  Json_command_value, Json_Dong_Value, Json_ho_Value, Json_car_number_Value,
  Json_date_Value, Json_term_Value, Json_reg_no_Value, Json_page_Value,
  Json_count_Value, Json_Type_Value : String;
  date_time, date_time2: String;
  sSendCarNo, sSend_type, sStartDateTime, sEndDateTime, svisit_flag, nsterm : string;
  custinfo_list, sterm, list_count, list_count2, nremain_page, nSendPage, nMod : Integer;
const
  CM1 = 'status_check';
  CM2 = 'status_ack';
  CM3 = 'alert_incar';
  CM4 = 'alert_outcar';
  CM5 = 'trans_error';
  CM6 = 'visit_reg';
  CM7 = 'visit_del';
  CM8 = 'incar_list';
  CM9 = 'visit_list';

function TEasyOnHomeInfo.is_Ping(ip: AnsiString): Boolean;
var
  Handle: THandle;
  DW: DWORD;
  REP: ICMPECHO;
  IPLong: LongInt;
begin
   //Result := -1;
  Result := False;
   //ExceptLogging('Ping 시간 체크1-' + IntToStr(GetTickCount));

  Handle := IcmpCreateFile;

  if Handle = INVALID_HANDLE_VALUE then
    Exit;

  IPLong := inet_addr(PAnsiChar(ip));
  DW     := IcmpSendEcho(Handle, IPLong, nil, 0, nil, @REP, Sizeof(REP), nPingTimeOut);

   //Result := rep.Status;

  if REP.status = 0 then
  begin
     // Added By LJH 181126 ====================
     // 기존 isPing 함수가 IP없이 체크할경우 TRUE로 반환하고 있었음.
     // 따라서 체크결과가 어떻든 IP가 빈칸일 경우 False반환토록 추가
    if ip = '' then
    begin
      Result := False;
    end
    else
    begin
      Result := True;
    end;
  end
  else
  begin
    Result := False;
  end;

   //ExceptLogging('Ping 시간 체크2-' + IntToStr(GetTickCount));
  IcmpCloseHandle(Handle);
end;


procedure TEasyOnHomeInfo.prDelay(Time: Integer);
var
   PastCount: LongInt;
begin
     PastCount := GetTickCount;
     repeat
           Application.ProcessMessages;
     until ((GetTickCount-PastCount) >= LongInt(Time));
end;

{ TEasyOnHomeInfo }

procedure TEasyOnHomeInfo.csEasyConnect(Sender: TObject; Socket: TCustomWinSocket);
begin
  csEasy.Open;
  ExceptLogging(TClientSocket(Sender).Host + ':' + IntToStr(TClientSocket(Sender).port) + ' 연결');
end;

procedure TEasyOnHomeInfo.csEasyDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
   csEasy.Close;
   if csEasy.Socket.Connected = False then begin
      ExceptLogging(TClientSocket(Sender).Host+':'+IntToStr(TClientSocket(Sender).port)+' 에러!');
   end;
end;

procedure TEasyOnHomeInfo.csEasyError(Sender: TObject; Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
var
  tmpCnt: Integer;
  tmpErrorCd: Integer;
  tmpMsg: String;
begin
  Try

    tmpErrorCd := ErrorCode;
    tmpMsg := '';

    nDspInterval := 90;

    Case ErrorCode of
      10049 : tmpMsg := '컨넥트 하려는 주소가 잘못';
      10053 : tmpMsg := '소프트웨어 때문에 연결이 중단되었습니다';
      10054 : tmpMsg := '상대편에 의해 연결이 강제로 종료되었을 경우 발생하는 오류';
      10060 : tmpMsg := '네트워크 타임아웃';
      10061 : tmpMsg := '서버가 죽었거나 클라이언트에서 접속환경이 잘못되었을때 나타나는 현상';
    else tmpMsg := '네트워크 기타 에러';
    end;
    ErrorCode := 0;
    csEasy.Close;

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
  except
     on  E : exception  do
     begin
         ExceptLogging('csEasyError: '+Inttostr(ErrorCode) +' '+E.Message);
     end;
  End;
end;

//{$IFDEF JSON_NEW}

  function TEasyOnHomeInfo.fSendDataToMiddleware( sIP: string; nPort: Integer; sJson: string ): Integer;
  var
    nLength : Integer;
    sPacket ,
    sTemp   : string;
  begin
    Result := 0;
    try
      if is_Ping( sIP ) = True then
      begin
        if csEasy.Socket.Connected = True then
        begin
          //--sendstr := UTF8Encode(sourceJSON.ToString);
          sPacket := sJson;
          sTemp   := sJson;

          nLength := Length(sTemp) * SizeOf(AnsiChar);
          sTemp   := Format( '[HomeInfo] %s [Len:%d]', [ sTemp, nLength] );
          Assert( false, '[HomeInfo]'+sTemp );

          Result := csEasy.Socket.SendText( sPacket );
        end
        else
        begin
          sTemp := Format( '[HomeInfo] TCP/IP(%s,%d) 서버가 연결되지 않았습니다.', [sIP, nPort] );
          Assert( False, sTemp );
        end;
      end;
    except
      on  E : exception  do
      begin
        Result := -1;
        Assert( False, '[HomeInfo]'+E.Message );
      end;
    end;
  end;

  function TEasyOnHomeInfo.fJsonToSendToMiddleware( buf: ST_VISIT_FAVO_REG_G ): string;
  var
    nTemp    : Integer;
    s_status ,
    s_message,
    sTemp    : string;

    root_Obj : ISuperObject;
    Sub1_Obj : ISuperObject;
  begin
    s_status  := buf.res.s_status  ;
    s_message := buf.res.s_message ;
    try
      try
        root_Obj := TSuperObject.Create;
        Sub1_Obj := TSuperObject.Create;

        root_Obj.S[ 'command' ] := buf.req.s_command;

        Sub1_Obj.S[ 'status'  ] := s_status  ;
        Sub1_Obj.S[ 'message' ] := s_message ;

        root_Obj.O[ 'result'  ] := Sub1_Obj  ;
      except
        on E: Exception do
        begin
          Assert( False, '[HomeInfo]'+E.Message );
        end;
      end;
    finally
      Result := root_Obj.AsJSON;
    end;
  end;

  function TEasyOnHomeInfo.fJsonToSendToMiddleware( buf: ST_VISIT_DEL_G  ): string;
  var
    nTemp    : Integer;
    s_status ,
    s_message,
    sTemp    : string;

    root_Obj : ISuperObject;
    Sub1_Obj : ISuperObject;
  begin
    s_status  := buf.res.s_status  ;
    s_message := buf.res.s_message ;
    try
      try
        root_Obj := TSuperObject.Create;
        Sub1_Obj := TSuperObject.Create;

        root_Obj.S[ 'command' ] := buf.req.s_command;

        Sub1_Obj.S[ 'status'  ] := s_status  ;
        Sub1_Obj.S[ 'message' ] := s_message ;

        root_Obj.O[ 'result'  ] := Sub1_Obj  ;
      except
        on E: Exception do
        begin
          Assert( False, '[HomeInfo]'+E.Message );
        end;
      end;
    finally
      Result := root_Obj.AsJSON;
    end;
  end;

  function TEasyOnHomeInfo.fJsonToSendToMiddleware( buf: ST_VISIT_REG_G  ): string;
  var
    nTemp    : Integer;
    s_status ,
    s_message,
    sTemp    : string;

    root_Obj : ISuperObject;
    Sub1_Obj : ISuperObject;
    Sub2_Obj : ISuperObject;
  begin
    s_status  := buf.res.s_status  ;
    s_message := buf.res.s_message ;
    try
      try
        root_Obj := TSuperObject.Create;
        Sub1_Obj := TSuperObject.Create;
        Sub2_Obj := TSuperObject.Create;

        root_Obj.S[ 'command' ] := buf.req.s_command;

        Sub2_Obj.S[ 'reg_no'  ] := buf.res.s_reg_no;
        root_Obj.O[ 'data'    ] := Sub2_Obj  ;

        Sub1_Obj.S[ 'status'  ] := s_status  ;
        Sub1_Obj.S[ 'message' ] := s_message ;

        root_Obj.O[ 'result'  ] := Sub1_Obj  ;
      except
        on E: Exception do
        begin
          Assert( False, '[HomeInfo]'+E.Message );
        end;
      end;
    finally
      Result := root_Obj.AsJSON;
    end;
  end;

  function TEasyOnHomeInfo.fJsonToSendToMiddleware( buf: ST_CAR_ALIAS_MODIFY_G ): string;
  var
    nTemp    : Integer;
    s_status ,
    s_message,
    sTemp    : string;

    root_Obj : ISuperObject;
    Sub1_Obj : ISuperObject;
  begin
    s_status  := buf.res.s_status  ;
    s_message := buf.res.s_message ;
    try
      try
        root_Obj := TSuperObject.Create;
        Sub1_Obj := TSuperObject.Create;

        root_Obj.S[ 'command' ] := buf.req.s_command;

        Sub1_Obj.S[ 'status'  ] := s_status  ;
        Sub1_Obj.S[ 'message' ] := s_message ;

        root_Obj.O[ 'result'  ] := Sub1_Obj  ;
      except
        on E: Exception do
        begin
          Assert( False, '[HomeInfo]'+E.Message );
        end;
      end;
    finally
      Result := root_Obj.AsJSON;
    end;
  end;

  function TEasyOnHomeInfo.fJsonToSendToMiddleware( buf: ST_VISIT_FAVO_DEL_G  ): string;
  var
    nTemp    : Integer;
    s_status ,
    s_message,
    sTemp    : string;

    root_Obj : ISuperObject;
    Sub1_Obj : ISuperObject;
  begin
    s_status  := buf.res.s_status  ;
    s_message := buf.res.s_message ;
    try
      try
        root_Obj := TSuperObject.Create;
        Sub1_Obj := TSuperObject.Create;

        root_Obj.S[ 'command' ] := buf.req.s_command;

        Sub1_Obj.S[ 'status'  ] := s_status  ;
        Sub1_Obj.S[ 'message' ] := s_message ;

        root_Obj.O[ 'result'  ] := Sub1_Obj  ;
      except
        on E: Exception do
        begin
          Assert( False, '[HomeInfo]'+E.Message );
        end;
      end;
    finally
      Result := root_Obj.AsJSON;
    end;
  end;

  function TEasyOnHomeInfo.fJsonToSendToMiddleware( buf: ST_FIND_CAR_G ): string;
  var
    I,
    nTemp : Integer;
    s_status,
    s_message,
    sTemp : string;

    root_Obj : ISuperObject;
    Sub1_Obj : ISuperObject;
    Sub2_Obj : ISuperObject;
  begin

    s_status  := buf.res.s_status  ;
    s_message := buf.res.s_message ;

    try
      try
        root_Obj := TSuperObject.Create;
        Sub1_Obj := TSuperObject.Create;
        Sub2_Obj := TSuperObject.Create;

        root_Obj.S[ 'command' ] := buf.req.s_command;

        if( buf.res.a_list.n_run_count = 0 )then
        begin
          Sub1_Obj.A[ 'list' ] := SA();
        end
        else
        begin
          for I := 0 to buf.res.a_list.n_run_count-1 do
          begin
            Sub1_Obj.A[ 'list' ].O[I].S[ 'car_number' ] := buf.res.a_list.LIST[ I ].s_car_number ;
            Sub1_Obj.A[ 'list' ].O[I].S[ 'date'       ] := buf.res.a_list.LIST[ I ].s_date       ;
            Sub1_Obj.A[ 'list' ].O[I].S[ 'alias'      ] := buf.res.a_list.LIST[ I ].s_alias      ;
          end;
        end;
        root_Obj.O[ 'data' ] := Sub1_Obj;

      except
        on E: Exception do
        begin
          Assert( False, '[HomeInfo]'+E.Message );

          I := 0;
          s_status  := '204';
          s_message := 'Error occurred to create json';
        end;
      end;

    finally
      Sub2_Obj.S[ 'status'  ] := s_status  ;
      Sub2_Obj.S[ 'message' ] := s_message ;

      root_Obj.O[ 'result'  ] := Sub2_Obj  ;

      Result := root_Obj.AsJSON;
    end;

  end;

  function TEasyOnHomeInfo.fJsonToSendToMiddleware( buf: ST_ALIAS_SINGLE_G ): string;
  var
    I,
    nTemp : Integer;
    s_status,
    s_message,
    sTemp : string;

    root_Obj : ISuperObject;
    Sub1_Obj : ISuperObject;
    Sub2_Obj : ISuperObject;
  begin

    s_status  := buf.res.s_status  ;
    s_message := buf.res.s_message ;

    try
      try
        root_Obj := TSuperObject.Create;
        Sub1_Obj := TSuperObject.Create;
        Sub2_Obj := TSuperObject.Create;

        root_Obj.S[ 'command' ] := buf.req.s_command;

        if( buf.res.a_list.n_run_count = 0 )then
        begin
          Sub1_Obj.A[ 'list' ] := SA();
        end
        else
        begin
          for I := 0 to buf.res.a_list.n_run_count-1 do
          begin
            Sub1_Obj.A[ 'list' ].O[I].S[ 'car_number' ] := buf.res.a_list.LIST[ I ].s_car_number ;
            Sub1_Obj.A[ 'list' ].O[I].S[ 'alias'      ] := buf.res.a_list.LIST[ I ].s_alias      ;
          end;
        end;
        root_Obj.O[ 'data' ] := Sub1_Obj;

      except
        on E: Exception do
        begin
          Assert( False, '[HomeInfo]'+E.Message );

          I := 0;
          s_status  := '204';
          s_message := 'Error occurred to create json';
        end;
      end;

    finally
      Sub2_Obj.S[ 'status'  ] := s_status  ;
      Sub2_Obj.S[ 'message' ] := s_message ;

      root_Obj.O[ 'result'  ] := Sub2_Obj  ;

      Result := root_Obj.AsJSON;
    end;

  end;

  function TEasyOnHomeInfo.fJsonToSendToMiddleware( buf: ST_VISIT_FAVO_LIST_G ): string;
  var
    I,
    nTemp : Integer;
    s_status,
    s_message,
    sTemp : string;

    root_Obj : ISuperObject;
    Sub1_Obj : ISuperObject;
    Sub2_Obj : ISuperObject;
  begin

    s_status  := buf.res.s_status  ;
    s_message := buf.res.s_message ;

    try
      try
        root_Obj := TSuperObject.Create;
        Sub1_Obj := TSuperObject.Create;
        Sub2_Obj := TSuperObject.Create;

        root_Obj.S[ 'command' ] := buf.req.s_command;

        if( buf.res.a_list.n_run_count = 0 )then
        begin
          Sub1_Obj.A[ 'list' ] := SA();
        end
        else
        begin
          for I := 0 to buf.res.a_list.n_run_count-1 do
          begin

          //Sub1_Obj.A[ 'list' ].O[I].S[ 'dong'       ] := buf.res.a_list.LIST[ I ].s_dong       ;
          //Sub1_Obj.A[ 'list' ].O[I].S[ 'ho'         ] := buf.res.a_list.LIST[ I ].s_ho         ;

            Sub1_Obj.A[ 'list' ].O[I].S[ 'reg_no'     ] := buf.res.a_list.LIST[ I ].s_reg_no     ;
            Sub1_Obj.A[ 'list' ].O[I].S[ 'car_number' ] := buf.res.a_list.LIST[ I ].s_car_number ;
            Sub1_Obj.A[ 'list' ].O[I].S[ 'date_time'  ] := buf.res.a_list.LIST[ I ].s_date_time  ;
            Sub1_Obj.A[ 'list' ].O[I].S[ 'register'   ] := buf.res.a_list.LIST[ I ].s_register   ;
          end;
        end;
        root_Obj.O[ 'data' ] := Sub1_Obj;

      except
        on E: Exception do
        begin
          Assert( False, '[HomeInfo]'+E.Message );

          I := 0;
          s_status  := '204';
          s_message := 'Error occurred to create json';
        end;
      end;

    finally
      Sub2_Obj.S[ 'status'  ] := s_status  ;
      Sub2_Obj.S[ 'message' ] := s_message ;

      root_Obj.O[ 'result'  ] := Sub2_Obj  ;

      Result := root_Obj.AsJSON;
    end;

  end;

  function TEasyOnHomeInfo.fJsonToSendToMiddleware( buf: ST_VISIT_LIST_G ): string;
  var
    I,
    nDiv,
    nMod,
    nBase,
    nRemain,
    nRedundancy,
    nJsonType,
    nTemp : Integer;
    s_status,
    s_message,
    sTemp : string;
    cal   : ST_CAL_TEMP;

    root_Obj : ISuperObject;
    Sub1_Obj : ISuperObject;
    Sub2_Obj : ISuperObject;
    Sub3_Obj : ISuperObject;
    arry_Obj : ISuperArray;
  begin

    nDiv    := 0;
    nMod    := 0;

    nBase   := 0;
    nRemain := 0;

    nJsonType := -1; // Json 생성 타입..

    FillChar( cal, SizeOf(ST_CAL_TEMP), #0 );

    s_status  := buf.res.s_status  ;
    s_message := buf.res.s_message ;

    try
      try
        root_Obj := TSuperObject.Create;
        Sub1_Obj := TSuperObject.Create;
        Sub2_Obj := TSuperObject.Create;
        Sub3_Obj := TSuperObject.Create;

        cal.n_req_page       := StrToIntDef( buf.req.s_page , 0 );
        cal.n_req_count      := StrToIntDef( buf.req.s_count, 0 );
        cal.n_res_list_count :=              buf.res.a_list.n_run_count ;

        if( cal.n_req_count > 0 )then
        begin
          nDiv    := ( cal.n_res_list_count div cal.n_req_count ); // 몫
          nMod    := ( cal.n_res_list_count mod cal.n_req_count ); // 나머지

          nBase   := ((cal.n_req_page-1)*cal.n_req_count);
          nRemain := IfRemainThen( (nDiv - cal.n_req_page), nMod );
        end;

        if( cal.n_req_page = 0 )then
        begin
          // Json 생성-전체(ALL) 요청..
          nJsonType := 0;
        end
        else
        if( nDiv >= cal.n_req_page )then
        begin
          // Json 생성 타입Ddata(o)..
          nJsonType := 1;
        end
        else
        if( nDiv < cal.n_req_page )then
        begin
          if( nMod > 0 )then
          begin
            if( (nDiv+1) = cal.n_req_page )then
            begin
              // Json 생성 타입Ddata(o,마지막.페이지)..
              nJsonType := 2;
            end
            else
            begin
              // Json 생성 타입Ddata(x)..
              nJsonType := 3;
            end;
          end
          else
          begin
            // Json 생성 타입[Ddata(x)]..
            nJsonType := 3;
          end;
        end;
      except
        on E: Exception do
        begin
          Assert( False, '[HomeInfo]'+E.Message );

          nJsonType := 4; // Json 생성 타입[error.발생]..
          s_status  := '204';
          s_message := 'Error occurred to create json';
        end;
      end;

      try
        root_Obj.S[ 'command' ] := buf.req.s_command;
        Sub1_Obj.S[ 'page'    ] := IntToStr( cal.n_req_page  );

        case nJsonType of
          0: // Json 생성-전체(ALL) 요청..
          begin
            Sub1_Obj.S[ 'list_count'  ] := IntToStr( buf.res.a_list.n_run_count );
            Sub1_Obj.S[ 'remain_page' ] := '0';

            for I := 0 to buf.res.a_list.n_run_count-1 do
            begin
              Sub1_Obj.A[ 'list' ].O[I].S[ 'dong'        ] := buf.res.a_list.LIST[ I ].s_dong       ;
              Sub1_Obj.A[ 'list' ].O[I].S[ 'ho'          ] := buf.res.a_list.LIST[ I ].s_ho         ;
              Sub1_Obj.A[ 'list' ].O[I].S[ 'reg_no'      ] := buf.res.a_list.LIST[ I ].s_reg_no     ;
              Sub1_Obj.A[ 'list' ].O[I].S[ 'car_number'  ] := buf.res.a_list.LIST[ I ].s_car_number ;
              Sub1_Obj.A[ 'list' ].O[I].S[ 'date'        ] := buf.res.a_list.LIST[ I ].s_date       ;
              Sub1_Obj.A[ 'list' ].O[I].S[ 'term'        ] := buf.res.a_list.LIST[ I ].s_term       ;
              Sub1_Obj.A[ 'list' ].O[I].S[ 'visit_flag'  ] := buf.res.a_list.LIST[ I ].s_visit_flag ;
            end;

            root_Obj.O[ 'data' ] := Sub1_Obj;
          end;
          1: // Json 생성 타입Ddata(o)..
          begin
            Sub1_Obj.S[ 'list_count'  ] := IntToStr( cal.n_req_count );
            Sub1_Obj.S[ 'remain_page' ] := IntToStr( nRemain         );

            for I := 0 to cal.n_req_count-1 do
            begin
              Sub1_Obj.A[ 'list' ].O[I].S[ 'dong'        ] := buf.res.a_list.LIST[ I + nBase ].s_dong       ;
              Sub1_Obj.A[ 'list' ].O[I].S[ 'ho'          ] := buf.res.a_list.LIST[ I + nBase ].s_ho         ;
              Sub1_Obj.A[ 'list' ].O[I].S[ 'reg_no'      ] := buf.res.a_list.LIST[ I + nBase ].s_reg_no     ;
              Sub1_Obj.A[ 'list' ].O[I].S[ 'car_number'  ] := buf.res.a_list.LIST[ I + nBase ].s_car_number ;
              Sub1_Obj.A[ 'list' ].O[I].S[ 'date'        ] := buf.res.a_list.LIST[ I + nBase ].s_date       ;
              Sub1_Obj.A[ 'list' ].O[I].S[ 'term'        ] := buf.res.a_list.LIST[ I + nBase ].s_term       ;
              Sub1_Obj.A[ 'list' ].O[I].S[ 'visit_flag'  ] := buf.res.a_list.LIST[ I + nBase ].s_visit_flag ;
            end;
            root_Obj.O[ 'data' ] := Sub1_Obj;
          end;
          2: // Json 생성 타입Ddata(o,마지막.페이지)..
          begin
            nRedundancy := (cal.n_res_list_count-nBase);

            Sub1_Obj.S[ 'list_count'  ] := IntToStr( nRedundancy );
            Sub1_Obj.S[ 'remain_page' ] := IntToStr( nRemain     );

            for I := 0 to nRedundancy-1 do
            begin
              Sub1_Obj.A[ 'list' ].O[I].S[ 'dong'        ] := buf.res.a_list.LIST[ I + nBase ].s_dong       ;
              Sub1_Obj.A[ 'list' ].O[I].S[ 'ho'          ] := buf.res.a_list.LIST[ I + nBase ].s_ho         ;
              Sub1_Obj.A[ 'list' ].O[I].S[ 'reg_no'      ] := buf.res.a_list.LIST[ I + nBase ].s_reg_no     ;
              Sub1_Obj.A[ 'list' ].O[I].S[ 'car_number'  ] := buf.res.a_list.LIST[ I + nBase ].s_car_number ;
              Sub1_Obj.A[ 'list' ].O[I].S[ 'date'        ] := buf.res.a_list.LIST[ I + nBase ].s_date       ;
              Sub1_Obj.A[ 'list' ].O[I].S[ 'term'        ] := buf.res.a_list.LIST[ I + nBase ].s_term       ;
              Sub1_Obj.A[ 'list' ].O[I].S[ 'visit_flag'  ] := buf.res.a_list.LIST[ I + nBase ].s_visit_flag ;
            end;

            root_Obj.O[ 'data' ] := Sub1_Obj;
          end;
          3,4: // Json 생성 타입Ddata(x), [error.발생]
          begin
            I := 0;

            Sub1_Obj.S[ 'list_count'  ] := '0';
            Sub1_Obj.S[ 'remain_page' ] := '0';
            {
            Sub1_Obj.A[ 'list' ].O[I].S[ 'dong'        ] := '';
            Sub1_Obj.A[ 'list' ].O[I].S[ 'ho'          ] := '';
            Sub1_Obj.A[ 'list' ].O[I].S[ 'reg_no'      ] := '';
            Sub1_Obj.A[ 'list' ].O[I].S[ 'car_number'  ] := '';
            Sub1_Obj.A[ 'list' ].O[I].S[ 'date'        ] := '';
            Sub1_Obj.A[ 'list' ].O[I].S[ 'term'        ] := '';
            Sub1_Obj.A[ 'list' ].O[I].S[ 'visit_flag'  ] := '';
            }
            Sub1_Obj.A[ 'list' ] := SA();
            root_Obj.O[ 'data' ] := Sub1_Obj;
          end;
        end;

      except
        on E: Exception do
        begin
          Assert( False, '[HomeInfo]'+E.Message );

          I := 0;

          Sub1_Obj.S[ 'list_count'  ] := '0';
          Sub1_Obj.S[ 'remain_page' ] := '0';
          {
          Sub1_Obj.A[ 'list' ].O[I].S[ 'dong'        ] := '';
          Sub1_Obj.A[ 'list' ].O[I].S[ 'ho'          ] := '';
          Sub1_Obj.A[ 'list' ].O[I].S[ 'reg_no'      ] := '';
          Sub1_Obj.A[ 'list' ].O[I].S[ 'car_number'  ] := '';
          Sub1_Obj.A[ 'list' ].O[I].S[ 'date'        ] := '';
          Sub1_Obj.A[ 'list' ].O[I].S[ 'term'        ] := '';
          Sub1_Obj.A[ 'list' ].O[I].S[ 'visit_flag'  ] := '';
          }
          Sub1_Obj.A[ 'list' ] := SA();
          root_Obj.O[ 'data' ] := Sub1_Obj;

          s_status  := '204';
          s_message := 'Error occurred to create json';
        end;
      end;

    finally
      Sub3_Obj.S[ 'status'  ] := s_status  ;
      Sub3_Obj.S[ 'message' ] := s_message ;
      root_Obj.O[ 'result'  ] := Sub3_Obj  ;

      Result := root_Obj.AsJSON;
    end;

  end;

  function TEasyOnHomeInfo.fJsonToSendToMiddleware( buf: ST_IN_LIST_G ): string;
  var
    I,
    nDiv,
    nMod,
    nBase,
    nRemain,
    nRedundancy,
    nJsonType,
    nTemp : Integer;
    s_status,
    s_message,
    sTemp : string;
    cal   : ST_CAL_TEMP;

    root_Obj : ISuperObject;
    Sub1_Obj : ISuperObject;
    Sub2_Obj : ISuperObject;
    Sub3_Obj : ISuperObject;
    arry_Obj : ISuperArray;
  begin

    nDiv    := 0;
    nMod    := 0;

    nBase   := 0;
    nRemain := 0;

    nJsonType := -1; // Json 생성 타입..

    FillChar( cal, SizeOf(ST_CAL_TEMP), #0 );

    s_status  := buf.res.s_status  ;
    s_message := buf.res.s_message ;

    try
      try
        root_Obj := TSuperObject.Create;
        Sub1_Obj := TSuperObject.Create;
        Sub2_Obj := TSuperObject.Create;
        Sub3_Obj := TSuperObject.Create;

        cal.n_req_page       := StrToIntDef( buf.req.s_page , 0 );
        cal.n_req_count      := StrToIntDef( buf.req.s_count, 0 );
        cal.n_res_list_count :=              buf.res.a_list.n_run_count ;

        if( cal.n_req_count > 0 )then
        begin
          nDiv    := ( cal.n_res_list_count div cal.n_req_count ); // 몫
          nMod    := ( cal.n_res_list_count mod cal.n_req_count ); // 나머지

          nBase   := ((cal.n_req_page-1)*cal.n_req_count);
          nRemain := IfRemainThen( (nDiv - cal.n_req_page), nMod );
        end;

        if( cal.n_req_page = 0 )then
        begin
          // Json 생성-전체(ALL) 요청..
          nJsonType := 0;
        end
        else
        if( nDiv >= cal.n_req_page )then
        begin
          // Json 생성 타입Ddata(o)..
          nJsonType := 1;
        end
        else
        if( nDiv < cal.n_req_page )then
        begin
          if( nMod > 0 )then
          begin
            if( (nDiv+1) = cal.n_req_page )then
            begin
              // Json 생성 타입Ddata(o,마지막.페이지)..
              nJsonType := 2;
            end
            else
            begin
              // Json 생성 타입Ddata(x)..
              nJsonType := 3;
            end;
          end
          else
          begin
            // Json 생성 타입[Ddata(x)]..
            nJsonType := 3;
          end;
        end;
      except
        on E: Exception do
        begin
          Assert( False, '[HomeInfo]'+E.Message );

          nJsonType := 4; // Json 생성 타입[error.발생]..
          s_status  := '204';
          s_message := 'Error occurred to create json';
        end;
      end;

      try
        root_Obj.S[ 'command' ] := buf.req.s_command;
        Sub1_Obj.S[ 'page'    ] := IntToStr( cal.n_req_page  );

        case nJsonType of
          0: // Json 생성-전체(ALL) 요청..
          begin
            Sub1_Obj.S[ 'list_count'  ] := IntToStr( buf.res.a_list.n_run_count );
            Sub1_Obj.S[ 'remain_page' ] := '0';

            for I := 0 to buf.res.a_list.n_run_count-1 do
            begin
              Sub1_Obj.A[ 'list' ].O[I].S[ 'car_number' ] := buf.res.a_list.LIST[ I ].s_car_number ;
              Sub1_Obj.A[ 'list' ].O[I].S[ 'type'       ] := buf.res.a_list.LIST[ I ].s_type       ;
              Sub1_Obj.A[ 'list' ].O[I].S[ 'date_time'  ] := buf.res.a_list.LIST[ I ].s_date_time  ;
            end;
            root_Obj.O[ 'data' ] := Sub1_Obj;
          end;
          1: // Json 생성 타입Ddata(o)..
          begin
            Sub1_Obj.S[ 'list_count'  ] := IntToStr( cal.n_req_count );
            Sub1_Obj.S[ 'remain_page' ] := IntToStr( nRemain         );

            for I := 0 to cal.n_req_count-1 do
            begin
              Sub1_Obj.A[ 'list' ].O[I].S[ 'car_number' ] := buf.res.a_list.LIST[ I + nBase ].s_car_number ;
              Sub1_Obj.A[ 'list' ].O[I].S[ 'type'       ] := buf.res.a_list.LIST[ I + nBase ].s_type       ;
              Sub1_Obj.A[ 'list' ].O[I].S[ 'date_time'  ] := buf.res.a_list.LIST[ I + nBase ].s_date_time  ;
            end;
            root_Obj.O[ 'data' ] := Sub1_Obj;
          end;
          2: // Json 생성 타입Ddata(o,마지막.페이지)..
          begin
            nRedundancy := (cal.n_res_list_count-nBase);

            Sub1_Obj.S[ 'list_count'  ] := IntToStr( nRedundancy );
            Sub1_Obj.S[ 'remain_page' ] := IntToStr( nRemain     );

            for I := 0 to nRedundancy-1 do
            begin
              Sub1_Obj.A[ 'list' ].O[I].S[ 'car_number' ] := buf.res.a_list.LIST[ I + nBase ].s_car_number ;
              Sub1_Obj.A[ 'list' ].O[I].S[ 'type'       ] := buf.res.a_list.LIST[ I + nBase ].s_type       ;
              Sub1_Obj.A[ 'list' ].O[I].S[ 'date_time'  ] := buf.res.a_list.LIST[ I + nBase ].s_date_time  ;
            end;

            root_Obj.O[ 'data' ] := Sub1_Obj;
          end;
          3,4: // Json 생성 타입Ddata(x), [error.발생]
          begin
            Sub1_Obj.S[ 'list_count'  ] := '0';
            Sub1_Obj.S[ 'remain_page' ] := '0';
            {
            Sub1_Obj.A[ 'list' ].O[I].S[ 'car_number' ] := '' ;
            Sub1_Obj.A[ 'list' ].O[I].S[ 'type'       ] := '' ;
            Sub1_Obj.A[ 'list' ].O[I].S[ 'date_time'  ] := '' ;
            }
            Sub1_Obj.A[ 'list' ] := SA();
            root_Obj.O[ 'data' ] := Sub1_Obj;
          end;
        end;

      except
        on E: Exception do
        begin
          Assert( False, '[HomeInfo]'+E.Message );

          Sub1_Obj.S[ 'list_count'  ] := '0';
          Sub1_Obj.S[ 'remain_page' ] := '0';
          {
          Sub1_Obj.A[ 'list' ].O[I].S[ 'car_number' ] := '' ;
          Sub1_Obj.A[ 'list' ].O[I].S[ 'type'       ] := '' ;
          Sub1_Obj.A[ 'list' ].O[I].S[ 'date_time'  ] := '' ;
          }
          Sub1_Obj.A[ 'list' ] := SA();
          root_Obj.O[ 'data' ] := Sub1_Obj;

          s_status  := '204';
          s_message := 'Error occurred to create json';
        end;
      end;

    finally
      Sub3_Obj.S[ 'status'  ] := s_status  ;
      Sub3_Obj.S[ 'message' ] := s_message ;
      root_Obj.O[ 'result'  ] := Sub3_Obj  ;

      Result := root_Obj.AsJSON;
    end;

  end;

  function TEasyOnHomeInfo.fParsingJsonOfMiddleware( s_command: string; var st_mid_json: ST_MIDDLEWARE_JSON; AJson: ISuperObject ): Boolean;
  var
    nTotalCount ,
    I           : Integer;
    sTemp       : string;
    ASubObject  : ISuperObject;
    ASubObject2 : ISuperObject;
    ASubArray   : ISuperArray;
  begin
    Result := False;

    try
      if( s_command = 'alert_incar'  )then // 입차.통보.응답(o)
      begin
        ASubObject := AJson.O[ 'result' ]; // 응답 from middleware..

        st_mid_json.p_in.res.s_status  := ASubObject.S[ 'status'  ];
        st_mid_json.p_in.res.s_message := ASubObject.S[ 'message' ];

        Result := True;
      end
      else
      if( s_command = 'alert_outcar' )then // 출차.통보.응답(o)
      begin
        ASubObject := AJson.O[ 'result' ]; // 응답 from middleware..

        st_mid_json.p_out.res.s_status  := ASubObject.S[ 'status'  ];
        st_mid_json.p_out.res.s_message := ASubObject.S[ 'message' ];

        Result := True;
      end
      else
      if( s_command = 'incar_list'   )then // 입차리스트.요청(o).응답
      begin
        ASubObject := AJson.O[ 'data' ];   // 요청 from middleware..

        st_mid_json.p_in_list.req.s_command := 'incar_list';
        st_mid_json.p_in_list.req.s_dong    := ASubObject.S[ 'dong'  ];
        st_mid_json.p_in_list.req.s_ho      := ASubObject.S[ 'ho'    ];
        st_mid_json.p_in_list.req.s_type    := ASubObject.S[ 'type'  ];
        st_mid_json.p_in_list.req.s_page    := ASubObject.S[ 'page'  ];
        st_mid_json.p_in_list.req.s_count   := ASubObject.S[ 'count' ];

        Result := True;
      end
      else
      if( s_command = 'visit_list'   )then // 방문차량리스트.요청(o).응답
      begin
        Assert( False, '[HomeInfo] Parsing >> visit_list' );

        ASubObject := AJson.O[ 'data' ];   // 요청 from middleware..

        st_mid_json.p_visit_list.req.s_command := 'visit_list';
        st_mid_json.p_visit_list.req.s_dong    := ASubObject.S[ 'dong'  ];
        st_mid_json.p_visit_list.req.s_ho      := ASubObject.S[ 'ho'    ];
        st_mid_json.p_visit_list.req.s_page    := ASubObject.S[ 'page'  ];
        st_mid_json.p_visit_list.req.s_count   := ASubObject.S[ 'count' ];

        Result := True;
      end
      else
      if( s_command = 'visit_reg'    )then // 방문차량.등록.요청(o).응답
      begin
        ASubObject := AJson.O[ 'data' ];   // 요청 from middleware..

        st_mid_json.p_visit_reg.req.s_command    := 'visit_reg';
        st_mid_json.p_visit_reg.req.s_dong       := ASubObject.S[ 'dong'       ];
        st_mid_json.p_visit_reg.req.s_ho         := ASubObject.S[ 'ho'         ];
        st_mid_json.p_visit_reg.req.s_car_number := ASubObject.S[ 'car_number' ];
        st_mid_json.p_visit_reg.req.s_date       := ASubObject.S[ 'date'       ];
        st_mid_json.p_visit_reg.req.s_term       := ASubObject.S[ 'term'       ];

        Result := True;
      end
      else
      if( s_command = 'visit_del'    )then // 방문차량.삭제.요청(o).응답
      begin
        ASubObject := AJson.O[ 'data' ];   // 요청 from middleware..

        st_mid_json.p_visit_del.req.s_command    := 'visit_del';
        st_mid_json.p_visit_del.req.s_dong       := ASubObject.S[ 'dong'       ];
        st_mid_json.p_visit_del.req.s_ho         := ASubObject.S[ 'ho'         ];
        st_mid_json.p_visit_del.req.s_reg_no     := ASubObject.S[ 'reg_no'     ];
        st_mid_json.p_visit_del.req.s_car_number := ASubObject.S[ 'car_number' ];

        Result := True;
      end
      else
      if( s_command = 'visit_favo_reg' )then // 방문차량 즐겨찾기.등록.요청(o).응답
      begin
        ASubObject := AJson.O[ 'data' ];     // 요청 from middleware..

        st_mid_json.p_visit_favo_reg.req.s_command    := 'visit_favo_reg';
        st_mid_json.p_visit_favo_reg.req.s_dong       := ASubObject.S[ 'dong'       ];
        st_mid_json.p_visit_favo_reg.req.s_ho         := ASubObject.S[ 'ho'         ];
        st_mid_json.p_visit_favo_reg.req.s_car_number := ASubObject.S[ 'car_number' ];
        st_mid_json.p_visit_favo_reg.req.s_register   := ASubObject.S[ 'register'   ];

        Result := True;
      end
      else
      if( s_command = 'visit_favo_list' )then // 방문차량 즐겨찾기.리스트.요청(o).응답
      begin
        ASubObject := AJson.O[ 'data' ];      // 요청 from middleware..

        st_mid_json.p_visit_favo_list.req.s_command := 'visit_favo_list';
        st_mid_json.p_visit_favo_list.req.s_dong    := ASubObject.S[ 'dong' ];
        st_mid_json.p_visit_favo_list.req.s_ho      := ASubObject.S[ 'ho'   ];

        Result := True;
      end
      else
      if( s_command = 'visit_favo_del' )then // 방문차량 즐겨찾기.삭제.요청(o).응답
      begin
        ASubObject := AJson.O[ 'data' ];     // 요청 from middleware..

        st_mid_json.p_visit_favo_del.req.s_command    := 'visit_favo_del';
        st_mid_json.p_visit_favo_del.req.s_dong       := ASubObject.S[ 'dong'       ];
        st_mid_json.p_visit_favo_del.req.s_ho         := ASubObject.S[ 'ho'         ];
        st_mid_json.p_visit_favo_del.req.s_reg_no     := ASubObject.S[ 'reg_no'     ];
        st_mid_json.p_visit_favo_del.req.s_car_number := ASubObject.S[ 'car_number' ];

        Result := True;
      end
      else
      if( s_command = 'alias_single'   )then // Alias 가져오기.요청(o).응답
      begin
        ASubObject := AJson.O[ 'data' ];     // 요청 from middleware..
        ASubArray  := ASubObject.A[ 'list' ];

        st_mid_json.p_alias_single.req.s_command := 'alias_single';

        nTotalCount := ASubArray.Length;

        SetLength( st_mid_json.p_alias_single.req.a_list.LIST,
                   nTotalCount  );

        st_mid_json.p_alias_single.req.a_list.n_count := nTotalCount;

        for I := 0 to ASubArray.Length-1 do
        begin
          ASubObject2 := ASubArray.O[I];

          st_mid_json.p_alias_single.req.a_list.LIST[I].s_car_number :=  ASubObject2.S[ 'car_number' ];
          Inc( st_mid_json.p_alias_single.req.a_list.n_run_count );

        end;
        Result := True;
      end
      else
      //if( s_command = 'car_alias_modify'   )then // Alias 변경.요청(o).응답
      if( s_command = 'modify_alias'   )then // Alias 변경.요청(o).응답
      begin
        ASubObject := AJson.O[ 'data' ];         // 요청 from middleware..

        st_mid_json.p_car_alias_modify.req.s_command    := 'modify_alias'          ;
        st_mid_json.p_car_alias_modify.req.s_dong       := ASubObject.S[ 'dong'       ];
        st_mid_json.p_car_alias_modify.req.s_ho         := ASubObject.S[ 'ho'         ];
        st_mid_json.p_car_alias_modify.req.s_car_number := ASubObject.S[ 'car_number' ];
        st_mid_json.p_car_alias_modify.req.s_alias      := ASubObject.S[ 'alias'      ];

        Result := True;
      end
      else
      if( s_command = 'find_car'   )then // Alias 변경.요청(o).응답
      begin
        ASubObject := AJson.O[ 'data' ]; // 요청 from middleware..

        st_mid_json.p_find_car.req.s_command    := 'find_car'          ;
        st_mid_json.p_find_car.req.s_dong       := ASubObject.S[ 'dong'       ];
        st_mid_json.p_find_car.req.s_ho         := ASubObject.S[ 'ho'         ];

        Result := True;
      end
      ;
    except
      on E: Exception do
      begin
        Assert( False, '[HomeInfo]'+E.Message );
      end;
    end;
  end;

  //{$ENDIF}

procedure TEasyOnHomeInfo.Init_json_buffer();
begin
  // init buffer..
  SetLength( g_mid_json.p_alias_single    .req.a_list.LIST, 0 );
  SetLength( g_mid_json.p_alias_single    .res.a_list.LIST, 0 );
  SetLength( g_mid_json.p_in_list         .res.a_list.LIST, 0 );
  SetLength( g_mid_json.p_find_car        .res.a_list.LIST, 0 );
  SetLength( g_mid_json.p_visit_favo_list .res.a_list.LIST, 0 );
  SetLength( g_mid_json.p_visit_list      .res.a_list.LIST, 0 );

  FillChar( g_mid_json, SizeOf(ST_MIDDLEWARE_JSON), #0  );
end;

//-------------------------------------------------------
// 미들웨어 연동
//-------------------------------------------------------
procedure TEasyOnHomeInfo.csEasyRead(Sender: TObject; Socket: TCustomWinSocket);
var
  nTemp        : Integer;
  s_command    ,
  sTemp        : string;
  ASuperObject : ISuperObject;
begin

  sTemp := TClientSocket(Sender).Socket.ReceiveText;
  ASuperObject := TSuperObject.Create( sTemp );

  Assert( False, '[HomeInfo]'         +
                 '미들웨어 서버수신:' +
                 sTemp                  );

  Init_json_buffer();

  g_mid_json.s_command   := ASuperObject.S[ 'command' ];

  Assert( False, '[HomeInfo] {TCP/IP Prs.command}: '+g_mid_json.s_command );

  if( ( g_mid_json.s_command = 'alert_incar'  ) and
      ( g_mid_json.s_command = 'alert_outcar' )    )then
  begin
    // {2}: Res from middle-ware ..
    g_mid_json.n_comm_type := 2;
  end
  else
  begin
    // {1}: Req(Report) from middle-ware ..
    g_mid_json.n_comm_type := 1;
  end;

  // parsing json-packet from middle ware server..
  fParsingJsonOfMiddleware( g_mid_json.s_command ,
                            g_mid_json ,
                            ASuperObject  );

  try
    sTemp     := '';
    s_command := g_mid_json.s_command;

    //#################################################################
    if( s_command = 'alert_incar'  )then // 입차.통보.응답(o)
    begin
      if( g_mid_json.p_in.res.s_status = '-1' )then
      begin
        sTemp := Format( '[HomeInfo] 입차 통보 실패 :%s (%s)',[ g_mid_json.p_in.res.s_status ,
                                                                g_mid_json.p_in.res.s_message  ]);
      end
      else
      begin
        sTemp := Format( '[HomeInfo] 입차 통보 :%s (%s)',[ g_mid_json.p_in.res.s_status ,
                                                           g_mid_json.p_in.res.s_message  ]);
      end;
      // log 작성..
      Assert( False, '[HomeInfo]'+sTemp);
    end
    else
    //#################################################################
    if( s_command = 'alert_outcar' )then // 출차.통보.응답(o)
    begin
      if( g_mid_json.p_in.res.s_status = '-1' )then
      begin
        sTemp := Format( '[HomeInfo] 출차 통보 실패 :%s (%s)',[ g_mid_json.p_out.res.s_status ,
                                                                g_mid_json.p_out.res.s_message  ]);
      end
      else
      begin
        sTemp := Format( '[HomeInfo] 출차 통보 :%s (%s)',[ g_mid_json.p_out.res.s_status ,
                                                           g_mid_json.p_out.res.s_message  ]);
      end;
      // log 작성..
      Assert( False, '[HomeInfo]'+sTemp);
    end
    else
    //#################################################################
    if( s_command = 'visit_reg'    )then // 방문차량.등록.요청(o).응답
    begin
      // insert visit-car to db..
      //g_mid_json.p_visit_reg.res := dmTables.fInsert_the_on_visitinfo( g_mid_json.p_visit_reg.req );

      // make json to send..
      sTemp := fJsonToSendToMiddleware( g_mid_json.p_visit_reg ); //ST_VISIT_REG_G

      if( sTemp <> '' )then
      begin
        fSendDataToMiddleware( sHomeInfo_IP   ,
                               nHomeInfo_Port ,
                               sTemp             );
      end;
    end;
  except
    on E: Exception do
    begin
      Assert( False, E.Message );
    end;
  end;

end;

//-------------------------------------------------------
// [김태현] 연동 (응답)부분 - 홈넷(코맥스), SI코웰(지진 및 재난)
//-------------------------------------------------------
function TEasyOnHomeInfo.Homeinfo_proc_EasyOn(ip: string; port: Integer; dong, ho, carNum, status, kind: string): string;
var
  sTemp,
  sJSON    : string;
  sendstr  : WideString;
  root_Obj : ISuperObject;
  Sub1_Obj : ISuperObject;
  Sub2_Obj : ISuperObject;
  ASubArray: ISuperArray;
  I : Integer;
begin
  sTemp := Format( '[HomeInfo] >>> Homeinfo_proc_EasyOn(%s,%d,%s,%s,%s,%s)', [ ip,
                                                                               port,
                                                                               dong,
                                                                               ho,
                                                                               carNum,
                                                                               status,
                                                                               kind] );
  Assert( False, sTemp );

  sJSON := '';

  HomeInfo_Proc_EasyOnConn( ip, port );

  root_Obj := TSuperObject.Create;
  Sub1_Obj := TSuperObject.Create;
  Sub2_Obj := TSuperObject.Create;

       if status = '입차'         then root_Obj.S[ 'command' ] := 'alert_incar'  //SourceJSON.AddPair('command', CM3)
  else if status = '출차'         then root_Obj.S[ 'command' ] := 'alert_outcar' //SourceJSON.AddPair('command', CM4)
  else if status = '방문차량등록' then root_Obj.S[ 'command' ] := 'visit_reg'    //SourceJSON.AddPair('command', CM6)
  else if status = '방문차량삭제' then root_Obj.S[ 'command' ] := 'visit_del'    //SourceJSON.AddPair('command', CM7)
  else if status = '입차리스트'   then root_Obj.S[ 'command' ] := 'incar_list'   //SourceJSON.AddPair('command', CM8)
  else if status = '방문리스트'   then root_Obj.S[ 'command' ] := 'visit_list'   //SourceJSON.AddPair('command', CM9);
  else if status = '세대포인트'   then root_Obj.S[ 'command' ] := 'sync_assign';


//  if( (status = '입차') or
//      (status = '출차')    )then
//  begin
//    // 미적용 >> old process..
//    // subJson.AddPair('Kind', nsKind);
//    Sub1_Obj.S[ 'dong'       ] := dong   ;   //동
//    Sub1_Obj.S[ 'ho'         ] := ho     ;   //호
//    Sub1_Obj.S[ 'car_number' ] := carNum ;   //차량번호
//    Sub1_Obj.S[ 'date_time'  ] := FormatDateTime( 'yyyymmddhhnnss', now );   //입차 시간
//    Sub1_Obj.S[ 'kind'       ] := kind   ;   //a:세대원, v:방문객, n:일반차량
//    Sub1_Obj.S[ 'lprid'    ]   := IntToStr(nsUnitNo); //Lpr 식별 번호
//    Sub1_Obj.S[ 'car_image'  ] := nsLprFile1;  //차량 이미지 경로
//    Sub1_Obj.S[ 'reg_no'     ] := nsCardNo;  //차량 식별키 TKNO
//    if kind = 'v' then     //사전 방문객 차량
//    begin
//      Sub1_Obj.S[ 'visit_in_date_time'     ] := FormatDateTime( 'yyyymmddhhnnss', StrToDateTime(nStartdate2) );     //a:세대원, v:방문객, n:일반차량
//      Sub1_Obj.S[ 'visit_out_date_time'    ] := FormatDateTime( 'yyyymmddhhnnss', StrToDateTime(nEnddate2) );    //방문종료일시, kind가 v 일 경우 외 빈값
//    end
//    else
//    begin
//      Sub1_Obj.S[ 'visit_in_date_time'     ] := '';     //a:세대원, v:방문객, n:일반차량
//      Sub1_Obj.S[ 'visit_out_date_time'    ] := '';    //방문종료일시, kind가 v 일 경우 외 빈값
//    end;
//    root_Obj.O[ 'data'  ] := Sub1_Obj;
//    sJSON := root_Obj.AsJSON;
//    //sJSON := StringReplace(sJSON, '\\', '\', [rfReplaceAll, rfIgnoreCase]);
//    //sJSON := StringReplace(sJSON, '\\\', '\\', [rfReplaceAll, rfIgnoreCase]);
//  end;

  if(status = '세대포인트') then
  begin

    {Sub1_Obj.S[ 'park_no'       ] := IntToStr(nCurrParkNo) ;
    Sub1_Obj.S[ 'dong'          ] := dong ;
    Sub1_Obj.S[ 'ho'            ] := ho   ;
    Sub1_Obj.S[ 'type'          ] := 'MINUTE';
    Sub1_Obj.S[ 'enable_point'  ] := IntToStr(nAvailablePoint) ;
    Sub1_Obj.S[ 'used_point'    ] := IntToStr(nUsedPoint)      ;
    Sub1_Obj.S[ 'acp_date'      ] := FormatDateTime('yyyy-mm-dd',StartOfTheMonth(now));
    Sub1_Obj.S[ 'exp_date'      ] := FormatDateTime('yyyy-mm-dd',EndOfTheMonth(now));}

    Sub1_Obj.A[ 'list' ].O[0].S['park_no']  := IntToStr(nCurrParkNo) ;
    Sub1_Obj.A[ 'list' ].O[0].S['dong'] := dong ;
    Sub1_Obj.A[ 'list' ].O[0].S['ho']   := ho ;
    Sub1_Obj.A[ 'list' ].O[0].S['type'] := 'MINUTE';
    Sub1_Obj.A[ 'list' ].O[0].S['enable_point'] := IntToStr(nAvailablePoint) ;
    Sub1_Obj.A[ 'list' ].O[0].S['used_point']   := IntToStr(nUsedPoint)      ;
    Sub1_Obj.A[ 'list' ].O[0].S['acp_date']     := FormatDateTime('yyyymmdd',StartOfTheMonth(now));
    Sub1_Obj.A[ 'list' ].O[0].S['exp_date']     := FormatDateTime('yyyymmdd',EndOfTheMonth(now));

    root_Obj.O[ 'data'  ] := Sub1_Obj ;
    sJSON := root_Obj.AsJSON;
  end;

  {$IFDEF  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX}
  else if (status = '방문차량등록')   then
  begin
    {
    subJson := TJSONObject.Create;
    subJson.AddPair('reg_no', sTKNo);
    sourceJSON.AddPair('data', subJson);
    subJson := TJSONObject.Create;
    subJson.AddPair('status', message_type2);
    subJson.AddPair('message', message_type);
    sourceJSON.AddPair('result', subJson);
    }
  end
  else if (status = '방문차량삭제')   then
  begin
    {
    subJson := TJSONObject.Create;
    subJson.AddPair('status', message_type2);
    subJson.AddPair('message', message_type);
    sourceJSON.AddPair('result', subJson);
    }
  end
  else if (status = '입차리스트')   then
  begin
      {
      sSendCarNo := Copy(sSendCarNo, 1, Length(sSendCarNo)-1);
      //sSend_type := Copy(sSend_type, 1, Length(sSend_type)-1);
      date_time := Copy(date_time, 1, Length(date_time)-1);

      subJson := TJSONObject.Create;
      subJson.AddPair('page', IntToStr(nSendPage));         //조회한 page 번호, 요청이 0이면 0
      subJson.AddPair('list_count', IntToStr(list_count));  //조회된 List의 자료 수, 요청한 count 보다 클수 없다.
      subJson.AddPair('remain_page', IntToStr(nremain_page));  //조회된 page 이후 남아 있는 page 수, page가 0이면 0

      subJson2 := TJSONObject.Create;
      subJson2.AddPair('car_number', sSendCarNo);     //"차량번호"
      subJson2.AddPair('type', Json_Type_Value);           // 가족, 방문 (향후 추가될 수 있음)
      subJson2.AddPair('date_time', date_time);       //입차시간
      jsonArr.AddElement(subjson2);
      subJson.AddPair('list', jsonArr);
      SourceJSON.AddPair('data', subJson);

      subJson := TJSONObject.Create;
      subJson.AddPair('status', message_type2);
      subJson.AddPair('message', message_type);
      sourceJSON.AddPair('result', subJson);
      }
  end
  else if (status = '방문리스트')   then
  begin
      {
      sTkNo          := Copy(sTkNo, 1, Length(sTkNo)-1);
      sSendCarNo     := Copy(sSendCarNo, 1, Length(sSendCarNo)-1);
      sStartDateTime := Copy(sStartDateTime, 1, Length(sStartDateTime)-1);
      nsterm         := Copy(nsterm, 1, Length(nsterm)-1);
      svisit_flag    := Copy(svisit_flag, 1, Length(svisit_flag)-1);

      subJson := TJSONObject.Create;
      subJson.AddPair('page'       , Json_page_Value);         //조회한 page 번호, 요청이 0이면 0
      subJson.AddPair('list_count' , IntToStr(list_count));  //조회된 List의 자료 수, 요청한 count 보다 클수 없다.
      subJson.AddPair('remain_page', Json_page_Value);  //조회된 page 이후 남아 있는 page 수, page가 0이면 0

      subJson2 := TJSONObject.Create;

      subJson2.AddPair('reg_no'    , sTkNo       ); // 방문차량식별키
      subJson2.AddPair('car_number', sSendCarNo  ); // "차량번호"
      subJson2.AddPair('date'      , date_time   ); // 등록(방문)일
      subJson2.AddPair('term'      , nsterm      ); // 방문일수
      subJson2.AddPair('visit_flag', svisit_flag ); // y:방문, n:미방문

      jsonArr.AddElement(subjson2);
      subJson.AddPair('list', jsonArr);
      SourceJSON.AddPair('data', subJson);

      subJson := TJSONObject.Create;
      subJson.AddPair('status', message_type2);
      subJson.AddPair('message', message_type);
      sourceJSON.AddPair('result', subJson);
      }
  end;

  {$ENDIF}

  //전송파트
  try
    if( sJSON <> '' )then
    begin
      Assert( False, '[HomeInfo] Send json..' );
      if (Length(sHomeInfo_IP) > 0) and (nHomeInfo_Port > 0) then
      begin

        fSendDataToMiddleware( sHomeInfo_IP   ,
                               nHomeInfo_Port ,
                               sJSON             );
      end
      else
      begin
         fSendDataToMiddleware( sHomeInfo_IP   ,
                               nHomeInfo_Port ,
                               sJSON             );
      end;
    end;

    Assert( False, '[HomeInfo] <<< Homeinfo_proc_EasyOn(..)' );

  except
    on E: Exception do
    begin
      sTemp := Format( '[HomeInfo] %s:%d=%s/%s/%s 전송실패 >> detail-msg: %s', [ ip,
                                                                                 port,
                                                                                 dong,
                                                                                 ho,
                                                                                 carNum,
                                                                                 e.Message ] );
      Assert( False, sTemp );
    end;
  end;
end;

function TEasyOnHomeInfo.HomeInfo_Proc_EasyOnConn( ip: string; port: Integer ): Boolean;
var
  sIpAddr,
  sTemp: string;
  loopIndex : Integer;
begin

  Result  := False;
  sIpAddr := Trim( ip );

  if( csEasy = nil )then
  begin

    try
      if( csEasy = nil )then
      begin
        for loopIndex := 0 to 0 do
        begin
          csEasy := TClientSocket.Create(Application);
          csEasy.OnRead := csEasyRead;

          if( csEasy.Socket.Connected = false )then
          begin
             csEasy.OnConnect := csEasyConnect;
          end;

          csEasy.OnDisconnect := csEasyDisconnect;
          csEasy.OnError      := csEasyError;

          sTemp := '[HomeInfo] 미들웨어 소켓생성 성공!';
          Assert( False, sTemp );

          csEasy.Host := Ip[loopIndex];
          csEasy.Active := True;
        end;

      end;
    except
      sTemp := '[HomeInfo] 미들웨어 소켓생성 실패!';
      Assert( False, sTemp );
      //HomeInfoLogging('이지온 소켓생성 실패!');
    end;

    //접속파트
    try
      g_s_home_net_ip := sIpAddr; //Trim( ip );

      csEasy.Host       := sIpAddr; //Trim(ip);
      csEasy.Port       := port;
      csEasy.ClientType := ctNonBlocking;

       sTemp := Format( '[HomeInfo] Open IP:%s, Port:%d ', [sIpAddr,
                                                            port ]);
       Assert( False, sTemp );

      if( is_Ping( sIpAddr {Trim(ip)} ) = True )then
      begin
        if csEasy.Active = true then
        begin
          Result := True;
        end
        else
        begin
          csEasy.Open;
          Result := True;
        end;
      end;

      if Result = True then
      begin

        recvThd := TThread.CreateAnonymousThread(
            procedure
            var
              i: Integer;
            begin
              while not Application.Terminated do
              begin

                Sleep(1000 * 10); //10초마다

                //Do_check_home_net_connection();

                TThread.Synchronize( nil,
                procedure
                begin
                   if csEasy.Active = False then
                     if is_Ping(ip) then
                    begin
                      csEasy.Open;
                      csEasy.Active := True;
                    end;
                end);

              end;
            end
        );

        recvThd.FreeOnTerminate := True;
        recvThd.Start;

        if( recvThd.Started = True )then
        begin
          sTemp := '[HomeInfo] 홈넷재접속 쓰레드시작';
          Assert( False, sTemp );
          //HomeInfoLogging('홈넷재접속 쓰레드시작');
        end;

      end;
    except
      on E: Exception do
      begin
        sTemp := Format( '[HomeInfo] {%s:%d 연결실패!} %s', [ sIpAddr , //ip,
                                                              port    ,
                                                              E.message ] );
        Assert( false, sTemp );
        //--HomeInfoLogging( sTemp );
      end;
    end;
  end
  else
  begin
    Result := True;
  end;

end;

// procedure Do_check_home_net_connection();
procedure TEasyOnHomeInfo.Do_check_home_net_connection();
begin
  if( csEasy.Active = False )then
  begin
    if( is_Ping( g_s_home_net_ip ) = True )then
    begin
      Assert( false, '[HomeInfo] 홈넷재접속!' );
      //HomeInfoLogging( '[HomeInfo] 홈넷재접속!' );
      csEasy.Open;
    end
    else
    begin
      Assert( false, '[HomeInfo] 홈넷과 Ping 확인않됨, 재접속불가!' );
      //HomeInfoLogging( '[HomeInfo] 홈넷과 Ping 확인않됨, 재접속불가!' );
    end;
  end;
end;

initialization
  //csEasy.Active := False;

end.

