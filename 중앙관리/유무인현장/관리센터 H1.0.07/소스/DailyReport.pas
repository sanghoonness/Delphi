unit DailyReport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxClass, frxDBSet, Data.DB,
  Data.Win.ADODB, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, AdvEdit,
  Vcl.ExtCtrls, AdvPanel, Vcl.Grids, AdvObj, BaseGrid, AdvGrid, DBAdvGrid,
  AdvPageControl, tmsAdvGridExcel, AdvProgr, comobj;
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
    ADOQuery1: TADOQuery;
    qryTKProcClosing2: TADOQuery;
    fTKProcClosing2: TfrxDBDataset;
    dsTKProcClosing2: TDataSource;
    qryTKProcClosing2ProcCnt: TIntegerField;
    qryTKProcClosing2ProcFee: TIntegerField;
    qryTKProcClosing2ProcRealFee: TIntegerField;
    qryTKProcClosing2LostCnt: TIntegerField;
    qryTKProcClosing2LostAmt: TIntegerField;
    qryTKProcClosing2DCCnt: TIntegerField;
    qryTKProcClosing2GT1Cnt: TIntegerField;
    dgTKProc: TDBAdvGrid;
    qryTKProcClosing2ProcDC: TIntegerField;
    qryTKProcClosing2Reserve2: TIntegerField;
    qryTKProcClosing2Reserve4: TIntegerField;
    qryFeeItemClosing2: TADOQuery;
    StringField1: TStringField;
    WordField1: TWordField;
    StringField2: TStringField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    dsFeeItemClosing2: TDataSource;
    fFeeItemClosing2: TfrxDBDataset;
    qryFeeItemClosing3: TADOQuery;
    StringField3: TStringField;
    WordField2: TWordField;
    StringField4: TStringField;
    IntegerField7: TIntegerField;
    IntegerField8: TIntegerField;
    IntegerField9: TIntegerField;
    IntegerField10: TIntegerField;
    IntegerField11: TIntegerField;
    IntegerField12: TIntegerField;
    dsFeeItemClosing3: TDataSource;
    fFeeItemClosing3: TfrxDBDataset;
    qryFeeItemClosing4: TADOQuery;
    StringField5: TStringField;
    IntegerField13: TIntegerField;
    IntegerField14: TIntegerField;
    IntegerField15: TIntegerField;
    IntegerField16: TIntegerField;
    IntegerField17: TIntegerField;
    IntegerField18: TIntegerField;
    dsFeeItemClosing4: TDataSource;
    fFeeItemClosing4: TfrxDBDataset;
    DBAdvGrid1: TDBAdvGrid;
    ADOQuery2: TADOQuery;
    SmallintField1: TSmallintField;
    SmallintField2: TSmallintField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    WordField3: TWordField;
    WordField4: TWordField;
    StringField10: TStringField;
    SmallintField3: TSmallintField;
    IntegerField19: TIntegerField;
    IntegerField20: TIntegerField;
    IntegerField21: TIntegerField;
    SmallintField4: TSmallintField;
    IntegerField22: TIntegerField;
    SmallintField5: TSmallintField;
    IntegerField23: TIntegerField;
    SmallintField6: TSmallintField;
    IntegerField24: TIntegerField;
    IntegerField25: TIntegerField;
    SmallintField7: TSmallintField;
    IntegerField26: TIntegerField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    ADOQuery3: TADOQuery;
    StringField16: TStringField;
    StringField17: TStringField;
    SmallintField8: TSmallintField;
    IntegerField27: TIntegerField;
    IntegerField28: TIntegerField;
    IntegerField29: TIntegerField;
    IntegerField30: TIntegerField;
    IntegerField31: TIntegerField;
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
  i, j, nRowCnt, nUnitNo, nUnitNo2 : Integer;
