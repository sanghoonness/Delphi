unit Smartro;

interface
uses
  Windows, SysUtils, Forms, WinInet, IniFiles, DateUtils, Global, System.Classes;
  procedure SMT_RecvProcess(AccessNo, SuccessYn, MethodsofPayment, ReturnData: String);
  procedure StringSplit(const Delimiter: Char; Input: string; var Strings: TStringList);
var
  SMT_Recv : TStringList;

implementation

procedure SMT_RecvProcess(AccessNo, SuccessYn, MethodsofPayment, ReturnData: String);
var
  SplitRecv: TStringList;
  chki: Integer;
begin
  try
    //기기상태 관련 응답
    if SuccessYn = 'C' then begin
      ExceptLogging('기기 상태 관련 응답 메세지[처리중단] : ' + ReturnData);
      Exit;
    end;

    //티머니 상태 관련 응답: 미사용
    if SuccessYn = 'T' then begin
      ExceptLogging('티머니 상태 관련 응답 메세지[미사용] : ' + ReturnData);
      Exit;
    end;

    //카드상태 관련 응답
    if SuccessYn = 'W' then begin
      ExceptLogging('카드 상태 관련 응답 메세지[처리중단] : ' + ReturnData);
      Exit;
    end;

    //응답 값이없을 때.
    if ReturnData = chr(4) then begin
      Exit;
    end;

    //예외처리 끝나고 응답처리 시작
//    SplitRecv := TStringList.Create;

//    StringSplit(#28, ReturnData, SplitRecv);
    StringSplit(#28, ReturnData, SMT_Recv);

//    for chki := 0 to SplitRecv.Count -1 do
//    begin
//      SplitRecv[chki] := StringReplace(SplitRecv[chki], chr(4), '', [rfReplaceAll]);
//    end;
    for chki := 0 to SMT_Recv.Count -1 do
    begin
      SMT_Recv[chki] := StringReplace(SMT_Recv[chki], chr(4), '', [rfReplaceAll]);
    end;

//    SMT_Recv[0]  := SplitRecv[0]; //응답 코드
//    SMT_Recv[1]  := SplitRecv[1]; //결제 구분
//    SMT_Recv[2]  := SplitRecv[2]; //결제 매체
//    SMT_Recv[3]  := SplitRecv[3]; //원거래일자 YYMMDD [취소시 사용]
//    SMT_Recv[4]  := SplitRecv[4]; //결제 일시
//    SMT_Recv[5]  := SplitRecv[5]; //카드번호
//    SMT_Recv[6]  := SplitRecv[6]; //원거래승인번호    [취소시 사용]
//    SMT_Recv[7]  := SplitRecv[7]; //가맹점번호
//    SMT_Recv[8]  := SplitRecv[8]; //매입구분
//    SMT_Recv[9]  := SplitRecv[9]; //발급사코드
//    SMT_Recv[10] := SplitRecv[10];//발급사명
//    SMT_Recv[11] := SplitRecv[11];//매입사코드
//    SMT_Recv[12] := SplitRecv[12];//매입사명
//    SMT_Recv[13] := SplitRecv[13];//응답내용
//    SMT_Recv[14] := SplitRecv[14];//선불카드잔액
//    SMT_Recv[15] := SplitRecv[15];//티머니자료
//    SMT_Recv[16] := SplitRecv[16];//응답키
//    SMT_Recv[17] := SplitRecv[17];//결제금액
//    SMT_Recv[18] := SplitRecv[18];//부가세
//    SMT_Recv[19] := SplitRecv[19];//결제 POS ID
//    SMT_Recv[20] := SplitRecv[20];//전문일련번호
    InspectionLog('[EVCAT] 결제응답 시작');
    InspectionLog(' 응답 코드 : ' + SMT_Recv[0] +
                  ' 결제 구분 : ' + SMT_Recv[1] +
                  ' 결제 매체 : ' + SMT_Recv[2] +
                  ' 결제일자 : ' + SMT_Recv[3] +
                  ' 결제시간 : ' + SMT_Recv[4] +
                  ' 카드번호 : ' + SMT_Recv[5] +
                  ' 원거래승인번호 : ' + SMT_Recv[6] +
                  ' 가맹점번호 : ' + SMT_Recv[7] +
                  ' 매입구분 : ' + SMT_Recv[8] +
                  ' 발급사코드 : ' + SMT_Recv[9] +
                  ' 발급사명 : ' + SMT_Recv[10] +
                  ' 매입사코드 : ' + SMT_Recv[11] +
                  ' 매입사명 : ' + SMT_Recv[12] +
                  ' 응답내용 : ' + SMT_Recv[13] +
                  ' 선불카드잔액 : ' + SMT_Recv[14] +
                  ' 티머니자료 : ' + SMT_Recv[15] +
                  ' 응답키 : ' + SMT_Recv[16] +
                  ' 결제금액 : ' + SMT_Recv[17] +
                  ' 부가세 : ' + SMT_Recv[18] +
                  ' 결제 POS ID : ' + SMT_Recv[19] +
                  ' 전문일련번호 : ' + SMT_Recv[20]
                  );
    InspectionLog('[EV-CAT] 결제응답 종료');
//    SplitRecv.Free;
  except
    on E: Exception do begin
      InspectionLog('[EV-CAT] 결제 진행 중 오류 발생 : ' + E.Message);
    end;
  end;
end;

procedure StringSplit(const Delimiter: Char; Input: string; var Strings: TStringList);
begin
  Assert(Assigned(Strings)) ;
  Strings.Clear;
  Strings.StrictDelimiter := True;
  ExtractStrings([Delimiter],  [' '], PChar(Input), Strings);
end;
end.
