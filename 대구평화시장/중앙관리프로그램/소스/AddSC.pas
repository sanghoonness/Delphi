unit AddSC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, AdvGlowButton, Mask,   StdCtrls, DB, ADODB, Buttons,
  AdvToolBtn, Spin, AdvPanel, AdPort, AdvDateTimePicker;

type
  TfrmAddSC = class(TForm)
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
    qry1: TADOQuery;
    qryGroup: TADOQuery;
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
    dsCustInfo: TDataSource;
    sb1: TStatusBar;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    btnClose: TBitBtn;
    btnSeek: TBitBtn;
    Panel1: TPanel;
    Bevel1: TBevel;
    Label2: TLabel;
    Bevel9: TBevel;
    Label17: TLabel;
    Bevel2: TBevel;
    Label3: TLabel;
    Bevel3: TBevel;
    Label4: TLabel;
    Bevel4: TBevel;
    Label5: TLabel;
    Bevel5: TBevel;
    Label6: TLabel;
    Bevel6: TBevel;
    Label7: TLabel;
    Bevel8: TBevel;
    Label9: TLabel;
    Bevel10: TBevel;
    Label10: TLabel;
    Bevel11: TBevel;
    Label11: TLabel;
    Bevel12: TBevel;
    Label12: TLabel;
    Bevel14: TBevel;
    Label13: TLabel;
    Bevel15: TBevel;
    Label14: TLabel;
    edtGroupName: TEdit;
    cmbAPB: TComboBox;
    cmbGroupNo: TComboBox;
    edtTKNo: TEdit;
    edtMarkNo: TEdit;
    edtAmount: TSpinEdit;
    cmbWP: TComboBox;
    edtWPName: TEdit;
    edtName: TEdit;
    edtTelNo: TEdit;
    edtCarNo: TEdit;
    edtCompName: TEdit;
    edtDeptName: TEdit;
    edtAddress: TEdit;
    qryGroupGroupType: TWordField;
    qryGroupUseFeeItem: TWordField;
    Bevel7: TBevel;
    Label8: TLabel;
    edtCarType: TEdit;
    edtExpDateF: TAdvDateTimePicker;
    edtExpDateT: TAdvDateTimePicker;
    Bevel17: TBevel;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    pnSeek: TPanel;
    rgSeek: TRadioGroup;
    edtSeek: TEdit;
    BitBtn1: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnSeekClick(Sender: TObject);
    procedure edtSeekKeyPress(Sender: TObject; var Key: Char);
    procedure cmbGroupNoChange(Sender: TObject);
    procedure cmbWPChange(Sender: TObject);
    procedure edtCarNoExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  RECGroup = record
    nGroupNo  : Integer;
    sGroupName: String;
  end;

  RECWP = record
    nWPNo  : Integer;
    sWPName: String;
  end;

var
  frmAddSC: TfrmAddSC;
  RGroup : Array[1..50] of RECGroup;
  RWP    : Array[1..50] of RECWp;
  sSCChk: String;
  nStatus: Byte = 0;
  nGroupCnt, nWPCnt: Word;
  nPrvGroupNo: Integer;

implementation
uses
  Tables, Global, Main;

{$R *.dfm}

procedure TfrmAddSC.FormShow(Sender: TObject);
var
  i: Byte;
