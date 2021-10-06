unit Cash_SMT;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, sButton, AdvEdit, sLabel, Dreampos_Ocx_TLB,
  Vcl.OleCtrls;

type
  TfrmCash_SMT = class(TForm)
    Panel1: TPanel;
    sLabel1: TsLabel;
    Panel3: TPanel;
    lbVan: TLabel;
    btnCancel: TsButton;
    dream: TDP_Certification_Ocx;
    sButton1: TsButton;
    edtCustNo: TAdvEdit;
    lbl1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
    procedure dreamQueryResults(ASender: TObject; const ReturnData: WideString);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCash_SMT: TfrmCash_SMT;
  bClose: Boolean = False;

implementation
uses
  Global, Tables, MainNew, Smartro;

{$R *.dfm}

procedure TfrmCash_SMT.btnCancelClick(Sender: TObject);
begin
  try
    InspectionLog('### 근무자 현금영수증 발행취소 ###');

    dream.Set_Code           := '8888';                      //결제방법
    dream.Set_CodeGu         := '2200';                      //제어방법
    dream.Set_OcxProcess     := 'OCX';
    dream.Set_SetUserCode    := 'A';                         //사용자 고유코드
    dream.set_Transer_Number := '';
    dream.set_Mutil_CATID    := '';
    dream.xProcess           := False;
    dream.SendRecv;

    Close;
  except
    on E: Exception do begin
      ExceptLogging('현금영수증 취소 중 오류 발생 : ' + E.Message);
      ExceptLogging('신용카드 단말기 초기화 중 오류.');
    end;
  end;
end;

procedure TfrmCash_SMT.dreamQueryResults(ASender: TObject;
  const ReturnData: WideString);

var
  posid: Integer;
  chk1, chk2, i: Integer;
  ConChkstr, Chkstr, Recv: String;
  SplitDataRecv: TStringList;
  sCashMsg, sLocalPrt: aString;
begin
  try
    {$REGION '응답수신 : EV-CAT을 확인 하세요!'}
    posid := Pos(WideString('EV-CAT을'), ReturnData);
    if posid > 0 then begin
      //EV-CAT데몬 미실행됨.
      ShowMessage('EV-CAT 결제 데몬 실행상태를 확인해 주세요.');
      InspectionLog('RecvMsg : ' + ReturnData);
      InspectionLog('[EV-CAT] 결제 데몬 미실행중');
      Exit;
    end;
    {$ENDREGION}

    {$REGION '응답수신 : 이미 요청중입니다! + 결제금액 변경'}
    //EV-CAT으로 전문 송신 후, 응답 처리 완료되기 전 다른 전문 송신시 발생하는 오류.
    posid := Pos( WideString('이미 요청중입니다!'),ReturnData);
    if posid > 0 then
    begin
      InspectionLog('RecvMsg : ' + ReturnData);
      InspectionLog('[EV-CAT] 이미 결제 요청중입니다.');
      //결제금액 변경로직 삭제
