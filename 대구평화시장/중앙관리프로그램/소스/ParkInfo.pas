unit ParkInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, BaseGrid, AdvGrid, DBAdvGrid, ExtCtrls, AdvPanel,
  Mask, AdvEdit, StdCtrls, AdvCombo, AdvSpin, Buttons;

type
  TfrmParkInfo = class(TForm)
    qryParkInfo: TADOQuery;
    dsParkInfo: TDataSource;
    qryParkInfoParkNo: TSmallintField;
    qryParkInfoParkName: TStringField;
    qryParkInfoParkAddr: TStringField;
    qryParkInfoRegNo: TStringField;
    qryParkInfoAdmin: TStringField;
    qryParkInfoTelephone: TStringField;
    qryParkInfoReceipt: TStringField;
    qryParkInfoDayMax: TIntegerField;
    qryParkInfoTotMax: TIntegerField;
    qryParkInfoCalcType: TWordField;
    qryParkInfoClosingTime: TStringField;
    qryParkInfoAutoClosing: TWordField;
    qryParkInfoHolidayProc: TWordField;
    qryParkInfoReceiptAuto: TWordField;
    qryParkInfoReceiptZero: TWordField;
    qryParkInfoTaxType: TWordField;
    qryParkInfoJunkType: TWordField;
    qryParkInfoRoundType: TWordField;
    qryParkInfoTimeDCType: TWordField;
    qryParkInfoCurrencyType: TWordField;
    qryParkInfoDCReason: TWordField;
    qryParkInfoLostCalc: TWordField;
    qryParkInfoLoatAmount: TIntegerField;
    qryParkInfoSpecialTariff: TWordField;
    qryParkInfoCommercialCar: TWordField;
    qryParkInfoParkingDayMax: TWordField;
    qryParkInfoDCCntMax: TWordField;
    qryParkInfoVanIP: TStringField;
    qryParkInfoVanPort: TIntegerField;
    qryParkInfoReserve1: TStringField;
    qryParkInfoReserve2: TStringField;
    qryParkInfoReserve3: TStringField;
    qryParkInfoReserve4: TStringField;
    qryParkInfoReserve5: TStringField;
    AdvPanel1: TAdvPanel;
    dgParkInfo: TDBAdvGrid;
    AdvPanel2: TAdvPanel;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    btnDelete: TBitBtn;
    btnClose: TBitBtn;
    edtParkNo: TAdvSpinEdit;
    edtParkName: TAdvEdit;
    edtAdmin: TAdvEdit;
    edtRegNo: TAdvEdit;
    edtTelephone: TAdvEdit;
    edtReceipt: TAdvEdit;
    edtParkAddr: TAdvEdit;
    cmbCalcType: TAdvComboBox;
    cmbHolidayProc: TAdvComboBox;
    cmbAutoClosing: TAdvComboBox;
    edtClosingTime: TAdvMaskEdit;
    cmbReceipt: TAdvComboBox;
    cmbZeroReceipt: TAdvComboBox;
    cmbTax: TAdvComboBox;
    cmbJunk: TAdvComboBox;
    cmbRound: TAdvComboBox;
    cmbTimeDC: TAdvComboBox;
    cmbDCReason: TAdvComboBox;
    cmbLostCalc: TAdvComboBox;
    cmbSpecialTariff: TAdvComboBox;
    cmbCommercialCar: TAdvComboBox;
    cmbParkingDayMax: TAdvComboBox;
    edtDayMax: TAdvSpinEdit;
    edtTotMax: TAdvSpinEdit;
    edtDCCntMax: TAdvSpinEdit;
    edtLostAmt: TAdvSpinEdit;
    qryTemp: TADOQuery;
    cmbCurrencyType: TAdvComboBox;
    cmbSaturdayProc: TAdvComboBox;
    qryParkInfoSaturdayProc: TWordField;
    cmbOperation: TAdvComboBox;
    cbTest: TCheckBox;
    cmbFreeTime: TAdvComboBox;
    edtFreeTimeS: TAdvMaskEdit;
    edtFreeTimeE: TAdvMaskEdit;
    qryParkInfoRemainDsp: TWordField;
    edtRemainDsp: TAdvSpinEdit;
    qryParkInfoClosingType: TWordField;
    cmbClosingType: TAdvComboBox;
    qryParkInfoSeekDay: TWordField;
    edtSeekDay: TAdvSpinEdit;
    Label1: TLabel;
    qryParkInfoSaturdayMax: TIntegerField;
    qryParkInfoHolidayMax: TIntegerField;
    qryParkInfoTDNo: TWordField;
    qryParkInfoTDTKDate: TWordField;
    qryParkInfoMichulKeep: TIntegerField;
    edtSaturdayMax: TAdvSpinEdit;
    edtHolidayMax: TAdvSpinEdit;
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure dgParkInfoClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure qryParkInfoCalcTypeGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryParkInfoAutoClosingGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryParkInfoHolidayProcGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryParkInfoSaturdayProcGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryParkInfoReceiptAutoGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryParkInfoJunkTypeGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryParkInfoReceiptZeroGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryParkInfoTaxTypeGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryParkInfoRoundTypeGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryParkInfoTimeDCTypeGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryParkInfoCurrencyTypeGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryParkInfoDCReasonGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryParkInfoLostCalcGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryParkInfoSpecialTariffGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryParkInfoCommercialCarGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryParkInfoParkingDayMaxGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryParkInfoDCCntMaxGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryParkInfoReserve5GetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryParkInfoClosingTypeGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure qryParkInfoSeekDayGetText(Sender: TField; var Text: string; DisplayText: Boolean);
  private
    { Private declarations }
    procedure frmClear;
  public
    { Public declarations }
  end;

