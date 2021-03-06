unit CustInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvSpin, Mask, AdvEdit, StdCtrls, AdvCombo, ExtCtrls, AdvPanel, DB,
  ADODB, Buttons, Grids, BaseGrid, AdvGrid, DBAdvGrid, tmsAdvGridExcel, ComObj,
  AdvObj, Vcl.ComCtrls, AdvDateTimePicker, Vcl.Samples.Spin;

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
    edtAddress: TAdvEdit;
    cmbStatus: TAdvComboBox;
    edtIssueDate: TAdvMaskEdit;
    edtIssueAmt: TAdvSpinEdit;
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
    cmbPayType: TAdvComboBox;
    edtExpDateF: TAdvDateTimePicker;
    edtExpDateT: TAdvDateTimePicker;
    edtMonthAdd: TSpinEdit;
    btnAdd3Month: TButton;
    btnSetConfirm: TBitBtn;
    edtCompName: TAdvEdit;
    edtDeptName: TAdvEdit;
    edtChangeGroupNo: TAdvEdit;
    edtGroupNo: TAdvEdit;
    btnSeekAll: TBitBtn;
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
    procedure btnAdd3MonthClick(Sender: TObject);
    procedure btnSetConfirmClick(Sender: TObject);
    procedure edtCarNoKeyPress(Sender: TObject; var Key: Char);
    procedure edtNameKeyPress(Sender: TObject; var Key: Char);
    procedure btnSeekAllClick(Sender: TObject);
    procedure edtCarNoClick(Sender: TObject);
    procedure edtNameClick(Sender: TObject);
    procedure edtCarTypeClick(Sender: TObject);
    procedure edtCompNameClick(Sender: TObject);
    procedure edtDeptNameClick(Sender: TObject);
    procedure edtAddressClick(Sender: TObject);
  private
    { Private declarations }
    procedure frmClear;
   function dateDaysInMonth(D: TDateTime): Integer;
   function dateMonth(D: TDateTime): Integer;
   function dateLeapYear(D: TDateTime): Boolean;
   function dateEndOfMonth(D: TDateTime): TDateTime;
   function GetdateYear(D: TDateTime): Integer;
   function GetdateMonth(D: TDateTime): Integer;
   function GetdateDay(D: TDateTime): Integer;
   function GetAddMonth(DayInfo: AnsiString;DayInt:Integer): AnsiString;
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
  sPrvCarNo, sPrvExpDateF, sPrvExpDateT, sPrvCurrAmt: AnsiString;
  RGroup : Array[1..50] of RECGroup;
  nGroupCnt: Integer;

implementation
uses
  Global, Tables, Progress, Seek, Seek2;

{$R *.dfm}

procedure TfrmCustInfo.btnAdd3MonthClick(Sender: TObject);
var sEDate : AnsiString;
begin
    try
      sEDate  :=FormatDateTime('YYYY-MM-DD', edtExpDateT.Date);
      StrToDate(sEDate);
    except
      on E: Exception do
      begin
        ShowMessage('???????? ????????  ?????? ??????????????!');
        edtExpDateF.SetFocus;
        Exit;
      end;
    end;
    edtExpDateT.Date :=StrToDate(GetAddMonth(sEDate,edtMonthAdd.Value));
end;

