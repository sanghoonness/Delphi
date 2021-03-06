unit VanListSum;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, frxClass, frxDBSet,
  tmsAdvGridExcel, Data.Win.ADODB, Vcl.ComCtrls, AdvProgr, Vcl.Grids, AdvObj,
  BaseGrid, AdvGrid, DBAdvGrid, Vcl.Mask, AdvSpin, Vcl.StdCtrls, AdvEdit,
  Vcl.Buttons, AdvDateTimePicker, Vcl.ExtCtrls;

type
  TfrmVanListSum = class(TForm)
    Panel1: TPanel;
    Label4: TLabel;
    edtSDate: TAdvDateTimePicker;
    edtEDate: TAdvDateTimePicker;
    btnSearch: TBitBtn;
    btnExcel: TBitBtn;
    btnPrint: TBitBtn;
    btnClose: TBitBtn;
    sb1: TStatusBar;
    Panel2: TPanel;
    pnProgress: TPanel;
    Label6: TLabel;
    ap1: TAdvProgress;
    frxReport1: TfrxReport;
    dsVanList: TDataSource;
    qryVanList: TADOQuery;
    qry: TADOQuery;
    AdvGridExcelIO1: TAdvGridExcelIO;
    SaveDialog1: TSaveDialog;
    frxDBDataset1: TfrxDBDataset;
    qryVanListProcDate: TStringField;
    qryVanListtotalCnt: TIntegerField;
    qryVanListtotalAmt: TIntegerField;
    qryVanListtotalCnt1: TIntegerField;
    qryVanListtotalAmt1: TIntegerField;
    qryVanListtotalCnt2: TIntegerField;
    qryVanListtotalAmt2: TIntegerField;
    qryVanListtotalCnt3: TIntegerField;
    qryVanListtotalAmt3: TIntegerField;
    qryVanListtotalCnt4: TIntegerField;
    qryVanListtotalAmt4: TIntegerField;
    qryVanListtotalCnt5: TIntegerField;
    qryVanListtotalAmt5: TIntegerField;
    qryVanListtotalCnt6: TIntegerField;
    qryVanListtotalAmt6: TIntegerField;
    qryVanListtotalCnt7: TIntegerField;
    qryVanListtotalAmt7: TIntegerField;
    sgVanList: TAdvStringGrid;
    qryVanListtotalCnt8: TIntegerField;
    qryVanListtotalAmt8: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    { Private declarations }
    procedure GridClear();
  public
    { Public declarations }
  end;

var
  frmVanListSum: TfrmVanListSum;
  // ????????
  nTotalCnt, nTotalAmt, nTotalCnt1, nTotalAmt1, nTotalCnt2, nTotalAmt2, nTotalCnt3, nTotalAmt3
  , nTotalCnt4, nTotalAmt4, nTotalCnt5, nTotalAmt5, nTotalCnt6, nTotalAmt6, nTotalCnt7, nTotalAmt7,nTotalCnt8,nTotalAmt8 : Cardinal;

implementation
uses
  Global, Tables;
{$R *.dfm}

procedure TfrmVanListSum.GridClear();
var
  i, j: Byte;
