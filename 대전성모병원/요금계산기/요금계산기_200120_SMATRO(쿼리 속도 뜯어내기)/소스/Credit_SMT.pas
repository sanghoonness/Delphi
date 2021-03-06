unit Credit_SMT;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, sLabel, Vcl.ExtCtrls, sButton, AdvEdit,
  Vcl.OleCtrls, SMTPAYAXLib_TLB;

type
  TfrmCredit_SMT = class(TForm)
    Panel1: TPanel;
    sLabel1: TsLabel;
    Panel3: TPanel;
    lbVan: TLabel;
    Panel2: TPanel;
    edtCardName: TAdvEdit;
    edtJumNo: TAdvEdit;
    edtAuthNo: TAdvEdit;
    edtAuthDate: TAdvEdit;
    tEvent: TTimer;
    edtMsg: TAdvEdit;
    m_pPay: TPay;
    btnClose: TsButton;
    procedure FormShow(Sender: TObject);
    procedure tEventTimer(Sender: TObject);
    procedure m_pPayCompletedJob(Sender: TObject; nResultCode: Integer;
      const strMSG: WideString);
    procedure m_pPayCompletedPrint(Sender: TObject; nPrintedCount: Integer);
    procedure m_pPayRecvLastTransData(Sender: TObject; nResultCode: Integer;
      const strLastTranCode: WideString);
    procedure m_pPayRecvMSG(Sender: TObject; const strMSG: WideString;
      nSize: Integer);
    procedure btnCloseClick(Sender: TObject);

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
  //ADD 20.02.27 VAN - Smartro 추가
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
  frmCredit_SMT: TfrmCredit_SMT;
  bClose: Boolean = False;
  

implementation
uses
  Global,Tables, Cancel_SMT;

{$R *.dfm}
procedure TfrmCredit_SMT.btnCloseClick(Sender: TObject);
begin
  try
    InspectionLog('### 근무자 신용카드 결제취소 취소 ###');
  	m_pPay.CMDReqCancel();
  finally
    bGoodCredit := False;
    bClose := True;
    ModalResult := mrCancel;
  end;
end;

procedure TfrmCredit_SMT.FormShow(Sender: TObject);
var
  nResult, nVat: Integer;
  pError: PAnsiChar;
  sData, sError: aString;
begin
  try
    //ADD 20.02.28 van smartro 장비(T263) 연결 확인
    InspectionLog('### 신용카드 결제시작 ###');
    bClose:= False;

    //단말기로 승인요청 전송...
    InspectionLog('주차요금 신용카드 송신 : ' + IntToStr(nProcYogum));
    nVat:= nProcYogum div 11;
    InspectionLog('주차요금 전문 송신 : ' + sData );
    m_raTradeType := 0;
    tEvent.Enabled:= false;
    bGoodCredit := false;
    ReqTrade(nTRADEType); //거래 타입 (승인, 취소...)
  finally
    //FreeMem(pError);
  end;
end;

procedure TfrmCredit_SMT.LOG(strData: String);
var
	strOldLog : String;
	strNewLog : String;
begin
//
//	strOldLog := m_edLog.Text;
//
//	strNewLog := format('%s', [strData]) + #13#10;
//
//	if(Length(strOldLog) > 20000) Then
//	begin
//		m_edLog.Text := strNewLog;
//	end
//	else
//	begin
//		m_edLog.Text := strOldLog + strNewLog;
//	end;
end;

procedure TfrmCredit_SMT.LOGPRINT(nIdx: Integer; strTitle, strData: String);
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

procedure TfrmCredit_SMT.MakePrintData(RecvData : String);
var
    strPrintData : String;
    nLineupIdx : Integer;
    strLineTmp : String;
    strNum : String;
