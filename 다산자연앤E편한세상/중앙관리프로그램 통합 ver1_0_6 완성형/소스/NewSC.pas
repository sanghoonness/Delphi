unit NewSC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvGlowButton, Mask, StdCtrls, ExtCtrls, DB,
  ADODB, ComCtrls, Buttons, AdvPanel, Spin, AdvToolBtn, AdPort, AdvEdit,
  AdvCombo;

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
    qryGroupGroupType: TWordField;
    qryGroupUseFeeItem: TWordField;
    qryCustInfoTKNo: TStringField;
    Bevel7: TBevel;
    Label1: TLabel;
    edtTKNo: TEdit;
    Bevel9: TBevel;
    Label8: TLabel;
    edtCarType: TEdit;
    cmbHIType: TAdvComboBox;
    edtHISTime: TAdvMaskEdit;
    edtHIETime: TAdvMaskEdit;
    bvlBujae: TBevel;
    lblBujae: TLabel;
    cmbBujae: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure cmbGroupNoChange(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure cmbWPChange(Sender: TObject);
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
      SQL.Add('Select * from GGroup Where ParkNo = :N1 and Reserve1 is null Order By GroupNo');
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
        //cmbGroupNo.Items.Add(IntToStr(FieldByName('GroupNo').AsInteger));
        cmbGroupNo.Items.AddObject(FieldByName('GroupNo').AsString+':'+FieldByName('GroupName').AsString, TObject(FieldByName('GroupNo').AsInteger));
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
    edtExpDateF.Text:= FormatDateTime('YYYY-MM-DD', Now);
    edtExpDateT.Text:='2099-12-31';// MG_AddDate(FormatDateTime('YYYY-MM-DD', Now), 30);
    edtCarNo.SetFocus;


    if nApt = 1 then
    begin
      cmbHIType.Visible := true;
      edtHISTime.Visible := true;
      edtHIETime.Visible := true;

      Label12.Caption := '??';
      Label13.Caption := '??';
    end
    else
    begin
      cmbHIType.Visible := false;
      edtHISTime.Visible := false;
      edtHIETime.Visible := false;
    end;

    //Added LJH 190627 ???????? ???? Showing
    if nBujaeUse = 1 then
    begin
      bvlBujae.Visible  := True;
      lblBujae.Visible  := True;
      cmbBujae.Visible  := True;
      edtAddress.Width  := 300;
      cmbBujae.Enabled  := True;
    end
    else
    begin
      bvlBujae.Visible := False;
      lblBujae.Visible := False;
      cmbBujae.Visible := False;
      edtAddress.Width := 497;
    end;

  except
    on E: Exception do ExceptLogging('TfrmNewSC.FormShow: ' + E.Message);
  end;
end;

procedure TfrmNewSC.cmbGroupNoChange(Sender: TObject);
var
  i: Integer;
begin
  for i:= 1 to nGroupCnt do
    //if RGroup[i].nGroupNo = StrToInt(cmbGroupNo.Text) then
    if RGroup[i].nGroupNo = LongInt(cmbGroupNo.Items.Objects[cmbGroupNo.ItemIndex]) then
    begin
      edtGroupName.Text:= RGroup[i].sGroupName;
      Break;
    end;

  with dmTables.qryTemp do
  begin
    SQL.Clear;
    SQL.Add('Select BujaeType from GGroup where GroupNo = :N1');
    Parameters.ParamByName('N1').Value:= RGroup[i].nGroupNo;
    Open;

    if RecordCount > 0 then
    begin
      cmbBujae.ItemIndex := FieldByName('BujaeType').AsInteger;
    end;
  end;
end;

procedure TfrmNewSC.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmNewSC.btnCancelClick(Sender: TObject);
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
  cmbHIType.ItemIndex:= 0;
  edtHISTime.Text:= '';
  edtHIETime.Text:= '';
  edtCarNo.SetFocus;
end;

procedure TfrmNewSC.btnSaveClick(Sender: TObject);
var
  sTime: TDateTime;
  TKNO, SEQ : Integer;
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


      //if Length(MG_StrTrim(edtCarNo.Text, ' ')) < 8 then
      if Length(MG_StrTrim(edtCarNo.Text, ' ')) < 4 then
      begin
        ShowMessage('?????????? ?????? ??????????????!');
        edtCarNo.SetFocus;
        Exit;
      end;

      try
        StrToDate(edtExpDateF.Text);
      except
        on E: Exception do
        begin
          ShowMessage('?????????? ?????? ??????????????!');
          edtExpDateF.SetFocus;
          Exit;
        end;
      end;

      try
        StrToDate(edtExpDateT.Text);
      except
        on E: Exception do
        begin
          ShowMessage('?????????? ?????? ??????????????!');
          edtExpDateT.SetFocus;
          Exit;
        end;
      end;

      if edtExpDateF.Text > edtExpDateT.Text then
      begin
        ShowMessage('?????????? ???????? ??????????????!');
        Exit;
      end;
      sNewSC:= MG_InsZero(IntToStr(GetTickCount), 10);  //edtTKNo.Text;

      if cmbHIType.ItemIndex = 1 then
      begin
        try
          sTime:= StrToTime(edtHISTime.Text);
        except
          on E: Exception do
          begin
            ShowMessage('?????????????????? ?????? ??????????????!');
            edtHISTime.SetFocus;
            edtHISTime.SelectAll;
            Exit;
          end;
        end;

        try
          sTime:= StrToTime(edtHIETime.Text);
        except
          on E: Exception do
          begin
            ShowMessage('?????????????????? ?????? ??????????????!');
            edtHIETime.SetFocus;
            edtHIETime.SelectAll;
            Exit;
          end;
        end;
      end;

      with qry1 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select GroupNo from GGroup where GroupNo = :N1');
        //Parameters.ParamByName('N1').Value:= StrToInt(cmbGroupNo.Text);
        Parameters.ParamByName('N1').Value:= LongInt(cmbGroupNo.Items.Objects[cmbGroupNo.ItemIndex]);
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
        SQL.Add(' Order by deptname ' );
        Parameters.ParamByName('N1').Value:= MG_StrTrim(edtCarNo.Text, ' ');
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
        SQL.Add('IOStatusNo, CurrAmt, TKNo, APB, CarType, Reserve1, HIType, HISTime, HIETime, BujaeType) ');
        SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, ');
        SQL.Add(':N11, :N12, :N13, :N14, :N15, :N16, :N17, :N18, :N19, :N20, ');
        SQL.Add(':N21, :N22, :N23, :N24, :N25, :N26, :N27, :N28, :N29)');
        Parameters.ParamByName('N1' ).Value:= nCurrParkNo;
        Parameters.ParamByName('N2' ).Value:= 2;
        //Parameters.ParamByName('N3' ).Value:= StrToIntDef(cmbGroupNo.Text,0);
        Parameters.ParamByName('N3' ).Value:= LongInt(cmbGroupNo.Items.Objects[cmbGroupNo.ItemIndex]);
        Parameters.ParamByName('N4' ).Value:= edtName.Text;
        Parameters.ParamByName('N5' ).Value:= edtTelNo.Text;
        Parameters.ParamByName('N6' ).Value:= MG_StrTrim(edtCarNo.Text, ' ');
        Parameters.ParamByName('N7' ).Value:= edtCompName.Text;
        Parameters.ParamByName('N8' ).Value:= edtDeptName.Text;
        Parameters.ParamByName('N9' ).Value:= edtAddress.Text;
        Parameters.ParamByName('N10').Value:= FormatDateTime('YYYY-MM-DD', Now);
        Parameters.ParamByName('N11').Value:= edtAmount.Value;
        //Parameters.ParamByName('N12').Value:= 0;
        Parameters.ParamByName('N12').Value:= 1;
        Parameters.ParamByName('N13').Value:= edtExpDateF.Text;
        Parameters.ParamByName('N14').Value:= edtExpDateT.Text;
        Parameters.ParamByName('N15').Value:= StrToInt(cmbWP.Text);
        Parameters.ParamByName('N16').Value:= 0;
        Parameters.ParamByName('N17').Value:= 0;
        Parameters.ParamByName('N18').Value:= FormatDateTime('YYYY-MM-DD', Now);
        Parameters.ParamByName('N19').Value:= FormatDateTime('HH:NN:SS', Now);
        //Parameters.ParamByName('N20').Value:= 2;
        Parameters.ParamByName('N20').Value:= 1;
        Parameters.ParamByName('N21').Value:= 0;
        Parameters.ParamByName('N22').Value:= sNewSC;
        //Parameters.ParamByName('N23').Value:= cmbAPB.ItemIndex + 1;
        Parameters.ParamByName('N23').Value:= 3;
        Parameters.ParamByName('N24').Value:= 1;
        Parameters.ParamByName('N25').Value:= edtCarType.Text;
        Parameters.ParamByName('N26').Value:= cmbHIType.ItemIndex;
        Parameters.ParamByName('N27').Value:= edtHISTime.Text;
        Parameters.ParamByName('N28').Value:= edtHIETime.Text;
        Parameters.ParamByName('N29').Value:= cmbBujae.ItemIndex;
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
        Parameters.ParamByName('N6' ).Value:= sNewSC;
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

        ShowMessage('???? ???????? ?????? ??????????????.');

        cmbAPB.ItemIndex:= 2;
        edtName.Text:= '';
        edtTelNo.Text:= '';
        edtCarNo.Text:= '';
        edtCompName.Text:= '';
        edtDeptName.Text:= '';
        edtAddress.Text:= '';
        sNewSC:= '';
        edtCarNo.SetFocus;
      end;
  except
    on E: Exception do ExceptLogging('TfrmNewSC.btnSaveClick: ' + E.Message);
  end;
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
