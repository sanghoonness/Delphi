unit Credit_SMT;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, sLabel, Vcl.ExtCtrls, sButton, AdvEdit,
  Vcl.OleCtrls, Dreampos_Ocx_TLB;

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
    btnCancel: TsButton;
    edtMsg: TAdvEdit;
    tEvent: TTimer;
    dream: TDP_Certification_Ocx;
    procedure btnCancelClick(Sender: TObject);
    procedure tEventTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dreamQueryResults(ASender: TObject; const ReturnData: WideString);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCredit_SMT: TfrmCredit_SMT;

implementation
uses
  Global, Tables, MainNew, Smartro;

{$R *.dfm}

procedure TfrmCredit_SMT.btnCancelClick(Sender: TObject);
begin
  try
    InspectionLog('### 근무자 신용카드 결제취소 ###');

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
      ExceptLogging('신용카드 취소 중 오류 발생 : ' + E.Message);
      ExceptLogging('신용카드 단말기 초기화 중 오류.');
    end;
  end;
end;

procedure TfrmCredit_SMT.dreamQueryResults(ASender: TObject;
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
      edtMsg.Text := 'EV-CAT 결제 데몬 실행상태를 확인해 주세요.';
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
      edtMsg.Text := 'IC카드 인식을 실패하였습니다. 결제를 다시 요청해주세요.';
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
        edtCardName.Text := SMT_Recv[5];
        edtJumNo.Text := SMT_Recv[7];
        edtAuthNo.Text := SMT_Recv[6];
        edtAuthDate.Text := SMT_Recv[4];
        edtMsg.Text := SMT_Recv[13];

        ExceptLogging('신용카드 결제결과 DB저장 시작');
        try
          with dmTables.qryMoneyProc do
          begin
            Close;
            SQL.Clear;
            SQL.Add('Select * from ParkInfo where ParkNo = :N1');
            Parameters.ParamByName('N1').Value := nCurrParkNo;
            Open;

            if RecordCount > 0 then begin
              sParkName := FieldByName('ParkName').AsString;
              sParkAddr := FieldByName('ParkAddr').AsString;
              sRegNo := FieldByName('RegNo').AsString;
              sAdmin := FieldByName('Admin').AsString;
              sTelephone := FieldByName('Telephone').AsString;
              sReceipt := FieldByName('Receipt').AsString;
              ExceptLogging('주차장 정보 조회 완료');
            end else begin
              ExceptLogging('등록된 주차장 정보가 없음!');
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
            Parameters.ParamByName('N7') .Value:= Copy(SMT_Recv[5], 1, 6)+'0000000000';
            Parameters.ParamByName('N8') .Value:= StrToInt(SMT_Recv[17]);
            Parameters.ParamByName('N9') .Value:= MG_StrToStr(SMT_Recv[3], '####-##-##');
            Parameters.ParamByName('N10') .Value:= MG_StrToStr(SMT_Recv[4], '##:##:##');
            Parameters.ParamByName('N11') .Value:= SMT_Recv[6];
            Parameters.ParamByName('N12') .Value:= SMT_Recv[10];
            Parameters.ParamByName('N13') .Value:= SMT_Recv[1];
            Parameters.ParamByName('N14') .Value:= sNowLprCarNo1;
            Parameters.ParamByName('N15') .Value:= sNowInTKNo;
            Parameters.ParamByName('N16') .Value:= SMT_Recv[10];
            Parameters.ParamByName('N17') .Value:= '신용카드';
            Parameters.ParamByName('N18') .Value:= '일반결제';

            ExceptLogging('결제정보 저장 쿼리 : ' + SQL.GetText);
            ExceptLogging('쿼리 변수 : N1 : ' + IntToStr(nCurrParkNo) +
                          ', N2 : ' + IntToStr(nCurrUnitNo) +
                          ', N3 : ' + FormatDateTime('YYYY-MM-DD', Now) +
                          ', N4 : ' + FormatDateTime('HH:NN:SS', Now) +
                          ', N5 : ' + IntToStr(nCurrMNo) +
                          ', N6 : ' + IntToStr(1) +
                          ', N7 : ' + Copy(SMT_Recv[5], 1, 6)+'0000000000' +
                          ', N8 : ' + SMT_Recv[17] +
                          ', N9 : ' + MG_StrToStr(SMT_Recv[3], '####-##-##') +
                          ', N10 : ' + MG_StrToStr(SMT_Recv[4], '##:##:##') +
                          ', N11 : ' + SMT_Recv[6] +
                          ', N12 : ' + SMT_Recv[10] +
                          ', N13 : ' + SMT_Recv[1] +
                          ', N14 : ' + sNowLprCarNo1 +
                          ', N15 : ' + sNowInTKNo +
                          ', N16 : ' + SMT_Recv[10] +
                          ', N17 : ' + '신용카드' +
                          ', N18 : ' + '일반결제');
            ExecSQL;
          end;
        except
          on E: Exception do begin
            ExceptLogging('신용카드결제결과 DB저장중 오류 발생 ');
          end;
        end;
        ExceptLogging('신용카드 결제결과 DB저장 종료');

        ExceptLogging('신용카드 영수증 시작');

        try
          sCreditMsg := 'IC신용결제' + #13#10;
          sCreditMsg:= sCreditMsg + '매입사명: ' + SMT_Recv[10] + #13#10 +
                        '가맹번호: ' + SMT_Recv[9] + #13#10;
//          sCreditMsg:= sCreditMsg + '카드번호: ' + Copy(sCardNo, 1, Pos('=', sCardNo)-1) + #13#10;
          sCreditMsg:= sCreditMsg + '카드번호: ' + SMT_Recv[5] + #13#10;

          sCreditMsg:= sCreditMsg + '거래일시: ' + MG_StrToStr(SMT_Recv[3] + '' + SMT_Recv[4], '####-##-## ##:##:##') + #13#10 +
                        '승인번호: ' + SMT_Recv[6] + #13#10;

          // 영수증인쇄...
          sCreditPrt := '';
          sCreditPrt := '========================================' + LF + LF + LF + CR + SO_WTP;
          sCreditPrt := sCreditPrt + '    영   수   증' + LF + LF + LF + CR + SI_WTP;

          if Length(sParkName) > 29 then
          begin
            sCreditPrt := sCreditPrt + '상 호 명 : ' + Copy(sParkName, 1, 29) + LF + CR;

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
            sCreditPrt := sCreditPrt + '상 호 명 : ' + sParkName + LF + CR;

          sCreditPrt := sCreditPrt + '사업자No.: ' + sRegNo + LF + CR;

          if Length(sAdmin) > 29 then
          begin
            sCreditPrt := sCreditPrt + '사업자명 : ' + Copy(sAdmin, 1, 29) + LF + CR;
            sCreditPrt := sCreditPrt + '           ' + Copy
              (sAdmin, 30, Length(sAdmin) - 29) + LF + CR;
          end
          else
            sCreditPrt := sCreditPrt + '사업자명 : ' + sAdmin + LF + CR;

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
            sCreditPrt := sCreditPrt + '주   소  : ' + sParkAddr + LF + CR;

          sCreditPrt := sCreditPrt + '전화번호 : ' + sTelephone + LF + CR;
          sCreditPrt := sCreditPrt + '========================================' + LF + CR;
          sCreditPrt := sCreditPrt + sCreditMsg;
          sCreditPrt := sCreditPrt + '========================================' + LF + CR;
          sCreditPrt := sCreditPrt + '주차정보' + LF + CR;
          sCreditPrt := sCreditPrt + '차량번호 : ' + sNowLprCarNo1 + LF + CR;
          sCreditPrt := sCreditPrt + '입차일시 : ' + sNowInDate + ' ' + sNowInTime + LF + CR;
          sCreditPrt := sCreditPrt + '출차일시 : ' + sNowOutDate + ' ' + sNowOutTime + LF + CR;
          sCreditPrt := sCreditPrt + '주차시간 : ' + frmMainNew.lbParkingTime.Caption + LF + CR;
          sCreditPrt := sCreditPrt + '근 무 자 : ' + sCurrMName + LF + CR;
          sCreditPrt := sCreditPrt + '========================================' + LF + CR;
          sCreditPrt := sCreditPrt + '주차요금정보' + LF + CR;
          if nDCCnt > 0 then
          begin
            sCreditPrt := sCreditPrt + '전체요금 : ' + frmMainNew.edtTotYogum.Text + '원' + LF + CR;
            sCreditPrt := sCreditPrt + '할인금액 : ' + frmMainNew.edtDCYogum.Text + '원' + LF + CR;

            if nDCCnt > 0 then
              for i := 1 to nDCCnt do
                //if DCProc[i].nDCAmt > 0 then
                if DCProc[i].sDCName <> '' then
                begin
                  if i = 1 then
                    sCreditPrt:= sCreditPrt + '할인내용 : ' + DCProc[i].sDCName + LF + CR
                  else
                    sCreditPrt := sCreditPrt + '           ' + DCProc[i].sDCName + LF + CR;
                end;
            sCreditPrt := sCreditPrt + '받은금액 : ' + frmMainNew.edtProcYogum.Text + '원' + LF + CR;
          end
          else
          begin
            sCreditPrt := sCreditPrt + '주차요금 : ' + frmMainNew.edtProcYogum.Text + '원' + LF + CR;
            sCreditPrt := sCreditPrt + '할인금액 : 0 원' + LF + CR;
            sCreditPrt := sCreditPrt + '받은금액 : ' + frmMainNew.edtProcYogum.Text + '원' + LF + CR;
          end;

          sCreditPrt := sCreditPrt + '========================================' + LF + CR+ SO_WTP;;
          sCreditPrt := sCreditPrt + '결제금액 : ' + IntToStr(nProcYogum) + '원' + LF + CR + SI_WTP;
          sCreditPrt := sCreditPrt + '========================================' + LF + CR;
          sLocalPrt  := sCreditPrt + '                             [고객용]   ' + LF + CR;

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
          InspectionLog('TfrmCredit_SMATRO 영수증: ' + sCreditPrt);

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
          bGoodCredit := True;
          ExceptLogging('신용카드 영수증 종료');
          bGoodCredit := True;
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
        ShowMessage('결제 처리 실패 : ' + SMT_Recv[13]);
        bGoodCredit := False;
      end;
      SplitDataRecv.Free;

      Close;
    end else begin
      //00이외에는 전부 신용승인거절
      InspectionLog('RecvMsg : ' + ReturnData);
      edtMsg.Text := ReturnData;
      Exit;
    end;
    {$ENDREGION}
  except
    on E: Exception do begin
      ExceptLogging('스마트로 결제응답 처리중 오류 발생! : ' + E.Message);
    end;
  end;
end;

procedure TfrmCredit_SMT.FormShow(Sender: TObject);
begin
  tEvent.Enabled := True;
end;

procedure TfrmCredit_SMT.tEventTimer(Sender: TObject);
begin
  tEvent.Enabled := false;
  try
//    try
      InspectionLog('### 신용카드 결제시작 ###');
      with dream do begin
        Set_Code        := '1000';                      //결제방법
        Set_CodeGu      := '1100';                      //제어방법
        Set_OcxProcess  := 'OCX';
        Set_Gold        := IntToStr(nProcYogum);        //승인금액
        Set_VAT         := IntToStr(nProcYogum div 11); //부가세
        Set_SaleMonth   := 0;                           //할부개월
        Set_SetUserCode := 'A';                         // NULL을 사용 시 응답  값 에러(델파이에서만)
        ExceptLogging('신용카드 등록정보 금액 : ' + IntToStr(nProcYogum));
        SendRecv;
      end;
//    except
//      on E: Exception do begin
//        ExceptLogging('신용카드 결제 중 에러 발생! : ' + E.Message);
//      end;
//    end;
  finally
    InspectionLog('### 신용카드 결제종료 ###');
  end;
end;

end.
