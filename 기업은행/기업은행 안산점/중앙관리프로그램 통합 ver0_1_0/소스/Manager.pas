unit Manager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, AdvCombo, Mask, AdvSpin, AdvEdit,
  ExtCtrls, AdvPanel, Grids, BaseGrid, AdvGrid, DBAdvGrid, AdvObj;

type
  TfrmManager = class(TForm)
    AdvPanel1: TAdvPanel;
    AdvPanel2: TAdvPanel;
    edtMName: TAdvEdit;
    edtMNo: TAdvSpinEdit;
    cmbAuthority: TAdvComboBox;
    cmbParkNo: TAdvComboBox;
    edtPasswd: TAdvEdit;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    btnDelete: TBitBtn;
    btnClose: TBitBtn;
    qryManager: TADOQuery;
    qryManagerParkNo: TSmallintField;
    qryManagerMNo: TWordField;
    qryManagerPasswd: TStringField;
    qryManagerMName: TStringField;
    qryManagerAuthority: TWordField;
    qryManagerReserve1: TStringField;
    qryManagerReserve2: TStringField;
    qryManagerReserve3: TStringField;
    qryManagerReserve4: TStringField;
    qryManagerReserve5: TStringField;
    dsManager: TDataSource;
    qryTemp: TADOQuery;
    dgManager: TDBAdvGrid;
    procedure qryManagerAuthorityGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure dgManagerClick(Sender: TObject);
  private
    { Private declarations }
    procedure frmClear;
  public
    { Public declarations }
  end;

var
  frmManager: TfrmManager;
  nSelect: Byte = 0;  //Insert:0, Modify:1;

implementation
uses
  Tables, Global;

{$R *.dfm}

procedure TfrmManager.btnCancelClick(Sender: TObject);
begin
  frmClear;
end;

procedure TfrmManager.btnCloseClick(Sender: TObject);
begin
  qryTemp.Close;
  qryManager.Close;

  Close;
end;

