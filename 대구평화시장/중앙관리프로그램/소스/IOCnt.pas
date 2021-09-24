unit IOCnt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, StdCtrls, Buttons, ComCtrls,
  AdvDateTimePicker, ExtCtrls, tmsAdvGridExcel, DB, ADODB, AdvObj;

type
  TfrmIOCnt = class(TForm)
    sgCount: TAdvStringGrid;
    Panel1: TPanel;
    Bevel2: TBevel;
    Label7: TLabel;
    Label8: TLabel;
    edtSDate: TAdvDateTimePicker;
    edtEDate: TAdvDateTimePicker;
    btnSearch: TBitBtn;
    btnExcel: TBitBtn;
    btnClose: TBitBtn;
    qryCount: TADOQuery;
    SaveDialog1: TSaveDialog;
    eCount: TAdvGridExcelIO;
    sb1: TStatusBar;
    qryTemp: TADOQuery;
    cmbData: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIOCnt: TfrmIOCnt;
  nTotLpr, nInLpr, nOutLpr: Byte;
  RLpr: Array [1..50] of Word;

implementation
uses
  Global, Tables;

{$R *.dfm}

procedure TfrmIOCnt.FormShow(Sender: TObject);
var
  i, j: Byte;
begin
  with qryTemp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select Count(*) nLprCnt ');
    SQL.Add('From UnitInfo Where ((UnitKind = :N1) or (UnitKind = :N2)) and ParkNo = :N3');
    Parameters.ParamByName('N1').Value := 8; // 입구LPR
    Parameters.ParamByName('N2').Value := 9; // 출구LPR
    Parameters.ParamByName('N3').Value := nCurrParkNo;
    Open;

    nTotLpr:= FieldByName('nLprCnt').AsInteger;
    sgCount.ColCount:= nTotLpr + 1;

    Close;
    SQL.Clear;
    SQL.Add('Select * ');
    SQL.Add('From UnitInfo Where UnitKind = :N1 and ParkNo = :N2 Order By ParkNo, UnitNo');
    Parameters.ParamByName('N1').Value := 8; // 입구LPR
    Parameters.ParamByName('N2').Value := nCurrParkNo;
    Open;
    i:= 1;

    if RecordCount > 0 then
    begin
      nInLpr:= RecordCount;

      while not Eof do
      begin
        RLpr[i]:= FieldByName('UnitNo').AsInteger;
        sgCount.Cells[i, 0]:= FieldByName('UnitName').AsString;
        sgCount.Alignments[i, 0]:= taCenter;
        Inc(i);
        Next;
      end;
    end;

    Close;
    SQL.Clear;
    SQL.Add('Select * ');
    SQL.Add('From UnitInfo Where UnitKind = :N1 and ParkNo = :N2 Order By ParkNo, UnitNo');
    Parameters.ParamByName('N1').Value := 9; // 출구LPR
    Parameters.ParamByName('N2').Value := nCurrParkNo;
    Open;

    if RecordCount > 0 then
    begin
      nOutLpr:= RecordCount;

      while not Eof do
      begin
        RLpr[i]:= FieldByName('UnitNo').AsInteger;
        sgCount.Cells[i, 0]:= FieldByName('UnitName').AsString;
        sgCount.Alignments[i, 0]:= taCenter;
        Inc(i);
        Next;
      end;
    end;
  end;

  with sgCount do
  begin
    for i:= 0 to 25 do
      Alignments[0, i]:= taCenter;
  end;
  edtSDate.Date:= Now;
  edtEDate.Date:= Now;
end;

procedure TfrmIOCnt.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmIOCnt.btnSearchClick(Sender: TObject);
var
  i, j, k: Byte;
  nSum, nTotIn, nTotOut, nUnitNo: Cardinal;
  ssTime, sETime: String;
