unit Freetime;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, AdvEdit, AdvCombo, ExtCtrls, DB, ADODB;

type
  TfrmFreetime = class(TForm)
    qryFreetime: TADOQuery;
    Panel1: TPanel;
    cmbFreeTime: TAdvComboBox;
    edtFreeTimeS: TAdvMaskEdit;
    edtFreeTimeE: TAdvMaskEdit;
    btnSave: TBitBtn;
    btnClose: TBitBtn;
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFreetime: TfrmFreetime;

implementation
uses
  Global, Tables;

{$R *.dfm}

procedure TfrmFreetime.btnCloseClick(Sender: TObject);
begin
  qryFreetime.Close;
  Close;
end;

procedure TfrmFreetime.btnSaveClick(Sender: TObject);
var
  tChkTime: TDateTime;
begin
  try
    if cmbFreeTime.ItemIndex = 1 then
    begin
      try
        tChkTime:= StrToTime(edtFreeTimeS.Text);
      except
        on E: Exception do
        begin
          ShowMessage('무료개방시작시각을 정확히 입력하여주세요!');
          edtFreeTimeS.SetFocus;
          Exit;
        end;
      end;

      try
        tChkTime:= StrToTime(edtFreeTimeE.Text);
      except
        on E: Exception do
        begin
          ShowMessage('무료개방종료시각을 정확히 입력하여주세요!');
          edtFreeTimeE.SetFocus;
          Exit;
        end;
      end;
    end;

    with qryFreetime do
    begin
      try
        dmTables.ADODB.BeginTrans;
        Close;
        SQL.Clear;
        SQL.Add('Update ParkInfo ');
        SQL.Add('Set Reserve3 = :N2, Reserve4 = :N3, Reserve5 = :N4 ');
        SQL.Add('Where ParkNo = :N1');
        Parameters.ParamByName('N1').Value:= nCurrParkNo;
        Parameters.ParamByName('N2').Value:= edtFreeTimeS.Text;
        Parameters.ParamByName('N3').Value:= edtFreeTimeE.Text;
        Parameters.ParamByName('N4').Value:= IntToStr(cmbFreeTime.ItemIndex);
        ExecSQL;
        dmTables.ADODB.CommitTrans;
      except
        on E: Exception do
        begin
          dmTables.ADODB.RollbackTrans;
          ExceptLogging('TfrmFreetime.btnSaveClick: ' + aString(E.Message));
          ShowMessage('저장중 오류발생! 관리자에 문의바랍니다.');
        end;
      end;
      ExceptLogging('Freetime Change: ' + IntToStr(cmbFreeTime.ItemIndex) + ', ' + edtFreeTimeS.Text +
                                          ', ' + edtFreeTimeE.Text);
      ShowMessage('무료개방시간을 변경하였습니다.');
    end;
  except
    on E: Exception do ExceptLogging('TfrmFreetime.btnSaveClick: ' + aString(E.Message));
  end;
end;

procedure TfrmFreetime.FormShow(Sender: TObject);
begin
  cmbFreeTime.ItemIndex:= 0;
  edtFreeTimeS.Text:= '';
  edtFreeTimeE.Text:= '';

  with qryFreetime do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * from Parkinfo where ParkNo = :N1');
    Parameters.ParamByName('N1').Value:= nCurrParkNo;
    Open;

    if RecordCount > 0 then
    begin
      First;

      if FieldByName('Reserve5').AsString <> '' then
        cmbFreeTime.ItemIndex:= StrToInt(FieldByName('Reserve5').AsString)
      else
        cmbFreeTime.ItemIndex:= 0;

      edtFreeTimeS.Text:= FieldByName('Reserve3').AsString;
      edtFreeTimeE.Text:= FieldByName('Reserve4').AsString;
    end;
    ExceptLogging('Freetime: ' + IntToStr(cmbFreeTime.ItemIndex) + ', ' + edtFreeTimeS.Text +
                                 ', ' + edtFreeTimeE.Text);
  end;
end;

end.