begin
  try
    for i:= 1 to 50 do
    begin
      RGroup[i].nGroupNo:= 0;
      RGroup[i].sGroupName:= '';
    end;

    with qry1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from ParkInfo');
      Open;

      if RecordCount <= 0 then
      begin
        ShowMessage('주차장을 먼저 설정하여주세요!');
        Exit;
      end;
    end;

    with qryGroup do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from GGroup Where ParkNo = :N1 and Reserve1 is null');
      Parameters.ParamByName('N1').Value:= nCurrParkNo;
      Open;
      nGroupCnt:= RecordCount;

      if RecordCount <= 0 then
      begin
        ShowMessage('정기차량그룹을 먼저 등록하여주세요!');
        Exit;
      end;
      cmbGroupNo.Items.Clear;
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

    with qry1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from WP Where ParkNo = :N1 Order By WPNo');
      Parameters.ParamByName('N1').Value:= nCurrParkNo;
      Open;
      nWPCnt:= RecordCount;

      if RecordCount <= 0 then
      begin
        ShowMessage('사용시간대를 먼저 등록하여주세요!');
        Exit;
      end;
      cmbWP.Items.Clear;
      cmbWP.Enabled:= True;
      edtWPName.Visible:= True;

      First;
      edtWPName.Text:= FieldByName('WPName').AsString;
      i:= 1;

      while not Eof do
      begin
        cmbWP.Items.Add(IntToStr(FieldByName('WPNo').AsInteger));
        RWP[i].nWPNo  := FieldByName('WPNo').AsInteger;
        RWP[i].sWPName:= FieldByName('WPName').AsString;
        i:= i+1;
        Next;
      end;
      cmbWP.ItemIndex:= 0;
    end;
    edtExpDateF.Date:= Now;
    edtExpDateT.Date:= StrToDate(MG_AddDate(FormatDateTime('YYYY-MM-DD', Now), 30));
  except
    on E: Exception do ExceptLogging('TfrmAddSC.FormShow: ' + E.Message);
  end;
end;

procedure TfrmAddSC.BitBtn1Click(Sender: TObject);
begin
  pnSeek.Visible:= not pnSeek.Visible;
  edtCarNo.SetFocus;
end;

procedure TfrmAddSC.btnCancelClick(Sender: TObject);
begin
  sSCChk:= '';
  edtMarkNo.Text:= '';
  edtTKNo.Text:= '';
  cmbAPB.ItemIndex:= 2;
  edtName.Text:= '';
  edtTelNo.Text:= '';
  edtCarNo.Text:= '';
  edtCompName.Text:= '';
  edtDeptName.Text:= '';
  edtAddress.Text:= '';
  edtExpDateF.SetFocus;
end;

procedure TfrmAddSC.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAddSC.btnSaveClick(Sender: TObject);
var
  sData, sSend: String;
  i: Integer;
