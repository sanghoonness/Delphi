unit IOVisitStat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ComCtrls, StdCtrls, Grids, ExtCtrls, DB, ADODB,
  AdvDateTimePicker, AdvPanel, BaseGrid, AdvGrid, DBAdvGrid, AdvToolBtn,
  AdvAppStyler, Buttons, tmsAdvGridExcel, AdvObj, sButton, sLabel, sPanel, CodeSiteLogging,
  Comobj, AdvProgr, Vcl.DBGrids, ClipBrd;

type
  TfrmIOVisitStat = class(TForm)
    Panel1: TPanel;
    dg1: TDBAdvGrid;
    Panel2: TPanel;
    Bevel2: TBevel;
    edtSDate: TAdvDateTimePicker;
    edtEDate: TAdvDateTimePicker;
    Label4: TLabel;
    Label3: TLabel;
    Bevel3: TBevel;
    edtCarNo: TEdit;
    Label1: TLabel;
    btnSearch: TBitBtn;
    btnExcel: TBitBtn;
    btnClose: TBitBtn;
    Bevel1: TBevel;
    Bevel4: TBevel;
    edtDong: TEdit;
    edtHo: TEdit;
    Label2: TLabel;
    Label5: TLabel;
    qryIONData: TADOQuery;
    dsIONData: TDataSource;
    Panel3: TPanel;
    dg2: TDBAdvGrid;
    Panel4: TPanel;
    btnClose1: TBitBtn;
    btnExcel1: TBitBtn;
    SaveDialog1: TSaveDialog;
    AdvGridExcelIO1: TAdvGridExcelIO;
    qryIONSubData: TADOQuery;
    dsIONSubData: TDataSource;
    qryIONSubDataProcDate: TStringField;
    qryIONSubDataProcTime: TStringField;
    qryIONSubDataInCarNo1: TStringField;
    qryIONSubDataOutDate: TStringField;
    qryIONSubDataOutTime: TStringField;
    qryIONSubDataOutCarNo1: TStringField;
    qryIONSubDataReserve1: TStringField;
    qryIONSubDataReserve2: TStringField;
    qryIONSubDataReserve3: TStringField;
    pnProgress: TPanel;
    lbProgress: TLabel;
    ap1: TAdvProgress;
    ADOQuery1: TADOQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    IntegerField1: TIntegerField;
    ADOQuery2: TADOQuery;
    BtnExcel2: TBitBtn;
    qryIONSubDataUsedPoint: TIntegerField;
    rbHomenetPoint: TRadioGroup;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Label6: TLabel;
    Bevel5: TBevel;
    cmbType: TComboBox;
    qryIONSubDataprkDate: TIntegerField;
    qryIONSubDataParkingMin: TStringField;
    edtSTime: TAdvDateTimePicker;
    edtETime: TAdvDateTimePicker;
    procedure btnSearchClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure dg1Click(Sender: TObject);
    procedure btnExcel1Click(Sender: TObject);
    procedure BtnExcel2Click(Sender: TObject);
    procedure IOVvisitStat();
    procedure znSave_DBGridToExcel(vDBGrid: TDBGrid);//엑셀 변환
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIOVisitStat: TfrmIOVisitStat;

implementation
uses
  Global;

{$R *.dfm}

procedure TfrmIOVisitStat.btnCloseClick(Sender: TObject);
begin
  qryIONData.Close;
  ModalResult := mrCancel;
  //Close;
end;

procedure TfrmIOVisitStat.btnExcel1Click(Sender: TObject);
begin
   //mzExcelExport(dg2,10);
   {if homenetuse = 0 then  //홈넷 포인트 사용 안할시
   begin
      mzExcelExport(dg2,10);
   end
   else
   begin
      mzExcelExport(dg2,11);
   end;}
   DataCount := 1;
   znSave_DBGridToExcel(DBGrid2);
end;
//begin
//  try
//    SaveDialog1 := True;
//    if savedialog1.Execute then
//    begin
//      dg1.PageMode := false;      //빨라짐
//      advgridexcelio1.XLSExport(savedialog1.filename + '.xls');
//      ShowMessage('엑셀파일로 저장완료!');
//    end;
//    SaveDialog1 := False;
//  except
//    on E: Exception do ExceptLogging('TfrmIONData.btnExcelClick: ' + E.Message);
//  end;
//
//  //znSave_DBGridToExcel(dg1);
//end;

procedure TfrmIOVisitStat.BtnExcel2Click(Sender: TObject);
begin
    //mzExcelExport(dg1,4);
    DataCount := 0;
    znSave_DBGridToExcel(DBGrid1);
end;

procedure TfrmIOVisitStat.btnExcelClick(Sender: TObject);
var
  k:Integer;
  xl,xlbook:variant;
  si,li_cnt:Integer; //
  sFilename:string;
  CarNo, PatrolCode, InCarNo1 : string;
  sSDate, sEDate: String;
