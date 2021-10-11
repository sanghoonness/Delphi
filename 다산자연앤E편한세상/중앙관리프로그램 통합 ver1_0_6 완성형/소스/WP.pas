unit WP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, DB, ADODB, StdCtrls, AdvEdit, Mask, AdvCombo,
  AdvSpin, Buttons, Grids, BaseGrid, AdvGrid, DBAdvGrid, AdvObj;

type
  TfrmWP = class(TForm)
    AdvPanel1: TAdvPanel;
    AdvPanel2: TAdvPanel;
    edtWPNo: TAdvSpinEdit;
    cmbSun: TAdvComboBox;
    edtSSun: TAdvMaskEdit;
    cmbMon: TAdvComboBox;
    edtSMon: TAdvMaskEdit;
    cmbWed: TAdvComboBox;
    edtSWed: TAdvMaskEdit;
    cmbFri: TAdvComboBox;
    edtSFri: TAdvMaskEdit;
    edtESun: TAdvMaskEdit;
    edtEMon: TAdvMaskEdit;
    edtEWed: TAdvMaskEdit;
    edtEFri: TAdvMaskEdit;
    edtWPName: TAdvEdit;
    cmbTue: TAdvComboBox;
    cmbThu: TAdvComboBox;
    cmbSat: TAdvComboBox;
    edtSTue: TAdvMaskEdit;
    edtSThu: TAdvMaskEdit;
    edtSSat: TAdvMaskEdit;
    edtETue: TAdvMaskEdit;
    edtEThu: TAdvMaskEdit;
    edtESat: TAdvMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    qryTemp: TADOQuery;
    qryWP: TADOQuery;
    qryWPWPNo: TWordField;
    qryWPWPName: TStringField;
    qryWPChkSun: TWordField;
    qryWPSTimeSun: TStringField;
    qryWPETimeSun: TStringField;
    qryWPChkMon: TWordField;
    qryWPSTimeMon: TStringField;
    qryWPETimeMon: TStringField;
    qryWPChkTue: TWordField;
    qryWPSTimeTue: TStringField;
    qryWPETimeTue: TStringField;
    qryWPChkWed: TWordField;
    qryWPSTimeWed: TStringField;
    qryWPETimeWed: TStringField;
    qryWPChkThu: TWordField;
    qryWPSTimeThu: TStringField;
    qryWPETimeThu: TStringField;
    qryWPChkFri: TWordField;
    qryWPSTimeFri: TStringField;
    qryWPETimeFri: TStringField;
    qryWPChkSat: TWordField;
    qryWPSTimeSat: TStringField;
    qryWPETimeSat: TStringField;
    dsWP: TDataSource;
    qryWPParkNo: TSmallintField;
    qryWPReserve1: TStringField;
    qryWPReserve2: TStringField;
    qryWPReserve3: TStringField;
    qryWPReserve4: TStringField;
    qryWPReserve5: TStringField;
    cmbParkNo: TAdvComboBox;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    btnDelete: TBitBtn;
    btnClose: TBitBtn;
    dgWP: TDBAdvGrid;
    procedure qryWPChkSunGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryWPChkMonGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryWPChkTueGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryWPChkWedGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryWPChkThuGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryWPChkFriGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryWPChkSatGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure dgWPClick(Sender: TObject);
  private
    { Private declarations }
    procedure frmClear;
  public
    { Public declarations }
  end;

var
  frmWP: TfrmWP;
  nSelect: Byte = 0;  //Insert:0, Modify:1;

implementation
uses
  Tables, Global;

{$R *.dfm}

procedure TfrmWP.btnCancelClick(Sender: TObject);
begin
  frmClear;
end;

procedure TfrmWP.btnCloseClick(Sender: TObject);
begin
  qryTemp.Close;
  qryWP.Close;
  Close;
end;

