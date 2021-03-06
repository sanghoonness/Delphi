unit VisitAmount;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.ComCtrls, AdvDateTimePicker, Vcl.Grids, Vcl.DBGrids, Data.DB,
  Data.Win.ADODB, ClipBrd, Comobj, BDE, Excel2000;
type
  TFrmVisitAmount = class(TForm)
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Bevel2: TBevel;
    Label4: TLabel;
    Label3: TLabel;
    Bevel3: TBevel;
    Label1: TLabel;
    Bevel1: TBevel;
    Bevel4: TBevel;
    Label2: TLabel;
    Label5: TLabel;
    edtSDate: TAdvDateTimePicker;
    edtEDate: TAdvDateTimePicker;
    edtCarNo: TEdit;
    btnSearch: TBitBtn;
    btnExcel: TBitBtn;
    btnClose: TBitBtn;
    edtDong: TEdit;
    edtHo: TEdit;
    BtnExcel2: TBitBtn;
    rbCarCount: TRadioGroup;
    DBGrid2: TDBGrid;
    qryVisitAmount: TADOQuery;
    dsVisitAmount: TDataSource;
    qryVisitAmountReserve2: TStringField;
    qryVisitAmountReserve3: TStringField;
    qryVisitAmountCountCar: TIntegerField;
    qryVisitAmountbilling_amount: TStringField;
    qryIONSubData: TADOQuery;
    qryIONSubDataProcDate: TStringField;
    qryIONSubDataProcTime: TStringField;
    qryIONSubDataInCarNo1: TStringField;
    qryIONSubDataOutDate: TStringField;
    qryIONSubDataOutTime: TStringField;
    qryIONSubDataOutCarNo1: TStringField;
    qryIONSubDataReserve1: TStringField;
    qryIONSubDataReserve2: TStringField;
    qryIONSubDataReserve3: TStringField;
    qryIONSubDataParkingMin: TStringField;
    dsIONSubData: TDataSource;
    DBGrid3: TDBGrid;
    Label6: TLabel;
    Label7: TLabel;
    qryVisitAmountprkMin: TStringField;
    qryCarPsn_1: TADOQuery;
    dsCarPsn_1: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);         //세대별 방문차량 청구금액
    procedure btnCloseClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure IONSubData(dong, ho, CarNo : string);    //세대별 방문차량 이력
    procedure CarPsn(dong, ho : string);
    procedure btnExcelClick(Sender: TObject);               //정기차량 차량대수
    procedure znSave_DBGridToExcel(vDBGrid, vDBGrid2, vDBGrid3: TDBGrid);//엑셀 변환
    //function SaveDBGridToexcel(DBGrid: TDBGrid): Boolean ;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmVisitAmount: TFrmVisitAmount;
  sSDate, sEDate : string;

implementation

uses
  Global, Tables;

{$R *.dfm}

procedure TFrmVisitAmount.btnCloseClick(Sender: TObject);
begin
   ModalResult := mrCancel;
end;

procedure TFrmVisitAmount.btnExcelClick(Sender: TObject);
begin
  znSave_DBGridToExcel(DBGrid1, DBGrid2, DBGrid3);
end;

