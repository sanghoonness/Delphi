unit RFSCCustInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, AdvSpin, Mask, AdvEdit, AdvCombo, Grids, BaseGrid,
  AdvGrid, DBAdvGrid, ExtCtrls, AdvPanel, tmsAdvGridExcel, DB, ADODB, AdvObj;

type
  TfrmRFSCCustInfo = class(TForm)
    qryCustInfo: TADOQuery;
    qryCustInfoParkNo: TSmallintField;
    qryCustInfoTKType: TWordField;
    qryCustInfoGroupNo: TSmallintField;
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
    qryCustInfoLastUnitNo: TSmallintField;
    qryCustInfoLastUseDate: TStringField;
    qryCustInfoLastUseTime: TStringField;
    qryCustInfoIOStatusNo: TWordField;
    qryCustInfoCurrAmt: TIntegerField;
    qryCustInfoAPB: TWordField;
    qryCustInfoCarType: TWordField;
    qryCustInfoMarkNo: TStringField;
    qryCustInfoReserve1: TStringField;
    qryCustInfoReserve2: TStringField;
    qryCustInfoReserve3: TStringField;
    qryCustInfoReserve4: TStringField;
    qryCustInfoReserve5: TStringField;
    qryGroup: TADOQuery;
    qryGroupParkNo: TSmallintField;
    qryGroupGroupNo: TSmallintField;
    qryGroupGroupName: TStringField;
    qryGroupAPB: TWordField;
    qryGroupStatus: TWordField;
    qryGroupRemark: TStringField;
    qryGroupGroupType: TWordField;
    qryGroupUseFeeItem: TWordField;
    qryGroupReserve1: TStringField;
    qryGroupReserve2: TStringField;
    qryGroupReserve3: TStringField;
    qryGroupReserve4: TStringField;
    qryGroupReserve5: TStringField;
    dsCustInfo: TDataSource;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    eCustInfo: TAdvGridExcelIO;
    AdvPanel1: TAdvPanel;
    dgCustInfo: TDBAdvGrid;
    AdvPanel2: TAdvPanel;
    cmbGroupNo: TAdvComboBox;
    edtGroupName: TAdvEdit;
    cmbLastUseStatus: TAdvComboBox;
    edtTKNo: TAdvEdit;
    edtName: TAdvEdit;
    edtTelNo: TAdvEdit;
    edtCarNo: TAdvEdit;
    edtCompName: TAdvEdit;
    edtDeptName: TAdvEdit;
    edtAddress: TAdvEdit;
    cmbStatus: TAdvComboBox;
    edtIssueDate: TAdvMaskEdit;
    edtIssueAmt: TAdvSpinEdit;
    edtExpDateF: TAdvMaskEdit;
    edtExpDateT: TAdvMaskEdit;
    edtLastUnitNo: TAdvEdit;
    edtLastUseDate: TAdvMaskEdit;
    edtLastUseTime: TAdvMaskEdit;
    cmbWPNo: TAdvComboBox;
    cmbAPB: TAdvComboBox;
    edtWPName: TAdvEdit;
    cmbParkNo: TAdvComboBox;
    edtCurrAmt: TAdvSpinEdit;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    btnDelete: TBitBtn;
    btnClose: TBitBtn;
    btnSeek: TBitBtn;
    btnExcel: TBitBtn;
    btnAllAdd: TBitBtn;
    qryTemp: TADOQuery;
    qryWP: TADOQuery;
    procedure cmbWPNoChange(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure edtTKNoExit(Sender: TObject);
    procedure dgCustInfoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnSeekClick(Sender: TObject);
    procedure cmbGroupNoChange(Sender: TObject);
  private
    { Private declarations }
    procedure frmClear;
  public
    { Public declarations }
  end;

  RECGroup = record
    nGroupNo  : Integer;
    sGroupName: String;
  end;

var
  frmRFSCCustInfo: TfrmRFSCCustInfo;
  nSelect: Byte = 0; //0:Add, 1:Modify
  RGroup : Array[1..50] of RECGroup;
  nGroupCnt: Integer;

implementation
uses
  Global, Tables, RFSeek, Progress;

{$R *.dfm}

procedure TfrmRFSCCustInfo.frmClear;
begin
  try
    edtGroupName  .Text := '';
    edtTkNo       .Text := '';
    edtName       .Text := '';
    edtTelNo      .Text := '';
    edtCarNo      .Text := '';
    edtCompName   .Text := '';
    edtDeptName   .Text := '';
    edtAddress    .Text := '';
    cmbStatus     .ItemIndex:= -1;
    edtIssueDate  .Text := '';
    edtIssueAmt   .Value:= 0;
    edtExpDateF   .Text := '';
    edtExpDateT   .Text := '';
    edtLastUnitNo .Text := '';
    edtLastUseDate.Text := '';
    edtLastUseTime.Text := '';
    edtWPName     .Text := '';
    edtCurrAmt    .Value:= 0;
    cmbWPNo       .ItemIndex:= 0;
    cmbAPB        .ItemIndex:= -1;
    cmbWPNoChange(Self);
    btnDelete.Enabled:= False;
    btnCancel.Enabled:= False;
    nSelect:= 0;
  except
    on E: Exception do ExceptLogging('TfrmRFSCCustInfo.frmClear: ' + aString(E.Message));
  end;
end;

procedure TfrmRFSCCustInfo.btnCancelClick(Sender: TObject);
begin
  frmClear;
end;

procedure TfrmRFSCCustInfo.btnCloseClick(Sender: TObject);
begin
  dmTables.qryCustInfo.Close;
  dmTables.qryGroup.Close;
  dmTables.qryWP.Close;
  dmTables.qryTemp.Close;
  Close;
end;

procedure TfrmRFSCCustInfo.btnDeleteClick(Sender: TObject);
begin
  try
    if MessageDlg('선택한 항목을 삭제할까요?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;

    with dmTables.qryCustinfo do
    begin
      try
        dmTables.ADODB.BeginTrans;
        Close;
        SQL.Clear;
        SQL.Add('Delete from CustInfo where ParkNo = :N1 and TKNo = :N2');
        Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
        Parameters.ParamByName('N2').Value:= edtTKNo.Text;
        ExecSQL;
        dmTables.ADODB.CommitTrans;
      except
        on E: Exception do
        begin
          dmTables.ADODB.RollbackTrans;
          ExceptLogging('TfrmRFSCCustInfo.btnDeleteClick: ' + aString(E.Message));
          ShowMessage('삭제중 오류발생! 관리자에 문의바랍니다.');
        end;
      end;
      Close;
      SQL.Clear;
      SQL.Add('Select * from CustInfo where ParkNo = :N1 and TKType = :N2 and GroupNo = :N3');
      Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
      Parameters.ParamByName('N2').Value:= 99;
      Parameters.ParamByName('N3').Value:= StrToInt(cmbGroupNo.Text);
      Open;
    end;
    frmClear;
  except
    on E: Exception do ExceptLogging('TfrmRFSCCustInfo.btnDeleteClick: ' + aString(E.Message));
  end;
end;

procedure TfrmRFSCCustInfo.btnExcelClick(Sender: TObject);
begin
  try
    if savedialog1.Execute then
    begin
      eCustInfo.XLSExport(savedialog1.filename + '.xls');
      ShowMessage('엑셀파일로 저장완료!');
    end;
  except
    on E: Exception do ExceptLogging('TfrmRFSCCustInfo.btnExcelClick: ' + aString(E.Message));
  end;
end;

procedure TfrmRFSCCustInfo.btnSaveClick(Sender: TObject);
begin
  try
    btnSeek.Enabled:= True;
    cmbGroupNo.Enabled:= True;

    if Length(MG_StrTrim(aString(edtTKNo.Text), ' ')) < 8 then
    begin
      ShowMessage('정기권번호를 정확히 입력하여주세요!');
      edtTKNo.SetFocus;
      Exit;
    end;

    try
      StrToDate(edtExpDateF.Text);
    except
      on E: Exception do
      begin
        ShowMessage('유효기간을 정확히 입력하여주세요!');
        edtExpDateF.SetFocus;
        Exit;
      end;
    end;

    try
      StrToDate(edtExpDateT.Text);
    except
      on E: Exception do
      begin
        ShowMessage('유효기간을 정확히 입력하여주세요!');
        edtExpDateT.SetFocus;
        Exit;
      end;
    end;

    if edtExpDateF.Text > edtExpDateT.Text then
    begin
      ShowMessage('유효기간을 확인하고 입력하여주세요!');
      Exit;
    end;

    with dmTables do
    begin
      Case nSelect of
        0: begin
             ShowMessage('정기차량등록 메뉴를 이용하여 주세요!');
           end;

        1: begin
             with qryCustInfo do
             begin
               try
                 dmTables.ADODB.BeginTrans;
                 Close;
                 SQL.Clear;
                 SQL.Add('Update CustInfo ');
                 SQL.Add('Set Name = :N1, TelNo = :N2, CarNo = :N3, CompName = :N4, ');
                 SQL.Add('DeptName = :N5, Address = :N6, Status = :N7, APB = :N8, ');
                 SQL.Add('IOStatusNo = :N14, WPNo = :N15 ');
                 SQL.Add('Where ParkNo = :N9 and TKType = :N10 and GroupNo = :N11 and TKNo = :N12');
                 Parameters.ParamByName('N1' ).Value:= edtName.Text;
                 Parameters.ParamByName('N2' ).Value:= edtTelNo.Text;
                 Parameters.ParamByName('N3' ).Value:= MG_StrTrim(aString(edtCarNo.Text), ' ');
                 Parameters.ParamByName('N4' ).Value:= edtCompName.Text;
                 Parameters.ParamByName('N5' ).Value:= edtDeptName.Text;
                 Parameters.ParamByName('N6' ).Value:= edtAddress.Text;
                 Parameters.ParamByName('N7' ).Value:= cmbStatus.ItemIndex;
                 Parameters.ParamByName('N8' ).Value:= cmbAPB.ItemIndex+1;
                 Parameters.ParamByName('N9' ).Value:= StrToInt(cmbParkNo.Text);
                 Parameters.ParamByName('N10').Value:= 99;
                 Parameters.ParamByname('N11').Value:= StrToInt(cmbGroupNo.Text);
                 Parameters.ParamByName('N12').Value:= edtTKNo.Text;
                 Parameters.ParamByName('N14').Value:= cmbLastUseStatus.ItemIndex+1;
                 Parameters.ParamByName('N15').Value:= StrToInt(cmbWPNo.Text);
                 ExecSql;
                 dmTables.ADODB.CommitTrans;
               except
                 on E: Exception do
                 begin
                   dmTables.ADODB.RollbackTrans;
                   ExceptLogging('TfrmCustInfo.btnSaveClick: ' + aString(E.Message));
                   ShowMessage('저장중 오류발생! 관리자에 문의바랍니다.');
                 end;
               end;

               Close;
               SQL.Clear;
               SQL.Add('Select * from CustInfo where ParkNo = :N1 and TKType = :N2 and GroupNo = :N3');
               Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
               Parameters.ParamByName('N2').Value:= 99;
               Parameters.ParamByName('N3').Value:= StrToInt(cmbGroupNo.Text);
               Open;
             end;
           end;
      end;
    end;
    frmClear;
  except
    on E: Exception do
    begin
      ExceptLogging('TfrmRFSCCustInfo.btnSaveClick: ' + aString(E.Message));
    end;
  end;
end;

procedure TfrmRFSCCustInfo.btnSeekClick(Sender: TObject);
begin
  NextModalDialog(TfrmRFSeek.Create(Self));
end;

procedure TfrmRFSCCustInfo.cmbGroupNoChange(Sender: TObject);
var
  i: Integer;
begin
  with dmTables.qryCustInfo do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * from CustInfo where ParkNo = :N1 and TkType = :N2 and GroupNo = :N3');
    Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
    Parameters.ParamByName('N2').Value:= 99;
    Parameters.ParamByName('N3').Value:= StrToInt(cmbGroupNo.Text);
    Open;
  end;

  for i:= 1 to nGroupCnt do
    if RGroup[i].nGroupNo = StrToInt(cmbGroupNo.Text) then
    begin
      edtGroupName.Text:= RGroup[i].sGroupName;
      Break;
    end;
end;

procedure TfrmRFSCCustInfo.cmbWPNoChange(Sender: TObject);
begin
  with dmTables.qryWP do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select WPName from WP where WPNo = :N1');
    Parameters.ParamByName('N1').Value:= StrToInt(cmbWPNo.Text);
    Open;

    if RecordCount > 0 then
      edtWPName.Text:= FieldByName('WPName').AsString
    else
      edtWPName.Text:= '';
  end;
end;

procedure TfrmRFSCCustInfo.dgCustInfoClick(Sender: TObject);
begin
  try
    with dmTables do
    begin
      with qryTemp do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select * from CustInfo where ParkNo = :N1 and TkType = :N2 and GroupNo = :N3');
        Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
        Parameters.ParamByName('N2').Value:= 99;
        Parameters.ParamByName('N3').Value:= StrToInt(cmbGroupNo.Text);
        Open;
        if RecordCount <= 0 then Exit;
      end;

      with qryCustInfo do
      begin
        edtTKNo       .Text:= FieldByName('TKNo').AsString;
        edtName       .Text:= FieldByName('Name').AsString;
        edtTelNo      .Text:= FieldByName('TelNo').AsString;
        edtCarNo      .Text:= FieldByName('CarNo').AsString;
        edtCompName   .Text:= FieldByName('CompName').AsString;
        edtDeptName   .Text:= FieldByName('DeptName').AsString;
        edtAddress    .Text:= FieldByName('Address').AsString;
        edtIssueDate  .Text:= FieldByName('IssueDate').AsString;
        edtIssueAmt   .Value:= FieldByName('IssueAmt').AsInteger;
        cmbStatus     .ItemIndex:= StrToInt(FieldByName('Status').AsString);
        edtExpDateF   .TExt:= FieldByName('ExpDateF').AsString;
        edtExpDateT   .Text:= FieldByName('ExpDateT').AsString;
        cmbWPNo       .Text:= IntToStr(FieldByName('WPNo').AsInteger);
        edtLastUnitNo .Text:= IntToStr(FieldByName('LastUnitNo').AsInteger);
        edtLastUseDate.Text:= FieldByName('LastUseDate').AsString;
        edtLastUseTime.Text:= FieldByName('LastUseTime').AsString;
        cmbAPB        .ItemIndex:= FieldByName('APB').AsInteger - 1;
        edtCurrAmt.Value:= FieldByName('CurrAmt').AsInteger;
        cmbLastUseStatus.ItemIndex:= FieldByName('IOStatusNo').AsInteger - 1;
        cmbWPNoChange(Self);
      end;
    end;
    btnCancel.Enabled:= True;
    btnDelete.Enabled:= True;
    nSelect:= 1;
  except
    on E: Exception do ExceptLogging('TfrmRFSCCustInfo.dgCustomClick: ' + aString(E.Message));
  end;
end;

procedure TfrmRFSCCustInfo.edtTKNoExit(Sender: TObject);
begin
  edtTKNo.Text:= MG_InsZero(edtTKNo.Text, 8);
end;

procedure TfrmRFSCCustInfo.FormShow(Sender: TObject);
var
  i: Integer;
begin
  try
    for i:= 1 to 50 do
    begin
      RGroup[i].nGroupNo:= 0;
      RGroup[i].sGroupName:= '';
    end;

    with dmTables.qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from ParkInfo');
      Open;

      if RecordCount <= 0 then
      begin
        btnSave.Enabled:= False;
        ShowMessage('주차장을 먼저 설정하여주세요!');
        Exit;
      end
      else
      begin
        cmbParkNo.Items.Clear;

        while not Eof do
        begin
          cmbParkNo.Items.Add(IntToStr(FieldByName('ParkNo').AsInteger));
          Next;
        end;
        cmbParkNo.ItemIndex:= 0;
      end;
    end;

    with dmTables.qryGroup do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from GGroup Where ParkNo = :N1 and Reserve1 = :N2');
      Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
      Parameters.ParamByName('N2').Value:= 'RF전용';
      Open;

      nGroupCnt:= RecordCount;

      if RecordCount <= 0 then
      begin
        btnSave.Enabled:= False;
        ShowMessage('RF정기권그룹을 먼저 등록하여주세요!');
        Exit;
      end;
      cmbGroupNo.Items.Clear;
      cmbGroupNo.Enabled:= True;
      edtGroupName.Visible:= True;
      cmbGroupNo.Items.Clear;

      First;
      edtGroupName.Text:= FieldByName('GroupName').AsString;
      i:= 1;

      while not Eof do
      begin
        cmbGroupNo.Items.Add(IntToStr(FieldByName('GroupNo').AsInteger));
        RGroup[i].nGroupNo  := FieldByName('GroupNo').AsInteger;
        RGroup[i].sGroupName:= FieldByName('GroupName').AsString;
        i:= i+1;
        Next;
      end;
      cmbGroupNo.ItemIndex:= 0;
    end;
    cmbWPNo.Items.Clear;

    with dmTables.qryWP do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from WP where ParkNo = :N1');
      Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
      Open;

      if RecordCount <= 0 then
      begin
        btnSave.Enabled:= False;
        ShowMessage('환경설정에서 사용시간대를 설정하여주세요!');
        Exit;
      end;
      edtWPName.Text:= FieldByName('WPName').AsString;

      while not Eof do
      begin
        cmbWPNo.Items.Add(IntToStr(FieldByName('WPNo').AsInteger));
        Next;
      end;
      cmbWPNo.ItemIndex:= 0;
    end;

    with dmTables.qryCustInfo do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from CustInfo where ParkNo = :N1 and TkType = :N2 and GroupNo = :N3');
      Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
      Parameters.ParamByName('N2').Value:= 99;
      Parameters.ParamByName('N3').Value:= StrToInt(cmbGroupNo.Text);
      Open;
    end;
    nSelect:= 0;
  except
    on E: Exception do ExceptLogging('TfrmRFSCCustInfo.FormShow: ' + aString(E.Message));
  end;
end;

end.
