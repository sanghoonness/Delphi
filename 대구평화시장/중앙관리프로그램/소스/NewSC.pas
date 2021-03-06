unit NewSC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvGlowButton, Mask, StdCtrls, ExtCtrls, DB,
  ADODB, ComCtrls, Buttons, AdvPanel, Spin, AdvToolBtn, AdPort, AdvDateTimePicker;

type
  TfrmNewSC = class(TForm)
    qryCustInfo: TADOQuery;
    qryCustInfoParkNo: TSmallintField;
    qryCustInfoTKType: TWordField;
    qryCustInfoGroupNo: TWordField;
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
    Panel1: TPanel;
    Bevel1: TBevel;
    Label2: TLabel;
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
    qryCustInfoTKNo: TStringField;
    Bevel7: TBevel;
    Label1: TLabel;
    edtTKNo: TEdit;
    Bevel9: TBevel;
    Label8: TLabel;
    edtCarType: TEdit;
    edtExpDateF: TAdvDateTimePicker;
    edtExpDateT: TAdvDateTimePicker;
    Bevel13: TBevel;
    Label15: TLabel;
    cmbParkGubun: TComboBox;
    Bevel16: TBevel;
    Label16: TLabel;
    Label3: TLabel;
    Bevel2: TBevel;
    cmbValetChk: TComboBox;
    Bevel17: TBevel;
    Label17: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    procedure FormShow(Sender: TObject);
    procedure cmbGroupNoChange(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure cmbWPChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
  frmNewSC: TfrmNewSC;
  RGroup : Array[1..50] of RECGroup;
  RWP    : Array[1..50] of RECWP;
  nGroupCnt, nWPCnt: Word;
  nStatus: Byte = 0;
  nWPNo: Byte = 1;
  sNewSC: AnsiString;

implementation
uses
  Tables, Global, Main;

{$R *.dfm}

procedure TfrmNewSC.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then //????????
  begin
    selectnext(activecontrol as twincontrol,true,true);
    //???? ???????? ???? ?????????? ???? ?????????? ????????.
  end;
end;

procedure TfrmNewSC.FormShow(Sender: TObject);
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
        ShowMessage('???????? ???? ??????????????!');
        Exit;
      end;
    end;

    with qryGroup do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from GGroup Where ParkNo = :N1 Order By GroupNo');
      Parameters.ParamByName('N1').Value:= nCurrParkNo;
      Open;
      nGroupCnt:= RecordCount;

      if RecordCount <= 0 then
      begin
        ShowMessage('?????????????? ???? ??????????????!');
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
        ShowMessage('???????????? ???? ??????????????!');
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
    edtCarNo.SetFocus;
  except
    on E: Exception do ExceptLogging('TfrmNewSC.FormShow: ' + E.Message);
  end;
end;

procedure TfrmNewSC.cmbGroupNoChange(Sender: TObject);
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

procedure TfrmNewSC.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmNewSC.btnCancelClick(Sender: TObject);
begin
  cmbAPB.ItemIndex:= 2;
  edtName.Text:= '';
  edtTelNo.Text:= '';
  edtCarNo.Text:= '';
  edtCompName.Text:= '';
  edtDeptName.Text:= '';
  edtAddress.Text:= '';
  edtCarNo.SetFocus;
end;

procedure TfrmNewSC.btnSaveClick(Sender: TObject);
begin
  try
    {
    if Length(MG_StrTrim(edtTKNo.Text, ' ')) < 4 then
    begin
      ShowMessage('?????????? 4???? ?????? ?????? ??????????????!');
      edtTKNo.SetFocus;
      Exit;
    end;

    if not MG_NumberCheck(edtTKNo.Text) then
    begin
      ShowMessage('?????????? 4???? ?????? ?????? ??????????????!');
      edtTKNo.SetFocus;
      Exit;
    end;
    }

    if Length(MG_StrTrim(edtCarNo.Text, ' ')) < 8 then
    begin
      ShowMessage('?????????? ?????? ??????????????!');
      edtCarNo.SetFocus;
      Exit;
    end;

    if edtExpDateF.Date > edtExpDateT.Date then
    begin
      ShowMessage('?????????? ???????? ??????????????!');
      Exit;
    end;

    sNewSC:= MG_InsZero(IntToStr(GetTickCount), 10);  //edtTKNo.Text;

    with qry1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select GroupNo from GGroup where GroupNo = :N1');
      Parameters.ParamByName('N1').Value:= StrToInt(cmbGroupNo.Text);
      Open;

      if RecordCount <= 0 then
      begin
        ShowMessage('???? ?????????? ????????. ???????? ??????!');
        cmbGroupNo.SetFocus;
        Exit;
      end;

      Close;
      SQL.Clear;
      SQL.Add('Select * from CustInfo where CarNo = :N1 and TKType = :N2');
      Parameters.ParamByName('N1').Value:= edtCarNo.Text;
      Parameters.ParamByName('N2').Value:= 2;
      Open;

      if RecordCount > 0 then
      begin
        ShowMessage('???? ?????? ???? ?????? ????????. ??????????????!');
        edtCarNo.SetFocus;
        Exit;
      end;

      Close;
      SQL.Clear;
      SQL.Add('Insert into CustInfo ');
      SQL.Add('(ParkNo, TKType, GroupNo, Name, TelNo, CarNo, CompName, ');
      SQL.Add('DeptName, Address, IssueDate, IssueAmt, Status, ExpDateF, ');
      SQL.Add('ExpDateT, WPNo, LastParkNo, LastUnitNo, LastUseDate, LastUseTime, ');
      SQL.Add('IOStatusNo, CurrAmt, TKNo, APB, CarType, Reserve1, ValetChk) ');
      SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, ');
      SQL.Add(':N11, :N12, :N13, :N14, :N15, :N16, :N17, :N18, :N19, :N20, ');
      SQL.Add(':N21, :N22, :N23, :N24, :N25, :pValetChk)');
      Parameters.ParamByName('N1' ).Value:= nCurrParkNo;
      Parameters.ParamByName('N2' ).Value:= 2;
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
      Parameters.ParamByName('N13').Value:= FormatDateTime('YYYY-MM-DD', edtExpDateF.Date);
      Parameters.ParamByName('N14').Value:= FormatDateTime('YYYY-MM-DD', edtExpDateT.Date);
      Parameters.ParamByName('N15').Value:= StrToInt(cmbWP.Text);
      Parameters.ParamByName('N16').Value:= 0;
      Parameters.ParamByName('N17').Value:= 0;
      Parameters.ParamByName('N18').Value:= FormatDateTime('YYYY-MM-DD', Now);
      Parameters.ParamByName('N19').Value:= FormatDateTime('HH:NN:SS', Now);
      Parameters.ParamByName('N20').Value:= 2;
      Parameters.ParamByName('N21').Value:= 0;
      Parameters.ParamByName('N22').Value:= sNewSC;
      Parameters.ParamByName('N23').Value:= cmbAPB.ItemIndex + 1;
      Parameters.ParamByName('N24').Value:= cmbParkGubun.ItemIndex;
      Parameters.ParamByName('N25').Value:= edtCarType.Text;
      Parameters.ParamByName('pValetChk').Value:= cmbValetChk.ItemIndex;
      ExecSql;

      // ???? ????
      ExceptLogging('TfrmNewSC.btnSaveClick # ????????: ' + cmbGroupNo.Text + ', ????????: ' + edtCarNo.Text
                  + ', ????????????: ' + DateToStr(edtExpDateF.Date) + ', ??????????: ' + DateToStr(edtExpDateT.Date) + ', ????????: ' + IntToStr(edtAmount.Value) + '??');

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
      Parameters.ParamByName('N6' ).Value:= sNewSC;
      Parameters.ParamByname('N7' ).Value:= 2;
      Parameters.ParamByName('N8' ).Value:= 1;
      Parameters.ParamByName('N9' ).Value:= edtAmount.Value;
      Parameters.ParamByName('N10').Value:= FormatDateTime('YYYY-MM-DD', edtExpDateF.Date);
      Parameters.ParamByName('N11').Value:= FormatDateTime('YYYY-MM-DD', edtExpDateT.Date);
      Parameters.ParamByName('N12').Value:= edtAmount.Value;
      Parameters.ParamByName('N13').Value:= 0;
      Parameters.ParamByName('N14').Value:= MG_StrTrim(edtCarNo.Text, ' ');
      Parameters.ParamByName('N15').Value:= StrToInt(cmbWP.Text);
      ExecSql;

      ShowMessage('???? ???????? ?????? ??????????????.');

      cmbAPB.ItemIndex:= 2;
      edtName.Text:= '';
      edtTelNo.Text:= '';
      edtCarNo.Text:= '';
      edtCompName.Text:= '';
      edtDeptName.Text:= '';
      edtAddress.Text:= '';
      edtAmount.Value := 0;    // ????????
      sNewSC:= '';
      edtExpDateF.Date:= Now;
      edtExpDateT.Date:= StrToDate(MG_AddDate(FormatDateTime('YYYY-MM-DD', Now), 30));
      edtCarNo.SetFocus;
    end;
  except
    on E: Exception do ExceptLogging('TfrmNewSC.btnSaveClick: ' + E.Message);
  end;
end;

procedure TfrmNewSC.Button1Click(Sender: TObject);
begin
  edtExpDateF.Date:= Now;
  edtExpDateT.Date:= StrToDate(MG_AddDate(FormatDateTime('YYYY-MM-DD', Now), 7));
end;

procedure TfrmNewSC.Button2Click(Sender: TObject);
begin
  edtExpDateF.Date:= Now;
  edtExpDateT.Date:= StrToDate(MG_AddDate(FormatDateTime('YYYY-MM-DD', Now), 30));
end;

procedure TfrmNewSC.Button3Click(Sender: TObject);
begin
  edtExpDateF.Date:= Now;
  edtExpDateT.Date:= StrToDate(MG_AddDate(FormatDateTime('YYYY-MM-DD', Now), 60));
end;

procedure TfrmNewSC.Button4Click(Sender: TObject);
begin
  edtExpDateF.Date:= Now;
  edtExpDateT.Date:= StrToDate(MG_AddDate(FormatDateTime('YYYY-MM-DD', Now), 90));
end;

procedure TfrmNewSC.Button5Click(Sender: TObject);
begin
  edtExpDateF.Date:= Now;
  edtExpDateT.Date:= StrToDate(MG_AddDate(FormatDateTime('YYYY-MM-DD', Now), 180));
end;

procedure TfrmNewSC.cmbWPChange(Sender: TObject);
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

end.
