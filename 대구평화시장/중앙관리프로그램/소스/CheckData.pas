unit CheckData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, AdvDateTimePicker, ExtCtrls, DB, Grids, BaseGrid, AdvGrid, DBAdvGrid, ADODB, tmsAdvGridExcel;

type
  TfrmCheckData = class(TForm)
    sb1: TStatusBar;
    Panel2: TPanel;
    Bevel2: TBevel;
    Label7: TLabel;
    Label8: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    Bevel4: TBevel;
    Label3: TLabel;
    edtSDate: TAdvDateTimePicker;
    edtSTime: TAdvDateTimePicker;
    edtEDate: TAdvDateTimePicker;
    edtETime: TAdvDateTimePicker;
    cmbGroupType: TComboBox;
    cmbIO: TComboBox;
    btnSearch: TBitBtn;
    btnExcel: TBitBtn;
    btnClose: TBitBtn;
    qryData: TADOQuery;
    qryDataProcDate: TStringField;
    qryDataInCarNo1: TStringField;
    qryDatasData: TIntegerField;
    dg1: TDBAdvGrid;
    dsData: TDataSource;
    AdvGridExcelIO1: TAdvGridExcelIO;
    SaveDialog1: TSaveDialog;
    procedure cmbIOChange(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCheckData: TfrmCheckData;

implementation
uses
  Global, Tables;

{$R *.dfm}

procedure TfrmCheckData.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCheckData.btnExcelClick(Sender: TObject);
begin
  try
    if savedialog1.Execute then
    begin
      advgridexcelio1.XLSExport(savedialog1.filename + '.xls');
      ShowMessage('¿¢¼¿ÆÄÀÏ·Î ÀúÀå¿Ï·á!');
    end;
  except
    on E: Exception do ExceptLogging('TfrmCheckData.btnExcelClick: ' + E.Message);
  end;
end;

procedure TfrmCheckData.btnSearchClick(Sender: TObject);
var
  sSDate, sEDate, sSTime, sETime: String;
begin
  try
    sSDate:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
    sEDate:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
    sSTime:= FormatDateTime('HH:NN:SS', edtSTime.Time);
    sETime:= FormatDateTime('HH:NN:SS', edtETime.Time);

    with qryData do
    begin
      Close;
      SQL.Clear;

      case cmbIO.ItemIndex of
        0: begin
             SQL.Add('Select ProcDate, InCarNo1, IsNull(Count(*), 0) sData from IOSData ');
             SQL.Add('where ((ProcDate + ProcTime) between :N1 and :N2) and GroupNo = 1 ');
             SQL.Add('Group By ProcDate, InCarNo1 Order By ProcDate, InCarNo1');
             Parameters.ParamByName('N1').Value:= sSDate + sSTime;
             Parameters.ParamByName('N2').Value:= sEDate + sETime;
             Open;
        end;

        1: begin
             SQL.Add('Select i.ProcDate, i.InCarNo1, IsNull(Sum(p.ProcAmt), 0) sData ');
             SQL.Add('from IOSData i, PosData p ');
             SQL.Add('where ((i.ProcDate + i.ProcTime) between :N1 and :N2) and i.GroupNo = 1 and ');
             SQL.Add('i.InCarNo1 = p.CarNo ');
             SQL.Add('Group By i.ProcDate, i.InCarNo1 Order By i.ProcDate, i.InCarNo1');
             Parameters.ParamByName('N1').Value:= sSDate + sSTime;
             Parameters.ParamByName('N2').Value:= sEDate + sETime;
             Open;
        end;
      end;

      if RecordCount > 0 then
      begin
        btnExcel.Enabled:= True;
      end
      else
      begin
        btnExcel.Enabled:= False;
      end;
    end;
  except
    on E: Exception do ExceptLogging('TfrmCheckData.btnSearchClick: ' + aString(E.Message));
  end;
end;

procedure TfrmCheckData.cmbIOChange(Sender: TObject);
begin
  dg1.Columns[3].Header:= cmbIO.Text;
end;

procedure TfrmCheckData.FormShow(Sender: TObject);
begin
  edtSDate.Date:= Now;
  edtEDate.Date:= Now;
  edtSTime.Time:= StrToDateTime('00:00:00');
  edtETime.Time:= StrToDateTime('23:59:59');
end;

end.
