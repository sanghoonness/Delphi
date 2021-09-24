unit Cancel_Coces;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, sButton, AdvEdit, sLabel, Vcl.ExtCtrls, Vcl.Mask, AdvSpin;

type
  TfrmCancel_Coces = class(TForm)
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
    procedure btnCreditCancelClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure tEventTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCancel_Coces: TfrmCancel_Coces;

implementation
uses
  Global,Tables, Koces;

{$R *.dfm}

procedure TfrmCancel_Coces.btnCancelClick(Sender: TObject);
var
  sData, sError: aString;
  pError: PAnsiChar;
  nResult: Integer;
begin
  close;
end;

procedure TfrmCancel_Coces.btnCreditCancelClick(Sender: TObject);
var
  sResult : TArray<String>;
  sError, sRecv, sHex, sType, sCardNo, sAmt, sVat, sNo, sTime,
  sCardName, sJumCode, sMsg, sCheck, sLocalPrt, sData, sReply: aString;
//  sData, sError: aString;
//  nAmt, nVat, nResult: Integer;
begin
    InspectionLog('### 신용카드 결제시작 ###');
    //단말기로 승인요청 전송...
    InspectionLog('주차요금 신용카드 송신 : ' + edtPrvAmt.Text);
//  sResult := Koces.CardPay('Cancel', 승인금액, 승인번호, 승인일시);
    sResult := Koces.CardPay('Cancel', edtPrvAmt.Text, edtPrvAuthNo.Text, edtPrvAuthDate.Text);
    if sResult[0] = '0' then
    begin
      InspectionLog('신용취소');
      //카드번호
      sCardNo:= Copy(sResult[6], 1, 4) + '-' +  Copy(sResult[6], 5, 2) + '**-****-****';
      //금액
      sAmt:= edtPrvAmt.Text;
    //승인번호
      sNo := sResult[2];
      edtAuthNo.Text:= sNo;

    //승인일시
      sTime:= sResult[1];
      edtAuthDate.Text:= Copy(sTime, 1, 8);

    //카드사명
      sCardName:= sResult[3];
      edtCardName.Text:= sCardName;

    //가맹점코드
      sJumCode:= sResult[7];
      edtJumNo.Text:= sJumCode;

      sMsg:= sMsg + '카드종류: ' + sCardName + #13#10 +
                    '가맹번호: ' + sJumCode + #13#10;

      sMsg:= sMsg + '카드번호: ' + sCardNo + #13#10;

      sMsg:= sMsg + '거래일시: ' + MG_StrToStr(sTime, '####-##-## ##:##:##') + #13#10 +
                    '승인번호: ' + sNo + #13#10;
      sMsg:= sMsg + '결제금액: ' + FormatFloat('#,##0', StrToInt(sAmt)) + '원' + #13#10;
      InspectionLog('주차요금 신용카드 수신 : ' + sAmt );
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
      InspectionLog('### 신용카드 승인취소 완료 ###');
      Close;
    end
    else
    begin
      sError:= sResult[8];
      edtMsg.Text:= sError;
      ShowMessage(sReply + #13#10 + '메시지 확인 후 다시 시도하여주세요!');
      Close;
    end;
    InspectionLog('주차요금 전문 송신 : ' + sData );
end;

procedure TfrmCancel_Coces.FormShow(Sender: TObject);
begin
  InspectionLog('### 신용카드 승인취소 시작 ###');
  //tEvent.Enabled:= True;
end;

procedure TfrmCancel_Coces.tEventTimer(Sender: TObject);
var
  pHex, pRecv, pError: pAnsiChar;
  CMD, GCD, JCD, RCD: integer;
  nResult, nPos, nReplyCode: integer;
  sRecv, sHex, sType, sCardNo, sAmt, sVat, sNo, sTime,
  sCardName, sJumCode, sMsg, sCheck, sLocalPrt, sData, sReply: aString;
begin
//  tEvent.Enabled:= False;
//  getmem(pHex, 4096);
//  getmem(pRecv, 4096);
//
//  try
//    nResult:= 0;//KGetEvent(CMD, GCD, JCD, RCD, pRecv, pHex);
//    sRecv:= pRecv;
//    sHex := pHex;
//    nPos:= 0;
//    //InspectionLog('<<<(' + IntToStr(nResult) + ')' + sRecv);
//
//    if sRecv = '' then
//      Exit;
//
//    if nResult >= 0 then
//    begin
//      nReplyCode:= StrToInt(Copy(sRecv, 3, 4));
//
//      if (Pos('I1', sRecv) > 0) or (Pos('D1', sRecv) > 0) or (Pos('B1', sRecv) > 0) or
//         (Pos('I2', sRecv) > 0) or (Pos('I4', sRecv) > 0) or (Pos('D2', sRecv) > 0) or (Pos('D4', sRecv) > 0) then
//      begin
//        if nReplyCode = 0 then
//        begin
//          bGoodCredit:= True;
//
//          if Pos('I1', sRecv) > 0 then
//          begin
//            //IC승인
//            nPos:= Pos('I1', sRecv);
//            sType:= 'I1';
//            sMsg:= 'IC신용결제'+#13#10;
//          end
//          else
//          if Pos('D1', sRecv) > 0 then
//          begin
//            //마그네틱승인
//            nPos:= Pos('D1', sRecv);
//            sType:= 'D1';
//            sMsg:= '신용결제'+#13#10;
//          end
//          else
//          if Pos('B1', sRecv) > 0 then
//          begin
//            //현금영수증
//            nPos:= Pos('B1', sRecv);
//            sType:= 'B1';
//            sMsg:= '현금영수증'+#13#10;
//          end
//          else
//          if Pos('I2', sRecv) > 0 then
//          begin
//            //IC승인당일취소
//            nPos:= Pos('I2', sRecv);
//            sType:= 'I2';
//            sMsg:= 'IC신용결제취소'+#13#10;
//          end
//          else
//          if Pos('I4', sRecv) > 0 then
//          begin
//            //IC승인전일취소
//            nPos:= Pos('I4', sRecv);
//            sType:= 'I4';
//            sMsg:= 'IC신용결제취소'+#13#10;
//          end
//          else
//          if Pos('D2', sRecv) > 0 then
//          begin
//            //마그네틱승인당일취소
//            nPos:= Pos('D2', sRecv);
//            sType:= 'D2';
//            sMsg:= '신용결제취소'+#13#10;
//          end
//          else
//          if Pos('D4', sRecv) > 0 then
//          begin
//            //마그네틱승인전일취소
//            nPos:= Pos('D4', sRecv);
//            sType:= 'D4';
//            sMsg:= '신용결제취소'+#13#10;
//          end;
//
//          if Copy(sRecv, nPos+2, 4) = '9999' then
//          begin
//            //단말기에서 취소...
//            InspectionLog('### 단말기에서 취소 ###');
//            Close;
//            Exit;
//          end;
//          InspectionLog(sMsg);
//
//          //카드번호
//          sCardNo:= MG_StrTrim(Copy(sRecv, nPos+15, 40), ' ');
//
//          //직전거래취소 체크위해...
//          sCheck:= MG_StrTrim(Copy(sRecv, nPos+14, 41), ' ');
//
//          //금액
//          sAmt:= MG_StrTrim(Copy(sRecv, nPos+57, 8), ' ');
//          //부가세
//          sVat:= MG_StrTrim(Copy(sRecv, nPos+73, 8), ' ');
//          //승인번호
//          sNo:= MG_StrTrim(Copy(sRecv, nPos+81, 12), ' ');
//          edtAuthNo.Text:= sNo;
//
//          //승인일시
//          sTime:= MG_StrTrim(Copy(sRecv, nPos+93, 12), ' ');
//          edtAuthDate.Text:= Copy(sTime, 1, 6);
//
//          //카드사명
//          sCardName:= MG_StrTrim(Copy(sRecv, nPos+108, 20), ' ');
//          edtCardName.Text:= sCardName;
//
//          //가맹점코드
//          sJumCode:= MG_StrTrim(Copy(sRecv, nPos+128, 12), ' ');
//          edtJumNo.Text:= sJumCode;
//
//          sMsg:= sMsg + '카드종류: ' + sCardName + #13#10 +
//                        '가맹번호: ' + sJumCode + #13#10;
//
//          if sType = 'B1' then
//            sMsg:= sMsg + '식별번호: ' + Copy(sCardNo, 1, 3) + '-' + '****' + '-' + Copy(sCardNo, 8, 4) + #13#10
//          else
//            sMsg:= sMsg + '카드번호: ' + Copy(sCardNo, 1, Pos('=', sCardNo)-1) + #13#10;
//
//          sMsg:= sMsg + '거래일시: ' + MG_StrToStr('20' + sTime, '####-##-## ##:##:##') + #13#10 +
//                        '승인번호: ' + sNo + #13#10;
//          if (sType = 'I1') or (sType = 'D1') or (sType = 'B1') then
//          begin
//            sMsg:= sMsg + '결제금액: ' + FormatFloat('#,##0', StrToInt(sAmt)) + '원' + #13#10;
//          end
//          else
//          begin
//            sMsg:= sMsg + '결제금액: ' + '-' + FormatFloat('#,##0', StrToInt(sAmt)) + '원' + #13#10;
//          end;
////          if (sType = 'I1') or (sType = 'D1') or (sType = 'B1') then
////          begin
////            sMsg:= sMsg + '거래금액: ' + FormatFloat('#,##0', StrToInt(sAmt)-StrToInt(sVat)) + '원' + #13#10 +
////                          '부 가 세: ' + FormatFloat('#,##0', StrToInt(sVat)) + '원' + #13#10 +
////                          '결제금액: ' + FormatFloat('#,##0', StrToInt(sAmt)) + '원' + #13#10;
////          end
////          else
////          begin
////            sMsg:= sMsg + '거래금액: ' + '-' + FormatFloat('#,##0', StrToInt(sAmt)-StrToInt(sVat)) + '원' + #13#10 +
////                          '부 가 세: ' + '-' + FormatFloat('#,##0', StrToInt(sVat)) + '원' + #13#10 +
////                          '결제금액: ' + '-' + FormatFloat('#,##0', StrToInt(sAmt)) + '원' + #13#10;
////          end;
//          with dmTables.qryMoneyProc do
//          begin
//            Close;
//            SQL.Clear;
//            SQL.Add('Select * from ParkInfo where ParkNo = :N1');
//            Parameters.ParamByName('N1').Value := nCurrParkNo;
//            Open;
//
//            if RecordCount > 0 then
//            begin
//              sParkName := FieldByName('ParkName').AsString;
//              sParkAddr := FieldByName('ParkAddr').AsString;
//              sRegNo := FieldByName('RegNo').AsString;
//              sAdmin := FieldByName('Admin').AsString;
//              sTelephone := FieldByName('Telephone').AsString;
//              sReceipt := FieldByName('Receipt').AsString;
//            end;
//          end;
//          //단말기에서 직전거래 취소를 했으면...
//          //if sCardName = sCheck then
//          //  sMsg:= sMsg + '### 직전거래 취소 ###' + #13#10;
//
//          // 영수증인쇄...
//          sCreditPrt := '';
//          sCreditPrt := '========================================' + LF + LF + LF + CR + SO_WTP;
//          sCreditPrt := sCreditPrt + '   승인취소영수증' + LF + LF + LF + CR + SI_WTP;
//
//          if Length(sParkName) > 29 then
//          begin
//            sCreditPrt := sCreditPrt + '주차장명 : ' + Copy(sParkName, 1, 29) + LF + CR;
//
//            if Length(sParkName) < 58 then
//              sCreditPrt := sCreditPrt + '           ' + Copy
//                (sParkName, 30, Length(sParkName) - 29) + LF + CR
//            else
//            begin
//              if Length(sParkName) < 87 then
//              begin
//                sCreditPrt := sCreditPrt + '           ' + Copy(sParkName, 30, 29)
//                  + LF + CR;
//                sCreditPrt := sCreditPrt + '           ' + Copy
//                  (sParkName, 60, Length(sParkName) - 58) + LF + CR;
//              end
//              else
//              begin
//                sCreditPrt := sCreditPrt + '           ' + Copy(sParkName, 30, 29)
//                  + LF + CR;
//                sCreditPrt := sCreditPrt + '           ' + Copy(sParkName, 59, 29)
//                  + LF + CR;
//                sCreditPrt := sCreditPrt + '           ' + Copy
//                  (sParkName, 88, Length(sParkName) - 87) + LF + CR;
//              end;
//            end;
//          end
//          else
//            sCreditPrt := sCreditPrt + '주차장명 : ' + sParkName + LF + CR;
//
//          if Length(sParkAddr) > 29 then
//          begin
//            sCreditPrt := sCreditPrt + ' 주   소 : ' + Copy(sParkAddr, 1, 29) + LF + CR;
//
//            if Length(sParkAddr) < 58 then
//              sCreditPrt := sCreditPrt + '           ' + Copy
//                (sParkAddr, 30, Length(sParkAddr) - 29) + LF + CR
//            else
//            begin
//              if Length(sParkAddr) < 87 then
//              begin
//                sCreditPrt := sCreditPrt + '           ' + Copy(sParkAddr, 30, 29)
//                  + LF + CR;
//                sCreditPrt := sCreditPrt + '           ' + Copy
//                  (sParkAddr, 60, Length(sParkAddr) - 58) + LF + CR;
//              end
//              else
//              begin
//                sCreditPrt := sCreditPrt + '           ' + Copy(sParkAddr, 30, 29)
//                  + LF + CR;
//                sCreditPrt := sCreditPrt + '           ' + Copy(sParkAddr, 59, 29)
//                  + LF + CR;
//                sCreditPrt := sCreditPrt + '           ' + Copy
//                  (sParkAddr, 88, Length(sParkAddr) - 87) + LF + CR;
//              end;
//            end;
//          end
//          else
//            sCreditPrt := sCreditPrt + ' 주   소 : ' + sParkAddr + LF + CR;
//
//          sCreditPrt := sCreditPrt + '등록번호 : ' + sRegNo + LF + CR;
//
//          if Length(sAdmin) > 29 then
//          begin
//            sCreditPrt := sCreditPrt + '대표자명 : ' + Copy(sAdmin, 1, 29) + LF + CR;
//            sCreditPrt := sCreditPrt + '           ' + Copy
//              (sAdmin, 30, Length(sAdmin) - 29) + LF + CR;
//          end
//          else
//            sCreditPrt := sCreditPrt + '대표자명 : ' + sAdmin + LF + CR;
//
//          sCreditPrt := sCreditPrt + '전화번호 : ' + sTelephone + LF + CR;
//          sCreditPrt := sCreditPrt + '========================================' + LF + CR;
//          sCreditPrt := sCreditPrt + sMsg;
//          sCreditPrt := sCreditPrt + '========================================' + LF + CR;
//
//          sLocalPrt := sCreditPrt + '                             [고객용]   ' + LF + CR;
//
//          if Length(sReceipt) > 40 then
//          begin
//            sLocalPrt := sLocalPrt + Copy(sReceipt, 1, 40) + LF + CR;
//
//            if Length(sReceipt) < 80 then
//              sLocalPrt := sLocalPrt + Copy(sReceipt, 41, Length(sReceipt) - 40) + LF + CR
//            else
//            begin
//              sLocalPrt := sLocalPrt + Copy(sReceipt, 41, 40) + LF + CR;
//              sLocalPrt := sLocalPrt + Copy(sReceipt, 81, Length(sReceipt) - 80) + LF + CR;
//            end;
//          end
//          else
//            sLocalPrt := sLocalPrt + sReceipt + LF + CR;
//
//          sLocalPrt := sLocalPrt + LF + LF + LF + LF + LF + LF + LF + LF + FullCut_WTP;
//          sLocalPrt := sLocalPrt + sCreditPrt + '                             [보관용]   ' + LF + CR;
//
//          if Length(sReceipt) > 40 then
//          begin
//            sLocalPrt := sLocalPrt + Copy(sReceipt, 1, 40) + LF + CR;
//
//            if Length(sReceipt) < 80 then
//              sLocalPrt := sLocalPrt + Copy(sReceipt, 41, Length(sReceipt) - 40) + LF + CR
//            else
//            begin
//              sLocalPrt := sLocalPrt + Copy(sReceipt, 41, 40) + LF + CR;
//              sLocalPrt := sLocalPrt + Copy(sReceipt, 81, Length(sReceipt) - 80) + LF + CR;
//            end;
//          end
//          else
//            sLocalPrt := sLocalPrt + sReceipt + LF + CR;
//
//          sCreditPrt:= sLocalPrt + LF + LF + LF + LF + LF + LF + LF + LF + FullCut_WTP;
//          bClose:= True;
//          InspectionLog('### 신용카드 승인취소 완료 ###');
//          Close;
//        end
//        else
//        begin
//          sReply:= Copy(sRecv, nPos+6, 64);
//          edtMsg.Text:= sReply;
//          InspectionLog(sReply);
//          bGoodCredit:= False;
//          bClose:= True;
//          ShowMessage(sReply + #13#10 + '메시지 확인 후 다시 시도하여주세요!');
//          Close;
//        end;
//      end
//      else
//      begin
//        if (nReplyCode <> 9993) and (nReplyCode <> 9994) then
//        begin
//          sReply:= Copy(sRecv, 7, 64);
//          edtMsg.Text:= sReply;
//          InspectionLog(sReply);
//          bGoodCredit:= False;
//          bClose:= True;
//          ShowMessage(sReply + #13#10 + '메시지 확인 후 다시 시도하여주세요!');
//          Close;
//        end;
//      end;
//    end;
//  finally
//    freeMem(pHex);
//    freeMem(pRecv);
//
//    if not bClose then
//      tEvent.Enabled:= True;
//  end;
end;

end.
