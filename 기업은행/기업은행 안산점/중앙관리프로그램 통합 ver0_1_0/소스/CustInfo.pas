unit CustInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvSpin, Mask, AdvEdit, StdCtrls, AdvCombo, ExtCtrls, AdvPanel, DB,
  ADODB, Buttons, Grids, BaseGrid, AdvGrid, DBAdvGrid, tmsAdvGridExcel, ComObj,
  AdvObj;

type
  TfrmCustInfo = class(TForm)
    AdvPanel1: TAdvPanel;
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
    qryWP: TADOQuery;
    dsCustInfo: TDataSource;
    dgCustInfo: TDBAdvGrid;
    cmbParkNo: TAdvComboBox;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    btnDelete: TBitBtn;
    btnClose: TBitBtn;
    btnSeek: TBitBtn;
    btnExcel: TBitBtn;
    btnAllAdd: TBitBtn;
    qryTemp: TADOQuery;
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
    edtCurrAmt: TAdvSpinEdit;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    eCustInfo: TAdvGridExcelIO;
    edtCarType: TAdvEdit;
    cmbHIType: TAdvComboBox;
    edtHISTime: TAdvMaskEdit;
    edtHIETime: TAdvMaskEdit;
    procedure FormShow(Sender: TObject);
    procedure cmbGroupNoChange(Sender: TObject);
    procedure cmbParkNoChange(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure cmbWPNoChange(Sender: TObject);
    procedure dgCustInfoClick(Sender: TObject);
    procedure btnSeekClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure btnAllAddClick(Sender: TObject);
    procedure dgCustInfoCanSort(Sender: TObject; ACol: Integer;
      var DoSort: Boolean);
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
  frmCustInfo: TfrmCustInfo;
  nSelect: Byte = 0; //0:Add, 1:Modify
  sPrvCarNo, sPrvExpDateF, sPrvExpDateT: AnsiString;
  RGroup : Array[1..50] of RECGroup;
  nGroupCnt: Integer;

implementation
uses
  Global, Tables, Progress, Seek, Seek2;

{$R *.dfm}

procedure TfrmCustInfo.btnAllAddClick(Sender: TObject);
var
  vExcel: Variant;
  nCnt, i, j, nTotCnt: Integer;
  sReadRow : String;
  nGroupNo, nIssueAmt, nAPB, nWPNo: Integer;
  sName, sTelNo, sCarNo, sCompName, sGroupName, sTKNo, sPrvExpDateF, sPrvExpDateT, sPrvCarNo,
  sDeptName, sAddress, sIssueDate, sExpDateF, sExpDateT, sProcDate, sProcTime, sCarType: aString;
  sError: aString;
begin
  try
    vExcel:= CreateOleObject('Excel.application');
  except
    ShowMessage('Excel?? ???????? ???? ????????!!!');
    Exit;
  end;

  if OpenDialog1.Execute then
  begin
    vExcel.workbooks.open(OpenDialog1.FileName);
  end
  else
    Exit;

  sError:= '';
  sProcDate:= FormatDateTime('YYYY-MM-DD', Now);
  sProcTime:= FormatDateTime('HH:NN:SS', Now);
  nCnt:= strToint(vExcel.ActiveSheet.UsedRange.Rows.Count);
  nTotCnt:= 0;
  Refresh;
  StartProgress('??????????...', '????????????????.  ???? ????????????!', nCnt-1);

  for i:= 2 to nCnt do
  begin
    try
    begin
      sReadRow  := '0';
      sTKNo     := MG_InsZero(IntToStr(GetTickCount+i), 10);
      sReadRow  := 'A';
      nGroupNo  := StrToInt(aString(vExcel.Cells[i, 1]));
      sReadRow  := 'B';
      sGroupName:= aString(vExcel.Cells[i, 2]);
      sReadRow  := 'C';
      sName     := MG_StrTrim(aString(vExcel.Cells[i, 3]), ' ');
      sReadRow  := 'D';
      sTelNo    := aString(vExcel.Cells[i, 4]);
      sReadRow  := 'E';
      sCarNo    := MG_StrTrim(aString(vExcel.Cells[i, 5]), ' ');
      sReadRow  := 'F';
      sCompName := aString(vExcel.Cells[i, 6]);
      sReadRow  := 'G';
      sDeptName := aString(vExcel.Cells[i, 7]);
      sReadRow  := 'H';
      sAddress  := aString(vExcel.Cells[i, 8]);
      sReadRow  := 'I';
      sCarType  := aString(vExcel.Cells[i, 9]);
      sReadRow  := 'J';
      sIssueDate:= aString(vExcel.Cells[i, 10]);
      sReadRow  := 'K';
      nIssueAmt := StrToInt(aString(vExcel.Cells[i, 11]));
      sReadRow  := 'L';
      sExpDateF := aString(vExcel.Cells[i, 12]);
      sReadRow  := 'M';
      sExpDateT := aString(vExcel.Cells[i, 13]);
      sReadRow  := 'N';
      nWPNo     := StrToInt(aString(vExcel.Cells[i, 14]));
      nAPB      := 3;
    end
    except
      on E: Exception do
      begin
        ExceptLogging('TfrmCustInfo.btnAllAddClick: ' + aString(E.Message));
        ShowMessage(IntToStr(i) + '?? ' + sReadRow + '?? ???? ???? ?? ????????! ???????? ???? ????????');
        vExcel.WorkBooks.Close;
        vExcel.quit;
        vExcel:=unassigned;
        EndProgress;
        exit;
      end;
    end;


    with dmTables.qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from GGroup where ParkNo = :N1 and GroupNo = :N2');
      Parameters.ParamByName('N1').Value:= nCurrParkNo;
      Parameters.ParamByName('N2').Value:= nGroupNo;
      Open;

      if RecordCount <= 0 then
      begin
        sError:= sError + IntToStr(i-4) + '?? ??????????: ' + sGroupName + #13#10;

        try
          dmTables.ADODB.BeginTrans;
          Close;
          SQL.Clear;
          SQL.Add('Insert into GGroup ');
          SQL.Add('(ParkNo, GroupNo, GroupName, APB, Status, Remark, GroupType, UseFeeItem) ');
          SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8)');
          Parameters.ParamByName('N1').Value:= nCurrParkNo;
          Parameters.ParamByName('N2').Value:= nGroupNo;
          Parameters.ParamByName('N3').Value:= sGroupName;
          Parameters.ParamByName('N4').Value:= 3;
          Parameters.ParamByName('N5').Value:= 0;
          Parameters.ParamByName('N6').Value:= '';
          Parameters.ParamByName('N7').Value:= 0;
          Parameters.ParamByName('N8').Value:= 0;
          ExecSql;
          dmTables.ADODB.CommitTrans;
        except
          on E: Exception do
          begin
            dmTables.ADODB.RollbackTrans;
            ExceptLogging('TfrmCustInfo.btnAllAddClick: ' + aString(E.Message));
          end;
        end;
      end
      else
      begin
        try
          dmTables.ADODB.BeginTrans;
          Close;
          SQL.Clear;
          SQL.Add('Update GGroup Set GroupName = :N1 where GroupNo = :N2 ');
          Parameters.ParamByName('N1').Value:= sGroupName;
          Parameters.ParamByName('N2').Value:= nGroupNo;
          ExecSql;
          dmTables.ADODB.CommitTrans;
        except
          on E: Exception do
          begin
            dmTables.ADODB.RollbackTrans;
            ExceptLogging('TfrmCustInfo.btnAllAddClick: ' + aString(E.Message));
          end;
        end;
      end;

      Close;
      SQL.Clear;
      SQL.Add('Select * from CustInfo where CarNo = :N1 and TKType = :N2');
      Parameters.ParamByName('N1').Value:= sCarNo;
      Parameters.ParamByName('N2').Value:= 2;
      Open;

      if RecordCount <= 0 then
      begin
        //???????? ????????...
        try
          dmTables.ADODB.BeginTrans;
          Close;
          SQL.Clear;
          SQL.Add('Insert into CustInfo ');
          SQL.Add('(ParkNo, TKType, GroupNo, TKNo, Name, TelNo, CarNo, CompName, ');
          SQL.Add('DeptName, Address, IssueDate, IssueAmt, Status, ExpDateF, ');
          SQL.Add('ExpDateT, WPNo, LastParkNo, LastUnitNo, LastUseDate, LastUseTime, ');
          SQL.Add('IOStatusNo, CurrAmt, APB, CarType, MarkNo, Reserve1) ');
          SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, ');
          SQL.Add(':N11, :N12, :N13, :N14, :N15, :N16, :N17, :N18, :N19, :N20, ');
          SQL.Add(':N21, :N22, :N23, :N24, :N25, :N26)');
          Parameters.ParamByName('N1' ).Value:= nCurrParkNo;
          Parameters.ParamByName('N2' ).Value:= 2;
          Parameters.ParamByName('N3' ).Value:= nGroupNo;
          Parameters.ParamByName('N4' ).Value:= sTKNo;
          Parameters.ParamByName('N5' ).Value:= sName;
          Parameters.ParamByName('N6' ).Value:= sTelNo;
          Parameters.ParamByName('N7' ).Value:= sCarNo;
          Parameters.ParamByName('N8' ).Value:= sCompName;
          Parameters.ParamByName('N9' ).Value:= sDeptName;
          Parameters.ParamByName('N10').Value:= sAddress;
          Parameters.ParamByName('N11').Value:= sIssueDate;
          Parameters.ParamByName('N12').Value:= nIssueAmt;
          Parameters.ParamByName('N13').Value:= 0;
          Parameters.ParamByName('N14').Value:= sExpDateF;
          Parameters.ParamByName('N15').Value:= sExpDateT;
          Parameters.ParamByName('N16').Value:= nWPNo;
          Parameters.ParamByName('N17').Value:= 0;
          Parameters.ParamByName('N18').Value:= 0;
          Parameters.ParamByName('N19').Value:= '';
          Parameters.ParamByName('N20').Value:= '';
          Parameters.ParamByName('N21').Value:= 2;
          Parameters.ParamByName('N22').Value:= 0;
          Parameters.ParamByName('N23').Value:= nAPB;
          Parameters.ParamByName('N24').Value:= 1;
          Parameters.ParamByName('N25').Value:= '';
          Parameters.ParamByName('N26').Value:= sCarType;
          ExecSql;
          dmTables.ADODB.CommitTrans;
        except
          on E: Exception do
          begin
            dmTables.ADODB.RollbackTrans;
            ExceptLogging('TfrmCustInfo.btnAllAddClick: ' + aString(E.Message));