procedure TfrmManager.btnDeleteClick(Sender: TObject);
begin
  try
    if MessageDlg('선택한 근무자를 삭제할까요?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;

    with qryManager do
    begin
      try
        dmTables.ADODB.BeginTrans;
        Close;
        SQL.Clear;
        SQL.Add('Delete from Manager where ParkNo = :N1 and MNo = :N2');
        Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
        Parameters.ParamByName('N2').Value:= edtMNo.Value;
        ExecSQL;
        dmTables.ADODB.CommitTrans;
      except
        on E: Exception do
        begin
          dmTables.ADODB.RollbackTrans;
          ExceptLogging('TfrmManager.btnDeleteClick: ' + aString(E.Message));
          ShowMessage('삭제중 오류발생! 관리자에 문의바랍니다.');
        end;
      end;

      Close;
      SQL.Clear;
      SQL.Add('Select * from Manager');
      Open;
    end;
    frmClear;
  except
    on E: Exception do ExceptLogging('TfrmManager.btnDeleteClick: ' + aString(E.Message));
  end;
end;

procedure TfrmManager.btnSaveClick(Sender: TObject);
begin
  try
    if edtMNo.Value = 0 then
    begin
      ShowMessage('근무자번호는 1번부터 저장이 가능합니다.');
      edtMNo.SetFocus;
      Exit;
    end;

    with qryManager do
    begin
      if nSelect = 0 then
      begin
        //추가...
        with qryTemp do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Select * from Manager where ParkNo = :N1 and MNo = :N2');
          Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
          Parameters.ParamByName('N2').Value:= edtMNo.Value;
          Open;

          if RecordCount > 0 then
          begin
            ShowMessage('해당 근무자번호는 이미 사용중입니다.');
            cmbParkNo.SetFocus;
            Exit;
          end;
        end;

        try
          dmTables.ADODB.BeginTrans;
          Close;
          SQL.Clear;
          SQL.Add('Insert Manager ');
          SQL.Add('(ParkNo, MNo, Passwd, MName, Authority) ');
          SQL.Add('Values (:N1, :N2, :N3, :N4, :N5) ');
          Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
          Parameters.ParamByName('N2').Value:= edtMNo.Value;
          Parameters.ParamByName('N3').Value:= edtPasswd.Text;
          Parameters.ParamByName('N4').Value:= edtMName.Text;
          Parameters.ParamByName('N5').Value:= cmbAuthority.ItemIndex;
          ExecSQL;
          dmTables.ADODB.CommitTrans;
        except
          on E: Exception do
          begin
            dmTables.ADODB.RollbackTrans;
            ExceptLogging('TfrmManager.btnSaveClick: ' + aString(E.Message));
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
          SQL.Add('Update Manager ');
          SQL.Add('Set Passwd = :N3, MName = :N4, Authority = :N5 ');
          SQL.Add('Where ParkNo = :N1 and MNo = :N2');
          Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
          Parameters.ParamByName('N2').Value:= edtMNo.Value;
          Parameters.ParamByName('N3').Value:= edtPasswd.Text;
          Parameters.ParamByName('N4').Value:= edtMName.Text;
          Parameters.ParamByName('N5').Value:= cmbAuthority.ItemIndex;
          ExecSQL;
          dmTables.ADODB.CommitTrans;
        except
          on E: Exception do
          begin
            dmTables.ADODB.RollbackTrans;
            ExceptLogging('TfrmManager.btnSaveClick: ' + aString(E.Message));
            ShowMessage('저장중 오류발생! 관리자에 문의바랍니다.');
          end;
        end;
      end;
      Close;
      SQL.Clear;
      SQL.Add('Select * from Manager');
      Open;

      frmClear;
    end;
  except
    on E: Exception do ExceptLogging('TfrmManager.btnSaveClick: ' + aString(E.Message));
  end;
end;

procedure TfrmManager.dgManagerClick(Sender: TObject);
begin
  try
    if qryManager.RecordCount > 0 then
      with qryManager do
      begin
        cmbParkNo.ItemIndex:= cmbParkNo.Items.IndexOf(IntToStr(FieldByName('ParkNo').AsInteger));
        edtMNo.Value:= FieldByName('MNo').AsInteger;
        edtPasswd.Text:= FieldByName('Passwd').AsString;
        edtMName.Text:= FieldByName('MName').AsString;
        cmbAuthority.ItemIndex:= FieldByName('Authority').AsInteger;

        cmbParkNo.Enabled:= False;
        edtMNo.Enabled:= False;
        btnCancel.Enabled:= True;
        btnDelete.Enabled:= True;

        nSelect:= 1;
      end;
  except
    on E: Exception do ExceptLogging('TfrmManager.dgHolidayClick: ' + aString(E.Message));
  end;
end;

procedure TfrmManager.FormShow(Sender: TObject);
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

    with qryManager do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from Manager');
      Open;
    end;
    frmClear;
  except
    on E: Exception do ExceptLogging('TfrmManager.FormShow: ' + aString(E.Message));
  end;
end;

procedure TfrmManager.frmClear;
begin
  try
    cmbParkNo.ItemIndex:= 0;
    edtMNo.Value:= 0;
    edtMName.Text:= '';
    edtPasswd.Text:= '';
    cmbAuthority.ItemIndex:= 2;

    cmbParkNo.Enabled:= True;
    btnDelete.Enabled:= False;
    btnCancel.Enabled:= False;
    cmbParkNo.Enabled:= True;
    edtMNo.Enabled:= True;
    nSelect:= 0;
    cmbParkNo.SetFocus;
  except
    on E: Exception do ExceptLogging('TfrmManager.frmClear: ' + aString(E.Message));
  end;
end;

procedure TfrmManager.qryManagerAuthorityGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Case qryManagerAuthority.Value of
    0: Text:= 'Master';
    1: Text:= '관리자';
    2: Text:= '근무자';
    3: Text:= '정산원';
  end;
end;

end.
