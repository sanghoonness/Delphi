unit UnitInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, BaseGrid, AdvGrid, DBAdvGrid, ExtCtrls, AdvPanel, ADODB,
  StdCtrls, Buttons, Mask, AdvEdit, AdvCombo, AdvSpin, AdvObj;

type
  TfrmUnitInfo = class(TForm)
    qryUnitKind: TADOQuery;
    qryUnitInfo: TADOQuery;
    dsUnitInfo: TDataSource;
    AdvPanel1: TAdvPanel;
    AdvPanel2: TAdvPanel;
    dgUnitInfo: TDBAdvGrid;
    qryUnitInfoParkNo: TSmallintField;
    qryUnitInfoUnitNo: TSmallintField;
    qryUnitInfoUnitName: TStringField;
    qryUnitInfoUnitKind: TWordField;
    qryUnitInfoMyNo: TWordField;
    qryUnitInfoComport: TIntegerField;
    qryUnitInfoBaudrate: TIntegerField;
    qryUnitInfoIPNo: TStringField;
    qryUnitInfoPortNo: TIntegerField;
    qryUnitInfoReserve1: TStringField;
    qryUnitInfoReserve2: TStringField;
    qryUnitInfoReserve3: TStringField;
    qryUnitInfoReserve4: TStringField;
    qryUnitInfoReserve5: TStringField;
    qryUnitKindUnitKind: TWordField;
    qryUnitKindKindName: TStringField;
    qryUnitKindReserve1: TStringField;
    qryUnitKindReserve2: TStringField;
    qryUnitKindReserve3: TStringField;
    qryUnitKindReserve4: TStringField;
    qryUnitKindReserve5: TStringField;
    qryUnitInfoKindName: TStringField;
    edtUnitName: TAdvEdit;
    edtPortNo: TAdvSpinEdit;
    edtUnitNo: TAdvSpinEdit;
    cmbUnitKind: TAdvComboBox;
    cmbComPort: TAdvComboBox;
    cmbBaudrate: TAdvComboBox;
    edtIPNo: TAdvMaskEdit;
    cmbParkNo: TAdvComboBox;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    btnDelete: TBitBtn;
    btnClose: TBitBtn;
    qryTemp: TADOQuery;
    procedure qryUnitInfoMyNoGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryUnitInfoComportGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryUnitInfoBaudrateGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure dgUnitInfoClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
    procedure frmClear;
  public
    { Public declarations }
  end;

var
  frmUnitInfo: TfrmUnitInfo;
  nSelect: Byte = 0;  //Insert:0, Modify:1;

implementation
uses
  Tables, Global;

{$R *.dfm}

procedure TfrmUnitInfo.frmClear;
begin
  try
    cmbParkNo.ItemIndex:= 0;
    edtUnitNo.Value:= 0;
    edtUnitName.Text:= '';
    cmbUnitKind.ItemIndex:= 0;
    cmbComPort.ItemIndex:= 0;
    cmbBaudrate.ItemIndex:= 0;
    edtIPNo.Text:= '';
    edtPortNo.Value:= 0;

    cmbParkNo.Enabled:= True;
    edtUnitNo.Enabled:= True;
    btnDelete.Enabled:= False;
    btnCancel.Enabled:= False;
    nSelect:= 0;
    cmbParkNo.SetFocus;
  except
    on E: Exception do ExceptLogging('TfrmUnitInfo.frmClear: ' + aString(E.Message));
  end;
end;

procedure TfrmUnitInfo.btnCancelClick(Sender: TObject);
begin
  frmClear;
end;

procedure TfrmUnitInfo.btnCloseClick(Sender: TObject);
begin
  qryTemp.Close;
  qryUnitInfo.Close;
  qryUnitKind.Close;
  Close;
end;

