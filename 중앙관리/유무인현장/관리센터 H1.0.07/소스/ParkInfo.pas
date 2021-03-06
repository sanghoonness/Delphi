unit ParkInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, BaseGrid, AdvGrid, DBAdvGrid, ExtCtrls, AdvPanel,
  Mask, AdvEdit, StdCtrls, AdvCombo, AdvSpin, Buttons, AdvObj;

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
    qryParkInfoMiddleParkTime: TIntegerField;
    edtMiddleTime: TAdvSpinEdit;
    edtMonthPoint: TAdvSpinEdit;
    edtAvailablePoint: TAdvSpinEdit;
    Label2: TLabel;
    edtPointDate: TAdvEdit;
    qryParkInfoPointMonth: TIntegerField;
    qryParkInfoAvailablePoint: TIntegerField;
    qryParkInfoPointDate: TStringField;
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
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    function FieldNameToColumnIndex(FieldName: string; Grid: TDBAdvGrid): Integer;    // H1.0.01
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
    edtMiddleTime.Value:= 0;
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
    0: Text:= '사용안함';
    1: Text:= '자동마감';
  end;
end;

procedure TfrmParkInfo.qryParkInfoCalcTypeGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Case qryParkInfoCalcType.Value of
    0: Text:= '24시기준';
    1: Text:= '입차후24시간';
  End;
end;

procedure TfrmParkInfo.qryParkInfoClosingTypeGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  case qryParkInfoClosingType.Value of
    0: Text:= '일자마감';
    1: Text:= '근무자마감';
  end;
end;

procedure TfrmParkInfo.qryParkInfoCommercialCarGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  case qryParkInfoCommercialCar.Value of
    0: Text:= '사용안함';
    1: Text:= '사용함';
  end;
end;

procedure TfrmParkInfo.qryParkInfoCurrencyTypeGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  case qryParkInfoCurrencyType.Value of
    0: Text:= '원단위';
    1: Text:= '달러단위';
  end;
end;

procedure TfrmParkInfo.qryParkInfoDCCntMaxGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  case qryParkInfoSpecialTariff.Value of
    0: Text:= '사용안함';
    else
      Text:= IntToStr(qryParkInfoDCCntMax.Value) + '회';
  end;
end;

procedure TfrmParkInfo.qryParkInfoDCReasonGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  case qryParkInfoDCReason.Value of
    0: Text:= '기재안함';
    1: Text:= '할인사유기재';
  end;
end;

procedure TfrmParkInfo.qryParkInfoHolidayProcGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  case qryParkInfoHolidayProc.Value of
    0: Text:= '처리안함';
    1: Text:= '처리함';
  end;
end;

procedure TfrmParkInfo.qryParkInfoJunkTypeGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  case qryParkInfoJunkType.Value of
    0: Text:= '절사없음';
    1: Text:= '1원단위절사';
    2: Text:= '10원단위절사';
    3: Text:= '100원단위절사';
    4: Text:= '500원단위절사';
    5: Text:= '1000원단위절사';
  end;
end;

procedure TfrmParkInfo.qryParkInfoLostCalcGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  case qryParkInfoLostCalc.Value of
    0: Text:= '고정요금';
    1: Text:= '입차시각입력';
  end;
end;

procedure TfrmParkInfo.qryParkInfoParkingDayMaxGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  case qryParkInfoParkingDayMax.Value of
    0: Text:= '사용안함';
    1: Text:= '사용함';
  end;
end;

procedure TfrmParkInfo.qryParkInfoReceiptAutoGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  case qryParkInfoReceiptAuto.Value of
    0: Text:= '수동발급';
    1: Text:= '자동발급';
  end;
end;

procedure TfrmParkInfo.qryParkInfoReceiptZeroGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  case qryParkInfoReceiptZero.Value of
    0: Text:= '발급안함';
    1: Text:= '발급가능';
  end;
end;

procedure TfrmParkInfo.qryParkInfoReserve5GetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if qryParkInfoReserve5.Value <> '' then
  begin
    case StrToInt(qryParkInfoReserve5.Value) of
      0: Text:= '사용안함';
      1: Text:= '사용함';
    end;
  end
  else
    Text:= '사용안함';
