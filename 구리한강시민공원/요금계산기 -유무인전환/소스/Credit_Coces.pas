unit Credit_Coces;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, sLabel, Vcl.ExtCtrls, sButton, AdvEdit;

type
  TfrmCredit_Coces = class(TForm)
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
    tEvent: TTimer;
    edtMsg: TAdvEdit;
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tEventTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCredit_Coces: TfrmCredit_Coces;

implementation
uses
  Global,Tables,Koces;

{$R *.dfm}

procedure TfrmCredit_Coces.btnCancelClick(Sender: TObject);
var
  sData, sError: aString;
  nResult: Integer;
begin
  try
    InspectionLog('### 근무자 신용카드 결제취소 ###');

    Close;
  finally
  end;
end;

procedure TfrmCredit_Coces.FormShow(Sender: TObject);
var
  nResult, nVat: Integer;
  sData, sError: aString;
  sRecv, sCardNo, sAmt, sVat, sNo, sTime,
  sCardName, sJumCode, sMsg, sLocalPrt, sReply: aString;
  sResult : TArray<String>;
begin
  tEvent.Enabled:= True;
end;

procedure TfrmCredit_Coces.tEventTimer(Sender: TObject);
var
  pHex, pRecv, pError: pAnsiChar;
  CMD, GCD, JCD, RCD: integer;
  nResult, nPos, nReplyCode: integer;
  sError, sRecv, sHex, sType, sCardNo, sAmt, sVat, sNo, sTime,
  sCardName, sJumCode, sMsg, sCheck, sLocalPrt, sData, sReply: aString;
  sResult : TArray<String>;
begin
  tEvent.Enabled:= False;
  try
    InspectionLog('### 신용카드 결제시작 ###');
    //단말기로 승인요청 전송...
//    nProcYogum := 1004;
    InspectionLog('주차요금 신용카드 송신 : ' + IntToStr(nProcYogum));
    sResult := Koces.CardPay('Card', IntToStr(nProcYogum), ' ', ' ');
    if (sResult[0] = '0') and (sResult[11] ='0000') then
    begin
      InspectionLog('신용결제');
      //카드번호
      sCardNo:= Copy(sResult[6], 1, 4) + '-' +  Copy(sResult[6], 5, 2) + '**-****-****';
      //금액
      sAmt:= IntToStr(nProcYogum);
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

//      sLocalPrt := sLocalPrt + LF + LF + LF + LF + LF + LF + LF + LF + FullCut_WTP;
//      sLocalPrt := sLocalPrt + sCreditPrt + '                             [보관용]   ' + LF + CR;
//
//      if Length(sReceipt) > 40 then
//      begin
//        sLocalPrt := sLocalPrt + Copy(sReceipt, 1, 40) + LF + CR;
//
//        if Length(sReceipt) < 80 then
//          sLocalPrt := sLocalPrt + Copy(sReceipt, 41, Length(sReceipt) - 40) + LF + CR
//        else
//        begin
//          sLocalPrt := sLocalPrt + Copy(sReceipt, 41, 40) + LF + CR;
//          sLocalPrt := sLocalPrt + Copy(sReceipt, 81, Length(sReceipt) - 80) + LF + CR;
//        end;
//      end
//      else
//        sLocalPrt := sLocalPrt + sReceipt + LF + CR;

      sCreditPrt:= sLocalPrt + LF + LF + LF + LF + LF + LF + LF + LF + FullCut_WTP;
      InspectionLog('### 신용카드 결제완료 ###');
      bGoodCredit := True;
      Close;
    end
    else
    begin
      sError:= sResult[8];
      edtMsg.Text:= sError;
      InspectionLog('### 신용카드 결제에러 ###'+ sError);
      ShowMessage(sReply + #13#10 + '메시지 확인 후 다시 시도하여주세요!');
      Close;
    end;
    InspectionLog('주차요금 전문 송신 : ' + sData );
  finally
  end;
end;

end.
