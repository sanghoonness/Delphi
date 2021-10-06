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
    InspectionLog('### �ٹ��� �ſ�ī�� ������� ��� ###');

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
      ExceptLogging('�ſ�ī�� ������� ��� �� ���� �߻� : ' + E.Message);
      ExceptLogging('�ſ�ī�� �ܸ��� �ʱ�ȭ �� ����.');
    end;
  end;
end;

procedure TfrmCredit_SMTCancel.btnOKClick(Sender: TObject);
begin
  try
    try
      InspectionLog('### �ſ�ī�� ��ҽ��� ###');
      with dream do begin
        Set_Code        := '1000';
        Set_CodeGu      := '2200';
        Set_OcxProcess  := 'OCX';
        Set_Gold        := StrToInt(edtTotAmt.Text);         //���αݾ�
        Set_VAT         := StrToInt(edtTotAmt.Text) div 11;  //�ΰ���
        Set_SaleMonth   := 0;      //�Һΰ���
        Set_SetUserCode := 'A';   // NULL�� ��� �� ����  �� ����(�����̿�����)
        Set_SetUserCode := 'A';   // NULL�� ��� �� ����  �� ����(�����̿�����)

        //���ŷ���
        Set_WonYYMMDD  := edtAuthDate.Text;

        //�� ���ι�ȣ
        Set_WonGrantNo  := edtAuthNo.Text;
        ExceptLogging('�ſ�ī�� ������� �ݾ� : ' + edtTotAmt.Text + ', ���ŷ��� : ' + edtAuthDate.Text + ', �����ι�ȣ : ' + edtAuthNo.Text);

        SendRecv;                        // NULL�� ��� �� ����  �� ����(�����̿�����)
      end;
    except
      on E: Exception do begin
        ExceptLogging('�ſ�ī�� ��� �� ���� �߻�! : ' + E.Message);
      end;
    end;
  finally
    InspectionLog('### �ſ�ī�� ������� ###');
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
      InspectionLog('[EV-CAT] �̹� ���� ��û��.. �ݾ׺��� ��û ����.');
      //�����ݾ� �������μ��� ����

      Exit;
    end;
    {$ENDREGION}

    {$REGION '������� : ������ ����'}
    //��û�� ���� �� �����⿡ ī����Եɰ�� ���� ����.. ��û�� ������ �ش� ��ɿ� ���� ���� ó������ ����.
    posid := Pos(WideString('����������'),ReturnData);
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

    {$REGION '���� ��� ����'}
    chk1 := Pos(#7, ReturnData);
    chk2 := Pos(#3, ReturnData);
    Recv := ReturnData;

    if (chk1 > 0) and (chk2 > 0) then begin
      InspectionLog('RecvMsg : ' + ReturnData);
      InspectionLog('[EV-CAT] ���� ��� ó�� ����');
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
        InspectionLog('[EV-CAT] ���� ��� ó�� �Ϸ�');

        ExceptLogging('�ſ�ī�� ������ ����');

        try
          sCreditMsg := 'IC�ſ����' + #13#10;
          sCreditMsg:= sCreditMsg + '���Ի��: ' + SMT_Recv[10] + #13#10 +
                        '���͹�ȣ: ' + SMT_Recv[9] + #13#10;
//          sCreditMsg:= sCreditMsg + 'ī���ȣ: ' + Copy(sCardNo, 1, Pos('=', sCardNo)-1) + #13#10;
          sCreditMsg:= sCreditMsg + 'ī���ȣ: ' + SMT_Recv[5] + #13#10;
          sCreditMsg:= sCreditMsg + '���ŷ����� : ' + edtAuthDate.Text + #13#10;
          sCreditMsg:= sCreditMsg + '�ŷ��Ͻ�: ' + MG_StrToStr(SMT_Recv[3] + '' + SMT_Recv[4], '####-##-## ##:##:##') + #13#10 +
                        '���ι�ȣ: ' + SMT_Recv[6] + #13#10;

          // �������μ�...
          sCreditCanPrt := '';
          sCreditCanPrt := '========================================' + LF + LF + LF + CR + SO_WTP;
          sCreditCanPrt := sCreditCanPrt + '   �� �� �� �� ��' + LF + LF + LF + CR + SI_WTP;

          if Length(sParkName) > 29 then
          begin
            sCreditCanPrt := sCreditCanPrt + '�� ȣ �� : ' + Copy(sParkName, 1, 29) + LF + CR;

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
            sCreditCanPrt := sCreditCanPrt + '�� ȣ �� : ' + sParkName + LF + CR;

          sCreditCanPrt := sCreditCanPrt + '�����No.: ' + sRegNo + LF + CR;

          if Length(sAdmin) > 29 then
          begin
            sCreditCanPrt := sCreditCanPrt + '����ڸ� : ' + Copy(sAdmin, 1, 29) + LF + CR;
            sCreditCanPrt := sCreditCanPrt + '           ' + Copy
              (sAdmin, 30, Length(sAdmin) - 29) + LF + CR;
          end
          else
            sCreditCanPrt := sCreditCanPrt + '����ڸ� : ' + sAdmin + LF + CR;

          if Length(sParkAddr) > 29 then
          begin
            sCreditCanPrt := sCreditCanPrt + ' ��   �� : ' + Copy(sParkAddr, 1, 29) + LF + CR;

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
            sCreditCanPrt := sCreditCanPrt + '��   ��  : ' + sParkAddr + LF + CR;

          sCreditCanPrt := sCreditCanPrt + '��ȭ��ȣ : ' + sTelephone + LF + CR;
          sCreditCanPrt := sCreditCanPrt + '========================================' + LF + CR;
          sCreditCanPrt := sCreditCanPrt + sCreditMsg;

          sCreditCanPrt := sCreditCanPrt + '========================================' + LF + CR+ SO_WTP;;
          sCreditCanPrt := sCreditCanPrt + '��ұݾ� : ' + edtTotAmt.Text + '��' + LF + CR + SI_WTP;
          sCreditCanPrt := sCreditCanPrt + '========================================' + LF + CR;
          sLocalPrt     := sCreditCanPrt + '                             [����]   ' + LF + CR;

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
          sLocalPrt := sLocalPrt + sCreditCanPrt + '                             [������]   ' + LF + CR;

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
          InspectionLog('TfrmCredit_SMATRO ��� ������: ' + sCreditCanPrt);

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
          ExceptLogging('�ſ�ī�� ������ ����');
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
        ShowMessage('���� ��� ���� : ' + SMT_Recv[13]);
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
      ExceptLogging('����Ʈ�� �������� ó���� ���� �߻�! : ' + E.Message);
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
    InspectionLog('### �ſ�ī�� ��ҽ��� ###');
    lbVan.Caption := '���� ������ �Է��� �ּ���!';
  except
    on E: Exception do
    ExceptLogging('TfrmCredit_Kis.FormShow : ' + E.Message);
  end;
end;

end.