begin
  Try
      xl := Createoleobject('excel.application');
      pnProgress.Visible:= True;
      Refresh;
      ap1.Position:= 0;
  Except
      MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
      Exit;
  end;

  sFilename:= 'Sheet1';
  XLBook := XL.WorkBooks.Add; // 새로운 페이지 생성
  XLBook.WorkSheets[1].Name := sFilename;

   // 엑셀 자료의 처음 제목 칸
  //XLBook.WorkSheets[sFilename].Range['A'+IntToStr(8)].Value := '순찰일자 : ' ;
  XLBook.WorkSheets[sFilename].Range['A'+IntToStr(1)].Value := '동' ;
  XLBook.WorkSheets[sFileName].Range['A'+IntToStr(1)].HorizontalAlignment := '3' ;
  XLBook.WorkSheets[sFileName].Range['B'+IntToStr(1)].Value := '호' ;
  XLBook.WorkSheets[sFileName].Range['B'+IntToStr(1)].HorizontalAlignment := '3' ;
  XLBook.WorkSheets[sFileName].Range['c'+IntToStr(1)].Value := '주차건수(건수)' ;
  XLBook.WorkSheets[sFileName].Range['c'+IntToStr(1)].HorizontalAlignment := '3' ;
  XLBook.WorkSheets[sFileName].Range['d'+IntToStr(1)].Value := '주차시간(분)' ;
  XLBook.WorkSheets[sFileName].Range['d'+IntToStr(1)].HorizontalAlignment := '3' ;

  XLBook.WorkSheets[sFileName].Range['f'+IntToStr(1)].Value := '입차일자' ;
  XLBook.WorkSheets[sFileName].Range['f'+IntToStr(1)].HorizontalAlignment := '3' ;
  XLBook.WorkSheets[sFileName].Range['g'+IntToStr(1)].Value := '입차시간' ;
  XLBook.WorkSheets[sFileName].Range['g'+IntToStr(1)].HorizontalAlignment := '3' ;
  XLBook.WorkSheets[sFileName].Range['h'+IntToStr(1)].Value := '입차차량번호' ;
  XLBook.WorkSheets[sFileName].Range['h'+IntToStr(1)].HorizontalAlignment := '3' ;
  XLBook.WorkSheets[sFileName].Range['i'+IntToStr(1)].Value := '출차일자' ;
  XLBook.WorkSheets[sFileName].Range['i'+IntToStr(1)].HorizontalAlignment := '3' ;
  XLBook.WorkSheets[sFileName].Range['j'+IntToStr(1)].Value := '출차시간' ;
  XLBook.WorkSheets[sFileName].Range['j'+IntToStr(1)].HorizontalAlignment := '3' ;
  XLBook.WorkSheets[sFileName].Range['k'+IntToStr(1)].Value := '출차차량번호' ;
  XLBook.WorkSheets[sFileName].Range['k'+IntToStr(1)].HorizontalAlignment := '3' ;
  XLBook.WorkSheets[sFileName].Range['l'+IntToStr(1)].Value := '사유' ;
  XLBook.WorkSheets[sFileName].Range['l'+IntToStr(1)].HorizontalAlignment := '3' ;
  XLBook.WorkSheets[sFileName].Range['m'+IntToStr(1)].Value := '동' ;
  XLBook.WorkSheets[sFileName].Range['m'+IntToStr(1)].HorizontalAlignment := '3' ;
  XLBook.WorkSheets[sFileName].Range['n'+IntToStr(1)].Value := '호' ;
  XLBook.WorkSheets[sFileName].Range['n'+IntToStr(1)].HorizontalAlignment := '3' ;
  XLBook.WorkSheets[sFileName].Range['o'+IntToStr(1)].Value := '주차시간(분)' ;
  XLBook.WorkSheets[sFileName].Range['o'+IntToStr(1)].HorizontalAlignment := '3' ;

   sSDate:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
   sEDate:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);

   with ADOQuery2 do
   begin
      Close;
      SQL.Clear;
      SQL.Add('Select reserve2, reserve3, count(*) as cnt , sum(parkingmin) as prkMin from IONData where ProcDate between :N1 and  :N2 ');
      if edtCarNo.Text <> '' then begin
        SQL.Add('And InCarNo1 = :N3 ');
        Parameters.ParamByName('N3').Value := Trim(edtCarNo.Text);
      end;
      if edtDong.Text <> '' then begin
        SQL.Add('And reserve2 = :N4 ');
        Parameters.ParamByName('N4').Value := Trim(edtDong.Text);
      end;
      if edtHo.Text <> '' then begin
        SQL.Add('And reserve3 = :N5 ');
        Parameters.ParamByName('N5').Value := Trim(edtHo.Text);
      end;

      SQL.Add('group by reserve2, reserve3 Order by reserve2, reserve3');
      Parameters.ParamByName('N1').Value:= sSDate;
      Parameters.ParamByName('N2').Value:= sEDate;

      ExceptLogging(SQL.Text);
      Open;
      ap1.Max:= RecordCount;
      si:= 2;
      While not Eof Do begin
        ap1.Position:= li_CNT;
        XLBook.WorkSheets[sFilename].Range['A'+IntToStr(si)].Value :=               //순번
        FieldByName('reserve2').AsString;

        XLBook.WorkSheets[sFileName].Range['B'+IntToStr(si)].Value :=              //차량번호
        FieldByName('reserve3').AsString;

        XLBook.WorkSheets[sFileName].Range['c'+IntToStr(si)].Value :=              //입차시간
        FieldByName('cnt').AsString;

        XLBook.WorkSheets[sFileName].Range['d'+IntToStr(si)].Value :=              //입차시간
        FieldByName('prkMin').AsString;

        Inc(si); // 계속 값을 더한다..
        Inc(li_CNT);
        Next;
      end;

      Close;
      SQL.Clear;
      SQL.Add('Select Procdate, procTime, InCarNo1, Outdate, Outtime, OutCarNo1, Reserve1, Reserve2, Reserve3, parkingmin   From IONData ');
      //SQL.Add('Where Reserve2 = :v1 and Reserve3 = :v2 and ProcDate between :v3 and  :v4 ');
      SQL.Add('Where ProcDate between :v3 and  :v4 ');
      if edtCarNo.Text <> '' then begin
        SQL.Add('And InCarNo1 = :v5');
        Parameters.ParamByName('v5').Value := Trim(edtCarNo.Text);
      end;
      SQL.Add('Order by ProcDate + ProcTime DESC');
      //Parameters.ParamByName('v1').Value := dg1.Cells[1,dg1.Row];
      //Parameters.ParamByName('v2').Value := dg1.Cells[2,dg1.Row];
      Parameters.ParamByName('v3').Value := FormatDateTime('YYYY-MM-DD', edtSDate.Date);
      Parameters.ParamByName('v4').Value := FormatDateTime('YYYY-MM-DD', edtEDate.Date);
      Open;

      ap1.Max:= RecordCount;
      si := 2;
      li_CNT := 0;
      while not eof do
      begin
        ap1.Position:= li_CNT;
        XLBook.WorkSheets[sFilename].Range['f'+IntToStr(si)].Value :=
        FieldByName('Procdate').AsString;

        XLBook.WorkSheets[sFileName].Range['g'+IntToStr(si)].Value :=
        FieldByName('procTime').AsString;

        XLBook.WorkSheets[sFileName].Range['h'+IntToStr(si)].Value :=
        FieldByName('InCarNo1').AsString;

        XLBook.WorkSheets[sFileName].Range['i'+IntToStr(si)].Value :=
        FieldByName('Outdate').AsString;

        XLBook.WorkSheets[sFileName].Range['j'+IntToStr(si)].Value :=
        FieldByName('Outtime').AsString;

        XLBook.WorkSheets[sFileName].Range['k'+IntToStr(si)].Value :=
        FieldByName('OutCarNo1').AsString;

        XLBook.WorkSheets[sFileName].Range['l'+IntToStr(si)].Value :=
        FieldByName('Reserve1').AsString;

        XLBook.WorkSheets[sFileName].Range['m'+IntToStr(si)].Value :=
        FieldByName('Reserve2').AsString;

        XLBook.WorkSheets[sFileName].Range['n'+IntToStr(si)].Value :=
        FieldByName('Reserve3').AsString;

        XLBook.WorkSheets[sFileName].Range['o'+IntToStr(si)].Value :=
        FieldByName('parkingmin').AsString;

        Inc(si); // 계속 값을 더한다..
        Inc(li_CNT);
        Next;
      end;
   end;

  //Sleep(2); // 너무 빨리돌면 컴퓨터 자원을 다잡아 먹어서 잠시 잠재워요 ^^;
  //Excel 영역선택
  XL.Selection.Font.Size := '12';
  //XL.Selection.Columns.AutoFit; // Excel 셀 크기 자동조절
  XL.Columns[1].ColumnWidth := 13;
  XL.Columns[2].ColumnWidth := 13;
  XL.Columns[3].ColumnWidth := 13;
  XL.Columns[4].ColumnWidth := 13;
  XL.Columns[5].ColumnWidth := 13;
  XL.Columns[6].ColumnWidth := 13;
  XL.Columns[7].ColumnWidth := 13;
  XL.Columns[8].ColumnWidth := 13;
  XL.Columns[9].ColumnWidth := 13;
  XL.Columns[10].ColumnWidth := 13;
  XL.Columns[11].ColumnWidth := 13;
  XL.Columns[12].ColumnWidth := 13;
  XL.Columns[13].ColumnWidth := 13;
  XL.Columns[14].ColumnWidth := 13;
  XL.Columns[15].ColumnWidth := 13;


  //엑셀을 보이게 한다...
  XL.Visible := False;
  pnProgress.Visible:= False;
  //엑셀 저장 화면
  SaveDialog1.Title := '엑셀 내보내기 화면';
  SaveDialog1.InitialDir := GetCurrentDir;
  //SaveDialog1.Filter := 'Excel files (*.xls)|*.xls';
  SaveDialog1.Filter := 'Excel files (*.xlsx)|*.xlsx';
  SaveDialog1.FilterIndex := 1;
  //SaveDialog1.DefaultExt := 'xls';

  //엑셀 저장 화면
  if SaveDialog1.Execute then
  begin
    XLBook.WorkSheets[sFilename].SaveAs(SaveDialog1.FileName, 51); // or xlOpenXMLWorkbook (51)
    MessageBoxTimeOut(Application.Handle, '엑셀파일로 저장완료!', '', 0, 0, 5000);
    //ShowMessage('엑셀파일로 저장완료!');
    XLBook.Application.Quit;
  end;
end;
//begin
//  //mzExcelExport(dg1,4);
//  mzExcelExport2(dg1, dg2, dg1.ColCount-1, dg2.ColCount-1);
////  try
////    if savedialog1.Execute then
////    begin
////      advgridexcelio1.XLSExport(savedialog1.filename + '.xls');
////      ShowMessage('엑셀파일로 저장완료!');
////    end;
////  except
////    on E: Exception do ExceptLogging('TfrmIOVisitStat.btnExcelClick: ' + E.Message);
////  end;
//end;

procedure TfrmIOVisitStat.btnSearchClick(Sender: TObject);
var
  sSDate, sEDate, sSTime, sETime, sdong, sho, sqlStr, sqlStr2: String;
  i : Integer;
