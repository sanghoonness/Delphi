unit CardAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvToolBtn, StdCtrls, Grids, DBGrids, ExtCtrls,
  AdvCombo, AdvEdit, BaseGrid, AdvGrid, DBAdvGrid, AdvSmoothPanel,
  AdvGlowButton, AdvPanel, AdvAppStyler, DB, ADODB, AdvObj;

type
  TfrmCardAdd = class(TForm)
    ps1: TAdvPanelStyler;
    fs1: TAdvFormStyler;
    as1: TAdvAppStyler;
    AdvPanel1: TAdvPanel;
    btnAdd: TAdvGlowButton;
    btnModify: TAdvGlowButton;
    btnDelete: TAdvGlowButton;
    btnSave: TAdvGlowButton;
    btnCancel: TAdvGlowButton;
    btnClose: TAdvGlowButton;
    btnSeek: TAdvGlowButton;
    AdvSmoothPanel1: TAdvSmoothPanel;
    DBGrid1: TDBAdvGrid;
    AdvSmoothPanel2: TAdvSmoothPanel;
    edtTKNo: TAdvEdit;
    edtMarkNo: TAdvEdit;
    cmbStatus: TAdvComboBox;
    qryTagList: TADOQuery;
    qryTagListParkNo: TSmallintField;
    qryTagListTKNo: TStringField;
    qryTagListMarkNo: TStringField;
    qryTagListUseFlag: TWordField;
    qryTagListRegDate: TStringField;
    qryTagListIssueDate: TStringField;
    qryTagListReturnDate: TStringField;
    qryTagListReserve1: TStringField;
    qryTagListReserve2: TStringField;
    qryTagListReserve3: TStringField;
    qryTagListReserve4: TStringField;
    qryTagListReserve5: TStringField;
    dsTagList: TDataSource;
    qryTemp: TADOQuery;
    procedure btnAddClick(Sender: TObject);
    procedure btnModifyClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnSeekClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure edtTKNoExit(Sender: TObject);
    procedure qryTagListUseFlagGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    { Private declarations }
    procedure EnableProc(bEnable: Boolean);
  public
    { Public declarations }
  end;

var
  frmCardAdd: TfrmCardAdd;
  nSelect: Byte = 0;  //0: None, 1:Add, 2:Modify

implementation
uses
  Tables, Global;

{$R *.dfm}

procedure TfrmCardAdd.EnableProc(bEnable: Boolean);
begin
  try
    edtTKNo.Enabled:= bEnable;
    edtMarkNo.Enabled:= bEnable;
    cmbStatus.Enabled:= bEnable;

    if not bEnable then
    begin
      edtTKNo.Text:= '';
      edtMarkNo.Text:= '';
      cmbStatus.ItemIndex:= 0;
    end;
  except
    on E: Exception do ExceptLogging('TfrmCardAdd.EnableProc: ' + E.Message);
  end;
end;

procedure TfrmCardAdd.btnAddClick(Sender: TObject);
begin
  try
    EnableProc(True);
    btnSeek  .Enabled:= False;
    btnAdd   .Enabled:= False;
    btnModify.Enabled:= False;
    btnDelete.Enabled:= False;
    btnClose .Enabled:= False;
    btnSave  .Enabled:= True;
    btnCancel.Enabled:= True;
    cmbStatus.Enabled:= False;
    edtTKNo.SetFocus;
    nSelect:= 1;
  except
    on E: Exception do ExceptLogging('TfrmCardAdd.btnAddClick: ' + E.Message);
  end;
end;

procedure TfrmCardAdd.btnModifyClick(Sender: TObject);
begin
  EnableProc(True);
  btnSeek.Enabled:= False;
  edtTkNo  .Enabled:= False;
  edtMarkNo.Enabled:= False;
  btnModify.Enabled:= False;
  btnDelete.Enabled:= False;
  btnSave  .Enabled:= True;
  btnCancel.Enabled:= True;
  cmbStatus.SetFocus;
  nSelect:= 2;
end;

