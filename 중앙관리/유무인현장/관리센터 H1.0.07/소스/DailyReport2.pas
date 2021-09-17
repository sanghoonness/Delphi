unit DailyReport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxClass, frxDBSet, Data.DB,
  Data.Win.ADODB, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, AdvEdit,
  Vcl.ExtCtrls, AdvPanel, Vcl.Grids, AdvObj, BaseGrid, AdvGrid, DBAdvGrid,
  AdvPageControl, tmsAdvGridExcel, AdvProgr;
//  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
//  Dialogs, ToolWin, ComCtrls, StdCtrls, Buttons, ExtCtrls,
//  ADODB, AdvGrid, DBAdvGrid,
//  AdvSpin, Mask, AdvEdit, AdvCombo, AdvPanel, AdvToolBtn, AdvPageControl,
//  AdvAppStyler, BaseGrid, DB, Grids, frxClass, frxDBSet, frxADOComponents, frxExportXLS,
//  AdvObj;

type
  TfrmDailyReport = class(TForm)
    qryTKProcClosing: TADOQuery;
    dsTKProcClosing: TDataSource;
    qryTKProcClosingParkNo: TSmallintField;
    qryTKProcClosingCDate: TStringField;
    qryTKProcClosingProcDate: TStringField;
    qryTKProcClosingProcTime: TStringField;
    qryTKProcClosingClosingSeq: TWordField;
    qryTKProcClosingMNo: TWordField;
    qryTKProcClosingProcCnt: TSmallintField;
    qryTKProcClosingProcFee: TIntegerField;
    qryTKProcClosingProcDC: TIntegerField;
    qryTKProcClosingProcRealFee: TIntegerField;
    qryTKProcClosingLostCnt: TSmallintField;
    qryTKProcClosingLostAmt: TIntegerField;
    qryTKProcClosingDamageCnt: TSmallintField;
    qryTKProcClosingDamageAmt: TIntegerField;
    qryTKProcClosingDCCnt: TSmallintField;
    qryTKProcClosingGT1Cnt: TIntegerField;
    qryTKProcClosingTotDCCnt: TIntegerField;
    qryTKProcClosingUnPaidCnt: TSmallintField;
    qryTKProcClosingReserve1: TStringField;
    qryTKProcClosingReserve2: TStringField;
    qryTKProcClosingReserve3: TStringField;
    qryTKProcClosingReserve4: TStringField;
    qryTKProcClosingReserve5: TStringField;
    qryTemp: TADOQuery;
    qryIssueClosing: TADOQuery;
    dsIssueClosing: TDataSource;
    qryBarClosing: TADOQuery;
    dsBarClosing: TDataSource;
    qryBarClosingParkNo: TSmallintField;
    qryBarClosingCDate: TStringField;
    qryBarClosingProcDate: TStringField;
    qryBarClosingProcTime: TStringField;
    qryBarClosingClosingSeq: TWordField;
    qryBarClosingMNo: TWordField;
    qryBarClosingUpCnt: TSmallintField;
    qryBarClosingDownCnt: TSmallintField;
    qryBarClosingLockCnt: TSmallintField;
    qryBarClosingUnLockCnt: TSmallintField;
    qryBarClosingReserve1: TStringField;
    qryBarClosingReserve2: TStringField;
    qryBarClosingReserve3: TStringField;
    qryBarClosingReserve4: TStringField;
    qryBarClosingReserve5: TStringField;
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
    qryTKProcClosingMName: TStringField;
    qryBarClosingMName: TStringField;
    AdvPanel4: TAdvPanel;
    Bevel14: TBevel;
    Label14: TLabel;
    edtPDate: TDateTimePicker;
    qryTKProcClosingUnitNo: TSmallintField;
    qryTKProcClosingUnpaid: TIntegerField;
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
    qryTKProcClosingUnitName: TStringField;
    qryBarClosingUnitNo: TSmallintField;
    qryBarClosingUnitName: TStringField;
    btnSearch: TBitBtn;
    btnPrint: TBitBtn;
    btnClose: TBitBtn;
    frxReport1: TfrxReport;
    fTKProcClosing: TfrxDBDataset;
    fIssueClosing: TfrxDBDataset;
    fBarClosing: TfrxDBDataset;
    qryFeeItemClosing: TADOQuery;
    qryFeeItem: TADOQuery;
    qryFeeItemFeeNo: TWordField;
    qryFeeItemFeeName: TStringField;
    qryFeeItemParkNo: TSmallintField;
    dsFeeItemClosing: TDataSource;
    fFeeItemClosing: TfrxDBDataset;
    qryFeeItemClosingProcDate: TStringField;
    qryFeeItemClosingFeeNo: TWordField;
    qryFeeItemClosingCOLUMN1: TIntegerField;
    qryFeeItemClosingCOLUMN2: TIntegerField;
    qryFeeItemClosingFeeName: TStringField;
    qryNInCnt: TADOQuery;
    qryNInCntnInCnt: TIntegerField;
    dsNInCnt: TDataSource;
    fNInCnt: TfrxDBDataset;
    qryNOutCnt: TADOQuery;
    qryNOutCntnOutCnt: TIntegerField;
    dsNOutCnt: TDataSource;
    fNOutCnt: TfrxDBDataset;
    qrySInCnt: TADOQuery;
    qrySInCntSInCnt: TIntegerField;
    dsSInCnt: TDataSource;
    fSInCnt: TfrxDBDataset;
    qrySOutCnt: TADOQuery;
    qrySOutCntSOutCnt: TIntegerField;
    dsSOutCnt: TDataSource;
    fSOutCnt: TfrxDBDataset;
    qrySCNew: TADOQuery;
    dsSCNew: TDataSource;
    qrySCNewnNewCnt: TIntegerField;
    qrySCNewnNewAmt: TIntegerField;
    qrySCAdd: TADOQuery;
    dsSCAdd: TDataSource;
    fSCNew: TfrxDBDataset;
    fSCAdd: TfrxDBDataset;
    qryIssueClosingIssueDate: TStringField;
    qryIssueClosingMNo: TSmallintField;
    qryIssueClosingnIssue: TIntegerField;
    qryIssueClosingCOLUMN1: TIntegerField;
    qryIssueClosingCOLUMN2: TIntegerField;
    qryIssueClosingMName: TStringField;
    qrySCAddnAddCnt: TIntegerField;
    qrySCAddnAddAmt: TIntegerField;
    Panel1: TPanel;
    Panel2: TPanel;
    dgTKProc: TDBAdvGrid;
    DBAdvGrid1: TDBAdvGrid;
    edtTotCash: TAdvEdit;
    edtTotCashAmt: TAdvEdit;
    edtTotCard: TAdvEdit;
    edtTotCardAmt: TAdvEdit;
    btnExcel: TBitBtn;
    pnProgress: TPanel;
    Label6: TLabel;
    ap1: TAdvProgress;
    AdvGridExcelIO1: TAdvGridExcelIO;
    SaveDialog1: TSaveDialog;
    procedure btnSearchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qryFeeItemClosingFeeNameGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure btnExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDailyReport: TfrmDailyReport;

