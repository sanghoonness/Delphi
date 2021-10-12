unit Closing;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, Grids, DBGrids, ExtCtrls, StdCtrls, Mask,
  Printers, Buttons, DBTables, DB, ADODB, AdvEdit, AdvToolBtn, AdvPanel, BaseGrid,
  AdvGrid, DBAdvGrid, AdvPageControl, IniFiles, Menus, AdvObj;

type
  TfrmClosing = class(TForm)
    PageControl1: TAdvPageControl;
    TabSheet1: TAdvTabSheet;
    dgTKProc: TDBAdvGrid;
    AdvPanel1: TAdvPanel;
    Bevel3: TBevel;
    Label3: TLabel;
    Bevel5: TBevel;
    Label5: TLabel;
    Bevel8: TBevel;
    Label8: TLabel;
    Bevel13: TBevel;
    Label13: TLabel;
    Bevel15: TBevel;
    Label15: TLabel;
    btnDetail: TAdvToolButton;
    Bevel1: TBevel;
    Label1: TLabel;
    Bevel2: TBevel;
    Label2: TLabel;
    edtTot: TAdvEdit;
    edtCnt: TAdvEdit;
    edtReal: TAdvEdit;
    edtDCCnt: TAdvEdit;
    edtDC: TAdvEdit;
    edtLostCnt: TAdvEdit;
    edtLostAmt: TAdvEdit;
    edtGT1Cnt: TAdvEdit;
    edtTotDCCnt: TAdvEdit;
    edtDamageCnt: TAdvEdit;
    edtDamageAmt: TAdvEdit;
    TabSheet2: TAdvTabSheet;
    dgIssueTK: TDBAdvGrid;
    AdvPanel2: TAdvPanel;
    Bevel4: TBevel;
    Label4: TLabel;
    Bevel9: TBevel;
    Label9: TLabel;
    Bevel10: TBevel;
    Label10: TLabel;
    edtiCnt: TAdvEdit;
    edtiFAmt: TAdvEdit;
    edtiAmt: TAdvEdit;
    TabSheet3: TAdvTabSheet;
    dgBar: TDBAdvGrid;
    AdvPanel3: TAdvPanel;
    Bevel6: TBevel;
    Label6: TLabel;
    Bevel7: TBevel;
    Label7: TLabel;
    Bevel11: TBevel;
    Label11: TLabel;
    Bevel12: TBevel;
    Label12: TLabel;
    edtUp: TAdvEdit;
    edtLock: TAdvEdit;
    edtDown: TAdvEdit;
    edtUnLock: TAdvEdit;
    AdvPanel4: TAdvPanel;
    Bevel14: TBevel;
    Label14: TLabel;
    btnClosing: TAdvToolButton;
    btnPrint: TAdvToolButton;
    btnClose: TAdvToolButton;
    edtPDate: TDateTimePicker;
    qryManager: TADOQuery;
    qryManagerParkNo: TSmallintField;
    qryManagerMNo: TWordField;
    qryManagerPasswd: TStringField;
    qryManagerMName: TStringField;
    qryManagerAuthority: TWordField;
    qryManagerReserve1: TStringField;
    qryManagerReserve2: TStringField;
    qryManagerReserve3: TStringField;
    qryManagerReserve4: TStringField;
    qryManagerReserve5: TStringField;
    qryCTKProc: TADOQuery;
    qryCTKProcParkNo: TSmallintField;
    qryCTKProcUnitNo: TWordField;
    qryCTKProcMNo: TWordField;
    qryCTKProcTKType: TWordField;
    qryCTKProcCOLUMN1: TIntegerField;
    qryCTKProcCOLUMN2: TIntegerField;
    qryCTKProcCOLUMN3: TIntegerField;
    qryCTKProcCOLUMN4: TIntegerField;
    dsCTKProc: TDataSource;
    dsCIssueTK: TDataSource;
    qryCIssueTK: TADOQuery;
    qryCIssueTKMNo: TWordField;
    qryCIssueTKCOLUMN1: TIntegerField;
    qryCIssueTKCOLUMN2: TIntegerField;
    qryCIssueTKCOLUMN3: TIntegerField;
    qryCBarProc: TADOQuery;
    qryCBarProcParkNo: TSmallintField;
    qryCBarProcUnitNo: TWordField;
    qryCBarProcMNo: TWordField;
    qryCBarProcCOLUMN1: TIntegerField;
    qryCBarProcCOLUMN2: TIntegerField;
    qryCBarProcCOLUMN3: TIntegerField;
    qryCBarProcCOLUMN4: TIntegerField;
    dsCBarProc: TDataSource;
    qryCTKProcMName: TStringField;
    qryCIssueTKMName: TStringField;
    qryCBarProcMName: TStringField;
    qryCIssueTKTKType: TWordField;
    qryCIssueTKIssueType: TWordField;
    btnSearch: TAdvToolButton;
    edtRealCnt: TAdvEdit;
    qryTemp: TADOQuery;
    procedure btnCloseClick(Sender: TObject);
    procedure btnClosingClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnDetailClick(Sender: TObject);
    procedure qryCTKProcMNameGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryCIssueTKMNameGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryCBarProcMNameGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryCTKProcTKTypeGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryCIssueTKTKTypeGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryCIssueTKIssueTypeGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure btnSearchClick(Sender: TObject);
  private
    { Private declarations }
    procedure DataCheck(nSelect: Byte);
  public
    { Public declarations }
  end;

var
  frmClosing: TfrmClosing;
  sRPrt: String;
  nFeeNo1, nFeeNo2, nFeeNo3, nFeeNo4, nFeeNo5, nFeeNo6, nFeeNo7, nFeeNo8, nFeeNo9,
  nFeeNo10, nFeeNo11, nFeeNo12, nFeeNo13, nFeeNo14, nFeeNo15, nFeeNo16, nFeeNo17,
  nFeeNo18, nFeeNo19, nFeeNo20: Byte;

  sFeeName1, sFeeName2, sFeeName3, sFeeName4, sFeeName5, sFeeName6, sFeeName7,
  sFeeName8, sFeeName9, sFeeName10, sFeeName11, sFeeName12, sFeeName13, sFeeName14,
  sFeeName15, sFeeName16, sFeeName17, sFeeName18, sFeeName19, sFeeName20,
  sCnt0, sAmt0, sCnt1, sAmt1, sCnt2, sAmt2, sCnt3, sAmt3, sCnt4, sAmt4, sCnt5, sAmt5,
  sCnt6, sAmt6, sCnt7, sAmt7, sCnt8, sAmt8, sCnt9, sAmt9, sCnt10, sAmt10, sCnt11,
  sAmt11, sCnt12, sAmt12, sCnt13, sAmt13, sCnt14, sAmt14, sCnt15, sAmt15, sCnt16,
  sAmt16, sCnt17, sAmt17, sCnt18, sAmt18, sCnt19, sAmt19, sCnt20, sAmt20: String;
  nFeeCnt: Integer;

implementation
uses
  MainNew, Global, Tables, FeeDetail;

{$R *.dfm}

// ����
procedure TfrmClosing.DataCheck(nSelect: Byte);
var
  sCDate, sPDate, sPTime, sTemp, sHour, sMin, sDCProcTime: String;
  nCSeq, i, nGT1, nHyunTot, nCreditTot, nBalTot: Integer;
  nFile,nClosingSeq: Integer;
  sFileName: String;
