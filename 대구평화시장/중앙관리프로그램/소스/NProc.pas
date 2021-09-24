unit NProc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ComCtrls, StdCtrls, ExtCtrls, Grids, DB, ADODB,
  BaseGrid, AdvGrid, DBAdvGrid, AdvAppStyler, AdvToolBtn, AdvEdit,
  AdvDateTimePicker, AdvPanel, Buttons, tmsAdvGridExcel, AdvObj;

type
  TfrmNProc = class(TForm)
    qryTemp: TADOQuery;
    qryTKProc: TADOQuery;
    dsTKProc: TDataSource;
    DBAdvGrid1: TDBAdvGrid;
    sb1: TStatusBar;
    btnSearch: TBitBtn;
    btnPrint: TBitBtn;
    btnClose: TBitBtn;
    Panel1: TPanel;
    Bevel2: TBevel;
    Label7: TLabel;
    Label8: TLabel;
    edtSDate: TAdvDateTimePicker;
    edtSTime: TAdvDateTimePicker;
    edtEDate: TAdvDateTimePicker;
    edtETime: TAdvDateTimePicker;
    Panel2: TPanel;
    Bevel3: TBevel;
    Label1: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    Bevel4: TBevel;
    Label3: TLabel;
    Bevel5: TBevel;
    Label9: TLabel;
    edtTotMin: TAdvEdit;
    edtTotFee: TAdvEdit;
    edtTotDC: TAdvEdit;
    edtTotRealFee: TAdvEdit;
    btnExcel: TBitBtn;
    SaveDialog1: TSaveDialog;
    AdvGridExcelIO1: TAdvGridExcelIO;
    Bevel6: TBevel;
    Label4: TLabel;
    cmbPayType: TComboBox;
    qryTKProcProcDate: TStringField;
    qryTKProcProcTime: TStringField;
    qryTKProcFeeName: TStringField;
    qryTKProcTkType: TStringField;
    qryTKProcCarNo: TStringField;
    qryTKProcUnitName: TStringField;
    qryTKProcInDate: TStringField;
    qryTKProcInTime: TStringField;
    qryTKProcParkingMin: TIntegerField;
    qryTKProcTotFee: TIntegerField;
    qryTKProcTotDC: TIntegerField;
    qryTKProcRealFee: TIntegerField;
    qryTKProcRecvAmt: TIntegerField;
    qryTKProcChange: TIntegerField;
    qryTKProcMName: TStringField;
    qryTKProcPayType: TStringField;
    qryTKProcDCNAME: TStringField;
    qryTKProcDCCnt: TIntegerField;
    qryTKProcRealDCAmt: TIntegerField;
    Bevel7: TBevel;
    Label5: TLabel;
    cmbDCType: TComboBox;
    Bevel8: TBevel;
    Label6: TLabel;
    cmbOutChk: TComboBox;
    qryTKProcreserve2: TStringField;
    qryTKProcUnitNo: TSmallintField;
    qryTKProcInUnitName: TStringField;
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
  frmNProc: TfrmNProc;

implementation
uses
  Tables, Global;

{$R *.dfm}

procedure TfrmNProc.FormShow(Sender: TObject);
begin
  try
    edtSDate.Date:= Now;
    edtEDate.Date:= Now;
    edtSDate.SetFocus;
  except
    on E: Exception do ExceptLogging('TfrmNProc.FormCreate: ' + E.Message);
  end;
end;

procedure TfrmNProc.btnSearchClick(Sender: TObject);
var
  sSDate, sEDate, sSTime, sETime, sQuery, sTemp: String;
  nPayType, nOutChk: Byte;
