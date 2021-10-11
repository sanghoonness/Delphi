unit DCInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, DB, ADODB, StdCtrls, AdvCombo, Mask, AdvSpin,
  AdvEdit, Grids, BaseGrid, AdvGrid, DBAdvGrid, Buttons, AdvObj;

type
  TfrmDCInfo = class(TForm)
    AdvPanel1: TAdvPanel;
    qryDCInfo: TADOQuery;
    qryDCInfoParkNo: TSmallintField;
    qryDCInfoDCNo: TWordField;
    qryDCInfoDCName: TStringField;
    qryDCInfoDCValue: TIntegerField;
    qryDCInfoDCType: TWordField;
    qryDCInfoReserve1: TStringField;
    qryDCInfoReserve2: TStringField;
    qryDCInfoReserve3: TStringField;
    qryDCInfoReserve4: TStringField;
    qryDCInfoReserve5: TStringField;
    dsDCInfo: TDataSource;
    qryDCInfoDCUseCnt: TWordField;
    AdvPanel2: TAdvPanel;
    edtDCName: TAdvEdit;
    edtDCValue: TAdvSpinEdit;
    edtDCNo: TAdvSpinEdit;
    cmbDCType: TAdvComboBox;
    cmbParkNo: TAdvComboBox;
    edtDCUseCnt: TAdvSpinEdit;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    btnDelete: TBitBtn;
    btnClose: TBitBtn;
    dgDCInfo: TDBAdvGrid;
    qryTemp: TADOQuery;
    procedure qryDCInfoDCTypeGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryDCInfoDCUseCntGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure dgDCInfoClick(Sender: TObject);
  private
    { Private declarations }
    procedure frmClear;
  public
    { Public declarations }
  end;

var
  frmDCInfo: TfrmDCInfo;
  nSelect: Byte = 0;  //Insert:0, Modify:1;

implementation
uses
  Tables, Global;

{$R *.dfm}

procedure TfrmDCInfo.btnCancelClick(Sender: TObject);
begin
  frmClear;
end;

procedure TfrmDCInfo.btnCloseClick(Sender: TObject);
begin
  qryTemp.Close;
  qryDCInfo.Close;
  Close;
end;

procedure TfrmDCInfo.btnDeleteClick(Sender: TObject);
begin
  try
    if MessageDlg('선택한 할인종류를 삭제할까요?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;

    with qryDCInfo do
    begin
      try
        dmTables.ADODB.BeginTrans;
        Close;
        SQL.Clear;
        SQL.Add('Delete from DCInfo where ParkNo = :N1 and DCNo = :N2');
        Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
        Parameters.ParamByName('N2').Value:= edtDCNo.Value;
        ExecSQL;
        dmTables.ADODB.CommitTrans;
      except
        on E: Exception do
        begin
          dmTables.ADODB.RollbackTrans;
          ExceptLogging('TfrmDCInfo.btnDeleteClick: ' + aString(E.Message));
          ShowMessage('삭제중 오류발생! 관리자에 문의바랍니다.');
        end;
      end;

      Close;
      SQL.Clear;
      SQL.Add('Select * from DCInfo');
      Open;
    end;
    frmClear;
  except
    on E: Exception do ExceptLogging('TfrmDCInfo.btnDeleteClick: ' + aString(E.Message));
  end;
end;

procedure TfrmDCInfo.btnSaveClick(Sender: TObject);
begin
  try
    if edtDCNo.Value = 0 then
    begin
      ShowMessage('할인번호는 1번부터 저장이 가능합니다.');
      edtDCNo.SetFocus;
      Exit;
    end;

    with qryDCInfo do
    begin
      if nSelect = 0 then
      begin
        //추가...
        with qryTemp do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Select * from DCInfo where ParkNo = :N1 and DCNo = :N2');
          Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
          Parameters.ParamByName('N2').Value:= edtDCNo.Value;
          Open;

          if RecordCount > 0 then
          begin
            ShowMessage('해당 할인번호가 이미 사용중입니다.'#13#10 +
                        '할인번호를 변경하여주세요!');
            edtDCNo.SetFocus;
            Exit;
          end;
        end;

        try
          dmTables.ADODB.BeginTrans;
          Close;
          SQL.Clear;
          SQL.Add('Insert DCInfo ');
          SQL.Add('(ParkNo, DCNo, DCName, DCValue, DCType, DCUseCnt) ');
          SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6) ');
          Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
          Parameters.ParamByName('N2').Value:= edtDCNo.Value;
          Parameters.ParamByName('N3').Value:= edtDCName.Text;
          Parameters.ParamByName('N4').Value:= edtDCValue.Value;
          Parameters.ParamByName('N5').Value:= cmbDCType.ItemIndex;
          Parameters.ParamByName('N6').Value:= edtDCUseCnt.Value;
          ExecSQL;
          dmTables.ADODB.CommitTrans;
        except
          on E: Exception do
          begin
            dmTables.ADODB.RollbackTrans;
            ExceptLogging('TfrmDCInfo.btnSaveClick: ' + aString(E.Message));
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
          SQL.Add('Update DCInfo ');
          SQL.Add('Set DCName = :N3, DCValue = :N4, DCType = :N5, DCUseCnt = :N6 ');
          SQL.Add('Where ParkNo = :N1 and DCNo = :N2');
          Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
          Parameters.ParamByName('N2').Value:= edtDCNo.Value;
          Parameters.ParamByName('N3').Value:= edtDCName.Text;
          Parameters.ParamByName('N4').Value:= edtDCValue.Value;
          Parameters.ParamByName('N5').Value:= cmbDCType.ItemIndex;
          Parameters.ParamByName('N6').Value:= edtDCUseCnt.Value;
          ExecSQL;
          dmTables.ADODB.CommitTrans;
        except
          on E: Exception do
          begin
            dmTables.ADODB.RollbackTrans;
            ExceptLogging('TfrmDCInfo.btnSaveClick: ' + aString(E.Message));
            ShowMessage('저장중 오류발생! 관리자에 문의바랍니다.');
          end;
        end;
      end;
      Close;
      SQL.Clear;
      SQL.Add('Select * from DCInfo');
      Open;

      frmClear;
    end;
  except
    on E: Exception do ExceptLogging('TfrmDCInfo.btnSaveClick: ' + aString(E.Message));
  end;