procedure TFrmVisitAmount.btnSearchClick(Sender: TObject);
begin
    sSDate:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
    sEDate:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
    //21.05.17 서울숲리버뷰자이 방문차량 요금 청구 기능 추가
    with qryVisitAmount do
    begin
      Close;
      SQL.Clear;
      //SQL.Add('select a.Reserve2, a.Reserve3 , sum(ParkingMin) as prkMin,   ');
      SQL.Add('select a.Reserve2, a.Reserve3,   ');
      SQL.Add('Case when (ISNULL((parkingmin)/(24*60),0) > 0) and (ISNULL((parkingmin)%(24*60)/60,0) = 0) and (ISNULL(((parkingmin)%(24*60))%60,0) = 0) then ');
      SQL.Add('     CONVERT(VARCHAR(50),ISNULL((parkingmin)/(24*60),0)) +''일''         ');
      SQL.Add('     when ISNULL((parkingmin)/(24*60),0) > 0 then                        ');
      SQL.Add('		  CONVERT(VARCHAR(50),ISNULL((parkingmin)/(24*60),0)) +''일'' +         ');
      SQL.Add('		  CONVERT(VARCHAR(50),ISNULL(((parkingmin)%(24*60))/60,0)) +''시간''+   ');
      SQL.Add('		  CONVERT(VARCHAR(50),ISNULL(((parkingmin)%(24*60))%60,0)) +''분''      ');

      SQL.Add('     when  (ISNULL((parkingmin)%(24*60)/60,0) > 0) and (ISNULL(((parkingmin)%(24*60))%60,0) = 0) then ');
      SQL.Add('     CONVERT(VARCHAR(50),ISNULL(((parkingmin)%(24*60))/60,0)) +''시간''                                 ');
      SQL.Add('     when  ISNULL((parkingmin)%(24*60)/60,0) > 0 then                      ');
      SQL.Add('		  CONVERT(VARCHAR(50),ISNULL(((parkingmin)%(24*60))/60,0)) +''시간''+   ');
      SQL.Add('		  CONVERT(VARCHAR(50),ISNULL(((parkingmin)%(24*60))%60,0)) +''분''      ');

      SQL.Add('	when  ISNULL(((parkingmin)%(24*60))%60,0) > 0 then                      ');
      SQL.Add('	      CONVERT(VARCHAR(50),ISNULL(((parkingmin)%(24*60))%60,0)) +''분''  ');
      SQL.Add('END                                                                      ');
      SQL.Add(' as prkMin,                                                          ');

			SQL.Add(' Case When Count(b.CompName + b.deptName) = 2 then           ');
	    SQL.Add('      ''100000''                                             ');
		  SQL.Add('      When Count(b.CompName + b.deptName) = 3 then         ');
		  SQL.Add('      ''200000''                                           ');
		  SQL.Add('      When Count(b.CompName + b.deptName) >= 4 then        ');
		  SQL.Add('      ''300000''                                           ');
		  SQL.Add(' End as billing_amount,                                    ');
	    SQL.Add('      Count(b.CompName + b.deptName) as CountCar           ');
      SQL.Add('from IONData a left merge join CustInfo b  ON a.Reserve2 = b.CompName and  a.Reserve3 = b.DeptName ');
      SQL.Add('where procdate >= :N1 and procdate <= :N2 and a.Reserve2 > 0 and a.Reserve3 > 0  and ParkingMin > 0  ');
      Parameters.ParamByName('N1').Value:= sSDate;
      Parameters.ParamByName('N2').Value:= sEDate;

      if edtCarNo.Text <> '' then begin
        SQL.Add('And InCarNo1 like :N3 ');
        Parameters.ParamByName('N3').Value := '%'+Trim(edtCarNo.Text)+'%';
      end;
      if edtDong.Text <> '' then begin
        SQL.Add('And reserve2 = :N4 ');
        Parameters.ParamByName('N4').Value := Trim(edtDong.Text);
      end;
      if edtHo.Text <> '' then begin
        SQL.Add('And reserve3 = :N5 ');
        Parameters.ParamByName('N5').Value := Trim(edtHo.Text);
      end;

      SQL.Add('group by a.Reserve2, a.Reserve3, parkingmin ');
      SQL.Add('having SUM(ParkingMin) / 60 >= 100    ');
	    SQL.Add('order by a.Reserve2, a.Reserve3       ');

      ExceptLogging(SQL.Text);
      Open;

      if RecordCount > 0 then
      begin
        btnExcel.Enabled:= True;
        btnExcel2.Enabled:= True;
      end
      else
      begin
        btnExcel.Enabled:= False;
        btnExcel2.Enabled:= False;
      end;
    end;

    IONSubData(edtdong.Text, edtho.Text, edtCarNo.Text);
    CarPsn(edtdong.Text, edtho.Text);

end;