//            ShowMessage('???????? ?????????????? ????????! ???????? ????????????.');
            ShowMessage(IntToStr(i) + '???? ???? ???????? ?????????????? ????????! ???????? ????????????.');
          end;
        end;

        try
          dmTables.ADODB.BeginTrans;
          Close;
          SQL.Clear;
          SQL.Add('Insert Into IssueTK ');
          SQL.Add('(ParkNo, UnitNo, IssueDate, IssueTime, TKNo, CarNo, MNo, TKType, CarType, ');
          SQL.Add('IssueType, IssueUnit, ExpDateF, ExpDateT, FValue, WPNo, ChkClosing) ');
          SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, ');
          SQL.Add(':N11, :N12, :N13, :N14, :N15, :N16)');
          Parameters.ParamByName('N1' ).Value:= nCurrParkNo;
          Parameters.ParamByName('N2' ).Value:= 0;
          Parameters.ParamByName('N3' ).Value:= sProcDate;
          Parameters.ParamByName('N4' ).Value:= sProcTime;
          Parameters.ParamByName('N5' ).Value:= sTKNo;
          Parameters.ParamByName('N6' ).Value:= sCarNo;
          Parameters.ParamByName('N7' ).Value:= nCurrMNo;
          Parameters.ParamByName('N8' ).Value:= 2;
          Parameters.ParamByName('N9' ).Value:= 1;
          Parameters.ParamByName('N10').Value:= 1;
          Parameters.ParamByName('N11').Value:= 0;
          Parameters.ParamByName('N12').Value:= sExpDateF;
          Parameters.ParamByName('N13').Value:= sExpDateT;
          Parameters.ParamByName('N14').Value:= 0;
          Parameters.ParamByName('N15').Value:= 1;
          Parameters.ParamByName('N16').Value:= 0;
          ExecSql;
          dmTables.ADODB.CommitTrans;
        except
          on E: Exception do
          begin
            dmTables.ADODB.RollbackTrans;
            ExceptLogging('TfrmCustInfo.btnAllAddClick: ' + aString(E.Message));
            ShowMessage('???????? ?????????????? ????????! ???????? ????????????.');
          end;
        end;
        nTotCnt:= nTotCnt + 1;
      end
      else
      begin
        //?????? ????????...
        sPrvExpDateT:= FieldByName('ExpDateT').AsString;

        if sExpDateT <> sPrvExpDateT then
        begin
          //?????????? ?????? ???????????? ?????????? ???????? ???????? ????.
          try
            dmTables.ADODB.BeginTrans;
            Close;
            SQL.Clear;
            SQL.Add('Update Custinfo Set TelNo = :N1, CompName = :N3, DeptName = :N4, ');
            SQL.Add('Address = :N5, IssueDate = :N6, IssueAmt = :N7, ExpDateF = :N8, ExpDateT = :N9, ');
            SQL.Add('Reserve1 = :N10, APB = :N11, WPNo = :N12, Name = :N15 where CarNo = :N13 and TKType = :N14');
            Parameters.ParamByName('N1' ).Value:= sTelNo;
            Parameters.ParamByName('N3' ).Value:= sCompName;
            Parameters.ParamByName('N4' ).Value:= sDeptName;
            Parameters.ParamByName('N5' ).Value:= sAddress;
            Parameters.ParamByName('N6' ).Value:= sIssueDate;
            Parameters.ParamByName('N7' ).Value:= nIssueAmt;
            Parameters.ParamByName('N8' ).Value:= sExpDateF;
            Parameters.ParamByName('N9' ).Value:= sExpDateT;
            Parameters.ParamByName('N10').Value:= sCarType;
            Parameters.ParamByName('N11').Value:= nAPB;
            Parameters.ParamByName('N12').Value:= nWPNo;
            Parameters.ParamByName('N13').Value:= sCarNo;
            Parameters.ParamByName('N14').Value:= 2;
            Parameters.ParamByName('N15').Value:= sName;
            ExecSql;
            dmTables.ADODB.CommitTrans;
          except
            on E: Exception do
            begin
              dmTables.ADODB.RollbackTrans;
              ExceptLogging('TfrmCustInfo.btnAllAddClick: ' + aString(E.Message));
              ShowMessage('???????? ?????????????? ????????! ???????? ????????????.');
            end;
          end;

          try
            dmTables.ADODB.BeginTrans;
            Close;
            SQL.Clear;
            SQL.Add('Insert Into IssueTK ');
            SQL.Add('(ParkNo, UnitNo, IssueDate, IssueTime, TKNo, CarNo, MNo, TKType, CarType, ');
            SQL.Add('IssueType, IssueUnit, ExpDateF, ExpDateT, FValue, WPNo, ChkClosing) ');
            SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, ');
            SQL.Add(':N11, :N12, :N13, :N14, :N15, :N16)');
            Parameters.ParamByName('N1' ).Value:= nCurrParkNo;
            Parameters.ParamByName('N2' ).Value:= 0;
            Parameters.ParamByName('N3' ).Value:= sProcDate;
            Parameters.ParamByName('N4' ).Value:= sProcTime;
            Parameters.ParamByName('N5' ).Value:= sTKNo;
            Parameters.ParamByName('N6' ).Value:= sCarNo;
            Parameters.ParamByName('N7' ).Value:= nCurrMNo;
            Parameters.ParamByName('N8' ).Value:= 2;
            Parameters.ParamByName('N9' ).Value:= 1;
            Parameters.ParamByName('N10').Value:= 2;
            Parameters.ParamByName('N11').Value:= 0;
            Parameters.ParamByName('N12').Value:= sExpDateF;
            Parameters.ParamByName('N13').Value:= sExpDateT;
            Parameters.ParamByName('N14').Value:= 0;
            Parameters.ParamByName('N15').Value:= 1;
            Parameters.ParamByName('N16').Value:= 0;
            ExecSql;
            dmTables.ADODB.CommitTrans;
          except
            on E: Exception do
            begin
              dmTables.ADODB.RollbackTrans;
              ExceptLogging('TfrmCustInfo.btnAllAddClick: ' + aString(E.Message));
              ShowMessage('???????? ?????????????? ????????! ???????? ????????????.');
            end;
          end;
          nTotCnt:= nTotCnt + 1;
        end
        else
        begin
          //?????????? ???????????? ?????????? ????.
          try
            dmTables.ADODB.BeginTrans;
            Close;
            SQL.Clear;
            SQL.Add('Update Custinfo Set TelNo = :N1, CarNo = :N2, CompName = :N3, DeptName = :N4, ');
            SQL.Add('Address = :N5, IssueDate = :N6, IssueAmt = :N7, ExpDateF = :N8, ExpDateT = :N9, ');
