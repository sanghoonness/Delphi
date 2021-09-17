unit DClosingReport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ComCtrls, AdvProgr,
  tmsAdvGridExcel, Data.Win.ADODB, frxClass, frxDBSet, Vcl.StdCtrls, AdvEdit,
  Vcl.Grids, AdvObj, BaseGrid, AdvGrid, DBAdvGrid, Vcl.Buttons,
  AdvDateTimePicker, Vcl.ExtCtrls;

type
  TfrmDClosingReport = class(TForm)
    Panel1: TPanel;
    Label4: TLabel;
    edtSDate: TAdvDateTimePicker;
    edtEDate: TAdvDateTimePicker;
    btnSearch: TBitBtn;
    btnExcel: TBitBtn;
    btnPrint: TBitBtn;
    btnClose: TBitBtn;
    Panel2: TPanel;
    DBAdvGrid1: TDBAdvGrid;
    Panel3: TPanel;
    edtParkMoney: TAdvEdit;
    edtDiscountMoney: TAdvEdit;
    edtHunul: TAdvEdit;
    edtCash: TAdvEdit;
    edtCard: TAdvEdit;
    frxReport1: TfrxReport;
    dsReport: TDataSource;
    qryReport: TADOQuery;
    qry: TADOQuery;
    AdvGridExcelIO1: TAdvGridExcelIO;
    SaveDialog1: TSaveDialog;
    pnProgress: TPanel;
    Label6: TLabel;
    ap1: TAdvProgress;
    qryReportUNITNAME: TStringField;
    qryReportCarNo: TStringField;
    qryReportInDate: TStringField;
    qryReportInTime: TStringField;
    qryReportProcDate: TStringField;
    qryReportProcTime: TStringField;
    qryReportTotFee: TIntegerField;
    qryReportTotDC: TIntegerField;
    qryReportHUBULMONEY: TIntegerField;
    qryReportmoneypay: TIntegerField;
    qryReportcardpay: TIntegerField;
    frxDBDataset1: TfrxDBDataset;
    qryReportstartDate: TStringField;
    qryReportstartTime: TStringField;
    qryReportendDate: TStringField;
    qryReportendTime: TStringField;
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDClosingReport: TfrmDClosingReport;
  nParkMoney, nDCMoney, nHubul, nCash, nCard : Cardinal;
implementation
uses
  Tables, Global;
{$R *.dfm}

procedure TfrmDClosingReport.btnCloseClick(Sender: TObject);
begin
  qryReport.Close;
  qry.Close;
  Close;
end;

procedure TfrmDClosingReport.btnExcelClick(Sender: TObject);
begin
  try
    if savedialog1.Execute then
    begin
      pnProgress.Visible:= True;
      Refresh;
      AdvGridExcelIO1.XLSExport(savedialog1.filename + '.xls');
      pnProgress.Visible:= False;
      ShowMessage('¿¢¼¿ÆÄÀÏ·Î ÀúÀå¿Ï·á!');
    end;
  except
    on E: Exception do ExceptLogging('TfrmDClosingReport.btnExcelClick: ' + E.Message);
  end;
end;

procedure TfrmDClosingReport.btnPrintClick(Sender: TObject);
var
  sTemp: String;
begin
  frxReport1.LoadFromFile(sCurrRunDir + '\Report\DayReport.fr3');

  frxReport1.Variables['nParkMoney']:= nParkMoney;
  frxReport1.Variables['nDCMoney']:= nDCMoney;
  frxReport1.Variables['nHubul']:= nHubul;
  frxReport1.Variables['nCash']:= nCash;
  frxReport1.Variables['nCard']:= nCard;
  frxReport1.ShowReport(True);
end;


procedure TfrmDClosingReport.btnSearchClick(Sender: TObject);
var
  sSDate, sEDate: String;
begin
  sSDate := FormatDateTime('YYYY-MM-DD', edtSDate.Date);
  sEDate := FormatDateTime('YYYY-MM-DD', edtEDate.Date);

  try
    with qryReport do
    begin
      Close;
      SQL.Clear;
      SQL.Add(' select (select unitname from UnitInfo K where K.UnitNo= A.UnitNo) UNITNAME  ');
      SQL.Add(' , A.CarNo, A.InDate, A.InTime, A.ProcDate, A.ProcTime, A.TotFee, A.TotDC ');
      SQL.Add(' , 0 HUBULMONEY  ');
      SQL.Add(' , case when PayType=1 then RecvAmt else 0 end moneypay  ');
      SQL.Add(' , case when PayType=2 then RecvAmt else 0 end cardpay  ');
      SQL.Add(' , Reserve6 endDate ,Reserve7 endTime , Reserve9 startDate, Reserve10 startTime');
      SQL.Add(' from   ');
      SQL.Add(' TKProc A');
      SQL.Add(' where A.Reserve6 between :pDate1 and :pDate2 and ChkClosing=1 ');
      SQL.Add(' order by ProcDate,ProcTime ');
      Parameters.ParamByName('pDate1').Value  := sSDate;
      Parameters.ParamByName('pDate2').Value  := sEDate;
      Open;

      if RecordCount > 0 then
      begin
        btnExcel.Enabled := True;
        btnPrint.Enabled := True;
      end
      else
      begin
        btnExcel.Enabled := False;
        btnPrint.Enabled := False;
      end;

    end;

    with qry do
    begin
      Close;
      SQL.Clear;
      SQL.Add(' select SUM(totfee) totfee, SUM(totdc) totdc, 0 hubulmoney, SUM(moneypay) moneypay, SUM(cardpay) cardpay from (  ');
      SQL.Add(' select  A.TotFee, A.TotDC ');
      SQL.Add(' , 0 HUBULMONEY  ');
      SQL.Add(' , case when PayType=1 then RecvAmt else 0 end moneypay  ');
      SQL.Add(' , case when PayType=2 then RecvAmt else 0 end cardpay  ');
      SQL.Add(' from   ');
      SQL.Add(' 	TKProc A');
      SQL.Add(' where A.Reserve6 between :pDate1 and :pDate2 and ChkClosing=1 ');
      SQL.Add(' ) C ');
      Parameters.ParamByName('pDate1').Value  := sSDate;
      Parameters.ParamByName('pDate2').Value  := sEDate;
      Open;

      if RecordCount > 0 then
      begin
        nParkMoney :=  FieldByName('totfee').AsInteger;
        nDCMoney  := FieldByName('totdc').AsInteger;
        nHubul := FieldByName('hubulmoney').AsInteger;
        nCash := FieldByName('moneypay').AsInteger;
        nCard := FieldByName('cardpay').AsInteger;

        edtParkMoney.Text := FieldByName('totfee').AsString;
        edtDiscountMoney.Text := FieldByName('totdc').AsString;
        edtHunul.Text := FieldByName('HubulMoney').AsString;
        edtCash.Text := FieldByName('moneypay').AsString;
        edtCard.Text := FieldByName('cardpay').AsString;
      end;
    end;
  except
    on E: Exception do ExceptLogging('TfrmUnitReport.btnSearchClick: ' + E.Message);
  end;
end;

procedure TfrmDClosingReport.FormShow(Sender: TObject);
begin
  edtSDate.Date:= Now;
  edtEDate.Date:= Now;
end;

end.