//procedure TfrmCustInfo.btnAllAddClick(Sender: TObject);
//var
//  vExcel: Variant;
//  nCnt, i, j, nTotCnt: Integer;
//  nGroupNo, nIssueAmt, nAPB, nWPNo: Integer;
//  sName, sTelNo, sCarNo, sCompName, sGroupName, sTKNo, sPrvExpDateF, sPrvExpDateT, sPrvCarNo,
//  sDeptName, sAddress, sIssueDate, sExpDateF, sExpDateT, sProcDate, sProcTime, sCarType: aString;
//  sError: aString;
//begin
//  try
//    vExcel:= CreateOleObject('Excel.application');
//  except
//    ShowMessage('Excel?? ???????? ???? ????????!!!');
//    Exit;
//  end;
//
//  if OpenDialog1.Execute then
//  begin
//    vExcel.workbooks.open(OpenDialog1.FileName);
//  end
//  else
//    Exit;
//
//  sError:= '';
//  sProcDate:= FormatDateTime('YYYY-MM-DD', Now);
//  sProcTime:= FormatDateTime('HH:NN:SS', Now);
//  nCnt:= strToint(vExcel.ActiveSheet.UsedRange.Rows.Count);
//  nTotCnt:= 0;
//  Refresh;
//  StartProgress('??????????...', '????????????????.  ???? ????????????!', nCnt-1);
//
//  for i:= 2 to nCnt do
//  begin
//    sTKNo     := MG_InsZero(IntToStr(GetTickCount+i), 10);
//    nGroupNo  := StrToInt(aString(vExcel.Cells[i, 1]));
//    sGroupName:= aString(vExcel.Cells[i, 2]);
//    sName     := MG_StrTrim(aString(vExcel.Cells[i, 3]), ' ');
//    sTelNo    := aString(vExcel.Cells[i, 4]);
//    sCarNo    := MG_StrTrim(aString(vExcel.Cells[i, 5]), ' ');
//    sCompName := aString(vExcel.Cells[i, 6]);
//    sDeptName := aString(vExcel.Cells[i, 7]);
//    sAddress  := aString(vExcel.Cells[i, 8]);
//    sCarType  := aString(vExcel.Cells[i, 9]);
//    sIssueDate:= aString(vExcel.Cells[i, 10]);
//    nIssueAmt := StrToInt(aString(vExcel.Cells[i, 11]));
//    sExpDateF := aString(vExcel.Cells[i, 12]);
//    sExpDateT := aString(vExcel.Cells[i, 13]);
//    nWPNo     := StrToInt(aString(vExcel.Cells[i, 14]));
//    nAPB      := 3;
//
//    with dmTables.qryTemp do
//    begin
//      Close;
//      SQL.Clear;
//      SQL.Add('Select * from GGroup where ParkNo = :N1 and GroupNo = :N2');
//      Parameters.ParamByName('N1').Value:= nCurrParkNo;
//      Parameters.ParamByName('N2').Value:= nGroupNo;
//      Open;
//
//      if RecordCount <= 0 then
//      begin
//        sError:= sError + IntToStr(i-4) + '?? ??????????: ' + sGroupName + #13#10;
//
//        try
//          dmTables.ADODB.BeginTrans;
//          Close;
//          SQL.Clear;
//          SQL.Add('Insert into GGroup ');
//          SQL.Add('(ParkNo, GroupNo, GroupName, APB, Status, Remark, GroupType, UseFeeItem) ');
//          SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8)');
//          Parameters.ParamByName('N1').Value:= nCurrParkNo;
//          Parameters.ParamByName('N2').Value:= nGroupNo;
//          Parameters.ParamByName('N3').Value:= sGroupName;
//          Parameters.ParamByName('N4').Value:= 3;
//          Parameters.ParamByName('N5').Value:= 0;
//          Parameters.ParamByName('N6').Value:= '';
//          Parameters.ParamByName('N7').Value:= 0;
//          Parameters.ParamByName('N8').Value:= 0;
//          ExecSql;
//          dmTables.ADODB.CommitTrans;
//        except
//          on E: Exception do
//          begin
//            dmTables.ADODB.RollbackTrans;
//            ExceptLogging('TfrmCustInfo.btnAllAddClick: ' + aString(E.Message));
//          end;
//        end;
//      end
//      else
//      begin
//        try
//          dmTables.ADODB.BeginTrans;
//          Close;
//          SQL.Clear;
//          SQL.Add('Update GGroup Set GroupName = :N1 where GroupNo = :N2 ');
//          Parameters.ParamByName('N1').Value:= sGroupName;
//          Parameters.ParamByName('N2').Value:= nGroupNo;
//          ExecSql;
//          dmTables.ADODB.CommitTrans;
//        except
//          on E: Exception do
//          begin
//            dmTables.ADODB.RollbackTrans;
//            ExceptLogging('TfrmCustInfo.btnAllAddClick: ' + aString(E.Message));
//          end;
//        end;
//      end;
//
//      Close;
//      SQL.Clear;
//      SQL.Add('Select * from CustInfo where CarNo = :N1 and TKType = :N2');
//      Parameters.ParamByName('N1').Value:= sCarNo;
//      Parameters.ParamByName('N2').Value:= 2;
//      Open;
//
//      if RecordCount <= 0 then
//      begin
//        //???????? ????????...
//        try
//          dmTables.ADODB.BeginTrans;
//          Close;
//          SQL.Clear;
//          SQL.Add('Insert into CustInfo ');
//          SQL.Add('(ParkNo, TKType, GroupNo, TKNo, Name, TelNo, CarNo, CompName, ');
//          SQL.Add('DeptName, Address, IssueDate, IssueAmt, Status, ExpDateF, ');
//          SQL.Add('ExpDateT, WPNo, LastParkNo, LastUnitNo, LastUseDate, LastUseTime, ');
//          SQL.Add('IOStatusNo, CurrAmt, APB, CarType, MarkNo, Reserve1) ');
//          SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, ');
//          SQL.Add(':N11, :N12, :N13, :N14, :N15, :N16, :N17, :N18, :N19, :N20, ');
//          SQL.Add(':N21, :N22, :N23, :N24, :N25, :N26)');
//          Parameters.ParamByName('N1' ).Value:= nCurrParkNo;
//          Parameters.ParamByName('N2' ).Value:= 2;
//          Parameters.ParamByName('N3' ).Value:= nGroupNo;
//          Parameters.ParamByName('N4' ).Value:= sTKNo;
//          Parameters.ParamByName('N5' ).Value:= sName;
//          Parameters.ParamByName('N6' ).Value:= sTelNo;
//          Parameters.ParamByName('N7' ).Value:= sCarNo;
//          Parameters.ParamByName('N8' ).Value:= sCompName;
//          Parameters.ParamByName('N9' ).Value:= sDeptName;
//          Parameters.ParamByName('N10').Value:= sAddress;
//          Parameters.ParamByName('N11').Value:= sIssueDate;
//          Parameters.ParamByName('N12').Value:= nIssueAmt;
//          Parameters.ParamByName('N13').Value:= 0;
//          Parameters.ParamByName('N14').Value:= sExpDateF;
//          Parameters.ParamByName('N15').Value:= sExpDateT;
//          Parameters.ParamByName('N16').Value:= nWPNo;
//          Parameters.ParamByName('N17').Value:= 0;
//          Parameters.ParamByName('N18').Value:= 0;
//          Parameters.ParamByName('N19').Value:= '';
//          Parameters.ParamByName('N20').Value:= '';
//          Parameters.ParamByName('N21').Value:= 2;
//          Parameters.ParamByName('N22').Value:= 0;
//          Parameters.ParamByName('N23').Value:= nAPB;
//          Parameters.ParamByName('N24').Value:= 1;
//          Parameters.ParamByName('N25').Value:= '';
//          Parameters.ParamByName('N26').Value:= sCarType;
//          ExecSql;
//          dmTables.ADODB.CommitTrans;
//        except
//          on E: Exception do
//          begin
//            dmTables.ADODB.RollbackTrans;
//            ExceptLogging('TfrmCustInfo.btnAllAddClick: ' + aString(E.Message));
//            ShowMessage('???????? ?????????????? ????????! ???????? ????????????.??????'+aString(i));
//          end;
//        end;
//
//        try
//          dmTables.ADODB.BeginTrans;
//          Close;
//          SQL.Clear;
//          SQL.Add('Insert Into IssueTK ');
//          SQL.Add('(ParkNo, UnitNo, IssueDate, IssueTime, TKNo, CarNo, MNo, TKType, CarType, ');
//          SQL.Add('IssueType, IssueUnit, ExpDateF, ExpDateT, FValue, WPNo, ChkClosing     ');
//          SQL.Add(', CompName, DeptName, Name, TelNo, GroupNo ) ');
//          SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, ');
//          SQL.Add(':N11, :N12, :N13, :N14, :N15, :N16, :pCompName, :pDeptName, :pName, :pTelNo, :pGroupNo)');
//          Parameters.ParamByName('N1' ).Value:= nCurrParkNo;
//          Parameters.ParamByName('N2' ).Value:= 0;
//          Parameters.ParamByName('N3' ).Value:= sProcDate;
//          Parameters.ParamByName('N4' ).Value:= sProcTime;
//          Parameters.ParamByName('N5' ).Value:= sTKNo;
//          Parameters.ParamByName('N6' ).Value:= sCarNo;
//          Parameters.ParamByName('N7' ).Value:= nCurrMNo;
//          Parameters.ParamByName('N8' ).Value:= 2;
//          Parameters.ParamByName('N9' ).Value:= 1;
//          Parameters.ParamByName('N10').Value:= 1;
//          Parameters.ParamByName('N11').Value:= 0;
//          Parameters.ParamByName('N12').Value:= sExpDateF;
//          Parameters.ParamByName('N13').Value:= sExpDateT;
//          Parameters.ParamByName('N14').Value:= 0;
//          Parameters.ParamByName('N15').Value:= 1;
//          Parameters.ParamByName('N16').Value:= 0;
//          Parameters.ParamByName('pCompName').Value:= sCompName;  // ??, ?? (??????, ??????)
//          Parameters.ParamByName('pDeptName').Value:= sDeptName;
//          Parameters.ParamByName('pName').Value:= sName;          // ????
//          Parameters.ParamByName('pTelNo').Value:= sTelNo;        // ????????
//          Parameters.ParamByName('pGroupNo').Value:= nGroupNo;
//          ExecSql;
//          dmTables.ADODB.CommitTrans;
//        except
//          on E: Exception do
//          begin
//            dmTables.ADODB.RollbackTrans;
//            ExceptLogging('TfrmCustInfo.btnAllAddClick: ' + aString(E.Message));
//            ShowMessage('???????? ?????????????? ????????! ???????? ????????????..??????'+aString(i));
//          end;
//        end;
//        nTotCnt:= nTotCnt + 1;
//      end
//      else
//      begin
//        //?????? ????????...
//        sPrvExpDateT:= FieldByName('ExpDateT').AsString;
//
//        if sExpDateT <> sPrvExpDateT then
//        begin
//          //?????????? ?????? ???????????? ?????????? ???????? ???????? ????.
//          try
//            dmTables.ADODB.BeginTrans;
//            Close;
//            SQL.Clear;
//            SQL.Add('Update Custinfo Set TelNo = :N1, CompName = :N3, DeptName = :N4, ');
//            SQL.Add('Address = :N5, IssueDate = :N6, IssueAmt = :N7, ExpDateF = :N8, ExpDateT = :N9, ');
//            SQL.Add('Reserve1 = :N10, APB = :N11, WPNo = :N12, Name = :N15 where CarNo = :N13 and TKType = :N14');
//            Parameters.ParamByName('N1' ).Value:= sTelNo;
//            Parameters.ParamByName('N3' ).Value:= sCompName;
//            Parameters.ParamByName('N4' ).Value:= sDeptName;
//            Parameters.ParamByName('N5' ).Value:= sAddress;
//            Parameters.ParamByName('N6' ).Value:= sIssueDate;
//            Parameters.ParamByName('N7' ).Value:= nIssueAmt;
//            Parameters.ParamByName('N8' ).Value:= sExpDateF;
//            Parameters.ParamByName('N9' ).Value:= sExpDateT;
//            Parameters.ParamByName('N10').Value:= sCarType;
//            Parameters.ParamByName('N11').Value:= nAPB;
//            Parameters.ParamByName('N12').Value:= nWPNo;
//            Parameters.ParamByName('N13').Value:= sCarNo;
//            Parameters.ParamByName('N14').Value:= 2;
//            Parameters.ParamByName('N15').Value:= sName;
//            ExecSql;
//            dmTables.ADODB.CommitTrans;
//          except
//            on E: Exception do
//            begin
//              dmTables.ADODB.RollbackTrans;
//              ExceptLogging('TfrmCustInfo.btnAllAddClick: ' + aString(E.Message));
//              ShowMessage('???????? ?????????????? ????????! ???????? ????????????..??????'+aString(i));
//            end;
//          end;
//
//          try
//            dmTables.ADODB.BeginTrans;
//            Close;
//            SQL.Clear;
//            SQL.Add('Insert Into IssueTK ');
//            SQL.Add('(ParkNo, UnitNo, IssueDate, IssueTime, TKNo, CarNo, MNo, TKType, CarType, ');
//            SQL.Add('IssueType, IssueUnit, ExpDateF, ExpDateT, FValue, WPNo, ChkClosin ');
//            SQL.Add(', CompName, DeptName, Name, TelNo, GroupNo ) ');
//            SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, ');
//            SQL.Add(':N11, :N12, :N13, :N14, :N15, :N16, :pCompName, :pDeptName, :pName, :pTelNo, :pGroupNo)');
//            Parameters.ParamByName('N1' ).Value:= nCurrParkNo;
//            Parameters.ParamByName('N2' ).Value:= 0;
//            Parameters.ParamByName('N3' ).Value:= sProcDate;
//            Parameters.ParamByName('N4' ).Value:= sProcTime;
//            Parameters.ParamByName('N5' ).Value:= sTKNo;
//            Parameters.ParamByName('N6' ).Value:= sCarNo;
//            Parameters.ParamByName('N7' ).Value:= nCurrMNo;
//            Parameters.ParamByName('N8' ).Value:= 2;
//            Parameters.ParamByName('N9' ).Value:= 1;
//            Parameters.ParamByName('N10').Value:= 2;
//            Parameters.ParamByName('N11').Value:= 0;
//            Parameters.ParamByName('N12').Value:= sExpDateF;
//            Parameters.ParamByName('N13').Value:= sExpDateT;
//            Parameters.ParamByName('N14').Value:= 0;
//            Parameters.ParamByName('N15').Value:= 1;
//            Parameters.ParamByName('N16').Value:= 0;
//            Parameters.ParamByName('pCompName').Value:= sCompName;  // ??, ?? (??????, ??????)
//            Parameters.ParamByName('pDeptName').Value:= sDeptName;
//            Parameters.ParamByName('pName').Value:= sName;          // ????
//            Parameters.ParamByName('pTelNo').Value:= sTelNo;        // ????????
//            Parameters.ParamByName('pGroupNo').Value:= nGroupNo;
//            ExecSql;
//            dmTables.ADODB.CommitTrans;
//          except
//            on E: Exception do
//            begin
//              dmTables.ADODB.RollbackTrans;
//              ExceptLogging('TfrmCustInfo.btnAllAddClick: ' + aString(E.Message));
//              ShowMessage('???????? ?????????????? ????????! ???????? ????????????..??????'+aString(i));
//            end;
//          end;
//          nTotCnt:= nTotCnt + 1;
//        end
//        else
//        begin
//          //?????????? ???????????? ?????????? ????.
//          try
//            dmTables.ADODB.BeginTrans;
//            Close;
//            SQL.Clear;
//            SQL.Add('Update Custinfo Set TelNo = :N1, CarNo = :N2, CompName = :N3, DeptName = :N4, ');
//            SQL.Add('Address = :N5, IssueDate = :N6, IssueAmt = :N7, ExpDateF = :N8, ExpDateT = :N9, ');
//            SQL.Add('Reserve1 = :N10, APB = :N11, WPNo = :N12 where TKNo = :N13 and TKType = :N14');
//            Parameters.ParamByName('N1' ).Value:= sTelNo;
//            Parameters.ParamByName('N2' ).Value:= sCarNo;
//            Parameters.ParamByName('N3' ).Value:= sCompName;
//            Parameters.ParamByName('N4' ).Value:= sDeptName;
//            Parameters.ParamByName('N5' ).Value:= sAddress;
//            Parameters.ParamByName('N6' ).Value:= sIssueDate;
//            Parameters.ParamByName('N7' ).Value:= nIssueAmt;
//            Parameters.ParamByName('N8' ).Value:= sExpDateF;
//            Parameters.ParamByName('N9' ).Value:= sExpDateT;
//            Parameters.ParamByName('N10').Value:= sCarType;
//            Parameters.ParamByName('N11').Value:= nAPB;
//            Parameters.ParamByName('N12').Value:= nWPNo;
//            Parameters.ParamByName('N13').Value:= sTKNo;
//            Parameters.ParamByName('N14').Value:= 2;
//            ExecSql;
//            dmTables.ADODB.CommitTrans;
//          except
//            on E: Exception do
//            begin
//              dmTables.ADODB.RollbackTrans;
//              ExceptLogging('TfrmCustInfo.btnAllAddClick: ' + aString(E.Message));
//              ShowMessage('???????? ?????????????? ????????! ???????? ????????????..??????'+aString(i));
//            end;
//          end;
//        end;
//      end;
//      SetProgress(1);
//    end;
//  end;
//  vExcel.WorkBooks.Close;
//  vExcel.quit ;
//  vExcel:=unassigned;
//  EndProgress;
//  ShowMessage('??' + IntToStr(nTotCnt) + '???? ?????? ???????? ??????????????.');
//
//  with dmTables.qryGroup do
//  begin
//    Close;
//    SQL.Clear;
//    SQL.Add('Select * from GGroup Where ParkNo = :N1');
//    Parameters.ParamByName('N1').Value:= nCurrParkNo;
//    Open;
//
//    if RecordCount > 0 then
//    begin
//      cmbGroupNo.Enabled:= True;
//      edtGroupName.Visible:= True;
//      cmbGroupNo.Items.Clear;
//      nGroupCnt:= RecordCount;
//
//      First;
//      edtGroupName.Text:= FieldByName('GroupName').AsString;
//      j:= 1;
//
//      while not Eof do
//      begin
//        cmbGroupNo.Items.Add(IntToStr(FieldByName('GroupNo').AsInteger));
//        RGroup[j].nGroupNo  := FieldByName('GroupNo').AsInteger;
//        RGroup[j].sGroupName:= FieldByName('GroupName').AsString;
//        j:= j+1;
//        Next;
//      end;
//    end;
//    cmbGroupNo.ItemIndex:= 0;
//  end;
//
//  with dmTables.qryCustInfo do
//  begin
//    Close;
//    SQL.Clear;
//    SQL.Add('Select * from CustInfo where ParkNo = :N1 and TKType = :N2 and GroupNo = :N3');
//    //SQL.Add(' Order by convert(int,DeptName)  ' );
//    Parameters.ParamByName('N1').Value:= nCurrParkNo;
//    Parameters.ParamByName('N2').Value:= 2;
//    Parameters.ParamByName('N3').Value:= StrToInt(cmbGroupNo.Text);
//    Open;
//  end;
//end;

