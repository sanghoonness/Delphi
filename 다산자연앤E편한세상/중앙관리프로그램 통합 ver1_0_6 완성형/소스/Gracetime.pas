unit Gracetime;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, BaseGrid, AdvGrid, DBAdvGrid, DB, AdvSpin,
  Mask, AdvEdit, AdvCombo, ADODB, ExtCtrls, AdvPanel, AdvObj;

type
  TfrmGracetime = class(TForm)
    AdvPanel1: TAdvPanel;
    AdvPanel2: TAdvPanel;
    qryGracetime: TADOQuery;
    qryGracetimeParkNo: TSmallintField;
    qryGracetimeGT1: TStringField;
    qryGracetimeGT2: TStringField;
    qryGracetimeGT3: TStringField;
    qryGracetimeGT4: TStringField;
    qryGracetimeGT5: TStringField;
    qryGracetimeGT6: TStringField;
    qryGracetimeGT7: TStringField;
    qryGracetimeGT8: TStringField;
    dsGracetime: TDataSource;
    qryGracetimeReserve1: TStringField;
    qryGracetimeReserve2: TStringField;
    qryGracetimeReserve3: TStringField;
    qryGracetimeReserve4: TStringField;
    qryGracetimeReserve5: TStringField;
    cmbParkNo: TAdvComboBox;
    edtGT1: TAdvMaskEdit;
    edtGT2: TAdvMaskEdit;
    edtGT3: TAdvMaskEdit;
    edtGT4: TAdvMaskEdit;
    qryTemp: TADOQuery;
    edtGT5: TAdvMaskEdit;
    edtGT6: TAdvMaskEdit;
    edtGT7: TAdvMaskEdit;
    edtGT8: TAdvMaskEdit;
    edtGT9: TAdvSpinEdit;
    qryGracetimeGT9: TWordField;
    dgGracetime: TDBAdvGrid;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    btnDelete: TBitBtn;
    btnClose: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure dgGracetimeClick(Sender: TObject);
  private
    { Private declarations }
    procedure frmClear;
  public
    { Public declarations }
  end;

var
  frmGracetime: TfrmGracetime;
  nSelect: Byte = 0;  //Insert:0, Modify:1;

implementation
uses
  Tables, Global;

{$R *.dfm}

procedure TfrmGracetime.btnCancelClick(Sender: TObject);
begin
  frmClear;
end;

procedure TfrmGracetime.btnCloseClick(Sender: TObject);
begin
  qryTemp.Close;
  qryGracetime.Close;

  Close;
end;