begin
  with sgVanList do
  begin
   // ColCount := 17;
   ColCount := 19;
    RowCount := 2;

    ColWidths[0]  :=  100;   Cells[0, 0] := '????????';      Alignments[0, 0] := taCenter;
    ColWidths[1]  :=  50;    Cells[1, 0] := '??????';        Alignments[1, 0] := taCenter;
    ColWidths[2]  :=  70;    Cells[2, 0] := '??????';        Alignments[2, 0] := taCenter;

    ColWidths[3]  :=  50;    Cells[3, 0] := '????????';      Alignments[3, 0] := taCenter;
    ColWidths[4]  :=  70;    Cells[4, 0] := '';              Alignments[4, 0] := taCenter;

    ColWidths[5]  :=  50;    Cells[5, 0] := '????????';      Alignments[5, 0] := taCenter;
    ColWidths[6]  :=  70;    Cells[6, 0] := '';              Alignments[6, 0] := taCenter;

    ColWidths[7]  :=  50;    Cells[7, 0] := '????????';      Alignments[7, 0] := taCenter;
    ColWidths[8]  :=  70;    Cells[8, 0] := '';              Alignments[8, 0] := taCenter;

    ColWidths[9]  :=  50;    Cells[9, 0] := '????';          Alignments[9, 0] := taCenter;
    ColWidths[10] :=  70;    Cells[10, 0] := '';             Alignments[10, 0] := taCenter;

    ColWidths[11] :=  50;    Cells[11, 0] := '????????';     Alignments[11, 0] := taCenter;
    ColWidths[12] :=  70;    Cells[12, 0] := '';             Alignments[12, 0] := taCenter;

    ColWidths[13] :=  50;    Cells[13, 0] := '????????';     Alignments[13, 0] := taCenter;
    ColWidths[14] :=  70;    Cells[14, 0] := '';             Alignments[14, 0] := taCenter;

    ColWidths[15] :=  50;    Cells[15, 0] := 'KB????';       Alignments[15, 0] := taCenter;
    ColWidths[16] :=  70;    Cells[16, 0] := '';             Alignments[16, 0] := taCenter;

    ColWidths[17] :=  50;    Cells[17, 0] := 'NH????';       Alignments[17, 0] := taCenter;
    ColWidths[18] :=  70;    Cells[18, 0] := '';             Alignments[18, 0] := taCenter;
  end;

  sgVanList.MergeCells(3, 0, 2, 1);
  sgVanList.MergeCells(5, 0, 2, 1);
  sgVanList.MergeCells(7, 0, 2, 1);
  sgVanList.MergeCells(9, 0, 2, 1);
  sgVanList.MergeCells(11, 0, 2, 1);
  sgVanList.MergeCells(13, 0, 2, 1);
  sgVanList.MergeCells(15, 0, 2, 1);
  sgVanList.MergeCells(17, 0, 2, 1); //  'NH????
end;



procedure TfrmVanListSum.btnCloseClick(Sender: TObject);
begin
  //Close;
  qryVanList.Close;
  ModalResult := mrCancel;
end;

procedure TfrmVanListSum.btnExcelClick(Sender: TObject);
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
    on E: Exception do ExceptLogging('TfrmVanListSum.btnExcelClick: ' + E.Message);
  end;
end;

procedure TfrmVanListSum.btnPrintClick(Sender: TObject);
var
  sTemp: String;
begin
  frxReport1.LoadFromFile(sCurrRunDir + '\Report\VanReport.fr3');

  frxReport1.Variables['nTotalCnt']:= nTotalCnt;
  frxReport1.Variables['nTotalAmt']:= nTotalAmt;
  frxReport1.Variables['nTotalCnt1']:= nTotalCnt1;
  frxReport1.Variables['nTotalAmt1']:= nTotalAmt1;
  frxReport1.Variables['nTotalCnt2']:= nTotalCnt2;
  frxReport1.Variables['nTotalAmt2']:= nTotalAmt2;
  frxReport1.Variables['nTotalCnt3']:= nTotalCnt3;
  frxReport1.Variables['nTotalAmt3']:= nTotalAmt3;
  frxReport1.Variables['nTotalCnt4']:= nTotalCnt4;
  frxReport1.Variables['nTotalAmt4']:= nTotalAmt4;
  frxReport1.Variables['nTotalCnt5']:= nTotalCnt5;
  frxReport1.Variables['nTotalAmt5']:= nTotalAmt5;
  frxReport1.Variables['nTotalCnt6']:= nTotalCnt6;
  frxReport1.Variables['nTotalAmt6']:= nTotalAmt6;
  frxReport1.Variables['nTotalCnt7']:= nTotalCnt7;
  frxReport1.Variables['nTotalAmt7']:= nTotalAmt7;
  frxReport1.Variables['nTotalCnt8']:= nTotalCnt8;
  frxReport1.Variables['nTotalAmt8']:= nTotalAmt8;

  frxReport1.ShowReport(True);
end;

procedure TfrmVanListSum.btnSearchClick(Sender: TObject);
var
  sSDate, sEDate: String;
  tmpCnt, i: Integer;