var
  frmParkInfo: TfrmParkInfo;
  nSelect: Byte = 0;  //Insert:0, Modify:1;

implementation
uses
  Tables, Global;

{$R *.dfm}

procedure TfrmParkInfo.frmClear;
begin
  try
    edtParkNo.Value:= 0;
    edtParkName.Text:= '';
    edtAdmin.Text:= '';
    edtRegNo.Text:= '';
    edtParkAddr.Text:= '';
    edtTelephone.Text:= '';
    edtReceipt.Text:= '';
    edtDayMax.Value:= 0;
    edtSaturdayMax.Value:= 0;
    edtHolidayMax.Value:= 0;
    edtTotMax.Value:= 0;
    cmbCalcType.ItemIndex:= 0;
    cmbHolidayProc.ItemIndex:= 0;
    edtClosingTime.Text:= '00:00';
    cmbAutoClosing.ItemIndex:= 0;
    cmbReceipt.ItemIndex:= 0;
    cmbZeroReceipt.ItemIndex:= 0;
    cmbTax.ItemIndex:= 0;
    cmbJunk.ItemIndex:= 0;
    cmbRound.ItemIndex:= 0;
    cmbTimeDC.ItemIndex:= 1;
    cmbDCReason.ItemIndex:= 0;
    cmbLostCalc.ItemIndex:= 1;
    edtLostAmt.Value:= 0;
    cmbSpecialTariff.ItemIndex:= 0;
    cmbCommercialCar.ItemIndex:= 0;
    cmbParkingDayMax.ItemIndex:= 0;
    edtDCCntMax.Value:= 0;
    cmbCurrencyType.ItemIndex:= 0;
    cmbSaturdayProc.ItemIndex:= 0;
    cmbOperation.ItemIndex:= 0;
    edtRemainDsp.Value:= 0;
    cbTest.Checked:= False;

    edtParkNo.Enabled:= True;
    btnDelete.Enabled:= False;
    btnCancel.Enabled:= False;
    nSelect:= 0;
    edtParkNo.SetFocus;
  except
    on E: Exception do ExceptLogging('TfrmParkInfo.frmClear: ' + aString(E.Message));
  end;
end;

procedure TfrmParkInfo.qryParkInfoAutoClosingGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  case qryParkInfoAutoClosing.Value of
    0: Text:= '????????';
    1: Text:= '????????';
  end;
end;

procedure TfrmParkInfo.qryParkInfoCalcTypeGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Case qryParkInfoCalcType.Value of
    0: Text:= '24??????';
    1: Text:= '??????24????';
  End;
end;

procedure TfrmParkInfo.qryParkInfoClosingTypeGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  case qryParkInfoClosingType.Value of
    0: Text:= '????????';
    1: Text:= '??????????';
  end;
