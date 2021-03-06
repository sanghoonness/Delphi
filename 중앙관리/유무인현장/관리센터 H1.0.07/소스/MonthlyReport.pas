unit MonthlyReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ComCtrls, Mask, StdCtrls, Buttons, ExtCtrls, Grids,
  DB, ADODB, AdvEdit, AdvToolBtn, AdvPanel, BaseGrid, AdvGrid, DBAdvGrid,
  AdvPageControl, AdvAppStyler, tmsAdvGridExcel, frxClass, frxDBSet,
  AdvObj, AdvProgr;
  //, frxExportXLS
type
  TfrmMonthlyReport = class(TForm)
    qryTKProcClosingM: TADOQuery;
    dsTKProcClosingM: TDataSource;
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
    frxReport1: TfrxReport;
    qryDCClosing: TADOQuery;
    qryDCClosingCDate: TStringField;
    qryDCClosingProcDate: TStringField;
    qryDCClosingProcTime: TStringField;
    qryDCClosingMName: TStringField;
    qryDCClosingDCName: TStringField;
    qryDCClosingDCNo: TWordField;
    qryDCClosingCOLUMN1: TIntegerField;
    qryDCClosingCOLUMN2: TIntegerField;
    dsDCClosing: TDataSource;
    fDCClosing: TfrxDBDataset;
    qryTKProcClosingMunitno: TSmallintField;
    qryTKProcClosingMCDate: TStringField;
    qryTKProcClosingMCTime: TStringField;
    qryTKProcClosingMProcCnt: TIntegerField;
    qryTKProcClosingMProcFee: TIntegerField;
    qryTKProcClosingMDCCnt: TIntegerField;
    qryTKProcClosingMProcDC: TIntegerField;
    qryTKProcClosingMProcRealFee: TIntegerField;
    qryTKProcClosingMLostCnt: TIntegerField;
    qryTKProcClosingMLostAmt: TIntegerField;
    qryTKProcClosingMDamageCnt: TIntegerField;
    qryTKProcClosingMDamageAmt: TIntegerField;
    qryTKProcClosingMGT1Cnt: TIntegerField;
    qryTKProcClosingMcashCnt: TIntegerField;
    qryTKProcClosingMcashAmt: TIntegerField;
    qryTKProcClosingMcardCnt: TIntegerField;
    qryTKProcClosingMcardAmt: TIntegerField;
    qryUnitInfo: TADOQuery;
    qryUnitInfoParkNo: TSmallintField;
    qryUnitInfoUnitNo: TSmallintField;
    qryUnitInfoUnitName: TStringField;
    qryUnitInfoUnitKind: TWordField;
    qryUnitInfoMyNo: TWordField;
    qryUnitInfoComport: TIntegerField;
    qryUnitInfoBaudrate: TIntegerField;
    qryUnitInfoIPNo: TStringField;
    qryUnitInfoPortNo: TIntegerField;
    qryUnitInfoReserve1: TStringField;
    qryUnitInfoReserve2: TStringField;
    qryUnitInfoReserve3: TStringField;
    qryUnitInfoReserve4: TStringField;
    qryUnitInfoReserve5: TStringField;
    qryTKProcClosingMUnitName: TStringField;
    Panel1: TPanel;
    dgTKProc: TDBAdvGrid;
    DBAdvGrid1: TDBAdvGrid;
    Panel2: TPanel;
    edtTotCash: TAdvEdit;
    edtTotCard: TAdvEdit;
    edtTotCashAmt: TAdvEdit;
    edtTotCardAmt: TAdvEdit;
    pnProgress: TPanel;
    Label6: TLabel;
    ap1: TAdvProgress;
    SaveDialog1: TSaveDialog;
    AdvGridExcelIO1: TAdvGridExcelIO;
    btnExcel: TBitBtn;
    procedure btnSearchClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
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

