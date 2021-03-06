unit CarPossession;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, AdvObj, BaseGrid, AdvGrid,
  DBAdvGrid, Vcl.StdCtrls, sButton, Vcl.ExtCtrls, Data.DB, Data.Win.ADODB,
  Vcl.ImgList, acAlphaImageList;

type
  TfrmCarPossession = class(TForm)
    Panel1: TPanel;
    btnCar2: TsButton;
    btnCar3: TsButton;
    btnCar4: TsButton;
    grdCarPossession: TDBAdvGrid;
    dsCarPsn: TDataSource;
    qryCarPsn: TADOQuery;
    btnPrint: TsButton;
    btnExit: TsButton;
    sAlphaImageList1: TsAlphaImageList;
    qryTmp: TADOQuery;
    procedure FormShow(Sender: TObject);
    procedure btnCar2Click(Sender: TObject);
    procedure btnCar3Click(Sender: TObject);
    procedure btnCar4Click(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    { Private declarations }
    printStr: string;
    procedure CarCountSql(havingStr: string);
    procedure ShowGridData;
  public
    { Public declarations }
  end;

var
  frmCarPossession: TfrmCarPossession;

implementation

uses
  Tables, Global;

{$R *.dfm}

procedure TfrmCarPossession.btnCar2Click(Sender: TObject);
begin
  CarCountSql('HAVING count(*) = 2');
  printStr := TsButton(Sender).Caption;
end;

procedure TfrmCarPossession.btnCar3Click(Sender: TObject);
begin
  CarCountSql('HAVING count(*) = 3');
  printStr := TsButton(Sender).Caption;
end;

procedure TfrmCarPossession.btnCar4Click(Sender: TObject);
begin
  CarCountSql('HAVING count(*) >= 4');
  printStr := TsButton(Sender).Caption;
end;

procedure TfrmCarPossession.btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCarPossession.btnPrintClick(Sender: TObject);
begin
//  grdCarPossession.PrintSettings.TitleLines.Add(' ');
//  grdCarPossession.PrintSettings.TitleLines.Add('['+printStr + ' ??Ȳ]');
//  grdCarPossession.PrintSettings.TitleLines.Add(' ');
//
//  grdCarPossession.Print;
  mzExcelExport(grdCarPossession,grdCarPossession.ColCount-1);
end;

procedure TfrmCarPossession.CarCountSql(havingStr: string);
var
  tmpStrs, tmpStrs2: TStrings;
  i: Integer;
  CompName, DeptName : string;
const
  ConFlag = ' OR ';
begin
  try
    {qryCarPsn.Close;
    qryCarPsn.SQL.Clear;
    qryCarPsn.SQL.Add('select CompName, DeptName, max(TelNo), max(CarNo) ,max(IssueDate) from CustInfo where isnull(DeptName,'+QuotedStr('')+') <> '+QuotedStr('') +' group by CompName, DeptName');
    qryCarPsn.SQL.Add(havingStr);
    qryCarPsn.SQL.Add(' Order by CompName, len(DeptName)');
    qryCarPsn.Open; }

    qryCarPsn.Close;
    qryCarPsn.SQL.Clear;
    qryCarPsn.SQL.Add('SELECT distinct a.CompName, a.DeptName, a.TelNo, a.Carno, a.IssueDate  ');
    qryCarPsn.SQL.Add('from CustInfo a left merge join CustInfo b ON a.CompName = b.CompName and  a.DeptName = b.DeptName ');
    qryCarPsn.SQL.Add('where isnull(a.DeptName,'+QuotedStr('')+') <> '+QuotedStr('') +' group by a.CompName, a.DeptName, a.TelNo, a.Carno, a.IssueDate ');
    qryCarPsn.SQL.Add(havingStr);
    qryCarPsn.Open;
    ExceptLogging(qryCarPsn.SQL.Text);

    {while not Eof do
    begin
      CompName := qryCarPsn.FieldByName('CompName').AsString;
      DeptName := qryCarPsn.FieldByName('DeptName').AsString;

      qryCarPsn.Close;
      qryCarPsn.SQL.Clear;
      qryCarPsn.SQL.Add('SELECT distinct a.CompName, a.DeptName, a.TelNo, a.Carno, IssueDate  ');
      qryCarPsn.SQL.Add('from  qryCarPsn.CustInfo a left merge join CustInfo b ON a.CompName = b.CompName and  a.DeptName = b.DeptName ');
      qryCarPsn.SQL.Add('where a.CompName = :N1 and a.DeptName = :N2        ');
      qryCarPsn.SQL.Add('group by a.CompName, a.DeptName, a.TelNo, a.Carno ');
      qryCarPsn.Parameters.ParamByName('N1').Value:= CompName;
      qryCarPsn.Parameters.ParamByName('N2').Value:= DeptName;
      qryCarPsn.Open;
      Next;
    end;}
     ShowGridData;

//    if qryTmp.RecordCount > 0 then begin
//      qryTmp.First;
//      tmpStrs := TStringList.Create;
//      while not qryTmp.Eof do begin
//        tmpStrs.Add(qryTmp.Fields[0].Value+','+ qryTmp.Fields[1].Value);
//        qryTmp.Next;
//      end;
//    end;
//
//    if (tmpStrs <> nil) then begin
//      if (tmpStrs.Count > 0 ) then begin
//        TStringList(tmpStrs).Sort;
//        tmpStrs2 := TStringList.Create;
//        qryCarPsn.Close;
//        qryCarPsn.SQL.Clear;
//        qryCarPsn.SQL.Add('Select CompName, DeptName, TelNo, CarNo, IssueDate From CustInfo Where ');
//        for i := 0 to tmpStrs.Count-1 do begin
//          tmpStrs2.Delimiter := ',';
//          tmpStrs2.DelimitedText := tmpStrs.Strings[i];
//          qryCarPsn.SQL.Add('(CompName='+ QuotedStr(tmpStrs2[0]) + ' And DeptName=' + QuotedStr(tmpStrs2[1]) + ')');
//          if i = tmpStrs.Count-1 then
//
//          else
//            qryCarPsn.SQL.Add(ConFlag);
//        end;
//
//        ExceptLogging(qryCarPsn.SQL.Text);
//        qryCarPsn.Open;
//      end;
//    end else begin
//      grdCarPossession.ClearRows(1,grdCarPossession.RowCount);
//    end;
//    FreeAndNil(tmpstrs);
//    FreeAndNil(tmpstrs2);
    //ShowGridData;
  except on E: Exception do
    ExceptLogging(e.Message);
  end;
end;

procedure TfrmCarPossession.FormShow(Sender: TObject);
begin
  ShowGridData;
end;

procedure TfrmCarPossession.ShowGridData;
var
  i: Integer;
begin
  grdCarPossession.ColCount := 6;
  grdCarPossession.Columns[0].Header := '??ȣ';
  grdCarPossession.Columns[1].Header := '??';
  grdCarPossession.Columns[2].Header := 'ȣ';
  grdCarPossession.Columns[3].Header := '??ȭ??ȣ';
  grdCarPossession.Columns[4].Header := '??????ȣ';
  grdCarPossession.Columns[5].Header := '??????';

  grdCarPossession.Columns[0].Alignment := taCenter;
  grdCarPossession.Columns[1].Alignment := taRightJustify;
  grdCarPossession.Columns[2].Alignment := taRightJustify;
  grdCarPossession.Columns[3].Alignment := taLeftJustify;
  grdCarPossession.Columns[4].Alignment := taLeftJustify;
  grdCarPossession.Columns[5].Alignment := taCenter;

  grdCarPossession.Fonts[1,1].Name := '???? ????';
  grdCarPossession.Fonts[1,1].Size := 10;

  grdCarPossession.ColWidths[0] := 50;
  for i := 0 to grdCarPossession.RowCount -1 do begin
    grdCarPossession.Cells[0,i+1] := IntToStr(i+1);
  end;

  for i := 0 to grdCarPossession.ColCount-1 do begin
    grdCarPossession.Columns[i].HeaderAlignment := taCenter;
    grdCarPossession.Columns[i].HeaderFont.Name := '???? ????';
    grdCarPossession.Columns[i].HeaderFont.Size := 10;
  end;

  grdCarPossession.AutoSize := True;

end;

end.
