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
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label13: TLabel;
    Label7: TLabel;
    edtUnitName: TAdvEdit;
    edtPortNo: TAdvSpinEdit;
    edtUnitNo: TAdvSpinEdit;
    cmbUnitKind: TAdvComboBox;
    cmbComPort: TAdvComboBox;
    cmbBaudrate: TAdvComboBox;
    cmbParkNo: TAdvComboBox;
    Label8: TLabel;
    edtVisitCardNo: TAdvEdit;
    edtParkMatching: TAdvEdit;
    Label11: TLabel;
    edtMainLprNo: TAdvEdit;
    Label10: TLabel;
    edtIPNo: TAdvMaskEdit;
    edtDspIP: TAdvMaskEdit;
    Panel2: TPanel;
    btnSave: TAdvToolButton;
    btnCancel: TAdvToolButton;
    btnDelete: TAdvToolButton;
    btnClose: TAdvToolButton;
    btnCopy: TAdvToolButton;
    qryTmp: TADOQuery;
    Label5: TLabel;
    edtMyNo: TAdvEdit;
    Label12: TLabel;
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
    procedure qryUnitInfoReserve1GetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure btnCopyClick(Sender: TObject);
    procedure edtIPNoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPortNoKeyPress(Sender: TObject; var Key: Char);
    procedure cmbUnitKindChange(Sender: TObject);
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
    edtVisitCardNo.Clear;
    edtParkMatching.Clear;
    edtMainLprNo.Clear;
    edtMyNo.Text :='0';

    edtUnitNo.SetFocus;
  except
    on E: Exception do ExceptLogging('TfrmParkInfo.frmClear: ' + E.Message);
  end;
end;

procedure TfrmUnitInfo.qryUnitInfoComPortGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Case qryUnitInfoComport.Value of
    0    : Text:= '????????';
    1..16: Text:= 'COM' + IntToStr(qryUnitInfoComport.Value);
  end;
end;

procedure TfrmUnitInfo.qryUnitInfoBaudrateGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Case qryUnitInfoBaudrate.Value of
    0 : Text:= '????????';
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

procedure TfrmUnitInfo.btnCopyClick(Sender: TObject);
var
  maxcnt: Integer;
  copyMyNo: Integer;
  inputIpStr: string;
