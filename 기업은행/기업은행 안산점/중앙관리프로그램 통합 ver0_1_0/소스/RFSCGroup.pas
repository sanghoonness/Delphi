unit RFSCGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Mask, AdvSpin, StdCtrls, AdvCombo, AdvEdit, ExtCtrls,
  Buttons, Grids, BaseGrid, AdvGrid, DBAdvGrid, AdvObj;

type
  TfrmRFSCGroup = class(TForm)
    qry1: TADOQuery;
    qryGroup: TADOQuery;
    qryGroupParkNo: TSmallintField;
    qryGroupGroupNo: TWordField;
    qryGroupGroupName: TStringField;
    qryGroupAPB: TWordField;
    qryGroupStatus: TWordField;
    qryGroupRemark: TStringField;
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
    qryGroupReserve1: TStringField;
    qryGroupReserve2: TStringField;
    qryGroupReserve3: TStringField;
    qryGroupReserve4: TStringField;
    qryGroupReserve5: TStringField;
    dsGroup: TDataSource;
    dgGroup: TDBAdvGrid;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    btnDelete: TBitBtn;
    btnClose: TBitBtn;
    Panel1: TPanel;
    edtGroupName: TAdvEdit;
    edtRemark: TAdvEdit;
    cmbRF1: TAdvComboBox;
    cmbAPB: TAdvComboBox;
    cmbStatus: TAdvComboBox;
    edtGroupNo: TAdvSpinEdit;
    cmbRF2: TAdvComboBox;
    cmbRF3: TAdvComboBox;
    cmbRF4: TAdvComboBox;
    cmbRF5: TAdvComboBox;
    cmbRF6: TAdvComboBox;
    cmbRF7: TAdvComboBox;
    cmbRF8: TAdvComboBox;
    cmbRF9: TAdvComboBox;
    cmbRF10: TAdvComboBox;
    qryTemp: TADOQuery;
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure dgGroupClick(Sender: TObject);
    procedure qryGroupRF1GetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryGroupRF2GetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryGroupRF3GetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryGroupRF4GetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryGroupRF5GetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryGroupRF6GetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryGroupRF7GetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryGroupRF8GetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryGroupRF9GetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryGroupRF10GetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    { Private declarations }
    procedure frmClear;
  public
    { Public declarations }
  end;

var
  frmRFSCGroup: TfrmRFSCGroup;
  nSelect: Byte = 0; //0:Add, 1:Modify
  nPrvAPB, nPrvBlock: Integer; //수정전의 APB, 봉쇄의 ItemIndex 번호
  nGroupCnt: Integer;

implementation
uses
  Global, Tables;

{$R *.dfm}

procedure TfrmRFSCGroup.FormShow(Sender: TObject);
var
  i: Integer;
