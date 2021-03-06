unit DCInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, DB, ADODB, StdCtrls, AdvCombo, Mask, AdvSpin,
  AdvEdit, Grids, BaseGrid, AdvGrid, DBAdvGrid, Buttons, AdvObj;

type
  TfrmDCInfo = class(TForm)
    AdvPanel1: TAdvPanel;
    qryDCInfo: TADOQuery;
    dsDCInfo: TDataSource;
    AdvPanel2: TAdvPanel;
    edtDCName: TAdvEdit;
    edtDCValue: TAdvSpinEdit;
    edtDCNo: TAdvSpinEdit;
    cmbDCType: TAdvComboBox;
    cmbParkNo: TAdvComboBox;
    edtDCUseCnt: TAdvSpinEdit;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    btnDelete: TBitBtn;
    btnClose: TBitBtn;
    dgDCInfo: TDBAdvGrid;
    qryTemp: TADOQuery;
    edtReserve2: TAdvSpinEdit;
    cmbReserve3: TAdvComboBox;
    cmbReserve7: TAdvComboBox;
    qryDCInfoParkNo: TSmallintField;
    qryDCInfoDCNo: TWordField;
    qryDCInfoDCName: TStringField;
    qryDCInfoDCValue: TIntegerField;
    qryDCInfoDCType: TWordField;
    qryDCInfoDCUseCnt: TWordField;
    qryDCInfoReserve2: TStringField;
    qryDCInfoReserve3: TStringField;
    qryDCInfoReserve4: TStringField;
    qryDCInfoReserve5: TStringField;
    qryDCInfoReserve6: TStringField;
    qryDCInfoReserve7: TStringField;
    edtDCValue1: TAdvSpinEdit;
    cmbRealUse: TAdvComboBox;
    cmbButtonUse: TAdvComboBox;
    cmbRemoteUse: TAdvComboBox;
    cmbFixedUse: TAdvComboBox;
    cmbWebUse: TAdvComboBox;
    cmbCamUse: TAdvComboBox;
    cmbMagneticUse: TAdvComboBox;
    cmbBarcodeUse: TAdvComboBox;
    cmbOcsUse: TAdvComboBox;
    cmbDirectDiscountUse: TAdvComboBox;
    cmbPreDiscountUse: TAdvComboBox;
    cmbRemarkUse: TAdvComboBox;
    qryDCInfoDCValue1: TIntegerField;
    qryDCInfoVisibleCnt: TIntegerField;
    qryDCInfoRealUse: TWordField;
    qryDCInfoButtonUse: TWordField;
    qryDCInfoRemoteButtonUse: TWordField;
    qryDCInfoWebUse: TWordField;
    qryDCInfoFixedUse: TWordField;
    qryDCInfoDCTypeCode: TWordField;
    qryDCInfoCamUse: TWordField;
    qryDCInfoReserve1: TStringField;
    qryDCInfoReserve8: TStringField;
    qryDCInfoReserve9: TStringField;
    qryDCInfoReserve10: TIntegerField;
    qryDCInfoPrintName: TStringField;
    qryDCInfoBarcodeUse: TWordField;
    qryDCInfoMagneticUse: TWordField;
    qryDCInfoOcsUse: TWordField;
    qryDCInfoRemoteUse: TWordField;
    qryDCInfoDiscountConfirmUse: TWordField;
    qryDCInfoPreDiscountUse: TWordField;
    qryDCInfoDirectDiscountUse: TWordField;
    qryDCInfoRemarkUse: TWordField;
    cmbFeeItem: TAdvComboBox;
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
    qryDCInfoFeeNo: TIntegerField;
    procedure qryDCInfoDCTypeGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryDCInfoDCUseCntGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure dgDCInfoClick(Sender: TObject);
    procedure qryDCInfoRealUseGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryDCInfoButtonUseGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryDCInfoRemoteButtonUseGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryDCInfoWebUseGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryDCInfoFixedUseGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryDCInfoCamUseGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryDCInfoBarcodeUseGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryDCInfoMagneticUseGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryDCInfoOcsUseGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryDCInfoRemoteUseGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);

    procedure qryDCInfoDirectDiscountUseGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure qryDCInfoPreDiscountUseGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryDCInfoRemarkUseGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryDCInfoReserve7GetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryDCInfoReserve3GetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    { Private declarations }
    procedure frmClear;
  public
    { Public declarations }
  end;

