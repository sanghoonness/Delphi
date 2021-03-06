unit WebDiscountSum;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, AdvEdit,
  Vcl.ComCtrls, AdvDateTimePicker, AdvCombo, Data.DB, Data.Win.ADODB, Vcl.Grids,
  AdvObj, BaseGrid, AdvGrid, DBAdvGrid, Vcl.ExtCtrls, AdvProgr, tmsAdvGridExcel,
  frxClass, frxDBSet;

type
  TfrmWebDCSum = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    qryWebDC: TADOQuery;
    dsWebDC: TDataSource;
    cmbMode: TAdvComboBox;
    edtSDate: TAdvDateTimePicker;
    Label4: TLabel;
    edtEDate: TAdvDateTimePicker;
    btnSearch: TBitBtn;
    btnExcel: TBitBtn;
    btnClose: TBitBtn;
    btnPrint: TBitBtn;
    cmbStore: TAdvComboBox;
    qry: TADOQuery;
    edtTotal: TPanel;
    AdvGridExcelIO1: TAdvGridExcelIO;
    SaveDialog1: TSaveDialog;
    pnProgress: TPanel;
    Label6: TLabel;
    ap1: TAdvProgress;
    sgWebDC: TAdvStringGrid;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    qryWebDCStoreName: TStringField;
    qryWebDCDiscountName: TStringField;
    qryWebDCDiscountCode: TStringField;
    qryWebDCDiscountMoney: TIntegerField;
    qryWebDCDiscountValue: TIntegerField;
    qryWebDCDiscountCount: TIntegerField;
    qryWebDCtotalMoney: TIntegerField;
    qryWebDCReserve6: TIntegerField;
    qryWebDCReserve7: TIntegerField;
    edtSTime: TAdvDateTimePicker;
    edtETime: TAdvDateTimePicker;
    procedure FormShow(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    { Private declarations }
    procedure GridClear;
  public
    { Public declarations }
  end;

var
  frmWebDCSum: TfrmWebDCSum;

  nTotalCnt, nTotalAmt1, nTotalAmt2 : Cardinal;

implementation
uses
  Tables, Global;
{$R *.dfm}

procedure TfrmWebDCSum.btnCloseClick(Sender: TObject);
begin
  //Close;
  qry.Close;
  qryWebDC.Close;
  ModalResult := mrCancel;
end;

procedure TfrmWebDCSum.btnExcelClick(Sender: TObject);
begin
  try
    if savedialog1.Execute then
    begin
      pnProgress.Visible:= True;
      Refresh;
      AdvGridExcelIO1.XLSExport(savedialog1.filename + '.xls');
      pnProgress.Visible:= False;
      ShowMessage('?????????? ????????!');
    end;
  except
    on E: Exception do ExceptLogging('TfrmIONData.btnExcelClick: ' + E.Message);
  end;
end;

procedure TfrmWebDCSum.btnPrintClick(Sender: TObject);
var
  sTemp: String;
begin
  frxReport1.LoadFromFile(sCurrRunDir + '\Report\WebDCSum.fr3');

  frxReport1.Variables['nTotalCnt']:= nTotalCnt;
  frxReport1.Variables['nTotalAmt1']:= nTotalAmt1;
  frxReport1.Variables['nTotalAmt2']:= nTotalAmt2;
  frxReport1.ShowReport(True);
end;

procedure TfrmWebDCSum.btnSearchClick(Sender: TObject);
var
  sSDate, sEDate, sSTime, sETime : String;
  nRecordCount, tmpCnt : Cardinal;
begin
  sSDate := FormatDateTime('YYYY-MM-DD', edtSDate.Date);
  sEDate := FormatDateTime('YYYY-MM-DD', edtEDate.Date);
  sSTime := FormatDateTime('HH:NN:SS', edtSTime.Time);
  sETime := FormatDateTime('HH:NN:SS', edtETime.Time);

  nRecordCount := 0;
  nTotalCnt := 0;
  nTotalAmt1 := 0;
  nTotalAmt2 := 0;

  try
    with qryWebDC do
    begin
      Close;
      SQL.Clear;
      SQL.Add(' select StoreName, DiscountName, DiscountCode, DiscountMoney ');
      SQL.Add(' , DiscountValue, DiscountCount, (DiscountCount * DiscountMoney) as totalMoney,CONVERT(int, Reserve6) Reserve6, CONVERT(int, Reserve7) Reserve7  ');
      SQL.Add(' from (select StoreName, DiscountName, DiscountCode, DiscountMoney ');
      SQL.Add(' , sum(DiscountValue) as DiscountValue, sum(DiscountCount) as DiscountCount, Reserve6, Reserve7   ');
      SQL.Add(' from tblStoreDiscountPublish  ');

      if cmbMode.ItemIndex = 0 then
        SQL.Add(' where DelYn=0 ')
      else
        SQL.Add(' where DelYn=0 and outymd is not null ');// ????????

      if cmbStore.ItemIndex > 0 then
        SQL.Add(' and StoreName = :pStoreName  ');

      SQL.Add(' and (PubYMD+PubHMS >= :pDate1 and PubYMD+PubHMS  <= :pDate2)    ');
      SQL.Add(' group by StoreName, DiscountName, DiscountCode, DiscountMoney, Reserve6, Reserve7  ');
      SQL.Add(' )  A ');
      SQL.Add(' order by StoreName, DiscountCode ');

      if cmbStore.ItemIndex > 0 then
        Parameters.ParamByName('pStoreName').Value := cmbStore.Text;
      Parameters.ParamByName('pDate1').Value  := sSDate+sSTime;
      Parameters.ParamByName('pDate2').Value  := sEDate+sETime;

      Open;

      GridClear;
      sgWebDC.RowCount := RecordCount + 1;
      
      if RecordCount > 0 then
      begin

        tmpCnt := 1;
        while not Eof do
        begin
          sgWebDC.Cells[0,tmpCnt] := FieldByName('StoreName').AsString;       // ??????
          sgWebDC.Cells[1,tmpCnt] := FieldByName('DiscountName').AsString;    // ????????
          sgWebDC.Cells[2,tmpCnt] := FieldByName('DiscountCount').AsString;   // ????????
          sgWebDC.Cells[3,tmpCnt] := FieldByName('Reserve7').AsString;        // ????????
          sgWebDC.Cells[4,tmpCnt] := FieldByName('Reserve6').AsString;        // ????????
            

          sgWebDC.Alignments[0, tmpCnt] := taCenter;
          sgWebDC.Alignments[1, tmpCnt] := taCenter;
          sgWebDC.Alignments[2, tmpCnt] := taCenter;
          sgWebDC.Alignments[3, tmpCnt] := taRightJustify;
          sgWebDC.Alignments[4, tmpCnt] := taRightJustify;

          tmpCnt := tmpCnt + 1;
          next;
        end;

        btnPrint.Enabled := True;
        btnExcel.Enabled := True;
      end
      else
      begin
        btnExcel.Enabled := False;
        btnPrint.Enabled := False;

        sgWebDC.RowCount := 2;
        sgWebDC.FixedRows := 1;
        for tmpCnt := 0 to sgWebDC.ColCount - 1 do sgWebDC.Cells[tmpCnt, 1] := '';
      end;

   end;

   with qry do
   begin
      // ????
      Close;
      SQL.Clear;
      SQL.Add(' select sum(DiscountCount) cnt, SUM(convert(int, reserve6)) amt1,  SUM(convert(int, Reserve7)) amt2   ');
      SQL.Add(' from (select StoreName, DiscountName, DiscountCode, DiscountMoney ');
      SQL.Add(' , sum(DiscountValue) as DiscountValue, sum(DiscountCount) as DiscountCount, Reserve6, Reserve7   ');
      SQL.Add(' from tblStoreDiscountPublish  ');

      if cmbMode.ItemIndex = 0 then
        SQL.Add(' where DelYn=0 ')
      else
        SQL.Add(' where DelYn=0 and outymd is not null ');// ????????

      if cmbStore.ItemIndex > 0 then
        SQL.Add(' and StoreName = :pStoreName  ');

      SQL.Add(' and (PubYMD+PubHMS >= :pDate1 and PubYMD+PubHMS  <= :pDate2)    ');
      SQL.Add(' group by StoreName, DiscountName, DiscountCode, DiscountMoney, Reserve6, Reserve7  ');
      SQL.Add(' )  A ');

      if cmbStore.ItemIndex > 0 then
        Parameters.ParamByName('pStoreName').Value := cmbStore.Text;
      Parameters.ParamByName('pDate1').Value  := sSDate+sSTime;
      Parameters.ParamByName('pDate2').Value  := sEDate+sETime;
      Open;

      if RecordCount > 0 then
      begin             
        nTotalCnt := FieldByName('cnt').AsInteger;
        nTotalAmt1 := FieldByName('amt1').AsInteger;
        nTotalAmt2 := FieldByName('amt2').AsInteger;

        sgWebDC.Cells[0, sgWebDC.RowCount] := '';
        sgWebDC.Cells[1, sgWebDC.RowCount] := '';
        sgWebDC.Cells[2, sgWebDC.RowCount] := '?? ????: ' + FormatFloat('#,##0', FieldByName('cnt').AsInteger) + '??' ;
        sgWebDC.Cells[3, sgWebDC.RowCount] := FormatFloat('#,##0', FieldByName('amt2').AsInteger) + '??';
        sgWebDC.Cells[4, sgWebDC.RowCount] := FormatFloat('#,##0', FieldByName('amt1').AsInteger) + '??';

        sgWebDC.Alignments[2, tmpCnt] := taCenter;
        sgWebDC.Alignments[3, tmpCnt] := taRightJustify;
        sgWebDC.Alignments[4, tmpCnt] := taRightJustify;
        sgWebDC.RowCount := sgWebDC.RowCount + 1;
                       
        edtTotal.Caption := ' ?? ????: ' + FormatFloat('#,##0', FieldByName('cnt').AsInteger)
                          + '??, ?? ????????: ' + FormatFloat('#,##0', FieldByName('amt2').AsInteger)  + '??'
                          + ', ?? ????????: ' + FormatFloat('#,##0', FieldByName('amt1').AsInteger)  + '??';
      end
      else
        edtTotal.Caption := ' ?? ????: 0??, ?? ????????: 0??, ?? ????????: 0??';
    end;

  except
    on E: Exception do ExceptLogging('TfrmWebDCList.btnSearchClick: ' + E.Message);
  end;
end;

procedure TfrmWebDCSum.FormShow(Sender: TObject);
begin
  edtSDate.Date:= Now;
  edtEDate.Date:= Now;
  edtSTime.Time:= StrToDateTime('00:00:00');
  edtETime.Time:= StrToDateTime('23:59:59');

  try

    GridClear;
  
    with qry do
    begin
      Close;
      SQL.Clear;
      SQL.Add(' select * from tblStore ');
      SQL.Add(' order by StoreName ');
      Open;

      if RecordCount > 0 then
      begin
        cmbStore.Items.Add('????');

        while not Eof do
        begin
          cmbStore.Items.Add(FieldByName('StoreName').AsString);
          next;
        end;

        cmbStore.ItemIndex := 0;
      end;
    end;
  except
    on E: Exception do ExceptLogging('TfrmWebDCList.FormShow: ' + E.Message);
  end;
end;

procedure TfrmWebDCSum.GridClear;
begin
  with sgWebDC do
  begin
    ColCount := 5;
    RowCount := 2;
    ColWidths[0] :=  100;     Cells[0, 0] := '??????';      Alignments[0, 0] := taCenter;
    ColWidths[1] :=  130;    Cells[1, 0] := '????????';      Alignments[1, 0] := taCenter;
    ColWidths[2] :=  130;    Cells[2, 0] := '????????';      Alignments[2, 0] := taCenter;
    ColWidths[3] :=  100;    Cells[3, 0] := '????????';      Alignments[3, 0] := taCenter;
    ColWidths[4] :=  100;    Cells[4, 0] := '????????';  Alignments[4, 0] := taCenter;
  end;
end;


end.
