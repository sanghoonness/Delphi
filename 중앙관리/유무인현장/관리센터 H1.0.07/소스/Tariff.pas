unit Tariff;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, StdCtrls, Mask, AdvEdit, AdvCombo, AdvSpin, DB,
  ADODB, Grids, BaseGrid, AdvGrid, DBAdvGrid, Buttons, AdvObj;

type
  TfrmTariff = class(TForm)
    AdvPanel1: TAdvPanel;
    AdvPanel2: TAdvPanel;
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
    qryTariff: TADOQuery;
    qryTariffParkNo: TSmallintField;
    qryTariffDivNo: TWordField;
    qryTariffFeeNo: TWordField;
    qryTariffFeeName: TStringField;
    qryTariffHolidayChk: TWordField;
    qryTariffDivName: TStringField;
    qryTariffSTTime: TStringField;
    qryTariffSec1Min: TStringField;
    qryTariffSec1Value: TIntegerField;
    qryTariffSec1Loop: TWordField;
    qryTariffSec2Min: TStringField;
    qryTariffSec2Value: TIntegerField;
    qryTariffSec2Loop: TWordField;
    qryTariffSec3Min: TStringField;
    qryTariffSec3Value: TIntegerField;
    qryTariffSec3Loop: TWordField;
    qryTariffSec4Min: TStringField;
    qryTariffSec4Value: TIntegerField;
    qryTariffSec4Loop: TWordField;
    qryTariffSec5Min: TStringField;
    qryTariffSec5Value: TIntegerField;
    qryTariffCarTypeNo: TWordField;
    qryTariffReserve1: TStringField;
    qryTariffReserve2: TStringField;
    qryTariffReserve3: TStringField;
    qryTariffReserve4: TStringField;
    qryTariffReserve5: TStringField;
    dsTariff: TDataSource;
    edtDivName: TAdvEdit;
    edtDivNo: TAdvSpinEdit;
    cmbFeeItem: TAdvComboBox;
    cmbCarType: TAdvComboBox;
    cmbHolidayChk: TAdvComboBox;
    edtSTTime: TAdvMaskEdit;
    cmbParkNo: TAdvComboBox;
    AdvPanel3: TAdvPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edt12: TAdvMaskEdit;
    edt22: TAdvMaskEdit;
    edt32: TAdvMaskEdit;
    edt42: TAdvMaskEdit;
    edt52: TAdvMaskEdit;
    edt13: TAdvSpinEdit;
    edt14: TAdvSpinEdit;
    edt23: TAdvSpinEdit;
    edt24: TAdvSpinEdit;
    edt33: TAdvSpinEdit;
    edt34: TAdvSpinEdit;
    edt43: TAdvSpinEdit;
    edt44: TAdvSpinEdit;
    edt53: TAdvSpinEdit;
    dgTariff: TDBAdvGrid;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    btnDelete: TBitBtn;
    btnClose: TBitBtn;
    qryTemp: TADOQuery;
    procedure qryTariffCarTypeNoGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryTariffHolidayChkGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure dgTariffClick(Sender: TObject);
    procedure cmbFeeItemChange(Sender: TObject);
    procedure cmbParkNoChange(Sender: TObject);
    procedure qryTariffFeeNameGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    { Private declarations }
    procedure frmClear;
  public
    { Public declarations }
  end;

var
  frmTariff: TfrmTariff;
  nSelect: Byte = 0;  //Insert:0, Modify:1;

implementation
uses
  Tables, Global;

{$R *.dfm}

procedure TfrmTariff.btnCancelClick(Sender: TObject);
begin
  frmClear;
end;

procedure TfrmTariff.btnCloseClick(Sender: TObject);
begin
  qryTariff.Close;
  qryFeeItem.Close;
  qryTemp.Close;
  ModalResult := mrCancel;
  //Close;
end;

