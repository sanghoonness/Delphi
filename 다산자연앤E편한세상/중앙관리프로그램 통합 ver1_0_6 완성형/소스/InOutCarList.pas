unit InOutCarList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.Grids,
  AdvObj, BaseGrid, AdvGrid, DBAdvGrid, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons,
  sBitBtn, Vcl.ExtCtrls, Vcl.ImgList, sGroupBox, CodeSiteLogging;

type
  TfrmInOutCarList = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    dtFrom: TDateTimePicker;
    Label1: TLabel;
    dtTo: TDateTimePicker;
    Label2: TLabel;
    grdInOutCar: TDBAdvGrid;
    qryInOutCar: TADOQuery;
    dsInOutCar: TDataSource;
    ImageList1: TImageList;
    Panel2: TPanel;
    btnFind: TsBitBtn;
    btnExit: TsBitBtn;
    btnExcel: TsBitBtn;
    grpSort: TsRadioGroup;
    procedure btnFindClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInOutCarList: TfrmInOutCarList;

implementation

uses
  Tables, Global;

{$R *.dfm}

procedure TfrmInOutCarList.btnExcelClick(Sender: TObject);
begin
  mzExcelExport(grdInOutCar,grdInOutCar.ColCount-1);
end;

procedure TfrmInOutCarList.btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmInOutCarList.btnFindClick(Sender: TObject);
begin
  qryInOutCar.Close;
  qryInOutCar.SQL.Clear;
  if grpSort.ItemIndex = 0 then begin //입차기준
    qryInOutCar.SQL.Add('select Division, UnitName, ProcDate, ProcTime, OutDate, OutTime, InCarNo1, val1, val3   ');
    qryInOutCar.SQL.Add('FROM(                                                                     ');
    qryInOutCar.SQL.Add('Select ''등록'' as Division, t2.UnitName, t1.ProcDate, t1.ProcTime, t1.OutDate, t1.OutTime, InCarNo1, ');
    qryInOutCar.SQL.Add('dbo.GetSecondToTime(DATEDIFF(s,CONVERT(CHAR(19), t1.ProcDate+'+QuotedStr(' ')+ '+t1.ProcTime, 20),CONVERT(CHAR(19), t1.OutDate+'+QuotedStr(' ')+ '+t1.OutTime, 20))) val1, ');
    qryInOutCar.SQL.Add('case when t1.CompName = '+QuotedStr('')+' then '+QuotedStr('')+' else (t1.CompName+'+QuotedStr('- ')+'+t1.DeptName+'+QuotedStr('')+') end val3 ');
    qryInOutCar.SQL.Add('From IOSData t1 inner join UnitInfo t2 On t1.UnitNo = t2.UnitNo ');
    qryInOutCar.SQL.Add('Where t1.ProcDate between :v1 and :v2 ');
    qryInOutCar.SQL.Add('UNION ');
    qryInOutCar.SQL.Add('Select ''미등록'' as Division, t2.UnitName, t1.ProcDate, t1.ProcTime, t1.OutDate, t1.OutTime, InCarNo1, ');
    qryInOutCar.SQL.Add('dbo.GetSecondToTime(DATEDIFF(s,CONVERT(CHAR(19), t1.ProcDate+'+QuotedStr(' ')+ '+t1.ProcTime, 20),CONVERT(CHAR(19), t1.OutDate+'+QuotedStr(' ')+ '+t1.OutTime, 20))) val1, ');
    qryInOutCar.SQL.Add('case when t1.Reserve2 = '+QuotedStr('')+' then '+QuotedStr('')+' else (t1.Reserve2+'+QuotedStr('- ')+'+t1.Reserve3+'+QuotedStr('')+') end val3 ');
    qryInOutCar.SQL.Add('From IONData t1 inner join UnitInfo t2 On t1.UnitNo = t2.UnitNo ');
    qryInOutCar.SQL.Add('Where t1.ProcDate between :v3 and :v4 ');
    qryInOutCar.SQL.Add(')ION_IOS_DATA ');
    qryInOutCar.SQL.Add('Order by ProcDate+ProcTime desc ');

