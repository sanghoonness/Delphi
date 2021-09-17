unit VillageThd;

interface

uses
  System.Classes, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, System.SysUtils, CodeSiteLogging, IdGlobal, Vcl.Forms, Winapi.Windows, IdStack, IdException,
  IdHTTP, IdURI, IdThread, IdSSLOpenSSL, Web.HTTPApp, Winapi.Messages, System.Generics.Collections,
  Data.DB, Data.Win.ADODB, System.JSON, ScktComp,
  Global, System.IniFiles, system.DateUtils;

type
  TJsonInfo = class(TObject)
    jtype: string;
    jcar_no: string;
    jstartDt: string;
    jendDt: string;
    jmodifiedAt: string;
    jupdateDt: string;
  end;

  TVillageInfo = record
    exeTag: Integer;
    closeSignal: Integer;
    sendStr: string;
    recvStr: string;

    //�Ʒ����� ���ڰ�
    carNo: String; //������ȣ
    villageId: string; //����ID
    nextIndex: string; //�߰������Ͱ� �ִ°�� ���������� Index
    lastUpdate: string; //���������Ͻ�(yyyy-mm-ddTHH:mm:ss)
    inOutType: string; //�̺�Ʈ����(COME_IN, GO_OUT)
    eventDt: string; //�߻��Ͻ�(yyyy-MM-ddTHH:mm:ss);
  end;


  TVillageThread = class(TThread)
  private
    { Private declarations }
    ConnThd: TADOConnection;
    qryThd: TADOQuery;

    sendStrs: TStrings;
    villageQue: TQueue<TVillageInfo>;
    procedure tcpSocketCreate;

  protected

    procedure Execute; override;

  public
    idHttp: TIdHTTP;
    LHandler: TIdSSLIOHandlerSocketOpenSSL;
    myVillage: TVillageInfo;
    reloadTime: string;
    updateDate: string;
    csLPR: TClientSocket;


    function addQue(inVillageInfo: TVillageInfo): Boolean;
    constructor Create(villageID: Integer);
    destructor Destroy; override;
    function GetVisitCheck: string;
    function GiveInCarData: string;
//    function GiveOutCarData: string;
    function GetVisitList: string;
    function ResponseCodeLog(inOutName: string; code: Integer): Boolean;
    function jsonParse(inStr: String; car_No: string = ''): Boolean;
    procedure mzLog(inMsg: aString);

  end;

const
  v1 = 'villageId';
  v2 = 'type';
  v3 = 'carNo';
  v4 = 'eventDt';
  v5 = 'lastUpdate';
  v6 = 'nextIndex';
  VILLAGE_INCAR = 'COME_IN';
  VILLAGE_OUTCAR = 'GO_OUT';



implementation

//const
//  VILLAGE_ADDRESS_VISITCHECK = 'http://10.22.27.1/api/v1/allowed-cars/latest?';
//  VILLAGE_ADDRESS_INOUTCAR =   'http://10.22.27.1/api/v1/allowed-cars/events';
//  VILLAGE_ADDRESS_VISITLIST =  'http://10.22.27.1/api/v1/allowed-cars?';

//  APTNER_AUTH_VISITCHECK = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJORVhQQSIsInJvbGVzIjoiUEMiLCJpc3MiOiJBUFRORVIiLCJleHAiOjMxNDE5NjE3NzQsImlkeCI6IiIsImlhdCI6MTU2NDAzODU3NH0.Dl7vkkeOA-QJH82AuBQux7rq5wsUVqr7F9o9h0BttiE';
//  APTNER_AUTH_INCAR =      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJORVhQQSIsInJvbGVzIjoiUEMiLCJpc3MiOiJBUFRORVIiLCJleHAiOjMxNDE5NjE3NzQsImlkeCI6IiIsImlhdCI6MTU2NDAzODU3NH0.Dl7vkkeOA-QJH82AuBQux7rq5wsUVqr7F9o9h0BttiE';
//  APTNER_AUTH_OUTCAR =     'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJORVhQQSIsInJvbGVzIjoiUEMiLCJpc3MiOiJBUFRORVIiLCJleHAiOjMxNDE5NjE3NzQsImlkeCI6IiIsImlhdCI6MTU2NDAzODU3NH0.Dl7vkkeOA-QJH82AuBQux7rq5wsUVqr7F9o9h0BttiE';
//  APTNER_AUTH_VISITLIST =  'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJORVhQQSIsInJvbGVzIjoiUEMiLCJpc3MiOiJBUFRORVIiLCJleHAiOjMxNDE5NjE3NzQsImlkeCI6IiIsImlhdCI6MTU2NDAzODU3NH0.Dl7vkkeOA-QJH82AuBQux7rq5wsUVqr7F9o9h0BttiE';
var
  Json: string;
  JsonToSend: TStringStream;
  jInfoList: TObjectList<TJsonInfo>; //��ü��� �޾ƿ��� ����Ʈ
  VILLAGE_ADDRESS_VISITCHECK, VILLAGE_ADDRESS_INOUTCAR, VILLAGE_ADDRESS_VISITLIST: string;
  isDBUpdate: Boolean = false;
  vID: Integer;

