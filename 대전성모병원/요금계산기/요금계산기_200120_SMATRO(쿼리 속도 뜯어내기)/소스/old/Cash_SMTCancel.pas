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
    InspectionLog('### �ٹ��� ���ݿ����� �߱���ҿ�û ��� ###');

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
      ExceptLogging('���ݿ����� �߱���� ��� �� ���� �߻� : ' + E.Message);
      ExceptLogging('�ſ�ī�� �ܸ��� �ʱ�ȭ �� ����.');
    end;
  end;
end;

procedure TfrmCash_SMTCancel.btnOKClick(Sender: TObject);
begin
  try
    try
      InspectionLog('### ���ݿ����� �߱� ��ҽ��� ###');
      with dream do begin
        Set_Code        := '2000';                      //�������
        Set_CodeGu      := '2200';                      //������
        Set_OcxProcess  := 'OCX';
        Set_Gold        := edtFee.Text;                 //���αݾ�
        Set_VAT         := IntToStr(StrToInt(edtFee.Text) div 11); //�ΰ���

        Set_ServiceGold := 0;                           // �����ݾ�
        Set_WonYYMMDD   := edtAuthDate.Text;            //�� ��������
        Set_WonGrantNo  := edtAuthNo.Text;              //�� ���ι�ȣ
        Set_CashNumber  := edtCustNo.Text;              //����ڹ�ȣ / �ڵ�����ȣ / ���ݿ�����ī���ȣ : ���ݿ����� ��ü

        if rb1.Checked then begin
          //�����
          Set_CashGubun := 'B';
          ExceptLogging('��ϱ��� : ����� ');
        end else if rb2.Checked then begin
          //����
          Set_CashGubun := 'C';
          ExceptLogging('��ϱ��� : ����  ');
        end;

        Set_SetUserCode := 'A';                         // NULL�� ��� �� ����  �� ����(�����̿�����)
        ExceptLogging('���ݿ����� ��� �ݾ� : ' + edtFee.Text + ', ���ݿ����� ������� : ' + edtCustNo.Text + ', �����ι�ȣ : ' + edtAuthNo.Text + ', ���������� : ' + edtAuthDate.Text);
        SendRecv;
      end;
    except
      on E: Exception do begin
        ExceptLogging('���ݿ����� �߱� ��� �� ���� �߻�! : ' + E.Message);
      end;
    end;
  finally
    InspectionLog('### ���ݿ����� �߱� ��� ���� ###');
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
        InspectionLog('[EV-CAT] ���ݿ����� ��� ó�� �Ϸ�');

        ExceptLogging('���ݿ����� ��� ������ ����');
        try
          sCreditMsg := '���ݿ����� ���' + #13#10;
          sCreditMsg := sCreditMsg + 'ī���ȣ: ' + SMT_Recv[5] + #13#10;
          sCreditMsg := sCreditMsg + '���ŷ����ι�ȣ : ' + edtAuthNo.Text + #13#10 + '���ŷ��������� : ' + edtAuthDate.Text + #13#10;
          sCreditMsg := sCreditMsg + '�ŷ��Ͻ�: ' + MG_StrToStr(SMT_Recv[3] + '' + SMT_Recv[4], '####-##-## ##:##:##') + #13#10 +
                        '���ι�ȣ: ' + SMT_Recv[6] + #13#10;

          // �������μ�...
          sCashCanReceipt := '';
          sCashCanReceipt := '========================================' + LF + LF + LF + CR + SO_WTP;
          sCashCanReceipt := sCashCanReceipt + '   �� �� �� �� ��' + LF + LF + LF + CR + SI_WTP;

          if Length(sParkName) > 29 then
          begin
            sCashCanReceipt := sCashCanReceipt + '�� ȣ �� : ' + Copy(sParkName, 1, 29) + LF + CR;

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
            sCashCanReceipt := sCashCanReceipt + '�� ȣ �� : ' + sParkName + LF + CR;

          sCashCanReceipt := sCashCanReceipt + '�����No.: ' + sRegNo + LF + CR;

          if Length(sAdmin) > 29 then
          begin
            sCashCanReceipt := sCashCanReceipt + '����ڸ� : ' + Copy(sAdmin, 1, 29) + LF + CR;
            sCashCanReceipt := sCashCanReceipt + '           ' + Copy
              (sAdmin, 30, Length(sAdmin) - 29) + LF + CR;
          end
          else
            sCashCanReceipt := sCashCanReceipt + '����ڸ� : ' + sAdmin + LF + CR;

          if Length(sParkAddr) > 29 then
          begin
            sCashCanReceipt := sCashCanReceipt + ' ��   �� : ' + Copy(sParkAddr, 1, 29) + LF + CR;

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
            sCashCanReceipt := sCashCanReceipt + '��   ��  : ' + sParkAddr + LF + CR;

          sCashCanReceipt := sCashCanReceipt + '��ȭ��ȣ : ' + sTelephone + LF + CR;
          sCashCanReceipt := sCashCanReceipt + '========================================' + LF + CR;
          sCashCanReceipt := sCashCanReceipt + sCreditMsg;
          sCashCanReceipt := sCashCanReceipt + '========================================' + LF + CR+ SO_WTP;;
          sCashCanReceipt := sCashCanReceipt + '��ұݾ� : ' + SMT_RECV[17] + '��' + LF + CR + SI_WTP;
          sCashCanReceipt := sCashCanReceipt + '========================================' + LF + CR;
          sLocalPrt     := sCashCanReceipt + '                             [����]   ' + LF + CR;

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
          sLocalPrt := sLocalPrt + sCashCanReceipt + '                             [������]   ' + LF + CR;

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
          InspectionLog('TfrmCredit_SMATRO ��� ������: ' + sCashCanReceipt);

          ExceptLogging('���ݿ����� ��� ������ ����');
          InspectionLog('### ���ݿ����� ��� �Ϸ� ###');
          Close;
        except
          on E: Exception do begin
            ExceptLogging('���ݿ����� ��� ������ ó���� ���� �߻� : ' + E.Message);
          end;
        end;
      end else begin
        InspectionLog('RecvMsg : ' + ReturnData);
        InspectionLog('[EV-CAT] ���ݿ����� ��� ó�� ���� : �����ڵ� ' + SMT_Recv[0] + ', ������� : ' + SMT_Recv[13]);
        ShowMessage('���ݿ����� ��� ��� ���� : ' + SMT_Recv[13]);
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
      ExceptLogging('����Ʈ�� ���ݿ����� ��� ���� ó���� ���� �߻�! : ' + E.Message);
    end;
  end;
end;

procedure TfrmCash_SMTCancel.FormShow(Sender: TObject);
begin
  Exceptlogging('���ݿ����� ���� ��� ..');
  rb2.Checked := True;
end;

end.