procedure TfrmCustInfo.btnAllAddClick(Sender: TObject);
var
  vExcel: Variant;
  nCnt, i, j, nTotCnt: Integer;
  sReadRow : String;
  nGroupNo, nIssueAmt, nAPB, nWPNo: Integer;
  sName, sTelNo, sCarNo, sCompName, sGroupName, sTKNo, sPrvExpDateF, sPrvExpDateT, sPrvCarNo,
  sDeptName, sAddress, sIssueDate, sExpDateF, sExpDateT, sProcDate, sProcTime, sCarType: aString;
  sError: aString;
  nsGroupNo : aString;
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
     nsGroupNo  := vExcel.Cells[i, 1];
     if nsGroupNo = '' then
     begin
        Break;
     end;
     nCnt := i;
  end;

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

        if nGroupNo = 0 then
        begin
          ShowMessage('?????????? 1?????? ??????????.');
          Exit;
        end;
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
          SQL.Add(':N11, :NIssueAmt, :N13, :N14, :N15, :N16, :N17, :N18, :N19, :N20, ');
          SQL.Add(':N21, :NCurrAmt, :N23, :N24, :N25, :N26)');
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
          Parameters.ParamByName('NIssueAmt').Value:= nIssueAmt;
          Parameters.ParamByName('N13').Value:= 1;//0;
          Parameters.ParamByName('N14').Value:= sExpDateF;
          Parameters.ParamByName('N15').Value:= sExpDateT;
          Parameters.ParamByName('N16').Value:= nWPNo;
          Parameters.ParamByName('N17').Value:= 0;
          Parameters.ParamByName('N18').Value:= 0;
          Parameters.ParamByName('N19').Value:= '';
          Parameters.ParamByName('N20').Value:= '';
          Parameters.ParamByName('N21').Value:= 2;
          Parameters.ParamByName('NCurrAmt').Value:= nIssueAmt;
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
          SQL.Add(':NIssueUnit, :N12, :N13, :NFValue, :N15, :N16)');
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
          Parameters.ParamByName('NIssueUnit').Value:= nIssueAmt;
          Parameters.ParamByName('N12').Value:= sExpDateF;
          Parameters.ParamByName('N13').Value:= sExpDateT;
          Parameters.ParamByName('NFValue').Value:= nIssueAmt;
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
            SQL.Add('Update Custinfo Set TelNo = :N1, CompName = :N3, DeptName = :N4, GroupNo = :N16, ');
            SQL.Add('Address = :N5, IssueDate = :N6, IssueAmt = :NIssueAmt, CurrAmt = :NCurrAmt, ExpDateF = :N8, ExpDateT = :N9, ');
            SQL.Add('Reserve1 = :N10, APB = :N11, WPNo = :N12, Name = :N15 where CarNo = :N13 and TKType = :N14');
            Parameters.ParamByName('N1' ).Value:= sTelNo;
            Parameters.ParamByName('N3' ).Value:= sCompName;
            Parameters.ParamByName('N4' ).Value:= sDeptName;
            Parameters.ParamByName('N5' ).Value:= sAddress;
            Parameters.ParamByName('N6' ).Value:= sIssueDate;
            Parameters.ParamByName('NIssueAmt' ).Value:= nIssueAmt;
            Parameters.ParamByName('NCurrAmt' ).Value:= nIssueAmt;
            Parameters.ParamByName('N8' ).Value:= sExpDateF;
            Parameters.ParamByName('N9' ).Value:= sExpDateT;
            Parameters.ParamByName('N10').Value:= sCarType;
            Parameters.ParamByName('N11').Value:= nAPB;
            Parameters.ParamByName('N12').Value:= nWPNo;
            Parameters.ParamByName('N13').Value:= sCarNo;
            Parameters.ParamByName('N14').Value:= 2;
            Parameters.ParamByName('N15').Value:= sName;
            Parameters.ParamByName('N16').Value:= nGroupNo;
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
            SQL.Add(':NIssueUnit, :N12, :N13, :NFValue, :N15, :N16)');
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
            Parameters.ParamByName('NIssueUnit').Value:= nIssueAmt;
            Parameters.ParamByName('N12').Value:= sExpDateF;
            Parameters.ParamByName('N13').Value:= sExpDateT;
            Parameters.ParamByName('NFValue').Value:= nIssueAmt;
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
            SQL.Add('Update Custinfo Set TelNo = :N1, CarNo = :N2, CompName = :N3, DeptName = :N4, GroupNo = :N15, ');
            SQL.Add('Address = :N5, IssueDate = :N6, IssueAmt = :NIssueAmt, CurrAmt = :NCurrAmt, ExpDateF = :N8, ExpDateT = :N9, ');
            SQL.Add('Reserve1 = :N10, APB = :N11, WPNo = :N12 where CarNo = :N13 and TKType = :N14');
            Parameters.ParamByName('N1' ).Value:= sTelNo;
            Parameters.ParamByName('N2' ).Value:= sCarNo;
            Parameters.ParamByName('N3' ).Value:= sCompName;
            Parameters.ParamByName('N4' ).Value:= sDeptName;
            Parameters.ParamByName('N5' ).Value:= sAddress;
            Parameters.ParamByName('N6' ).Value:= sIssueDate;
            Parameters.ParamByName('NIssueAmt' ).Value:= nIssueAmt;
            Parameters.ParamByName('NCurrAmt' ).Value:= nIssueAmt;
            Parameters.ParamByName('N8' ).Value:= sExpDateF;
            Parameters.ParamByName('N9' ).Value:= sExpDateT;
            Parameters.ParamByName('N10').Value:= sCarType;
            Parameters.ParamByName('N11').Value:= nAPB;
            Parameters.ParamByName('N12').Value:= nWPNo;
            Parameters.ParamByName('N13').Value:= sCarNo;
            Parameters.ParamByName('N14').Value:= 2;
            Parameters.ParamByName('N15').Value:= nGroupNo;
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
      //edtGroupName.Visible:= True;
      cmbGroupNo.Items.Clear;
      nGroupCnt:= RecordCount;

      First;
      edtGroupName.Text:= FieldByName('GroupName').AsString;
      j:= 1;

      while not Eof do
      begin
        //cmbGroupNo.Items.Add(IntToStr(FieldByName('GroupNo').AsInteger));
        cmbGroupNo.Items.AddObject(FieldByName('GroupNo').AsString+':'+FieldByName('GroupName').AsString, TObject(FieldByName('GroupNo').AsInteger));
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
    SQL.Add('Select * from CustInfo where ParkNo = :N1 and TKType = :N2 ');
    //SQL.Add('Select * from CustInfo where ParkNo = :N1 and TKType = :N2 and GroupNo = :N3');
