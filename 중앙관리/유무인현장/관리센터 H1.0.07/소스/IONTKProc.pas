unit IONTKProc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  AdvDateTimePicker, Vcl.ExtCtrls, Vcl.Grids, AdvObj, BaseGrid, AdvGrid,
  DBAdvGrid, frxClass, frxDBSet, Data.DB, Data.Win.ADODB, AdvEdit,
  tmsAdvGridExcel, AdvProgr, AdvCombo;

type
  TfrmIONTKProc = class(TForm)
    Panel1: TPanel;
    Label7: TLabel;
    edtSDate: TAdvDateTimePicker;
    edtSTime: TAdvDateTimePicker;
    edtEDate: TAdvDateTimePicker;
    edtETime: TAdvDateTimePicker;
    btnSearch: TBitBtn;
    btnClose: TBitBtn;
    btnPrint: TBitBtn;
    btnExcel: TBitBtn;
    qryTKProc: TADOQuery;
    dsTKProc: TDataSource;
    fTKProc: TfrxDBDataset;
    frxReport1: TfrxReport;
    Panel2: TPanel;
    DBAdvGrid1: TDBAdvGrid;
    Panel3: TPanel;
    edtParkMoney: TAdvEdit;
    qryTemp: TADOQuery;
    edtDisCount: TAdvEdit;
    edtHuBul: TAdvEdit;
    edtPayCard: TAdvEdit;
    edtPayJunSan: TAdvEdit;
    edtPayMoney: TAdvEdit;
    edtCarNo: TAdvEdit;
    edtTotalCount: TAdvEdit;
    pnProgress: TPanel;
    Label6: TLabel;
    ap1: TAdvProgress;
    AdvGridExcelIO1: TAdvGridExcelIO;
    SaveDialog1: TSaveDialog;
    cmbMode: TAdvComboBox;
    qryTKProcUNITNAME: TStringField;
    qryTKProcCarNo: TStringField;
    qryTKProcInDate: TStringField;
    qryTKProcInTime: TStringField;
    qryTKProcProcDate: TStringField;
    qryTKProcProcTime: TStringField;
    qryTKProcTotFee: TIntegerField;
    qryTKProcTotDC: TIntegerField;
    qryTKProcHUBULMONEY: TIntegerField;
    qryTKProcmoneypay: TIntegerField;
    qryTKProccardpay: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIONTKProc: TfrmIONTKProc;
  nTotalCount, nParkMoney, nDiscount, nHubul, nPayCard, nPayMoney, nPayJunsan : Cardinal;

implementation
uses
  Global, Tables;
{$R *.dfm}

procedure TfrmIONTKProc.btnCloseClick(Sender: TObject);
begin
  qryTKProc.Close;
  qryTemp.Close;
  ModalResult := mrCancel;
  //Close;
end;

procedure TfrmIONTKProc.btnExcelClick(Sender: TObject);
begin
  try
    if savedialog1.Execute then
    begin
      pnProgress.Visible:= True;
      Refresh;
      advgridexcelio1.XLSExport(savedialog1.filename + '.xls');
      pnProgress.Visible:= False;
      ShowMessage('?????????? ????????!');
    end;
  except
    on E: Exception do ExceptLogging('TfrmIONTKProc.btnExcelClick: ' + E.Message);
  end;
end;

procedure TfrmIONTKProc.btnPrintClick(Sender: TObject);
var
  sSDate, sEDate, sSTime, sETime: String;
  sTemp: String;
begin
  sSDate:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
  sEDate:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
  sSTime:= FormatDateTime('HH:NN:SS', edtSTime.Time);
  sETime:= FormatDateTime('HH:NN:SS', edtETime.Time);

  frxReport1.LoadFromFile(sCurrRunDir + '\Report\TKProc.fr3');
  sTemp := sSDate + ' ' + sSTime+ ' ~ ' + sEDate + ' ' + sETime;
  sTemp:= ' ????????: ' + sTemp;
  frxReport1.Variables['sDate']:= '''' + sTemp + '''';
  frxReport1.Variables['nTotalCount']:= nTotalCount;
  frxReport1.Variables['nParkMoney']:= nParkMoney;
  frxReport1.Variables['nDisCount']:= nDiscount;
  frxReport1.Variables['nHubul']:= nHubul;
  frxReport1.Variables['nPayCard']:= nPayCard;
  frxReport1.Variables['nPayMoney']:= nPayMoney;
  frxReport1.ShowReport(True);
