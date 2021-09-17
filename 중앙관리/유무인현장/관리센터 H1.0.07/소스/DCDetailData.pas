unit DCDetailData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ComCtrls, StdCtrls, ExtCtrls, Grids, DB, ADODB,
  BaseGrid, AdvGrid, DBAdvGrid, AdvAppStyler, AdvToolBtn, AdvEdit,
  AdvDateTimePicker, AdvPanel, Buttons, tmsAdvGridExcel, AdvObj, AdvCombo;

type
  TfrmDCDetailData = class(TForm)
    Panel1: TPanel;
    dg1: TDBAdvGrid;
    Panel2: TPanel;
    btnSearch: TBitBtn;
    btnExcel: TBitBtn;
    btnClose: TBitBtn;
    edtTotal: TPanel;
    SaveDialog1: TSaveDialog;
    eDCDetail: TAdvGridExcelIO;
    qryDCDetail: TADOQuery;
    dsDCDetail: TDataSource;
    qryDCInfo: TADOQuery;
    qryManager: TADOQuery;
    qryManagerMNo: TSmallintField;
    qryManagerMName: TStringField;
    edtSDate: TAdvDateTimePicker;
    edtSTime: TAdvDateTimePicker;
    Label4: TLabel;
    edtEDate: TAdvDateTimePicker;
    edtETime: TAdvDateTimePicker;
    qryTemp: TADOQuery;
    sb1: TStatusBar;
    qryDCDetailUNITNAME: TStringField;
    qryDCDetailCarNo: TStringField;
    qryDCDetailInDate: TStringField;
    qryDCDetailInTime: TStringField;
    qryDCDetailProcDate: TStringField;
    qryDCDetailProcTime: TStringField;
    qryDCDetailDCNo: TWordField;
    qryDCDetailDCNAME: TStringField;
    qryDCDetailDCAMT: TIntegerField;
    edtCarNo: TAdvEdit;
    cmbDiscount: TAdvComboBox;
    pnImg: TPanel;
    imgIn: TImage;
    qryDCDetailimage: TStringField;
    qryDCDetailremark: TStringField;
    procedure FormShow(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure dg1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDCData: TfrmDCDetailData;

implementation
uses
  Tables, Global;

{$R *.dfm}

procedure TfrmDCDetailData.btnCloseClick(Sender: TObject);
begin
  qryTemp.Close;
  qryDCDetail.Close;
  Close;
end;

procedure TfrmDCDetailData.btnExcelClick(Sender: TObject);
begin
  try
    if savedialog1.Execute then
    begin
      eDCDetail.XLSExport(savedialog1.filename + '.xls');
      ShowMessage('엑셀파일로 저장완료!');
    end;
  except
    on E: Exception do ExceptLogging('TfrmDCDetailData.btnExcelClick: ' + E.Message);
  end;
end;

procedure TfrmDCDetailData.btnSearchClick(Sender: TObject);
var
  nSum : integer;
  sSDate, sEDate, sSTime, sETime: String;
begin
  try
    nSum := 0;

    sSDate:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
    sEDate:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
    sSTime:= FormatDateTime('HH:NN:SS', edtSTime.Time);
    sETime:= FormatDateTime('HH:NN:SS', edtETime.Time);

    with qryDCDetail do
    begin
      Close;
      Sql.Clear;
      SQL.Add(' select (select unitname from UnitInfo K where K.UnitNo= A.UnitNo) UNITNAME  ');
      SQL.Add(' , B.CarNo, B.InDate, B.InTime, B.ProcDate ,B.ProcTime   ');
      SQL.Add(' , A.DCNo, A.DCNAME, DCAMT, Image,Remark  ');
      SQL.Add(' from   ');
      SQL.Add(' (select UnitNo,TKNo,ProcDate,ProcTime,DCNo,Reserve5 DCNAME,sum(RealDCAmt) DCAMT, sum(CONVERT(int, Reserve6)) HUBULMONEY , max(Image) Image,max(Remark) Remark from   ');
      SQL.Add(' DCDetail ');
      SQL.Add(' group by UnitNo,TKNo,ProcDate,ProcTime,DCNo, Reserve5 ,DCSeq) A  left outer join   ');
      SQL.Add(' TKProc B ');
      SQL.Add(' on A.tkno =B.tkno and A.UnitNo = B.UnitNo and A.ProcDate =B.ProcDate and A.ProcTime=B.ProcTime ');
      SQL.Add(' where B.ProcDate+A.ProcTime between :pSDate and :pEDate  ');
      SQL.Add(' and CarNo like ' + MG_MakeStr('%' + Trim(edtCarNo.Text) + '%') );

      if cmbDiscount.ItemIndex > 0 then
        SQL.Add(' and DCNAME = ''' + cmbDiscount.Text + '''');

      SQL.Add(' order  by ProcDate,ProcTime,CarNo');

      Parameters.ParamByName('pSDate').Value:= sSDate + sSTime;
      Parameters.ParamByName('pEDate').Value:= sEDate + sETime;
      Open;

      if RecordCount > 0 then
        btnExcel.Enabled := True;
    end;

    // 합계
    with qryTemp do
    begin
      Close;
      Sql.Clear;
      SQL.Add(' select COUNT(*) cnt, SUM(dcamt) amt from ( ') ;
      SQL.Add(' select (select unitname from UnitInfo K where K.UnitNo= A.UnitNo) UNITNAME  ');
      SQL.Add(' , B.CarNo, B.InDate, B.InTime, B.ProcDate ,B.ProcTime   ');
      SQL.Add(' , A.DCNo, A.DCNAME, DCAMT   ');
      SQL.Add(' from   ');
      SQL.Add(' (select UnitNo,TKNo,ProcDate,ProcTime,DCNo,Reserve5 DCNAME,sum(RealDCAmt) DCAMT, sum(CONVERT(int, Reserve6)) HUBULMONEY from   ');
      SQL.Add(' DCDetail ');
      SQL.Add(' group by UnitNo,TKNo,ProcDate,ProcTime,DCNo, Reserve5 ,DCSeq) A  left outer join   ');
      SQL.Add(' TKProc B ');
      SQL.Add(' on A.tkno =B.tkno and A.UnitNo = B.UnitNo and A.ProcDate =B.ProcDate and A.ProcTime=B.ProcTime ');
      SQL.Add(' where B.ProcDate+A.ProcTime between :pSDate and :pEDate  ');
      SQL.Add(' and CarNo like ' + MG_MakeStr('%' + Trim(edtCarNo.Text) + '%') );

      if cmbDiscount.ItemIndex > 0 then
        SQL.Add(' and DCNAME = ''' + cmbDiscount.Text + '''');

      SQL.Add(' ) T ');

      Parameters.ParamByName('pSDate').Value:= sSDate + sSTime;
      Parameters.ParamByName('pEDate').Value:= sEDate + sETime;
      Open;

      if RecordCount > 0 then
      begin
        edtTotal.Caption :=  '총건수: ' + FormatFloat('#,##0', FieldByName('cnt').AsInteger) + '건, 총할인금액: ' + FormatFloat('#,##0', FieldByName('amt').AsInteger) + '원';
      end
      else
      begin
        edtTotal.Caption := '총건수: 0건, 총할인금액: 0원';
      end;
    end;
  except
    on E: Exception do ExceptLogging('TfrmDCDetailData.btnSearchClick: ' + E.Message);
  end;
end;

procedure TfrmDCDetailData.dg1Click(Sender: TObject);
var
  sFile, sTemp : String;
begin
  try
    with qryDCDetail do
    begin
      if RecordCount > 0 then
      begin
        sFile:= FieldByName('Image').AsString;

        try
          // sFile1에 http가 붙을때
          if Copy(sFile, 1, 4) = 'http' then
          begin
            ExceptLogging('파일 확인 File: ' + sFile);
            sTemp:= Copy(sFile, 6, Length(sFile)-5);
            sFile:= Copy(sTemp, 1, Pos(':9080', sTemp)-1);
            sFile:= sFile + Copy(sTemp, Pos(':9080', sTemp)+5, Length(sTemp)-(Pos(':9080', sTemp)+4));
            sFile:= MG_StrConvert(sFile, '/', '\');
            ExceptLogging('HTTP 형식 File: ' + sFile);
          end
          // \\172.16.83.1 형식으로 올때 데이터파싱하지않음.
          else
          begin
            sFile:= FieldByName('Image').AsString;

            ExceptLogging('IP 형식 File: ' + sFile);
          end;

          if FileExists(sFile) then
          begin
            imgIn.Picture.LoadFromFile(sFile);
          end
          else
          begin
            imgIn.Picture.Assign(Nil);
            ExceptLogging('File 없음: ' + sFile);
          end;
        except
          on E: Exception do ExceptLogging('TfrmDCDetailData_ImageLoad: ' + aString(E.Message));
        end;
      end;
    end;
  except
    on E: Exception do ExceptLogging('TfrmDCDetailData.dg1Click: ' + E.Message);
  end;
end;

procedure TfrmDCDetailData.FormShow(Sender: TObject);
begin
  edtSDate.Date:= Now;
  edtEDate.Date:= Now;
  edtSTime.Time:= StrToDateTime('00:00:00');
  edtETime.Time:= StrToDateTime('23:59:59');

  with qryDCInfo do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' select DCNo, DCName from DCInfo  order by dcno asc');
    open;

    if RecordCount > 0 then
    begin
      cmbDiscount.Items.Add('전체');

      while not Eof do
      begin
        cmbDiscount.Items.Add(FieldByName('DCName').AsString);

        next;
      end;

      cmbDiscount.ItemIndex := 0;
    end;
  end;
end;

end.
