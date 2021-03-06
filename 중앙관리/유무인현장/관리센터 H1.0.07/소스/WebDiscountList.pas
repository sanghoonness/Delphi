unit WebDiscountList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, AdvEdit,
  Vcl.ComCtrls, AdvDateTimePicker, AdvCombo, Data.DB, Data.Win.ADODB, Vcl.Grids,
  AdvObj, BaseGrid, AdvGrid, DBAdvGrid, Vcl.ExtCtrls, AdvProgr, tmsAdvGridExcel,
  frxClass, frxDBSet;

type
  TfrmWebDCList = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    qryWebDC: TADOQuery;
    dsWebDC: TDataSource;
    cmbMode: TAdvComboBox;
    edtSDate: TAdvDateTimePicker;
    Label4: TLabel;
    edtEDate: TAdvDateTimePicker;
    edtCarNo: TAdvEdit;
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
    sgWebDC2: TAdvStringGrid;
    frxReport1: TfrxReport;
    qryWebDCCarNumber: TStringField;
    qryWebDCSequence: TAutoIncField;
    qryWebDCinrcarnumber: TStringField;
    qryWebDCInTime: TStringField;
    qryWebDCOutTime: TStringField;
    qryWebDCDiscountName: TStringField;
    qryWebDCStoreName: TStringField;
    qryWebDCReserve4: TStringField;
    qryWebDCReserve6: TStringField;
    qryWebDCDiscountValue: TStringField;
    qryWebDCPubTime: TStringField;
    qryWebDCuseYn: TStringField;
    qryWebDCNorKey: TStringField;
    qryWebDCProcDate: TStringField;
    qryWebDCProcTime: TStringField;
    frxDBDataset1: TfrxDBDataset;
    qryWebDCReserve7: TStringField;
    sgWebDC: TDBAdvGrid;
    edtETime: TAdvDateTimePicker;
    edtSTime: TAdvDateTimePicker;
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
  frmWebDCList: TfrmWebDCList;

  nTotalCnt, nTotalAmt : Cardinal;
implementation
uses
  Tables, Global;
{$R *.dfm}

procedure TfrmWebDCList.btnCloseClick(Sender: TObject);
begin
  //Close;
  qry.Close;
  qryWebDC.Close;
  ModalResult := mrCancel;
end;

procedure TfrmWebDCList.btnExcelClick(Sender: TObject);
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

procedure TfrmWebDCList.btnPrintClick(Sender: TObject);
var
  sTemp: String;
begin
  frxReport1.LoadFromFile(sCurrRunDir + '\Report\WebDCList.fr3');

  frxReport1.Variables['nTotalCnt']:= nTotalCnt;
  frxReport1.Variables['nTotalAmt']:= nTotalAmt;
  frxReport1.ShowReport(True);
end;