procedure TFrmVisitAmount.CarPsn(dong, ho : String);
begin
    qryCarPsn_1.Close;
    qryCarPsn_1.SQL.Clear;
    qryCarPsn_1.SQL.Add('SELECT distinct a.CompName, a.DeptName, a.TelNo, a.Carno, a.IssueDate  ');
    qryCarPsn_1.SQL.Add('from CustInfo a left merge join CustInfo b ON a.CompName = b.CompName and a.DeptName = b.DeptName ');
    //qryCarPsn.SQL.Add('where isnull(a.DeptName,'+QuotedStr('')+') <> '+QuotedStr('') +' ');

    if dong <> '' then begin
      qryCarPsn_1.SQL.Add('where a.CompName = :N1 ');
      qryCarPsn_1.Parameters.ParamByName('N1').Value := dong;
    end;
    if ho <> '' then begin
      qryCarPsn_1.SQL.Add(' And a.DeptName = :N2 ');
      qryCarPsn_1.Parameters.ParamByName('N2').Value := ho;
    end;

    qryCarPsn_1.SQL.Add(' group by a.CompName, a.DeptName, a.TelNo, a.Carno, a.IssueDate ');

    if dong = '' then begin
      if rbCarCount.ItemIndex = 0 then
      begin
        qryCarPsn_1.SQL.Add('HAVING count(*) = 2 ');
      end
      else if rbCarCount.ItemIndex = 1 then
      begin
        qryCarPsn_1.SQL.Add('HAVING count(*) = 3 ');
      end
      else if rbCarCount.ItemIndex = 2 then
      begin
        qryCarPsn_1.SQL.Add('HAVING count(*) >= 4 ');
      end;
    end;
    ExceptLogging(qryCarPsn_1.SQL.Text);
    qryCarPsn_1.Open;

end;

procedure TFrmVisitAmount.DBGrid1CellClick(Column: TColumn);
var
  dong, ho : string;
begin
    dong := DBGrid1.Fields[0].asString;
    ho   := DBGrid1.Fields[1].asString;
    IONSubData(dong, ho, '');
    CarPsn(dong, ho);
end;

procedure TFrmVisitAmount.FormShow(Sender: TObject);
begin
    edtSDate.Date := Now;
    edtEDate.Date := Now;
end;

procedure TFrmVisitAmount.IONSubData(dong, ho, CarNo: string);
begin
    with qryIONSubData do begin
      Close;
      SQL.Clear;
      SQL.Add('Select procdate, proctime, incarno1, outdate, outtime, OutCarNo1,        ');
      SQL.Add('Reserve1, Reserve2, Reserve3,                                            ');
      SQL.Add('Case when (ISNULL((parkingmin)/(24*60),0) > 0) and (ISNULL((parkingmin)%(24*60)/60,0) = 0) and (ISNULL(((parkingmin)%(24*60))%60,0) = 0) then ');
      SQL.Add('     CONVERT(VARCHAR(50),ISNULL((parkingmin)/(24*60),0)) +''일''         ');
      SQL.Add('     when ISNULL((parkingmin)/(24*60),0) > 0 then                        ');
      SQL.Add('		  CONVERT(VARCHAR(50),ISNULL((parkingmin)/(24*60),0)) +''일'' +         ');
      SQL.Add('		  CONVERT(VARCHAR(50),ISNULL(((parkingmin)%(24*60))/60,0)) +''시간''+   ');
      SQL.Add('		  CONVERT(VARCHAR(50),ISNULL(((parkingmin)%(24*60))%60,0)) +''분''      ');

      SQL.Add('     when  (ISNULL((parkingmin)%(24*60)/60,0) > 0) and (ISNULL(((parkingmin)%(24*60))%60,0) = 0) then ');
      SQL.Add('     CONVERT(VARCHAR(50),ISNULL(((parkingmin)%(24*60))/60,0)) +''시간''                                 ');
      SQL.Add('     when  ISNULL((parkingmin)%(24*60)/60,0) > 0 then                      ');
      SQL.Add('		  CONVERT(VARCHAR(50),ISNULL(((parkingmin)%(24*60))/60,0)) +''시간''+   ');
      SQL.Add('		  CONVERT(VARCHAR(50),ISNULL(((parkingmin)%(24*60))%60,0)) +''분''      ');

      SQL.Add('	when  ISNULL(((parkingmin)%(24*60))%60,0) > 0 then                      ');
      SQL.Add('	      CONVERT(VARCHAR(50),ISNULL(((parkingmin)%(24*60))%60,0)) +''분''  ');
      SQL.Add('END                                                                      ');
      SQL.Add(' as ParkingMin                                                           ');
      SQL.Add('From IONData                                                             ');
      SQL.Add('Where procdate >= :v3 and procdate <= :v4 and Reserve2 > 0 and Reserve3 > 0  and ParkingMin > 0 ');

      if dong <> '' then begin
        SQL.Add('And Reserve2 = :v5 ');
        Parameters.ParamByName('v5').Value := dong;
      end;

      if ho <> '' then begin
        SQL.Add('And Reserve3 = :v6 ');
        Parameters.ParamByName('v6').Value := ho;
      end;

      if CarNo <> '' then begin
        SQL.Add('And InCarNo1 like :v7 ');
        Parameters.ParamByName('v7').Value := '%'+CarNo+'%';
      end;

