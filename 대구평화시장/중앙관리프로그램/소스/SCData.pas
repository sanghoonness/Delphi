unit SCData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Grids, ToolWin, Printers,
  DB, ADODB, BaseGrid, AdvGrid, DBAdvGrid, AdvPanel,
  AdvToolBtn, AdvAppStyler, Buttons, tmsAdvGridExcel;

type
  TfrmSCData = class(TForm)
    sb: TStatusBar;
    qryCustInfo: TADOQuery;
    dsCustInfo: TDataSource;
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
    qryGroup: TADOQuery;
    qryIOStatus: TADOQuery;
    qryIOStatusIOStatusNo: TWordField;
    qryIOStatusIOStatusName: TStringField;
    qryIOStatusReserve1: TStringField;
    qryIOStatusReserve2: TStringField;
    qryIOStatusReserve3: TStringField;
    qryIOStatusReserve4: TStringField;
    qryIOStatusReserve5: TStringField;
    qryGroupParkNo: TSmallintField;
    qryGroupGroupNo: TWordField;
    qryGroupGroupName: TStringField;
    qryGroupAPB: TWordField;
    qryGroupStatus: TWordField;
    qryGroupRemark: TStringField;
    qryGroupReserve1: TStringField;
    qryGroupReserve2: TStringField;
    qryGroupReserve3: TStringField;
    qryGroupReserve4: TStringField;
    qryGroupReserve5: TStringField;
    qryCustInfoGroupName: TStringField;
    qryCustInfoIOStatusName: TStringField;
    qryTemp: TADOQuery;
    DBAdvGrid1: TDBAdvGrid;
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
    qryCustInfoWPName: TStringField;
    Panel1: TPanel;
    Bevel2: TBevel;
    Label8: TLabel;
    cmbGroupName: TComboBox;
    btnSearch: TBitBtn;
    btnPrint: TBitBtn;
    btnClose: TBitBtn;
    SaveDialog1: TSaveDialog;
    AdvGridExcelIO1: TAdvGridExcelIO;
    btnExcel: TBitBtn;
    btnExpOver: TBitBtn;
    btnDelete: TBitBtn;
    qryGroupGroupType: TWordField;
    qryGroupUseFeeItem: TWordField;
    Bevel1: TBevel;
    Label1: TLabel;
    cmbType: TComboBox;
    edtSeek: TEdit;
    procedure btnCloseClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qryCustInfoStatusGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryCustInfoAPBGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cmbGroupNameChange(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure btnExpOverClick(Sender: TObject);
    procedure DBAdvGrid1Click(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSCData: TfrmSCData;
  nGroupNo, nDelGroupNo: Integer;
  sTKNo, sCarNo, sExpDateT: String;

implementation
uses
  Global, Tables;

{$R *.dfm}

procedure TfrmSCData.btnCloseClick(Sender: TObject);
begin
  qryCustinfo.Close;
  qryGroup.Close;
  qryIOStatus.Close;
  qryWP.Close;
  qryTemp.Close;
  Close;
end;

procedure TfrmSCData.btnSearchClick(Sender: TObject);
begin
  try
    qryGroup.Active:= True;
    qryIOStatus.Active:= True;

    if (cmbType.ItemIndex > 0) and (edtSeek.Text = '') then
    begin
      case cmbType.ItemIndex of
        1: ShowMessage('차량번호를 입력하여주세요');
        2: ShowMessage('성명을 입력하여주세요');
        3: ShowMessage('회사명을 입력하여주세요');
      end;
      edtSeek.SetFocus;
      Exit;
    end;

    with qryCustinfo do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from CustInfo ');

      if cmbGroupName.ItemIndex > 0 then
      begin
        SQL.Add('where GroupNo = :N1 and TKType = :N2 ');
        Parameters.ParamByName('N1').Value:= nGroupNo;
        Parameters.ParamByName('N2').Value:= 2;
      end
      else
      begin
        SQL.Add('where TKType = :N2 ');
        Parameters.ParamByName('N2').Value:= 2;
      end;

      if cmbType.ItemIndex > 0 then
      begin
        case cmbType.ItemIndex of
          1: begin
               SQL.Add('and CarNo like ' + MG_MakeStr('%' + Trim(edtSeek.Text) + '%'));
               SQL.Add(' Order By CarNo');
          end;
          2: begin
               SQL.Add('and Name like ' + MG_MakeStr('%' + Trim(edtSeek.Text) + '%'));
               SQL.Add(' Order By Name');
          end;
          3: begin
               SQL.Add('and CompName like ' + MG_MakeStr('%' + Trim(edtSeek.Text) + '%'));
               SQL.Add(' Order By CompName');
          end;
        end;
      end
      else
      begin
        SQL.Add(' Order By CarNo');
      end;
      Open;

      if RecordCount > 0 then
      begin
        btnPrint.Enabled:= True;
        btnExcel.Enabled:= True;
        sb.SimpleText:= '등록정기차량 대수: ' + IntToStr(RecordCount) + '대';
      end
      else
      begin
        btnPrint.Enabled:= False;
        btnExcel.Enabled:= False;
        sb.SimpleText:= '';
      end;
    end;
  except
    on E: Exception do ExceptLogging('TfrmSCData.btnSearchClick: ' + E.Message);
  end;
end;

procedure TfrmSCData.FormShow(Sender: TObject);
begin
  cmbGroupName.Items.Clear;
  cmbGroupName.Items.Add('전체');

  with qryGroup do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * from GGroup where Reserve1 is null Order by GroupNo');
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

  with qryTemp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Update CustInfo ');
    SQL.Add('Set Status = :N1 ');
    SQL.Add('Where ParkNo = :N2 and TKType = :N3 and Status < :N4 and ExpDateT < :N5');
    Parameters.ParamByName('N1').Value:= 2;
    Parameters.ParamByName('N2').Value:= nCurrParkNo;
    Parameters.ParamByName('N3').Value:= 2;
    Parameters.ParamByName('N4').Value:= 2;
    Parameters.ParamByname('N5').Value:= FormatDateTime('YYYY-MM-DD', Now);
    ExecSql;
  end;
end;

procedure TfrmSCData.qryCustInfoStatusGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
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

procedure TfrmSCData.qryCustInfoAPBGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Case qryCustInfoAPB.Value of
    1: Text:= '자동';
    2: Text:= '1회조정';
    3: Text:= '사용안함';
  end;
end;

procedure TfrmSCData.cmbGroupNameChange(Sender: TObject);
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

procedure TfrmSCData.btnExcelClick(Sender: TObject);
begin
  try
    if savedialog1.Execute then
    begin
      advgridexcelio1.XLSExport(savedialog1.filename + '.xls');
      ShowMessage('엑셀파일로 저장완료!');
    end;
  except
    on E: Exception do ExceptLogging('TfrmSCData.btnExcelClick: ' + E.Message);
  end;
end;

procedure TfrmSCData.btnExpOverClick(Sender: TObject);
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
        Parameters.ParamByName('N3').Value:= 2;
      end
      else
      begin
        SQL.Add('Select * from CustInfo where ExpDateT < :N2 and TKType = :N3 Order By CarNo');
        Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', Now);
        Parameters.ParamByName('N3').Value:= 2;
      end;
      Open;

      if RecordCount > 0 then
      begin
        btnPrint.Enabled:= True;
        btnExcel.Enabled:= True;
        sb.SimpleText:= '기간만료 정기차량 대수: ' + IntToStr(RecordCount) + '대';
      end
      else
      begin
        btnPrint.Enabled:= False;
        btnExcel.Enabled:= False;
        sb.SimpleText:= '';
      end;
    end;
  except
    on E: Exception do ExceptLogging('TfrmSCData.btnSearchClick: ' + E.Message);
  end;
end;

procedure TfrmSCData.DBAdvGrid1Click(Sender: TObject);
begin
  if qryCustInfo.RecordCount > 0 then
  begin
    nDelGroupNo:= qryCustInfo.FieldByName('GroupNo').AsInteger;
    sTKNo := qryCustInfo.FieldByName('TKNo').AsString;
    sCarNo:= qryCustInfo.FieldByName('CarNo').AsString;
    sExpDateT:= qryCustInfo.FieldByName('ExpDateT').AsString;
    btnDelete.Enabled:= True;
  end;
end;

procedure TfrmSCData.btnDeleteClick(Sender: TObject);
begin
  if sExpDateT >= FormatDateTime('YYYY-MM-DD', Now) then
  begin
    ShowMessage('기간이 만료되지 않은 차량은 삭제할 수 없습니다.' + #13#10 +
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
      SQL.Add('Delete from CustInfo where TKNo = :N1 and CarNo = :N2 and GroupNo = :N3');
      Parameters.ParamByName('N1').Value:= sTKNo;
      Parameters.ParamByName('N2').Value:= sCarNo;
      Parameters.ParamByName('N3').Value:= nDelGroupNo;
      ExecSQL;
      ShowMessage('선택한 차량이 삭제되었습니다.');
    end;
  end;
  sTKNo:= '';
  sCarNo:= '';
  sExpDateT:= '';
  btnDelete.Enabled:= False;
  btnExpOverClick(Self);
end;

end.