//            SQL.Add('Reserve1 = :N10, APB = :N11, WPNo = :N12 where TKNo = :N13 and TKType = :N14');
            SQL.Add('Reserve1 = :N10, APB = :N11, WPNo = :N12 where CarNo = :N13 and TKType = :N14');
            Parameters.ParamByName('N1' ).Value:= sTelNo;
            Parameters.ParamByName('N2' ).Value:= sCarNo;
            Parameters.ParamByName('N3' ).Value:= sCompName;
            Parameters.ParamByName('N4' ).Value:= sDeptName;
            Parameters.ParamByName('N5' ).Value:= sAddress;
            Parameters.ParamByName('N6' ).Value:= sIssueDate;
            Parameters.ParamByName('N7' ).Value:= nIssueAmt;
            Parameters.ParamByName('N8' ).Value:= sExpDateF;
            Parameters.ParamByName('N9' ).Value:= sExpDateT;
            Parameters.ParamByName('N10').Value:= sCarType;
            Parameters.ParamByName('N11').Value:= nAPB;
            Parameters.ParamByName('N12').Value:= nWPNo;
//            Parameters.ParamByName('N13').Value:= sTKNo;
            Parameters.ParamByName('N13').Value:= sCarNo;
            Parameters.ParamByName('N14').Value:= 2;
            ExecSql;
            dmTables.ADODB.CommitTrans;
          except
            on E: Exception do
            begin
              dmTables.ADODB.RollbackTrans;
              ExceptLogging('TfrmCustInfo.btnAllAddClick: ' + aString(E.Message));
              ShowMessage('???????? ?????????????? ????????! ???????? ????????????.');
            end;
          end;
        end;
      end;
      SetProgress(1);
    end;
  end;
  vExcel.WorkBooks.Close;
  vExcel.quit ;
  vExcel:=unassigned;
  EndProgress;
  ShowMessage('??' + IntToStr(nTotCnt) + '???? ?????? ???????? ??????????????.');

  with dmTables.qryGroup do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * from GGroup Where ParkNo = :N1');
    Parameters.ParamByName('N1').Value:= nCurrParkNo;
    Open;

    if RecordCount > 0 then
    begin
      cmbGroupNo.Enabled:= True;
      edtGroupName.Visible:= True;
      cmbGroupNo.Items.Clear;
      nGroupCnt:= RecordCount;

      First;
      edtGroupName.Text:= FieldByName('GroupName').AsString;
      j:= 1;

      while not Eof do
      begin
        cmbGroupNo.Items.Add(IntToStr(FieldByName('GroupNo').AsInteger));
        RGroup[j].nGroupNo  := FieldByName('GroupNo').AsInteger;
        RGroup[j].sGroupName:= FieldByName('GroupName').AsString;
        j:= j+1;
        Next;
      end;
    end;
    cmbGroupNo.ItemIndex:= 0;
  end;

  with dmTables.qryCustInfo do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * from CustInfo where ParkNo = :N1 and TKType = :N2 and GroupNo = :N3');
    Parameters.ParamByName('N1').Value:= nCurrParkNo;
    Parameters.ParamByName('N2').Value:= 2;
    Parameters.ParamByName('N3').Value:= StrToInt(cmbGroupNo.Text);
    Open;
  end;
