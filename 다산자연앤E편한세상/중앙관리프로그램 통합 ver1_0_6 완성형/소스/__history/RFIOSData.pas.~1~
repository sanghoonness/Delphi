unit RFIOSData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, AdvDateTimePicker, ExtCtrls, Grids,
  BaseGrid, AdvGrid, DBAdvGrid, DB, ADODB, tmsAdvGridExcel;

type
  TfrmRFIOSData = class(TForm)
    SaveDialog1: TSaveDialog;
    AdvGridExcelIO1: TAdvGridExcelIO;
    qryIOSData: TADOQuery;
    qryIOSDataParkNo: TSmallintField;
    qryIOSDataUnitNo: TWordField;
    qryIOSDataProcDate: TStringField;
    qryIOSDataProcTime: TStringField;
    qryIOSDataTKNo: TStringField;
    qryIOSDataTKType: TWordField;
    qryIOSDataCarTypeNo: TWordField;
    qryIOSDataGroupNo: TWordField;
    qryIOSDataGroupName: TStringField;
    qryIOSDataCompName: TStringField;
    qryIOSDataDeptName: TStringField;
    qryIOSDataName: TStringField;
    qryIOSDataInCarNo: TStringField;
    qryIOSDataInIOStatusNo: TWordField;
    qryIOSDataInImage: TStringField;
    qryIOSDataOutUnitNo: TWordField;
    qryIOSDataOutDate: TStringField;
    qryIOSDataOutTime: TStringField;
    qryIOSDataOutImage: TStringField;
    qryIOSDataOutCarNo: TStringField;
    qryIOSDataOutIOStatusNo: TWordField;
    qryIOSDataReserve1: TStringField;
    qryIOSDataReserve2: TStringField;
    qryIOSDataReserve3: TStringField;
    qryIOSDataReserve4: TStringField;
    qryIOSDataReserve5: TStringField;
    qryIOSDataInIOName: TStringField;
    qryIOSDataOutIOName: TStringField;
    qryIOSDataInImage2: TStringField;
    qryIOSDataInCarNo2: TStringField;
    qryIOSDataOutImage2: TStringField;
    qryIOSDataOutCarNo2: TStringField;
    qryIOSDataInRecog1: TWordField;
    qryIOSDataOutRecog1: TWordField;
    qryIOSDataInRecog2: TWordField;
    qryIOSDataOutRecog2: TWordField;
    qryIOSDataInUnitName: TStringField;
    qryIOSDataOutUnitName: TStringField;
    qryIOStatus: TADOQuery;
    qryIOStatusIOStatusNo: TWordField;
    qryIOStatusIOStatusName: TStringField;
    qryIOStatusReserve1: TStringField;
    qryIOStatusReserve2: TStringField;
    qryIOStatusReserve3: TStringField;
    qryIOStatusReserve4: TStringField;
    qryIOStatusReserve5: TStringField;
    qryUnitInfo: TADOQuery;
    qryUnitInfoParkNo: TSmallintField;
    qryUnitInfoUnitNo: TSmallintField;
    qryUnitInfoUnitName: TStringField;
    qryUnitInfoUnitKind: TWordField;
    qryUnitInfoMyNo: TWordField;
    qryUnitInfoComport: TIntegerField;
    qryUnitInfoBaudrate: TIntegerField;
    qryUnitInfoIPNo: TStringField;
    qryUnitInfoPortNo: TIntegerField;
    qryUnitInfoReserve1: TStringField;
    qryUnitInfoReserve2: TStringField;
    qryUnitInfoReserve3: TStringField;
    qryUnitInfoReserve4: TStringField;
    qryUnitInfoReserve5: TStringField;
    dsIOSData: TDataSource;
    Panel1: TPanel;
    tdg1: TDBAdvGrid;
    Panel2: TPanel;
    Bevel2: TBevel;
    Label7: TLabel;
    Label8: TLabel;
    Bevel3: TBevel;
    Label1: TLabel;
    edtSDate: TAdvDateTimePicker;
    edtSTime: TAdvDateTimePicker;
    edtEDate: TAdvDateTimePicker;
    edtETime: TAdvDateTimePicker;
    edtCarNo: TEdit;
    btnSearch: TBitBtn;
    btnExcel: TBitBtn;
    btnClose: TBitBtn;
    btnPrint: TBitBtn;
    sb1: TStatusBar;
    procedure FormShow(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRFIOSData: TfrmRFIOSData;

implementation
uses
  Global, Tables;

{$R *.dfm}

procedure TfrmRFIOSData.btnCloseClick(Sender: TObject);
begin
  qryIOSData.Close;
  qryIOStatus.Close;
  Close;
end;

procedure TfrmRFIOSData.btnExcelClick(Sender: TObject);
begin
  try
    if savedialog1.Execute then
    begin
      advgridexcelio1.XLSExport(savedialog1.filename + '.xls');
      ShowMessage('엑셀파일로 저장완료!');
    end;
  except
    on E: Exception do ExceptLogging('TfrmRFIOSData.btnExcelClick: ' + E.Message);
  end;
end;

procedure TfrmRFIOSData.btnSearchClick(Sender: TObject);
var
  sSDate, sEDate, sSTime, sETime: String;
begin
  try
    sSDate:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
    sEDate:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
    sSTime:= FormatDateTime('HH:NN', edtSTime.Time);
    sETime:= FormatDateTime('HH:NN', edtETime.Time);

    with qryIOSData do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from IOSData where ProcDate >= :N1 and ProcDate <= :N2 and ');
      SQL.Add('ProcTime >= :N3 and ProcTime <= :N4 and TKType = :N5 ');
      Parameters.ParamByName('N1').Value:= sSDate;
      Parameters.ParamByName('N2').Value:= sEDate;
      Parameters.ParamByName('N3').Value:= sSTime;
      Parameters.ParamByName('N4').Value:= sETime;
      Parameters.ParamByName('N5').Value:= 99;

      if edtCarNo.Text <> '' then
      begin
        SQL.Add(' and (InCarNo1 like ''%' + Trim(edtCarNo.Text) + '%'' or ');
        SQL.Add(' and (InCarNo2 like ''%' + Trim(edtCarNo.Text) + '%'' ');
      end;

      SQL.Add(' Order By UnitNo, ProcDate, ProcTime');

      Open;

      if RecordCount > 0 then
      begin
        btnPrint.Enabled:= True;
        btnExcel.Enabled:= True;
      end
      else
      begin
        btnPrint.Enabled:= False;
        btnExcel.Enabled:= False;
      end;

      sb1.SimpleText:= '조회 : ' + IntToStr(RecordCount) + '건';
    end;
  except
    on E: Exception do ExceptLogging('TfrmRFIOSData.btnSearchClick: ' + E.Message);
  end;
end;

procedure TfrmRFIOSData.FormShow(Sender: TObject);
begin
  qryIOStatus.Open;
  edtSDate.Date:= Now;
  edtEDate.Date:= Now;
  edtSTime.Time:= StrToDateTime('00:00:00');
  edtETime.Time:= StrToDateTime('23:59:59');
  qryUnitInfo.Active:= True;
end;

end.