begin
  try
    sRPrt:= '';
    nFeeCnt:= 0;
    sCnt0:= '0';  sAmt0:= '0';  sCnt1:= '0';  sAmt1:= '0';  sCnt2:= '0';  sAmt2:= '0';
    sCnt3:= '0';  sAmt3:= '0';  sCnt4:= '0';  sAmt4:= '0';  sCnt5:= '0';  sAmt5:= '0';
    sCnt6:= '0';  sAmt6:= '0';  sCnt7:= '0';  sAmt7:= '0';  sCnt8:= '0';  sAmt8:= '0';
    sCnt9:= '0';  sAmt9:= '0';
    nHyunTot:= 0;
    nBalTot:= 0;

    // ��ȸ (nSelect�� 1�̸� ��ȸ, 2�̸� ����)
    if nSelect = 1 then
    begin
      sRPrt:=     '========================================' + LF + CR + SO_WTP;
      sRPrt:=  sRPrt + '   ��  ��  ��  ��' + LF + CR + SI_WTP;
      sRPrt:= sRPrt + '========================================' + LF + LF + CR;
    end
    // ����
    else
    if nSelect = 2 then
    begin
      bClosing:= True;
      sRPrt:=     '========================================' + LF + CR + SO_WTP;
      sRPrt:=  sRPrt + '   ��  ��  ��  Ȳ' + LF + CR + SI_WTP;
      sRPrt:= sRPrt + '========================================' + LF + LF + CR;
      nCSeq:= iSetup.ReadInteger('PARKING', 'CLOSING_'+FormatDateTime('YYYY-MM-DD', Now), 0)+1;       // ���ó�¥�� ����Ƚ�� �����ͼ� +1 �Ͽ� ������ ����
      iSetup.WriteInteger('PARKING', 'CLOSING_'+FormatDateTime('YYYY-MM-DD', Now), nCSeq);            // ������ �����Ѱ� �ٽ� ini���Ͽ� ����
    end;

    sRPrt:= sRPrt + '�ٹ�����: ' + sGeunmuStart + LF + CR;             //  sGeunmuStart : ini���Ͽ��� �о�� �ٹ����� ����

    // ����
    if nSelect = 2 then
      sRPrt:= sRPrt + '��������: ' + FormatDateTime('YYYY-MM-DD', edtPDate.Date) + LF + CR;

    sRPrt:= sRPrt + 'ó���Ͻ�: ' + FormatDateTime('YYYY-MM-DD HH:NN:SS', Now) + LF + CR;
    sRPrt:= sRPrt + '�ٹ��ڸ�: ' + sCurrMName + LF + LF + CR;
    sRPrt:= sRPrt + '[Ƽ��ó��]' + LF + CR;
    sRPrt:= sRPrt + '----------------------------------------' + LF + CR;
    sRPrt:= sRPrt + 'NO  �Ǽ�   �����ݾ�  ���αݾ�   �����ݾ�' + LF + CR;

    //���ڸ���
    if nClosingType = 0 then
      sCDate:= FormatDateTime('YYYY-MM-DD', edtPDate.Date)
    //�ٹ��ڸ���
    else
      sCDate:= Copy(sGeunmuStart, 1, 10);

    sPDate:= FormatDateTime('YYYY-MM-DD', Now); //ó������
    sPTime:= FormatDateTime('HH:NN:SS', Now);   //ó���ð�

    // ��ȸ
    if nSelect = 1 then
      StartProgress('�ڷ� ��ȸ��...', '�ڷ���ȸ���Դϴ�.  ��� ��ٷ��ּ���!', 100)
    // ����
    else
    if nSelect = 2 then
      StartProgress('���� ó����...', '����ó�����Դϴ�.  ��� ��ٷ��ּ���!', 100);

    // �ڷ� ��ȸ
    with dmTables do
    begin
      with qryTemp do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select * from Closing where ParkNo = :N1 and CDate = :N2 and MNo = :N3');
        Parameters.ParamByName('N1').Value:= nCurrParkNo;
        Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtPDate.Date);
        Parameters.ParamByName('N3').Value:= nCurrMNo;
        Open;

        if RecordCount > 0 then
          nClosingSeq:= FieldByName('ClosingSeq').AsInteger + 1
        else
          nClosingSeq:= 1;

        Close;
        SQL.Clear;
        SQL.Add('Update Closing Set ClosingSeq = :N0 where ParkNo = :N1 and CDate = :N2 and MNo = :N3');
        Parameters.ParamByName('N0').Value:= nClosingSeq;
        Parameters.ParamByName('N1').Value:= nCurrParkNo;
        Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtPDate.Date);
        Parameters.ParamByName('N3').Value:= nCurrMNo;
        ExecSQL;

        // ȸ���ð� ��ȸ
        Close;
        SQL.Clear;
        SQL.Add('Select GT1 from Gracetime where ParkNo = :N1');          // Gracetime: ���񽺽ð� ����
        Parameters.ParamByName('N1').Value:= nCurrParkNo;
        Open;

        if RecordCount > 0 then
        begin
          // GT1 => '00:30'
          sHour:= Copy(MG_StrTrim(FieldByName('GT1').AsString, ':'), 1, 2);      // ȸ�� �ð�
          sMin := Copy(MG_StrTrim(FieldByName('GT1').AsString, ':'), 3, 2);      // ȸ�� ��
          nGT1:= (StrToInt(sHour) * 60) + StrToInt(sMin);                        // DB���� ������ ȸ���� ����ȯ�Ͽ� ȸ�������� ����
        end
        else
          nGT1:= 0;         // ȸ���ð�

        // ������� ��ȸ
        Close;
        SQL.Clear;
        SQL.Add('Select * from FeeItem where ParkNo = :N1 Order By FeeNo');
        Parameters.ParamByName('N1').Value:= nCurrParkNo;
        Open;  i:= 1;

        if RecordCount > 0 then
        begin
          nFeeCnt:= RecordCount;

          while not Eof do
          begin
            Case i of
              1: begin
                   nFeeNo1  := FieldByName('FeeNo').AsInteger;
                   sFeeName1:= FieldByName('FeeName').AsString;
                 end;

              2: begin
                   nFeeNo2  := FieldByName('FeeNo').AsInteger;
                   sFeeName2:= FieldByName('FeeName').AsString;
                 end;

              3: begin
                   nFeeNo3  := FieldByName('FeeNo').AsInteger;
                   sFeeName3:= FieldByName('FeeName').AsString;
                 end;

              4: begin
                   nFeeNo4  := FieldByName('FeeNo').AsInteger;
                   sFeeName4:= FieldByName('FeeName').AsString;
                 end;

              5: begin
                   nFeeNo5  := FieldByName('FeeNo').AsInteger;
                   sFeeName5:= FieldByName('FeeName').AsString;
                 end;

              6: begin
                   nFeeNo6  := FieldByName('FeeNo').AsInteger;
                   sFeeName6:= FieldByName('FeeName').AsString;
                 end;

              7: begin
                   nFeeNo7  := FieldByName('FeeNo').AsInteger;
                   sFeeName7:= FieldByName('FeeName').AsString;
                 end;

              8: begin
                   nFeeNo8  := FieldByName('FeeNo').AsInteger;
                   sFeeName8:= FieldByName('FeeName').AsString;
                 end;

              9: begin
                   nFeeNo9  := FieldByName('FeeNo').AsInteger;
                   sFeeName9:= FieldByName('FeeName').AsString;
                 end;

              10: begin
                   nFeeNo10  := FieldByName('FeeNo').AsInteger;
                   sFeeName10:= FieldByName('FeeName').AsString;
                  end;

              11: begin
                   nFeeNo11  := FieldByName('FeeNo').AsInteger;
                   sFeeName11:= FieldByName('FeeName').AsString;
                  end;

              12: begin
                   nFeeNo12  := FieldByName('FeeNo').AsInteger;
                   sFeeName12:= FieldByName('FeeName').AsString;
                  end;

              13: begin
                   nFeeNo13  := FieldByName('FeeNo').AsInteger;
                   sFeeName13:= FieldByName('FeeName').AsString;
                  end;

              14: begin
                   nFeeNo14  := FieldByName('FeeNo').AsInteger;
                   sFeeName14:= FieldByName('FeeName').AsString;
                  end;

              15: begin
                   nFeeNo15  := FieldByName('FeeNo').AsInteger;
                   sFeeName15:= FieldByName('FeeName').AsString;
                  end;

              16: begin
                   nFeeNo16  := FieldByName('FeeNo').AsInteger;
                   sFeeName16:= FieldByName('FeeName').AsString;
                  end;

              17: begin
                   nFeeNo17  := FieldByName('FeeNo').AsInteger;
                   sFeeName17:= FieldByName('FeeName').AsString;
                  end;

              18: begin
                   nFeeNo18  := FieldByName('FeeNo').AsInteger;
                   sFeeName18:= FieldByName('FeeName').AsString;
                  end;

              19: begin
                   nFeeNo19  := FieldByName('FeeNo').AsInteger;
                   sFeeName19:= FieldByName('FeeName').AsString;
                  end;

              20: begin
                   nFeeNo20  := FieldByName('FeeNo').AsInteger;
                   sFeeName20:= FieldByName('FeeName').AsString;
                  end;
            end;
            Next; i:= i+1;
          end;
        end;

        // ����ó������ ó���Ͻ� ��ȸ
        Close;
        SQL.Clear;
        SQL.Add('Select ProcTime from TKProc ');

        // ���ڸ���
        if nClosingType = 0 then
          SQL.Add('where ProcDate = :N1 and ChkClosing = :N2 and UnitNo = :N3 Order By ProcTime')
        // �ٹ��ڸ���
        else
          SQL.Add('where ProcDate >= :N1 and ChkClosing = :N2 and UnitNo = :N3 Order By ProcTime');

        Parameters.ParamByName('N1').Value:= sCDate;           // �ٹ�������
        Parameters.ParamByName('N2').Value:= 0;                // �̸���
        Parameters.ParamByName('N3').Value:= nCurrUnitNo;      // ���PC ��� ��ȣ
        Open;

        if RecordCount > 0 then
        begin
          sDCProcTime:= FieldByName('ProcTime').AsString;           // ó���Ͻ�
        end;

        // Ƽ��ó�� ����
        // �� �����ݾ� �Ǽ�, �� �����ݾ�, �� ���αݾ�, �� �����ݾ� ��ȸ
        Close;
        SQL.Clear;
        SQL.Add('Select Count(*), Sum(TotFee), Sum(TotDC), Sum(RealFee) ');
        SQL.Add('from TKProc ');

        // ���ڸ���
        if nClosingType = 0 then
          SQL.Add('where ProcDate = :N1 and ChkClosing = :N2 and UnitNo = :N3 and ')
        // �ٹ��ڸ���
        else
          SQL.Add('where ProcDate >= :N1 and ChkClosing = :N2 and UnitNo = :N3 and ');          // �ٹ������Ϻ���, �������ΰ� 0�ΰ�

        SQL.Add('(TKType = :N4 or TKType = :N5) and MNo = :N6 and Reserve2 <> :N7');            // Ƽ������=> �Ϲݱ�, ��������
        Parameters.ParamByName('N1').Value:= sCDate;
        Parameters.ParamByName('N2').Value:= 0;
        Parameters.ParamByName('N3').Value:= nCurrUnitNo;
        Parameters.ParamByName('N4').Value:= 1;  //�Ϲݱ�
        Parameters.ParamByName('N5').Value:= 9;  //��������
        Parameters.ParamByName('N6').Value:= nCurrMNo;
        Parameters.ParamByName('N7').Value:= '����ð�����';
        Open;
        SetProgress(3);  //1
        sTemp:= IntToStr(RecordCount);

        if RecordCount > 0 then
        begin
          // ȭ�鿡 ǥ��
          edtCnt .Text:= FieldByName('COLUMN1').AsString;         // �� �����ݾ� �Ǽ�
          edtTot .Text:= FieldByName('COLUMN2').AsString;         // �� �����ݾ�
          edtDC  .Text:= FieldByName('COLUMN3').AsString;         // �� ���αݾ�
          edtReal.Text:= FieldByName('COLUMN4').AsString;         // �� �����ݾ�

          // �� �����ݾ� �Ǽ� ��ȸ
          Close;
          SQL.Clear;
          SQL.Add('Select Count(*) nRealCnt from TKProc ');

          // ���ڸ���
          if nClosingType = 0 then
            SQL.Add('where ProcDate = :N1 and ChkClosing = :N2 and UnitNo = :N3 and ')
          // �ٹ��ڸ���
          else
            SQL.Add('where ProcDate >= :N1 and ChkClosing = :N2 and UnitNo = :N3 and ');

          SQL.Add('(TKType = :N4 or TKType = :N5) and MNo = :N6 and Reserve2 <> :N7 and ');
          SQL.Add('RealFee > 0');

          Parameters.ParamByName('N1').Value:= sCDate;
          Parameters.ParamByName('N2').Value:= 0;
          Parameters.ParamByName('N3').Value:= nCurrUnitNo;
          Parameters.ParamByName('N4').Value:= 1;  //�Ϲݱ�
          Parameters.ParamByName('N5').Value:= 9;  //��������
          Parameters.ParamByName('N6').Value:= nCurrMNo;
          Parameters.ParamByName('N7').Value:= '����ð�����';
          Open;

          edtRealCnt.Text:= IntToStr(FieldByName('nRealCnt').AsInteger);       // �� �����ݾ� �Ǽ� ȭ�鿡 ǥ��

          // �� �������� �Ǽ�, �� �������� �ݾ� ��ȸ
          Close;
          SQL.Clear;
          SQL.Add('Select Count(*), Sum(RealFee) from TKProc ');

          // ���ڸ���
          if nClosingType = 0 then
            SQL.Add('where ProcDate = :N1 and ChkClosing = :N2 and ')
          // �ٹ��ڸ���
          else
            SQL.Add('where ProcDate >= :N1 and ChkClosing = :N2 and ');

          SQL.Add('TKType = :N3 and UnitNo = :N4 and MNo = :N5');
          Parameters.ParamByName('N1').Value:= sCDate;
          Parameters.ParamByName('N2').Value:= 0;
          Parameters.ParamByName('N3').Value:= 9; //��������
          Parameters.ParamByName('N4').Value:= nCurrUnitNo;
          Parameters.ParamByName('N5').Value:= nCurrMNo;
          Open;

          if RecordCount > 0 then
          begin
            // ȭ�鿡 ǥ��
            edtLostCnt.Text:= FieldByName('COLUMN1').AsString;              // �� �������� �Ǽ�
            edtLostAmt.Text:= FieldByName('COLUMN2').AsString;              // �� �������� �ݾ�
          end;

          // �����հ�, �� ���ݾ� ��ȸ ???
          Close;
          SQL.Clear;
          SQL.Add('Select Count(*), isNull(Sum(RealFee), 0) from TKProc ');

          // ���ڸ���
          if nClosingType = 0 then
            SQL.Add('where ProcDate = :N1 and ChkClosing = :N2 and FeeNo = :N3 and ')
          // �ٹ��ڸ���
          else
            SQL.Add('where ProcDate >= :N1 and ChkClosing = :N2 and FeeNo = :N3 and ');

          SQL.Add('(TKType = :N4 or TKType = :N5) and UnitNo = :N6 and MNo = :N7 and Reserve2 <> :N8');
          Parameters.ParamByName('N1').Value:= sCDate;
          Parameters.ParamByName('N2').Value:= 0;
          Parameters.ParamByName('N3').Value:= 0; //�Ϲݿ��
          Parameters.ParamByName('N4').Value:= 1;
          Parameters.ParamByName('N5').Value:= 9;
          Parameters.ParamByName('N6').Value:= nCurrUnitNo;
          Parameters.ParamByName('N7').Value:= nCurrMNo;
          Parameters.ParamByName('N8').Value:= '����ð�����';
          Open;

          if RecordCount > 0 then
          begin
            sCnt0:= FieldByName('COLUMN1').AsString;
            sAmt0:= FieldByName('COLUMN2').AsString;
          end;

          // ����ó������ ����׸��ȣ FeeNo= nFeeNo1 �� �ش��ϴ� ������ ��ȸ
          Close;
          SQL.Clear;
          SQL.Add('Select Count(*), isNull(Sum(RealFee), 0) from TKProc ');

          if nClosingType = 0 then
            SQL.Add('where ProcDate = :N1 and ChkClosing = :N2 and FeeNo = :N3 and ')
          else
            SQL.Add('where ProcDate >= :N1 and ChkClosing = :N2 and FeeNo = :N3 and ');

          SQL.Add('(TKType = :N4 or TKType = :N5) and UnitNo = :N6 and MNo = :N7 and Reserve2 <> :N8');
          Parameters.ParamByName('N1').Value:= sCDate;
          Parameters.ParamByName('N2').Value:= 0;
          Parameters.ParamByName('N3').Value:= nFeeNo1;
          Parameters.ParamByName('N4').Value:= 1;
          Parameters.ParamByName('N5').Value:= 9;
          Parameters.ParamByName('N6').Value:= nCurrUnitNo;
          Parameters.ParamByName('N7').Value:= nCurrMNo;
          Parameters.ParamByName('N8').Value:= '����ð�����';
          Open;

          if RecordCount > 0 then
          begin
            sCnt1:= FieldByName('COLUMN1').AsString;
            sAmt1:= FieldByName('COLUMN2').AsString;
          end;

          // ����ó������ ����׸��ȣ FeeNo= nFeeNo2 �� �ش��ϴ� ������ ��ȸ
          Close;
          SQL.Clear;
          SQL.Add('Select Count(*), isNull(Sum(RealFee), 0) from TKProc ');

          if nClosingType = 0 then
            SQL.Add('where ProcDate = :N1 and ChkClosing = :N2 and FeeNo = :N3 and ')
          else
            SQL.Add('where ProcDate >= :N1 and ChkClosing = :N2 and FeeNo = :N3 and ');

          SQL.Add('(TKType = :N4 or TKType = :N5) and UnitNo = :N6 and MNo = :N7 and Reserve2 <> :N8');
          Parameters.ParamByName('N1').Value:= sCDate;
          Parameters.ParamByName('N2').Value:= 0;
          Parameters.ParamByName('N3').Value:= nFeeNo2;
          Parameters.ParamByName('N4').Value:= 1;
          Parameters.ParamByName('N5').Value:= 9;
          Parameters.ParamByName('N6').Value:= nCurrUnitNo;
          Parameters.ParamByName('N7').Value:= nCurrMNo;
          Parameters.ParamByName('N8').Value:= '����ð�����';
          Open;

          if RecordCount > 0 then
          begin
            sCnt2:= FieldByName('COLUMN1').AsString;
            sAmt2:= FieldByName('COLUMN2').AsString;
          end;

          // ����ó������ ����׸��ȣ FeeNo= nFeeNo3 �� �ش��ϴ� ������ ��ȸ
          Close;
          SQL.Clear;
          SQL.Add('Select Count(*), isNull(Sum(RealFee), 0) from TKProc ');

          if nClosingType = 0 then
            SQL.Add('where ProcDate = :N1 and ChkClosing = :N2 and FeeNo = :N3 and ')
          else
            SQL.Add('where ProcDate >= :N1 and ChkClosing = :N2 and FeeNo = :N3 and ');

          SQL.Add('(TKType = :N4 or TKType = :N5) and UnitNo = :N6 and MNo = :N7 and Reserve2 <> :N8');
          Parameters.ParamByName('N1').Value:= sCDate;
          Parameters.ParamByName('N2').Value:= 0;
          Parameters.ParamByName('N3').Value:= nFeeNo3;
          Parameters.ParamByName('N4').Value:= 1;
          Parameters.ParamByName('N5').Value:= 9;
          Parameters.ParamByName('N6').Value:= nCurrUnitNo;
          Parameters.ParamByName('N7').Value:= nCurrMNo;
          Parameters.ParamByName('N8').Value:= '����ð�����';
          Open;

          if RecordCount > 0 then
          begin
            sCnt3:= FieldByName('COLUMN1').AsString;
            sAmt3:= FieldByName('COLUMN2').AsString;
          end;

          // ����ó������ ����׸��ȣ FeeNo= nFeeNo4 �� �ش��ϴ� ������ ��ȸ
          Close;
          SQL.Clear;
          SQL.Add('Select Count(*), isNull(Sum(RealFee), 0) from TKProc ');

          if nClosingType = 0 then
            SQL.Add('where ProcDate = :N1 and ChkClosing = :N2 and FeeNo = :N3 and ')
          else
            SQL.Add('where ProcDate >= :N1 and ChkClosing = :N2 and FeeNo = :N3 and ');

          SQL.Add('(TKType = :N4 or TKType = :N5) and UnitNo = :N6 and MNo = :N7 and Reserve2 <> :N8');
          Parameters.ParamByName('N1').Value:= sCDate;
          Parameters.ParamByName('N2').Value:= 0;
          Parameters.ParamByName('N3').Value:= nFeeNo4;
          Parameters.ParamByName('N4').Value:= 1;
          Parameters.ParamByName('N5').Value:= 9;
          Parameters.ParamByName('N6').Value:= nCurrUnitNo;
          Parameters.ParamByName('N7').Value:= nCurrMNo;
          Parameters.ParamByName('N8').Value:= '����ð�����';
          Open;

          if RecordCount > 0 then
          begin
            sCnt4:= FieldByName('COLUMN1').AsString;
            sAmt4:= FieldByName('COLUMN2').AsString;
          end;

          // ����ó������ ����׸��ȣ FeeNo= nFeeNo5 �� �ش��ϴ� ������ ��ȸ
          Close;
          SQL.Clear;
          SQL.Add('Select Count(*), isNull(Sum(RealFee), 0) from TKProc ');

          if nClosingType = 0 then
            SQL.Add('where ProcDate = :N1 and ChkClosing = :N2 and FeeNo = :N3 and ')
          else
            SQL.Add('where ProcDate >= :N1 and ChkClosing = :N2 and FeeNo = :N3 and ');

          SQL.Add('(TKType = :N4 or TKType = :N5) and UnitNo = :N6 and MNo = :N7 and Reserve2 <> :N8');
          Parameters.ParamByName('N1').Value:= sCDate;
          Parameters.ParamByName('N2').Value:= 0;
          Parameters.ParamByName('N3').Value:= nFeeNo5;
          Parameters.ParamByName('N4').Value:= 1;
          Parameters.ParamByName('N5').Value:= 9;
          Parameters.ParamByName('N6').Value:= nCurrUnitNo;
          Parameters.ParamByName('N7').Value:= nCurrMNo;
          Parameters.ParamByName('N8').Value:= '����ð�����';
          Open;

          if RecordCount > 0 then
          begin
            sCnt5:= FieldByName('COLUMN1').AsString;
            sAmt5:= FieldByName('COLUMN2').AsString;
          end;

          // ����ó������ ����׸��ȣ FeeNo= nFeeNo6 �� �ش��ϴ� ������ ��ȸ
          Close;
          SQL.Clear;
          SQL.Add('Select Count(*), isNull(Sum(RealFee), 0) from TKProc ');

          if nClosingType = 0 then
            SQL.Add('where ProcDate = :N1 and ChkClosing = :N2 and FeeNo = :N3 and ')
          else
            SQL.Add('where ProcDate >= :N1 and ChkClosing = :N2 and FeeNo = :N3 and ');

          SQL.Add('(TKType = :N4 or TKType = :N5) and UnitNo = :N6 and MNo = :N7 and Reserve2 <> :N8');
          Parameters.ParamByName('N1').Value:= sCDate;
          Parameters.ParamByName('N2').Value:= 0;
          Parameters.ParamByName('N3').Value:= nFeeNo6;
          Parameters.ParamByName('N4').Value:= 1;
          Parameters.ParamByName('N5').Value:= 9;
          Parameters.ParamByName('N6').Value:= nCurrUnitNo;
          Parameters.ParamByName('N7').Value:= nCurrMNo;
          Parameters.ParamByName('N8').Value:= '����ð�����';
          Open;

          if RecordCount > 0 then
          begin
            sCnt6:= FieldByName('COLUMN1').AsString;
            sAmt6:= FieldByName('COLUMN2').AsString;
          end;

          // ����ó������ ����׸��ȣ FeeNo= nFeeNo7 �� �ش��ϴ� ������ ��ȸ
          Close;
          SQL.Clear;
          SQL.Add('Select Count(*), isNull(Sum(RealFee), 0) from TKProc ');

          if nClosingType = 0 then
            SQL.Add('where ProcDate = :N1 and ChkClosing = :N2 and FeeNo = :N3 and ')
          else
            SQL.Add('where ProcDate >= :N1 and ChkClosing = :N2 and FeeNo = :N3 and ');

          SQL.Add('(TKType = :N4 or TKType = :N5) and UnitNo = :N6 and MNo = :N7 and Reserve2 <> :N8');
          Parameters.ParamByName('N1').Value:= sCDate;
          Parameters.ParamByName('N2').Value:= 0;
          Parameters.ParamByName('N3').Value:= nFeeNo7;
          Parameters.ParamByName('N4').Value:= 1;
          Parameters.ParamByName('N5').Value:= 9;
          Parameters.ParamByName('N6').Value:= nCurrUnitNo;
          Parameters.ParamByName('N7').Value:= nCurrMNo;
          Parameters.ParamByName('N8').Value:= '����ð�����';
          Open;

          if RecordCount > 0 then
          begin
            sCnt7:= FieldByName('COLUMN1').AsString;
            sAmt7:= FieldByName('COLUMN2').AsString;
          end;

          // ����ó������ ����׸��ȣ FeeNo= nFeeNo8 �� �ش��ϴ� ������ ��ȸ
          Close;
          SQL.Clear;
          SQL.Add('Select Count(*), isNull(Sum(RealFee), 0) from TKProc ');

          if nClosingType = 0 then
            SQL.Add('where ProcDate = :N1 and ChkClosing = :N2 and FeeNo = :N3 and ')
          else
            SQL.Add('where ProcDate >= :N1 and ChkClosing = :N2 and FeeNo = :N3 and ');

          SQL.Add('(TKType = :N4 or TKType = :N5) and UnitNo = :N6 and MNo = :N7 and Reserve2 <> :N8');
          Parameters.ParamByName('N1').Value:= sCDate;
          Parameters.ParamByName('N2').Value:= 0;
          Parameters.ParamByName('N3').Value:= nFeeNo8;
          Parameters.ParamByName('N4').Value:= 1;
          Parameters.ParamByName('N5').Value:= 9;
          Parameters.ParamByName('N6').Value:= nCurrUnitNo;
          Parameters.ParamByName('N7').Value:= nCurrMNo;
          Parameters.ParamByName('N8').Value:= '����ð�����';
          Open;

          if RecordCount > 0 then
          begin
            sCnt8:= FieldByName('COLUMN1').AsString;
            sAmt8:= FieldByName('COLUMN2').AsString;
          end;

          // ����ó������ ����׸��ȣ FeeNo= nFeeNo9 �� �ش��ϴ� ������ ��ȸ
          Close;
          SQL.Clear;
          SQL.Add('Select Count(*), isNull(Sum(RealFee), 0) from TKProc ');

          if nClosingType = 0 then
            SQL.Add('where ProcDate = :N1 and ChkClosing = :N2 and FeeNo = :N3 and ')
          else
            SQL.Add('where ProcDate >= :N1 and ChkClosing = :N2 and FeeNo = :N3 and ');

          SQL.Add('(TKType = :N4 or TKType = :N5) and UnitNo = :N6 and MNo = :N7 and Reserve2 <> :N8');
          Parameters.ParamByName('N1').Value:= sCDate;
          Parameters.ParamByName('N2').Value:= 0;
          Parameters.ParamByName('N3').Value:= nFeeNo9;
          Parameters.ParamByName('N4').Value:= 1;
          Parameters.ParamByName('N5').Value:= 9;
          Parameters.ParamByName('N6').Value:= nCurrUnitNo;
          Parameters.ParamByName('N7').Value:= nCurrMNo;
          Parameters.ParamByName('N8').Value:= '����ð�����';
          Open;

          if RecordCount > 0 then
          begin
            sCnt9:= FieldByName('COLUMN1').AsString;
            sAmt9:= FieldByName('COLUMN2').AsString;
          end;

          // ����ó������ ����׸��ȣ FeeNo= nFeeNo10 �� �ش��ϴ� ������ ��ȸ
          Close;
          SQL.Clear;
          SQL.Add('Select Count(*), isNull(Sum(RealFee), 0) from TKProc ');

          if nClosingType = 0 then
            SQL.Add('where ProcDate = :N1 and ChkClosing = :N2 and FeeNo = :N3 and ')
          else
            SQL.Add('where ProcDate >= :N1 and ChkClosing = :N2 and FeeNo = :N3 and ');

          SQL.Add('(TKType = :N4 or TKType = :N5) and UnitNo = :N6 and MNo = :N7 and Reserve2 <> :N8');
          Parameters.ParamByName('N1').Value:= sCDate;
          Parameters.ParamByName('N2').Value:= 0;
          Parameters.ParamByName('N3').Value:= nFeeNo10;
          Parameters.ParamByName('N4').Value:= 1;
          Parameters.ParamByName('N5').Value:= 9;
          Parameters.ParamByName('N6').Value:= nCurrUnitNo;
          Parameters.ParamByName('N7').Value:= nCurrMNo;
          Parameters.ParamByName('N8').Value:= '����ð�����';
          Open;

          if RecordCount > 0 then
          begin
            sCnt10:= FieldByName('COLUMN1').AsString;
            sAmt10:= FieldByName('COLUMN2').AsString;
          end;

          // ����ó������ ����׸��ȣ FeeNo= nFeeNo11 �� �ش��ϴ� ������ ��ȸ
          Close;
          SQL.Clear;
          SQL.Add('Select Count(*), isNull(Sum(RealFee), 0) from TKProc ');

          if nClosingType = 0 then
            SQL.Add('where ProcDate = :N1 and ChkClosing = :N2 and FeeNo = :N3 and ')
          else
            SQL.Add('where ProcDate >= :N1 and ChkClosing = :N2 and FeeNo = :N3 and ');

          SQL.Add('(TKType = :N4 or TKType = :N5) and UnitNo = :N6 and MNo = :N7 and Reserve2 <> :N8');
          Parameters.ParamByName('N1').Value:= sCDate;
          Parameters.ParamByName('N2').Value:= 0;
          Parameters.ParamByName('N3').Value:= nFeeNo11;
          Parameters.ParamByName('N4').Value:= 1;
          Parameters.ParamByName('N5').Value:= 9;
          Parameters.ParamByName('N6').Value:= nCurrUnitNo;
          Parameters.ParamByName('N7').Value:= nCurrMNo;
          Parameters.ParamByName('N8').Value:= '����ð�����';
          Open;

          if RecordCount > 0 then
          begin
            sCnt11:= FieldByName('COLUMN1').AsString;
            sAmt11:= FieldByName('COLUMN2').AsString;
          end;

          // ����ó������ ����׸��ȣ FeeNo= nFeeNo12 �� �ش��ϴ� ������ ��ȸ
          Close;
          SQL.Clear;
          SQL.Add('Select Count(*), isNull(Sum(RealFee), 0) from TKProc ');

          if nClosingType = 0 then
            SQL.Add('where ProcDate = :N1 and ChkClosing = :N2 and FeeNo = :N3 and ')
          else
            SQL.Add('where ProcDate >= :N1 and ChkClosing = :N2 and FeeNo = :N3 and ');

          SQL.Add('(TKType = :N4 or TKType = :N5) and UnitNo = :N6 and MNo = :N7 and Reserve2 <> :N8');
          Parameters.ParamByName('N1').Value:= sCDate;
          Parameters.ParamByName('N2').Value:= 0;
          Parameters.ParamByName('N3').Value:= nFeeNo12;
          Parameters.ParamByName('N4').Value:= 1;
          Parameters.ParamByName('N5').Value:= 9;
          Parameters.ParamByName('N6').Value:= nCurrUnitNo;
          Parameters.ParamByName('N7').Value:= nCurrMNo;
          Parameters.ParamByName('N8').Value:= '����ð�����';
          Open;

          if RecordCount > 0 then
          begin
            sCnt12:= FieldByName('COLUMN1').AsString;
            sAmt12:= FieldByName('COLUMN2').AsString;
          end;

          // ����ó������ ����׸��ȣ FeeNo= nFeeNo13 �� �ش��ϴ� ������ ��ȸ
          Close;
          SQL.Clear;
          SQL.Add('Select Count(*), isNull(Sum(RealFee), 0) from TKProc ');

          if nClosingType = 0 then
            SQL.Add('where ProcDate = :N1 and ChkClosing = :N2 and FeeNo = :N3 and ')
          else
            SQL.Add('where ProcDate >= :N1 and ChkClosing = :N2 and FeeNo = :N3 and ');

          SQL.Add('(TKType = :N4 or TKType = :N5) and UnitNo = :N6 and MNo = :N7 and Reserve2 <> :N8');
          Parameters.ParamByName('N1').Value:= sCDate;
          Parameters.ParamByName('N2').Value:= 0;
          Parameters.ParamByName('N3').Value:= nFeeNo13;
          Parameters.ParamByName('N4').Value:= 1;
          Parameters.ParamByName('N5').Value:= 9;
          Parameters.ParamByName('N6').Value:= nCurrUnitNo;
          Parameters.ParamByName('N7').Value:= nCurrMNo;
          Parameters.ParamByName('N8').Value:= '����ð�����';
          Open;

          if RecordCount > 0 then
          begin
            sCnt13:= FieldByName('COLUMN1').AsString;
            sAmt13:= FieldByName('COLUMN2').AsString;
          end;

          // ����ó������ ����׸��ȣ FeeNo= nFeeNo14 �� �ش��ϴ� ������ ��ȸ
          Close;
          SQL.Clear;
          SQL.Add('Select Count(*), isNull(Sum(RealFee), 0) from TKProc ');

          if nClosingType = 0 then
            SQL.Add('where ProcDate = :N1 and ChkClosing = :N2 and FeeNo = :N3 and ')
          else
            SQL.Add('where ProcDate >= :N1 and ChkClosing = :N2 and FeeNo = :N3 and ');

          SQL.Add('(TKType = :N4 or TKType = :N5) and UnitNo = :N6 and MNo = :N7 and Reserve2 <> :N8');
          Parameters.ParamByName('N1').Value:= sCDate;
          Parameters.ParamByName('N2').Value:= 0;
          Parameters.ParamByName('N3').Value:= nFeeNo14;
          Parameters.ParamByName('N4').Value:= 1;
          Parameters.ParamByName('N5').Value:= 9;
          Parameters.ParamByName('N6').Value:= nCurrUnitNo;
          Parameters.ParamByName('N7').Value:= nCurrMNo;
          Parameters.ParamByName('N8').Value:= '����ð�����';
          Open;

          if RecordCount > 0 then
          begin
            sCnt14:= FieldByName('COLUMN1').AsString;
            sAmt14:= FieldByName('COLUMN2').AsString;
          end;

          // ����ó������ ����׸��ȣ FeeNo= nFeeNo15 �� �ش��ϴ� ������ ��ȸ
          Close;
          SQL.Clear;
          SQL.Add('Select Count(*), isNull(Sum(RealFee), 0) from TKProc ');

          if nClosingType = 0 then
            SQL.Add('where ProcDate = :N1 and ChkClosing = :N2 and FeeNo = :N3 and ')
          else
            SQL.Add('where ProcDate >= :N1 and ChkClosing = :N2 and FeeNo = :N3 and ');

          SQL.Add('(TKType = :N4 or TKType = :N5) and UnitNo = :N6 and MNo = :N7 and Reserve2 <> :N8');
          Parameters.ParamByName('N1').Value:= sCDate;
          Parameters.ParamByName('N2').Value:= 0;
          Parameters.ParamByName('N3').Value:= nFeeNo15;
          Parameters.ParamByName('N4').Value:= 1;
          Parameters.ParamByName('N5').Value:= 9;
          Parameters.ParamByName('N6').Value:= nCurrUnitNo;
          Parameters.ParamByName('N7').Value:= nCurrMNo;
          Parameters.ParamByName('N8').Value:= '����ð�����';
          Open;

          if RecordCount > 0 then
          begin
            sCnt15:= FieldByName('COLUMN1').AsString;
            sAmt15:= FieldByName('COLUMN2').AsString;
          end;

          // ����ó������ ����׸��ȣ FeeNo= nFeeNo16 �� �ش��ϴ� ������ ��ȸ
          Close;
          SQL.Clear;
          SQL.Add('Select Count(*), isNull(Sum(RealFee), 0) from TKProc ');

          if nClosingType = 0 then
            SQL.Add('where ProcDate = :N1 and ChkClosing = :N2 and FeeNo = :N3 and ')
          else
            SQL.Add('where ProcDate >= :N1 and ChkClosing = :N2 and FeeNo = :N3 and ');

          SQL.Add('(TKType = :N4 or TKType = :N5) and UnitNo = :N6 and MNo = :N7 and Reserve2 <> :N8');
          Parameters.ParamByName('N1').Value:= sCDate;
          Parameters.ParamByName('N2').Value:= 0;
          Parameters.ParamByName('N3').Value:= nFeeNo16;
          Parameters.ParamByName('N4').Value:= 1;
          Parameters.ParamByName('N5').Value:= 9;
          Parameters.ParamByName('N6').Value:= nCurrUnitNo;
          Parameters.ParamByName('N7').Value:= nCurrMNo;
          Parameters.ParamByName('N8').Value:= '����ð�����';
          Open;

          if RecordCount > 0 then
          begin
            sCnt16:= FieldByName('COLUMN1').AsString;
            sAmt16:= FieldByName('COLUMN2').AsString;
          end;

          // ����ó������ ����׸��ȣ FeeNo= nFeeNo17 �� �ش��ϴ� ������ ��ȸ
          Close;
          SQL.Clear;
          SQL.Add('Select Count(*), isNull(Sum(RealFee), 0) from TKProc ');

          if nClosingType = 0 then
            SQL.Add('where ProcDate = :N1 and ChkClosing = :N2 and FeeNo = :N3 and ')
          else
            SQL.Add('where ProcDate >= :N1 and ChkClosing = :N2 and FeeNo = :N3 and ');

          SQL.Add('(TKType = :N4 or TKType = :N5) and UnitNo = :N6 and MNo = :N7 and Reserve2 <> :N8');
          Parameters.ParamByName('N1').Value:= sCDate;
          Parameters.ParamByName('N2').Value:= 0;
          Parameters.ParamByName('N3').Value:= nFeeNo17;
          Parameters.ParamByName('N4').Value:= 1;
          Parameters.ParamByName('N5').Value:= 9;
          Parameters.ParamByName('N6').Value:= nCurrUnitNo;
          Parameters.ParamByName('N7').Value:= nCurrMNo;
          Parameters.ParamByName('N8').Value:= '����ð�����';
          Open;

          if RecordCount > 0 then
          begin
            sCnt17:= FieldByName('COLUMN1').AsString;
            sAmt17:= FieldByName('COLUMN2').AsString;
          end;

          // ����ó������ ����׸��ȣ FeeNo= nFeeNo18 �� �ش��ϴ� ������ ��ȸ
          Close;
          SQL.Clear;
          SQL.Add('Select Count(*), isNull(Sum(RealFee), 0) from TKProc ');

          if nClosingType = 0 then
            SQL.Add('where ProcDate = :N1 and ChkClosing = :N2 and FeeNo = :N3 and ')
          else
            SQL.Add('where ProcDate >= :N1 and ChkClosing = :N2 and FeeNo = :N3 and ');

          SQL.Add('(TKType = :N4 or TKType = :N5) and UnitNo = :N6 and MNo = :N7 and Reserve2 <> :N8');
          Parameters.ParamByName('N1').Value:= sCDate;
          Parameters.ParamByName('N2').Value:= 0;
          Parameters.ParamByName('N3').Value:= nFeeNo18;
          Parameters.ParamByName('N4').Value:= 1;
          Parameters.ParamByName('N5').Value:= 9;
          Parameters.ParamByName('N6').Value:= nCurrUnitNo;
          Parameters.ParamByName('N7').Value:= nCurrMNo;
          Parameters.ParamByName('N8').Value:= '����ð�����';
          Open;

          if RecordCount > 0 then
          begin
            sCnt18:= FieldByName('COLUMN1').AsString;
            sAmt18:= FieldByName('COLUMN2').AsString;
          end;

          // ����ó������ ����׸��ȣ FeeNo= nFeeNo19 �� �ش��ϴ� ������ ��ȸ
          Close;
          SQL.Clear;
          SQL.Add('Select Count(*), isNull(Sum(RealFee), 0) from TKProc ');

          if nClosingType = 0 then
            SQL.Add('where ProcDate = :N1 and ChkClosing = :N2 and FeeNo = :N3 and ')
          else
            SQL.Add('where ProcDate >= :N1 and ChkClosing = :N2 and FeeNo = :N3 and ');

          SQL.Add('(TKType = :N4 or TKType = :N5) and UnitNo = :N6 and MNo = :N7 and Reserve2 <> :N8');
          Parameters.ParamByName('N1').Value:= sCDate;
          Parameters.ParamByName('N2').Value:= 0;
          Parameters.ParamByName('N3').Value:= nFeeNo19;
          Parameters.ParamByName('N4').Value:= 1;
          Parameters.ParamByName('N5').Value:= 9;
          Parameters.ParamByName('N6').Value:= nCurrUnitNo;
          Parameters.ParamByName('N7').Value:= nCurrMNo;
          Parameters.ParamByName('N8').Value:= '����ð�����';
          Open;

          if RecordCount > 0 then
          begin
            sCnt19:= FieldByName('COLUMN1').AsString;
            sAmt19:= FieldByName('COLUMN2').AsString;
          end;

          // ����ó������ ����׸��ȣ FeeNo= nFeeNo20 �� �ش��ϴ� ������ ��ȸ
          Close;
          SQL.Clear;
          SQL.Add('Select Count(*), isNull(Sum(RealFee), 0) from TKProc ');

          if nClosingType = 0 then
            SQL.Add('where ProcDate = :N1 and ChkClosing = :N2 and FeeNo = :N3 and ')
          else
            SQL.Add('where ProcDate >= :N1 and ChkClosing = :N2 and FeeNo = :N3 and ');

          SQL.Add('(TKType = :N4 or TKType = :N5) and UnitNo = :N6 and MNo = :N7 and Reserve2 <> :N8');
          Parameters.ParamByName('N1').Value:= sCDate;
          Parameters.ParamByName('N2').Value:= 0;
          Parameters.ParamByName('N3').Value:= nFeeNo20;
          Parameters.ParamByName('N4').Value:= 1;
          Parameters.ParamByName('N5').Value:= 9;
          Parameters.ParamByName('N6').Value:= nCurrUnitNo;
          Parameters.ParamByName('N7').Value:= nCurrMNo;
          Parameters.ParamByName('N8').Value:= '����ð�����';
          Open;

          if RecordCount > 0 then
          begin
            sCnt20:= FieldByName('COLUMN1').AsString;
            sAmt20:= FieldByName('COLUMN2').AsString;
          end;

          // �� ���αݾ� �Ǽ� ��ȸ
          Close;
          SQL.Clear;
          SQL.Add('Select Sum(DCCnt) from TKProc ');

          // ���ڸ���
          if nClosingType = 0 then
            SQL.Add('where ProcDate = :N1 and ChkClosing = :N2 and ')
          // �ٹ��ڸ���
          else
            SQL.Add('where ProcDate >= :N1 and ChkClosing = :N2 and ');

          SQL.Add('(TKType = :N3 or TKType = :N4) and UnitNo = :N5 and MNo = :N6 and Reserve2 <> :N7');
          Parameters.ParamByName('N1').Value:= sCDate;
          Parameters.ParamByName('N2').Value:= 0;
          Parameters.ParamByName('N3').Value:= 1;
          Parameters.ParamByName('N4').Value:= 9;
          Parameters.ParamByName('N5').Value:= nCurrUnitNo;
          Parameters.ParamByName('N6').Value:= nCurrMNo;
          Parameters.ParamByName('N7').Value:= '����ð�����';
          Open;

          if RecordCount > 0 then
            edtTotDCCnt.Text:= FieldByName('COLUMN1').AsString        // �� ���αݾ� �Ǽ�
          else
            edtTotDCCnt.Text:= '0';

          //�������(GT1)�Ǽ�
          if nGT1 > 0 then
          begin
            Close;
            SQL.Clear;

            // ���ڸ���
            if nClosingType = 0 then
              SQL.Add('Select * from TKProc where ProcDate = :N1 and ChkClosing = :N2 and ')
            // �ٹ��ڸ���
            else
              SQL.Add('Select * from TKProc where ProcDate >= :N1 and ChkClosing = :N2 and ');

            SQL.Add('ParkingMin < :N3 and (TKType = :N4 or TKType = :N5) and UnitNo = :N6 and MNo = :N7 ');
            SQL.Add(' and Reserve2 <> :N8' );
            Parameters.ParamByName('N1').Value:= sCDate;
            Parameters.ParamByName('N2').Value:= 0;
            Parameters.ParamByName('N3').Value:= nGT1;     // ȸ���ð�
            Parameters.ParamByName('N4').Value:= 1;
            Parameters.ParamByName('N5').Value:= 9;
            Parameters.ParamByName('N6').Value:= nCurrUnitNo;
            Parameters.ParamByName('N7').Value:= nCurrMNo;
            Parameters.ParamByName('N8').Value:= '����ð�����';
            Open;

            if RecordCount > 0 then
              edtGT1Cnt.Text:= IntToStr(RecordCount)           // ��������Ǽ� ȭ�鿡 ǥ��
            else
              edtGT1Cnt.Text:= '0';
          end
          else
            edtGT1Cnt.Text:= '0';

          // �� ���ΰǼ� ��ȸ
          Close;
          SQL.Clear;
          SQL.Add('Select * from TKProc ');

          // ���ڸ���
          if nClosingType = 0 then
            SQL.Add('Where ProcDate = :N1 and ChkClosing = :N2 and TotDC > :N3 and ')
          // �ٹ��ڸ���
          else
            SQL.Add('Where ProcDate >= :N1 and ChkClosing = :N2 and TotDC > :N3 and ');

          SQL.Add('(TKType = :N4 or TKType = :N5) and UnitNo = :N6 and MNo = :N7 and Reserve2 <> :N8');
          Parameters.ParamByName('N1').Value:= sCDate;
          Parameters.ParamByName('N2').Value:= 0;
          Parameters.ParamByName('N3').Value:= 0; //����ó��.
          Parameters.ParamByName('N4').Value:= 1;
          Parameters.ParamByName('N5').Value:= 9;
          Parameters.ParamByName('N6').Value:= nCurrUnitNo;
          Parameters.ParamByName('N7').Value:= nCurrMNo;
          Parameters.ParamByName('N8').Value:= '����ð�����';
          Open;

          if RecordCount > 0 then
            edtDCCnt.Text:= IntToStr(RecordCount)                // �� ���ΰǼ� ȭ�鿡 ǥ��
          else
            edtDCCnt.Text:= '0';

          // ���� ��ư
          if nSelect = 2 then
          begin
            // ����ó������ ��� ó��
            Close;
            SQL.Clear;
            SQL.Add('Insert Into TKProcClosing ');
            SQL.Add('(ParkNo, UnitNo, CDate, ProcDate, ProcTime, ClosingSeq, ');
            SQL.Add('MNo, ProcCnt, ProcFee, ProcDC, ProcRealFee, LostCnt, ');
            SQL.Add('LostAmt, DamageCnt, DamageAmt, DCCnt, GT1Cnt, TotDCCnt, ');
            SQL.Add('UnpaidCnt, Unpaid) ');
            SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, ');
            SQL.Add(':N11, :N12, :N13, :N14, :N15, :N16, :N17, :N18, :N19, :N20) ');
            Parameters.ParamByName('N1') .Value:= nCurrParkNo;
            Parameters.ParamByName('N2') .Value:= nCurrUnitNo;
            Parameters.ParamByname('N3') .Value:= sCDate;
            Parameters.ParamByName('N4') .Value:= sPDate;
            Parameters.ParamByName('N5') .Value:= sPTime;
            Parameters.ParamByName('N6') .Value:= nCSeq;
            Parameters.ParamByName('N7') .Value:= nCurrMNo;

            // �� �����ݾ� �Ǽ�
            if edtCnt.Text <> '' then
              Parameters.ParamByName('N8') .Value:= StrToInt(MG_StrTrim(edtCnt.Text, ','))
            else
              Parameters.ParamByName('N8') .Value:= 0;

            // �� �����ݾ�
            if edtTot.Text <> '' then
              Parameters.ParamByName('N9') .Value:= StrToInt(MG_StrTrim(edtTot.Text, ','))
            else
              Parameters.ParamByName('N9') .Value:= 0;

            // �� ���αݾ�
            if edtDC.Text <> '' then
              Parameters.ParamByName('N10') .Value:= StrToInt(MG_StrTrim(edtDC.Text, ','))
            else
              Parameters.ParamByName('N10') .Value:= 0;

            // �� �����ݾ�
            if edtReal.Text <> '' then
              Parameters.ParamByName('N11').Value:= StrToInt(MG_StrTrim(edtReal.Text, ','))
            else
              Parameters.ParamByName('N11').Value:= 0;

            // �� �������� �Ǽ�
            if edtLostCnt.Text <> '' then
              Parameters.ParamByName('N12').Value:= strToInt(MG_StrTrim(edtLostCnt.Text, ','))
            else
              Parameters.ParamByName('N12').Value:= 0;

            // �� �������� �ݾ�
            if edtLostAmt.Text <> '' then
              Parameters.ParamByName('N13').Value:= strToInt(MG_StrTrim(edtLostAmt.Text, ','))
            else
              Parameters.ParamByName('N13').Value:= 0;

            Parameters.ParamByName('N14').Value:= 0;
            Parameters.ParamByName('N15').Value:= 0;

            // �� ���αݾ� �Ǽ�
            if edtDCCnt.Text <> '' then
              Parameters.ParamByName('N16').Value:= strToInt(MG_StrTrim(edtDCCnt.Text, ','))
            else
              Parameters.ParamByName('N16').Value:= 0;

            // ��������Ǽ�
            if edtGT1Cnt.Text <> '' then
              Parameters.ParamByName('N17').Value:= StrToInt(MG_StrTrim(edtGT1Cnt.Text, ','))
            else
              Parameters.ParamByName('N17').Value:= 0;

            // �� ���αݾ� �Ǽ�
            if edtTotDCCnt.Text <> '' then
              Parameters.ParamByName('N18').Value:= StrToInt(MG_StrTrim(edtTotDCCnt.Text, ','))
            else
              Parameters.ParamByName('N18').Value:= 0;

            Parameters.ParamByName('N19').Value:= 0;
            Parameters.ParamByName('N20').Value:= 0;
            ExecSQL;

            // ��������� ������
            for i := 0 to nFeeCnt do
            begin
              // ��������� ����ó������
              Close;
              SQL.Clear;
              SQL.Add('Insert Into FeeDetail ');
              SQL.Add('(ParkNo, UnitNo, CDate, ProcDate, ProcTime, FeeNo, FeeCnt, FeeAmt) ');
              SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8)');
              Parameters.ParamByName('N1').Value:= nCurrParkNo;
              Parameters.ParamByName('N2').Value:= nCurrUnitNo;
              Parameters.ParamByname('N3').Value:= sCDate;
              Parameters.ParamByName('N4').Value:= sPDate;
              Parameters.ParamByName('N5').Value:= sPTime;

              case i of
                0: begin          // �Ϲ� ���
                     Parameters.ParamByName('N6').Value:= 0;
                     Parameters.ParamByName('N7').Value:= StrToInt(sCnt0);
                     Parameters.ParamByName('N8').Value:= StrToInt(sAmt0);
                end;
                1: begin
                     Parameters.ParamByName('N6').Value:= nFeeNo1;
                     Parameters.ParamByName('N7').Value:= StrToInt(sCnt1);
                     Parameters.ParamByName('N8').Value:= StrToInt(sAmt1);
                end;
                2: begin
                     Parameters.ParamByName('N6').Value:= nFeeNo2;
                     Parameters.ParamByName('N7').Value:= StrToInt(sCnt2);
                     Parameters.ParamByName('N8').Value:= StrToInt(sAmt2);
                end;
                3: begin
                     Parameters.ParamByName('N6').Value:= nFeeNo3;
                     Parameters.ParamByName('N7').Value:= StrToInt(sCnt3);
                     Parameters.ParamByName('N8').Value:= StrToInt(sAmt3);
                end;
                4: begin
                     Parameters.ParamByName('N6').Value:= nFeeNo4;
                     Parameters.ParamByName('N7').Value:= StrToInt(sCnt4);
                     Parameters.ParamByName('N8').Value:= StrToInt(sAmt4);
                end;
                5: begin
                     Parameters.ParamByName('N6').Value:= nFeeNo5;
                     Parameters.ParamByName('N7').Value:= StrToInt(sCnt5);
                     Parameters.ParamByName('N8').Value:= StrToInt(sAmt5);
                end;
                6: begin
                     Parameters.ParamByName('N6').Value:= nFeeNo6;
                     Parameters.ParamByName('N7').Value:= StrToInt(sCnt6);
                     Parameters.ParamByName('N8').Value:= StrToInt(sAmt6);
                end;
                7: begin
                     Parameters.ParamByName('N6').Value:= nFeeNo7;
                     Parameters.ParamByName('N7').Value:= StrToInt(sCnt7);
                     Parameters.ParamByName('N8').Value:= StrToInt(sAmt7);
                end;
                8: begin
                     Parameters.ParamByName('N6').Value:= nFeeNo8;
                     Parameters.ParamByName('N7').Value:= StrToInt(sCnt8);
                     Parameters.ParamByName('N8').Value:= StrToInt(sAmt8);
                end;
                9: begin
                     Parameters.ParamByName('N6').Value:= nFeeNo9;
                     Parameters.ParamByName('N7').Value:= StrToInt(sCnt9);
                     Parameters.ParamByName('N8').Value:= StrToInt(sAmt9);
                end;
                10: begin
                     Parameters.ParamByName('N6').Value:= nFeeNo10;
                     Parameters.ParamByName('N7').Value:= StrToInt(sCnt10);
                     Parameters.ParamByName('N8').Value:= StrToInt(sAmt10);
                end;
                11: begin
                     Parameters.ParamByName('N6').Value:= nFeeNo11;
                     Parameters.ParamByName('N7').Value:= StrToInt(sCnt11);
                     Parameters.ParamByName('N8').Value:= StrToInt(sAmt11);
                end;
                12: begin
                     Parameters.ParamByName('N6').Value:= nFeeNo12;
                     Parameters.ParamByName('N7').Value:= StrToInt(sCnt12);
                     Parameters.ParamByName('N8').Value:= StrToInt(sAmt12);
                end;
                13: begin
                     Parameters.ParamByName('N6').Value:= nFeeNo13;
                     Parameters.ParamByName('N7').Value:= StrToInt(sCnt13);
                     Parameters.ParamByName('N8').Value:= StrToInt(sAmt13);
                end;
                14: begin
                     Parameters.ParamByName('N6').Value:= nFeeNo14;
                     Parameters.ParamByName('N7').Value:= StrToInt(sCnt14);
                     Parameters.ParamByName('N8').Value:= StrToInt(sAmt14);
                end;
                15: begin
                     Parameters.ParamByName('N6').Value:= nFeeNo15;
                     Parameters.ParamByName('N7').Value:= StrToInt(sCnt15);
                     Parameters.ParamByName('N8').Value:= StrToInt(sAmt15);
                end;
                16: begin
                     Parameters.ParamByName('N6').Value:= nFeeNo16;
                     Parameters.ParamByName('N7').Value:= StrToInt(sCnt16);
                     Parameters.ParamByName('N8').Value:= StrToInt(sAmt16);
                end;
                17: begin
                     Parameters.ParamByName('N6').Value:= nFeeNo17;
                     Parameters.ParamByName('N7').Value:= StrToInt(sCnt17);
                     Parameters.ParamByName('N8').Value:= StrToInt(sAmt17);
                end;
                18: begin
                     Parameters.ParamByName('N6').Value:= nFeeNo18;
                     Parameters.ParamByName('N7').Value:= StrToInt(sCnt18);
                     Parameters.ParamByName('N8').Value:= StrToInt(sAmt18);
                end;
                19: begin
                     Parameters.ParamByName('N6').Value:= nFeeNo19;
                     Parameters.ParamByName('N7').Value:= StrToInt(sCnt19);
                     Parameters.ParamByName('N8').Value:= StrToInt(sAmt19);
                end;
                20: begin
                     Parameters.ParamByName('N6').Value:= nFeeNo20;
                     Parameters.ParamByName('N7').Value:= StrToInt(sCnt20);
                     Parameters.ParamByName('N8').Value:= StrToInt(sAmt20);
                end;
              end;
              ExecSQL;
            end;
          end;
          SetProgress(3);  //2
        end;

        // Ƽ�Ϲ߱޳��� ��ȸ
        Close;
        SQL.Clear;
        SQL.Add('Select Count(*), Sum(IssueUnit), Sum(FValue) ');

        // ���ڸ���
        if nClosingType = 0 then
          SQL.Add('from IssueTK where IssueDate = :N1 and ChkClosing = :N2 and ')
        // �ٹ��ڸ���
        else
          SQL.Add('from IssueTK where IssueDate >= :N1 and ChkClosing = :N2 and ');

        SQL.Add('(TKType = :N3 or TKType = :N4) and UnitNo = :N5 and MNo = :N6');
        Parameters.ParamByName('N1').Value:= sCDate;
        Parameters.ParamByName('N2').Value:= 0;       // ��������: �̸���
        Parameters.ParamByName('N3').Value:= 2;       // �����
        Parameters.ParamByName('N4').Value:= 3;       // ���α�
        Parameters.ParamByName('N5').Value:= nCurrUnitNo;
        Parameters.ParamByName('N6').Value:= nCurrMNo;
        Open;
        SetProgress(3);  //3

        if RecordCount > 0 then
        begin
          edtICnt .Text:= FieldByName('COLUMN1').AsString;          // �߸ż��� ȭ�鿡 ǥ��
          edtIAmt .Text:= FieldByName('COLUMN2').AsString;          // �߸��Ѿ� ȭ�鿡 ǥ��
          edtIFAmt.Text:= FieldByName('COLUMN3').AsString;          // �׸�ݾ� ȭ�鿡 ǥ��
          nBalTot:= FieldbyName('COLUMN2').AsInteger;               // �߸��Ѿ�

          // ����
          if nSelect = 2 then
          begin
            // �������� �߱� ���� ��� ó��
            Close;
            SQL.Clear;
            SQL.Add('Insert Into IssueClosing ');
            SQL.Add('(ParkNo, UnitNo, CDate, ProcDate, ProcTime, ClosingSeq, MNo, IssueCnt, ');
            SQL.Add('IssueAmt, IssueFValue) ');
            SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10)');
            Parameters.ParamByName('N1').Value:= nCurrParkNo;
            Parameters.ParamByName('N2').Value:= nCurrUnitNo;
            Parameters.ParamByName('N3').Value:= sCDate;
            Parameters.ParamByname('N4').Value:= sPDate;
            Parameters.ParamByName('N5').Value:= sPTime;
            Parameters.ParamByName('N6').Value:= nCSeq;
            Parameters.ParamByName('N7').Value:= nCurrMNo;
            Parameters.ParamByName('N8').Value:= StrToInt(MG_StrTrim(edtICnt.Text, ','));
            Parameters.ParamByName('N9').Value:= StrToInt(MG_StrTrim(edtIAmt.Text, ','));
            Parameters.ParamByName('N10').Value:= StrToInt(MG_StrTrim(edtIFAmt.Text, ','));
            ExecSQL;
          end;
          SetProgress(3);  //4
        end;

        // ���ܱ� ���� ���� ��ȸ
        Close;
        SQL.Clear;
        SQL.Add('Select Sum(Up), Sum(Down), Sum(Lock), Sum(Unlock) from BarProc ');

        // ���ڸ���
        if nClosingType = 0 then
          SQL.Add('where ProcDate = :N1 and ChkClosing = :N2 and MNo = :N3')
        // �ٹ��ڸ���
        else
          SQL.Add('where ProcDate >= :N1 and ChkClosing = :N2 and MNo = :N3');

        Parameters.ParamByName('N1').Value:= sCDate;
        Parameters.ParamByName('N2').Value:= 0;
        Parameters.ParamByName('N3').Value:= nCurrMNo;
        Open;
        SetProgress(3);  //5

        if RecordCount > 0 then
        begin
          edtUp    .Text:= FieldByName('COLUMN1').AsString;                 // ����     ȭ�鿡 ǥ��
          edtDown  .Text:= FieldByName('COLUMN2').AsString;                 // ����         "
          edtLock  .Text:= FieldByName('COLUMN3').AsString;                 // ��������     "
          edtUnlock.Text:= FieldByName('COLUMN4').AsString;                 // ��������     "

          // ����
          if nSelect = 2 then
          begin
            // ���ܱ� ó�� ���� ��� ó��
            Close;
            SQL.Clear;
            SQL.Add('Insert Into BarClosing ');
            SQL.Add('(ParkNo, UnitNo, CDate, ProcDate, ProcTime, ClosingSeq, MNo, UpCnt, ');
            SQL.Add('DownCnt, LockCnt, UnLockCnt) ');
            SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11)');
            Parameters.ParamByName('N1' ).Value:= nCurrParkNo;
            Parameters.ParamByName('N2' ).Value:= nCurrUnitNo;
            Parameters.ParamByName('N3' ).Value:= sCDate;
            Parameters.ParamByname('N4' ).Value:= sPDate;
            Parameters.ParamByName('N5' ).Value:= sPTime;
            Parameters.ParamByName('N6' ).Value:= nCSeq;
            Parameters.ParamByName('N7' ).Value:= nCurrMNo;
            Parameters.ParamByName('N8' ).Value:= StrToInt(MG_StrTrim(edtUP.Text, ','));
            Parameters.ParamByName('N9' ).Value:= StrToInt(MG_StrTrim(edtDown.Text, ','));
            Parameters.ParamByName('N10').Value:= StrToInt(MG_StrTrim(edtLock.Text, ','));
            Parameters.ParamByName('N11').Value:= StrToInt(MG_StrTrim(edtUnLock.Text, ','));
            ExecSQL;
          end;
          SetProgress(3);  //6
        end;
      end;

      with qryCTKProc do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select ParkNo, UnitNo, MNo, TKType, Count(*), Sum(TotFee), Sum(TotDC), Sum(RealFee) ');
        SQL.Add('from TKProc ');

        // ���ڸ���
        if nClosingType = 0 then
          SQL.Add('where ProcDate = :N1 and ChkClosing = :N2 and  ')
        // �ٹ��ڸ���
        else
          SQL.Add('where ProcDate >= :N1 and ChkClosing = :N2 and  ');

        SQL.Add('((TKType = :N3) or (TKType = :N4)) and UnitNo = :N5 and MNo = :N6 and Reserve2 <> :N7' );
        SQL.Add('Group By ParkNo, UnitNo, MNo, TKType');

        {
        Close;
        SQL.Clear;
        SQL.Add('Select ParkNo, UnitNo, MNo, TKType, Count(*), Sum(TotFee), Sum(TotDC), Sum(RealFee) ');

        if nClosingType = 0 then
        begin
          SQL.Add('from TKProc Group By ParkNo, UnitNo, ProcDate, MNo, ChkClosing, TKType ');
          SQL.Add('Having ProcDate = :N1 and ChkClosing = :N2 and  ');
        end
        else
        begin
          SQL.Add('from TKProc Group By ParkNo, UnitNo, MNo, ChkClosing, TKType ');
          SQL.Add('Having ProcDate >= :N1 and ChkClosing = :N2 and  ');
        end;
        SQL.Add('((TKType = :N3) or (TKType = :N4)) and UnitNo = :N5 and MNo = :N6' );
        }

        Parameters.ParamByName('N1').Value:= sCDate;
        Parameters.ParamByName('N2').Value:= 0;
        Parameters.ParamByName('N3').Value:= 1;
        Parameters.ParamByName('N4').Value:= 9;
        Parameters.ParamByName('N5').Value:= nCurrUnitNo;
        Parameters.ParamByName('N6').Value:= nCurrMNo;
        Parameters.ParamByName('N7').Value:= '����ð�����';
        Open;

        if RecordCount > 0 then
        begin
          while not Eof do
          begin
            //sRPrt:= sRPrt + 'NO  �Ǽ�   �����ݾ�  ���αݾ�   �����ݾ�' + LF + CR;
            sRPrt:= sRPrt + MG_Right(IntToStr(FieldByName('MNo').AsInteger), 2) +
                            MG_Right(FormatFloat('#,##0', StrToIntDef(IntToStr(FieldByName('COLUMN1').AsInteger), 0)), 6) +
                            MG_Right(FormatFloat('#,##0', StrToIntDef(IntToStr(FieldbyName('COLUMN2').AsInteger), 0)), 11) +
                            MG_Right(FormatFloat('#,##0', StrToIntDef(IntToStr(FieldByName('COLUMN3').AsInteger), 0)), 10) +
                            MG_Right(FormatFloat('#,##0', StrToIntDef(IntToStr(FieldByName('COLUMN4').AsInteger), 0)), 11) + LF + CR;
            Next;
          end;

          sRPrt:= sRPrt + '----------------------------------------' + LF + CR;
          sRPrt:= sRPrt + 'ó���Ǽ�: ' + edtCnt.Text + '��' + LF + CR;

          sRPrt:= sRPrt + '��������: ' + MG_Right(FormatFloat('#,##0', StrToIntDef(edtLostCnt.Text, 0)), 10) + '��  ' +
                                         MG_Right(FormatFloat('#,##0', StrToIntDef(edtLostAmt.Text, 0)), 10) + '��' + LF + CR;
          sRPrt:= sRPrt + '�����ݾ�: ' + FormatFloat('#,##0', StrToIntDef(edtTot.Text, 0)) + '��' + LF + CR;
          sRPrt:= sRPrt + '����ó��: ' + MG_Right(FormatFloat('#,##0', StrToIntDef(edtDCCnt.Text, 0)), 10) + '��  ' +
                                         MG_Right(FormatFloat('#,##0', StrToIntDef(edtDC.Text, 0)), 10) + '��' + LF + CR;
          sRPrt:= sRPrt + '�����ΰ�: ' + MG_Right(FormatFloat('#,##0', StrToIntDef(edtTotDCCnt.Text, 0)), 10) + '��' + LF + CR;
          sRPrt:= sRPrt + '����Ǽ�: ' + MG_Right(FormatFloat('#,##0', StrToIntDef(edtRealCnt.Text, 0)), 10) + '��' + LF + CR;
          sRPrt:= sRPrt + '���Աݾ�: ' + MG_Right(FormatFloat('#,##0', StrToIntDef(edtReal.Text, 0)), 10) + '��' + LF + CR;
          sRPrt:= sRPrt + '----------------------------------------' + LF + CR;

          // ��������� ������
          if nFeeCnt > 0 then
          begin
            for i:= 0 to nFeeCnt do
            begin
              Case i of
                0: sRPrt:= sRPrt + '�Ϲݿ��: ' + MG_Right(FormatFloat('#,##0', StrToIntDef(sCnt0, 0)), 10) + '�� ' +
                                                  MG_Right(FormatFloat('#,##0', StrToIntDef(sAmt0, 0)), 10) + '��' + LF + CR;
                1: sRPrt:= sRPrt + MG_Right(Copy(sFeeName1, 1, 8), 8) + ': ' + MG_Right(FormatFloat('#,##0', StrToIntDef(sCnt1, 0)), 10) + '�� ' +
                                                                               MG_Right(FormatFloat('#,##0', StrToIntDef(sAmt1, 0)), 10) + '��' + LF + CR;
                2: sRPrt:= sRPrt + MG_Right(Copy(sFeeName2, 1, 8), 8) + ': ' + MG_Right(FormatFloat('#,##0', StrToIntDef(sCnt2, 0)), 10) + '�� ' +
                                                                               MG_Right(FormatFloat('#,##0', StrToIntDef(sAmt2, 0)), 10) + '��' + LF + CR;
                3: sRPrt:= sRPrt + MG_Right(Copy(sFeeName3, 1, 8), 8) + ': ' + MG_Right(FormatFloat('#,##0', StrToIntDef(sCnt3, 0)), 10) + '�� ' +
                                                                               MG_Right(FormatFloat('#,##0', StrToIntDef(sAmt3, 0)), 10) + '��' + LF + CR;
                4: sRPrt:= sRPrt + MG_Right(Copy(sFeeName4, 1, 8), 8) + ': ' + MG_Right(FormatFloat('#,##0', StrToIntDef(sCnt4, 0)), 10) + '�� ' +
                                                                               MG_Right(FormatFloat('#,##0', StrToIntDef(sAmt4, 0)), 10) + '��' + LF + CR;
                5: sRPrt:= sRPrt + MG_Right(Copy(sFeeName5, 1, 8), 8) + ': ' + MG_Right(FormatFloat('#,##0', StrToIntDef(sCnt5, 0)), 10) + '�� ' +
                                                                               MG_Right(FormatFloat('#,##0', StrToIntDef(sAmt5, 0)), 10) + '��' + LF + CR;
                6: sRPrt:= sRPrt + MG_Right(Copy(sFeeName6, 1, 8), 8) + ': ' + MG_Right(FormatFloat('#,##0', StrToIntDef(sCnt6, 0)), 10) + '�� ' +
                                                                               MG_Right(FormatFloat('#,##0', StrToIntDef(sAmt6, 0)), 10) + '��' + LF + CR;
                7: sRPrt:= sRPrt + MG_Right(Copy(sFeeName7, 1, 8), 8) + ': ' + MG_Right(FormatFloat('#,##0', StrToIntDef(sCnt7, 0)), 10) + '�� ' +
                                                                               MG_Right(FormatFloat('#,##0', StrToIntDef(sAmt7, 0)), 10) + '��' + LF + CR;
                8: sRPrt:= sRPrt + MG_Right(Copy(sFeeName8, 1, 8), 8) + ': ' + MG_Right(FormatFloat('#,##0', StrToIntDef(sCnt8, 0)), 10) + '�� ' +
                                                                               MG_Right(FormatFloat('#,##0', StrToIntDef(sAmt8, 0)), 10) + '��' + LF + CR;
                9: sRPrt:= sRPrt + MG_Right(Copy(sFeeName9, 1, 8), 8) + ': ' + MG_Right(FormatFloat('#,##0', StrToIntDef(sCnt9, 0)), 10) + '�� ' +
                                                                               MG_Right(FormatFloat('#,##0', StrToIntDef(sAmt9, 0)), 10) + '��' + LF + CR;
               10: sRPrt:= sRPrt + MG_Right(Copy(sFeeName10, 1, 8), 8) + ': ' + MG_Right(FormatFloat('#,##0', StrToIntDef(sCnt10, 0)), 10) + '�� ' +
                                                                                MG_Right(FormatFloat('#,##0', StrToIntDef(sAmt10, 0)), 10) + '��' + LF + CR;
               11: sRPrt:= sRPrt + MG_Right(Copy(sFeeName11, 1, 8), 8) + ': ' + MG_Right(FormatFloat('#,##0', StrToIntDef(sCnt11, 0)), 10) + '�� ' +
                                                                                MG_Right(FormatFloat('#,##0', StrToIntDef(sAmt11, 0)), 10) + '��' + LF + CR;
               12: sRPrt:= sRPrt + MG_Right(Copy(sFeeName12, 1, 8), 8) + ': ' + MG_Right(FormatFloat('#,##0', StrToIntDef(sCnt12, 0)), 10) + '�� ' +
                                                                                MG_Right(FormatFloat('#,##0', StrToIntDef(sAmt12, 0)), 10) + '��' + LF + CR;
               13: sRPrt:= sRPrt + MG_Right(Copy(sFeeName13, 1, 8), 8) + ': ' + MG_Right(FormatFloat('#,##0', StrToIntDef(sCnt13, 0)), 10) + '�� ' +
                                                                                MG_Right(FormatFloat('#,##0', StrToIntDef(sAmt13, 0)), 10) + '��' + LF + CR;
               14: sRPrt:= sRPrt + MG_Right(Copy(sFeeName14, 1, 8), 8) + ': ' + MG_Right(FormatFloat('#,##0', StrToIntDef(sCnt14, 0)), 10) + '�� ' +
                                                                                MG_Right(FormatFloat('#,##0', StrToIntDef(sAmt14, 0)), 10) + '��' + LF + CR;
               15: sRPrt:= sRPrt + MG_Right(Copy(sFeeName15, 1, 8), 8) + ': ' + MG_Right(FormatFloat('#,##0', StrToIntDef(sCnt15, 0)), 10) + '�� ' +
                                                                                MG_Right(FormatFloat('#,##0', StrToIntDef(sAmt15, 0)), 10) + '��' + LF + CR;
               16: sRPrt:= sRPrt + MG_Right(Copy(sFeeName16, 1, 8), 8) + ': ' + MG_Right(FormatFloat('#,##0', StrToIntDef(sCnt16, 0)), 10) + '�� ' +
                                                                                MG_Right(FormatFloat('#,##0', StrToIntDef(sAmt16, 0)), 10) + '��' + LF + CR;
               17: sRPrt:= sRPrt + MG_Right(Copy(sFeeName17, 1, 8), 8) + ': ' + MG_Right(FormatFloat('#,##0', StrToIntDef(sCnt17, 0)), 10) + '�� ' +
                                                                                MG_Right(FormatFloat('#,##0', StrToIntDef(sAmt17, 0)), 10) + '��' + LF + CR;
               18: sRPrt:= sRPrt + MG_Right(Copy(sFeeName18, 1, 8), 8) + ': ' + MG_Right(FormatFloat('#,##0', StrToIntDef(sCnt18, 0)), 10) + '�� ' +
                                                                                MG_Right(FormatFloat('#,##0', StrToIntDef(sAmt18, 0)), 10) + '��' + LF + CR;
               19: sRPrt:= sRPrt + MG_Right(Copy(sFeeName19, 1, 8), 8) + ': ' + MG_Right(FormatFloat('#,##0', StrToIntDef(sCnt19, 0)), 10) + '�� ' +
                                                                                MG_Right(FormatFloat('#,##0', StrToIntDef(sAmt19, 0)), 10) + '��' + LF + CR;
               20: sRPrt:= sRPrt + MG_Right(Copy(sFeeName20, 1, 8), 8) + ': ' + MG_Right(FormatFloat('#,##0', StrToIntDef(sCnt20, 0)), 10) + '�� ' +
                                                                                MG_Right(FormatFloat('#,##0', StrToIntDef(sAmt20, 0)), 10) + '��' + LF + CR;
              end;
            end;
          end;

          // �ο�ó�� �Ǽ�, �ݾ� ��ȸ
          with qryTemp do
          begin
            Close;
            SQL.Clear;
            SQL.Add('Select Count(*) as MinwonCnt, Sum(TotFee) MinwonAmt from TKProc ');

            // ���ڸ���
            if nClosingType = 0 then
              SQL.Add('where ProcDate = :N1 and ChkClosing = :N2 and MNo = :N3 and UnitNo = :N4 and Reserve1 = :N5')
            // �ٹ��ڸ���
            else
              SQL.Add('where ProcDate >= :N1 and ChkClosing = :N2 and MNo = :N3 and UnitNo = :N4 and Reserve1 = :N5');

            Parameters.ParamByName('N1').Value:= sCDate;
            Parameters.ParamByName('N2').Value:= 0;
            Parameters.ParamByName('N3').Value:= nCurrMNo;
            Parameters.ParamByName('N4').Value:= nCurrUnitNo;
            Parameters.ParamByName('N5').Value:= '�ο�ó��';
            Open;

            if RecordCount > 0 then
            begin
              sRPrt:= sRPrt + '�ο�ó��: ' +
                      MG_Right(FormatFloat('#,##0', FieldByName('MinwonCnt').AsInteger), 10) + '�� ' +
                      MG_Right(FormatFloat('#,##0', FieldByName('MinwonAmt').AsInteger), 10) + '�� ' +LF + CR;
            end
            else
            begin
              sRPrt:= sRPrt + '�ο�ó��:          0��' + LF + CR;
            end;
          end;
          sRPrt:= sRPrt + '----------------------------------------' + LF + CR;
          sRPrt:= sRPrt + '[���γ���]' + LF + CR;
          sRPrt:= sRPrt + '[��������]' + LF + CR;
          sRPrt:= sRPrt + '----------------------------------------' + LF + CR;
          sRPrt:= sRPrt + '��������                ��      ���αݾ�' + LF + CR;


          // �������� , ���ΰǼ�, ���αݾ� ��ȸ�ؼ� ��ȸ�� �Ǽ���ŭ �ݺ��Ͽ� ���
          with qryTemp do
          begin
            Close;
            SQL.Clear;
            SQL.Add('Select Count(*) as DCCnt, d.DCNo, Sum(d.RealDCAmt) as DCTot, i.DCName ');
            SQL.Add('from DCDetail d, DCInfo i ');

            // ���ڸ���
            if nClosingType = 0 then
              SQL.Add('where d.ProcDate = :N1 and d.ChkClosing = :N2 and d.MNo = :N3 and d.UnitNo = :N4 and ')
            // �ٹ��ڸ���
            else
              SQL.Add('where d.ProcDate >= :N1 and d.ChkClosing = :N2 and d.MNo = :N3 and d.UnitNo = :N4 and ');

            SQL.Add('d.dcno > 0 and d.DCNo = i.DCNo ');
            SQL.Add('Group By d.DCNo, i.DCName ');
            Parameters.ParamByName('N1').Value:= sCDate;
            Parameters.ParamByName('N2').Value:= 0;
            Parameters.ParamByName('N3').Value:= nCurrMNo;
            Parameters.ParamByName('N4').Value:= nCurrUnitNo;
            Open;

            if RecordCount > 0 then
            begin
              while not Eof do
              begin
                sRPrt:= sRPrt + MG_Left(FieldByName('DCName').AsString, 20) +
                        MG_Right(FormatFloat('#,##0', FieldByName('DCCnt').AsInteger), 5) + '�� ' +
                        MG_Right(FormatFloat('#,##0', FieldByName('DCTot').AsInteger), 10) + '��' + LF + CR;
                Next;
              end;
            end;
            sRPrt:= sRPrt + '----------------------------------------' + LF + CR;

            // ���ڵ����α� ����Ҷ�
            if bBarcodeDC then
            begin
              sRPrt:= sRPrt + '[���α�����]' + LF + CR;
              sRPrt:= sRPrt + '----------------------------------------' + LF + CR;
              sRPrt:= sRPrt + '��������                ��      ���αݾ�' + LF + CR;

              Close;
              SQL.Clear;
              SQL.Add('Select Count(*) as DCCnt, Sum(RealDCAmt) as DCTot, DCType, DCAmt ');
              SQL.Add('from DCDetail ');

              if nClosingType = 0 then
                SQL.Add('where ProcDate = :N1 and ChkClosing = :N2 and MNo = :N3 and UnitNo = :N4 and ')
              else
                SQL.Add('where ProcDate >= :N1 and ChkClosing = :N2 and MNo = :N3 and UnitNo = :N4 and ');

              SQL.Add('DCType = 0 and DCNo = 0 ');
              SQL.Add('Group By DCNo, DCType, DCAmt Order By DCType ');
              Parameters.ParamByName('N1').Value:= sCDate;
              Parameters.ParamByName('N2').Value:= 0;
              Parameters.ParamByName('N3').Value:= nCurrMNo;
              Parameters.ParamByName('N4').Value:= nCurrUnitNo;
              Open;

              if RecordCount > 0 then
              begin
                while not Eof do
                begin
                  sRPrt:= sRPrt + MG_Left(IntToStr(FieldByName('DCAmt').AsInteger)+'������', 20) +
                          MG_Right(FormatFloat('#,##0', FieldByName('DCCnt').AsInteger), 5) + '�� ' +
                          MG_Right(FormatFloat('#,##0', FieldByName('DCTot').AsInteger), 10) + '��' + LF + CR;
                  Next;
                end;
              end;

              //%���α�...
              Close;
              SQL.Clear;
              SQL.Add('Select Count(*) as DCCnt, Sum(RealDCAmt) as DCTot, DCType, Reserve5 ');
              SQL.Add('from DCDetail ');

              if nClosingType = 0 then
                SQL.Add('where ProcDate = :N1 and ChkClosing = :N2 and MNo = :N3 and UnitNo = :N4 and ')
              else
                SQL.Add('where ProcDate >= :N1 and ChkClosing = :N2 and MNo = :N3 and UnitNo = :N4 and ');

              SQL.Add('DCType = 2 and DCNo = 0 ');
              SQL.Add('Group By DCNo, DCType, Reserve5 Order By DCType ');
              Parameters.ParamByName('N1').Value:= sCDate;
              Parameters.ParamByName('N2').Value:= 0;
              Parameters.ParamByName('N3').Value:= nCurrMNo;
              Parameters.ParamByName('N4').Value:= nCurrUnitNo;
              Open;

              if RecordCount > 0 then
              begin
                while not Eof do
                begin
                  sRPrt:= sRPrt + MG_Left(FieldByName('Reserve5').AsString, 20) +
                          MG_Right(FormatFloat('#,##0', FieldByName('DCCnt').AsInteger), 5) + '�� ' +
                          MG_Right(FormatFloat('#,##0', FieldByName('DCTot').AsInteger), 10) + '��' + LF + CR;
                  Next;
                end;
              end;

              //�ð����α�...
              Close;
              SQL.Clear;
              SQL.Add('Select Count(*) as DCCnt, Sum(RealDCAmt) as DCTot, DCType, Reserve5 ');
              SQL.Add('from DCDetail ');

              if nClosingType = 0 then
                SQL.Add('where ProcDate = :N1 and ChkClosing = :N2 and MNo = :N3 and UnitNo = :N4 and ')
              else
                SQL.Add('where ProcDate >= :N1 and ChkClosing = :N2 and MNo = :N3 and UnitNo = :N4 and ');

              SQL.Add('DCType = 1 and DCNo = 0 ');
              SQL.Add('Group By DCNo, DCType, Reserve5 Order By DCType ');
              Parameters.ParamByName('N1').Value:= sCDate;
              Parameters.ParamByName('N2').Value:= 0;
              Parameters.ParamByName('N3').Value:= nCurrMNo;
              Parameters.ParamByName('N4').Value:= nCurrUnitNo;
              Open;

              if RecordCount > 0 then
              begin
                while not Eof do
                begin
                  sRPrt:= sRPrt + MG_Left(FieldByName('Reserve5').AsString, 20) +
                          MG_Right(FormatFloat('#,##0', FieldByName('DCCnt').AsInteger), 5) + '�� ' +
                          MG_Right(FormatFloat('#,##0', FieldByName('DCTot').AsInteger), 10) + '��' + LF + CR;
                  Next;
                end;
              end;
              sRPrt:= sRPrt + '----------------------------------------' + LF + CR;
            end;

            // �ſ�ī�� ����
            if bCredit then
            begin
              Close;
              SQL.Clear;
              SQL.Add('Select UnitNo, Count(*), Sum(RealFee) ');

              if nClosingType = 0 then
                SQL.Add('from TKProc where ProcDate = :N1 and ChkClosing = :N2 and   ')
              else
                SQL.Add('from TKProc where ProcDate >= :N1 and ChkClosing = :N2 and   ');

              SQL.Add('UnitNo = :N3 and PayType = :N4 and MNo = :N5' );
              SQL.Add('Group By UnitNo, PayType, MNo ');
              {
              Close;
              SQL.Clear;
              SQL.Add('Select ParkNo, UnitNo, Count(*), Sum(RealFee) ');
              SQL.Add('from TKProc Group By ParkNo, UnitNo, ProcDate, ChkClosing, PayType, MNo ');
              SQL.Add('Having ProcDate = :N1 and ChkClosing = :N2 and   ');
              SQL.Add('UnitNo = :N3 and PayType = :N4 and MNo = :N5' );
              }
              Parameters.ParamByName('N1').Value:= sCDate;
              Parameters.ParamByName('N2').Value:= 0;
              Parameters.ParamByName('N3').Value:= nCurrUnitNo;
              Parameters.ParamByName('N4').Value:= 2;
              Parameters.ParamByName('N5').Value:= nCurrMNo;
              Open;

              if RecordCount > 0 then
              begin
                sRPrt:= sRPrt + '�ſ�ī��: ' +
                        MG_Right(FormatFloat('#,##0', StrToIntDef(IntToStr(FieldByName('COLUMN1').AsInteger), 0)), 10) + '�� ' +
                        MG_Right(FormatFloat('#,##0', StrToIntDef(IntToStr(FieldbyName('COLUMN2').AsInteger), 0)), 10) + '��' + LF + CR;
                nCreditTot:= FieldbyName('COLUMN2').AsInteger;;
              end;
            end;

            // �����հ�, �� ���ݾ� ��ȸ
            Close;
            SQL.Clear;
            SQL.Add('Select UnitNo, Count(*), Sum(RealFee) ');

            // ���ڸ���
            if nClosingType = 0 then
              SQL.Add('from TKProc where ProcDate = :N1 and ChkClosing = :N2 and   ')
            // �ٹ��ڸ���
            else
              SQL.Add('from TKProc where ProcDate >= :N1 and ChkClosing = :N2 and   ');

            SQL.Add('UnitNo = :N3 and PayType = :N4 and MNo = :N5' );
            SQL.Add('Group By UnitNo, PayType, MNo ');
            {
            Close;
            SQL.Clear;
            SQL.Add('Select ParkNo, UnitNo, Count(*), Sum(RealFee) ');
            SQL.Add('from TKProc Group By ParkNo, UnitNo, ProcDate, ChkClosing, PayType, MNo ');
            SQL.Add('Having ProcDate = :N1 and ChkClosing = :N2 and   ');
            SQL.Add('UnitNo = :N3 and PayType <> :N4 and MNo = :N5' );
            }
            Parameters.ParamByName('N1').Value:= sCDate;
            Parameters.ParamByName('N2').Value:= 0;
            Parameters.ParamByName('N3').Value:= nCurrUnitNo;
            Parameters.ParamByName('N4').Value:= 1;
            Parameters.ParamByName('N5').Value:= nCurrMNo;
            Open;

            if RecordCount > 0 then
            begin
              sRPrt:= sRPrt + '�����հ�: ' +
                      MG_Right(FormatFloat('#,##0', StrToIntDef(IntToStr(FieldByName('COLUMN1').AsInteger), 0)), 10) + '�� ' +
                      MG_Right(FormatFloat('#,##0', StrToIntDef(IntToStr(FieldbyName('COLUMN2').AsInteger), 0)), 10) + '��' + LF + CR;

              nHyunTot:= FieldbyName('COLUMN2').AsInteger;
            end;
          end;
          sRPrt:= sRPrt + '----------------------------------------' + LF + CR;
        end
        else
        begin
          sRPrt:= sRPrt + '       0          0         0          0' + LF + CR;
          sRPrt:= sRPrt + '----------------------------------------' + LF + CR;
          sRPrt:= sRPrt + 'ó���Ǽ�: 0' + LF + CR;
          sRPrt:= sRPrt + '�����ݾ�: 0   ���αݾ�: 0   �����ݾ�: 0' + LF + CR;
          sRPrt:= sRPrt + '----------------------------------------' + LF + LF + CR;
        end;
      end;
      SetProgress(3);  //20

      // ����
      if nSelect = 2 then
      begin
        with qryTemp do
        begin
          Close;  //ó���� Ƽ��ó���ڷ� üũ
          SQL.Clear;
          SQL.Add('Update TKProc Set ChkClosing = :N1 ');

          if nClosingType = 0 then
            SQL.Add('where ProcDate = :N2 and ChkClosing = :N3 and  ')
          else
            SQL.Add('where ProcDate >= :N2 and ChkClosing = :N3 and  ');

          SQL.Add('((TKType = :N4) or (TKType = :N5)) and UnitNo = :N6 and MNo = :N7' );
          Parameters.ParamByName('N1').Value:= 1;         // ����
          Parameters.ParamByName('N2').Value:= sCDate;
          Parameters.ParamByName('N3').Value:= 0;         // �̸���
          Parameters.ParamByName('N4').Value:= 1;         //�Ϲݱ�
          Parameters.ParamByName('N5').Value:= 9;         //��������
          Parameters.ParamByName('N6').Value:= nCurrUnitNo;
          Parameters.ParamByName('N7').Value:= nCurrMNo;
          ExecSQL;

          Close;  //ó���� �����ڷ� üũ
          SQL.Clear;
          SQL.Add('UpDate DCDetail Set ChkClosing = :N1 ');

          if nClosingType = 0 then
            SQL.Add('where ProcDate = :N2 and ChkClosing = :N3 and UnitNo = :N4 and MNo = :N5')
          else
            SQL.Add('where ProcDate >= :N2 and ChkClosing = :N3 and UnitNo = :N4 and MNo = :N5');

          Parameters.ParamByName('N1').Value:= 1;
          Parameters.ParamByName('N2').Value:= sCDate;
          Parameters.ParamByName('N3').Value:= 0;
          Parameters.ParamByName('N4').Value:= nCurrUnitNo;
          Parameters.ParamByName('N5').Value:= nCurrMNo;
          ExecSQL;
        end;
        SetProgress(3);  //21

        {
        sRPrt:= sRPrt + '[Ƽ�Ϲ߸�]' + LF + CR;
        sRPrt:= sRPrt + '----------------------------------------' + LF + CR;
        sRPrt:= sRPrt + 'No    �߸ż���     �߸��Ѿ�     �׸�ݾ�' + LF + CR;
        }
      end;

      {
      with qryCIssueTk do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select UnitNo, MNo, TKType, IssueType, Count(*), Sum(IssueUnit), Sum(FValue) from IssueTK ');
        SQL.Add('Group By UnitNo, MNo, TKType, IssueType, IssueDate, ChkClosing ');
        SQL.Add('Having IssueDate = :N1 and ChkClosing = :N2 and UnitNo = :N3 and MNo = :N4');
        Parameters.ParamByName('N1').Value:= sCDate;
        Parameters.ParamByName('N2').Value:= 0;
        Parameters.ParamByName('N3').Value:= nCurrUnitNo;
        Parameters.ParamByName('N4').Value:= nCurrMNo;
        Open;

        if RecordCount > 0 then
        begin
          while not Eof do
          begin
            sRPrt:= sRPrt + MG_Right(IntToStr(FieldByName('MNo').AsInteger), 2) +
                            MG_Right(IntToStr(FieldByName('COLUMN1').AsInteger), 12) +
                            MG_Right(IntToStr(FieldByName('COLUMN2').AsInteger), 13) +
                            MG_Right(IntToStr(FieldByName('COLUMN3').AsInteger), 13) + LF + CR;
            Next;
          end;
          sRPrt:= sRPrt + '----------------------------------------' + LF + CR;
          sRPrt:= sRPrt + '�߸ż���: ' + FormatFloat('#,##0', StrToIntDef(edtICnt.Text, 0)) + LF + CR;
          sRPrt:= sRPrt + '�߸��Ѿ�: ' + MG_Right(FormatFloat('#,##0', StrToIntDef(edtIAmt.Text, 0)), 10) +
                          '�׸�ݾ�: ' + MG_Right(FormatFloat('#,##0', StrToIntDef(edtIFAmt.Text, 0)), 10) + LF + CR;
          sRPrt:= sRPrt + '----------------------------------------' + LF + LF + CR;
        end
        else
        begin
          sRPrt:= sRPrt + MG_Right('0', 14) + MG_Right('0', 13) + MG_Right('0', 13) + LF + CR;
          sRPrt:= sRPrt + '----------------------------------------' + LF + CR;
          sRPrt:= sRPrt + '�߸ż���: 0   �߸��Ѿ�: 0   �׸�ݾ�: 0' + LF + CR;
          sRPrt:= sRPrt + '----------------------------------------' + LF + LF + CR;
        end;
      end;
      }
      SetProgress(3);  //22

      // ����
      if nSelect = 2 then
      begin
        {
        with qryTemp do
        begin
          Close;  //ó���� Ƽ�Ϲ߸��ڷ� üũ
          SQL.Clear;
          SQL.Add('Update IssueTK Set ChkClosing = :N1 ');
          sQL.Add('where IssueDate = :N2 and ChkClosing = :N3 and UnitNo = :N4 and MNo = :N5');
          Parameters.ParamByName('N1').Value:= 1;
          Parameters.ParamByName('N2').Value:= sCDate;
          Parameters.ParamByName('N3').Value:= 0;
          Parameters.ParamByName('N4').Value:= nCurrUnitNo;
          Parameters.ParamByName('N5').Value:= nCurrMNo;
          ExecSQL;
        end;
        }

        SetProgress(3);  //23
      end;

      // ���ܱ����� ���� ��ȸ
      with qryCBarProc do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select ParkNo, UnitNo, MNo, Sum(Up), Sum(Down), Sum(Lock), Sum(UnLock) from BarProc ');

        // ���ڸ���
        if nClosingType = 0 then
          SQL.Add('where ProcDate = :N1 and ChkClosing = :N2 and MNo = :N3 ')
        // �ٹ��ڸ���
        else
          SQL.Add('where ProcDate >= :N1 and ChkClosing = :N2 and MNo = :N3 ');

        SQL.Add('Group By ParkNo, UnitNo, MNo Order By UnitNo');

        Parameters.ParamByName('N1').Value:= sCDate;
        Parameters.ParamByName('N2').Value:= 0;
        Parameters.ParamByName('N3').Value:= nCurrMNo;
        Open;

        if RecordCount > 0 then
        begin
          sRPrt:= sRPrt + '[���ܱ�����]' + LF + CR;
          sRPrt:= sRPrt + '----------------------------------------' + LF + CR;
          sRPrt:= sRPrt + '���  �ٹ���  ����  ����  ���  �������' + LF + CR;

          while not Eof do
          begin
            sRPrt:= sRPrt + MG_Right(IntToStr(FieldByName('UnitNo').AsInteger), 4) +                    // ����ȣ
                            MG_Right(IntToStr(FieldByName('MNo').AsInteger), 8) +                       // �ٹ��ڹ�ȣ
                            MG_Right(IntToStr(FieldByname('COLUMN1').AsInteger), 6) +                   // ����
                            MG_Right(IntToStr(FieldByName('COLUMN2').AsInteger), 6) +                   // ����
                            MG_Right(IntToStr(FieldByName('COLUMN3').AsInteger), 6) +                   // ���
                            MG_Right(IntToStr(FieldByName('COLUMN4').AsInteger), 10) + LF + CR;         // �������
            Next;
          end;
          sRPrt:= sRPrt + '----------------------------------------' + LF + CR;
          sRPrt:= sRPrt + '��    ��: ' + MG_Left(edtUp.Text, 10) +
                          '��    ��: ' + MG_Left(edtDown.Text, 10) + LF + CR;
          sRPrt:= sRPrt + '��    ��: ' + MG_Left(edtLock.Text, 10) +
                          '�������: ' + MG_Left(edtUnLock.Text, 10) + LF + CR;
          sRPrt:= sRPrt + '=======================================' + LF + CR;
        end
        else
        begin
          //���ܱ� �������� ������ ������ �μ����� �ʴ´�...
          {
          sRPrt:= sRPrt + MG_Right('0', 28) + MG_Right('0', 12) + LF + CR;
          sRPrt:= sRPrt + '----------------------------------------' + LF + CR;
          sRPrt:= sRPrt + '��    ��: ' + MG_Left('0', 10) +
                          '��    ��: ' + MG_Left('0', 10) + LF + CR;
          sRPrt:= sRPrt + '��    ��: ' + MG_Left('0', 10) +
                          '�������: ' + MG_Left('0', 10) + LF + CR;
          sRPrt:= sRPrt + '=======================================' + LF + CR;
          }
        end;
      end;
      // �� �����հ� : �����հ� + �ſ�ī���հ� + �߸��Ѿ��հ�
      sRPrt:= sRPrt + '�� �����հ�: ' + MG_Right(FormatFloat('#,##0', nHyunTot + nCreditTot + nBalTot), 15) + '��' + LF + CR;
      sRPrt:= sRPrt + '=======================================' + LF +
              LF + LF + LF + LF + LF + LF + LF;
      sRPrt:= sRPrt + FullCut_WTP;

      // ����
      if nSelect = 2 then
      begin
        SetProgress(3);  //24

        with qryTemp do
        begin
          Close;  //ó���� ���ܱ�ó���ڷ� üũ
          SQL.Clear;
          SQL.Add('UpDate BarProc Set ChkClosing = :N1 ');

          // ���ڸ���
          if nClosingType = 0 then
            SQL.Add('where ProcDate = :N2 and ChkClosing = :N3 and MNo = :N5')
          // �ٹ��ڸ���
          else
            SQL.Add('where ProcDate >= :N2 and ChkClosing = :N3 and MNo = :N5');
          Parameters.ParamByName('N1').Value:= 1;
          Parameters.ParamByName('N2').Value:= sCDate;
          Parameters.ParamByName('N3').Value:= 0;
          //Parameters.ParamByName('N4').Value:= nCurrUnitNo;
          Parameters.ParamByName('N5').Value:= nCurrMNo;
          ExecSQL;
        end;
      end;
      EndProgress;
    end;

    // ������ �ؽ�Ʈ���� �����ҰŸ�
    if bClosingText then
      ClosingLogging(sRPrt);

    // ��ȸ
    if nSelect = 1 then
    begin
      // �߰������� �μ��Ұ���
      if bInterimPrint then
        btnPrint.Enabled:= True;
    end
    // ����
    else
    if nSelect = 2 then
    begin
      // ini���Ͽ� ���� ��¥�ð� ����
      iSetup.WriteString('PARKING', IntToStr(nCurrMNo) + '_����', FormatDateTime('YYYY-MM-DD HH:NN:SS', Now));
      //DB�� ����
      with qryTemp do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Insert Into Closing ');
        SQL.Add('(ParkNo, CDate, ProcDate, ProcTime, MNo, ClosingSeq, PrtData) ');
        SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7)');
        Parameters.ParamByName('N1').Value:= nCurrParkNo;
        Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtPDate.Date);
        Parameters.ParamByName('N3').Value:= sPDate;
        Parameters.ParamByName('N4').Value:= sPTime;
        Parameters.ParamByName('N5').Value:= nCurrMNo;
        Parameters.ParamByName('N6').Value:= nClosingSeq;
        Parameters.ParamByName('N7').Value:= MG_StrConvert(sRPrt, AnsiChar($00), AnsiChar($FF));
        ExecSQL;
      end;


      // �μ��ư Ȱ��ȭ
      btnPrint.Enabled:= True;
      bClosing:= True;
      btnPrintClick(Self);
    end;
  except
    on E: Exception do ExceptLogging('TfrmClosing.DataCheck: ' + E.Message);
  end;
