unit LightThd;

interface

uses
  System.Classes, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdGlobal,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, system.SysUtils, System.Generics.Collections,
  Winapi.Windows, CodeSiteLogging, Vcl.Forms;

type
  TLightThread = class(TThread)
  private
    { Private declarations }
    lightTcp: TIdTCPClient;
    lightValue, lightRequest: TIdBytes;
    pTime: Integer;
    exeFlag: Integer;
    exeQue: TQueue<Integer>;
    statusArr: Array[1..8] of Integer;
//    ioHandle: TIdIOHandlerStack;

    procedure relay1On;
    procedure relay1Off;
    procedure relay2On;
    procedure relay2Off;
    procedure SendlightRequest;

  protected
    procedure Execute; override;

  public
    closeSignal: Integer;

    constructor Create(ip: string; port,lightKeepTime: Integer);
    destructor Destroy; override;

   procedure addQue(queVal: Integer);

  end;

implementation

uses
  Global;

{ TLightThd }

procedure TLightThread.addQue(queVal: Integer);
begin
  if exeQue <> nil then begin
    exeQue.Enqueue(queVal);
  end;
end;

constructor TLightThread.Create(ip: string; port,lightKeepTime: Integer);
begin
  try
    FreeOnTerminate := False;
    inherited Create(False);
    Priority := tpNormal;

    Fillchar(statusArr,sizeof(statusArr),0);
    SetLength(lightValue,10);
    ZeroMemory(Pointer(lightValue),Length(lightValue) * SizeOf(Integer));
    closeSignal := 0;

    pTime := lightKeepTime;
    exeQue := TQueue<Integer>.Create;
    lightTcp := TIdTCPClient.Create();
//    lightTcp.IOHandler := ioHandle;
    lightTcp.ConnectTimeout := 1000;
    lightTcp.Host := ip;
    lightTcp.Port := port;
    lightTcp.Connect;

  except on E: Exception do

  end;


end;

destructor TLightThread.Destroy;
begin
  //정상표시로 돌리고 종료 아마도 파란색
//  if lightTcp.Connected = False then
//    lightTcp.Connect;
//  lightValue[0] := $02;
//  lightValue[1] := $ff;
//  lightValue[2] := $00;
//  lightValue[3] := $01;
//  lightValue[4] := $57;
//  lightValue[5] := $00;
//  lightValue[6] := $31;
//  lightValue[7] := $30;
//  lightValue[8] := $aa;
//  lightValue[9] := $03;
//  lightTcp.Socket.WriteDirect(lightValue);
//
//  if lightTcp.Connected = False then
//    lightTcp.Connect;
//  lightValue[0] := $02;
//  lightValue[1] := $ff;
//  lightValue[2] := $00;
//  lightValue[3] := $01;
//  lightValue[4] := $57;
//  lightValue[5] := $00;
//  lightValue[6] := $32;
//  lightValue[7] := $30;
//  lightValue[8] := $a9;
//  lightValue[9] := $03;
//  lightTcp.Socket.WriteDirect(lightValue);
//  lightTcp.Disconnect;

  FreeAndNil(exeQue);
  FreeAndNil(lightTcp);
  inherited;
end;

procedure TLightThread.Execute;
begin
  try
    while not Terminated do begin
      if exeQue <> nil then begin
        if exeQue.Count > 0 then begin
          exeFlag := exeQue.Dequeue;
          if exeFlag = 1 then
            relay1On
          else if exeFlag = 2 then
            relay2On
          else if exeFlag = 9 then
            relay1Off
          else if exeFlag = 10 then
            relay2Off;
        end;
      end;
      if Terminated = False then
        SendlightRequest;

      WaitForSingleObject(Handle, 200);
      Application.ProcessMessages;
    end;
  except on E: Exception do
    ExceptLogging(e.Message);
  end;
end;

procedure TLightThread.relay1Off;
begin
  if lightTcp.Connected = False then
    lightTcp.Connect;
  lightValue[0] := $02;
  lightValue[1] := $ff;
  lightValue[2] := $00;
  lightValue[3] := $01;
  lightValue[4] := $57;
  lightValue[5] := $00;
  lightValue[6] := $31;
  lightValue[7] := $30;
  lightValue[8] := $aa;
  lightValue[9] := $03;
  lightTcp.Socket.WriteDirect(lightValue);
  statusArr[1] := 0;
end;

procedure TLightThread.relay1On;
var
  PastCount: LongInt;
begin
  //릴레이1 ON
  exeFlag := 0;
  if lightTcp.Connected = False then
    lightTcp.Connect;
  lightValue[0] := $02;
  lightValue[1] := $ff;
  lightValue[2] := $00;
  lightValue[3] := $01;
  lightValue[4] := $57;
  lightValue[5] := $00;
  lightValue[6] := $31;
  lightValue[7] := $31;
  lightValue[8] := $ab;
  lightValue[9] := $03;
  lightTcp.Socket.WriteDirect(lightValue);
  statusArr[1] := 1;
  Sleep(pTime);
end;

