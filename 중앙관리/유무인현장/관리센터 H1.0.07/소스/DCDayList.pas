unit DCDayList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.Buttons, AdvEdit, Vcl.ComCtrls, AdvDateTimePicker, AdvCombo, Vcl.ExtCtrls,
  Vcl.Grids, AdvObj, BaseGrid, AdvGrid, DBAdvGrid, frxClass, frxDBSet,
  tmsAdvGridExcel, Vcl.Mask, AdvSpin;

type
  TfrmDCDayList = class(TForm)
    dgDCDay: TDBAdvGrid;
    Panel1: TPanel;
    Label4: TLabel;
    cmbStore: TAdvComboBox;
    edtSDate: TAdvDateTimePicker;
    edtEDate: TAdvDateTimePicker;
    btnSearch: TBitBtn;
    btnPrint: TBitBtn;
    btnExcel: TBitBtn;
    btnClose: TBitBtn;
    dsDCDay: TDataSource;
    qryDCDay: TADOQuery;
    qryDCDayStoreName: TStringField;
    qryDCDayCarNumber: TStringField;
    qryDCDayRealDcDay: TIntegerField;
    edtDCDay: TAdvSpinEdit;
    SaveDialog1: TSaveDialog;
    AdvGridExcelIO1: TAdvGridExcelIO;
    frxReport1: TfrxReport;
    fDCDay: TfrxDBDataset;
    qryTemp: TADOQuery;
    procedure FormShow(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDCDayList: TfrmDCDayList;

implementation
uses
  Global, Tables;
{$R *.dfm}

procedure TfrmDCDayList.btnCloseClick(Sender: TObject);
begin
  qryDCDay.Close;
  qryTemp.Close;
  Close;
end;

procedure TfrmDCDayList.btnExcelClick(Sender: TObject);
begin
  try
    if savedialog1.Execute then
    begin
      advgridexcelio1.XLSExport(savedialog1.filename + '.xls');
      ShowMessage('???????Ϸ? ?????Ϸ?!');
    end;
  except
    on E: Exception do ExceptLogging('TfrmDCDayList.btnExcelClick: ' + E.Message);
  end;
end;

procedure TfrmDCDayList.btnPrintClick(Sender: TObject);
var
  sSDate, sEDate, sSTime, sETime: String;
  sTemp: String;
begin
  sSDate:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
  sEDate:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);

  frxReport1.LoadFromFile(sCurrRunDir + '\Report\DCDay.fr3');
  sTemp := sSDate + ' ' + sSTime+ ' ~ ' + sEDate + ' ' + sETime;
  sTemp:= ' ?????Ⱓ: ' + sTemp;
  frxReport1.Variables['sDate']:= '''' + sTemp + '''';
  frxReport1.ShowReport(True);
end;

procedure TfrmDCDayList.btnSearchClick(Sender: TObject);
var
  sSDate, sEDate, sSTime, sETime: String;
begin
  try
    sSDate:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
    sEDate:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);

    with qryDCDay do
    begin
      Close;
      SQL.Clear;
      SQL.Add(' select * from (  ');
      SQL.Add(' select SUMK.StoreName StoreName, SUMK.CarNumber  ');
      SQL.Add(' ,SUM(SUMK.RealDcDay) RealDcDay   ');
      SQL.Add(' from(    ');
      SQL.Add(' select A.StoreName StoreName,A.CarNumber CarNumber,B.RealDcDay RealDcDay,B.RealDcMin RealDcMin   ');
      SQL.Add(' from(    ');
      SQL.Add(' select StoreName,CarNumber,InYMD,InHMS,OutYmd,OutHms  ');
      SQL.Add(' ,DiscountName,NorKey,DiscountCode ,Reserve4, Reserve5    ');
      SQL.Add(' from tblStoreDiscountPublish ');
      SQL.Add(' where (OutYmd between :pSDate1 and :pEDate1)  ');

      if cmbStore.ItemIndex > 0 then
        SQL.Add(' and StoreName = :pStoreName ');

      SQL.Add(' and DelYn=0  ');
      SQL.Add(' ) A ');
      SQL.Add(' ,(  select DCNo,TKNo,CarNo,Reserve1,ProcDate,ProcTime,RealDcDay,RealDcMin  ');
      SQL.Add(' from DCDetail ');
      SQL.Add(' where (ProcDate between  :pSDate2 and :pEDate2)  ');
      SQL.Add(' ) B  ');
      SQL.Add(' where A.NorKey = B.TKNo   ');
      SQL.Add(' and A.Reserve5 = B.Reserve1  ');
      SQL.Add(' and A.OutYmd = B.ProcDate ');
      SQL.Add(' and A.OutHms = B.ProcTime  ');
      SQL.Add(' ) SUMK');
      SQL.Add(' Group by SUMK.StoreName,SUMK.CarNumber  ');
      SQL.Add('  ) K   ');
      SQL.Add('  where k.RealDcDay >= :pDCDay ');
      Parameters.ParamByName('pSDate1').Value := sSDate;
      Parameters.ParamByName('pEDate1').Value := sEDate;
      Parameters.ParamByName('pSDate2').Value := sSDate;
      Parameters.ParamByName('pEDate2').Value := sEDate;
      Parameters.ParamByName('pDCDay').Value := edtDCDay.Value;

      if cmbStore.ItemIndex > 0 then
        Parameters.ParamByName('pStoreName').Value := cmbStore.Text;

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

  except
    on E: Exception do ExceptLogging('TfrmDCDayList.btnSearchClick: ' + E.Message);
  end;
end;

procedure TfrmDCDayList.FormShow(Sender: TObject);
begin
  try
    edtSDate.Date:= Now;
    edtEDate.Date:= Now;

    // ??ü ??ȸ
    with qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add(' select * from tblstore order by storename ');
      open;

      cmbStore.Items.Add('??ü');
      if RecordCount > 0 then
      begin
        while not Eof do
        begin
          cmbStore.Items.Add(FieldByName('StoreName').AsString);

          next;
        end;
      end;

      cmbStore.ItemIndex := 0;

    end;
  except
    on E: Exception do ExceptLogging('TfrmDCDayList.FormShow: ' + E.Message);
  end;
end;

end.