//      SQL.Add(' union ');
//      SQL.Add('Select ''합계'', '''', '''', '''', '''', '''',             ');
//      SQL.Add(' '''', '''', '''',                                         ');
//      SQL.Add('Case when ISNULL((SUM(parkingmin))/(24*60),0) > 0 then                        ');
//      SQL.Add('		  CONVERT(VARCHAR(50),ISNULL(SUM(parkingmin)/(24*60),0)) +''일'' +         ');
//      SQL.Add('		  CONVERT(VARCHAR(50),ISNULL((SUM(parkingmin)%(24*60))/60,0)) +''시간''+   ');
//      SQL.Add('		  CONVERT(VARCHAR(50),ISNULL((SUM(parkingmin)%(24*60))%60,0)) +''분''      ');
//      SQL.Add('    when  ISNULL((SUM(parkingmin))%(24*60)/60,0) > 0 then                     ');
//      SQL.Add('		  CONVERT(VARCHAR(50),ISNULL((SUM(parkingmin)%(24*60))/60,0)) +''시간''+   ');
//      SQL.Add('		  CONVERT(VARCHAR(50),ISNULL((SUM(parkingmin)%(24*60))%60,0)) +''분''      ');
//      SQL.Add('	when  ISNULL(((SUM(parkingmin))%(24*60))%60,0) > 0 then                      ');
//      SQL.Add('	      CONVERT(VARCHAR(50),ISNULL((SUM(parkingmin)%(24*60))%60,0)) +''분''    ');
//      SQL.Add(' END                                                                          ');
//      SQL.Add(' as ParkingMin,                                                               ');
//      SQL.Add(' Sum(UsedPoint) UsedPoint, SUM(DATEDIFF(dd, procdate, outdate)) as prkDate    ');
//      SQL.Add(' From IONData                                                                 ');
//      SQL.Add(' Where ProcDate + '' '' +ProcTime between :v7 and :v8 ');
//      if edtCarNo.Text <> '' then begin
//        SQL.Add('And InCarNo1 like :v6 ');
//        Parameters.ParamByName('v6').Value := '%'+Trim(edtCarNo.Text)+'%';
//      end;
      Parameters.ParamByName('v3').Value:= sSDate;
      Parameters.ParamByName('v4').Value:= sEDate;
      ExceptLogging(SQL.Text);
      Open;
    end;
end;

