unit ValIOCnt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, StdCtrls, Buttons, ComCtrls,
  AdvDateTimePicker, ExtCtrls, tmsAdvGridExcel, DB, ADODB, AdvObj;

type
  TfrmValIOCnt = class(TForm)
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
  frmValIOCnt: TfrmValIOCnt;
  nTotLpr, nInLpr, nOutLpr: Byte;
  RLpr: Array [1..50] of Word;

implementation
uses
  Global, Tables;

{$R *.dfm}

procedure TfrmValIOCnt.FormShow(Sender: TObject);
var
  i, j: Byte;
begin
  with qryTemp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select Count(*) nLprCnt ');
    SQL.Add('From UnitInfo Where UnitKind = :pUnitKind and MyNo = :pMyNo and ParkNo = :pParkNo');
    Parameters.ParamByName('pUnitKind').Value := 8; // ?Ա?LPR
    Parameters.ParamByName('pMyNo').Value := nValetUnitNo;
    Parameters.ParamByName('pParkNo').Value := nCurrParkNo;
    Open;

    nTotLpr:= FieldByName('nLprCnt').AsInteger;
    sgCount.ColCount:= nTotLpr + 1;

    Close;
    SQL.Clear;
    SQL.Add('Select * ');
    SQL.Add('From UnitInfo Where UnitKind = :pUnitKind and MyNo = :pMyNo and ParkNo = :pParkNo');
    SQL.Add('Order By ParkNo, UnitNo');
    Parameters.ParamByName('pUnitKind').Value := 8; // ?Ա?LPR
    Parameters.ParamByName('pMyNo').Value := nValetUnitNo;
    Parameters.ParamByName('pParkNo').Value := nCurrParkNo;
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
        sgCount.ColWidths[i] := 150;
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

procedure TfrmValIOCnt.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmValIOCnt.btnSearchClick(Sender: TObject);
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
        SQL.Add('Select Count(*) nIn from ValDataProc');
        SQL.Add('where ProcDate >= :N1 and ProcDate <= :N2 and ');
        //SQL.Add('UnitNo = :N3 and ProcTime >= :N4 and ProcTime <= :N5');
        SQL.Add('ProcTime >= :N4 and ProcTime <= :N5');
        Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
        Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
        //Parameters.ParamByName('N3').Value:= nUnitNo;
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

  sb1.SimpleText:= ' ??????: ' + IntToStr(nTotIn);
  btnExcel.Enabled:= True;
end;

procedure TfrmValIOCnt.btnExcelClick(Sender: TObject);
begin
  try
    if savedialog1.Execute then
    begin
      eCount.XLSExport(savedialog1.filename + '.xls');
      ShowMessage('???????Ϸ? ?????Ϸ?!');
    end;
  except
    on E: Exception do ExceptLogging('TfrmValIOCnt.btnExcelClick: ' + E.Message);
  end;
end;

end.
