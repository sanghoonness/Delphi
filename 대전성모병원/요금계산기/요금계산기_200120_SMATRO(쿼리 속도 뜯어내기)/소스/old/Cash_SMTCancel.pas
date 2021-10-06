unit Cash_SMTCancel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, sButton, AdvEdit, sLabel, Dreampos_Ocx_TLB,
  Vcl.ExtCtrls, Vcl.OleCtrls;

type
  TfrmCash_SMTCancel = class(TForm)
    Panel1: TPanel;
    sLabel1: TsLabel;
    Panel3: TPanel;
    lbVan: TLabel;
    Panel2: TPanel;
    lbHint: TLabel;
    edtAuthNo: TAdvEdit;
    edtAuthDate: TAdvEdit;
    btnCancel: TsButton;
    btnOK: TsButton;
    dream: TDP_Certification_Ocx;
    edtFee: TAdvEdit;
    edtCustNo: TAdvEdit;
    Label1: TLabel;
    Label2: TLabel;
    rb1: TRadioButton;
    rb2: TRadioButton;
    Label3: TLabel;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dreamQueryResults(ASender: TObject; const ReturnData: WideString);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCash_SMTCancel: TfrmCash_SMTCancel;

implementation
uses
  Global, Tables, Smartro;
{$R *.dfm}

procedure TfrmCash_SMTCancel.btnCancelClick(Sender: TObject);
begin
  try
    InspectionLog('### 근무자 현금영수증 발급취소요청 취소 ###');

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
      ExceptLogging('현금영수증 발급취소 취소 중 오류 발생 : ' + E.Message);
      ExceptLogging('신용카드 단말기 초기화 중 오류.');
    end;
  end;
end;

procedure TfrmCash_SMTCancel.btnOKClick(Sender: TObject);
begin
  try
    try
      InspectionLog('### 현금영수증 발급 취소시작 ###');
      with dream do begin
        Set_Code        := '2000';                      //결제방법
        Set_CodeGu      := '2200';                      //제어방법
        Set_OcxProcess  := 'OCX';
        Set_Gold        := edtFee.Text;                 //승인금액
        Set_VAT         := IntToStr(StrToInt(edtFee.Text) div 11); //부가세

        Set_ServiceGold := 0;                           // 봉사료금액
        Set_WonYYMMDD   := edtAuthDate.Text;            //원 승인일자
        Set_WonGrantNo  := edtAuthNo.Text;              //원 승인번호
        Set_CashNumber  := edtCustNo.Text;              //사업자번호 / 핸드폰번호 / 현금영수증카드번호 : 현금영수증 매체

        if rb1.Checked then begin
          //사업자
          Set_CashGubun := 'B';
          ExceptLogging('등록구분 : 사업자 ');
        end else if rb2.Checked then begin
          //개인
          Set_CashGubun := 'C';
          ExceptLogging('등록구분 : 개인  ');
        end;

        Set_SetUserCode := 'A';                         // NULL을 사용 시 응답  값 에러(델파이에서만)
        ExceptLogging('현금영수증 취소 금액 : ' + edtFee.Text + ', 현금영수증 등록정보 : ' + edtCustNo.Text + ', 원승인번호 : ' + edtAuthNo.Text + ', 원승인일자 : ' + edtAuthDate.Text);
        SendRecv;
      end;
    except
      on E: Exception do begin
        ExceptLogging('현금영수증 발급 취소 중 에러 발생! : ' + E.Message);
      end;
    end;
  finally
    InspectionLog('### 현금영수증 발급 취소 종료 ###');
  end;

end;

procedure TfrmCash_SMTCancel.dreamQueryResults(ASender: TObject;
  const ReturnData: WideString);

