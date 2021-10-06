unit Credit_SMTCancel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, sButton, AdvEdit, sLabel,
  Vcl.ExtCtrls, Dreampos_Ocx_TLB, Vcl.OleCtrls;

type
  TfrmCredit_SMTCancel = class(TForm)
    Panel1: TPanel;
    sLabel1: TsLabel;
    Panel3: TPanel;
    lbVan: TLabel;
    Panel2: TPanel;
    edtTotAmt: TAdvEdit;
    edtAuthNo: TAdvEdit;
    edtAuthDate: TAdvEdit;
    btnCancel: TsButton;
    lbHint: TLabel;
    lbHint2: TLabel;
    btnOK: TsButton;
    dream: TDP_Certification_Ocx;
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure edtAuthNoKeyPress(Sender: TObject; var Key: Char);
    procedure dreamQueryResults(ASender: TObject; const ReturnData: WideString);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCredit_SMTCancel: TfrmCredit_SMTCancel;

implementation
uses
  Global, Tables, MainNew, Smartro;

{$R *.dfm}

procedure TfrmCredit_SMTCancel.btnCancelClick(Sender: TObject);
begin
  try
    InspectionLog('### 근무자 신용카드 승인취소 취소 ###');

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
      ExceptLogging('신용카드 승인취소 취소 중 오류 발생 : ' + E.Message);
      ExceptLogging('신용카드 단말기 초기화 중 오류.');
    end;
  end;
end;

procedure TfrmCredit_SMTCancel.btnOKClick(Sender: TObject);
begin
  try
    try
      InspectionLog('### 신용카드 취소시작 ###');
      with dream do begin
        Set_Code        := '1000';
        Set_CodeGu      := '2200';
        Set_OcxProcess  := 'OCX';
        Set_Gold        := StrToInt(edtTotAmt.Text);         //승인금액
        Set_VAT         := StrToInt(edtTotAmt.Text) div 11;  //부가세
        Set_SaleMonth   := 0;      //할부개월
        Set_SetUserCode := 'A';   // NULL을 사용 시 응답  값 에러(델파이에서만)
        Set_SetUserCode := 'A';   // NULL을 사용 시 응답  값 에러(델파이에서만)

        //원거래일
        Set_WonYYMMDD  := edtAuthDate.Text;

        //원 승인번호
        Set_WonGrantNo  := edtAuthNo.Text;
        ExceptLogging('신용카드 취소정보 금액 : ' + edtTotAmt.Text + ', 원거래일 : ' + edtAuthDate.Text + ', 원승인번호 : ' + edtAuthNo.Text);

        SendRecv;                        // NULL을 사용 시 응답  값 에러(델파이에서만)
      end;
    except
      on E: Exception do begin
        ExceptLogging('신용카드 취소 중 에러 발생! : ' + E.Message);
      end;
    end;
  finally
    InspectionLog('### 신용카드 취소종료 ###');
  end;
end;

