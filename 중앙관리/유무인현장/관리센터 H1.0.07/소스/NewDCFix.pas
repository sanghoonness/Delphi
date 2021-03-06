unit NewDCFix;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, sCheckBox, Vcl.ComCtrls, AdvDateTimePicker,
  AdvCombo, AdvEdit, Vcl.Mask, AdvSpin;

type
  TfrmNewDcFix = class(TForm)
    Label15: TLabel;
    edtSDate: TAdvDateTimePicker;
    edtEDate: TAdvDateTimePicker;
    edtSTime: TAdvDateTimePicker;
    edtETime: TAdvDateTimePicker;
    schkweek6: TsCheckBox;
    schkweek0: TsCheckBox;
    schkweek1: TsCheckBox;
    schkweek2: TsCheckBox;
    schkweek3: TsCheckBox;
    schkweek4: TsCheckBox;
    schkweek5: TsCheckBox;
    pnl: TPanel;
    btnClose: TBitBtn;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    qryDcFixed: TADOQuery;
    qryDcFixedParkNo: TSmallintField;
    qryDcFixedCarNo: TStringField;
    qryDcFixedDCNo: TWordField;
    qryDcFixedName: TStringField;
    qryDcFixedTelNo: TStringField;
    qryDcFixedStartYmd: TStringField;
    qryDcFixedEndYmd: TStringField;
    qryDcFixedUseWeekDay: TStringField;
    qryDcFixedUseStartTime: TStringField;
    qryDcFixedUseEndTime: TStringField;
    qryDcFixedLimitedDayCount: TIntegerField;
    qryDcFixedLimitedMonthCount: TIntegerField;
    qryDcFixedUseParkNo: TIntegerField;
    qryDcFixedRemark: TStringField;
    qryDcFixedRemark2: TStringField;
    qryDcFixedReserve1: TStringField;
    qryDcFixedReserve2: TStringField;
    qryDcFixedReserve3: TStringField;
    qryDcFixedReserve4: TStringField;
    qryDcFixedReserve5: TStringField;
    qryDCInfo: TADOQuery;
    edtDcNo: TEdit;
    edtCarNo: TAdvEdit;
    cmbDcName: TAdvComboBox;
    edtName: TAdvEdit;
    edtTel: TAdvEdit;
    cmbUsePark: TAdvComboBox;
    edtReMark1: TAdvEdit;
    edtReMark2: TAdvEdit;
    cmbUseYes: TAdvComboBox;
    edtDayCount: TAdvSpinEdit;
    edtMonthCount: TAdvSpinEdit;
    edtMaxCount: TAdvSpinEdit;
    qryTemp: TADOQuery;
    procedure btnCancelClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmbDcNameChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  RECDcInfo = record
    nDcNo  : Integer;
    sDcName: String;
  end;

var
  frmNewDcFix: TfrmNewDcFix;
  RDcInfo : Array[1..100] of RECDcInfo;
  nDcCount : Integer;

implementation
uses
  global, Tables;

{$R *.dfm}

procedure TfrmNewDcFix.btnCancelClick(Sender: TObject);
var
 i : integer;
begin
  edtCarNo.Text := '';
  edtDcNo.Text  := '';
  edtName.Text  := '';
  edtTel.Text   := '';
  edtSDate.Date := Now;
  edtEDate.Date := Now;
  for I := 0 to 6 do
  begin
     TsCheckBox(FindComponent('schkweek'+ IntToStr(i))).Visible := true;
     TsCheckBox(FindComponent('schkweek'+ IntToStr(i))).Checked := true;
  end;
  edtSTime.Time     := StrToDateTime('00:00');
  edtETime.Time     := StrToDateTime('23:59');
  edtDayCount.Text  := '0';
  edtMonthCount.Text:= '0';
  cmbUsePark.ItemIndex:= 0;
  edtReMark1.Text   := '';
  edtReMark2.Text   := '';
  edtMaxCount.Value := 0;
end;

procedure TfrmNewDcFix.btnCloseClick(Sender: TObject);
begin
  qryDcFixed.Close;
  ModalResult := mrCancel;
  //Close;
end;

procedure TfrmNewDcFix.btnSaveClick(Sender: TObject);
var
  i : integer;
  sWeek : String;
