unit ValetCard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvSpin, Mask, AdvEdit, StdCtrls, AdvCombo, ExtCtrls, AdvPanel, DB,
  ADODB, Buttons, Grids, BaseGrid, AdvGrid, DBAdvGrid, tmsAdvGridExcel, ComObj,
  AdvObj, CPort, Vcl.ComCtrls;
type
  TfrmValetCard = class(TForm)
    AdvPanel1: TAdvPanel;
    qryValetCard: TADOQuery;
    dsValetCard: TDataSource;
    btnSave: TBitBtn;
    btnDelete: TBitBtn;
    btnClose: TBitBtn;
    dgCardInfo: TDBAdvGrid;
    qryTemp: TADOQuery;
    qryValetCardParkNo: TSmallintField;
    qryValetCardCardNo: TStringField;
    qryValetCardReserve1: TStringField;
    qryValetCardReserve2: TStringField;
    qryValetCardReserve3: TStringField;
    qryValetCardReserve4: TStringField;
    qryValetCardReserve5: TStringField;
    Panel1: TPanel;
    btnExcel: TBitBtn;
    btnAllAdd: TBitBtn;
    cmbParkNo: TAdvComboBox;
    edtCardNo: TAdvEdit;
    SaveDialog1: TSaveDialog;
    eCustInfo: TAdvGridExcelIO;
    OpenDialog1: TOpenDialog;
    qryValetCardMarkNo: TStringField;
    edtMarkNo: TAdvEdit;
    ComPort1: TComPort;
    edtLocation: TAdvEdit;
    sb1: TStatusBar;
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure dgCardInfoClick(Sender: TObject);
    procedure btnAllAddClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure ComPort1RxChar(Sender: TObject; Count: Integer);
  private
    { Private declarations }
    procedure frmClear;
  public
    { Public declarations }
  end;

var
  frmValetCard: TfrmValetCard;
  nSelect: Byte = 0;  //Insert:0, Modify:1;
  sPrvCardNo: AnsiString;

implementation
uses
  Tables, Global;

{$R *.dfm}

// 일괄등록
procedure TfrmValetCard.btnAllAddClick(Sender: TObject);
var
  vExcel: Variant;
  nCnt, i, j, nTotCnt: Integer;
  sCardNo, sMarkNo, sLocation: aString;
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

  for i:= 2 to nCnt do
  begin
    sCardNo  := aString(vExcel.Cells[i, 1]);
    sMarkNo := aString(vExcel.Cells[i, 2]);
    sLocation := aString(vExcel.Cells[i, 3]);

    with dmTables.qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from ValetCard where MarkNo = :pMarkNo');
      Parameters.ParamByName('pMarkNo').Value:= sMarkNo;
      Open;

      if RecordCount <= 0 then
      begin
        //미등록된 카드이면
        try
          dmTables.ADODB.BeginTrans;
          Close;
          SQL.Clear;
          SQL.Add('Insert into ValetCard ');
          SQL.Add('(ParkNo, CardNo, MarkNo, Reserve1) ');
          SQL.Add('Values (:pParkNo, :pCardNo, :pMarkNo, :pReserve1)');
          Parameters.ParamByName('pParkNo' ).Value:= nCurrParkNo;
          Parameters.ParamByName('pCardNo' ).Value:= sCardNo;
          Parameters.ParamByName('pMarkNo' ).Value:= sMarkNo;
          Parameters.ParamByName('pReserve1' ).Value:= sLocation;
          ExecSql;
          dmTables.ADODB.CommitTrans;
        except
          on E: Exception do
          begin
            dmTables.ADODB.RollbackTrans;
            ExceptLogging('sCardNo.btnAllAddClick: ' + aString(E.Message));
            ShowMessage('카드등록중 오류발생! 관리자에 문의바랍니다.');
          end;
        end;
        nTotCnt:= nTotCnt + 1;
      end;
      SetProgress(1);
    end;
  end;
  vExcel.WorkBooks.Close;
  vExcel.quit ;
  vExcel:=unassigned;
  EndProgress;
  ShowMessage('총' + IntToStr(nTotCnt) + '건의 자료를 일괄저장 완료하였습니다.');

  with qryValetCard do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * from ValetCard order by CONVERT(int, CardNo) asc');
    Open;
  end;
end;

procedure TfrmValetCard.btnCancelClick(Sender: TObject);
begin
  frmClear;
end;

procedure TfrmValetCard.btnCloseClick(Sender: TObject);
begin
  qryTemp.Close;
  qryValetCard.Close;
  Close;
end;