begin
  cmbRF1.Items.Clear;
  cmbRF1.Items.Add('출입불가');
  cmbRF2.Items.Clear;
  cmbRF2.Items.Add('출입불가');
  cmbRF3.Items.Clear;
  cmbRF3.Items.Add('출입불가');
  cmbRF4.Items.Clear;
  cmbRF4.Items.Add('출입불가');
  cmbRF5.Items.Clear;
  cmbRF5.Items.Add('출입불가');
  cmbRF6.Items.Clear;
  cmbRF6.Items.Add('출입불가');
  cmbRF7.Items.Clear;
  cmbRF7.Items.Add('출입불가');
  cmbRF8.Items.Clear;
  cmbRF8.Items.Add('출입불가');
  cmbRF9.Items.Clear;
  cmbRF9.Items.Add('출입불가');
  cmbRF10.Items.Clear;
  cmbRF10.Items.Add('출입불가');

  with qry1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * from ParkInfo');
    Open;
    if RecordCount <= 0 then
    begin
      edtGroupNo.Enabled:= False;
      edtGroupName.Enabled:= False;
      btnSave.Enabled:= False;
      ShowMessage('주차장을 먼저 설정하여주세요!');
      Exit;
    end;
  end;

  with qryTemp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * from UnitInfo where ParkNo = :N1 and (UnitKind = :N2 or UnitKind = :N3) ');
    SQL.Add('Order By UnitNo');
    Parameters.ParamByName('N1').Value:= nCurrParkNo;
    Parameters.ParamByName('N2').Value:= 14;
    Parameters.ParamByName('N3').Value:= 15;
    Open;

    if RecordCount > 0 then
    begin
      First;

      while Not Eof do
      begin
        cmbRF1.Items.Add(IntToStr(FieldByName('UnitNo').AsInteger));
        cmbRF2.Items.Add(IntToStr(FieldByName('UnitNo').AsInteger));
        cmbRF3.Items.Add(IntToStr(FieldByName('UnitNo').AsInteger));
        cmbRF4.Items.Add(IntToStr(FieldByName('UnitNo').AsInteger));
        cmbRF5.Items.Add(IntToStr(FieldByName('UnitNo').AsInteger));
        cmbRF6.Items.Add(IntToStr(FieldByName('UnitNo').AsInteger));
        cmbRF7.Items.Add(IntToStr(FieldByName('UnitNo').AsInteger));
        cmbRF8.Items.Add(IntToStr(FieldByName('UnitNo').AsInteger));
        cmbRF9.Items.Add(IntToStr(FieldByName('UnitNo').AsInteger));
        cmbRF10.Items.Add(IntToStr(FieldByName('UnitNo').AsInteger));
        Next;
      end;
    end;
    cmbRF1.ItemIndex:= 0;
    cmbRF2.ItemIndex:= 0;
    cmbRF3.ItemIndex:= 0;
    cmbRF4.ItemIndex:= 0;
    cmbRF5.ItemIndex:= 0;
    cmbRF6.ItemIndex:= 0;
    cmbRF7.ItemIndex:= 0;
    cmbRF8.ItemIndex:= 0;
    cmbRF9.ItemIndex:= 0;
    cmbRF10.ItemIndex:= 0;
  end;

  with qryGroup do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * from GGroup Where ParkNo = :N1 and Reserve1 = :N2');
    Parameters.ParamByName('N1').Value:= nCurrParkNo;
    Parameters.ParamByName('N2').Value:= 'RF전용';
    Open;
  end;
  frmClear;
end;

procedure TfrmRFSCGroup.frmClear;
begin
  try
    edtGroupNo  .Value:= 0;
    edtGroupName.Text:= '';
    cmbAPB      .ItemIndex:= 0;
    cmbStatus   .ItemIndex:= 0;
    edtRemark   .Text:= '';
    cmbRF1.ItemIndex:= 0;
    cmbRF2.ItemIndex:= 0;
    cmbRF3.ItemIndex:= 0;
    cmbRF4.ItemIndex:= 0;
    cmbRF5.ItemIndex:= 0;
    cmbRF6.ItemIndex:= 0;
    cmbRF7.ItemIndex:= 0;
    cmbRF8.ItemIndex:= 0;
    cmbRF9.ItemIndex:= 0;
    cmbRF10.ItemIndex:= 0;
    btnDelete.Enabled:= False;
    btnCancel.Enabled:= False;
    nSelect:= 0;
    edtGroupNo.SetFocus;
    dgGroup.ShowSelection:= False;
  except
    on E: Exception do ExceptLogging('TfrmRFSCGroup.frmClear: ' + E.Message);
  end;
end;

procedure TfrmRFSCGroup.qryGroupRF10GetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if qryGroupRF10.Value = 0 then
    Text:= '출입불가'
  else
    Text:= IntToStr(qryGroupRF10.Value) + '번RF허용';
end;

procedure TfrmRFSCGroup.qryGroupRF1GetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if qryGroupRF1.Value = 0 then
    Text:= '출입불가'
  else
    Text:= IntToStr(qryGroupRF1.Value) + '번RF허용';
end;

procedure TfrmRFSCGroup.qryGroupRF2GetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if qryGroupRF2.Value = 0 then
    Text:= '출입불가'
  else
    Text:= IntToStr(qryGroupRF2.Value) + '번RF허용';
end;

