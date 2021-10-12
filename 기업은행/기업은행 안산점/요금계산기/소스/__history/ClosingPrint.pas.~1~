unit ClosingPrint;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, AdvObj, BaseGrid, AdvGrid, DBAdvGrid, Vcl.StdCtrls, AeroButtons,
  Vcl.ComCtrls, AdvDateTimePicker, Vcl.ExtCtrls, Data.DB, Data.Win.ADODB, AdvToolBtn;

type
  TfrmClosingPrint = class(TForm)
    qryTemp: TADOQuery;
    qryClosing: TADOQuery;
    dsClosing: TDataSource;
    qryManager: TADOQuery;
    qryManagerParkNo: TSmallintField;
    qryManagerMNo: TSmallintField;
    qryManagerMName: TStringField;
    qryClosingParkNo: TSmallintField;
    qryClosingCDate: TStringField;
    qryClosingProcDate: TStringField;
    qryClosingProcTime: TStringField;
    qryClosingMNo: TWordField;
    qryClosingClosingSeq: TWordField;
    qryClosingPrtData: TMemoField;
    qryClosingMName: TStringField;
    Panel1: TPanel;
    Panel3: TPanel;
    edtCDate: TAdvDateTimePicker;
    dgClosing: TDBAdvGrid;
    tClosingPrt: TTimer;
    btnSearch: TAdvToolButton;
    btnPrint: TAdvToolButton;
    btnClose: TAdvToolButton;
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure dgClosingClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure tClosingPrtTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClosingPrint: TfrmClosingPrint;
  sClosingPrt: AnsiString;

implementation
uses
  Tables, Global, MainNew;

{$R *.dfm}

procedure TfrmClosingPrint.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmClosingPrint.btnPrintClick(Sender: TObject);
begin
  //영수증프린터로 인쇄...
  if Length(sClosingPrt) > 4096 then
  begin
    nClosingi:= 1;
    nClosingj:= Length(sClosingPrt) div 4096;
    nClosingm:= Length(sClosingPrt) mod 4096;
    frmMainNew.ComPRN.PutString(Copy(sClosingPrt, 4096*(nClosingi-1)+1, 4096));
    nClosingi:= 2;
    tClosingPrt.Enabled:= True;
  end
  else
  begin
    frmMainNew.ComPRN.PutString(sClosingPrt);
    sClosingPrt:= '';
  end;
end;

procedure TfrmClosingPrint.btnSearchClick(Sender: TObject);
begin
  with qryClosing do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * from Closing where CDate = :N1 Order by ProcDate, ProcTime');
    Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtCDate.Date);
    Open;

    if RecordCount <= 0 then
    begin
      ShowMessage('조회한 마감일자에 마감자료가 없습니다. 확인하여 주세요!');
      sClosingPrt:= '';
      btnPrint.Enabled:= False;
    end;
  end;
end;

procedure TfrmClosingPrint.dgClosingClick(Sender: TObject);
begin
  if qryClosing.RecordCount > 0 then
  begin
    sClosingPrt:= qryClosing.FieldByName('PrtData').AsString;
    sClosingPrt:= MG_StrConvert(sClosingPrt, AnsiChar($FF), AnsiChar($00));
    btnPrint.Enabled:= True;
  end;
end;

procedure TfrmClosingPrint.FormShow(Sender: TObject);
begin
  edtCDate.Date:= Now;
end;

procedure TfrmClosingPrint.tClosingPrtTimer(Sender: TObject);
begin
  while nClosingi <= nClosingj do
  begin
    frmMainNew.ComPRN.PutString(Copy(sClosingPrt, 4096*(nClosingi-1)+1, 4096));
    Inc(nClosingi);
    Exit;
  end;
  frmMainNew.ComPRN.PutString(Copy(sClosingPrt, 4096*(nClosingi-1)+1, nClosingm));
  tClosingPrt.Enabled:= False;
  sClosingPrt:= '';
end;

end.