procedure TfrmValetCard.btnDeleteClick(Sender: TObject);
begin
  try
    if MessageDlg('선택한 카드를 삭제할까요?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;

    with qryValetCard do
    begin
      try
        dmTables.ADODB.BeginTrans;
        Close;
        SQL.Clear;
        SQL.Add('Delete from ValetCard where ParkNo = :N1 and CardNo = :N2');
        Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
        Parameters.ParamByName('N2').Value:= edtCardNo.Text;
        ExecSQL;
        dmTables.ADODB.CommitTrans;
      except
        on E: Exception do
        begin
          dmTables.ADODB.RollbackTrans;
          ExceptLogging('TfrmValetCard.btnDeleteClick: ' + aString(E.Message));
          ShowMessage('삭제중 오류발생! 관리자에 문의바랍니다.');
        end;
      end;

      Close;
      SQL.Clear;
      SQL.Add('Select * from ValetCard order by CONVERT(int, CardNo) asc');
      Open;
    end;
    frmClear;
  except
    on E: Exception do ExceptLogging('TfrmValetCard.btnDeleteClick: ' + aString(E.Message));
  end;
end;

procedure TfrmValetCard.btnExcelClick(Sender: TObject);
begin
  try
    if savedialog1.Execute then
    begin
      eCustInfo.XLSExport(savedialog1.filename + '.xls');
      ShowMessage('엑셀파일로 저장완료!');
    end;
  except
    on E: Exception do ExceptLogging('TfrmValetCard.btnExcelClick: ' + aString(E.Message));
  end;
end;

procedure TfrmValetCard.btnSaveClick(Sender: TObject);
begin
  try
    if edtCardNo.Text = '0' then
    begin
      ShowMessage('카드번호는 1번부터 저장이 가능합니다.');
      edtCardNo.SetFocus;
      Exit;
    end;

    if not MG_NumberCheck(edtCardNo.Text) then
    begin
      ShowMessage('카드번호는 숫자로 입력하여주세요!');
      edtCardNo.SetFocus;
      Exit;
    end;

    with qryValetCard do
    begin
      if nSelect = 0 then
      begin
        //추가...
        with qryTemp do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Select * from ValetCard where ParkNo = :N1 and CardNo = :N2');
          Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
          Parameters.ParamByName('N2').Value:= edtCardNo.Text;
          Open;

          if RecordCount > 0 then
          begin
            ShowMessage('해당 카드번호는 이미 사용중입니다.'#13#10 +
                        '카드번호를 변경하여주세요!');
            edtCardNo.SetFocus;
            Exit;
          end;
        end;

        try
          dmTables.ADODB.BeginTrans;
          Close;
          SQL.Clear;
          SQL.Add('Insert ValetCard ');
          SQL.Add('(ParkNo, CardNo) ');
          SQL.Add('Values (:N1, :N2) ');
          Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
          Parameters.ParamByName('N2').Value:= edtCardNo.Text;
          ExecSQL;
          dmTables.ADODB.CommitTrans;
        except
          on E: Exception do
          begin
            dmTables.ADODB.RollbackTrans;
            ExceptLogging('TfrmValetCard.btnSaveClick: ' + aString(E.Message));
            ShowMessage('저장중 오류발생! 관리자에 문의바랍니다.');
          end;
        end;
      end
      else
      if nSelect = 1 then
      begin
        //수정...
//        try
//          dmTables.ADODB.BeginTrans;
//          Close;
//          SQL.Clear;
//          SQL.Add('Update ValetCard ');
//          SQL.Add('Set DCName = :N3, DCValue = :N4, DCType = :N5, DCUseCnt = :N6 ');
//          SQL.Add('Where ParkNo = :N1 and DCNo = :N2');
//          Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
//          Parameters.ParamByName('N2').Value:= edtDCNo.Value;
//          Parameters.ParamByName('N3').Value:= edtDCName.Text;
//          Parameters.ParamByName('N4').Value:= edtDCValue.Value;
//          Parameters.ParamByName('N5').Value:= cmbDCType.ItemIndex;
//          Parameters.ParamByName('N6').Value:= edtDCUseCnt.Value;
//          ExecSQL;
//          dmTables.ADODB.CommitTrans;
//        except
//          on E: Exception do
//          begin
//            dmTables.ADODB.RollbackTrans;
//            ExceptLogging('TfrmValetCard.btnSaveClick: ' + aString(E.Message));
//            ShowMessage('저장중 오류발생! 관리자에 문의바랍니다.');
//          end;
//        end;
      end;
      Close;
      SQL.Clear;
      SQL.Add('Select * from ValetCard order by CONVERT(int, CardNo) asc');
      Open;

      frmClear;
    end;
  except
    on E: Exception do ExceptLogging('TfrmValetCard.btnSaveClick: ' + aString(E.Message));
  end;
end;

procedure TfrmValetCard.ComPort1RxChar(Sender: TObject; Count: Integer);
var
  sRecv, sSend, sMarkNo, sCardNo: String;
  nCheck, nSTXPos, nETXPos: Integer;
begin
  try
    edtCardNo.Text := '';

    if ComPort1.ReadStr(sRecv, Count) <> Count then begin
      sRecvData1:= '';
      Exit;
    end else begin
      if Pos(STX, sRecv) > 0 then
        sRecvData1:= Copy(sRecv, Pos(STX, sRecv), Length(sRecv)-(Pos(STX, sRecv)-1));

      if (Pos(STX, sRecv) <= 0) then
        sRecvData1:= sRecvData1 + sRecv;

      if (Pos(STX, sRecvData1) > 0) and (Pos(ETX, sRecvData1) <= 0) then Exit;

      nSTXPos:= Pos(STX, sRecvData1);
      nETXPos:= Pos(ETX, sRecvData1);
      sRecvData1:= Copy(sRecvData1, nSTXPos, nETXPos-(nSTXPos-1));
      sMarkNo:= Copy(sRecvData1, 2, 16);

      edtMarkNo.Text := sMarkNo;

      // 카드 고유번호로 조회
      with qryValetCard do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select * from ValetCard where MarkNo = :pMarkNo');
        Parameters.ParamByName('pMarkNo').Value := sMarkNo;
        Open;

        if RecordCount > 0 then
        begin
          sCardChange := FieldByName('CardNo').AsString;     // 0003    -> 0004
          edtCardNo.Text := sCardChange;
        end
        else
        begin
          ShowMessage('등록되어있지 않은 카드번호입니다.');
          Exit;
        end;
      end;
      //ExceptLogging('카드고유번호: ' + sMarkNo + ', 카드번호: ' + sCardChange);
    end;
  except
   on E: Exception do ExceptLogging('TfrmValetProc.ComPort1RxChar: ' + E.Message);
  end;
end;

procedure TfrmValetCard.dgCardInfoClick(Sender: TObject);
begin
  try
    if qryValetCard.RecordCount > 0 then
      with qryValetCard do
      begin
        cmbParkNo.ItemIndex:= cmbParkNo.Items.IndexOf(IntToStr(FieldByName('ParkNo').AsInteger));
        edtCardNo.Text:= FieldByName('CardNo').AsString;
        edtMarkNo.Text := FieldByName('MarkNo').AsString;
        edtLocation.Text := FieldByName('Reserve1').AsString;
        //btnCancel.Enabled:= True;
        btnDelete.Enabled:= True;

        nSelect:= 1;
      end;
  except
    on E: Exception do ExceptLogging('TfrmValetCard.dgCardInfoClick: ' + aString(E.Message));
  end;
end;

procedure TfrmValetCard.FormShow(Sender: TObject);
var
  sTemp : String;
begin
  try
    with qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from ParkInfo');
      Open;

      if RecordCount <= 0 then
      begin
        ShowMessage('주차장을 먼저 설정하여주세요!');
        Close;
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

    with qryValetCard do
    begin
      // 카드리더기
//      Close;
//      SQL.Clear;
//      SQL.Add('Select * ');
//      SQL.Add('From UnitInfo Where UnitKind = :N1 and MyNo = :N2 Order By ParkNo, UnitNo');
//      Parameters.ParamByName('N1').Value := 19; // 카드리더기
//      Parameters.ParamByName('N2').Value := nCurrUnitNo;
//      Open;
//
//      if RecordCount > 0 then
//      begin
//        With ComPort1 do
//        begin
//          if Connected then
//            Close;
//          sTemp := 'COM' + IntToStr(FieldByName('ComPort').Value);
//          //Port:= 'COM' + IntToStr(FieldByName('ComPort').Value);
//          Port:= sTemp;
//          BaudRate:= br9600;
//          Tag:= 1;
//          Open;
//        end;
//      end
//      else
//      begin
//        ShowMessage('환경설정에서 카드리더기를 설정하여주세요!');
//      end;

      Close;
      SQL.Clear;
      SQL.Add('Select * from ValetCard order by CONVERT(int, CardNo) asc');
      Open;

      if RecordCount > 0 then
        sb1.SimpleText:= '조회 : ' + IntToStr(RecordCount) + '건'
      else
        sb1.SimpleText:= '조회 : 0건';
    end;
    frmClear;
  except
    on E: Exception do ExceptLogging('TfrmValetCard.FormShow: ' + aString(E.Message));
  end;
end;

procedure TfrmValetCard.frmClear;
begin
  try
    cmbParkNo.ItemIndex:= 0;
    edtCardNo.Text:= IntToStr(0);

    cmbParkNo.Enabled:= True;
    edtCardNo.Enabled:= True;
    btnDelete.Enabled:= False;
    //btnCancel.Enabled:= False;
    nSelect:= 0;
    cmbParkNo.SetFocus;
  except
    on E: Exception do ExceptLogging('TfrmValetCard.frmClear: ' + aString(E.Message));
  end;
end;
end.
