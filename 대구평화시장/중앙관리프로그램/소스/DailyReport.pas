unit DailyReport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxClass, frxDBSet, Data.DB,
  Data.Win.ADODB, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, AdvEdit,
  Vcl.ExtCtrls, AdvPanel, Vcl.Grids, AdvObj, BaseGrid, AdvGrid, DBAdvGrid,
  AdvPageControl;
//  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
//  Dialogs, ToolWin, ComCtrls, StdCtrls, Buttons, ExtCtrls,
//  ADODB, AdvGrid, DBAdvGrid,
//  AdvSpin, Mask, AdvEdit, AdvCombo, AdvPanel, AdvToolBtn, AdvPageControl,
//  AdvAppStyler, BaseGrid, DB, Grids, frxClass, frxDBSet, frxADOComponents, frxExportXLS;

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
    //frxXLSExport1: TfrxXLSExport;
    qryFeeItemClosing: TADOQuery;
    qryFeeItem: TADOQuery;
    qryFeeItemFeeNo: TWordField;
    qryFeeItemFeeName: TStringField;
    qryFeeItemParkNo: TSmallintField;
    dsFeeItemClosing: TDataSource;
    DBAdvGrid1: TDBAdvGrid;
    fFeeItemClosing: TfrxDBDataset;
    //frxADOComponents1: TfrxADOComponents;
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
    edtHyunAmt: TAdvEdit;
    edtHyunCnt: TAdvEdit;
    Bevel16: TBevel;
    Label16: TLabel;
    edtCreditAmt: TAdvEdit;
    edtCreditCnt: TAdvEdit;
    Bevel17: TBevel;
    Label17: TLabel;
    procedure btnSearchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qryFeeItemClosingFeeNameGetText(Sender: TField; var Text: string; DisplayText: Boolean);
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

    sCDate:= FormatDateTime('YYYY-MM-DD', edtPDate.Date); //??????
    StartProgress('???????????? ??????...', '????????????.  ???? ????????????!', 100);

    with qryTKProcClosing do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from TKProcClosing where cDate = :N1');
      Parameters.ParamByName('N1').Value:= sCDate;
      Open;

      if RecordCount > 0 then
      begin
        with qryTemp do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Select Sum(ProcCnt), Sum(ProcFee), Sum(ProcDC), Sum(ProcRealFee), ');
          SQL.Add('Sum(LostCnt), Sum(LostAmt),  Sum(DamageCnt), Sum(DamageAmt), Sum(DCCnt), Sum(GT1Cnt), ');
          SQL.Add('Sum(TotDCCnt), Sum(convert(int, reserve1)), Sum(convert(int, reserve2)), Sum(convert(int, reserve3)), ');
          SQL.Add('Sum(convert(int, reserve4)) from TKProcClosing Group By CDate Having CDate = :N1');
          Parameters.ParamByName('N1').Value:= sCDate;
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
          edtTotDCCnt .Text:= FieldByName('COLUMN11').AsString;
          edtHyunCnt  .Text := FieldByName('COLUMN12').AsString;
          edtHyunAmt  .Text := FieldByName('COLUMN13').AsString;
          edtCreditCnt.Text := FieldByName('COLUMN14').AsString;
          edtCreditAmt.Text := FieldByName('COLUMN15').AsString;

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
          edtHyunCnt  .AutoThousandSeparator:= True;
          edtHyunAmt  .AutoThousandSeparator:= True;
          edtCreditCnt.AutoThousandSeparator:= True;
          edtCreditAmt.AutoThousandSeparator:= True;
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
      SQL.Add('where CDate = :N1 ');
      SQL.Add('Group By ProcDate, FeeNo ');
      SQL.Add('Order By ProcDate, FeeNo');
      Parameters.ParamByName('N1').Value:= sCDate;
      Open;
    end;
    SetProgress(10);

    with qryIssueClosing do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select IssueDate, MNo, Count(*) nIssue, Sum(IssueUnit), Sum(FValue) from IssueTK ');
      SQL.Add('where IssueDate = :N1 and TKType = 2 Group By IssueDate, MNo');
      Parameters.ParamByName('N1').Value:= sCDate;
      Open;

      if RecordCount > 0 then
      begin
        with qryTemp do
        begin
          Close;  //????????????
          SQL.Clear;
          SQL.Add('Select Count(*), Sum(IssueUnit), Sum(FValue) ');
          SQL.Add('from IssueTK where IssueDate = :N1 and TKType = 2 Group By IssueDate');
          Parameters.ParamByName('N1').Value:= sCDate;
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

    with qryBarClosing do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from BarClosing where CDate = :N1');
      Parameters.ParamByName('N1').Value:= sCDate;
      Open;

      if RecordCount > 0 then
      begin
        with qryTemp do
        begin
          Close;  //??????????????
          SQL.Clear;
          SQL.Add('Select Sum(UpCnt), Sum(DownCnt), Sum(LockCnt), Sum(UnlockCnt) from BarClosing ');
          SQL.Add('Group By CDate Having CDate = :N1');
          Parameters.ParamByName('N1').Value:= sCDate;
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

procedure TfrmDailyReport.btnPrintClick(Sender: TObject);
var
  sTemp: String;
begin
  frxReport1.LoadFromFile(sCurrRunDir + '\Report\Daily.fr3');
  sTemp:= FormatDateTime('YYYY-MM-DD', edtPDate.Date);
  sTemp:= '   ???????? : ' + sTemp;
  frxReport1.Variables['sDate']:= '''' + sTemp + '''';
  frxReport1.ShowReport(True);
end;

procedure TfrmDailyReport.FormShow(Sender: TObject);
begin
  edtPDate.Date:= Now;
  PageControl1.ActivePage:= TabSheet1;
end;

procedure TfrmDailyReport.qryFeeItemClosingFeeNameGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if qryFeeItemClosingFeeNo.Value = 0 then
    Text:= '????????'
  else
    Text:= qryFeeItemClosingFeeName.Value;
end;

end.
