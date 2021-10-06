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
    InspectionLog('### �ٹ��� ���ݿ����� ������� ###');

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
      ExceptLogging('���ݿ����� ��� �� ���� �߻� : ' + E.Message);
      ExceptLogging('�ſ�ī�� �ܸ��� �ʱ�ȭ �� ����.');
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
    {$REGION '������� : EV-CAT�� Ȯ�� �ϼ���!'}
    posid := Pos(WideString('EV-CAT��'), ReturnData);
    if posid > 0 then begin
      //EV-CAT���� �̽����.
      ShowMessage('EV-CAT ���� ���� ������¸� Ȯ���� �ּ���.');
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
      ShowMessage('ICī�� �ν��� �����Ͽ����ϴ�. ������ �ٽ� ��û���ּ���.');
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

        ExceptLogging('���ݿ����� ������ ó�� ����');

        try
          sCashMsg := '���ݿ����� ����' + #13#10;
          sCashMsg:= sCashMsg + 'ī���ȣ: ' + SMT_Recv[5] + #13#10;
          sCashMsg:= sCashMsg + '�ŷ��Ͻ�: ' + MG_StrToStr(SMT_Recv[3] + '' + SMT_Recv[4], '####-##-## ##:##:##') + #13#10 +
                        '���ι�ȣ: ' + SMT_Recv[6] + #13#10;

          // �������μ�...
          sCashReceipt := '';
          sCashReceipt := '========================================' + LF + LF + LF + CR + SO_WTP;
          sCashReceipt := sCashReceipt + '   �� �� �� �� ��' + LF + LF + LF + CR + SI_WTP;

          if Length(sParkName) > 29 then
          begin
            sCashReceipt := sCashReceipt + '�� ȣ �� : ' + Copy(sParkName, 1, 29) + LF + CR;

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
            sCashReceipt := sCashReceipt + '�� ȣ �� : ' + sParkName + LF + CR;

          sCashReceipt := sCashReceipt + '�����No.: ' + sRegNo + LF + CR;

          if Length(sAdmin) > 29 then
          begin
            sCashReceipt := sCashReceipt + '����ڸ� : ' + Copy(sAdmin, 1, 29) + LF + CR;
            sCashReceipt := sCashReceipt + '           ' + Copy
              (sAdmin, 30, Length(sAdmin) - 29) + LF + CR;
          end
          else
            sCashReceipt := sCashReceipt + '����ڸ� : ' + sAdmin + LF + CR;

          if Length(sParkAddr) > 29 then
          begin
            sCashReceipt := sCashReceipt + ' ��   �� : ' + Copy(sParkAddr, 1, 29) + LF + CR;

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
            sCashReceipt := sCashReceipt + '��   ��  : ' + sParkAddr + LF + CR;

          sCashReceipt := sCashReceipt + '��ȭ��ȣ : ' + sTelephone + LF + CR;
          sCashReceipt := sCashReceipt + '========================================' + LF + CR;
          sCashReceipt := sCashReceipt + sCashMsg;
          sCashReceipt := sCashReceipt + '========================================' + LF + CR;
          sCashReceipt := sCashReceipt + '��������' + LF + CR;
          sCashReceipt := sCashReceipt + '������ȣ : ' + sNowLprCarNo1 + LF + CR;
          sCashReceipt := sCashReceipt + '�����Ͻ� : ' + sNowInDate + ' ' + sNowInTime + LF + CR;
          sCashReceipt := sCashReceipt + '�����Ͻ� : ' + sNowOutDate + ' ' + sNowOutTime + LF + CR;
          sCashReceipt := sCashReceipt + '�����ð� : ' + frmMainNew.lbParkingTime.Caption + LF + CR;
          sCashReceipt := sCashReceipt + '�� �� �� : ' + sCurrMName + LF + CR;
          sCashReceipt := sCashReceipt + '========================================' + LF + CR;
          sCashReceipt := sCashReceipt + '�����������' + LF + CR;
          if nDCCnt > 0 then
          begin
            sCashReceipt := sCashReceipt + '��ü��� : ' + frmMainNew.edtTotYogum.Text + '��' + LF + CR;
            sCashReceipt := sCashReceipt + '���αݾ� : ' + frmMainNew.edtDCYogum.Text + '��' + LF + CR;

            if nDCCnt > 0 then
              for i := 1 to nDCCnt do
                //if DCProc[i].nDCAmt > 0 then
                if DCProc[i].sDCName <> '' then
                begin
                  if i = 1 then
                    sCashReceipt:= sCashReceipt + '���γ��� : ' + DCProc[i].sDCName + LF + CR
                  else
                    sCashReceipt := sCashReceipt + '           ' + DCProc[i].sDCName + LF + CR;
                end;
            sCashReceipt := sCashReceipt + '�����ݾ� : ' + frmMainNew.edtProcYogum.Text + '��' + LF + CR;
          end
          else
          begin
            sCashReceipt := sCashReceipt + '������� : ' + frmMainNew.edtProcYogum.Text + '��' + LF + CR;
            sCashReceipt := sCashReceipt + '���αݾ� : 0 ��' + LF + CR;
            sCashReceipt := sCashReceipt + '�����ݾ� : ' + frmMainNew.edtProcYogum.Text + '��' + LF + CR;
          end;

          sCashReceipt := sCashReceipt + '========================================' + LF + CR+ SO_WTP;;
          sCashReceipt := sCashReceipt + '�����ݾ� : ' + IntToStr(nProcYogum) + '��' + LF + CR + SI_WTP;
          sCashReceipt := sCashReceipt + '========================================' + LF + CR;
          sLocalPrt  := sCashReceipt + '                             [����]   ' + LF + CR;

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
          sLocalPrt := sLocalPrt + sCashReceipt + '                             [������]   ' + LF + CR;

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
          InspectionLog('TfrmCredit_SMATRO ���ݿ�����: ' + sCashReceipt);

          bGoodCashReceipt := True;
          ExceptLogging('���ݿ����� ó�� ����');
          InspectionLog('### ���ݿ����� ó�� �Ϸ� ###');
          Close;
        except
          on E: Exception do begin
            ExceptLogging('���ݿ����� ������ ó���� ���� �߻� : ' + E.Message);
          end;
        end;
      end else begin
        InspectionLog('RecvMsg : ' + ReturnData);
        InspectionLog('[EV-CAT] ���ݿ����� ó�� ���� : �����ڵ� ' + SMT_Recv[0] + ', ������� : ' + SMT_Recv[13]);
        ShowMessage('���ݿ����� ó�� ���� : ' + SMT_Recv[13]);
        bGoodCredit := False;
      end;
      SplitDataRecv.Free;

      Close;
    end else begin
      //00�̿ܿ��� ���� �ſ���ΰ���
      InspectionLog('RecvMsg : ' + ReturnData);
      ShowMessage(ReturnData);
      Exit;
    end;
    {$ENDREGION}
  except
    on E: Exception do begin
      ExceptLogging('����Ʈ�� ���ݿ����� ���� ó���� ���� �߻�! : ' + E.Message);
    end;
  end;
