unit Day_IOS_ION;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  AdvDateTimePicker, Vcl.ExtCtrls, Vcl.Grids, AdvObj, BaseGrid, AdvGrid,
  Data.DB, Data.Win.ADODB, tmsAdvGridExcel, AdvCombo, ColCombo;

type
  TDay_ION_IOS_Data = class(TForm)
    sgCount: TAdvStringGrid;
    Panel1: TPanel;
    Bevel2: TBevel;
    Label7: TLabel;
    Label8: TLabel;
    edtSDate: TAdvDateTimePicker;
    edtEDate: TAdvDateTimePicker;
    btnSearch: TBitBtn;
    btnExcel: TBitBtn;
    btnClose: TBitBtn;
    Title: TPanel;
    Label1: TLabel;
    TitleCount: TPanel;
    TitleDay: TPanel;
    qryCount: TADOQuery;
    qryTemp: TADOQuery;
    eCount: TAdvGridExcelIO;
    SaveDialog1: TSaveDialog;
    ParkNo_ComBox: TComboBox;
    Label2: TLabel;
    procedure btnSearchClick(Sender: TObject);
    procedure DayCountSearch(ParkNo: Integer; ParkName: String);
    procedure ParkNoSearch;
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Day_ION_IOS_Data: TDay_ION_IOS_Data;

implementation

uses
  Tables, Global;

{$R *.dfm}

procedure TDay_ION_IOS_Data.btnCloseClick(Sender: TObject);
begin
   Close;
end;

procedure TDay_ION_IOS_Data.btnExcelClick(Sender: TObject);
begin
  try
    if savedialog1.Execute then
    begin
      eCount.XLSExport(savedialog1.filename + '.xls');
      ShowMessage('엑셀파일로 저장완료!');
    end;
  except
    on E: Exception do ExceptLogging('TDay_IOS_ION.btnExcelClick: ' + E.Message);
  end;
end;
procedure TDay_ION_IOS_Data.btnSearchClick(Sender: TObject);
var
   ParkNo : Integer;
   ParkName : string;
begin
    //showMessage(ParkNo_ComBox.Items.Strings[ParkNo_ComBox.ItemIndex]);
    ParkNo := Integer(ParkNo_ComBox.Items.Objects[ParkNo_ComBox.ItemIndex]); //콤보박스에서 아이템 parkno값 가져오기
    ParkName := ParkNo_ComBox.Items.Strings[ParkNo_ComBox.ItemIndex];
    DayCountSearch(ParkNo, ParkName);
end;

//요일별 입차 조회
procedure TDay_ION_IOS_Data.DayCountSearch(ParkNo: Integer; ParkName: String);
var
  i, j: Byte;
begin
  with qryTemp, sgCount do
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
      with sgCount do begin
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

      end;
      Next;
    end;
  end;
  btnExcel.Enabled:= True;
end;

procedure TDay_ION_IOS_Data.FormShow(Sender: TObject);
begin
    edtSDate.Date := Now;
    edtEDate.Date := Now;
    ParkNoSearch;
end;

//주차장소 조회
procedure TDay_ION_IOS_Data.ParkNoSearch;
var
   ParkNo : Integer;
begin
  ParkNo_ComBox.Items.Clear;
  ParkNo_ComBox.Style := csDropDownList;
  with qryCount do
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

end.