procedure TfrmRFSCGroup.qryGroupRF3GetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if qryGroupRF3.Value = 0 then
    Text:= '출입불가'
  else
    Text:= IntToStr(qryGroupRF3.Value) + '번RF허용';
end;

procedure TfrmRFSCGroup.qryGroupRF4GetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if qryGroupRF4.Value = 0 then
    Text:= '출입불가'
  else
    Text:= IntToStr(qryGroupRF4.Value) + '번RF허용';
end;

procedure TfrmRFSCGroup.qryGroupRF5GetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if qryGroupRF5.Value = 0 then
    Text:= '출입불가'
  else
    Text:= IntToStr(qryGroupRF5.Value) + '번RF허용';
end;

procedure TfrmRFSCGroup.qryGroupRF6GetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if qryGroupRF6.Value = 0 then
    Text:= '출입불가'
  else
    Text:= IntToStr(qryGroupRF6.Value) + '번RF허용';
end;

procedure TfrmRFSCGroup.qryGroupRF7GetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if qryGroupRF7.Value = 0 then
    Text:= '출입불가'
  else
    Text:= IntToStr(qryGroupRF7.Value) + '번RF허용';
end;

procedure TfrmRFSCGroup.qryGroupRF8GetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if qryGroupRF8.Value = 0 then
    Text:= '출입불가'
  else
    Text:= IntToStr(qryGroupRF8.Value) + '번RF허용';
end;

procedure TfrmRFSCGroup.qryGroupRF9GetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if qryGroupRF9.Value = 0 then
    Text:= '출입불가'
  else
    Text:= IntToStr(qryGroupRF9.Value) + '번RF허용';
end;

procedure TfrmRFSCGroup.btnCancelClick(Sender: TObject);
begin
  frmClear;
end;