procedure TfrmWP.btnDeleteClick(Sender: TObject);
begin
  try
    if MessageDlg('선택한 WP를 삭제할까요?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;

    with qryWP do
    begin
      try
        dmTables.ADODB.BeginTrans;
        Close;
        SQL.Clear;
        SQL.Add('Delete from WP where WPNo = :N1');
        Parameters.ParamByName('N1').Value:= edtWPNo.Value;
        ExecSQL;
        dmTables.ADODB.CommitTrans;
      except
        on E: Exception do
        begin
          dmTables.ADODB.RollbackTrans;
          ExceptLogging('TfrmWP.btnDeleteClick: ' + aString(E.Message));
          ShowMessage('삭제중 오류발생! 관리자에 문의바랍니다.');
        end;
      end;

      Close;
      SQL.Clear;
      SQL.Add('Select * from WP');
      Open;
    end;
    frmClear;
  except
    on E: Exception do ExceptLogging('TfrmWP.btnDeleteClick: ' + aString(E.Message));
  end;
end;

procedure TfrmWP.btnSaveClick(Sender: TObject);
begin
  try
    if edtWPNo.Value = 0 then
    begin
      ShowMessage('사용시간대번호는 1번부터 저장이 가능합니다.');
      edtWPNo.SetFocus;
      Exit;
    end;

    with qryWP do
    begin
      if nSelect = 0 then
      begin
        //추가...
        with qryTemp do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Select * from WP where ParkNo = :N1 and WPNo = :N2');
          Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
          Parameters.ParamByName('N2').Value:= edtWPNo.Value;
          Open;

          if RecordCount > 0 then
          begin
            ShowMessage('해당 WP번호가 이미 사용중입니다.'#13#10 +
                        'WP번호를 변경하여주세요!');
            edtWPNo.SetFocus;
            Exit;
          end;
        end;

        try
          dmTables.ADODB.BeginTrans;
          Close;
          SQL.Clear;
          SQL.Add('Insert WP ');
          SQL.Add('(ParkNo, WPNo, WPName, ChkSun, STimeSun, ETimeSun, ChkMon, STimeMon, ETimeMon, ');
          SQL.Add('ChkTue, STimeTue, ETimeTue, ChkWed, STimeWed, ETimeWed, ');
          SQL.Add('ChkThu, STimeThu, ETimeThu, ChkFri, STimeFri, ETimeFri, ');
          SQL.Add('ChkSat, STimeSat, ETimeSat) ');
          SQL.Add('Values (:pParkNo, :pWPNo, :pWPName, :pChkSun, :pSTimeSun, :pETimeSun, :pChkMon, :pSTimeMon, :pETimeMon, ');
          SQL.Add(':pChkTue, :pSTimeTue, :pETimeTue, :pChkWed, :pSTimeWed, :pETimeWed, ');
          SQL.Add(':pChkThu, :pSTimeThu, :pETimeThu, :pChkFri, :pSTimeFri, :pETimeFri, ');
          SQL.Add(':pChkSat, :pSTimeSat, :pETimeSat) ');
          Parameters.ParamByName('pParkNo'  ).Value:= StrToInt(cmbParkNo.Text);
          Parameters.ParamByName('pWPNo'    ).Value:= edtWPNo.Value;
          Parameters.ParamByName('pWPName'  ).Value:= edtWPName.Text;
          Parameters.ParamByName('pChkSun'  ).Value:= cmbSun.ItemIndex;
          Parameters.ParamByName('pSTimeSun').Value:= edtSSun.Text;
          Parameters.ParamByName('pETimeSun').Value:= edtESun.Text;
          Parameters.ParamByName('pChkMon'  ).Value:= cmbMon.ItemIndex;
          Parameters.ParamByName('pSTimeMon').Value:= edtSMon.Text;
          Parameters.ParamByName('pETimeMon').Value:= edtEMon.Text;
          Parameters.ParamByName('pChkTue'  ).Value:= cmbTue.ItemIndex;
          Parameters.ParamByName('pSTimeTue').Value:= edtSTue.Text;
          Parameters.ParamByName('pETimeTue').Value:= edtETue.Text;
          Parameters.ParamByName('pChkWed'  ).Value:= cmbWed.ItemIndex;
          Parameters.ParamByName('pSTimeWed').Value:= edtSWed.Text;
          Parameters.ParamByName('pETimeWed').Value:= edtEWed.Text;
          Parameters.ParamByName('pChkThu'  ).Value:= cmbThu.ItemIndex;
          Parameters.ParamByName('pSTimeThu').Value:= edtSThu.Text;
          Parameters.ParamByName('pETimeThu').Value:= edtEThu.Text;
          Parameters.ParamByName('pChkFri'  ).Value:= cmbFri.ItemIndex;
          Parameters.ParamByName('pSTimeFri').Value:= edtSFri.Text;
          Parameters.ParamByName('pETimeFri').Value:= edtEFri.Text;
          Parameters.ParamByName('pChkSat'  ).Value:= cmbSat.ItemIndex;
          Parameters.ParamByName('pSTimeSat').Value:= edtSSat.Text;
          Parameters.ParamByName('pETimeSat').Value:= edtESat.Text;
          ExecSQL;
          dmTables.ADODB.CommitTrans;
        except
          on E: Exception do
          begin
            dmTables.ADODB.RollbackTrans;
            ExceptLogging('TfrmWP.btnSaveClick: ' + aString(E.Message));
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
          SQL.Add('Update WP ');
          SQL.Add('Set WPName = :pWPName, ChkSun = :pChkSun, STimeSun = :pSTimeSun, ETimeSun = :pETimeSun, ');
          SQL.Add('ChkMon = :pChkMon, STimeMon = :pSTimeMon, ETimeMon = :pETimeMon, ');
          SQL.Add('ChkTue = :pChkTue, STimeTue = :pSTimeTue, ETimeTue = :pETimeTue, ');
          SQL.Add('ChkWed = :pChkWed, STimeWed = :pSTimeWed, ETimeWed = :pETimeWed, ');
          SQL.Add('ChkThu = :pChkThu, STimeThu = :pSTimeThu, ETimeThu = :pETimeThu, ');
          SQL.Add('ChkFri = :pChkFri, STimeFri = :pSTimeFri, ETimeFri = :pETimeFri, ');
          SQL.Add('ChkSat = :pChkSat, STimeSat = :pSTimeSat, ETimeSat = :pETimeSat ');
          SQL.Add('Where WPNo = :pWPNo and ParkNo = :pParkNo');
          Parameters.ParamByName('pWPName'  ).Value:= edtWPName.Text;
          Parameters.ParamByName('pChkSun'  ).Value:= cmbSun.ItemIndex;
          Parameters.ParamByName('pSTimeSun').Value:= edtSSun.Text;
          Parameters.ParamByName('pETimeSun').Value:= edtESun.Text;
          Parameters.ParamByName('pChkMon'  ).Value:= cmbMon.ItemIndex;
          Parameters.ParamByName('pSTimeMon').Value:= edtSMon.Text;
          Parameters.ParamByName('pETimeMon').Value:= edtEMon.Text;
          Parameters.ParamByName('pChkTue'  ).Value:= cmbTue.ItemIndex;
          Parameters.ParamByName('pSTimeTue').Value:= edtSTue.Text;
          Parameters.ParamByName('pETimeTue').Value:= edtETue.Text;
          Parameters.ParamByName('pChkWed'  ).Value:= cmbWed.ItemIndex;
          Parameters.ParamByName('pSTimeWed').Value:= edtSWed.Text;
          Parameters.ParamByName('pETimeWed').Value:= edtEWed.Text;
          Parameters.ParamByName('pChkThu'  ).Value:= cmbThu.ItemIndex;
          Parameters.ParamByName('pSTimeThu').Value:= edtSThu.Text;
          Parameters.ParamByName('pETimeThu').Value:= edtEThu.Text;
          Parameters.ParamByName('pChkFri'  ).Value:= cmbFri.ItemIndex;
          Parameters.ParamByName('pSTimeFri').Value:= edtSFri.Text;
          Parameters.ParamByName('pETimeFri').Value:= edtEFri.Text;
          Parameters.ParamByName('pChkSat'  ).Value:= cmbSat.ItemIndex;
          Parameters.ParamByName('pSTimeSat').Value:= edtSSat.Text;
          Parameters.ParamByName('pETimeSat').Value:= edtESat.Text;
          Parameters.ParamByName('pWPNo'    ).Value:= edtWPNo.Value;
          Parameters.ParamByName('pParkNo'  ).Value:= StrToInt(cmbParkNo.Text);
          ExecSQL;
          dmTables.ADODB.CommitTrans;
        except
          on E: Exception do
          begin
            dmTables.ADODB.RollbackTrans;
            ExceptLogging('TfrmWP.btnSaveClick: ' + aString(E.Message));
            ShowMessage('저장중 오류발생! 관리자에 문의바랍니다.');
          end;
        end;
      end;
      Close;
      SQL.Clear;
      SQL.Add('Select * from WP Order By WPNo');
      Open;

      frmClear;
    end;
  except
    on E: Exception do ExceptLogging('TfrmWP.btnSaveClick: ' + aString(E.Message));
  end;
end;

procedure TfrmWP.dgWPClick(Sender: TObject);
begin
  try
    if qryWp.RecordCount > 0 then
    begin
      with qryWp do
      begin
        cmbParkNo.ItemIndex:= cmbParkNo.Items.IndexOf(IntToStr(FieldByName('ParkNo').AsInteger));
        edtWPNo.Value:= FieldByName('WPNo').AsInteger;
        edtWPName.Text:= FieldByName('WPName').AsString;

        cmbSun.ItemIndex:= FieldByName('ChkSun').AsInteger;
        cmbMon.ItemIndex:= FieldByName('ChkMon').AsInteger;
        cmbTue.ItemIndex:= FieldByName('ChkTue').AsInteger;
        cmbWed.ItemIndex:= FieldByName('ChkWed').AsInteger;
        cmbThu.ItemIndex:= FieldByName('ChkThu').AsInteger;
        cmbFri.ItemIndex:= FieldByName('ChkFri').AsInteger;
        cmbSat.ItemIndex:= FieldByName('ChkSat').AsInteger;

        edtSSun.Text:= FieldByName('STimeSun').AsString;
        edtESun.Text:= FieldByName('ETimeSun').AsString;
        edtSMon.Text:= FieldByName('STimeMon').AsString;
        edtEMon.Text:= FieldByName('ETimeMon').AsString;
        edtSTue.Text:= FieldByName('STimeTue').AsString;
        edtETue.Text:= FieldByName('ETimeTue').AsString;
        edtSWed.Text:= FieldByName('STimeWed').AsString;
        edtEWed.Text:= FieldByName('ETimeWed').AsString;
        edtSThu.Text:= FieldByName('STimeThu').AsString;
        edtEThu.Text:= FieldByName('ETimeThu').AsString;
        edtSFri.Text:= FieldByName('STimeFri').AsString;
        edtEFri.Text:= FieldByName('ETimeFri').AsString;
        edtSSat.Text:= FieldByName('STimeSat').AsString;
        edtESat.Text:= FieldByName('ETimeSat').AsString;

        btnCancel.Enabled:= True;
        btnDelete.Enabled:= True;

        nSelect:= 1;
      end;
    end;
  except
    on E: Exception do ExceptLogging('TfrmWP.dgWPClick: ' + aString(E.Message));
  end;
end;

procedure TfrmWP.FormShow(Sender: TObject);
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

    with qryWP do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from WP Order By WPNo');
      Open;
    end;
    frmClear;
  except
    on E: Exception do ExceptLogging('TfrmWP.FormShow: ' + aString(E.Message));
  end;
end;

procedure TfrmWP.frmClear;
begin
  try
    cmbParkNo.ItemIndex:= 0;
    edtWPNo.Value:= 0;
    edtWPName.Text:= '';

    cmbSun.ItemIndex:= 1;
    cmbMon.ItemIndex:= 1;
    cmbTue.ItemIndex:= 1;
    cmbWed.ItemIndex:= 1;
    cmbThu.ItemIndex:= 1;
    cmbFri.ItemIndex:= 1;
    cmbSat.ItemIndex:= 1;

    edtSSun.Text:= '00:00';
    edtESun.Text:= '23:59';
    edtSMon.Text:= '00:00';
    edtEMon.Text:= '23:59';
    edtSTue.Text:= '00:00';
    edtETue.Text:= '23:59';
    edtSWed.Text:= '00:00';
    edtEWed.Text:= '23:59';
    edtSThu.Text:= '00:00';
    edtEThu.Text:= '23:59';
    edtSFri.Text:= '00:00';
    edtEFri.Text:= '23:59';
    edtSSat.Text:= '00:00';
    edtESat.Text:= '23:59';

    btnDelete.Enabled:= False;
    btnCancel.Enabled:= False;
    edtWPNo.SetFocus;
    nSelect:= 0;
  except
    on E: Exception do ExceptLogging('TfrmWP.frmClear: ' + aString(E.Message));
  end;
end;

procedure TfrmWP.qryWPChkSunGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  Case qryWPChkSun.Value of
    0: Text:= '출입불가';
    1: Text:= '출입허용';
  end;
end;

procedure TfrmWP.qryWPChkMonGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  Case qryWPChkMon.Value of
    0: Text:= '출입불가';
    1: Text:= '출입허용';
  end;
end;

procedure TfrmWP.qryWPChkTueGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  Case qryWPChkTue.Value of
    0: Text:= '출입불가';
    1: Text:= '출입허용';
  end;
end;

procedure TfrmWP.qryWPChkWedGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  Case qryWPChkWed.Value of
    0: Text:= '출입불가';
    1: Text:= '출입허용';
  end;
end;

procedure TfrmWP.qryWPChkThuGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  Case qryWPChkThu.Value of
    0: Text:= '출입불가';
    1: Text:= '출입허용';
  end;
end;

procedure TfrmWP.qryWPChkFriGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  Case qryWPChkFri.Value of
    0: Text:= '출입불가';
    1: Text:= '출입허용';
  end;
end;

procedure TfrmWP.qryWPChkSatGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  Case qryWPChkSat.Value of
    0: Text:= '출입불가';
    1: Text:= '출입허용';
  end;
end;

end.