{ TTestThread }

function TVillageThread.addQue(inVillageInfo: TVillageInfo): Boolean;
begin
  try
    villageQue.Enqueue(inVillageInfo);
    Result := True;
  except on E: Exception do
    begin
      Result := False;
      mzLog(e.Message);
    end;
  end;
end;

constructor TVillageThread.Create(villageID: Integer);
begin
  vID := villageID;
  updateDate := FormatDateTime('yyyy-mm-dd',Now);
  tcpSocketCreate;
  FreeOnTerminate := False;
  inherited Create(False);
  Priority := tpNormal;
  myVillage.closeSignal := 0;
  jInfoList := TObjectList<TJsonInfo>.Create();

  iSetup := TIniFile.Create(ExtractFileDir(Application.ExeName) + '\ParkSet.ini');
  sDBIP  := iSetup.ReadString('PARKING', 'DB IP', '');
  sDBID  := iSetup.ReadString('PARKING', 'DB ID', '');
  sDBPW  := iSetup.ReadString('PARKING', 'DB PW', '');
  sDBName:= iSetup.ReadString('PARKING', 'DB Name', '');
  reloadTime := iSetup.ReadString('PARKING', 'smartVillage_dbReload ', '03:00');
  VILLAGE_ADDRESS_VISITCHECK := iSetup.ReadString('PARKING', 'VILLAGE_ADDRESS_VISITCHECK', '');
  VILLAGE_ADDRESS_INOUTCAR := iSetup.ReadString('PARKING', 'VILLAGE_ADDRESS_INOUTCAR', '');
  VILLAGE_ADDRESS_VISITLIST := iSetup.ReadString('PARKING', 'VILLAGE_ADDRESS_VISITLIST', '');

  connThd := TADOConnection.Create(nil);
  ConnThd.ConnectionString := 'Provider=SQLOLEDB.1;Password='+sDBPW+';Persist Security Info=True;User ID='+sDBID+';Initial Catalog='+sDBName+';Data Source='+sDBIP+',42130';
//  ConnThd.ConnectionTimeout := 15;
  ConnThd.KeepConnection := True;
  ConnThd.LoginPrompt := False;
  ConnThd.Provider := 'SQLOLEDB.1';
  qryThd := TADOQuery.Create(nil);
  qryThd.Connection := ConnThd;

  ConnThd.Connected := True;
end;

destructor TVillageThread.Destroy;
begin
  try
    if Assigned(sendStrs) then begin
      FreeAndNil(sendStrs);
    end;
    if Assigned(LHandler) then begin
      FreeAndNil(LHandler);
    end;
    if Assigned(idHttp) then begin
      idHttp.Disconnect;
      FreeAndNil(idHttp);
    end;
    if Assigned(ConnThd) then
      FreeAndNil(ConnThd);
    if Assigned(qryThd) then
      FreeAndNil(qryThd);
    if Assigned(jInfoList) then
      FreeAndNil(jInfoList);
//    inherited Destroy;
  except on E: Exception do
    mzLog(e.Message);
  end;
end;

procedure TVillageThread.Execute;
var
  tmpVillage: TVillageInfo;
  i: Integer;
  function CheckParameter(chkCnt: Integer): boolean;
  var
    chkInc: Integer;
  begin
    chkInc := 0;
    if myVillage.villageId <> '' then inc(chkInc);
    if myVillage.carNo <> '' then inc(chkInc);
    if myVillage.lastUpdate <> '' then inc(chkInc);
    if myVillage.inOutType <> '' then inc(chkInc);
    if myVillage.eventDt <> '' then inc(chkInc);

    if chkInc >= chkCnt then result := True
    else result := False;
  end;