procedure TfrmRFSCGroup.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmRFSCGroup.btnDeleteClick(Sender: TObject);
begin
  try
  try
    if MessageDlg('선택한 항목을 삭제할까요?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;

    with qryGroup do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Delete from GGroup where ParkNo = :N1 and Reserve1 = :N2 and GroupNo = :N3');
      Parameters.ParamByName('N1').Value:= nCurrParkNo;
      Parameters.ParamByName('N2').Value:= 'RF전용';
      Parameters.ParamByName('N3').Value:= edtGroupNo.Value;
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Add('Select * from GGroup where ParkNo = :N1 and Reserve1 = :N2');
      Parameters.ParamByName('N1').Value:= nCurrParkNo;
      Parameters.ParamByName('N2').Value:= 'RF전용';
      Open;
    end;
  except
    on E: Exception do ExceptLogging('TfrmRFSCGroup.btnDeleteClick: ' + E.Message);
  end;
  finally
    frmClear;
  end;
end;

procedure TfrmRFSCGroup.btnSaveClick(Sender: TObject);
begin
  try
  try
    Case nSelect of
      0: begin
           with qry1 do
           begin
             Close;
             SQL.Clear;
             SQL.Add('Select * from GGroup where ParkNo = :N1 and GroupNo = :N3');
             Parameters.ParamByName('N1').Value:= nCurrParkNo;
             Parameters.ParamByName('N3').Value:= edtGroupNo.Value;
             Open;

             if RecordCount > 0 then
             begin
               ShowMessage('해당 그룹에 대한 자료가 있습니다. 확인하여주세요!');
               edtGroupNo.SetFocus;
               Exit;
             end;
           end;

           with qryGroup do
           begin
             Close;
             SQL.Clear;
             SQL.Add('Insert into GGroup ');
             SQL.Add('(ParkNo, GroupNo, GroupName, APB, Status, Remark, ');
             SQL.Add('RF1, RF2, RF3, RF4, RF5, RF6, RF7, RF8, RF9, RF10, Reserve1) ');
             SQL.Add('Values (:N1, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, ');
             SQL.Add(':N11, :N12, :N13, :N14, :N15, :N16, :N17, :N18)');
             Parameters.ParamByName('N1' ).Value:= nCurrParkNo;
             Parameters.ParamByName('N3' ).Value:= edtGroupNo.Value;
             Parameters.ParamByName('N4' ).Value:= edtGroupName.Text;
             Parameters.ParamByName('N5' ).Value:= cmbAPB.ItemIndex + 1;
             Parameters.ParamByName('N6' ).Value:= cmbStatus.ItemIndex;
             Parameters.ParamByName('N7' ).Value:= edtRemark.Text;

             if cmbRF1.ItemIndex > 0 then
               Parameters.ParamByName('N8' ).Value:= StrToInt(cmbRF1.Text)
             else
               Parameters.ParamByName('N8' ).Value:= 0;

             if cmbRF2.ItemIndex > 0 then
               Parameters.ParamByName('N9' ).Value:= StrToInt(cmbRF2.Text)
             else
               Parameters.ParamByName('N9' ).Value:= 0;

             if cmbRF3.ItemIndex > 0 then
               Parameters.ParamByName('N10').Value:= StrToInt(cmbRF3.Text)
             else
               Parameters.ParamByName('N10').Value:= 0;

             if cmbRF4.ItemIndex > 0 then
               Parameters.ParamByName('N11').Value:= StrToInt(cmbRF4.Text)
             else
               Parameters.ParamByName('N11').Value:= 0;

             if cmbRF5.ItemIndex > 0 then
               Parameters.ParamByName('N12').Value:= StrToInt(cmbRF5.Text)
             else
               Parameters.ParamByName('N12').Value:= 0;

             if cmbRF6.ItemIndex > 0 then
               Parameters.ParamByName('N13').Value:= StrToInt(cmbRF6.Text)
             else
               Parameters.ParamByName('N13').Value:= 0;

             if cmbRF7.ItemIndex > 0 then
               Parameters.ParamByName('N14').Value:= StrToInt(cmbRF7.Text)
             else
               Parameters.ParamByName('N14').Value:= 0;

             if cmbRF8.ItemIndex > 0 then
               Parameters.ParamByName('N15').Value:= StrToInt(cmbRF8.Text)
             else
               Parameters.ParamByName('N15').Value:= 0;

             if cmbRF9.ItemIndex > 0 then
               Parameters.ParamByName('N16').Value:= StrToInt(cmbRF9.Text)
             else
               Parameters.ParamByName('N16').Value:= 0;

             if cmbRF10.ItemIndex > 0 then
               Parameters.ParamByName('N17').Value:= StrToInt(cmbRF10.Text)
             else
               Parameters.ParamByName('N17').Value:= 0;

             Parameters.ParamByName('N18').Value:= 'RF전용';
             ExecSql;
             Close;
             SQL.Clear;
             SQL.Add('Select * from GGroup where ParkNo = :N1 and Reserve1 = :N2');
             Parameters.ParamByName('N1').Value:= nCurrParkNo;
             Parameters.ParamByName('N2').Value:= 'RF전용';
             Open;
           end;
         end;

      1: begin
           with qryGroup do
           begin
             Close;
             SQL.Clear;
             SQL.Add('Update GGroup ');
             SQL.Add('Set GroupName = :N1, APB = :N2, Status = :N3, Remark = :N4,  ');
             SQL.Add('RF1 = :N8, RF2 = :N9, RF3 = :N10, RF4 = :N11, RF5 = :N12, ');
             SQL.Add('RF6 = :N13, RF7 = :N14, RF8 = :N15, RF9 = :N16, RF10 = :N17 ');
             SQL.Add('Where ParkNo = :N5 and Reserve1 = :N6 and GroupNo = :N7');
             Parameters.ParamByName('N1').Value:= edtGroupName.Text;
             Parameters.ParamByName('N2').Value:= cmbApb.ItemIndex+1;
             Parameters.ParamByName('N3').Value:= cmbStatus.ItemIndex;
             Parameters.ParamByName('N4').Value:= edtRemark.Text;
             Parameters.ParamByName('N5').Value:= nCurrParkNo;
             Parameters.ParamByName('N6').Value:= 'RF전용';
             Parameters.ParamByName('N7').Value:= edtGroupNo.Value;

             if cmbRF1.ItemIndex > 0 then
               Parameters.ParamByName('N8' ).Value:= StrToInt(cmbRF1.Text)
             else
               Parameters.ParamByName('N8' ).Value:= 0;

             if cmbRF2.ItemIndex > 0 then
               Parameters.ParamByName('N9' ).Value:= StrToInt(cmbRF2.Text)
             else
               Parameters.ParamByName('N9' ).Value:= 0;

             if cmbRF3.ItemIndex > 0 then
               Parameters.ParamByName('N10').Value:= StrToInt(cmbRF3.Text)
             else
               Parameters.ParamByName('N10').Value:= 0;

             if cmbRF4.ItemIndex > 0 then
               Parameters.ParamByName('N11').Value:= StrToInt(cmbRF4.Text)
             else
               Parameters.ParamByName('N11').Value:= 0;

             if cmbRF5.ItemIndex > 0 then
               Parameters.ParamByName('N12').Value:= StrToInt(cmbRF5.Text)
             else
               Parameters.ParamByName('N12').Value:= 0;

             if cmbRF6.ItemIndex > 0 then
               Parameters.ParamByName('N13').Value:= StrToInt(cmbRF6.Text)
             else
               Parameters.ParamByName('N13').Value:= 0;

             if cmbRF7.ItemIndex > 0 then
               Parameters.ParamByName('N14').Value:= StrToInt(cmbRF7.Text)
             else
               Parameters.ParamByName('N14').Value:= 0;

             if cmbRF8.ItemIndex > 0 then
               Parameters.ParamByName('N15').Value:= StrToInt(cmbRF8.Text)
             else
               Parameters.ParamByName('N15').Value:= 0;

             if cmbRF9.ItemIndex > 0 then
               Parameters.ParamByName('N16').Value:= StrToInt(cmbRF9.Text)
             else
               Parameters.ParamByName('N16').Value:= 0;

             if cmbRF10.ItemIndex > 0 then
               Parameters.ParamByName('N17').Value:= StrToInt(cmbRF10.Text)
             else
               Parameters.ParamByName('N17').Value:= 0;
             ExecSql;
             Close;
             SQL.Clear;
             SQL.Add('Select * from GGroup where ParkNo = :N1 and Reserve1 = :N2');
             Parameters.ParamByName('N1').Value:= nCurrParkNo;
             Parameters.ParamByName('N2').Value:= 'RF전용';
             Open;
           end;

           if nPrvAPB <> cmbAPB.ItemIndex then
           begin
             with qry1 do
             begin
               Close;
               SQL.Clear;
               SQL.Add('Update CustInfo ');
               SQL.Add('Set APB = :N1 Where ParkNo = :N2 and GroupNo = :N3');
               Parameters.ParamByName('N1').Value:= cmbAPB.ItemIndex + 1;
               Parameters.ParamByName('N2').Value:= nCurrParkNo;
               Parameters.ParamByName('N3').Value:= edtGroupNo.Value;
               ExecSQL;
             end;
           end;

           if nPrvBlock <> cmbStatus.ItemIndex then
           begin
             with qry1 do
             begin
               Close;
               SQL.Clear;
               SQL.Add('Update CustInfo ');
               SQL.Add('Set Status = :N1 Where ParkNo = :N2 and GroupNo = :N3');

               if cmbStatus.ItemIndex = 0 then Parameters.ParamByName('N1').Value := 1
               else                            Parameters.ParamByName('N1').Value := cmbStatus.ItemIndex+2;

               Parameters.ParamByName('N2').Value:= nCurrParkNo;
               Parameters.ParamByName('N3').Value:= edtGroupNo.Value;
               ExecSQL;
             end;
           end;
         end;
    end;
  except
    on E: Exception do ExceptLogging('TfrmRFSCGroup.btnSaveClick: ' + E.Message);
  end;
  finally
    frmClear;
  end;
end;

procedure TfrmRFSCGroup.dgGroupClick(Sender: TObject);
begin
  try
    with qry1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from GGroup where Reserve1 = :N2');
      Parameters.ParamByName('N2').Value := 'RF전용';
      Open;
      if RecordCount <= 0 then Exit;
    end;
    dgGroup.ShowSelection:= True;

    with qryGroup do
    begin
      edtGroupNo  .Value := FieldByName('GroupNo').AsInteger;
      edtGroupName.Text  := FieldByName('GroupName').AsString;
      cmbAPB.ItemIndex   := FieldByName('APB').AsInteger-1;
      cmbStatus.ItemIndex:= FieldByName('Status').AsInteger;
      edtRemark   .Text  := FieldByName('Remark').AsString;
      nPrvAPB            := FieldByName('APB').AsInteger-1;
      nPrvBlock          := FieldByName('Status').AsInteger;

      if FieldByName('RF1').AsInteger = 0 then
        cmbRF1.ItemIndex:= 0
      else
      if FieldByName('RF1').AsInteger > 0 then
        cmbRF1.ItemIndex:= cmbRF1.Items.IndexOf(IntToStr(FieldByName('RF1').AsInteger));

      if FieldByName('RF2').AsInteger = 0 then
        cmbRF2.ItemIndex:= 0
      else
      if FieldByName('RF2').AsInteger > 0 then
        cmbRF2.ItemIndex:= cmbRF2.Items.IndexOf(IntToStr(FieldByName('RF2').AsInteger));

      if FieldByName('RF3').AsInteger = 0 then
        cmbRF3.ItemIndex:= 0
      else
      if FieldByName('RF3').AsInteger > 0 then
        cmbRF3.ItemIndex:= cmbRF3.Items.IndexOf(IntToStr(FieldByName('RF3').AsInteger));

      if FieldByName('RF4').AsInteger = 0 then
        cmbRF4.ItemIndex:= 0
      else
      if FieldByName('RF4').AsInteger > 0 then
        cmbRF4.ItemIndex:= cmbRF4.Items.IndexOf(IntToStr(FieldByName('RF4').AsInteger));

      if FieldByName('RF5').AsInteger = 0 then
        cmbRF5.ItemIndex:= 0
      else
      if FieldByName('RF5').AsInteger > 0 then
        cmbRF5.ItemIndex:= cmbRF5.Items.IndexOf(IntToStr(FieldByName('RF5').AsInteger));

      if FieldByName('RF6').AsInteger = 0 then
        cmbRF6.ItemIndex:= 0
      else
      if FieldByName('RF6').AsInteger > 0 then
        cmbRF6.ItemIndex:= cmbRF6.Items.IndexOf(IntToStr(FieldByName('RF6').AsInteger));

      if FieldByName('RF7').AsInteger = 0 then
        cmbRF7.ItemIndex:= 0
      else
      if FieldByName('RF7').AsInteger > 0 then
        cmbRF7.ItemIndex:= cmbRF7.Items.IndexOf(IntToStr(FieldByName('RF7').AsInteger));

      if FieldByName('RF8').AsInteger = 0 then
        cmbRF8.ItemIndex:= 0
      else
      if FieldByName('RF8').AsInteger > 0 then
        cmbRF8.ItemIndex:= cmbRF8.Items.IndexOf(IntToStr(FieldByName('RF8').AsInteger));

      if FieldByName('RF9').AsInteger = 0 then
        cmbRF9.ItemIndex:= 0
      else
      if FieldByName('RF9').AsInteger > 0 then
        cmbRF9.ItemIndex:= cmbRF9.Items.IndexOf(IntToStr(FieldByName('RF9').AsInteger));

      if FieldByName('RF10').AsInteger = 0 then
        cmbRF10.ItemIndex:= 0
      else
      if FieldByName('RF10').AsInteger > 0 then
        cmbRF10.ItemIndex:= cmbRF10.Items.IndexOf(IntToStr(FieldByName('RF10').AsInteger));
    end;
    btnCancel.Enabled:= True;
    btnDelete.Enabled:= True;
    nSelect:= 1;
  except
    on E: Exception do ExceptLogging('TfrmRFSCGroup.dgGroupClick: ' + E.Message);
  end;
end;

end.