procedure TfrmCredit_SMTCancel.dreamQueryResults(ASender: TObject;
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
        InspectionLog('[EV-CAT] 결제 취소 처리 완료');

        ExceptLogging('신용카드 영수증 시작');

        try
          sCreditMsg := 'IC신용취소' + #13#10;
          sCreditMsg:= sCreditMsg + '매입사명: ' + SMT_Recv[10] + #13#10 +
                        '가맹번호: ' + SMT_Recv[9] + #13#10;
//          sCreditMsg:= sCreditMsg + '카드번호: ' + Copy(sCardNo, 1, Pos('=', sCardNo)-1) + #13#10;
          sCreditMsg:= sCreditMsg + '카드번호: ' + SMT_Recv[5] + #13#10;
          sCreditMsg:= sCreditMsg + '원거래일자 : ' + edtAuthDate.Text + #13#10;
          sCreditMsg:= sCreditMsg + '거래일시: ' + MG_StrToStr(SMT_Recv[3] + '' + SMT_Recv[4], '####-##-## ##:##:##') + #13#10 +
                        '승인번호: ' + SMT_Recv[6] + #13#10;

          // 영수증인쇄...
          sCreditCanPrt := '';
          sCreditCanPrt := '========================================' + LF + LF + LF + CR + SO_WTP;
          sCreditCanPrt := sCreditCanPrt + '   취 소 영 수 증' + LF + LF + LF + CR + SI_WTP;

          if Length(sParkName) > 29 then
          begin
            sCreditCanPrt := sCreditCanPrt + '상 호 명 : ' + Copy(sParkName, 1, 29) + LF + CR;

            if Length(sParkName) < 58 then
              sCreditCanPrt := sCreditCanPrt + '           ' + Copy
                (sParkName, 30, Length(sParkName) - 29) + LF + CR
            else
            begin
              if Length(sParkName) < 87 then
              begin
                sCreditCanPrt := sCreditCanPrt + '           ' + Copy(sParkName, 30, 29)
                  + LF + CR;
                sCreditCanPrt := sCreditCanPrt + '           ' + Copy
                  (sParkName, 60, Length(sParkName) - 58) + LF + CR;
              end
              else
              begin
                sCreditCanPrt := sCreditCanPrt + '           ' + Copy(sParkName, 30, 29)
                  + LF + CR;
                sCreditCanPrt := sCreditCanPrt + '           ' + Copy(sParkName, 59, 29)
                  + LF + CR;
                sCreditCanPrt := sCreditCanPrt + '           ' + Copy
                  (sParkName, 88, Length(sParkName) - 87) + LF + CR;
              end;
            end;
          end
          else
            sCreditCanPrt := sCreditCanPrt + '상 호 명 : ' + sParkName + LF + CR;

          sCreditCanPrt := sCreditCanPrt + '사업자No.: ' + sRegNo + LF + CR;

          if Length(sAdmin) > 29 then
          begin
            sCreditCanPrt := sCreditCanPrt + '사업자명 : ' + Copy(sAdmin, 1, 29) + LF + CR;
            sCreditCanPrt := sCreditCanPrt + '           ' + Copy
              (sAdmin, 30, Length(sAdmin) - 29) + LF + CR;
          end
          else
            sCreditCanPrt := sCreditCanPrt + '사업자명 : ' + sAdmin + LF + CR;

          if Length(sParkAddr) > 29 then
          begin
            sCreditCanPrt := sCreditCanPrt + ' 주   소 : ' + Copy(sParkAddr, 1, 29) + LF + CR;

            if Length(sParkAddr) < 58 then
              sCreditCanPrt := sCreditCanPrt + '           ' + Copy
                (sParkAddr, 30, Length(sParkAddr) - 29) + LF + CR
            else
            begin
              if Length(sParkAddr) < 87 then
              begin
                sCreditCanPrt := sCreditCanPrt + '           ' + Copy(sParkAddr, 30, 29)
                  + LF + CR;
                sCreditCanPrt := sCreditCanPrt + '           ' + Copy
                  (sParkAddr, 60, Length(sParkAddr) - 58) + LF + CR;
              end
              else
              begin
                sCreditCanPrt := sCreditCanPrt + '           ' + Copy(sParkAddr, 30, 29)
                  + LF + CR;
                sCreditCanPrt := sCreditCanPrt + '           ' + Copy(sParkAddr, 59, 29)
                  + LF + CR;
                sCreditCanPrt := sCreditCanPrt + '           ' + Copy
                  (sParkAddr, 88, Length(sParkAddr) - 87) + LF + CR;
              end;
            end;
          end
          else
            sCreditCanPrt := sCreditCanPrt + '주   소  : ' + sParkAddr + LF + CR;

          sCreditCanPrt := sCreditCanPrt + '전화번호 : ' + sTelephone + LF + CR;
          sCreditCanPrt := sCreditCanPrt + '========================================' + LF + CR;
          sCreditCanPrt := sCreditCanPrt + sCreditMsg;

          sCreditCanPrt := sCreditCanPrt + '========================================' + LF + CR+ SO_WTP;;
          sCreditCanPrt := sCreditCanPrt + '취소금액 : ' + edtTotAmt.Text + '원' + LF + CR + SI_WTP;
          sCreditCanPrt := sCreditCanPrt + '========================================' + LF + CR;
          sLocalPrt     := sCreditCanPrt + '                             [고객용]   ' + LF + CR;

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
          sLocalPrt := sLocalPrt + sCreditCanPrt + '                             [보관용]   ' + LF + CR;

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

          sCreditCanPrt:= sLocalPrt + LF + LF + LF + LF + LF + LF + LF + LF + FullCut_WTP;
          InspectionLog('TfrmCredit_SMATRO 취소 영수증: ' + sCreditCanPrt);

           if frmMainNew.lbReceipt.Count = 10 then
            frmMainNew.lbReceipt.Items.Delete(frmMainNew.lbReceipt.Count - 1);
          frmMainNew.lbReceipt.Items.Insert(0, sPrtOutTime + '  ' + MG_Left(sNowLprCarNo1, 12)
              + '  주차요금: ' + IntToStr(nProcYogum) + '원');

          if RReceipt[9].sInOutTime <> '' then
          begin
            RReceipt[10].sInOutTime := RReceipt[9].sInOutTime;
            RReceipt[10].sRpt := RReceipt[9].sRpt;
          end;

          if RReceipt[8].sInOutTime <> '' then
          begin
            RReceipt[9].sInOutTime := RReceipt[8].sInOutTime;
            RReceipt[9].sRpt := RReceipt[8].sRpt;
          end;

          if RReceipt[7].sInOutTime <> '' then
          begin
            RReceipt[8].sInOutTime := RReceipt[7].sInOutTime;
            RReceipt[8].sRpt := RReceipt[7].sRpt;
          end;

          if RReceipt[6].sInOutTime <> '' then
          begin
            RReceipt[7].sInOutTime := RReceipt[6].sInOutTime;
            RReceipt[7].sRpt := RReceipt[6].sRpt;
          end;

          if RReceipt[5].sInOutTime <> '' then
          begin
            RReceipt[6].sInOutTime := RReceipt[5].sInOutTime;
            RReceipt[6].sRpt := RReceipt[5].sRpt;
          end;

          if RReceipt[4].sInOutTime <> '' then
          begin
            RReceipt[5].sInOutTime := RReceipt[4].sInOutTime;
            RReceipt[5].sRpt := RReceipt[4].sRpt;
          end;

          if RReceipt[3].sInOutTime <> '' then
          begin
            RReceipt[4].sInOutTime := RReceipt[3].sInOutTime;
            RReceipt[4].sRpt := RReceipt[3].sRpt;
          end;

          if RReceipt[2].sInOutTime <> '' then
          begin
            RReceipt[3].sInOutTime := RReceipt[2].sInOutTime;
            RReceipt[3].sRpt := RReceipt[2].sRpt;
          end;

          if RReceipt[1].sInOutTime <> '' then
          begin
            RReceipt[2].sInOutTime := RReceipt[1].sInOutTime;
            RReceipt[2].sRpt := RReceipt[1].sRpt;
          end;

          RReceipt[1].sInOutTime := sPrtOutTime + '  주차요금: ' + IntToStr(nProcYogum) +
            '원';
          RReceipt[1].sRpt := sCreditPrt;
          frmMainNew.btnReceipt.Enabled := True;
          ExceptLogging('신용카드 영수증 종료');
          InspectionLog('### 신용카드 결제완료 ###');
          Close;
        except
          on E: Exception do begin
            ExceptLogging('신용카드 영수증 처리중 오류 발생 : ' + E.Message);
          end;
        end;
      end else begin
        InspectionLog('RecvMsg : ' + ReturnData);
        InspectionLog('[EV-CAT] 결제 처리 실패 : 응답코드 ' + SMT_Recv[0] + ', 응답사유 : ' + SMT_Recv[13]);
        ShowMessage('결제 취소 실패 : ' + SMT_Recv[13]);
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
      ExceptLogging('스마트로 결제응답 처리중 오류 발생! : ' + E.Message);
    end;
  end;
end;

procedure TfrmCredit_SMTCancel.edtAuthNoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then
  begin
      btnOKClick(Self);
  end
end;

procedure TfrmCredit_SMTCancel.FormShow(Sender: TObject);
begin
  try
    InspectionLog('### 신용카드 취소시작 ###');
    lbVan.Caption := '결제 정보를 입력해 주세요!';
  except
    on E: Exception do
    ExceptLogging('TfrmCredit_Kis.FormShow : ' + E.Message);
  end;
end;

end.
