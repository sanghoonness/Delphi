unit Homenet_Point;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, AdvObj, BaseGrid, AdvGrid,
  DBAdvGrid, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, AdvDateTimePicker,
  Vcl.ExtCtrls, Data.DB, Data.Win.ADODB, ComObj, AdvProgr;

type
  TfrmHomenet_Point = class(TForm)
    Panel2: TPanel;
    Bevel1: TBevel;
    Label3: TLabel;
    edtdong: TEdit;
    Bevel2: TBevel;
    edtho: TEdit;
    Label1: TLabel;
    qryHomenet_Point: TADOQuery;
    qryHomenet_Point2: TADOQuery;
    dsHomenet_Point: TDataSource;
    qryHomenet_Pointdong: TStringField;
    qryHomenet_Pointho: TStringField;
    qryHomenet_PointAvailablePoint: TIntegerField;
    qryHomenet_PointUsedPoint: TIntegerField;
    qryHomenet_PointaccumulatedPoint: TIntegerField;
    edtavPoint: TEdit;
    edtusePoint: TEdit;
    Bevel3: TBevel;
    Label2: TLabel;
    qryHomenet_PointRemainPoint: TIntegerField;
    qryHomenet_PointStartDateTime: TDateTimeField;
    edtRemainPoint: TEdit;
    Bevel4: TBevel;
    Bevel6: TBevel;
    Label4: TLabel;
    Bevel7: TBevel;
    Label7: TLabel;
    edtaccumulatedPoint: TEdit;
    Label6: TLabel;
    tdg1: TDBAdvGrid;
    tdg2: TDBAdvGrid;
    Panel1: TPanel;
    btnClose: TBitBtn;
    btnAllAdd: TBitBtn;
    btnSave: TBitBtn;
    btnSearch: TBitBtn;
    btnCancel: TBitBtn;
    procedure btnSearchClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure tdg1Click(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnAllAddClick(Sender: TObject);
    procedure getExcelData(szFileName: String; var vList: Variant; var nRow: Integer; nStartRow: Integer);
    procedure FormShow(Sender: TObject);
    procedure tdg2Click(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHomenet_Point: TfrmHomenet_Point;

implementation

uses
  Global, Tables, EasyOnHomeInfo;

{$R *.dfm}
//일괄등록
procedure TfrmHomenet_Point.btnAllAddClick(Sender: TObject);
var
  OpenDialog1             : TOpenDialog;
  vList                   : Variant;
  i,j                     : Integer;
  SelectCount,ResultCount : Integer;
  Error                   : String;
  szMsg                   : String;
  nCnt, nTotCnt           : Integer;
begin
  //## 열기대화상자 동적 생성 ##//
  try
    OpenDialog1 := TOpenDialog.Create(Application);
    with OpenDialog1 do
    begin
      btnselect := 1;
      Title := '포인트정보  엑셀파일 불러오기';
      Filter :='엑셀 파일(*.xlsx)|*.xlsx;*.xls';
      Options:= [ofOverwritePrompt, ofFileMustExist, ofHideReadOnly ];
      if Execute then
      begin
        //#### 엑셀데이타 전체를 vList변수에 대입 ####//
        try
          VarClear(vList);
          //# 첫번째 레코드부터 가져온다. #//
          getExcelData(FileName, vList, gnRow, 1);

        except

          szMsg := '';
          szMsg := szMsg + '▶▷ 엑셀로드중 에러발생 ◁◀';
          szMsg := szMsg + #13#10#13#10;
          szMsg := szMsg + '◈ 에러원인';
          szMsg := szMsg + #13#10#13#10;
          szMsg := szMsg + '1. 엑셀의 시트명이 ''Sheet1''인지 확인';
          szMsg := szMsg + #13#10;
          szMsg := szMsg + '2. 엑셀 프로그램이 설치되었는지 확인';
          showmessage(szMsg);
          exit;
        end;

        //# 변수가 null값이면 종료 #//
        if VarIsNull(vList) then begin
          Screen.Cursor := crDefault;
          Exit;
        end;
        //#### 엑셀데이타 전체를 vList변수에 대입 ####//
        StartProgress('일괄처리중...', '일괄처리중입니다.  잠시 기다려주세요!', gnRow - 1);
        //#### 리얼그리드1에 엑셀 내용 출력하기 시작 ####//
        if gnRow > 0 then begin
          if nHomenet_visit = 16 then //스마트 빌리지 포인트
          begin
            with tdg2 do begin
              RowCount  :=  gnRow;
              for i := 0  to gnRow - 1  do begin
                Cells[1, i]  :=  VartoStr(vList[i, 0]);          //# 동
                Cells[2, i]  :=  VartoStr(vList[i, 1]);         //# 호
                Cells[3, i]  :=  VartoStr(vList[i, 2]);         //# 가용포인트
                Cells[4, i]  :=  VartoStr(vList[i, 3]);         //# 남은포인트

                if i > 0 then
                begin
                  if StrToInt(VartoStr(vList[i, 2])) <> StrToInt(edtavPoint.Text) then
                  begin
                    ShowMessage(IntToStr(i)+' 번째 가용포인트가 주차장에 설정된 값과 다릅니다.');
                    EndProgress;
                    Exit;
                  end;

                  if StrToInt(VartoStr(vList[i, 3])) <> StrToInt(edtavPoint.Text) then
                  begin
                    ShowMessage(IntToStr(i)+' 번째 남은 포인트가 주차장에 설정된 값과 다릅니다.');
                    EndProgress;
                    Exit;
                  end;
                end;

              end;
              //for i := 1  to gnRow - 1 do begin
              for i := 1  to gnRow do begin
                //데이터 저장
                with dmTables.qryTemp do
                begin
                  SetProgress(1);
                  nTotCnt:= nTotCnt + 1;

                  Close;
                  SQL.Clear;
                  SQL.Add('Select * from Visit_Point where dong = :N1 and ho = :N2');
                  Parameters.ParamByName('N1').Value:= VartoStr(vList[i, 0]);
                  Parameters.ParamByName('N2').Value:= VartoStr(vList[i, 1]);
                  Open;
                  if RecordCount <= 0 then
                  begin
                     Close;
                     SQL.Clear;
                     SQL.Add('Insert into Visit_Point (dong, ho, AvailablePoint, RemainPoint, StartDateTime) ' +
                              'values(:pDong, :pHo, :pAvailablePoint, :pRemainPoint, :pStartDateTime)');
                     Parameters.ParamByName('pDong').Value := VartoStr(vList[i, 0]);
                     Parameters.ParamByName('pHo').Value := VartoStr(vList[i, 1]);
                     Parameters.ParamByName('pAvailablePoint').Value := StrToInt(VartoStr(vList[i, 2]));//nAvailablePoint;
                     Parameters.ParamByName('pRemainPoint').Value := StrToInt(VartoStr(vList[i, 3]));
                     Parameters.ParamByName('pStartDateTime').Value := FormatDateTime('yyyy-mm-dd hh:mm:ss', now);
                     ExecSQL;
                     ExceptLogging(' 세대주 포인트 추가');
                  end
                  else
                  begin
                    Close;
                    SQL.Clear;
                    SQL.Add('Update Visit_Point set AvailablePoint = :pAvailablePoint, RemainPoint = :pRemainPoint, StartDateTime= :pStartDateTime ');
                    SQL.Add('where  dong = :pDong and ho = :pHo ');
                    Parameters.ParamByName('pDong').Value := VartoStr(vList[i, 0]);
                    Parameters.ParamByName('pHo').Value := VartoStr(vList[i, 1]);
                    Parameters.ParamByName('pAvailablePoint').Value := StrToInt(VartoStr(vList[i, 2]));
                    Parameters.ParamByName('pRemainPoint').Value :=  StrToInt(VartoStr(vList[i, 3]));
                    Parameters.ParamByName('pStartDateTime').Value := FormatDateTime('yyyy-mm-dd hh:mm:ss', now);;
                    ExecSQL;
                    ExceptLogging('세대주 포인트 수정');
                  end;
                end;
              end;
            end;
          end
          else
          begin
            with tdg1 do begin
              RowCount  :=  gnRow;
              for i := 0  to gnRow - 1  do begin
                Cells[1, i]  :=  VartoStr(vList[i, 0]);          //# 동
                Cells[2, i]  :=  VartoStr(vList[i, 1]);         //# 호
                Cells[3, i]  :=  VartoStr(vList[i, 2]);         //# 가용포인트
                Cells[4, i]  :=  VartoStr(vList[i, 3]);         //# 남은포인트

                if i > 0 then
                begin
                  if StrToInt(VartoStr(vList[i, 2])) <> StrToInt(edtavPoint.Text) then
                  begin
                    ShowMessage(IntToStr(i)+' 번째 가용포인트가 주차장에 설정된 값과 다릅니다.');
                    EndProgress;
                    Exit;
                  end;
                end;
              end;
              //for i := 1  to gnRow - 1 do begin
              for i := 1  to gnRow do begin
                //데이터 저장
                with dmTables.qryTemp do
                begin
                  SetProgress(1);
                  nTotCnt:= nTotCnt + 1;

                  Close;
                  SQL.Clear;
                  SQL.Add('Select * from Visit_Point where dong = :N1 and ho = :N2');
                  Parameters.ParamByName('N1').Value:= VartoStr(vList[i, 0]);
                  Parameters.ParamByName('N2').Value:= VartoStr(vList[i, 1]);
                  Open;
                  if RecordCount <= 0 then
                  begin
                     Close;
                     SQL.Clear;
                     SQL.Add('Insert into Visit_Point (dong, ho, AvailablePoint, UsedPoint, StartDateTime) ' +
                              'values(:pDong, :pHo, :pAvailablePoint, :pUsedPoint, :pStartDateTime)');
                     Parameters.ParamByName('pDong').Value := VartoStr(vList[i, 0]);
                     Parameters.ParamByName('pHo').Value := VartoStr(vList[i, 1]);
                     Parameters.ParamByName('pAvailablePoint').Value := StrToInt(VartoStr(vList[i, 2]));//nAvailablePoint;
                     Parameters.ParamByName('pUsedPoint').Value := StrToInt(VartoStr(vList[i, 3]));
                     Parameters.ParamByName('pStartDateTime').Value := FormatDateTime('yyyy-mm-dd hh:mm:ss', now);
                     ExecSQL;
                     ExceptLogging(' 세대주 포인트 추가');
                  end
                  else
                  begin
                    Close;
                    SQL.Clear;
                    SQL.Add('Update Visit_Point set AvailablePoint = :pAvailablePoint, UsedPoint = :pUsedPoint, StartDateTime= :pStartDateTime ');
                    SQL.Add('where  dong = :pDong and ho = :pHo ');
                    Parameters.ParamByName('pDong').Value := VartoStr(vList[i, 0]);
                    Parameters.ParamByName('pHo').Value := VartoStr(vList[i, 1]);
                    Parameters.ParamByName('pAvailablePoint').Value := StrToInt(VartoStr(vList[i, 2]));
                    Parameters.ParamByName('pUsedPoint').Value :=  StrToInt(VartoStr(vList[i, 3]));
                    Parameters.ParamByName('pStartDateTime').Value := FormatDateTime('yyyy-mm-dd hh:mm:ss', now);;
                    ExecSQL;
                    ExceptLogging('세대주 포인트 수정');
                  end;
                end;
              end;
            end;
          end;
          EndProgress;
          ShowMessage('총' + IntToStr(nTotCnt) + '건의 자료를 일괄저장 완료하였습니다.');
          btnSearchClick(Self);
        end
        else
        begin
          tdg1.Clear;
        end;
      end;//# if Execute then
    end;//# with OpenDialog1 do
  except
      EndProgress;
  end;
end;

procedure TfrmHomenet_Point.btnCancelClick(Sender: TObject);
begin
   edtdong.Text := '';
   edtho.Text := '';
   edtavPoint.Text := '';
   edtusePoint.Text := '';
   edtRemainPoint.Text := '';
   edtaccumulatedPoint.Text := '';
end;

procedure TfrmHomenet_Point.btnCloseClick(Sender: TObject);
begin
   ModalResult := mrCancel;
   //Close;
end;

procedure TfrmHomenet_Point.btnSaveClick(Sender: TObject);
var
  accumulatedPoint : Integer;
begin
  nAvailablePoint := 0;
  nUsedPoint := 0;
  accumulatedPoint := 0;
  if strtoint(edtavPoint.Text)  < strtoint(edtRemainPoint.Text)  then
  begin
      ShowMessage('가용포인트보다 값이 작아야 합니다.');
      Exit;
  end;

  if nHomenet_visit = 16 then //스마트빌리지 연동
  begin
    with qryHomenet_Point do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from Visit_Point ');
      SQL.Add('where dong = :N1  and ho = :N2 ');
      Parameters.ParamByName('N1').Value:= edtdong.Text;
      Parameters.ParamByName('N2').Value:= edtho.Text;
      Open;

      if RecordCount > 0 then
      begin
        accumulatedPoint := FieldByName('accumulatedPoint').AsInteger;
        ExceptLogging('포인트 누적(기존): '+ IntToStr(accumulatedPoint));
        accumulatedPoint := accumulatedPoint + strtoint(edtRemainPoint.Text);
        Close;
        SQL.Clear;
        SQL.Add('update Visit_Point ');
        SQL.Add('set AvailablePoint = :N1, UsedPoint = :N2, RemainPoint = :N3, StartDateTime = :N4, accumulatedPoint = :N5 ');
        SQL.Add('where dong = :N6  and ho = :N7 ');
        Parameters.ParamByName('N1').Value:= edtavPoint.Text;
        Parameters.ParamByName('N2').Value:= edtUsePoint.Text;
        Parameters.ParamByName('N3').Value:= edtRemainPoint.Text;
        Parameters.ParamByName('N4').Value:= FormatDateTime('yyyy-mm-dd hh:mm:ss', now);
        Parameters.ParamByName('N5').Value:= accumulatedPoint;
        Parameters.ParamByName('N6').Value:= edtdong.Text;
        Parameters.ParamByName('N7').Value:= edtho.Text;
        ExecSQL;
        ExceptLogging(edtdong.Text+'동'+ edtho.Text+'호' + '세대주 포인트 : '+edtavPoint.Text+' 남은 포인트 : '+edtRemainPoint.Text+' 누적포인트 : '+IntToStr(accumulatedPoint));
        ShowMessage('가용포인트 리셋 완료.');
      end
      else
      begin
        Close;
        SQL.Clear;
        SQL.Add('Insert into Visit_Point (dong, ho, AvailablePoint, RemainPoint, StartDateTime) ' +
                'values(:pDong, :pHo, :pAvailablePoint, :pRemainPoint, :pStartDateTime)');
        Parameters.ParamByName('pDong').Value := edtdong.Text;
        Parameters.ParamByName('pHo').Value   := edtho.Text;
        Parameters.ParamByName('pAvailablePoint').Value := edtavPoint.Text;
        Parameters.ParamByName('pRemainPoint').Value    := edtRemainPoint.Text;
        Parameters.ParamByName('pStartDateTime').Value  := FormatDateTime('yyyy-mm-dd hh:mm:ss', now);
        ExecSQL;
        ExceptLogging(edtdong.Text+'동'+ edtho.Text+'호' + '세대주 포인트 추가');
        ShowMessage('포인트 추가 완료.');
      end;

      nAvailablePoint := StrToInt(edtavPoint.Text);
      nUsedPoint := nAvailablePoint - StrToInt(edtRemainPoint.Text);
      //nUsedPoint := StrToInt(edtusePoint.Text);
      btnSearchClick(self);
    end;
  end
  else
  begin
    with qryHomenet_Point do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from Visit_Point ');
      SQL.Add('where dong = :N1  and ho = :N2 ');
      Parameters.ParamByName('N1').Value:= edtdong.Text;
      Parameters.ParamByName('N2').Value:= edtho.Text;
      Open;

      if RecordCount > 0 then
      begin
        accumulatedPoint := FieldByName('accumulatedPoint').AsInteger;
        ExceptLogging('포인트 누적(기존): '+ IntToStr(accumulatedPoint));
        accumulatedPoint := accumulatedPoint + strtoint(edtRemainPoint.Text);
        Close;
        SQL.Clear;
        SQL.Add('update Visit_Point ');
        SQL.Add('set AvailablePoint = :N1, UsedPoint = :N2, StartDateTime = :N5, accumulatedPoint = :N6 ');
        SQL.Add('where dong = :N3  and ho = :N4 ');
        Parameters.ParamByName('N1').Value:= edtavPoint.Text;
        Parameters.ParamByName('N2').Value:= edtRemainPoint.Text;
        Parameters.ParamByName('N3').Value:= edtdong.Text;
        Parameters.ParamByName('N4').Value:= edtho.Text;
        Parameters.ParamByName('N5').Value:= FormatDateTime('yyyy-mm-dd hh:mm:ss', now);
        Parameters.ParamByName('N6').Value:= accumulatedPoint;
        ExecSQL;
        ExceptLogging(edtdong.Text+'동'+ edtho.Text+'호' + '세대주 포인트 : '+edtavPoint.Text+' 남은 포인트 : '+edtRemainPoint.Text+' 누적포인트 : '+IntToStr(accumulatedPoint));
        ShowMessage('가용포인트 리셋 완료.');
      end
      else
      begin
        Close;
        SQL.Clear;
        SQL.Add('Insert into Visit_Point (dong, ho, AvailablePoint, UsedPoint, StartDateTime) ' +
                'values(:pDong, :pHo, :pAvailablePoint, :pUsedPoint, :pStartDateTime)');
        Parameters.ParamByName('pDong').Value := edtdong.Text;
        Parameters.ParamByName('pHo').Value   := edtho.Text;
        Parameters.ParamByName('pAvailablePoint').Value := edtavPoint.Text;
        Parameters.ParamByName('pUsedPoint').Value      := edtRemainPoint.Text;
        Parameters.ParamByName('pStartDateTime').Value  := FormatDateTime('yyyy-mm-dd hh:mm:ss', now);
        ExecSQL;
        ExceptLogging(edtdong.Text+'동'+ edtho.Text+'호' + '세대주 포인트 추가');
        ShowMessage('포인트 추가 완료.');
      end;

      nAvailablePoint := StrToInt(edtavPoint.Text);
      nUsedPoint := StrToInt(edtRemainPoint.Text);
      btnSearchClick(self);
    end;
  end;

  {if smartVillagePoint = 1 then
  begin
    EasyOnHome.Homeinfo_proc_EasyOn(sHomeInfo_IP, nHomeInfo_Port, edtdong.Text, edtho.Text, '', '세대포인트', 'a');
  end;}
end;

procedure TfrmHomenet_Point.btnSearchClick(Sender: TObject);
var
 CarNo, PatrolCode, InCarNo1 : string;
 li_CNT : Integer;
begin
  with qryHomenet_Point2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select *  ');
    SQL.Add('From ParkInfo ');
    Open;

    if RecordCount > 0 then
    begin
       edtavPoint.Text := FieldByName('AvailablePoint').AsString;
    end;
  end;

  with qryHomenet_Point do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select *  ');
    SQL.Add('From Visit_Point ');
    if (edtdong.Text ='') or (edtho.Text ='') then
    begin

    end
    else
    begin
      SQL.Add('where dong = :N1  and ho = :N2 ');
      Parameters.ParamByName('N1').Value:= edtdong.Text;
      Parameters.ParamByName('N2').Value:= edtho.Text;
    end;
    SQL.Add('Order by dong, ho ');
    Open;

    if eof then
    begin
      ShowMessage('데이터가 없습니다.');
      tdg1.Clear;
      Exit;
    end;

    First;
    li_CNT := 1;
    //tdg1.Clear;
    {While not Eof Do begin
      with tdg1 do
      begin
          Cells[1,li_CNT] := FieldByName('dong').AsString;
          Cells[2,li_CNT] := FieldByName('ho').AsString;
          Cells[3,li_CNT] := FieldByName('AvailablePoint').AsString;
          Cells[4,li_CNT] := FieldByName('UsedPoint').AsString;
          //Cells[5,li_CNT] := FieldByName('PointType').AsString;
          //Cells[6,li_CNT] := FieldByName('PointUnit').AsString;
      end;
      Inc(li_CNT);
      Next;
    end;
    tdg1.ColCount := 5;
    tdg1.RowCount := li_CNT;
    tdg1.Columns[1].Header := '동';
    tdg1.Columns[2].Header := '호';
    tdg1.Columns[3].Header := '가용포인트';
    tdg1.Columns[4].Header := '사용포인트'; }
    //tdg1.Columns[5].Header := '1:초, 2:분, 3:시, 4:일, 5:건';
    //tdg1.Columns[6].Header := '포인트 단위';
    if nHomenet_visit = 16 then
    begin
      tdg2.ColCount := 8;
      tdg2.Columns[1].Header := '동';
      tdg2.Columns[2].Header := '호';
      tdg2.Columns[3].Header := '가용포인트';
      tdg2.Columns[4].Header := '사용포인트';
      tdg2.Columns[5].Header := '남은포인트';
      tdg2.Columns[6].Header := '누적포인트';
      tdg2.Columns[7].Header := '등록시간';
    end
    else
    begin
      tdg1.ColCount := 5;
      tdg1.Columns[1].Header := '동';
      tdg1.Columns[2].Header := '호';
      tdg1.Columns[3].Header := '가용포인트';
      tdg1.Columns[4].Header := '남은포인트';
    end;
  end;
end;

procedure TfrmHomenet_Point.FormShow(Sender: TObject);
begin
   if nHomenet_visit = 16 then     //스마트빌리지
   begin
     tdg1.Visible := False;
     tdg2.Visible := True;
     tdg2.Height := 300;
   end
   else
   begin
     tdg1.Visible := True;
     tdg2.Visible := False;
     tdg1.Height := 300;
   end;
   btnSearchClick(Self);
end;

procedure TfrmHomenet_Point.getExcelData(szFileName: String; var vList: Variant;
  var nRow: Integer; nStartRow: Integer);
var
  i, j, k, nStart          : integer;
  XLRows, XLCols, StartRow : integer;
  XLApp, XLBook, XLSheet   : Variant;
begin

  VarClear(vList);

  try
    XLApp               := CreateOleObject('Excel.Application');      //# 엑셀프로그램 존재체크
    XLApp.DisplayAlerts := False;                                     //# 메시지 표시 않기.
    XLApp.Visible       := False;                                     //# 엑셀프로그램 숨김
    XLBook              := XLApp.WorkBooks.Open(szFileName);          //# 엑셀파일 오픈
    XLSheet             := XLBook.Sheets['Sheet1'];                   //# 엑셀시트 오픈
    XLRows              := XLApp.ActiveSheet.UsedRange.Rows.Count;    //# 총 Rows 수 구함
    //# 총 Columns 수 구함

    XLCols              := XLApp.ActiveSheet.UsedRange.Columns.Count;

    nStart   := 1;
    StartRow := nStartRow;

    //# variant 변수크기 설정
    vList  := VarArrayCreate([0, XLRows -StartRow, 0, XLCols -nStart], varVariant);

    gnRow := XLRows -StartRow + 1; //# 전체건수

    for i := 0 to XLRows - StartRow do begin
      if (Trim(XLSheet.Cells[i + StartRow, 1].Value) = '') then begin
        Break;
      end;

      k := 0; //# StringGrid 의 Column 증가용. 초기값 부여.

      for j := nStart to XLCols do begin
        vList[i,k] := XLSheet.Cells[i + StartRow, j].Value;
        Inc(K);
      end;
      gnRow := i;
    end;

  finally

    //# 에러 발생하나 미발생하나 변수해제
    XLBook.Close;
    XLApp.Quit;
    XLApp := UnAssigned;
    Finalize(XLSheet);
    Finalize(XLBook);
    Finalize(XLApp);
  end;

end;

procedure TfrmHomenet_Point.tdg1Click(Sender: TObject);
begin
  with tdg1 do
  begin
      edtdong.Text:= Cells[1,tdg1.row] ;
      edtho.Text:= Cells[2,tdg1.row];
      edtavPoint.Text := Cells[3,tdg1.row];
      //edtusePoint.Text := Cells[4,tdg1.row];
      edtRemainPoint.Text := Cells[4,tdg2.row];
      edtusePoint.Text    :=  IntToStr(strtoint(edtavPoint.Text) - strtoint(edtRemainPoint.Text));
  end;
end;

procedure TfrmHomenet_Point.tdg2Click(Sender: TObject);
begin
  with tdg2 do
  begin
      edtdong.Text:= Cells[1,tdg2.row] ;
      edtho.Text:= Cells[2,tdg2.row];
      edtavPoint.Text := Cells[3,tdg2.row];
      edtusePoint.Text := Cells[4,tdg2.row];
      edtRemainPoint.Text := Cells[5,tdg2.row];
      edtaccumulatedPoint.Text := Cells[6,tdg2.row];
  end;
end;

end.