begin
  try
    btnExcel.Enabled := false;
    edtTotCash.Text:= '0';
    edtTotCashAmt.Text:= '0';
    edtTotCard.Text:= '0';
    edtTotCardAmt.Text:= '0';

    sCDate:= FormatDateTime('YYYY-MM-DD', edtPDate.Date); //??????
    StartProgress('???????????? ??????...', '????????????.  ???? ????????????!', 100);
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

        with qryTKProcClosing2 do
        begin
          Close;
          SQL.Clear;
          SQL.Add(' select sum(ProcCnt) as ProcCnt, sum(ProcFee) as ProcFee, sum(DCCnt) as DCCnt, sum(ProcRealFee) as ProcRealFee, ');
          SQL.Add(' sum(ProcDC) as ProcDC, ');
          SQL.Add(' sum(CONVERT(INT, Reserve2)) as Reserve2, sum(CONVERT(INT, Reserve4)) as Reserve4, ');
          SQL.Add(' sum(LostCnt) as LostCnt, sum(LostAmt) as LostAmt, sum(GT1Cnt) as GT1Cnt  ');
          SQL.Add(' from TKProcClosing   ');
          SQL.Add(' where ProcDate = :N1 ');
          Parameters.ParamByName('N1').Value:= sCDate;
          Open;
        end;

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

    with qryFeeItemClosing2 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select ProcDate, FeeNo, Sum(FeeCnt), Sum(FeeAmt), ');
      SQL.Add(' (select Count(*) from TKProc where PayType=1 and ProcDate = :N1 and FeeNo=0) as CountCash,        ');
			SQL.Add(' (select sum(RealFee) from TKProc where PayType=1 and ProcDate = :N2 and FeeNo=0) as CountCashAmt, ');
			SQL.Add(' (select Count(*) from TKProc where PayType=2 and ProcDate = :N3 and FeeNo=0) as CountCredit,      ');
			SQL.Add(' (select sum(RealFee) from TKProc where PayType=2 and ProcDate = :N4 and FeeNo=0) as CountCreditAmt ');
      SQL.Add('from FeeDetail ');
      SQL.Add('where ProcDate = :N5 and FeeNo = 0 ');
      SQL.Add('Group By ProcDate, FeeNo ');
      SQL.Add('Order By ProcDate, FeeNo');
      Parameters.ParamByName('N1').Value:= sCDate;
      Parameters.ParamByName('N2').Value:= sCDate;
      Parameters.ParamByName('N3').Value:= sCDate;
      Parameters.ParamByName('N4').Value:= sCDate;
      Parameters.ParamByName('N5').Value:= sCDate;
      Open;
    end;

    with qryFeeItemClosing3 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select ProcDate, FeeNo, Sum(FeeCnt), Sum(FeeAmt), ');
      SQL.Add(' (select Count(*) from TKProc where PayType=1 and ProcDate = :N1 and FeeNo=2) as CountCash,        ');
			SQL.Add(' (select sum(RealFee) from TKProc where PayType=1 and ProcDate = :N2 and FeeNo=2) as CountCashAmt, ');
			SQL.Add(' (select Count(*) from TKProc where PayType=2 and ProcDate = :N3 and FeeNo=2) as CountCredit,      ');
			SQL.Add(' (select sum(RealFee) from TKProc where PayType=2 and ProcDate = :N4 and FeeNo=2) as CountCreditAmt ');
      SQL.Add('from FeeDetail ');
      SQL.Add('where ProcDate = :N5 and FeeNo = 2 ');
      SQL.Add('Group By ProcDate, FeeNo ');
      SQL.Add('Order By ProcDate, FeeNo');
      Parameters.ParamByName('N1').Value:= sCDate;
      Parameters.ParamByName('N2').Value:= sCDate;
      Parameters.ParamByName('N3').Value:= sCDate;
      Parameters.ParamByName('N4').Value:= sCDate;
      Parameters.ParamByName('N5').Value:= sCDate;
      Open;
    end;

    with qryFeeItemClosing4 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select ProcDate, Sum(FeeCnt), Sum(FeeAmt), ');
      SQL.Add(' (select Count(*) from TKProc where PayType=1 and ProcDate = :N1) as CountCash,        ');
			SQL.Add(' (select sum(RealFee) from TKProc where PayType=1 and ProcDate = :N2) as CountCashAmt, ');
			SQL.Add(' (select Count(*) from TKProc where PayType=2 and ProcDate = :N3) as CountCredit,      ');
			SQL.Add(' (select sum(RealFee) from TKProc where PayType=2 and ProcDate = :N4) as CountCreditAmt ');
      SQL.Add('from FeeDetail ');
      SQL.Add('where ProcDate = :N5 ');
      SQL.Add('Group By ProcDate ');
      SQL.Add('Order By ProcDate ');
      Parameters.ParamByName('N1').Value:= sCDate;
      Parameters.ParamByName('N2').Value:= sCDate;
      Parameters.ParamByName('N3').Value:= sCDate;
      Parameters.ParamByName('N4').Value:= sCDate;
      Parameters.ParamByName('N5').Value:= sCDate;
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
//          Close;  //????????????
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
//          Close;  //??????????????
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
  ModalResult := mrCancel;
  //Close;
end;

procedure TfrmDailyReport.btnExcelClick(Sender: TObject);
{begin
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
    on E: Exception do ExceptLogging('TfrmDailyReport.btnExcelClick: ' + E.Message);
  end;
end;}
var
  ExcelObj : OleVariant;
  WorkBook : OleVariant;
  WorkSheet : OleVariant;
  sSDate, sEDate, sSTime, sETime, sCDate: String;
  i : Integer;