begin
  try
    if Length(MG_StrTrim(edtCarNo.Text, ' ')) < 8 then
    begin
      ShowMessage('차량번호를 정확히 입력하여주세요!');
      edtCarNo.SetFocus;
      Exit;
    end;

    if edtExpDateF.Date > edtExpDateT.Date then
    begin
      ShowMessage('유효기간을 확인하고 입력하여주세요!');
      Exit;
    end;

    with qry1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from CustInfo where TKNo = :N1 and TKType = :N2');
      Parameters.ParamByName('N1').Value:= MG_StrTrim(edtTKNo.Text, ' ');
      Parameters.ParamByName('N2').Value:= 2;
      Open;

      if RecordCount < 0 then
      begin
        ShowMessage('해당 차량에 대한 자료가 없습니다. 확인하여주세요!');
        edtMarkNo.Text:= '';
        edtTKNo.Text:= '';
        Exit;
      end;

      Close;
      SQL.Clear;
      SQL.Add('Update CustInfo ');
      SQL.Add('Set ExpDateF = :N1, ExpDateT = :N2, APB = :N3, Name = :N4, TelNo = :N5, ');
      SQL.Add('CarNo = :N6, CompName = :N7, DeptName = :N8, Address = :N9, WPNo = :N14, ');
      SQL.Add('IssueAmt = :N15, Reserve1 = :N16, GroupNo = :N17, Status = :N18 ');
      SQL.Add('Where ParkNo = :N10 and TKType = :N11 and GroupNo = :N12 and TKNo = :N13');
      Parameters.ParamByName('N1' ).Value:= FormatDateTime('YYYY-MM-DD', edtExpDateF.Date);
      Parameters.ParamByName('N2' ).Value:= FormatDateTime('YYYY-MM-DD', edtExpDateT.Date);
      Parameters.ParamByName('N3' ).Value:= cmbAPB.ItemIndex + 1;
      Parameters.ParamByName('N4' ).Value:= edtName.Text;
      Parameters.ParamByName('N5' ).Value:= edtTelNo.Text;
      Parameters.ParamByName('N6' ).Value:= edtCarNo.Text;
      Parameters.ParamByName('N7' ).Value:= edtCompName.Text;
      Parameters.ParamByName('N8' ).Value:= edtDeptName.Text;
      Parameters.ParamByName('N9' ).Value:= edtAddress.Text;
      Parameters.ParamByName('N10').Value:= nCurrParkNo;
      Parameters.ParamByName('N11').Value:= 2;
      Parameters.ParamByname('N12').Value:= nPrvGroupNo; //StrToInt(cmbGroupNo.Text);
      Parameters.ParamByName('N13').Value:= edtTKNo.Text;
      Parameters.ParamByName('N14').Value:= StrToInt(cmbWP.Text);
      Parameters.ParamByName('N15').Value:= edtAmount.Value;
      Parameters.ParamByName('N16').Value:= edtCarType.Text;
      Parameters.ParamByName('N17').Value:= StrToInt(cmbGroupNo.Text);
      Parameters.ParamByName('N18').Value:= 0;
      ExecSql;

      Close;
      SQL.Clear;
      SQL.Add('Insert Into IssueTK ');
      SQL.Add('(ParkNo, IssueDate, IssueTime, MNo, TKType, TKNo, CarType, IssueType, ');
      SQL.Add('IssueUnit, ExpDateF, ExpDateT, FValue, ChkClosing, CarNo, WPNo) ');
      SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, :N12, :N13, :N14, :N15)');
      Parameters.ParamByName('N1' ).Value:= nCurrParkNo;
      Parameters.ParamByName('N2' ).Value:= FormatDateTime('YYYY-MM-DD', Now);
      Parameters.ParamByName('N3' ).Value:= FormatDateTime('HH:NN:SS', Now);
      Parameters.ParamByName('N4' ).Value:= nCurrMNo;
      Parameters.ParamByName('N5' ).Value:= 2;
      Parameters.ParamByName('N6' ).Value:= edtTKNo.Text;
      Parameters.ParamByname('N7' ).Value:= 2;
      Parameters.ParamByName('N8' ).Value:= 2;
      Parameters.ParamByName('N9' ).Value:= edtAmount.Value;
      Parameters.ParamByName('N10').Value:= FormatDateTime('YYYY-MM-DD', edtExpDateF.Date);
      Parameters.ParamByName('N11').Value:= FormatDateTime('YYYY-MM-DD', edtExpDateT.Date);
      Parameters.ParamByName('N12').Value:= 0;
      Parameters.ParamByName('N13').Value:= 0;
      Parameters.ParamByName('N14').Value:= edtCarNo.Text;
      Parameters.ParamByName('N15').Value:= StrToInt(cmbWP.Text);
      ExecSql;

      ShowMessage('기간연장이 완료되었습니다.');
      ExceptLogging('기간연장 데이터, 차량번호: ' + edtCarNo.Text
                    + ' 유효기간: ' + FormatDateTime('YYYY-MM-DD', edtExpDateF.Date) + ' ~ ' + FormatDateTime('YYYY-MM-DD', edtExpDateT.Date));
      sSCChk:= '';

      edtTKNo.Text:= '';
      edtMarkNo.Text:= '';
      cmbAPB.ItemIndex:= 2;
      edtName.Text:= '';
      edtTelNo.Text:= '';
      edtCarNo.Text:= '';
      edtCompName.Text:= '';
      edtDeptName.Text:= '';
      edtAddress.Text:= '';
      edtExpDateF.SetFocus;
    end;
  except
    on E: Exception do ExceptLogging('TfrmAddSC.btnSaveClick: ' + E.Message);
  end;