implementation
uses
  Global, Tables, FeeDetail;

{$R *.dfm}

procedure TfrmDailyReport.btnSearchClick(Sender: TObject);
var
  sCDate: String;
  i, nRowCnt: Integer;
begin
  try
    btnExcel.Enabled := false;
    edtTotCash.Text:= '0';
    edtTotCashAmt.Text:= '0';
    edtTotCard.Text:= '0';
    edtTotCardAmt.Text:= '0';

    sCDate:= FormatDateTime('YYYY-MM-DD', edtPDate.Date); //조회일
    StartProgress('일별마감집계 처리중...', '처리중입니다.  잠시 기다려주세요!', 100);

    with qryTKProcClosing do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from TKProcClosing where ProcDate = :N1');
      Parameters.ParamByName('N1').Value:= sCDate;
      Open;

      if RecordCount > 0 then
      begin
        btnExcel.Enabled := true;

        with qryTemp do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select SUM(CONVERT(int, reserve1)) as totalCash, SUM(CONVERT(int, reserve2)) as totalCashAmt ');
          SQL.Add(', SUM(CONVERT(int, reserve3)) as totalCard, SUM(CONVERT(int, reserve4))  as totalCardAmt ');
          SQL.Add(' from TKProcClosing Group By ProcDate Having ProcDate = :N1');
          Parameters.ParamByName('N1').Value:= sCDate;
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
    SetProgress(10);

    with qryFeeItemClosing do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select ProcDate, FeeNo, Sum(FeeCnt), Sum(FeeAmt) ');
      SQL.Add('from FeeDetail ');
      SQL.Add('where ProcDate = :N1 ');
      SQL.Add('Group By ProcDate, FeeNo ');
      SQL.Add('Order By ProcDate, FeeNo');
      Parameters.ParamByName('N1').Value:= sCDate;
      Open;
    end;
    SetProgress(30);

//    with qryIssueClosing do
//    begin
//      Close;
//      SQL.Clear;
//      SQL.Add('Select IssueDate, MNo, Count(*) nIssue, Sum(IssueUnit), Sum(FValue) from IssueTK ');
//      SQL.Add('where IssueDate = :N1 and TKType = 2 Group By IssueDate, MNo');
//      Parameters.ParamByName('N1').Value:= sCDate;
//      Open;
//
//      if RecordCount > 0 then
//      begin
//        with qryTemp do
//        begin
//          Close;  //티켓발급마감
//          SQL.Clear;
//          SQL.Add('Select Count(*), Sum(IssueUnit), Sum(FValue) ');
//          SQL.Add('from IssueTK where IssueDate = :N1 and TKType = 2 Group By IssueDate');
//          Parameters.ParamByName('N1').Value:= sCDate;
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
//   SetProgress(10);

