unit Magam;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, AdvObj, BaseGrid, AdvGrid,
  DBAdvGrid, Vcl.ComCtrls, AdvDateTimePicker, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, tmsAdvGridExcel, Data.DB, Data.Win.ADODB, AdvEdit, AdvCombo;

type
  TfrmMagam = class(TForm)
    dgMagam: TDBAdvGrid;
    eMagam: TAdvGridExcelIO;
    SaveDialog1: TSaveDialog;
    Panel1: TPanel;
    Bevel2: TBevel;
    Label7: TLabel;
    Label8: TLabel;
    edtSDate: TAdvDateTimePicker;
    edtSTime: TAdvDateTimePicker;
    edtEDate: TAdvDateTimePicker;
    edtETime: TAdvDateTimePicker;
    qryMagam: TADOQuery;
    dsMagam: TDataSource;
    qryMagamParkcode: TStringField;
    qryMagamParkName: TStringField;
    qryMagamParkBusinessCode: TStringField;
    qryMagamParkaddress: TStringField;
    qryMagamParkPhone: TStringField;
    qryMagamBoothCode: TStringField;
    qryMagamBoothName: TStringField;
    qryMagamCloseYMD: TStringField;
    qryMagamCloseCount: TIntegerField;
    qryMagamMagamEnd: TStringField;
    qryMagamMagamStart: TStringField;
    qryMagamTotalParkCount: TIntegerField;
    qryMagamTotalParkMoney: TIntegerField;
    qryMagamParkCount: TIntegerField;
    qryMagamParkMoney: TIntegerField;
    qryMagamGraceTimeCount: TIntegerField;
    qryMagamGraceTImeMoney: TIntegerField;
    qryMagamRegCount: TIntegerField;
    qryMagamRegMoney: TIntegerField;
    qryMagamInOutComeTotalCount: TIntegerField;
    qryMagamInOutComeTotlaMoney: TIntegerField;
    qryMagamCashCount: TIntegerField;
    qryMagamCashMoney: TIntegerField;
    qryMagamTrafficCount: TIntegerField;
    qryMagamTrafficMoney: TIntegerField;
    qryMagamCardCount: TIntegerField;
    qryMagamCardMoney: TIntegerField;
    qryMagamDiscountCount: TIntegerField;
    qryMagamDiscountMoney: TIntegerField;
    qryMagamCashTicketCount: TIntegerField;
    qryMagamCashTicketMoney: TIntegerField;
    qryMagamIncomeTotalCount: TIntegerField;
    qryMagamIncomeTotalMoney: TIntegerField;
    qryMagamin10Count: TIntegerField;
    qryMagamin10Money: TIntegerField;
    qryMagamin50Count: TIntegerField;
    qryMagamin50Money: TIntegerField;
    qryMagamin100Count: TIntegerField;
    qryMagamin100Money: TIntegerField;
    qryMagamin500Count: TIntegerField;
    qryMagamin500Money: TIntegerField;
    qryMagamin1000Count: TIntegerField;
    qryMagamin1000Money: TIntegerField;
    qryMagamin5000Count: TIntegerField;
    qryMagamin5000Money: TIntegerField;
    qryMagamin10000Count: TIntegerField;
    qryMagamin10000Money: TIntegerField;
    qryMagamin50000Count: TIntegerField;
    qryMagamin50000Money: TIntegerField;
    qryMagamOutcomeTotalCount: TIntegerField;
    qryMagamOutcomeTotalMoney: TIntegerField;
    qryMagamOut10Count: TIntegerField;
    qryMagamOut10Money: TIntegerField;
    qryMagamOut50Count: TIntegerField;
    qryMagamOut50Money: TIntegerField;
    qryMagamOut100Count: TIntegerField;
    qryMagamOut100Money: TIntegerField;
    qryMagamOut500Count: TIntegerField;
    qryMagamOut500Money: TIntegerField;
    qryMagamOut1000Count: TIntegerField;
    qryMagamOut1000Money: TIntegerField;
    qryMagamOut5000Count: TIntegerField;
    qryMagamOut5000Money: TIntegerField;
    qryMagamOut10000Count: TIntegerField;
    qryMagamOut10000Money: TIntegerField;
    qryMagamOut50000Count: TIntegerField;
    qryMagamOut50000Money: TIntegerField;
    qryMagamRevTotalCount: TIntegerField;
    qryMagamRevTotalMoney: TIntegerField;
    qryMagamRev10Count: TIntegerField;
    qryMagamRev10Money: TIntegerField;
    qryMagamRev50Count: TIntegerField;
    qryMagamRev50Money: TIntegerField;
    qryMagamRev100Count: TIntegerField;
    qryMagamRev100Money: TIntegerField;
    qryMagamRev500Count: TIntegerField;
    qryMagamRev500Money: TIntegerField;
    qryMagamRev1000Count: TIntegerField;
    qryMagamRev1000Money: TIntegerField;
    qryMagamRev5000Count: TIntegerField;
    qryMagamRev5000Money: TIntegerField;
    qryMagamRev10000Count: TIntegerField;
    qryMagamRev10000Money: TIntegerField;
    qryMagamRev50000Count: TIntegerField;
    qryMagamRev50000Money: TIntegerField;
    Panel2: TPanel;
    edtTotalCount: TAdvEdit;
    edtTotalMoney: TAdvEdit;
    edtParkCount: TAdvEdit;
    edtParkMoney: TAdvEdit;
    edtGraceTimeCount: TAdvEdit;
    edtGraceTimeMoney: TAdvEdit;
    edtRegCount: TAdvEdit;
    edtRegMoney: TAdvEdit;
    edtInOutComeTotalCount: TAdvEdit;
    edtInOutComeTotalMoney: TAdvEdit;
    edtCashCount: TAdvEdit;
    edtCashMoney: TAdvEdit;
    edtTrafficCount: TAdvEdit;
    edtTrafficMoney: TAdvEdit;
    edtCardCount: TAdvEdit;
    edtCardMoney: TAdvEdit;
    edtDiscountCount: TAdvEdit;
    edtDiscountMoney: TAdvEdit;
    edtCashTicketCount: TAdvEdit;
    edtCashTicketMoney: TAdvEdit;
    edtIncomeTotalCount: TAdvEdit;
    edtIncomeTotalMoney: TAdvEdit;
    edtIn10Count: TAdvEdit;
    edtIn10Money: TAdvEdit;
    edtIn50Count: TAdvEdit;
    edtIn50Money: TAdvEdit;
    edtIn100Count: TAdvEdit;
    edtIn100Money: TAdvEdit;
    edtIn500Count: TAdvEdit;
    edtIn500Money: TAdvEdit;
    edtIn1000Count: TAdvEdit;
    edtIn1000Money: TAdvEdit;
    edtIn5000Count: TAdvEdit;
    edtIn5000Money: TAdvEdit;
    edtIn10000Count: TAdvEdit;
    edtIn10000Money: TAdvEdit;
    edtIn50000Count: TAdvEdit;
    edtIn50000Money: TAdvEdit;
    edtOutcomeTotalCount: TAdvEdit;
    edtOutcomeTotalMoney: TAdvEdit;
    edtOut10Count: TAdvEdit;
    edtOut10Money: TAdvEdit;
    edtOut50Count: TAdvEdit;
    edtOut50Money: TAdvEdit;
    edtOut100Count: TAdvEdit;
    edtOut100Money: TAdvEdit;
    edtOut500Count: TAdvEdit;
    edtOut500Money: TAdvEdit;
    edtOut1000Count: TAdvEdit;
    edtOut1000Money: TAdvEdit;
    edtOut5000Count: TAdvEdit;
    edtOut50000Count: TAdvEdit;
    edtRevTotalCount: TAdvEdit;
    edtRev50Count: TAdvEdit;
    edtRev500Count: TAdvEdit;
    edtRev5000Count: TAdvEdit;
    edtOut5000Money: TAdvEdit;
    edtOut10000Count: TAdvEdit;
    edtOut10000Money: TAdvEdit;
    edtOut50000Money: TAdvEdit;
    edtRevTotalMoney: TAdvEdit;
    edtRev10Count: TAdvEdit;
    edtRev10Money: TAdvEdit;
    edtRev50Money: TAdvEdit;
    edtRev100Count: TAdvEdit;
    edtRev100Money: TAdvEdit;
    edtRev500Money: TAdvEdit;
    edtRev1000Count: TAdvEdit;
    edtRev1000Money: TAdvEdit;
    edtRev5000Money: TAdvEdit;
    edtRev10000Count: TAdvEdit;
    edtRev10000Money: TAdvEdit;
    edtRev50000Count: TAdvEdit;
    edtRev50000Money: TAdvEdit;
    btnExcel: TBitBtn;
    btnSearch: TBitBtn;
    btnClose: TBitBtn;
    sb1: TStatusBar;
    cmbUnitName: TAdvComboBox;
    qryTemp: TADOQuery;
    procedure FormShow(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure dgMagamClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
  private
    { Private declarations }
    procedure frmClear;
  public
    { Public declarations }
  end;

var
  frmMagam: TfrmMagam;

implementation
uses Tables, Global;

{$R *.dfm}

procedure TfrmMagam.frmClear;
begin
  try
      edtTotalCount.Text := '';
      edtTotalMoney.Text :=  '';
      edtParkCount.Text := '';
      edtParkMoney.Text := '';
      edtGraceTimeCount.Text := '';
      edtGraceTimeMoney.Text := '';
      edtRegCount.Text := '';
      edtRegMoney.Text := '';
      edtInOutComeTotalCount.Text :=  '';
      edtInOutComeTotalMoney.Text := '';
      edtCashCount.Text := '';
      edtCashMoney.Text := '';
      edtTrafficCount.Text := '';
      edtTrafficMoney.Text :=  '';
      edtCardCount.Text := '';
      edtCardMoney.Text := '';
      edtDiscountCount.Text := '';
      edtDiscountMoney.Text :=  '';
      edtCashTicketCount.Text := '';
      edtCashTicketMoney.Text := '';
      edtIncomeTotalCount.Text := '';
      edtIncomeTotalMoney.Text := '';
      edtin10Count.Text := '';
      edtin10Money.Text := '';
      edtin50Count.Text := '';
      edtin50Money.Text := '';
      edtin100Count.Text := '';
      edtin100Money.Text := '';
      edtin500Count.Text :=  '';
      edtin500Money.Text := '';
      edtin1000Count.Text := '';
      edtin1000Money.Text :=  '';
      edtin5000Count.Text :=  '';
      edtin5000Money.Text := '';
      edtin10000Count.Text := '';
      edtin10000Money.Text := '';
      edtin50000Count.Text := '';
      edtin50000Money.Text := '';
      edtOutcomeTotalCount.Text := '';
      edtOutcomeTotalMoney.Text := '';
      edtOut10Count.Text := '';
      edtOut10Money.Text := '';
      edtOut50Count.Text :=  '';
      edtOut50Money.Text :=  '';
      edtOut100Count.Text :=  '';
      edtOut100Money.Text := '';
      edtOut500Count.Text :=  '';
      edtOut500Money.Text :=  '';
      edtOut1000Count.Text := '';
      edtOut1000Money.Text := '';
      edtOut5000Count.Text := '';
      edtOut5000Money.Text := '';
      edtOut10000Count.Text := '';
      edtOut10000Money.Text :=  '';
      edtOut50000Count.Text := '';
      edtOut50000Money.Text := '';
      edtRevTotalCount.Text :='';
      edtRevTotalMoney.Text :='';
      edtRev10Count.Text :='';
      edtRev10Money.Text :='';
      edtRev50Count.Text := '';
      edtRev50Money.Text := '';
      edtRev100Count.Text := '';
      edtRev100Money.Text := '';
      edtRev500Count.Text :='';
      edtRev500Money.Text := '';
      edtRev1000Count.Text :='';
      edtRev1000Money.Text := '';
      edtRev5000Count.Text :='';
      edtRev5000Money.Text := '';
      edtRev10000Count.Text :='';
      edtRev10000Money.Text := '';
      edtRev50000Count.Text := '';
      edtRev50000Money.Text := '';
  except
    on E: Exception do ExceptLogging('TfrmMagam.frmClear: ' + aString(E.Message));
  end;
end;

procedure TfrmMagam.btnCloseClick(Sender: TObject);
begin
  qryMagam.Close;
  Close;
end;

procedure TfrmMagam.btnExcelClick(Sender: TObject);
begin
  try
    if savedialog1.Execute then
    begin
      eMagam.XLSExport(savedialog1.filename + '.xls');
      ShowMessage('?????????? ????????!');
    end;
  except
    on E: Exception do ExceptLogging('TfrmMagam.btnExcelClick: ' + aString(E.Message));
  end;
end;

procedure TfrmMagam.btnSearchClick(Sender: TObject);
var
  sSDate, sEDate, sSTime, sETime, sQuery: String;
begin
  try
    sSDate:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
    sEDate:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
    sSTime:= FormatDateTime('HH:NN:SS', edtSTime.Time);
    sETime:= FormatDateTime('HH:NN:SS', edtETime.Time);

    with qryMagam do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT Parkcode, ParkName, ParkBusinessCode, Parkaddress, ParkPhone, BoothCode, BoothName, CloseYMD, CloseCount  ');
      SQL.Add(', MagamEnd, MagamStart, TotalParkCount, TotalParkMoney, ParkCount, ParkMoney, GraceTimeCount, GraceTImeMoney, RegCount, RegMoney  ');
      SQL.Add(', InOutComeTotalCount, InOutComeTotlaMoney, CashCount, CashMoney, TrafficCount, TrafficMoney, CardCount, CardMoney  ');
      SQL.Add(', DiscountCount, DiscountMoney, CashTicketCount, CashTicketMoney, IncomeTotalCount, IncomeTotalMoney, in10Count, in10Money  ');
      SQL.Add(', in50Count, in50Money, in100Count, in100Money, in500Count, in500Money, in1000Count, in1000Money, in5000Count, in5000Money  ');
      SQL.Add(', in10000Count, in10000Money, in50000Count, in50000Money, OutcomeTotalCount, OutcomeTotalMoney, Out10Count, Out10Money   ');
      SQL.Add(', Out50Count, Out50Money, Out100Count, Out100Money, Out500Count, Out500Money, Out1000Count, Out1000Money, Out5000Count, Out5000Money ');
      SQL.Add(', Out10000Count, Out10000Money, Out50000Count, Out50000Money, RevTotalCount, RevTotalMoney, Rev10Count, Rev10Money ');
      SQL.Add(', Rev50Count, Rev50Money, Rev100Count, Rev100Money, Rev500Count, Rev500Money, Rev1000Count, Rev1000Money, Rev5000Count, Rev5000Money  ');
      SQL.Add(', Rev10000Count, Rev10000Money, Rev50000Count, Rev50000Money ');
      SQL.Add(' FROM View_Magam   Where Parkcode = :pParkcode ');
      if (cmbUnitName.ItemIndex > 0) then
        SQL.Add(' and BoothName = :pBoothName ') ;
      SQL.Add(' And CloseYMD >= :pCloseYMD1 and CloseYMD <= :pCloseYMD2 Order by CloseYmd desc');
      Parameters.ParamByName('pCloseYMD1').Value :=  sSDate;
      Parameters.ParamByName('pCloseYMD2').Value :=  sEDate;
      Parameters.ParamByName('pParkcode').Value :=  nCurrParkNo;
      if (cmbUnitName.ItemIndex > 0) then
        Parameters.ParamByName('pBoothName').Value := cmbUnitName.Text;
      Open;

      if RecordCount > 0 then
        sb1.SimpleText:= '???????? : ' + IntToStr(RecordCount) + '??'
      else
        sb1.SimpleText:= '???????? : 0??';
    end;

    frmClear;
  except
    on E: Exception do ExceptLogging('TfrmMagam.btnSearchClick: ' + E.Message);
  end;
end;

procedure TfrmMagam.dgMagamClick(Sender: TObject);
begin
  try
    if qryMagam.RecordCount <= 0 then
      Exit;

    with qryMagam do
    begin
      edtTotalCount.Text := FieldByName('TotalParkCount').AsString;    // ??????
      edtTotalMoney.Text := FieldByName('TotalParkMoney').AsString;     // ??????
      edtParkCount.Text := FieldByName('ParkCount').AsString;         // ???????? ????????
      edtParkMoney.Text := FieldByName('ParkMoney').AsString;         // ???????? ????????
      edtGraceTimeCount.Text := FieldByName('GraceTimeCount').AsString;   // ???????? ????????
      edtGraceTimeMoney.Text := FieldByName('GraceTimeMoney').AsString;   // ???????? ????????
      edtRegCount.Text := FieldByName('RegCount').AsString;               // ????????????????
      edtRegMoney.Text := FieldByName('RegMoney').AsString;               // ????????????????
      edtInOutComeTotalCount.Text := FieldByName('InOutComeTotalCount').AsString;    // ????????????
      edtInOutComeTotalMoney.Text := FieldByName('InOutComeTotlaMoney').AsString;    // ????????????
      edtCashCount.Text :=  FieldByName('CashCount').AsString;    // ??????????
      edtCashMoney.Text :=  FieldByName('CashMoney').AsString;    // ??????????
      edtTrafficCount.Text :=  FieldByName('TrafficCount').AsString;    // ????????????
      edtTrafficMoney.Text :=  FieldByName('TrafficMoney').AsString;    // ????????????
      edtCardCount.Text :=  FieldByName('CardCount').AsString;   // ????????????
      edtCardMoney.Text :=  FieldByName('CardMoney').AsString;   // ????????????
      edtDiscountCount.Text := FieldByName('DiscountCount').AsString;     // ??????????
      edtDiscountMoney.Text := FieldByName('DiscountMoney').AsString;     // ??????????
      edtCashTicketCount.Text := FieldByName('CashTicketCount').AsString;   // ??????????
      edtCashTicketMoney.Text := FieldByName('CashTicketMoney').AsString;   // ??????????
      edtIncomeTotalCount.Text := FieldByName('IncomeTotalCount').AsString;    // ???????? ??????
      edtIncomeTotalMoney.Text := FieldByName('IncomeTotalMoney').AsString;    // ???????? ??????
      edtin10Count.Text := FieldByName('in10Count').AsString;   // ????????????
      edtin10Money.Text := FieldByName('in10Money').AsString;   // ????????????
      edtin50Count.Text := FieldByName('in50Count').AsString;   // ??????????????
      edtin50Money.Text := FieldByName('in50Money').AsString;   // ??????????????
      edtin100Count.Text := FieldByName('in100Count').AsString;   // ????????????
      edtin100Money.Text := FieldByName('in100Money').AsString;   // ????????????
      edtin500Count.Text := FieldByName('in500Count').AsString;   // ??????????????
      edtin500Money.Text := FieldByName('in500Money').AsString;   // ??????????????
      edtin1000Count.Text := FieldByName('in1000Count').AsString;   // ????????????
      edtin1000Money.Text := FieldByName('in1000Money').AsString;   // ????????????
      edtin5000Count.Text := FieldByName('in5000Count').AsString;   // ??????????????
      edtin5000Money.Text := FieldByName('in5000Money').AsString;   // ??????????????
      edtin10000Count.Text := FieldByName('in10000Count').AsString;   // ????????????
      edtin10000Money.Text := FieldByName('in10000Money').AsString;   // ????????????
      edtin50000Count.Text := FieldByName('in50000Count').AsString;   // ??????????????
      edtin50000Money.Text := FieldByName('in50000Money').AsString;   // ??????????????
      edtOutcomeTotalCount.Text := FieldByName('OutcomeTotalCount').AsString;  // ??????????????
      edtOutcomeTotalMoney.Text := FieldByName('OutcomeTotalMoney').AsString;  // ??????????????
      edtOut10Count.Text := FieldByName('Out10Count').AsString;   // ????????????
      edtOut10Money.Text := FieldByName('Out10Money').AsString;   // ????????????
      edtOut50Count.Text := FieldByName('Out50Count').AsString;   // ??????????????
      edtOut50Money.Text := FieldByName('Out50Money').AsString;   // ??????????????
      edtOut100Count.Text := FieldByName('Out100Count').AsString;   // ????????????
      edtOut100Money.Text := FieldByName('Out100Money').AsString;   // ????????????
      edtOut500Count.Text := FieldByName('Out500Count').AsString;   // ??????????????
      edtOut500Money.Text := FieldByName('Out500Money').AsString;   // ??????????????
      edtOut1000Count.Text := FieldByName('Out1000Count').AsString;   // ????????????
      edtOut1000Money.Text := FieldByName('Out1000Money').AsString;   // ????????????
      edtOut5000Count.Text := FieldByName('Out5000Count').AsString;   // ??????????????
      edtOut5000Money.Text := FieldByName('Out5000Money').AsString;   // ??????????????
      edtOut10000Count.Text := FieldByName('Out10000Count').AsString;   // ????????????
      edtOut10000Money.Text := FieldByName('Out10000Money').AsString;   // ????????????
      edtOut50000Count.Text := FieldByName('Out50000Count').AsString;   // ??????????????
      edtOut50000Money.Text := FieldByName('Out50000Money').AsString;   // ??????????????
      edtRevTotalCount.Text := FieldByName('RevTotalCount').AsString;   // ???????? ??????
      edtRevTotalMoney.Text := FieldByName('RevTotalMoney').AsString;   // ???????? ??????
      edtRev10Count.Text := FieldByName('Rev10Count').AsString;   // ????????????
      edtRev10Money.Text := FieldByName('Rev10Money').AsString;   // ????????????
      edtRev50Count.Text := FieldByName('Rev50Count').AsString;   // ??????????????
      edtRev50Money.Text := FieldByName('Rev50Money').AsString;   // ??????????????
      edtRev100Count.Text := FieldByName('Rev100Count').AsString;   // ????????????
      edtRev100Money.Text := FieldByName('Rev100Money').AsString;   // ????????????
      edtRev500Count.Text := FieldByName('Rev500Count').AsString;   // ??????????????
      edtRev500Money.Text := FieldByName('Rev500Money').AsString;   // ??????????????
      edtRev1000Count.Text := FieldByName('Rev1000Count').AsString;   // ????????????
      edtRev1000Money.Text := FieldByName('Rev1000Money').AsString;   // ????????????
      edtRev5000Count.Text := FieldByName('Rev5000Count').AsString;   // ??????????????
      edtRev5000Money.Text := FieldByName('Rev5000Money').AsString;   // ??????????????
      edtRev10000Count.Text := FieldByName('Rev10000Count').AsString;   // ????????????
      edtRev10000Money.Text := FieldByName('Rev10000Money').AsString;   // ????????????
      edtRev50000Count.Text := FieldByName('Rev50000Count').AsString;   // ??????????????
      edtRev50000Money.Text := FieldByName('Rev50000Money').AsString;   // ??????????????
    end;

  except
    on E: Exception do ExceptLogging('TfrmMagam.dgMagamClick: ' + E.Message);
  end;
end;

procedure TfrmMagam.FormShow(Sender: TObject);
begin
  try
    edtSDate.Date:= Now;
    edtEDate.Date:= Now;
    edtSDate.SetFocus;

    cmbUnitName.Items.Clear;
    cmbUnitName.Items.Add('????');

    with qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add(' select UnitName, UnitNo from UnitInfo where UnitKind in (12, 13)');
      Open;
      if RecordCount > 0 then
      begin
        while not Eof do
        begin
          cmbUnitName.Items.Add(FieldByName('UnitName').AsString);
          next;
        end;
      end;

      cmbUnitName.ItemIndex := 0;
    end;
  except
    on E: Exception do ExceptLogging('TfrmMagam.FormShow: ' + E.Message);
  end;
end;

end.