procedure TfrmTariff.btnDeleteClick(Sender: TObject);
begin
  try
    if MessageDlg('선택한 주차요금을 삭제할까요?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;

    with qryTariff do
    begin
      try
        dmTables.ADODB.BeginTrans;
        Close;
        SQL.Clear;
        SQL.Add('Delete from Tariff where ParkNo = :N1 and DivNo = :N2');
        Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
        Parameters.ParamByName('N2').Value:= edtDivNo.Value;
        ExecSQL;
        dmTables.ADODB.CommitTrans;
      except
        on E: Exception do
        begin
          dmTables.ADODB.RollbackTrans;
          ExceptLogging('TfrmTariff.btnDeleteClick: ' + aString(E.Message));
          ShowMessage('삭제중 오류발생! 관리자에 문의바랍니다.');
        end;
      end;

      Close;
      SQL.Clear;
      SQL.Add('Select * from Tariff');
      Open;
    end;
    frmClear;
  except
    on E: Exception do ExceptLogging('TfrmTariff.btnDeleteClick: ' + aString(E.Message));
  end;
end;

procedure TfrmTariff.btnSaveClick(Sender: TObject);
begin
  try
    if edtDivNo.Value = 0 then
    begin
      ShowMessage('주차요율번호는 1번부터 저장이 가능합니다.');
      edtDivNo.SetFocus;
      Exit;
    end;

    with qryTariff do
    begin
      if nSelect = 0 then
      begin
        //추가...
        with qryTemp do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Select * from Tariff where ParkNo = :N1 and DivNo = :N2');
          Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
          Parameters.ParamByName('N2').Value:= edtDivNo.Value;
          Open;

          if RecordCount > 0 then
          begin
            ShowMessage('해당 주차요율번호가 이미 사용중입니다.'#13#10 +
                        '주차요금번호를 변경하여주세요!');
            edtDivNo.SetFocus;
            Exit;
          end;
        end;

        try
          dmTables.ADODB.BeginTrans;
          Close;
          SQL.Clear;
          SQL.Add('Insert into Tariff ');
          SQL.Add('(ParkNo, DivNo, HolidayChk, DivName, STTime, ');
          SQL.Add('Sec1Min, Sec1Value, Sec1Loop, ');
          SQL.Add('Sec2Min, Sec2Value, Sec2Loop, ');
          SQL.Add('Sec3Min, Sec3Value, Sec3Loop, ');
          SQL.Add('Sec4Min, Sec4Value, Sec4Loop, ');
          SQL.Add('Sec5Min, Sec5Value, FeeNo, CarType) ');
          SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, ');
          SQL.Add(':N11, :N12, :N13, :N14, :N15, :N16, :N17, :N18, :N19, :N20, :N21)');
          Parameters.ParamByName('N1' ).Value:= StrToInt(cmbParkNo.Text);
          Parameters.ParamByName('N2' ).Value:= edtDivNo.Value;
          Parameters.ParamByName('N3' ).Value:= cmbHolidayChk.ItemIndex;
          Parameters.ParamByName('N4' ).Value:= edtDivName.Text;
          Parameters.ParamByName('N5' ).Value:= edtSTTime.Text;
          Parameters.ParamByName('N6' ).Value:= edt12.Text;
          Parameters.ParamByName('N7' ).Value:= edt13.Value;
          Parameters.ParamByName('N8' ).Value:= edt14.Value;
          Parameters.ParamByName('N9' ).Value:= edt22.Text;
          Parameters.ParamByName('N10').Value:= edt23.Value;
          Parameters.ParamByName('N11').Value:= edt24.Value;
          Parameters.ParamByName('N12').Value:= edt32.Text;
          Parameters.ParamByName('N13').Value:= edt33.Value;
          Parameters.ParamByName('N14').Value:= edt34.Value;
          Parameters.ParamByName('N15').Value:= edt42.Text;
          Parameters.ParamByName('N16').Value:= edt43.Value;
          Parameters.ParamByName('N17').Value:= edt44.Value;
          Parameters.ParamByName('N18').Value:= edt52.Text;
          Parameters.ParamByName('N19').Value:= edt53.Value;
          Parameters.ParamByName('N20').Value:= cmbFeeItem.Tag;
          Parameters.ParamByName('N21').Value:= cmbCarType.ItemIndex;
          ExecSql;
          dmTables.ADODB.CommitTrans;
        except
          on E: Exception do
          begin
            dmTables.ADODB.RollbackTrans;
            ExceptLogging('TfrmTariff.btnSaveClick: ' + aString(E.Message));
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
          SQL.Add('Update Tariff ');
          SQL.Add('Set HolidayChk = :N1, DivName = :N2, STTime = :N3, ');
          SQL.Add('Sec1Min = :N4, Sec1Value = :N5, Sec1Loop = :N6, ');
          SQL.Add('Sec2Min = :N7, Sec2Value = :N8, Sec2Loop = :N9, ');
          SQL.Add('Sec3Min = :N10, Sec3Value = :N11, Sec3Loop = :N12, ');
          SQL.Add('Sec4Min = :N13, Sec4Value = :N14, Sec4Loop = :N15, ');
          SQL.Add('Sec5Min = :N16, Sec5Value = :N17, FeeNo = :N18, CarType = :N21 ');
          SQL.Add('Where ParkNo = :N19 and DivNo = :N20');
          Parameters.ParamByName('N1' ).Value:= cmbHolidayChk.ItemIndex;
          Parameters.ParamByName('N2' ).Value:= edtDivName.Text;
          Parameters.ParamByName('N3' ).Value:= edtSTTime.Text;
          Parameters.ParamByName('N4' ).Value:= edt12.Text;
          Parameters.ParamByName('N5' ).Value:= edt13.Value;
          Parameters.ParamByName('N6' ).Value:= edt14.Value;
          Parameters.ParamByName('N7' ).Value:= edt22.Text;
          Parameters.ParamByName('N8' ).Value:= edt23.Value;
          Parameters.ParamByName('N9' ).Value:= edt24.Value;
          Parameters.ParamByName('N10').Value:= edt32.Text;
          Parameters.ParamByName('N11').Value:= edt33.Value;
          Parameters.ParamByName('N12').Value:= edt34.Value;
          Parameters.ParamByName('N13').Value:= edt42.Text;
          Parameters.ParamByName('N14').Value:= edt43.Value;
          Parameters.ParamByName('N15').Value:= edt44.Value;
          Parameters.ParamByName('N16').Value:= edt52.Text;
          Parameters.ParamByName('N17').Value:= edt53.Value;
          Parameters.ParamByName('N18').Value:= cmbFeeItem.Tag;
          Parameters.ParamByName('N19').Value:= StrToInt(cmbParkNo.Text);
          Parameters.ParamByName('N20').Value:= edtDivNo.Value;
          Parameters.ParamByName('N21').Value:= cmbCarType.ItemIndex;
          ExecSql;
          dmTables.ADODB.CommitTrans;
        except
          on E: Exception do
          begin
            dmTables.ADODB.RollbackTrans;
            ExceptLogging('TfrmTariff.btnSaveClick: ' + aString(E.Message));
            ShowMessage('저장중 오류발생! 관리자에 문의바랍니다.');
          end;
        end;
      end;
      Close;
      SQL.Clear;
      SQL.Add('Select * from Tariff');
      Open;

      frmClear;
    end;
  except
    on E: Exception do ExceptLogging('TfrmTariff.btnSaveClick: ' + aString(E.Message));
  end;
end;

procedure TfrmTariff.cmbFeeItemChange(Sender: TObject);
begin
  try
    if cmbFeeItem.ItemIndex = 0 then
    begin
      cmbFeeItem.Tag:= 0;
    end
    else
    begin
      with qryFeeItem do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select * from FeeItem where ParkNo = :N1 and FeeName = :N2 Order By FeeNo');
        Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
        Parameters.ParamByName('N2').Value:= cmbFeeItem.Text;
        Open;

        if RecordCount > 0 then
        begin
          cmbFeeItem.Tag:= FieldByName('FeeNo').AsInteger;
        end;
      end;
    end;
  except
    on E: Exception do ExceptLogging('TfrmTariff.cmbFeeItemChange: ' + aString(E.Message));
  end;
end;

procedure TfrmTariff.cmbParkNoChange(Sender: TObject);
begin
  try
    cmbFeeItem.Items.Clear;
    cmbFeeItem.Items.Add('일반요금');

    with qryFeeItem do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from FeeItem where ParkNo = :N1 Order By FeeNo');
      Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
      Open;

      if RecordCount > 0 then
      begin
        First;

        while not Eof do
        begin
          cmbFeeItem.Items.Add(FieldByName('FeeName').AsString);
          Next;
        end;
      end;
    end;
    cmbFeeItem.ItemIndex:= 0;
    cmbFeeItem.Tag:= 0;
  except
    on E: Exception do ExceptLogging('TfrmTariff.cmbParkNoChange: ' + aString(E.Message));
  end;
end;

procedure TfrmTariff.dgTariffClick(Sender: TObject);
begin
  try
    if qryTariff.RecordCount > 0 then
    begin
      with qryTariff do
      begin
        cmbParkNo.ItemIndex:= cmbParkNo.Items.IndexOf(IntToStr(FieldByName('ParkNo').AsInteger));
        edtDivNo.Value:= FieldByName('DivNo').AsInteger;
        edtDivName.Text:= FieldByName('DivName').AsString;

        if qryTariff.FieldByName('FeeNo').AsInteger = 0 then
        begin
          cmbFeeItem.ItemIndex:= 0;
          cmbFeeItem.Tag:= 0;
        end
        else
        if qryTariff.FieldByName('FeeNo').AsInteger > 0 then
        begin
          with qryTemp do
          begin
            Close;
            SQL.Clear;
            SQL.Add('Select * from FeeItem where ParkNo = :N1 and FeeNo = :N2');
            Parameters.ParamByName('N1' ).Value:= qryTariff.FieldByName('ParkNo').AsInteger;
            Parameters.ParamByName('N2' ).Value:= qryTariff.FieldByName('FeeNo').AsInteger;
            Open;

            if RecordCount > 0 then
            begin
              cmbFeeItem.ItemIndex:= cmbFeeItem.Items.IndexOf(FieldByName('FeeName').AsString);
              cmbFeeItem.Tag:= qryTariff.FieldByName('FeeNo').AsInteger;
            end;
          end;
        end;
        cmbCarType.ItemIndex:= FieldByName('CarType').AsInteger;
        cmbHolidayChk.ItemIndex:= FieldByName('HolidayChk').AsInteger;
        edtSTTime.Text:= FieldByName('STTime').AsString;
        edt12.Text := FieldByName('Sec1Min').AsString;
        edt22.Text := FieldByName('Sec2Min').AsString;
        edt32.Text := FieldByName('Sec3Min').AsString;
        edt42.Text := FieldByName('Sec4Min').AsString;
        edt52.Text := FieldByName('Sec5Min').AsString;
        edt13.Value:= FieldByName('Sec1Value').AsInteger;
        edt23.Value:= FieldByName('Sec2Value').AsInteger;
        edt33.Value:= FieldByName('Sec3Value').AsInteger;
        edt43.Value:= FieldByName('Sec4Value').AsInteger;
        edt53.Value:= FieldByName('Sec5Value').AsInteger;
        edt14.Value:= FieldByName('Sec1Loop').AsInteger;
        edt24.Value:= FieldByName('Sec2Loop').AsInteger;
        edt34.Value:= FieldByName('Sec3Loop').AsInteger;
        edt44.Value:= FieldByName('Sec4Loop').AsInteger;

        cmbParkNo.Enabled:= False;
        edtDivNo.Enabled:= False;
        btnCancel.Enabled:= True;
        btnDelete.Enabled:= True;

        nSelect:= 1;
      end;
    end;
  except
    on E: Exception do ExceptLogging('TfrmTariff.dgTariffClick: ' + aString(E.Message));
  end;
end;

procedure TfrmTariff.FormShow(Sender: TObject);
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
    cmbFeeItem.Items.Clear;
    cmbFeeItem.Items.Add('일반요금');

    with qryFeeItem do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from FeeItem where ParkNo = :N1 Order By FeeNo');
      Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
      Open;

      if RecordCount > 0 then
      begin
        First;

        while not Eof do
        begin
          cmbFeeItem.Items.Add(FieldByName('FeeName').AsString);
          Next;
        end;
      end;
    end;
    cmbFeeItem.ItemIndex:= 0;
    cmbFeeItem.Tag:= 0;
    cmbCarType.ItemIndex:= 1;

    with qryTariff do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from Tariff');
      Open;
    end;
    frmClear;
  except
    on E: Exception do ExceptLogging('TfrmTariff.FormShow: ' + aString(E.Message));
  end;
end;

procedure TfrmTariff.frmClear;
begin
  try
    cmbParkNo.ItemIndex:= 0;
    edtDivNo.Value:= 0;
    edtDivName.Text:= '';
    cmbFeeItem.ItemIndex:= 0;
    cmbCarType.ItemIndex:= 1;
    cmbHolidayChk.ItemIndex:= 0;
    edtSTTime.Text:= '';
    edt12.Text:= '';
    edt22.Text:= '';
    edt32.Text:= '';
    edt42.Text:= '';
    edt52.Text:= '';
    edt13.Value:= 0;
    edt23.Value:= 0;
    edt33.Value:= 0;
    edt43.Value:= 0;
    edt53.Value:= 0;
    edt14.Value:= 0;
    edt24.Value:= 0;
    edt34.Value:= 0;
    edt44.Value:= 0;

    cmbParkNo.Enabled:= True;
    edtDivNo.Enabled:= True;
    btnDelete.Enabled:= False;
    btnCancel.Enabled:= False;
    nSelect:= 0;
    cmbParkNo.SetFocus;
  except
    on E: Exception do ExceptLogging('TfrmTariff.frmClear: ' + aString(E.Message));
  end;
end;

procedure TfrmTariff.qryTariffCarTypeNoGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  case qryTariffCarTypeNo.Value of
    0: Text:= '경차';
    1: Text:= '소형';
    2: Text:= '중형';
    3: Text:= '대형';
  end;
end;

procedure TfrmTariff.qryTariffFeeNameGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if qryTariffFeeNo.Value > 0 then
    Text:= qryTariffFeeName.Value
  else
    Text:= '일반요금';
end;

procedure TfrmTariff.qryTariffHolidayChkGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  case qryTariffHolidayChk.Value of
    0: Text:= '평일';
    1: Text:= '토요일';
    2: Text:= '휴일';
  end;
end;

end.