//function TFrmVisitAmount.SaveDBGridToexcel(dbgrd: TDBGrid): Boolean;
{
  SaveDBGridToexcel.
  Saves the data related to the database grid to an excel spreadsheet.
  Arguments: dbgrd - TDBGrid
}
//var
//  intRow, // index for query rows
//  intCol : Integer ; // index for query columns
//  excelApp, // excel application
//  WorkBook, // excel workbook
//  WorkSheet : Variant ; // excel sheet in workbook
//  qry : TQuery ; // Query related to dbgrd
//  BookMark : TBookMark ; // Bookmark for query
//  SaveDialog : TSaveDialog ;
//begin
//  // Initialize
//  excelApp := Unassigned ;
//  SaveDialog := nil ;
//  qry := nil ;
//  BookMark := nil ;
//  Result := False ;
//
//  try
//    // Dereference database grid to get datasource and supplying query
//    qry := TQuery(TDataSource(dbgrd.DataSource).DataSet) ;
//
//    // If the query is inactive or record count < 1 then outta here
//    if qry.Active = False then
//      exit ;
//    if qry.RecordCount < 1 then
//      exit ;
//
//    // Create save dialog and set it options
//    SaveDialog := TSaveDialog.Create(dbgrd.Parent) ;
//    with SaveDialog do
//    begin
//      DefaultExt := 'xls' ;
//      Filter := 'excel files (*.xls)|*.xls|All files (*.*)|*.*' ;
//      Options := [ofOverwritePrompt,ofPathMustExist,ofNoReadOnlyReturn,ofHideReadOnly] ;
//      Title := 'Specify excel file to which to save the grid information';
//    end ;
//
//    // Execute save dialog
//    if SaveDialog.Execute then
//    begin
//      SEIApp.SetBusy(True) ;
//
//      // Delete entered filename if it exists
//      If FileExists(SaveDialog.FileName) then
//        DeleteFile(SaveDialog.FileName) ;
//
//      // Create instance of excel
//      try
//        excelApp := CreateOLEObject('excel.Application') ;
//      except
//        MessageDLG('Unable to start excel',mtError,[mbOK],0) ;
//        Raise ;
//      end ;
//
//      {$IFDEF IAMDEBUGGING}
//      excelApp.Visible := True ;
//      {$ENDIF}
//
//      // Create excel workbook
//      excelApp.WorkBooks.Add ;
//
//      // Get the active workbook
//      WorkBook := excelApp.ActiveWorkBook ;
//
//      // Get the active sheet
//      WorkSheet := WorkBook.ActiveSheet ;
//
//      // Insert column headers into sheet
//      intRow := 1 ;
//      for intCol := 1 to qry.FieldCount do
//        WorkSheet.Cells[intRow,intCol].Value := qry.Fields[intCol-1].FieldName ;
//
//      // Disable controls attached to query
//      qry.DisableControls ;
//
//      // Save place in query
//      BookMark := qry.GetBookmark ;
//
//      // Position to first row
//      qry.First ;
//
//      // Insert data into sheet
//      while (not qry.EOF) do
//      begin
//        SEIApp.SetBusy(True) ;
//
//        inc(intRow) ;
//        for intCol := 1 to qry.FieldCount do
//        begin
//          WorkSheet.Cells[intRow,intCol].Value := qry.Fields[intCol-1].AsString ;
//        end ;
//
//        qry.Next ;
//      end ;
//
//      SEIApp.SetBusy(True) ;
//
//      // Restore position in query
//      qry.GotoBookmark(BookMark) ;
//
//      // Free bookmark
//      qry.FreeBookmark(BookMark) ;
//
//      // Enable controls attached to query
//      qry.EnableControls ;
//
//      // Save excel spreadsheet
//      WorkBook.SaveAs(SaveDialog.FileName) ;
//      WorkBook.Close ;
//
//      // Quit excel
//      excelApp.Quit ;
//
//      // Function result is OK
//      Result := True ;
//
//      // Status user
//      ShowMessage('Completed save to '+SaveDialog.FileName) ;
//    end ;
//
//    // Free save dialog
//    SaveDialog.Free ;
//
//    SEIApp.SetBusy(False) ;
//
//  except on E:Exception do // Exceptions
//    begin
//      // If excel was started, quit it.
//      if (excelApp <> Unassigned) then
//        excelApp.Quit ;
//
//      if SaveDialog <> nil then
//        SaveDialog.Free ;
//
//      // Restore position in query and enable controls
//      if BookMark <> nil then
//      begin
//        qry.GoToBookMark(BookMark) ;
//        qry.FreeBookMark(BookMark) ;
//        qry.EnableControls ;
//      end ;
//
//      SEIApp.SetBusy(False) ;
//
//      // Status user
//      MessageDLG('(SaveDBGridAsexcel) exception: '+E.Message, mtError,[mbOK],0) ;
//
//      // Reraise exception
//      raise;
//    end;
//  end; {try}
//end;


procedure TFrmVisitAmount.znSave_DBGridToExcel(vDBGrid, vDBGrid2, vDBGrid3: TDBGrid);
var
  excelApp, // excel application
  WorkBook, // excel workbook
  WorkSheet : Variant ; // excel sheet in workbook
  SaveDialog : TSaveDialog ;
  XL: Variant;
  i,k: integer;
  sData: string;
  Format : OleVariant;
