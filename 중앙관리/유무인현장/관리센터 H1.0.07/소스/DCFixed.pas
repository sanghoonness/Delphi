unit DCFixed;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, tmsAdvGridExcel, Data.DB,
  Data.Win.ADODB, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, AdvDateTimePicker,
  Vcl.ExtCtrls, Vcl.Grids, AdvObj, BaseGrid, AdvGrid, DBAdvGrid, sCheckBox,
  Vcl.Mask, AdvSpin, AdvCombo, AdvEdit, ComObj;

type
  TfrmDCFixed = class(TForm)
    sb1: TStatusBar;
    Panel1: TPanel;
    dg1: TDBAdvGrid;
    Panel3: TPanel;
    Panel2: TPanel;
    btnSearch: TBitBtn;
    btnPrint: TBitBtn;
    btnClose: TBitBtn;
    btnExcel: TBitBtn;
    btnDelete: TBitBtn;
    qryDcFixed: TADOQuery;
    dsDcFixed: TDataSource;
    qryTemp: TADOQuery;
    SaveDialog1: TSaveDialog;
    AdvGridExcelIO1: TAdvGridExcelIO;
    qryUnitInfo: TADOQuery;
    qryUnitInfoParkNo: TSmallintField;
    qryUnitInfoUnitNo: TSmallintField;
    qryUnitInfoUnitName: TStringField;
    qryUnitInfoUnitKind: TWordField;
    qryUnitInfoMyNo: TWordField;
    qryUnitInfoComport: TIntegerField;
    qryUnitInfoBaudrate: TIntegerField;
    qryUnitInfoIPNo: TStringField;
    qryUnitInfoPortNo: TIntegerField;
    qryUnitInfoReserve1: TStringField;
    qryUnitInfoReserve2: TStringField;
    qryUnitInfoReserve3: TStringField;
    qryUnitInfoReserve4: TStringField;
    qryUnitInfoReserve5: TStringField;
    qryDcFixedParkNo: TSmallintField;
    qryDcFixedCarNo: TStringField;
    qryDcFixedDCNo: TWordField;
    qryDcFixedName: TStringField;
    qryDcFixedTelNo: TStringField;
    qryDcFixedStartYmd: TStringField;
    qryDcFixedEndYmd: TStringField;
    qryDcFixedUseWeekDay: TStringField;
    qryDcFixedUseStartTime: TStringField;
    qryDcFixedUseEndTime: TStringField;
    qryDcFixedLimitedDayCount: TIntegerField;
    qryDcFixedLimitedMonthCount: TIntegerField;
    qryDcFixedUseParkNo: TIntegerField;
    qryDcFixedRemark: TStringField;
    qryDcFixedRemark2: TStringField;
    qryDcFixedReserve1: TStringField;
    qryDcFixedReserve2: TStringField;
    qryDcFixedReserve3: TStringField;
    qryDcFixedReserve4: TStringField;
    qryDcFixedReserve5: TStringField;
    btnSave: TBitBtn;
    edtDCNo: TEdit;
    btnCancel: TBitBtn;
    Label15: TLabel;
    schkweek6: TsCheckBox;
    schkweek0: TsCheckBox;
    schkweek1: TsCheckBox;
    schkweek2: TsCheckBox;
    schkweek3: TsCheckBox;
    schkweek4: TsCheckBox;
    schkweek5: TsCheckBox;
    qryDCInfo_: TADOQuery;
    SmallintField1: TSmallintField;
    StringField1: TStringField;
    WordField1: TWordField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    qryDCInfo: TADOQuery;
    edtCarNo: TAdvEdit;
    cmbDcName: TAdvComboBox;
    edtName: TAdvEdit;
    edtTel: TAdvEdit;
    edtETime: TAdvDateTimePicker;
    edtMonthCount: TAdvSpinEdit;
    edtDayCount: TAdvSpinEdit;
    edtSTime: TAdvDateTimePicker;
    edtEDate: TAdvDateTimePicker;
    edtSDate: TAdvDateTimePicker;
    cmbUseYes: TAdvComboBox;
    cmbUsePark: TAdvComboBox;
    edtReMark1: TAdvEdit;
    edtMaxCount: TAdvSpinEdit;
    edtReMark2: TAdvEdit;
    qryDcFixedMaxCount: TIntegerField;
    qryDcFixedUseYes: TIntegerField;
    qryDcFixedDCName: TStringField;
    btnAllAdd: TBitBtn;
    OpenDialog1: TOpenDialog;
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure dg1Click(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure cmbDcNameChange(Sender: TObject);
    procedure qryDcFixedUseYesGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure btnAllAddClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;
  RECDcInfo = record
    nDcNo  : Integer;
    sDcName: String;
  end;

var
  frmDCFixed: TfrmDCFixed;
  sPrvCarNo : AnsiString;
  nDcCount  : Integer;
  RDcInfo : Array[1..100] of RECDcInfo;
  nSeq      : Integer;
implementation

uses
  global, Tables, seek3;

{$R *.dfm}


procedure TfrmDCFixed.btnAllAddClick(Sender: TObject);
var
  vExcel: Variant;
  nCnt, i, j, nTotCnt: Integer;
  sReadRow : String;
  nParkNo, nDCNo, nDayCount, nMonthCount, nMaxCount, nUseParkNo, nUseYes : Integer;
  sCarNo, sName, sTelNo, sStartDate, sEndDate, sWeekDay, sStartTime, sEndTime, sRemark1, sRemark2 : String;
  sError: aString;
begin
  try
    vExcel:= CreateOleObject('Excel.application');
  except
    ShowMessage('Excel이 설치되어 있지 않습니다!!!');
    Exit;
  end;

  if OpenDialog1.Execute then
  begin
    vExcel.workbooks.open(OpenDialog1.FileName);
  end
  else
    Exit;

  sError:= '';
  nCnt:= strToint(vExcel.ActiveSheet.UsedRange.Rows.Count);
  nTotCnt:= 0;
  Refresh;
  StartProgress('일괄처리중...', '일괄처리중입니다.  잠시 기다려주세요!', nCnt-1);

  // 엑셀에 데이터 존재할때 백업 및 삭제 처리
  if nCnt > 1 then
  begin
    with qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from sysobjects where name = ''Temp_DCFixed'' ');   // 테이블 존재여부
      Open;

      if RecordCount = 0 then
      begin
        SQL.Add('select * into Temp_DCFixed from DCFixed where 1=2; ');   // 테이블 구조 복사
        Open;
        ExceptLogging('TfrmDCFixed.btnAllAddClick > 테이블 구조 복사..');
      end;

      SQL.Clear;
      SQL.Add('SET IDENTITY_INSERT Temp_DCFixed on; ' +
              'insert into Temp_DCFixed (ParkNo, Sequnce, CarNo, DcNo, Name, TelNo, StartYmd, EndYmd, ' +
              'UseWeekDay, UseStartTime, UseEndTime, LimitedDayCount, LimitedMonthCount, MaxCount, UseParkNo, ' +
              'Remark, Remark2, UseYes, Reserve1, Reserve2, Reserve3, Reserve4, Reserve5) ' +
              'select ParkNo, Sequnce, CarNo, DcNo, Name, TelNo, StartYmd, EndYmd, ' +
              'UseWeekDay, UseStartTime, UseEndTime, LimitedDayCount, LimitedMonthCount, MaxCount, UseParkNo, ' +
              'Remark, Remark2, UseYes, Reserve1, Reserve2, Reserve3, Reserve4, Reserve5 from DCFixed; ');      // 데이터 복사
      SQL.Add('SET IDENTITY_INSERT Temp_DCFixed OFF; ');
      SQL.Add('delete from DCFixed; ');                                 // 데이터 삭제
      ExecSQL;

      ExceptLogging('TfrmDCFixed.btnAllAddClick > 데이터 백업 및 삭제처리 완료!');
    end;
  end;

  // 주차장번호, 차량번호, 할인권번호, 이름, 전화번호, 시작일, 만료일, 사용요일, 사용시작시간, 사용종료시간
  // 일제한횟수, 월제한횟수, 총횟수제한, 사용주차장, 비고1, 비고2, 사용유무
  for i:= 2 to nCnt do
  begin
    try
    begin
      sReadRow    := '0';
      nParkNo     := StrToInt(aString(vExcel.Cells[i, 1]));               // 주차장번호
      sReadRow    := 'A';
      sCarNo      := MG_StrTrim(aString(vExcel.Cells[i, 2]), ' ');             // 차량번호
      sReadRow    := 'B';
      nDCNo       := StrToInt(aString(vExcel.Cells[i, 3]));               // 할인권번호
      sReadRow    := 'C';
      sName       := MG_StrTrim(aString(vExcel.Cells[i, 4]), ' ');        // 이름
      sReadRow    := 'D';
      sTelNo      := aString(vExcel.Cells[i, 5]);                         // 전화번호
      sReadRow    := 'E';
      sStartDate  := aString(vExcel.Cells[i, 6]);                         // 사용시작일
      sReadRow    := 'F';
      sEndDate    := aString(vExcel.Cells[i, 7]);                         // 사용만료일
      sReadRow    := 'G';
      sWeekDay    := aString(vExcel.Cells[i, 8]);                         // 사용요일
      sReadRow    := 'H';
      sStartTime  := aString(vExcel.Cells[i, 9]);                         // 사용시작시간
      sReadRow    := 'I';
      sEndTime    := aString(vExcel.Cells[i, 10]);                        // 사용종료시간
      sReadRow    := 'J';
      nDayCount   := StrToInt(aString(vExcel.Cells[i, 11]));              // 일제한횟수
      sReadRow    := 'K';
      nMonthCount := StrToInt(aString(vExcel.Cells[i, 12]));              // 월제한횟수
      sReadRow    := 'L';
      nMaxCount   := StrToInt(aString(vExcel.Cells[i, 13]));              // 총횟수제한
      sReadRow    := 'M';
      nUseParkNo  := StrToInt(aString(vExcel.Cells[i, 14]));              // 사용주차장
      sReadRow    := 'N';
      sRemark1    := aString(vExcel.Cells[i, 15]);                       // 비고1
      sRemark2    := aString(vExcel.Cells[i, 16]);                       // 비고2
      nUseYes     := StrToInt(aString(vExcel.Cells[i, 17]));             // 사용유무
    end
    except
      on E: Exception do
      begin
        ExceptLogging('TfrmDCFixed.btnAllAddClick: ' + aString(E.Message));
        ShowMessage(IntToStr(i) + '행 ' + sReadRow + '열 정보 획득 중 오류발생! 엑셀파일 점검 바랍니다');
        vExcel.WorkBooks.Close;
        vExcel.quit;
        vExcel:=unassigned;
        EndProgress;
        exit;
      end;
    end;

    // 일괄등록 처리
    with dmTables.qryTemp do
    begin
      try
        dmTables.ADODB.BeginTrans;
        Close;
        SQL.Clear;
        SQL.Add('Insert into DCFixed (ParkNo, CarNo, DcNo, Name, TelNo, ' +
                'StartYmd, EndYmd, UseWeekDay, UseStartTime, UseEndTime, ' +
                'LimitedDayCount, LimitedMonthCount, UseParkNo, Remark, Remark2, UseYes, MaxCount) ' +
                'Values (:N1, :N2, :N3, :N4, :N5, ' +
                ':N6, :N7, :N8, :N9, :N10, ' +
                ':N11, :N12, :N13, :N14, :N15, :pUseYes, :pMaxCount) ');
        Parameters.ParamByName('N1').Value:= nParkNo;
        Parameters.ParamByName('N2').Value:= sCarNo;
        Parameters.ParamByName('N3').Value:= nDCNo;
        Parameters.ParamByName('N4').Value:= sName;
        Parameters.ParamByName('N5').Value:= sTelNo;
        Parameters.ParamByName('N6').Value:= sStartDate;
        Parameters.ParamByName('N7').Value:= sEndDate;
        Parameters.ParamByName('N8').Value:= sWeekDay;
        Parameters.ParamByName('N9').Value:= sStartTime;
        Parameters.ParamByName('N10').Value:= sEndTime;
        Parameters.ParamByName('N11').Value:= nDayCount;
        Parameters.ParamByName('N12').Value:= nMonthCount;
        Parameters.ParamByName('N13').Value:= nUseParkNo;
        Parameters.ParamByName('N14').Value:= sRemark1;
        Parameters.ParamByName('N15').Value:= sRemark2;
        Parameters.ParamByName('pUseYes').Value:= nUseYes;
        Parameters.ParamByName('pMaxCount').Value:= nMaxCount;
        ExecSQL;
        dmTables.ADODB.CommitTrans;
      except
        on E: Exception do
        begin
          dmTables.ADODB.RollbackTrans;
          ExceptLogging('TfrmDCFixed.btnAllAddClick: ' + aString(E.Message));
          ShowMessage(IntToStr(i) + '번째 라인 정기차량 개인정보등록중 오류발생! 관리자에 문의바랍니다.');
        end;
      end;

      nTotCnt:= nTotCnt + 1;

      SetProgress(1);
    end;
  end;
  vExcel.WorkBooks.Close;
  vExcel.quit ;
  vExcel:=unassigned;
  EndProgress;
  ShowMessage('총' + IntToStr(nTotCnt) + '건의 자료를 일괄저장 완료하였습니다.');
  ExceptLogging('TfrmDCFixed.btnAllAddClick > 총' + IntToStr(nTotCnt) + '건의 자료 일괄저장 완료');

  with dmTables.qryDcFixed do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from dcFixed');
    open;
    if RecordCount > 0 then
      btnDelete.Enabled := True;
  end;
end;


procedure TfrmDCFixed.btnCancelClick(Sender: TObject);
var
 i : integer;
begin
  edtCarNo.Text := '';
  edtDcNo.Text  := '';
  edtName.Text  := '';
  edtTel.Text   := '';
  edtSDate.Date := Now;
  edtEDate.Date := Now;
  for I := 0 to 6 do
  begin
     TsCheckBox(FindComponent('schkweek'+ IntToStr(i))).Visible := true;
     TsCheckBox(FindComponent('schkweek'+ IntToStr(i))).Checked := true;
  end;
  edtSTime.Time     := StrToDateTime('00:00');
  edtETime.Time     := StrToDateTime('23:59');
  edtDayCount.Text  := '';
  edtMonthCount.Text:= '';
  cmbUsePark.ItemIndex:= 0;
  edtReMark1.Text   := '';
  edtReMark2.Text   := '';
   edtMaxCount.Value := 0;
  sPrvCarNo         := '';
  btnDelete.Enabled:= False;
end;

procedure TfrmDCFixed.btnCloseClick(Sender: TObject);
begin
  qryDcFixed.Close;
  qryUnitInfo.Close;
  qryTemp.Close;
  Close;
end;

procedure TfrmDCFixed.btnDeleteClick(Sender: TObject);
begin
  try
    if sPrvCarNo = '' then
    begin
      ShowMessage('삭제할 데이터를 선택해 주세요');
      Exit;
    end;

    with qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('delete dcFixed where UseParkNo = :N1 ');
      SQL.Add('and CarNo = :N2');
      Parameters.ParamByName('N1').Value:= dmTables.qryDcFixed.FieldByName('UseParkNo').AsString;
      Parameters.ParamByName('N2').Value:= sPrvCarNo;
      ExecSQL;
      showMessage('삭제 완료');
    end;

    btnCancel.OnClick(Sender);

    with dmTables.qryDcFixed do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from dcFixed');
      open;
      if RecordCount > 0 then
        btnDelete.Enabled := True
      else
        btnDelete.Enabled := false;
    end;

  except
    on E: Exception do
    begin
      ExceptLogging('TfrmDCFixed.btnDeleteClick: ' + E.Message);
      ShowMessage('삭제 오류 발생! 관리자에게 문의해 주세요!');
    end;
  end;
end;

procedure TfrmDCFixed.btnExcelClick(Sender: TObject);
begin
  try
    if savedialog1.Execute then
    begin
      advgridexcelio1.XLSExport(savedialog1.filename + '.xls');
      ShowMessage('엑셀파일로 저장완료!');
    end;
  except
    on E: Exception do ExceptLogging('TfrmDCFixed.btnExcelClick: ' + E.Message);
  end;
end;

procedure TfrmDCFixed.btnSaveClick(Sender: TObject);
var
  i : integer;
  sWeek : String;
begin
try
  sWeek := '';
  ExceptLogging('TfrmDCFixed.btnSaveClick Start');

  if Length(MG_StrTrim(edtCarNo.Text, ' ')) < 8 then
  begin
    ShowMessage('차량번호를 정확히 입력하여주세요!');
    edtCarNo.SetFocus;
    Exit;
  end;

//  if edtCarNo.Text <> sPrvCarNo then    //차번이 변경되었다면 중복체크
//  begin
//    with qryDcFixed do
//    begin
//       Close;
//       SQL.Clear;
//       SQL.Add('Select * from DCFixed where CarNo = :N1');
//       Parameters.ParamByName('N1').Value:= MG_StrTrim(aString(edtCarNo.Text), ' ');
//       Open;
//       if RecordCount > 0 then
//       begin
//         ShowMessage(edtCarNo.Text + ' : 차량 번호 중복입니다 다시 확인해 주세요');
//         Exit;
//       end;
//    end;
//  end;
  if edtSDate.Date > edtEDate.Date then
  begin
    ShowMessage('유효기간을 확인하고 입력하여주세요!');
    Exit;
  end;

  //요일 값 불러오기
  for I := 0 to 6 do
  begin
     if  TsCheckBox(FindComponent('schkweek'+ IntToStr(i))).Checked then
     begin
       sWeek := sWeek + '1';
     end
     else
     begin
       sWeek := sWeek + '0';
     end;
  end;

  with qryDcFixed do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Update DCFixed  ' +
            'set CarNo = :N1, DcNo = :N2, Name = :N3, TelNo = :N4, StartYmd = :N5, EndYmd = :N6, ' +
            'UseWeekDay = :N7, UseStartTime = :N8, UseEndTime = :N9, LimitedDayCount = :N10, ' +
            'LimitedMonthCount = :N11, UseParkNo = :N12, Remark = :N13, Remark2 = :N14 ' +
            ', UseYes = :pUseYes, MaxCount = :pMaxCount ' +
//            'where CarNo = :N15 ');
            'where Sequnce = :N15 ');
    Parameters.ParamByName('N1').Value:= edtCarNo.Text;
    Parameters.ParamByName('N2').Value:= edtDCNo.Text;
    Parameters.ParamByName('N3').Value:= edtName.Text;
    Parameters.ParamByName('N4').Value:= edtTel.Text;
    Parameters.ParamByName('N5').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
    Parameters.ParamByName('N6').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
    Parameters.ParamByName('N7').Value:= sWeek;
    Parameters.ParamByName('N8').Value:= FormatDateTime('HH:NN', edtSTime.Time);
    Parameters.ParamByName('N9').Value:= FormatDateTime('HH:NN', edtETime.Time);
    //    Parameters.ParamByName('N9').Value:= FormatDateTime('HH:NN:SS', edtETime.Time);
    Parameters.ParamByName('N10').Value:= edtDayCount.Text;
    Parameters.ParamByName('N11').Value:= edtMonthCount.Text;
    Parameters.ParamByName('N12').Value:= cmbUsePark.ItemIndex;
    Parameters.ParamByName('N13').Value:= edtReMark1.Text;
    Parameters.ParamByName('N14').Value:= edtReMark2.Text;
