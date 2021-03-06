unit Analysis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, AdvEdit, ExtCtrls, Grids, BaseGrid, AdvGrid,
  DB, ADODB, tmsAdvGridExcel, AdvObj;

type
  TfrmAnalysis = class(TForm)
    Panel1: TPanel;
    Bevel14: TBevel;
    Label14: TLabel;
    edtDate: TAdvMaskEdit;
    btnSearch: TBitBtn;
    btnExcel: TBitBtn;
    btnClose: TBitBtn;
    asg1: TAdvStringGrid;
    qryBonIn: TADOQuery;
    qryByulIn: TADOQuery;
    qryTotIn: TADOQuery;
    qryTotIn2: TADOQuery;
    qryBonIn2: TADOQuery;
    qryByulIn2: TADOQuery;
    qryBalIn: TADOQuery;
    qryBalIn2: TADOQuery;
    qryTotInProcDate: TStringField;
    qryTotInnTotCnt: TIntegerField;
    qryTotIncondition1: TWordField;
    qryTotIncondition2: TStringField;
    qryTotIncondition3: TStringField;
    qryTotIncondition4: TStringField;
    qryBonInprocdate: TStringField;
    qryBonInnBonCnt: TIntegerField;
    qryByulInprocdate: TStringField;
    qryByulInnByulCnt: TIntegerField;
    qryBalInprocdate: TStringField;
    qryBalInnBalCnt: TIntegerField;
    qryTime: TADOQuery;
    qryTimeprocdate: TStringField;
    qryTimenAvgMin: TIntegerField;
    qryAmt: TADOQuery;
    qryAmtProcDate: TStringField;
    qryAmtavgAmt: TIntegerField;
    qryTotIn2ProcDate: TStringField;
    qryTotIn2nTotCnt2: TIntegerField;
    qryBonIn2procdate: TStringField;
    qryBonIn2nBonCnt2: TIntegerField;
    qryByulIn2procdate: TStringField;
    qryByulIn2nByulCnt2: TIntegerField;
    qryBalIn2procdate: TStringField;
    qryBalIn2nBalCnt2: TIntegerField;
    SaveDialog1: TSaveDialog;
    AdvGridExcelIO1: TAdvGridExcelIO;
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
  private
    { Private declarations }
    function GetYoil(sDate: String): String;
    procedure GridClear;
  public
    { Public declarations }
  end;

var
  frmAnalysis: TfrmAnalysis;

implementation
uses
  Global, Tables;

{$R *.dfm}

function TfrmAnalysis.GetYoil(sDate: string): String;
var
  sYoil: String;
begin
  case DayOfWeek(StrToDate(sDate)) of
    1: sYoil:= '??';
    2: sYoil:= '??';
    3: sYoil:= '??';
    4: sYoil:= '??';
    5: sYoil:= '??';
    6: sYoil:= '??';
    7: sYoil:= '??';
  end;
  Result:= sYoil;
end;

procedure TfrmAnalysis.GridClear;
var
  i, j: Byte;
begin
  for i := 4 to 37 do
  begin
    for j := 0 to 25 do
      asg1.Cells[j, i]:= '';
  end;
end;

procedure TfrmAnalysis.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAnalysis.btnExcelClick(Sender: TObject);
begin
  try
    if savedialog1.Execute then
    begin
      advgridexcelio1.GridStartCol:= 0;
      advgridexcelio1.GridStartRow:= 0;
      advgridexcelio1.XlsStartRow:= 0;
      advgridexcelio1.XlsStartCol:= 0;
      advgridexcelio1.XLSExport(savedialog1.filename + '.xls');
      ShowMessage('?????????? ????????!');
    end;
  except
    on E: Exception do ExceptLogging('TfrmAnalysis.btnExcelClick: ' + E.Message);
  end;
end;

procedure TfrmAnalysis.btnSearchClick(Sender: TObject);
var
  nRow: Byte;
  sPrvDate: String;
