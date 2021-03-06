unit WebDCReport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, tmsAdvGridExcel,
  Data.Win.ADODB, frxClass, frxDBSet, Vcl.StdCtrls, AdvCombo, Vcl.Buttons,
  Vcl.ComCtrls, AdvDateTimePicker, Vcl.Grids, AdvObj, BaseGrid, AdvGrid,
  DBAdvGrid, Vcl.ExtCtrls, AdvEdit, AdvProgr;

type
  TfrmWebDCReport = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBAdvGrid1: TDBAdvGrid;
    edtSDate: TAdvDateTimePicker;
    edtEDate: TAdvDateTimePicker;
    Label4: TLabel;
    btnSearch: TBitBtn;
    btnExcel: TBitBtn;
    btnPrint: TBitBtn;
    btnClose: TBitBtn;
    cmbStore: TAdvComboBox;
    frxReport1: TfrxReport;
    dsWebDC: TDataSource;
    qryWebDC: TADOQuery;
    qry: TADOQuery;
    AdvGridExcelIO1: TAdvGridExcelIO;
    SaveDialog1: TSaveDialog;
    qryWebDCstorename: TStringField;
    qryWebDCdiscountname: TStringField;
    qryWebDCdiscountCount: TIntegerField;
    qryWebDCdiscountMoney: TIntegerField;
    qryWebDChubul: TIntegerField;
    Panel3: TPanel;
    edtTotalCnt: TAdvEdit;
    edtTotalMoney: TAdvEdit;
    edtTotalHubul: TAdvEdit;
    pnProgress: TPanel;
    Label6: TLabel;
    ap1: TAdvProgress;
    frxDBDataset1: TfrxDBDataset;
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWebDCReport: TfrmWebDCReport;
  nTotalCnt, nTotalAmt1, nTotalAmt2 : Cardinal;

implementation
uses
  Tables, Global;
{$R *.dfm}

procedure TfrmWebDCReport.btnCloseClick(Sender: TObject);
begin
  qry.Close;
  qryWebDC.Close;
  ModalResult := mrCancel;
  //Close;
end;

procedure TfrmWebDCReport.btnExcelClick(Sender: TObject);
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

procedure TfrmWebDCReport.btnPrintClick(Sender: TObject);
var
  sTemp: String;
begin
  frxReport1.LoadFromFile(sCurrRunDir + '\Report\WebReport.fr3');

  frxReport1.Variables['nTotalCnt']:= nTotalCnt;
  frxReport1.Variables['nTotalAmt1']:= nTotalAmt1;
  frxReport1.Variables['nTotalAmt2']:= nTotalAmt2;
  frxReport1.ShowReport(True);
end;

procedure TfrmWebDCReport.btnSearchClick(Sender: TObject);
var
  sSDate, sEDate: String;
begin
  sSDate := FormatDateTime('YYYY-MM-DD', edtSDate.Date);
  sEDate := FormatDateTime('YYYY-MM-DD', edtEDate.Date);


  try
    with qryWebDC do
    begin
      Close;
      SQL.Clear;
      SQL.Add(' select F.storename,F.discountname,count(*) discountCount ');
      SQL.Add(' ,SUM(F.DcAmt) discountMoney,sum(F.hubulmoney) hubul  ');
      SQL.Add(' from   ');
      SQL.Add(' (select B.StoreName,A.Reserve5 discountname,A.DCAmt,CONVERT(int, B.Reserve7) DCMONEY, CONVERT(int, B.Reserve6) HUBULMONEY ');
      SQL.Add(' from DCDetail A left outer join   ');
      SQL.Add(' tblStoreDiscountPublish B   ');
      SQL.Add(' on A.TKNo =B.NorKey And A.Reserve1=B.Reserve5  ');
      SQL.Add(' where A.Reserve7 Between :pDate1 and :pDate2 ');
      if cmbStore.ItemIndex > 0 then
        SQL.Add(' and storename = :pStoreName ');
      SQL.Add(' ) F -- ???????? ');
      SQL.Add(' group by F.StoreName,F.DiscountName     ');

      if cmbStore.ItemIndex > 0 then
        Parameters.ParamByName('pStoreName').Value := cmbStore.Text;
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
      SQL.Add(' select SUM(discountCount) totalCnt, SUM(discountMoney) totelMoney, SUM(hubul) totalHubul from ( ');
      SQL.Add(' select F.storename,F.discountname,count(*) discountCount ');
      SQL.Add(' ,SUM(F.DcAmt) discountMoney,sum(F.hubulmoney) hubul  ');
      SQL.Add(' from   ');
      SQL.Add(' (select B.StoreName,A.Reserve5 discountname,A.DCAmt,CONVERT(int, B.Reserve7) DCMONEY, CONVERT(int, B.Reserve6) HUBULMONEY  ');
      SQL.Add(' from DCDetail A left outer join   ');
      SQL.Add(' tblStoreDiscountPublish B   ');
      SQL.Add(' on A.TKNo =B.NorKey And A.Reserve1=B.Reserve5  ');
      SQL.Add(' where A.Reserve7 Between :pDate1 and :pDate2 ');
      if cmbStore.ItemIndex > 0 then
        SQL.Add(' and storename = :pStoreName ');
      SQL.Add(' ) F -- ???????? ');
      SQL.Add(' group by F.StoreName,F.DiscountName     ');
      SQL.Add(' ) C ');

      if cmbStore.ItemIndex > 0 then
        Parameters.ParamByName('pStoreName').Value := cmbStore.Text;
      Parameters.ParamByName('pDate1').Value  := sSDate;
      Parameters.ParamByName('pDate2').Value  := sEDate;
      Open;

      if RecordCount > 0 then
      begin
        nTotalCnt := FieldByName('totalCnt').AsInteger;
        nTotalAmt1 := FieldByName('totelMoney').AsInteger;
        nTotalAmt2 := FieldByName('totalHubul').AsInteger;
        edtTotalCnt.Text := FieldByName('totalCnt').AsString;
        edtTotalMoney.Text := FieldByName('totelMoney').AsString;
        edtTotalHubul.Text := FieldByName('totalHubul').AsString;
      end;
   end;


  except
    on E: Exception do ExceptLogging('TfrmWebDCList.btnSearchClick: ' + E.Message);
  end;
end;

procedure TfrmWebDCReport.FormShow(Sender: TObject);
begin
  edtSDate.Date:= Now;
  edtEDate.Date:= Now;

  try
    with qry do
    begin
      Close;
      SQL.Clear;
      SQL.Add(' select * from tblStore ');
      SQL.Add(' order by StoreName ');
      Open;

      if RecordCount > 0 then
      begin
        cmbStore.Items.Add('????');

        while not Eof do
        begin
          cmbStore.Items.Add(FieldByName('StoreName').AsString);
          next;
        end;

        cmbStore.ItemIndex := 0;
      end;
    end;
  except
    on E: Exception do ExceptLogging('TfrmDCReport.FormShow: ' + E.Message);
  end;
end;

end.
