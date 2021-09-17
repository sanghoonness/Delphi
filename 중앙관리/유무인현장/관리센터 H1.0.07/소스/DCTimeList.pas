unit DCTimeList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Grids, AdvObj,
  BaseGrid, AdvGrid, DBAdvGrid, Vcl.StdCtrls, Vcl.Buttons, AdvEdit,
  Vcl.ComCtrls, AdvDateTimePicker, AdvCombo, Data.DB, Data.Win.ADODB, Vcl.Mask,
  AdvSpin, tmsAdvGridExcel, frxClass, frxDBSet;

type
  TfrmDCTimeList = class(TForm)
    dgDCTime: TDBAdvGrid;
    Panel1: TPanel;
    cmbStore: TAdvComboBox;
    edtSDate: TAdvDateTimePicker;
    Label4: TLabel;
    edtEDate: TAdvDateTimePicker;
    btnSearch: TBitBtn;
    btnPrint: TBitBtn;
    btnExcel: TBitBtn;
    btnClose: TBitBtn;
    dsDCTime: TDataSource;
    qryDCTime: TADOQuery;
    qryDCTimeStoreName: TStringField;
    qryDCTimeRealDcMin: TIntegerField;
    qryDCTimeRealDcTIME: TIntegerField;
    qryTemp: TADOQuery;
    edtDCTime: TAdvSpinEdit;
    AdvGridExcelIO1: TAdvGridExcelIO;
    SaveDialog1: TSaveDialog;
    fDCTime: TfrxDBDataset;
    frxReport1: TfrxReport;
    procedure FormShow(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDCTimeList: TfrmDCTimeList;

implementation
uses
  Global, Tables;
{$R *.dfm}

procedure TfrmDCTimeList.btnCloseClick(Sender: TObject);
begin
  qryDCTime.Close;
  qryTemp.Close;
  Close;
end;

procedure TfrmDCTimeList.btnExcelClick(Sender: TObject);
begin
  try
    if savedialog1.Execute then
    begin
      advgridexcelio1.XLSExport(savedialog1.filename + '.xls');
      ShowMessage('엑셀파일로 저장완료!');
    end;
  except
    on E: Exception do ExceptLogging('TfrmDCTimeList.btnExcelClick: ' + E.Message);
  end;
end;

procedure TfrmDCTimeList.btnPrintClick(Sender: TObject);
var
  sSDate, sEDate, sSTime, sETime: String;
  sTemp: String;
begin
  sSDate:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
  sEDate:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);

  frxReport1.LoadFromFile(sCurrRunDir + '\Report\DCTime.fr3');
  sTemp := sSDate + ' ' + sSTime+ ' ~ ' + sEDate + ' ' + sETime;
  sTemp:= ' 집계기간: ' + sTemp;
  frxReport1.Variables['sDate']:= '''' + sTemp + '''';
  frxReport1.ShowReport(True);
end;

procedure TfrmDCTimeList.btnSearchClick(Sender: TObject);
var
  sSDate, sEDate, sSTime, sETime: String;
begin
  try
    sSDate:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
    sEDate:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);

    with qryDCTime do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from (  ');
      SQL.Add('select SUMK.StoreName StoreName, SUM(SUMK.RealDcMin) RealDcMin  ,(SUM(SUMK.RealDcMin)+59)/60 RealDcTIME ');
      SQL.Add('from(      ');
      SQL.Add('select A.StoreName StoreName,A.CarNumber CarNumber,B.RealDcDay RealDcDay,B.RealDcMin RealDcMin    ');
      SQL.Add('from(      ');
      SQL.Add('select StoreName,CarNumber,InYMD,InHMS,OutYmd,OutHms  ,DiscountName,NorKey,DiscountCode,Reserve4, Reserve5  ');
      SQL.Add('from tblStoreDiscountPublish ');
      SQL.Add('where (OutYmd between :pSDate1 and :pEDate1) ');

      if cmbStore.ItemIndex > 0 then
        SQL.Add(' and StoreName = :pStoreName ');

      SQL.Add('and DelYn=0     ) A   ');
      SQL.Add(',  (    select DCNo,TKNo,CarNo ,Reserve1,ProcDate,ProcTime,RealDcDay,RealDcMin  from DCDetail  ');
      SQL.Add('where (ProcDate between :pSDate2 and :pEDate2)   ) B  ');
      SQL.Add('where A.NorKey = B.TKNo  and A.Reserve5 = B.Reserve1  and A.OutYmd = B.ProcDate ');
      SQL.Add('and A.OutHms = B.ProcTime  ) SUMK  ');
      SQL.Add('Group by SUMK.StoreName ) K  where k.RealDcTIME >= :pDCTime ');
      Parameters.ParamByName('pSDate1').Value := sSDate;
      Parameters.ParamByName('pEDate1').Value := sEDate;
      Parameters.ParamByName('pSDate2').Value := sSDate;
      Parameters.ParamByName('pEDate2').Value := sEDate;
      Parameters.ParamByName('pDCTime').Value := edtDCTime.Value;

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
    on E: Exception do ExceptLogging('TfrmDCTimeList.btnSearchClick: ' + E.Message);
  end;
end;

procedure TfrmDCTimeList.FormShow(Sender: TObject);
begin
  try
    edtSDate.Date:= Now;
    edtEDate.Date:= Now;

    // 업체 조회
    with qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add(' select * from tblstore order by storename ');
      open;

      cmbStore.Items.Add('전체');
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
    on E: Exception do ExceptLogging('TfrmDCTimeList.FormShow: ' + E.Message);
  end;
end;

end.