end;

procedure TfrmAddSC.btnSeekClick(Sender: TObject);
begin
  pnSeek.Visible:= not pnSeek.Visible;

  if pnSeek.Visible then
    edtSeek.SetFocus;
end;

procedure TfrmAddSC.Button1Click(Sender: TObject);
begin
  edtExpDateF.Date:= Now;
  edtExpDateT.Date:= StrToDate(MG_AddDate(FormatDateTime('YYYY-MM-DD', Now), 7));
end;

procedure TfrmAddSC.Button2Click(Sender: TObject);
begin
  edtExpDateF.Date:= Now;
  edtExpDateT.Date:= StrToDate(MG_AddDate(FormatDateTime('YYYY-MM-DD', Now), 30));
end;

procedure TfrmAddSC.Button3Click(Sender: TObject);
begin
  edtExpDateF.Date:= Now;
  edtExpDateT.Date:= StrToDate(MG_AddDate(FormatDateTime('YYYY-MM-DD', Now), 60));
end;

procedure TfrmAddSC.Button4Click(Sender: TObject);
begin
  edtExpDateF.Date:= Now;
  edtExpDateT.Date:= StrToDate(MG_AddDate(FormatDateTime('YYYY-MM-DD', Now), 90));
end;

procedure TfrmAddSC.Button5Click(Sender: TObject);
begin
  edtExpDateF.Date:= Now;
  edtExpDateT.Date:= StrToDate(MG_AddDate(FormatDateTime('YYYY-MM-DD', Now), 180));
end;

procedure TfrmAddSC.edtSeekKeyPress(Sender: TObject; var Key: Char);
var
  i: Byte;
