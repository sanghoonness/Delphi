unit DailyIOCnt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, StdCtrls, Buttons, ComCtrls,
  AdvDateTimePicker, ExtCtrls, tmsAdvGridExcel, DB, ADODB, AdvObj, Vcl.Mask,
  AdvEdit;

type
  TfrmDailyIOCnt = class(TForm)
   sgCount: TAdvStringGrid;
    Panel1: TPanel;
    Bevel2: TBevel;
    Label7: TLabel;
    Label8: TLabel;
    btnSearch: TBitBtn;
    btnExcel: TBitBtn;
    btnClose: TBitBtn;
    qryCount: TADOQuery;
    SaveDialog1: TSaveDialog;
    eCount: TAdvGridExcelIO;
    sb1: TStatusBar;
    qryTemp: TADOQuery;
    edtSDate: TAdvMaskEdit;
    edtEDate: TAdvMaskEdit;
    procedure btnExcelClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDailyIOCnt: TfrmDailyIOCnt;
  nTotLpr, nInLpr, nOutLpr: Byte;     // nInLpr: 총입구LPR 개수
  RLpr: Array [1..50] of Word;
implementation
uses
  Global, Tables;

{$R *.dfm}


procedure TfrmDailyIOCnt.btnCloseClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmDailyIOCnt.btnExcelClick(Sender: TObject);
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

// 일자별 조회
procedure TfrmDailyIOCnt.btnSearchClick(Sender: TObject);
var
  i, j, k: Byte;
  nSum, nTotIn, nTotOut, nTot, nTotIos, nTotIon, nUnitNo: Cardinal;
  ssTime, sETime: String;
  nIosIn: Array [1..31] of Integer;        // 정기차량 일자별 출입내역 카운트 변수
  nIonIn: Array [1..31] of Integer;        // 일반차량 일자별 출입내역 카운트 변수
  nIn: Array [1..31] of Integer;           // 정기+일반차량 일자별 출입내역 카운트 변수
  nIosOut: Array [1..31] of Integer;       // 정기차량 일자별 출차내역 카운트 변수
  nIonOut: Array [1..31] of Integer;       // 일반차량 일자별 출차내역 카운트 변수
  nOut: Array [1..31] of Integer;          // 정기+일반차량 일자별 출차내역 카운트 변수
  nIon: Array [1..31] of Integer;          // 유료건수 카운트 변수
  nIos: Array [1..31] of Integer;          // 무료건수 카운트 변수
begin
  nTotIn:= 0;           // 총입차건수
  nTotOut:= 0;          // 총출차건수
  nTot:= 0;             // 총건수(유료+무료)

    with qryTemp do
    begin
      for j:= 1 to 31 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select Count(*) nIn from StoreDCDetail where SUBSTRING(PubDate, 1, 7) >= :PubDate1 and SUBSTRING(PubDate, 1, 7) <= :PubDate2 ');
        SQL.Add('and SUBSTRING(PubDate,9,2) = :PubDate3 ');
        Parameters.ParamByName('PubDate1').Value:= edtSDate.Text;
        Parameters.ParamByName('PubDate2').Value:= edtEDate.Text;
        Parameters.ParamByName('PubDate3').Value:= MG_InsZero(IntToStr(j), 2);
        Open;

        // 조회한 카운트가 0보다 크면
        if FieldByName('nIn').AsInteger > 0 then
          nIonIn[j]:= FieldByName('nIn').AsInteger
        else
          nIonIn[j]:= 0;
      end;

      // 시간대별 출입내역
      for j := 1 to 31 do
      begin
        nIn[j] := nIonIn[j];

        if nIn[j] > 0 then
          sgCount.Cells[1, j]:= FormatFloat('#,##0', nIn[j])
        else
          sgCount.Cells[1, j]:= '0';

        nTotIn:= nTotIn + nIn[j];      // 총입차건수
        sgCount.Alignments[1, j]:= taRightJustify;

      if nTotIn > 0 then
        sgCount.Cells[1, 32]:= FormatFloat('#,##0', nTotIn)
      else
        sgCount.Cells[1, 32]:= '0';

      sgCount.Alignments[1, 32]:= taRightJustify;
      end;
    end;

  sgCount.Cells[0, 0]:= edtSDate.Text + ' ~ ' + edtEDate.Text;
  sb1.SimpleText:= ' 총할인건수: ' + IntToStr(nTotIn);
  btnExcel.Enabled:= True;
end;

procedure TfrmDailyIOCnt.FormShow(Sender: TObject);
var
  i, j: Byte;
begin
  with sgCount do
  begin
    for i:= 0 to 32 do
      Alignments[0, i]:= taCenter;

  end;

  sgCount.ColWidths[1] := 150;
  sgCount.Alignments[1, 0]:= taCenter;

  edtSDate.Text:= FormatDateTime('YYYY-MM', Now);
  edtEDate.Text:= FormatDateTime('YYYY-MM', Now);
end;
end.