procedure TfrmMonthlyReport.btnExcelClick(Sender: TObject);
begin
  try
    if savedialog1.Execute then
    begin
      pnProgress.Visible:= True;
      Refresh;
      AdvGridExcelIO1.XLSExport(savedialog1.filename + '.xls');
      pnProgress.Visible:= False;
      ShowMessage('?????????? ????????!');
    end;
  except
    on E: Exception do ExceptLogging('TfrmMonthlyReport.btnExcelClick: ' + E.Message);
  end;
end;

procedure TfrmMonthlyReport.btnPrintClick(Sender: TObject);
var
  sTemp: String;
begin
  frxReport1.LoadFromFile(sCurrRunDir + '\Report\Monthly.fr3');
  sTemp:= edtPDate.Text;
  sTemp:= '   ?????? : ' + sTemp;
  frxReport1.Variables['sDate']:= '''' + sTemp + '''';
  frxReport1.ShowReport(True);
end;

procedure TfrmMonthlyReport.btnSearchClick(Sender: TObject);
var
  sCDate, sCDateS, sCDateE: String;
  i: Integer;
begin
  try
    btnExcel.Enabled := false;
    edtTotCash.Text:= '0';
    edtTotCashAmt.Text:= '0';
    edtTotCard.Text:= '0';
    edtTotCardAmt.Text:= '0';

    sCDate:= edtPDate.Text; //??????
    sCDateS:= sCDate + '-01';
    sCDateE:= sCDate + '-31';
    StartProgress('???????????? ??????...', '????????????.  ???? ????????????!', 100);

    with qryTKProcClosingM do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select unitno, ProcDate CDate, ProcTime CTime, Sum(ProcCnt) ProcCnt, Sum(ProcFee) ProcFee  ');
      SQL.Add(', Sum(DCCnt) DCCnt, Sum(ProcDC) ProcDC, Sum(ProcRealFee) ProcRealFee, ');
      SQL.Add('Sum(LostCnt) LostCnt, Sum(LostAmt) LostAmt, Sum(DamageCnt) DamageCnt, Sum(DamageAmt) DamageAmt, Sum(GT1Cnt) GT1Cnt ');
      SQL.Add(', SUM(CONVERT(int, reserve1)) cashCnt, SUM(CONVERT(int, reserve2)) cashAmt ');
      SQL.Add(', SUM(CONVERT(int, reserve3)) cardCnt, SUM(CONVERT(int, reserve4)) cardAmt');
      SQL.Add('from TKProcClosing Group By ProcDate, ProcTime, UnitNo Having ProcDate >= :N1 and ProcDate <= :N2');
      SQL.Add(' order by procdate ');
      Parameters.ParamByName('N1').Value:= sCDateS;
      Parameters.ParamByName('N2').Value:= sCDateE;
      Open;

      if RecordCount > 0 then
      begin
        btnExcel.Enabled := true;

        with qryTemp do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select SUM(CONVERT(int, reserve1)) as totalCash, SUM(CONVERT(int, reserve2)) as totalCashAmt ');
          SQL.Add(', SUM(CONVERT(int, reserve3)) as totalCard, SUM(CONVERT(int, reserve4))  as totalCardAmt');
          SQL.Add('from TKProcClosing where ProcDate >= :N1 and ProcDate <= :N2');
          Parameters.ParamByName('N1').Value:= sCDateS;
          Parameters.ParamByName('N2').Value:= sCDateE;
          Open;

          edtTotCash.Text:= FieldByName('totalCash').AsString;
          edtTotCashAmt.Text:= FieldByName('totalCashAmt').AsString;
          edtTotCard.Text:= FieldByName('totalCard').AsString;
          edtTotCardAmt.Text:= FieldByName('totalCardAmt').AsString;

          edtTotCash.AutoThousandSeparator:= True;
          edtTotCashAmt.AutoThousandSeparator:= True;
          edtTotCard.AutoThousandSeparator:= True;
          edtTotCardAmt.AutoThousandSeparator:= True;
        end;
      end;
    end;  //1
    SetProgress(30);

    with qryFeeItemClosing do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select FeeNo, Sum(FeeCnt), Sum(FeeAmt) ');
      SQL.Add('from FeeDetail ');
      SQL.Add('where ProcDate >= :N1 and ProcDate <= :N2');
      SQL.Add('Group By FeeNo ');
      SQL.Add('Order By FeeNo');
      Parameters.ParamByName('N1').Value:= sCDateS;
      Parameters.ParamByName('N2').Value:= sCDateE;
      Open;
    end;
    SetProgress(10);