//    Parameters.ParamByName('N15').Value:= sPrvCarNo;
    Parameters.ParamByName('N15').Value:= nSeq;
    Parameters.ParamByName('pUseYes').Value:= cmbUseYes.ItemIndex;
    Parameters.ParamByName('pMaxCount').Value:= edtMaxCount.Value;
    ExecSQL;
    ShowMessage('정보 수정 완료!');
  end;

  btnCancel.OnClick(Sender);

  with dmTables.qryDcFixed do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from dcFixed');
    open;
    if RecordCount > 0 then
      btnDelete.Enabled := True
    else
      btnDelete.Enabled := false;
  end;

except
  on E: Exception do
  begin
    ExceptLogging('TfrmDCFixed.btnSaveClick: ' + aString(E.Message));
    ShowMessage('정보 수정 오류! 관리자에게 문의바랍니다.');
  end;
end;
end;

procedure TfrmDCFixed.btnSearchClick(Sender: TObject);
begin
  btnCanCel.OnClick(sender);
  NextModalDialog(TfrmSeek3.Create(Self));
  btnExcel.Enabled := False;
end;

procedure TfrmDCFixed.cmbDcNameChange(Sender: TObject);
var
  i : Integer;
begin
  for i:= 1 to nDcCount do
  if RDcInfo[i].sDcName = cmbDcName.Text then
  begin
    edtDcNo.Text:= IntToStr(RDcInfo[i].nDcNo);
    Break;
  end;