//    with qryBarClosing do
//    begin
//      Close;
//      SQL.Clear;
//      SQL.Add('Select * from BarClosing where CDate = :N1');
//      Parameters.ParamByName('N1').Value:= sCDate;
//      Open;
//
//      if RecordCount > 0 then
//      begin
//        with qryTemp do
//        begin
//          Close;  //차단기처리마감
//          SQL.Clear;
//          SQL.Add('Select Sum(UpCnt), Sum(DownCnt), Sum(LockCnt), Sum(UnlockCnt) from BarClosing ');
//          SQL.Add('Group By CDate Having CDate = :N1');
//          Parameters.ParamByName('N1').Value:= sCDate;
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
      SQL.Add('Select Count(*) nInCnt from IONData where ProcDate = :N1');
      Parameters.ParamByName('N1').Value:= sCDate;
      Open;
    end;
    SetProgress(10);

    with qryNOutCnt do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select Count(*) nOutCnt from IONData where OutDate = :N1 and ((OutChk <> 0) and (OutChk <> 7))');
      Parameters.ParamByName('N1').Value:= sCDate;
      Open;
    end;
    SetProgress(10);

    with qrySInCnt do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select Count(*) SInCnt from IOSData where ProcDate = :N1 and InIOStatusNo = 1');
      Parameters.ParamByName('N1').Value:= sCDate;
      Open;
    end;
    SetProgress(10);

    with qrySOutCnt do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select Count(*) SOutCnt from IOSData where OutDate = :N1 and OutIOStatusNo = 2');
      Parameters.ParamByName('N1').Value:= sCDate;
      Open;
    end;
    SetProgress(10);

    with qrySCNew do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select Count(*) nNewCnt, Sum(IssueUnit) nNewAmt from IssueTK ');
      SQL.Add('where IssueDate = :N1 and TKType = 2 and IssueType = 1');
      Parameters.ParamByName('N1').Value:= sCDate;
      Open;
    end;
    SetProgress(10);

    with qrySCAdd do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select Count(*) nAddCnt, Sum(IssueUnit) nAddAmt from IssueTK ');
      SQL.Add('where IssueDate = :N1 and TKType = 2 and IssueType = 2');
      Parameters.ParamByName('N1').Value:= sCDate;
      Open;
    end;
    EndProgress;

    btnPrint.Enabled:= True;
  except
    on E: Exception do ExceptLogging('TfrmDailyMagam.btnSearchClick: ' + E.Message);
  end;
end;

procedure TfrmDailyReport.FormCreate(Sender: TObject);
begin
  qryManager.Open;
  qryUnitInfo.Open;
  qryFeeItem.Open;
end;

procedure TfrmDailyReport.btnCloseClick(Sender: TObject);
begin
  qryTemp.Close;
  qryTKProcClosing.Close;
  qryIssueClosing.Close;
  qryBarClosing.Close;
  qryFeeItemClosing.Close;
  Close;
end;

procedure TfrmDailyReport.btnExcelClick(Sender: TObject);
begin
  try
    if savedialog1.Execute then
    begin
      pnProgress.Visible:= True;
      Refresh;
      AdvGridExcelIO1.XLSExport(savedialog1.filename + '.xls');
      pnProgress.Visible:= False;
      ShowMessage('엑셀파일로 저장완료!');
    end;
  except
    on E: Exception do ExceptLogging('TfrmDailyReport.btnExcelClick: ' + E.Message);
  end;
end;

procedure TfrmDailyReport.btnPrintClick(Sender: TObject);
var
  sTemp: String;
begin
  frxReport1.LoadFromFile(sCurrRunDir + '\Report\Daily.fr3');
  sTemp:= FormatDateTime('YYYY-MM-DD', edtPDate.Date);
  sTemp:= '   조회일자 : ' + sTemp;
  frxReport1.Variables['sDate']:= '''' + sTemp + '''';
  frxReport1.ShowReport(True);
end;

procedure TfrmDailyReport.FormShow(Sender: TObject);
begin
  edtPDate.Date:= Now;
  btnExcel.Enabled := false;
  btnPrint.Enabled := false;
end;

procedure TfrmDailyReport.qryFeeItemClosingFeeNameGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if qryFeeItemClosingFeeNo.Value = 0 then
    Text:= '일반요금'
  else
    Text:= qryFeeItemClosingFeeName.Value;
end;

end.