end;

procedure TfrmParkInfo.qryParkInfoCommercialCarGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  case qryParkInfoCommercialCar.Value of
    0: Text:= '????????';
    1: Text:= '??????';
  end;
end;

procedure TfrmParkInfo.qryParkInfoCurrencyTypeGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  case qryParkInfoCurrencyType.Value of
    0: Text:= '??????';
    1: Text:= '????????';
  end;
end;

procedure TfrmParkInfo.qryParkInfoDCCntMaxGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  case qryParkInfoSpecialTariff.Value of
    0: Text:= '????????';
    else
      Text:= IntToStr(qryParkInfoDCCntMax.Value) + '??';
  end;
end;

procedure TfrmParkInfo.qryParkInfoDCReasonGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  case qryParkInfoDCReason.Value of
    0: Text:= '????????';
    1: Text:= '????????????';
  end;
end;

procedure TfrmParkInfo.qryParkInfoHolidayProcGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  case qryParkInfoHolidayProc.Value of
    0: Text:= '????????';
    1: Text:= '??????';
  end;
end;

procedure TfrmParkInfo.qryParkInfoJunkTypeGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  case qryParkInfoJunkType.Value of
    0: Text:= '????????';
    1: Text:= '1??????????';
    2: Text:= '10??????????';
    3: Text:= '100??????????';
    4: Text:= '500??????????';
    5: Text:= '1000??????????';
  end;
end;

procedure TfrmParkInfo.qryParkInfoLostCalcGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  case qryParkInfoLostCalc.Value of
    0: Text:= '????????';
    1: Text:= '????????????';
  end;
end;

procedure TfrmParkInfo.qryParkInfoParkingDayMaxGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  case qryParkInfoParkingDayMax.Value of
    0: Text:= '????????';
    1: Text:= '??????';
  end;
end;

procedure TfrmParkInfo.qryParkInfoReceiptAutoGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  case qryParkInfoReceiptAuto.Value of
    0: Text:= '????????';
    1: Text:= '????????';
  end;
end;

procedure TfrmParkInfo.qryParkInfoReceiptZeroGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  case qryParkInfoReceiptZero.Value of
    0: Text:= '????????';
    1: Text:= '????????';
  end;
end;

procedure TfrmParkInfo.qryParkInfoReserve5GetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if qryParkInfoReserve5.Value <> '' then
  begin
    case StrToInt(qryParkInfoReserve5.Value) of
      0: Text:= '????????';
      1: Text:= '??????';
    end;
  end
  else
    Text:= '????????';
end;

procedure TfrmParkInfo.qryParkInfoRoundTypeGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  case qryParkInfoRoundType.Value of
    0: Text:= '????';
    1: Text:= '????';
  end;
end;

procedure TfrmParkInfo.qryParkInfoSaturdayProcGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  case qryParkInfoSaturdayProc.Value of
    0: Text:= '????????';
    1: Text:= '??????';
  end;
end;

procedure TfrmParkInfo.qryParkInfoSeekDayGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if qryParkInfoSeekDay.Value = 0 then
    Text:= '????????'
  else
    Text:= IntToStr(qryParkInfoSeekDay.Value) + '???? ???????? ????';
end;

procedure TfrmParkInfo.qryParkInfoSpecialTariffGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  case qryParkInfoSpecialTariff.Value of
    0: Text:= '????????';
    1: Text:= '??????';
  end;
end;

procedure TfrmParkInfo.qryParkInfoTaxTypeGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  case qryParkInfoTaxType.Value of
    0: Text:= '??????????';
    1: Text:= '??????????';
  end;
end;

procedure TfrmParkInfo.qryParkInfoTimeDCTypeGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  case qryParkInfoTimeDCType.Value of
    0: Text:= '????????????';
    1: Text:= '????????????';
  end;
end;

procedure TfrmParkInfo.btnCancelClick(Sender: TObject);
begin
  frmClear;
end;

procedure TfrmParkInfo.btnCloseClick(Sender: TObject);
begin
  qryParkInfo.Active:= False;
  Close;
end;

