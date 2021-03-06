unit Holiday;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Mask, AdvEdit, StdCtrls, AdvCombo, ExtCtrls, AdvPanel,
  Grids, BaseGrid, AdvGrid, DBAdvGrid, Buttons, AdvObj;

type
  TfrmHoliday = class(TForm)
    AdvPanel1: TAdvPanel;
    AdvPanel2: TAdvPanel;
    edtHName: TAdvEdit;
    cmbParkNo: TAdvComboBox;
    edtHDate: TAdvMaskEdit;
    cmbHType: TAdvComboBox;
    qryHoliday: TADOQuery;
    qryHolidayParkNo: TSmallintField;
    qryHolidayHDate: TStringField;
    qryHolidayHName: TStringField;
    dsHoliday: TDataSource;
    qryHolidayHType: TWordField;
    qryHolidayReserve1: TStringField;
    qryHolidayReserve2: TStringField;
    qryHolidayReserve3: TStringField;
    qryHolidayReserve4: TStringField;
    qryHolidayReserve5: TStringField;
    qryTemp: TADOQuery;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    btnDelete: TBitBtn;
    btnClose: TBitBtn;
    dgHoliday: TDBAdvGrid;
    procedure qryHolidayHTypeGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure dgHolidayClick(Sender: TObject);
  private
    { Private declarations }
    procedure frmClear;
  public
    { Public declarations }
  end;

var
  frmHoliday: TfrmHoliday;
  nSelect: Byte = 0;  //Insert:0, Modify:1;

implementation
uses
  Tables, Global;

{$R *.dfm}

procedure TfrmHoliday.btnCancelClick(Sender: TObject);
begin
  frmClear;
end;

procedure TfrmHoliday.btnCloseClick(Sender: TObject);
begin
  qryHoliday.Close;
  qryTemp.Close;

  Close;
end;

