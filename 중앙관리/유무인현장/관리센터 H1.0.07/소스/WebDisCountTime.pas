unit WebDisCountTime;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, tmsAdvGridExcel,
  Data.Win.ADODB, frxClass, frxDBSet, Vcl.StdCtrls, AdvCombo, Vcl.Buttons,
  Vcl.ComCtrls, AdvDateTimePicker, Vcl.Grids, AdvObj, BaseGrid, AdvGrid,
  DBAdvGrid, Vcl.ExtCtrls, AdvEdit, AdvProgr, Vcl.Mask, AdvSpin;

type
  TfrmWebDisCountTime = class(TForm)
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
    frxReport1: TfrxReport;
    dsDCDetail: TDataSource;
    qryDCDetail: TADOQuery;
    qry: TADOQuery;
    AdvGridExcelIO1: TAdvGridExcelIO;
    SaveDialog1: TSaveDialog;
    Panel3: TPanel;
    edtTotFee: TAdvEdit;
    edtTotRecvAmt: TAdvEdit;
    pnProgress: TPanel;
    Label6: TLabel;
    ap1: TAdvProgress;
    frxDBDataset1: TfrxDBDataset;
    qryDCDetailParkNo: TSmallintField;
    qryDCDetailUnitName: TStringField;
    qryDCDetailProcDate: TStringField;
    qryDCDetailProcTime: TStringField;
    qryDCDetailCarNo: TStringField;
    qryDCDetailTotFee: TIntegerField;
    qryDCDetailRecvAmt: TIntegerField;
    edtCarNo: TAdvEdit;
    edtDCTime: TAdvSpinEdit;
    edtETime: TAdvDateTimePicker;
    edtSTime: TAdvDateTimePicker;
    edtTotalCnt: TAdvEdit;
    qryDCDetailRealDcMin: TIntegerField;
    sb1: TStatusBar;
    Label1: TLabel;
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
  frmWebDisCountTime: TfrmWebDisCountTime;
  nTotFee, nTotRecvAmt, nTotCnt : Cardinal;

implementation
uses
  Tables, Global;
{$R *.dfm}

procedure TfrmWebDisCountTime.btnCloseClick(Sender: TObject);
begin
  qry.Close;
  qryDCDetail.Close;
  ModalResult := mrCancel;
  //Close;
end;

procedure TfrmWebDisCountTime.btnExcelClick(Sender: TObject);
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

procedure TfrmWebDisCountTime.btnPrintClick(Sender: TObject);
var
  sTemp: String;
begin
  frxReport1.LoadFromFile(sCurrRunDir + '\Report\WebDiscount.fr3');

  frxReport1.Variables['nTotCnt']:= nTotCnt;
  frxReport1.Variables['nTotFee']:= nTotFee;
  frxReport1.Variables['nTotRecvAmt']:= nTotRecvAmt;
  frxReport1.ShowReport(True);
end;

procedure TfrmWebDisCountTime.btnSearchClick(Sender: TObject);
var
  sSDate, sEDate, sSTime, sETime: String;
begin
  sSDate := FormatDateTime('YYYY-MM-DD', edtSDate.Date);
  sEDate := FormatDateTime('YYYY-MM-DD', edtEDate.Date);
  sSTime:= FormatDateTime('HH:NN:SS', edtSTime.Time);
  sETime:= FormatDateTime('HH:NN:SS', edtETime.Time);

  try
    with qryDCDetail do
    begin
      Close;
      SQL.Clear;
      SQL.Add(' select t.ParkNo, UnitName, t.ProcDate, t.ProcTime, t.CarNo, TotFee, d.RealDcMin, RecvAmt ');
      SQL.Add(' from TKProc t ');
      SQL.Add(' left outer join DCDetail d on t.TKNo = d.TKNo ');
      SQL.Add(' left outer join UnitInfo u on t.UnitNo = u.UnitNo ');
      SQL.Add(' where (t.ProcDate+t.ProcTime between :pSDate and :pEDate) ');
      SQL.Add(' and t.CarNo  like ' + MG_MakeStr('%' + Trim(edtCarNo.Text) + '%')) ;
      SQL.Add(' and RealDcMin > :pDCTime ');
      SQL.Add(' order by ProcDate, ProcTime ');
      Parameters.ParamByName('pSDate').Value := sSDate+sSTime;
      Parameters.ParamByName('pEDate').Value := sEDate+sETime;
      Parameters.ParamByName('pDCTime').Value  := edtDCTime.Value;

     // ExceptLogging(sql.Text);
      Open;

      if RecordCount > 0 then
      begin
        btnExcel.Enabled := True;
        btnPrint.Enabled := True;
        sb1.SimpleText := '??: ' + IntToStr(RecordCount) + '??';
      end
      else
      begin
        btnExcel.Enabled := False;
        btnPrint.Enabled := False;
        sb1.SimpleText := '??: 0??';
      end;
   end;

   with qry do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' select SUM(totfee) totfee, SUM(recvamt) recvamt from (');
      SQL.Add(' select t.ParkNo ParkNo, UnitName, t.ProcDate ProcDate, t.ProcTime ProcTime ');
      SQL.Add(' , t.CarNo CarNo, TotFee, d.RealDcMin RealDcMin, RecvAmt ');
      SQL.Add(' from TKProc t ');
      SQL.Add(' left outer join DCDetail d on t.TKNo = d.TKNo ');
      SQL.Add(' left outer join UnitInfo u on t.UnitNo = u.UnitNo ');
      SQL.Add(' where (t.ProcDate+t.ProcTime between :pSDate and :pEDate) ');
      SQL.Add(' and t.CarNo  like ' + MG_MakeStr('%' + Trim(edtCarNo.Text) + '%')) ;

      if edtDCTime.Value > 0 then
        SQL.Add(' and RealDcMin > :pDCTime ');

      SQL.Add(') A');
      Parameters.ParamByName('pSDate').Value := sSDate+sSTime;
      Parameters.ParamByName('pEDate').Value := sEDate+sETime;

      if edtDCTime.Value > 0 then
        Parameters.ParamByName('pDCTime').Value  := edtDCTime.Value;

      ExceptLogging(sql.Text);
      Open;

      if RecordCount > 0 then
      begin
        nTotCnt := qryDCDetail.RecordCount;
        nTotFee := FieldByName('totfee').AsInteger;
        nTotRecvAmt := FieldByName('recvamt').AsInteger;
        edtTotalCnt.Text := IntToStr(nTotCnt);
        edtTotFee.Text := FieldByName('totfee').AsString;
        edtTotRecvAmt.Text := FieldByName('recvamt').AsString;
      end;
   end;


  except
    on E: Exception do ExceptLogging('TfrmWebDCList.btnSearchClick: ' + E.Message);
  end;
end;

procedure TfrmWebDisCountTime.FormShow(Sender: TObject);
begin
  edtSDate.Date:= Now;
  edtEDate.Date:= Now;

//  try
//    with qry do
//    begin
//      Close;
//      SQL.Clear;
//      SQL.Add(' select * from tblStore ');
//      SQL.Add(' order by StoreName ');
//      Open;
//
//      if RecordCount > 0 then
//      begin
//        cmbStore.Items.Add('????');
//
//        while not Eof do
//        begin
//          cmbStore.Items.Add(FieldByName('StoreName').AsString);
//          next;
//        end;
//
//        cmbStore.ItemIndex := 0;
//      end;
//    end;
//  except
//    on E: Exception do ExceptLogging('TfrmDCReport.FormShow: ' + E.Message);
//  end;
end;

end.
