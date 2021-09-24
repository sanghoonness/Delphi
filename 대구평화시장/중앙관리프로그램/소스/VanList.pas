unit VanList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, tmsAdvGridExcel, StdCtrls, Buttons, ComCtrls,
  AdvDateTimePicker, ExtCtrls, Grids, BaseGrid, AdvGrid, DBAdvGrid,
  AdvCombo, AdvObj;

type
  TfrmVanList = class(TForm)
    Panel2: TPanel;
    Bevel2: TBevel;
    Label4: TLabel;
    Label3: TLabel;
    Bevel3: TBevel;
    Label1: TLabel;
    edtSDate: TAdvDateTimePicker;
    edtEDate: TAdvDateTimePicker;
    btnSearch: TBitBtn;
    btnExcel: TBitBtn;
    btnClose: TBitBtn;
    Panel1: TPanel;
    AdvGridExcelIO1: TAdvGridExcelIO;
    SaveDialog1: TSaveDialog;
    qryManager: TADOQuery;
    qryManagerParkNo: TSmallintField;
    qryManagerMNo: TSmallintField;
    qryManagerPasswd: TStringField;
    qryManagerMName: TStringField;
    qryManagerAuthority: TWordField;
    qryManagerReserve1: TStringField;
    qryManagerReserve2: TStringField;
    qryManagerReserve3: TStringField;
    qryManagerReserve4: TStringField;
    qryManagerReserve5: TStringField;
    qryVanList: TADOQuery;
    dsVanList: TDataSource;
    qryVanListParkNo: TSmallintField;
    qryVanListUnitNo: TSmallintField;
    qryVanListProcDate: TStringField;
    qryVanListProcTime: TStringField;
    qryVanListMNo: TSmallintField;
    qryVanListVanCheck: TWordField;
    qryVanListCardNo: TStringField;
    qryVanListVanAmt: TIntegerField;
    qryVanListVanDate: TStringField;
    qryVanListVanTime: TStringField;
    qryVanListVanRegNo: TStringField;
    qryVanListCardType: TStringField;
    qryVanListVanStatus: TStringField;
    qryVanListCarNo: TStringField;
    qryVanListReserve1: TStringField;
    qryVanListReserve2: TStringField;
    qryVanListReserve3: TStringField;
    qryVanListReserve4: TStringField;
    qryVanListReserve5: TStringField;
    qryVanListMName: TStringField;
    dgVanList: TDBAdvGrid;
    cmbYN: TAdvComboBox;
    sb1: TStatusBar;
    procedure FormShow(Sender: TObject);
    procedure qryVanListVanCheckGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure btnCloseClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVanList: TfrmVanList;

implementation

uses
  Global, Tables;

{$R *.dfm}

procedure TfrmVanList.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmVanList.btnExcelClick(Sender: TObject);
begin
  try
    if SaveDialog1.Execute then
    begin
      AdvGridExcelIO1.XLSExport(SaveDialog1.filename + '.xls');
      ShowMessage('엑셀파일로 저장완료!');
    end;
  except
    on E: Exception do
      ExceptLogging('TfrmVanList.btnExcelClick: ' + E.Message);
  end;
end;

procedure TfrmVanList.btnSearchClick(Sender: TObject);
var
  sSDate, sEDate: String;
begin
  sSDate := FormatDateTime('YYYY-MM-DD', edtSDate.Date);
  sEDate := FormatDateTime('YYYY-MM-DD', edtEDate.Date);

  with qryVanList do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * from VanList where ProcDate >= :N1 and ProcDate <= :N2 ');

    if cmbYN.ItemIndex > 0 then
      SQL.Add('and VanCheck = :N3');

    Parameters.ParamByName('N1').Value := sSDate;
    Parameters.ParamByName('N2').Value := sEDate;

    if cmbYN.ItemIndex > 0 then
      Parameters.ParamByName('N3').Value := cmbYN.ItemIndex;
    Open;

    if RecordCount > 0 then
    begin
      btnExcel.Enabled := True;
      sb1.SimpleText := '조회건수: ' + IntToStr(RecordCount) + '건';
    end
    else
    begin
      btnExcel.Enabled := False;
      sb1.SimpleText := '조회건수: 0건';
    end;
  end;
end;

procedure TfrmVanList.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnSearchClick(Self);
end;

procedure TfrmVanList.FormShow(Sender: TObject);
begin
  edtSDate.Date := Now;
  edtEDate.Date := Now;
  qryManager.Active := True;
end;

procedure TfrmVanList.qryVanListVanCheckGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Case qryVanListVanCheck.Value of
    1:
      Text := '정상승인';
    2:
      Text := '승인불가';
    3:
      Text := '승인취소';
  End;
end;

end.
