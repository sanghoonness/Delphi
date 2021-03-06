unit Cancel_SMT;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, sButton, AdvEdit, sLabel, Vcl.ExtCtrls, Vcl.Mask, AdvSpin,
  Vcl.OleCtrls, SMTPAYAXLib_TLB;

type
  TfrmCancel_SMT = class(TForm)
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
    Label1: TLabel;
    edtPrvAuthNo: TAdvEdit;
    edtPrvAuthDate: TAdvEdit;
    btnCreditCancel: TsButton;
    edtPrvAmt: TAdvSpinEdit;
    tEvent: TTimer;
    m_pPay: TPay;
    procedure btnCreditCancelClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure tEventTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure m_pPayCompletedJob(Sender: TObject; nResultCode: Integer;
      const strMSG: WideString);
    procedure m_pPayRecvMSG(Sender: TObject; const strMSG: WideString;
      nSize: Integer);
  private
    { Private declarations }
    //ADD 20.02.27 smartro van사 추가
    procedure MakeTrade(nType : Integer);
    procedure LOG(strData : String);
    procedure LOGPRINT(nIdx : Integer; strTitle : String ; strData : String);
    Procedure MakePrintData(RecvData : String);  // 영수증 출력 DATA
  public
    { Public declarations }
    //ADD 20.02.27 smartro van사 추가
    procedure ReqTrade(nType : Integer);
    procedure TradeMain(strTradeNum : String);
  end;

var
  frmCancel_SMT: TfrmCancel_SMT;
  bClose: Boolean = False;

implementation
uses
  Global, Tables, Credit_SMT;

{$R *.dfm}

procedure TfrmCancel_SMT.btnCancelClick(Sender: TObject);
var
  sData, sError: aString;
  pError: PAnsiChar;
  nResult: Integer;
begin
  try
    InspectionLog('### 근무자 신용카드 결제취소 취소 ###');
    if bGoodCredit then
    begin
      LOGPRINT(LOG_START, '사용자 취소', '');
      m_pPay.CMDReqCancel();
      LOGPRINT(LOG_END, '사용자 취소', '');
      bClose:= True;
    end;
      bGoodCredit := False;
    Close;
  finally
//    FreeMem(pError);
  end;
end;

procedure TfrmCancel_SMT.btnCreditCancelClick(Sender: TObject);
var
  sData, sError: aString;
  pError: PAnsiChar;
  nAmt, nVat, nResult: Integer;
begin
  PrvAuthNo := edtPrvAuthNo.Text;
  PrvAuthDate := edtPrvAuthDate.Text;
  PrvAmt := edtPrvAmt.Text;
  ReqTrade(TRADE_APP_CAN);     //거래 취소
end;

procedure TfrmCancel_SMT.FormShow(Sender: TObject);
begin
  InspectionLog('### 신용카드 승인취소 시작 ###');
  bClose:= False;
  m_raTradeType := 1;
  edtPrvAuthDate.Text := FormatDateTime('yyyymmdd', now);
end;

procedure TfrmCancel_SMT.LOG(strData: String);
begin

end;

procedure TfrmCancel_SMT.LOGPRINT(nIdx: Integer; strTitle, strData: String);
var
    strMSG : String;
begin
    if(nIdx = LOG_START) Then
    begin
        strMSG := '================================================';
        //LOG(strMSG);
        strMSG := format('[%s] [%s]', [strTitle, 'START']);
    end
    else if(nIdx = LOG_END) Then
    begin
        strMSG := format('[%s] [%s]', [strTitle, 'END']);
        //LOG(strMSG);
        strMSG := '================================================';
    end
    else if(nIdx = LOG_DATA) Then
    begin
        strMSG := format('[%s] %s', [strTitle, strData]);
    end
    else if(nIdx = LOG_RES_DATA) Then
    begin
        strMSG := strData;
    end;
    ExceptLogging(strMSG);
    //LOG(strMSG);
end;

procedure TfrmCancel_SMT.MakePrintData(RecvData: String);
var
    strPrintData : String;
    nLineupIdx : Integer;
    strLineTmp : String;
    strNum : String;
begin
    strPrintData := '';
    strPrintData := RecvData;
end;

procedure TfrmCancel_SMT.MakeTrade(nType: Integer);
var
    strFiller : String;
    strTmp : String;