//    SQL.Add(' Order by convert(int,DeptName)  ' );
    Parameters.ParamByName('N1').Value:= nCurrParkNo;
    Parameters.ParamByName('N2').Value:= 2;
    //Parameters.ParamByName('N3').Value:= StrToInt(cmbGroupNo.Text);
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
  ModalResult := mrCancel;
  //Close;
end;

procedure TfrmCustInfo.btnDeleteClick(Sender: TObject);
var
  sSDate, sEDate : String;
begin
  try
    if MessageDlg('?????? ?????? ???????????', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;

    sSDate:= FormatDateTime('YYYY-MM-DD', edtExpDateF.Date);
    sEDate:= FormatDateTime('YYYY-MM-DD', edtExpDateT.Date);

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

        SQL.Clear;
        SQL.Add('Insert Into IssueTK ');
        SQL.Add('(ParkNo, IssueDate, IssueTime, MNo, TKType, TKNo, CarType, IssueType, ');
        SQL.Add('IssueUnit, ExpDateF, ExpDateT, FValue, ChkClosing, CarNo, WPNo, PayType ');
        SQL.Add(', CompName, DeptName, Name, TelNo, GroupNo ) ');
        SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, :N12 ');
        SQL.Add(', :N13, :N14, :N15, :pPayType, :pCompName, :pDeptName, :pName, :pTelNo, :pGroupNo)');
        Parameters.ParamByName('N1' ).Value:= nCurrParkNo;
        Parameters.ParamByName('N2' ).Value:= FormatDateTime('YYYY-MM-DD', Now);
        Parameters.ParamByName('N3' ).Value:= FormatDateTime('HH:NN:SS', Now);
        Parameters.ParamByName('N4' ).Value:= nCurrMNo;
        Parameters.ParamByName('N5' ).Value:= 2;
        Parameters.ParamByName('N6' ).Value:= edtCarNo.Text;
        Parameters.ParamByname('N7' ).Value:= 2;
        Parameters.ParamByName('N8' ).Value:= 6;  // ???? IssueType = 6
        Parameters.ParamByName('N9' ).Value:= edtCurrAmt.Value;
        Parameters.ParamByName('N10').Value:= sSDate;
        Parameters.ParamByName('N11').Value:= sEDate;
        Parameters.ParamByName('N12').Value:= edtIssueAmt.Value ;
        Parameters.ParamByName('N13').Value:= 0;
        Parameters.ParamByName('N14').Value:= MG_StrTrim(edtCarNo.Text, ' ');
        Parameters.ParamByName('N15').Value:= StrToInt(cmbWPNo.Text);
        Parameters.ParamByName('pPayType').Value:= cmbPayType.ItemIndex;
        Parameters.ParamByName('pCompName').Value:= edtCompName.Text;  // ??, ?? (??????, ??????)
        Parameters.ParamByName('pDeptName').Value:= edtDeptName.Text;
        Parameters.ParamByName('pName').Value:= edtName.Text;          // ????
        Parameters.ParamByName('pTelNo').Value:= edtTelNo.Text;        // ????????
        //Parameters.ParamByName('pGroupNo').Value:= StrToInt(cmbGroupNo.Text);
        Parameters.ParamByName('pGroupNo').Value:= LongInt(cmbGroupNo.Items.Objects[cmbGroupNo.ItemIndex]);
        ExecSql;
        dmTables.ADODB.CommitTrans;
      except
        on E: Exception do
        begin
          dmTables.ADODB.RollbackTrans;
          ExceptLogging('TfrmCustInfo.btnDeleteClick: ' + aString(E.Message));
          ShowMessage('?????? ????????! ???????? ????????????.');
        end;
      end;
      Close;
      SQL.Clear;
      SQL.Add('Select * from CustInfo where ParkNo = :N1 and TKType = :N2 and GroupNo = :N3 ');
      SQL.Add(' and CompName = :N4');
    //  SQL.Add(' Order by convert(int,DeptName)  ' );
      Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
      Parameters.ParamByName('N2').Value:= 2;
      //Parameters.ParamByName('N3').Value:= StrToInt(cmbGroupNo.Text);
      Parameters.ParamByName('N3').Value:= LongInt(cmbGroupNo.Items.Objects[cmbGroupNo.ItemIndex]);
      Parameters.ParamByName('N4').Value:= edtCompName.Text;
      Open;

      if RecordCount <= 0 then
      begin
         cmbGroupNoChange(Self);
      end;
    end;

    ExceptLogging('????????: ' + edtCarNo.Text);
    frmClear;
  except
    on E: Exception do ExceptLogging('TfrmCustInfo.btnDeleteClick: ' + aString(E.Message));
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
  sSDate, sEDate : String;
begin
  try
    sSDate:= FormatDateTime('YYYY-MM-DD', edtExpDateF.Date);
    sEDate:= FormatDateTime('YYYY-MM-DD', edtExpDateT.Date);


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
      StrToDate(sSDate);
    except
      on E: Exception do
      begin
        ShowMessage('?????????? ?????? ??????????????!');
        edtExpDateF.SetFocus;
        Exit;
      end;
    end;

    try
      StrToDate(sEDate);
    except
      on E: Exception do
      begin
        ShowMessage('?????????? ?????? ??????????????!');
        edtExpDateT.SetFocus;
        Exit;
      end;
    end;

    if sSDate > sEDate then
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
                 SQL.Add('Set Name = :N1, TelNo = :N2, CarNo = :N3, CompName = :N4, GroupNo = :N19, ');
                 SQL.Add('DeptName = :N5, Address = :N6, Status = :N7, APB = :N8, ');
                 SQL.Add('IOStatusNo = :N14, WPNo = :N15, ExpDateF = :N16, ExpDateT = :N17, Reserve1 = :N18 ');
                 SQL.Add(', CurrAmt = :pCurrAmt ,Paytype=:pPayType, IssueAmt = :pIssueAmt');
                 SQL.Add(',HIType = :pHIType, HISTime = :pHISTime, HIETime = :pHIETime ');
                 SQL.Add('Where ParkNo = :N9 and TKType = :N10 and GroupNo = :N11 and TKNo = :N12 and CarNo = :N13');
                 Parameters.ParamByName('N1' ).Value:= edtName.Text;
                 Parameters.ParamByName('N2' ).Value:= edtTelNo.Text;
                 Parameters.ParamByName('N3' ).Value:= MG_StrTrim(aString(edtCarNo.Text), ' ');
                 Parameters.ParamByName('N4' ).Value:= edtCompName.Text;
                 Parameters.ParamByName('N5' ).Value:= edtDeptName.Text;
                 Parameters.ParamByName('N6' ).Value:= edtAddress.Text;
                 Parameters.ParamByName('N7' ).Value:= 1;//cmbStatus.ItemIndex;
                 Parameters.ParamByName('N8' ).Value:= 3;//cmbAPB.ItemIndex+1;
                 Parameters.ParamByName('N9' ).Value:= StrToInt(cmbParkNo.Text);
                 Parameters.ParamByName('N10').Value:= 2;
                 //Parameters.ParamByname('N11').Value:= StrToInt(cmbGroupNo.Text);
                 Parameters.ParamByName('N11').Value:= LongInt(cmbGroupNo.Items.Objects[cmbGroupNo.ItemIndex]);
                 Parameters.ParamByName('N12').Value:= edtTKNo.Text;
                 Parameters.ParamByName('N13').Value:= sPrvCarNo;
                 Parameters.ParamByName('N14').Value:= cmbLastUseStatus.ItemIndex+1;
                 Parameters.ParamByName('N15').Value:= StrToInt(cmbWPNo.Text);
                 Parameters.ParamByName('N16').Value:= sSDate;
                 Parameters.ParamByName('N17').Value:= sEDate;
                 Parameters.ParamByName('N18').Value:= edtCarType.Text;
                 Parameters.ParamByName('pCurrAmt').Value:= edtCurrAmt.Value;
                 Parameters.ParamByName('pPayType').Value:= cmbPayType.ItemIndex;
                 Parameters.ParamByName('pIssueAmt').Value:= edtIssueAmt.Value;

                 Parameters.ParamByName('pHIType').Value:= cmbHIType.ItemIndex;
                 Parameters.ParamByName('pHISTime').Value:= edtHISTime.Text;
                 Parameters.ParamByName('pHIETime').Value:= edtHIETime.Text;
                 Parameters.ParamByName('N19').Value:= edtGroupNo.Text;

                 ExecSql;

                 // ????????
                 if (sPrvExpDateF <> sSDate) or (sPrvExpDateT <> sEDate) then
                 begin
                   Close;
                   SQL.Clear;
                   SQL.Add('Insert Into IssueTK ');
                   SQL.Add('(ParkNo, IssueDate, IssueTime, MNo, TKType, TKNo, CarType, IssueType, ');
                   SQL.Add('IssueUnit, ExpDateF, ExpDateT, FValue, ChkClosing, CarNo, WPNo ');
                   SQL.Add(', CompName, DeptName, Name, TelNo, GroupNo,Paytype ) ');
                   SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11 ');
                   SQL.Add(', :N12, :N13, :N14, :N15, :pCompName, :pDeptName, :pName, :pTelNo, :pGroupNo ,:pPayType)');
                   Parameters.ParamByName('N1' ).Value:= nCurrParkNo;
                   Parameters.ParamByName('N2' ).Value:= FormatDateTime('YYYY-MM-DD', Now);
                   Parameters.ParamByName('N3' ).Value:= FormatDateTime('HH:NN:SS', Now);
                   Parameters.ParamByName('N4' ).Value:= nCurrMNo;
                   Parameters.ParamByName('N5' ).Value:= 2;
                   Parameters.ParamByName('N6' ).Value:= edtTKNo.Text;
                   Parameters.ParamByname('N7' ).Value:= 2;
                   Parameters.ParamByName('N8' ).Value:= 2;   // ????????
                   Parameters.ParamByName('N9' ).Value:= edtCurrAmt.Value;
                   Parameters.ParamByName('N10').Value:= sSDate;
                   Parameters.ParamByName('N11').Value:= sEDate;
                   Parameters.ParamByName('N12').Value:= edtIssueAmt.Value ;
                   Parameters.ParamByName('N13').Value:= 0;
                   Parameters.ParamByName('N14').Value:= edtCarNo.Text;
                   Parameters.ParamByName('N15').Value:= StrToInt(cmbWPNo.Text);
                   Parameters.ParamByName('pCompName').Value:= edtCompName.Text;  // ??, ?? (??????, ??????)
                   Parameters.ParamByName('pDeptName').Value:= edtDeptName.Text;
                   Parameters.ParamByName('pName').Value:= edtName.Text;          // ????
                   Parameters.ParamByName('pTelNo').Value:= edtTelNo.Text;        // ????????
                   //Parameters.ParamByName('pGroupNo').Value:= StrToInt(cmbGroupNo.Text);
                   Parameters.ParamByName('pGroupNo').Value:= LongInt(cmbGroupNo.Items.Objects[cmbGroupNo.ItemIndex]);
                   Parameters.ParamByName('pPayType').Value:= cmbPayType.ItemIndex;
                   ExecSql;
                   ExceptLogging('???????????? : ' + sPrvCarNo + ' -> ' + edtCarNo.Text);
                 end
                 else
                 begin
                    // ???????? ????
                    Close;
                    SQL.Clear;
                    SQL.Add('Insert Into IssueTK ');
                    SQL.Add('(ParkNo, IssueDate, IssueTime, MNo, TKType, TKNo, CarType, IssueType, ');
                    SQL.Add('IssueUnit, ExpDateF, ExpDateT, FValue, ChkClosing, CarNo, WPNo');
                    SQL.Add(', CompName, DeptName, Name, TelNo, GroupNo,Paytype ) ');
                    SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11  ');
                    SQL.Add(', :N12, :N13, :N14, :N15, :pCompName, :pDeptName, :pName, :pTelNo, :pGroupNo ,:pPayType)');
                    Parameters.ParamByName('N1' ).Value:= nCurrParkNo;
                    Parameters.ParamByName('N2' ).Value:= FormatDateTime('YYYY-MM-DD', Now);
                    Parameters.ParamByName('N3' ).Value:= FormatDateTime('HH:NN:SS', Now);
                    Parameters.ParamByName('N4' ).Value:= nCurrMNo;
                    Parameters.ParamByName('N5' ).Value:= 2;
                    Parameters.ParamByName('N6' ).Value:= edtTKNo.Text;
                    Parameters.ParamByname('N7' ).Value:= 2;
                    Parameters.ParamByName('N8' ).Value:= 5;    // ????????
                    Parameters.ParamByName('N9' ).Value:= edtCurrAmt.Value;
                    Parameters.ParamByName('N10').Value:= sSDate;
                    Parameters.ParamByName('N11').Value:= sEDate;
                    Parameters.ParamByName('N12').Value:= edtIssueAmt.Value ;
                    Parameters.ParamByName('N13').Value:= 0;
                    Parameters.ParamByName('N14').Value:= edtCarNo.Text;
                    Parameters.ParamByName('N15').Value:= StrToInt(cmbWPNo.Text);
                    Parameters.ParamByName('pCompName').Value:= edtCompName.Text;  // ??, ?? (??????, ??????)
                    Parameters.ParamByName('pDeptName').Value:= edtDeptName.Text;
                    Parameters.ParamByName('pName').Value:= edtName.Text;          // ????
                    Parameters.ParamByName('pTelNo').Value:= edtTelNo.Text;        // ????????
                    //Parameters.ParamByName('pGroupNo').Value:= StrToInt(cmbGroupNo.Text);
                    Parameters.ParamByName('pGroupNo').Value:= LongInt(cmbGroupNo.Items.Objects[cmbGroupNo.ItemIndex]);
                    Parameters.ParamByName('pPayType').Value:= cmbPayType.ItemIndex;
                    ExceptLogging('???????? : (' + sPrvCarNo + ') ' + sPrvExpDateF + ' -> ' + sSDate);
                    ExceptLogging('???????? : (' + sPrvCarNo + ') ' + sPrvExpDateT + ' -> ' + sEDate);

                   if (sPrvCurrAmt <> IntToStr(edtCurrAmt.Value)) then
                    ExceptLogging('???????????? : (' + sPrvCarNo + ') ' + sPrvCurrAmt + ' -> ' + IntToStr(edtCurrAmt.Value));

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

               {Close;
               SQL.Clear;
               SQL.Add('Select * from CustInfo where ParkNo = :N1 and TKType = :N2 and GroupNo = :N3');
               Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
               Parameters.ParamByName('N2').Value:= 2;
               Parameters.ParamByName('N3').Value:= StrToInt(cmbGroupNo.Text);
               Open;}

               Close;
               SQL.Clear;
               SQL.Add('Select * from CustInfo where ParkNo = :N1 and TKType = :N2 and GroupNo = :N3 ');
               SQL.Add(' and CompName = :N4');
               Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
               Parameters.ParamByName('N2').Value:= 2;
               Parameters.ParamByName('N3').Value:= LongInt(cmbGroupNo.Items.Objects[cmbGroupNo.ItemIndex]);
               Parameters.ParamByName('N4').Value:= edtCompName.Text;
               Open;

               if RecordCount <= 0 then
               begin
                  cmbGroupNoChange(Self);
               end;
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

procedure TfrmCustInfo.btnSeekAllClick(Sender: TObject);
begin
  with dmTables.qryCustInfo do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * from CustInfo where ParkNo = :N1 and TkType = :N2 ');
    SQL.Add('Order by CAST(SUBSTRING(CompName + '+ QuotedStr('0')+', PATINDEX('+QuotedStr('%[0-9]%')+', CompName + '+QuotedStr('0')+'), LEN(CompName + '+QuotedStr('0')+')) AS varchar(50)), ');
    SQL.Add('         CAST(SUBSTRING(DeptName + '+ QuotedStr('0')+', PATINDEX('+QuotedStr('%[0-9]%')+', DeptName + '+QuotedStr('0')+'), LEN(DeptName + '+QuotedStr('0')+')) AS varchar(50))  ');
    //SQL.Add(' Order by COMPNAME, DeptName  ' );
    Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
    Parameters.ParamByName('N2').Value:= 2;
    Open;

    dgCustInfoClick(Self);
  end;
end;

procedure TfrmCustInfo.btnSeekClick(Sender: TObject);
begin
//  NextModalDialog(TfrmSeek.Create(Self));
  if nApt = 1 then
    NextModalDialog(TfrmSeek2.Create(Self))
  else
    NextModalDialog(TfrmSeek.Create(Self));

  dgCustInfoClick(Self);
end;

procedure TfrmCustInfo.btnSetConfirmClick(Sender: TObject);
begin
        if (sCustInfoConfirm='1') then
        begin
          edtTKNo.Enabled:=True;
          edtName.Enabled:=True;
        edtTelNo.Enabled:=True;
        edtCarNo.Enabled:=True;
        edtCompName.Enabled:=True;
        edtDeptName.Enabled:=True;
        edtAddress.Enabled:=True;
        edtIssueDate.Enabled:=True;
        edtIssueAmt   .Enabled:=True;
        cmbStatus     .Enabled:=True;
        edtExpDateF.Enabled :=True;
        edtExpDateT.Enabled:=True;
        cmbWPNo       .Enabled:=True;
        edtLastUnitNo .Enabled:=True;
        edtLastUseDate.Enabled:=True;
        edtLastUseTime.Enabled:=True;
        cmbAPB        .Enabled:=True;
        edtCurrAmt.Enabled:=True;
        cmbLastUseStatus.Enabled:=True;
        edtCarType.Enabled:=True;
        cmbGroupNo.Enabled:=True;

        cmbPayType.Enabled :=True;
        btnSave.Enabled  :=True;
        btnAdd3Month.Enabled  :=True;
        end
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
    SQL.Add('Order by CAST(SUBSTRING(CompName + '+ QuotedStr('0')+', PATINDEX('+QuotedStr('%[0-9]%')+', CompName + '+QuotedStr('0')+'), LEN(CompName + '+QuotedStr('0')+')) AS varchar(50)), ');
    SQL.Add('         CAST(SUBSTRING(DeptName + '+ QuotedStr('0')+', PATINDEX('+QuotedStr('%[0-9]%')+', DeptName + '+QuotedStr('0')+'), LEN(DeptName + '+QuotedStr('0')+')) AS varchar(50))  ');
    //SQL.Add(' Order by COMPNAME,DeptName ') ;
    Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
    Parameters.ParamByName('N2').Value:= 2;
    Parameters.ParamByName('N3').Value:= LongInt(cmbGroupNo.Items.Objects[cmbGroupNo.ItemIndex]);
    //Parameters.ParamByName('N3').Value:= StrToInt(cmbGroupNo.Text);
    Open;
  end;

  {for i:= 1 to nGroupCnt do
    if RGroup[i].nGroupNo = StrToInt(cmbGroupNo.Text) then
    begin
      edtGroupName.Text:= RGroup[i].sGroupName;
      Break;
    end;}

  dgCustInfoClick(Self);
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
      //edtGroupName.Visible:= True;
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
     // SQL.Add(' Order by convert(int,DeptName)  ' );
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
        edtExpDateF.Date := StrToDate(FieldByName('ExpDateF').AsString);
        edtExpDateT.Date:= StrToDate(FieldByName('ExpDateT').AsString);
        cmbWPNo       .Text:= IntToStr(FieldByName('WPNo').AsInteger);
        edtLastUnitNo .Text:= IntToStr(FieldByName('LastUnitNo').AsInteger);
        edtLastUseDate.Text:= FieldByName('LastUseDate').AsString;
        edtLastUseTime.Text:= FieldByName('LastUseTime').AsString;
        cmbAPB        .ItemIndex:= FieldByName('APB').AsInteger - 1;
        edtCurrAmt.Value:= FieldByName('CurrAmt').AsInteger;        // ????????
        sPrvCarNo:= FieldByName('CarNo').AsString;
        sPrvCurrAmt:= FieldByName('CurrAmt').AsString;
        sPrvExpDateF:= FieldByName('ExpDateF').AsString;
        sPrvExpDateT:= FieldByName('ExpDateT').AsString;
        cmbLastUseStatus.ItemIndex:= FieldByName('IOStatusNo').AsInteger - 1;
        edtCarType.Text:= FieldByName('Reserve1').AsString;
        //cmbGroupNo.ItemIndex:= cmbGroupNo.Items.IndexOf(IntToStr(FieldByName('GroupNo').AsInteger));
        //cmbGroupNo.ItemIndex := FieldByName('GroupNo').AsInteger - 1;
        for i:= 1 to nGroupCnt do
        if RGroup[i].nGroupNo = FieldByName('GroupNo').AsInteger then
        begin
          cmbGroupNo.ItemIndex := i - 1;
          Break;
        end;

        //cmbGroupNo.ItemIndex := FieldByName('GroupNo').AsInteger;
        //cmbGroupNo.ItemIndex := LongInt(cmbGroupNo.Items.Objects[cmbGroupNo.ItemIndex]);
        cmbPayType.ItemIndex := FieldByName('PayType').AsInteger;

        {for i:= 1 to nGroupCnt do
        if RGroup[i].nGroupNo = StrToInt(cmbGroupNo.Text) then
        begin
          edtGroupName.Text:= RGroup[i].sGroupName;
          Break;
        end;}
        cmbWPNoChange(Self);
        cmbHIType.ItemIndex:= FieldByName('HIType').AsInteger;
        edtHISTime.Text:= FieldByName('HISTime').AsString;
        edtHIETime.Text:= FieldByName('HIETime').AsString;

        edtGroupNo.Text := IntToStr(FieldByName('GroupNo').AsInteger);

        if (sCustInfoConfirm='1') then
        begin
          edtTKNo.Enabled:=False;
          edtName.Enabled:=False;
          edtTelNo.Enabled:=False;
          edtCarNo.Enabled:=False;
          edtCompName.Enabled:=False;
          edtDeptName.Enabled:=False;
          edtAddress.Enabled:=False;
          edtIssueDate.Enabled:=False;
          edtIssueAmt   .Enabled:=False;
          cmbStatus     .Enabled:=False;
          edtExpDateF.Enabled :=False;
          edtExpDateT.Enabled:=False;
          cmbWPNo       .Enabled:=False;
          edtLastUnitNo .Enabled:=False;
          edtLastUseDate.Enabled:=False;
          edtLastUseTime.Enabled:=False;
          cmbAPB        .Enabled:=False;
          edtCurrAmt.Enabled:=False;
          cmbLastUseStatus.Enabled:=False;
          edtCarType.Enabled:=False;


          cmbPayType.Enabled :=False;
          btnSave.Enabled  :=False;
          btnAdd3Month.Enabled  :=False;
        end

      end;
    end;
    btnCancel.Enabled:= True;
    btnDelete.Enabled:= True;
    nSelect:= 1;
  except
    on E: Exception do ExceptLogging('TfrmCustInfo.dgCustomClick: ' + aString(E.Message));
  end;
end;

procedure TfrmCustInfo.edtAddressClick(Sender: TObject);
begin
  edtAddress.ImeMode := imSHanguel;
//  if imSHanguelUse = 1 then
//  begin
//    ToggleHanMode;
//  end;
end;

procedure TfrmCustInfo.edtCarNoClick(Sender: TObject);
begin
  edtCarNo.ImeMode := imSHanguel;
//  if imSHanguelUse = 1 then
//  begin
//    ToggleHanMode;
//  end;
end;

procedure TfrmCustInfo.edtCarNoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    With dmTables.qryCustInfo do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from CustInfo '
            + ' Where TKType = :N1 and CarNo like ' + MG_MakeStr('%' + Trim(edtCarNo.Text) + '%')
            + ' Order by CarNo');
      Parameters.ParamByName('N1').Value:= 2;
      Open;
    end;
  end;