begin
  try
    sSDate:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
    sEDate:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
    sSTime:= FormatDateTime('HH:NN:SS', edtSTime.Time);
    sETime:= FormatDateTime('HH:NN:SS', edtETime.Time);
    sqlStr := '';
    {if cmbType.ItemIndex > 0 then    //사전 방문 주차 기간 조회 검색
    begin
      with qryIONData do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select reserve2, reserve3, count(*) as cnt, DATEDIFF(dd, procdate, outdate) as prkDate, ISNULL(dbo.GetSecondToTime2(sum(parkingmin)),0) as prkMin ');
        SQL.Add('from IONData where ProcDate  between :N1 and :N2                                                                 ');
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
        SQL.Add('group by reserve2, reserve3, procdate, proctime, outdate, outtime                                 ');
        if cmbType.ItemIndex = 1 then     //5일~10일
        begin
          SQL.Add('having DATEDIFF(dd, procdate, outdate) >= 5 and DATEDIFF(dd, procdate, outdate) <= 10           ');
        end
        else if cmbType.ItemIndex = 2 then    //10일~20일
        begin
          SQL.Add('having DATEDIFF(dd, procdate, outdate) >= 10 and DATEDIFF(dd, procdate, outdate) <= 20          ');
        end
        else if cmbType.ItemIndex = 3 then  //20일~30일
        begin
          SQL.Add('having DATEDIFF(dd, procdate, outdate) >= 20 and DATEDIFF(dd, procdate, outdate) <= 30          ');
        end;
        Parameters.ParamByName('N1').Value:= sSDate;
        Parameters.ParamByName('N2').Value:= sEDate;
        ExceptLogging(SQL.Text);
        Open;
        dg1.AutoSizeColumns(True);

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

      if (edtCarNo.Text <> '') or (edtDong.Text <> '') or (edtHo.Text <> '') then begin
         dg1.OnClick(Sender);
      end
      else
      begin
         IOVvisitStat;
      end;
    end
    else
    begin
      if homenetuse = 1 then //홈넷 포인트 사용 시
      begin
         with ADOQuery2 do
         begin
            Close;
            SQL.Clear;
            SQL.Add('Select * from Visit_Point ');
            if rbHomenetPoint.ItemIndex = 1 then
            begin
               SQL.Add('where usedPoint >= 0 ');
            end
            else if rbHomenetPoint.ItemIndex = 2 then
            begin
               SQL.Add('where usedPoint < 0 ');
            end;
            Open;
            i := 1;
            //ShowMessage(IntToStr(recordcount));
            while not eof do
            begin
              if i = recordcount then
              begin
                sdong := FieldByName('dong').AsString;
                sqlStr := sqlStr + sdong;
                sho := FieldByName('ho').AsString;
                sqlStr2 := sqlStr2 + sho;
              end
              else
              begin
                sdong := FieldByName('dong').AsString;
                sqlStr := sqlStr + sdong + ',';
                sho := FieldByName('ho').AsString;
                sqlStr2 := sqlStr2 + sho + ',';
              end;
              Inc(i);
              Next;
            end;

            with qryIONData do
            begin
              Close;
              SQL.Clear;
              //SQL.Add('Select reserve2, reserve3, count(*) as cnt , sum(parkingmin) as prkMin from IONData where ProcDate between :N1 and  :N2 ');
              SQL.Add('Select reserve2, reserve3, count(*) as cnt , ISNULL(dbo.GetSecondToTime2(sum(parkingmin)),0) as prkMin from IONData where ProcDate between :N1 and  :N2 ');
              SQL.Add('And InCarNo1 like :N3 ');
              SQL.Add('And reserve2 in('+sqlStr+')  ');
              SQL.Add('And reserve3 in('+sqlStr2+')  ');
              //SQL.Add('And reserve2 = :N4 ');
              //SQL.Add('And reserve3 = :N5 ');
              SQL.Add('group by reserve2, reserve3 Order by reserve2, reserve3 ');

              Parameters.ParamByName('N1').Value:= sSDate;
              Parameters.ParamByName('N2').Value:= sEDate;
              Parameters.ParamByName('N3').Value := '%'+Trim(edtCarNo.Text)+'%';
              //Parameters.ParamByName('N4').Value := sdong;
              //Parameters.ParamByName('N5').Value := sho;
              ExceptLogging(SQL.Text);
              Open;

              dg1.AutoSizeColumns(True);

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


            if (edtCarNo.Text <> '') or (edtDong.Text <> '') or (edtHo.Text <> '') then begin
               dg1.OnClick(Sender);
            end
            else
            begin
               if rbHomenetPoint.ItemIndex = 0 then
               begin
                  IOVvisitStat;
               end
               else
               begin
                  dg1.OnClick(Sender);
               end;
            end;
         end;
      end
      else
      begin
        with qryIONData do
        begin
          Close;
          SQL.Clear;
          //SQL.Add('Select reserve2, reserve3, count(*) as cnt , sum(parkingmin) as prkMin from IONData where ProcDate between :N1 and  :N2 ');
          SQL.Add('Select reserve2, reserve3, count(*) as cnt , ISNULL(dbo.GetSecondToTime2(sum(parkingmin)),0) as prkMin from IONData where ProcDate between :N1 and  :N2 ');
          if edtCarNo.Text <> '' then begin
            //SQL.Add('And InCarNo1 = :N3 ');
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
    //      SQL.add('and Reserve2 is not null and Reserve3 is not null ');
    //      SQL.add('and Reserve2 <> :N6 and Reserve3 <> :N7 ');
          SQL.Add('group by reserve2, reserve3 Order by reserve2, reserve3');
          Parameters.ParamByName('N1').Value:= sSDate;
          Parameters.ParamByName('N2').Value:= sEDate;
    //      Parameters.ParamByName('N6').Value:= '';
    //      Parameters.ParamByName('N7').Value:= '';
          ExceptLogging(SQL.Text);
          Open;
          dg1.AutoSizeColumns(True);

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

        if (edtCarNo.Text <> '') or (edtDong.Text <> '') or (edtHo.Text <> '') then begin
           dg1.OnClick(Sender);
        end
        else
        begin
           IOVvisitStat;
        end;
      end;
    //dg1.OnClick(Sender);
    //IOVvisitStat;
    end;}


    if homenetuse = 1 then //홈넷 포인트 사용 시
    begin
       with ADOQuery2 do
       begin
          Close;
          SQL.Clear;
          SQL.Add('Select * from Visit_Point ');
          if rbHomenetPoint.ItemIndex = 1 then
          begin
             SQL.Add('where usedPoint >= 0 ');
          end
          else if rbHomenetPoint.ItemIndex = 2 then
          begin
             SQL.Add('where usedPoint < 0 ');
          end;
          Open;
          i := 1;
          if Eof  then
          begin
             dg1.clear;
             dg2.clear;
             btnExcel.Enabled  := False;
             btnExcel1.Enabled := False;
             btnExcel2.Enabled := False;
          end;
          //ShowMessage(IntToStr(recordcount));
          while not eof do
          begin
            if i = recordcount then
            begin
              sdong := FieldByName('dong').AsString;
              sqlStr := sqlStr + sdong;
              sho := FieldByName('ho').AsString;
              sqlStr2 := sqlStr2 + sho;
            end
            else
            begin
              sdong := FieldByName('dong').AsString;
              sqlStr := sqlStr + sdong + ',';
              sho := FieldByName('ho').AsString;
              sqlStr2 := sqlStr2 + sho + ',';
            end;
            Inc(i);
            Next;
          end;

          with qryIONData do
          begin
            Close;
            SQL.Clear;
            SQL.Add('Select reserve2, reserve3, count(*) as cnt, ');
            //SQL.Add('Select reserve2, reserve3, count(*) as cnt , ISNULL(dbo.GetSecondToTime2(sum(parkingmin)),0) as prkMin from IONData where ProcDate between :N1 and  :N2 ');
            SQL.Add('Case when ISNULL((SUM(parkingmin))/(24*60),0) > 0 then                        ');
            SQL.Add('		  CONVERT(VARCHAR(50),ISNULL((SUM(parkingmin))/(24*60),0)) +''일'' +       ');
            SQL.Add('		  CONVERT(VARCHAR(50),ISNULL(((SUM(parkingmin))%(24*60))/60,0)) +''시간''+ ');
            SQL.Add('		  CONVERT(VARCHAR(50),ISNULL(((SUM(parkingmin))%(24*60))%60,0)) +''분''    ');

            SQL.Add('   when  ISNULL((SUM(parkingmin))%(24*60)/60,0) > 0 then                         ');
            SQL.Add('		  CONVERT(VARCHAR(50),ISNULL(((SUM(parkingmin))%(24*60))/60,0)) +''시간''+    ');
            SQL.Add('		  CONVERT(VARCHAR(50),ISNULL(((SUM(parkingmin))%(24*60))%60,0)) +''분''       ');

            SQL.Add('	when  ISNULL(((SUM(parkingmin))%(24*60))%60,0) > 0 then                       ');
            SQL.Add('	      CONVERT(VARCHAR(50),ISNULL(((SUM(parkingmin))%(24*60))%60,0)) +''분''   ');
            SQL.Add('   END                                                                         ');
            SQL.Add(' as prkMin from IONData Where ProcDate + '' '' +ProcTime between :N1 and :N2 ');

            if sqlStr2 = '' then
            begin
              if rbHomenetPoint.ItemIndex > 0 then
              begin
                Exit;
              end
              else
              begin
                if edtCarNo.Text <> '' then begin
                  //SQL.Add('And InCarNo1 = :N3 ');
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
                //SQL.Add('And InCarNo1 like :N3 ');
                if sqlStr <> '' then
                begin
                   SQL.Add('And reserve2 in('+sqlStr+')  ');
                end;
              end;
            end
            else if sqlStr2 <> '' then
            begin
               if rbHomenetPoint.ItemIndex > 0 then
               begin
                 SQL.Add('And reserve2 in('+sqlStr+')  ');
                 SQL.Add('And reserve3 in('+sqlStr2+')  ');
               end;
            end;

            //SQL.Add('And reserve2 in('+sqlStr+')  ');
            //SQL.Add('And reserve3 in('+sqlStr2+')  ');

            //SQL.Add('And reserve2 = :N4 ');
            //SQL.Add('And reserve3 = :N5 ');
            SQL.Add('and reserve2 <> '''' and reserve3 <> ''''  ');
            SQL.Add('group by reserve2, reserve3 Order by reserve2, reserve3 ');

            Parameters.ParamByName('N1').Value:= sSDate+' '+sSTime;
            Parameters.ParamByName('N2').Value:= sEDate+' '+sETime;
            //Parameters.ParamByName('N4').Value := sdong;
            //Parameters.ParamByName('N5').Value := sho;
            ExceptLogging(SQL.Text);
            Open;

            dg1.AutoSizeColumns(True);

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


          if (edtCarNo.Text <> '') or (edtDong.Text <> '') or (edtHo.Text <> '') then begin
             dg1.OnClick(Sender);
          end
          else
          begin
             if rbHomenetPoint.ItemIndex = 0 then
             begin
                IOVvisitStat;
             end
             else
             begin
                dg1.OnClick(Sender);
             end;
          end;
       end;
    end
    else
    begin
      with qryIONData do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select reserve2, reserve3, count(*) as cnt,                                  ');
        SQL.Add('Case when ISNULL((SUM(parkingmin))/(24*60),0) > 0 then                       ');
        SQL.Add('		  CONVERT(VARCHAR(50),ISNULL((SUM(parkingmin))/(24*60),0)) +''일'' +       ');
        SQL.Add('		  CONVERT(VARCHAR(50),ISNULL(((SUM(parkingmin))%(24*60))/60,0)) +''시간''+ ');
        SQL.Add('		  CONVERT(VARCHAR(50),ISNULL(((SUM(parkingmin))%(24*60))%60,0)) +''분''    ');

        SQL.Add('   when  ISNULL((SUM(parkingmin))%(24*60)/60,0) > 0 then                         ');
        SQL.Add('		  CONVERT(VARCHAR(50),ISNULL(((SUM(parkingmin))%(24*60))/60,0)) +''시간''+    ');
        SQL.Add('		  CONVERT(VARCHAR(50),ISNULL(((SUM(parkingmin))%(24*60))%60,0)) +''분''       ');

        SQL.Add('	when  ISNULL(((SUM(parkingmin))%(24*60))%60,0) > 0 then                       ');
        SQL.Add('	      CONVERT(VARCHAR(50),ISNULL(((SUM(parkingmin))%(24*60))%60,0)) +''분''   ');
        SQL.Add('   END                                                                         ');
        //SQL.Add('as prkMin from IONData Where ProcDate between :N1 and :N2   ');
        SQL.Add('as prkMin from IONData Where ProcDate + '' '' +ProcTime between :N1 and :N2   ');
        if edtCarNo.Text <> '' then begin
          //SQL.Add('And InCarNo1 = :N3 ');
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
        SQL.Add('and reserve2 <> '''' and reserve3 <> ''''  ');
        SQL.Add('group by reserve2, reserve3 Order by reserve2, reserve3     ');
        Parameters.ParamByName('N1').Value:= sSDate+' '+sSTime;
        Parameters.ParamByName('N2').Value:= sEDate+' '+sETime;

        {SQL.Add('Select reserve2, reserve3, count(*) as cnt , sum(parkingmin) as prkMin from IONData where ProcDate between :N1 and  :N2 ');
        //SQL.Add('Select reserve2, reserve3, count(*) as cnt , ISNULL(dbo.GetSecondToTime2(sum(parkingmin)),0) as prkMin from IONData where ProcDate between :N1 and  :N2 ');
        if edtCarNo.Text <> '' then begin
          //SQL.Add('And InCarNo1 = :N3 ');
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
  //      SQL.add('and Reserve2 is not null and Reserve3 is not null ');
  //      SQL.add('and Reserve2 <> :N6 and Reserve3 <> :N7 ');
        SQL.Add('group by reserve2, reserve3 Order by reserve2, reserve3'); }

