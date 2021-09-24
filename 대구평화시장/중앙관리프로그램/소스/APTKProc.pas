unit APTKProc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, AdvObj, BaseGrid, AdvGrid,
  DBAdvGrid, Vcl.ComCtrls, AdvDateTimePicker, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, tmsAdvGridExcel, Data.DB, Data.Win.ADODB, AdvEdit;

type
  TfrmAPTKProc = class(TForm)
    dgAPTKProc: TDBAdvGrid;
    eAPTKProc: TAdvGridExcelIO;
    SaveDialog1: TSaveDialog;
    Panel1: TPanel;
    Bevel2: TBevel;
    Label7: TLabel;
    Label8: TLabel;
    edtSDate: TAdvDateTimePicker;
    edtSTime: TAdvDateTimePicker;
    edtEDate: TAdvDateTimePicker;
    edtETime: TAdvDateTimePicker;
    qryAPTKProc: TADOQuery;
    dsAPTKProc: TDataSource;
    btnExcel: TBitBtn;
    btnSearch: TBitBtn;
    btnClose: TBitBtn;
    sb1: TStatusBar;
    Panel2: TPanel;
    qryAPTKProcUnitNo: TSmallintField;
    qryAPTKProcProcDate: TStringField;
    qryAPTKProcProcTime: TStringField;
    qryAPTKProcTKNo: TStringField;
    qryAPTKProcCurrCoin1: TSmallintField;
    qryAPTKProcCurrCoin2: TSmallintField;
    qryAPTKProcCurrCoin3: TSmallintField;
    qryAPTKProcCurrCoin4: TSmallintField;
    qryAPTKProcCurrCoin5: TSmallintField;
    qryAPTKProcCurrJipe1: TSmallintField;
    qryAPTKProcCurrJipe2: TSmallintField;
    qryAPTKProcCurrJipe3: TSmallintField;
    qryAPTKProcCurrJipe4: TSmallintField;
    qryAPTKProcCurrJipe5: TSmallintField;
    qryAPTKProcInCoin1: TSmallintField;
    qryAPTKProcInCoin2: TSmallintField;
    qryAPTKProcInCoin3: TSmallintField;
    qryAPTKProcInCoin4: TSmallintField;
    qryAPTKProcInCoin5: TSmallintField;
    qryAPTKProcInJipe1: TSmallintField;
    qryAPTKProcInJipe2: TSmallintField;
    qryAPTKProcInJipe3: TSmallintField;
    qryAPTKProcInJipe4: TSmallintField;
    qryAPTKProcInJipe5: TSmallintField;
    qryAPTKProcOutCoin1: TSmallintField;
    qryAPTKProcOutCoin2: TSmallintField;
    qryAPTKProcOutCoin3: TSmallintField;
    qryAPTKProcOutCoin4: TSmallintField;
    qryAPTKProcOutCoin5: TSmallintField;
    qryAPTKProcOutJipe1: TSmallintField;
    qryAPTKProcOutJipe2: TSmallintField;
    qryAPTKProcOutJipe3: TSmallintField;
    qryAPTKProcOutJipe4: TSmallintField;
    qryAPTKProcOutJipe5: TSmallintField;
    qryUnitInfo: TADOQuery;
    dsUnitInfo: TDataSource;
    qryUnitInfoParkNo: TSmallintField;
    qryUnitInfoUnitNo: TSmallintField;
    qryUnitInfoUnitName: TStringField;
    qryUnitInfoUnitKind: TWordField;
    qryUnitInfoMyNo: TSmallintField;
    qryUnitInfoComport: TIntegerField;
    qryUnitInfoBaudrate: TIntegerField;
    qryUnitInfoIPNo: TStringField;
    qryUnitInfoPortNo: TIntegerField;
    qryUnitInfoReserve1: TStringField;
    qryUnitInfoReserve2: TStringField;
    qryUnitInfoReserve3: TStringField;
    qryUnitInfoReserve4: TStringField;
    qryUnitInfoReserve5: TStringField;
    qryAPTKProcUnitName: TStringField;
    edtUnitName: TAdvEdit;
    edtProcDate: TAdvEdit;
    edtProcTime: TAdvEdit;
    edtCurrCoin1: TAdvEdit;
    edtCurrCoin2: TAdvEdit;
    edtCurrCoin3: TAdvEdit;
    edtCurrCoin4: TAdvEdit;
    edtCurrJipe1: TAdvEdit;
    edtCurrJipe2: TAdvEdit;
    edtInCoin1: TAdvEdit;
    edtInCoin2: TAdvEdit;
    edtInCoin3: TAdvEdit;
    edtInCoin4: TAdvEdit;
    edtInJipe1: TAdvEdit;
    edtInJipe2: TAdvEdit;
    edtInJipe3: TAdvEdit;
    edtInJipe4: TAdvEdit;
    edtOutCoin1: TAdvEdit;
    edtOutCoin2: TAdvEdit;
    edtOutCoin3: TAdvEdit;
    edtOutCoin4: TAdvEdit;
    edtOutJipe1: TAdvEdit;
    edtOutJipe2: TAdvEdit;
    Bevel1: TBevel;
    Label1: TLabel;
    Bevel3: TBevel;
    Label2: TLabel;
    cmbUnitName: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure dgAPTKProcClick(Sender: TObject);
  private
    { Private declarations }
    procedure frmClear;
  public
    { Public declarations }
  end;