end;

procedure TfrmCash_SMT.FormShow(Sender: TObject);
begin
  Exceptlogging('���ݿ����� ���� ..');
  if sCashOption = '02' then begin
    lbVan.Caption := '���ݿ����� ��� ������ �Է��� �ּ���.' + #13#10 + '��� ���� : �޴��� ��ȣ Ȥ�� ���ݿ����� ī���ȣ';
    edtCustNo.LabelCaption := '��� ���� ';
  end else if sCashOption = '01' then begin
    lbVan.Caption := '���ݿ����� ��� ������ �Է��� �ּ���.' + #13#10 + '��� ���� : ����ڹ�ȣ';
    edtCustNo.LabelCaption := '��� ���� ';
  end;
end;

procedure TfrmCash_SMT.sButton1Click(Sender: TObject);
begin
  try
    try
      InspectionLog('### ���ݿ����� ���� ���� ###');
      with dream do begin
        Set_Code        := '2000';                      //�������
        Set_CodeGu      := '1100';                      //������
        Set_Gold        := IntToStr(nProcYogum);        //���αݾ�
        Set_VAT         := IntToStr(nProcYogum div 11); //�ΰ���
        Set_OcxProcess  := 'OCX';
        Set_ServiceGold := 0;                           //����� �ݾ�
        Set_SetUserCode := 'A';                         //����� �����ڵ�
        if sCashOption = '02' then begin
          Set_CashGubun := 'C';                         //��
        end else if sCashOption = '01' then begin
          Set_CashGubun := 'B';                         //�����
        end;

        //���ݿ����� ��ü(��ȭ��ȣ or ����ڹ�ȣ)
        Set_CashNumber := edtCustNo.Text;
        ExceptLogging('���ݿ����� �ݾ� : ' + IntToStr(nProcYogum) + ', ���ݿ����� ������� : ' + edtCustNo.Text + ', ��(02) �����(01)' + sCashOption);
        SendRecv;
      end;
    except
      on E: Exception do begin
        ExceptLogging('���ݿ����� ���� �� ���� �߻�! : ' + E.Message);
      end;
    end;
  finally
    InspectionLog('### �ſ�ī�� �������� ###');
  end;
end;
end.