procedure TfrmUnitInfo.btnDeleteClick(Sender: TObject);
begin
  try
    if MessageDlg('선택한 기기를 삭제할까요?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;

    with qryUnitInfo do
    begin
      try
        dmTables.ADODB.BeginTrans;
        Close;
        SQL.Clear;
        SQL.Add('Delete from UnitInfo where ParkNo = :N1 and UnitNo = :N2');
        Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
        Parameters.ParamByName('N2').Value:= edtUnitNo.Value;
        ExecSQL;
        dmTables.ADODB.CommitTrans;
      except
        on E: Exception do
        begin
          dmTables.ADODB.RollbackTrans;
          ExceptLogging('TfrmUnitInfo.btnDeleteClick: ' + aString(E.Message));
          ShowMessage('삭제중 오류발생! 관리자에 문의바랍니다.');
        end;
      end;

      Close;
      SQL.Clear;
      SQL.Add('Select * from UnitInfo');
      Open;
    end;
    frmClear;
  except
    on E: Exception do ExceptLogging('TfrmUnitInfo.btnDeleteClick: ' + aString(E.Message));
  end;
end;

procedure TfrmUnitInfo.btnSaveClick(Sender: TObject);
begin
  try
    if edtUnitNo.Value = 0 then
    begin
      ShowMessage('기기번호는 1번부터 저장이 가능합니다.');
      edtUnitNo.SetFocus;
      Exit;
    end;

    with qryUnitInfo do
    begin
      if nSelect = 0 then
      begin
        //추가...
        with qryTemp do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Select * from UnitInfo where ParkNo = :N1 and UnitNo = :N2');
          Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
          Parameters.ParamByName('N2').Value:= edtUnitNo.Value;
          Open;

          if RecordCount > 0 then
          begin
            ShowMessage('해당 기기번호가 이미 사용중입니다.'#13#10 +
                        '기기번호를 변경하여주세요!');
            edtUnitNo.SetFocus;
            Exit;
          end;
        end;

        try
          dmTables.ADODB.BeginTrans;
          Close;
          SQL.Clear;
          SQL.Add('Insert UnitInfo ');
          SQL.Add('(ParkNo, UnitNo, UnitName, UnitKind, MyNo, ComPort, Baudrate, IPNo, PortNo) ');
          SQL.Add('Values (:pParkNo, :pUnitNo, :pUnitName, :pUnitKind, :pMyNo, :pComPort, :pBaudrate, :pIPNo, :pPortNo) ');
          Parameters.ParamByName('pParkNo'  ).Value:= StrToInt(cmbParkNo.Text);
          Parameters.ParamByName('pUnitNo'  ).Value:= edtUnitNo.Value;
          Parameters.ParamByName('pUnitName').Value:= edtUnitName.Text;
          Parameters.ParamByName('pUnitKind').Value:= cmbUnitKind.ItemIndex + 1;
          Parameters.ParamByName('pMyNo'    ).Value:= 0;
          Parameters.ParamByName('pComPort' ).Value:= cmbComPort.ItemIndex;

          if cmbBaudrate.ItemIndex = 0 then
            Parameters.ParamByName('pBaudrate').Value:= 0
          else
            Parameters.ParamByName('pBaudrate').Value:= StrToInt(MG_StrStrTrim(cmbBaudrate.Text, 'b', 'r'));
          Parameters.ParamByName('pIPNo'    ).Value:= edtIPNo.Text;
          Parameters.ParamByName('pPortNo'  ).Value:= edtPortNo.Value;
          ExecSQL;
          dmTables.ADODB.CommitTrans;
        except
          on E: Exception do
          begin
            dmTables.ADODB.RollbackTrans;
            ExceptLogging('TfrmUnitInfo.btnSaveClick: ' + aString(E.Message));
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
          SQL.Add('Update UnitInfo ');
          SQL.Add('Set UnitName = :pUnitName, UnitKind = :pUnitKind, Comport = :pComPort, ');
          SQL.Add('Baudrate = :pBaudrate, IPNo = :pIPNo, PortNo = :pPortNo ');
          SQL.Add('Where ParkNo = :pParkNo and UnitNo = :pUnitNo');
          Parameters.ParamByName('pUnitName').Value:= edtUnitName.Text;
          Parameters.ParamByName('pUnitKind').Value:= cmbUnitKind.ItemIndex + 1;
          Parameters.ParamByName('pComPort' ).Value:= cmbComPort.ItemIndex;

          if cmbBaudrate.ItemIndex = 0 then
            Parameters.ParamByName('pBaudrate').Value:= 0
          else
            Parameters.ParamByName('pBaudrate').Value:= StrToInt(MG_StrStrTrim(cmbBaudrate.Text, 'b', 'r'));
          Parameters.ParamByName('pIPNo'    ).Value:= edtIPNo.Text;
          Parameters.ParamByName('pPortNo'  ).Value:= edtPortNo.Value;
          Parameters.ParamByName('pParkNo'  ).Value:= StrToInt(cmbParkNo.Text);
          Parameters.ParamByName('pUnitNo'  ).Value:= edtUnitNo.Value;
          ExecSQL;
          dmTables.ADODB.CommitTrans;
        except
          on E: Exception do
          begin
            dmTables.ADODB.RollbackTrans;
            ExceptLogging('TfrmUnitInfo.btnSaveClick: ' + aString(E.Message));
            ShowMessage('저장중 오류발생! 관리자에 문의바랍니다.');
          end;
        end;
      end;
      Close;
      SQL.Clear;
      SQL.Add('Select * from UnitInfo');
      Open;

      frmClear;
    end;
  except
    on E: Exception do ExceptLogging('TfrmUnitInfo.btnSaveClick: ' + aString(E.Message));
  end;
end;

procedure TfrmUnitInfo.dgUnitInfoClick(Sender: TObject);
begin
  try
    if qryUnitInfo.RecordCount > 0 then
    with qryUnitInfo do
    begin
      cmbParkNo.ItemIndex:= cmbParkNo.Items.IndexOf(IntToStr(FieldByName('ParkNo').AsInteger));
      edtUnitNo.Value:= FieldByName('UnitNo').AsInteger;
      edtUnitName.Text:= FieldByName('UnitName').AsString;
      cmbUnitKind.ItemIndex:= FieldByName('UnitKind').AsInteger-1;
      cmbComPort.ItemIndex:= FieldByName('ComPort').AsInteger;

      if FieldByName('Baudrate').AsInteger = 0 then
        cmbBaudrate.ItemIndex:= 0
      else
        cmbBaudrate.ItemIndex:= cmbBaudrate.Items.IndexOf('br' + IntToStr(FieldByName('Baudrate').AsInteger));

      edtIPNo.Text:= FieldByName('IPNo').AsString;
      edtPortNo.Value:= FieldByName('PortNo').AsInteger;

      cmbParkNo.Enabled:= False;
      edtUnitNo.Enabled:= False;
      btnCancel.Enabled:= True;
      btnDelete.Enabled:= True;

      nSelect:= 1;
    end;
  except
    on E: Exception do ExceptLogging('TfrmUnitInfo.dgUnitInfoClick: ' + aString(E.Message));
  end;
end;

procedure TfrmUnitInfo.FormShow(Sender: TObject);
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
    cmbUnitKind.Items.Clear;

    with qryUnitKind do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from UnitKind Order By UnitKind');
      Open;

      if RecordCount > 0 then
      begin
        First;

        while not Eof do
        begin
          cmbUnitKind.Items.Add(FieldByName('KindName').AsString);
          Next;
        end;
        cmbUnitKind.ItemIndex:= 0;
      end;
    end;

    with qryUnitInfo do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from UnitInfo');
      Open;
    end;
    frmClear;
  except
    on E: Exception do ExceptLogging('TfrmUnitInfo.FormShow: ' + aString(E.Message));
  end;
end;

procedure TfrmUnitInfo.qryUnitInfoBaudrateGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Case qryUnitInfoBaudrate.Value of
    0 : Text:= '사용안함';
  else
    Text:= IntToStr(qryUnitInfoBaudrate.Value);
  end;
end;

procedure TfrmUnitInfo.qryUnitInfoComportGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Case qryUnitInfoComport.Value of
    0    : Text:= '사용안함';
    1..16: Text:= 'COM' + IntToStr(qryUnitInfoComport.Value);
  End;
end;

procedure TfrmUnitInfo.qryUnitInfoMyNoGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Case qryUnitInfoMyNo.Value of
    0: Text:= 'HOST';
    else
       Text:= 'FC(' + IntToStr(qryUnitInfoMyNo.Value) + ')';
  End;
end;

end.