end;

procedure TfrmParkInfo.qryParkInfoRoundTypeGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  case qryParkInfoRoundType.Value of
    0: Text:= '절사';
    1: Text:= '절상';
  end;
end;

procedure TfrmParkInfo.qryParkInfoSaturdayProcGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  case qryParkInfoSaturdayProc.Value of
    0: Text:= '처리안함';
    1: Text:= '처리함';
  end;
end;

procedure TfrmParkInfo.qryParkInfoSeekDayGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if qryParkInfoSeekDay.Value = 0 then
    Text:= '제한없음'
  else
    Text:= IntToStr(qryParkInfoSeekDay.Value) + '일전 자료까지 조회';
end;

procedure TfrmParkInfo.qryParkInfoSpecialTariffGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  case qryParkInfoSpecialTariff.Value of
    0: Text:= '사용안함';
    1: Text:= '사용함';
  end;
end;

procedure TfrmParkInfo.qryParkInfoTaxTypeGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  case qryParkInfoTaxType.Value of
    0: Text:= '부가세포함';
    1: Text:= '부가세별도';
  end;
end;

procedure TfrmParkInfo.qryParkInfoTimeDCTypeGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  case qryParkInfoTimeDCType.Value of
    0: Text:= '입차시각기준';
    1: Text:= '출차시각기준';
  end;
end;

procedure TfrmParkInfo.btnCancelClick(Sender: TObject);
begin
  frmClear;
end;

procedure TfrmParkInfo.btnCloseClick(Sender: TObject);
begin
  qryParkInfo.Active:= False;
  ModalResult := mrCancel;
  //Close;
end;