var
  frmAPTKProc: TfrmAPTKProc;

implementation
uses Tables, Global;

{$R *.dfm}

procedure TfrmAPTKProc.frmClear;
begin
  try
      //edtTotalCount.Text := '';
  except
    on E: Exception do ExceptLogging('TfrmAPTKProc.frmClear: ' + aString(E.Message));
  end;
end;

procedure TfrmAPTKProc.btnCloseClick(Sender: TObject);
begin
  qryAPTKProc.Close;
  Close;
end;

procedure TfrmAPTKProc.btnExcelClick(Sender: TObject);
begin
  try
    if savedialog1.Execute then
    begin
      eAPTKProc.XLSExport(savedialog1.filename + '.xls');
      ShowMessage('엑셀파일로 저장완료!');
    end;
  except
    on E: Exception do ExceptLogging('TfrmAPTKProc.btnExcelClick: ' + aString(E.Message));
  end;
end;

procedure TfrmAPTKProc.btnSearchClick(Sender: TObject);
var
  sSDate, sEDate, sSTime, sETime, sQuery: String;
begin
  try
    sSDate:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
    sEDate:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
    sSTime:= FormatDateTime('HH:NN:SS', edtSTime.Time);
    sETime:= FormatDateTime('HH:NN:SS', edtETime.Time);

    with qryAPTKProc do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM APTKProc ');
      SQL.Add('Where ProcDate >= :pProcDate1 and ProcDate <= :pProcDate2 ');

      if cmbUnitName.ItemIndex > 0 then
        SQL.Add('And  unitno = (select unitno from UnitInfo where unitname = :pUnitName)');

      SQL.Add('Order by ProcDate, ProcTime');
      Parameters.ParamByName('pProcDate1').Value :=  sSDate;
      Parameters.ParamByName('pProcDate2').Value :=  sEDate;
      if cmbUnitName.ItemIndex > 0 then
        Parameters.ParamByName('pUnitName').Value := cmbUnitName.Text;
      Open;

      if RecordCount > 0 then
        sb1.SimpleText:= '조회건수 : ' + IntToStr(RecordCount) + '건'
      else
        sb1.SimpleText:= '조회건수 : 0건';
    end;

    frmClear;
  except
    on E: Exception do ExceptLogging('TfrmAPTKProc.btnSearchClick: ' + E.Message);
  end;
end;

procedure TfrmAPTKProc.dgAPTKProcClick(Sender: TObject);
begin
  try
    with qryAPTKProc do
    begin
      edtUnitName.Text := FieldByName('UnitName').AsString;     // 기기명
      edtProcDate.Text := FieldByName('ProcDate').AsString;     // 처리일자
      edtProcTime.Text := FieldByName('ProcTime').AsString;     // 처리시간
      edtCurrCoin1.Text := FieldByName('CurrCoin1').AsString;   // 보유금10원
      edtCurrCoin2.Text := FieldByName('CurrCoin2').AsString;   // 보유금50원
      edtCurrCoin3.Text := FieldByName('CurrCoin3').AsString;   // 보유금100원
      edtCurrCoin4.Text := FieldByName('CurrCoin4').AsString;   // 보유금500원
      edtCurrJipe1.Text := FieldByName('CurrJipe1').AsString;   // 보유금1000원
      edtCurrJipe2.Text := FieldByName('CurrJipe2').AsString;   // 보유금5000원
      edtInCoin1.Text := FieldByName('InCoin1').AsString;       // 10원입수
      edtInCoin2.Text := FieldByName('InCoin2').AsString;       // 50원입수
      edtInCoin3.Text := FieldByName('InCoin3').AsString;       // 100원입수
      edtInCoin4.Text := FieldByName('InCoin4').AsString;       // 500원입수
      edtInJipe1.Text := FieldByName('InJipe1').AsString;       // 1000원입수
      edtInJipe2.Text := FieldByName('InJipe2').AsString;       // 5000원입수
      edtInJipe3.Text := FieldByName('InJipe3').AsString;       // 10000원입수
      edtInJipe4.Text := FieldByName('InJipe4').AsString;       // 50000원입수
      edtOutCoin1.Text := FieldByName('OutCoin1').AsString;     // 10원방출
      edtOutCoin2.Text := FieldByName('OutCoin2').AsString;     // 50원방출
      edtOutCoin3.Text := FieldByName('OutCoin3').AsString;     // 100원방출
      edtOutCoin4.Text := FieldByName('OutCoin4').AsString;     // 500원방출
      edtOutJipe1.Text := FieldByName('OutJipe1').AsString;     // 1000원방출
      edtOutJipe2.Text := FieldByName('OutJipe2').AsString;     // 5000원방출
    end;
  except
    on E: Exception do ExceptLogging('TfrmAPTKProc.dgAPTKProcClick: ' + E.Message);
  end;
end;

procedure TfrmAPTKProc.FormShow(Sender: TObject);
begin
  try
    edtSDate.Date:= Now;
    edtEDate.Date:= Now;
    edtSDate.SetFocus;

    // 키오스크
    with dmTables.qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from UnitInfo Where UnitKind = 12');
      Open;

      if RecordCount > 0 then
      begin
        while not EOF do
        begin
          cmbUnitName.Items.Add(FieldByName('UnitName').AsString);
          Next;
        end;
      end;
    end;
  except
    on E: Exception do ExceptLogging('TfrmAPTKProc.FormShow: ' + E.Message);
  end;
end;

end.