begin
  nTotIn:= 0;
  nTotOut:= 0;

  for i:= 1 to nInLpr do
  begin
    nUnitNo:= RLpr[i];

    with qryTemp do
    begin
      nSum:= 0;

      for j:= 1 to 24 do
      begin
        Close;
        SQL.Clear;

        if cmbData.ItemIndex = 0 then
          SQL.Add('Select Count(*) nIn from FreeIOData where ProcDate >= :N1 and ProcDate <= :N2 and ')
        else
          SQL.Add('Select Count(*) nIn from IONData where ProcDate >= :N1 and ProcDate <= :N2 and ');

        SQL.Add('UnitNo = :N3 and ProcTime >= :N4 and ProcTime <= :N5  ');
        Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
        Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
        Parameters.ParamByName('N3').Value:= nUnitNo;
        Parameters.ParamByName('N4').Value:= MG_InsZero(IntToStr(j-1), 2) + ':00:00';
        Parameters.ParamByName('N5').Value:= MG_InsZero(IntToStr(j-1), 2) + ':59:59';
        Open;

        if FieldByName('nIn').AsInteger > 0 then
          sgCount.Cells[i, j]:= FormatFloat('#,##0', FieldByName('nIn').AsInteger)
        else
          sgCount.Cells[i, j]:= '0';

        nSum:= nSum + FieldByName('nIn').AsInteger;
        sgCount.Alignments[i, j]:= taRightJustify;
      end;

      if nSum > 0 then
        sgCount.Cells[i, 25]:= FormatFloat('#,##0', nSum)
      else
        sgCount.Cells[i, 25]:= '0';

      nTotIn:= nTotIn + nSum;
      sgCount.Alignments[i, 25]:= taRightJustify;
    end;
  end;

  for i:= nInLpr+1 to nTotLpr do
  begin
    nUnitNo:= RLpr[i];
    {
    case i of
      7: nUnitNo:= 21;
      8: nUnitNo:= 22;
      9: nUnitNo:= 221;
      10: nUnitNo:= 222;
    end;
    }

    with qryTemp do
    begin
      nSum:= 0;

      for j:= 1 to 24 do
      begin
        Close;
        SQL.Clear;

        if cmbData.ItemIndex = 0 then
          SQL.Add('Select Count(*) nOut from FreeIOData where OutDate >= :N1 and OutDate <= :N2 and ')
        else
          SQL.Add('Select Count(*) nOut from IONData where OutDate >= :N1 and OutDate <= :N2 and ');

        SQL.Add('OutUnitNo = :N3 and OutTime >= :N4 and OutTime <= :N5 and OutChk > :N6 and OutChk <> 7 ');
        SQL.Add('and ((TKType = 1) or (TKType = 9))' );
        Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
        Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
        Parameters.ParamByName('N3').Value:= nUnitNo;
        Parameters.ParamByName('N4').Value:= MG_InsZero(IntToStr(j-1), 2) + ':00:00';
        Parameters.ParamByName('N5').Value:= MG_InsZero(IntToStr(j-1), 2) + ':59:59';
        Parameters.ParamByName('N6').Value:= 0;
        Open;

        if FieldByName('nOut').AsInteger > 0 then
          sgCount.Cells[i, j]:= FormatFloat('#,##0', FieldByName('nOut').AsInteger)
        else
          sgCount.Cells[i, j]:= '0';

        nSum:= nSum + FieldByName('nOut').AsInteger;
        sgCount.Alignments[i, j]:= taRightJustify;
      end;

      if nSum > 0 then
        sgCount.Cells[i, 25]:= FormatFloat('#,##0', nSum)
      else
        sgCount.Cells[i, 25]:= '0';

      nTotOut:= nTotOut + nSum;
      sgCount.Alignments[i, 25]:= taRightJustify;
    end;
  end;
  sb1.SimpleText:= ' 총입차: ' + IntToStr(nTotIn) + ',  총출차: ' + IntToStr(nTotOut);
  btnExcel.Enabled:= True;
end;

procedure TfrmIOCnt.btnExcelClick(Sender: TObject);
begin
  try
    if savedialog1.Execute then
    begin
      eCount.XLSExport(savedialog1.filename + '.xls');
      ShowMessage('엑셀파일로 저장완료!');
    end;
  except
    on E: Exception do ExceptLogging('TfrmIOCnt.btnExcelClick: ' + E.Message);
  end;
end;

end.