begin
  if Key = #13 then
  begin
    if rgSeek.ItemIndex = 0 then
    begin
      if edtSeek.Text = '' then
      begin
        ShowMessage('검색할 사용자의 성명을 입력하여주세요!');
        edtSeek.SetFocus;
        Exit;
      end;

      With qry1 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select * from Custinfo '
              + ' Where TKType = :N1 and Name = :N2 '
              + ' Order by Name');
        Parameters.ParamByName('N1').Value:= 2;
        Parameters.ParamByName('N2').Value:= MG_StrTrim(edtSeek.Text, ' ');
        Open;

        if RecordCount > 0 then
        begin
          nPrvGroupNo:= FieldByName('GroupNo').AsInteger;
          cmbGroupNo.ItemIndex:= cmbGroupNo.Items.IndexOf(IntToStr(FieldByName('GroupNo').AsInteger));

          for i:= 1 to nGroupCnt do
           if RGroup[i].nGroupNo = StrToInt(cmbGroupNo.Text) then
           begin
             edtGroupName.Text:= RGroup[i].sGroupName;
             Break;
           end;
          edtTKNo.Text:= FieldByName('TKNo').AsString;
          edtMarkNo.Text:= FieldByName('MarkNo').AsString;
          edtExpDateF.Date:= StrToDate(FieldByName('ExpDateF').AsString);
          edtExpDateT.Date:= StrToDate(FieldByName('ExpDateT').AsString);
          cmbAPB.ItemIndex:= FieldByName('APB').AsInteger -1;
          edtName.Text:= FieldByName('Name').AsString;
          edtTelNo.Text:= FieldByName('TelNo').AsString;
          edtCarNo.Text:= FieldByName('CarNo').AsString;
          edtCompName.Text:= FieldByName('CompName').AsString;
          edtDeptName.Text:= FieldByName('DeptName').AsString;
          edtAddress.Text:= FieldByName('Address').AsString;
          nStatus:= FieldByName('Status').AsInteger;
          edtCarType.Text:= FieldByName('Reserve1').AsString;
          cmbWP.ItemIndex:= cmbWP.Items.IndexOf(IntToStr(FieldByName('WPNo').AsInteger));
          cmbWP.OnChange(self);
          edtExpDateF.SetFocus;
        end
        else
        begin
          ShowMessage('조회한 사용자가 없습니다. 확인 후 다시 조회하여 주세요!');
          edtSeek.SetFocus;
        end;
      end;
    end;

    if rgSeek.ItemIndex = 1 then
    begin
      if edtSeek.Text = '' then
      begin
        ShowMessage('검색할 차량번호를 입력하여주세요!');
        edtSeek.SetFocus;
        Exit;
      end;

      With qry1 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select * from CustInfo '
              + ' Where TKType = :N1 and CarNo = :N2 '
              + ' Order by CarNo');
        Parameters.ParamByName('N1').Value:= 2;
        Parameters.ParamByName('N2').Value:= MG_StrTrim(edtSeek.Text, ' ');
        Open;

        if RecordCount > 0 then
        begin
          nPrvGroupNo:= FieldByName('GroupNo').AsInteger;
          cmbGroupNo.ItemIndex:= cmbGroupNo.Items.IndexOf(IntToStr(FieldByName('GroupNo').AsInteger));

          for i:= 1 to nGroupCnt do
           if RGroup[i].nGroupNo = StrToInt(cmbGroupNo.Text) then
           begin
             edtGroupName.Text:= RGroup[i].sGroupName;
             Break;
           end;
          edtTKNo.Text:= FieldByName('TKNo').AsString;
          edtMarkNo.Text:= FieldByName('MarkNo').AsString;
          edtExpDateF.Date:= StrToDate(FieldByName('ExpDateF').AsString);
          edtExpDateT.Date:= StrToDate(FieldByName('ExpDateT').AsString);
          cmbAPB.ItemIndex:= FieldByName('APB').AsInteger -1;
          edtName.Text:= FieldByName('Name').AsString;
          edtTelNo.Text:= FieldByName('TelNo').AsString;
          edtCarNo.Text:= FieldByName('CarNo').AsString;
          edtCompName.Text:= FieldByName('CompName').AsString;
          edtDeptName.Text:= FieldByName('DeptName').AsString;
          edtAddress.Text:= FieldByName('Address').AsString;
          nStatus:= FieldByName('Status').AsInteger;
          edtCarType.Text:= FieldByName('Reserve1').AsString;
          cmbWP.ItemIndex:= cmbWP.Items.IndexOf(IntToStr(FieldByName('WPNo').AsInteger));
          cmbWP.OnChange(self);
          edtExpDateF.SetFocus;
        end
        else
        begin
          ShowMessage('조회한 사용자가 없습니다. 확인 후 다시 조회하여 주세요!');
          edtSeek.SetFocus;
        end;
      end;
    end;

    {
    if rgSeek.ItemIndex = 2 then
    begin
      if edtSeek.Text = '' then
      begin
        ShowMessage('검색할 관리번호를 입력하여주세요!');
        edtSeek.SetFocus;
        Exit;
      end;

      With qry1 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select * from CustInfo '
              + ' Where TKType = :N1 and TKNo = :N2 '
              + ' Order by TKNo');
        Parameters.ParamByName('N1').Value:= 2;
        Parameters.ParamByName('N2').Value:= MG_StrTrim(edtSeek.Text, ' ');
        Open;

        if RecordCount > 0 then
        begin
          cmbGroupNo.ItemIndex:= cmbGroupNo.Items.IndexOf(IntToStr(FieldByName('GroupNo').AsInteger));
          edtTKNo.Text:= FieldByName('TKNo').AsString;
          edtMarkNo.Text:= FieldByName('MarkNo').AsString;
          edtExpDateF.Text:= FieldByName('ExpDateF').AsString;
          edtExpDateT.Text:= FieldByName('ExpDateT').AsString;
          cmbAPB.ItemIndex:= FieldByName('APB').AsInteger -1;
          edtName.Text:= FieldByName('Name').AsString;
          edtTelNo.Text:= FieldByName('TelNo').AsString;
          edtCarNo.Text:= FieldByName('CarNo').AsString;
          edtCompName.Text:= FieldByName('CompName').AsString;
          edtDeptName.Text:= FieldByName('DeptName').AsString;
          edtAddress.Text:= FieldByName('Address').AsString;
          nStatus:= FieldByName('Status').AsInteger;
          cmbWP.ItemIndex:= cmbWP.Items.IndexOf(IntToStr(FieldByName('WPNo').AsInteger));
          cmbWP.OnChange(self);
          edtExpDateF.SetFocus;
          edtExpDateF.SelectAll;
        end
        else
        begin
          ShowMessage('조회한 사용자가 없습니다. 확인 후 다시 조회하여 주세요!');
          edtSeek.SetFocus;
        end;
      end;
    end;
    }
    pnSeek.Visible:= False;
  end;
