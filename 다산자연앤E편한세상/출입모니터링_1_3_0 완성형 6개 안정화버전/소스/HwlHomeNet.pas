unit HwlHomeNet;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdServerIOHandler,
  IdServerIOHandlerSocket, IdServerIOHandlerStack, IdTCPConnection, IdTCPClient,
  IdBaseComponent, IdComponent, IdCustomTCPServer, IdTCPServer, Vcl.ComCtrls, IdGlobal,
  Vcl.ExtCtrls, CodeSiteLogging, IdContext, Winapi.WinSock;

type
  TCharArr = array of ansiChar;
//  TByteArr = array of byte;


const
  HID = 32;
  HPW = 40;
  HDONGHO = 8;
  HINTIME = 14;
//  HCARNO = 10;

var
  idTc: TIdTCPClient;
  SendArr: TIdBytes;
//  function Homeinfo_proc_HwlCheckLRC(const s: AnsiString): byte;
  function Homeinfo_proc_HwlCreate(ip:string; port:Integer): Boolean;
  procedure Homeinfo_proc_HwlSetArr(tag,dong,ho: Integer; carno: AnsiString);



implementation

uses
  Global;

{ THwl }

//function Homeinfo_proc_HwlCheckLRC(const s: AnsiString): byte;
//var i: integer;
//begin
//  result := 0;
//  for i := 1 to length(s) do
//    inc(result,ord(s[i]));
//  result := (result xor $FF)+1; // or result := (not result)+1;
//end;

function Homeinfo_proc_HwlCreate(ip:string; port:Integer): Boolean;
var
  recvArr: TIdBytes;
begin
  try
    Result := False;
    if idTc = nil then
      idTc := TIdTCPClient.Create(Application);
    idTc.Host := ip;
    idTc.Port := port;
    idTc.ConnectTimeout := 2000;
    idTc.ReadTimeout := 2000;
    if idTc.Connected = True then begin
//      HomeInfoLogging('하니웰 연결됨');
    end else begin
      SetLength(recvArr,100);
      ZeroMemory(Pointer(recvArr),Length(recvArr)*SizeOf(byte));

      idTc.Connect;
      HomeInfoLogging('연결 또는 재연결');
      idTC.Socket.ReadBytes(recvArr, -1, false);
      HomeInfoLogging('하니웰 응답: '+toHex(BytesToString(recvArr)));
      Result := True;
    end;
  except on E: Exception do
  begin
    if idTc <> nil then
      FreeAndNil(idTc);
    HomeInfoLogging('TCP소켓 생성불가 또는 접속불가!');
    Result := False;
  end;
  end;

end;

