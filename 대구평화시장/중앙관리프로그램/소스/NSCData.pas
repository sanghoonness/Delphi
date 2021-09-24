unit NSCData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Mask, ExtCtrls, ToolWin, ComCtrls,
  DB, Buttons, Printers, ADODB, AdvToolBtn, AdvDateTimePicker,
  AdvPanel, BaseGrid, AdvGrid, DBAdvGrid, AdvAppStyler, tmsAdvGridExcel, AdvObj;

type
  TfrmNSCData = class(TForm)
    sb1: TStatusBar;
    qryIssueTk: TADOQuery;
    dsIssueTk: TDataSource;
    qryIssueTkParkNo: TSmallintField;
    qryIssueTkIssueDate: TStringField;
    qryIssueTkIssueTime: TStringField;
    qryIssueTkMNo: TWordField;
    qryIssueTkTKType: TWordField;
    qryIssueTkTKNo: TStringField;
    qryIssueTkCarTypeNo: TWordField;
    qryIssueTkIssueType: TWordField;
    qryIssueTkIssueUnit: TIntegerField;
    qryIssueTkExpDateF: TStringField;
    qryIssueTkExpDateT: TStringField;
    qryIssueTkFValue: TIntegerField;
    qryIssueTkChkClosing: TWordField;
    qryIssueTkReserve1: TStringField;
    qryIssueTkReserve2: TStringField;
    qryIssueTkReserve3: TStringField;
    qryIssueTkReserve4: TStringField;
    qryIssueTkReserve5: TStringField;
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
    qryIssueTkMName: TStringField;
    DBAdvGrid1: TDBAdvGrid;
    qryIssueTkWPNo: TWordField;
    qryWP: TADOQuery;
    qryWPParkNo: TSmallintField;
    qryWPWPNo: TWordField;
    qryWPWPName: TStringField;
    qryWPChkSun: TWordField;
    qryWPSTimeSun: TStringField;
    qryWPETimeSun: TStringField;
    qryWPChkMon: TWordField;
    qryWPSTimeMon: TStringField;
    qryWPETimeMon: TStringField;
    qryWPChkTue: TWordField;
    qryWPSTimeTue: TStringField;
    qryWPETimeTue: TStringField;
    qryWPChkWed: TWordField;
    qryWPSTimeWed: TStringField;
    qryWPETimeWed: TStringField;
    qryWPChkThu: TWordField;
    qryWPSTimeThu: TStringField;
    qryWPETimeThu: TStringField;
    qryWPChkFri: TWordField;
    qryWPSTimeFri: TStringField;
    qryWPETimeFri: TStringField;
    qryWPChkSat: TWordField;
    qryWPSTimeSat: TStringField;
    qryWPETimeSat: TStringField;
    qryWPReserve1: TStringField;
    qryWPReserve2: TStringField;
    qryWPReserve3: TStringField;
    qryWPReserve4: TStringField;
    qryWPReserve5: TStringField;
    qryIssueTkWPName: TStringField;
    btnSearch: TBitBtn;
    btnPrint: TBitBtn;
    btnClose: TBitBtn;
    Panel1: TPanel;
    Bevel2: TBevel;
    Label7: TLabel;
    Label8: TLabel;
    Bevel1: TBevel;
    Label1: TLabel;
    edtSDate: TAdvDateTimePicker;
    edtEDate: TAdvDateTimePicker;
    cmbIssueType: TComboBox;
    SaveDialog1: TSaveDialog;
    AdvGridExcelIO1: TAdvGridExcelIO;
    btnExcel: TBitBtn;
    qryIssueTkUnitNo: TSmallintField;
    qryIssueTkCarNo: TStringField;
    procedure btnSearchClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure qryIssueTkIssueTypeGetText(Sender: TField; var Text: string; DisplayText: Boolean);
  private
  public
    { Public declarations }
  end;

var
  frmNSCData: TfrmNSCData;

implementation
uses
  Tables, Global;

{$R *.dfm}

procedure TfrmNSCData.btnSearchClick(Sender: TObject);
var
  sSDate, sEDate: String;
begin
  try
    sSDate:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
    sEDate:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);

    with qryIssueTK do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from IssueTK ');
      SQL.Add('where IssueDate >= :N1 and IssueDate <= :N2 and TKType = :N3');

      if cmbIssueType.ItemIndex <> 0 then
        SQL.Add(' and IssueType = :N4 ');

      SQL.Add('Order By IssueDate, IssueTime');
      Parameters.ParamByName('N1').Value:= sSDate;
      Parameters.ParamByName('N2').Value:= sEDate;
      Parameters.ParamByName('N3').Value:= 2;

      if cmbIssueType.ItemIndex <> 0 then
        Parameters.ParamByName('N4').Value:= cmbIssueType.ItemIndex;
      Open;

      if RecordCount > 0 then
      begin
        btnPrint.Enabled:= True;
        btnExcel.Enabled:= True;
        sb1.SimpleText:= '조회건수 : ' + IntToStr(RecordCount);
      end
      else
      begin
        btnPrint.Enabled:= False;
        btnExcel.Enabled:= False;
        sb1.SimpleText:= '';
      end;
    end;
  except
    on E: Exception do ExceptLogging('TfrmNSCData.btnSearchClick: ' + E.Message);
  end;
end;

procedure TfrmNSCData.btnCloseClick(Sender: TObject);
begin
  qryManager.Close;
  qryIssueTK.Close;
  Close;
end;

procedure TfrmNSCData.FormShow(Sender: TObject);
begin
  qryManager.Open;
  edtSDate.Date:= Now;
  edtEDate.Date:= Now;
  edtSDate.SetFocus;
end;

procedure TfrmNSCData.qryIssueTkIssueTypeGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  case qryIssueTKIssueType.Value of
    1: Text:= '신규발급';
    2: Text:= '기간연장';
  end;
end;

procedure TfrmNSCData.btnExcelClick(Sender: TObject);
begin
  try
    if savedialog1.Execute then
    begin
      advgridexcelio1.XLSExport(savedialog1.filename + '.xls');
      ShowMessage('엑셀파일로 저장완료!');
    end;
  except
    on E: Exception do ExceptLogging('TfrmNSCData.btnExcelClick: ' + E.Message);
  end;
end;

end.