//        Parameters.ParamByName('N1').Value:= sSDate;
//        Parameters.ParamByName('N2').Value:= sEDate;
  //      Parameters.ParamByName('N6').Value:= '';
  //      Parameters.ParamByName('N7').Value:= '';
        ExceptLogging(SQL.Text);
        Open;
        dg1.AutoSizeColumns(True);

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

      if (edtCarNo.Text <> '') or (edtDong.Text <> '') or (edtHo.Text <> '') then begin
         dg1.OnClick(Sender);
      end
      else
      begin
         IOVvisitStat;
      end;
    end;
  except
    on E: Exception do ExceptLogging('TfrmIOVisitStat.btnSearchClick: ' + E.Message);
  end;
end;

procedure TfrmIOVisitStat.dg1Click(Sender: TObject);
begin
  if (qryIONData.Active = True) and (qryIONData.RecordCount > 0) then begin
    if cmbType.ItemIndex > 0 then    //사전 방문 주차 기간 조회 검색
    begin
      with qryIONSubData do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select procdate, procTime, IncarNo1, OutDate, OutTime, OutCarNo1,  ');
        SQL.Add('Reserve1, Reserve2, Reserve3, UsedPoint,  ');
        SQL.Add('Case when ISNULL((parkingmin)/(24*60),0) > 0 then                        ');
        SQL.Add('		  CONVERT(VARCHAR(50),ISNULL((parkingmin)/(24*60),0)) +''일'' +         ');
        SQL.Add('		  CONVERT(VARCHAR(50),ISNULL(((parkingmin)%(24*60))/60,0)) +''시간''+   ');
        SQL.Add('		  CONVERT(VARCHAR(50),ISNULL(((parkingmin)%(24*60))%60,0)) +''분''      ');

        SQL.Add('    when  ISNULL((parkingmin)%(24*60)/60,0) > 0 then                       ');
        SQL.Add('		  CONVERT(VARCHAR(50),ISNULL(((parkingmin)%(24*60))/60,0)) +''시간''+   ');
        SQL.Add('		  CONVERT(VARCHAR(50),ISNULL(((parkingmin)%(24*60))%60,0)) +''분''      ');

        SQL.Add('	when  ISNULL(((parkingmin)%(24*60))%60,0) > 0 then                      ');
        SQL.Add('	      CONVERT(VARCHAR(50),ISNULL(((parkingmin)%(24*60))%60,0)) +''분''  ');
        SQL.Add('END                                                                      ');
        SQL.Add(' as ParkingMin, DATEDIFF(dd, procdate, outdate) as prkDate  ');

        //SQL.Add('from IONData Where Reserve2 = :v1 and Reserve3 = :v2 and ProcDate between :N1 and :N2  ');
        SQL.Add('from IONData  ');
        if (dg1.Cells[1,dg1.Row] = '') and (dg1.Cells[2,dg1.Row]= '') then
        begin
          SQL.Add('Where Reserve2 is null and Reserve3 is null and ProcDate between :N1 and :N2 ');
        end
        else
        begin
          SQL.Add('Where Reserve2 = :v1 and Reserve3 = :v2 and ProcDate between :N1 and :N2 ');
          Parameters.ParamByName('v1').Value := dg1.Cells[1,dg1.Row];
          Parameters.ParamByName('v2').Value := dg1.Cells[2,dg1.Row];
        end;

        if edtCarNo.Text <> '' then
        begin
           SQL.Add('and  incarno1 like :N3 ');
           Parameters.ParamByName('N3').Value := '%'+ edtCarNo.Text +'%';
        end;
        SQL.Add('group by procdate, proctime, incarno1, outdate, outtime, OutCarNo1, Reserve1, Reserve2, Reserve3, ParkingMin, UsedPoint   ');
        if cmbType.ItemIndex = 1 then     //5일 미만
        begin
          SQL.Add('having DATEDIFF(dd, procdate, outdate) <= 5  ');
        end
        else if cmbType.ItemIndex = 2 then     //5일~10일
        begin
          SQL.Add('having DATEDIFF(dd, procdate, outdate) >= 5 and DATEDIFF(dd, procdate, outdate) <= 10           ');
        end
        else if cmbType.ItemIndex = 3 then    //10일~20일
        begin
          SQL.Add('having DATEDIFF(dd, procdate, outdate) >= 10 and DATEDIFF(dd, procdate, outdate) <= 20          ');
        end
        else if cmbType.ItemIndex = 4 then  //20일~30일
        begin
          SQL.Add('having DATEDIFF(dd, procdate, outdate) >= 20 and DATEDIFF(dd, procdate, outdate) <= 30          ');
        end
        else if cmbType.ItemIndex = 5 then  //30일 이상
        begin
          SQL.Add('having DATEDIFF(dd, procdate, outdate) >= 30  ');
        end;
        {if cmbType.ItemIndex = 1 then     //5일~10일
        begin
          SQL.Add('having DATEDIFF(dd, procdate, outdate) >= 5 and DATEDIFF(dd, procdate, outdate) <= 10           ');
        end
        else if cmbType.ItemIndex = 2 then    //10일~20일
        begin
          SQL.Add('having DATEDIFF(dd, procdate, outdate) >= 10 and DATEDIFF(dd, procdate, outdate) <= 20          ');
        end
        else if cmbType.ItemIndex = 3 then  //20일~30일
        begin
          SQL.Add('having DATEDIFF(dd, procdate, outdate) >= 20 and DATEDIFF(dd, procdate, outdate) <= 30          ');
        end;}
        //Parameters.ParamByName('v1').Value:= dg1.Cells[1,dg1.Row];
        //Parameters.ParamByName('v2').Value:= dg1.Cells[2,dg1.Row];
        Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
        Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
        ExceptLogging(SQL.Text);
        Open;
        dg1.AutoSizeColumns(True);

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
    end
    else
    begin
      with qryIONSubData do begin
        Close;
        SQL.Clear;
        {SQL.Add('Select * From IONData ');
        SQL.Add('Where Reserve2 = :v1 and Reserve3 = :v2 and ProcDate between :v3 and  :v4 ');
        if edtCarNo.Text <> '' then begin
          //SQL.Add('And InCarNo1 = :v5');
          SQL.Add('And InCarNo1 like :v5');
          Parameters.ParamByName('v5').Value := '%'+Trim(edtCarNo.Text)+'%';
        end;
        SQL.Add('Order by ProcDate + ProcTime DESC'); }
        SQL.Add('Select procdate, proctime, incarno1, outdate, outtime, OutCarNo1,        ');
        SQL.Add('Reserve1, Reserve2, Reserve3,                                            ');
        SQL.Add('Case when ISNULL((parkingmin)/(24*60),0) > 0 then                        ');
        SQL.Add('		  CONVERT(VARCHAR(50),ISNULL((parkingmin)/(24*60),0)) +''일'' +         ');
        SQL.Add('		  CONVERT(VARCHAR(50),ISNULL(((parkingmin)%(24*60))/60,0)) +''시간''+   ');
        SQL.Add('		  CONVERT(VARCHAR(50),ISNULL(((parkingmin)%(24*60))%60,0)) +''분''      ');

        SQL.Add('    when  ISNULL((parkingmin)%(24*60)/60,0) > 0 then                       ');
        SQL.Add('		  CONVERT(VARCHAR(50),ISNULL(((parkingmin)%(24*60))/60,0)) +''시간''+   ');
        SQL.Add('		  CONVERT(VARCHAR(50),ISNULL(((parkingmin)%(24*60))%60,0)) +''분''      ');

        SQL.Add('	when  ISNULL(((parkingmin)%(24*60))%60,0) > 0 then                      ');
        SQL.Add('	      CONVERT(VARCHAR(50),ISNULL(((parkingmin)%(24*60))%60,0)) +''분''  ');
        SQL.Add('END                                                                      ');
        SQL.Add(' as ParkingMin,                                                          ');
        SQL.Add('UsedPoint, DATEDIFF(dd, procdate, outdate) as prkDate                    ');
        SQL.Add('From IONData                                                             ');
        //SQL.Add('Where ProcDate between :v3 and :v4 and Reserve2 = :v1 and Reserve3 = :v2 ');
        if (dg1.Cells[1,dg1.Row] = '') and (dg1.Cells[2,dg1.Row]= '') then
        begin
          SQL.Add('Where ProcDate between :v3 and :v4 and Reserve2 is null and Reserve3 is null ');
        end
        else
        begin
          SQL.Add('Where ProcDate between :v3 and :v4 and Reserve2 = :v1 and Reserve3 = :v2 ');
          Parameters.ParamByName('v1').Value := dg1.Cells[1,dg1.Row];
          Parameters.ParamByName('v2').Value := dg1.Cells[2,dg1.Row];
        end;

        if edtCarNo.Text <> '' then begin
          SQL.Add('And InCarNo1 like :v5');
          Parameters.ParamByName('v5').Value := '%'+Trim(edtCarNo.Text)+'%';
        end;
        //Parameters.ParamByName('v1').Value := dg1.Cells[1,dg1.Row];
        //Parameters.ParamByName('v2').Value := dg1.Cells[2,dg1.Row];
        Parameters.ParamByName('v3').Value := FormatDateTime('YYYY-MM-DD', edtSDate.Date);
        Parameters.ParamByName('v4').Value := FormatDateTime('YYYY-MM-DD', edtEDate.Date);
        Open;
        if RecordCount > 0 then begin
          btnExcel1.Enabled := True;
        end else begin
          btnExcel1.Enabled := False;
        end;
      end;

       if homenetuse = 1 then   //홈넷 포인트 사용시
       begin
         dg2.AddRow;
         with ADOQuery2 do begin
            //21.02.18 세대별 포인트 합계 추가
            Close;
            SQL.Clear;
            //SQL.Add('Select Sum(ParkingMin) ParkingMin, Sum(UsedPoint) UsedPoint From IONData ');
            SQL.Add('Select Sum(UsedPoint) UsedPoint, ');

            SQL.Add('Case when ISNULL(Sum(ParkingMin)/(24*60),0) > 0 then                        ');
            SQL.Add('		  CONVERT(VARCHAR(50),ISNULL(Sum(ParkingMin)/(24*60),0)) +''일'' +         ');
            SQL.Add('		  CONVERT(VARCHAR(50),ISNULL((Sum(ParkingMin)%(24*60))/60,0)) +''시간''+   ');
            SQL.Add('		  CONVERT(VARCHAR(50),ISNULL((Sum(ParkingMin)%(24*60))%60,0)) +''분''     ');

            SQL.Add('    when  ISNULL(Sum(ParkingMin)%(24*60)/60,0) > 0 then                       ');
            SQL.Add('		  CONVERT(VARCHAR(50),ISNULL((Sum(ParkingMin)%(24*60))/60,0)) +''시간''+   ');
            SQL.Add('		  CONVERT(VARCHAR(50),ISNULL((Sum(ParkingMin)%(24*60))%60,0)) +''분''      ');

            SQL.Add('	when  ISNULL(Sum(ParkingMin)%(24*60)%60,0) > 0 then                     ');
            SQL.Add('	      CONVERT(VARCHAR(50),ISNULL(Sum(ParkingMin)%(24*60)%60,0)) +''분'' ');
            SQL.Add('END                                                                      ');
            SQL.Add(' as ParkingMin,                                                          ');
            SQL.Add(' SUM(DATEDIFF(dd, procdate, outdate)) as prkDate                         ');
            SQL.Add(' From IONData ');

            if rbHomenetPoint.ItemIndex = 0 then
            begin
              //SQL.Add('Where ProcDate between :v3 and  :v4 ');

              if (dg1.Cells[1,dg1.Row] = '') and (dg1.Cells[2,dg1.Row]= '') then
              begin
                SQL.Add('Where Reserve2 is null and Reserve3 is null and ProcDate between :v3 and  :v4 ');
              end
              else
              begin
                SQL.Add('Where Reserve2 = :v1 and Reserve3 = :v2 and ProcDate between :v3 and  :v4 ');
                Parameters.ParamByName('v1').Value := dg1.Cells[1,dg1.Row];
                Parameters.ParamByName('v2').Value := dg1.Cells[2,dg1.Row];
              end;


            end
            else
            begin
              if (dg1.Cells[1,dg1.Row] = '') and (dg1.Cells[2,dg1.Row]= '') then
              begin
                SQL.Add('Where Reserve2 is null and Reserve3 is null and ProcDate between :v3 and  :v4 ');
              end
              else
              begin
                SQL.Add('Where Reserve2 = :v1 and Reserve3 = :v2 and ProcDate between :v3 and  :v4 ');
                Parameters.ParamByName('v1').Value := dg1.Cells[1,dg1.Row];
                Parameters.ParamByName('v2').Value := dg1.Cells[2,dg1.Row];
              end;