procedure Homeinfo_proc_HwlSetArr(tag,dong,ho: Integer; carno: AnsiString);
var
  preArr,dataArr: TIdBytes;
  dataStr: AnsiString;
  i,iSum: Integer;
  preData: AnsiString;

  tmpArr,chkArr: TCharArr;
  fixArr,sendArr,recvArr: TIdBytes;
  convStr: AnsiString;
  conv_CarNo: AnsiString;
  tmpLen: AnsiChar;
  arrLen: Integer;
  tmpB: TBytes;
  utf8Str: UTF8String;

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


  procedure StringSplit(const Delimiter: Char; Input: string; var Strings: TStrings);
  begin
    Strings := TStringList.Create;
    Assert(Assigned(Strings));
    Strings.Clear;
    Strings.Delimiter := Delimiter;
    Strings.DelimitedText := Input;
  end;

  function StrToByte(const Value: String; len: Integer): TIdBytes;
  var
    I,valLen: integer;
  begin
    SetLength(Result, len);
    valLen := Length(AnsiString(Value));
    for I := 0 to len - 1 do begin
      if valLen < i then
        Result[i] := $00
      else
        Result[I] := ord(Value[I + 1]);
    end;
  end;

  function UTF8StrToByte(const Value: UTF8String; len: Integer): TIdBytes;
  var
    I,valLen: integer;
  begin
    SetLength(Result, len);
    valLen := Length(Value);
    for I := 0 to len - 1 do begin
      if valLen < i then
        Result[i] := $00
      else
        Result[I] := ord(Value[I + 1]);
    end;
  end;

  function ArrToString(inArr: TCharArr): AnsiString;
  var
    i: Integer;
  begin
    Result := '';
    for i := 0 to Length(inArr)-1 do begin
      Result:= Result + ansiString(IntToHex(ord(inarr[i]), 2)) + ' ';
    end;
    Result := Trim(Result);
  end;

  function CheckLRC(const s: AnsiString): byte;
  var
    i,iSum: integer;
    tmpStrs: TStrings;
    tmpStr: AnsiString;

    function HexToInteger(HEX: String): Integer;
    begin
      if HEX = '' then
      begin
        Result := 0;
      end
      else
      begin
        HEX := '$' + HEX;
        Result := StrToInt(HEX);
      end;
    end;

  begin
    iSum := 0;
    StringSplit(' ',s,tmpStrs);
    for i := 0 to tmpStrs.Count-1 do begin
      iSum := iSum + HexToInteger(tmpStrs[i]);
    end;
    Result := (iSum xor $FF)+1;
  end;

  function StringToHex(const S: string): string;
  var
    Index: Integer;
  begin
    Result := '';
    for Index := 1 to Length(S) do
      Result := Result + IntToHex( Byte( S[Index] ), 2 );
  end;

  function HexToDec(const Value: String): Integer;
  begin
    Result:= StrToInt('$' + Value);
  end;


begin
//  Homeinfo_proc_HwlCreate(Form1.edtip.Text,StrToIntDef(Form1.edtPW.Text,8030));
  SetLength(recvArr,12);
  ZeroMemory(Pointer(recvArr),Length(recvArr)*SizeOf(byte));
  if tag = 0 then begin

    //로그인 이벤트
    arrLen := 9+HPW+HID+2; //기본정보+아이디+패스워드+체크섬+ETX
    SetLength(tmpArr,arrLen);
    ZeroMemory(Pointer(tmpArr),Length(tmpArr)*SizeOf(byte));
    SetLength(SendArr,arrLen);
    ZeroMemory(Pointer(SendArr),Length(SendArr)*SizeOf(byte));

    tmpArr[0] := AnsiChar($02);
    tmpArr[1] := AnsiChar($B0);
    tmpArr[2] := AnsiChar($D2);
    tmpArr[3] := AnsiChar($4C);
    tmpArr[4] := AnsiChar($00);
    tmpArr[5] := AnsiChar($09);
    tmpArr[6] := AnsiChar($93);
    tmpArr[7] := AnsiChar($03);
    tmpArr[8] := AnsiChar($01);

    SetLength(fixArr,HID);
    ZeroMemory(Pointer(fixArr),Length(fixArr)*SizeOf(byte));

    fixArr := StrToByte('parkmgr',HID); //고정아이디
    Move(fixArr[0],tmpArr[9],HID);

    SetLength(fixArr,HPW);
    ZeroMemory(Pointer(fixArr),Length(fixArr)*SizeOf(byte));

    fixArr := StrToByte('parkmgr0',HPW); //고정패스워드
    Move(fixArr[0],tmpArr[HPW+1],HPW);

    convStr := ArrToString(tmpArr); //바이트배열 문자열로 변경

    tmpArr[arrLen-2] := AnsiChar(CheckLRC(convStr));
    tmpArr[arrLen-1] := AnsiChar($03);

    Move(tmpArr[0],sendArr[0],arrLen); //array of char에 옮기자

    if idTc.Connected = False then begin
      idTc.Connect;
    end;

    idTc.Socket.WriteDirect(SendArr);
    HomeInfoLogging('하니웰 세대통보 접속인증');

    idTC.Socket.ReadBytes(recvArr, -1, false);
    HomeInfoLogging('하니웰 접속인증 응답: '+toHex(BytesToString(recvArr)));



  //  CodeSite.Send('a', Format('[%2x]', [Byte(CheckLRC(convStr))]) );
  end else begin
    if (dong = 0) or (ho = 0) or (carno = '') then
      Exit;
    utf8Str := UTF8Encode(string(carno + ' 입차')); //utf8인코딩