//      InspectionLog('[EV-CAT] 이미 결제 요청중.. 금액변경 요청 시작.');
//      //결제금액 변경프로세스 시작
//
//      try
//        try
//          InspectionLog('### 신용카드 결제 변경 시작 ###');
//          with dream do begin
//            Set_Code        := '5555';                      //결제방법
//            Set_CodeGu      := '2200';                      //제어방법
//            Set_OcxProcess  := 'OCX';
//            Set_Gold        := IntToStr(nProcYogum);        //승인금액
//            Set_VAT         := IntToStr(nProcYogum div 11); //부가세
//            Set_SaleMonth   := 0;                           //할부개월
//            Set_SetUserCode := 'A';                         // NULL을 사용 시 응답  값 에러(델파이에서만)
//
//            SendRecv;
//          end;
//        except
//          on E: Exception do begin
//            ExceptLogging('신용카드 결제 변경 중 에러 발생! : ' + E.Message);
//          end;
//        end;
//      finally
//        InspectionLog('### 신용카드 결제종료 ###');
//      end;
      Exit;
    end;
    {$ENDREGION}

    {$REGION '응답수신 : 리더기 응답'}
    //요청을 했을 시 리더기에 카드삽입될경우 오는 응답.. 요청이 없으니 해당 명령에 대해 따로 처리하지 않음.
    posid := Pos(WideString('리더기 응답'),ReturnData);
    if posid > 0 then
    begin
      InspectionLog('RecvMsg : ' + ReturnData);
      InspectionLog('[EV-CAT] 리더기 카드 삽입');
      Exit;
    end;
    {$ENDREGION}

    {$REGION '응답수신 : FALL BACK 발생'}
     //EV-CAT 환경 설정에서 FALL-BACK 미 사용 시 "카드를 다시 삽입해 달라는 메세지 창을 여기서 처리하면 됨
    //FALL BACK 사용 시 카드가 MSR 로 제대로 읽힐 때 까지 기다림.
    posid := POS(WideString('FALL BACK'), ReturnData);
    if posid > 0 then
    begin
      InspectionLog('RecvMsg : ' + ReturnData);
      InspectionLog('[EV-CAT] FALL BACK 발생 (IC카드 인식실패)');
      //SMT D350모델의 경우 IC만 있는 모델이므로 결제 다시 요청해야함.
      ShowMessage('IC카드 인식을 실패하였습니다. 결제를 다시 요청해주세요.');
      Exit;
    end;
    {$ENDREGION}

    {$REGION '결제 진행'}
    chk1 := Pos(#7, ReturnData);
    chk2 := Pos(#3, ReturnData);
    Recv := ReturnData;

    if (chk1 > 0) and (chk2 > 0) then begin
      InspectionLog('RecvMsg : ' + ReturnData);
      InspectionLog('[EV-CAT] 결제 처리 시작');
      Recv := StringReplace(Recv, chr(13)  , '' , [rfReplaceAll]);

      Chkstr := chr(7) + chr(6);
      ConChkstr := chr(7) + chr(4) +  chr(6);
      Recv := StringReplace(Recv, Chkstr  , ConChkstr , [rfReplaceAll]);

      Chkstr := chr(6) + chr(6);
      ConChkstr := chr(6) + chr(4) +  chr(6);
      Recv := StringReplace(Recv, Chkstr  , ConChkstr , [rfReplaceAll]);

      Chkstr := chr(28) + chr(28);
      ConChkstr := chr(28) + chr(4) +  chr(28);
      Recv := StringReplace(Recv, #3  , '' , [rfReplaceAll]);
      Recv := StringReplace(Recv, #7  , '' , [rfReplaceAll]);
      Recv := StringReplace(Recv, Chkstr  , ConChkstr , [rfReplaceAll]);
      Recv := StringReplace(Recv, Chkstr  , ConChkstr , [rfReplaceAll]);
      SplitDataRecv := TStringList.Create;
      StringSplit(#6, Recv, SplitDataRecv);


      //응답 결과 처리하는 함수.
      SMT_RecvProcess(SplitDataRecv[0], SplitDataRecv[1], SplitDataRecv[2], SplitDataRecv[3]);
      if SMT_Recv[0] = '00' then begin
        //응답코드 00만 정상승인
        bGoodCredit := True;
        InspectionLog('RecvMsg : ' + ReturnData);
        InspectionLog('[EV-CAT] 결제 처리 완료');

        ExceptLogging('현금영수증 영수증 처리 시작');

        try
          sCashMsg := '현금영수증 발행' + #13#10;
          sCashMsg:= sCashMsg + '카드번호: ' + SMT_Recv[5] + #13#10;
          sCashMsg:= sCashMsg + '거래일시: ' + MG_StrToStr(SMT_Recv[3] + '' + SMT_Recv[4], '####-##-## ##:##:##') + #13#10 +
                        '승인번호: ' + SMT_Recv[6] + #13#10;

          // 영수증인쇄...
          sCashReceipt := '';
          sCashReceipt := '========================================' + LF + LF + LF + CR + SO_WTP;
          sCashReceipt := sCashReceipt + '   현 금 영 수 증' + LF + LF + LF + CR + SI_WTP;

          if Length(sParkName) > 29 then
          begin
            sCashReceipt := sCashReceipt + '상 호 명 : ' + Copy(sParkName, 1, 29) + LF + CR;

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
            sCashReceipt := sCashReceipt + '상 호 명 : ' + sParkName + LF + CR;

          sCashReceipt := sCashReceipt + '사업자No.: ' + sRegNo + LF + CR;

          if Length(sAdmin) > 29 then
          begin
            sCashReceipt := sCashReceipt + '사업자명 : ' + Copy(sAdmin, 1, 29) + LF + CR;
            sCashReceipt := sCashReceipt + '           ' + Copy
              (sAdmin, 30, Length(sAdmin) - 29) + LF + CR;
          end
          else
            sCashReceipt := sCashReceipt + '사업자명 : ' + sAdmin + LF + CR;

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
            sCashReceipt := sCashReceipt + '주   소  : ' + sParkAddr + LF + CR;

          sCashReceipt := sCashReceipt + '전화번호 : ' + sTelephone + LF + CR;
          sCashReceipt := sCashReceipt + '========================================' + LF + CR;
          sCashReceipt := sCashReceipt + sCashMsg;
          sCashReceipt := sCashReceipt + '========================================' + LF + CR;
          sCashReceipt := sCashReceipt + '주차정보' + LF + CR;
          sCashReceipt := sCashReceipt + '차량번호 : ' + sNowLprCarNo1 + LF + CR;
          sCashReceipt := sCashReceipt + '입차일시 : ' + sNowInDate + ' ' + sNowInTime + LF + CR;
          sCashReceipt := sCashReceipt + '출차일시 : ' + sNowOutDate + ' ' + sNowOutTime + LF + CR;
          sCashReceipt := sCashReceipt + '주차시간 : ' + frmMainNew.lbParkingTime.Caption + LF + CR;
          sCashReceipt := sCashReceipt + '근 무 자 : ' + sCurrMName + LF + CR;
          sCashReceipt := sCashReceipt + '========================================' + LF + CR;
          sCashReceipt := sCashReceipt + '주차요금정보' + LF + CR;
          if nDCCnt > 0 then
          begin
            sCashReceipt := sCashReceipt + '전체요금 : ' + frmMainNew.edtTotYogum.Text + '원' + LF + CR;
            sCashReceipt := sCashReceipt + '할인금액 : ' + frmMainNew.edtDCYogum.Text + '원' + LF + CR;

            if nDCCnt > 0 then
              for i := 1 to nDCCnt do
                //if DCProc[i].nDCAmt > 0 then
                if DCProc[i].sDCName <> '' then
                begin
                  if i = 1 then
                    sCashReceipt:= sCashReceipt + '할인내용 : ' + DCProc[i].sDCName + LF + CR
                  else
                    sCashReceipt := sCashReceipt + '           ' + DCProc[i].sDCName + LF + CR;
                end;
            sCashReceipt := sCashReceipt + '받은금액 : ' + frmMainNew.edtProcYogum.Text + '원' + LF + CR;
          end
          else
          begin
            sCashReceipt := sCashReceipt + '주차요금 : ' + frmMainNew.edtProcYogum.Text + '원' + LF + CR;
            sCashReceipt := sCashReceipt + '할인금액 : 0 원' + LF + CR;
            sCashReceipt := sCashReceipt + '받은금액 : ' + frmMainNew.edtProcYogum.Text + '원' + LF + CR;
          end;

          sCashReceipt := sCashReceipt + '========================================' + LF + CR+ SO_WTP;;
          sCashReceipt := sCashReceipt + '결제금액 : ' + IntToStr(nProcYogum) + '원' + LF + CR + SI_WTP;
          sCashReceipt := sCashReceipt + '========================================' + LF + CR;
          sLocalPrt  := sCashReceipt + '                             [고객용]   ' + LF + CR;

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
          InspectionLog('TfrmCredit_SMATRO 현금영수증: ' + sCashReceipt);

          bGoodCashReceipt := True;
          ExceptLogging('현금영수증 처리 종료');
          InspectionLog('### 현금영수증 처리 완료 ###');
          Close;
        except
          on E: Exception do begin
            ExceptLogging('현금영수증 영수증 처리중 오류 발생 : ' + E.Message);
          end;
        end;
      end else begin
        InspectionLog('RecvMsg : ' + ReturnData);
        InspectionLog('[EV-CAT] 현금영수증 처리 실패 : 응답코드 ' + SMT_Recv[0] + ', 응답사유 : ' + SMT_Recv[13]);
        ShowMessage('현금영수증 처리 실패 : ' + SMT_Recv[13]);
        bGoodCredit := False;
      end;
      SplitDataRecv.Free;

      Close;
    end else begin
      //00이외에는 전부 신용승인거절
      InspectionLog('RecvMsg : ' + ReturnData);
      ShowMessage(ReturnData);
      Exit;
    end;
    {$ENDREGION}
  except
    on E: Exception do begin
      ExceptLogging('스마트로 현금영수증 응답 처리중 오류 발생! : ' + E.Message);
    end;
  end;
end;

procedure TfrmCash_SMT.FormShow(Sender: TObject);
begin
  Exceptlogging('현금영수증 발행 ..');
  if sCashOption = '02' then begin
    lbVan.Caption := '현금영수증 등록 정보를 입력해 주세요.' + #13#10 + '등록 정보 : 휴대폰 번호 혹은 현금영수증 카드번호';
    edtCustNo.LabelCaption := '등록 정보 ';
  end else if sCashOption = '01' then begin
    lbVan.Caption := '현금영수증 등록 정보를 입력해 주세요.' + #13#10 + '등록 정보 : 사업자번호';
    edtCustNo.LabelCaption := '등록 정보 ';
  end;
end;

procedure TfrmCash_SMT.sButton1Click(Sender: TObject);
begin
  try
    try
      InspectionLog('### 현금영수증 발행 시작 ###');
      with dream do begin
        Set_Code        := '2000';                      //결제방법
        Set_CodeGu      := '1100';                      //제어방법
        Set_Gold        := IntToStr(nProcYogum);        //승인금액
        Set_VAT         := IntToStr(nProcYogum div 11); //부가세
        Set_OcxProcess  := 'OCX';
        Set_ServiceGold := 0;                           //봉사료 금액
        Set_SetUserCode := 'A';                         //사용자 고유코드
        if sCashOption = '02' then begin
          Set_CashGubun := 'C';                         //고객
        end else if sCashOption = '01' then begin
          Set_CashGubun := 'B';                         //사업자
        end;

        //현금영수증 매체(전화번호 or 사업자번호)
        Set_CashNumber := edtCustNo.Text;
        ExceptLogging('현금영수증 금액 : ' + IntToStr(nProcYogum) + ', 현금영수증 등록정보 : ' + edtCustNo.Text + ', 고객(02) 사업자(01)' + sCashOption);
        SendRecv;
      end;
    except
      on E: Exception do begin
        ExceptLogging('현금영수증 발행 중 에러 발생! : ' + E.Message);
      end;
    end;
  finally
    InspectionLog('### 신용카드 결제종료 ###');
  end;
end;
end.