begin
  try
    sSDate:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
    sEDate:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
    btnExcel.Enabled := false;
    btnPrint.Enabled := false;

    nTotalCnt := 0;
    nTotalAmt := 0;
    nTotalCnt1 := 0;
    nTotalAmt1 := 0;
    nTotalCnt2 := 0;
    nTotalAmt2 := 0;
    nTotalCnt3 := 0;
    nTotalAmt3 := 0;
    nTotalCnt4 := 0;
    nTotalAmt4 := 0;
    nTotalCnt5 := 0;
    nTotalAmt5 := 0;
    nTotalCnt6 := 0;
    nTotalAmt6 := 0;
    nTotalCnt7 := 0;
    nTotalAmt7 := 0;
    nTotalCnt8 := 0; //NH????
    nTotalAmt8 := 0; //NH????

    with qryVanList do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select T.ProcDate, isnull(totalCnt, 0) as totalCnt, isnull(totalAmt, 0) as totalAmt, isnull(totalCnt1, 0) as totalCnt1, isnull(totalAmt1, 0) as totalAmt1 ');
      SQL.Add(', isnull(totalCnt2, 0) as totalCnt2, isnull(totalAmt2, 0) as totalAmt2, isnull(totalCnt3, 0) as totalCnt3, isnull(totalAmt3, 0) as totalAmt3  ');
      SQL.Add(', isnull(totalCnt4, 0) as totalCnt4, isnull(totalAmt4, 0) as totalAmt4, isnull(totalCnt5, 0) as totalCnt5, isnull(totalAmt5, 0) as totalAmt5  ');
      SQL.Add(', isnull(totalCnt6, 0) as totalCnt6, isnull(totalAmt6, 0) as totalAmt6, isnull(totalCnt7, 0) as totalCnt7, isnull(totalAmt7, 0) as totalAmt7 ');
      SQL.Add(', isnull(totalCnt8, 0) as totalCnt8, isnull(totalAmt8, 0) as totalAmt8  ');     //NH????
      SQL.Add('from(  ');
      SQL.Add('select ProcDate, COUNT(*) totalCnt, SUM(VanAmt) totalAmt');
      SQL.Add('from VanList ');
      SQL.Add('group by ProcDate ');
      SQL.Add(') T left outer join (  ');

      SQL.Add('select ProcDate, CardType, COUNT(*) totalCnt1, SUM(VanAmt) totalAmt1 ');
      SQL.Add('from VanList');
      SQL.Add('where CardType = ''????????'' ');    // ????????
      SQL.Add('group by ProcDate, CardType ');
      SQL.Add(') A ');
      SQL.Add('on T.ProcDate = A.ProcDate ');

      SQL.Add('left outer join ( ');
      SQL.Add('select ProcDate, CardType, COUNT(*) totalCnt2, SUM(VanAmt) totalAmt2 ');
      SQL.Add('from VanList ');
      SQL.Add('where CardType = ''????????'' ');  // ????????
      SQL.Add('group by ProcDate, CardType  ');
      SQL.Add(') B');
      SQL.Add('on T.ProcDate = B.ProcDate ');

      SQL.Add('left outer join ( ');
      SQL.Add('select ProcDate, CardType, COUNT(*) totalCnt3, SUM(VanAmt) totalAmt3  ');
      SQL.Add('from VanList');
      SQL.Add('where CardType = ''????????'' ');  // ????????
      SQL.Add('group by ProcDate, CardType  ');
      SQL.Add(') C');
      SQL.Add('on T.ProcDate = C.ProcDate  ');

      SQL.Add('left outer join (  ');
      SQL.Add('select ProcDate, CardType, COUNT(*) totalCnt4, SUM(VanAmt) totalAmt4 ');
      SQL.Add('from VanList');
      SQL.Add('where CardType = ''????'' ');     // ????
      SQL.Add('group by ProcDate, CardType');
      SQL.Add(') D ');
      SQL.Add('on T.ProcDate = D.ProcDate ');

      SQL.Add('left outer join (');
      SQL.Add('select ProcDate, CardType, COUNT(*) totalCnt5, SUM(VanAmt) totalAmt5 ');
      SQL.Add('from VanList ');
      SQL.Add('where CardType = ''????????'' ');      // ????????
      SQL.Add('group by ProcDate, CardType ');
      SQL.Add(') E   ');
      SQL.Add('on T.ProcDate = E.ProcDate   ');

      SQL.Add('left outer join (  ');
      SQL.Add('select ProcDate, CardType, COUNT(*) totalCnt6, SUM(VanAmt) totalAmt6 ');
      SQL.Add('from VanList ');
      SQL.Add('where CardType = ''????????'' ');     // ????????
      SQL.Add('group by ProcDate, CardType ');
      SQL.Add(') F  ');
      SQL.Add('on T.ProcDate = F.ProcDate ');

      SQL.Add('left outer join (     ');
      SQL.Add('select ProcDate, CardType, COUNT(*) totalCnt7, SUM(VanAmt) totalAmt7 ');
      SQL.Add('from VanList ');
      SQL.Add('where CardType = ''KB????'' ');     // KB????
      SQL.Add('group by ProcDate, CardType ');
      SQL.Add(') G ');
      SQL.Add('on T.ProcDate = G.ProcDate ');


      SQL.Add('left outer join (     ');
      SQL.Add('select ProcDate, CardType, COUNT(*) totalCnt8, SUM(VanAmt) totalAmt8 ');
      SQL.Add('from VanList ');
      SQL.Add('where CardType = ''NH????'' ');     // NH????
      SQL.Add('group by ProcDate, CardType ');
      SQL.Add(') H ');
      SQL.Add('on T.ProcDate = T.ProcDate ');


      SQL.Add('where T.ProcDate between :pDate1 and :pDate2 ');
      Parameters.ParamByName('pDate1').Value := sSDate;
      Parameters.ParamByName('pDate2').Value := sEDate;
      ExceptLogging(SQL.Text);
      Open;

     // GridClear();
      sgVanList.RowCount := RecordCount + 2;

      if RecordCount > 0 then
      begin
        ExceptLogging('????????: ' + IntToStr(RecordCount));

        tmpCnt := 1;
        while not Eof do
        begin

          sgVanList.Cells[0,tmpCnt] := FieldByName('ProcDate').AsString;  // ????????
         // sgVanList.Cells[1,tmpCnt] := FormatFloat('#,##0', StrToInt(FieldByName('totalCnt').AsString));  // ??????


          sgVanList.Cells[1,tmpCnt] := FormatFloat('#,##0', StrToInt(FieldByName('totalCnt').AsString));  // ??????

          sgVanList.Cells[2,tmpCnt] := FormatFloat('#,##0', StrToInt(FieldByName('totalAmt').AsString));  // ??????

          sgVanList.Cells[3,tmpCnt] := FormatFloat('#,##0', StrToInt(FieldByName('totalCnt1').AsString));  // ????????
          sgVanList.Cells[4,tmpCnt] := FormatFloat('#,##0', StrToInt(FieldByName('totalAmt1').AsString));

          sgVanList.Cells[5,tmpCnt] := FormatFloat('#,##0', StrToInt(FieldByName('totalCnt2').AsString));  // ????????
          sgVanList.Cells[6,tmpCnt] := FormatFloat('#,##0', StrToInt(FieldByName('totalAmt2').AsString));

          sgVanList.Cells[7,tmpCnt] := FormatFloat('#,##0', StrToInt(FieldByName('totalCnt3').AsString));  // ????????
          sgVanList.Cells[8,tmpCnt] := FormatFloat('#,##0', StrToInt(FieldByName('totalAmt3').AsString));

          sgVanList.Cells[9,tmpCnt] := FormatFloat('#,##0', StrToInt(FieldByName('totalCnt4').AsString));  // ????
          sgVanList.Cells[10,tmpCnt] := FormatFloat('#,##0', StrToInt(FieldByName('totalAmt4').AsString));

          sgVanList.Cells[11,tmpCnt] := FormatFloat('#,##0', StrToInt(FieldByName('totalCnt5').AsString));  // ????????
          sgVanList.Cells[12,tmpCnt] := FormatFloat('#,##0', StrToInt(FieldByName('totalAmt5').AsString));

          sgVanList.Cells[13,tmpCnt] := FormatFloat('#,##0', StrToInt(FieldByName('totalCnt6').AsString));  // ????????
          sgVanList.Cells[14,tmpCnt] := FormatFloat('#,##0', StrToInt(FieldByName('totalAmt6').AsString));

          sgVanList.Cells[15,tmpCnt] := FormatFloat('#,##0', StrToInt(FieldByName('totalCnt7').AsString));  // KB????
          sgVanList.Cells[16,tmpCnt] := FormatFloat('#,##0', StrToInt(FieldByName('totalAmt7').AsString));
          sgVanList.Cells[17,tmpCnt] := FormatFloat('#,##0', StrToInt(FieldByName('totalCnt8').AsString));  // NH????
          sgVanList.Cells[18,tmpCnt] := FormatFloat('#,##0', StrToInt(FieldByName('totalAmt8').AsString));

          nTotalCnt := nTotalCnt + FieldByName('totalCnt').AsInteger;
          nTotalAmt := nTotalAmt + FieldByName('totalAmt').AsInteger;
          nTotalCnt1 := nTotalCnt1 + FieldByName('totalCnt1').AsInteger;
          nTotalAmt1 := nTotalAmt1 + FieldByName('totalAmt1').AsInteger;
          nTotalCnt2 := nTotalCnt2 + FieldByName('totalCnt2').AsInteger;
          nTotalAmt2 := nTotalAmt2 + FieldByName('totalAmt2').AsInteger;
          nTotalCnt3 := nTotalCnt3 + FieldByName('totalCnt3').AsInteger;
          nTotalAmt3 := nTotalAmt3 + FieldByName('totalAmt3').AsInteger;
          nTotalCnt4 := nTotalCnt4 + FieldByName('totalCnt4').AsInteger;
          nTotalAmt4 := nTotalAmt4 + FieldByName('totalAmt4').AsInteger;
          nTotalCnt5 := nTotalCnt5 + FieldByName('totalCnt5').AsInteger;
          nTotalAmt5 := nTotalAmt5 + FieldByName('totalAmt5').AsInteger;
          nTotalCnt6 := nTotalCnt6 + FieldByName('totalCnt6').AsInteger;
          nTotalAmt6 := nTotalAmt6 + FieldByName('totalAmt6').AsInteger;
          nTotalCnt7 := nTotalCnt7 + FieldByName('totalCnt7').AsInteger;
          nTotalAmt7 := nTotalAmt7 + FieldByName('totalAmt7').AsInteger;

          nTotalCnt8 := nTotalCnt8 + FieldByName('totalCnt8').AsInteger;     // NH????
          nTotalAmt8 := nTotalAmt8 + FieldByName('totalAmt8').AsInteger;     // NH????

          sgVanList.Alignments[0, tmpCnt] := taCenter;

          for i := 1 to 18 do
            sgVanList.Alignments[i, tmpCnt] := taRightJustify;


          tmpCnt := tmpCnt + 1;
          next;
        end;


        // ????
        sgVanList.Cells[0,tmpCnt] := 'TOTAL';
        sgVanList.Cells[1,tmpCnt] := FormatFloat('#,##0', nTotalCnt);  // ??????
        sgVanList.Cells[2,tmpCnt] := FormatFloat('#,##0', nTotalAmt);  // ??????

        sgVanList.Cells[3,tmpCnt] := FormatFloat('#,##0', nTotalCnt1);  // ????????
        sgVanList.Cells[4,tmpCnt] := FormatFloat('#,##0', nTotalAmt1);

        sgVanList.Cells[5,tmpCnt] := FormatFloat('#,##0', nTotalCnt2);  // ????????
        sgVanList.Cells[6,tmpCnt] := FormatFloat('#,##0', nTotalAmt2);

        sgVanList.Cells[7,tmpCnt] := FormatFloat('#,##0', nTotalCnt3);  // ????????
        sgVanList.Cells[8,tmpCnt] := FormatFloat('#,##0', nTotalAmt3);

        sgVanList.Cells[9,tmpCnt] := FormatFloat('#,##0', nTotalCnt4);  // ????
        sgVanList.Cells[10,tmpCnt] := FormatFloat('#,##0', nTotalAmt4);

        sgVanList.Cells[11,tmpCnt] := FormatFloat('#,##0', nTotalCnt5);  // ????????
        sgVanList.Cells[12,tmpCnt] := FormatFloat('#,##0', nTotalAmt5);

        sgVanList.Cells[13,tmpCnt] := FormatFloat('#,##0', nTotalCnt6);  // ????????
        sgVanList.Cells[14,tmpCnt] := FormatFloat('#,##0', nTotalAmt6);

        sgVanList.Cells[15,tmpCnt] := FormatFloat('#,##0', nTotalCnt7);  // KB????
        sgVanList.Cells[16,tmpCnt] := FormatFloat('#,##0', nTotalAmt7);

        sgVanList.Cells[17,tmpCnt] := FormatFloat('#,##0', nTotalCnt8);  // NH????
        sgVanList.Cells[18,tmpCnt] := FormatFloat('#,##0', nTotalAmt8);


        sgVanList.Alignments[0, tmpCnt] := taCenter;

        for i := 1 to 18 do
          sgVanList.Alignments[i, tmpCnt] := taRightJustify;
         

        sgVanList.setfocus;
        sgVanList.row := tmpCnt;

        btnExcel.Enabled := true;
        btnPrint.Enabled := true;
      end else begin
        sgVanList.RowCount := 2;
        sgVanList.FixedRows := 1;
        for tmpCnt := 0 to sgVanList.ColCount - 1 do sgVanList.Cells[tmpCnt, 1] := '';
      end;
    end;
  except
    on E: Exception do ExceptLogging('TfrmVanListSum.btnSearchClick: ' + E.Message);
  end;
end;

procedure TfrmVanListSum.FormShow(Sender: TObject);
begin
  try

    GridClear();

    edtSDate.Date:= Now;
    edtEDate.Date:= Now;

  except
    on E: Exception do ExceptLogging('TfrmVanListSum.FormShow: ' + E.Message);
  end;
end;

end.
