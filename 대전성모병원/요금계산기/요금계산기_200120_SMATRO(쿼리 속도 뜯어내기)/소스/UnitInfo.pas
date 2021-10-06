unit UnitInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, DBAdvGrid, AdvPanel, AdvAppStyler, DB,
  ADODB, Mask, AdvEdit, StdCtrls, AdvCombo, AdvSpin, ExtCtrls,
  AdvGlowButton, AdvToolBtn, AdvObj;

type
  TfrmUnitInfo = class(TForm)
    qryUnitInfo: TADOQuery;
    dsUnitInfo: TDataSource;
    qryUnitInfoParkNo: TSmallintField;
    qryUnitInfoUnitNo: TWordField;
    qryUnitInfoUnitName: TStringField;
    qryUnitInfoUnitKind: TWordField;
    qryUnitInfoMyNo: TWordField;
    qryUnitInfoComPort: TWordField;
    qryUnitInfoBaudrate: TWordField;
    qryUnitInfoIPNo: TStringField;
    qryUnitInfoPortNo: TIntegerField;
    qryUnitInfoReserve1: TStringField;
    qryUnitInfoReserve2: TStringField;
    qryUnitInfoReserve3: TStringField;
    qryUnitInfoReserve4: TStringField;
    qryUnitInfoReserve5: TStringField;
    qryUnitKind: TADOQuery;
    qryUnitKindUnitKind: TWordField;
    qryUnitKindKindName: TStringField;
    qryUnitKindReserve1: TStringField;
    qryUnitKindReserve2: TStringField;
    qryUnitKindReserve3: TStringField;
    qryUnitKindReserve4: TStringField;
    qryUnitKindReserve5: TStringField;
    qryUnitInfoKindName: TStringField;
    dgUnitInfo: TDBAdvGrid;
    Panel1: TPanel;
    AdvPanel1: TAdvPanel;
    Bevel1: TBevel;
    Label1: TLabel;
    Bevel2: TBevel;
    Label2: TLabel;
    Bevel3: TBevel;
    Label3: TLabel;
    Bevel4: TBevel;
    Label4: TLabel;
    Bevel5: TBevel;
    Label5: TLabel;
    Bevel6: TBevel;
    Label6: TLabel;
    Bevel9: TBevel;
    Label9: TLabel;
    Bevel13: TBevel;
    Label13: TLabel;
    Bevel7: TBevel;
    Label7: TLabel;
    edtUnitName: TAdvEdit;
    edtPortNo: TAdvSpinEdit;
    edtUnitNo: TAdvSpinEdit;
    cmbUnitKind: TAdvComboBox;
    cmbComPort: TAdvComboBox;
    cmbBaudrate: TAdvComboBox;
    edtIPNo: TAdvMaskEdit;
    cmbParkNo: TAdvComboBox;
    edtDspIP: TAdvMaskEdit;
    btnSave: TAdvToolButton;
    btnCancel: TAdvToolButton;
    btnDelete: TAdvToolButton;
    btnClose: TAdvToolButton;
    procedure qryUnitInfoComPortGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryUnitInfoBaudrateGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure cmbParkNoChange(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure dgUnitInfoClick(Sender: TObject);
    procedure qryUnitInfoMyNoGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cmbUnitKindChange(Sender: TObject);
    procedure qryUnitInfoReserve1GetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
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
    edtDspIP.Text:= '';
    edtPortNo.Value:= 0;
    cmbParkNo.Enabled:= True;
    edtUnitNo.Enabled:= True;
    btnDelete.Enabled:= False;
    btnCancel.Enabled:= False;
    nSelect:= 0;
    cmbParkNo.SetFocus;
  except
    on E: Exception do ExceptLogging('TfrmParkInfo.frmClear: ' + E.Message);
  end;
end;

procedure TfrmUnitInfo.qryUnitInfoComPortGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Case qryUnitInfoComport.Value of
    0    : Text:= '사용안함';
    1..16: Text:= 'COM' + IntToStr(qryUnitInfoComport.Value);
  end;
end;

procedure TfrmUnitInfo.qryUnitInfoBaudrateGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Case qryUnitInfoBaudrate.Value of
    0 : Text:= '사용안함';
  else
    Text:= IntToStr(qryUnitInfoBaudrate.Value);
  end;
end;

procedure TfrmUnitInfo.btnCloseClick(Sender: TObject);
begin
  dmTables.qryTemp.Close;
  qryUnitInfo.Close;
  qryUnitKind.Close;

  Close;
end;

procedure TfrmUnitInfo.FormShow(Sender: TObject);
begin
  try
    with dmTables.qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from ParkInfo');
      Open;
      if RecordCount <= 0 then
      begin
        ShowMessage('주차장을 먼저 설정하여주세요!');
        Close;
        frmUnitInfo.Close;
      end;
      cmbParkNo.Items.Clear;

      while not Eof do
      begin
        cmbParkNo.Items.Add(IntToStr(FieldByName('ParkNo').AsInteger));
        Next;
      end;
      cmbParkNo.ItemIndex:= 0;
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
    on E: Exception do ExceptLogging('TfrmUnitInfo.FormShow: ' + E.Message);
  end;
end;

procedure TfrmUnitInfo.btnSaveClick(Sender: TObject);
begin
  try
    if StrToInt(cmbParkNo.Text) <> nCurrParkNo then
    begin
      ShowMessage('주차장번호가 다릅니다. 확인하여 주세요!');
      cmbParkNo.SetFocus;
      Exit;
    end;

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
        with dmTables.qryTemp do
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

        Close;
        SQL.Clear;
        SQL.Add('Insert UnitInfo ');
        SQL.Add('(ParkNo, UnitNo, UnitName, UnitKind, MyNo, ComPort, Baudrate, IPNo, PortNo, Reserve1) ');
        SQL.Add('Values (:pParkNo, :pUnitNo, :pUnitName, :pUnitKind, :pMyNo, :pComPort, ');
        SQL.Add(':pBaudrate, :pIPNo, :pPortNo, :pReserve1) ');
        Parameters.ParamByName('pParkNo'  ).Value:= StrToInt(cmbParkNo.Text);
        Parameters.ParamByName('pUnitNo'  ).Value:= edtUnitNo.Value;
        Parameters.ParamByName('pUnitName').Value:= edtUnitName.Text;
        Parameters.ParamByName('pUnitKind').Value:= cmbUnitKind.ItemIndex + 1;
        Parameters.ParamByName('pMyNo'    ).Value:= nCurrUnitNo;
        Parameters.ParamByName('pComPort' ).Value:= cmbComPort.ItemIndex;

        if cmbBaudrate.ItemIndex = 0 then
          Parameters.ParamByName('pBaudrate').Value:= 0
        else
          Parameters.ParamByName('pBaudrate').Value:= StrToInt(MG_StrStrTrim(cmbBaudrate.Text, 'b', 'r'));
        Parameters.ParamByName('pIPNo'    ).Value:= MG_StrTrim(edtIPNo.Text, ' ');
        Parameters.ParamByName('pPortNo'  ).Value:= edtPortNo.Value;
        Parameters.ParamByName('pReserve1').Value:= MG_StrTrim(edtDspIP.Text, ' ');
        ExecSQL;
      end
      else
      if nSelect = 1 then
      begin
        //수정...
        Close;
        SQL.Clear;
        SQL.Add('Update UnitInfo ');
        SQL.Add('Set UnitName = :pUnitName, UnitKind = :pUnitKind, Comport = :pComPort, ');
        SQL.Add('Baudrate = :pBaudrate, IPNo = :pIPNo, PortNo = :pPortNo, Reserve1 = :pReserve1 ');
        SQL.Add('Where ParkNo = :pParkNo and UnitNo = :pUnitNo');
        Parameters.ParamByName('pUnitName').Value:= edtUnitName.Text;
        Parameters.ParamByName('pUnitKind').Value:= cmbUnitKind.ItemIndex + 1;
        Parameters.ParamByName('pComPort' ).Value:= cmbComPort.ItemIndex;

        if cmbBaudrate.ItemIndex = 0 then
          Parameters.ParamByName('pBaudrate').Value:= 0
        else
          Parameters.ParamByName('pBaudrate').Value:= StrToInt(MG_StrStrTrim(cmbBaudrate.Text, 'b', 'r'));
        Parameters.ParamByName('pIPNo'    ).Value:= MG_StrTrim(edtIPNo.Text, ' ');
        Parameters.ParamByName('pPortNo'  ).Value:= edtPortNo.Value;
        Parameters.ParamByName('pParkNo'  ).Value:= StrToInt(cmbParkNo.Text);
        Parameters.ParamByName('pUnitNo'  ).Value:= edtUnitNo.Value;
        Parameters.ParamByName('pReserve1').Value:= MG_StrTrim(edtDspIP.Text, ' ');
        ExecSQL;
      end;
      Close;
      SQL.Clear;
      SQL.Add('Select * from UnitInfo');
      Open;

      frmClear;
      bSetupChange:= True;
    end;
  except
    on E: Exception do ExceptLogging('TfrmUnitInfo.btnSaveClick: ' + E.Message);
  end;
end;

procedure TfrmUnitInfo.cmbParkNoChange(Sender: TObject);
begin
  btnCancel.Enabled:= True;
end;

procedure TfrmUnitInfo.cmbUnitKindChange(Sender: TObject);
begin
  if (cmbUnitKind.ItemIndex = 7) or (cmbUnitKind.ItemIndex = 8) then
  begin
    edtDspIP.Enabled:= True;
  end
  else
  begin
    edtDspIP.Text:= '';
    edtDspIP.Enabled:= False;
  end;
end;

procedure TfrmUnitInfo.btnCancelClick(Sender: TObject);
begin
  frmClear;
end;

procedure TfrmUnitInfo.btnDeleteClick(Sender: TObject);
begin
  try
    if MessageDlg('선택한 기기를 삭제할까요?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;

    with qryUnitInfo do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Delete from UnitInfo where ParkNo = :N1 and UnitNo = :N2');
      Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
      Parameters.ParamByName('N2').Value:= edtUnitNo.Value;
      ExecSQL;

      Close;
      SQL.Clear;
      SQL.Add('Select * from UnitInfo');
      Open;
    end;
    frmClear;
  except
    on E: Exception do ExceptLogging('TfrmUnitInfo.btnDeleteClick: ' + E.Message);
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
      edtDspIP.Text:= FieldByName('Reserve1').AsString;

      if (cmbUnitKind.ItemIndex = 7) or (cmbUnitKind.ItemIndex = 8) then
      begin
        edtDspIP.Enabled:= True;
      end
      else
      begin
        edtDspIP.Text:= '';
        edtDspIP.Enabled:= False;
      end;

      cmbParkNo.Enabled:= False;
      edtUnitNo.Enabled:= False;
      btnCancel.Enabled:= True;
      btnDelete.Enabled:= True;

      nSelect:= 1;
    end;
  except
    on E: Exception do ExceptLogging('TfrmUnitInfo.dgUnitInfoClick: ' + E.Message);
  end;
end;

procedure TfrmUnitInfo.qryUnitInfoMyNoGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Case qryUnitInfoMyNo.Value of
    0: Text:= 'HOST';
    else
       Text:= 'FC(' + IntToStr(qryUnitInfoMyNo.Value) + ')';
  end;
end;

procedure TfrmUnitInfo.qryUnitInfoReserve1GetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if (qryUnitInfoUnitKind.Value = 8) or (qryUnitInfoUnitKind.Value = 9) then
    Text:= qryUnitInfoReserve1.Value
  else
    Text:= '';
end;

end.
