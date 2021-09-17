unit MisuTKProc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  tmsAdvGridExcel, Data.DB, frxClass, Data.Win.ADODB, Vcl.Grids, AdvObj,
  BaseGrid, AdvGrid, DBAdvGrid, AdvCombo, AdvEdit, Vcl.ComCtrls,
  AdvDateTimePicker, AdvProgr;

type
  TfrmMisuTKProc = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    btnClose: TBitBtn;
    btnExcel: TBitBtn;
    btnSearch: TBitBtn;
    btnMisuProc: TButton;
    DBAdvGrid1: TDBAdvGrid;
    qryTemp: TADOQuery;
    qryTKProc: TADOQuery;
    frxReport1: TfrxReport;
    dsTKProc: TDataSource;
    SaveDialog1: TSaveDialog;
    AdvGridExcelIO1: TAdvGridExcelIO;
    qryTKProcParkNo: TSmallintField;
    qryTKProcUnitNo: TSmallintField;
    qryTKProcProcDate: TStringField;
    qryTKProcProcTime: TStringField;
    qryTKProcTKNo: TStringField;
    qryTKProcTKType: TWordField;
    qryTKProcCarType: TWordField;
    qryTKProcFeeNo: TWordField;
    qryTKProcTKParkNo: TSmallintField;
    qryTKProcTKUnitNo: TSmallintField;
    qryTKProcCarNo: TStringField;
    qryTKProcInDate: TStringField;
    qryTKProcInTime: TStringField;
    qryTKProcParkingMin: TIntegerField;
    qryTKProcTotFee: TIntegerField;
    qryTKProcTotDC: TIntegerField;
    qryTKProcRealFee: TIntegerField;
    qryTKProcRecvAmt: TIntegerField;
    qryTKProcChange: TIntegerField;
    qryTKProcDCCnt: TWordField;
    qryTKProcMNo: TSmallintField;
    qryTKProcUnpaid: TIntegerField;
    qryTKProcChkClosing: TWordField;
    qryTKProcCommercialTariff: TWordField;
    qryTKProcSpecialTariff: TWordField;
    qryTKProcPayType: TWordField;
    qryTKProcMisuReceiveSuccess: TIntegerField;
    qryTKProcReserve1: TStringField;
    qryTKProcReserve2: TStringField;
    qryTKProcReserve3: TStringField;
    qryTKProcReserve4: TStringField;
    qryTKProcReserve5: TStringField;
    qryTKProcRemark: TStringField;
    qryUnitinfo: TADOQuery;
    qryUnitinfoUnitNo: TSmallintField;
    qryUnitinfoUnitName: TStringField;
    edtETime: TAdvDateTimePicker;
    edtSearchCarNo: TAdvEdit;
    edtEDate: TAdvDateTimePicker;
    Label7: TLabel;
    edtSTime: TAdvDateTimePicker;
    edtSDate: TAdvDateTimePicker;
    cmbMode: TAdvComboBox;
    cmbMisuSuccess: TAdvComboBox;
    edtUnitName: TAdvEdit;
    edtCarNo: TAdvEdit;
    edtInDate: TAdvEdit;
    edtInTime: TAdvEdit;
    edtProcDate: TAdvEdit;
    edtProcTime: TAdvEdit;
    edtReserve1: TAdvEdit;
    edtReserve2: TAdvEdit;
    edtRecvAmt: TAdvEdit;
    edtReserve3: TAdvEdit;
    cmbMisu: TAdvComboBox;
    edtReserve4: TAdvEdit;
    edtRemark: TAdvEdit;
    qryTKProcUnitName: TStringField;
    btnCancel: TBitBtn;
    pnProgress: TPanel;
    Label6: TLabel;
    ap1: TAdvProgress;
    procedure qryTKProcMisuReceiveSuccessGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure DBAdvGrid1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnMisuProcClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
  private
    { Private declarations }
    procedure frmClear;
  public
    { Public declarations }
  end;

var
  frmMisuTKProc: TfrmMisuTKProc;

implementation
uses
  Global, Tables;
{$R *.dfm}

procedure TfrmMisuTKProc.btnCancelClick(Sender: TObject);
begin
  frmClear;
end;

procedure TfrmMisuTKProc.btnCloseClick(Sender: TObject);
begin
  qryTKProc.Close;
  ModalResult := mrCancel;
  //Close;
end;

procedure TfrmMisuTKProc.btnExcelClick(Sender: TObject);
begin
  try
    if savedialog1.Execute then
    begin
      pnProgress.Visible:= True;
      Refresh;
      advgridexcelio1.XLSExport(savedialog1.filename + '.xls');
      pnProgress.Visible:= False;
      ShowMessage('엑셀파일로 저장완료!');
    end;
  except
    on E: Exception do ExceptLogging('TfrmMisuTKProc.btnExcelClick: ' + E.Message);
  end;
end;

procedure TfrmMisuTKproc.frmClear;
begin
  edtUnitName.Text := '';
  edtCarNo.Text := '';
  edtInDate.Text := '';         // 입차일자
  edtInTime.Text := '';         // 입차시각
  edtProcDate.Text := '';     // 미수일자
  edtProcTime.Text := '';     // 미수시각
  edtReserve1.Text := '';     // 미수일자
  edtReserve2.Text := '';   // 미수시각
  edtRecvAmt.Text := '';
  cmbMisu.ItemIndex := 0;
  edtReserve3.Text := '';
  edtReserve4.Text := '';
  edtRemark.Text := '';

  btnCancel.Enabled := false;
  btnMisuProc.Enabled := false;
end;

