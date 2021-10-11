unit MonthlyReport;

interface

uses
//  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
//  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxClass, frxDBSet, Data.DB,
//  Data.Win.ADODB, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, AdvEdit, Vcl.ExtCtrls,
//  AdvPanel, Vcl.Grids, AdvObj, BaseGrid, AdvGrid, DBAdvGrid, AdvPageControl,
//  Vcl.ComCtrls;
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ComCtrls, Mask, StdCtrls, Buttons, ExtCtrls, Grids,
  DB, ADODB, AdvEdit, AdvToolBtn, AdvPanel, BaseGrid, AdvGrid, DBAdvGrid,
  AdvPageControl, AdvAppStyler, tmsAdvGridExcel, frxClass, frxDBSet, AdvObj;
  //, frxExportXLS;

type
  TfrmMonthlyReport = class(TForm)
    qryTKProcClosingM: TADOQuery;
    dsTKProcClosingM: TDataSource;
    qryTKProcClosingMCDate: TStringField;
    qryTKProcClosingMCOLUMN1: TIntegerField;
    qryTKProcClosingMCOLUMN2: TIntegerField;
    qryTKProcClosingMCOLUMN3: TIntegerField;
    qryTKProcClosingMCOLUMN4: TIntegerField;
    qryTKProcClosingMCOLUMN5: TIntegerField;
    qryTKProcClosingMCOLUMN6: TIntegerField;
    qryTKProcClosingMCOLUMN7: TIntegerField;
    qryTKProcClosingMCOLUMN8: TIntegerField;
    qryTKProcClosingMCOLUMN9: TIntegerField;
    qryTKProcClosingMCOLUMN10: TIntegerField;
    qryTemp: TADOQuery;
    qryIssueClosingM: TADOQuery;
    dsIssueClosingM: TDataSource;
    qryBarClosingM: TADOQuery;
    dsBarClosingM: TDataSource;
    qryBarClosingMCDate: TStringField;
    qryBarClosingMCOLUMN1: TIntegerField;
    qryBarClosingMCOLUMN2: TIntegerField;
    qryBarClosingMCOLUMN3: TIntegerField;
    qryBarClosingMCOLUMN4: TIntegerField;
    qryIssueClosingMIssueDate: TStringField;
    qryIssueClosingMCOLUMN1: TIntegerField;
    qryIssueClosingMCOLUMN2: TIntegerField;
    qryIssueClosingMCOLUMN3: TIntegerField;
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
    edtPDate: TAdvMaskEdit;
    btnSearch: TBitBtn;
    btnPrint: TBitBtn;
    btnClose: TBitBtn;
    qryFeeItemClosing: TADOQuery;
    dsFeeItemClosing: TDataSource;
    qryFeeItem: TADOQuery;
    qryFeeItemParkNo: TSmallintField;
    qryFeeItemFeeNo: TWordField;
    qryFeeItemFeeName: TStringField;
    qryFeeItemClosingFeeNo: TWordField;
    qryFeeItemClosingCOLUMN1: TIntegerField;
    qryFeeItemClosingCOLUMN2: TIntegerField;
    qryFeeItemClosingFeeName: TStringField;
    DBAdvGrid1: TDBAdvGrid;
    qryNInCnt: TADOQuery;
    qryNInCntnInCnt: TIntegerField;
    dsNInCnt: TDataSource;
    qryNOutCnt: TADOQuery;
    qryNOutCntnOutCnt: TIntegerField;
    dsNOutCnt: TDataSource;
    qrySInCnt: TADOQuery;
    qrySInCntSInCnt: TIntegerField;
    dsSInCnt: TDataSource;
    qrySOutCnt: TADOQuery;
    qrySOutCntSOutCnt: TIntegerField;
    dsSOutCnt: TDataSource;
    qrySCAdd: TADOQuery;
    qrySCAddnAddCnt: TIntegerField;
    qrySCAddnAddAmt: TIntegerField;
    qrySCNew: TADOQuery;
    qrySCNewnNewCnt: TIntegerField;
    qrySCNewnNewAmt: TIntegerField;
    dsSCNew: TDataSource;
    dsSCAdd: TDataSource;
    fTKProcClosingM: TfrxDBDataset;
    fIssueClosingM: TfrxDBDataset;
    fBarClosingM: TfrxDBDataset;
    fFeeItemClosing: TfrxDBDataset;
    fNInCnt: TfrxDBDataset;
    fNOutCnt: TfrxDBDataset;
    fSCNew: TfrxDBDataset;
    fSCAdd: TfrxDBDataset;
    fSInCnt: TfrxDBDataset;
    fSOutCnt: TfrxDBDataset;
 //   frxXLSExport1: TfrxXLSExport;
    frxReport1: TfrxReport;
    procedure btnSearchClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMonthlyReport: TfrmMonthlyReport;