end;

procedure TfrmClosing.btnCloseClick(Sender: TObject);
begin
  try
    with dmTables do
    begin
      qryTemp.Close;
    end;
    Close;
  except
    on E: Exception do ExceptLogging('TfrmClosing.btnCloseClick: ' + E.Message);
  end;
end;

procedure TfrmClosing.btnClosingClick(Sender: TObject);
begin
  DataCheck(2);
end;

procedure TfrmClosing.btnPrintClick(Sender: TObject);
var
  i, j, k, m: Integer;
  sTemp: String;
begin
  //�����������ͷ� �μ�...
  if Length(sRPrt) > 100 then
  begin
    j:= Length(sRPrt) div 100;
    m:= Length(sRPrt) mod 100;

    for i:= 1 to j do
    begin
//      frmMainNew.ComPRN.PutString(Copy(sRPrt, 100*(i-1)+1, 100));
      sleep(50);
    end;
//    frmMainNew.ComPRN.PutString(Copy(sRPrt, 100*(i-1)+1, m));
  end
  else
  begin
//    frmMainNew.ComPRN.PutString(sRPrt)
  end;

  if not bClosingReprint then
  begin
    sRPrt:= '';
    btnPrint.Enabled:= False;
  end;
end;

procedure TfrmClosing.FormShow(Sender: TObject);
begin
  btnSearch.Enabled:= bInterimClosing;
  edtPDate.Date:= Now;
  PageControl1.ActivePage:= TabSheet1;
