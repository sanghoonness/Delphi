unit ParkingTime;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, BaseGrid, AdvGrid, StdCtrls, Buttons, ComCtrls,
  AdvDateTimePicker, ExtCtrls, tmsAdvGridExcel;

type
  TfrmParkingTime = class(TForm)
    Panel1: TPanel;
    Bevel2: TBevel;
    Label7: TLabel;
    Label8: TLabel;
    edtSDate: TAdvDateTimePicker;
    edtEDate: TAdvDateTimePicker;
    btnSearch: TBitBtn;
    btnExcel: TBitBtn;
    btnClose: TBitBtn;
    sgCount: TAdvStringGrid;
    qryTemp: TADOQuery;
    qryCount: TADOQuery;
    SaveDialog1: TSaveDialog;
    eCount: TAdvGridExcelIO;
    procedure FormShow(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParkingTime: TfrmParkingTime;

implementation
uses
  Global, Tables;

{$R *.dfm}

procedure TfrmParkingTime.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmParkingTime.btnExcelClick(Sender: TObject);
begin
  try
    if savedialog1.Execute then
    begin
      eCount.XLSExport(savedialog1.filename + '.xls');
      ShowMessage('¿¢¼¿ÆÄÀÏ·Î ÀúÀå¿Ï·á!');
    end;
  except
    on E: Exception do ExceptLogging('TfrmParkingTime.btnExcelClick: ' + E.Message);
  end;
end;

procedure TfrmParkingTime.btnSearchClick(Sender: TObject);
var
  i: Byte;
  sSDate, sEDate: String;
begin
  sSDate:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
  sEDate:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);

  with qryTemp do
  begin
    for i := 1 to 20 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select Count(*) nCnt, Sum(RealFee) nSum from TKProc ');
      SQL.Add('where ProcDate >= :N1 and ProcDate <= :N2 and ParkingMin >= :N3 and ParkingMin <= :N4 ');
      Parameters.ParamByName('N1').Value:= sSDate;
      Parameters.ParamByName('N2').Value:= sEDate;

      if i = 1 then
        Parameters.ParamByName('N3').Value:= 0
      else
        Parameters.ParamByName('N3').Value:= (30 * (i-1)) + 1;

      Parameters.ParamByName('N4').Value:= 30 * i;
      Open;

      sgCount.Cells[i, 1]:= FormatFloat('#,##0', FieldByName('nCnt').AsInteger);
      sgCount.Cells[i, 2]:= FormatFloat('#,##0', FieldByName('nSum').AsInteger);
      sgCount.Alignments[i, 1]:= taRightJustify;
      sgCount.Alignments[i, 2]:= taRightJustify;
    end;

    Close;
    SQL.Clear;
    SQL.Add('Select Count(*) nCnt, Sum(RealFee) nSum from TKProc ');
    SQL.Add('where ProcDate >= :N1 and ProcDate <= :N2 and ParkingMin > :N3 ');
    Parameters.ParamByName('N1').Value:= sSDate;
    Parameters.ParamByName('N2').Value:= sEDate;
    Parameters.ParamByName('N3').Value:= 600;
    Open;

    sgCount.Cells[i, 1]:= FormatFloat('#,##0', FieldByName('nCnt').AsInteger);
    sgCount.Cells[i, 2]:= FormatFloat('#,##0', FieldByName('nSum').AsInteger);
    sgCount.Alignments[i, 1]:= taRightJustify;
    sgCount.Alignments[i, 2]:= taRightJustify;
    btnExcel.Enabled:= True;
  end;
end;

procedure TfrmParkingTime.FormShow(Sender: TObject);
var
  i: Byte;
begin
  with sgCount do
  begin
    for i:= 0 to 21 do
      Alignments[i, 0]:= taCenter;

    for i:= 0 to 2 do
      Alignments[0, i]:= taCenter;
  end;
  edtSDate.Date:= Now;
  edtEDate.Date:= Now;
end;

end.
