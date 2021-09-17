unit RFSCData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids, BaseGrid, AdvGrid,
  DBAdvGrid, DB, tmsAdvGridExcel, ADODB;

type
  TfrmRFSCData = class(TForm)
    qryCustInfo: TADOQuery;
    qryCustInfoParkNo: TSmallintField;
    qryCustInfoTKType: TWordField;
    qryCustInfoGroupNo: TWordField;
    qryCustInfoTKNo: TStringField;
    qryCustInfoName: TStringField;
    qryCustInfoTelNo: TStringField;
    qryCustInfoCarNo: TStringField;
    qryCustInfoCompName: TStringField;
    qryCustInfoDeptName: TStringField;
    qryCustInfoAddress: TStringField;
    qryCustInfoIssueDate: TStringField;
    qryCustInfoIssueAmt: TIntegerField;
    qryCustInfoStatus: TWordField;
    qryCustInfoExpDateF: TStringField;
    qryCustInfoExpDateT: TStringField;
    qryCustInfoWPNo: TWordField;
    qryCustInfoLastParkNo: TSmallintField;
    qryCustInfoLastUnitNo: TWordField;
    qryCustInfoLastUseDate: TStringField;
    qryCustInfoLastUseTime: TStringField;
    qryCustInfoIOStatusNo: TWordField;
    qryCustInfoCurrAmt: TIntegerField;
    qryCustInfoAPB: TWordField;
    qryCustInfoCarTypeNo: TWordField;
    qryCustInfoMarkNo: TStringField;
    qryCustInfoReserve1: TStringField;
    qryCustInfoReserve2: TStringField;
    qryCustInfoReserve3: TStringField;
    qryCustInfoReserve4: TStringField;
    qryCustInfoReserve5: TStringField;
    qryCustInfoGroupName: TStringField;
    qryCustInfoIOStatusName: TStringField;
    qryCustInfoWPName: TStringField;
    qryGroup: TADOQuery;
    qryGroupParkNo: TSmallintField;
    qryGroupGroupNo: TWordField;
    qryGroupGroupName: TStringField;
    qryGroupAPB: TWordField;
    qryGroupStatus: TWordField;
    qryGroupGroupType: TWordField;
    qryGroupUseFeeItem: TWordField;
    qryGroupRemark: TStringField;
    qryGroupReserve1: TStringField;
    qryGroupReserve2: TStringField;
    qryGroupReserve3: TStringField;
    qryGroupReserve4: TStringField;
    qryGroupReserve5: TStringField;
    qryTemp: TADOQuery;
    SaveDialog1: TSaveDialog;
    AdvGridExcelIO1: TAdvGridExcelIO;
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
    qryIOStatus: TADOQuery;
    qryIOStatusIOStatusNo: TWordField;
    qryIOStatusIOStatusName: TStringField;
    qryIOStatusReserve1: TStringField;
    qryIOStatusReserve2: TStringField;
    qryIOStatusReserve3: TStringField;
    qryIOStatusReserve4: TStringField;
    qryIOStatusReserve5: TStringField;
    dsCustInfo: TDataSource;
    DBAdvGrid1: TDBAdvGrid;
    Panel1: TPanel;
    Bevel2: TBevel;
    Label8: TLabel;
    cmbGroupName: TComboBox;
    btnExpOver: TBitBtn;
    btnDelete: TBitBtn;
    btnSearch: TBitBtn;
    btnExcel: TBitBtn;
    btnClose: TBitBtn;
    btnPrint: TBitBtn;
    sb: TStatusBar;
    procedure qryCustInfoStatusGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryCustInfoAPBGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure FormShow(Sender: TObject);
    procedure cmbGroupNameChange(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure btnExpOverClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure DBAdvGrid1Click(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRFSCData: TfrmRFSCData;
  nGroupNo: Integer;
  sTKNo, sCarNo, sExpDateT: String;

implementation
uses
  Global, Tables;

{$R *.dfm}

procedure TfrmRFSCData.btnCloseClick(Sender: TObject);
begin
  qryCustinfo.Close;
  qryGroup.Close;
  qryIOStatus.Close;
  qryWP.Close;
  qryTemp.Close;
  Close;
end;

procedure TfrmRFSCData.btnDeleteClick(Sender: TObject);
begin
  if sExpDateT >= FormatDateTime('YYYY-MM-DD', Now) then
  begin
    ShowMessage('기간이 만료되지 않은 정기권은 삭제할 수 없습니다.' + #13#10 +
                '확인하여주세요!');

    sTKNo:= '';
    sCarNo:= '';
    sExpDateT:= '';
    btnDelete.Enabled:= False;
    Exit;
  end
  else
  begin
    with qryCustInfo do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Delete from CustInfo where TKNo = :N1 and CarNo = :N2 and GroupNo = :N3 and Reserve1 = :N4');
      Parameters.ParamByName('N1').Value:= sTKNo;
      Parameters.ParamByName('N2').Value:= sCarNo;
      Parameters.ParamByName('N3').Value:= nGroupNo;
      Parameters.ParamByName('N4').Value:= 'RF전용';
      ExecSQL;
      ShowMessage('선택한 정기권이 삭제되었습니다.');
    end;
  end;
  sTKNo:= '';
  sCarNo:= '';
  sExpDateT:= '';
  btnDelete.Enabled:= False;
  btnExpOverClick(Self);
end;

procedure TfrmRFSCData.btnExcelClick(Sender: TObject);
begin
  try
    if savedialog1.Execute then
    begin
      advgridexcelio1.XLSExport(savedialog1.filename + '.xls');
      ShowMessage('엑셀파일로 저장완료!');
    end;
  except
    on E: Exception do ExceptLogging('TfrmRFSCData.btnExcelClick: ' + E.Message);
  end;
end;

procedure TfrmRFSCData.btnExpOverClick(Sender: TObject);
begin
  try
    qryGroup.Active:= True;
    qryIOStatus.Active:= True;

    with qryCustinfo do
    begin
      Close;
      SQL.Clear;

      if cmbGroupName.ItemIndex > 0 then
      begin
        SQL.Add('Select * from CustInfo where GroupNo = :N1 and ExpDateT < :N2 and TKType = :N3 Order By CarNo');
        Parameters.ParamByName('N1').Value:= nGroupNo;
        Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', Now);
        Parameters.ParamByName('N3').Value:= 99;
      end
      else
      begin
        SQL.Add('Select * from CustInfo where ExpDateT < :N2 and TKType = :N3 Order By CarNo');
        Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', Now);
        Parameters.ParamByName('N3').Value:= 99;
      end;
      Open;

      if RecordCount > 0 then
      begin
        btnPrint.Enabled:= True;
        btnExcel.Enabled:= True;
        sb.SimpleText:= '기간만료 정기권 매수: ' + IntToStr(RecordCount) + '매';
      end
      else
      begin
        btnPrint.Enabled:= False;
        btnExcel.Enabled:= False;
        sb.SimpleText:= '';
      end;
    end;
  except
    on E: Exception do ExceptLogging('TfrmRFSCData.btnSearchClick: ' + E.Message);
  end;
end;

procedure TfrmRFSCData.btnSearchClick(Sender: TObject);
begin
  try
    qryGroup.Active:= True;
    qryIOStatus.Active:= True;

    with qryCustinfo do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from CustInfo ');

      if cmbGroupName.ItemIndex > 0 then
      begin
        SQL.Add('where GroupNo = :N1 and TKType = :N2 Order By TKNo');
        Parameters.ParamByName('N1').Value:= nGroupNo;
        Parameters.ParamByName('N2').Value:= 99;
      end
      else
      begin
        SQL.Add('where TKType = :N2 Order By TKNo');
        Parameters.ParamByName('N2').Value:= 99;
      end;
      Open;

      if RecordCount > 0 then
      begin
        btnPrint.Enabled:= True;
        btnExcel.Enabled:= True;
        sb.SimpleText:= '등록RF정기권 매수: ' + IntToStr(RecordCount) + '매';
      end
      else
      begin
        btnPrint.Enabled:= False;
        btnExcel.Enabled:= False;
        sb.SimpleText:= '';
      end;
    end;
  except
    on E: Exception do ExceptLogging('TfrmRFSCData.btnSearchClick: ' + E.Message);
  end;
end;

procedure TfrmRFSCData.cmbGroupNameChange(Sender: TObject);
begin
  if cmbGroupName.ItemIndex > 0 then
  begin
    with qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from GGroup where GroupName = :N1');
      Parameters.ParamByName('N1').Value:= cmbGroupName.Text;
      Open;

      if RecordCount > 0 then
        nGroupNo:= FieldByName('GroupNo').AsInteger
    end;
  end;
end;

procedure TfrmRFSCData.DBAdvGrid1Click(Sender: TObject);
begin
  if qryCustInfo.RecordCount > 0 then
  begin
    sTKNo := qryCustInfo.FieldByName('TKNo').AsString;
    sCarNo:= qryCustInfo.FieldByName('CarNo').AsString;
    sExpDateT:= qryCustInfo.FieldByName('ExpDateT').AsString;
    btnDelete.Enabled:= True;
  end;
end;

procedure TfrmRFSCData.FormShow(Sender: TObject);
begin
  cmbGroupName.Items.Clear;
  cmbGroupName.Items.Add('전체');

  with qryGroup do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * from GGroup where Reserve1 = :N1 Order by GroupNo');
    Parameters.ParamByName('N1').Value:= 'RF전용';
    Open;

    if RecordCount > 0 then
    begin
      First;
      nGroupNo:= FieldByName('GroupNo').AsInteger;

      while not Eof do
      begin
        cmbGroupName.Items.Add(FieldByName('GroupName').AsString);
        Next;
      end;
    end
    else
      btnSearch.Enabled:= False;
  end;
  cmbGroupName.ItemIndex:= 0;

  with qryWP do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * from WP');
    Open;
  end;
end;

procedure TfrmRFSCData.qryCustInfoAPBGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Case qryCustInfoAPB.Value of
    1: Text:= '자동';
    2: Text:= '1회조정';
    3: Text:= '사용안함';
  end;
end;

procedure TfrmRFSCData.qryCustInfoStatusGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Case qryCustInfoStatus.Value of
    0: Text:= '발매';
    1: Text:= '사용중';
    2: Text:= '기간만료';
    3: Text:= '전체봉쇄';
    4: Text:= '입차봉쇄';
    5: Text:= '출차봉쇄';
  end;
end;

end.