end;

procedure TfrmClosing.btnDetailClick(Sender: TObject);
var
  orgPnl: TPanel;
  orgEdt: TAdvEdit;
  i: Integer;
begin
  try
    Application.CreateForm(TfrmFeeDetail, frmFeeDetail);

    with frmFeeDetail do
    begin
      for i:= 0 to nFeeCnt do
      begin
        orgPnl:= TPanel.Create(Self);

        with orgPnl do
        begin
          Name:= 'pnlFeeName' + IntToStr(i);
          Parent:= Panel2;
          Top:= (i-1)*27 + 6;
          Left:= 8;
          Height:= 23;
          Width:= 105;

          Case i of
            0: Caption:= '�� �� �� ��';
            1: Caption:= sFeeName1;
            2: Caption:= sFeeName2;
            3: Caption:= sFeeName3;
            4: Caption:= sFeeName4;
            5: Caption:= sFeeName5;
            6: Caption:= sFeeName6;
            7: Caption:= sFeeName7;
            8: Caption:= sFeeName8;
            9: Caption:= sFeeName9;
          end;

          orgEdt:= TAdvEdit.Create(Self);

          with orgEdt do
          begin
            Name:= 'sFeeCnt' + IntToStr(i);
            Parent:= Panel2;
            Top:= (i-1)*27 + 6;
            Left:= 118;
            Height:= 23;
            Width:= 57;
            ReadOnly:= True;

            Case i of
              0: Text:= sCnt0;
              1: Text:= sCnt1;
              2: Text:= sCnt2;
              3: Text:= sCnt3;
              4: Text:= sCnt4;
              5: Text:= sCnt5;
              6: Text:= sCnt6;
              7: Text:= sCnt7;
              8: Text:= sCnt8;
              9: Text:= sCnt9;
            end;
            AutoThousandSeparator:= True;
          end;

          orgEdt:= TAdvEdit.Create(Self);

          with orgEdt do
          begin
            Name:= 'sFeeAmt' + IntToStr(i);
            Parent:= Panel2;
            Top:= (i-1)*27 + 6;
            Left:= 179;
            Height:= 23;
            Width:= 93;
            ReadOnly:= True;

            Case i of
              0: Text:= sAmt0;
              1: Text:= sAmt1;
              2: Text:= sAmt2;
              3: Text:= sAmt3;
              4: Text:= sAmt4;
              5: Text:= sAmt5;
              6: Text:= sAmt6;
              7: Text:= sAmt7;
              8: Text:= sAmt8;
              9: Text:= sAmt9;
            end;
            AutoThousandSeparator:= True;
          end;
        end;
      end;
      btnClose.Top:= nFeeCnt*27 + 6;
      btnClose.Left:= 179;
      Panel2.AutoSize:= True;
      Left:= (Screen.Width - Width) div 2;
      Top:= (Screen.Height - Height) div 2;
      ShowModal;
      Free;
    end;
  except
    on E: Exception do ExceptLogging('TfrmClosing.btnDetailClick: ' + E.Message);
  end;
