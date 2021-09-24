unit NewRFSC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, Spin, Mask, ExtCtrls, DB, ADODB;

type
  TfrmNewRFSC = class(TForm)
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
    qryGroupGroupType: TWordField;
    qryGroupUseFeeItem: TWordField;
    qryGroupReserve1: TStringField;
    qryGroupReserve2: TStringField;
    qryGroupReserve3: TStringField;
    qryGroupReserve4: TStringField;
    qryGroupReserve5: TStringField;
    dsCustInfo: TDataSource;
    qryGroupRF1: TWordField;
    qryGroupRF2: TWordField;
    qryGroupRF3: TWordField;
    qryGroupRF4: TWordField;
    qryGroupRF5: TWordField;
    qryGroupRF6: TWordField;
    qryGroupRF7: TWordField;
    qryGroupRF8: TWordField;
    qryGroupRF9: TWordField;
    qryGroupRF10: TWordField;
    qryGroupRF11: TWordField;
    qryGroupRF12: TWordField;
    qryGroupRF13: TWordField;
    qryGroupRF14: TWordField;
    qryGroupRF15: TWordField;
    qryGroupRF16: TWordField;
    qryGroupRF17: TWordField;
    qryGroupRF18: TWordField;
    qryGroupRF19: TWordField;
    qryGroupRF20: TWordField;
    Panel1: TPanel;
    Bevel1: TBevel;
    Label2: TLabel;
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
    edtExpDateF: TMaskEdit;
    cmbGroupNo: TComboBox;
    edtExpDateT: TMaskEdit;
    edtAmount: TSpinEdit;
    cmbWP: TComboBox;
    edtWPName: TEdit;
    edtName: TEdit;
    edtTelNo: TEdit;
    edtCarNo: TEdit;
    edtCompName: TEdit;
    edtDeptName: TEdit;
    edtAddress: TEdit;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    btnClose: TBitBtn;
    sb1: TStatusBar;
    Bevel9: TBevel;
    Label17: TLabel;
    edtTKNo: TEdit;
    edtMarkNo: TEdit;
    procedure cmbGroupNoChange(Sender: TObject);
    procedure cmbWPChange(Sender: TObject);
    procedure edtTKNoExit(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
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
  frmNewRFSC: TfrmNewRFSC;
  RGroup : Array[1..50] of RECGroup;
  RWP    : Array[1..50] of RECWP;
  nGroupCnt, nWPCnt: Word;
  nStatus: Byte = 0;
  nWPNo: Byte = 1;

implementation
uses
  Tables, Global, Main;

{$R *.dfm}

procedure TfrmNewRFSC.btnCancelClick(Sender: TObject);
begin
  edtExpDateF.Text:= '';
  edtExpDateT.Text:= '';
  cmbAPB.ItemIndex:= 2;
  edtName.Text:= '';
  edtTelNo.Text:= '';
  edtCarNo.Text:= '';
  edtCompName.Text:= '';
  edtDeptName.Text:= '';
  edtAddress.Text:= '';
  edtTKNo.Text:= '';
  edtMarkNo.Text:= '';
  edtTKNo.SetFocus;
end;

procedure TfrmNewRFSC.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmNewRFSC.btnSaveClick(Sender: TObject);
begin
  try
    if Length(MG_StrTrim(edtTKNo.Text, ' ')) < 8 then
    begin
      ShowMessage('RF����ǹ�ȣ�� ��Ȯ�� �Է��Ͽ��ּ���!');
      edtTKNo.SetFocus;
      Exit;
    end;

    try
      StrToDate(edtExpDateF.Text);
    except
      on E: Exception do
      begin
        ShowMessage('��ȿ�Ⱓ�� ��Ȯ�� �Է��Ͽ��ּ���!');
        edtExpDateF.SetFocus;
        Exit;
      end;
    end;

    try
      StrToDate(edtExpDateT.Text);
    except
      on E: Exception do
      begin
        ShowMessage('��ȿ�Ⱓ�� ��Ȯ�� �Է��Ͽ��ּ���!');
        edtExpDateT.SetFocus;
        Exit;
      end;
    end;

    if edtExpDateF.Text > edtExpDateT.Text then
    begin
      ShowMessage('��ȿ�Ⱓ�� Ȯ���ϰ� �Է��Ͽ��ּ���!');
      Exit;
    end;

    with qry1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select GroupNo from GGroup where GroupNo = :N1 and Reserve1 = :N2');
      Parameters.ParamByName('N1').Value:= StrToInt(cmbGroupNo.Text);
      Parameters.ParamByName('N2').Value:= 'RF����';
      Open;

      if RecordCount <= 0 then
      begin
        ShowMessage('�ش� �׷������� �����ϴ�. Ȯ���Ͽ� �ּ���!');
        cmbGroupNo.SetFocus;
        Exit;
      end;

      Close;
      SQL.Clear;
      SQL.Add('Select * from CustInfo where TkNo = :N1 and TKType = :N2');
      Parameters.ParamByName('N1').Value:= edtTKNo.Text;
      Parameters.ParamByName('N2').Value:= 99;
      Open;

      if RecordCount > 0 then
      begin
        ShowMessage('�ش� ����ǿ� ���� �ڷᰡ �ֽ��ϴ�. Ȯ���Ͽ��ּ���!');
        edtTKNo.SetFocus;
        Exit;
      end;

      Close;
      SQL.Clear;
      SQL.Add('Insert into CustInfo ');
      SQL.Add('(ParkNo, TKType, GroupNo, Name, TelNo, CarNo, CompName, ');
      SQL.Add('DeptName, Address, IssueDate, IssueAmt, Status, ExpDateF, ');
      SQL.Add('ExpDateT, WPNo, LastParkNo, LastUnitNo, LastUseDate, LastUseTime, ');
      SQL.Add('IOStatusNo, CurrAmt, TKNo, APB, CarType, MarkNo) ');
      SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, ');
      SQL.Add(':N11, :N12, :N13, :N14, :N15, :N16, :N17, :N18, :N19, :N20, ');
      SQL.Add(':N21, :N22, :N23, :N24, :N25)');
      Parameters.ParamByName('N1' ).Value:= nCurrParkNo;
      Parameters.ParamByName('N2' ).Value:= 99;
      Parameters.ParamByName('N3' ).Value:= StrToInt(cmbGroupNo.Text);
      Parameters.ParamByName('N4' ).Value:= edtName.Text;
      Parameters.ParamByName('N5' ).Value:= edtTelNo.Text;
      Parameters.ParamByName('N6' ).Value:= MG_StrTrim(edtCarNo.Text, ' ');
      Parameters.ParamByName('N7' ).Value:= edtCompName.Text;
      Parameters.ParamByName('N8' ).Value:= edtDeptName.Text;
      Parameters.ParamByName('N9' ).Value:= edtAddress.Text;
      Parameters.ParamByName('N10').Value:= FormatDateTime('YYYY-MM-DD', Now);
      Parameters.ParamByName('N11').Value:= edtAmount.Value;
      Parameters.ParamByName('N12').Value:= 0;
      Parameters.ParamByName('N13').Value:= edtExpDateF.Text;
      Parameters.ParamByName('N14').Value:= edtExpDateT.Text;
      Parameters.ParamByName('N15').Value:= StrToInt(cmbWP.Text);
      Parameters.ParamByName('N16').Value:= 0;
      Parameters.ParamByName('N17').Value:= 0;
      Parameters.ParamByName('N18').Value:= FormatDateTime('YYYY-MM-DD', Now);
      Parameters.ParamByName('N19').Value:= FormatDateTime('HH:NN:SS', Now);
      Parameters.ParamByName('N20').Value:= 2;
      Parameters.ParamByName('N21').Value:= 0;
      Parameters.ParamByName('N22').Value:= edtTKNo.Text;
      Parameters.ParamByName('N23').Value:= cmbAPB.ItemIndex + 1;
      Parameters.ParamByName('N24').Value:= 1;
      Parameters.ParamByName('N25').Value:= edtMarkNo.Text;
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
      Parameters.ParamByName('N5' ).Value:= 99;
      Parameters.ParamByName('N6' ).Value:= MG_StrTrim(edtTKNo.Text, ' ');
      Parameters.ParamByname('N7' ).Value:= 2;
      Parameters.ParamByName('N8' ).Value:= 1;
      Parameters.ParamByName('N9' ).Value:= 0;
      Parameters.ParamByName('N10').Value:= edtExpDateF.Text;
      Parameters.ParamByName('N11').Value:= edtExpDateT.Text;
      Parameters.ParamByName('N12').Value:= 0;
      Parameters.ParamByName('N13').Value:= 0;
      Parameters.ParamByName('N14').Value:= MG_StrTrim(edtCarNo.Text, ' ');
      Parameters.ParamByName('N15').Value:= StrToInt(cmbWP.Text);
      ExecSql;

      Close;
      SQL.Clear;
      SQL.Add('Update TagList ');
      SQL.Add('Set UseFlag = :N1, IssueDate = :N3 where TKNo = :N2');
      Parameters.ParamByName('N1').Value:= 2;
      Parameters.ParamByName('N2').Value:= edtTKNo.Text;
      Parameters.ParamByName('N3').Value:= FormatDateTime('YYYY-MM-DD', Now);;
      ExecSQL;
      ShowMessage('�ű� RF����� ����� �Ϸ�Ǿ����ϴ�.');

      cmbAPB.ItemIndex:= 2;
      edtName.Text:= '';
      edtTelNo.Text:= '';
      edtCarNo.Text:= '';
      edtCompName.Text:= '';
      edtDeptName.Text:= '';
      edtAddress.Text:= '';
      edtTKNo.Text:= '';
      edtMarkNo.Text:= '';
      edtTKNo.SetFocus;
    end;
  except
    on E: Exception do ExceptLogging('TfrmNewRFSC.btnSaveClick: ' + E.Message);
  end;
end;

procedure TfrmNewRFSC.cmbGroupNoChange(Sender: TObject);
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

procedure TfrmNewRFSC.cmbWPChange(Sender: TObject);
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

procedure TfrmNewRFSC.edtTKNoExit(Sender: TObject);
begin
  if edtTKNo.Text <> '' then
    edtTKNo.Text:= MG_InsZero(edtTKNo.Text, 8)
  else
    Exit;

  with qry1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * from TagList where TKNo = :N1');
    Parameters.ParamByName('N1').Value:= edtTKNo.Text;
    Open;

    if RecordCount > 0 then
    begin
      edtMarkNo.Text:= FieldByName('MarkNo').AsString;
    end
    else
    begin
      ShowMessage('��ϵ� �Ϸù�ȣ�� �ƴմϴ�. Ȯ���Ͽ� �ּ���!');
      edtTKNo.Text:= '';
      edtMarkNo.Text:= '';
      edtTKNo.SetFocus;
    end;
  end;
end;

procedure TfrmNewRFSC.FormShow(Sender: TObject);
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
        ShowMessage('�������� ���� �����Ͽ��ּ���!');
        Exit;
      end;
    end;

    with qryGroup do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from GGroup Where ParkNo = :N1 and Reserve1 = :N2 Order By GroupNo');
      Parameters.ParamByName('N1').Value:= nCurrParkNo;
      Parameters.ParamByName('N2').Value:= 'RF����';
      Open;
      nGroupCnt:= RecordCount;

      if RecordCount <= 0 then
      begin
        ShowMessage('RF����Ǳ׷��� ���� ����Ͽ��ּ���!');
        Exit;
      end;
      cmbGroupNo.Items.Clear;
      cmbGroupNo.Enabled:= True;
      edtGroupName.Visible:= True;

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
        ShowMessage('���ð��븦 ���� ����Ͽ��ּ���!');
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
    edtExpDateF.Text:= FormatDateTime('YYYY-MM-DD', Now);
    edtExpDateT.Text:= MG_AddDate(FormatDateTime('YYYY-MM-DD', Now), 30);
    edtTKNo.SetFocus;
  except
    on E: Exception do ExceptLogging('TfrmNewSC.FormShow: ' + E.Message);
  end;
end;

end.