begin

    strPrintData := '';
    strPrintData := RecvData;
    {strPrintData := strPrintData + '케이투코리아(주)본점매장' + Chr($0A);
    strPrintData := strPrintData + '서울 성동구 성수2가3동  278-30' + Chr($0A);
    strPrintData := strPrintData + '대표 : 정영훈    Tel) 0234089720' + Chr($0A);
    strPrintData := strPrintData + '------------------------------------------' + Chr($0A);
    strPrintData := strPrintData + '순번   상품명/상품코드   수량     금액    ' + Chr($0A);
    strPrintData := strPrintData + '------------------------------------------' + Chr($0A);
    strPrintData := strPrintData + '001 고어텍스 CAP 2         1        44,000' + Chr($0A);
    strPrintData := strPrintData + '    KMF11C02' + Chr($0A);
    strPrintData := strPrintData + '------------------------------------------' + Chr($0A);
    strPrintData := strPrintData + '002 고어텍스 귀마개 공군   1        48,000' + Chr($0A);
    strPrintData := strPrintData + '    KMW11C05' + Chr($0A);
    strPrintData := strPrintData + '------------------------------------------' + Chr($0A);
    strPrintData := strPrintData + '003 고어텍스 귀마개 공군   1        48,000' + Chr($0A);
    strPrintData := strPrintData + '    KMW11C05' + Chr($0A);
    strPrintData := strPrintData + '------------------------------------------' + Chr($0A);
    strPrintData := strPrintData + '004 고어텍스 바라크라바    5       325,000' + Chr($0A);
    strPrintData := strPrintData + '    KMW11C08' + Chr($0A);
    strPrintData := strPrintData + '------------------------------------------' + Chr($0A);
    strPrintData := strPrintData + '005 고어텍스 귀마개 HAT    4       236,000' + Chr($0A);
    strPrintData := strPrintData + '    KMW11C09' + Chr($0A);
    strPrintData := strPrintData + '------------------------------------------' + Chr($0A);
    strPrintData := strPrintData + '006 고어텍스 귀마개 HAT   13       767,000' + Chr($0A);
    strPrintData := strPrintData + '    KMW11C09' + Chr($0A);
    strPrintData := strPrintData + '------------------------------------------' + Chr($0A);
    strPrintData := strPrintData + '007 고어텍스 귀마개 HAT    3       177,000' + Chr($0A);
    strPrintData := strPrintData + '    KMW11C09' + Chr($0A);
    strPrintData := strPrintData + '------------------------------------------' + Chr($0A);
    strPrintData := strPrintData + '008 고어텍스 귀마개 HAT    2       118,000' + Chr($0A);
    strPrintData := strPrintData + '    KMW11C09' + Chr($0A);
    strPrintData := strPrintData + '------------------------------------------' + Chr($0A);
    strPrintData := strPrintData + '009 고어텍스 귀마개 HAT    1        59,000' + Chr($0A);
    strPrintData := strPrintData + '    KMW11C11' + Chr($0A);
    strPrintData := strPrintData + '------------------------------------------' + Chr($0A);
    strPrintData := strPrintData + '010 고어텍스 귀마개 HAT    1        59,000' + Chr($0A);
    strPrintData := strPrintData + '    KMW11C11' + Chr($0A);
    strPrintData := strPrintData + '------------------------------------------' + Chr($0A);
    strPrintData := strPrintData + '011 고어텍스 로윙 HAT 2    1        68,000' + Chr($0A);
    strPrintData := strPrintData + '    KMW11C12' + Chr($0A);
    strPrintData := strPrintData + '------------------------------------------' + Chr($0A);
    strPrintData := strPrintData + '012 고어텍스 로윙 HAT 2    1        68,000' + Chr($0A);
    strPrintData := strPrintData + '    KMW11C12' + Chr($0A);
    strPrintData := strPrintData + '------------------------------------------' + Chr($0A);
    strPrintData := strPrintData + '------------------------------------------' + Chr($0A);
    strPrintData := strPrintData + '                    과세물품     2,902,728' + Chr($0A);
    strPrintData := strPrintData + '                    부 가 세       290,272' + Chr($0A);
    strPrintData := strPrintData + '                    부 가 세       290,272' + Chr($0A); }
    //출력
    //m_pPay.CMDPrint(strPrintData);