//    tmpB := TEncoding.UTF8.GetBytes(conv_CarNo);
//    utf8Str := TEncoding.UTF8.GetString(tmpB);
    //주차관제 이벤트
    arrLen := 9+HDONGHO+HINTIME+Length(utf8Str)+2;
    SetLength(tmpArr,arrLen); //기본정보+동호+진입시간+차량정보+체크섬+ETX
    ZeroMemory(Pointer(tmpArr),Length(tmpArr)*SizeOf(byte));
    SetLength(sendArr,arrLen);
    ZeroMemory(Pointer(sendArr),Length(sendArr)*SizeOf(byte));

    tmpArr[0] := AnsiChar($02);
    tmpArr[1] := AnsiChar($B0);
    tmpArr[2] := AnsiChar($D2);
//    for I := 1 to length(IntToHex(9+HDONGHO+HINTIME+Length(conv_CarNo),2)) div 2 do
//      tmpLen := AnsiChar(StrToInt('$'+Copy('27',(I-1)*2+1,2)));
//    CodeSite.Send('a:',IntToHex(9+HDONGHO+HINTIME+Length(conv_CarNo),2));
    tmpLen := AnsiChar(StrToInt('$'+(IntToHex(4+HDONGHO+HINTIME+Length(utf8Str),2))));

    tmpArr[3] := tmpLen;
    tmpArr[4] := AnsiChar($00);
    tmpArr[5] := AnsiChar($05);
    tmpArr[6] := AnsiChar($56);
    tmpArr[7] := AnsiChar($05);
    tmpArr[8] := AnsiChar($01);

    //동호
    SetLength(fixArr,HDONGHO);
    ZeroMemory(Pointer(fixArr),Length(fixArr)*SizeOf(byte));
    fixArr := StrToByte(FormatFloat('0000',dong) + FormatFloat('0000',ho),HDONGHO);
    Move(fixArr[0],tmpArr[9],HDONGHO);

    //진입시간
    SetLength(fixArr,HINTIME);
    ZeroMemory(Pointer(fixArr),Length(fixArr)*SizeOf(byte));
//    fixArr := StrToByte(FormatDateTime('yyyymmddhhnnss',now),HINTIME);
    fixArr := StrToByte('200905192025',HINTIME);
    Move(fixArr[0],tmpArr[9+HDONGHO],HINTIME);

    //차량정보
    SetLength(fixArr,Length(utf8Str)); //차량정보는 가변임!!!
    ZeroMemory(Pointer(fixArr),Length(fixArr)*SizeOf(byte));
//    fixArr := StrToByte(conv_CarNo,Length(conv_CarNo));
    fixArr := UTF8StrToByte(utf8Str,Length(utf8Str));
    Move(fixArr[0],tmpArr[9+HDONGHO+HINTIME],Length(utf8Str));

    SetLength(chkArr,arrLen-2-5); //체크섬용 배열들
    ZeroMemory(Pointer(chkArr),Length(chkArr)*SizeOf(byte));
    Move(tmpArr[5],chkArr[0],arrLen-2-5);


    convStr := ArrToString(tmpArr); //바이트배열 문자열로 변경

    tmpArr[arrLen-2] := AnsiChar(CheckLRC(convStr));
    tmpArr[arrLen-1] := AnsiChar($03);

    Move(tmpArr[0],sendArr[0],arrLen); //array of char에 옮기자

    if idTc.Connected = False then begin
      idTc.Connect;
    end;

    idTc.Socket.write(SendArr);
    HomeInfoLogging('하니웰 세대통보 전송(하니웰 관제이벤트는 응답이없음): '+ IntToStr(dong) + '동/' + IntToStr(ho)+'호/'+carno);
    idTC.Socket.ReadBytes(recvArr, -1, false);
//    HomeInfoLogging('하니웰 응답: '+toHex(BytesToString(recvArr)));
  end;

end;

end.
