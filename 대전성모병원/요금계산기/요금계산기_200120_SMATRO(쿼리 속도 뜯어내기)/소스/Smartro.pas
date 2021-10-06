unit Smartro;

interface
uses
  Windows, SysUtils, Forms, WinInet, IniFiles, DateUtils, Global, System.Classes;
  procedure SMT_RecvProcess(AccessNo, SuccessYn, MethodsofPayment, ReturnData: String);
  procedure StringSplit(const Delimiter: Char; Input: string; var Strings: TStringList);
var
  SMT_Recv : TStringList;

implementation

procedure SMT_RecvProcess(AccessNo, SuccessYn, MethodsofPayment, ReturnData: String);
var
  SplitRecv: TStringList;
  chki: Integer;
begin
  try
    //������ ���� ����
    if SuccessYn = 'C' then begin
      ExceptLogging('��� ���� ���� ���� �޼���[ó���ߴ�] : ' + ReturnData);
      Exit;
    end;

    //Ƽ�Ӵ� ���� ���� ����: �̻��
    if SuccessYn = 'T' then begin
      ExceptLogging('Ƽ�Ӵ� ���� ���� ���� �޼���[�̻��] : ' + ReturnData);
      Exit;
    end;

    //ī����� ���� ����
    if SuccessYn = 'W' then begin
      ExceptLogging('ī�� ���� ���� ���� �޼���[ó���ߴ�] : ' + ReturnData);
      Exit;
    end;

    //���� ���̾��� ��.
    if ReturnData = chr(4) then begin
      Exit;
    end;

    //����ó�� ������ ����ó�� ����
//    SplitRecv := TStringList.Create;

//    StringSplit(#28, ReturnData, SplitRecv);
    StringSplit(#28, ReturnData, SMT_Recv);

//    for chki := 0 to SplitRecv.Count -1 do
//    begin
//      SplitRecv[chki] := StringReplace(SplitRecv[chki], chr(4), '', [rfReplaceAll]);
//    end;
    for chki := 0 to SMT_Recv.Count -1 do
    begin
      SMT_Recv[chki] := StringReplace(SMT_Recv[chki], chr(4), '', [rfReplaceAll]);
    end;

//    SMT_Recv[0]  := SplitRecv[0]; //���� �ڵ�
//    SMT_Recv[1]  := SplitRecv[1]; //���� ����
//    SMT_Recv[2]  := SplitRecv[2]; //���� ��ü
//    SMT_Recv[3]  := SplitRecv[3]; //���ŷ����� YYMMDD [��ҽ� ���]
//    SMT_Recv[4]  := SplitRecv[4]; //���� �Ͻ�
//    SMT_Recv[5]  := SplitRecv[5]; //ī���ȣ
//    SMT_Recv[6]  := SplitRecv[6]; //���ŷ����ι�ȣ    [��ҽ� ���]
//    SMT_Recv[7]  := SplitRecv[7]; //��������ȣ
//    SMT_Recv[8]  := SplitRecv[8]; //���Ա���
//    SMT_Recv[9]  := SplitRecv[9]; //�߱޻��ڵ�
//    SMT_Recv[10] := SplitRecv[10];//�߱޻��
//    SMT_Recv[11] := SplitRecv[11];//���Ի��ڵ�
//    SMT_Recv[12] := SplitRecv[12];//���Ի��
//    SMT_Recv[13] := SplitRecv[13];//���䳻��
//    SMT_Recv[14] := SplitRecv[14];//����ī���ܾ�
//    SMT_Recv[15] := SplitRecv[15];//Ƽ�Ӵ��ڷ�
//    SMT_Recv[16] := SplitRecv[16];//����Ű
//    SMT_Recv[17] := SplitRecv[17];//�����ݾ�
//    SMT_Recv[18] := SplitRecv[18];//�ΰ���
//    SMT_Recv[19] := SplitRecv[19];//���� POS ID
//    SMT_Recv[20] := SplitRecv[20];//�����Ϸù�ȣ
    InspectionLog('[EVCAT] �������� ����');
    InspectionLog(' ���� �ڵ� : ' + SMT_Recv[0] +
                  ' ���� ���� : ' + SMT_Recv[1] +
                  ' ���� ��ü : ' + SMT_Recv[2] +
                  ' �������� : ' + SMT_Recv[3] +
                  ' �����ð� : ' + SMT_Recv[4] +
                  ' ī���ȣ : ' + SMT_Recv[5] +
                  ' ���ŷ����ι�ȣ : ' + SMT_Recv[6] +
                  ' ��������ȣ : ' + SMT_Recv[7] +
                  ' ���Ա��� : ' + SMT_Recv[8] +
                  ' �߱޻��ڵ� : ' + SMT_Recv[9] +
                  ' �߱޻�� : ' + SMT_Recv[10] +
                  ' ���Ի��ڵ� : ' + SMT_Recv[11] +
                  ' ���Ի�� : ' + SMT_Recv[12] +
                  ' ���䳻�� : ' + SMT_Recv[13] +
                  ' ����ī���ܾ� : ' + SMT_Recv[14] +
                  ' Ƽ�Ӵ��ڷ� : ' + SMT_Recv[15] +
                  ' ����Ű : ' + SMT_Recv[16] +
                  ' �����ݾ� : ' + SMT_Recv[17] +
                  ' �ΰ��� : ' + SMT_Recv[18] +
                  ' ���� POS ID : ' + SMT_Recv[19] +
                  ' �����Ϸù�ȣ : ' + SMT_Recv[20]
                  );
    InspectionLog('[EV-CAT] �������� ����');
//    SplitRecv.Free;
  except
    on E: Exception do begin
      InspectionLog('[EV-CAT] ���� ���� �� ���� �߻� : ' + E.Message);
    end;
  end;
end;

procedure StringSplit(const Delimiter: Char; Input: string; var Strings: TStringList);
begin
  Assert(Assigned(Strings)) ;
  Strings.Clear;
  Strings.StrictDelimiter := True;
  ExtractStrings([Delimiter],  [' '], PChar(Input), Strings);
end;
end.
