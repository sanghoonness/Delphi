unit UnitReport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ComCtrls, AdvProgr,
  frxClass, tmsAdvGridExcel, Data.Win.ADODB, frxDBSet, Vcl.StdCtrls, AdvEdit,
  Vcl.Grids, AdvObj, BaseGrid, AdvGrid, DBAdvGrid, Vcl.Buttons,
  AdvDateTimePicker, Vcl.ExtCtrls;

type
  TfrmUnitReport = class(TForm)
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
    qryReport: TADOQuery;
    qry: TADOQuery;
    AdvGridExcelIO1: TAdvGridExcelIO;
    SaveDialog1: TSaveDialog;
    dsReport: TDataSource;
    frxReport1: TfrxReport;
    qryReportunitname: TStringField;
    qryReportParkMoney: TIntegerField;
    qryReportDiscountMoney: TIntegerField;
    qryReportmoneypay: TIntegerField;
    qryReportcardpay: TIntegerField;
    edtParkMoney: TAdvEdit;
    edtDiscountMoney: TAdvEdit;
    edtHunul: TAdvEdit;
    edtCash: TAdvEdit;
    edtCard: TAdvEdit;
    pnProgress: TPanel;
    Label6: TLabel;
    ap1: TAdvProgress;
    frxDBDataset2: TfrxDBDataset;
    qryReportstartDate: TStringField;
    qryReportendDate: TStringField;
    qryReportendTime: TStringField;
    procedure btnSearchClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUnitReport: TfrmUnitReport;
  nParkMoney, nDCMoney, nHubul, nCash, nCard : Cardinal;

implementation
uses
  Tables, Global;
{$R *.dfm}

procedure TfrmUnitReport.btnCloseClick(Sender: TObject);
begin
  qryReport.Close;
  qry.Close;
  ModalResult := mrCancel;
  //Close;
end;

procedure TfrmUnitReport.btnExcelClick(Sender: TObject);
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
    on E: Exception do ExceptLogging('TfrmWebDCReport.btnExcelClick: ' + E.Message);
  end;
end;

procedure TfrmUnitReport.btnPrintClick(Sender: TObject);
var
  sTemp: String;
begin
  frxReport1.LoadFromFile(sCurrRunDir + '\Report\UnitReport.fr3');

  frxReport1.Variables['nParkMoney']:= nParkMoney;
  frxReport1.Variables['nDCMoney']:= nDCMoney;
  frxReport1.Variables['nCash']:= nCash;
  frxReport1.Variables['nCard']:= nCard;
  frxReport1.ShowReport(True);
end;

procedure TfrmUnitReport.btnSearchClick(Sender: TObject);
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
      SQL.Add(' select (select UnitName from UnitInfo K where K.UnitNo=A.UnitNo) unitname ');
      SQL.Add('    ,ProcFee ParkMoney  ');
      SQL.Add('    ,ProcDc DiscountMoney ');
      SQL.Add('    ,convert(INT,Reserve2)  moneypay');
      SQL.Add('    ,convert(INT,Reserve4) cardpay');
      sql.Add(',CDate startDate,ProcDate endDate,ProcTime endTime ');
      SQL.Add(' from   TKProcClosing A  ');
      SQL.Add(' where A.ProcDate between :pDate1 and :pDate2     ');
      SQL.Add(' order by UnitNo, CDate, ProcDate, ProcTime  ');
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
      SQL.Add('  select SUM(ProcFee) ParkMoney  ');
      SQL.Add('      ,SUM(ProcDc) DiscountMoney  ');
      SQL.Add('          ,SUM(Convert(int,Reserve2))  moneypay ');
      SQL.Add('    ,SUM(Convert(int,Reserve4)) cardpay ');
      SQL.Add('    from   TKProcClosing A   ');

      SQL.Add(' where A.ProcDate between :pDate1 and :pDate2   -- ????????  ');

      Parameters.ParamByName('pDate1').Value  := sSDate;
      Parameters.ParamByName('pDate2').Value  := sEDate;
      Open;

      if RecordCount > 0 then
      begin
        nParkMoney :=  FieldByName('ParkMoney').AsInteger;
        nDCMoney  := FieldByName('DiscountMoney').AsInteger;

        nCash := FieldByName('moneypay').AsInteger;
        nCard := FieldByName('cardpay').AsInteger;

        edtParkMoney.Text := FieldByName('ParkMoney').AsString;
        edtDiscountMoney.Text := FieldByName('DiscountMoney').AsString;

        edtCash.Text := FieldByName('moneypay').AsString;
        edtCard.Text := FieldByName('cardpay').AsString;
      end;
    end;
  except
    on E: Exception do ExceptLogging('TfrmUnitReport.btnSearchClick: ' + E.Message);
  end;
end;

procedure TfrmUnitReport.FormShow(Sender: TObject);
begin
  edtSDate.Date:= Now;
  edtEDate.Date:= Now;
  qryReport.Close;
end;

end.