begin
  if (Integer(cmbUnitKind.Items.Objects[cmbUnitKind.ItemIndex]) = 3) or
     (Integer(cmbUnitKind.Items.Objects[cmbUnitKind.ItemIndex]) = 8) or
     (Integer(cmbUnitKind.Items.Objects[cmbUnitKind.ItemIndex]) = 9) or
     (Integer(cmbUnitKind.Items.Objects[cmbUnitKind.ItemIndex]) = 10) or
     (Integer(cmbUnitKind.Items.Objects[cmbUnitKind.ItemIndex]) = 11) then begin
    inputIpStr := InputBox('??????????','?????? ?????? IP?????? ??????????(???????? ???????? ????)',trim(edtIPNo.Text));
  end;

  with dmTables.qryTemp do begin
    close;
    SQL.Clear;
    SQL.Text := 'select max(UnitNo)+1 From UnitInfo';
    Open;
    maxcnt := Fields[0].AsInteger;
  end;
  copyMyNo := qryUnitInfo.FieldByName('MyNo').AsInteger;
  with qryUnitInfo do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Insert UnitInfo ');
    SQL.Add('(ParkNo, UnitNo, UnitName, UnitKind, MyNo, ComPort, Baudrate, IPNo, PortNo, Reserve1, Reserve2, Reserve3, Reserve4) ');
    SQL.Add('Values (:pParkNo, :pUnitNo, :pUnitName, :pUnitKind, :pMyNo, :pComPort, ');
    SQL.Add(':pBaudrate, :pIPNo, :pPortNo, :pReserve1, :pReserve2, :pReserve3, :pReserve4) ');
    Parameters.ParamByName('pParkNo'  ).Value:= StrToInt(cmbParkNo.Text);
    Parameters.ParamByName('pUnitNo'  ).Value:= maxcnt;
    Parameters.ParamByName('pUnitName').Value:= edtUnitName.Text;
    Parameters.ParamByName('pUnitKind').Value:= cmbUnitKind.ItemIndex + 1;
    Parameters.ParamByName('pMyNo'    ).Value:= copyMyNo;
    Parameters.ParamByName('pComPort' ).Value:= cmbComPort.ItemIndex;

    if cmbBaudrate.ItemIndex = 0 then
      Parameters.ParamByName('pBaudrate').Value:= 0
    else
      Parameters.ParamByName('pBaudrate').Value:= StrToInt(MG_StrStrTrim(cmbBaudrate.Text, 'b', 'r'));

    if inputIpStr = '' then
      Parameters.ParamByName('pIPNo'    ).Value:= trim(edtIPNo.Text)
    else
      Parameters.ParamByName('pIPNo'    ).Value:= Trim(inputIpStr);
    Parameters.ParamByName('pPortNo'  ).Value:= edtPortNo.Value;

    if Trim(edtDspIP.Text) = '' then
      Parameters.ParamByName('pReserve1').Value:= Trim(edtDspIP.Text)
    else
      Parameters.ParamByName('pReserve1').Value:= Trim(inputIpStr);
    Parameters.ParamByName('pReserve2').Value:= edtVisitCardNo.Text;
    Parameters.ParamByName('pReserve3').Value:= Trim(edtParkMatching.Text);
    Parameters.ParamByName('pReserve4').Value:= Trim(edtMainLprNo.Text);
    ExecSQL;

    Close;
    SQL.Clear;
    SQL.Add('Select * from UnitInfo order by UnitNo');
    Open;

    frmClear;
    bSetupChange:= True;
  end;
end;

procedure TfrmUnitInfo.FormShow(Sender: TObject);
var
  i: Integer;
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
        ShowMessage('???????? ???? ??????????????!');
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
        i:=0;
        First;

        while not Eof do
        begin
          cmbUnitKind.Items.AddObject(FieldByName('KindName').AsString, TObject(FieldByName('UnitKind').AsInteger));
//          cmbUnitKind.Items.Add(FieldByName('KindName').AsString);
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
    dgUnitInfo.AutoSizeColumns(True);
    dgUnitInfo.AutoFitColumns();
  except
    on E: Exception do ExceptLogging('TfrmUnitInfo.FormShow: ' + E.Message);
  end;
end;