begin
  { Place thread code here }
  while not Terminated do begin
    try
      if myVillage.closeSignal = 1 then begin
        TerminateThread(Self.Handle,0);
      end;

      if villageQue.Count > 0 then begin
        tmpVillage := villageQue.Dequeue;
        myVillage.recvStr := '';
        case myVillage.exeTag of
          1: begin
            if CheckParameter(1) = True then begin
              myVillage.recvStr := GetVisitCheck;  //������� �����ȸ(���泻����)
              if myVillage.recvStr = 'True' then
//                frmMain.InOpen(csLPR);
//            SYNCHRONIZE(Unit1.Form1.display);
            end;
          end;
          2: begin
            if CheckParameter(4) = True then
              myVillage.recvStr := GiveInCarData;  //��,�������� ����
//            SYNCHRONIZE(Unit1.Form1.display);
          end;
          3: begin
            if CheckParameter(0) = True then
              myVillage.recvStr := GetVisitList;  //������� �����ȸ(��ü)
//            SYNCHRONIZE(Unit1.Form1.display);
          end;
        end;
      end;

      //���������� �ֽŵ����� �޾ƿ���(DB����� ���� ������� ����)
      if (reloadTime = FormatDateTime('hh:nn',Now)) and (isDBUpdate = False) then begin
        ConnThd.Connected := False;
        ConnThd.Connected := True;
        myVillage.villageId := IntToStr(vID);
        myVillage.recvStr := GetVisitList;  //������� �����ȸ(��ü)
        if myVillage.recvStr = 'True' then begin
          isDBUpdate := True;
          mzLog('�ֽŵ����� DB���� �Ϸ�: '+reloadTime);
        end else begin
          mzLog('�ֽŵ����� DB���� ����!: '+reloadTime);
          isDBUpdate := False;
          for i := 0 to 2 do begin
            ConnThd.Connected := False;
            ConnThd.Connected := True;
            myVillage.villageId := IntToStr(vID);
            myVillage.recvStr := GetVisitList;  //������� �����ȸ(��ü)


          end;
        end;
      end;

      if (FormatDateTime('hh:nn',IncMinute(StrToDateTime(reloadTime),2)) = FormatDateTime('hh:nn',Now)) and (isDBUpdate = True) then begin
        isDBUpdate := False;
        mzLog('�ֽŵ����� �ð����� Ŭ����');
      end;

      Sleep(100);
    except on E: Exception do
      begin
        Sleep(10000);
        if Self.Suspended = True then self.Resume;
      end;
    end;
  end;
end;

function TVillageThread.GetVisitCheck: string;  //exeTag = 1
var
  i: Integer;
begin
  try
    try
      Result := '';
      idHttp.Request.ContentType := 'application/json';
//      myVillage.sendStr := TIdURI.URLEncode(APTNER_ADDRESS_VISITCHECK+'villageId='+myVillage.villageId+'&lastUpdate='+ myVillage.lastUpdate);
//      idHttp.Request.CustomHeaders.Values['Authorization'] := 'Bearer ';

//      Json := '{"'+v1+'": "' + myVillage.villageId +
//          '","'+v5+'": "' + myVillage.lastUpdate +
//          '"}';
//
//      JsonToSend := TStringStream.Create(Utf8Encode(Json)); // D2007 and earlier only
      //in D2009 and later, use this instead:
//      JsonToSend := TStringStream.Create(Json, TEncoding.UTF8);
//      mzLog('����������: '+APTNER_ADDRESS_VISITCHECK+JsonToSend.DataString);
//      myVillage.recvStr := idHttp.Get(APTNER_ADDRESS_VISITCHECK+JsonToSend.DataString);
//      Result := myVillage.recvStr;
//      mzLog(Result);


      JsonToSend := TStringStream.Create('',TEncoding.UTF8);
      Json := TIdURI.URLEncode(VILLAGE_ADDRESS_VISITCHECK+'villageId='+myVillage.villageId+'&lastUpdate='+ myVillage.lastUpdate+'&carNo='+ myVillage.carNo);
      mzLog('����������: '+VILLAGE_ADDRESS_VISITCHECK+'villageId='+myVillage.villageId+'&lastUpdate='+ myVillage.lastUpdate+'&carNo='+ myVillage.carNo);
      idHttp.Get(Json,JsonToSend);

      if jsonParse(JsonToSend.DataString,myVillage.carNo) = True then
        Result := 'True'
      else
        Result := 'False';