//    qryInOutCar.SQL.Add('select Division, UnitName, ProcDate, ProcTime, OutDate, OutTime, InCarNo1, val1, val3   ');
//    qryInOutCar.SQL.Add('FROM(                                                                     ');
//    qryInOutCar.SQL.Add('Select ''등록'' as Division, t2.UnitName, t1.ProcDate, t1.ProcTime, t1.OutDate, t1.OutTime, InCarNo1, ');
//    qryInOutCar.SQL.Add('convert (varchar(50), dateadd(s,DATEDIFF(s,CONVERT(CHAR(19), t1.ProcDate+'+QuotedStr(' ')+ '+t1.ProcTime, 20),CONVERT(CHAR(19), t1.OutDate+'+QuotedStr(' ')+ '+t1.OutTime, 20)), ''''),8) val1, ');
//    qryInOutCar.SQL.Add('case when t1.CompName = '+QuotedStr('')+' then '+QuotedStr('')+' else (t1.CompName+'+QuotedStr('- ')+'+t1.DeptName+'+QuotedStr('')+') end val3 ');
//    qryInOutCar.SQL.Add('From IOSData t1 inner join UnitInfo t2 On t1.UnitNo = t2.UnitNo ');
//    qryInOutCar.SQL.Add('Where t1.ProcDate between :v1 and :v2 ');
//    qryInOutCar.SQL.Add('UNION ');
//    qryInOutCar.SQL.Add('Select ''미등록'' as Division, t2.UnitName, t1.ProcDate, t1.ProcTime, t1.OutDate, t1.OutTime, InCarNo1, ');
//    qryInOutCar.SQL.Add('convert (varchar(50), dateadd(s,DATEDIFF(s,CONVERT(CHAR(19), t1.ProcDate+'+QuotedStr(' ')+ '+t1.ProcTime, 20),CONVERT(CHAR(19), t1.OutDate+'+QuotedStr(' ')+ '+t1.OutTime, 20)), ''''),8) val1, ');
//    qryInOutCar.SQL.Add('case when t1.Reserve2 = '+QuotedStr('')+' then '+QuotedStr('')+' else (t1.Reserve2+'+QuotedStr('- ')+'+t1.Reserve3+'+QuotedStr('')+') end val3 ');
//    qryInOutCar.SQL.Add('From IONData t1 inner join UnitInfo t2 On t1.UnitNo = t2.UnitNo ');
//    qryInOutCar.SQL.Add('Where t1.ProcDate between :v3 and :v4 ');
//    qryInOutCar.SQL.Add(')ION_IOS_DATA ');
//    qryInOutCar.SQL.Add('Order by ProcDate+ProcTime desc ');
  end else begin //출차기준
    qryInOutCar.SQL.Add('select Division, UnitName, ProcDate, ProcTime, OutDate, OutTime, InCarNo1, val1, val3   ');
    qryInOutCar.SQL.Add('FROM(                                                                     ');
    qryInOutCar.SQL.Add('Select ''등록'' as Division, t2.UnitName, t1.ProcDate, t1.ProcTime, t1.OutDate, t1.OutTime, InCarNo1, ');
    qryInOutCar.SQL.Add('dbo.GetSecondToTime(DATEDIFF(s,CONVERT(CHAR(19), t1.ProcDate+'+QuotedStr(' ')+ '+t1.ProcTime, 20),CONVERT(CHAR(19), t1.OutDate+'+QuotedStr(' ')+ '+t1.OutTime, 20))) val1, ');
    qryInOutCar.SQL.Add('case when t1.CompName = '+QuotedStr('')+' then '+QuotedStr('')+' else (t1.CompName+'+QuotedStr('- ')+'+t1.DeptName+'+QuotedStr('')+') end val3 ');
    qryInOutCar.SQL.Add('From IOSData t1 inner join UnitInfo t2 On t1.UnitNo = t2.UnitNo ');
    qryInOutCar.SQL.Add('Where t1.OutDate between :v1 and :v2 ');
    qryInOutCar.SQL.Add('UNION ');
    qryInOutCar.SQL.Add('Select ''미등록'' as Division, t2.UnitName, t1.ProcDate, t1.ProcTime, t1.OutDate, t1.OutTime, InCarNo1, ');
    qryInOutCar.SQL.Add('dbo.GetSecondToTime(DATEDIFF(s,CONVERT(CHAR(19), t1.ProcDate+'+QuotedStr(' ')+ '+t1.ProcTime, 20),CONVERT(CHAR(19), t1.OutDate+'+QuotedStr(' ')+ '+t1.OutTime, 20))) val1, ');
    qryInOutCar.SQL.Add('case when t1.Reserve2 = '+QuotedStr('')+' then '+QuotedStr('')+' else (t1.Reserve2+'+QuotedStr('- ')+'+t1.Reserve3+'+QuotedStr('')+') end val3 ');
    qryInOutCar.SQL.Add('From IONData t1 inner join UnitInfo t2 On t1.UnitNo = t2.UnitNo ');
    qryInOutCar.SQL.Add('Where t1.OutDate between :v3 and :v4 ');
    qryInOutCar.SQL.Add(')ION_IOS_DATA ');
    qryInOutCar.SQL.Add('Order by OutDate+OutTime desc ');

