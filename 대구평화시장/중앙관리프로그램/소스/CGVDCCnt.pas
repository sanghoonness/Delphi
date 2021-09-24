unit CGVDCCnt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, StdCtrls, Buttons, ComCtrls,
  AdvDateTimePicker, ExtCtrls, tmsAdvGridExcel, DB, ADODB, AdvObj;

type
  TfrmCGVDCCnt = class(TForm)
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
  frmCGVDCCnt: TfrmCGVDCCnt;
  nTotLpr, nInLpr, nOutLpr: Byte;
  RLpr: Array [1..50] of Word;

implementation
uses
  Global, Tables;

{$R *.dfm}

procedure TfrmCGVDCCnt.FormShow(Sender: TObject);
var
  i, j: Byte;
begin
  with sgCount do
  begin
    for i:= 0 to 25 do
      Alignments[0, i]:= taCenter;
  end;

  sgCount.ColWidths[1] := 150;

  edtSDate.Date:= Now;
  edtEDate.Date:= Now;
end;

procedure TfrmCGVDCCnt.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCGVDCCnt.btnSearchClick(Sender: TObject);
var
  i, j, k: Byte;
  nSum, nTotIn, nTotOut, nUnitNo: Cardinal;
  ssTime, sETime: String;
begin
  nTotIn:= 0;
  nTotOut:= 0;

  with qryTemp do
  begin
    nSum:= 0;

    for j:= 1 to 24 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select Count(*) nIn from StoreDCDetail where PubDate >= :N1 and PubDate <= :N2 and ');
      SQL.Add('PubTime >= :N4 and PubTime <= :N5  ');
      Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
      Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
      Parameters.ParamByName('N4').Value:= MG_InsZero(IntToStr(j-1), 2) + ':00:00';
      Parameters.ParamByName('N5').Value:= MG_InsZero(IntToStr(j-1), 2) + ':59:59';
      Open;

      if FieldByName('nIn').AsInteger > 0 then
        sgCount.Cells[1, j]:= FormatFloat('#,##0', FieldByName('nIn').AsInteger)
      else
        sgCount.Cells[1, j]:= '0';

      nSum:= nSum + FieldByName('nIn').AsInteger;
      sgCount.Alignments[1, j]:= taRightJustify;
    end;

    if nSum > 0 then
      sgCount.Cells[1, 25]:= FormatFloat('#,##0', nSum)
    else
      sgCount.Cells[1, 25]:= '0';

    nTotIn:= nTotIn + nSum;
    sgCount.Alignments[1, 25]:= taRightJustify;
  end;

  sb1.SimpleText:= ' 총 할인건수: ' + IntToStr(nTotIn);
  btnExcel.Enabled:= True;
end;

procedure TfrmCGVDCCnt.btnExcelClick(Sender: TObject);
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