procedure TfrmWebDCList.btnSearchClick(Sender: TObject);
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
  nTotalAmt := 0;

  try
    with qryWebDC do
    begin
      Close;
      SQL.Clear;
      SQL.Add(' select ');
      SQL.Add(' A.CarNumber, A.Sequence, A.inrcarnumber, A.InYMD +'' ''+ A.InHMS InTime ');
      SQL.Add(' , A.OutYmd +'' ''+ A.OutHms OutTime, A.DiscountName, A.StoreName ');
      SQL.Add(' , A.Reserve4, A.Reserve6, A.Reserve7  ');
      SQL.Add(' , case when  Reserve6 is null then ''' + '0' + ''' else Reserve6 end  DiscountValue ');
      SQL.Add(' , A.PubYMD +'' ''+ A.PubHMS PubTime   ');
      SQL.Add(' , case when A.OutYmd is null then ''' + '??????' + ''' else ''' + '????' + '''  end useYn  ');
      SQL.Add(' , A.NorKey, A.InYMD as ProcDate, A.InHMS as ProcTime  ');
      SQL.Add(' from tblStoreDiscountPublish A  ');
      SQL.Add(' where A.DiscountMoney = 0  ');

      if cmbMode.ItemIndex = 0 then
        SQL.Add(' and A.DelYn=0 ')
      else
        SQL.Add(' and A.DelYn=0 and outymd is not null ');// ????????

      if cmbStore.ItemIndex > 0 then
        SQL.Add(' and A.StoreName = :pStoreName  ');

      SQL.Add(' and (PubYMD+PubHMS >= :pDate1 and PubYMD+PubHMS  <= :pDate2)   ');
      SQL.Add(' and A.CarNumber like ' + MG_MakeStr('%' + Trim(edtCarNo.Text) + '%'));

      if cmbMode.ItemIndex = 0 then
        SQL.Add(' order by PubTime desc ')
      else
        SQL.Add(' order by OutTime desc ');// ????????

      if cmbStore.ItemIndex > 0 then
        Parameters.ParamByName('pStoreName').Value := cmbStore.Text;
      Parameters.ParamByName('pDate1').Value  := sSDate+sSTime;
      Parameters.ParamByName('pDate2').Value  := sEDate+sETime;
      ExceptLogging(sql.Text);
      Open;

      GridClear;
      sgWebDC.RowCount := RecordCount + 1;
      
      if RecordCount > 0 then
      begin
        tmpCnt := 1;
        while not Eof do
        begin
          sgWebDC.Cells[0, tmpCnt] := FieldByName('CarNumber').AsString;
          sgWebDC.Cells[1, tmpCnt] := FieldByName('InTime').AsString;
          sgWebDC.Cells[2, tmpCnt] := FieldByName('OutTime').AsString;
          sgWebDC.Cells[3, tmpCnt] := FieldByName('DiscountName').AsString;
          sgWebDC.Cells[4, tmpCnt] := FieldByName('StoreName').AsString;
          sgWebDC.Cells[5, tmpCnt] := FieldByName('Reserve7').AsString;       // ????????
          sgWebDC.Cells[6, tmpCnt] := FieldByName('Reserve6').AsString;       // ????????
          sgWebDC.Cells[7, tmpCnt] := FieldByName('Reserve4').AsString;       // ????
          sgWebDC.Cells[8, tmpCnt] := FieldByName('PubTime').AsString;
          sgWebDC.Cells[9, tmpCnt] := FieldByName('useYn').AsString;

          sgWebDC.Alignments[0, tmpCnt] := taCenter;
          sgWebDC.Alignments[1, tmpCnt] := taCenter;
          sgWebDC.Alignments[2, tmpCnt] := taCenter;
          sgWebDC.Alignments[3, tmpCnt] := taCenter;
          sgWebDC.Alignments[4, tmpCnt] := taCenter;
          sgWebDC.Alignments[5, tmpCnt] := taRightJustify;
          sgWebDC.Alignments[6, tmpCnt] := taRightJustify;
          sgWebDC.Alignments[7, tmpCnt] := taCenter;
          sgWebDC.Alignments[8, tmpCnt] := taCenter;
          sgWebDC.Alignments[9, tmpCnt] := taCenter;

          tmpCnt := tmpCnt + 1;
          next;
        end;

        btnPrint.Enabled := True;
        btnExcel.Enabled := True;
      end
      else
      begin
        btnPrint.Enabled := False;
        btnExcel.Enabled := False;

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
      SQL.Add(' select COUNT(*) cnt, SUM(CONVERT(int, reserve6)) amt ');
      SQL.Add(' from tblStoreDiscountPublish A ');
      SQL.Add(' where A.DiscountMoney = 0 ');
      
      if cmbMode.ItemIndex = 0 then
       SQL.Add(' and A.DelYn=0  ')
      else
       SQL.Add(' and A.DelYn=0 and outymd is not null ');
	
      if cmbStore.ItemIndex > 0 then
        SQL.Add(' and A.StoreName = :pStoreName  ');

      SQL.Add(' and (PubYMD+PubHMS >= :pDate1 and PubYMD+PubHMS  <= :pDate2)   ');
      SQL.Add(' and A.CarNumber like ' + MG_MakeStr('%' + Trim(edtCarNo.Text) + '%'));
      
      if cmbStore.ItemIndex > 0 then
        Parameters.ParamByName('pStoreName').Value := cmbStore.Text;
      Parameters.ParamByName('pDate1').Value  := sSDate+sSTime;
      Parameters.ParamByName('pDate2').Value  := sEDate+sETime;
      Open;

      if RecordCount > 0 then
      begin             
        nTotalCnt := FieldByName('cnt').AsInteger;
        nTotalAmt := FieldByName('amt').AsInteger;
        sgWebDC.Cells[0, sgWebDC.RowCount] := '??????: ' + FormatFloat('#,##0', FieldByName('cnt').AsInteger) + '??';
        sgWebDC.Cells[1, sgWebDC.RowCount] := '';
        sgWebDC.Cells[2, sgWebDC.RowCount] := '';
        sgWebDC.Cells[3, sgWebDC.RowCount] := '';
        sgWebDC.Cells[4, sgWebDC.RowCount] := '';
        sgWebDC.Cells[5, sgWebDC.RowCount] := '';
        sgWebDC.Cells[6, sgWebDC.RowCount] := FormatFloat('#,##0', FieldByName('amt').AsInteger) + '??';
        sgWebDC.Cells[7, sgWebDC.RowCount] := '';
        sgWebDC.Cells[8, sgWebDC.RowCount] := '';
        sgWebDC.Cells[9, sgWebDC.RowCount] := '';

        sgWebDC.Alignments[0, tmpCnt] := taCenter;
        sgWebDC.Alignments[6, tmpCnt] := taRightJustify;
        sgWebDC.RowCount := sgWebDC.RowCount + 1;
                       
        edtTotal.Caption := ' ?? ????: ' + FormatFloat('#,##0', FieldByName('cnt').AsInteger) 
                          + '??, ?? ????????: ' + FormatFloat('#,##0', FieldByName('amt').AsInteger)  + '??';
      end
      else
        edtTotal.Caption := ' ?? ????: 0??, ?? ????????: 0??';
    end;

  except
    on E: Exception do ExceptLogging('TfrmWebDCList.btnSearchClick: ' + E.Message);
  end;
end;

procedure TfrmWebDCList.FormShow(Sender: TObject);
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

procedure TfrmWebDCList.GridClear;
begin
  with sgWebDC do
  begin
    ColCount := 10;
    RowCount := 2;
    ColWidths[0] :=  80;     Cells[0, 0] := '????????';      Alignments[0, 0] := taCenter;
    ColWidths[1] :=  130;    Cells[1, 0] := '????????';      Alignments[1, 0] := taCenter;
    ColWidths[2] :=  130;    Cells[2, 0] := '????????';      Alignments[2, 0] := taCenter;
    ColWidths[3] :=  100;    Cells[3, 0] := '??????';      Alignments[3, 0] := taCenter;
    ColWidths[4] :=  100;    Cells[4, 0] := '??????';       Alignments[4, 0] := taCenter;
    ColWidths[5] :=  80;    Cells[5, 0] := '????????';      Alignments[5, 0] := taCenter;
    ColWidths[6] :=  80;    Cells[6, 0] := '????????';      Alignments[6, 0] := taCenter;
    ColWidths[7] :=  100;    Cells[7, 0] := '????';          Alignments[7, 0] := taCenter;
    ColWidths[8] :=  130;    Cells[8, 0] := '????????';      Alignments[8, 0] := taCenter;
    ColWidths[9] :=  70;     Cells[9, 0] := '????????';      Alignments[9, 0] := taCenter;
  end;
end;



end.
