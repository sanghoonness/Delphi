unit ReceiptPrt;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvToolBtn, Vcl.StdCtrls, Vcl.ComCtrls, AdvDateTimePicker, AdvEdit,
  Vcl.ExtCtrls, Vcl.Grids, AdvObj, BaseGrid, AdvGrid, Data.DB, Data.Win.ADODB;

type
  TfrmReceiptPrt = class(TForm)
    qryTKProc: TADOQuery;
    sgData: TAdvStringGrid;
    Panel1: TPanel;
    edtCarNo: TAdvEdit;
    edtSDate: TAdvDateTimePicker;
    edtEDate: TAdvDateTimePicker;
    Label4: TLabel;
    btnSearch: TAdvToolButton;
    btnPrint: TAdvToolButton;
    btnClose: TAdvToolButton;
    procedure btnSearchClick(Sender: TObject);
    procedure sgDataClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure FormShow(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReceiptPrt: TfrmReceiptPrt;
  nSelRow: Integer;

implementation
uses
  Global, Tables;

{$R *.dfm}

procedure TfrmReceiptPrt.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmReceiptPrt.btnPrintClick(Sender: TObject);
begin
  // 영수증인쇄...
  sReceiptPrt := '';
  sReceiptPrt := '========================================' + LF + LF + LF + CR + SO_WTP;
  sReceiptPrt := sReceiptPrt + '    영   수   증' + LF + LF + LF + CR + SI_WTP;

  if Length(sParkName) > 29 then
  begin
    sReceiptPrt := sReceiptPrt + '주차장명 : ' + Copy(sParkName, 1, 29) + LF + CR;

    if Length(sParkName) < 58 then
      sReceiptPrt := sReceiptPrt + '           ' + Copy(sParkName, 30, Length(sParkName) - 29) + LF + CR
    else
    begin
      if Length(sParkName) < 87 then
      begin
        sReceiptPrt := sReceiptPrt + '           ' + Copy(sParkName, 30, 29) + LF + CR;
        sReceiptPrt := sReceiptPrt + '           ' + Copy(sParkName, 60, Length(sParkName) - 58) + LF + CR;
      end
      else
      begin
        sReceiptPrt := sReceiptPrt + '           ' + Copy(sParkName, 30, 29) + LF + CR;
        sReceiptPrt := sReceiptPrt + '           ' + Copy(sParkName, 59, 29) + LF + CR;
        sReceiptPrt := sReceiptPrt + '           ' + Copy(sParkName, 88, Length(sParkName) - 87) + LF + CR;
      end;
    end;
  end
  else
    sReceiptPrt := sReceiptPrt + '주차장명 : ' + sParkName + LF + CR;

  if Length(sParkAddr) > 29 then
  begin
    sReceiptPrt := sReceiptPrt + ' 주   소 : ' + Copy(sParkAddr, 1, 29) + LF + CR;

    if Length(sParkAddr) < 58 then
      sReceiptPrt := sReceiptPrt + '           ' + Copy(sParkAddr, 30, Length(sParkAddr) - 29) + LF + CR
    else
    begin
      if Length(sParkAddr) < 87 then
      begin
        sReceiptPrt := sReceiptPrt + '           ' + Copy(sParkAddr, 30, 29) + LF + CR;
        sReceiptPrt := sReceiptPrt + '           ' + Copy(sParkAddr, 60, Length(sParkAddr) - 58) + LF + CR;
      end
      else
      begin
        sReceiptPrt := sReceiptPrt + '           ' + Copy(sParkAddr, 30, 29) + LF + CR;
        sReceiptPrt := sReceiptPrt + '           ' + Copy(sParkAddr, 59, 29) + LF + CR;
        sReceiptPrt := sReceiptPrt + '           ' + Copy(sParkAddr, 88, Length(sParkAddr) - 87) + LF + CR;
      end;
    end;
  end
  else
    sReceiptPrt := sReceiptPrt + ' 주   소 : ' + sParkAddr + LF + CR;

  sReceiptPrt := sReceiptPrt + '등록번호 : ' + sRegNo + LF + CR;

  if Length(sAdmin) > 29 then
  begin
    sReceiptPrt := sReceiptPrt + '대표자명 : ' + Copy(sAdmin, 1, 29) + LF + CR;
    sReceiptPrt := sReceiptPrt + '           ' + Copy(sAdmin, 30, Length(sAdmin) - 29) + LF + CR;
  end
  else
    sReceiptPrt := sReceiptPrt + '대표자명 : ' + sAdmin + LF + CR;

  sReceiptPrt := sReceiptPrt + '전화번호 : ' + sTelephone + LF + CR;
  sReceiptPrt := sReceiptPrt + '입차일시 : ' +
                 sgData.Cells[4, nSelRow] + ' ' + sgData.Cells[5, nSelRow] + LF + CR;
  sReceiptPrt := sReceiptPrt + '출차일시 : ' +
                 sgData.Cells[1, nSelRow] + ' ' + sgData.Cells[2, nSelRow] + LF + CR;
  sReceiptPrt := sReceiptPrt + '주차시간 : ' +
                 FormatFloat('#,##0', StrToInt(sgData.Cells[6, nSelRow])) + '분' + LF + CR;
  sReceiptPrt := sReceiptPrt + '근 무 자 : ' + sgData.Cells[10, nSelRow] + LF + CR;
  sReceiptPrt := sReceiptPrt + '차량번호 : ' + sgData.Cells[3, nSelRow] + LF + CR;

  if StrToInt(sgData.Cells[8, nSelRow]) > 0 then
  begin
    sReceiptPrt := sReceiptPrt + '전체요금 : ' +
                   FormatFloat('#,##0', StrToInt(sgData.Cells[7, nSelRow])) + '원' + LF + CR;
    sReceiptPrt := sReceiptPrt + '할인금액 : ' +
                   FormatFloat('#,##0', StrToInt(sgData.Cells[8, nSelRow])) + '원' + LF + CR;
    sReceiptPrt := sReceiptPrt + '할인내용 : ' + sgData.Cells[11, nSelRow] + LF + CR;
    sReceiptPrt := sReceiptPrt + '받은금액 : ' +
                   FormatFloat('#,##0', StrToInt(sgData.Cells[9, nSelRow])) + '원' + LF + LF + LF + CR;
  end
  else
    sReceiptPrt := sReceiptPrt + '주차요금 : ' +
                   FormatFloat('#,##0', StrToInt(sgData.Cells[9, nSelRow])) + '원' + LF + LF + LF + CR;

  if Length(sReceipt) > 40 then
  begin
    sReceiptPrt := sReceiptPrt + Copy(sReceipt, 1, 40) + LF + CR;

    if Length(sReceipt) < 80 then
      sReceiptPrt := sReceiptPrt + Copy(sReceipt, 41, Length(sReceipt) - 40) + LF + LF + LF + LF + LF + LF + LF + LF
    else
    begin
      sReceiptPrt := sReceiptPrt + Copy(sReceipt, 41, 40) + LF + CR;
      sReceiptPrt := sReceiptPrt + Copy(sReceipt, 81, Length(sReceipt) - 80) + LF + LF + LF + LF + LF + LF + LF + LF;
    end;
  end
  else
    sReceiptPrt := sReceiptPrt + sReceipt + LF + LF + LF + LF + LF + LF + LF + LF;

  sReceiptPrt := sReceiptPrt + FullCut_WTP;
  Close;
end;

procedure TfrmReceiptPrt.btnSearchClick(Sender: TObject);
var
  sCarNo: aString;
  sSDate, sEDate, sSTime, sETime, sQuery: String;
  nPayType: Byte;
  i, j: Integer;
begin
  try
    sCarNo:= MG_StrTrim(edtCarNo.Text, ' ');

    if Length(sCarNo) < 7 then
    begin
      ShowMessage('영수증 재발급할 차량번호를 입력하여주세요!');
      edtCarNo.SetFocus;
      Exit;
    end;

    sgData.RowCount:= 2;

    for i:= 0 to 20 do
      sgData.Cells[i, 1]:= '';

    sSDate:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
    sEDate:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
    sSTime:= '00:00:00';
    sETime:= '23:59:59';
    sQuery:= 'SELECT  A.ProcDate                                     ' +
             '      , A.ProcTime                                     ' +
             '      , A.CarNo                                        ' +
             '      , A.InDate                                       ' +
             '      , A.InTime                                       ' +
             '      , A.ParkingMin                                   ' +
             '      , A.TotFee                                       ' +
             '      , A.TotDC                                        ' +
             '      , A.RealFee                                      ' +
             '      , A.MName                                        ' +
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
             '              ,a.Unpaid                                ' +
             '              ,a.MNo                                   ' +
             '              ,c.MName                                 ' +
             '              ,a.DCCnt                                 ' +
             '              ,a.TKNo                                  ' +
             '              ,Case a.PayType When 1 Then ''' + '현금' + ''' ' +
             '                              When 2 Then ''' + '신용카드' + ''' ' +
             '               End PayType                             ' +
             '          FROM TKProc a Left Outer Join UnitInfo b     ' +
             '                        ON a.TKUnitNo   = b.UnitNo     ' +
             '                        Left Outer Join Manager C      ' +
             '                        ON a.MNo      = C.MNo          ' +
             '                        Left Outer Join FeeItem D      ' +
             '                        ON a.FeeNo    = D.FeeNo        ' +
             '         WHERE a.ProcDate + a.ProcTime between         ' +
                             quotedstr(sSDate+sSTime) + ' and ' +
                             quotedstr(sEDate+sETime) +
             ' and CarNo = ' + quotedstr(edtCarNo.Text) + ' ';


    sQuery:= sQuery +
             '        )A  Left Outer Join                            ' +
             '       (SELECT A.ParkNo                                ' +
             '              ,A.UnitNo                                ' +
             '              ,A.ProcDate                              ' +
             '              ,A.ProcTime                              ' +
             '              ,A.DcNo                                  ' +
             '              ,A.TKNo                                  ' +
             '              ,Case A.DCNo when 0 then ''' + '할인권할인' + ''' ' +
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
      Open;

      if RecordCount > 0 then
      begin
        j:= 1;
        sgData.Cells[0, 1]:= '1';
        sgData.Alignments[0, 1]:= taRightJustify;

        for i := 1 to sgData.ColCount-1 do
          sgData.Cells[i, 1]:= Fields[i-1].asString;

        if RecordCount > 1 then
        begin
          Next;

          while not Eof do
          begin
            Inc(j);
            sgData.InsertRows(1, 1, True);
            sgData.Cells[0, 1]:= FormatFloat('#,##0', j);
            sgData.Alignments[0, 1]:= taRightJustify;

            for i := 1 to sgData.ColCount-1 do
              sgData.Cells[i, 1]:= Fields[i-1].asString;

            Next;
          end;
        end;
      end
      else
      begin
        btnPrint.Enabled:= False;
        ShowMessage('해당 차량의 정산자료가 없습니다.');
      end;
    end;
  except
    on E: Exception do ExceptLogging('ReceiptPrt: ' + aString(E.Message));
  end;
end;

procedure TfrmReceiptPrt.FormShow(Sender: TObject);
var
  i: Integer;
begin
  edtSDate.Date:= StrToDate(MG_AddDate(FormatDateTime('YYYY-MM-DD', Now), -30));
  edtEDate.Date:= Now;

  for i := 1 to sgData.ColCount-1 do
    sgData.Alignments[i, 0]:= taCenter;
end;

procedure TfrmReceiptPrt.sgDataClickCell(Sender: TObject; ARow, ACol: Integer);
begin
  if qryTKProc.RecordCount > 0 then
  begin
    nSelRow:= ARow;
    btnPrint.Enabled:= True;
  end;
end;

end.
