unit Restriction;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, AdvEdit,
  Vcl.Mask, AdvSpin, Data.DB, Vcl.Grids, AdvObj, BaseGrid, AdvGrid, DBAdvGrid,
  Data.Win.ADODB, Vcl.ExtCtrls, AdvPanel;

type
  TfrmRestriction = class(TForm)
    AdvPanel1: TAdvPanel;
    qryRestriction: TADOQuery;
    dsRestriction: TDataSource;
    dgRestriction: TDBAdvGrid;
    qryRestrictionRestrictionNo: TWordField;
    qryRestrictionRestrictionName: TStringField;
    qryRestrictionReserve1: TStringField;
    qryRestrictionReserve2: TStringField;
    qryRestrictionReserve3: TStringField;
    qryRestrictionReserve4: TStringField;
    qryRestrictionReserve5: TStringField;
    AdvPanel2: TAdvPanel;
    edtRestrictionNo: TAdvSpinEdit;
    edtRestrictionName: TAdvEdit;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    btnDelete: TBitBtn;
    btnClose: TBitBtn;
    qryTemp: TADOQuery;
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure dgRestrictionClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure frmClear;
    { Public declarations }
  end;

var
  frmRestriction: TfrmRestriction;
  nSelect: Byte = 0;  //Insert:0, Modify:1;

implementation
uses
  Tables, Global;

{$R *.dfm}

procedure TfrmRestriction.btnCancelClick(Sender: TObject);
begin
  frmClear;
end;

procedure TfrmRestriction.btnCloseClick(Sender: TObject);
begin
  qryRestriction.Close;
  Close;
end;

procedure TfrmRestriction.btnDeleteClick(Sender: TObject);
begin
  try
    if MessageDlg('������ ���ѱ�����ȣ�� �����ұ��?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;

    with qryRestriction do
    begin
      try
        dmTables.ADODB.BeginTrans;
        Close;
        SQL.Clear;
        SQL.Add('Delete from RestrictionInfo where RestrictionNo = :N1 ');
        Parameters.ParamByName('N1').Value:= edtRestrictionNo.Value;
        ExecSQL;
        dmTables.ADODB.CommitTrans;
      except
        on E: Exception do
        begin
          dmTables.ADODB.RollbackTrans;
          ExceptLogging('TfrmRestriction.btnDeleteClick: ' + aString(E.Message));
          ShowMessage('������ �����߻�! �����ڿ� ���ǹٶ��ϴ�.');
        end;
      end;

      Close;
      SQL.Clear;
      SQL.Add('Select * from RestrictionInfo');
      Open;
    end;
    frmClear;
  except
    on E: Exception do ExceptLogging('TfrmRestriction.btnDeleteClick: ' + aString(E.Message));
  end;
end;

procedure TfrmRestriction.btnSaveClick(Sender: TObject);
begin
  if edtRestrictionNo.Value = 0 then
  begin
    ShowMessage('����ȣ�� 1������ ������ �����մϴ�.');
    edtRestrictionNo.SetFocus;
    Exit;
  end;
  if edtRestrictionNo.Value = 1 then
  begin
    ShowMessage('����ȣ�� 1���� �⺻�����Դϴ� �ٸ� ��ȣ�� �������ּ���.');
    edtRestrictionNo.SetFocus;
    Exit;
  end;
  with qryTemp do
  begin
    if nSelect = 0 then
    begin
      //�߰�...
      with qryTemp do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select * from RestrictionInfo where RestrictionNo = :N1');
        Parameters.ParamByName('N1').Value:= edtRestrictionNo.Value;
        Open;

        if RecordCount > 0 then
        begin
          ShowMessage('�ش� ���ѱ�����ȣ�� �̹� ������Դϴ�.'#13#10 +
                      '���ѱ������θ� �����Ͽ��ּ���!');
          edtRestrictionNo.SetFocus;
          Exit;
        end;
      end;

      try
        dmTables.ADODB.BeginTrans;
        Close;
        SQL.Clear;
        SQL.Add('Insert RestrictionInfo ');
        SQL.Add('(RestrictionNo, RestrictionName) ');
        SQL.Add('Values (:pRestrictionNo, :pRestrictionName) ');
        Parameters.ParamByName('pRestrictionNo'  ).Value:= edtRestrictionNo.Value;
        Parameters.ParamByName('pRestrictionName'  ).Value:= edtRestrictionName.Text;

        ExecSQL;
        dmTables.ADODB.CommitTrans;
      except
        on E: Exception do
        begin
          dmTables.ADODB.RollbackTrans;
          ExceptLogging('TfrmRestriction.btnSaveClick: ' + aString(E.Message));
          ShowMessage('������ �����߻�! �����ڿ� ���ǹٶ��ϴ�.');
        end;
      end;
    end
    else
    if nSelect = 1 then
    begin
      //����...
      try
        dmTables.ADODB.BeginTrans;
        Close;
        SQL.Clear;
        SQL.Add('Update RestrictionInfo ');
        SQL.Add('Set RestrictionName = :pRestrictionName ');
        SQL.Add('Where RestrictionNo = :pRestrictionNo ');
        Parameters.ParamByName('pRestrictionNo').Value:= edtRestrictionNo.Value;
        Parameters.ParamByName('pRestrictionName').Value:= edtRestrictionName.Text;
        ExecSQL;
        dmTables.ADODB.CommitTrans;
      except
        on E: Exception do
        begin
          dmTables.ADODB.RollbackTrans;
          ExceptLogging('TfrmRestriction.btnSaveClick: ' + aString(E.Message));
          ShowMessage('������ �����߻�! �����ڿ� ���ǹٶ��ϴ�.');
        end;
      end;
    end;
  end;
  with qryRestriction do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * from RestrictionInfo');
    Open;

    frmClear;
  end;
end;

procedure TfrmRestriction.dgRestrictionClick(Sender: TObject);
begin
  if qryRestriction.RecordCount > 0 then
  with qryRestriction do
  begin
    edtRestrictionNo.Value:= FieldByName('RestrictionNo').AsInteger;
    edtRestrictionName.Text:= FieldByName('RestrictionName').AsString;
    edtRestrictionNo.Enabled:= False;
    btnCancel.Enabled:= True;
    btnDelete.Enabled:= True;
    nSelect:= 1;
  end;
end;

procedure TfrmRestriction.FormShow(Sender: TObject);
begin
  try
    with qryRestriction do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from RestrictionInfo Order By RestrictionNo');
      Open;
    end;
    frmClear;
  except
    on E: Exception do ExceptLogging('TfrmRestriction.FormShow: ' + aString(E.Message));
  end;
end;

procedure TfrmRestriction.frmClear;
begin
  edtRestrictionNo.Value := 1;
  edtRestrictionName.Text :='';
  nSelect                 := 0;
  btnDelete.Enabled:= False;
  btnCancel.Enabled:= False;
  nSelect:= 0;
  edtRestrictionNo.Enabled := True;
  edtRestrictionNo.SetFocus;
end;

end.