end;

procedure TfrmCustInfo.edtCarTypeClick(Sender: TObject);
begin
  edtCarType.ImeMode := imSHanguel;
//  if imSHanguelUse = 1 then
//  begin
//    ToggleHanMode;
//  end;
end;

procedure TfrmCustInfo.edtCompNameClick(Sender: TObject);
begin
  edtCompName.ImeMode := imSHanguel;
//  if imSHanguelUse = 1 then
//  begin
//    ToggleHanMode;
//  end;
end;

procedure TfrmCustInfo.edtDeptNameClick(Sender: TObject);
begin
  edtDeptName.ImeMode := imSHanguel;
//  if imSHanguelUse = 1 then
//  begin
//    ToggleHanMode;
//  end;
end;

procedure TfrmCustInfo.edtNameClick(Sender: TObject);
begin
  edtName.ImeMode := imSHanguel;
//  if imSHanguelUse = 1 then
//  begin
//    ToggleHanMode;
//  end;
end;

procedure TfrmCustInfo.edtNameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    With dmTables.qryCustInfo do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from Custinfo '
            + ' Where TKType = :N1 and Name like ' + MG_MakeStr('%' + Trim(edtName.Text) + '%')
            + ' Order by Name');
      Parameters.ParamByName('N1').Value:= 2;
      Open;
    end;
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
      //edtGroupName.Visible:= True;
      cmbGroupNo.Items.Clear;

      First;
      edtGroupName.Text:= FieldByName('GroupName').AsString;
      i:= 1;

      while not Eof do
      begin
        //cmbGroupNo.Items.Add(IntToStr(FieldByName('GroupNo').AsInteger));
       // cmbGroupNo.Items.Add(IntToStr(FieldByName('GroupNo').AsInteger));
        cmbGroupNo.Items.AddObject(FieldByName('GroupNo').AsString+':'+FieldByName('GroupName').AsString, TObject(FieldByName('GroupNo').AsInteger));
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
      //SQL.Add('Select * from CustInfo where ParkNo = :N1 and TkType = :N2 and GroupNo = :N3');
      SQL.Add('Select * from CustInfo where ParkNo = :N1 and TkType = :N2 ');
      SQL.Add(' Order by GroupNo, COMPNAME, DeptName  ' );
      Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
      Parameters.ParamByName('N2').Value:= 2;
      //Parameters.ParamByName('N3').Value:= LongInt(cmbGroupNo.Items.Objects[cmbGroupNo.ItemIndex]);
      //Parameters.ParamByName('N3').Value:= StrToInt(cmbGroupNo.Text);
      Open;
      if (sCustInfoConfirm='0') then
      begin
        btnSetConfirm.Visible:=False;
      end
      else
         if (sCustInfoConfirm='1') then
        begin
          edtTKNo.Enabled:=False;
          edtName.Enabled:=False;
          edtTelNo.Enabled:=False;
          edtCarNo.Enabled:=False;
          edtCompName.Enabled:=False;
          edtDeptName.Enabled:=False;
          edtAddress.Enabled:=False;
          edtIssueDate.Enabled:=False;
          edtIssueAmt   .Enabled:=False;
          cmbStatus     .Enabled:=False;
          edtExpDateF.Enabled :=False;
          edtExpDateT.Enabled:=False;
          cmbWPNo       .Enabled:=False;
          edtLastUnitNo .Enabled:=False;
          edtLastUseDate.Enabled:=False;
          edtLastUseTime.Enabled:=False;
          cmbAPB        .Enabled:=False;
          edtCurrAmt.Enabled:=False;
          cmbLastUseStatus.Enabled:=False;
          edtCarType.Enabled:=False;


          cmbPayType.Enabled :=False;
          btnSave.Enabled  :=False;
          btnAdd3Month.Enabled  :=False;
        end;

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

   //   dgCustInfo.ColWidths[21] := -1;
    //  dgCustInfo.ColWidths[22] := -1;
    //  dgCustInfo.ColWidths[23] := -1;

      dgCustInfo.Columns[22].Width := 0;
      dgCustInfo.Columns[23].Width := 0;
      dgCustInfo.Columns[24].Width := 0;
    end;

    dgCustInfoClick(Self);
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
    edtExpDateF.Date := Now;
    edtExpDateT.Date := Now;
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