end;

procedure TfrmCredit_SMT.MakeTrade(nType: Integer);
var
    strFiller : String;
    strTmp : String;
    //strTmp : Cardinal;
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

procedure TfrmCredit_SMT.m_pPayCompletedJob(Sender: TObject;
  nResultCode: Integer; const strMSG: WideString);
var
  strServiceName : String;
  Card_Num : string;
  sRecv, sHex, sType, sCardNo, sAmt, sVat, sNo, sTime, sTime2,
  sCardName, sJumCode, sMsg, sCheck, sLocalPrt, sData, sReply: aString;
	//strBuffer : String;
begin
  if (nResultCode = -50) then begin
    ExceptLogging(sLabel1.Caption+' 사용자 취소');
    Exit;
  end else if(nResultCode <> 1) Then
	begin
    strBuffer := format('Error Code (%d) ErrMsg(%s)', [nResultCode, strMSG]);
    LOGPRINT(LOG_DATA, m_strTitleReq[m_nType], strBuffer);
    LOGPRINT(LOG_END, m_strTitleReq[m_nType], '');

    ShowMessage('SMARTRO 신용카드 모듈 Load가 실패했습니다.' + #13#10 + '기기 연결 상태 확인 후 요금계산기를 재실행하여 주세요.');
    InspectionLog('### Smartro 신용카드 모듈 Load 실패 ###-' + sMsg + ', ' + strBuffer);
    ExceptLogging('SMARTRO 모듈 로드중 에러 발생. 신용카드 기기 연동 해제 처리');
//    nCreditlinkage := False;
//    bCreditLoad:= False;
		exit;
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

      if (m_raTradeType = 0) and (Length(sNo) > 0) then      //신용카드 결제 승인
      begin
        {$REGION '카드결제 정상승인'}
        //금액
        //sAmt;
        //카드번호
        edtAuthNo.Text:= sCardNo;
        //가맹점코드
        edtJumNo.Text:= sJumCode;
        //승인일시
        edtAuthDate.Text:= Copy(sTime, 1, 8);
        //카드사명
        edtCardName.Text:= sCardName;

        sMsg := '신용카드 결제' + #13#10;
        sMsg:= sMsg + '카드종류: ' + sCardName + #13#10 +
                          '가맹번호: ' + sJumCode + #13#10;
//        if sType = 'B1' then
//        sMsg:= sMsg + '식별번호: ' + Copy(sCardNo, 1, 3) + '-' + '****' + '-' + Copy(sCardNo, 8, 4) + #13#10
//        else
//          sMsg:= sMsg + '카드번호: ' + Copy(sCardNo, 1, Pos('=', sCardNo)-1) + #13#10;
          sMsg:= sMsg + '카드번호: ' + sCardNo + #13#10;

//        sMsg:= sMsg + '거래일시: ' + MG_StrToStr('20' + sTime, '####-##-##') +' '+ MG_StrToStr('20' + sTime2, '##:##:##') + #13#10 +//MG_StrToStr('20' + sTime, '####-##-## ##:##:##') + #13#10 +
//                      '승인번호: ' + sNo + #13#10;
        //추가작업05.26
        sMsg:= sMsg + '거래일시: '+ Copy(sTime,1,4)+'-'+Copy(sTime,5,2)+'-'+Copy(sTime,7,2) +' '+ Copy(sTime2,1,2)+':'+Copy(sTime2,3,2)+':'+Copy(sTime2,5,2) + #13#10 +
                      '승인번호: ' + sNo + #13#10;

        if m_raTradeType = 0 then
        begin
          sMsg:= sMsg + '결제금액: ' + FormatFloat('#,##0', StrToInt(sAmt)) + '원' + #13#10;
          InspectionLog('주차요금 신용카드 수신 : ' + sAmt );
        end
        else if m_raTradeType = 1 then
        begin
          sMsg:= sMsg + '결제금액: ' + '-' + FormatFloat('#,##0', StrToInt(sAmt)) + '원' + #13#10;
          InspectionLog('주차요금 신용카드 수신 : ' + sAmt );
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
          Close;
          SQL.Clear;
          SQL.Add('Insert Into VanList ');
          SQL.Add('(ParkNo, UnitNo, ProcDate, ProcTime, MNo, VanCheck ');
          SQL.Add(' , CardNo, VanAmt, VanDate, VanTime, VanRegNo, CardType  ');
          SQL.Add(' , VanStatus, CarNo, Reserve1 , Reserve2,Reserve3,Reserve4) ');
          SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, ');
          SQL.Add(':N11, :N12, :N13, :N14, :N15, :N16, :N17, :N18 ) ');
          Parameters.ParamByName('N1') .Value:= nCurrParkNo;
          Parameters.ParamByName('N2') .Value:= nCurrUnitNo;
          Parameters.ParamByName('N3') .Value:= FormatDateTime('YYYY-MM-DD', Now);;
          Parameters.ParamByName('N4') .Value:= FormatDateTime('HH:NN:SS', Now);;
          Parameters.ParamByName('N5') .Value:= nCurrMNo;
          Parameters.ParamByName('N6') .Value:= 1;
          Parameters.ParamByName('N7') .Value:= Copy(sCardNo, 1, 6)+'0000000000';
          Parameters.ParamByName('N8') .Value:= StrToInt(sAmt);
          Parameters.ParamByName('N9') .Value:= Copy(sTime,1,4)+'-'+Copy(sTime,5,2)+'-'+Copy(sTime,7,2);
          Parameters.ParamByName('N10') .Value:= Copy(sTime2,1,2)+':'+Copy(sTime2,3,2)+':'+Copy(sTime2,5,2);
          //Parameters.ParamByName('N9') .Value:= Copy(MG_StrToStr('20' + sTime, '####-##-## ##:##:##'),1,10);
          //Parameters.ParamByName('N10') .Value:= Copy(MG_StrToStr('20' + sTime, '####-##-## ##:##:##'),12,5);
          Parameters.ParamByName('N11') .Value:= sNo;
          Parameters.ParamByName('N12') .Value:= sCardName;
          Parameters.ParamByName('N13') .Value:= '';
          Parameters.ParamByName('N14') .Value:= sNowLprCarNo1;
          Parameters.ParamByName('N15') .Value:= sNowInTKNo;
          Parameters.ParamByName('N16') .Value:= sCardName;
          Parameters.ParamByName('N17') .Value:= '신용카드';
          Parameters.ParamByName('N18') .Value:= '일반결제';
          ExecSQL;
        end;
        // 영수증인쇄...
        sCreditPrt := '';
        sCreditPrt := '========================================' + LF + LF + LF + CR + SO_WTP;
        sCreditPrt := sCreditPrt + '    영   수   증' + LF + LF + LF + CR + SI_WTP;

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
        sCreditPrt := sCreditPrt + '입차일시 : ' + sNowInDate + ' ' + sNowInTime + LF + CR;
        sCreditPrt := sCreditPrt + '출차일시 : ' + sNowOutDate + ' ' + sNowOutTime + LF + CR;
        sCreditPrt := sCreditPrt + '주차시간 : ' + sCreditParkingTime + LF + CR;
        sCreditPrt := sCreditPrt + '근 무 자 : ' + sCurrMName + LF + CR;
        sCreditPrt := sCreditPrt + '차량번호 : ' + sNowLprCarNo1 + LF + CR;
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
        bGoodCredit:= True;
        sCreditPrt:= sLocalPrt + LF + LF + LF + LF + LF + LF + LF + LF + FullCut_WTP;
        bClose:= True;
        InspectionLog('### 신용카드 결제완료 ###');
        InspectionLog('영수증 메시지 출력:' + #13#10 + sCreditPrt);
        {$ENDREGION}
      end else if (m_raTradeType = 0) and (Length(sNo) = 0) then begin
        ShowMessage('결제 실패! 카드결제 승인에 실패했습니다.' + #13#10 +
                    '응답메세지 - 카드종류 ['+sCardName+'] 가맹번호 ['+sJumCode+'] 카드번호 ['+sCardNo+'] 승인번호 ['+sNo+'] 결제금액 ['+sAmt+']');
        InspectionLog('카드 결제실패');
        InspectionLog('응답메세지 - 카드종류 ['+sCardName+'] 가맹번호 ['+sJumCode+'] 카드번호 ['+sCardNo+'] 승인번호 ['+sNo+'] 결제금액 ['+sAmt+']');

        bGoodCredit := False;
        bClose:= True;
        Close;

        Exit;
      end;
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
    InspectionLog('연결확인 메시지:' + #13#10 + strBuffer);
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
     //MakePrintData(strBuffer);
     //ShowMessage(strBuffer);
     //카드 결제 오류 시
     if sTime = '' then
     begin
        bGoodCredit:= false;
        edtMsg.Text := '카드결제 오류';
     end;
     Close;
  end;
end;

procedure TfrmCredit_SMT.m_pPayCompletedPrint(Sender: TObject;
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

procedure TfrmCredit_SMT.m_pPayRecvLastTransData(Sender: TObject;
  nResultCode: Integer; const strLastTranCode: WideString);
var
    strMSG : String;
begin
  if (nResultCode > 0) Then
	begin
		strMSG := format('%s%s', ['(최종거래 정보 ) 최종거래 TranCode : ', strLastTranCode]);
		strMSG := strMSG + #13#10 + ' 거래구분코드 : '+ m_pPay.GetResultByName('거래구분코드');
		strMSG := strMSG + #13#10 + ' 카드번호 : '+ m_pPay.GetResultByName('카드번호');
		strMSG := strMSG + #13#10 + ' 승인금액 : '+ m_pPay.GetResultByName('승인금액');
		strMSG := strMSG + #13#10 + ' 세금 : '+ m_pPay.GetResultByName('세금');
		strMSG := strMSG + #13#10 + ' 봉사료 : '+ m_pPay.GetResultByName('봉사료');
		strMSG := strMSG + #13#10 + ' 할부개월 및 사용구분 : '+ m_pPay.GetResultByName('할부개월 및 사용구분');
		strMSG := strMSG + #13#10 + ' 승인번호 : '+ m_pPay.GetResultByName('승인번호');
		strMSG := strMSG + #13#10 + ' 매출일자 : '+ m_pPay.GetResultByName('매출일자');
		strMSG := strMSG + #13#10 + ' 매출시간 : '+ m_pPay.GetResultByName('매출시간');
		strMSG := strMSG + #13#10 + ' 거래고유번호 : '+ m_pPay.GetResultByName('거래고유번호');
		strMSG := strMSG + #13#10 + ' 가맹점번호 : '+ m_pPay.GetResultByName('가맹점번호');
		strMSG := strMSG + #13#10 + ' 단말기 번호 : '+ m_pPay.GetResultByName('단말기 번호');
		strMSG := strMSG + #13#10 + ' 발급사 : '+ m_pPay.GetResultByName('발급사');
		strMSG := strMSG + #13#10 + ' 매입사 : '+ m_pPay.GetResultByName('매입사');
		strMSG := strMSG + #13#10 + ' DDC 코드 : '+ m_pPay.GetResultByName('DDC 코드');
		strMSG := strMSG + #13#10 + ' 응답코드 : '+ m_pPay.GetResultByName('응답코드');
		strMSG := strMSG + #13#10 + ' 화면메세지 : '+ m_pPay.GetResultByName('화면메세지');
		strMSG := strMSG + #13#10 + ' 전표타이틀 : '+ m_pPay.GetResultByName('전표타이틀');
		strMSG := strMSG + #13#10 + ' 출력메세지 : '+ m_pPay.GetResultByName('출력메세지');
		strMSG := strMSG + #13#10 + ' MASTERKEY INDEX : '+ m_pPay.GetResultByName('MASTERKEY INDEX');
		strMSG := strMSG + #13#10 + ' WORKING KEY : '+ m_pPay.GetResultByName('WORKING KEY');
		strMSG := strMSG + #13#10 + ' 서명이미지정보 : '+ m_pPay.GetResultByName('서명이미지정보');
		strMSG := strMSG + #13#10 + ' 사인이미지데이터 : '+ m_pPay.GetResultByName('사인이미지데이터');
		strMSG := strMSG + #13#10 + ' FILLER1 : '+ m_pPay.GetResultByName('FILLER1');
		strMSG := strMSG + #13#10 + ' FILLER2 : '+ m_pPay.GetResultByName('FILLER2');
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

//오류거래 메시지
procedure TfrmCredit_SMT.m_pPayRecvMSG(Sender: TObject;
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
     frmCancel_SMT.edtMsg.Text := strMSG;
  end;
  InspectionLog(strMSG);
  bGoodCredit:= False;
  bClose:= True;
  if m_nType = TRADE_LINK_CONFIRM then    //장비 연동 오류
  begin
      ShowMessage('신용카드 단말기 연결에 이상이 발생하여 '+#13#10+
              '신용카드 결제가 불가능합니다. '+#13#10+
              '관리자에 문의하여 주세요!');
  end
  else
  begin
      ShowMessage(strMSG + #13#10 + '메시지 확인 후 다시 시도하여주세요!');
  end;
  Close;
end;

procedure TfrmCredit_SMT.ReqTrade(nType: Integer);
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

procedure TfrmCredit_SMT.tEventTimer(Sender: TObject);
var
  pHex, pRecv, pError: pAnsiChar;
  CMD, GCD, JCD, RCD: integer;
  nResult, nPos, nReplyCode: integer;
  sRecv, sHex, sType, sCardNo, sAmt, sVat, sNo, sTime,
  sCardName, sJumCode, sMsg, sCheck, sLocalPrt, sData, sReply: aString;
  parkAddr: string;
begin
  try
    // 영수증인쇄...
    sCreditPrt := '';
    sCreditPrt := '========================================' + LF + LF + LF + CR + SO_WTP;
    sCreditPrt := sCreditPrt + '    영   수   증' + LF + LF + LF + CR + SI_WTP;

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
    sCreditPrt := sCreditPrt + '입차일시 : ' + sNowInDate + ' ' + sNowInTime + LF + CR;
    sCreditPrt := sCreditPrt + '출차일시 : ' + sNowOutDate + ' ' + sNowOutTime + LF + CR;
    sCreditPrt := sCreditPrt + '주차시간 : ' + sCreditParkingTime + LF + CR;
    sCreditPrt := sCreditPrt + '근 무 자 : ' + sCurrMName + LF + CR;
    sCreditPrt := sCreditPrt + '차량번호 : ' + sNowLprCarNo1 + LF + CR;
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
    InspectionLog('### 신용카드 결제완료 ###');
    Close;
  except
    on E: Exception do begin
      ExceptLogging('신용카드 결제 중 오류 발생 : ' + E.Message);
    end;
  end;
end;

procedure TfrmCredit_SMT.TradeMain(strTradeNum: String);
begin
  LOGPRINT(LOG_START, m_strTitleReq[m_nType], '');
  try
    if  nTRADEType = TRADE_LINK_CONFIRM  then
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
    ExceptLogging('TfrmCredit_SMT.TradeMain: ' + aString(E.Message));
  end;
end;

end.
