unit NProc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ComCtrls, StdCtrls, ExtCtrls, Grids, DB, ADODB,
  BaseGrid, AdvGrid, DBAdvGrid, AdvAppStyler, AdvToolBtn, AdvEdit,
  AdvDateTimePicker, AdvPanel, Buttons, tmsAdvGridExcel, AdvObj;

type
  TfrmNProc = class(TForm)
    qryTemp: TADOQuery;
    qryTKProc: TADOQuery;
    dsTKProc: TDataSource;
    qryFeeItem: TADOQuery;
    qryFeeItemParkNo: TSmallintField;
    qryFeeItemFeeNo: TWordField;
    qryFeeItemFeeName: TStringField;
    qryFeeItemItemMax: TIntegerField;
    qryFeeItemTotMax: TIntegerField;
    qryFeeItemReserve1: TStringField;
    qryFeeItemReserve2: TStringField;
    qryFeeItemReserve3: TStringField;
    qryFeeItemReserve4: TStringField;
    qryFeeItemReserve5: TStringField;
    qryTKProcParkNo: TSmallintField;
    qryTKProcUnitNo: TWordField;
    qryTKProcProcDate: TStringField;
    qryTKProcProcTime: TStringField;
    qryTKProcTKType: TWordField;
    qryTKProcCarTypeNo: TWordField;
    qryTKProcFeeNo: TWordField;
    qryTKProcTKNo: TStringField;
    qryTKProcTKParkNo: TSmallintField;
    qryTKProcTKUnitNo: TWordField;
    qryTKProcInDate: TStringField;
    qryTKProcInTime: TStringField;
    qryTKProcParkingMin: TIntegerField;
    qryTKProcTotFee: TIntegerField;
    qryTKProcTotDC: TIntegerField;
    qryTKProcRealFee: TIntegerField;
    qryTKProcRecvAmt: TIntegerField;
    qryTKProcChange: TIntegerField;
    qryTKProcMNo: TWordField;
    qryTKProcChkClosing: TWordField;
    qryTKProcDCCnt: TWordField;
    qryTKProcUnPaid: TIntegerField;
    qryTKProcPayType: TWordField;
    qryTKProcReserve1: TStringField;
    qryTKProcReserve2: TStringField;
    qryTKProcReserve3: TStringField;
    qryTKProcReserve4: TStringField;
    qryTKProcReserve5: TStringField;
    qryTKProcFeeName: TStringField;
    qryDCDetail: TADOQuery;
    qryDCDetailParkNo: TSmallintField;
    qryDCDetailUnitNo: TWordField;
    qryDCDetailProcDate: TStringField;
    qryDCDetailProcTime: TStringField;
    qryDCDetailDCProcNo: TStringField;
    qryDCDetailDCNo: TWordField;
    qryDCDetailDCAmt: TIntegerField;
    qryDCDetailRealDCAmt: TIntegerField;
    qryDCInfo: TADOQuery;
    qryDCInfoParkNo: TSmallintField;
    qryDCInfoDCNo: TWordField;
    qryDCInfoDCName: TStringField;
    qryDCInfoDCValue: TIntegerField;
    qryDCInfoDCType: TWordField;
    qryDCInfoReserve1: TStringField;
    qryDCInfoReserve2: TStringField;
    qryDCInfoReserve3: TStringField;
    qryDCInfoReserve4: TStringField;
    qryDCInfoReserve5: TStringField;
    qryDCDetailDCName: TStringField;
    DBAdvGrid1: TDBAdvGrid;
    sb1: TStatusBar;
    btnSearch: TBitBtn;
    btnPrint: TBitBtn;
    btnClose: TBitBtn;
    Panel1: TPanel;
    Bevel14: TBevel;
    Label14: TLabel;
    Bevel2: TBevel;
    Label7: TLabel;
    Label8: TLabel;
    cmbSearch: TComboBox;
    edtSDate: TAdvDateTimePicker;
    edtSTime: TAdvDateTimePicker;
    edtEDate: TAdvDateTimePicker;
    edtETime: TAdvDateTimePicker;
    Panel2: TPanel;
    Bevel3: TBevel;
    Label1: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    Bevel4: TBevel;
    Label3: TLabel;
    Bevel5: TBevel;
    Label9: TLabel;
    edtTotMin: TAdvEdit;
    edtTotFee: TAdvEdit;
    edtTotDC: TAdvEdit;
    edtTotRealFee: TAdvEdit;
    btnExcel: TBitBtn;
    SaveDialog1: TSaveDialog;
    AdvGridExcelIO1: TAdvGridExcelIO;
    qryTKProcCarNo: TStringField;
    qryTKProcCommercialTariff: TWordField;
    qryTKProcSpecialTariff: TWordField;
    Bevel6: TBevel;
    Label4: TLabel;
    cmbPayType: TComboBox;
    qryUnitInfo: TADOQuery;
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
    qryTKProcUnitName: TStringField;
    procedure FormShow(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure qryTKProcFeeNameGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cmbSearchChange(Sender: TObject);
    procedure qryTKProcTKTypeGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure btnExcelClick(Sender: TObject);
    procedure qryTKProcPayTypeGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNProc: TfrmNProc;

implementation
uses
  Tables, Global;

{$R *.dfm}

procedure TfrmNProc.FormShow(Sender: TObject);
begin
  try
    qryFeeItem.Open;
    edtSDate.Date:= Now;
    edtEDate.Date:= Now;
    edtSDate.SetFocus;
  except
    on E: Exception do ExceptLogging('TfrmNProc.FormCreate: ' + E.Message);
  end;
end;

procedure TfrmNProc.btnSearchClick(Sender: TObject);
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

      if cmbSearch.ItemIndex = 0 then
      begin
        SQL.Add('Select * from TKProc where ProcDate >= :N1 and ProcDate <= :N2 ');
        Parameters.ParamByName('N1').Value:= sSDate;
        Parameters.ParamByName('N2').Value:= sEDate;
      end
      else
      if cmbSearch.ItemIndex = 1 then
      begin
        SQL.Add('Select * from TKProc where ProcDate = :N1 and ProcTime >= :N2 and ProcTime <= :N5 ');
        Parameters.ParamByName('N1').Value:= sSDate;
        Parameters.ParamByName('N2').Value:= sSTime;
        Parameters.ParamByName('N5').Value:= sETime;
      end;

      if cmbPayType.ItemIndex > 0 then
      begin
        if cmbPayType.ItemIndex = 1 then
          SQL.Add(' and PayType = 1')
        else
        if cmbPayType.ItemIndex = 2 then
          SQL.Add(' and PayType = 2');
      end;
      SQL.Add('Order By ParkNo, UnitNo, ProcDate, ProcTime');
      Open;

      if RecordCount > 0 then
      begin
        with qryTemp do
        begin
          Close;
          SQL.Clear;

          if cmbSearch.ItemIndex = 0 then
          begin
            SQL.Add('Select Sum(ParkingMin), Sum(TotFee), Sum(TotDC), Sum(RealFee) from TKProc ');
            SQL.Add('where ProcDate >= :N1 and ProcDate <= :N2 ');
            Parameters.ParamByName('N1').Value:= sSDate;
            Parameters.ParamByName('N2').Value:= sEDate;
          end
          else
          if cmbSearch.ItemIndex = 1 then
          begin
            SQL.Add('Select Sum(ParkingMin), Sum(TotFee), Sum(TotDC), Sum(RealFee) from TKProc ');
            SQL.Add('where ProcDate = :N1 and ProcTime >= :N2 and ProcTime <= :N5 ');
            Parameters.ParamByName('N1').Value:= sSDate;
            Parameters.ParamByName('N2').Value:= sSTime;
            Parameters.ParamByName('N5').Value:= sETime;
          end;
          Open;
          edtTotMin    .Text:= FieldByName('COLUMN1').AsString;
          edtTotFee    .Text:= FieldByName('COLUMN2').AsString;
          edtTotDC     .Text:= FieldByName('COLUMN3').AsString;
          edtTotRealFee.Text:= FieldByName('COLUMN4').AsString;
          edtTotMin    .AutoThousandSeparator:= True;
          edtTotFee    .AutoThousandSeparator:= True;
          edtTotDC     .AutoThousandSeparator:= True;
          edtTotRealFee.AutoThousandSeparator:= True;
        end;
        btnPrint.Enabled:= True;
        btnExcel.Enabled:= True;
        sb1.SimpleText:= '조회건수 : ' + IntToStr(RecordCount);
      end
      else
      begin
        btnPrint.Enabled:= False;
        btnExcel.Enabled:= False;
        edtTotMin.Text:= '0';
        edtTotFee.Text:= '0';
        edtTotDC.Text:= '0';
        edtTotRealFee.Text:= '0';
        sb1.SimpleText:= '';
      end;
    end;
  except
    on E: Exception do ExceptLogging('TfrmNProc.btnSearchClick: ' + E.Message);
  end;
end;

procedure TfrmNProc.btnCloseClick(Sender: TObject);
begin
  qryTKProc.Close;
  ModalResult := mrCancel;
  //Close;
end;

procedure TfrmNProc.qryTKProcFeeNameGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if qryTKProcFeeNo.Value = 0 then
    Text:= '일반요금'
  else
    Text:= qryTKProcFeeName.Value;
end;

procedure TfrmNProc.qryTKProcPayTypeGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if qryTKProcPayType.Value = 1 then
    Text:= '현금'
  else
  if qryTKProcPayType.Value = 2 then
    Text:= '신용카드';
end;

procedure TfrmNProc.cmbSearchChange(Sender: TObject);
begin
  if cmbSearch.ItemIndex = 0 then
  begin
    edtEDate.Enabled:= True;
    edtSTime.Enabled:= False;
    edtETime.Enabled:= False;
  end
  else
  if cmbSearch.ItemIndex = 1 then
  begin
    edtEDate.Enabled:= False;
    edtSTime.Enabled:= True;
    edtETime.Enabled:= True;
  end;
end;

procedure TfrmNProc.qryTKProcTKTypeGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  //티켓 종류(0:일반권, 1:정기권)
  Case qryTKProcTKType.Value of
    1 : Text:= '일반차량';
    2 : Text:= '정기차량';
    9 : Text:= '수동출차';
  end;
end;

procedure TfrmNProc.btnExcelClick(Sender: TObject);
begin
  try
    if savedialog1.Execute then
    begin
      advgridexcelio1.XLSExport(savedialog1.filename + '.xls');
      ShowMessage('엑셀파일로 저장완료!');
    end;
  except
    on E: Exception do ExceptLogging('TfrmNProc.btnExcelClick: ' + E.Message);
  end;
end;

end.