//
//    with qryIssueClosingM do
//    begin
//      Close;
//      SQL.Clear;
//      SQL.Add('Select IssueDate, Count(*), Sum(IssueUnit), Sum(FValue) ');
//      SQL.Add('from IssueTK where IssueDate >= :N1 and IssueDate <= :N2 Group By IssueDate');
//      Parameters.ParamByName('N1').Value:= sCDateS;
//      Parameters.ParamByName('N2').Value:= sCDateE;
//      Open;
//
//      if RecordCount > 0 then
//      begin
//        with qryTemp do
//        begin
//          Close;  //????????????
//          SQL.Clear;
//          SQL.Add('Select Count(*), Sum(IssueUnit), Sum(FValue) ');
//          SQL.Add('from IssueTK where IssueDate >= :N1 and IssueDate <= :N2');
//          Parameters.ParamByName('N1').Value:= sCDateS;
//          Parameters.ParamByName('N2').Value:= sCDateE;
//          Open;
//
//          edtICnt .Text:= FieldByName('COLUMN1').AsString;
//          edtIAmt .Text:= FieldByName('COLUMN2').AsString;
//          edtIFAmt.Text:= FieldByName('COLUMN3').AsString;
//          edtICnt .AutoThousandSeparator:= True;
//          edtIAmt .AutoThousandSeparator:= True;
//          edtIFAmt.AutoThousandSeparator:= True;
//        end;
//      end;
//    end;  //2
//    SetProgress(10);
//
//    with qryBarClosingM do
//    begin
//      Close;
//      SQL.Clear;
//      SQL.Add('Select CDate, Sum(UpCnt), Sum(DownCnt), Sum(LockCnt), Sum(UnLockCnt) ');
//      SQL.Add('from BarClosing where CDate >= :N1 and CDate <= :N2 Group By CDate');
//      Parameters.ParamByName('N1').Value:= sCDateS;
//      Parameters.ParamByName('N2').Value:= sCDateE;
//      Open;
//
//      if RecordCount > 0 then
//      begin
//        with qryTemp do
//        begin
//          Close;  //??????????????
//          SQL.Clear;
//          SQL.Add('Select Sum(UpCnt), Sum(DownCnt), Sum(LockCnt), Sum(UnlockCnt) from BarClosing ');
//          SQL.Add('where CDate >= :N1 and CDate <= :N2');
//          Parameters.ParamByName('N1').Value:= sCDateS;
//          Parameters.ParamByName('N2').Value:= sCDateE;
//          Open;
//
//          edtUp    .Text:= FieldByName('COLUMN1').AsString;
//          edtDown  .Text:= FieldByName('COLUMN2').AsString;
//          edtLock  .Text:= FieldByName('COLUMN3').AsString;
//          edtUnlock.Text:= FieldByName('COLUMN4').AsString;
//          edtUp    .AutoThousandSeparator:= True;
//          edtDown  .AutoThousandSeparator:= True;
//          edtLock  .AutoThousandSeparator:= True;
//          edtUnlock.AutoThousandSeparator:= True;
//        end;
//      end;
//    end;  //3
//    SetProgress(10);

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

    with qryDCClosing do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select CDate, ProcDate, ProcTime, MName, DCName, DCNo, Sum(DCCnt), Sum(DCAmt) ');
      SQL.Add('from DCClosing where SUBSTRING(CDate, 1, 7) = :N1 Group By CDate, ProcDate, ProcTime, MName, DCName, DCNo ');
      SQL.Add('order by ProcDate, ProcTime, MName');
      Parameters.ParamByName('N1').Value:= sCDate;
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
  edtPDate.Text:= FormatDateTime('YYYY-MM', Now);
  btnExcel.Enabled := false;
  btnPrint.Enabled := false;
end;

end.