begin
    if(nType = TRADE_APP) Or (nType = TRADE_APP_CAN) Then
    begin
        if(nType = TRADE_APP) Then   //거래 승인
        begin
          strTmp := IntToStr(nProcYogum);//m_edAMT.Text;
          if ( Length(strTmp) > 0) Then    // 사용 금액
          begin
              m_pPay.CMDMakePair( '승인금액',strTmp);
          end;
        end;

        if(nType = TRADE_APP_CAN) Then    // 거래 승인 취소
        begin
            strTmp := PrvAmt;//IntToStr(nProcYogum);//m_edAMT.Text;
            if ( Length(strTmp) > 0) Then    // 사용 금액
            begin
                m_pPay.CMDMakePair( '승인금액',strTmp);
            end;
            strTmp := PrvAuthNo;
            if ( Length(strTmp) > 0) Then    // 승인번호
            begin
                m_pPay.CMDMakePair('승인번호',strTmp);
            end
            else
            begin
               ShowMessage('원승인번호를 입력하세요');
               Exit;
            end;
            strTmp := PrvAuthDate;
            if ( Length(strTmp) > 0) Then    // 원거래일자
            begin
                m_pPay.CMDMakePair('원거래일자',strTmp);
            end
            else
            begin
               ShowMessage('원승인일자를 입력하세요');
               Exit;
            end;
            strTmp := PrvAmt;
            if (Length(strTmp) > 0) Then    // 취소 사유 (현금)
            begin;
                m_pPay.CMDMakePair('취소 사유','1');
            end
            else
            begin
               ShowMessage('원결제금액를 입력하세요');
               Exit;
            end;
        end;
        // 거래 구분코드
        strTmp := format('%2.2d', [1]);
        m_pPay.CMDMakePair('거래구분코드', strTmp);

    end;
end;

procedure TfrmCancel_SMT.m_pPayCompletedJob(Sender: TObject;
  nResultCode: Integer; const strMSG: WideString);
var
  strServiceName : String;
  Card_Num : string;
  sRecv, sHex, sType, sCardNo, sAmt, sVat, sNo, sTime, sTime2,
  sCardName, sJumCode, sMsg, sCheck, sLocalPrt, sData, sReply: aString;
	//strBuffer : String;
