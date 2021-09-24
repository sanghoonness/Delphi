unit Coupon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvSpin, StdCtrls, Mask, AdvEdit, AdvCombo, ExtCtrls, AdvPanel,
  Buttons, OoMisc, AdPort, DB, ADODB;

type
  TfrmCoupon = class(TForm)
    AdvPanel1: TAdvPanel;
    cmbName: TAdvComboBox;
    edtExpDate: TAdvMaskEdit;
    edtIssueCnt: TAdvSpinEdit;
    edtIssueUnit: TAdvSpinEdit;
    edtIssueAmt: TAdvSpinEdit;
    cmbDCType: TAdvComboBox;
    edtDCAmt: TAdvSpinEdit;
    btnStart: TBitBtn;
    btnClose: TBitBtn;
    comBarcode: TApdComPort;
    qryTemp: TADOQuery;
    edtSerial: TAdvSpinEdit;
    tCoupon: TTimer;
    procedure FormShow(Sender: TObject);
    procedure comBarcodePortOpen(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure cmbDCTypeChange(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure edtIssueCntChange(Sender: TObject);
    procedure edtIssueCntExit(Sender: TObject);
    procedure edtIssueUnitChange(Sender: TObject);
    procedure edtIssueUnitExit(Sender: TObject);
    procedure tCouponTimer(Sender: TObject);
  private
    { Private declarations }
    function GetHangul(sData: AnsiString): AnsiString;
  public
    { Public declarations }
  end;

var
  frmCoupon: TfrmCoupon;
  nCouponNo, nIssueCnt, nNowCnt: Cardinal;
  nStartNo, nEndNo, nSerial: Word;

implementation
uses
  Global, Tables;

{$R *.dfm}

function TfrmCoupon.GetHangul(sData: AnsiString): AnsiString;
var
  j: Integer;
  sTemp: aString;
  bSkip: Boolean;
begin
  sTemp:= '';
  bSkip:= False;

  for j:= 1 to Length(sData) do
  begin
    if not bSkip then
    begin
      if Ord(sData[j]) > 128 then
      begin
        sTemp:= sTemp + Copy(sData, j, 2);
        bSkip:= True;
      end
      else
      begin
        sTemp:= sTemp + AnsiChar(201) + AnsiChar(Ord(sData[j]) + 129);
      end;
    end
    else
      bSkip:= False;
  end;
  Result:= sTemp;
end;

procedure TfrmCoupon.tCouponTimer(Sender: TObject);
var
  sSend, sDCType, sPo, sPart: aString;
begin
  try
    tCoupon.Enabled:= False;
    Inc(nNowCnt);

    Inc(nCouponNo);
    sSend:= ESC + 'PC001;0100,0050,2,3,51,+00,00,B,+0000000000' + LF + NUL;
    sSend:= sSend + ESC + 'RC001;' + GetHangul('광교테크노밸리 할인권') + LF + NUL;

    sSend:= sSend + ESC + 'PC002;0030,0130,2,3,51,+00,00,B,+0000000000' + LF + NUL;
    sSend:= sSend + ESC + 'RC002;' + GetHangul('업 체 명: ' + cmbName.Text) + LF + NUL;

    sSend:= sSend + ESC + 'PC003;0030,0210,2,3,51,+00,00,B,+0000000000' + LF + NUL;
    sSend:= sSend + ESC + 'RC003;' + GetHangul('발행일자: ' + FormatDateTime('YYYY-MM-DD', Now)) + LF + NUL;

    sSend:= sSend + ESC + 'PC004;0030,0290,2,3,51,+00,00,B,+0000000000' + LF + NUL;
    sSend:= sSend + ESC + 'RC004;' + GetHangul('유효기간: ' + edtExpDate.Text) + LF + NUL;

    sSend:= sSend + ESC + 'PC005;0030,0370,2,3,51,+00,00,B,+0000000000' + LF + NUL;
    sSend:= sSend + ESC + 'RC005;' + GetHangul('일련번호: ' + MG_InsZero(IntToStr(nCouponNo), 7)) + LF + NUL;

    sSend:= sSend + ESC + 'PC006;0030,0450,2,3,51,+00,00,B,+0000000000' + LF + NUL;

    case cmbDCType.ItemIndex of
      0: begin
           sDCType:= '금액할인';
           sPo:= '원';
      end;
      1: begin
           sDCType:= '시간할인';
           sPo:= '분';
      end;
      2: begin
           sDCType:= '%할인';
           sPo:= '%';
      end;
    end;
    sSend:= sSend + ESC + 'RC006;' + GetHangul('할인종류: ' + sDCType) + LF + NUL;

    sSend:= sSend + ESC + 'PC007;0030,0530,2,3,51,+00,00,B,+0000000000' + LF + NUL;
    sSend:= sSend + ESC + 'RC007;' + GetHangul('할 인 값: ' + IntToStr(edtDCAmt.Value) + sPo) + LF + NUL;

    sSend:= sSend + ESC + 'PC008;0030,0610,2,3,51,+00,00,B,+0000000000' + LF + NUL;
    sSend:= sSend + ESC + 'RC008;' + GetHangul('관리번호: ' + MG_InsZero(IntToStr(nSerial), 7)) + LF + NUL;

    sSend:= sSend + ESC + 'XB01;0030,0800,9,3,03,0,0080,+0000000000,015,1,00' + LF + NUL;
    sSend:= sSend + ESC + 'RB01;' + MG_InsZero(aString(IntToStr(nCouponNo)), 7) +
            MG_StrTrim(Copy(edtExpDate.Text, 3, 8), '-') + aString(IntToStr(cmbDCType.ItemIndex)) +
            MG_InsZero(IntToStr(edtDCAmt.Value), 6) + LF + NUL;
    sSend:= sSend + ESC + 'XS;I,0001,0051CA001' + LF + NUL;

    if comBarcode.Open then
      comBarcode.PutString(sSend);

    Inc(nSerial);

    if nNowCnt < nIssueCnt then
    begin
      tCoupon.Enabled:= True;
    end
    else
    if nNowCnt = nIssueCnt then
    begin
      nEndNo:= nCouponNo;
      iSetup.WriteInteger('PARKING', 'Coupon No', nCouponNo);

      with qryTemp do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Insert into CouponSale ');
        SQL.Add('(ParkNo, SaleDate, SaleTime, MNo, CompName, CouponUnit, CouponCnt, CouponAmt, ');
        SQL.Add('Reserve1, Reserve2, Reserve3, Reserve4) ');
        SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, :N12)');
        Parameters.ParamByName('N1' ).Value:= nCurrParkNo;
        Parameters.ParamByName('N2' ).Value:= FormatDateTime('YYYY-MM-DD', Now);
        Parameters.ParamByName('N3' ).Value:= FormatDateTime('HH:NN:SS', Now);
        Parameters.ParamByName('N4' ).Value:= nCurrMNo;
        Parameters.ParamByName('N5' ).Value:= cmbName.Text;
        Parameters.ParamByName('N6' ).Value:= edtIssueUnit.Value;
        Parameters.ParamByName('N7' ).Value:= edtIssueCnt.Value;
        Parameters.ParamByName('N8' ).Value:= edtIssueAmt.Value;
        Parameters.ParamByName('N9' ).Value:= MG_InsZero(IntToStr(nStartNo), 7);
        Parameters.ParamByName('N10').Value:= MG_InsZero(IntToStr(nEndNo), 7);
        Parameters.ParamByName('N11').Value:= IntToStr(cmbDCType.ItemIndex);
        Parameters.ParamByName('N12').Value:= IntToStr(edtDCAmt.Value);
        ExecSQL;
      end;
    end;
  except
    on E: Exception do ExceptLogging('TfrmCoupon.tCouponTimer: ' + aString(E.Message));
  end;
end;

procedure TfrmCoupon.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCoupon.btnStartClick(Sender: TObject);
begin
  if cmbName.Text = '' then
  begin
    ShowMessage('업체명을 입력하거나 선택하여주세요!');
    cmbName.SetFocus;
    Exit;
  end;

  if edtIssueCnt.Value = 0 then
  begin
    ShowMessage('발급매수를 입력하여주세요!');
    edtIssueCnt.SetFocus;
    Exit;
  end;

  if MG_StrStrTrim(edtExpDate.Text, '-', ' ') = '' then
  begin
    ShowMessage('유효기간을 입력하여주세요!');
    edtExpDate.SetFocus;
    Exit;
  end;

  if edtDCAmt.Value = 0 then
  begin
    ShowMessage('할인값을 입력하여주세요!');
    edtDCAmt.SetFocus;
    Exit;
  end;
  nIssueCnt:= edtIssueCnt.Value;
  nStartNo:= nCouponNo+1;
  nSerial:= edtSerial.Value;
  nNowCnt:= 0;
  tCoupon.Enabled:= True;
end;

procedure TfrmCoupon.cmbDCTypeChange(Sender: TObject);
begin
  case cmbDCType.ItemIndex of
    0: edtDCAmt.MaxValue:= 999999;
    1: edtDCAmt.MaxValue:= 999999;
    2: edtDCAmt.MaxValue:= 100;
  end;
end;

procedure TfrmCoupon.comBarcodePortOpen(Sender: TObject);
var
  sSend: aString;
begin
  //Label Size Set
  sSend:= ESC + 'D0950,0600,0920' + LF + NUL;
  comBarcode.PutString(sSend);

  //Print Density
  //sSend:= ESC + 'AY;+' + MG_InsZero(edtDensity.Text, 2) + ',0' + LF + NUL;

  //Buffer Clear
  sSend:= ESC + 'C' + LF + NUL;
  comBarcode.PutString(sSend);
  btnStart.Enabled:= True;
end;

procedure TfrmCoupon.edtIssueCntChange(Sender: TObject);
begin
  edtIssueAmt.Value:= edtIssueCnt.Value * edtIssueUnit.Value;
end;

procedure TfrmCoupon.edtIssueCntExit(Sender: TObject);
begin
  edtIssueAmt.Value:= edtIssueCnt.Value * edtIssueUnit.Value;
end;

procedure TfrmCoupon.edtIssueUnitChange(Sender: TObject);
begin
  edtIssueAmt.Value:= edtIssueCnt.Value * edtIssueUnit.Value;
end;

procedure TfrmCoupon.edtIssueUnitExit(Sender: TObject);
begin
  edtIssueAmt.Value:= edtIssueCnt.Value * edtIssueUnit.Value;
end;

procedure TfrmCoupon.FormShow(Sender: TObject);
begin
  try
    with qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select ParkNo, UnitNo, UnitKind, ComPort, Baudrate ');
      SQL.Add('From UnitInfo Where UnitKind = :N1 and MyNo = :N2 and ParkNo = :N3 Order By ParkNo, UnitNo');
      Parameters.ParamByName('N1').Value:= 17; //할인권발급기
      Parameters.ParamByName('N2').Value:= nCurrUnitNo;
      Parameters.ParamByName('N3').Value:= nCurrParkNo;
      Open;

      if RecordCount > 0 then
      begin
        comBarcode.Open:= False;
        comBarcode.ComNumber:= FieldByName('ComPort').AsInteger;
        comBarcode.Baud:= FieldByName('BaudRate').AsInteger;
        comBarcode.Open:= True;
      end
      else
        ExceptLogging('설치된 할인권발급기가 없음!');

      cmbName.Items.Clear;

      Close;
      SQL.Clear;
      SQL.Add('Select CompName From CouponSale Group By CompName Order By CompName');
      Open;

      if RecordCount > 0 then
      begin
        while not Eof do
        begin
          cmbName.Items.Add(FieldByName('CompName').AsString);
          Next;
        end;
      end;
    end;
    nCouponNo:= iSetup.ReadInteger('PARKING', 'Coupon No', 0);
  except
    on E: Exception do ExceptLogging('TfrmCoupon.FormShow: ' + E.Message);
  end;
end;

end.