// 정산처리
procedure TfrmMisuTKProc.btnMisuProcClick(Sender: TObject);
begin
  try
    with qryTKProc do
    begin
      Close;
      SQL.Clear;
      SQL.Add(' update MisuTkProc set MisuReceiveSuccess = :pMisu , Reserve3 = :pReserve3 ');
      SQL.Add(' , Reserve4 = :pReserve4, Remark = :pRemark, Reserve1 = :pProcDate, Reserve2 = :pProcTime ');
      SQL.Add(' where CarNo = :pCarNo  ');
      SQL.Add(' and InDate = :pInDate and InTime = :pInTime ');
      Parameters.ParamByName('pMisu').Value := cmbMisu.ItemIndex;
      Parameters.ParamByName('pReserve3').Value := edtReserve3.Text;
      Parameters.ParamByName('pReserve4').Value := edtReserve4.Text;
      Parameters.ParamByName('pRemark').Value := edtRemark.Text;
      Parameters.ParamByName('pCarNo').Value := edtCarNo.Text;
      Parameters.ParamByName('pInDate').Value := edtInDate.Text;
      Parameters.ParamByName('pInTime').Value := edtInTime.Text;
      Parameters.ParamByName('pProcDate').Value := FormatDateTime('YYYY-MM-DD', Now);
      Parameters.ParamByName('pProcTime').Value := FormatDateTime('HH:MM:SS', Now);
      ExecSQL;

      ExceptLogging('미수처리 > 차량번호: ' + edtCarNo.Text + ', 입차일자: ' + edtInDate.Text + ', 입차시각: ' + edtInTime.Text
            + ', 정산여부 : ' + IntToStr(cmbMisu.ItemIndex));

      btnSearchClick(self);
      frmClear;
    end;
  except
    on E: Exception do ExceptLogging('TfrmMisuTKProc.btnMisuProcClick: ' + aString(E.Message));
  end;
end;

procedure TfrmMisuTKProc.btnSearchClick(Sender: TObject);
var
  sSDate, sEDate, sSTime, sETime: String;
begin
  try
    sSDate:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
    sEDate:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
    sSTime:= FormatDateTime('HH:NN:SS', edtSTime.Time);
    sETime:= FormatDateTime('HH:NN:SS', edtETime.Time);

    with qryTKProc do
    begin
      Close;
      SQL.Clear;
      SQL.Add(' select (select UnitName from UnitInfo where UnitNo = m.UnitNo) UnitName    ');
      SQL.Add(',*  from MisuTkProc  m ');
      //SQL.Add(' where InDate+InTime between :Date1 and :Date2 ');
      SQL.Add(' where CarNo  like ' + MG_MakeStr('%' + Trim(edtSearchCarNo.Text) + '%') );

      if cmbMisuSuccess.ItemIndex > 0 then
        SQL.Add('and MisuReceiveSuccess = :pMisuReceiveSuccess ');

      if cmbMode.ItemIndex = 0 then
      begin
        SQL.Add(' and InDate+InTime between :Date1 and :Date2 ');
        SQL.Add(' order by InDate,InTime ') ;
      end
      else
      begin
        SQL.Add(' and ProcDate+ProcTime between :Date1 and :Date2 ');
        SQL.Add(' order by ProcDate,ProcTime ') ;
      end;

      Parameters.ParamByName('Date1').Value := sSDate + sSTime;
      Parameters.ParamByName('Date2').Value := sEDate + sETime;

       if cmbMisuSuccess.ItemIndex > 0 then
        Parameters.ParamByName('pMisuReceiveSuccess').Value := cmbMisuSuccess.ItemIndex - 1;

      Open;

      if RecordCount > 0 then
      begin
        btnExcel.Enabled := True;
      end
      else
      begin
        btnExcel.Enabled := false;
      end;
    end;
  except
    on E: Exception do ExceptLogging('TfrmMisuTKProc.btnSearchClick: ' + aString(E.Message));
  end;
end;

procedure TfrmMisuTKProc.DBAdvGrid1Click(Sender: TObject);
begin
  try
    if qryTKProc.RecordCount <= 0 then
      Exit;

    with qryTKProc do
    begin
      edtUnitName.Text := FieldByName('UnitName').AsString;
      edtCarNo.Text := FieldByName('CarNo').AsString;
      edtInDate.Text := FieldByName('InDate').AsString;         // 입차일자
      edtInTime.Text := FieldByName('InTime').AsString;         // 입차시각
      edtProcDate.Text := FieldByName('ProcDate').AsString;     // 미수일자
      edtProcTime.Text := FieldByName('ProcTime').AsString;     // 미수시각
      edtReserve1.Text := FieldByName('Reserve1').AsString;     // 미수일자
      edtReserve2.Text := FieldByName('Reserve2').AsString;   // 미수시각
      edtRecvAmt.Text := FieldByName('RecvAmt').AsString;
      cmbMisu.ItemIndex := FieldByName('MisuReceiveSuccess').AsInteger;
      edtReserve3.Text := FieldByName('Reserve3').AsString;
      edtReserve4.Text := FieldByName('Reserve4').AsString;
      edtRemark.Text := FieldByName('Remark').AsString;
      btnMisuProc.Enabled := True;
      btnCancel.Enabled := True;
    end;
  except
    on E: Exception do ExceptLogging('TfrmMisuTKProc.DBAdvGrid1Click: ' + aString(E.Message));
  end;
end;

procedure TfrmMisuTKProc.FormShow(Sender: TObject);
begin
   try
    edtSDate.Date:= Now;
    edtEDate.Date:= Now;
    edtSDate.SetFocus;
  except
    on E: Exception do ExceptLogging('TfrmMisuTKProc.FormShow: ' + E.Message);
  end;
end;

procedure TfrmMisuTKProc.qryTKProcMisuReceiveSuccessGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  case qryTKProcMisuReceiveSuccess.Value of
    0: Text:= '미정산';
    1: Text:= '정산';
  end;
end;

end.