procedure TfrmUnitInfo.btnSaveClick(Sender: TObject);
begin
  try
    if StrToInt(cmbParkNo.Text) <> nCurrParkNo then
    begin
      ShowMessage('???????????? ????????. ???????? ??????!');
      cmbParkNo.SetFocus;
      Exit;
    end;

    if edtUnitNo.Value = 0 then
    begin
      ShowMessage('?????????? 1?????? ?????? ??????????.');
      edtUnitNo.SetFocus;
      Exit;
    end;

    with qryUnitInfo do
    begin
      if nSelect = 0 then
      begin
        //????...
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
            ShowMessage('???? ?????????? ???? ????????????.'#13#10 +
                        '?????????? ??????????????!');
            edtUnitNo.SetFocus;
            Exit;
          end;
        end;

        Close;
        SQL.Clear;
        SQL.Add('Insert UnitInfo ');
        SQL.Add('(ParkNo, UnitNo, UnitName, UnitKind, MyNo, ComPort, Baudrate, IPNo, PortNo, Reserve1, Reserve2, Reserve3, Reserve4) ');
        SQL.Add('Values (:pParkNo, :pUnitNo, :pUnitName, :pUnitKind, :pMyNo, :pComPort, ');
        SQL.Add(':pBaudrate, :pIPNo, :pPortNo, :pReserve1, :pReserve2, :pReserve3, :pReserve4) ');
        Parameters.ParamByName('pParkNo'  ).Value:= StrToInt(cmbParkNo.Text);
        Parameters.ParamByName('pUnitNo'  ).Value:= edtUnitNo.Value;
        Parameters.ParamByName('pUnitName').Value:= edtUnitName.Text;
        Parameters.ParamByName('pUnitKind').Value:= cmbUnitKind.Tag;
        Parameters.ParamByName('pMyNo'    ).Value:= nCurrUnitNo;
        Parameters.ParamByName('pComPort' ).Value:= cmbComPort.ItemIndex;

        if cmbBaudrate.ItemIndex = 0 then
          Parameters.ParamByName('pBaudrate').Value:= 0
        else
          Parameters.ParamByName('pBaudrate').Value:= StrToInt(MG_StrStrTrim(cmbBaudrate.Text, 'b', 'r'));
        Parameters.ParamByName('pIPNo'    ).Value:= trim(edtIPNo.Text);
        Parameters.ParamByName('pPortNo'  ).Value:= edtPortNo.Value;
        Parameters.ParamByName('pReserve1').Value:= Trim(edtDspIP.Text);
        Parameters.ParamByName('pReserve2').Value:= edtVisitCardNo.Text;
        Parameters.ParamByName('pReserve3').Value:= Trim(edtParkMatching.Text);
        Parameters.ParamByName('pReserve4').Value:= Trim(edtMainLprNo.Text);
        ExecSQL;
      end
      else
      if nSelect = 1 then
      begin
        //????...
        Close;
        SQL.Clear;
        SQL.Add('Update UnitInfo ');
        SQL.Add('Set UnitName = :pUnitName, UnitKind = :pUnitKind, Comport = :pComPort, ');
        SQL.Add('Baudrate = :pBaudrate, IPNo = :pIPNo, PortNo = :pPortNo, Reserve1 = :pReserve1 , Reserve2 = :pReserve2, Reserve3 = :pReserve3 , Reserve4 = :pReserve4, ');
        SQL.Add('MyNo = :pMyNo ');
        SQL.Add('Where ParkNo = :pParkNo and UnitNo = :pUnitNo');
        Parameters.ParamByName('pUnitName').Value:= edtUnitName.Text;
        Parameters.ParamByName('pUnitKind').Value:= cmbUnitKind.Tag;
        Parameters.ParamByName('pComPort' ).Value:= cmbComPort.ItemIndex;

        if cmbBaudrate.ItemIndex = 0 then
          Parameters.ParamByName('pBaudrate').Value:= 0
        else
          Parameters.ParamByName('pBaudrate').Value:= StrToInt(MG_StrStrTrim(cmbBaudrate.Text, 'b', 'r'));
        Parameters.ParamByName('pIPNo'    ).Value:= trim(edtIPNo.Text);
        Parameters.ParamByName('pPortNo'  ).Value:= edtPortNo.Value;
        Parameters.ParamByName('pParkNo'  ).Value:= StrToInt(cmbParkNo.Text);
        Parameters.ParamByName('pUnitNo'  ).Value:= edtUnitNo.Value;
        Parameters.ParamByName('pReserve1').Value:= Trim(edtDspIP.Text);
        Parameters.ParamByName('pReserve2').Value:= edtVisitCardNo.Text;
        Parameters.ParamByName('pReserve3').Value:= trim(edtParkMatching.Text);
        Parameters.ParamByName('pReserve4').Value:= trim(edtMainLprNo.Text);
        Parameters.ParamByName('pMyNo').Value:= trim(edtMyNo.Text);
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
  if (Integer(cmbUnitKind.Items.Objects[cmbUnitKind.ItemIndex]) = 8) or (Integer(cmbUnitKind.Items.Objects[cmbUnitKind.ItemIndex]) = 9) then
    edtDspIP.Text := edtIPNo.Text;

end;

