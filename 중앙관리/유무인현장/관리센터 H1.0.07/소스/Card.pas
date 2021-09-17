unit Card;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, FileCtrl, Mask, AdvSpin, DB, ADODB;

type
  TfrmCard = class(TForm)
    Label1: TLabel;
    dcb1: TDriveComboBox;
    dlb1: TDirectoryListBox;
    flb1: TFileListBox;
    Memo1: TMemo;
    btnCall: TBitBtn;
    btn2: TBitBtn;
    edtCnt: TAdvSpinEdit;
    qryCard: TADOQuery;
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
    procedure btnCallClick(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCard: TfrmCard;

implementation
uses
  Tables, Global;

{$R *.dfm}

procedure TfrmCard.btnCallClick(Sender: TObject);
begin
  try
    Memo1.Lines.LoadFromFile(flb1.FileName);
    edtCnt.Value:= Memo1.Lines.Count;
  except
    on E: Exception do ExceptLogging('TfrmCard.btnCallClick: ' + E.Message);
  end;
end;

procedure TfrmCard.btn2Click(Sender: TObject);
var
  sTKNo, sMarkNo: String;
  i, nSaveCnt, nCnt: Integer;
begin
  try
    nSaveCnt:= 0;
    nCnt:= 0;

    if Memo1.Lines.Count > 0 then
    begin
      for i:= 0 to Memo1.Lines.Count-1 do
      begin
        sTKNo:= MG_StrStrTrim(MG_StrTrim(Copy(Memo1.Lines[i], 1, Pos(':', Memo1.Lines[i])-1), ' '), 'H', 'M');
        sMarkNo:= MG_StrTrim(Copy(Memo1.Lines[i], Pos(':', Memo1.Lines[i])+1, Length(Memo1.Lines[i])-Pos(':', Memo1.Lines[i])), ' ');

        with qryCard do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Select * from TagList where TKNo = :N1');
          Parameters.ParamByName('N1').Value:= sTKNo;
          Open; 

          if RecordCount <= 0 then
          begin
            with qryTagList do
            begin
              Close;
              SQL.Clear;
              SQL.Add('Insert into TagList ');
              SQL.Add('(ParkNo, TKNo, MarkNo, RegDate, UseFlag) ');
              SQL.Add('Values (:N0, :N1, :N2, :N3, :N4)');
              Parameters.ParamByName('N0').Value:= nCurrParkNo;
              Parameters.ParamByName('N1').Value:= sTKNo;
              Parameters.ParamByName('N2').Value:= sMarkNo;
              Parameters.ParamByName('N3').Value:= FormatDateTime('YYYY-MM-DD', Now);
              Parameters.ParamByName('N4').Value:= 1;
              ExecSQL;
              Close;
              nSaveCnt:= nSaveCnt + 1;
            end;
          end
          else
          begin
            nCnt:= nCnt + 1;
          end;
        end;
      end;
      ShowMessage('총 ' + IntToStr(nSaveCnt) + '매의 신규 카드자료를 저장하였습니다.');
    end
    else
      ShowMessage('저장할 신규 카드자료가 없습니다.');
  except
    on E: Exception do ExceptLogging('TfrmCard.btn2Click: ' + E.Message);
  end;
end;

end.