//// ???? ?????? ??
function TfrmCustInfo.dateDaysInMonth(D: TDateTime): Integer;
const
  DaysPerMonth: array[1..12] of Byte= (31,28,31,30,31,30,31,31,30,31,30,31);
var
  Month: Integer;
begin
  Month := dateMonth(D);
  Result := DaysPerMonth[Month];
  if (Month=2) and dateLeapYear(D) then
    Inc(Result);
end;

function TfrmCustInfo.dateMonth(D: TDateTime): Integer;
var
Year, Month, Day: Word;
begin
DecodeDate(D, Year, Month, Day);
Result := Month;
end;


// ???????? ????
function TfrmCustInfo.dateLeapYear(D: TDateTime): Boolean;
var
  Year, Month, Day: Word;
begin
  DecodeDate(D, Year, Month, Day);
  Result := (Year mod 4 = 0) and ((Year mod 100 <> 0) or (Year mod 400 = 0));
end;


 // ???? ??????????
function TfrmCustInfo.dateEndOfMonth(D: TDateTime): TDateTime;
var
Year, Month, Day: Word;
begin
DecodeDate(D, Year, Month, Day);
if Month = 12 then
begin
   Inc(Year);
   Month := 1;
end
else
   Inc(Month);

{???? ???????? ?????????? 1?? ????}
Result := EncodeDate(Year, Month, 1) - 1;
end;


