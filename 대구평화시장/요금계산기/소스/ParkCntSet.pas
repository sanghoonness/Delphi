unit ParkCntSet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, AdvSpin, ExtCtrls, Buttons, DB, ADODB;

type
  TfrmParkCntSet = class(TForm)
    Panel1: TPanel;
    Bevel26: TBevel;
    Label25: TLabel;
    edtTotCnt: TAdvSpinEdit;
    Bevel1: TBevel;
    Label1: TLabel;
    edtNowCnt: TAdvSpinEdit;
    Bevel2: TBevel;
    Label2: TLabel;
    edtFreeCnt: TAdvSpinEdit;
    btnSave: TBitBtn;
    btnClose: TBitBtn;
    qryCntTemp: TADOQuery;
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure edtNowCntChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParkCntSet: TfrmParkCntSet;

implementation
uses
  Global, Tables;

{$R *.dfm}

procedure TfrmParkCntSet.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmParkCntSet.btnSaveClick(Sender: TObject);
begin
  {
  iSetup.WriteInteger('PARKING', 'TotParking', edtTotCnt.Value);
  iSetup.WriteInteger('PARKING', 'NowParking', edtNowCnt.Value);
  }

  with qryCntTemp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * from ParkingCnt where ParkNo = :N1');
    Parameters.ParamByName('N1').Value:= nCurrParkNo;
    Open;

    if RecordCount > 0 then
    begin
      Close;
      SQL.Clear;
      SQL.Add('Update ParkingCnt Set TotParking = :N1, NowParking = :N2 ');
      SQL.Add('where ParkNo = :N3');
      Parameters.ParamByName('N1').Value:= edtTotCnt.Value;
      Parameters.ParamByName('N2').Value:= edtNowCnt.Value;
      Parameters.ParamByName('N3').Value:= nCurrParkNo;
      ExecSQL;
    end
    else
    begin
      Close;
      SQL.Clear;
      SQL.Add('Insert Into ParkingCnt (ParkNo, TotParking, NowParking) ');
      SQL.Add('Values (:N1, :N2, :N3)');
      Parameters.ParamByName('N1').Value:= nCurrParkNo;
      Parameters.ParamByName('N2').Value:= edtTotCnt.Value;
      Parameters.ParamByName('N3').Value:= edtNowCnt.Value;
      ExecSQL;
    end;
  end;
  nTotParkingCnt:= edtTotCnt.Value;
  nNowParkingCnt:= edtNowCnt.Value;
  nFreeCnt:= nTotParkingCnt - nNowParkingCnt;
  ExceptLogging('주차가능대수 변경: ' + IntToStr(edtTotCnt.Value) + ', ' + IntToStr(edtNowCnt.Value));
  ShowMessage('주차대수를 변경하였습니다.');
end;

procedure TfrmParkCntSet.edtNowCntChange(Sender: TObject);
var
  nFree: Integer;
begin
  nFree:= edtTotCnt.Value - edtNowCnt.Value;

  if nFree < 0 then
    nFree:= 0;

  edtFreeCnt.Value:= nFree;
end;

procedure TfrmParkCntSet.FormShow(Sender: TObject);
var
  nFree: Integer;
begin
  {
  edtTotCnt.Value:= iSetup.ReadInteger('PARKING', 'TotParking', 0);
  edtNowCnt.Value:= iSetup.ReadInteger('PARKING', 'NowParking', 0);
  }
  with qryCntTemp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * from ParkingCnt where ParkNo = :N1');
    Parameters.ParamByName('N1').Value:= nCurrParkNo;
    Open;

    if RecordCount > 0 then
    begin
      edtTotCnt.Value:= FieldByName('TotParking').AsInteger;
      edtNowCnt.Value:= FieldByName('NowParking').AsInteger;
    end;
  end;
  nFree:= edtTotCnt.Value - edtNowCnt.Value;

  if nFree < 0 then
    nFree:= 0;

  edtFreeCnt.Value:= nFree;
end;

end.