var
  frmDCInfo: TfrmDCInfo;
  nSelect: Byte = 0;  //Insert:0, Modify:1;

implementation
uses
  Tables, Global;

{$R *.dfm}

procedure TfrmDCInfo.btnCancelClick(Sender: TObject);
begin
  frmClear;
end;

procedure TfrmDCInfo.btnCloseClick(Sender: TObject);
begin
  qryTemp.Close;
  qryDCInfo.Close;
  ModalResult := mrCancel;
  //Close;
end;

procedure TfrmDCInfo.btnDeleteClick(Sender: TObject);
begin
  try
    if MessageDlg('?????? ?????????? ???????????', mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;

    with qryDCInfo do
    begin
      try
        dmTables.ADODB.BeginTrans;
        Close;
        SQL.Clear;
        SQL.Add('Delete from DCInfo where ParkNo = :N1 and DCNo = :N2');
        Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
        Parameters.ParamByName('N2').Value:= edtDCNo.Value;
        ExecSQL;
        dmTables.ADODB.CommitTrans;
      except
        on E: Exception do
        begin
          dmTables.ADODB.RollbackTrans;
          ExceptLogging('TfrmDCInfo.btnDeleteClick: ' + aString(E.Message));
          ShowMessage('?????? ????????! ???????? ????????????.');
        end;
      end;

      Close;
      SQL.Clear;
      SQL.Add('Select * from DCInfo');
      Open;
    end;
    frmClear;
  except
    on E: Exception do ExceptLogging('TfrmDCInfo.btnDeleteClick: ' + aString(E.Message));
  end;
end;

procedure TfrmDCInfo.btnSaveClick(Sender: TObject);
begin
  try
    if edtDCNo.Value = 0 then
    begin
      ShowMessage('?????????? 1?????? ?????? ??????????.');
      edtDCNo.SetFocus;
      Exit;
    end;

    with qryDCInfo do
    begin
      if nSelect = 0 then
      begin
        //????...
        with qryTemp do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Select * from DCInfo where ParkNo = :N1 and DCNo = :N2');
          Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
          Parameters.ParamByName('N2').Value:= edtDCNo.Value;
          Open;

          if RecordCount > 0 then
          begin
            ShowMessage('???? ?????????? ???? ????????????.'#13#10 +
                        '?????????? ??????????????!');
            edtDCNo.SetFocus;
            Exit;
          end;
        end;

        try
          dmTables.ADODB.BeginTrans;
          Close;
          SQL.Clear;
          SQL.Add('Insert DCInfo ');
          SQL.Add('(ParkNo, DCNo, DCName, DCValue, DCType, DCUseCnt, Reserve2, Reserve3, Reserve7 ');
          SQL.Add(', Dcvalue1, RealUse, ButtonUse, RemoteButtonUse, RemoteUse, FixedUse  ');
          SQL.Add(', WebUse, CamUse, MagneticUse, BarcodeUse, OcsUse, DirectDiscountUse, PreDiscountUse, RemarkUse, FeeNo ) ');
          SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :pReserve2, :pReserve3, :pReserve7 ');
          SQL.Add(', :pDcvalue1, :pRealUse, :pButtonUse, :pRemoteButtonUse, :pRemoteUse, :pFixedUse ');
          SQL.Add(', :pWebUse, :pCamUse, :pMagneticUse, :pBarcodeUse, :pOcsUse, :pDirectDiscountUse, :pPreDiscountUse, :pRemarkUse, :pFeeNo ) ');
          Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
          Parameters.ParamByName('N2').Value:= edtDCNo.Value;
          Parameters.ParamByName('N3').Value:= edtDCName.Text;
          Parameters.ParamByName('N4').Value:= edtDCValue.Value;
          Parameters.ParamByName('N5').Value:= cmbDCType.ItemIndex;
          Parameters.ParamByName('N6').Value:= edtDCUseCnt.Value;
          Parameters.ParamByName('pReserve2').Value:= edtReserve2.value;            // ????????
          Parameters.ParamByName('pReserve3').Value:= cmbReserve3.ItemIndex + 1;    // ?????????? ( 1:????, 2: ????)
          Parameters.ParamByName('pReserve7').Value:= cmbReserve7.ItemIndex;        // ???????? (0: ???????? ????????, 1: ???????? ????????)
          Parameters.ParamByName('pDcvalue1').Value:= edtDCValue1.Value;
          Parameters.ParamByName('pRealUse').Value:= cmbRealUse.ItemIndex;
          Parameters.ParamByName('pButtonUse').Value:= cmbButtonUse.ItemIndex;
          Parameters.ParamByName('pRemoteButtonUse').Value:= cmbRemoteUse.ItemIndex;
          Parameters.ParamByName('pRemoteUse').Value:= cmbRemoteUse.ItemIndex;
          Parameters.ParamByName('pFixedUse').Value:= cmbFixedUse.ItemIndex;
          Parameters.ParamByName('pWebUse').Value:= cmbWebUse.ItemIndex;
          Parameters.ParamByName('pCamUse').Value:= cmbCamUse.ItemIndex;
          Parameters.ParamByName('pMagneticUse').Value:= cmbMagneticUse.ItemIndex;
          Parameters.ParamByName('pBarcodeUse').Value:= cmbBarcodeUse.ItemIndex;
          Parameters.ParamByName('pOcsUse').Value:= cmbOcsUse.ItemIndex;
          Parameters.ParamByName('pDirectDiscountUse').Value:= cmbDirectDiscountUse.ItemIndex;
          Parameters.ParamByName('pPreDiscountUse').Value:= cmbPreDiscountUse.ItemIndex;
          Parameters.ParamByName('pRemarkUse').Value:= cmbRemarkUse.ItemIndex;
          Parameters.ParamByName('pFeeNo').Value:= cmbFeeItem.ItemIndex;
          ExecSQL;
          dmTables.ADODB.CommitTrans;
        except
          on E: Exception do
          begin
            dmTables.ADODB.RollbackTrans;
            ExceptLogging('TfrmDCInfo.btnSaveClick: ' + aString(E.Message));
            ShowMessage('?????? ????????! ???????? ????????????.');
          end;
        end;
      end
      else
      if nSelect = 1 then
      begin
        //????...
        try
          dmTables.ADODB.BeginTrans;
          Close;
          SQL.Clear;
          SQL.Add('Update DCInfo ');
          SQL.Add('Set DCName = :N3, DCValue = :N4, DCType = :N5, DCUseCnt = :N6 ');
          SQL.Add(', Reserve2 = :pReserve2 , Reserve3 = :pReserve3 , Reserve7 = :pReserve7 ');
          SQL.Add(', Dcvalue1 = :pDcvalue1, RealUse = :pRealUse, ButtonUse = :pButtonUse ');
          SQL.Add(', RemoteButtonUse = :pRemoteButtonUse, RemoteUse = :pRemoteUse, FixedUse = :pFixedUse ');
          SQL.Add(', WebUse = :pWebUse, CamUse = :pCamUse, MagneticUse = :pMagneticUse, BarcodeUse = :pBarcodeUse ');
          SQL.Add(', OcsUse = :pOcsUse, DirectDiscountUse = :pDirectDiscountUse, PreDiscountUse = :pPreDiscountUse, RemarkUse = :pRemarkUse, FeeNo = :pFeeNo ');
          SQL.Add('Where ParkNo = :N1 and DCNo = :N2');
          Parameters.ParamByName('N1').Value:= StrToInt(cmbParkNo.Text);
          Parameters.ParamByName('N2').Value:= edtDCNo.Value;
          Parameters.ParamByName('N3').Value:= edtDCName.Text;
          Parameters.ParamByName('N4').Value:= edtDCValue.Value;
          Parameters.ParamByName('N5').Value:= cmbDCType.ItemIndex;
          Parameters.ParamByName('N6').Value:= edtDCUseCnt.Value;
          Parameters.ParamByName('pReserve2').Value:= edtReserve2.value;            // ????????
          Parameters.ParamByName('pReserve3').Value:= cmbReserve3.ItemIndex + 1;    // ?????????? ( 1:????, 2: ????)
          Parameters.ParamByName('pReserve7').Value:= cmbReserve7.ItemIndex;        // ???????? (0: ???????? ????????, 1: ???????? ????????)
          Parameters.ParamByName('pDcvalue1').Value:= edtDCValue1.Value;
          Parameters.ParamByName('pRealUse').Value:= cmbRealUse.ItemIndex;
          Parameters.ParamByName('pButtonUse').Value:= cmbButtonUse.ItemIndex;
          Parameters.ParamByName('pRemoteButtonUse').Value:= cmbRemoteUse.ItemIndex;
          Parameters.ParamByName('pRemoteUse').Value:= cmbRemoteUse.ItemIndex;
          Parameters.ParamByName('pFixedUse').Value:= cmbFixedUse.ItemIndex;
          Parameters.ParamByName('pWebUse').Value:= cmbWebUse.ItemIndex;
          Parameters.ParamByName('pCamUse').Value:= cmbCamUse.ItemIndex;
          Parameters.ParamByName('pMagneticUse').Value:= cmbMagneticUse.ItemIndex;
          Parameters.ParamByName('pBarcodeUse').Value:= cmbBarcodeUse.ItemIndex;
          Parameters.ParamByName('pOcsUse').Value:= cmbOcsUse.ItemIndex;
          Parameters.ParamByName('pDirectDiscountUse').Value:= cmbDirectDiscountUse.ItemIndex;
          Parameters.ParamByName('pPreDiscountUse').Value:= cmbPreDiscountUse.ItemIndex;
          Parameters.ParamByName('pRemarkUse').Value:= cmbRemarkUse.ItemIndex;
          Parameters.ParamByName('pFeeNo').Value:= cmbFeeItem.ItemIndex;
          ExecSQL;
          dmTables.ADODB.CommitTrans;
        except
          on E: Exception do
          begin
            dmTables.ADODB.RollbackTrans;
            ExceptLogging('TfrmDCInfo.btnSaveClick: ' + aString(E.Message));
            ShowMessage('?????? ????????! ???????? ????????????.');
          end;
        end;
      end;
      Close;
      SQL.Clear;
      SQL.Add('Select * from DCInfo');
      Open;

      frmClear;
    end;
  except
    on E: Exception do ExceptLogging('TfrmDCInfo.btnSaveClick: ' + aString(E.Message));
  end;
end;

procedure TfrmDCInfo.dgDCInfoClick(Sender: TObject);
begin
  try
    if qryDCInfo.RecordCount > 0 then
      with qryDCInfo do
      begin
        cmbParkNo.ItemIndex:= cmbParkNo.Items.IndexOf(IntToStr(FieldByName('ParkNo').AsInteger));
        edtDCNo.Value:= FieldByName('DCNo').AsInteger;
        edtDCName.Text:= FieldByName('DCName').AsString;
        edtDCValue.Value:= FieldByName('DCValue').AsInteger;
        cmbDCType.ItemIndex:= FieldByName('DCType').AsInteger;
        edtDCUseCnt.Value:= FieldByName('DCUseCnt').AsInteger;

        edtReserve2.Value := FieldByName('Reserve2').AsInteger;   // ????????
        cmbReserve3.ItemIndex := FieldByName('Reserve3').AsInteger - 1 ; // ???? ????
        cmbReserve7.ItemIndex := FieldByName('Reserve7').AsInteger;

        edtDCValue1.Value := FieldByName('DCValue1').AsInteger;
        cmbRealUse.ItemIndex := FieldByName('RealUse').AsInteger;       // ????????
        cmbButtonUse.ItemIndex := FieldByName('ButtonUse').AsInteger;   // ??????????
        cmbRemoteUse.ItemIndex := FieldByName('RemoteUse').AsInteger;   // ????????
        cmbFixedUse.ItemIndex := FieldByName('FixedUse').AsInteger;     // ????????
        cmbWebUse.ItemIndex := FieldByName('WebUse').AsInteger;         // ??????
        cmbCamUse.ItemIndex := FieldByName('CamUse').AsInteger;         // ??????????
        cmbMagneticUse.ItemIndex := FieldByName('MagneticUse').AsInteger; // ????????
        cmbBarcodeUse.ItemIndex := FieldByName('BarcodeUse').AsInteger;    // ??????
        cmbOcsUse.ItemIndex := FieldByName('OcsUse').AsInteger;         // ocs
        cmbDirectDiscountUse.ItemIndex := FieldByName('DirectDiscountUse').AsInteger;   // ????????
        cmbPreDiscountUse.ItemIndex := FieldByName('PreDiscountUse').AsInteger;  // ????????????
        cmbRemarkUse.ItemIndex := FieldByName('RemarkUse').AsInteger;  // ????????????
        cmbFeeItem.ItemIndex := FieldByName('FeeNo').AsInteger;  // ????????

        cmbParkNo.Enabled:= False;
        edtDCNo.Enabled:= False;
        btnCancel.Enabled:= True;
        btnDelete.Enabled:= True;

        nSelect:= 1;
      end;
  except
    on E: Exception do ExceptLogging('TfrmDCInfo.dgFeeItemClick: ' + aString(E.Message));
  end;
end;

procedure TfrmDCInfo.FormShow(Sender: TObject);
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
        ShowMessage('???????? ???? ??????????????!');
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
    cmbFeeItem.Items.Add('????????');

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

    with qryDCInfo do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from DCInfo');
      Open;
    end;
    frmClear;
  except
    on E: Exception do ExceptLogging('TfrmDCInfo.FormShow: ' + aString(E.Message));
  end;
end;

procedure TfrmDCInfo.frmClear;
begin
  try
    cmbParkNo.ItemIndex:= 0;
    edtDCNo.Value:= 0;
    edtDCName.Text:= '';
    edtDCValue.Value:= 0;
    edtDCValue1.Value := 0;
    cmbDCType.ItemIndex:= 0;
    edtDCUseCnt.Value:= 0;

    cmbRealUse.ItemIndex := 0;
    cmbButtonUse.ItemIndex := 0;
    cmbRemoteUse.ItemIndex := 0;
    cmbFixedUse.ItemIndex := 0;
    cmbWebUse.ItemIndex := 0;
    cmbCamUse.ItemIndex := 0;
    cmbMagneticUse.ItemIndex := 0;
    cmbBarcodeUse.ItemIndex := 0;
    cmbOcsUse.ItemIndex := 0;
    cmbDirectDiscountUse.ItemIndex := 0;
    cmbPreDiscountUse.ItemIndex := 0;
    cmbRemarkUse.ItemIndex := 0;

    edtReserve2.Value := 0;

    cmbParkNo.Enabled:= True;
    edtDCNo.Enabled:= True;
    btnDelete.Enabled:= False;
    btnCancel.Enabled:= False;
    nSelect:= 0;
    cmbParkNo.SetFocus;
  except
    on E: Exception do ExceptLogging('TfrmDCInfo.frmClear: ' + aString(E.Message));
  end;
end;

// ??????
procedure TfrmDCInfo.qryDCInfoBarcodeUseGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  case qryDCInfoBarcodeUse.Value of
    0 : Text := '????????';
    1 : Text := '????';
  end;
end;


// ??????????
procedure TfrmDCInfo.qryDCInfoButtonUseGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  case qryDCInfoButtonUse.Value of
    0 : Text := '????????';
    1 : Text := '????';
  end;
end;

// ??????????
procedure TfrmDCInfo.qryDCInfoCamUseGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  case qryDCInfoCamUse.Value of
    0 : Text := '????????';
    1 : Text := '????';
  end;
end;

procedure TfrmDCInfo.qryDCInfoDCTypeGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Case qryDCInfoDCType.Value of
    0: Text:= '????????';
    1: Text:= '????????';
    2: Text:= '??????????';
  end;
end;

procedure TfrmDCInfo.qryDCInfoDCUseCntGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Case qryDCInfoDCUseCnt.Value of
    0: Text:= '????????';
    else
      Text:= IntToStr(qryDCInfoDCUseCnt.Value) + '??';
  end;
end;

// ????????
procedure TfrmDCInfo.qryDCInfoDirectDiscountUseGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  case qryDCInfoDirectDiscountUse.Value of
    0 : Text := '????????';
    1 : Text := '????';
  end;
end;

// ????????
procedure TfrmDCInfo.qryDCInfoFixedUseGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  case qryDCInfoFixedUse.Value of
    0 : Text := '????????';
    1 : Text := '????';
  end;
end;

// ????????
procedure TfrmDCInfo.qryDCInfoMagneticUseGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  case qryDCInfoMagneticUse.Value of
    0 : Text := '????????';
    1 : Text := '????';
  end;
end;

//  ocs
procedure TfrmDCInfo.qryDCInfoOcsUseGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  case qryDCInfoOcsUse.Value of
    0 : Text := '????????';
    1 : Text := '????';
  end;
end;

// ????????????
procedure TfrmDCInfo.qryDCInfoPreDiscountUseGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  case qryDCInfoPreDiscountUse.Value of
    0 : Text := '????????';
    1 : Text := '????';
  end;
end;

// ????????
procedure TfrmDCInfo.qryDCInfoRealUseGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  case qryDCInfoRealUse.Value of
    0 : Text := '????????';
    1 : Text := '????';
  end;
end;


procedure TfrmDCInfo.qryDCInfoRemarkUseGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  case qryDCInfoRemarkUse.Value of
    0 : Text := '????????';
    1 : Text := '????';
  end;
end;

// ????????
procedure TfrmDCInfo.qryDCInfoRemoteButtonUseGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  case qryDCInfoRemoteButtonUse.Value of
    0 : Text := '????????';
    1 : Text := '????';
  end;
end;

// ????????
procedure TfrmDCInfo.qryDCInfoRemoteUseGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  case qryDCInfoRemoteUse.Value of
    0 : Text := '????????';
    1 : Text := '????';
  end;
end;

procedure TfrmDCInfo.qryDCInfoReserve3GetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
   if qryDCInfoReserve3.Value = '1' then
    Text := '????'
  else if  qryDCInfoReserve3.Value = '2'  then
    Text := '????';
end;

procedure TfrmDCInfo.qryDCInfoReserve7GetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if qryDCInfoReserve7.Value = '0' then
    Text := '???????? ????????'
  else if  qryDCInfoReserve7.Value = '1'  then
    Text := '???????? ????????';
end;

procedure TfrmDCInfo.qryDCInfoWebUseGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  case qryDCInfoWebUse.Value of
    0 : Text := '????????';
    1 : Text := '????';
  end;
end;

end.