begin
  try
    GridClear;
    asg1.Cells[0, 0]:= Copy(edtDate.Text, 1, 4) + '?? ' + Copy(edtDate.Text, 6, 2) + '?? ????';
    sPrvDate:= IntToStr((StrToInt(Copy(edtDate.Text, 1, 4))-1)) + Copy(edtDate.Text, 5, 3);

    with qryTotIn2 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select ProcDate, COUNT(*) nTotCnt2 from IONData where ProcDate like ' +
              MG_MakeStr(sPrvDate + '%') +
              ' group by Procdate');
      Open;

      if Recordcount > 0 then
      begin
        nRow:= 4;
        First;

        while not Eof do
        begin
          asg1.Cells[16, nRow] := FormatFloat('#,##0', FieldByName('nTotCnt2').AsInteger) + '??';
          asg1.Alignments[16, nRow] := taRightJustify;
          Inc(nRow);
          Next;
        end;
      end;
    end;

    with qryBonIn2 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select ProcDate, COUNT(*) nBonCnt2 from IONData ' +
              'where ((UnitNo = :N1) or (UnitNo = :N2)) and '+
              'ProcDate like ' + MG_MakeStr(sPrvDate + '%') +
              ' group by Procdate ');
      Parameters.ParamByName('N1').Value:= 10;
      Parameters.ParamByName('N2').Value:= 11;
      Open;

      if RecordCount > 0 then
      begin
        nRow:= 4;
        First;

        while not Eof do
        begin
          asg1.Cells[17, nRow] := FormatFloat('#,##0', FieldByName('nBonCnt2').AsInteger) + '??';
          asg1.Alignments[17, nRow]:= taRightJustify;
          Inc(nRow);
          Next;
        end;
      end;
    end;

    with qryByulIn2 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select ProcDate, COUNT(*) nByulCnt2 from IONData ' +
              'where ((UnitNo = :N1) or (UnitNo = :N2)) and '+
              'ProcDate like ' + MG_MakeStr(sPrvDate + '%') +
              ' group by Procdate ');
      Parameters.ParamByName('N1').Value:= 20;
      Parameters.ParamByName('N2').Value:= 21;
      Open;

      if RecordCount > 0 then
      begin
        nRow:= 4;
        First;

        while not Eof do
        begin
          asg1.Cells[18, nRow] := FormatFloat('#,##0', FieldByName('nByulCnt2').AsInteger) + '??';
          asg1.Alignments[18, nRow]:= taRightJustify;
          Inc(nRow);
          Next;
        end;
      end;
    end;

    with qryBalIn2 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select ProcDate, COUNT(*) nBalCnt2 from IOSData where ProcDate like ' +
              MG_MakeStr(sPrvDate + '%') +
              ' group by Procdate');
      Open;

      if RecordCount > 0 then
      begin
        nRow:= 4;
        First;

        while not Eof do
        begin
          asg1.Cells[24, nRow] := FormatFloat('#,##0', FieldByName('nBalCnt2').AsInteger) + '??';
          asg1.Alignments[24, nRow]:= taRightJustify;
          Inc(nRow);
          Next;
        end;
      end;
    end;

    with qryTotIn do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select a.ProcDate, a.nTotCnt, b.condition1, b.condition2, b.condition3, b.condition4 from ');
      SQL.Add('(select ProcDate, COUNT(*) nTotCnt from IONData where ProcDate like ' +
              MG_MakeStr(Trim(edtDate.Text) + '%') +
              ' group by Procdate) a ');
      SQL.Add('left outer join  analysisdata b on a.procdate = b.procdate order by a.ProcDate');
      Open;

      if Recordcount > 0 then
      begin
        btnExcel.Enabled:= True;
        nRow:= 5;
        First;

        while not Eof do
        begin
          asg1.Cells[0, nRow]:= Copy(FieldByName('ProcDate').AsString, 9, 2) + '??';
          asg1.Cells[1, nRow] := GetYoil(FieldByName('ProcDate').Asstring);
          asg1.Cells[2, nRow] := FieldByName('Condition2').Asstring;
          asg1.Cells[3, nRow] := FormatFloat('#,##0', FieldByName('nTotCnt').AsInteger) + '??';
          asg1.Cells[9, nRow] := FieldByName('Condition3').Asstring;
          asg1.Cells[10, nRow]:= FieldByName('Condition4').Asstring;
          asg1.Alignments[0, nRow] := taCenter;
          asg1.Alignments[1, nRow] := taCenter;
          asg1.Alignments[2, nRow] := taCenter;
          asg1.Alignments[3, nRow] := taRightJustify;
          asg1.Alignments[9, nRow] := taCenter;
          asg1.Alignments[10, nRow]:= taCenter;
          Inc(nRow);
          Next;
        end;
      end
      else
        btnExcel.Enabled:= False;
    end;

    with qryTime do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select ProcDate, AVG(ParkingMin) nAvgMin from TKProc where ProcDate like ' +
              MG_MakeStr(Trim(edtDate.Text) + '%') +
              ' group by Procdate Order by ProcDate ');
      Open;

      if RecordCount > 0 then
      begin
        nRow:= 5;
        First;

        while not Eof do
        begin
          asg1.Cells[11, nRow] := FormatFloat('#,##0', FieldByName('nAvgMin').AsInteger) + '??';
          asg1.Alignments[11, nRow]:= taRightJustify;
          Inc(nRow);
          Next;
        end;
      end;
    end;

    with qryAmt do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select ProcDate, avg(MaxAmt) avgAmt from ');
      SQL.Add('(select ProcDate, Carno, Max(procamt) MaxAmt from PosData where ProcDate like ' +
              MG_MakeStr(Trim(edtDate.Text) + '%') +
              'group by ProcDate, CarNo) a ');
      SQL.Add('group by Procdate order by procdate');
      Open;

      if RecordCount > 0 then
      begin
        nRow:= 5;
        First;

        while not Eof do
        begin
          asg1.Cells[12, nRow] := FormatFloat('#,##0', FieldByName('AvgAmt').AsInteger) + '??';
          asg1.Alignments[12, nRow]:= taRightJustify;
          Inc(nRow);
          Next;
        end;
      end;
    end;

    with qryBonIn do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select ProcDate, COUNT(*) nBonCnt from IONData ' +
              'where ((UnitNo = :N1) or (UnitNo = :N2)) and '+
              'ProcDate like ' + MG_MakeStr(Trim(edtDate.Text) + '%') +
              ' group by Procdate ');
      Parameters.ParamByName('N1').Value:= 10;
      Parameters.ParamByName('N2').Value:= 11;
      Open;

      if RecordCount > 0 then
      begin
        nRow:= 5;
        First;

        while not Eof do
        begin
          asg1.Cells[5, nRow] := FormatFloat('#,##0', FieldByName('nBonCnt').AsInteger) + '??';
          asg1.Alignments[5, nRow]:= taRightJustify;
          Inc(nRow);
          Next;
        end;
      end;
    end;

    with qryByulIn do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select ProcDate, COUNT(*) nByulCnt from IONData ' +
              'where ((UnitNo = :N1) or (UnitNo = :N2)) and '+
              'ProcDate like ' + MG_MakeStr(Trim(edtDate.Text) + '%') +
              ' group by Procdate ');
      Parameters.ParamByName('N1').Value:= 20;
      Parameters.ParamByName('N2').Value:= 21;
      Open;

      if RecordCount > 0 then
      begin
        nRow:= 5;
        First;

        while not Eof do
        begin
          asg1.Cells[7, nRow] := FormatFloat('#,##0', FieldByName('nByulCnt').AsInteger) + '??';
          asg1.Alignments[7, nRow]:= taRightJustify;
          Inc(nRow);
          Next;
        end;
      end;
    end;

    with qryBalIn do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select ProcDate, COUNT(*) nBalCnt from IOSData ' +
              'where ProcDate like ' + MG_MakeStr(Trim(edtDate.Text) + '%') +
              ' group by Procdate ');
      Open;

      if RecordCount > 0 then
      begin
        nRow:= 5;
        First;

        while not Eof do
        begin
          asg1.Cells[23, nRow] := FormatFloat('#,##0', FieldByName('nBalCnt').AsInteger) + '??';
          asg1.Alignments[23, nRow]:= taRightJustify;
          Inc(nRow);
          Next;
        end;
      end;
    end;
  except
    on E: Exception do ExceptLogging('TfrmAnalysis.btnSearchClick: ' + aString(E.Message));
  end;