procedure TfrmParkInfo.btnDeleteClick(Sender: TObject);
begin
  try
    if MessageDlg('선택한 주차장을 삭제할까요?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;

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
          ShowMessage('삭제중 오류발생! 관리자에 문의바랍니다.');
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
  tChkTime, tmpDate: TDateTime;
begin
  try
    if edtParkNo.Value = 0 then
    begin
      ShowMessage('주차장번호는 1번부터 저장이 가능합니다.');
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
          ShowMessage('무료개방시작시각을 정확히 입력하여주세요!');
          edtFreeTimeS.SetFocus;
          Exit;
        end;
      end;

      try
        tChkTime:= StrToTime(edtFreeTimeE.Text);
      except
        on E: Exception do
        begin
          ShowMessage('무료개방종료시각을 정확히 입력하여주세요!');
          edtFreeTimeE.SetFocus;
          Exit;
        end;
      end;
    end;

    with qryParkInfo do
    begin
      if nSelect = 0 then
      begin
        //추가...
        with qryTemp do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Select * from ParkInfo where ParkNo = :N1');
          Parameters.ParamByName('N1').Value:= edtParkNo.Value;
          Open;

          if RecordCount > 0 then
          begin
            ShowMessage('해당 주차장번호가 이미 사용중입니다.'#13#10 +
                        '주차장번호를 변경하여주세요!');
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

          if nHomenet_Point = 0 then
          begin             
            SQL.Add('Reserve3, Reserve4, Reserve5, RemainDsp, ClosingType, SeekDay, SaturdayMax, HolidayMax, MiddleparkTime) ');
            SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, :N12, :N13, :N14, :N15, ');
            SQL.Add(':N16, :N17, :N18, :N19, :N20, :N21, :N22, :N23, :N24, :N25, :N26, :N27, :N28, :N29, :N30, :N31, ');
            SQL.Add(':N32, :N33, :N34, :N35, :N36, :N37, :N38, :N39, :N40, :N41) ');
          end
          else
          begin;             
            SQL.Add('Reserve3, Reserve4, Reserve5, RemainDsp, ClosingType, SeekDay, SaturdayMax, HolidayMax, MiddleparkTime, ');
            SQL.Add('AvailablePoint, UsedPoint, PointDate, PointMonth, visitinfocount, visitinfoTime, visitinfoDate, ');
            SQL.Add('visitinfoInsert, PointType, PointUnit) ');
            SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, :N12, :N13, :N14, :N15, ');
            SQL.Add(':N16, :N17, :N18, :N19, :N20, :N21, :N22, :N23, :N24, :N25, :N26, :N27, :N28, :N29, :N30, :N31, ');
            SQL.Add(':N32, :N33, :N34, :N35, :N36, :N37, :N38, :N39, :N40, :N41, ');
            SQL.Add(':N42, :N43, :N44, :N45, :N46, :N47, :N48, ');
            SQL.Add(':N49, :N50, :N51) ');
          end;

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
            Parameters.ParamByName('N32').Value:= '테스트'
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
          Parameters.ParamByName('N41').Value:= edtMiddleTime.Value;

          //21.04.21 홈넷포인트 추가(무인용)
          if nHomenet_Point = 1 then
          begin
            Parameters.ParamByName('N42').Value:= edtAvailablePoint.Value;              
            Parameters.ParamByName('N43').Value:= 0;
            tmpDate := StrToDate(FormatDateTime('YYYY-MM-01', now));
            tmpDate := IncMonth(tmpDate, edtMonthPoint.Value);
            Parameters.ParamByName('N44').Value:= tmpDate;
            Parameters.ParamByName('N45').Value:= edtMonthPoint.Value;
            //21.04.21 아이콘트롤스(홈넷) 프로토콜 신버전 적용 주차장 설정              
            Parameters.ParamByName('N46').Value:= 0;
            Parameters.ParamByName('N47').Value:= 0;
            Parameters.ParamByName('N48').Value:= 0;
            Parameters.ParamByName('N49').Value:= 0;
            Parameters.ParamByName('N50').Value:= 0;
            Parameters.ParamByName('N51').Value:= 0;
          end;
          ExecSQL;
          dmTables.ADODB.CommitTrans;
        except
          on E: Exception do
          begin
            dmTables.ADODB.RollbackTrans;
            ExceptLogging('TfrmParkInfo.btnSaveClick: ' + aString(E.Message));
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
          SQL.Add('Update ParkInfo ');
          SQL.Add('Set ParkName = :N2, ParkAddr = :N3, RegNo = :N4, Admin = :N5, Telephone = :N6,  ');
          SQL.Add('Receipt = :N7, DayMax = :N8, TotMax = :N9, CalcType = :N10, ClosingTime = :N11, ');
          SQL.Add('AutoClosing = :N12, HolidayProc = :N13, ReceiptAuto = :N14, ReceiptZero = :N15, ');
          SQL.Add('TaxType = :N16, JunkType = :N17, RoundType = :N18, TimeDCType = :N19, CurrencyType = :N20, ');
          SQL.Add('DCReason = :N21, LostCalc = :N22, LostAmount = :N23, SpecialTariff = :N24, ');
          SQL.Add('CommercialCar = :N25, ParkingDayMax = :N26, DCCntMax = :N27, VanIP = :N28, VanPort = :N29, ');
          SQL.Add('SaturdayProc = :N30, Reserve1 = :N31, Reserve2 = :N32, Reserve3 = :N33, Reserve4 = :N34, ');
          SQL.Add('Reserve5 = :N35, RemainDsp = :N36, ClosingType = :N37, SeekDay = :N38, ');
          //21.04.21 홈넷포인트 추가(무인용)
          if nHomenet_Point = 0 then
          begin
            SQL.Add('SaturdayMax = :N39, HolidayMax = :N40 , middleparktime = :pmiddleparktime');
          end
          else
          begin
            SQL.Add('SaturdayMax = :N39, HolidayMax = :N40 , middleparktime = :pmiddleparktime, ');
            SQL.Add('AvailablePoint = :N41,  UsedPoint = :N42, PointDate = :N43, PointMonth = :N44, ');
            SQL.Add('visitinfocount = :N45,  visitinfoTime = :N46, visitinfoDate = :N47, visitinfoInsert = :N48, PointType = :N49, PointUnit = :N50 ');
          end;
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
            Parameters.ParamByName('N32').Value:= '테스트'
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
          Parameters.ParamByName('pmiddleparktime').Value:= edtMiddleTime.Value;
          //21.04.21 홈넷 포인트 추가(무인)
          if nHomenet_Point = 1 then
          begin
            Parameters.ParamByName('N41').Value:= edtAvailablePoint.Value;;
            Parameters.ParamByName('N42').Value:= 0;
            tmpDate := StrToDate(FormatDateTime('YYYY-MM-01', now));
            tmpDate := IncMonth(tmpDate, edtMonthPoint.Value);
            Parameters.ParamByName('N43').Value:= tmpDate;
            //21.04.21 아이콘트롤스(홈넷) 프로토콜 신버전 적용 주차장 설정
            Parameters.ParamByName('N44').Value:= edtMonthPoint.Value;
            Parameters.ParamByName('N45').Value:= 0;
            Parameters.ParamByName('N46').Value:= 0;
            Parameters.ParamByName('N47').Value:= 0;
            Parameters.ParamByName('N48').Value:= 0;
            Parameters.ParamByName('N49').Value:= 0;
            Parameters.ParamByName('N50').Value:= 0;
          end;
          ExecSQL;
          dmTables.ADODB.CommitTrans;
        except
          on E: Exception do
          begin
            dmTables.ADODB.RollbackTrans;
            ExceptLogging('TfrmParkInfo.btnSaveClick: ' + aString(E.Message));
            ShowMessage('저장중 오류발생! 관리자에 문의바랍니다.');
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
        edtMiddleTime.Value := FieldByName('middleparktime').AsInteger;
        if FieldByName('Reserve5').AsString <> '' then
          cmbFreeTime.ItemIndex:= StrToInt(FieldByName('Reserve5').AsString)
        else
          cmbFreeTime.ItemIndex:= 0;

        edtFreeTimeS.Text:= FieldByName('Reserve3').AsString;
        edtFreeTimeE.Text:= FieldByName('Reserve4').AsString;

        if FieldByName('Reserve2').AsString = '테스트' then
          cbTest.Checked:= True
        else
          cbTest.Checked:= False;

        cmbClosingType.ItemIndex:= FieldByName('ClosingType').AsInteger;
        edtSeekDay.Value:= FieldByName('SeekDay').AsInteger;
        //홈넷 포인트 관련
        edtMonthPoint.Value := FieldByName('PointMonth').AsInteger;
        edtAvailablePoint.Value := FieldByName('AvailablePoint').AsInteger;
        edtPointDate.Text := FieldByName('PointDate').AsString;

        edtParkNo.Enabled:= False;
        btnCancel.Enabled:= True;
        btnDelete.Enabled:= True;

        nSelect:= 1;
      end;
  except
    on E: Exception do ExceptLogging('TfrmParkInfo.dgParkInfoClick: ' + aString(E.Message));
  end;
end;

procedure TfrmParkInfo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then //엔터라면
  begin
    selectnext(activecontrol as twincontrol,true,true);
    //폼의 포커스를 가진 컴포넌트의 다음 컴포넌트로 이동한다.
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
    if nStair = 0 then
    begin
      dgParkInfo.ColWidths[FieldNameToColumnIndex('MiddleParkTime',dgParkInfo)]:= 0;
//      dgParkInfo.ColWidths[13] := 0;
      edtMiddleTime.Visible := False;
    end
    else
    begin
      edtMiddleTime.Visible := True;
    end;
    frmClear;

    if nHomenet_Point = 0 then
    begin
      label2.Visible := False;
      edtMonthPoint.Visible := False;
      edtAvailablePoint.Visible := False;
      edtPointDate.Visible := False;
    end;

  except
    on E: Exception do ExceptLogging('TfrmParkInfo.FormShow: ' + aString(E.Message));
  end;
end;

function TfrmParkInfo.FieldNameToColumnIndex(FieldName: string; Grid: TDBAdvGrid):Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to Grid.Columns.Count - 1 do
   // if AnsiCompareText(Grid.Columns[I].Field.FieldName, FieldName) = 0 then
   if Grid.Columns[I].FieldName = FieldName then
begin
      Result := I;
      Break;
    end;
end;

end.