end;

procedure TfrmAddSC.cmbGroupNoChange(Sender: TObject);
var
  i: Integer;
begin
  for i:= 1 to nGroupCnt do
    if RGroup[i].nGroupNo = StrToInt(cmbGroupNo.Text) then
    begin
      edtGroupName.Text:= RGroup[i].sGroupName;
      Break;
    end;
end;

procedure TfrmAddSC.cmbWPChange(Sender: TObject);
var
  i: Integer;
begin
  for i:= 1 to nWPCnt do
    if RWP[i].nWPNo = StrToInt(cmbWP.Text) then
    begin
      edtWPName.Text:= RWP[i].sWPName;
      Break;
    end;
end;

procedure TfrmAddSC.edtCarNoExit(Sender: TObject);
begin
  {
  if Length(MG_StrTrim(edtCarNo.Text, ' ')) < 8 then
  begin
    ShowMessage('차량번호를 정확히 입력하여주세요!');
    edtCarNo.SetFocus;
    Exit;
  end;

  with qry1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * from Custinfo Where TKType = :N1 and CarNo = :N2');
    Parameters.ParamByName('N1').Value:= 2;
    Parameters.ParamByName('N2').Value:= MG_StrTrim(edtCarNo.Text, ' ');
    Open;

    if RecordCount > 0 then
    begin
      cmbGroupNo.ItemIndex:= cmbGroupNo.Items.IndexOf(IntToStr(FieldByName('GroupNo').AsInteger));
      edtTKNo.Text:= FieldByName('TKNo').AsString;
      edtMarkNo.Text:= FieldByName('MarkNo').AsString;
      edtExpDateF.Text:= FieldByName('ExpDateF').AsString;
      edtExpDateT.Text:= FieldByName('ExpDateT').AsString;
      cmbAPB.ItemIndex:= FieldByName('APB').AsInteger -1;
      edtName.Text:= FieldByName('Name').AsString;
      edtTelNo.Text:= FieldByName('TelNo').AsString;
      edtCarNo.Text:= FieldByName('CarNo').AsString;
      edtCompName.Text:= FieldByName('CompName').AsString;
      edtDeptName.Text:= FieldByName('DeptName').AsString;
      edtAddress.Text:= FieldByName('Address').AsString;
      nStatus:= FieldByName('Status').AsInteger;
      cmbWP.ItemIndex:= cmbWP.Items.IndexOf(IntToStr(FieldByName('WPNo').AsInteger));
      cmbWP.OnChange(self);
      edtExpDateF.SetFocus;
      edtExpDateF.SelectAll;
    end
    else
    begin
      ShowMessage('차량번호가 없습니다. 확인하여 주세요!');
      edtTKNo.Text:= '';
      edtMarkNo.Text:= '';
      edtCarNo.SetFocus;
    end;
  end;
  }
end;

end.