procedure TfrmCardAdd.btnCancelClick(Sender: TObject);
begin
  EnableProc(False);
  btnSeek.Enabled:= True;
  btnAdd   .Enabled:= True;
  btnClose .Enabled:= True;
  btnModify.Enabled:= False;
  btnSave  .Enabled:= False;
  btnCancel.Enabled:= False;
  btnDelete.Enabled:= False;
  nSelect:= 0;
end;

procedure TfrmCardAdd.btnDeleteClick(Sender: TObject);
begin
  try
  try
    if MessageDlg('선택한 항목을 삭제할까요?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;

    with qryTagList do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Delete from TagList where TKNo = :N1');
      Parameters.ParamByName('N1').Value:= edtTKNo.Text;
      ExecSQL;

      Close;
      SQL.Clear;
      SQL.Add('Select * from TagList Order By TKNo');
      Open;
    end;
  except
    on E: Exception do ExceptLogging('TfrmCardAdd.btnDeleteClick: ' + E.Message);
  end;
  finally
    EnableProc(False);
    btnAdd   .Enabled:= True;
    btnClose .Enabled:= True;
    btnModify.Enabled:= False;
    btnSave  .Enabled:= False;
    btnCancel.Enabled:= False;
    btnDelete.Enabled:= False;
    nSelect:= 0;
  end;
end;

procedure TfrmCardAdd.FormShow(Sender: TObject);
begin
  with qryTagList do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * from TagList Order By TKNo');
    Open;
  end;
  nSelect:= 0;
end;

procedure TfrmCardAdd.qryTagListUseFlagGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  try
    Case qryTagListUseFlag.Value of
      1: Text:= '미발급';
      2: Text:= '발급';
      3: Text:= '회수/반납';
      4: Text:= '분실';
      5: Text:= '카드불량';
    end;
  except
    on E: Exception do ExceptLogging('TfrmCardAdd.qryTagListUseFlagGetText: ' + E.Message);
  end;
end;

procedure TfrmCardAdd.btnSaveClick(Sender: TObject);
begin
  try
    btnSeek.Enabled:= True;

    if edtMarkNo.Text = '' then
    begin
      ShowMessage('고유일련번호를 입력하여주세요');
      edtMarkNo.SetFocus;
      Exit;
    end;

    if edtTKNo.Text = '' then
    begin
      ShowMessage('카드번호를 입력하여주세요!');
      edtTKNo.SetFocus;
      Exit;
    end;

    if cmbStatus.ItemIndex = 1 then
    begin
      ShowMessage('카드발급은 개인정보 메뉴에서 발급처리하여야 합니다.');
      cmbStatus.SetFocus;
      Exit;
    end;

    Case nSelect of
      1: begin
           with qryTemp do
           begin
             Close;
             SQL.Clear;
             SQL.Add('Select * from TagList where TKNo = :N1');
             Parameters.ParamByName('N1').Value:= edtTKNo.Text;
             Open;

             if RecordCount > 0 then
             begin
               ShowMessage('해당 카드번호에 대한 자료가 있습니다. 확인하여주세요!');
               edtTKNo.SetFocus;
               Exit;
             end;

             Close;
             SQL.Clear;
             SQL.Add('Select * from TagList where MarkNo = :N1');
             Parameters.ParamByName('N1').Value:= edtMarkNo.Text;
             Open;

             if RecordCount > 0 then
             begin
               ShowMessage('해당 고유일련번호에 대한 자료가 있습니다. 확인하여주세요!');
               edtMarkNo.SetFocus;
               Exit;
             end;
           end;

           with qryTagList do
           begin
             Close;
             SQL.Clear;
             SQL.Add('Insert into TagList ');
             SQL.Add('(TKNo, MarkNo, UseFlag, RegDate, IssueDate, ReturnDate)');
             SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6)');
             Parameters.ParamByName('N1').Value:= edtTKNo.Text;
             Parameters.ParamByName('N2').Value:= edtMarkNo.Text;
             Parameters.ParamByName('N3').Value:= cmbStatus.ItemIndex + 1;
             Parameters.ParamByName('N4').Value:= FormatDateTime('YYYY-MM-DD', Now);
             Parameters.ParamByName('N5').Value:= '';

             if (cmbStatus.ItemIndex = 2) or
                (cmbStatus.ItemIndex = 3) or
                (cmbStatus.ItemIndex = 4) then
               Parameters.ParamByName('N6').Value:= FormatDateTime('YYYY-MM-DD', Now)
             else
               Parameters.ParamByName('N6').Value:= '';
             ExecSql;

             Close;
             SQL.Clear;
             SQL.Add('Select * from TagList Order By TKNo');
             Open;
           end;
         end;

      2: begin
           with qryTagList do
           begin
             Close;
             SQL.Clear;
             SQL.Add('Update TagList ');
             SQL.Add('Set UseFlag = :N1, ReturnDate = :N2 ');
             SQL.Add('Where TKNo = :N3 and MarkNo = :N4');
             Parameters.ParamByName('N1').Value:= cmbStatus.ItemIndex + 1;

             if (cmbStatus.ItemIndex = 2) or
                (cmbStatus.ItemIndex = 3) or
                (cmbStatus.ItemIndex = 4) then
               Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', Now)
             else
               Parameters.ParamByName('N2').Value:= '';
             Parameters.ParamByName('N3').Value:= edtTKNo.Text;
             Parameters.ParamByName('N4').Value:= edtMarkNo.Text;
             ExecSql;

             Close;
             SQL.Clear;
             SQL.Add('Select * from TagList Order By TKNo');
             Open;
           end;
         end;
    end;
    EnableProc(False);
    btnAdd   .Enabled:= True;
    btnClose .Enabled:= True;
    btnModify.Enabled:= False;
    btnDelete.Enabled:= False;
    btnSave  .Enabled:= False;
    btnCancel.Enabled:= False;
    nSelect:= 0;
  except
    on E: Exception do
    begin
      ExceptLogging('TfrmCardAdd.btnSaveClick: ' + E.Message);
      EnableProc(False);
      btnAdd   .Enabled:= True;
      btnClose .Enabled:= True;
      btnModify.Enabled:= False;
      btnDelete.Enabled:= False;
      btnSave  .Enabled:= False;
      btnCancel.Enabled:= False;
      nSelect:= 0;
    end;
  end;
