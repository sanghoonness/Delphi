unit FeeItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, DB, ADODB, StdCtrls, Buttons, AdvCombo, Mask,
  AdvSpin, AdvEdit, Grids, BaseGrid, AdvGrid, DBAdvGrid, AdvObj;

type
  TfrmFeeItem = class(TForm)
    qryFeeItem: TADOQuery;
    qryFeeItemParkNo: TSmallintField;
    qryFeeItemFeeNo: TWordField;
    qryFeeItemFeeName: TStringField;
    qryFeeItemItemMax: TIntegerField;
    qryFeeItemTotMax: TIntegerField;
    qryFeeItemReserve1: TStringField;
    qryFeeItemReserve2: TStringField;
    qryFeeItemReserve3: TStringField;
    qryFeeItemReserve4: TStringField;
    qryFeeItemReserve5: TStringField;
    dsFeeItem: TDataSource;
    AdvPanel1: TAdvPanel;
    AdvPanel2: TAdvPanel;
    dgFeeItem: TDBAdvGrid;
    edtFeeName: TAdvEdit;
    edtItemMax: TAdvSpinEdit;
    edtFeeNO: TAdvSpinEdit;
    cmbParkNo: TAdvComboBox;
    edtTotMax: TAdvSpinEdit;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    btnDelete: TBitBtn;
    btnClose: TBitBtn;
    qryTemp: TADOQuery;
    edtSaturdayMax: TAdvSpinEdit;
    edtHolidayMax: TAdvSpinEdit;
    qryFeeItemSaturdayMax: TIntegerField;
    qryFeeItemHolidayMax: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure dgFeeItemClick(Sender: TObject);
  private
    { Private declarations }
    procedure frmClear;
  public
    { Public declarations }
  end;

var
  frmFeeItem: TfrmFeeItem;
  nSelect: Byte = 0;  //Insert:0, Modify:1;

implementation
uses
  Tables, Global;

{$R *.dfm}

procedure TfrmFeeItem.frmClear;
begin
  try
    cmbParkNo.ItemIndex:= 0;
    edtFeeNo.Value:= 0;
    edtFeeName.Text:= '';
    edtItemMax.Value:= 0;
    edtSaturdayMax.Value:= 0;
    edtHolidayMax.Value:= 0;
    edtTotMax.Value:= 0;

    cmbParkNo.Enabled:= True;
    edtFeeNo.Enabled:= True;
    btnDelete.Enabled:= False;
    btnCancel.Enabled:= False;
    nSelect:= 0;
    cmbParkNo.SetFocus;
  except
    on E: Exception do ExceptLogging('TfrmFeeItem.frmClear: ' + aString(E.Message));
  end;
end;

procedure TfrmFeeItem.btnCancelClick(Sender: TObject);
begin
  frmClear;
end;

procedure TfrmFeeItem.btnCloseClick(Sender: TObject);
begin
  qryFeeItem.Close;
  Close;
end;

