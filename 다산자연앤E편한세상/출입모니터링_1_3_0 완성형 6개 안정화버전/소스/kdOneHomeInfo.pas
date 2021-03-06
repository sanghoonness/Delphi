unit KdoneHomeInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdServerIOHandler,
  IdServerIOHandlerSocket, IdServerIOHandlerStack, IdTCPConnection, IdTCPClient,
  IdBaseComponent, IdComponent, IdCustomTCPServer, IdTCPServer, Vcl.ComCtrls, IdGlobal,
  Vcl.ExtCtrls, CodeSiteLogging, IdContext, Winapi.WinSock;

const
  {$REGION '상수모음'}
	// KdOne Protocal
  cKdOne_DefName                = '경동원';

  // Header 100 Bytes
  cKdOne_Header_MsgStart        = $A0;//$A000; // 2 Bytes
  cKdOne_Header_ProtocolVer     = $01; // 1 Byte
  cKdOne_Header_Flag            = $01; // 1 Byte // 긴급 메시지 // 일반 메시지 : $00
  cKdOne_Header_SrcId_All       = '000000000000001F0700'; // 20 Bytes
  cKdOne_Header_DestId_All      = '000000000000001F0200'; // 20 Bytes
  cKdOne_Header_MsgEnd          = $0A;//$000A; // 2 Bytes

  cKdOne_Payload_StartBracket   = '<';
  cKdOne_Payload_EndBracket     = '>';
  cKdOne_Payload_ForwardSlash   = '/';
  cKdOne_Payload_Hnml           = 'HNML';
  cKdOne_Payload_CtrlReq        = 'ControlRequest';
  cKdOne_Payload_Space          = ' ';
  cKdOne_Payload_TransId        = 'TransID';
  cKdOne_Payload_Equal          = '=';
  cKdOne_Payload_Quotes         = '"';
  cKdOne_Payload_Ds             = 'DS';
  cKdOne_Payload_DsTime         = '20180126083055828';
  cKdOne_Payload_FuncId         = 'FunctionID';
  cKdOne_Payload_ParkFuncId     = '1F03010B';
  cKdOne_Payload_FuncCat        = 'FunctionCategory';
  cKdOne_Payload_CtrlFuncCat    = 'Control';
  cKdOne_Payload_InputList      = 'InputList';
  cKdOne_Payload_Size           = 'size';
  cKdOne_Payload_InputListSize  = '1';
  cKdOne_Payload_Input          = 'Input';
  cKdOne_Payload_InputSize      = '7';
  cKdOne_Payload_Data           = 'Data';
  cKdOne_Payload_Name           = 'name';
  cKdOne_Payload_Complex        = 'Complex';

  cKdOne_Payload_DefComplex     = '0000';

  cKdOne_Payload_Dong           = 'Dong';
  cKdOne_Payload_Ho             = 'Ho';
  cKdOne_Payload_CarNo          = 'CarNo';
  cKdOne_Payload_Dir            = 'Direction';
  cKdOne_Payload_InDir          = 'In';
  cKdOne_Payload_OutDir         = 'Out';
  cKdOne_Payload_Time           = 'Time';
  cKdOne_Payload_DefTime        = '2018-01-26T08:30:55';
  cKdOne_Payload_Image          = 'Image';

  cKdOne_Payload_Result         = 'Result';

  {$ENDREGION}

type
  TParkInfo = record
    FInOutStatus: string;
    FAPTDong: string;
    FAPTHo: string;
    FCarNo: string;
    FInOutTime: string;
    FSendInfo: string;
  end;

  function IcmpCreateFile : THandle; stdcall; external 'icmp.dll';
  function IcmpCloseHandle (icmpHandle : THandle) : boolean; stdcall; external 'icmp.dll';
  function IcmpSendEcho (IcmpHandle    : THandle;  DestinationAddress: LongInt;
                         RequestData   : Pointer;  RequestSize       : Smallint;
                         RequestOptions: pointer;  ReplyBuffer       : Pointer;
                         ReplySize     : DWORD;    Timeout           : DWORD): DWORD;
                         stdcall; external 'icmp.dll';

var
  idTC: TIdTCPClient;
  MyParkInfo: TParkInfo;
  function is_Ping(ip: AnsiString): Boolean;
  function Homeinfo_proc_Kdone(ip: string; port: Integer; dong,ho,carNum,status: string): string;

implementation

uses
  Global;

{ kdOneHomeNet }

function Homeinfo_proc_Kdone(ip: string; port: Integer; dong, ho,
  carNum, status: string): string;
var
  strInOut, strPayloadEncodeData: String;
  iLenArr,byteArrHeaderData, bytePayloadData, byteArrSendData, byteArrSrcId, byteArrDestId, Buffer: TIdBytes;
  sRecvCode: string;
  strPayloadData: AnsiString;