implementation
uses
  Global, Tables, FeeDetail;

{$R *.dfm}

procedure TfrmMonthlyReport.btnPrintClick(Sender: TObject);
var
  sTemp: String;
begin
  frxReport1.LoadFromFile(sCurrRunDir + '\Report\Monthly.fr3');
  sTemp:= edtPDate.Text;
  sTemp:= '   조회월 : ' + sTemp;
  frxReport1.Variables['sDate']:= '''' + sTemp + '''';
  frxReport1.ShowReport(True);
end;

procedure TfrmMonthlyReport.btnSearchClick(Sender: TObject);
var
  sCDate, sCDateS, sCDateE: String;
  i: Integer;
begin
  try
    edtCnt.Text:= '0';
    edtTot.Text:= '0';
    edtReal.Text:= '0';
    edtDCCnt.Text:= '0';
    edtDC.Text:= '0';
    edtTotDCCnt.Text:= '0';
    edtLostCnt.Text:= '0';
    edtLostAmt.Text:= '0';
    edtDamageCnt.Text:= '0';
    edtDamageAmt.Text:= '0';
    edtGT1Cnt.Text:= '0';
    edtiCnt.Text:= '0';
    edtiAmt.Text:= '0';
    edtiFAmt.Text:= '0';
    edtUp.Text:= '0';
    edtDown.Text:= '0';
    edtLock.Text:= '0';
    edtUnlock.Text:= '0';

    sCDate:= edtPDate.Text; //조회월
    sCDateS:= sCDate + '-01';
    sCDateE:= sCDate + '-31';
    StartProgress('월별마감집계 처리중...', '처리중입니다.  잠시 기다려주세요!', 100);

    with qryTKProcClosingM do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select CDate, Sum(ProcCnt), Sum(ProcFee), Sum(DCCnt), Sum(ProcDC), Sum(ProcRealFee), ');
      SQL.Add('Sum(LostCnt), Sum(LostAmt), Sum(DamageCnt), Sum(DamageAmt), Sum(GT1Cnt) ');
      SQL.Add('from TKProcClosing Group By CDate Having CDate >= :N1 and CDate <= :N2');
      Parameters.ParamByName('N1').Value:= sCDateS;
      Parameters.ParamByName('N2').Value:= sCDateE;
      Open;

      if RecordCount > 0 then
      begin
        with qryTemp do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Select Sum(ProcCnt), Sum(ProcFee), Sum(ProcDC), Sum(ProcRealFee), ');
          SQL.Add('Sum(LostCnt), Sum(LostAmt),  Sum(DamageCnt), Sum(DamageAmt), Sum(DCCnt), Sum(GT1Cnt) ');
          SQL.Add('from TKProcClosing where CDate >= :N1 and CDate <= :N2');
          Parameters.ParamByName('N1').Value:= sCDateS;
          Parameters.ParamByName('N2').Value:= sCDateE;
          Open;

          edtCnt      .Text:= FieldByName('COLUMN1').AsString;
          edtTot      .Text:= FieldByName('COLUMN2').AsString;
          edtDC       .Text:= FieldByName('COLUMN3').AsString;
          edtReal     .Text:= FieldByName('COLUMN4').AsString;
          edtLostCnt  .Text:= FieldByName('COLUMN5').AsString;
          edtLostAmt  .Text:= FieldByName('COLUMN6').AsString;
          edtDamageCnt.Text:= FieldByName('COLUMN7').AsString;
          edtDamageAmt.Text:= FieldByName('COLUMN8').AsString;
          edtDCCnt    .Text:= FieldByName('COLUMN9').AsString;
          edtGT1Cnt   .Text:= FieldByName('COLUMN10').AsString;
          edtCnt      .AutoThousandSeparator:= True;
          edtTot      .AutoThousandSeparator:= True;
          edtDC       .AutoThousandSeparator:= True;
          edtReal     .AutoThousandSeparator:= True;
          edtLostCnt  .AutoThousandSeparator:= True;
          edtLostAmt  .AutoThousandSeparator:= True;
          edtDamageCnt.AutoThousandSeparator:= True;
          edtDamageAmt.AutoThousandSeparator:= True;
          edtDCCnt    .AutoThousandSeparator:= True;
          edtGT1Cnt   .AutoThousandSeparator:= True;
          edtTotDCCnt .AutoThousandSeparator:= True;
        end;
      end;
    end;  //1
    SetProgress(10);

    with qryFeeItemClosing do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select FeeNo, Sum(FeeCnt), Sum(FeeAmt) ');
      SQL.Add('from FeeDetail ');
      SQL.Add('where CDate >= :N1 and CDate <= :N2');
      SQL.Add('Group By FeeNo ');
      SQL.Add('Order By FeeNo');
      Parameters.ParamByName('N1').Value:= sCDateS;
      Parameters.ParamByName('N2').Value:= sCDateE;
      Open;
    end;
    SetProgress(10);

    with qryIssueClosingM do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select IssueDate, Count(*), Sum(IssueUnit), Sum(FValue) ');
      SQL.Add('from IssueTK where IssueDate >= :N1 and IssueDate <= :N2 Group By IssueDate');
      Parameters.ParamByName('N1').Value:= sCDateS;
      Parameters.ParamByName('N2').Value:= sCDateE;
      Open;

      if RecordCount > 0 then
      begin
        with qryTemp do
        begin
          Close;  //티켓발급마감
          SQL.Clear;
          SQL.Add('Select Count(*), Sum(IssueUnit), Sum(FValue) ');
          SQL.Add('from IssueTK where IssueDate >= :N1 and IssueDate <= :N2');
          Parameters.ParamByName('N1').Value:= sCDateS;
          Parameters.ParamByName('N2').Value:= sCDateE;
          Open;

          edtICnt .Text:= FieldByName('COLUMN1').AsString;
          edtIAmt .Text:= FieldByName('COLUMN2').AsString;
          edtIFAmt.Text:= FieldByName('COLUMN3').AsString;
          edtICnt .AutoThousandSeparator:= True;
          edtIAmt .AutoThousandSeparator:= True;
          edtIFAmt.AutoThousandSeparator:= True;
        end;
      end;
    end;  //2
    SetProgress(10);

    with qryBarClosingM do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select CDate, Sum(UpCnt), Sum(DownCnt), Sum(LockCnt), Sum(UnLockCnt) ');
      SQL.Add('from BarClosing where CDate >= :N1 and CDate <= :N2 Group By CDate');
      Parameters.ParamByName('N1').Value:= sCDateS;
      Parameters.ParamByName('N2').Value:= sCDateE;
      Open;

      if RecordCount > 0 then
      begin
        with qryTemp do
        begin
          Close;  //차단기처리마감
          SQL.Clear;
          SQL.Add('Select Sum(UpCnt), Sum(DownCnt), Sum(LockCnt), Sum(UnlockCnt) from BarClosing ');
          SQL.Add('where CDate >= :N1 and CDate <= :N2');
          Parameters.ParamByName('N1').Value:= sCDateS;
          Parameters.ParamByName('N2').Value:= sCDateE;
          Open;

          edtUp    .Text:= FieldByName('COLUMN1').AsString;
          edtDown  .Text:= FieldByName('COLUMN2').AsString;
          edtLock  .Text:= FieldByName('COLUMN3').AsString;
          edtUnlock.Text:= FieldByName('COLUMN4').AsString;
          edtUp    .AutoThousandSeparator:= True;
          edtDown  .AutoThousandSeparator:= True;
          edtLock  .AutoThousandSeparator:= True;
          edtUnlock.AutoThousandSeparator:= True;
        end;
      end;
    end;  //3
    SetProgress(10);

    with qryNInCnt do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select Count(*) nInCnt from IONData where ProcDate >= :N1 and ProcDate <= :N2');
      Parameters.ParamByName('N1').Value:= sCDateS;
      Parameters.ParamByName('N2').Value:= sCDateE;
      Open;
    end;
    SetProgress(10);

    with qryNOutCnt do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select Count(*) nOutCnt from IONData where OutDate >= :N1 and OutDate <= :N2 ');
      SQL.Add('and ((OutChk <> 0) and (OutChk <> 7))');
      Parameters.ParamByName('N1').Value:= sCDateS;
      Parameters.ParamByName('N2').Value:= sCDateE;
      Open;
    end;
    SetProgress(10);

    with qrySInCnt do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select Count(*) SInCnt from IOSData where ProcDate >= :N1 and ProcDate <= :N2 and InIOStatusNo = 1');
      Parameters.ParamByName('N1').Value:= sCDateS;
      Parameters.ParamByName('N2').Value:= sCDateE;
      Open;
    end;
    SetProgress(10);

    with qrySOutCnt do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select Count(*) SOutCnt from IOSData where OutDate >= :N1 and OutDate <= :N2 and OutIOStatusNo = 2');
      Parameters.ParamByName('N1').Value:= sCDateS;
      Parameters.ParamByName('N2').Value:= sCDateE;
      Open;
    end;
    SetProgress(10);

    with qrySCNew do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select Count(*) nNewCnt, Sum(IssueUnit) nNewAmt from IssueTK ');
      SQL.Add('where IssueDate >= :N1 and IssueDate <= :N2 and TKType = 2 and IssueType = 1');
      Parameters.ParamByName('N1').Value:= sCDateS;
      Parameters.ParamByName('N2').Value:= sCDateE;
      Open;
    end;
    SetProgress(10);

    with qrySCAdd do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select Count(*) nAddCnt, Sum(IssueUnit) nAddAmt from IssueTK ');
      SQL.Add('where IssueDate >= :N1 and IssueDate <= :N2 and TKType = 2 and IssueType = 2');
      Parameters.ParamByName('N1').Value:= sCDateS;
      Parameters.ParamByName('N2').Value:= sCDateE;
      Open;
    end;
    EndProgress;
    btnPrint.Enabled:= True;
  except
    on E: Exception do ExceptLogging('TfrmMonthlyReport.btnSearchClick: ' + E.Message);
  end;
end;

procedure TfrmMonthlyReport.btnCloseClick(Sender: TObject);
begin
  try
    qryTemp.Close;
    qryTKProcClosingM.Close;
    qryIssueClosingM.Close;
    qryBarClosingM.Close;
    ModalResult := mrCancel;
    //Close;
  except
    on E: Exception do ExceptLogging('TfrmMonthlyReport.btnCloseClick: ' + E.Message);
  end;
end;

procedure TfrmMonthlyReport.FormShow(Sender: TObject);
begin
  qryFeeItem.Open;
  PageControl1.ActivePage:= TabSheet1;
  edtPDate.Text:= FormatDateTime('YYYY-MM', Now);
end;

end.