end;

procedure TfrmCardAdd.btnSeekClick(Sender: TObject);
var
  sMarkNo: String;
begin
  try
    sMarkNo:= InputBox('카드번호 입력', '카드번호를 입력하여주세요!'#13#10 +
                       '카드번호를 입력하지 않으면 등록된 모든 카드를 보여줍니다.', '');

    if sMarkNo = '' then
    begin
      with qryTagList do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select * from TagList Order By TKNo');
        Open;
      end;
    end
    else
    begin
      with qryTagList do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select * from TagList where TKNo Like ' + MG_MakeStr('%' + Trim(sMarkNo) + '%'));
        SQL.Add(' Order By TKNo');
        Open;
      end;
    end;
  except
    on E: Exception do ExceptLogging('TfrmCardAdd.btnSeekClick: ' + E.Message);
  end;
end;

procedure TfrmCardAdd.btnCloseClick(Sender: TObject);
begin
  qryTagList.Close;
  qryTemp.Close;
  Close;
end;

procedure TfrmCardAdd.DBGrid1DblClick(Sender: TObject);
begin
  try
    with qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from TagList');
      Open;

      if RecordCount <= 0 then Exit;
    end;

    with qryTagList do
    begin
      edtTKNo  .Text:= FieldByName('TKNo').AsString;
      edtMarkNo.Text:= FieldByName('MarkNo').AsString;
      cmbStatus.ItemIndex:= FieldByName('UseFlag').AsInteger-1;
    end;
    btnModify.Enabled:= True;
    btnDelete.Enabled:= True;
    btnCancel.Enabled:= True;
    btnAdd   .Enabled:= False;
    btnSave  .Enabled:= False;
    btnClose .Enabled:= False;
  except
    on E: Exception do ExceptLogging('TfrmCardAdd.DBGrid1DblClick: ' + E.Message);
  end;
end;

procedure TfrmCardAdd.edtTKNoExit(Sender: TObject);
begin
  edtTKNo.Text:= MG_InsZero(edtTKNo.Text, 8);
end;

end.