procedure TfrmHoliday.btnDeleteClick(Sender: TObject);
begin
  try
    if MessageDlg('선택한 휴일을 삭제할까요?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;

    with qryHoliday do
    begin
      try
        dmTables.ADODB.BeginTrans;
        Close;
        SQL.Clear;
        SQL.Add('Delete from Holiday where ParkNo = :N1 and HDate = :N2');
        Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
        Parameters.ParamByName('N2').Value:= edtHDate.Text;
        ExecSQL;
        dmTables.ADODB.CommitTrans;
      except
        on E: Exception do
        begin
          dmTables.ADODB.RollbackTrans;
          ExceptLogging('TfrmHoliday.btnDeleteClick: ' + aString(E.Message));
          ShowMessage('삭제중 오류발생! 관리자에 문의바랍니다.');
        end;
      end;

      Close;
      SQL.Clear;
      SQL.Add('Select * from Holiday');
      Open;
    end;
    frmClear;
  except
    on E: Exception do ExceptLogging('TfrmHoliday.btnDeleteClick: ' + aString(E.Message));
  end;
end;

procedure TfrmHoliday.btnSaveClick(Sender: TObject);
begin
  try
    if edtHDate.Text = '' then
    begin
      ShowMessage('휴일 날짜를 입력하여야 합니다.');
      edtHDate.SetFocus;
      Exit;
    end;

    with qryHoliday do
    begin
      if nSelect = 0 then
      begin
        //추가...
        with qryTemp do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Select * from Holiday where ParkNo = :N1 and HDate = :N2');
          Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
          Parameters.ParamByName('N2').Value:= edtHDate.Text;
          Open;

          if RecordCount > 0 then
          begin
            ShowMessage('해당 휴일은 이미 등록되었습니다.'#13#10 +
                        '다른 휴일을 등록하여주세요!');
            edtHDate.SetFocus;
            Exit;
          end;
        end;

        try
          dmTables.ADODB.BeginTrans;
          Close;
          SQL.Clear;
          SQL.Add('Insert Holiday ');
          SQL.Add('(ParkNo, HDate, HName, HType) ');
          SQL.Add('Values (:pParkNo, :pHDate, :pHName, :pHType) ');
          Parameters.ParamByName('pParkNo').Value:= StrToInt(cmbParkNo.Text);
          Parameters.ParamByName('pHDate' ).Value:= edtHDate.Text;
          Parameters.ParamByName('pHName' ).Value:= edtHName.Text;
          Parameters.ParamByName('pHType' ).Value:= cmbHType.ItemIndex;
          ExecSQL;
          dmTables.ADODB.CommitTrans;
        except
          on E: Exception do
          begin
            dmTables.ADODB.RollbackTrans;
            ExceptLogging('TfrmHoliday.btnSaveClick: ' + aString(E.Message));
            ShowMessage('저장중 오류발생! 관리자에 문의바랍니다.');
          end;
        end;
     end
      else
      if nSelect = 1 then
      begin
        //수정...
        try
          dmTables.ADODB.BeginTrans;
          Close;
          SQL.Clear;
          SQL.Add('Update Holiday ');
          SQL.Add('Set HName = :pHName, HType = :pHType ');
          SQL.Add('Where ParkNo = :pParkNo and HDate = :pHDate');
          Parameters.ParamByName('pHName' ).Value:= edtHName.Text;
          Parameters.ParamByName('pHType' ).Value:= cmbHType.ItemIndex;
          Parameters.ParamByName('pParkNo').Value:= StrToInt(cmbParkNo.Text);
          Parameters.ParamByName('pHDate' ).Value:=  edtHDate.Text;
          ExecSQL;
          dmTables.ADODB.CommitTrans;
        except
          on E: Exception do
          begin
            dmTables.ADODB.RollbackTrans;
            ExceptLogging('TfrmHoliday.btnSaveClick: ' + aString(E.Message));
            ShowMessage('저장중 오류발생! 관리자에 문의바랍니다.');
          end;
        end;
      end;
      Close;
      SQL.Clear;
      SQL.Add('Select * from Holiday');
      Open;

      frmClear;
    end;
  except
    on E: Exception do ExceptLogging('TfrmHoliday.btnSaveClick: ' + aString(E.Message));
  end;
end;

procedure TfrmHoliday.dgHolidayClick(Sender: TObject);
begin
  try
    if qryHoliday.RecordCount > 0 then
    with qryHoliday do
    begin
      cmbParkNo.ItemIndex:= cmbParkNo.Items.IndexOf(IntToStr(FieldByName('ParkNo').AsInteger));
      edtHDate.Text:= FieldByName('HDate').AsString;
      edtHName.Text:= FieldbyName('HName').AsString;
      cmbHType.ItemIndex:= FieldbyName('HType').AsInteger;

      cmbParkNo.Enabled:= False;
      edtHDate.Enabled:= False;
      btnCancel.Enabled:= True;
      btnDelete.Enabled:= True;

      nSelect:= 1;
    end;
  except
    on E: Exception do ExceptLogging('TfrmHoliday.dgHolidayClick: ' + aString(E.Message));
  end;
end;

procedure TfrmHoliday.FormShow(Sender: TObject);
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

    with qryHoliday do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from Holiday');
      Open;
    end;
    frmClear;
  except
    on E: Exception do ExceptLogging('TfrmHoliday.FormShow: ' + aString(E.Message));
  end;
end;

procedure TfrmHoliday.frmClear;
begin
  try
    cmbParkNo.ItemIndex:= 0;
    edtHDate.Text:= '';
    edtHName.Text:= '';
    cmbHType.ItemIndex:= 0;

    cmbParkNo.Enabled:= True;
    edtHDate.Enabled:= True;
    btnDelete.Enabled:= False;
    btnCancel.Enabled:= False;
    nSelect:= 0;
    cmbParkNo.SetFocus;
  except
    on E: Exception do ExceptLogging('TfrmHoliday.frmClear: ' + aString(E.Message));
  end;
end;

procedure TfrmHoliday.qryHolidayHTypeGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  case qryHolidayHType.Value of
    0: Text:= '양력';
    1: Text:= '음력';
  end;
end;

end.