//    qryInOutCar.SQL.Add('select Division, UnitName, ProcDate, ProcTime, OutDate, OutTime, InCarNo1, val1, val3   ');
//    qryInOutCar.SQL.Add('FROM(                                                                     ');
//    qryInOutCar.SQL.Add('Select ''등록'' as Division, t2.UnitName, t1.ProcDate, t1.ProcTime, t1.OutDate, t1.OutTime, InCarNo1, ');
//    qryInOutCar.SQL.Add('convert (varchar(50), dateadd(s,DATEDIFF(s,CONVERT(CHAR(19), t1.ProcDate+'+QuotedStr(' ')+ '+t1.ProcTime, 20),CONVERT(CHAR(19), t1.OutDate+'+QuotedStr(' ')+ '+t1.OutTime, 20)), ''''),8) val1, ');
//    qryInOutCar.SQL.Add('case when t1.CompName = '+QuotedStr('')+' then '+QuotedStr('')+' else (t1.CompName+'+QuotedStr('- ')+'+t1.DeptName+'+QuotedStr('')+') end val3 ');
//    qryInOutCar.SQL.Add('From IOSData t1 inner join UnitInfo t2 On t1.UnitNo = t2.UnitNo ');
//    qryInOutCar.SQL.Add('Where t1.OutDate between :v1 and :v2 ');
//    qryInOutCar.SQL.Add('UNION ');
//    qryInOutCar.SQL.Add('Select ''미등록'' as Division, t2.UnitName, t1.ProcDate, t1.ProcTime, t1.OutDate, t1.OutTime, InCarNo1, ');
//    qryInOutCar.SQL.Add('convert (varchar(50), dateadd(s,DATEDIFF(s,CONVERT(CHAR(19), t1.ProcDate+'+QuotedStr(' ')+ '+t1.ProcTime, 20),CONVERT(CHAR(19), t1.OutDate+'+QuotedStr(' ')+ '+t1.OutTime, 20)), ''''),8) val1, ');
//    qryInOutCar.SQL.Add('case when t1.Reserve2 = '+QuotedStr('')+' then '+QuotedStr('')+' else (t1.Reserve2+'+QuotedStr('- ')+'+t1.Reserve3+'+QuotedStr('')+') end val3 ');
//    qryInOutCar.SQL.Add('From IONData t1 inner join UnitInfo t2 On t1.UnitNo = t2.UnitNo ');
//    qryInOutCar.SQL.Add('Where t1.OutDate between :v3 and :v4 ');
//    qryInOutCar.SQL.Add(')ION_IOS_DATA ');
//    qryInOutCar.SQL.Add('Order by OutDate+OutTime desc ');
  end;
//  CodeSite.Send(qryInOutCar.SQL.Text);
  qryInOutCar.Parameters.ParamByName('v1').Value := FormatDateTime('yyyy-mm-dd',dtFrom.Date);
  qryInOutCar.Parameters.ParamByName('v2').Value := FormatDateTime('yyyy-mm-dd',dtTo.Date);
  qryInOutCar.Parameters.ParamByName('v3').Value := FormatDateTime('yyyy-mm-dd',dtFrom.Date);
  qryInOutCar.Parameters.ParamByName('v4').Value := FormatDateTime('yyyy-mm-dd',dtTo.Date);
  qryInOutCar.Open;

  grdInOutCar.AutoSize := True;

  if qryInOutCar.RecordCount = 0 then begin
     ShowMessage('데이터가 없습니다.');
  end;
end;

procedure TfrmInOutCarList.FormShow(Sender: TObject);
begin
  dtFrom.Date := now;
  dtTo.Date := now;
end;

end.