begin
try
  sWeek := '';
  ExceptLogging('TfrmNewDcFix.btnSaveClick Start');

  if Length(MG_StrTrim(edtCarNo.Text, ' ')) < 8 then
  begin
    ShowMessage('?????????? ?????? ??????????????!');
    edtCarNo.SetFocus;
    Exit;
  end;

  if cmbDcName.Text = '' then
  begin
    ShowMessage('???????? ?????? ??????.');
    Exit;
  end;

  with qryDcFixed do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * from DCFixed where CarNo = :N1');
    Parameters.ParamByName('N1').Value:= MG_StrTrim(aString(edtCarNo.Text), ' ');
    Open;
    if RecordCount > 0 then
    begin
     ShowMessage(edtCarNo.Text + ' : ???? ???? ?????????? ???? ?????? ??????');
     Exit;
    end;
  end;

  if edtSDate.Date > edtEDate.Date then
  begin
    ShowMessage('?????????? ???????? ??????????????!');
    Exit;
  end;

  //???? ?? ????????
  for I := 0 to 6 do
  begin
     if  TsCheckBox(FindComponent('schkweek'+ IntToStr(i))).Checked then
     begin
       sWeek := sWeek + '1';
     end
     else
     begin
       sWeek := sWeek + '0';
     end;
  end;

  with qryDcFixed do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Insert into DCFixed (ParkNo, CarNo, DcNo, Name, TelNo, ' +
            'StartYmd, EndYmd, UseWeekDay, UseStartTime, UseEndTime, ' +
            'LimitedDayCount, LimitedMonthCount, UseParkNo, Remark, Remark2, UseYes, MaxCount) ' +
            'Values (:N1, :N2, :N3, :N4, :N5, ' +
            ':N6, :N7, :N8, :N9, :N10, ' +
            ':N11, :N12, :N13, :N14, :N15, :pUseYes, :pMaxCount) ');
//    SQL.Add('Update DCFixed  ' +
//            'set CarNo = :N1, DcNo = :N2, Name = :N3, TelNo = :N4, StartYmd = :N5, EndYmd = :N6, ' +
//            'UseWeekDay = :N7, UseStartTime = :N8, UseEndTime = :N9, LimitedDayCount = :N10, ' +
//            'LimitedMonthCount = :N11, UseParkNo = :N12, Remark = :N13, Remark2 = :N14 ' +
//            'where CarNo = :N15 ');
    Parameters.ParamByName('N1').Value:= 1;
    Parameters.ParamByName('N2').Value:= edtCarNo.Text;
    Parameters.ParamByName('N3').Value:= edtDCNo.Text;
    Parameters.ParamByName('N4').Value:= edtName.Text;
    Parameters.ParamByName('N5').Value:= edtTel.Text;
    Parameters.ParamByName('N6').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
    Parameters.ParamByName('N7').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
    Parameters.ParamByName('N8').Value:= sWeek;
    Parameters.ParamByName('N9').Value:= FormatDateTime('HH:NN', edtSTime.Time);
    Parameters.ParamByName('N10').Value:= FormatDateTime('HH:NN', edtETime.Time);
    Parameters.ParamByName('N11').Value:= edtDayCount.Text;
    Parameters.ParamByName('N12').Value:= edtMonthCount.Text;
    Parameters.ParamByName('N13').Value:= cmbUsePark.ItemIndex;
    Parameters.ParamByName('N14').Value:= edtReMark1.Text;
    Parameters.ParamByName('N15').Value:= edtReMark2.Text;
    Parameters.ParamByName('pUseYes').Value:= cmbUseYes.ItemIndex;
    Parameters.ParamByName('pMaxCount').Value:= edtMaxCount.Text;
    ExecSQL;
    ShowMessage('???? ???? ????!');
  end;

  btnCancel.OnClick(Sender);

except
  on E: Exception do
  begin
    ExceptLogging('TfrmDCFixed.btnSaveClick: ' + aString(E.Message));
    ShowMessage('???? ???? ????! ?????????? ????????????.');
  end;
end;
end;

procedure TfrmNewDcFix.cmbDcNameChange(Sender: TObject);
var
  i : Integer;
begin
  for i:= 1 to nDcCount do
  if RDcInfo[i].sDcName = cmbDcName.Text then
  begin
    edtDcNo.Text:= IntToStr(RDcInfo[i].nDcNo);
    Break;
  end;
end;

procedure TfrmNewDcFix.FormShow(Sender: TObject);
var
  i : Integer;
begin
//  edtSDate.Date:= FormatDateTime('YYYY-MM-DD', Now);
//  edtEDate.Date:= FormatDateTime('YYYY-MM-DD', Now);
  edtSDate.Date := Now;
  edtEDate.Date := Now;
  edtSTime.Time := StrToDateTime('00:00');
  edtETime.Time := StrToDateTime('23:59');
  nDcCount := 0;
  with qryDCInfo do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from dcinfo where FixedUse = 1');
    open;
    i := 1;
    if recordcount > 0 then
    begin
      nDcCount := RecordCount;
      while not Eof do
      begin
        RDcInfo[i].nDcNo   := FieldByName('DCNo').AsInteger;
        RDcInfo[i].sDcName := FieldByName('DCName').AsString;
        cmbDcName.Items.Add(FieldByName('DCName').AsString);
        inc(i);
        next;
      end;
    end;
  end;

  with qryTemp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from parkkind ');
    open;
    i := 1;
    if recordcount > 0 then
    begin
      while not Eof do
      begin
        cmbUsePark.Items.Add(FieldByName('ParkName').AsString);
        inc(i);
        next;
      end;

      cmbUsePark.ItemIndex := 0;
    end;
  end;
end;

end.