procedure TfrmFeeItem.btnDeleteClick(Sender: TObject);
begin
  try
    if MessageDlg('선택한 요금종류를 삭제할까요?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;

    with qryFeeItem do
    begin
      try
        dmTables.ADODB.BeginTrans;
        Close;
        SQL.Clear;
        SQL.Add('Delete from FeeItem where ParkNo = :N1 and FeeNo = :N2');
        Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
        Parameters.ParamByName('N2').Value:= edtFeeNo.Value;
        ExecSQL;
        dmTables.ADODB.CommitTrans;
      except
        on E: Exception do
        begin
          dmTables.ADODB.RollbackTrans;
          ExceptLogging('TfrmFeeItem.btnDeleteClick: ' + aString(E.Message));
          ShowMessage('삭제중 오류발생! 관리자에 문의바랍니다.');
        end;
      end;

      Close;
      SQL.Clear;
      SQL.Add('Select * from FeeItem');
      Open;
    end;
    frmClear;
  except
    on E: Exception do ExceptLogging('TfrmFeeItem.btnDeleteClick: ' + aString(E.Message));
  end;
end;

procedure TfrmFeeItem.btnSaveClick(Sender: TObject);
begin
  try
    if edtFeeNo.Value = 0 then
    begin
      ShowMessage('요금항목번호는 1번부터 저장이 가능합니다.');
      edtFeeNo.SetFocus;
      Exit;
    end;

    with qryFeeItem do
    begin
      if nSelect = 0 then
      begin
        //추가...
        with qryTemp do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Select * from FeeItem where ParkNo = :N1 and FeeNo = :N2');
          Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
          Parameters.ParamByName('N2').Value:= edtFeeNo.Value;
          Open;

          if RecordCount > 0 then
          begin
            ShowMessage('해당 요금항목번호가 이미 사용중입니다.'#13#10 +
                        '요금번호를 변경하여주세요!');
            edtFeeNo.SetFocus;
            Exit;
          end;
        end;

        try
          dmTables.ADODB.BeginTrans;
          Close;
          SQL.Clear;
          SQL.Add('Insert FeeItem ');
          SQL.Add('(ParkNo, FeeNo, FeeName, ItemMax, TotMax, SaturdayMax, HolidayMax) ');
          SQL.Add('Values (:pParkNo, :pFeeNo, :pFeeName, :pItemMax, :pTotMax, :pSaturdayMax, :pHolidayMax) ');
          Parameters.ParamByName('pParkNo'     ).Value:= StrToInt(cmbParkNo.Text);
          Parameters.ParamByName('pFeeNo'      ).Value:= edtFeeNo.Value;
          Parameters.ParamByName('pFeeName'    ).Value:= edtFeeName.Text;
          Parameters.ParamByName('pItemMax'    ).Value:= edtItemMax.Value;
          Parameters.ParamByName('pTotMax'     ).Value:= edtTotMax.Value;
          Parameters.ParamByName('pSaturdayMax').Value:= edtSaturdayMax.Value;
          Parameters.ParamByName('pHolidayMax' ).Value:= edtHolidayMax.Value;
          ExecSQL;
          dmTables.ADODB.CommitTrans;
        except
          on E: Exception do
          begin
            dmTables.ADODB.RollbackTrans;
            ExceptLogging('TfrmFeeItem.btnSaveClick: ' + aString(E.Message));
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
          SQL.Add('Update FeeItem ');
          SQL.Add('Set FeeName = :pFeeName, ItemMax = :pItemMax, TotMax = :pTotMax, ');
          SQL.Add('SaturdayMax = :pSaturdayMax, HolidayMax = :pHolidayMax ');
          SQL.Add('Where ParkNo = :pParkNo and FeeNo = :pFeeNo');
          Parameters.ParamByName('pFeeName').Value:= edtFeeName.Text;
          Parameters.ParamByName('pItemMax').Value:= edtItemMax.Value;
          Parameters.ParamByName('pTotMax' ).Value:= edtTotMax.Value;
          Parameters.ParamByName('pParkNo' ).Value:= StrToInt(cmbParkNo.Text);
          Parameters.ParamByName('pFeeNo'  ).Value:= edtFeeNo.Value;
          Parameters.ParamByName('pSaturdayMax').Value:= edtSaturdayMax.Value;
          Parameters.ParamByName('pHolidayMax' ).Value:= edtHolidayMax.Value;
          ExecSQL;
          dmTables.ADODB.CommitTrans;
        except
          on E: Exception do
          begin
            dmTables.ADODB.RollbackTrans;
            ExceptLogging('TfrmFeeItem.btnSaveClick: ' + aString(E.Message));
            ShowMessage('저장중 오류발생! 관리자에 문의바랍니다.');
          end;
        end;
      end;
      Close;
      SQL.Clear;
      SQL.Add('Select * from FeeItem');
      Open;

      frmClear;
    end;
  except
    on E: Exception do ExceptLogging('TfrmFeeItem.btnSaveClick: ' + aString(E.Message));
  end;
end;

procedure TfrmFeeItem.dgFeeItemClick(Sender: TObject);
begin
  try
    if qryFeeItem.RecordCount > 0 then
      with qryFeeItem do
      begin
        cmbParkNo.ItemIndex:= cmbParkNo.Items.IndexOf(IntToStr(FieldByName('ParkNo').AsInteger));
        edtFeeNo.Value:= FieldByName('FeeNo').AsInteger;
        edtFeeName.Text:= FieldByName('FeeName').AsString;
        edtItemMax.Value:= FieldByName('ItemMax').AsInteger;
        edtSaturdayMax.Value:= FieldByName('SaturdayMax').AsInteger;
        edtHolidayMax.Value:= FieldByName('HolidayMax').AsInteger;
        edtTotMax.Value:= FieldByName('TotMax').AsInteger;

        cmbParkNo.Enabled:= False;
        edtFeeNo.Enabled:= False;
        btnCancel.Enabled:= True;
        btnDelete.Enabled:= True;

        nSelect:= 1;
      end;
  except
    on E: Exception do ExceptLogging('TfrmFeeItem.dgFeeItemClick: ' + aString(E.Message));
  end;
end;

procedure TfrmFeeItem.FormShow(Sender: TObject);
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

    with qryFeeItem do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from FeeItem');
      Open;
    end;
    frmClear;
  except
    on E: Exception do ExceptLogging('TfrmFeeItem.FormShow: ' + aString(E.Message));
  end;
end;

end.