begin
  // Initialize
  excelApp := Unassigned ;
  SaveDialog := nil ;

  try
    // Create save dialog and set it options
    SaveDialog := TSaveDialog.Create(vDBGrid.Parent) ;
    with SaveDialog do
    begin
      Title := '저장할 Excel 파일명을 입력하세요.';
      Filter := 'Excel files (*.xlsx)|*.xlsx';
      DefaultExt := 'xlsx';
      Options := [ofOverwritePrompt, ofPathMustExist, ofNoReadOnlyReturn, ofHideReadOnly];
    end;

    // Execute save dialog
    if SaveDialog.Execute then
    begin

      // Delete entered filename if it exists
      If FileExists(SaveDialog.FileName) then
        DeleteFile(SaveDialog.FileName) ;

      // Create instance of excel
      try
        excelApp := CreateOLEObject('excel.Application') ;
      except
        MessageDLG('엑셀프로그램 실행시 오류 발생',mtError,[mbOK],0) ;
        Raise ;
      end ;

      excelApp.Visible := false ;
      excelApp.WorkBooks.Add ;
      WorkBook := excelApp.ActiveWorkBook ;

      try
        sData := '';
        for i := 0 to vDBGrid.Columns.Count - 1 do
        begin

          sData := sData+vDBGrid.Columns[i].Title.Caption+#9;
          //if vDBGrid.Columns[i].Field.DataType in [ftString,ftMemo,ftWideString] then
          //begin
            excelApp.Workbooks[excelApp.Workbooks.Count].WorkSheets['Sheet1'].Columns[i+1].Select;
            excelApp.Selection.NumberFormatLocal := '@';
          //end;
        end;
        sData := sData+#$D#$A;

        with vDBGrid do
        begin
          k := 0;
          DataSource.DataSet.First;
          while not DataSource.DataSet.Eof do
          begin
            inc(k);
            for i := 0 to Columns.Count - 1 do
              sData := sData+Columns[i].Field.AsString+#9;
            sData := sData+#$D#$A;
            DataSource.DataSet.Next;
          end;
        end;

        for i := 0 to vDBGrid2.Columns.Count - 1 do
        begin
          sData := sData+vDBGrid2.Columns[i].Title.Caption+#9;
          excelApp.Workbooks[excelApp.Workbooks.Count].WorkSheets['Sheet1'].Columns[i+1].Select;
          excelApp.Selection.NumberFormatLocal := '@';
        end;
        sData := sData+#$D#$A;

        with vDBGrid2 do
        begin
          k := 0;
          DataSource.DataSet.First;
          while not DataSource.DataSet.Eof do
          begin
            inc(k);
            for i := 0 to Columns.Count - 1 do
              sData := sData+Columns[i].Field.AsString+#9;
            sData := sData+#$D#$A;
            DataSource.DataSet.Next;
          end;
        end;

        for i := 0 to vDBGrid3.Columns.Count - 1 do
        begin
          sData := sData+vDBGrid3.Columns[i].Title.Caption+#9;
          excelApp.Workbooks[excelApp.Workbooks.Count].WorkSheets['Sheet1'].Columns[i+1].Select;
          excelApp.Selection.NumberFormatLocal := '@';
        end;
        sData := sData+#$D#$A;

        with vDBGrid3 do
        begin
          k := 0;
          DataSource.DataSet.First;
          while not DataSource.DataSet.Eof do
          begin
            inc(k);
            for i := 0 to Columns.Count - 1 do
              sData := sData+Columns[i].Field.AsString+#9;
            sData := sData+#$D#$A;
            DataSource.DataSet.Next;
          end;
        end;

        Clipboard.SetTextBuf(PChar(sData));
        excelApp.Cells[1,1].Pastespecial;
        excelApp.Selection.Columns.AutoFit;
        excelApp.Range['A1', 'A1'].select;

        vDBGrid.DataSource.DataSet.First;
        vDBGrid2.DataSource.DataSet.First;
        vDBGrid3.DataSource.DataSet.First;

      except on E: Exception do
        begin
          ShowMessage('Excel로 자료를 보내는 중 오류가 발생했습니다.'+E.Message);
          Exit;
        end;
      end;

      // Save excel spreadsheet
      WorkBook.SaveAs(SaveDialog.FileName) ;
      WorkBook.Close ;  // excel 메모리 해제

      // Status user
      ShowMessage('엑셀파일을 정상적으로 저장 하였습니다. '+SaveDialog.FileName) ;
    end;
    // 저장파일 실행
    //ShellExecute(Handle, PChar('OPEN'), PChar(SaveDialog.FileName), Nil, Nil, SW_SHOWMAXIMIZED);
    // Free save dialog
    SaveDialog.Free;

  except on E:Exception do // Exceptions
    begin
      // If excel was started, quit it.
      if (excelApp <> Unassigned) then
        excelApp.Quit ;

      if SaveDialog <> nil then
        SaveDialog.Free ;

      // Status user
      MessageDLG('엑셀저장시 오류 발생: '+E.Message, mtError,[mbOK],0) ;

      // Reraise exception
      raise;
    end;
  end; {try}
end;

end.
