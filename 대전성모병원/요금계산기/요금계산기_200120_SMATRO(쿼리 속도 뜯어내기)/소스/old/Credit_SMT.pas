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
    InspectionLog('### �ٹ��� �ſ�ī�� ������� ###');

    dream.Set_Code           := '8888';                      //�������
    dream.Set_CodeGu         := '2200';                      //������
    dream.Set_OcxProcess     := 'OCX';
    dream.Set_SetUserCode    := 'A';                         //����� �����ڵ�
    dream.set_Transer_Number := '';
    dream.set_Mutil_CATID    := '';
    dream.xProcess           := False;
    dream.SendRecv;

    Close;
  except
    on E: Exception do begin
      ExceptLogging('�ſ�ī�� ��� �� ���� �߻� : ' + E.Message);
      ExceptLogging('�ſ�ī�� �ܸ��� �ʱ�ȭ �� ����.');
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
    {$REGION '������� : EV-CAT�� Ȯ�� �ϼ���!'}
    posid := Pos(WideString('EV-CAT��'), ReturnData);
    if posid > 0 then begin
      //EV-CAT���� �̽����.
      edtMsg.Text := 'EV-CAT ���� ���� ������¸� Ȯ���� �ּ���.';
      InspectionLog('RecvMsg : ' + ReturnData);
      InspectionLog('[EV-CAT] ���� ���� �̽�����');
      Exit;
    end;
    {$ENDREGION}

    {$REGION '������� : �̹� ��û���Դϴ�! + �����ݾ� ����'}
    //EV-CAT���� ���� �۽� ��, ���� ó�� �Ϸ�Ǳ� �� �ٸ� ���� �۽Ž� �߻��ϴ� ����.
    posid := Pos( WideString('�̹� ��û���Դϴ�!'),ReturnData);
    if posid > 0 then
    begin
      InspectionLog('RecvMsg : ' + ReturnData);
      InspectionLog('[EV-CAT] �̹� ���� ��û���Դϴ�.');
      //�����ݾ� ������� ����
//      InspectionLog('[EV-CAT] �̹� ���� ��û��.. �ݾ׺��� ��û ����.');
//      //�����ݾ� �������μ��� ����
//
//      try
//        try
//          InspectionLog('### �ſ�ī�� ���� ���� ���� ###');
//          with dream do begin
//            Set_Code        := '5555';                      //�������
//            Set_CodeGu      := '2200';                      //������
//            Set_OcxProcess  := 'OCX';
//            Set_Gold        := IntToStr(nProcYogum);        //���αݾ�
//            Set_VAT         := IntToStr(nProcYogum div 11); //�ΰ���
//            Set_SaleMonth   := 0;                           //�Һΰ���
//            Set_SetUserCode := 'A';                         // NULL�� ��� �� ����  �� ����(�����̿�����)
//
//            SendRecv;
//          end;
//        except
//          on E: Exception do begin
//            ExceptLogging('�ſ�ī�� ���� ���� �� ���� �߻�! : ' + E.Message);
//          end;
//        end;
//      finally
//        InspectionLog('### �ſ�ī�� �������� ###');
//      end;
      Exit;
    end;
    {$ENDREGION}

    {$REGION '������� : ������ ����'}
    //��û�� ���� �� �����⿡ ī����Եɰ�� ���� ����.. ��û�� ������ �ش� ��ɿ� ���� ���� ó������ ����.
    posid := Pos(WideString('������ ����'),ReturnData);
    if posid > 0 then
    begin
      InspectionLog('RecvMsg : ' + ReturnData);
      InspectionLog('[EV-CAT] ������ ī�� ����');
      Exit;
    end;
    {$ENDREGION}

    {$REGION '������� : FALL BACK �߻�'}
     //EV-CAT ȯ�� �������� FALL-BACK �� ��� �� "ī�带 �ٽ� ������ �޶�� �޼��� â�� ���⼭ ó���ϸ� ��
    //FALL BACK ��� �� ī�尡 MSR �� ����� ���� �� ���� ��ٸ�.
    posid := POS(WideString('FALL BACK'), ReturnData);
    if posid > 0 then
    begin
      InspectionLog('RecvMsg : ' + ReturnData);
      InspectionLog('[EV-CAT] FALL BACK �߻� (ICī�� �νĽ���)');
      //SMT D350���� ��� IC�� �ִ� ���̹Ƿ� ���� �ٽ� ��û�ؾ���.
      edtMsg.Text := 'ICī�� �ν��� �����Ͽ����ϴ�. ������ �ٽ� ��û���ּ���.';
      Exit;
    end;
    {$ENDREGION}

    {$REGION '���� ����'}
    chk1 := Pos(#7, ReturnData);
    chk2 := Pos(#3, ReturnData);
    Recv := ReturnData;

    if (chk1 > 0) and (chk2 > 0) then begin
      InspectionLog('RecvMsg : ' + ReturnData);
      InspectionLog('[EV-CAT] ���� ó�� ����');
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


      //���� ��� ó���ϴ� �Լ�.
      SMT_RecvProcess(SplitDataRecv[0], SplitDataRecv[1], SplitDataRecv[2], SplitDataRecv[3]);
      if SMT_Recv[0] = '00' then begin
        //�����ڵ� 00�� �������
        bGoodCredit := True;
        InspectionLog('RecvMsg : ' + ReturnData);
        InspectionLog('[EV-CAT] ���� ó�� �Ϸ�');
        edtCardName.Text := SMT_Recv[5];
        edtJumNo.Text := SMT_Recv[7];
        edtAuthNo.Text := SMT_Recv[6];
        edtAuthDate.Text := SMT_Recv[4];
        edtMsg.Text := SMT_Recv[13];

        ExceptLogging('�ſ�ī�� ������� DB���� ����');
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
              ExceptLogging('������ ���� ��ȸ �Ϸ�');
            end else begin
              ExceptLogging('��ϵ� ������ ������ ����!');
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
            Parameters.ParamByName('N17') .Value:= '�ſ�ī��';
            Parameters.ParamByName('N18') .Value:= '�Ϲݰ���';

            ExceptLogging('�������� ���� ���� : ' + SQL.GetText);
            ExceptLogging('���� ���� : N1 : ' + IntToStr(nCurrParkNo) +
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
                          ', N17 : ' + '�ſ�ī��' +
                          ', N18 : ' + '�Ϲݰ���');
            ExecSQL;
          end;
        except
          on E: Exception do begin
            ExceptLogging('�ſ�ī�������� DB������ ���� �߻� ');
          end;
        end;
        ExceptLogging('�ſ�ī�� ������� DB���� ����');

        ExceptLogging('�ſ�ī�� ������ ����');

        try
          sCreditMsg := 'IC�ſ����' + #13#10;
          sCreditMsg:= sCreditMsg + '���Ի��: ' + SMT_Recv[10] + #13#10 +
                        '���͹�ȣ: ' + SMT_Recv[9] + #13#10;
//          sCreditMsg:= sCreditMsg + 'ī���ȣ: ' + Copy(sCardNo, 1, Pos('=', sCardNo)-1) + #13#10;
          sCreditMsg:= sCreditMsg + 'ī���ȣ: ' + SMT_Recv[5] + #13#10;

          sCreditMsg:= sCreditMsg + '�ŷ��Ͻ�: ' + MG_StrToStr(SMT_Recv[3] + '' + SMT_Recv[4], '####-##-## ##:##:##') + #13#10 +
                        '���ι�ȣ: ' + SMT_Recv[6] + #13#10;

          // �������μ�...
          sCreditPrt := '';
          sCreditPrt := '========================================' + LF + LF + LF + CR + SO_WTP;
          sCreditPrt := sCreditPrt + '    ��   ��   ��' + LF + LF + LF + CR + SI_WTP;

          if Length(sParkName) > 29 then
          begin
            sCreditPrt := sCreditPrt + '�� ȣ �� : ' + Copy(sParkName, 1, 29) + LF + CR;

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
            sCreditPrt := sCreditPrt + '�� ȣ �� : ' + sParkName + LF + CR;

          sCreditPrt := sCreditPrt + '�����No.: ' + sRegNo + LF + CR;

          if Length(sAdmin) > 29 then
          begin
            sCreditPrt := sCreditPrt + '����ڸ� : ' + Copy(sAdmin, 1, 29) + LF + CR;
            sCreditPrt := sCreditPrt + '           ' + Copy
              (sAdmin, 30, Length(sAdmin) - 29) + LF + CR;
          end
          else
            sCreditPrt := sCreditPrt + '����ڸ� : ' + sAdmin + LF + CR;

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
            sCreditPrt := sCreditPrt + '��   ��  : ' + sParkAddr + LF + CR;

          sCreditPrt := sCreditPrt + '��ȭ��ȣ : ' + sTelephone + LF + CR;
          sCreditPrt := sCreditPrt + '========================================' + LF + CR;
          sCreditPrt := sCreditPrt + sCreditMsg;
          sCreditPrt := sCreditPrt + '========================================' + LF + CR;
          sCreditPrt := sCreditPrt + '��������' + LF + CR;
          sCreditPrt := sCreditPrt + '������ȣ : ' + sNowLprCarNo1 + LF + CR;
          sCreditPrt := sCreditPrt + '�����Ͻ� : ' + sNowInDate + ' ' + sNowInTime + LF + CR;
          sCreditPrt := sCreditPrt + '�����Ͻ� : ' + sNowOutDate + ' ' + sNowOutTime + LF + CR;
          sCreditPrt := sCreditPrt + '�����ð� : ' + frmMainNew.lbParkingTime.Caption + LF + CR;
          sCreditPrt := sCreditPrt + '�� �� �� : ' + sCurrMName + LF + CR;
          sCreditPrt := sCreditPrt + '========================================' + LF + CR;
          sCreditPrt := sCreditPrt + '�����������' + LF + CR;
          if nDCCnt > 0 then
          begin
            sCreditPrt := sCreditPrt + '��ü��� : ' + frmMainNew.edtTotYogum.Text + '��' + LF + CR;
            sCreditPrt := sCreditPrt + '���αݾ� : ' + frmMainNew.edtDCYogum.Text + '��' + LF + CR;

            if nDCCnt > 0 then
              for i := 1 to nDCCnt do
                //if DCProc[i].nDCAmt > 0 then
                if DCProc[i].sDCName <> '' then
                begin
                  if i = 1 then
                    sCreditPrt:= sCreditPrt + '���γ��� : ' + DCProc[i].sDCName + LF + CR
                  else
                    sCreditPrt := sCreditPrt + '           ' + DCProc[i].sDCName + LF + CR;
                end;
            sCreditPrt := sCreditPrt + '�����ݾ� : ' + frmMainNew.edtProcYogum.Text + '��' + LF + CR;
          end
          else
          begin
            sCreditPrt := sCreditPrt + '������� : ' + frmMainNew.edtProcYogum.Text + '��' + LF + CR;
            sCreditPrt := sCreditPrt + '���αݾ� : 0 ��' + LF + CR;
            sCreditPrt := sCreditPrt + '�����ݾ� : ' + frmMainNew.edtProcYogum.Text + '��' + LF + CR;
          end;

          sCreditPrt := sCreditPrt + '========================================' + LF + CR+ SO_WTP;;
          sCreditPrt := sCreditPrt + '�����ݾ� : ' + IntToStr(nProcYogum) + '��' + LF + CR + SI_WTP;
          sCreditPrt := sCreditPrt + '========================================' + LF + CR;
          sLocalPrt  := sCreditPrt + '                             [����]   ' + LF + CR;

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
          InspectionLog('TfrmCredit_SMATRO ������: ' + sCreditPrt);

           if frmMainNew.lbReceipt.Count = 10 then
            frmMainNew.lbReceipt.Items.Delete(frmMainNew.lbReceipt.Count - 1);
          frmMainNew.lbReceipt.Items.Insert(0, sPrtOutTime + '  ' + MG_Left(sNowLprCarNo1, 12)
              + '  �������: ' + IntToStr(nProcYogum) + '��');

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

          RReceipt[1].sInOutTime := sPrtOutTime + '  �������: ' + IntToStr(nProcYogum) +
            '��';
          RReceipt[1].sRpt := sCreditPrt;
          frmMainNew.btnReceipt.Enabled := True;
          bGoodCredit := True;
          ExceptLogging('�ſ�ī�� ������ ����');
          bGoodCredit := True;
          InspectionLog('### �ſ�ī�� �����Ϸ� ###');
          Close;
        except
          on E: Exception do begin
            ExceptLogging('�ſ�ī�� ������ ó���� ���� �߻� : ' + E.Message);
          end;
        end;
      end else begin
        InspectionLog('RecvMsg : ' + ReturnData);
        InspectionLog('[EV-CAT] ���� ó�� ���� : �����ڵ� ' + SMT_Recv[0] + ', ������� : ' + SMT_Recv[13]);
        ShowMessage('���� ó�� ���� : ' + SMT_Recv[13]);
        bGoodCredit := False;
      end;
      SplitDataRecv.Free;

      Close;
    end else begin
      //00�̿ܿ��� ���� �ſ���ΰ���
      InspectionLog('RecvMsg : ' + ReturnData);
      edtMsg.Text := ReturnData;
      Exit;
    end;
    {$ENDREGION}
  except
    on E: Exception do begin
      ExceptLogging('����Ʈ�� �������� ó���� ���� �߻�! : ' + E.Message);
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
      InspectionLog('### �ſ�ī�� �������� ###');
      with dream do begin
        Set_Code        := '1000';                      //�������
        Set_CodeGu      := '1100';                      //������
        Set_OcxProcess  := 'OCX';
        Set_Gold        := IntToStr(nProcYogum);        //���αݾ�
        Set_VAT         := IntToStr(nProcYogum div 11); //�ΰ���
        Set_SaleMonth   := 0;                           //�Һΰ���
        Set_SetUserCode := 'A';                         // NULL�� ��� �� ����  �� ����(�����̿�����)
        ExceptLogging('�ſ�ī�� ������� �ݾ� : ' + IntToStr(nProcYogum));
        SendRecv;
      end;
//    except
//      on E: Exception do begin
//        ExceptLogging('�ſ�ī�� ���� �� ���� �߻�! : ' + E.Message);
//      end;
//    end;
  finally
    InspectionLog('### �ſ�ī�� �������� ###');
  end;
end;

end.
