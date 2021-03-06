unit Condition_IOS_ION;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvOfficeTabSet, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.ComCtrls, sTabControl, tmsAdvGridExcel, Data.DB,
  Data.Win.ADODB, Vcl.Grids, AdvObj, BaseGrid, AdvGrid, Vcl.Buttons,
  AdvDateTimePicker, sPanel, DateUtils, Bde.DBTables;

type
  TCondition_IOS_ION_Data = class(TForm)
    tab_main: TsTabControl;
    Day_Panel: TsPanel;
    Title: TPanel;
    TitleDay: TPanel;
    TitleCount: TPanel;
    Label2: TLabel;
    ParkNo_ComBox: TComboBox;
    Panel1: TPanel;
    Bevel2: TBevel;
    Label8: TLabel;
    edtSDate: TAdvDateTimePicker;
    btnSearch: TBitBtn;
    btnExcel: TBitBtn;
    btnClose: TBitBtn;
    sgCount: TAdvStringGrid;
    qryTemp: TADOQuery;
    qryCount: TADOQuery;
    SaveDialog1: TSaveDialog;
    eCount: TAdvGridExcelIO;
    sgcount2: TAdvStringGrid;
    sgcount3: TAdvStringGrid;
    sgcount4: TAdvStringGrid;
    edtEdate: TAdvDateTimePicker;
    Label13: TLabel;
    procedure tab_mainChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ParkNoSearch;
    procedure CountSearch(PanelNo, ParkNo: Integer; ParkName : String);
    procedure btnSearchClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure btnClose2Click(Sender: TObject);
    procedure edtSDateCloseUp(Sender: TObject);
    procedure edtEdateCloseUp(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Condition_IOS_ION_Data: TCondition_IOS_ION_Data;
  ParkNo : Integer;     //주차 장소 번호
  ParkName : string;    //주차 장소 이름
  TitleTerm, TitleTerm2, TitleTerm3, TitleTerm4 : string;
  TitleCName,  TitleCName2, TitleCName3, TitleCName4 :string;
  Sdate : String;
implementation

uses
  Global;

{$R *.dfm}

//일별 입차 조회
procedure TCondition_IOS_ION_Data.btnClose2Click(Sender: TObject);
begin
  Close;
end;

procedure TCondition_IOS_ION_Data.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TCondition_IOS_ION_Data.btnExcelClick(Sender: TObject);
begin
  try
    if savedialog1.Execute then
    begin
      if tab_main.TabIndex = 0 then
      begin
        eCount.AdvStringGrid := sgCount;
      end
      else if tab_main.TabIndex = 1 then
      begin
        eCount.AdvStringGrid := sgCount2;
      end
      else if tab_main.TabIndex = 2 then
      begin
        eCount.AdvStringGrid := sgCount3;
      end
      else if tab_main.TabIndex = 3 then
      begin
        eCount.AdvStringGrid := sgCount4;
      end;
      eCount.XLSExport(savedialog1.filename + '.xls');
      ShowMessage('엑셀파일로 저장완료!');
    end;
  except
    on E: Exception do ExceptLogging('TCondition_Day_IOS_ION.btnExcelClick: ' + E.Message);
  end;
end;

//일별 입차 현황
procedure TCondition_IOS_ION_Data.btnSearchClick(Sender: TObject);
begin

     ParkNo := Integer(ParkNo_ComBox.Items.Objects[ParkNo_ComBox.ItemIndex]); //콤보박스에서 아이템 parkno값 가져오기
     ParkName := ParkNo_ComBox.Items.Strings[ParkNo_ComBox.ItemIndex];
     Sdate := '1';

     if tab_main.TabIndex = 0 then
     begin
         CountSearch(1, ParkNo, ParkName);
     end
     else if tab_main.TabIndex = 1 then
     begin
         CountSearch(2, ParkNo, ParkName);
     end
     else if tab_main.TabIndex = 2 then
     begin
         CountSearch(3, ParkNo, ParkName);
     end
     else if tab_main.TabIndex = 3 then
     begin
         CountSearch(4, ParkNo, ParkName);
     end;
end;


procedure TCondition_IOS_ION_Data.CountSearch(PanelNo, ParkNo: Integer; ParkName: String);
var
  i, j : Integer;
begin
   if PanelNo = 1 then
   begin
      with qryTemp, sgCount do   //일별 입차현황
      begin
       //그리드 기본 셋팅
        Clear;
        Cells[0, 0]:= '시간/장소' ;
        Cells[0, 1]:= '00 ~ 01시' ;
        Cells[0, 2]:= '01 ~ 02시' ;
        Cells[0, 3]:= '02 ~ 03시' ;
        Cells[0, 4]:= '03 ~ 04시' ;
        Cells[0, 5]:= '04 ~ 05시' ;
        Cells[0, 6]:= '05 ~ 06시' ;
        Cells[0, 7]:= '06 ~ 07시' ;
        Cells[0, 8]:= '07 ~ 08시' ;
        Cells[0, 9]:= '08 ~ 09시' ;
        Cells[0, 10]:= '09 ~ 10시' ;
        Cells[0, 11]:= '10 ~ 11시' ;
        Cells[0, 12]:= '11 ~ 12시' ;
        Cells[0, 13]:= '12 ~ 13시' ;
        Cells[0, 14]:= '13 ~ 14시' ;
        Cells[0, 15]:= '14 ~ 15시' ;
        Cells[0, 16]:= '15 ~ 16시' ;
        Cells[0, 17]:= '16 ~ 17시' ;
        Cells[0, 18]:= '17 ~ 18시' ;
        Cells[0, 19]:= '18 ~ 19시' ;
        Cells[0, 20]:= '19 ~ 20시' ;
        Cells[0, 21]:= '20 ~ 21시';
        Cells[0, 22]:= '21 ~ 22시';
        Cells[0, 23]:= '22 ~ 23시';
        Cells[0, 24]:= '23 ~ 24시';
        Cells[0, 25]:= '합 계';
        //조회 문 프로시저 작성
        Close;
        SQL.Clear;
        SQL.Add('EXEC SP_DAY_IOS_ION_DATA_COUNT ''4'', :N1, :N2, '''+IntToStr(ParkNo)+''', '''+ParkName+''' ');
        Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
        Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
        Open;

        if eof then
        begin
          ShowMessage('데이터가 없습니다.');
          Exit;
        end;

        while not Eof do
        begin
          TitleDay.Caption := Copy(DateToStr(edtSDate.date),1,4)+'.'+Copy(DateToStr(edtSDate.date),6,2)+'.'+Copy(DateToStr(edtSDate.date),9,2);//Copy(DateToStr(edtSDate.date),3,2)+'년'+Copy(DateToStr(edtSDate.date),6,2)+'월'+Copy(DateToStr(edtSDate.date),9,2)+'일';
          sgCount.RowCount := RecordCount ; //-----------------> 순서도 이부분
          TitleTerm := TitleDay.Caption;
          //String grid부분 동적으로 데이터 생성
          for I := 0  to RecordCount - 1 do
          begin // -------------------------------------------->>추가
            ColCount :=  RecordCount + 1;
            RowCount := 26;

            Cells[i+1, 0] := Trim(FieldByName('ParkName').AsString);
            Cells[i+1, 1] := FieldByName('00').AsString;
            Cells[i+1, 2] := FieldByName('01').AsString;
            Cells[i+1, 3] := FieldByName('02').AsString;
            Cells[i+1, 4] := FieldByName('03').AsString;
            Cells[i+1, 5] := FieldByName('04').AsString;
            Cells[i+1, 6] := FieldByName('05').AsString;
            Cells[i+1, 7] := FieldByName('06').AsString;
            Cells[i+1, 8] := FieldByName('07').AsString;
            Cells[i+1, 9] := FieldByName('08').AsString;
            Cells[i+1, 10] := FieldByName('09').AsString;
            Cells[i+1, 11] := FieldByName('10').AsString;
            Cells[i+1, 12] := FieldByName('11').AsString;
            Cells[i+1, 13] := FieldByName('12').AsString;
            Cells[i+1, 14] := FieldByName('13').AsString;
            Cells[i+1, 15] := FieldByName('14').AsString;
            Cells[i+1, 16] := FieldByName('15').AsString;
            Cells[i+1, 17] := FieldByName('16').AsString;
            Cells[i+1, 18] := FieldByName('17').AsString;
            Cells[i+1, 19] := FieldByName('18').AsString;
            Cells[i+1, 20] := FieldByName('19').AsString;
            Cells[i+1, 21] := FieldByName('20').AsString;
            Cells[i+1, 22] := FieldByName('21').AsString;
            Cells[i+1, 23] := FieldByName('22').AsString;
            Cells[i+1, 24] := FieldByName('23').AsString;
            Cells[i+1, 25] := FieldByName('TotalDay').AsString;
            TitleCount.Caption := '기준 : '+Cells[i+1, 25]+' 대수';
            TitleCName := TitleCount.Caption;
            Next;
          end;
        end;
        AutoSize := True;
      end;
      btnExcel.Enabled := True;
   end
   else if PanelNo = 2 then      //요일별 입차현황
   begin
      with qryTemp, sgCount2 do
      begin
        //그리드 기본 셋팅
        Clear;
        Cells[0, 0]:= '시간/ 요일' ;
        Cells[1, 0]:= '월' ;
        Cells[2, 0]:= '화' ;
        Cells[3, 0]:= '수' ;
        Cells[4, 0]:= '목' ;
        Cells[5, 0]:= '금' ;
        Cells[6, 0]:= '토' ;
        Cells[7, 0]:= '일' ;
        Cells[8, 0]:= '합계' ;

        Cells[0, 1]:= '00 ~ 01시' ;
        Cells[0, 2]:= '01 ~ 02시' ;
        Cells[0, 3]:= '02 ~ 03시' ;
        Cells[0, 4]:= '03 ~ 04시' ;
        Cells[0, 5]:= '04 ~ 05시' ;
        Cells[0, 6]:= '05 ~ 06시' ;
        Cells[0, 7]:= '06 ~ 07시' ;
        Cells[0, 8]:= '07 ~ 08시' ;
        Cells[0, 9]:= '08 ~ 09시' ;
        Cells[0, 10]:= '09 ~ 10시' ;
        Cells[0, 11]:= '10 ~ 11시' ;
        Cells[0, 12]:= '11 ~ 12시' ;
        Cells[0, 13]:= '12 ~ 13시' ;
        Cells[0, 14]:= '13 ~ 14시' ;
        Cells[0, 15]:= '14 ~ 15시' ;
        Cells[0, 16]:= '15 ~ 16시' ;
        Cells[0, 17]:= '16 ~ 17시' ;
        Cells[0, 18]:= '17 ~ 18시' ;
        Cells[0, 19]:= '18 ~ 19시' ;
        Cells[0, 20]:= '19 ~ 20시' ;
        Cells[0, 21]:= '20 ~ 21시';
        Cells[0, 22]:= '21 ~ 22시';
        Cells[0, 23]:= '22 ~ 23시';
        Cells[0, 24]:= '23 ~ 24시';
        Cells[0, 25]:= '합 계';

        //조회 문 프로시저 작성
        Close;
        SQL.Clear;
        SQL.Add('EXEC SP_DAY_IOS_ION_DATA_COUNT ''1'', :N1, :N2, '''+IntToStr(ParkNo)+''', '''+ParkName+''' ');
        Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
        Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
        Open;

        if eof then
        begin
          ShowMessage('데이터가 없습니다.');
          Exit;
        end;

        while not Eof do
        begin

          TitleDay.Caption := Copy(DateToStr(edtSDate.date),3,2)+'년'+Copy(DateToStr(edtSDate.date),6,2)+'월'+Copy(DateToStr(edtSDate.date),9,2)+'일'
                  + ' ~ '+Copy(DateToStr(edtEDate.date),3,2)+'년'+Copy(DateToStr(edtEDate.date),6,2)+'월'+Copy(DateToStr(edtEDate.date),9,2)+'일';
          TitleTerm2 := TitleDay.Caption;
          with sgCount2 do begin
             if FieldByName('ProcDay').AsString = '월요일'
             then
             begin
                 i := 1;
                 j := 0;
                 Cells[i, 25] := FieldByName('TotalDay').AsString;
             end;
             if FieldByName('ProcDay').AsString = '화요일'
             then
             begin
                 i := 2;
                 j := 0;
                 Cells[i, 25] := FieldByName('TotalDay').AsString;
             end;
             if FieldByName('ProcDay').AsString = '수요일'
             then
             begin
                 i := 3;
                 j := 0;
                 Cells[i, 25] := FieldByName('TotalDay').AsString;
             end;
             if FieldByName('ProcDay').AsString = '목요일'
             then
             begin
                 i := 4;
                 j := 0;
                 Cells[i, 25] := FieldByName('TotalDay').AsString;
             end;
             if FieldByName('ProcDay').AsString = '금요일'
             then
             begin
                 i := 5;
                 j := 0;
                 Cells[i, 25] := FieldByName('TotalDay').AsString;
             end;
             if FieldByName('ProcDay').AsString = '토요일'
             then
             begin
                 i := 6;
                 j := 0;
                 Cells[i, 25] := FieldByName('TotalDay').AsString;
             end;
             if FieldByName('ProcDay').AsString = '일요일'
             then
             begin
                 i := 7;
                 j := 0;
                 Cells[i, 25] := FieldByName('TotalDay').AsString;
             end;
             if FieldByName('ProcDay').AsString = '합계'
             then
             begin
                 i := 8;
                 j := 0;
                 Cells[i, 25] := FieldByName('TotalDay').AsString;
                 TitleCount.Caption := '기준 : ' + FieldByName('TotalDay').AsString+'대수';
                 TitleCName2 := TitleCount.Caption;
             end;
             Cells[i, j + 1] := FieldByName('00').AsString;
             Cells[i, j + 2] := FieldByName('01').AsString;
             Cells[i, j + 3] := FieldByName('02').AsString;
             Cells[i, j + 4] := FieldByName('03').AsString;
             Cells[i, j + 5] := FieldByName('04').AsString;
             Cells[i, j + 6] := FieldByName('05').AsString;
             Cells[i, j + 7] := FieldByName('06').AsString;
             Cells[i, j + 8] := FieldByName('07').AsString;
             Cells[i, j + 9] := FieldByName('08').AsString;
             Cells[i, j + 10] := FieldByName('09').AsString;
             Cells[i, j + 11] := FieldByName('10').AsString;
             Cells[i, j + 12] := FieldByName('11').AsString;
             Cells[i, j + 13] := FieldByName('12').AsString;
             Cells[i, j + 14] := FieldByName('13').AsString;
             Cells[i, j + 15] := FieldByName('14').AsString;
             Cells[i, j + 16] := FieldByName('15').AsString;
             Cells[i, j + 17] := FieldByName('16').AsString;
             Cells[i, j + 18] := FieldByName('17').AsString;
             Cells[i, j + 19] := FieldByName('18').AsString;
             Cells[i, j + 20] := FieldByName('19').AsString;
             Cells[i, j + 21] := FieldByName('20').AsString;
             Cells[i, j + 22] := FieldByName('21').AsString;
             Cells[i, j + 23] := FieldByName('22').AsString;
             Cells[i, j + 24] := FieldByName('23').AsString;
              Next;
          end;

        end;
        AutoSize := True;
      end;
      btnExcel.Enabled:= True;
   end
   else if PanelNo = 3 then   //기간별 입차현황
   begin
      with qryTemp, sgCount3 do
      begin
       //그리드 기본 셋팅
        Clear;

        Cells[0, 0]:= '시간 / 일' ;
        Cells[0, 1]:= '00 ~ 01시' ;
        Cells[0, 2]:= '01 ~ 02시' ;
        Cells[0, 3]:= '02 ~ 03시' ;
        Cells[0, 4]:= '03 ~ 04시' ;
        Cells[0, 5]:= '04 ~ 05시' ;
        Cells[0, 6]:= '05 ~ 06시' ;
        Cells[0, 7]:= '06 ~ 07시' ;
        Cells[0, 8]:= '07 ~ 08시' ;
        Cells[0, 9]:= '08 ~ 09시' ;
        Cells[0, 10]:= '09 ~ 10시' ;
        Cells[0, 11]:= '10 ~ 11시' ;
        Cells[0, 12]:= '11 ~ 12시' ;
        Cells[0, 13]:= '12 ~ 13시' ;
        Cells[0, 14]:= '13 ~ 14시' ;
        Cells[0, 15]:= '14 ~ 15시' ;
        Cells[0, 16]:= '15 ~ 16시' ;
        Cells[0, 17]:= '16 ~ 17시' ;
        Cells[0, 18]:= '17 ~ 18시' ;
        Cells[0, 19]:= '18 ~ 19시' ;
        Cells[0, 20]:= '19 ~ 20시' ;
        Cells[0, 21]:= '20 ~ 21시';
        Cells[0, 22]:= '21 ~ 22시';
        Cells[0, 23]:= '22 ~ 23시';
        Cells[0, 24]:= '23 ~ 24시';
        Cells[0, 25]:= '합 계';
        //조회 문 프로시저 작성
        Close;
        SQL.Clear;
        SQL.Add('EXEC SP_DAY_IOS_ION_DATA_COUNT ''2'', :N1, :N2, '''+IntToStr(ParkNo)+''', '''+ParkName+''' ');
        //SQL.Text :='EXEC SP_DAY_IOS_ION_DATA_COUNT ''2'', :N1, :N2, '''+IntToStr(ParkNo)+''', '''+ParkName+''' ';
        Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', edtSDate.Date);
        Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', edtEDate.Date);
        Open;

        if eof then
        begin
          ShowMessage('데이터가 없습니다.');
          Exit;
        end;

        while not Eof do
        begin
          TitleDay.Caption := Copy(DateToStr(edtSDate.date),3,2)+'년'+Copy(DateToStr(edtSDate.date),6,2)+'월'+Copy(DateToStr(edtSDate.date),9,2)+'일'
                  + ' ~ '+Copy(DateToStr(edtEDate.date),3,2)+'년'+Copy(DateToStr(edtEDate.date),6,2)+'월'+Copy(DateToStr(edtEDate.date),9,2)+'일';
          sgCount3.RowCount := RecordCount ; //-----------------> 순서도 이부분
          TitleTerm3 := TitleDay.Caption;
          //String grid부분 동적으로 데이터 생성
          for I := 0  to RecordCount - 1 do
          begin // -------------------------------------------->>추가
            ColCount :=  RecordCount + 1;
            RowCount := 26;

            if Trim(FieldByName('procdate').AsString) = '합계'
            then
            begin
              Cells[i+1, 0] := Trim(FieldByName('procdate').AsString);
            end
            else
            begin
              Cells[i+1, 0] := Copy(FieldByName('procdate').AsString,9,2);
            end;

            Cells[i+1, 1] := FieldByName('00').AsString;
            Cells[i+1, 2] := FieldByName('01').AsString;
            Cells[i+1, 3] := FieldByName('02').AsString;
            Cells[i+1, 4] := FieldByName('03').AsString;
            Cells[i+1, 5] := FieldByName('04').AsString;
            Cells[i+1, 6] := FieldByName('05').AsString;
            Cells[i+1, 7] := FieldByName('06').AsString;
            Cells[i+1, 8] := FieldByName('07').AsString;
            Cells[i+1, 9] := FieldByName('08').AsString;
            Cells[i+1, 10] := FieldByName('09').AsString;
            Cells[i+1, 11] := FieldByName('10').AsString;
            Cells[i+1, 12] := FieldByName('11').AsString;
            Cells[i+1, 13] := FieldByName('12').AsString;
            Cells[i+1, 14] := FieldByName('13').AsString;
            Cells[i+1, 15] := FieldByName('14').AsString;
            Cells[i+1, 16] := FieldByName('15').AsString;
            Cells[i+1, 17] := FieldByName('16').AsString;
            Cells[i+1, 18] := FieldByName('17').AsString;
            Cells[i+1, 19] := FieldByName('18').AsString;
            Cells[i+1, 20] := FieldByName('19').AsString;
            Cells[i+1, 21] := FieldByName('20').AsString;
            Cells[i+1, 22] := FieldByName('21').AsString;
            Cells[i+1, 23] := FieldByName('22').AsString;
            Cells[i+1, 24] := FieldByName('23').AsString;
            Cells[i+1, 25] := FieldByName('TotalDate').AsString;
            TitleCount.Caption := '기준 : '+Cells[i+1, 25]+' 대수';
            TitleCName3 := TitleCount.Caption;
            Next;
          end;
        end;
        AutoSize := True;
      end;
      btnExcel.Enabled := True;
   end
   else if PanelNo = 4 then            //월별 입차현황
   begin
      with qryTemp, sgCount4 do
      begin
       //그리드 기본 셋팅
        Clear;
        Cells[0, 0]:= '시간 / 월' ;
        Cells[0, 1]:= '00 ~ 01시' ;
        Cells[0, 2]:= '01 ~ 02시' ;
        Cells[0, 3]:= '02 ~ 03시' ;
        Cells[0, 4]:= '03 ~ 04시' ;
        Cells[0, 5]:= '04 ~ 05시' ;
        Cells[0, 6]:= '05 ~ 06시' ;
        Cells[0, 7]:= '06 ~ 07시' ;
        Cells[0, 8]:= '07 ~ 08시' ;
        Cells[0, 9]:= '08 ~ 09시' ;
        Cells[0, 10]:= '09 ~ 10시' ;
        Cells[0, 11]:= '10 ~ 11시' ;
        Cells[0, 12]:= '11 ~ 12시' ;
        Cells[0, 13]:= '12 ~ 13시' ;
        Cells[0, 14]:= '13 ~ 14시' ;
        Cells[0, 15]:= '14 ~ 15시' ;
        Cells[0, 16]:= '15 ~ 16시' ;
        Cells[0, 17]:= '16 ~ 17시' ;
        Cells[0, 18]:= '17 ~ 18시' ;
        Cells[0, 19]:= '18 ~ 19시' ;
        Cells[0, 20]:= '19 ~ 20시' ;
        Cells[0, 21]:= '20 ~ 21시';
        Cells[0, 22]:= '21 ~ 22시';
        Cells[0, 23]:= '22 ~ 23시';
        Cells[0, 24]:= '23 ~ 24시';
        Cells[0, 25]:= '합 계';
        //조회 문 프로시저 작성
        Close;
        SQL.Clear;
        SQL.Add('EXEC SP_DAY_IOS_ION_DATA_COUNT ''3'', :N1, :N2, '''+IntToStr(ParkNo)+''', '''+ParkName+''' ');
        Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM', edtSDate.Date);
        Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM', edtEDate.Date);
        Open;

        if eof then
        begin
          ShowMessage('데이터가 없습니다.');
          Exit;
        end;

        while not Eof do
        begin
          TitleDay.Caption := Copy(DateToStr(edtSDate.date),3,2)+'년'+Copy(DateToStr(edtSDate.date),6,2)+'월'
                  + ' ~ '+Copy(DateToStr(edtEDate.date),3,2)+'년'+Copy(DateToStr(edtEDate.date),6,2)+'월';
          sgCount4.RowCount := RecordCount ; //-----------------> 순서도 이부분
          TitleTerm4 := TitleDay.Caption;
          //String grid부분 동적으로 데이터 생성
          for I := 0  to RecordCount - 1 do
          begin // -------------------------------------------->>추가
            ColCount :=  RecordCount + 1;
            RowCount := 26;

            if Trim(FieldByName('ProcMonth').AsString) = '합계'
            then
            begin
              Cells[i+1, 0] := Trim(FieldByName('ProcMonth').AsString);
            end
            else
            begin
              Cells[i+1, 0] := Copy(FieldByName('ProcMonth').AsString,6,2)+'월';
            end;

            Cells[i+1, 1] := FieldByName('00').AsString;
            Cells[i+1, 2] := FieldByName('01').AsString;
            Cells[i+1, 3] := FieldByName('02').AsString;
            Cells[i+1, 4] := FieldByName('03').AsString;
            Cells[i+1, 5] := FieldByName('04').AsString;
            Cells[i+1, 6] := FieldByName('05').AsString;
            Cells[i+1, 7] := FieldByName('06').AsString;
            Cells[i+1, 8] := FieldByName('07').AsString;
            Cells[i+1, 9] := FieldByName('08').AsString;
            Cells[i+1, 10] := FieldByName('09').AsString;
            Cells[i+1, 11] := FieldByName('10').AsString;
            Cells[i+1, 12] := FieldByName('11').AsString;
            Cells[i+1, 13] := FieldByName('12').AsString;
            Cells[i+1, 14] := FieldByName('13').AsString;
            Cells[i+1, 15] := FieldByName('14').AsString;
            Cells[i+1, 16] := FieldByName('15').AsString;
            Cells[i+1, 17] := FieldByName('16').AsString;
            Cells[i+1, 18] := FieldByName('17').AsString;
            Cells[i+1, 19] := FieldByName('18').AsString;
            Cells[i+1, 20] := FieldByName('19').AsString;
            Cells[i+1, 21] := FieldByName('20').AsString;
            Cells[i+1, 22] := FieldByName('21').AsString;
            Cells[i+1, 23] := FieldByName('22').AsString;
            Cells[i+1, 24] := FieldByName('23').AsString;
            Cells[i+1, 25] := FieldByName('TotalMonth').AsString;
            TitleCount.Caption := '기준 : '+Cells[i+1, 25]+' 대수';
            TitleCName4 := TitleCount.Caption;
            Next;
          end;
        end;
        AutoSize := True;
      end;
      btnExcel.Enabled := True;
   end;
end;

procedure TCondition_IOS_ION_Data.edtSDateCloseUp(Sender: TObject);
var
 MEDate : TDate;
begin
   if tab_main.TabIndex = 0 then
   begin
      edtSDate.Format := FormatDateTime('YYYY-MM-DD', edtSDate.Date);
   end
   else if tab_main.TabIndex = 1 then
   begin
      edtSDate.Format := FormatDateTime('YYYY-MM-DD', edtSDate.Date);
      MEDate := EndOfTheMonth(edtSDate.Date);
      edtEDate.Format := FormatDateTime('YYYY-MM-DD', MEDate);
      edtEDate.Date := MEDate;
   end
   else if tab_main.TabIndex = 2 then
   begin
      edtSDate.Format := FormatDateTime('YYYY-MM-DD', edtSDate.Date);
      MEDate := EndOfTheMonth(edtSDate.Date);
      edtEDate.Format := FormatDateTime('YYYY-MM-DD', MEDate);
      edtEDate.Date := MEDate;
   end
   else if tab_main.TabIndex = 3 then
   begin
      edtSDate.Format := FormatDateTime('YYYY-MM', edtSDate.Date);
   end;

end;

procedure TCondition_IOS_ION_Data.edtEdateCloseUp(Sender: TObject);
begin
   if tab_main.TabIndex = 0 then
   begin
      edtEDate.Format := FormatDateTime('YYYY-MM-DD', edtEDate.Date);
   end
   else if tab_main.TabIndex = 1 then
   begin
      edtEDate.Format := FormatDateTime('YYYY-MM-DD', edtEDate.Date);
   end
   else if tab_main.TabIndex = 2 then
   begin
      edtEDate.Format := FormatDateTime('YYYY-MM-DD', edtEDate.Date);
   end
   else if tab_main.TabIndex = 3 then
   begin
      edtEDate.Format := FormatDateTime('YYYY-MM', edtEDate.Date);
   end;
end;

procedure TCondition_IOS_ION_Data.FormShow(Sender: TObject);
begin
     qryTemp.lockType := ltReadOnly;
     qryTemp.cursorType := ctOpenForwardOnly;

     edtSDate.Date := Now;
     edtEDate.Date := Now;
     tab_mainChange(Self);   //tab 컨트롤 적용
     ParkNoSearch;           //주차정보 조회
end;

//주차 장소 및 정보 조회
procedure TCondition_IOS_ION_Data.ParkNoSearch;
var
   ParkNo : Integer;
begin
  ParkNo_ComBox.Items.Clear;
  ParkNo_ComBox.Style := csDropDownList;

  with qryTemp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select ParkNo, ParkName ');
    SQL.Add('from ParkInfo ');
    Open;

    while not Eof do
    begin
      ParkNo_ComBox.Items.AddObject(FieldByName('ParkName').AsString, TObject(FieldByName('ParkNo').AsInteger));
      if FieldByName('ParkName').AsString ='전체'
      then
      begin
         ParkNo := FieldByName('ParkNo').AsInteger - 1;
         ParkNo_ComBox.ItemIndex := ParkNo;

      end;
      Next;
    end;
  end;

end;

procedure TCondition_IOS_ION_Data.tab_mainChange(Sender: TObject);
begin
     if tab_main.TabIndex = 0 then
     begin
          sgCount.Visible := True;
          sgCount2.Visible := False;
          sgCount3.Visible := False;
          sgCount4.Visible := False;

          Day_Panel.Align := alClient;
          sgCount.Align := alClient;

          edtEDate.Visible := False;
          Label13.Visible := False;
          if Sdate <> '1' then
          begin
             edtSDate.Format := FormatDateTime('YYYY-MM-DD', Now);
             edtSDate.Date := Now;
          end
          else
          begin
             edtSDate.Format := FormatDateTime('YYYY-MM-DD', edtSDate.date);
          end;

          Title.Caption := '시간대별(지하,타워,지상,전체)입차(출차,정산)현황';
          TitleDay.Caption := TitleTerm;
          TitleDay.Alignment := taRightJustify;
          TitleCount.Caption := TitleCName;

     end
     else if tab_main.TabIndex = 1 then
     begin
         sgCount.Visible := False;
         sgCount2.Visible := True;
         sgCount3.Visible := False;
         sgCount4.Visible := False;

         Day_Panel.Align := alClient;
         sgCount2.Align := alClient;

         edtEDate.Visible := True;
         Label13.Visible := True;
         if Sdate <> '1' then
         begin
           edtSDate.Format := FormatDateTime('YYYY-MM-DD', Now);
           edtEDate.Format := FormatDateTime('YYYY-MM-DD', Now);
           edtSDate.Date := Now;
           edtEDate.Date := Now;
         end
         else
         begin
            edtSDate.Format := FormatDateTime('YYYY-MM-DD', edtSDate.date);
            edtEDate.Format := FormatDateTime('YYYY-MM-DD', edtEDate.date);
         end;

         Title.Caption := '요일별(지하,타워,지상,전체)입차(출차,정산)현황';
         TitleDay.Caption := TitleTerm2;
         TitleDay.Alignment := taCenter;
         TitleCount.Caption := TitleCName2;

     end
     else if tab_main.TabIndex = 2 then
     begin
         sgCount.Visible := False;
         sgCount2.Visible := False;
         sgCount3.Visible := True;
         sgCount4.Visible := False;

         Day_Panel.Align := alClient;
         sgCount3.Align := alClient;

         edtEDate.Visible := True;
         Label13.Visible := True;

         if Sdate <> '1' then
         begin
           edtSDate.Format := FormatDateTime('YYYY-MM-DD', Now);
           edtEDate.Format := FormatDateTime('YYYY-MM-DD', Now);
           edtSDate.Date := Now;
           edtEDate.Date := Now;
         end
         else
         begin
            edtSDate.Format := FormatDateTime('YYYY-MM-DD', edtSDate.date);
            edtEDate.Format := FormatDateTime('YYYY-MM-DD', edtEDate.date);
         end;

         Title.Caption := '기간별(지하,타워,지상,전체)입차(출차,정산)현황';
         TitleDay.Caption := TitleTerm3;
         TitleDay.Alignment := taCenter;
         TitleCount.Caption := TitleCName3;


     end
     else if tab_main.TabIndex = 3 then
     begin
         sgCount.Visible := False;
         sgCount2.Visible := False;
         sgCount3.Visible := False;
         sgCount4.Visible := True;

         Day_Panel.Align := alClient;
         sgCount4.Align := alClient;

         edtEDate.Visible := True;
         Label13.Visible := True;


         if Sdate <> '1' then
         begin
           edtSDate.Format := FormatDateTime('YYYY-MM', Now);
           edtEDate.Format := FormatDateTime('YYYY-MM', Now);
           edtSDate.Date := Now;
           edtEDate.Date := Now;
         end
         else
         begin
            edtSDate.Format := FormatDateTime('YYYY-MM', edtSDate.date);
            edtEDate.Format := FormatDateTime('YYYY-MM', edtEDate.date);
         end;

         Title.Caption := '월별(지하,타워,지상,전체)입차(출차,정산)현황';
         TitleDay.Caption := TitleTerm4;
         TitleDay.Alignment := taCenter;
         TitleCount.Caption := TitleCName4;
     end;
end;

end.
