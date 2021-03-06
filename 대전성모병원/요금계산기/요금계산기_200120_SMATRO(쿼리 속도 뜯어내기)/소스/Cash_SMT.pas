unit Cash_SMT;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, sButton, AdvEdit, sLabel,
  Vcl.OleCtrls, SMTPAYAXLib_TLB;

type
  TfrmCash_SMT = class(TForm)
    Panel1: TPanel;
    sLabel1: TsLabel;
    Panel3: TPanel;
    lbVan: TLabel;
    Panel2: TPanel;
    edtCardName: TAdvEdit;
    edtJumNo: TAdvEdit;
    edtAuthNo: TAdvEdit;
    edtAuthDate: TAdvEdit;
    edtMsg: TAdvEdit;
    btnCancel: TsButton;
    tEvent: TTimer;
    m_pPay2: TPay;
    procedure FormShow(Sender: TObject);
    procedure tEventTimer(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure m_pPay2RecvMSG(Sender: TObject; const strMSG: WideString;
      nSize: Integer);
    procedure m_pPay2RecvLastTransData(Sender: TObject; nResultCode: Integer;
      const strLastTranCode: WideString);
    procedure m_pPay2CompletedJob(Sender: TObject; nResultCode: Integer;
      const strMSG: WideString);
    procedure m_pPay2CompletedPrint(Sender: TObject; nPrintedCount: Integer);
  private
    { Private declarations }
    //ADD 20.03.02 smartro van사 추가
    procedure MakeTrade(nType : Integer);
    procedure LOG(strData : String);
    procedure LOGPRINT(nIdx : Integer; strTitle : String ; strData : String);
    Procedure MakePrintData(RecvData : String);  // 영수증 출력 DATA
  public
    { Public declarations }
    //ADD 20.03.02 smartro van사 추가
    procedure ReqTrade(nType : Integer);
    procedure TradeMain(strTradeNum : String);
  end;
   const
  m_strTitleReq: Array[0..27] of String = (
    'TITLE START',
    '거래 승인 요청',
    '거래 취소 요청',
    '거래승인 + 보너스누적승인 요청',
    '거래취소 + 보너스누적취소 요청',
    '보너스 조회 요청',
    '보너스 이용 요청',
    '이용 취소 요청',
    '보너스 누적 요청',
    '누적 취소 요청',
    '수표조회 요청',
    '미전송결과 요청',

    '서명 요청',
    '번호 요청',
    '사업자 정보 요청',
    '단말기 특수 출력 요청',
    '영수증 인쇄(거래영수증) 요청',
    '영수증 인쇄(소득공제영수증) 요청',
    '영수증 인쇄(정산용영수증) 요청',
    '금전함열기 요청',
    '기타 거래(단말기에 요청) 요청',
    '이미지 업로드(POS->CAT) 요청',
    '인쇄 데이터 및 설정 데이터 요청',

    '연결 확인 요청',
    '단말기 상태 정보 요청',
    '최종작업요청(승인)',
	'최종작업요청(취소)',

    'TITLE END'
  );

  m_strTitleRes: Array[0..27] of String =
  (
    'TITLE START',
    '거래 승인 응답',
    '거래 취소 응답',
    '거래승인 + 보너스누적승인 응답',
    '거래취소 + 보너스누적취소 응답',
    '보너스 조회 응답',
    '보너스 이용 응답',
    '이용 취소 응답',
    '보너스 누적 응답',
    '누적 취소 응답',
    '수표조회 응답',
    '미전송결과 응답',

    '서명 응답',
    '번호 응답',
    '사업자 정보 응답',
    '단말기 특수 출력 응답',
    '영수증 인쇄(거래영수증) 응답',
    '영수증 인쇄(소득공제영수증) 응답',
    '영수증 인쇄(정산용영수증) 응답',
    '금전함열기 응답',
    '기타 거래(단말기에 요청) 응답',
    '이미지 업로드(POS->CAT) 응답',
    '인쇄 데이터 및 설정 데이터 응답',

    '연결 확인 응답',
    '단말기 상태 정보 응답',

    '최종작업응답(승인)',
	'최종작업응답(취소)',

    'TITLE END'
  );

var
  frmCash_SMT: TfrmCash_SMT;
  bClose: Boolean = False;
//  m_raTradeType : integer;
//  m_strItemList : String;
//  m_bIsPortOpen : boolean;
//  m_nType : integer;

implementation
uses
  Global,Tables, Smartro;

{$R *.dfm}

procedure TfrmCash_SMT.btnCancelClick(Sender: TObject);
var
  sData, sError: aString;
  pError: PAnsiChar;
  nResult: Integer;
begin
  if bGoodCashReceipt then
  begin
    InspectionLog('### 근무자 현금영수증 발행취소 ###');
    LOGPRINT(LOG_START, '사용자 취소', '');
    m_pPay2.CMDReqCancel();
    LOGPRINT(LOG_END, '사용자 취소', '');
    bClose:= True;
    bGoodCashReceipt := False;
  end;
  ModalResult := mrCancel;
end;

procedure TfrmCash_SMT.FormShow(Sender: TObject);
var
  nResult, nVat: Integer;
  pError: PAnsiChar;
  sData, sError: aString;
begin
  try
    InspectionLog('### 현금영수증 발행시작 ###');
    m_raTradeType := 0;
    bClose:= False;
    tEvent.Enabled:= false;
    bGoodCashReceipt := false;
    ReqTrade(nTRADEType); //거래 타입 (승인, 취소...)
  finally
//    FreeMem(pError);
  end;
end;

procedure TfrmCash_SMT.LOG(strData: String);
var
	strOldLog : String;
	strNewLog : String;
begin
    //
end;

procedure TfrmCash_SMT.LOGPRINT(nIdx: Integer; strTitle, strData: String);
var
    strMSG : String;
begin
    if(nIdx = LOG_START) Then
    begin
        strMSG := '================================================';
        LOG(strMSG);
        strMSG := format('[%s] [%s]', [strTitle, 'START']);
    end
    else if(nIdx = LOG_END) Then
    begin
        strMSG := format('[%s] [%s]', [strTitle, 'END']);
        LOG(strMSG);
        strMSG := '================================================';
        bCreditLoad:= True;
    end
    else if(nIdx = LOG_DATA) Then
    begin
        strMSG := format('[%s] %s', [strTitle, strData]);
    end
    else if(nIdx = LOG_RES_DATA) Then
    begin
        strMSG := strData;
    end;
    //ShowMessage(strMSG);
    //ExceptLogging(strMSG);
    LOG(strMSG);
end;

procedure TfrmCash_SMT.MakePrintData(RecvData: String);
var
    strPrintData : String;
    nLineupIdx : Integer;
    strLineTmp : String;
    strNum : String;
begin
    strPrintData := '';
    strPrintData := RecvData;
    m_pPay2.CMDPrint(strPrintData);
end;

procedure TfrmCash_SMT.MakeTrade(nType: Integer);
var
    strFiller : String;
    strTmp : String;
begin
    if (nType = TRADE_APP) Or (nType = TRADE_APP_CAN) Then
    begin
        strTmp := IntToStr(nProcYogum);//m_edAMT.Text;
        if ( Length(strTmp) > 0) Then    // 사용 금액
        begin
            m_pPay2.CMDMakePair( '승인금액',strTmp);
        end;

        if(nType = TRADE_APP_CAN) Then    // 취소
        begin
            if (nPayType = 1) Then    // 취소 사유 (현금)
            begin;
                m_pPay2.CMDMakePair('취소 사유','1');
            end;
        end;

        strTmp := IntToStr(cashkind);//현금 거래시 구분 코드
        if ( Length(strTmp) > 0) Then    // 할부개월 및 사용구분
        begin
            m_pPay2.CMDMakePair('할부개월 및 사용구분', strTmp);
        end;
        // 거래 구분코드
        strTmp := format('%2.2d', [nTRADEType+1]);
        m_pPay2.CMDMakePair('거래구분코드', strTmp);
    end;

end;


procedure TfrmCash_SMT.m_pPay2CompletedJob(Sender: TObject;
  nResultCode: Integer; const strMSG: WideString);
var
  strServiceName : String;
  Card_Num : string;
  sRecv, sHex, sType, sCardNo, sAmt, sVat, sNo, sTime, sTime2,
  sCardName, sJumCode, sMsg, sCheck, sLocalPrt, sData, sReply: aString;
begin
  if (nResultCode = -50) then begin
    ExceptLogging(sLabel1.Caption+' 사용자 취소');
    Exit;
  end else if (nResultCode <> 1) Then	begin
    strBuffer := format('Error Code (%d) ErrMsg(%s)', [nResultCode, strMSG]);
    LOGPRINT(LOG_DATA, m_strTitleReq[m_nType], strBuffer);
    LOGPRINT(LOG_END, m_strTitleReq[m_nType], '');

    ShowMessage('SMARTRO 신용카드 모듈 Load가 실패했습니다.' + #13#10 + '기기 연결 상태 확인 후 요금계산기를 재실행하여 주세요.');
    InspectionLog('### Smartro 신용카드 모듈 Load 실패 ###-' + sMsg + ', ' + strBuffer);
    ExceptLogging('SMARTRO 모듈 로드중 에러 발생. 신용카드 기기 연동 해제 처리');

//    nCreditlinkage := False;
//    bCreditLoad:= False;
		exit;
//		ShowMessage(strMSG);
//    strBuffer := format('Error Code (%d) ErrMsg(%s)', [nResultCode, strMSG]);
//    LOGPRINT(LOG_DATA, m_strTitleReq[m_nType], strBuffer);
//    LOGPRINT(LOG_END, m_strTitleReq[m_nType], '');
//    InspectionLog('### Smartro 신용카드 모듈 Load 실패 ###-' + sMsg);
//    ShowMessage(strBuffer + #13#10 + '메시지 확인 후 다시 시도하여주세요!');
//    bGoodCashReceipt:= False;
//		exit;
	end;

	strServiceName := m_pPay2.GetResultByName('서비스 유형');
	if(strServiceName = '0102') Or (strServiceName = '2102') Or (strServiceName = '5202') Then // 거래 승인/ 거래 취소
	begin
    if (strServiceName = '5202') then  //단말기 정보
    begin
      try
        with dmTables.qryTemp do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Select * from ParkInfo ');
          Open;

          if RecordCount > 0 then
          begin
            //sCreditPrt := '';
            //sCreditPrt := FieldByName('ParkName').AsString +' 영수증';
          end;
        end;
      except
        on E: Exception do ExceptLogging('TfrmLogin.cmbManagerChange: ' + aString(E.Message));
      end;
      sMsg2 := '';
      sMsg2 := sMsg2 + '주소 : ' + m_pPay2.GetResultByName('가맹점주소') + LF + CR;
      sMsg2 := sMsg2 + '등록번호 : ' + m_pPay2.GetResultByName('사업자번호')+ LF + CR;
      sMsg2 := sMsg2 + '대표자명 : ' + m_pPay2.GetResultByName('대표자명')+ LF + CR;
      sMsg2 := sMsg2 + '전화번호 : ' + m_pPay2.GetResultByName('가맹점전화')+ LF + CR;
      InspectionLog('영수증 메시지 출력:' + #13#10 + strBuffer);
      bGoodCashReceipt:= True;
      Exit;
    end
    else if(strServiceName = '0102') Or (strServiceName = '2102') then
    begin
      //금액
      sAmt:= m_pPay2.GetResultByName('승인금액');
      //카드사명
      sCardName:= m_pPay2.GetResultByName('발급사');
       //카드번호
      sCardNo:= m_pPay2.GetResultByName('카드번호');
      //가맹점코드
      sJumCode:= m_pPay2.GetResultByName('가맹점번호');
      //승인번호
      sNo:= m_pPay2.GetResultByName('승인번호');
      //승인일시
      sTime:= m_pPay2.GetResultByName('매출일자');
      sTime2:= m_pPay2.GetResultByName('매출시간');

      if (m_raTradeType = 0)  then      //현금영수증 발행
      begin
         edtCardName.Text := sCardNo; //카드번호
         edtJumNo.Text := sJumCode;  //가맹점코드
         edtAuthNo.Text := sNo;      //승인번호
         edtAuthDate.Text := sTime; //승인일시
         sMsg := '현금영수증' + #13#10;
         sMsg:= sMsg + '카드종류: ' + sCardName + #13#10 +
                       '가맹번호: ' + sJumCode + #13#10;

         sMsg:= sMsg + '카드번호: ' + sCardNo + #13#10;
//         sMsg:= sMsg + '거래일시: ' + MG_StrToStr('20' + sTime, '####-##-##') +' '+ MG_StrToStr('20' + sTime2, '##:##:##') + #13#10 +
//                        '승인번호: ' + sNo + #13#10;
          //추가작업05.26
          sMsg:= sMsg + '거래일시: '+ Copy(sTime,1,4)+'-'+Copy(sTime,5,2)+'-'+Copy(sTime,7,2) +' '+ Copy(sTime2,1,2)+':'+Copy(sTime2,3,2)+':'+Copy(sTime2,5,2) + #13#10 +
                      '승인번호: ' + sNo + #13#10;


          if m_raTradeType = 0 then
          begin
            sMsg:= sMsg + '결제금액: ' + FormatFloat('#,##0', StrToInt(sAmt)) + '원' + #13#10;
          end
          else if m_raTradeType = 1 then
          begin
            sMsg:= sMsg + '결제금액: ' + '-' + FormatFloat('#,##0', StrToInt(sAmt)) + '원' + #13#10;
          end;

          with dmTables.qryMoneyProc do
          begin
            Close;
            SQL.Clear;
            SQL.Add('Select * from ParkInfo where ParkNo = :N1');
            Parameters.ParamByName('N1').Value := nCurrParkNo;
            Open;

            if RecordCount > 0 then
            begin
              sParkName := FieldByName('ParkName').AsString;
              sParkAddr := FieldByName('ParkAddr').AsString;
              sRegNo := FieldByName('RegNo').AsString;
              sAdmin := FieldByName('Admin').AsString;
              sTelephone := FieldByName('Telephone').AsString;
              sReceipt := FieldByName('Receipt').AsString;
            end;
          end;
          // 영수증인쇄...
          sCashReceipt := '';
          sCashReceipt := '========================================' + LF + LF + LF + CR + SO_WTP;
          sCashReceipt := sCashReceipt + '    영   수   증' + LF + LF + LF + CR + SI_WTP;

          if Length(sParkName) > 29 then
          begin
            sCashReceipt := sCashReceipt + '주차장명 : ' + Copy(sParkName, 1, 29) + LF + CR;

            if Length(sParkName) < 58 then
              sCashReceipt := sCashReceipt + '           ' + Copy
                (sParkName, 30, Length(sParkName) - 29) + LF + CR
            else
            begin
              if Length(sParkName) < 87 then
              begin
                sCashReceipt := sCashReceipt + '           ' + Copy(sParkName, 30, 29)
                  + LF + CR;
                sCashReceipt := sCashReceipt + '           ' + Copy
                  (sParkName, 60, Length(sParkName) - 58) + LF + CR;
              end
              else
              begin
                sCashReceipt := sCashReceipt + '           ' + Copy(sParkName, 30, 29)
                  + LF + CR;
                sCashReceipt := sCashReceipt + '           ' + Copy(sParkName, 59, 29)
                  + LF + CR;
                sCashReceipt := sCashReceipt + '           ' + Copy
                  (sParkName, 88, Length(sParkName) - 87) + LF + CR;
              end;
            end;
          end
          else
            sCashReceipt := sCashReceipt + '주차장명 : ' + sParkName + LF + CR;

          if Length(sParkAddr) > 29 then
          begin
            sCashReceipt := sCashReceipt + ' 주   소 : ' + Copy(sParkAddr, 1, 29) + LF + CR;

            if Length(sParkAddr) < 58 then
              sCashReceipt := sCashReceipt + '           ' + Copy
                (sParkAddr, 30, Length(sParkAddr) - 29) + LF + CR
            else
            begin
              if Length(sParkAddr) < 87 then
              begin
                sCashReceipt := sCashReceipt + '           ' + Copy(sParkAddr, 30, 29)
                  + LF + CR;
                sCashReceipt := sCashReceipt + '           ' + Copy
                  (sParkAddr, 60, Length(sParkAddr) - 58) + LF + CR;
              end
              else
              begin
                sCashReceipt := sCashReceipt + '           ' + Copy(sParkAddr, 30, 29)
                  + LF + CR;
                sCashReceipt := sCashReceipt + '           ' + Copy(sParkAddr, 59, 29)
                  + LF + CR;
                sCashReceipt := sCashReceipt + '           ' + Copy
                  (sParkAddr, 88, Length(sParkAddr) - 87) + LF + CR;
              end;
            end;
          end
          else
            sCashReceipt := sCashReceipt + ' 주   소 : ' + sParkAddr + LF + CR;

          sCashReceipt := sCashReceipt + '등록번호 : ' + sRegNo + LF + CR;

          if Length(sAdmin) > 29 then
          begin
            sCashReceipt := sCashReceipt + '대표자명 : ' + Copy(sAdmin, 1, 29) + LF + CR;
            sCashReceipt := sCashReceipt + '           ' + Copy
              (sAdmin, 30, Length(sAdmin) - 29) + LF + CR;
          end
          else
            sCashReceipt := sCashReceipt + '대표자명 : ' + sAdmin + LF + CR;

          sCashReceipt := sCashReceipt + '전화번호 : ' + sTelephone + LF + CR;
          sCashReceipt := sCashReceipt + '========================================' + LF + CR;
          sCashReceipt := sCashReceipt + sMsg;
          sCashReceipt := sCashReceipt + '========================================' + LF + CR;
          sCashReceipt := sCashReceipt + '입차일시 : ' + sNowInDate + ' ' + sNowInTime + LF + CR;
          sCashReceipt := sCashReceipt + '출차일시 : ' + sNowOutDate + ' ' + sNowOutTime + LF + CR;
          sCashReceipt := sCashReceipt + '주차시간 : ' + sCreditParkingTime + LF + CR;
          sCashReceipt := sCashReceipt + '근 무 자 : ' + sCurrMName + LF + CR;
          sCashReceipt := sCashReceipt + '차량번호 : ' + sNowLprCarNo1 + LF + CR;
          sCashReceipt := sCashReceipt + '========================================' + LF + CR;

          sLocalPrt := sCashReceipt + '                             [고객용]   ' + LF + CR;

          if Length(sReceipt) > 40 then
          begin
            sLocalPrt := sLocalPrt + Copy(sReceipt, 1, 40) + LF + CR;

            if Length(sReceipt) < 80 then
              sLocalPrt := sLocalPrt + Copy(sReceipt, 41, Length(sReceipt) - 40) + LF + CR
            else
            begin
              sLocalPrt := sLocalPrt + Copy(sReceipt, 41, 40) + LF + CR;
              sLocalPrt := sLocalPrt + Copy(sReceipt, 81, Length(sReceipt) - 80) + LF + CR;
            end;
          end
          else
            sLocalPrt := sLocalPrt + sReceipt + LF + CR;

          sLocalPrt := sLocalPrt + LF + LF + LF + LF + LF + LF + LF + LF + FullCut_WTP;
          sLocalPrt := sLocalPrt + sCashReceipt + '                             [보관용]   ' + LF + CR;

          if Length(sReceipt) > 40 then
          begin
            sLocalPrt := sLocalPrt + Copy(sReceipt, 1, 40) + LF + CR;

            if Length(sReceipt) < 80 then
              sLocalPrt := sLocalPrt + Copy(sReceipt, 41, Length(sReceipt) - 40) + LF + CR
            else
            begin
              sLocalPrt := sLocalPrt + Copy(sReceipt, 41, 40) + LF + CR;
              sLocalPrt := sLocalPrt + Copy(sReceipt, 81, Length(sReceipt) - 80) + LF + CR;
            end;
          end
          else
            sLocalPrt := sLocalPrt + sReceipt + LF + CR;

          edtMsg.Text :=  '정상처리되었습니다.';
          sCashReceipt:= sLocalPrt + LF + LF + LF + LF + LF + LF + LF + LF + FullCut_WTP;
          bClose:= True;
          bGoodCashReceipt:= True;
          InspectionLog('### 현금영수증 발행완료 ###');
      end;
      InspectionLog('영수증 메시지 출력:' + #13#10 + sCashReceipt);
    end;
	end
	else if(strServiceName = '5102') Then	// 서명 요청
	begin
		strBuffer := strBuffer + #13#10 + ' 응답코드 : '+ m_pPay2.GetResultByName('응답코드');
		strBuffer := strBuffer + #13#10 + ' MASTERKEY INDEX : '+ m_pPay2.GetResultByName('MASTERKEY INDEX');
		strBuffer := strBuffer + #13#10 + ' WORKING KEY : '+ m_pPay2.GetResultByName('WORKING KEY');
		strBuffer := strBuffer + #13#10 + ' 서명이미지정보 : '+ m_pPay2.GetResultByName('서명이미지정보');
		strBuffer := strBuffer + #13#10 + ' 사인이미지데이터 : '+ m_pPay2.GetResultByName('사인이미지데이터');
		strBuffer := strBuffer + #13#10 + ' 사인패드기기정보 : '+ m_pPay2.GetResultByName('사인패드기기정보');
		strBuffer := strBuffer + #13#10 + ' 해쉬코드 : '+ m_pPay2.GetResultByName('해쉬코드');
		strBuffer := strBuffer + #13#10 + ' 화면메세지 : '+ m_pPay2.GetResultByName('화면메세지');
	end
	else if(strServiceName = '9002') Then	// 연결 확인
	begin
		strBuffer := strBuffer + #13#10 + ' 응답코드 : '+ m_pPay2.GetResultByName('응답코드');
		strBuffer := strBuffer + #13#10 + ' 화면메세지 : '+ m_pPay2.GetResultByName('화면메세지');
    InspectionLog('연결 확인 메시지 :' + #13#10 + strBuffer);
    bCreditLoad:= True;
    Exit;
	end;

  LOGPRINT(LOG_RES_DATA, m_strTitleRes[m_nType], strBuffer);
  LOGPRINT(LOG_END, m_strTitleRes[m_nType], '');
  if nTRADEType = TRADE_LINK_CONFIRM then   //장비 연결 시 동작
  begin
     bCreditLoad := True;
  end
  else
  begin
     //카드 결제 오류 시
     if sTime = '' then
     begin
        bGoodCredit:= false;
        edtMsg.Text := '카드결제 오류';
     end;
     Close;
  end;
end;
procedure TfrmCash_SMT.m_pPay2CompletedPrint(Sender: TObject;
  nPrintedCount: Integer);
var
    strMSG : String;
begin
	if ( nPrintedCount = 0) Then
	begin
		//strMSG := '프린트가 정상적으로 처리 됐습니다';
    strMSG := '영수증이 정상적으로 처리 됐습니다';
	end
	else if (nPrintedCount = -1) Then
	begin
		strMSG := '프린트 전문이 상이 합니다.';
	end
	else
	begin
		strMSG := format('%d %s', [nPrintedCount, '장이 미프린팅 됐습니다'] );
	end;

  LOGPRINT(LOG_DATA, m_strTitleReq[m_nType], strMSG);
  LOGPRINT(LOG_END, m_strTitleReq[m_nType], '');
	ShowMessage(strMSG);
  bGoodCredit:= True;
  Close;
end;

procedure TfrmCash_SMT.m_pPay2RecvLastTransData(Sender: TObject;
  nResultCode: Integer; const strLastTranCode: WideString);
var
    strMSG : String;
begin
  if (nResultCode > 0) Then
	begin

	end
	else
	begin
		if (nResultCode = 0 ) Then
		begin
			strMSG := '저장되어 있는 최종 거래 내역이 없습니다';
		end
		else
		begin
			strMSG := '최종 거래 요청 오류 입니다';
		end;
	end;

	LOGPRINT(LOG_DATA, m_strTitleRes[m_nType], strMSG);
	LOGPRINT(LOG_END, m_strTitleRes[m_nType], '');
	ShowMessage(strMSG);
end;

procedure TfrmCash_SMT.m_pPay2RecvMSG(Sender: TObject; const strMSG: WideString;
  nSize: Integer);
begin
  LOGPRINT(LOG_DATA, m_strTitleRes[m_nType], strMSG);
  LOGPRINT(LOG_END, m_strTitleRes[m_nType], '');
  if m_raTradeType = 0 then
  begin
     edtMsg.Text := strMSG;
  end
  else if m_raTradeType = 1 then
  begin
     //frmCancel_SMT.edtMsg.Text := strMSG;
  end;
  InspectionLog(strMSG);
  bGoodCashReceipt:= False;
  bClose:= True;
  ShowMessage(strMSG + #13#10 + '메시지 확인 후 다시 시도하여주세요!');
  Close;
end;

procedure TfrmCash_SMT.ReqTrade(nType: Integer);
var
    strNum : String;
begin
    m_nType := nType;

    InspectionLog('거래승인종류 : ' + IntToStr(nType));

    MakeTrade(nType);   //거래 승인 함수

    if(nType = TRADE_APP) Then			// 거래 승인
    begin
        strNum := '0101';
    end
    else if(nType = TRADE_APP_CAN) Then	// 거래 취소
    begin
        strNum := '2101';
    end
    else if(nType = TRADE_APP_BONUS_ADD) Then	// 거래승인_보너스누적승인
    begin
        strNum := '0201';
    end
    else if(nType = TRADE_APP_BONUS_ADD_CAN) Then	// 거래취소_보너스누적취소
    begin
        strNum := '2201';
    end
    else if(nType = TRADE_APP_BONUS_CHECK) Then	// 보너스 조회
    begin
        strNum := '0301';
    end
    else if(nType = TRADE_BONUS_USED) Or (nType = TRADE_BONUS_USED_CAN) Then	// 보너스 이용 / 이용 취소
    begin
        strNum := '0303';
    end
    else if(nType = TRADE_BONUS_ADD) Or (nType = TRADE_BONUS_ADD_CAN) Then	// 보너스 누적 / 누적 취소
    begin
        strNum := '0305';
    end
    else if(nType = TRADE_CHEQUE_INFO) Then	//수표조회
    begin
        strNum := '0401';
    end
    else if(nType = TRADE_NON_TRANSMISSION) Then	// 미전송결과
    begin
        strNum := '9991';
    end
    else
    begin
        LOGPRINT(LOG_DATA, m_strTitleReq[m_nType], '없는 거래 입니다.');
        LOGPRINT(LOG_END, m_strTitleReq[m_nType], '');
        exit;
    end;

    TradeMain(strNum);
end;

procedure TfrmCash_SMT.tEventTimer(Sender: TObject);
var
  pHex, pRecv, pError: pAnsiChar;
  CMD, GCD, JCD, RCD: integer;
  nResult, nPos, nReplyCode: integer;
  sRecv, sHex, sType, sCardNo, sAmt, sVat, sNo, sTime,
  sCardName, sJumCode, sMsg, sCheck, sLocalPrt, sData, sReply: aString;
begin
  tEvent.Enabled:= False;
  getmem(pHex, 4096);
  getmem(pRecv, 4096);

  try
    nResult:= KGetEvent(CMD, GCD, JCD, RCD, pRecv, pHex);
    sRecv:= pRecv;
    sHex := pHex;
    nPos:= 0;
    InspectionLog('<<<(' + IntToStr(nResult) + ')' + sRecv);

    if sRecv = '' then
      Exit;

    if nResult >= 0 then
    begin
      nReplyCode:= StrToInt(Copy(sRecv, 3, 4));

      if (Pos('I1', sRecv) > 0) or (Pos('D1', sRecv) > 0) or (Pos('B1', sRecv) > 0) or
         (Pos('I2', sRecv) > 0) or (Pos('I4', sRecv) > 0) or (Pos('D2', sRecv) > 0) or (Pos('D4', sRecv) > 0) then
      begin
        if nReplyCode = 0 then
        begin
          bGoodCashReceipt:= True;

          if Pos('I1', sRecv) > 0 then
          begin
            //IC승인
            nPos:= Pos('I1', sRecv);
            sType:= 'I1';
            sMsg:= 'IC신용결제'+#13#10;
          end
          else
          if Pos('D1', sRecv) > 0 then
          begin
            //마그네틱승인
            nPos:= Pos('D1', sRecv);
            sType:= 'D1';
            sMsg:= '신용결제'+#13#10;
          end
          else
          if Pos('B1', sRecv) > 0 then
          begin
            //현금영수증
            nPos:= Pos('B1', sRecv);
            sType:= 'B1';
            sMsg:= '현금영수증'+#13#10;
          end
          else
          if Pos('I2', sRecv) > 0 then
          begin
            //IC승인당일취소
            nPos:= Pos('I2', sRecv);
            sType:= 'I2';
            sMsg:= 'IC신용결제취소'+#13#10;
          end
          else
          if Pos('I4', sRecv) > 0 then
          begin
            //IC승인전일취소
            nPos:= Pos('I4', sRecv);
            sType:= 'I4';
            sMsg:= 'IC신용결제취소'+#13#10;
          end
          else
          if Pos('D2', sRecv) > 0 then
          begin
            //마그네틱승인당일취소
            nPos:= Pos('D2', sRecv);
            sType:= 'D2';
            sMsg:= '신용결제취소'+#13#10;
          end
          else
          if Pos('D4', sRecv) > 0 then
          begin
            //마그네틱승인전일취소
            nPos:= Pos('D4', sRecv);
            sType:= 'D4';
            sMsg:= '신용결제취소'+#13#10;
          end;

          if Copy(sRecv, nPos+2, 4) = '9999' then
          begin
            //단말기에서 취소...
            InspectionLog('### 단말기에서 취소 ###');
            Close;
            Exit;
          end;
          InspectionLog(sMsg);

          //카드번호
          sCardNo:= MG_StrTrim(Copy(sRecv, nPos+15, 40), ' ');

          //직전거래취소 체크위해...
          sCheck:= MG_StrTrim(Copy(sRecv, nPos+14, 41), ' ');

          //금액
          sAmt:= MG_StrTrim(Copy(sRecv, nPos+57, 8), ' ');
          //부가세
          sVat:= MG_StrTrim(Copy(sRecv, nPos+73, 8), ' ');
          //승인번호
          sNo:= MG_StrTrim(Copy(sRecv, nPos+81, 12), ' ');
          edtAuthNo.Text:= sNo;

          //승인일시
          sTime:= MG_StrTrim(Copy(sRecv, nPos+93, 12), ' ');
          edtAuthDate.Text:= Copy(sTime, 1, 6);

          //카드사명
          sCardName:= MG_StrTrim(Copy(sRecv, nPos+108, 20), ' ');
          edtCardName.Text:= sCardName;

          //가맹점코드
          sJumCode:= MG_StrTrim(Copy(sRecv, nPos+128, 12), ' ');
          edtJumNo.Text:= sJumCode;

          sMsg:= sMsg + '카드종류: ' + sCardName + #13#10 +
                        '가맹번호: ' + sJumCode + #13#10;

          if sType = 'B1' then
            sMsg:= sMsg + '식별번호: ' + Copy(sCardNo, 1, 3) + '-' + '****' + '-' + Copy(sCardNo, 8, 4) + #13#10
          else
            sMsg:= sMsg + '카드번호: ' + Copy(sCardNo, 1, Pos('=', sCardNo)-1) + #13#10;

          sMsg:= sMsg + '거래일시: ' + MG_StrToStr('20' + sTime, '####-##-## ##:##:##') + #13#10 +
                        '승인번호: ' + sNo + #13#10;
          if (sType = 'I1') or (sType = 'D1') or (sType = 'B1') then
          begin
            sMsg:= sMsg + '결제금액: ' + FormatFloat('#,##0', StrToInt(sAmt)) + '원' + #13#10;
          end
          else
          begin
            sMsg:= sMsg + '결제금액: ' + '-' + FormatFloat('#,##0', StrToInt(sAmt)) + '원' + #13#10;
          end;
//          if (sType = 'I1') or (sType = 'D1') or (sType = 'B1') then
//          begin
//            sMsg:= sMsg + '거래금액: ' + FormatFloat('#,##0', StrToInt(sAmt)-StrToInt(sVat)) + '원' + #13#10 +
//                          '부 가 세: ' + FormatFloat('#,##0', StrToInt(sVat)) + '원' + #13#10 +
//                          '결제금액: ' + FormatFloat('#,##0', StrToInt(sAmt)) + '원' + #13#10;
//          end
//          else
//          begin
//            sMsg:= sMsg + '거래금액: ' + '-' + FormatFloat('#,##0', StrToInt(sAmt)-StrToInt(sVat)) + '원' + #13#10 +
//                          '부 가 세: ' + '-' + FormatFloat('#,##0', StrToInt(sVat)) + '원' + #13#10 +
//                          '결제금액: ' + '-' + FormatFloat('#,##0', StrToInt(sAmt)) + '원' + #13#10;
//          end;

          //단말기에서 직전거래 취소를 했으면...
          //if sCardName = sCheck then
          //  sMsg:= sMsg + '### 직전거래 취소 ###' + #13#10;
          with dmTables.qryMoneyProc do
          begin
            Close;
            SQL.Clear;
            SQL.Add('Select * from ParkInfo where ParkNo = :N1');
            Parameters.ParamByName('N1').Value := nCurrParkNo;
            Open;

            if RecordCount > 0 then
            begin
              sParkName := FieldByName('ParkName').AsString;
              sParkAddr := FieldByName('ParkAddr').AsString;
              sRegNo := FieldByName('RegNo').AsString;
              sAdmin := FieldByName('Admin').AsString;
              sTelephone := FieldByName('Telephone').AsString;
              sReceipt := FieldByName('Receipt').AsString;
            end;
          end;
          // 영수증인쇄...
          sCashReceipt := '';
          sCashReceipt := '========================================' + LF + LF + LF + CR + SO_WTP;
          sCashReceipt := sCashReceipt + '    영   수   증' + LF + LF + LF + CR + SI_WTP;

          if Length(sParkName) > 29 then
          begin
            sCashReceipt := sCashReceipt + '주차장명 : ' + Copy(sParkName, 1, 29) + LF + CR;

            if Length(sParkName) < 58 then
              sCashReceipt := sCashReceipt + '           ' + Copy
                (sParkName, 30, Length(sParkName) - 29) + LF + CR
            else
            begin
              if Length(sParkName) < 87 then
              begin
                sCashReceipt := sCashReceipt + '           ' + Copy(sParkName, 30, 29)
                  + LF + CR;
                sCashReceipt := sCashReceipt + '           ' + Copy
                  (sParkName, 60, Length(sParkName) - 58) + LF + CR;
              end
              else
              begin
                sCashReceipt := sCashReceipt + '           ' + Copy(sParkName, 30, 29)
                  + LF + CR;
                sCashReceipt := sCashReceipt + '           ' + Copy(sParkName, 59, 29)
                  + LF + CR;
                sCashReceipt := sCashReceipt + '           ' + Copy
                  (sParkName, 88, Length(sParkName) - 87) + LF + CR;
              end;
            end;
          end
          else
            sCashReceipt := sCashReceipt + '주차장명 : ' + sParkName + LF + CR;

          if Length(sParkAddr) > 29 then
          begin
            sCashReceipt := sCashReceipt + ' 주   소 : ' + Copy(sParkAddr, 1, 29) + LF + CR;

            if Length(sParkAddr) < 58 then
              sCashReceipt := sCashReceipt + '           ' + Copy
                (sParkAddr, 30, Length(sParkAddr) - 29) + LF + CR
            else
            begin
              if Length(sParkAddr) < 87 then
              begin
                sCashReceipt := sCashReceipt + '           ' + Copy(sParkAddr, 30, 29)
                  + LF + CR;
                sCashReceipt := sCashReceipt + '           ' + Copy
                  (sParkAddr, 60, Length(sParkAddr) - 58) + LF + CR;
              end
              else
              begin
                sCashReceipt := sCashReceipt + '           ' + Copy(sParkAddr, 30, 29)
                  + LF + CR;
                sCashReceipt := sCashReceipt + '           ' + Copy(sParkAddr, 59, 29)
                  + LF + CR;
                sCashReceipt := sCashReceipt + '           ' + Copy
                  (sParkAddr, 88, Length(sParkAddr) - 87) + LF + CR;
              end;
            end;
          end
          else
            sCashReceipt := sCashReceipt + ' 주   소 : ' + sParkAddr + LF + CR;

          sCashReceipt := sCashReceipt + '등록번호 : ' + sRegNo + LF + CR;

          if Length(sAdmin) > 29 then
          begin
            sCashReceipt := sCashReceipt + '대표자명 : ' + Copy(sAdmin, 1, 29) + LF + CR;
            sCashReceipt := sCashReceipt + '           ' + Copy
              (sAdmin, 30, Length(sAdmin) - 29) + LF + CR;
          end
          else
            sCashReceipt := sCashReceipt + '대표자명 : ' + sAdmin + LF + CR;

          sCashReceipt := sCashReceipt + '전화번호 : ' + sTelephone + LF + CR;
          sCashReceipt := sCashReceipt + '========================================' + LF + CR;
          sCashReceipt := sCashReceipt + sMsg;
          sCashReceipt := sCashReceipt + '========================================' + LF + CR;
          sCashReceipt := sCashReceipt + '입차일시 : ' + sNowInDate + ' ' + sNowInTime + LF + CR;
          sCashReceipt := sCashReceipt + '출차일시 : ' + sNowOutDate + ' ' + sNowOutTime + LF + CR;
          sCashReceipt := sCashReceipt + '주차시간 : ' + sCreditParkingTime + LF + CR;
          sCashReceipt := sCashReceipt + '근 무 자 : ' + sCurrMName + LF + CR;
          sCashReceipt := sCashReceipt + '차량번호 : ' + sNowLprCarNo1 + LF + CR;
          sCashReceipt := sCashReceipt + '========================================' + LF + CR;

          sLocalPrt := sCashReceipt + '                             [고객용]   ' + LF + CR;

          if Length(sReceipt) > 40 then
          begin
            sLocalPrt := sLocalPrt + Copy(sReceipt, 1, 40) + LF + CR;

            if Length(sReceipt) < 80 then
              sLocalPrt := sLocalPrt + Copy(sReceipt, 41, Length(sReceipt) - 40) + LF + CR
            else
            begin
              sLocalPrt := sLocalPrt + Copy(sReceipt, 41, 40) + LF + CR;
              sLocalPrt := sLocalPrt + Copy(sReceipt, 81, Length(sReceipt) - 80) + LF + CR;
            end;
          end
          else
            sLocalPrt := sLocalPrt + sReceipt + LF + CR;

          sLocalPrt := sLocalPrt + LF + LF + LF + LF + LF + LF + LF + LF + FullCut_WTP;
          sLocalPrt := sLocalPrt + sCashReceipt + '                             [보관용]   ' + LF + CR;

          if Length(sReceipt) > 40 then
          begin
            sLocalPrt := sLocalPrt + Copy(sReceipt, 1, 40) + LF + CR;

            if Length(sReceipt) < 80 then
              sLocalPrt := sLocalPrt + Copy(sReceipt, 41, Length(sReceipt) - 40) + LF + CR
            else
            begin
              sLocalPrt := sLocalPrt + Copy(sReceipt, 41, 40) + LF + CR;
              sLocalPrt := sLocalPrt + Copy(sReceipt, 81, Length(sReceipt) - 80) + LF + CR;
            end;
          end
          else
            sLocalPrt := sLocalPrt + sReceipt + LF + CR;

          sCashReceipt:= sLocalPrt + LF + LF + LF + LF + LF + LF + LF + LF + FullCut_WTP;
          bClose:= True;
          InspectionLog('### 현금영수증 발행완료 ###');
          Close;
        end
        else
        begin
          sReply:= Copy(sRecv, nPos+6, 64);
          edtMsg.Text:= sReply;
          InspectionLog(sReply);
          bGoodCashReceipt:= False;
          bClose:= True;
          ShowMessage(sReply + #13#10 + '메시지 확인 후 다시 시도하여주세요!');
          Close;
        end;
      end
      else
      begin
        if (nReplyCode <> 9993) and (nReplyCode <> 9994) then
        begin
          sReply:= Copy(sRecv, 7, 64);
          edtMsg.Text:= sReply;
          InspectionLog(sReply);
          bGoodCashReceipt:= False;
          bClose:= True;
          ShowMessage(sReply + #13#10 + '메시지 확인 후 다시 시도하여주세요!');
          Close;
        end;
      end;
    end;
  finally
    freeMem(pHex);
    freeMem(pRecv);

    if not bClose then
      tEvent.Enabled:= True;
  end;
end;

procedure TfrmCash_SMT.TradeMain(strTradeNum: String);
begin
    LOGPRINT(LOG_START, m_strTitleReq[m_nType], '');
    try
      if  m_nType = TRADE_LINK_CONFIRM  then
      begin
          try

             m_pPay2.CMDReqCatSend(strTradeNum);
          except
             bCreditLoad:= False;
             Exit;
          end;
      end
      else
      begin
          try
             m_pPay2.CMDReqSend(strTradeNum);
          except
             bCreditLoad:= False;
             Exit;
          end;
          bGoodCashReceipt := True;
      end;
    Except
        on E: Exception do
        ExceptLogging('TfrmCash_SMT.TradeMain: ' + aString(E.Message));
    end;

end;
//begin
//    LOGPRINT(LOG_START, m_strTitleReq[m_nType], '');
//    try
//      if bCreditLoad then   //장비 연결 시 동작
//      begin
//        m_pPay2.CMDReqSend(strTradeNum);
//        bGoodCashReceipt := True;
//      end
//      else
//      begin
//         bGoodCashReceipt:= False;
//      end;
//    Except
//        on E: Exception do
//        ExceptLogging('TfrmCash_SMT.TradeMain: ' + aString(E.Message));
//    end;
//end;

end.