end;

procedure TfrmClosing.qryCTKProcMNameGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if qryCTKProcMNo.Value = 99 then
    Text:= 'SD System'
  else
    Text:= qryCTKProcMName.Value;
end;

procedure TfrmClosing.qryCIssueTKMNameGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if qryCIssueTKMNo.Value = 99 then
    Text:= 'SD System'
  else
    Text:= qryCIssueTKMName.Value;
end;

procedure TfrmClosing.qryCBarProcMNameGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if qryCBarProcMNo.Value = 99 then
    Text:= 'SD System'
  else
    Text:= qryCBarProcMName.Value;
end;

procedure TfrmClosing.qryCTKProcTKTypeGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Case qryCTKProcTKType.Value of
    1 : Text:= '�Ϲݱ�';
    2 : Text:= '�����';
    3 : Text:= '���ױ�';
    4 : Text:= '1ȸ��';
    5 : Text:= '����';
    6 : Text:= '���α�';
    9 : Text:= '��������';
    10: Text:= '�н�Ƽ��';
  end;
end;

procedure TfrmClosing.qryCIssueTKTKTypeGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Case qryCIssueTKTKType.Value of
    1 : Text:= '�Ϲݱ�';
    2 : Text:= '�����';
    3 : Text:= '���ױ�';
    4 : Text:= '1ȸ��';
    5 : Text:= '����';
    6 : Text:= '���α�';
    9 : Text:= '�Ѽ�Ƽ��';
    10: Text:= '�н�Ƽ��';
  end;
end;

procedure TfrmClosing.qryCIssueTKIssueTypeGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Case qryCIssueTKIssueType.Value of
    1: Text:= '�űԹ߱�';
    2: Text:= '�Ⱓ����';
    3: Text:= '��߱�(�Ѽ�)';
    4: Text:= '��߱�(�н�)';
  end;
end;

procedure TfrmClosing.btnSearchClick(Sender: TObject);
begin
  DataCheck(1);
end;

end.