begin
  try
    //구조체에 적용파트
    MyParkInfo.FAPTDong := dong;
    MyParkInfo.FAPTHo := ho;
    MyParkInfo.FCarNo := carNum;
    MyParkInfo.FInOutTime := DateTimeToStr(Now);
    MyParkInfo.FInOutStatus := status;
    MyParkInfo.FSendInfo := '['+dong+','+ho+','+carNum+']';
    //핑테스트
    if is_Ping(ip) = False then begin
      HomeInfoLogging(cKdOne_DefName+' 홈넷서버 응답없음! '+ip);
      Exit;
    end;

    //생성파트
    try
      if idTC = nil then begin
        idTC := TIdTCPClient.Create(Application);
        idTC.ConnectTimeout := 3000;
      end;
    except
      HomeInfoLogging(cKdOne_DefName+' 생성파트 실패!');
    end;

    //접속파트
    try
      idTC.Host := Trim(ip);
      idTC.Port := port;
      if idTC.Connected = true then begin
        IdTC.IOHandler.InputBuffer.Clear;         //버퍼 클리어가 안되면 disconnect가 정상적으로 동작되지않는다
        IdTC.Disconnect;
        //전송하고 연결을 끊기때문에 연결되일리는 없으니 아무작업 안함
        idTC.Connect;
        HomeInfoLogging(cKdOne_DefName+' 기존연결 끊고 재연결');
      end else begin
        idTC.Connect;
        HomeInfoLogging(cKdOne_DefName+' 연결됨');
      end;
    except
      HomeInfoLogging(cKdOne_DefName+' 연결실패!')
    end;

    //데이터 조합파트
    if MyParkInfo.FInOutStatus = '입차' then begin
      strInOut := cKdOne_Payload_InDir;
    end else begin
      strInOut := cKdOne_Payload_OutDir;
    end;

    //Payload
    strPayloadData := cKdOne_Payload_StartBracket + cKdOne_Payload_Hnml + cKdOne_Payload_EndBracket

                  + cKdOne_Payload_StartBracket + cKdOne_Payload_CtrlReq + cKdOne_Payload_Space + cKdOne_Payload_TransId + ' ' + cKdOne_Payload_Equal
                  + cKdOne_Payload_Quotes
                  + cKdOne_Payload_Ds + FormatDateTime('YYYYMMDDhhnnsszzz', Now)
                  + cKdOne_Payload_Quotes
                  + cKdOne_Payload_EndBracket

                  + cKdOne_Payload_StartBracket + cKdOne_Payload_FuncId + cKdOne_Payload_EndBracket
                  + cKdOne_Payload_ParkFuncId
                  + cKdOne_Payload_StartBracket + cKdOne_Payload_ForwardSlash + cKdOne_Payload_FuncId + cKdOne_Payload_EndBracket

                  + cKdOne_Payload_StartBracket + cKdOne_Payload_FuncCat + cKdOne_Payload_EndBracket
                  + cKdOne_Payload_CtrlFuncCat
                  + cKdOne_Payload_StartBracket + cKdOne_Payload_ForwardSlash + cKdOne_Payload_FuncCat + cKdOne_Payload_EndBracket

                  + cKdOne_Payload_StartBracket + cKdOne_Payload_InputList + cKdOne_Payload_Space + cKdOne_Payload_Size + ' ' + cKdOne_Payload_Equal
                  + cKdOne_Payload_Quotes
                  + cKdOne_Payload_InputListSize
                  + cKdOne_Payload_Quotes
                  + cKdOne_Payload_EndBracket

                  + cKdOne_Payload_StartBracket + cKdOne_Payload_Input + cKdOne_Payload_Space + cKdOne_Payload_Size + ' ' + cKdOne_Payload_Equal
                  + cKdOne_Payload_Quotes
                  + cKdOne_Payload_InputSize
                  + cKdOne_Payload_Quotes
                  + cKdOne_Payload_EndBracket

                  + cKdOne_Payload_StartBracket + cKdOne_Payload_Data + cKdOne_Payload_Space + cKdOne_Payload_Name + ' ' + cKdOne_Payload_Equal
                  + cKdOne_Payload_Quotes
                  + cKdOne_Payload_Complex
                  + cKdOne_Payload_Quotes
                  + cKdOne_Payload_EndBracket
                  // Complex '0000'
                  + cKdOne_Payload_DefComplex
                  + cKdOne_Payload_StartBracket + cKdOne_Payload_ForwardSlash + cKdOne_Payload_Data + cKdOne_Payload_EndBracket

                  + cKdOne_Payload_StartBracket + cKdOne_Payload_Data + cKdOne_Payload_Space + cKdOne_Payload_Name + ' ' + cKdOne_Payload_Equal
                  + cKdOne_Payload_Quotes
                  + cKdOne_Payload_Dong
                  + cKdOne_Payload_Quotes
                  + cKdOne_Payload_EndBracket
                  // Dong
                  + Format('%.4d', [StrToIntDef(MyParkInfo.FAPTDong, 0)])
                  + cKdOne_Payload_StartBracket + cKdOne_Payload_ForwardSlash + cKdOne_Payload_Data + cKdOne_Payload_EndBracket

                  + cKdOne_Payload_StartBracket + cKdOne_Payload_Data + cKdOne_Payload_Space + cKdOne_Payload_Name + ' ' + cKdOne_Payload_Equal
                  + cKdOne_Payload_Quotes
                  + cKdOne_Payload_Ho
                  + cKdOne_Payload_Quotes
                  + cKdOne_Payload_EndBracket
                  // Ho
                  + Format('%.4d', [StrToIntDef(MyParkInfo.FAPTHo, 0)])
                  + cKdOne_Payload_StartBracket + cKdOne_Payload_ForwardSlash + cKdOne_Payload_Data + cKdOne_Payload_EndBracket

                  + cKdOne_Payload_StartBracket + cKdOne_Payload_Data + cKdOne_Payload_Space + cKdOne_Payload_Name + ' ' + cKdOne_Payload_Equal
                  + cKdOne_Payload_Quotes
                  + cKdOne_Payload_CarNo
                  + cKdOne_Payload_Quotes
                  + cKdOne_Payload_EndBracket
                  // CarNo
                  + MyParkInfo.FCarNo
                  + cKdOne_Payload_StartBracket + cKdOne_Payload_ForwardSlash + cKdOne_Payload_Data + cKdOne_Payload_EndBracket

                  + cKdOne_Payload_StartBracket + cKdOne_Payload_Data + cKdOne_Payload_Space + cKdOne_Payload_Name + ' ' + cKdOne_Payload_Equal
                  + cKdOne_Payload_Quotes
                  + cKdOne_Payload_Dir
                  + cKdOne_Payload_Quotes
                  + cKdOne_Payload_EndBracket
                  // Direction
                  + strInOut
                  + cKdOne_Payload_StartBracket + cKdOne_Payload_ForwardSlash + cKdOne_Payload_Data + cKdOne_Payload_EndBracket

                  + cKdOne_Payload_StartBracket + cKdOne_Payload_Data + cKdOne_Payload_Space + cKdOne_Payload_Name + ' ' + cKdOne_Payload_Equal
                  + cKdOne_Payload_Quotes
                  + cKdOne_Payload_Time
                  + cKdOne_Payload_Quotes
                  + cKdOne_Payload_EndBracket
                  // Time
                  + FormatDateTime('YYYY-MM-DD',StrToDateTime(MyParkInfo.FInOutTime))
                  + 'T'
                  + FormatDateTime('hh:nn:ss',StrToDateTime(MyParkInfo.FInOutTime))
                  + cKdOne_Payload_StartBracket + cKdOne_Payload_ForwardSlash + cKdOne_Payload_Data + cKdOne_Payload_EndBracket

                  + cKdOne_Payload_StartBracket + cKdOne_Payload_Data + cKdOne_Payload_Space + cKdOne_Payload_Name + ' ' + cKdOne_Payload_Equal
                  + cKdOne_Payload_Quotes
                  + cKdOne_Payload_Image
                  + cKdOne_Payload_Quotes
                  + cKdOne_Payload_EndBracket
                  // Image
                  // (No Image)
                  + cKdOne_Payload_StartBracket + cKdOne_Payload_ForwardSlash + cKdOne_Payload_Data + cKdOne_Payload_EndBracket

                  + cKdOne_Payload_StartBracket + cKdOne_Payload_ForwardSlash + cKdOne_Payload_Input + cKdOne_Payload_EndBracket
                  + cKdOne_Payload_StartBracket + cKdOne_Payload_ForwardSlash + cKdOne_Payload_InputList + cKdOne_Payload_EndBracket
                  + cKdOne_Payload_StartBracket + cKdOne_Payload_ForwardSlash + cKdOne_Payload_CtrlReq + cKdOne_Payload_EndBracket
                  + cKdOne_Payload_StartBracket + cKdOne_Payload_ForwardSlash + cKdOne_Payload_Hnml + cKdOne_Payload_EndBracket
                  ;

    // UTF-8 Encoding
  //  ZeroMemory(@iLenArr,SizeOf(iLenArr));
    iLenArr := TIdBytes(TEncoding.UTF8.GetBytes(strPayloadData));
    strPayloadEncodeData := (strPayloadData);
    //반드시 ansistring으로 받아서 변환해야 Length가 정확함 한글은 3byte 영문 1byte
  //  CodeSite.Send('카운트:',Length(UTF8Encode(strPayloadData)));

    // Header Define
    ZeroMemory(@byteArrHeaderData,SizeOf(byteArrHeaderData));
    SetLength(byteArrHeaderData, 100);
    //byteArrHeaderData[0] ~ byteArrHeaderData[99]

    byteArrHeaderData[0] := cKdOne_Header_MsgStart;
    byteArrHeaderData[2] := cKdOne_Header_ProtocolVer;
    byteArrHeaderData[3] := cKdOne_Header_Flag;

    //byteArrHeaderData[4] ~ byteArrHeaderData[7] : Payload Length
    byteArrHeaderData[4] := ((Length(iLenArr)+100) And $FF000000) shr 24;
    byteArrHeaderData[5] := ((Length(iLenArr)+100) And $00FF0000) shr 16;
    byteArrHeaderData[6] := ((Length(iLenArr)+100) And $0000FF00) shr 8;
    byteArrHeaderData[7] := (Length(iLenArr)+100) And $000000FF;

    // Source Id
    SetLength(byteArrSrcId, 20);
    byteArrSrcId :=  TIdBytes(TEncoding.UTF8.GetBytes(cKdOne_Header_SrcId_All));
    Move(byteArrSrcId[0], byteArrHeaderData[16], 20);

    // Destination Id
    SetLength(byteArrDestId, 20);
    byteArrDestId := TIdBytes(TEncoding.UTF8.GetBytes(cKdOne_Header_DestId_All));
    Move(byteArrDestId[0], byteArrHeaderData[36], 20);

  //  byteArrHeaderData[98] := $00;  //해도되고 안해도 그만
    byteArrHeaderData[99] := cKdOne_Header_MsgEnd;

    bytePayloadData := TIdBytes(TEncoding.UTF8.GetBytes(strPayloadEncodeData));

    SetLength(byteArrSendData, 100 + Length(bytePayloadData));
    Move(byteArrHeaderData[0], byteArrSendData[0], 100);
    Move(bytePayloadData[0], byteArrSendData[100], Length(bytePayloadData));
  //  byteArrSendData[53] := $37;

    //전송파트
    try
      try
        idTC.IOHandler.Write(byteArrSendData,Length(byteArrSendData),0);
        IdTC.IOHandler.InputBuffer.clear;
        idTC.Socket.ReadBytes(Buffer, -1, false);
        sRecvCode := BytesToString (Buffer);
  //      CodeSite.Send('머야:',Copy(sRecvCode, Pos('<Result>',sRecvCode)+8,4));
        if Copy(sRecvCode, Pos('<Result>',sRecvCode)+8,4) = '0000' then begin
          HomeInfoLogging(cKdOne_DefName+' 데이터 전송성공 = '+MyParkInfo.FSendInfo+' '+UTF8Encode(strPayloadData));
          Result := '0000';
        end else begin
          HomeInfoLogging(cKdOne_DefName+' 데이터 전송실패! = '+MyParkInfo.FSendInfo+' '+UTF8Encode(strPayloadData));
          Result := '1000';
        end;
  //      codesite.Send('값:',Copy(sRecvCode, Pos(cKdOne_Payload_StartBracket + cKdOne_Payload_Result + cKdOne_Payload_EndBracket, sRecvCode) + Length(cKdOne_Payload_StartBracket + cKdOne_Payload_Result + cKdOne_Payload_EndBracket), 4));
      except
        HomeInfoLogging(cKdOne_DefName+' 데이터 전송오류! = '+MyParkInfo.FSendInfo+' '+UTF8Encode(strPayloadData));
      end;
    finally
      idTC.Disconnect;
      HomeInfoLogging(cKdOne_DefName+' 정상접속 해제');
    end;
  except
    on E: Exception do begin
      idTC.IOHandler.InputBuffer.clear;
      HomeInfoLogging('소켓 초기화 작업1');
      idTC.IOHandler.CloseGracefully;
      HomeInfoLogging('소켓 초기화 작업2');
      idTC.Disconnect;
      HomeInfoLogging('소켓 초기화 작업3');
    end;
  end;
end;

function is_Ping(ip: AnsiString): Boolean;
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
   begin
     // Added By LJH 181126 ====================
     // 기존 isPing 함수가 IP없이 체크할경우 TRUE로 반환하고 있었음.
     // 따라서 체크결과가 어떻든 IP가 빈칸일 경우 False반환토록 추가
     if IP = '' then
     begin
       Result:= False;
     end
     else
     begin
       Result:= True;
     end;
   end
   else
   begin
     Result:= False;
   end;

   //ExceptLogging('Ping 시간 체크2-' + IntToStr(GetTickCount));
   IcmpCloseHandle(Handle);
end;

end.