procedure TfrmUnitInfo.cmbUnitKindChange(Sender: TObject);
begin
  if (cmbUnitKind.ItemIndex = 7) or (cmbUnitKind.ItemIndex = 8) then
  begin
    edtDspIP.Enabled:= True;
    edtDspIP.Color := clWhite;
  end
  else
  begin
    edtDspIP.Text:= '';
    edtDspIP.Enabled:= False;
    edtDspIP.Color := clSilver;
  end;
  if Integer(cmbUnitKind.Items.Objects[cmbUnitKind.ItemIndex]) = 101 then begin
    edtMainLprNo.Enabled := True;
    edtMainLprNo.Color := clWhite;
    cmbUnitKind.Tag := 101;
  end else if Integer(cmbUnitKind.Items.Objects[cmbUnitKind.ItemIndex]) = 102 then begin
    edtMainLprNo.Enabled := True;
    edtMainLprNo.Color := clWhite;
    cmbUnitKind.Tag := 102;
  end else begin
    edtMainLprNo.Enabled := False;
    edtMainLprNo.Color := clSilver;
    cmbUnitKind.Tag := cmbUnitKind.ItemIndex+1;
    edtMainLprNo.Text := '';
  end;
end;

procedure TfrmUnitInfo.btnCancelClick(Sender: TObject);
begin
  frmClear;
end;

procedure TfrmUnitInfo.btnDeleteClick(Sender: TObject);
begin
  try
    if MessageDlg('?????? ?????? ???????????', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;

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
var
  uKind: string;
begin
  try

    if qryUnitInfo.RecordCount > 0 then
    with qryUnitInfo do
    begin
      qryUnitInfo.RecNo := dgUnitInfo.Row;
      cmbParkNo.ItemIndex:= cmbParkNo.Items.IndexOf(IntToStr(FieldByName('ParkNo').AsInteger));
      edtUnitNo.Value:= FieldByName('UnitNo').AsInteger;
      edtUnitName.Text:= FieldByName('UnitName').AsString;

      qryTmp.Close;
      qryTmp.SQL.Text := 'Select KindName From UnitKind Where UnitKind = :v1';
      qryTmp.Parameters.ParamByName('v1').Value := qryUnitInfo.FieldByName('UnitKind').AsInteger;
      qryTmp.Open;
      qryTmp.First;
      if qryTmp.RecordCount > 0 then
        uKind := qryTmp.Fields[0].AsString;

      if uKind = '' then
        cmbUnitKind.ItemIndex:= FieldByName('UnitKind').AsInteger-1
      else
        cmbUnitKind.ItemIndex := cmbUnitKind.Items.IndexOf(uKind);
      cmbComPort.ItemIndex:= FieldByName('ComPort').AsInteger;

      if FieldByName('Baudrate').AsInteger = 0 then
        cmbBaudrate.ItemIndex:= 0
      else
        cmbBaudrate.ItemIndex:= cmbBaudrate.Items.IndexOf('br' + IntToStr(FieldByName('Baudrate').AsInteger));
      edtIPNo.Text:= FieldByName('IPNo').AsString;
      edtPortNo.Value:= FieldByName('PortNo').AsInteger;
      edtDspIP.Text:= FieldByName('Reserve1').AsString;
      edtVisitCardNo.Text:= FieldByName('Reserve2').AsString;

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
      edtParkMatching.Text := FieldByName('Reserve3').AsString;
      edtMainLprNo.Text := FieldByName('Reserve4').AsString;
      edtMyNo.Text := FieldByName('MyNO').AsString;
      cmbUnitKind.OnChange(Sender);

    end;
  except
    on E: Exception do ExceptLogging('TfrmUnitInfo.dgUnitInfoClick: ' + E.Message);
  end;
end;

procedure TfrmUnitInfo.edtIPNoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (cmbUnitKind.ItemIndex = 7) or (cmbUnitKind.ItemIndex = 8) then begin
    if Key = VK_TAB then begin
      edtDspIP.Text := Trim(edtIPNo.Text);
    end;
  end;
end;

procedure TfrmUnitInfo.edtPortNoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Char(VK_RETURN) then
    Perform(WM_NEXTDLGCTL,0,0);
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