//             SQL.Add('Where Reserve2 = :v1 and Reserve3 = :v2 and ProcDate between :v3 and  :v4 ');
//             Parameters.ParamByName('v1').Value := dg1.Cells[1,dg1.Row];
//             Parameters.ParamByName('v2').Value := dg1.Cells[2,dg1.Row];
            end;
            if edtCarNo.Text <> '' then begin
              SQL.Add('And InCarNo1 like :v5 ');
              Parameters.ParamByName('v5').Value := '%'+Trim(edtCarNo.Text)+'%';
            end;
            //SQL.Add('Order by ProcDate + ProcTime DESC ');
            //SQL.Add('Group by UsedPoint ');
            Parameters.ParamByName('v3').Value := FormatDateTime('YYYY-MM-DD', edtSDate.Date);
            Parameters.ParamByName('v4').Value := FormatDateTime('YYYY-MM-DD', edtEDate.Date);
            Open;
            if RecordCount > 0 then begin
              with dg2 do
              begin
                  Cells[1, dg2.rowcount - 1]  :=  '합계';
                  Cells[10, dg2.rowcount - 1] :=  FieldByName('ParkingMin').AsString;
                  Cells[11, dg2.rowcount - 1] :=  FieldByName('prkDate').AsString;
                  Cells[12, dg2.rowcount - 1] :=  FieldByName('UsedPoint').AsString;
              end;
            end;
         end;
       end
       else
       begin
         dg2.AddRow;
         with ADOQuery2 do begin
            //21.02.18 주차시간 합계 추가
            Close;
            SQL.Clear;
            //SQL.Add('Select Sum(ParkingMin) ParkingMin From IONData ');
            SQL.Add('Select ');

            SQL.Add('Case when ISNULL(Sum(ParkingMin)/(24*60),0) > 0 then                        ');
            SQL.Add('		  CONVERT(VARCHAR(50),ISNULL(Sum(ParkingMin)/(24*60),0)) +''일'' +         ');
            SQL.Add('		  CONVERT(VARCHAR(50),ISNULL((Sum(ParkingMin)%(24*60))/60,0)) +''시간''+   ');
            SQL.Add('		  CONVERT(VARCHAR(50),ISNULL((Sum(ParkingMin)%(24*60))%60,0)) +''분''     ');

            SQL.Add('    when  ISNULL(Sum(ParkingMin)%(24*60)/60,0) > 0 then                       ');
            SQL.Add('		  CONVERT(VARCHAR(50),ISNULL((Sum(ParkingMin)%(24*60))/60,0)) +''시간''+   ');
            SQL.Add('		  CONVERT(VARCHAR(50),ISNULL((Sum(ParkingMin)%(24*60))%60,0)) +''분''      ');

            SQL.Add('	when  ISNULL(Sum(ParkingMin)%(24*60)%60,0) > 0 then                     ');
            SQL.Add('	      CONVERT(VARCHAR(50),ISNULL(Sum(ParkingMin)%(24*60)%60,0)) +''분'' ');
            SQL.Add('END                                                                      ');
            SQL.Add(' as ParkingMin,                                                          ');
            SQL.Add(' SUM(DATEDIFF(dd, procdate, outdate)) as prkDate                         ');
            SQL.Add(' From IONData ');

            if (dg1.Cells[1,dg1.Row] = '') and (dg1.Cells[2,dg1.Row]= '') then
            begin
              SQL.Add('Where Reserve2 is null and Reserve3 is null and ProcDate between :v3 and  :v4 ');
            end
            else
            begin
              SQL.Add('Where Reserve2 = :v1 and Reserve3 = :v2 and ProcDate between :v3 and  :v4 ');
              Parameters.ParamByName('v1').Value := dg1.Cells[1,dg1.Row];
              Parameters.ParamByName('v2').Value := dg1.Cells[2,dg1.Row];
            end;

            if edtCarNo.Text <> '' then begin
              SQL.Add('And InCarNo1 like :v5 ');
              Parameters.ParamByName('v5').Value := '%'+Trim(edtCarNo.Text)+'%';
            end;

            Parameters.ParamByName('v3').Value := FormatDateTime('YYYY-MM-DD', edtSDate.Date);
            Parameters.ParamByName('v4').Value := FormatDateTime('YYYY-MM-DD', edtEDate.Date);
            ExceptLogging(SQL.Text);
            Open;
            if RecordCount > 0 then begin
              with dg2 do
              begin
                  Cells[1, dg2.rowcount - 1]  :=  '합계';
                  Cells[10, dg2.rowcount - 1] :=  FieldByName('ParkingMin').AsString;
                  Cells[11, dg2.rowcount - 1] :=  FieldByName('prkDate').AsString;
              end;
            end;
         end;
       end;

      //dg2.AutoNumberCol(0);
      dg2.AutoSizeColumns(True);
    end;

    if homenetuse = 0 then  //홈넷 포인트 사용 안할시
    begin
       dg2.Columns[12].Width := 0;
       rbHomenetPoint.Visible := false;
    end;

  end;