end;

procedure TfrmAnalysis.FormCreate(Sender: TObject);
begin
  asg1.MergeCells(0, 0, asg1.ColCount, 1);
  asg1.MergeCells(0, 1, 13, 1);
  asg1.MergeCells(13, 1, 10, 1);
  asg1.MergeCells(23, 1, 3, 1);
  asg1.MergeCells(0, 2, 1, 2);
  asg1.MergeCells(1, 2, 1, 2);
  asg1.MergeCells(2, 2, 1, 2);
  asg1.MergeCells(9, 2, 1, 2);
  asg1.MergeCells(10, 2, 1, 2);
  asg1.MergeCells(11, 2, 1, 2);
  asg1.MergeCells(12, 2, 1, 2);
  asg1.MergeCells(13, 2, 1, 2);
  asg1.MergeCells(14, 2, 1, 2);
  asg1.MergeCells(15, 2, 1, 2);
  asg1.MergeCells(16, 2, 1, 2);
  asg1.MergeCells(17, 2, 1, 2);
  asg1.MergeCells(18, 2, 1, 2);
  asg1.MergeCells(19, 2, 1, 2);
  asg1.MergeCells(20, 2, 1, 2);
  asg1.MergeCells(21, 2, 1, 2);
  asg1.MergeCells(22, 2, 1, 2);
  asg1.MergeCells(23, 2, 1, 2);
  asg1.MergeCells(24, 2, 1, 2);
  asg1.MergeCells(25, 2, 1, 2);
  asg1.MergeCells(3, 2, 2, 1);
  asg1.MergeCells(5, 2, 2, 1);
  asg1.MergeCells(7, 2, 2, 1);
  asg1.Cells[0, 0]:= FormatDateTime('YYYY?? MM??', Now) + ' ????';
  asg1.Alignments[0, 0]:= taLeftJustify;
  asg1.Cells[0, 1]:= FormatDateTime('YYYY??', Now);
  asg1.Alignments[0, 1]:= taCenter;
  asg1.Cells[13, 1]:= IntToStr(StrToInt(FormatDateTime('YYYY', Now))-1) + '??';
  asg1.Alignments[13, 1]:= taCenter;
  asg1.Cells[23, 1]:= 'Valet ????';
  asg1.Alignments[23, 1]:= taCenter;
  asg1.Cells[0, 2]:= '????';
  asg1.Alignments[0, 2]:= taCenter;
  asg1.Cells[1, 2]:= '????';
  asg1.Alignments[1, 2]:= taCenter;
  asg1.Cells[2, 2]:= '????????';
  asg1.Alignments[2, 2]:= taCenter;
  asg1.Cells[3, 2]:= '??';
  asg1.Alignments[3, 2]:= taCenter;
  asg1.Cells[5, 2]:= '????';
  asg1.Alignments[5, 2]:= taCenter;
  asg1.Cells[7, 2]:= '????';
  asg1.Alignments[7, 2]:= taCenter;
  asg1.Cells[9, 2]:= '????????';
  asg1.Alignments[9, 2]:= taCenter;
  asg1.Cells[10, 2]:= '????';
  asg1.Alignments[10, 2]:= taCenter;
  asg1.Cells[11, 2]:= '????????';
  asg1.Alignments[11, 2]:= taCenter;
  asg1.Cells[12, 2]:= '????????';
  asg1.Alignments[12, 2]:= taCenter;
  asg1.Cells[13, 2]:= '????';
  asg1.Alignments[13, 2]:= taCenter;
  asg1.Cells[14, 2]:= '????';
  asg1.Alignments[14, 2]:= taCenter;
  asg1.Cells[15, 2]:= '????????';
  asg1.Alignments[15, 2]:= taCenter;
  asg1.Cells[16, 2]:= '??';
  asg1.Alignments[16, 2]:= taCenter;
  asg1.Cells[17, 2]:= '????';
  asg1.Alignments[17, 2]:= taCenter;
  asg1.Cells[18, 2]:= '????';
  asg1.Alignments[18, 2]:= taCenter;
  asg1.Cells[19, 2]:= '????????';
  asg1.Alignments[19, 2]:= taCenter;
  asg1.Cells[20, 2]:= '????';
  asg1.Alignments[20, 2]:= taCenter;
  asg1.Cells[21, 2]:= '????????';
  asg1.Alignments[21, 2]:= taCenter;
  asg1.Cells[22, 2]:= '????????';
  asg1.Alignments[22, 2]:= taCenter;
  asg1.Cells[23, 2]:= asg1.Cells[0, 1];
  asg1.Alignments[23, 2]:= taCenter;
  asg1.Cells[24, 2]:= asg1.Cells[13, 1];
  asg1.Alignments[24, 2]:= taCenter;
  asg1.Cells[25, 2]:= '??????';
  asg1.Alignments[25, 2]:= taCenter;
  asg1.Cells[4, 3]:= '??????';
  asg1.Alignments[4, 3]:= taCenter;
  asg1.Cells[6, 3]:= '??????';
  asg1.Alignments[6, 3]:= taCenter;
  asg1.Cells[8, 3]:= '??????';
  asg1.Alignments[8, 3]:= taCenter;
  // ?????? asg1.VAlignment:= vtaCenter;
  edtDate.Text:= FormatDateTime('YYYY-MM', Now);
end;

end.