var
  posid: Integer;
  chk1, chk2, i: Integer;
  ConChkstr, Chkstr, Recv: String;
  SplitDataRecv: TStringList;
  sCreditMsg, sLocalPrt: aString;
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
      InspectionLog('[EV-CAT] 이미 결제 요청중.. 금액변경 요청 시작.');
      //결제금액 변경프로세스 시작

      Exit;
    end;
    {$ENDREGION}

    {$REGION '응답수신 : 리더기 응답'}
    //요청을 했을 시 리더기에 카드삽입될경우 오는 응답.. 요청이 없으니 해당 명령에 대해 따로 처리하지 않음.
    posid := Pos(WideString('리더기응답'),ReturnData);
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

    {$REGION '결제 취소 진행'}
    chk1 := Pos(#7, ReturnData);
    chk2 := Pos(#3, ReturnData);
    Recv := ReturnData;

    if (chk1 > 0) and (chk2 > 0) then begin
      InspectionLog('RecvMsg : ' + ReturnData);
      InspectionLog('[EV-CAT] 결제 취소 처리 시작');
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
        InspectionLog('[EV-CAT] 현금영수증 취소 처리 완료');

        ExceptLogging('현금영수증 취소 영수증 시작');
        try
          sCreditMsg := '현금영수증 취소' + #13#10;
          sCreditMsg := sCreditMsg + '카드번호: ' + SMT_Recv[5] + #13#10;
          sCreditMsg := sCreditMsg + '원거래승인번호 : ' + edtAuthNo.Text + #13#10 + '원거래승인일자 : ' + edtAuthDate.Text + #13#10;
          sCreditMsg := sCreditMsg + '거래일시: ' + MG_StrToStr(SMT_Recv[3] + '' + SMT_Recv[4], '####-##-## ##:##:##') + #13#10 +
                        '승인번호: ' + SMT_Recv[6] + #13#10;

          // 영수증인쇄...
          sCashCanReceipt := '';
          sCashCanReceipt := '========================================' + LF + LF + LF + CR + SO_WTP;
          sCashCanReceipt := sCashCanReceipt + '   취 소 영 수 증' + LF + LF + LF + CR + SI_WTP;

          if Length(sParkName) > 29 then
          begin
            sCashCanReceipt := sCashCanReceipt + '상 호 명 : ' + Copy(sParkName, 1, 29) + LF + CR;

            if Length(sParkName) < 58 then
              sCashCanReceipt := sCashCanReceipt + '           ' + Copy
                (sParkName, 30, Length(sParkName) - 29) + LF + CR
            else
            begin
              if Length(sParkName) < 87 then
              begin
                sCashCanReceipt := sCashCanReceipt + '           ' + Copy(sParkName, 30, 29)
                  + LF + CR;
                sCashCanReceipt := sCashCanReceipt + '           ' + Copy
                  (sParkName, 60, Length(sParkName) - 58) + LF + CR;
              end
              else
              begin
                sCashCanReceipt := sCashCanReceipt + '           ' + Copy(sParkName, 30, 29)
                  + LF + CR;
                sCashCanReceipt := sCashCanReceipt + '           ' + Copy(sParkName, 59, 29)
                  + LF + CR;
                sCashCanReceipt := sCashCanReceipt + '           ' + Copy
                  (sParkName, 88, Length(sParkName) - 87) + LF + CR;
              end;
            end;
          end
          else
            sCashCanReceipt := sCashCanReceipt + '상 호 명 : ' + sParkName + LF + CR;

          sCashCanReceipt := sCashCanReceipt + '사업자No.: ' + sRegNo + LF + CR;

          if Length(sAdmin) > 29 then
          begin
            sCashCanReceipt := sCashCanReceipt + '사업자명 : ' + Copy(sAdmin, 1, 29) + LF + CR;
            sCashCanReceipt := sCashCanReceipt + '           ' + Copy
              (sAdmin, 30, Length(sAdmin) - 29) + LF + CR;
          end
          else
            sCashCanReceipt := sCashCanReceipt + '사업자명 : ' + sAdmin + LF + CR;

          if Length(sParkAddr) > 29 then
          begin
            sCashCanReceipt := sCashCanReceipt + ' 주   소 : ' + Copy(sParkAddr, 1, 29) + LF + CR;

            if Length(sParkAddr) < 58 then
              sCashCanReceipt := sCashCanReceipt + '           ' + Copy
                (sParkAddr, 30, Length(sParkAddr) - 29) + LF + CR
            else
            begin
              if Length(sParkAddr) < 87 then
              begin
                sCashCanReceipt := sCashCanReceipt + '           ' + Copy(sParkAddr, 30, 29)
                  + LF + CR;
                sCashCanReceipt := sCashCanReceipt + '           ' + Copy
                  (sParkAddr, 60, Length(sParkAddr) - 58) + LF + CR;
              end
              else
              begin
                sCashCanReceipt := sCashCanReceipt + '           ' + Copy(sParkAddr, 30, 29)
                  + LF + CR;
                sCashCanReceipt := sCashCanReceipt + '           ' + Copy(sParkAddr, 59, 29)
                  + LF + CR;
                sCashCanReceipt := sCashCanReceipt + '           ' + Copy
                  (sParkAddr, 88, Length(sParkAddr) - 87) + LF + CR;
              end;
            end;
          end
          else
            sCashCanReceipt := sCashCanReceipt + '주   소  : ' + sParkAddr + LF + CR;

          sCashCanReceipt := sCashCanReceipt + '전화번호 : ' + sTelephone + LF + CR;
          sCashCanReceipt := sCashCanReceipt + '========================================' + LF + CR;
          sCashCanReceipt := sCashCanReceipt + sCreditMsg;
          sCashCanReceipt := sCashCanReceipt + '========================================' + LF + CR+ SO_WTP;;
          sCashCanReceipt := sCashCanReceipt + '취소금액 : ' + SMT_RECV[17] + '원' + LF + CR + SI_WTP;
          sCashCanReceipt := sCashCanReceipt + '========================================' + LF + CR;
          sLocalPrt     := sCashCanReceipt + '                             [고객용]   ' + LF + CR;

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
          sLocalPrt := sLocalPrt + sCashCanReceipt + '                             [보관용]   ' + LF + CR;

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

          sCashCanReceipt:= sLocalPrt + LF + LF + LF + LF + LF + LF + LF + LF + FullCut_WTP;
          InspectionLog('TfrmCredit_SMATRO 취소 영수증: ' + sCashCanReceipt);

          ExceptLogging('현금영수증 취소 영수증 종료');
          InspectionLog('### 현금영수증 취소 완료 ###');
          Close;
        except
          on E: Exception do begin
            ExceptLogging('현금영수증 취소 영수증 처리중 오류 발생 : ' + E.Message);
          end;
        end;
      end else begin
        InspectionLog('RecvMsg : ' + ReturnData);
        InspectionLog('[EV-CAT] 현금영수증 취소 처리 실패 : 응답코드 ' + SMT_Recv[0] + ', 응답사유 : ' + SMT_Recv[13]);
        ShowMessage('현금영수증 취소 취소 실패 : ' + SMT_Recv[13]);
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
      ExceptLogging('스마트로 현금영수증 취소 응답 처리중 오류 발생! : ' + E.Message);
    end;
  end;
end;

procedure TfrmCash_SMTCancel.FormShow(Sender: TObject);
begin
  Exceptlogging('현금영수증 발행 취소 ..');
  rb2.Checked := True;
end;

end.