end;

procedure TfrmDCFixed.dg1Click(Sender: TObject);
var
  j : byte;
  sWeek : String;
begin
  try
    if dmTables.qryDcFixed.RecordCount > 0 then
    begin
      with dmTables.qryDcFixed do
      begin
        edtCarNo.text       := FieldByName('CarNo').AsString;
        edtDCNo.Text        := FieldByName('DCNo').AsString;
        edtName.Text        := FieldByName('Name').AsString;
        edtTel.Text         := FieldByName('TelNo').AsString;
        edtSDate.Date       := FieldByName('StartYmd').AsDateTime;
        edtEDate.Date       := FieldByName('EndYmd').AsDateTime;
        sWeek               := FieldByName('UseWeekDay').AsString;
        edtSTime.Time       := StrToDateTime(FieldByName('UseStartTime').AsString);
        edtETime.Time       := StrToDateTime(FieldByName('UseEndTime').AsString);
        edtDayCount.Text    := FieldByName('LimitedDayCount').AsString;
        edtMonthCount.Text  := FieldByName('LimitedMonthCount').AsString;
        cmbUsePark.ItemIndex:= FieldByName('UseParkNo').AsInteger;
        edtReMark1.Text     := FieldByName('Remark').AsString;
        edtReMark2.Text     := FieldByname('Remark2').AsString;
        sPrvCarNo           := edtCarNo.text;
        cmbUseYes.ItemIndex := FieldByName('UseYes').AsInteger;
        edtMaxCount.Value   := FieldByName('MaxCount').AsInteger;
        nSeq                := FieldByName('Sequnce').AsInteger;

        for j:= 1 to nDcCount do
        if RDcInfo[j].nDcNo = StrToInt(edtDCNo.Text) then
        begin
          cmbDcName.Text:= RDcInfo[j].sDcName;
          Break;
        end;
      end;


       //요일 값 불러오기
      for j := 0 to 6 do
      begin
         TsCheckBox(FindComponent('schkweek'+ IntToStr(j))).Checked := False;
      end;

      for j := 0 to 6 do
      begin
        if sWeek[7-j] = '1' then
        begin
          TsCheckBox(FindComponent('schkweek'+ IntToStr(6-j))).Checked := True;
        end;
      end;

      btnDelete.Enabled := True;
    end;
  except
    on E: Exception do
    begin
      ExceptLogging('TfrmDCFixed.dg1Click: ' + aString(E.Message));
    end;
  end;