end;

procedure TfrmIONTKProc.btnSearchClick(Sender: TObject);
var
  sSDate, sEDate, sSTime, sETime: String;
  nSIn, nSMiIn, nSOut, nSMi: Integer;
begin
  try
    sSDate:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
    sEDate:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
    sSTime:= FormatDateTime('HH:NN:SS', edtSTime.Time);
    sETime:= FormatDateTime('HH:NN:SS', edtETime.Time);

    nParkMoney := 0;
    nDiscount := 0;
    nHubul := 0;
    nPayCard := 0;
    nPayMoney := 0;
    nPayJunsan := 0;

    with qryTKProc do
    begin
      Close;
      SQL.Clear;
   //   SQL.Add('  select (select unitname from UnitInfo K where K.UnitNo= A.UnitNo) UNITNAME  ');
    //  SQL.Add('  , A.CarNo, A.InDate, A.InTime, A.ProcDate ,A.ProcTime, A.TotFee,A.TotDC ');
    //  SQL.Add('  , case when B.HUBULMONEY IS null then 0 else B.HUBULMONEY end HUBULMONEY  ');
    //  SQL.Add('  , case when PayType=1 then RecvAmt else 0 end moneypay ');
    //  SQL.Add('  , case when PayType=2 then RecvAmt else 0 end cardpay  ');
    //  SQL.Add('  from ');
    //  SQL.Add('  TKProc A left outer join  ');
    //  SQL.Add('  (select UnitNo,TKNo,ProcDate,ProcTime,ChkClosing,sum(RealDCAmt) DCAMT, sum(CONVERT(int, Reserve6)) HUBULMONEY from   ');
    //  SQL.Add('  DCDetail  ');
    //  SQL.Add('  group by UnitNo,TKNo,ProcDate,ProcTime,ChkClosing) B  ');
    //  SQL.Add('  on A.tkno =B.tkno and A.UnitNo = B.UnitNo and A.ProcDate =B.ProcDate and A.ProcTime=B.ProcTime  ');
    //  SQL.Add(' where CarNo like ' + MG_MakeStr('%' + Trim(edtCarNo.Text) + '%') );


      SQL.Add('  select (select unitname from UnitInfo K where K.UnitNo= A.UnitNo) UNITNAME  ');
      SQL.Add('  , A.CarNo, A.InDate, A.InTime, A.ProcDate ,A.ProcTime, A.TotFee,A.TotDC ');
      SQL.Add('  , 0 HUBULMONEY  ');
      SQL.Add('  , case when PayType=1 then RecvAmt else 0 end moneypay ');
      SQL.Add('  , case when PayType=2 then RecvAmt else 0 end cardpay  ');
      SQL.Add('  from ');
      SQL.Add('  TKProc A ');
      SQL.Add(' where A.CarNo like ' + MG_MakeStr('%' + Trim(edtCarNo.Text) + '%') );

      if cmbMode.ItemIndex = 0 then
      begin
        SQL.Add(' and A.InDate+A.InTime between :N1 and :N2 ');
      SQL.Add(' order by A.InDate,A.InTime ') ;
      end
      else
      begin
        SQL.Add(' and A.ProcDate+A.ProcTime between :N1 and :N2 ');
        SQL.Add(' order by A.ProcDate,A.ProcTime ') ;
      end;


      Parameters.ParamByName('N1').Value := sSDate + sSTime;
      Parameters.ParamByName('N2').Value := sEDate + sETime;
      Open;

      if RecordCount > 0 then
      begin
        btnPrint.Enabled := True;
        btnExcel.Enabled := True;
      end
      else
      begin
        btnPrint.Enabled := False;
        btnExcel.Enabled := False;
      end;
    end;

    // ???? ??????
    with qryTemp do
    begin
      Close;
      SQL.Clear;