begin

  if(nResultCode <> 1) Then
	begin
    strBuffer := format('Error Code (%d) ErrMsg(%s)', [nResultCode, strMSG]);
    LOGPRINT(LOG_DATA, m_strTitleReq[m_nType], strBuffer);
    LOGPRINT(LOG_END, m_strTitleReq[m_nType], '');

    ShowMessage('SMARTRO 신용카드 모듈 Load가 실패했습니다.' + #13#10 + '기기 연결 상태 확인 후 요금계산기를 재실행하여 주세요.');
    InspectionLog('### Smartro 신용카드 모듈 Load 실패 ###-' + sMsg + ', ' + strBuffer);
    ExceptLogging('SMARTRO 모듈 로드중 에러 발생. 신용카드 기기 연동 해제 처리');
    nCreditlinkage := False;
    bCreditLoad:= False;
		exit;
//		//ShowMessage(strMSG);
//    strBuffer := format('Error Code (%d) ErrMsg(%s)', [nResultCode, strMSG]);
//    LOGPRINT(LOG_DATA, m_strTitleReq[m_nType], strBuffer);
//    LOGPRINT(LOG_END, m_strTitleReq[m_nType], '');
//    InspectionLog('### Smartro 신용카드 모듈 Load 실패 ###-' + sMsg);
//    ShowMessage(strBuffer + #13#10 + '메시지 확인 후 다시 시도하여주세요!');
//    bCreditLoad:= False;
//		exit;
	end;

	strServiceName := m_pPay.GetResultByName('서비스 유형');
	if(strServiceName = '0102') Or (strServiceName = '2102') Or (strServiceName = '5202') Then // 거래 승인/ 거래 취소
	begin
    if (strServiceName = '5202') then  //단말기 정보
    begin
      sMsg2 := '';
      sMsg2 := sMsg2 + '주소 : ' + m_pPay.GetResultByName('가맹점주소') + LF + CR;
      sMsg2 := sMsg2 + '등록번호 : ' + m_pPay.GetResultByName('사업자번호')+ LF + CR;
      sMsg2 := sMsg2 + '대표자명 : ' + m_pPay.GetResultByName('대표자명')+ LF + CR;
      sMsg2 := sMsg2 + '전화번호 : ' + m_pPay.GetResultByName('가맹점전화')+ LF + CR;
      InspectionLog('영수증 메시지 출력:' + #13#10 + strBuffer);
      bGoodCredit:= True;
      Exit;
    end
    else if(strServiceName = '0102') Or (strServiceName = '2102') then
    begin
      //금액
      sAmt:= m_pPay.GetResultByName('승인금액');
       //카드번호
      sCardNo:= m_pPay.GetResultByName('카드번호');
      //승인번호
      sNo:= m_pPay.GetResultByName('승인번호');
      //승인일시
      sTime:= m_pPay.GetResultByName('매출일자');
      sTime2:= m_pPay.GetResultByName('매출시간');
      //카드사명
      sCardName:= m_pPay.GetResultByName('발급사');
      //가맹점코드
      sJumCode:= m_pPay.GetResultByName('가맹점번호');

      if m_raTradeType = 1  then     //카드결제 취소
      begin
        frmCancel_SMT := TfrmCancel_SMT.Create(Self);  //카드취소 폼
        //승인번호
        frmCancel_SMT.edtAuthNo.Text:= sNo;
        //승인일시
        frmCancel_SMT.edtAuthDate.Text:= sTime;
        //카드사명
        frmCancel_SMT.edtCardName.Text:= sCardName;
        //가맹점코드
        frmCancel_SMT.edtJumNo.Text:= sJumCode;

        sMsg := '신용카드 결제취소' + #13#10;
        sMsg:= sMsg + '카드종류: ' + sCardName + #13#10 +
                      '가맹번호: ' + sJumCode + #13#10;

        sMsg := sMsg + '카드번호: ' + sCardNo + #13#10;

//        sMsg:= sMsg + '거래일시: ' + MG_StrToStr('20' + sTime, '####-##-##') +' '+ MG_StrToStr('20' + sTime2, '##:##:##') + #13#10 +
//                      '승인번호: ' + sNo + #13#10;
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

          InspectionLog('신용카드 승인취소 승인번호 : ' + sNo);
          Close;
          SQL.Clear;
          SQL.Add('Delete From VanList Where VanRegNo = :AuthNo ');
          Parameters.ParamByName('AuthNo') .Value:= sNo;
          ExecSQL;
          InspectionLog('VanList Delete by Auth Number : ' + sNo);

          Close;
          SQL.Clear;
          SQL.Add('Delete From TKProc Where TKNo = :TKNo ');
          Parameters.ParamByName('TKNo') .Value:= sNowInTKNo;
          ExecSQL;
          InspectionLog('TKProc Delete by TKNo : ' + sNowInTKNo);

          Close;
          SQL.Clear;
          SQL.Add('Delete From DCDetail Where TKNo = :TKNo ');
          Parameters.ParamByName('TKNo') .Value:= sNowInTKNo;
          ExecSQL;
          InspectionLog('DCDetail Delete by TKNo : ' + sNowInTKNo);

          Close;
          SQL.Clear;
          SQL.Add('Update IONData ');
          SQL.Add('Set OutUnitNo=0,    OutDate=Null,   OutTime=Null, OutChk=0,   OutImage1=Null, OutCarNo1=Null, ');
          SQL.Add(    'OutImage2=Null, OutCarNo2=Null, OutRecog1=0,  OutRecog2=0 ');
          SQL.Add('Where TKNo = :TKNo ');
          Parameters.ParamByName('TKNo') .Value:= sNowInTKNo;
          ExecSQL;
          InspectionLog('IONData RollBack by TKNo : ' + sNowInTKNo);
        end;

        // 영수증인쇄...
        sCreditPrt := '';
        sCreditPrt := '========================================' + LF + LF + LF + CR + SO_WTP;
        sCreditPrt := sCreditPrt + '   승인취소영수증' + LF + LF + LF + CR + SI_WTP;

        if Length(sParkName) > 29 then
        begin
          sCreditPrt := sCreditPrt + '주차장명 : ' + Copy(sParkName, 1, 29) + LF + CR;

          if Length(sParkName) < 58 then
            sCreditPrt := sCreditPrt + '           ' + Copy
              (sParkName, 30, Length(sParkName) - 29) + LF + CR
          else
          begin
            if Length(sParkName) < 87 then
            begin
              sCreditPrt := sCreditPrt + '           ' + Copy(sParkName, 30, 29)
                + LF + CR;
              sCreditPrt := sCreditPrt + '           ' + Copy
                (sParkName, 60, Length(sParkName) - 58) + LF + CR;
            end
            else
            begin
              sCreditPrt := sCreditPrt + '           ' + Copy(sParkName, 30, 29)
                + LF + CR;
              sCreditPrt := sCreditPrt + '           ' + Copy(sParkName, 59, 29)
                + LF + CR;
              sCreditPrt := sCreditPrt + '           ' + Copy
                (sParkName, 88, Length(sParkName) - 87) + LF + CR;
            end;
          end;
        end
        else
          sCreditPrt := sCreditPrt + '주차장명 : ' + sParkName + LF + CR;

        if Length(sParkAddr) > 29 then
        begin
          sCreditPrt := sCreditPrt + ' 주   소 : ' + Copy(sParkAddr, 1, 29) + LF + CR;

          if Length(sParkAddr) < 58 then
            sCreditPrt := sCreditPrt + '           ' + Copy
              (sParkAddr, 30, Length(sParkAddr) - 29) + LF + CR
          else
          begin
            if Length(sParkAddr) < 87 then
            begin
              sCreditPrt := sCreditPrt + '           ' + Copy(sParkAddr, 30, 29)
                + LF + CR;
              sCreditPrt := sCreditPrt + '           ' + Copy
                (sParkAddr, 60, Length(sParkAddr) - 58) + LF + CR;
            end
            else
            begin
              sCreditPrt := sCreditPrt + '           ' + Copy(sParkAddr, 30, 29)
                + LF + CR;
              sCreditPrt := sCreditPrt + '           ' + Copy(sParkAddr, 59, 29)
                + LF + CR;
              sCreditPrt := sCreditPrt + '           ' + Copy
                (sParkAddr, 88, Length(sParkAddr) - 87) + LF + CR;
            end;
          end;
        end
        else
          sCreditPrt := sCreditPrt + ' 주   소 : ' + sParkAddr + LF + CR;

        sCreditPrt := sCreditPrt + '등록번호 : ' + sRegNo + LF + CR;

        if Length(sAdmin) > 29 then
        begin
          sCreditPrt := sCreditPrt + '대표자명 : ' + Copy(sAdmin, 1, 29) + LF + CR;
          sCreditPrt := sCreditPrt + '           ' + Copy
            (sAdmin, 30, Length(sAdmin) - 29) + LF + CR;
        end
        else
          sCreditPrt := sCreditPrt + '대표자명 : ' + sAdmin + LF + CR;

        sCreditPrt := sCreditPrt + '전화번호 : ' + sTelephone + LF + CR;
        sCreditPrt := sCreditPrt + '========================================' + LF + CR;
        sCreditPrt := sCreditPrt + sMsg;
        sCreditPrt := sCreditPrt + '========================================' + LF + CR;

        sLocalPrt := sCreditPrt + '                             [고객용]   ' + LF + CR;

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
        sLocalPrt := sLocalPrt + sCreditPrt + '                             [보관용]   ' + LF + CR;

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
        sCreditPrt:= sLocalPrt + LF + LF + LF + LF + LF + LF + LF + LF + FullCut_WTP;
        bGoodCredit:= True;
        bClose:= True;
        InspectionLog('### 신용카드 승인취소 완료 ###');
        ShowMessage('정상처리 되었습니다.');
      end;
      InspectionLog('영수증 메시지 출력:' + #13#10 + sCreditPrt);
      Close;
    end;
	end
	else if(strServiceName = '5102') Then	// 서명 요청
	begin
		strBuffer := strBuffer + #13#10 + ' 응답코드 : '+ m_pPay.GetResultByName('응답코드');
		strBuffer := strBuffer + #13#10 + ' MASTERKEY INDEX : '+ m_pPay.GetResultByName('MASTERKEY INDEX');
		strBuffer := strBuffer + #13#10 + ' WORKING KEY : '+ m_pPay.GetResultByName('WORKING KEY');
		strBuffer := strBuffer + #13#10 + ' 서명이미지정보 : '+ m_pPay.GetResultByName('서명이미지정보');
		strBuffer := strBuffer + #13#10 + ' 사인이미지데이터 : '+ m_pPay.GetResultByName('사인이미지데이터');
		strBuffer := strBuffer + #13#10 + ' 사인패드기기정보 : '+ m_pPay.GetResultByName('사인패드기기정보');
		strBuffer := strBuffer + #13#10 + ' 해쉬코드 : '+ m_pPay.GetResultByName('해쉬코드');
		strBuffer := strBuffer + #13#10 + ' 화면메세지 : '+ m_pPay.GetResultByName('화면메세지');
	end
	else if(strServiceName = '9002') Then	// 단말기연결 확인
	begin
		strBuffer := strBuffer + #13#10 + ' 응답코드 : '+ m_pPay.GetResultByName('응답코드');
		strBuffer := strBuffer + #13#10 + ' 화면메세지 : '+ m_pPay.GetResultByName('화면메세지');
    InspectionLog('영수증 메시지 출력:' + #13#10 + strBuffer);
    InspectionLog('### Smartro 신용카드 모듈 Load 성공 ###-' + sMsg);
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

//오류거래 메시지
procedure TfrmCancel_SMT.m_pPayRecvMSG(Sender: TObject;
  const strMSG: WideString; nSize: Integer);
begin
  LOGPRINT(LOG_DATA, m_strTitleRes[m_nType], strMSG);
  LOGPRINT(LOG_END, m_strTitleRes[m_nType], '');
  if m_raTradeType = 0 then
  begin
     edtMsg.Text := strMSG;
  end
  else if m_raTradeType = 1 then
  begin
     edtMsg.Text := strMSG;
  end;
  InspectionLog(strMSG);
  bGoodCredit:= False;
  bClose:= True;
  ShowMessage(strMSG + #13#10 + '메시지 확인 후 다시 시도하여주세요!');
  Close;
end;

procedure TfrmCancel_SMT.ReqTrade(nType: Integer);
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

procedure TfrmCancel_SMT.tEventTimer(Sender: TObject);
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
          bGoodCredit:= True;

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

            InspectionLog('신용카드 승인취소 승인번호 : ' + sNo);
            Close;
            SQL.Clear;
            SQL.Add('Delete From VanList Where VanRegNo = :AuthNo ');
            Parameters.ParamByName('AuthNo') .Value:= sNo;
            ExecSQL;
            InspectionLog('VanList Delete by Auth Number : ' + sNo);

            Close;
            SQL.Clear;
            SQL.Add('Delete From TKProc Where TKNo = :TKNo ');
            Parameters.ParamByName('TKNo') .Value:= sNowInTKNo;
            ExecSQL;
            InspectionLog('TKProc Delete by TKNo : ' + sNowInTKNo);

            Close;
            SQL.Clear;
            SQL.Add('Delete From DCDetail Where TKNo = :TKNo ');
            Parameters.ParamByName('TKNo') .Value:= sNowInTKNo;
            ExecSQL;
            InspectionLog('DCDetail Delete by TKNo : ' + sNowInTKNo);

            Close;
            SQL.Clear;
            SQL.Add('Update IONData ');
            SQL.Add('Set OutUnitNo=0,    OutDate=Null,   OutTime=Null, OutChk=0,   OutImage1=Null, OutCarNo1=Null, ');
            SQL.Add(    'OutImage2=Null, OutCarNo2=Null, OutRecog1=0,  OutRecog2=0 ');
            SQL.Add('Where TKNo = :TKNo ');
            Parameters.ParamByName('TKNo') .Value:= sNowInTKNo;
            ExecSQL;
            InspectionLog('IONData RollBack by TKNo : ' + sNowInTKNo);
          end;
          //단말기에서 직전거래 취소를 했으면...
          //if sCardName = sCheck then
          //  sMsg:= sMsg + '### 직전거래 취소 ###' + #13#10;

          // 영수증인쇄...
          sCreditPrt := '';
          sCreditPrt := '========================================' + LF + LF + LF + CR + SO_WTP;
          sCreditPrt := sCreditPrt + '   승인취소영수증' + LF + LF + LF + CR + SI_WTP;

          if Length(sParkName) > 29 then
          begin
            sCreditPrt := sCreditPrt + '주차장명 : ' + Copy(sParkName, 1, 29) + LF + CR;

            if Length(sParkName) < 58 then
              sCreditPrt := sCreditPrt + '           ' + Copy
                (sParkName, 30, Length(sParkName) - 29) + LF + CR
            else
            begin
              if Length(sParkName) < 87 then
              begin
                sCreditPrt := sCreditPrt + '           ' + Copy(sParkName, 30, 29)
                  + LF + CR;
                sCreditPrt := sCreditPrt + '           ' + Copy
                  (sParkName, 60, Length(sParkName) - 58) + LF + CR;
              end
              else
              begin
                sCreditPrt := sCreditPrt + '           ' + Copy(sParkName, 30, 29)
                  + LF + CR;
                sCreditPrt := sCreditPrt + '           ' + Copy(sParkName, 59, 29)
                  + LF + CR;
                sCreditPrt := sCreditPrt + '           ' + Copy
                  (sParkName, 88, Length(sParkName) - 87) + LF + CR;
              end;
            end;
          end
          else
            sCreditPrt := sCreditPrt + '주차장명 : ' + sParkName + LF + CR;

          if Length(sParkAddr) > 29 then
          begin
            sCreditPrt := sCreditPrt + ' 주   소 : ' + Copy(sParkAddr, 1, 29) + LF + CR;

            if Length(sParkAddr) < 58 then
              sCreditPrt := sCreditPrt + '           ' + Copy
                (sParkAddr, 30, Length(sParkAddr) - 29) + LF + CR
            else
            begin
              if Length(sParkAddr) < 87 then
              begin
                sCreditPrt := sCreditPrt + '           ' + Copy(sParkAddr, 30, 29)
                  + LF + CR;
                sCreditPrt := sCreditPrt + '           ' + Copy
                  (sParkAddr, 60, Length(sParkAddr) - 58) + LF + CR;
              end
              else
              begin
                sCreditPrt := sCreditPrt + '           ' + Copy(sParkAddr, 30, 29)
                  + LF + CR;
                sCreditPrt := sCreditPrt + '           ' + Copy(sParkAddr, 59, 29)
                  + LF + CR;
                sCreditPrt := sCreditPrt + '           ' + Copy
                  (sParkAddr, 88, Length(sParkAddr) - 87) + LF + CR;
              end;
            end;
          end
          else
            sCreditPrt := sCreditPrt + ' 주   소 : ' + sParkAddr + LF + CR;

          sCreditPrt := sCreditPrt + '등록번호 : ' + sRegNo + LF + CR;

          if Length(sAdmin) > 29 then
          begin
            sCreditPrt := sCreditPrt + '대표자명 : ' + Copy(sAdmin, 1, 29) + LF + CR;
            sCreditPrt := sCreditPrt + '           ' + Copy
              (sAdmin, 30, Length(sAdmin) - 29) + LF + CR;
          end
          else
            sCreditPrt := sCreditPrt + '대표자명 : ' + sAdmin + LF + CR;

          sCreditPrt := sCreditPrt + '전화번호 : ' + sTelephone + LF + CR;
          sCreditPrt := sCreditPrt + '========================================' + LF + CR;
          sCreditPrt := sCreditPrt + sMsg;
          sCreditPrt := sCreditPrt + '========================================' + LF + CR;

          sLocalPrt := sCreditPrt + '                             [고객용]   ' + LF + CR;

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
          sLocalPrt := sLocalPrt + sCreditPrt + '                             [보관용]   ' + LF + CR;

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

          sCreditPrt:= sLocalPrt + LF + LF + LF + LF + LF + LF + LF + LF + FullCut_WTP;
          bClose:= True;
          InspectionLog('### 신용카드 승인취소 완료 ###');
          Close;
        end
        else
        begin
          sReply:= Copy(sRecv, nPos+6, 64);
          edtMsg.Text:= sReply;
          InspectionLog(sReply);
          bGoodCredit:= False;
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
          bGoodCredit:= False;
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

procedure TfrmCancel_SMT.TradeMain(strTradeNum: String);
begin
    LOGPRINT(LOG_START, m_strTitleReq[m_nType], '');
    try
      if  m_nType = TRADE_LINK_CONFIRM  then
      begin
          try
             //m_pPay.CMDReqSend(strTradeNum);
             m_pPay.CMDReqCatSend(strTradeNum);
          except
             bCreditLoad:= False;
             Exit;
          end;
      end
      else
      begin
          try
             m_pPay.CMDReqSend(strTradeNum);
          except
             bCreditLoad:= False;
             Exit;
          end;
          bGoodCredit := True;
      end;
    Except
        on E: Exception do
        ExceptLogging('TfrmCancel_SMT.TradeMain: ' + aString(E.Message));
    end;
end;

end.