//      Result := JsonToSend.DataString;
//      mzLog(Result);

//      villageId.jsObj := TJSONObject.ParseJSONValue(villageId.recvStr) as TJSONObject;
//      villageId.recvStr := '';
//      for i := 0 to villageId.jsObj.Size -1 do begin
//        jsData := villageId.jsObj.Get(i);
//        villageId.recvStr := jsData.JsonValue.Value + ',' + villageId.recvStr;
//      end;
//      Result := Copy(villageId.recvStr,0,Length(villageId.recvStr)-1);
//      mzLog('����: '+Copy(villageId.recvStr,0,Length(villageId.recvStr)-1));
    finally
      LHandler.InputBuffer.Clear;
      FreeAndNil(JsonToSend);
    end;
  except
    on E2: EIdHTTPProtocolException do begin
      mzLog(e2.ErrorMessage);
    end;
    on EX: Exception do begin
      mzLog(ex.Message);
    end;
  end;
end;

function TVillageThread.GetVisitList: string;  //exeTag = 3
var
  i: Integer;
begin
  try
    try
      Result := '';
      idHttp.Request.ContentType := 'application/json';
//      myVillage.sendStr := TIdURI.URLEncode(APTNER_ADDRESS_VISITCHECK+'villageId='+myVillage.villageId+'&nextIndex='+ myVillage.nextIndex);
//      idHttp.Request.CustomHeaders.Values['Authorization'] := 'Bearer ';
//      Json2 := '{"'+v1+'": "' + myVillage.villageId +
//          '","'+v6+'": "' + myVillage.nextIndex +
//          '"}';
//      JsonToSend := TStringStream.Create(Utf8Encode(Json)); // D2007 and earlier only
      //in D2009 and later, use this instead:
//      JsonToSend := TStringStream.Create(APTNER_ADDRESS_VISITLIST+Json2, TEncoding.UTF8);
//      Json := TIdURI.URLEncode(APTNER_ADDRESS_VISITLIST+json2);
      JsonToSend := TStringStream.Create('',TEncoding.UTF8);
      Json := TIdURI.URLEncode(VILLAGE_ADDRESS_VISITLIST+'villageId='+myVillage.villageId+'&nextIndex='+ myVillage.nextIndex);
      mzLog('����������: '+json);
      idHttp.Get(Json,JsonToSend);

      //json�Ľ� �� DB�����۾�
//      if ConnThd.Connected = True then begin
//        qryThd.Close;
//        qryThd.SQL.Clear;
//        qryThd.SQL.Add('');
//
//      end;
      Result := BoolToStr(jsonParse(JsonToSend.DataString),True);

//      mzLog(Result);
//      CodeSite.Send('����������',myVillage.sendStr);
//      myVillage.recvStr := idHttp.Get(myVillage.sendStr);
//      Result := myVillage.recvStr;
//      villageId.jsObj := TJSONObject.ParseJSONValue(villageId.recvStr) as TJSONObject;
//      villageId.recvStr := '';
//      for i := 0 to villageId.jsObj.Size -1 do begin
//        jsData := villageId.jsObj.Get(i);
//        villageId.recvStr := jsData.JsonValue.Value + ',' + villageId.recvStr;
//      end;
//      Result := Copy(villageId.recvStr,0,Length(villageId.recvStr)-1);
//      mzLog('����: '+Copy(villageId.recvStr,0,Length(villageId.recvStr)-1));
    finally
      LHandler.InputBuffer.Clear;
      FreeAndNil(JsonToSend);
    end;
  except
    on E2: EIdHTTPProtocolException do begin
      mzLog(e2.ErrorMessage);
    end;
    on EX: Exception do begin
      mzLog(ex.Message);
    end;
  end;
end;

function TVillageThread.GiveInCarData: string;  //exeTag = 2 �������� ����

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

      Result := '';
      idHTTP.Request.ContentType := 'application/json';
