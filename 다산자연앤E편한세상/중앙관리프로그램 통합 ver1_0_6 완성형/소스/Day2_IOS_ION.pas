unit Day2_IOS_ION;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, tmsAdvGridExcel, Data.DB,
  Data.Win.ADODB, Vcl.Grids, AdvObj, BaseGrid, AdvGrid, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ComCtrls, AdvDateTimePicker, Vcl.ExtCtrls;

type
  TDay2_IOS_ION_Data = class(TForm)
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
    procedure ParkNoSearch;
    procedure FormShow(Sender: TObject);
    procedure Day2CountSearch(ParkNo: Integer; ParkName : String);
    procedure btnSearchClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Day2_IOS_ION_Data: TDay2_IOS_ION_Data;

implementation

uses
  Global;

{$R *.dfm}

{ TDay2_IOS_ION_Data }

procedure TDay2_IOS_ION_Data.FormShow(Sender: TObject);
begin
   edtSDate.Date := Now;
   ParkNoSearch; //주차 장소 조회
end;

procedure TDay2_IOS_ION_Data.btnCloseClick(Sender: TObject);
begin
   Close;
end;

procedure TDay2_IOS_ION_Data.btnExcelClick(Sender: TObject);
begin
  try
    if savedialog1.Execute then
    begin
      eCount.XLSExport(savedialog1.filename + '.xls');
      ShowMessage('엑셀파일로 저장완료!');
    end;
  except
    on E: Exception do ExceptLogging('TDay2_IOS_ION.btnExcelClick: ' + E.Message);
  end;
end;

procedure TDay2_IOS_ION_Data.btnSearchClick(Sender: TObject);
var
   ParkNo : Integer;
   ParkName : string;
begin
     ParkNo := Integer(ParkNo_ComBox.Items.Objects[ParkNo_ComBox.ItemIndex]); //콤보박스에서 아이템 parkno값 가져오기
     ParkName := ParkNo_ComBox.Items.Strings[ParkNo_ComBox.ItemIndex];
     Day2CountSearch(ParkNo, ParkName);
end;

procedure TDay2_IOS_ION_Data.Day2CountSearch(ParkNo: Integer;   ParkName: String);
var
  i : Byte;
begin

  with qryTemp, sgCount do
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
        AutoSize := True;
        Next;
      end;

    end;
  end;
  btnExcel.Enabled := True;
end;

procedure TDay2_IOS_ION_Data.ParkNoSearch;
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