procedure TfrmParkInfo.btnDeleteClick(Sender: TObject);
begin
  try
    if MessageDlg('?????? ???????? ???????????', mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;

    with qryParkInfo do
    begin
      try
        dmTables.ADODB.BeginTrans;
        Close;
        SQL.Clear;
        SQL.Add('Delete from ParkInfo where ParkNo = :N1');
        Parameters.ParamByName('N1').Value:= edtParkNo.Value;
        ExecSQL;
        dmTables.ADODB.CommitTrans;
      except
        on E: Exception do
        begin
          dmTables.ADODB.RollbackTrans;
          ExceptLogging('TfrmParkInfo.btnDeleteClick: ' + aString(E.Message));
          ShowMessage('?????? ????????! ???????? ????????????.');
        end;
      end;

      Close;
      SQL.Clear;
      SQL.Add('Select * from ParkInfo');
      Open;
    end;
    frmClear;
  except
    on E: Exception do ExceptLogging('TfrmParkInfo.btnDeleteClick: ' + aString(E.Message));
  end;
end;

procedure TfrmParkInfo.btnSaveClick(Sender: TObject);
var
  tChkTime: TDateTime;
begin
  try
    if edtParkNo.Value = 0 then
    begin
      ShowMessage('???????????? 1?????? ?????? ??????????.');
      edtParkNo.SetFocus;
      Exit;
    end;

    if cmbFreeTime.ItemIndex = 1 then
    begin
      try
        tChkTime:= StrToTime(edtFreeTimeS.Text);
      except
        on E: Exception do
        begin
          ShowMessage('?????????????????? ?????? ??????????????!');
          edtFreeTimeS.SetFocus;
          Exit;
        end;
      end;

      try
        tChkTime:= StrToTime(edtFreeTimeE.Text);
      except
        on E: Exception do
        begin
          ShowMessage('?????????????????? ?????? ??????????????!');
          edtFreeTimeE.SetFocus;
          Exit;
        end;
      end;
    end;

    with qryParkInfo do
    begin
      if nSelect = 0 then
      begin
        //????...
        with qryTemp do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Select * from ParkInfo where ParkNo = :N1');
          Parameters.ParamByName('N1').Value:= edtParkNo.Value;
          Open;

          if RecordCount > 0 then
          begin
            ShowMessage('???? ???????????? ???? ????????????.'#13#10 +
                        '???????????? ??????????????!');
            edtParkNo.SetFocus;
            Exit;
          end;
        end;

        try
          dmTables.ADODB.BeginTrans;
          Close;
          SQL.Clear;
          SQL.Add('Insert ParkInfo ');
          SQL.Add('(ParkNo, ParkName, ParkAddr, RegNo, Admin, Telephone, Receipt, DayMax, TotMax, CalcType, ');
          SQL.Add('ClosingTime, AutoClosing, HolidayProc, ReceiptAuto, ReceiptZero, TaxType, JunkType, ');
          SQL.Add('RoundType, TimeDCType, CurrencyType, DCReason, LostCalc, LostAmount, SpecialTariff, ');
          SQL.Add('CommercialCar, ParkingDayMax, DCCntMax, VanIP, VanPort, SaturdayProc, Reserve1, Reserve2, ');
          SQL.Add('Reserve3, Reserve4, Reserve5, RemainDsp, ClosingType, SeekDay, SaturdayMax, HolidayMax) ');
          SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, :N12, :N13, :N14, :N15, ');
          SQL.Add(':N16, :N17, :N18, :N19, :N20, :N21, :N22, :N23, :N24, :N25, :N26, :N27, :N28, :N29, :N30, :N31, ');
          SQL.Add(':N32, :N33, :N34, :N35, :N36, :N37, :N38, :N39, :N40) ');
          Parameters.ParamByName('N1' ).Value:= edtParkNo.Value;
          Parameters.ParamByName('N2' ).Value:= edtParkName.Text;
          Parameters.ParamByName('N3' ).Value:= edtParkAddr.Text;
          Parameters.ParamByName('N4' ).Value:= edtRegNo.Text;
          Parameters.ParamByName('N5' ).Value:= edtAdmin.Text;
          Parameters.ParamByName('N6' ).Value:= edtTelephone.Text;
          Parameters.ParamByName('N7' ).Value:= edtReceipt.Text;
          Parameters.ParamByName('N8' ).Value:= edtDayMax.Value;
          Parameters.ParamByName('N9' ).Value:= edtTotMax.Value;
          Parameters.ParamByName('N10').Value:= cmbCalcType.ItemIndex;
          Parameters.ParamByName('N11').Value:= edtClosingTime.Text;
          Parameters.ParamByName('N12').Value:= cmbAutoClosing.ItemIndex;
          Parameters.ParamByName('N13').Value:= cmbHolidayProc.ItemIndex;
          Parameters.ParamByName('N14').Value:= cmbReceipt.ItemIndex;
          Parameters.ParamByName('N15').Value:= cmbZeroReceipt.ItemIndex;
          Parameters.ParamByName('N16').Value:= cmbTax.ItemIndex;
          Parameters.ParamByName('N17').Value:= cmbJunk.ItemIndex;
          Parameters.ParamByName('N18').Value:= cmbRound.ItemIndex;
          Parameters.ParamByName('N19').Value:= cmbTimeDC.ItemIndex;
          Parameters.ParamByName('N20').Value:= cmbCurrencyType.ItemIndex;
          Parameters.ParamByName('N21').Value:= cmbDCReason.ItemIndex;
          Parameters.ParamByName('N22').Value:= cmbLostCalc.ItemIndex;
          Parameters.ParamByName('N23').Value:= edtLostAmt.Value;
          Parameters.ParamByName('N24').Value:= cmbSpecialTariff.ItemIndex;
          Parameters.ParamByName('N25').Value:= cmbCommercialCar.ItemIndex;
          Parameters.ParamByName('N26').Value:= cmbParkingDayMax.ItemIndex;
          Parameters.ParamByName('N27').Value:= edtDCCntMax.Value;
          Parameters.ParamByName('N28').Value:= '';
          Parameters.ParamByName('N29').Value:= 0;
          Parameters.ParamByName('N30').Value:= cmbSaturdayProc.ItemIndex;
          Parameters.ParamByName('N31').Value:= cmbOperation.Text;

          if cbTest.Checked then
            Parameters.ParamByName('N32').Value:= '??????'
          else
            Parameters.ParamByName('N32').Value:= '';

          Parameters.ParamByName('N33').Value:= edtFreeTimeS.Text;
          Parameters.ParamByName('N34').Value:= edtFreeTimeE.Text;
          Parameters.ParamByName('N35').Value:= IntToStr(cmbFreeTime.ItemIndex);
          Parameters.ParamByName('N36').Value:= edtRemainDsp.Value;
          Parameters.ParamByName('N37').Value:= cmbClosingType.ItemIndex;
          Parameters.ParamByName('N38').Value:= edtSeekDay.Value;
          Parameters.ParamByName('N39').Value:= edtSaturdayMax.Value;
          Parameters.ParamByName('N40').Value:= edtHolidayMax.Value;
          ExecSQL;
          dmTables.ADODB.CommitTrans;
        except
          on E: Exception do
          begin
            dmTables.ADODB.RollbackTrans;
            ExceptLogging('TfrmParkInfo.btnSaveClick: ' + aString(E.Message));
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
          SQL.Add('Update ParkInfo ');
          SQL.Add('Set ParkName = :N2, ParkAddr = :N3, RegNo = :N4, Admin = :N5, Telephone = :N6,  ');
          SQL.Add('Receipt = :N7, DayMax = :N8, TotMax = :N9, CalcType = :N10, ClosingTime = :N11, ');
          SQL.Add('AutoClosing = :N12, HolidayProc = :N13, ReceiptAuto = :N14, ReceiptZero = :N15, ');
          SQL.Add('TaxType = :N16, JunkType = :N17, RoundType = :N18, TimeDCType = :N19, CurrencyType = :N20, ');
          SQL.Add('DCReason = :N21, LostCalc = :N22, LostAmount = :N23, SpecialTariff = :N24, ');
          SQL.Add('CommercialCar = :N25, ParkingDayMax = :N26, DCCntMax = :N27, VanIP = :N28, VanPort = :N29, ');
          SQL.Add('SaturdayProc = :N30, Reserve1 = :N31, Reserve2 = :N32, Reserve3 = :N33, Reserve4 = :N34, ');
          SQL.Add('Reserve5 = :N35, RemainDsp = :N36, ClosingType = :N37, SeekDay = :N38, ');
          SQL.Add('SaturdayMax = :N39, HolidayMax = :N40 ');
          SQL.Add('Where ParkNo = :N1');
          Parameters.ParamByName('N1' ).Value:= edtParkNo.Value;
          Parameters.ParamByName('N2' ).Value:= edtParkName.Text;
          Parameters.ParamByName('N3' ).Value:= edtParkAddr.Text;
          Parameters.ParamByName('N4' ).Value:= edtRegNo.Text;
          Parameters.ParamByName('N5' ).Value:= edtAdmin.Text;
          Parameters.ParamByName('N6' ).Value:= edtTelephone.Text;
          Parameters.ParamByName('N7' ).Value:= edtReceipt.Text;
          Parameters.ParamByName('N8' ).Value:= edtDayMax.Value;
          Parameters.ParamByName('N9' ).Value:= edtTotMax.Value;
          Parameters.ParamByName('N10').Value:= cmbCalcType.ItemIndex;
          Parameters.ParamByName('N11').Value:= edtClosingTime.Text;
          Parameters.ParamByName('N12').Value:= cmbAutoClosing.ItemIndex;
          Parameters.ParamByName('N13').Value:= cmbHolidayProc.ItemIndex;
          Parameters.ParamByName('N14').Value:= cmbReceipt.ItemIndex;
          Parameters.ParamByName('N15').Value:= cmbZeroReceipt.ItemIndex;
          Parameters.ParamByName('N16').Value:= cmbTax.ItemIndex;
          Parameters.ParamByName('N17').Value:= cmbJunk.ItemIndex;
          Parameters.ParamByName('N18').Value:= cmbRound.ItemIndex;
          Parameters.ParamByName('N19').Value:= cmbTimeDC.ItemIndex;
          Parameters.ParamByName('N20').Value:= cmbCurrencyType.ItemIndex;
          Parameters.ParamByName('N21').Value:= cmbDCReason.ItemIndex;
          Parameters.ParamByName('N22').Value:= cmbLostCalc.ItemIndex;
          Parameters.ParamByName('N23').Value:= edtLostAmt.Value;
          Parameters.ParamByName('N24').Value:= cmbSpecialTariff.ItemIndex;
          Parameters.ParamByName('N25').Value:= cmbCommercialCar.ItemIndex;
          Parameters.ParamByName('N26').Value:= cmbParkingDayMax.ItemIndex;
          Parameters.ParamByName('N27').Value:= edtDCCntMax.Value;
          Parameters.ParamByName('N28').Value:= '';
          Parameters.ParamByName('N29').Value:= 0;
          Parameters.ParamByName('N30').Value:= cmbSaturdayProc.ItemIndex;
          Parameters.ParamByName('N31').Value:= cmbOperation.Text;

          if cbTest.Checked then
            Parameters.ParamByName('N32').Value:= '??????'
          else
            Parameters.ParamByName('N32').Value:= '';

          Parameters.ParamByName('N33').Value:= edtFreeTimeS.Text;
          Parameters.ParamByName('N34').Value:= edtFreeTimeE.Text;
          Parameters.ParamByName('N35').Value:= IntToStr(cmbFreeTime.ItemIndex);
          Parameters.ParamByName('N36').Value:= edtRemainDsp.Value;
          Parameters.ParamByName('N37').Value:= cmbClosingType.ItemIndex;
          Parameters.ParamByName('N38').Value:= edtSeekDay.Value;
          Parameters.ParamByName('N39').Value:= edtSaturdayMax.Value;
          Parameters.ParamByName('N40').Value:= edtHolidayMax.Value;
          ExecSQL;
          dmTables.ADODB.CommitTrans;
        except
          on E: Exception do
          begin
            dmTables.ADODB.RollbackTrans;
            ExceptLogging('TfrmParkInfo.btnSaveClick: ' + aString(E.Message));
            ShowMessage('?????? ????????! ???????? ????????????.');
          end;
        end;
      end;
      Close;
      SQL.Clear;
      SQL.Add('Select * from ParkInfo');
      Open;

      frmClear;
    end;
  except
    on E: Exception do ExceptLogging('TfrmParkInfo.btnSaveClick: ' + aString(E.Message));
  end;
end;

procedure TfrmParkInfo.dgParkInfoClick(Sender: TObject);
begin
  try
    if qryParkInfo.RecordCount > 0 then
      with qryParkInfo do
      begin
        edtParkNo.Value:= FieldByName('ParkNo').AsInteger;
        edtParkName.Text:= FieldByName('ParkName').AsString;
        edtAdmin.Text:= FieldByName('Admin').AsString;
        edtRegNo.Text:= FieldByName('RegNo').AsString;
        edtParkAddr.Text:= FieldByName('ParkAddr').AsString;
        edtTelephone.Text:= FieldByName('Telephone').AsString;
        edtReceipt.Text:= FieldByName('Receipt').AsString;
        edtDayMax.Value:= FieldByName('DayMax').AsInteger;
        edtSaturdayMax.Value:= FieldByName('SaturdayMax').AsInteger;
        edtHolidayMax.Value:= FieldByName('HolidayMax').AsInteger;
        edtTotMax.Value:= FieldByName('TotMax').AsInteger;
        cmbCalcType.ItemIndex:= FieldByName('CalcType').AsInteger;
        cmbHolidayProc.ItemIndex:= FieldByName('HolidayProc').AsInteger;
        edtClosingTime.Text:= FieldByName('ClosingTime').AsString;
        cmbAutoClosing.ItemIndex:= FieldByName('AutoClosing').AsInteger;
        cmbReceipt.ItemIndex:= FieldByName('ReceiptAuto').AsInteger;
        cmbZeroReceipt.ItemIndex:= FieldByName('ReceiptZero').AsInteger;
        cmbTax.ItemIndex:= FieldByName('TaxType').AsInteger;
        cmbJunk.ItemIndex:= FieldByName('JunkType').AsInteger;
        cmbRound.ItemIndex:= FieldByName('RoundType').AsInteger;
        cmbTimeDC.ItemIndex:= FieldByName('TimeDCType').AsInteger;
        cmbDCReason.ItemIndex:= FieldByName('DCReason').AsInteger;
        cmbLostCalc.ItemIndex:= FieldByName('LostCalc').AsInteger;
        edtLostAmt.Value:= FieldByName('LostAmount').AsInteger;
        cmbSpecialTariff.ItemIndex:= FieldByName('SpecialTariff').AsInteger;
        cmbCommercialCar.ItemIndex:= FieldByName('CommercialCar').AsInteger;
        cmbParkingDayMax.ItemIndex:= FieldByName('ParkingDayMax').AsInteger;
        edtDCCntMax.Value:= FieldByName('DCCntMax').AsInteger;
        cmbSaturdayProc.ItemIndex:= FieldByName('SaturdayProc').AsInteger;
        cmbOperation.Text:= FieldByName('Reserve1').AsString;
        edtRemainDsp.Value:= FieldByName('RemainDsp').AsInteger;

        if FieldByName('Reserve5').AsString <> '' then
          cmbFreeTime.ItemIndex:= StrToInt(FieldByName('Reserve5').AsString)
        else
          cmbFreeTime.ItemIndex:= 0;

        edtFreeTimeS.Text:= FieldByName('Reserve3').AsString;
        edtFreeTimeE.Text:= FieldByName('Reserve4').AsString;

        if FieldByName('Reserve2').AsString = '??????' then
          cbTest.Checked:= True
        else
          cbTest.Checked:= False;

        cmbClosingType.ItemIndex:= FieldByName('ClosingType').AsInteger;
        edtSeekDay.Value:= FieldByName('SeekDay').AsInteger;

        edtParkNo.Enabled:= False;
        btnCancel.Enabled:= True;
        btnDelete.Enabled:= True;

        nSelect:= 1;
      end;
  except
    on E: Exception do ExceptLogging('TfrmParkInfo.dgParkInfoClick: ' + aString(E.Message));
  end;
end;

procedure TfrmParkInfo.FormShow(Sender: TObject);
begin
  try
    with qryParkInfo do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from ParkInfo');
      Open;
    end;
    frmClear;
  except
    on E: Exception do ExceptLogging('TfrmParkInfo.FormShow: ' + aString(E.Message));
  end;
end;

end.