end;

procedure TfrmCustInfo.btnCancelClick(Sender: TObject);
begin
  frmClear;
end;

procedure TfrmCustInfo.btnCloseClick(Sender: TObject);
begin
  dmTables.qryCustInfo.Close;
  dmTables.qryGroup.Close;
  dmTables.qryWP.Close;
  dmTables.qryTemp.Close;
  Close;
end;

procedure TfrmCustInfo.btnDeleteClick(Sender: TObject);
begin
  try
    if MessageDlg('?????? ?????? ???????????', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;

    with dmTables.qryCustinfo do
    begin
      try
        Close;
        SQL.Clear;
        SQL.add('Insert into Custinfo_D select *, :N2 from CustInfo where CarNo = :N1');
        Parameters.ParamByName('N1').Value:= edtCarNo.Text;
        Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', Now);
        ExecSQL;
        ExceptLogging('TfrmCustInfo.btnDeleteClick : ???????????? ???? ' + edtCarNo.Text);
      except
        on E: Exception do
        begin
          ExceptLogging('TfrmCustInfo.btnDeleteClick1: ' + aString(E.Message));
        end;
      end;
    end;

    with dmTables.qryCustinfo do
    begin
      try
        dmTables.ADODB.BeginTrans;
        Close;
        SQL.Clear;
        SQL.Add('Delete from CustInfo where ParkNo = :N1 and CarNo = :N2');
        Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
        Parameters.ParamByName('N2').Value:= edtCarNo.Text;
        ExecSQL;
        dmTables.ADODB.CommitTrans;
      except
        on E: Exception do
        begin
          dmTables.ADODB.RollbackTrans;
          ExceptLogging('TfrmCustInfo.btnDeleteClick2: ' + aString(E.Message));
          ShowMessage('?????? ????????! ???????? ????????????.');
        end;
      end;
      Close;
      SQL.Clear;
      SQL.Add('Select * from CustInfo where ParkNo = :N1 and TKType = :N2 and GroupNo = :N3');
      SQL.Add(' Order by CarNo  ' );
      Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
      Parameters.ParamByName('N2').Value:= 2;
      Parameters.ParamByName('N3').Value:= StrToInt(cmbGroupNo.Text);
      Open;
    end;
    frmClear;
  except
    on E: Exception do ExceptLogging('TfrmCustInfo.btnDeleteClick3: ' + aString(E.Message));
  end;
end;

procedure TfrmCustInfo.btnExcelClick(Sender: TObject);
begin
  try
    if savedialog1.Execute then
    begin
      eCustInfo.XLSExport(savedialog1.filename + '.xls');
      ShowMessage('?????????? ????????!');
    end;
  except
    on E: Exception do ExceptLogging('TfrmCustInfo.btnExcelClick: ' + aString(E.Message));
  end;
end;

procedure TfrmCustInfo.btnSaveClick(Sender: TObject);
var
  sTime: TDateTime;
begin
  try
    btnSeek.Enabled:= True;
    cmbGroupNo.Enabled:= True;

    if Length(MG_StrTrim(aString(edtCarNo.Text), ' ')) < 8 then
    begin
      ShowMessage('?????????? ?????? ??????????????!');
      edtCarNo.SetFocus;
      Exit;
    end;

     //Added Woo.YH ???????? ?????? ????????
    if edtCarNo.Text <> sPrvCarNo then    //?????? ???????????? ????????
    begin
      with qryCustInfo do
      begin
         Close;
         SQL.Clear;
         SQL.Add('Select * from Custinfo where CarNo = :N1');
         Parameters.ParamByName('N1').Value:= MG_StrTrim(aString(edtCarNo.Text), ' ');
         Open;
         if RecordCount > 0 then
         begin
           ShowMessage(edtCarNo.Text + ' : ???? ???? ?????????? ???? ?????? ??????');
           Exit;
         end;
      end;
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

    with dmTables do
    begin
      Case nSelect of
        0: begin
             ShowMessage('???????????? ?????? ???????? ??????!');
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
                 SQL.Add('IOStatusNo = :N14, WPNo = :N15, ExpDateF = :N16, ExpDateT = :N17, Reserve1 = :N18 ');
                 SQL.Add(',HIType = :N19, HISTime = :N20, HIETime = :N21 ');
                 SQL.Add('Where ParkNo = :N9 and TKType = :N10 and GroupNo = :N11 and TKNo = :N12 and CarNo = :N13');
                 Parameters.ParamByName('N1' ).Value:= edtName.Text;
                 Parameters.ParamByName('N2' ).Value:= edtTelNo.Text;
                 Parameters.ParamByName('N3' ).Value:= MG_StrTrim(aString(edtCarNo.Text), ' ');
                 Parameters.ParamByName('N4' ).Value:= edtCompName.Text;
                 Parameters.ParamByName('N5' ).Value:= edtDeptName.Text;
                 Parameters.ParamByName('N6' ).Value:= edtAddress.Text;
                 Parameters.ParamByName('N7' ).Value:= cmbStatus.ItemIndex;
                 Parameters.ParamByName('N8' ).Value:= cmbAPB.ItemIndex+1;
                 Parameters.ParamByName('N9' ).Value:= StrToInt(cmbParkNo.Text);
                 Parameters.ParamByName('N10').Value:= 2;
                 Parameters.ParamByname('N11').Value:= StrToInt(cmbGroupNo.Text);
                 Parameters.ParamByName('N12').Value:= edtTKNo.Text;
                 Parameters.ParamByName('N13').Value:= sPrvCarNo;
                 Parameters.ParamByName('N14').Value:= cmbLastUseStatus.ItemIndex+1;
                 Parameters.ParamByName('N15').Value:= StrToInt(cmbWPNo.Text);
                 Parameters.ParamByName('N16').Value:= edtExpDateF.Text;
                 Parameters.ParamByName('N17').Value:= edtExpDateT.Text;
                 Parameters.ParamByName('N18').Value:= edtCarType.Text;
                 Parameters.ParamByName('N19').Value:= cmbHIType.ItemIndex;
                 Parameters.ParamByName('N20').Value:= edtHISTime.Text;
                 Parameters.ParamByName('N21').Value:= edtHIETime.Text;
                 ExecSql;

                 if (sPrvExpDateF <> edtExpDateF.Text) or (sPrvExpDateT <> edtExpDateT.Text) then
                 begin
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
                   Parameters.ParamByName('N9' ).Value:= edtIssueAmt.Value;
                   Parameters.ParamByName('N10').Value:= edtExpDateF.Text;
                   Parameters.ParamByName('N11').Value:= edtExpDateT.Text;
                   Parameters.ParamByName('N12').Value:= 0;
                   Parameters.ParamByName('N13').Value:= 0;
                   Parameters.ParamByName('N14').Value:= edtCarNo.Text;
                   Parameters.ParamByName('N15').Value:= StrToInt(cmbWPNo.Text);
                   ExecSql;
                 end;
                 dmTables.ADODB.CommitTrans;
               except
                 on E: Exception do
                 begin
                   dmTables.ADODB.RollbackTrans;
                   ExceptLogging('TfrmCustInfo.btnSaveClick: ' + aString(E.Message));
                   ShowMessage('?????? ????????! ???????? ????????????.');
                 end;
               end;

               Close;
               SQL.Clear;
               SQL.Add('Select * from CustInfo where ParkNo = :N1 and TKType = :N2 and GroupNo = :N3');
               Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
               Parameters.ParamByName('N2').Value:= 2;
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
      ExceptLogging('TfrmCustInfo.btnSaveClick: ' + aString(E.Message));
    end;
  end;
end;

procedure TfrmCustInfo.btnSeekClick(Sender: TObject);
begin
  if nApt = 1 then
    NextModalDialog(TfrmSeek2.Create(Self))
  else
    NextModalDialog(TfrmSeek.Create(Self));
end;

procedure TfrmCustInfo.cmbGroupNoChange(Sender: TObject);
var
  i: Integer;
begin
  with dmTables.qryCustInfo do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * from CustInfo where ParkNo = :N1 and TkType = :N2 and GroupNo = :N3');
    SQL.Add(' Order by CarNo ') ;
    Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
    Parameters.ParamByName('N2').Value:= 2;
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

procedure TfrmCustInfo.cmbParkNoChange(Sender: TObject);
var
  i: Integer;
begin
  try
    for i:= 1 to 50 do
    begin
      RGroup[i].nGroupNo:= 0;
      RGroup[i].sGroupName:= '';
    end;

    with dmTables.qryGroup do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from GGroup Where ParkNo = :N1');
      Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
      Open;

      nGroupCnt:= RecordCount;

      if RecordCount <= 0 then
      begin
        btnSave.Enabled:= False;
        ShowMessage('???????????? ???? ??????????????!');
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
        ShowMessage('???????????? ???????????? ??????????????!');
        Exit;
      end;

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
      SQL.Add(' Order by CarNo  ' );
      Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
      Parameters.ParamByName('N2').Value:= 2;
      Parameters.ParamByName('N3').Value:= StrToInt(cmbGroupNo.Text);
      Open;
    end;
    nSelect:= 0;
  except
    on E: Exception do ExceptLogging('TfrmCustInfo.cmbParkNoChange: ' + aString(E.Message));
  end;
end;

procedure TfrmCustInfo.cmbWPNoChange(Sender: TObject);
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

procedure TfrmCustInfo.dgCustInfoCanSort(Sender: TObject; ACol: Integer;
  var DoSort: Boolean);
var
  fdName, sSort: String;
  sSDate, sEDate, sSTime, sETime: String;
begin
  DoSort:= False;

  if dgCustInfo.SortSettings.Direction = sdAscending then
  begin
    dgCustInfo.SortSettings.Direction:= sdDescending;
    sSort:= ' Desc';
  end
  else
  begin
    dgCustInfo.SortSettings.Direction:= sdAscending;
    sSort:= '';
  end;

  fdName:= qryCustInfo.FieldList.Fields[ACol+1].FieldName;



  with qryCustInfo do
  begin
    Close;
    SQL.Clear;
    Close;
    SQL.Clear;
    SQL.Add('Select * from CustInfo where ParkNo = :N1 and TkType = :N2 and GroupNo = :N3');
    Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
    Parameters.ParamByName('N2').Value:= 2;
    Parameters.ParamByName('N3').Value:= StrToInt(cmbGroupNo.Text);
    SQL.Add('Order By ' + fdName + sSort);

    Open;

    if RecordCount > 0 then
    begin
      btnExcel.Enabled:= True;
    end
    else
    begin
      btnExcel.Enabled:= False;
    end;
  end;
  dgCustInfo.SortSettings.Column:= ACol;
end;

procedure TfrmCustInfo.dgCustInfoClick(Sender: TObject);
var
  i: Byte;
begin
  try
    with dmTables do
    begin
      if qryCustInfo.RecordCount <= 0 then
        Exit;

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
        edtExpDateF   .Text:= FieldByName('ExpDateF').AsString;
        edtExpDateT   .Text:= FieldByName('ExpDateT').AsString;
        cmbWPNo       .Text:= IntToStr(FieldByName('WPNo').AsInteger);
        edtLastUnitNo .Text:= IntToStr(FieldByName('LastUnitNo').AsInteger);
        edtLastUseDate.Text:= FieldByName('LastUseDate').AsString;
        edtLastUseTime.Text:= FieldByName('LastUseTime').AsString;
        cmbAPB        .ItemIndex:= FieldByName('APB').AsInteger - 1;
        edtCurrAmt.Value:= FieldByName('CurrAmt').AsInteger;
        sPrvCarNo:= FieldByName('CarNo').AsString;
        sPrvExpDateF:= FieldByName('ExpDateF').AsString;
        sPrvExpDateT:= FieldByName('ExpDateT').AsString;
        cmbLastUseStatus.ItemIndex:= FieldByName('IOStatusNo').AsInteger - 1;
        edtCarType.Text:= FieldByName('Reserve1').AsString;
        cmbGroupNo.ItemIndex:= cmbGroupNo.Items.IndexOf(IntToStr(FieldByName('GroupNo').AsInteger));

        for i:= 1 to nGroupCnt do
        if RGroup[i].nGroupNo = StrToInt(cmbGroupNo.Text) then
        begin
          edtGroupName.Text:= RGroup[i].sGroupName;
          Break;
        end;
        cmbWPNoChange(Self);
        cmbHIType.ItemIndex:= FieldByName('HIType').AsInteger;
        edtHISTime.Text:= FieldByName('HISTime').AsString;
        edtHIETime.Text:= FieldByName('HIETime').AsString;
      end;
    end;
    btnCancel.Enabled:= True;
    btnDelete.Enabled:= True;
    nSelect:= 1;
  except
    on E: Exception do ExceptLogging('TfrmCustInfo.dgCustomClick: ' + aString(E.Message));
  end;
end;

procedure TfrmCustInfo.FormShow(Sender: TObject);
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
        ShowMessage('???????? ???? ??????????????!');
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
      SQL.Add('Select * from GGroup Where ParkNo = :N1 and Reserve1 is null');
      Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
      Open;

      nGroupCnt:= RecordCount;

      if RecordCount <= 0 then
      begin
        btnSave.Enabled:= False;
        ShowMessage('?????????????? ???? ??????????????!');
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
        ShowMessage('???????????? ???????????? ??????????????!');
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
      SQL.Add(' Order by CarNo  ' );
      Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
      Parameters.ParamByName('N2').Value:= 2;
      Parameters.ParamByName('N3').Value:= StrToInt(cmbGroupNo.Text);
      Open;
    end;
    nSelect:= 0;
    frmClear;

    if nApt = 1 then
    begin
      cmbHIType.Visible := true;
      edtHISTime.Visible := true;
      edtHIETime.Visible := true;

      dgCustInfo.Columns[6].Header := '??';
      dgCustInfo.Columns[7].Header := '??';

      edtCompName.LabelCaption := '??';
      edtDeptName.LabelCaption := '??';
    end
    else
    begin
      cmbHIType.Visible := false;
      edtHISTime.Visible := false;
      edtHIETime.Visible := false;

      dgCustInfo.ColWidths[21] := -1;
      dgCustInfo.ColWidths[22] := -1;
      dgCustInfo.ColWidths[23] := -1;
    end;
  except
    on E: Exception do ExceptLogging('TfrmCustInfo.FormShow: ' + aString(E.Message));
  end;
end;

procedure TfrmCustInfo.frmClear;
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
    edtCarType    .Text := '';
    edtCurrAmt    .Value:= 0;
    cmbWPNo       .ItemIndex:= 0;
    cmbAPB        .ItemIndex:= 2;
    cmbWPNoChange(Self);
    cmbHIType.ItemIndex:= 0;
    edtHISTime.Text:= '';
    edtHIETime.Text:= '';
    btnDelete.Enabled:= False;
    btnCancel.Enabled:= False;
    nSelect:= 0;
  except
    on E: Exception do ExceptLogging('TfrmCustInfo.frmClear: ' + aString(E.Message));
  end;
end;

end.