procedure TLightThread.relay2Off;
begin
  if lightTcp.Connected = False then
    lightTcp.Connect;
  lightValue[0] := $02;
  lightValue[1] := $ff;
  lightValue[2] := $00;
  lightValue[3] := $01;
  lightValue[4] := $57;
  lightValue[5] := $00;
  lightValue[6] := $32;
  lightValue[7] := $30;
  lightValue[8] := $a9;
  lightValue[9] := $03;
  lightTcp.Socket.WriteDirect(lightValue);
  statusArr[2] := 0;
end;

procedure TLightThread.relay2On;
var
  PastCount: LongInt;
begin
  //릴레이1 ON
  exeFlag := 0;
  if lightTcp.Connected = False then
    lightTcp.Connect;
  lightValue[0] := $02;
  lightValue[1] := $ff;
  lightValue[2] := $00;
  lightValue[3] := $01;
  lightValue[4] := $57;
  lightValue[5] := $00;
  lightValue[6] := $32;
  lightValue[7] := $31;
  lightValue[8] := $a8;
  lightValue[9] := $03;
  lightTcp.Socket.WriteDirect(lightValue);
  statusArr[2] := 1;
  Sleep(pTime);
end;

procedure TLightThread.SendlightRequest;
const
  Convert: array[0..15] of Char = '0123456789ABCDEF';
var
  Buffer: TIdBytes;
  i: Integer;
  recvStr: string;
begin
  SetLength(lightRequest,10);
//  ZeroMemory(Pointer(lightRequest),Length(lightRequest) * SizeOf(Integer));

  lightRequest[0] := $02;
  lightRequest[1] := $ff;
  lightRequest[2] := $00;
  lightRequest[3] := $01;
  lightRequest[4] := $52;
  lightRequest[5] := $00;
  lightRequest[6] := $00;
  lightRequest[7] := $00;
  lightRequest[8] := $ae;
  lightRequest[9] := $03;

  if lightTcp <> nil then begin
    if lightTcp.Connected = False then
      lightTcp.Connect;
    lightTcp.Socket.WriteDirect(lightRequest); //꾸준히 입력값 어떤지 물어보기
    Sleep(50);
    lightTcp.Socket.ReadBytes(Buffer, -1, false);
  end;
  recvStr := '';
  if Length(Buffer) = 15 then begin
    for I := 0 to Length(Buffer)-1 do begin
      case i of //채널
        5: begin //1번
          if Convert[Byte(Buffer[I]) shr 4] + Convert[Byte(Buffer[I]) and $F] = '31' then begin
            if statusArr[1] = 0 then
              addQue(1);
          end else begin
            if statusArr[1] = 1 then
              addQue(9);
          end;
        end;
        6: begin //2번
          if Convert[Byte(Buffer[I]) shr 4] + Convert[Byte(Buffer[I]) and $F] = '31' then begin
            if statusArr[2] = 0 then
              addQue(2);
          end else begin
            if statusArr[2] = 1 then
              addQue(10);
          end;
        end;
        7: begin //3번
          if Convert[Byte(Buffer[I]) shr 4] + Convert[Byte(Buffer[I]) and $F] = '31' then begin
            if statusArr[3] = 0 then
              addQue(3);
          end else begin
            if statusArr[3] = 1 then
            addQue(11);
          end;
        end;
        8: begin //4번
          if Convert[Byte(Buffer[I]) shr 4] + Convert[Byte(Buffer[I]) and $F] = '31' then begin
            if statusArr[4] = 0 then
              addQue(4);
          end else begin
            if statusArr[4] = 1 then
              addQue(12);
          end;
        end;
        9: begin //5번
          if Convert[Byte(Buffer[I]) shr 4] + Convert[Byte(Buffer[I]) and $F] = '31' then begin
            if statusArr[5] = 0 then
              addQue(5);
          end else begin
            if statusArr[5] = 1 then
              addQue(13);
          end;
        end;
        10: begin //6번
          if Convert[Byte(Buffer[I]) shr 4] + Convert[Byte(Buffer[I]) and $F] = '31' then begin
            if statusArr[6] = 0 then
              addQue(6);
          end else begin
            if statusArr[6] = 1 then
              addQue(14);
          end;
        end;
        11: begin //7번
          if Convert[Byte(Buffer[I]) shr 4] + Convert[Byte(Buffer[I]) and $F] = '31' then begin
            if statusArr[7] = 0 then
              addQue(7);
          end else begin
            if statusArr[7] = 1 then
              addQue(15);
          end;
        end;
        12: begin //8번
          if Convert[Byte(Buffer[I]) shr 4] + Convert[Byte(Buffer[I]) and $F] = '31' then begin
            if statusArr[8] = 0 then
              addQue(8);
          end else begin
            if statusArr[8] = 1 then
              addQue(16);
          end;
        end;
      end;
      recvStr := recvStr+ Convert[Byte(Buffer[I]) shr 4] + Convert[Byte(Buffer[I]) and $F] + ' ';

    end;
  end;
//  CodeSite.Send(recvStr);
//  CodeSite.Send('대기열:',exeQue.Count);
end;

end.