end;

procedure TfrmIOVisitStat.FormShow(Sender: TObject);
begin
  edtSDate.Date:= Now - 30;
  edtEDate.Date:= Now;
  if nvisituse = 0 then
  begin
    cmbType.Visible := False;
    Bevel5.Visible  := False;
    label6.Visible  := False;
  end;

  if homenetuse = 0 then  //홈넷 포인트 사용 안할시
  begin
    dg2.Columns[12].Width := 0;
    rbHomenetPoint.Visible := false;
  end;
end;

procedure TfrmIOVisitStat.IOVvisitStat;
var
   nParkingMin, nDay, nHour, nMin : Integer;
   i : Integer;
begin
   if cmbType.ItemIndex > 0 then
   begin
     with qryIONSubData do begin
        Close;
        SQL.Clear;
        SQL.Add('Select procdate, proctime, incarno1, outdate, outtime, OutCarNo1, ');
        SQL.Add('Reserve1, Reserve2, Reserve3, UsedPoint,  ');
        SQL.Add('Case when ISNULL((parkingmin)/(24*60),0) > 0 then                        ');
        SQL.Add('		  CONVERT(VARCHAR(50),ISNULL((parkingmin)/(24*60),0)) +''일'' +         ');
        SQL.Add('		  CONVERT(VARCHAR(50),ISNULL(((parkingmin)%(24*60))/60,0)) +''시간''+   ');
        SQL.Add('		  CONVERT(VARCHAR(50),ISNULL(((parkingmin)%(24*60))%60,0)) +''분''      ');

        SQL.Add('    when  ISNULL((parkingmin)%(24*60)/60,0) > 0 then                       ');
        SQL.Add('		  CONVERT(VARCHAR(50),ISNULL(((parkingmin)%(24*60))/60,0)) +''시간''+   ');
        SQL.Add('		  CONVERT(VARCHAR(50),ISNULL(((parkingmin)%(24*60))%60,0)) +''분''      ');

        SQL.Add('	when  ISNULL(((parkingmin)%(24*60))%60,0) > 0 then                      ');
        SQL.Add('	      CONVERT(VARCHAR(50),ISNULL(((parkingmin)%(24*60))%60,0)) +''분''  ');
        SQL.Add('END                                                                      ');
        SQL.Add(' as ParkingMin, DATEDIFF(dd, procdate, outdate) as prkDate From IONData  ');

        //SQL.Add('Where ProcDate between :v3 and :v4 ');
        SQL.Add('Where ProcDate + '' '' +ProcTime between :v3 and :v4 ');
        Parameters.ParamByName('v3').Value := FormatDateTime('YYYY-MM-DD', edtSDate.Date)+' '+FormatDateTime('HH:MM:SS', edtSTime.Time);
        Parameters.ParamByName('v4').Value := FormatDateTime('YYYY-MM-DD', edtEDate.Date)+' '+FormatDateTime('HH:MM:SS', edtETime.Time);
        SQL.Add('and reserve2 <> '''' and reserve3 <> ''''  ');
        if edtCarNo.Text <> '' then begin
          SQL.Add('And InCarNo1 like :v5 ');
          Parameters.ParamByName('v5').Value := '%'+Trim(edtCarNo.Text)+'%';
        end;
        SQL.Add('group by procdate, proctime, incarno1, outdate, outtime, OutCarNo1, Reserve1, Reserve2, Reserve3, ParkingMin, UsedPoint ');
        if cmbType.ItemIndex = 1 then     //5일 미만
        begin
          SQL.Add('having DATEDIFF(dd, procdate, outdate) <= 5  ');
        end
        else if cmbType.ItemIndex = 2 then     //5일~10일
        begin
          SQL.Add('having DATEDIFF(dd, procdate, outdate) >= 5 and DATEDIFF(dd, procdate, outdate) <= 10           ');
        end
        else if cmbType.ItemIndex = 3 then    //10일~20일
        begin
          SQL.Add('having DATEDIFF(dd, procdate, outdate) >= 10 and DATEDIFF(dd, procdate, outdate) <= 20          ');
        end
        else if cmbType.ItemIndex = 4 then  //20일~30일
        begin
          SQL.Add('having DATEDIFF(dd, procdate, outdate) >= 20 and DATEDIFF(dd, procdate, outdate) <= 30          ');
        end
        else if cmbType.ItemIndex = 5 then  //30일 이상
        begin
          SQL.Add('having DATEDIFF(dd, procdate, outdate) >= 30  ');
        end;
        Parameters.ParamByName('v3').Value := FormatDateTime('YYYY-MM-DD', edtSDate.Date);
        ExceptLogging(SQL.Text);
        Open;
        if RecordCount > 0 then begin
          btnExcel1.Enabled := True;
        end else begin
          btnExcel1.Enabled := False;
        end;
     end;

     //dg2.AutoSizeColumns(True);

     if homenetuse = 0 then  //홈넷 포인트 사용 안할시
     begin
       dg2.Columns[12].Width := 0;
       rbHomenetPoint.Visible := false;
     end;
   end
   else
   begin
     with qryIONSubData, DBGrid2 do begin
        Close;
        SQL.Clear;
        //SQL.Add('Select * From IONData ');
        {SQL.Add('Select procdate, proctime, incarno1, outdate, outtime, OutCarNo1, ');
        SQL.Add('Reserve1, Reserve2, Reserve3, ParkingMin, UsedPoint, DATEDIFF(dd, procdate, outdate) as prkDate From IONData  ');
        SQL.Add('Where ProcDate between :v3 and  :v4 ');
        if edtCarNo.Text <> '' then begin
          //SQL.Add('And InCarNo1 = :v5');
          SQL.Add('And InCarNo1 like :v5');
          Parameters.ParamByName('v5').Value := '%'+Trim(edtCarNo.Text)+'%';
        end;
        SQL.Add('Order by ProcDate + ProcTime DESC');}

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
        SQL.Add(' as ParkingMin,                                                          ');
        SQL.Add('UsedPoint, DATEDIFF(dd, procdate, outdate) as prkDate                    ');
        SQL.Add('From IONData                                                             ');
        //SQL.Add('Where ProcDate between :v3 and :v4                    ');
        SQL.Add('Where ProcDate + '' '' +ProcTime between :v3 and :v4 ');
        SQL.Add('and reserve2 <> '''' and reserve3 <> ''''  ');
        if edtCarNo.Text <> '' then begin
          SQL.Add('And InCarNo1 like :v5 ');
          Parameters.ParamByName('v5').Value := '%'+Trim(edtCarNo.Text)+'%';
        end;

        SQL.Add(' union ');
        SQL.Add('Select ''합계'', '''', '''', '''', '''', '''',             ');
        SQL.Add(' '''', '''', '''',                                         ');
        SQL.Add('Case when ISNULL((SUM(parkingmin))/(24*60),0) > 0 then                        ');
        SQL.Add('		  CONVERT(VARCHAR(50),ISNULL(SUM(parkingmin)/(24*60),0)) +''일'' +         ');
        SQL.Add('		  CONVERT(VARCHAR(50),ISNULL((SUM(parkingmin)%(24*60))/60,0)) +''시간''+   ');
        SQL.Add('		  CONVERT(VARCHAR(50),ISNULL((SUM(parkingmin)%(24*60))%60,0)) +''분''      ');
        SQL.Add('    when  ISNULL((SUM(parkingmin))%(24*60)/60,0) > 0 then                     ');
        SQL.Add('		  CONVERT(VARCHAR(50),ISNULL((SUM(parkingmin)%(24*60))/60,0)) +''시간''+   ');
        SQL.Add('		  CONVERT(VARCHAR(50),ISNULL((SUM(parkingmin)%(24*60))%60,0)) +''분''      ');
        SQL.Add('	when  ISNULL(((SUM(parkingmin))%(24*60))%60,0) > 0 then                      ');
        SQL.Add('	      CONVERT(VARCHAR(50),ISNULL((SUM(parkingmin)%(24*60))%60,0)) +''분''    ');
        SQL.Add(' END                                                                          ');
        SQL.Add(' as ParkingMin,                                                               ');
        SQL.Add(' Sum(UsedPoint) UsedPoint, SUM(DATEDIFF(dd, procdate, outdate)) as prkDate    ');
        SQL.Add(' From IONData                                                                 ');
        SQL.Add(' Where ProcDate + '' '' +ProcTime between :v7 and :v8 ');
        SQL.Add('and reserve2 <> '''' and reserve3 <> ''''  ');
        if edtCarNo.Text <> '' then begin
          SQL.Add('And InCarNo1 like :v6 ');
          Parameters.ParamByName('v6').Value := '%'+Trim(edtCarNo.Text)+'%';
        end;

        //SQL.Add('Order by ProcDate + ProcTime DESC                                        ');
        Parameters.ParamByName('v3').Value := FormatDateTime('YYYY-MM-DD', edtSDate.Date)+' '+FormatDateTime('HH:MM:SS', edtSTime.Time);
        Parameters.ParamByName('v4').Value := FormatDateTime('YYYY-MM-DD', edtEDate.Date)+' '+FormatDateTime('HH:MM:SS', edtETime.Time);
        Parameters.ParamByName('v7').Value := FormatDateTime('YYYY-MM-DD', edtSDate.Date)+' '+FormatDateTime('HH:MM:SS', edtSTime.Time);
        Parameters.ParamByName('v8').Value := FormatDateTime('YYYY-MM-DD', edtEDate.Date)+' '+FormatDateTime('HH:MM:SS', edtETime.Time);
        ExceptLogging(SQL.Text);
        Open;
        if RecordCount > 0 then begin
          btnExcel1.Enabled := True;
        end else begin
          btnExcel1.Enabled := False;
        end;
     end;

     if homenetuse = 1 then  //홈넷 포인트 사용
     begin
       {dg2.AddRow;
       with ADOQuery2 do begin
          //21.02.18 세대별 포인트 합계 추가
          Close;
          SQL.Clear;
          //SQL.Add('Select Sum(ParkingMin) ParkingMin, Sum(UsedPoint) UsedPoint From IONData ');
          SQL.Add('Select Sum(UsedPoint) UsedPoint, ');
          SQL.Add('Case when ISNULL(Sum(ParkingMin)/(24*60),0) > 0 then                        ');
          SQL.Add('		  CONVERT(VARCHAR(50),ISNULL(Sum(ParkingMin)/(24*60),0)) +''일'' +         ');
          SQL.Add('		  CONVERT(VARCHAR(50),ISNULL((Sum(ParkingMin)%(24*60))/60,0)) +''시간''+   ');
          SQL.Add('		  CONVERT(VARCHAR(50),ISNULL((Sum(ParkingMin)%(24*60))%60,0)) +''분''     ');

          SQL.Add('    when  ISNULL(Sum(ParkingMin)%(24*60)/60,0) > 0 then                       ');
          SQL.Add('		  CONVERT(VARCHAR(50),ISNULL((Sum(ParkingMin)%(24*60))/60,0)) +''시간''+   ');
          SQL.Add('		  CONVERT(VARCHAR(50),ISNULL((Sum(ParkingMin)%(24*60))%60,0)) +''분''      ');

          SQL.Add('	when  ISNULL(Sum(ParkingMin)%(24*60)%60,0) > 0 then                     ');
          SQL.Add('	      CONVERT(VARCHAR(50),ISNULL(Sum(ParkingMin)%(24*60)%60,0)) +''분'' ');
          SQL.Add('END                                                                      ');
          SQL.Add(' as ParkingMin,                                                          ');
          SQL.Add(' SUM(DATEDIFF(dd, procdate, outdate)) as prkDate                         ');
          SQL.Add(' From IONData ');
          SQL.Add('Where ProcDate between :v3 and  :v4 ');
          if edtCarNo.Text <> '' then begin
            SQL.Add('And InCarNo1 like :v5 ');
            Parameters.ParamByName('v5').Value := '%'+Trim(edtCarNo.Text)+'%';
          end;
          //SQL.Add('Order by ProcDate + ProcTime DESC ');
          //SQL.Add('Group by UsedPoint ');
          Parameters.ParamByName('v3').Value := FormatDateTime('YYYY-MM-DD', edtSDate.Date);
          Parameters.ParamByName('v4').Value := FormatDateTime('YYYY-MM-DD', edtEDate.Date);
          Open;
          if RecordCount > 0 then begin
            with dg2 do
            begin
                Cells[1, dg2.rowcount - 1]  :=  '합계';
                Cells[10, dg2.rowcount - 1] :=  FieldByName('ParkingMin').AsString;
                Cells[11, dg2.rowcount - 1] :=  FieldByName('prkDate').AsString;
                Cells[12, dg2.rowcount - 1] :=  FieldByName('UsedPoint').AsString;
            end;
          end;
       end;}
     end
     else
     begin
       {dg2.AddRow;
       with ADOQuery2 do begin
          //21.02.18 주차시간 합계 추가
          Close;
          SQL.Clear;
          //SQL.Add('Select Sum(ParkingMin) ParkingMin From IONData ');
          SQL.Add('Select ');

          SQL.Add('Case when ISNULL(Sum(ParkingMin)/(24*60),0) > 0 then                        ');
          SQL.Add('		  CONVERT(VARCHAR(50),ISNULL(Sum(ParkingMin)/(24*60),0)) +''일'' +         ');
          SQL.Add('		  CONVERT(VARCHAR(50),ISNULL((Sum(ParkingMin)%(24*60))/60,0)) +''시간''+   ');
          SQL.Add('		  CONVERT(VARCHAR(50),ISNULL((Sum(ParkingMin)%(24*60))%60,0)) +''분''     ');

          SQL.Add('    when  ISNULL(Sum(ParkingMin)%(24*60)/60,0) > 0 then                       ');
          SQL.Add('		  CONVERT(VARCHAR(50),ISNULL((Sum(ParkingMin)%(24*60))/60,0)) +''시간''+   ');
          SQL.Add('		  CONVERT(VARCHAR(50),ISNULL((Sum(ParkingMin)%(24*60))%60,0)) +''분''      ');

          SQL.Add('	when  ISNULL(Sum(ParkingMin)%(24*60)%60,0) > 0 then                     ');
          SQL.Add('	      CONVERT(VARCHAR(50),ISNULL(Sum(ParkingMin)%(24*60)%60,0)) +''분'' ');
          SQL.Add('END                                                                      ');
          SQL.Add(' as ParkingMin,                                                          ');
          SQL.Add(' SUM(DATEDIFF(dd, procdate, outdate)) as prkDate                         ');
          SQL.Add(' From IONData ');
          SQL.Add('Where ProcDate between :v3 and  :v4 ');
          if edtCarNo.Text <> '' then begin
            SQL.Add('And InCarNo1 like :v5 ');
            Parameters.ParamByName('v5').Value := '%'+Trim(edtCarNo.Text)+'%';
          end;
          //SQL.Add('Order by ProcDate + ProcTime DESC ');
          //SQL.Add('Group by UsedPoint ');
          Parameters.ParamByName('v3').Value := FormatDateTime('YYYY-MM-DD', edtSDate.Date);
          Parameters.ParamByName('v4').Value := FormatDateTime('YYYY-MM-DD', edtEDate.Date);
          ExceptLogging(SQL.Text);
          Open;
          if RecordCount > 0 then begin
            with dg2 do
            begin
                Cells[1, dg2.rowcount - 1]  :=  '합계';
                Cells[10, dg2.rowcount - 1] :=  FieldByName('ParkingMin').AsString;
                Cells[11, dg2.rowcount - 1] :=  FieldByName('prkDate').AsString;
            end;
          end;
       end;}
     end;

     //dg2.AutoNumberCol(0);
     dg2.AutoSizeColumns(True);

     if homenetuse = 0 then  //홈넷 포인트 사용 안할시
     begin
       dg2.Columns[12].Width := 0;
       rbHomenetPoint.Visible := false;
     end;
   end;
end;

procedure TfrmIOVisitStat.znSave_DBGridToExcel(vDBGrid: TDBGrid);
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
    end ;

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
        //if (homenetuse = 0) and (DataCount = 1) then  //홈넷 포인트 사용 안할시
        if (homenetuse = 0) then  //홈넷 포인트 사용 안할시
        begin
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
        end
        else   //홈넷 포인트 사용 시
        begin
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
        end;

          Clipboard.SetTextBuf(PChar(sData));
          excelApp.Cells[1,1].Pastespecial;
//          Format := '@';
//          excelApp.Range['D1', 'D1'].NumberFormatLocal := Format;
          //excelApp.Range['A1', 'B1'].NumberFormat := Format;
          //excelApp.Range['A1', Chr(64+vDBGrid.Columns.Count)+IntToStr(k)].select;
          excelApp.Selection.Columns.AutoFit;
          excelApp.Range['A1', 'A1'].select;

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