begin

   Try
      sCDate:= FormatDateTime('YYYY-MM-DD', edtPDate.Date); //??????
      ExcelObj := CreateOLEObject('Excel.Application');
   Except
      MessageDlg('Excel?? ???????? ???? ????????.', MtWarning, [mbok], 0);
      Exit;
   end;
   ExcelObj.DisplayAlerts := False;

   WorkBook := ExcelObj.Workbooks.Add; //?????????? ??????????.
   WorkSheet := WorkBook.WorkSheets[1]; //Sheet?? ??????????.
   i := 1;

   WorkSheet.Cells[1, 1].Value := '????????' ;
   WorkSheet.Cells[1, 2].Value := '????????' ;
   WorkSheet.Cells[1, 3].Value := '????????' ;
   WorkSheet.Cells[1, 4].Value := '????????' ;
   WorkSheet.Cells[1, 5].Value := '????????' ;
   WorkSheet.Cells[1, 6].Value := '????????' ;
   WorkSheet.Cells[1, 7].Value := '????????' ;
   WorkSheet.Cells[1, 8].Value := '????????' ;
   WorkSheet.Cells[1, 9].Value := '????????' ;
   WorkSheet.Cells[1, 10].Value := '????????????' ;
   WorkSheet.Cells[1, 11].Value := '????????' ;
   WorkSheet.Cells[1, 12].Value := '????????????' ;
   WorkSheet.Cells[1, 13].Value := '????????' ;
   with ADOQuery2 do
   begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from TKProcClosing where ProcDate = :N1');
      Parameters.ParamByName('N1').Value:= sCDate;
      Open;

      while not eof do
      begin
         //?????? ???????? ??????????.
         WorkSheet.Cells[i + 1, 1].Value :=    FieldByName('UNITNAME').AsString;
         WorkSheet.Cells[i + 1, 2].Value :=    FieldByName('proccnt').AsString;
         WorkSheet.Cells[i + 1, 3].Value :=    FieldByName('procfee').AsString;
         WorkSheet.Cells[i + 1, 4].Value :=    FieldByName('dccnt').AsString;
         WorkSheet.Cells[i + 1, 5].Value :=    FieldByName('procdc').AsString;
         WorkSheet.Cells[i + 1, 6].Value :=    FieldByName('procrealfee').AsString;
         WorkSheet.Cells[i + 1, 7].Value :=    FieldByName('Reserve1').AsString;
         WorkSheet.Cells[i + 1, 8].Value :=    FieldByName('Reserve2').AsString;
         WorkSheet.Cells[i + 1, 9].Value :=    FieldByName('Reserve3').AsString;
         WorkSheet.Cells[i + 1, 10].Value :=    FieldByName('Reserve4').AsString;
         WorkSheet.Cells[i + 1, 11].Value :=    FieldByName('LostCnt').AsString;
         WorkSheet.Cells[i + 1, 12].Value :=    FieldByName('LostAmt').AsString;
         WorkSheet.Cells[i + 1, 13].Value :=    FieldByName('GT1Cnt').AsString;

         inc(i);
         NExt;
      end;
   end;

    i := i + 2;
    WorkSheet.Cells[i, 1].Value := '????????' ;
    WorkSheet.Cells[i, 2].Value := '????????' ;
    WorkSheet.Cells[i, 3].Value := '????' ;

    with ADOQuery1 do
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

      while not eof do
      begin
        WorkSheet.Cells[i + 1, 1].Value :=    FieldByName('FeeNo').AsString;
        WorkSheet.Cells[i + 1, 2].Value :=    FieldByName('COLUMN1').AsString;
        WorkSheet.Cells[i + 1, 3].Value :=    FieldByName('COLUMN2').AsString;
        Inc(i);
        Next;
      end;
    end;

   WorkSheet.Cells.Columns.AutoFit;

   if SaveDialog1.Execute then
   begin
      WorkSheet.SaveAs(SaveDialog1.FileName+'.xls', 1, '', '', False, False);
      showmessage('???? ???? ????');
   end;

  ExcelObj.Quit; //????
  WorkSheet := unAssigned;
  WorkBook := unAssigned;
  ExcelObj := unAssigned;
end;

procedure TfrmDailyReport.btnPrintClick(Sender: TObject);
var
  sTemp: String;
begin
  frxReport1.LoadFromFile(sCurrRunDir + '\Report\Daily.fr3');
  sTemp:= FormatDateTime('YYYY-MM-DD', edtPDate.Date);
  sTemp:= '   ???????? : ' + sTemp;
  frxReport1.Variables['sDate']:= '''' + sTemp + '''';

//  TfrxMemoView(frxReport1.FindObject('memo147')).Text := edtTotCash.Text+'??';
//  TfrxMemoView(frxReport1.FindObject('memo148')).Text := FormatFloat('#,##0', StrToInt(edtTotCashAmt.Text)) +'??';
//  TfrxMemoView(frxReport1.FindObject('memo149')).Text := edtTotCard.Text+'??';
//  TfrxMemoView(frxReport1.FindObject('memo150')).Text := FormatFloat('#,##0', StrToInt(edtTotCardAmt.Text)) +'??';

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
    Text:= '????????'
  else
    Text:= qryFeeItemClosingFeeName.Value;
end;

end.