begin
  try
    sSDate:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
    sEDate:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
    sSTime:= FormatDateTime('HH:NN:SS', edtSTime.Time);
    sETime:= FormatDateTime('HH:NN:SS', edtETime.Time);
    nPayType:= cmbPayType.ItemIndex;
    nOutChk := cmbOutChk.ItemIndex;

    sQuery:= 'SELECT a.UnitNo, A.ProcDate                                     ' +
             '      , A.ProcTime                                     ' +
             '      , A.FeeName                                      ' +
             '      , A.TkType                                       ' +
             '      , A.CarNo                                        ' +
             '      , A.UnitName                                     ' +
             '      , A.InDate                                       ' +
             '      , A.InTime                                       ' +
             '      , A.ParkingMin                                   ' +
             '      , A.TotFee                                       ' +
             '      , A.TotDC                                        ' +
             '      , A.RealFee                                      ' +
             '      , A.RecvAmt                                      ' +
             '      , A.Change                                       ' +
             '      , A.MName                                        ' +
             '      , A.reserve2                                     ' +
             '      , A.PayType                                      ' +
             '      , B.DCNAME, B.DCCnt, B.RealDCAmt                 ' +
             '  FROM (SELECT a.ParkNo                                ' +
             '              ,a.UnitNo                                ' +
             '              ,a.ProcDate                              ' +
             '              ,a.ProcTime                              ' +
             '              ,a.FeeNo                                 ' +
             '              ,Case a.FeeNo when 0 then ''' + '일반요금' + ''' ' +
             '               else d.FeeName                          ' +
             '               end FeeName                             ' +
             '              ,Case a.TKType When 1 Then ''' + '일반차량' + ''' ' +
             '                             When 2 Then ''' + '정기차량' + ''' ' +
             '                             When 9 Then ''' + '수동출차' + ''' ' +
             '               END TKType                              ' +
             '              ,a.CarNo                                 ' +
             '              ,a.TKUnitNo                              ' +
             '              ,b.UnitName                              ' +
             '              ,a.InDate                                ' +
             '              ,a.InTime                                ' +
             '              ,a.ParkingMin                            ' +
             '              ,a.TotFee                                ' +
             '              ,a.TotDC                                 ' +
             '              ,a.RealFee                               ' +
             '              ,a.RecvAmt                               ' +
             '              ,a.Change                                ' +
             '              ,a.MNo                                   ' +
             '              ,c.MName                                 ' +
             '              ,a.DCCnt                                 ' +
             '              ,a.TKNo                                  ' +
             '              ,a.reserve2                              ' +
             '              ,Case a.PayType When 1 Then ''' + '현금' + ''' ' +
             '                            When 2 Then ''' + '신용카드' + ''' ' +
             '               End PayType                             ' +
             '          FROM TKProc a Left Outer Join UnitInfo b     ' +
             '                        ON a.TKUnitNo   = b.UnitNo     ' +
             '                        Left Outer Join Manager C      ' +
             '                        ON a.MNo      = C.MNo          ' +
             '                        Left Outer Join FeeItem D      ' +
             '                        ON a.FeeNo    = D.FeeNo        ' +
             '         WHERE a.ProcDate + a.ProcTime between         ' +
                             quotedstr(sSDate+sSTime) + ' and ' +
                             quotedstr(sEDate+sETime);

    if nPayType <> 0 then
      sQuery:= sQuery + ' and a.PayType = :N1 ';


    sTemp := '사전정산';

    if nOutChk = 1 then
    begin
      sQuery:= sQuery + ' and a.reserve2 = :pReserve2 ';
    end
    else if nOutChk = 2 then
    begin
      sQuery:= sQuery + ' and (a.reserve2 <> :pReserve2 or a.reserve2 is null) ';
    end;

    sQuery:= sQuery +
             '        )A  Left Outer Join                            ' +
             '       (SELECT A.ParkNo                                ' +
             '              ,A.UnitNo                                ' +
             '              ,A.ProcDate                              ' +
             '              ,A.ProcTime                              ' +
             '              ,A.DcNo                                  ' +
             '              ,A.TKNo                                  ' +
             '              ,Case A.DCNo when 0 then ''' + '할인권할인' + ''' ' +
             '                           when 98 then ''' + '본사공통할인' + ''' ' +
             '                           when 99 then ''' + 'POS할인' + ''' ' +
             '               else B.DCNAME                           ' +
             '               end DCName                              ' +
             '              ,Sum(DCAmt) DCAmt                        ' +
             '              ,Sum(RealDCAmt) RealDCAmt                ' +
             '              ,Count(*) DCCnt                          ' +
             '          FROM DCDetail A Left Outer Join DCInfo B     ' +
             '                          ON A.DcNo = B.DCNo           ' +
             '         WHERE a.ProcDate + a.ProcTime between         ' +
                             quotedstr(sSDate+sSTime) + ' and ' +
                             quotedstr(sEDate+sETime) +
             '         GROUP BY A.ParkNo,                            ' +
             '                  A.UnitNo,                            ' +
             '                  A.ProcDate,                          ' +
             '                  A.ProcTime,                          ' +
             '                  A.DcNo,                              ' +
             '                  A.TKNo,                              ' +
             '                  B.DCNAME                             ' +
             '         ) B                                           ' +
             '          ON a.ParkNo   = b.ParkNo                     ' +
             '         AND a.UnitNo   = b.UnitNo                     ' +
             '         AND a.ProcDate = b.ProcDate                   ' +
             '         AND a.ProcTime = b.ProcTime                   ' +
             '         AND a.TKNo     = b.TKNo                       ';

    with qryTKProc do
    begin
      Close;
      SQL.Clear;
      SQL.Add(sQuery);

      case cmbDCType.ItemIndex of
        1: begin
             SQL.Add(' where DCName = :N2 ');
             Parameters.ParamByName('N2').Value:= '본사공통할인';
        end;

        2: begin
             SQL.Add(' where DCName = :N2 ');
             Parameters.ParamByName('N2').Value:= 'POS할인';
        end;

        3: begin
             SQL.Add(' where (DCName <> :N2) and (DCName <> :N3) ');
             Parameters.ParamByName('N2').Value:= 'POS할인';
             Parameters.ParamByName('N3').Value:= '본사공통할인';
        end;
      end;

      if nPayType <> 0 then
        Parameters.ParamByName('N1').Value:= nPayType;
      if nOutChk <> 0 then
        Parameters.ParamByName('pReserve2').Value := sTemp;

      ExceptLogging(sql.Text);
      Open;

      // 하단 총 합계..
      if RecordCount > 0 then
      begin
        with qryTemp do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Select Sum(ParkingMin), Sum(TotFee), Sum(TotDC), Sum(RealFee) from TKProc ');
          SQL.Add('where (ProcDate + ProcTime) between :N1 and :N2');

          if nPayType <> 0 then
          begin
            SQL.Add('and PayType = :N3');
            Parameters.ParamByName('N3').Value:= nPayType;
          end;

          if nOutChk = 1 then
            SQL.Add('and reserve2 = :pReserve2')
          else if nOutChk = 2 then
            SQL.Add('and (reserve2 <> :pReserve2 or reserve2 is null)');

          Parameters.ParamByName('N1').Value:= sSDate + sSTime;
          Parameters.ParamByName('N2').Value:= sEDate + sETime;

          if nOutChk <> 0 then
            Parameters.ParamByName('pReserve2').Value := sTemp;

          Open;
          edtTotMin    .Text:= FieldByName('COLUMN1').AsString;
          edtTotFee    .Text:= FieldByName('COLUMN2').AsString;
          edtTotDC     .Text:= FieldByName('COLUMN3').AsString;
          edtTotRealFee.Text:= FieldByName('COLUMN4').AsString;
          edtTotMin    .AutoThousandSeparator:= True;
          edtTotFee    .AutoThousandSeparator:= True;
          edtTotDC     .AutoThousandSeparator:= True;
          edtTotRealFee.AutoThousandSeparator:= True;
        end;
        btnPrint.Enabled:= True;
        btnExcel.Enabled:= True;
        sb1.SimpleText:= '조회건수 : ' + IntToStr(RecordCount);
      end
      else
      begin
        btnPrint.Enabled:= False;
        btnExcel.Enabled:= False;
        edtTotMin.Text:= '0';
        edtTotFee.Text:= '0';
        edtTotDC.Text:= '0';
        edtTotRealFee.Text:= '0';
        sb1.SimpleText:= '';
      end;
    end;
  except
    on E: Exception do ExceptLogging('TfrmNProc.btnSearchClick: ' + E.Message);
  end;
end;

procedure TfrmNProc.btnCloseClick(Sender: TObject);
begin
  qryTKProc.Close;
  Close;
end;

procedure TfrmNProc.btnExcelClick(Sender: TObject);
begin
  try
    if savedialog1.Execute then
    begin
      advgridexcelio1.XLSExport(savedialog1.filename + '.xls');
      ShowMessage('엑셀파일로 저장완료!');
    end;
  except
    on E: Exception do ExceptLogging('TfrmNProc.btnExcelClick: ' + E.Message);
  end;
end;

end.