//      idHttp.Request.CustomHeaders.Values['Authorization'] := 'Bearer ';
//      sendStrs.Clear;
//      sendStrs.Values[v1] := myVillage.villageId;
//      sendStrs.Values[v2] := myVillage.inOutType;
//      sendStrs.Values[v3] := myVillage.carNo;
//      sendStrs.Values[v4] := myVillage.eventDt;

      Json := '{"'+v1+'": "' + myVillage.villageId +
          '","'+v2+'": "' + myVillage.inOutType +
          '","'+v3+'": "' + myVillage.carNo +
          '","'+v4+'": "' + myVillage.eventDt +
          '"}';

//      JsonToSend := TStringStream.Create(Utf8Encode(Json)); // D2007 and earlier only
      //in D2009 and later, use this instead:
      JsonToSend := TStringStream.Create(Json, TEncoding.UTF8);
      mzlog(JsonToSend.DataString);
      mzLog(idHttp.Post(VILLAGE_ADDRESS_INOUTCAR,JsonToSend));

      if myVillage.inOutType = 'COME_IN' then
        ResponseCodeLog('����Ʈ���������� ��������',idHttp.ResponseCode)
      else
        ResponseCodeLog('����Ʈ���������� ��������',idHttp.ResponseCode);
//      ZeroMemory(Pointer(villageId.recvArr),Length(villageId.recvArr) * SizeOf(string));
      Result := IntToStr(idHttp.ResponseCode);
//      mzLog(Result);
    finally
      LHandler.InputBuffer.Clear;
      FreeAndNil(JsonToSend);
    end;
  except on E: Exception do
    begin
      Result := '';
      mzLog(e.Message);
    end;
  end;
end;

function TVillageThread.jsonParse(inStr: String; car_No: string = ''): Boolean;
var
  myJson,subJson, ssubJson : TJSONObject;
  i,j,k,l: Integer;
  data,subData, ssubData : TJSONPair;
  dataa, tmpData: TJSONArray;
  LItem,itemType,itemStr : TJSONValue;
  src : String;
  jInfo: TJsonInfo;
//  isDBUpdate: Boolean;
  nowDate: string;
begin
  try
    mzLog('��������: '+inStr);
    Result := False;
//    isDBUpdate := False;
    if inStr = '' then
      Exit;
    myJson := TJSONObject.ParseJSONValue(inStr) as TJSONObject; // src�� ���� utf8�� �Ǿ� �־����.
    for I := 0 to myJson.Size-1 do begin
      data := myJson.Get(i);
      itemStr := data.JsonString;
      itemType := data.JsonValue;
      if (itemStr.Value = 'resultCd') and (itemType.Value <> '1') then begin
//        mzLog('���Ű� ����: '+itemType.Value);
        FreeAndNil(jInfo);
        Exit;
      end else if (itemStr.Value = 'resultCd') and (itemType.Value = '1') then begin