//      SQL.Add(' select  COUNT(*) cnt, SUM(totfee) totfee, SUM(totdc) totdc, SUM(hubulmoney) hubulmoney, SUM(moneypay) moneypay, SUM(cardpay) cardpay from ( ');
//      SQL.Add('  select (select unitname from UnitInfo K where K.UnitNo= A.UnitNo) UNITNAME  ');
//      SQL.Add('  , A.CarNo, A.InDate, A.InTime, A.ProcDate ,A.ProcTime, A.TotFee,A.TotDC ');
//      SQL.Add('  , case when B.HUBULMONEY IS null then 0 else B.HUBULMONEY end HUBULMONEY  ');
//      SQL.Add('  , case when PayType=1 then RecvAmt else 0 end moneypay ');
//      SQL.Add('  , case when PayType=2 then RecvAmt else 0 end cardpay  ');
//      SQL.Add('  from ');
//      SQL.Add('  TKProc A left outer join  ');
//      SQL.Add('  (select UnitNo,TKNo,ProcDate,ProcTime,ChkClosing,sum(RealDCAmt) DCAMT, sum(CONVERT(int, Reserve6)) HUBULMONEY from   ');
//      SQL.Add('  DCDetail  ');
//      SQL.Add('  group by UnitNo,TKNo,ProcDate,ProcTime,ChkClosing) B  ');
//      SQL.Add('  on A.tkno =B.tkno and A.UnitNo = B.UnitNo and A.ProcDate =B.ProcDate and A.ProcTime=B.ProcTime  ');


      SQL.Add(' select  COUNT(*) cnt, SUM(totfee) totfee, SUM(totdc) totdc, SUM(hubulmoney) hubulmoney, SUM(moneypay) moneypay, SUM(cardpay) cardpay from ( ');
      SQL.Add('  select (select unitname from UnitInfo K where K.UnitNo= A.UnitNo) UNITNAME  ');
      SQL.Add('  , A.CarNo, A.InDate, A.InTime, A.ProcDate ,A.ProcTime, A.TotFee,A.TotDC ');
      SQL.Add('  , 0 HUBULMONEY  ');
      SQL.Add('  , case when PayType=1 then RecvAmt else 0 end moneypay ');
      SQL.Add('  , case when PayType=2 then RecvAmt else 0 end cardpay  ');
      SQL.Add('  from ');
      SQL.Add('  TKProc A ');

      if cmbMode.ItemIndex = 0 then
      begin
        SQL.Add(' where A.InDate+A.InTime between :N1 and :N2 ');

      end
      else
      begin
        SQL.Add(' where A.ProcDate+A.ProcTime between :N1 and :N2 ');

      end;

      SQL.Add(' ) T ') ;
      Parameters.ParamByName('N1').Value := sSDate + sSTime;
      Parameters.ParamByName('N2').Value := sEDate + sETime;
      Open;

      if RecordCount > 0 then
      begin
        edtTotalCount.Text :=   FormatFloat('#,##0', FieldByName('cnt').AsInteger);
        edtParkMoney.Text :=   FormatFloat('#,##0', FieldByName('totfee').AsInteger);
        edtDisCount.Text := FormatFloat('#,##0', FieldByName('totdc').AsInteger);
        edtHuBul.Text  := FormatFloat('#,##0', FieldByName('hubulmoney').AsInteger);
        edtPayCard.Text  := FormatFloat('#,##0', FieldByName('cardpay').AsInteger);
        edtPayMoney.Text  := FormatFloat('#,##0', FieldByName('moneypay').AsInteger);

        nTotalCount  := FieldByName('cnt').AsInteger;
        nParkMoney := FieldByName('totfee').AsInteger;
        nDiscount := FieldByName('totdc').AsInteger;
        nHubul := FieldByName('hubulmoney').AsInteger;
        nPayCard := FieldByName('cardpay').AsInteger;
        nPayMoney := FieldByName('moneypay').AsInteger;

        edtTotalCount.AutoThousandSeparator := True;
        edtParkMoney.AutoThousandSeparator:= True;
        edtDisCount.AutoThousandSeparator:= True;
        edtHuBul.AutoThousandSeparator:= True;
        edtPayCard.AutoThousandSeparator:= True;
        edtPayMoney.AutoThousandSeparator:= True;

        //btnPrint.Enabled := True;
      end;
    end;

  except
    on E: Exception do ExceptLogging('TfrmIONTKProc.btnSearchClick: ' + E.Message);
  end;
end;


procedure TfrmIONTKProc.FormShow(Sender: TObject);
begin
   try
    edtSDate.Date:= Now;
    edtEDate.Date:= Now;
    edtSDate.SetFocus;
  except
    on E: Exception do ExceptLogging('TfrmIONTKProc.FormCreate: ' + E.Message);
  end;
end;

end.
