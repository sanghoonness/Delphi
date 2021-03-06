unit RFMaster;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Grids, ToolWin, Printers,
  DB, ADODB, BaseGrid, AdvGrid, DBAdvGrid, AdvPanel,
  AdvToolBtn, AdvAppStyler, Buttons, tmsAdvGridExcel, AdvObj, AdvEdit;

type
  TfrmRFMaster = class(TForm)
    Panel1: TPanel;
    pnl1: TPanel;
    StatusBar1: TStatusBar;
    btnClose: TBitBtn;
    qryRFMaster: TADOQuery;
    dsRFMaster: TDataSource;
    dg1: TDBAdvGrid;
    qryRFMasterRfData: TStringField;
    qryRFMasterRemark: TStringField;
    qryRFMasterReserve1: TStringField;
    btnModify: TBitBtn;
    btnDelete: TBitBtn;
    btnAllAdd: TBitBtn;
    btnAdd: TBitBtn;
    edtRFNo: TAdvEdit;
    edtRemark: TAdvEdit;
    edtReserve1: TAdvEdit;
    qryTemp: TADOQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    btnCancel: TBitBtn;
    procedure btnCloseClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure dg1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnModifyClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    procedure frmClear;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRFMaster: TfrmRFMaster;
  nSelect: Byte = 0; //0:Add, 1:Modify
  sPrvRFNo, sPrvRemark, sPrvReserve1: AnsiString;

implementation
uses
  Global, Tables;

{$R *.dfm}

procedure TfrmRFMaster.btnAddClick(Sender: TObject);
begin
  try
    if Length(MG_StrTrim(aString(edtRFNo.Text), ' ')) < 1 then
    begin
      ShowMessage('카드번호를 정확히 입력하여주세요!');
      edtRFNo.SetFocus;
      Exit;
    end;
    with dmTables.qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from RFMASTER where RfData = :N1 ');
      Parameters.ParamByName('N1').Value:= MG_StrTrim(edtRFNo.Text, ' ');
      Open;

      if RecordCount > 0 then
      begin
        ShowMessage('해당 차량에 대한 자료가 있습니다. 확인하여주세요!');
        frmClear;
        Exit;
      end;

      Close;
      SQL.Clear;
      SQL.Add('Insert into RFMASTER ');
      SQL.Add('(RfData, Remark, Reserve1) ');
      SQL.Add('Values (:N1, :N2, :N3)');
      Parameters.ParamByName('N1' ).Value:= edtRFNo.Text;
      Parameters.ParamByName('N2' ).Value:= edtRemark.Text;
      Parameters.ParamByName('N3' ).Value:= edtReserve1.Text;
      ExecSql;
      ExceptLogging('RF카드등록: ' + edtRFNo.Text);
      frmClear
    end;
  except
    on E: Exception do
    begin
      ExceptLogging('TfrmRFMaster.btnAddClick: ' + aString(E.Message));
    end;
  end;
end;

procedure TfrmRFMaster.btnCancelClick(Sender: TObject);
begin
  frmClear;
end;

procedure TfrmRFMaster.btnCloseClick(Sender: TObject);
begin
  qryRFMaster.Close ;
  Close;
end;

procedure TfrmRFMaster.btnDeleteClick(Sender: TObject);
begin
  try
    if MessageDlg('선택한 항목을 삭제할까요?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;

    with dmTables.qryTemp do
    begin
      try
        dmTables.ADODB.BeginTrans;
        Close;
        SQL.Clear;
        SQL.Add('Delete from RFMASTER where RfData = :N1 ');
        Parameters.ParamByName('N1').Value:= StrToInt(edtRFNo.Text);
        ExecSQL;
        dmTables.ADODB.CommitTrans;
      except
        on E: Exception do
        begin
          dmTables.ADODB.RollbackTrans;
          ExceptLogging('TfrmRFMaster.btnDeleteClick: ' + aString(E.Message));
          ShowMessage('삭제중 오류발생! 관리자에 문의바랍니다.');
        end;
      end;
    end;

    ExceptLogging('RF카드삭제: ' + edtRFNo.Text);
    frmClear;
  except
    on E: Exception do ExceptLogging('TfrmCustInfo.btnDeleteClick: ' + aString(E.Message));
  end;
end;

procedure TfrmRFMaster.btnModifyClick(Sender: TObject);
begin
  try
    if MessageDlg('다음 ' + sPrvRFNo + ' 항목을 변경할까요?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;

    with dmTables.qryTemp do
    begin
      try
        dmTables.ADODB.BeginTrans;
        Close;
        SQL.Clear;
        SQL.Add('Update RFMASTER ');
        SQL.Add('Set RfData = :N1, Remark = :N2, Reserve1 = :N3 ');
        SQL.Add('Where RfData = :N4 ');
        Parameters.ParamByName('N1' ).Value:= edtRFNo.Text;
        Parameters.ParamByName('N2' ).Value:= edtRemark.Text;
        Parameters.ParamByName('N3' ).Value:= edtReserve1.Text;
        Parameters.ParamByName('N4' ).Value:= sPrvRFNo;
        ExecSQL;
        dmTables.ADODB.CommitTrans;
      except
        on E: Exception do
        begin
          dmTables.ADODB.RollbackTrans;
          ExceptLogging('TfrmRFMaster.btnDeleteClick: ' + aString(E.Message));
          ShowMessage('삭제중 오류발생! 관리자에 문의바랍니다.');
        end;
      end;
    end;

    ExceptLogging('RF카드수정: ' + sPrvRFNo + ' ' + sPrvRemark +' ' + sPrvReserve1 + ' => ' + edtRFNo.Text + ' ' + edtRemark.Text + ' ' + edtReserve1.Text);
    frmClear;
  except
    on E: Exception do ExceptLogging('TfrmRFMaster.btnModifyClick: ' + aString(E.Message));
  end;
end;

procedure TfrmRFMaster.dg1Click(Sender: TObject);
begin
  if qryRFMaster.RecordCount <= 0 then
  Exit;
  with qryRFMaster do
  begin
    edtRFNo         .Text:= FieldByName('RfData').AsString;
    edtRemark       .Text:= FieldByName('Remark').AsString;
    edtReserve1     .Text:= FieldByName('Reserve1').AsString;
    sPrvRFNo             := FieldByName('RfData').AsString;
    sPrvRemark           := FieldByName('Remark').AsString;
    sPrvReserve1         := FieldByName('Reserve1').AsString;
  end;
  btnModify.Enabled:= True;
  btnDelete.Enabled:= True;
  btnCancel.Enabled:= True;
  nSelect:= 1;
end;

procedure TfrmRFMaster.FormShow(Sender: TObject);
begin
  frmClear;
end;

procedure TfrmRFMaster.frmClear;
begin
  try
    with qryRFMaster do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from RFMaster ');
      Open;
    end;
    sPrvRFNo     := '';
    sPrvRemark   := '';
    sPrvReserve1 := '';
    btnDelete.Enabled:= False;
    btnModify.Enabled:= False;
    btnCancel.Enabled:= False;
    nSelect:= 0;
  except
    on E: Exception do ExceptLogging('TfrmRFMaster.frmClear: ' + aString(E.Message));
  end;
end;

end.