//        mzLog('���Ű� ����: '+itemType.Value);
      end;

      if itemType is TJSONArray then begin
        dataa := TJSONArray(myJson.Get('data').JsonValue);
        if not dataa.Null then begin
          for k := 0 to dataa.Size-1 do begin
            LItem := dataa.Get(k);
            src := LItem.ToString;  //���ڷ� �޾Ƽ� �ٽ��Ľ�
            subJson := TJSONObject.ParseJSONValue( src ) as TJSONObject; // src�� ���� utf8�� �Ǿ� �־����.
            for j := 0 to subJson.Size-1 do begin
              subData := subJson.Get(j);
              if subData.JsonString.Value = 'type' then begin
                jInfo.jtype := subData.JsonValue.Value;
              end else if subData.JsonString.Value = 'carNo' then begin
                jInfo.jcar_no := subData.JsonValue.Value;
              end else if subData.JsonString.Value = 'startDt' then begin
                jInfo.jstartDt := subData.JsonValue.Value;
              end else if subData.JsonString.Value = 'endDt' then begin
                jInfo.jendDt := subData.JsonValue.Value;
              end else if subData.JsonString.Value = 'modifiedAt' then begin
                jInfo.jmodifiedAt := subData.JsonValue.Value;
              end else begin

              end;
            end;
          end;
        end;
      end else if itemType is TJSONString then begin
        if TJSONString(itemStr).ToString = 'type' then begin
          jInfo.jtype := itemType.Value;
        end else if TJSONString(itemStr).ToString = 'carNo' then begin
          jInfo.jcar_no := itemType.Value;
        end else if TJSONString(itemStr).ToString = 'startDt' then begin
          jInfo.jstartDt := itemType.Value;
        end else if TJSONString(itemStr).ToString = 'endDt' then begin
          jInfo.jendDt := itemType.Value;
        end else if TJSONString(itemStr).ToString = 'modifiedAt' then begin
          jInfo.jmodifiedAt := itemType.Value;
        end else begin

        end;
      end else begin  //object �϶� �ɸ����� �Ƹ�..
        subJson := TJSONObject.ParseJSONValue(itemType.ToString) as TJSONObject; // src�� ���� utf8�� �Ǿ� �־����.
        for j := 0 to subJson.Size-1 do begin
          subData := subJson.Get(j);
          if subData.JsonString.Value = 'lastUpdate' then
            nowDate := FormatDateTime('yyyy-mm-dd',now) + 'T' + FormatDateTime('hh:mm:ss',now);
          if subData.JsonString.Value = 'list' then begin
            tmpData := TJSONArray(subJson.Get('list').JsonValue);
            if not tmpData.Null then begin
              for k := 0 to tmpData.Size-1 do begin
                jInfo := TJsonInfo.Create;
                itemStr := tmpData.Get(k);
                src := itemStr.ToString;  //���ڷ� �޾Ƽ� �ٽ��Ľ�
//                mzLog('�������� ����Ʈ(json): '+src);
                subJson := TJSONObject.ParseJSONValue( src ) as TJSONObject; // src�� ���� utf8�� �Ǿ� �־����.
                for l := 0 to subJson.Size-1 do begin
                  subData := subJson.Get(l);
                  if subData.JsonString.Value = 'type' then begin
                    jInfo.jtype := subData.JsonValue.Value;
                  end else if subData.JsonString.Value = 'carNo' then begin
                    jInfo.jcar_no := subData.JsonValue.Value;
                  end else if subData.JsonString.Value = 'startDt' then begin
                    jInfo.jstartDt := subData.JsonValue.Value;
                  end else if subData.JsonString.Value = 'endDt' then begin
                    jInfo.jendDt := subData.JsonValue.Value;
                  end else if subData.JsonString.Value = 'modifiedAt' then begin
                    jInfo.jmodifiedAt := subData.JsonValue.Value;
                  end else begin

                  end;
                end;
                jInfoList.add(jInfo);
              end;
              if jInfoList.Count > 0 then begin
//                isDBUpdate := True;
//                mzLog('�������� ����Ʈ ����: '+ IntToStr(jInfoList.Count));
              end;
            end;
          end;
        end;
      end;
    end;

    //DB������Ʈ �κ�
    //������ ������ ������ �μ�Ʈ�Ұ���
    if car_No = '' then begin
      if (qryThd.Connection.Connected = True) and (isDBUpdate = False) then begin
        try
          qryThd.Connection.BeginTrans;
          qryThd.Close;
          qryThd.SQL.Clear;
          qryThd.SQL.Add('Delete From VisitInfo_SmartVillage');
          qryThd.ExecSQL;

          for i := 0 to jInfoList.Count-1 do begin
            jInfo := jInfoList[i];
            qryThd.SQL.Text := 'Insert INTO VisitInfo_SmartVillage (vtype, vcarno, vstartDt, vendDt, vmodifiedAt, vupdateDt) VALUES (:v1, :v2, :v3, :v4, :v5, :v6)';
            qryThd.Parameters.ParamByName('v1').Value := jInfo.jtype;
            qryThd.Parameters.ParamByName('v2').Value := jInfo.jcar_no;
            qryThd.Parameters.ParamByName('v3').Value := jInfo.jstartDt;
            qryThd.Parameters.ParamByName('v4').Value := jInfo.jendDt;
            qryThd.Parameters.ParamByName('v5').Value := jInfo.jmodifiedAt;
            qryThd.Parameters.ParamByName('v6').Value := nowDate;
            qryThd.ExecSQL;
          end;
          qryThd.Connection.CommitTrans;
          mzLog('���̺� �����ͻ���/���� ����: '+ IntToStr(jInfoList.Count));
          Result := True;
        except on E: Exception do
          begin
            mzLog(e.Message);
            qryThd.Connection.RollbackTrans;
          end;
        end;
      end;
    end else begin
      //����� ���� �޾ƿ°Ϳ� ���� ������ ������ True ������ False
      for i := 0 to jInfoList.Count-1 do begin
        jInfo := jInfoList[i];
        //jInfoList.IndexOf()
        if jInfo.jcar_no = car_No then begin
          if (nowDate >= jInfo.jstartDt) and (nowDate <= jInfo.jendDt) then begin
            Result := True;
            mzLog('�������� ��ȿ�Ⱓ ����');
          end else begin
            Result := False;
            mzLog('�������� ��ȿ�Ⱓ ����!, '+jInfo.jstartDt + '~' + jInfo.jendDt);
          end;
        end;
      end;
    end;
  finally
    jInfoList.Clear;
  end;