// ?????? ?????? ????
function TfrmCustInfo.GetdateYear(D: TDateTime): Integer;
var
Year, Month, Day: Word;
begin
DecodeDate(D, Year, Month, Day);
Result := Year;
end;

// ?????? ???? ????
function TfrmCustInfo.GetdateMonth(D: TDateTime): Integer;
var
Year, Month, Day: Word;
begin
DecodeDate(D, Year, Month, Day);
Result := Month;
end;

// ?????? ???? ????
function TfrmCustInfo.GetdateDay(D: TDateTime): Integer;
var
Year,Month,Day : Word;
begin
DecodeDate (D,Year,Month,Day);
Result := Day;
end;

function  TfrmCustInfo.GetAddMonth(DayInfo: AnsiString;DayInt:Integer): AnsiString;
var
CurrentDate: TDateTime;
SetDate: TDateTime;
Year,Month,Day :Integer;
ResultYear,ResultMonth,ResultDay :  Integer;
ResultMessage :   AnsiString;
RepeateInt : Integer;
begin
    try
      StrToDate(DayInfo);
    except
      on E: Exception do
      begin
        ShowMessage('?????????? ?????? ??????????????!');
        edtExpDateF.SetFocus;
        Exit;
      end;
    end;

    CurrentDate:=StrToDate(DayInfo);
    Year:=GetdateYear(CurrentDate);
    Month:=GetdateMonth(CurrentDate);
    Day:=GetdateDay(CurrentDate);
    if Day=dateDaysInMonth(CurrentDate) then  // ????????????
    begin
      for RepeateInt := 0 to DayInt-1 do
      begin
      CurrentDate:= IncMonth(CurrentDate)
      end;
      SetDate:=  CurrentDate;
      ResultYear:=  GetdateYear(SetDate);
      ResultMonth:= GetdateMonth(SetDate);
      ResultDay:=  dateDaysInMonth(SetDate);
    end
    else
    begin
      for RepeateInt := 0 to DayInt-1 do
      begin
       CurrentDate:= IncMonth(CurrentDate)
      end;
      SetDate:=  CurrentDate;
      ResultYear:=  GetdateYear(SetDate);
      ResultMonth:= GetdateMonth(SetDate);
      ResultDay:=  GetdateDay(SetDate);
      if (ResultDay=dateDaysInMonth(SetDate)) then
      begin
         ResultDay:=ResultDay-1;
      end;

    end;
    ResultMessage:=IntToStr(ResultYear);
    if ResultMonth<10 then
    begin
       ResultMessage:=ResultMessage+'-0'+  IntToStr(ResultMonth);
    end
    else
    begin
       ResultMessage:=ResultMessage+'-'+  IntToStr(ResultMonth);
    end;

    if ResultDay<10 then
    begin
       ResultMessage:=ResultMessage+'-0'+  IntToStr(ResultDay);
    end
    else
    begin
       ResultMessage:=ResultMessage+'-'+  IntToStr(ResultDay);
    end;
    Result := ResultMessage;

end;

end.