procedure TfrmGracetime.btnDeleteClick(Sender: TObject);
begin
  try
    if MessageDlg('선택한 서비스시간을 삭제할까요?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;

    with qryGracetime do
    begin
      try
        dmTables.ADODB.BeginTrans;
        Close;
        SQL.Clear;
        SQL.Add('Delete from Gracetime where ParkNo = :N1');
        Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
        ExecSQL;
        dmTables.ADODB.CommitTrans;
      except
        on E: Exception do
        begin
          dmTables.ADODB.RollbackTrans;
          ExceptLogging('TfrmGracetime.btnDeleteClick: ' + aString(E.Message));
          ShowMessage('삭제중 오류발생! 관리자에 문의바랍니다.');
        end;
      end;

      Close;
      SQL.Clear;
      SQL.Add('Select * from Gracetime');
      Open;
    end;
    frmClear;
  except
    on E: Exception do ExceptLogging('TfrmGracetime.btnDeleteClick: ' + aString(E.Message));
  end;
end;

procedure TfrmGracetime.btnSaveClick(Sender: TObject);
begin
  try
    with qryGracetime do
    begin
      if nSelect = 0 then
      begin
        //추가...
        with qryTemp do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Select * from Gracetime where ParkNo = :N1');
          Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
          Open;

          if RecordCount > 0 then
          begin
            ShowMessage('해당 주차장에는 서비스시간이 이미 등록되었습니다.');
            cmbParkNo.SetFocus;
            Exit;
          end;
        end;

        try
          dmTables.ADODB.BeginTrans;
          Close;
          SQL.Clear;
          SQL.Add('Insert Gracetime ');
          SQL.Add('(ParkNo, GT1, GT2, GT3, GT4, GT5, GT6, GT7, GT8, GT9) ');
          SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10) ');
          Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
          Parameters.ParamByName('N2').Value:= edtGT1.Text;
          Parameters.ParamByName('N3').Value:= edtGT2.Text;
          Parameters.ParamByName('N4').Value:= edtGT3.Text;
          Parameters.ParamByName('N5').Value:= edtGT4.Text;
          Parameters.ParamByName('N6').Value:= edtGT5.Text;
          Parameters.ParamByName('N7').Value:= edtGT6.Text;
          Parameters.ParamByName('N8').Value:= edtGT7.Text;
          Parameters.ParamByName('N9').Value:= edtGT8.Text;
          Parameters.ParamByName('N10').Value:= edtGT9.Value;
          ExecSQL;
          dmTables.ADODB.CommitTrans;
        except
          on E: Exception do
          begin
            dmTables.ADODB.RollbackTrans;
            ExceptLogging('TfrmGracetime.btnSaveClick: ' + aString(E.Message));
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
          SQL.Add('Update Gracetime ');
          SQL.Add('Set GT1 = :N2, GT2 = :N3, GT3 = :N4, GT4 = :N5, ');
          SQL.Add('GT5 = :N6, GT6 = :N7, GT7 = :N8, GT8 = :N9, GT9 = :N10');
          SQL.Add('Where ParkNo = :N1');
          Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
          Parameters.ParamByName('N2').Value:= edtGT1.Text;
          Parameters.ParamByName('N3').Value:= edtGT2.Text;
          Parameters.ParamByName('N4').Value:= edtGT3.Text;
          Parameters.ParamByName('N5').Value:= edtGT4.Text;
          Parameters.ParamByName('N6').Value:= edtGT5.Text;
          Parameters.ParamByName('N7').Value:= edtGT6.Text;
          Parameters.ParamByName('N8').Value:= edtGT7.Text;
          Parameters.ParamByName('N9').Value:= edtGT8.Text;
          Parameters.ParamByName('N10').Value:= edtGT9.Value;
          ExecSQL;
          dmTables.ADODB.CommitTrans;
        except
          on E: Exception do
          begin
            dmTables.ADODB.RollbackTrans;
            ExceptLogging('TfrmGracetime.btnSaveClick: ' + aString(E.Message));
            ShowMessage('저장중 오류발생! 관리자에 문의바랍니다.');
          end;
        end;
      end;
      Close;
      SQL.Clear;
      SQL.Add('Select * from Gracetime');
      Open;

      frmClear;
    end;
  except
    on E: Exception do ExceptLogging('TfrmGracetime.btnSaveClick: ' + aString(E.Message));
  end;
end;

procedure TfrmGracetime.dgGracetimeClick(Sender: TObject);
begin
  try
    if qryGracetime.RecordCount > 0 then
      with qryGracetime do
      begin
        cmbParkNo.ItemIndex:= cmbParkNo.Items.IndexOf(IntToStr(FieldByName('ParkNo').AsInteger));
        edtGT1.Text:= FieldByName('GT1').AsString;
        edtGT2.Text:= FieldByName('GT2').AsString;
        edtGT3.Text:= FieldByName('GT3').AsString;
        edtGT4.Text:= FieldByName('GT4').AsString;
        edtGT5.Text:= FieldByName('GT5').AsString;
        edtGT6.Text:= FieldByName('GT6').AsString;
        edtGT7.Text:= FieldByName('GT7').AsString;
        edtGT8.Text:= FieldByName('GT8').AsString;
        edtGT9.Value:= FieldByName('GT9').AsInteger;

        cmbParkNo.Enabled:= False;
        btnCancel.Enabled:= True;
        btnDelete.Enabled:= True;

        nSelect:= 1;
      end;
  except
    on E: Exception do ExceptLogging('TfrmGracetime.dgHolidayClick: ' + aString(E.Message));
  end;
end;

procedure TfrmGracetime.FormShow(Sender: TObject);
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

    with qryGracetime do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from Gracetime');
      Open;
    end;
    frmClear;
  except
    on E: Exception do ExceptLogging('TfrmGracetime.FormShow: ' + aString(E.Message));
  end;
end;

procedure TfrmGracetime.frmClear;
begin
  try
    cmbParkNo.ItemIndex:= 0;
    edtGT1.Text:= '00:00';
    edtGT2.Text:= '00:00';
    edtGT3.Text:= '00:00';
    edtGT4.Text:= '23:59';
    edtGT5.Text:= '00:00';
    edtGT6.Text:= '00:00';
    edtGT7.Text:= '23:59';
    edtGT8.Text:= '00:00';
    edtGT9.Value:= 0;

    cmbParkNo.Enabled:= True;
    btnDelete.Enabled:= False;
    btnCancel.Enabled:= False;
    nSelect:= 0;
    cmbParkNo.SetFocus;
  except
    on E: Exception do ExceptLogging('TfrmGracetime.frmClear: ' + aString(E.Message));
  end;
end;

end.