end;

//function TVillageThread.GiveOutCarData: string;  //exeTag = 3
//begin
//  try
//    try
//      Result := '';
//      idHTTP.Request.ContentType := 'application/json';
////      idHttp.Request.CustomHeaders.Values['Authorization'] := 'Bearer ';
//      sendStrs.Clear;
//      sendStrs.Values[v1] := myVillage.villageId;
//      sendStrs.Values[v2] := myVillage.inOutType;
//      sendStrs.Values[v3] := myVillage.carNo;
//      sendStrs.Values[v4] := myVillage.eventDt;
//      idHttp.Post(APTNER_ADDRESS_INCAR,sendStrs);
//      ResponseCodeLog('����',idHttp.ResponseCode);
////      ZeroMemory(Pointer(villageId.recvArr),Length(villageId.recvArr) * SizeOf(string));
//      Result := IntToStr(idHttp.ResponseCode);
//      mzLog(Result);
//    finally
//      LHandler.InputBuffer.Clear;
//    end;
//  except on E: Exception do begin
//    Result := '';
//    mzLog(e.Message);
//  end;
//  end;
//end;

procedure TVillageThread.mzLog(inMsg: aString);
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
      sFile := '[' + aString(FormatDateTime('hh:nn:ss', Now)) + '] ' + '<����Ʈ������> ' + inMsg + #13 + #10;
      FileWrite(nFile, PAnsichar(sFile)^, Length(sFile));
      FileClose(nFile);
   end;
end;

function TVillageThread.ResponseCodeLog(inOutName: string; code: Integer): Boolean;
begin
  case code of
    200:
      mzLog(inOutName+':����');
    else
      mzLog(inOutName+':�� �� ���� ����! ' + IntToStr(idHttp.ResponseCode));
  end;

end;

procedure TVillageThread.tcpSocketCreate;
begin
  try
    if idHttp <> nil then FreeAndNil(idHttp);
    idHttp := TIdHTTP.Create(nil);
    LHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
    idHttp.IOHandler := LHandler;
    idHttp.ConnectTimeout := 3000;
    idHttp.ReadTimeout := 5000;
    idHttp.HandleRedirects := True; // ������ ó�� ��û
    idHttp.AllowCookies    := True; // ��Ű�� ����Ұ�� SSO ó�� ȿ��
    idHttp.Request.BasicAuthentication := False;
    idHttp.ProtocolVersion := pv1_1;
    idHttp.HTTPOptions := [hoForceEncodeParams];
    idHttp.Request.CharSet := 'utf-8';
    idHttp.Request.ContentType := 'application/json;charset=utf-8';
//    idHttp.Request.Connection      := 'Keep-Alive';
//    idHttp.Request.ProxyConnection := 'Keep-Alive';
//    idHttp.Request.CacheControl    := 'no-cache'; // ��ȸ���̹Ƿ� ĳ�� ���ʿ�
//    idHttp.Response.KeepAlive      := True; // ��������
//    idHttp.Request.UserAgent       := 'Mozilla/3.0 (compatible; Indy Library)';

//    villageId.jsObj := TJSONObject.Create;
    sendStrs := TStringList.Create;
    villageQue := TQueue<TVillageInfo>.Create;
    mzLog('���ϰ�ü �����Ϸ�');
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