end;

procedure TfrmDCInfo.dgDCInfoClick(Sender: TObject);
begin
  try
    if qryDCInfo.RecordCount > 0 then
      with qryDCInfo do
      begin
        cmbParkNo.ItemIndex:= cmbParkNo.Items.IndexOf(IntToStr(FieldByName('ParkNo').AsInteger));
        edtDCNo.Value:= FieldByName('DCNo').AsInteger;
        edtDCName.Text:= FieldByName('DCName').AsString;
        edtDCValue.Value:= FieldByName('DCValue').AsInteger;
        cmbDCType.ItemIndex:= FieldByName('DCType').AsInteger;
        edtDCUseCnt.Value:= FieldByName('DCUseCnt').AsInteger;

        cmbParkNo.Enabled:= False;
        edtDCNo.Enabled:= False;
        btnCancel.Enabled:= True;
        btnDelete.Enabled:= True;

        nSelect:= 1;
      end;
  except
    on E: Exception do ExceptLogging('TfrmDCInfo.dgFeeItemClick: ' + aString(E.Message));
  end;
end;

procedure TfrmDCInfo.FormShow(Sender: TObject);
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

    with qryDCInfo do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from DCInfo');
      Open;
    end;
    frmClear;
  except
    on E: Exception do ExceptLogging('TfrmDCInfo.FormShow: ' + aString(E.Message));
  end;
end;

procedure TfrmDCInfo.frmClear;
begin
  try
    cmbParkNo.ItemIndex:= 0;
    edtDCNo.Value:= 0;
    edtDCName.Text:= '';
    edtDCValue.Value:= 0;
    cmbDCType.ItemIndex:= 0;
    edtDCUseCnt.Value:= 0;

    cmbParkNo.Enabled:= True;
    edtDCNo.Enabled:= True;
    btnDelete.Enabled:= False;
    btnCancel.Enabled:= False;
    nSelect:= 0;
    cmbParkNo.SetFocus;
  except
    on E: Exception do ExceptLogging('TfrmDCInfo.frmClear: ' + aString(E.Message));
  end;
end;

procedure TfrmDCInfo.qryDCInfoDCTypeGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Case qryDCInfoDCType.Value of
    0: Text:= '금액할인';
    1: Text:= '시간할인';
    2: Text:= '퍼센트할인';
  end;
end;

procedure TfrmDCInfo.qryDCInfoDCUseCntGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Case qryDCInfoDCUseCnt.Value of
    0: Text:= '제한없음';
    else
      Text:= IntToStr(qryDCInfoDCUseCnt.Value) + '회';
  end;
end;

end.