end;

procedure TfrmDCFixed.FormShow(Sender: TObject);
var
  i : Integer;
begin
  try
    with dmTables.qryDcFixed do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from dcFixed');
      open;
      if RecordCount > 0 then
        btnDelete.Enabled := True;
    end;
    nDcCount := 0;
    with qryDCInfo do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from dcinfo where FixedUse = 1');
      open;
      i := 1;
      if recordcount > 0 then
      begin
        nDcCount := RecordCount;
        while not Eof do
        begin
          RDcInfo[i].nDcNo   := FieldByName('DCNo').AsInteger;
          RDcInfo[i].sDcName := FieldByName('DCName').AsString;
          cmbDcName.Items.Add(FieldByName('DCName').AsString);
          inc(i);
          next;
        end;
      end;
    end;

    with qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from parkkind ');
      open;
      i := 1;
      if recordcount > 0 then
      begin
        while not Eof do
        begin
          cmbUsePark.Items.Add(FieldByName('ParkName').AsString);
          inc(i);
          next;
        end;

        cmbUsePark.ItemIndex := 0;
      end;
    end;
  except
    on E: Exception do
    begin
      ExceptLogging('TfrmDCFixed.FormShow: ' + aString(E.Message));
    end;
  end;
end;

procedure TfrmDCFixed.qryDcFixedUseYesGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Case qryDcFixedUseYes.Value of
    1: Text:= '사용';
    0: Text:= '사용안함';
  end;
end;

end.
