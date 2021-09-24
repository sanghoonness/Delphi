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
    InspectionLog('### �ſ�ī�� �������� ###');
    //�ܸ���� ���ο�û ����...
    InspectionLog('������� �ſ�ī�� �۽� : ' + edtPrvAmt.Text);
//  sResult := Koces.CardPay('Cancel', ���αݾ�, ���ι�ȣ, �����Ͻ�);
    sResult := Koces.CardPay('Cancel', edtPrvAmt.Text, edtPrvAuthNo.Text, edtPrvAuthDate.Text);
    if sResult[0] = '0' then
    begin
      InspectionLog('�ſ����');
      //ī���ȣ
      sCardNo:= Copy(sResult[6], 1, 4) + '-' +  Copy(sResult[6], 5, 2) + '**-****-****';
      //�ݾ�
      sAmt:= edtPrvAmt.Text;
    //���ι�ȣ
      sNo := sResult[2];
      edtAuthNo.Text:= sNo;

    //�����Ͻ�
      sTime:= sResult[1];
      edtAuthDate.Text:= Copy(sTime, 1, 8);

    //ī����
      sCardName:= sResult[3];
      edtCardName.Text:= sCardName;

    //�������ڵ�
      sJumCode:= sResult[7];
      edtJumNo.Text:= sJumCode;

      sMsg:= sMsg + 'ī������: ' + sCardName + #13#10 +
                    '���͹�ȣ: ' + sJumCode + #13#10;

      sMsg:= sMsg + 'ī���ȣ: ' + sCardNo + #13#10;

      sMsg:= sMsg + '�ŷ��Ͻ�: ' + MG_StrToStr(sTime, '####-##-## ##:##:##') + #13#10 +
                    '���ι�ȣ: ' + sNo + #13#10;
      sMsg:= sMsg + '�����ݾ�: ' + FormatFloat('#,##0', StrToInt(sAmt)) + '��' + #13#10;
      InspectionLog('������� �ſ�ī�� ���� : ' + sAmt );
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
      //�ܸ��⿡�� �����ŷ� ��Ҹ� ������...
      //if sCardName = sCheck then
      //  sMsg:= sMsg + '### �����ŷ� ��� ###' + #13#10;

      // �������μ�...
      sCreditPrt := '';
      sCreditPrt := '========================================' + LF + LF + LF + CR + SO_WTP;
      sCreditPrt := sCreditPrt + '   ������ҿ�����' + LF + LF + LF + CR + SI_WTP;

      if Length(sParkName) > 29 then
      begin
        sCreditPrt := sCreditPrt + '������� : ' + Copy(sParkName, 1, 29) + LF + CR;

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
        sCreditPrt := sCreditPrt + '������� : ' + sParkName + LF + CR;

      if Length(sParkAddr) > 29 then
      begin
        sCreditPrt := sCreditPrt + ' ��   �� : ' + Copy(sParkAddr, 1, 29) + LF + CR;

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
        sCreditPrt := sCreditPrt + ' ��   �� : ' + sParkAddr + LF + CR;

      sCreditPrt := sCreditPrt + '��Ϲ�ȣ : ' + sRegNo + LF + CR;

      if Length(sAdmin) > 29 then
      begin
        sCreditPrt := sCreditPrt + '��ǥ�ڸ� : ' + Copy(sAdmin, 1, 29) + LF + CR;
        sCreditPrt := sCreditPrt + '           ' + Copy
          (sAdmin, 30, Length(sAdmin) - 29) + LF + CR;
      end
      else
        sCreditPrt := sCreditPrt + '��ǥ�ڸ� : ' + sAdmin + LF + CR;

      sCreditPrt := sCreditPrt + '��ȭ��ȣ : ' + sTelephone + LF + CR;
      sCreditPrt := sCreditPrt + '========================================' + LF + CR;
      sCreditPrt := sCreditPrt + sMsg;
      sCreditPrt := sCreditPrt + '========================================' + LF + CR;
      sLocalPrt := sCreditPrt + '                             [����]   ' + LF + CR;

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
      sLocalPrt := sLocalPrt + sCreditPrt + '                             [������]   ' + LF + CR;

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
      InspectionLog('### �ſ�ī�� ������� �Ϸ� ###');
      Close;
    end
    else
    begin
      sError:= sResult[8];
      edtMsg.Text:= sError;
      ShowMessage(sReply + #13#10 + '�޽��� Ȯ�� �� �ٽ� �õ��Ͽ��ּ���!');
      Close;
    end;
    InspectionLog('������� ���� �۽� : ' + sData );
end;

procedure TfrmCancel_Coces.FormShow(Sender: TObject);
begin
  InspectionLog('### �ſ�ī�� ������� ���� ###');
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
//            //IC����
//            nPos:= Pos('I1', sRecv);
//            sType:= 'I1';
//            sMsg:= 'IC�ſ����'+#13#10;
//          end
//          else
//          if Pos('D1', sRecv) > 0 then
//          begin
//            //���׳�ƽ����
//            nPos:= Pos('D1', sRecv);
//            sType:= 'D1';
//            sMsg:= '�ſ����'+#13#10;
//          end
//          else
//          if Pos('B1', sRecv) > 0 then
//          begin
//            //���ݿ�����
//            nPos:= Pos('B1', sRecv);
//            sType:= 'B1';
//            sMsg:= '���ݿ�����'+#13#10;
//          end
//          else
//          if Pos('I2', sRecv) > 0 then
//          begin
//            //IC���δ������
//            nPos:= Pos('I2', sRecv);
//            sType:= 'I2';
//            sMsg:= 'IC�ſ�������'+#13#10;
//          end
//          else
//          if Pos('I4', sRecv) > 0 then
//          begin
//            //IC�����������
//            nPos:= Pos('I4', sRecv);
//            sType:= 'I4';
//            sMsg:= 'IC�ſ�������'+#13#10;
//          end
//          else
//          if Pos('D2', sRecv) > 0 then
//          begin
//            //���׳�ƽ���δ������
//            nPos:= Pos('D2', sRecv);
//            sType:= 'D2';
//            sMsg:= '�ſ�������'+#13#10;
//          end
//          else
//          if Pos('D4', sRecv) > 0 then
//          begin
//            //���׳�ƽ�����������
//            nPos:= Pos('D4', sRecv);
//            sType:= 'D4';
//            sMsg:= '�ſ�������'+#13#10;
//          end;
//
//          if Copy(sRecv, nPos+2, 4) = '9999' then
//          begin
//            //�ܸ��⿡�� ���...
//            InspectionLog('### �ܸ��⿡�� ��� ###');
//            Close;
//            Exit;
//          end;
//          InspectionLog(sMsg);
//
//          //ī���ȣ
//          sCardNo:= MG_StrTrim(Copy(sRecv, nPos+15, 40), ' ');
//
//          //�����ŷ���� üũ����...
//          sCheck:= MG_StrTrim(Copy(sRecv, nPos+14, 41), ' ');
//
//          //�ݾ�
//          sAmt:= MG_StrTrim(Copy(sRecv, nPos+57, 8), ' ');
//          //�ΰ���
//          sVat:= MG_StrTrim(Copy(sRecv, nPos+73, 8), ' ');
//          //���ι�ȣ
//          sNo:= MG_StrTrim(Copy(sRecv, nPos+81, 12), ' ');
//          edtAuthNo.Text:= sNo;
//
//          //�����Ͻ�
//          sTime:= MG_StrTrim(Copy(sRecv, nPos+93, 12), ' ');
//          edtAuthDate.Text:= Copy(sTime, 1, 6);
//
//          //ī����
//          sCardName:= MG_StrTrim(Copy(sRecv, nPos+108, 20), ' ');
//          edtCardName.Text:= sCardName;
//
//          //�������ڵ�
//          sJumCode:= MG_StrTrim(Copy(sRecv, nPos+128, 12), ' ');
//          edtJumNo.Text:= sJumCode;
//
//          sMsg:= sMsg + 'ī������: ' + sCardName + #13#10 +
//                        '���͹�ȣ: ' + sJumCode + #13#10;
//
//          if sType = 'B1' then
//            sMsg:= sMsg + '�ĺ���ȣ: ' + Copy(sCardNo, 1, 3) + '-' + '****' + '-' + Copy(sCardNo, 8, 4) + #13#10
//          else
//            sMsg:= sMsg + 'ī���ȣ: ' + Copy(sCardNo, 1, Pos('=', sCardNo)-1) + #13#10;
//
//          sMsg:= sMsg + '�ŷ��Ͻ�: ' + MG_StrToStr('20' + sTime, '####-##-## ##:##:##') + #13#10 +
//                        '���ι�ȣ: ' + sNo + #13#10;
//          if (sType = 'I1') or (sType = 'D1') or (sType = 'B1') then
//          begin
//            sMsg:= sMsg + '�����ݾ�: ' + FormatFloat('#,##0', StrToInt(sAmt)) + '��' + #13#10;
//          end
//          else
//          begin
//            sMsg:= sMsg + '�����ݾ�: ' + '-' + FormatFloat('#,##0', StrToInt(sAmt)) + '��' + #13#10;
//          end;
////          if (sType = 'I1') or (sType = 'D1') or (sType = 'B1') then
////          begin
////            sMsg:= sMsg + '�ŷ��ݾ�: ' + FormatFloat('#,##0', StrToInt(sAmt)-StrToInt(sVat)) + '��' + #13#10 +
////                          '�� �� ��: ' + FormatFloat('#,##0', StrToInt(sVat)) + '��' + #13#10 +
////                          '�����ݾ�: ' + FormatFloat('#,##0', StrToInt(sAmt)) + '��' + #13#10;
////          end
////          else
////          begin
////            sMsg:= sMsg + '�ŷ��ݾ�: ' + '-' + FormatFloat('#,##0', StrToInt(sAmt)-StrToInt(sVat)) + '��' + #13#10 +
////                          '�� �� ��: ' + '-' + FormatFloat('#,##0', StrToInt(sVat)) + '��' + #13#10 +
////                          '�����ݾ�: ' + '-' + FormatFloat('#,##0', StrToInt(sAmt)) + '��' + #13#10;
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
//          //�ܸ��⿡�� �����ŷ� ��Ҹ� ������...
//          //if sCardName = sCheck then
//          //  sMsg:= sMsg + '### �����ŷ� ��� ###' + #13#10;
//
//          // �������μ�...
//          sCreditPrt := '';
//          sCreditPrt := '========================================' + LF + LF + LF + CR + SO_WTP;
//          sCreditPrt := sCreditPrt + '   ������ҿ�����' + LF + LF + LF + CR + SI_WTP;
//
//          if Length(sParkName) > 29 then
//          begin
//            sCreditPrt := sCreditPrt + '������� : ' + Copy(sParkName, 1, 29) + LF + CR;
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
//            sCreditPrt := sCreditPrt + '������� : ' + sParkName + LF + CR;
//
//          if Length(sParkAddr) > 29 then
//          begin
//            sCreditPrt := sCreditPrt + ' ��   �� : ' + Copy(sParkAddr, 1, 29) + LF + CR;
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
//            sCreditPrt := sCreditPrt + ' ��   �� : ' + sParkAddr + LF + CR;
//
//          sCreditPrt := sCreditPrt + '��Ϲ�ȣ : ' + sRegNo + LF + CR;
//
//          if Length(sAdmin) > 29 then
//          begin
//            sCreditPrt := sCreditPrt + '��ǥ�ڸ� : ' + Copy(sAdmin, 1, 29) + LF + CR;
//            sCreditPrt := sCreditPrt + '           ' + Copy
//              (sAdmin, 30, Length(sAdmin) - 29) + LF + CR;
//          end
//          else
//            sCreditPrt := sCreditPrt + '��ǥ�ڸ� : ' + sAdmin + LF + CR;
//
//          sCreditPrt := sCreditPrt + '��ȭ��ȣ : ' + sTelephone + LF + CR;
//          sCreditPrt := sCreditPrt + '========================================' + LF + CR;
//          sCreditPrt := sCreditPrt + sMsg;
//          sCreditPrt := sCreditPrt + '========================================' + LF + CR;
//
//          sLocalPrt := sCreditPrt + '                             [����]   ' + LF + CR;
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
//          sLocalPrt := sLocalPrt + sCreditPrt + '                             [������]   ' + LF + CR;
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
//          InspectionLog('### �ſ�ī�� ������� �Ϸ� ###');
//          Close;
//        end
//        else
//        begin
//          sReply:= Copy(sRecv, nPos+6, 64);
//          edtMsg.Text:= sReply;
//          InspectionLog(sReply);
//          bGoodCredit:= False;
//          bClose:= True;
//          ShowMessage(sReply + #13#10 + '�޽��� Ȯ�� �� �ٽ� �õ��Ͽ��ּ���!');
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
//          ShowMessage(sReply + #13#10 + '�޽��� Ȯ�� �� �ٽ� �õ��Ͽ��ּ���!');
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
