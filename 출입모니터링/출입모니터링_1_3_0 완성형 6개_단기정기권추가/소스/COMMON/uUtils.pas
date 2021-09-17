unit uUtils;

interface
uses
   System.SysUtils
  ,System.IniFiles
  ,Winapi.Messages
  ,Winapi.TlHelp32
  ,DateUtils
  ,FMX.Dialogs
  {$IFDEF MSWINDOWS}
    ,winapi.shellapi
    ,Winapi.Windows
  {$ENDIF}
  {$IFDEF POSIX}
    ,Posix.Stdlib
  {$ENDIF POSIX}
  ,System.strUtils
  ,System.Types
  ,System.UITypes
  ,System.Classes
  ,System.Variants
  //,uCpuUsage
  ;

procedure KillProcess(hWindowHandle: HWND);
function ExecuteFile( const filename ,
                            Params ,
                            DefaultDir : string;
                            ShowCmd    : integer ): THandle;
function KillTask(ExeFileName: string): Integer;
function GetFmtFileVersion( const FileName: String = '';
                            const Fmt     : String = '%d.%d.%d.%d' ): String;
function StrToByte(const Value: AnsiString): TBytes;
function ByteToStr(const Value: TBytes): AnsiString;
function Hex2Dec(const S: string): Longint;
function HexStrToByte(const Value: AnsiString): TBytes;
function fDuplicateRun( sFile: String ) : Boolean;
function IfThen(c: boolean; a, b: string): string;

function ExistsTheProcess( exeFileName: string ): Boolean;

function GetMonthFirstDay( ADateTime: TDateTime ):TDateTime;
function GetCurrentMonth( Month: TDateTime ):String;

function  Set2359( dtOrigin: TDateTime ): TDateTime;
procedure GetTheYYYYMM( var nYEAR: Integer; var nMONTH: Integer; var nDAY: Integer; dtThe: TDateTime );

procedure GetTheHHMM( var nHOUR: Integer; var nMIN: Integer; dtThe: TDateTime );
procedure GetTheAdd1Hour( var nHOUR: Integer; var nMIN: Integer; dtThe: TDateTime );

function GetAmPmHour( nHOUR: Integer ): string;
function GetCommaPriceEx( nPrice: Integer ): string;
function GetCommaPrice( nPrice: Integer ): string;
function GetnPricewithComma( sPrice: string ): Integer;
function GetsPriceWithComma( sPrice: string ): string;  // 금액에 콤마(,)처리

function ModifyPhoneNumWithDASI( vTelNo: string): string;

function GetDigit( sVALUE: string ): string;

function TimeLeft( StartTime, EndTime, dtThe: TDateTime ): Boolean;
function GetTodayWeek(): string;
function ReplaceNameAsStar( sName: string ): string;
function GetHHMMSS( dtThe: TDateTime ): string;
function GetHHMM( dtThe: TDateTime ): string;
function GetYYYYMMDD(): string;
function GetYYYYMMDDEx(): string;
function GetMMDD( sThe: string ): string;
function GetMMDDEx( dtThe: TDateTime ): string;

function GetCaptionByUnit( nUNIT, nVALUE: Integer ): string;
function GetCaptionWithPriceByUnit( nUNIT, nVALUE, nPRICE: Integer ): string;

function GetIdFromPhoneNum( sVALUE: string ): string;
function GetPwFromPhoneNum( sVALUE: string ): string;

function GetTodysRD(): string;
function GetRD( dtThe: TDateTime ): string;
function GetToday(): string;
function GetTheHoursUntil( dtUntil: TTime; var nMin: Integer ): Integer;
function GetTomorrowTheTime( dtUntil: TTime ): TDateTime;
function GetUnitAsString( nUnit: Integer ): string;
function GetServiceAsString( nService: Integer ): string;

function IntToKorNum( AValue: Int64 ): string;
function GetTodayDtFrom( tTheTime: TTime ): TDateTime;

function Get_DateTime( nYear, nMonth, nDay: Integer; sHHMMSS: string ): TDateTime;

function GetLen( sVALUE: AnsiString ): Integer; overload;
function GetLen( sVALUE: String ): Integer; overload;

var
  g_hWnd : THandle;

implementation

function GetLen( sVALUE: AnsiString ): Integer;
begin
  Result := Length( sVALUE );
end;

function GetLen( sVALUE: String ): Integer;
begin
  Result := Length( sVALUE );
end;

function Get_DateTime( nYear, nMonth, nDay: Integer; sHHMMSS: string ): TDateTime;
var
 sDT: string;
begin
  sDT := Format( '%.4d-%.2d-%.2d %s', [nYEAR, nMONTH, nDAY, sHHMMSS] );
  Result := StrToDateTime( sDT );
end;

function GetServiceAsString( nService: Integer ): string;
var
  nDigit: Integer;
begin
  if( nService >= 10000 )then
  begin
    nDigit := nService div 10000;
    Result := IntToStr( nDigit );
  end
  else
  begin
    Result := IntToStr( nService );
  end;
end;

function IntToKorNum( AValue: Int64 ): string;
const
  NumberChar  : array[0..9] of Ansistring = ('영','일','이','삼','사','오','육','칠','팔','구');
  LevelChar   : array[0..3] of Ansistring = ('','십','백','천');
  DecimalChar : array[0..5] of Ansistring = ('','만','억','조','경','현');
var
  n1, n2, n3: Integer;
  vStr: string;
  vDecimal: Boolean;
  i, vLevel: Integer;
begin
  Result   := '';
  vStr     := IntToStr( AValue );
  vDecimal := False;

  for I := 0 to Length(vStr) do
  begin
    vLevel := Length( vStr ) - i;
    if( vStr[i] <> '0' )then
    begin
      vDecimal := True;
      if vLevel mod 4 = 0 then
      begin
        n1 := Integer( vStr[i] );
        n2 := vLevel div 4;
        Result   := Result + NumberChar[n1] + Decimalchar[n2];
        vDecimal := False;
      end
      else
      begin
        n1 := Integer( vStr[i] );
        n2 := vLevel mod 4;
        Result := Result + NumberChar[n1] + Decimalchar[n2];
      end;
    end
    else if( vLevel mod 4 = 0) and vDecimal then
    begin
      Result   := Result + DecimalChar[ vLevel div 4 ];
      vDecimal := False;
    end;
  end;
end;

function GetUnitAsString( nUnit: Integer ): string;
begin
  case nUnit of
    0: Result := '미설정';
    1: Result := '분';
    2: Result := '시간';
    3: Result := '날짜';
    4: Result := '주';
    5: Result := '년';
    6: Result := '원';//'만원';
  end;
end;

function GetTodayDtFrom( tTheTime: TTime ): TDateTime;
var
  nYear, nMonth, nDay : Integer;   // 오늘
begin
  GetTheYYYYMM( nYear, nMonth, nDay, Now );
  Result := EncodeDate( nYear, nMonth, nDay) +Frac( tTheTime );
end;

function GetTomorrowTheTime( dtUntil: TTime ): TDateTime;
var
  nYear2, nMonth2, nDay2 : Integer;   // 내일
  dtNow,
  dtTomorrow: TDateTime;
begin
  dtTomorrow := IncDay( Now );
  GetTheYYYYMM( nYear2, nMonth2, nDay2, dtTomorrow );

  Result := EncodeDate( nYear2, nMonth2, nDay2) +Frac( dtUntil );
end;

function GetTheHoursUntil( dtUntil: TTime; var nMin: Integer ): Integer;
var
  nTemp,
  nYear1, nMonth1, nDay1 {, nHour1, nMin1}: Integer;   // 오늘(현재)
  nYear2, nMonth2, nDay2 {, nHour2, nMin2}: Integer;   // 내일
  dtNow,
  dtTomorrow,
  dt1, dt2, dt : TDateTime;
begin
  dtNow := Now();
  GetTheYYYYMM( nYear1, nMonth1, nDay1, dtNow );
  dtTomorrow := IncDay( dtNow );
  GetTheYYYYMM( nYear2, nMonth2, nDay2, dtTomorrow );

  dt1 := dtNow;
  dt2 := EncodeDate(nYear2, nMonth2, nDay2) +Frac( dtUntil );

  nTemp  := MinutesBetween( dt1, dt2 );
  Result := nTemp div 60;
  nMin   := nTemp mod 60;
end;

function GetToday(): string;
begin
  Result := FormatDateTime('DD',Now);
end;

function GetTodysRD(): string;
begin
  Result := FormatDateTime('YYYYMMDD',Now);
end;

function GetRD( dtThe: TDateTime ): string;
begin
  Result := FormatDateTime('YYYYMMDD',dtThe);
end;


function GetIdFromPhoneNum( sVALUE: string ): string;
var
  nLen: Integer;
begin
  Result := '';
  nLen   := Length( sVALUE );
  if( nLen > 8 )then
  begin
    Result := Copy( sVALUE, nLen-7, nLen-7 );
  end;
end;

function GetPwFromPhoneNum( sVALUE: string ): string;
var
  nLen: Integer;
begin
  Result := '';
  nLen   := Length( sVALUE );
  if( nLen > 8 )then
  begin
    Result := Copy( sVALUE, nLen-3, nLen-1 );
  end;
end;

function GetCaptionWithPriceByUnit( nUNIT, nVALUE, nPRICE: Integer ): string;
var
  nTemp,
  nTemp2: Integer;
begin
  Result := '';
  case nUNIT of
    {분}1: begin Result := Format('%d분 (%s)'   , [ nVALUE, GetCommaPrice(nPRICE) +'원' ] ); end;
    {시}2: begin Result := Format('%d시간 (%s)' , [ nVALUE, GetCommaPrice(nPRICE) +'원' ] ); end;
    {일}3: begin Result := Format('%d일 (%s)'   , [ nVALUE, GetCommaPrice(nPRICE) +'원' ] ); end;
    {주}4: begin Result := Format('%d주 (%s)'   , [ nVALUE, GetCommaPrice(nPRICE) +'원' ] ); end;
    {년}5: begin Result := Format('%d년 (%s)'   , [ nVALUE, GetCommaPrice(nPRICE) +'원' ] ); end;
  //{원}6: begin Result := Format('%d원 (%s)'   , [ nVALUE, GetCommaPrice(nPRICE) +'원' ] ); end;
    {원}6:
    begin
      Result := GetCommaPrice( nVALUE )+ '원';
      {
      if( nVALUE > 10000 )then
      begin
        nTemp  := nVALUE div 10000;
        nTemp2 := nVALUE mod 10000;
        if( nTemp2 = 0 )then
        begin
          Result := Format('%d만원 (%s)'  , [ nTemp, GetCommaPrice(nPRICE) ] );
        end
        else
        begin
          Result := Format('%d원 (%s)'  , [ nVALUE, GetCommaPrice(nPRICE) ] );
        end;
      end
      else
      begin
        Result := Format('%d원 (%s)'  , [ nVALUE, GetCommaPrice(nPRICE) ] );
      end;
      }
    end;
  end;
end;

function GetCaptionByUnit( nUNIT, nVALUE: Integer ): string;
var
  nTemp,
  nTemp2: Integer;
begin
  Result := '';
  case nUNIT of
    {분}1:
    begin
      //Result := Format('%d분'  , [ nVALUE ] );
      if( nVALUE >= 60 )then
      begin
        nTemp  := nVALUE div 60;
        nTemp2 := nVALUE mod 60;
        Result := Format('%d시간 %.2d분', [ nTemp, nTemp2 ] );
      end
      else
      begin
        Result := Format('0시간 %.2d분', [ nTemp ] );
      end;
    end;
    {시}2: begin Result := Format('%d시간', [ nVALUE ] ); end;
    {일}3: begin Result := Format('%d일'  , [ nVALUE ] ); end;
    {주}4: begin Result := Format('%d주'  , [ nVALUE ] ); end;
    {년}5: begin Result := Format('%d년'  , [ nVALUE ] ); end;
    {원}6:
    begin
      Result := GetCommaPrice( nVALUE ) + '원';
      {
      if( nVALUE >= 10000 )then
      begin
        nTemp  := nVALUE div 10000;
        nTemp2 := nVALUE mod 10000;
        if( nTemp2 = 0 )then
        begin
          Result := Format('%d만원'  , [ nTemp ] );
        end
        else
        begin
          Result := Format('%d원'  , [ nVALUE ] );
        end;
      end
      else
      begin
        Result := Format('%d원'  , [ nVALUE ] );
      end;
      }
    end;

  end;
end;


function GetHHMMSS( dtThe: TDateTime ): string;
begin
  Result := FormatDateTime( 'hh:mm:ss', dtThe );
end;

function GetHHMM( dtThe: TDateTime ): string;
begin
  Result := FormatDateTime( 'hh:mm', dtThe );
end;

function GetYYYYMMDD(): string;
begin
  Result := FormatDateTime( 'yyyy-mm-dd', Now );
end;

function GetYYYYMMDDEx(): string;
var
  sTemp: string;
begin
  sTemp  := FormatDateTime( 'yyyy-mm-dd', Now );
  Result := StringReplace( sTemp,'-','',[rfReplaceAll]);
end;

function GetMMDDEx( dtThe: TDateTime ): string;
var
  sTemp: string;
begin
  sTemp  := FormatDateTime( 'mm-dd', dtThe );
  sTemp  := StringReplace( sTemp,'-','/',[rfReplaceAll]);
  Result := sTemp;
end;

function GetMMDD( sThe: string ): string;
var
  sTemp: string;
  myDate: TDate;
begin
  myDate := EncodeDate(
    StrToInt(Copy(sThe, 1, 4)),
    StrToInt(Copy(sThe, 5, 2)),
    StrToInt(Copy(sThe, 7, 2))
  );
  sTemp  := FormatDateTime( 'mm-dd', myDate );
  sTemp  := StringReplace( sTemp,'-','/',[rfReplaceAll]);
  Result := sTemp;
end;

function ReplaceNameAsStar( sName: string ): string;
begin
  if( Length(sName) > 1 )then
  begin
    sName := sName.Remove( 1, 1   );
    sName := sName.Insert( 1, '*' );
  end;
  Result := sName;
end;

function TimeLeft( StartTime, EndTime, dtThe: TDateTime ): Boolean;
const
  ms = 1/24/60/60/1000;
var
  nYear1, nMonth1, nDay1 {, nHour1, nMin1}: Integer;   // 오늘(현재)
  nYear2, nMonth2, nDay2 {, nHour2, nMin2}: Integer;   // 내일
  dtNow,
  dtTomorrow,
  dt1, dt2, dt : TDateTime;
begin

  dtNow := Now();
  GetTheYYYYMM( nYear1, nMonth1, nDay1, dtNow );
  dtTomorrow := IncDay( dtNow );
  GetTheYYYYMM( nYear2, nMonth2, nDay2, dtTomorrow );

  if Frac(EndTime) - Frac(StartTime) > ms then
  begin
    dt1 := EncodeDate(nYear1, nMonth1, nDay1) + Frac(StartTime );
    dt2 := EncodeDate(nYear1, nMonth1, nDay1) + Frac(EndTime   );

    dt :=  dtThe; //EncodeDate(nYear1, nMonth1, nDay1) +Frac(ATime);
  end
  else
  begin
    dt1 := EncodeDate(nYear1, nMonth1, nDay1) +Frac(StartTime );
    dt2 := EncodeDate(nYear2, nMonth2, nDay2) +Frac(EndTime   );

    dt := dtThe; //EncodeDate(2000, 1, 1) +Frac(ATime);
  end;

  Result := (dt -dt1 > ms) and (dt2 -dt > ms);
  {
  if result.AnyTimeLeft then begin
    DecodeTime(dt2 -dt, result.H, result.M, result.S, result.MS);
    result.H := result.H +(Trunc(dt2 -dt) *24);
  end;
  }
end;

function GetDigit( sVALUE: string ): string;
var
  sTemp: string;
begin
  Result := '';
  sTemp  := StringReplace( sVALUE ,'-','', [rfReplaceAll] );
  Result := sTemp;
end;

function ModifyPhoneNumWithDASI( vTelNo: string ):string;
var
  tTellNo: string;
  FLocal, FSeoul: Boolean;
begin
  tTellNo := StringReplace( vTelNo, '-', '', [rfReplaceAll, rfIgnoreCase] );

  if( Length( tTellNo ) <= 0 )then
  begin
    Result := '';
    Exit;
  end;

  // Edit MaxLength:13
  if( Length( tTellNo ) > 12 )then
  begin
    Result := Copy( vTelNo, 1, 13 );
    Exit;
  end;

  FLocal := False;
  FSeoul := False;

  if( tTellNo[1] = '0' )then
  begin
    FLocal := True;
  end;

  if( (FLocal = True) and (tTellNo[2] = '2') )then
  begin
    FSeoul := True;
  end;

  if( FLocal )then
  begin
    // 서울(02로시작)
    if( FSeoul )then
    begin
      case Length( tTellNo ) of
         3: tTellNo := Copy( tTellNo, 1, 2) + '-' + Copy( tTellNo, 3, 1);
         6: tTellNo := Copy( tTellNo, 1, 2) + '-' + Copy( tTellNo, 3, 3) + '-' + Copy( tTellNo, 6, 1);
         9: tTellNo := Copy( tTellNo, 1, 2) + '-' + Copy( tTellNo, 3, 3) + '-' + Copy( tTellNo, 6, 4);
        10: tTellNo := Copy( tTellNo, 1, 2) + '-' + Copy( tTellNo, 3, 4) + '-' + Copy( tTellNo, 7, 4);
        else
        begin
          tTellNo := vTelNo;
        end;
      end;
    end
    else  // 서울을 제외한 전화번호
    begin
      case Length( tTellNo ) of
         4: tTellNo := Copy( tTellNo, 1, 3) + '-' + Copy( tTellNo, 4, 1);
         5: tTellNo := Copy( tTellNo, 1, 3) + '-' + Copy( tTellNo, 4, 3) + '-' + Copy( tTellNo, 7, 1);
        10: tTellNo := Copy( tTellNo, 1, 3) + '-' + Copy( tTellNo, 4, 3) + '-' + Copy( tTellNo, 7, 4);
        11: tTellNo := Copy( tTellNo, 1, 3) + '-' + Copy( tTellNo, 4, 4) + '-' + Copy( tTellNo, 8, 4);
        else
        begin
          tTellNo := vTelNo;
        end;
      end;
    end;
  end
  else
  begin
    case Length( tTellNo ) of
       4: tTellNo := Copy( tTellNo, 1, 3) + '-' + Copy( tTellNo, 4, 1);
       8: tTellNo := Copy( tTellNo, 1, 4) + '-' + Copy( tTellNo, 5, 4);
      else
      begin
        tTellNo := vTelNo;
      end;
    end;
  end;

  Result := tTellNo;

end;

function GetAmPmHour( nHOUR: Integer ): string;
begin
       if( nHOUR = 12 )then Result := Format( '낮 %d시', [nHOUR] )
  else if( nHOUR > 12 )then Result := Format( '오후 %d시', [nHOUR] )
  else if( nHOUR < 12 )then Result := Format( '오전 %d시', [nHOUR] );
end;

function GetCommaPriceEx( nPrice: Integer ): string;
begin
  Result := FormatFloat('##,###,##0', nPrice);
end;

function GetCommaPrice( nPrice: Integer ): string;
//var
  //fTemp: Double;
begin
  //fTemp := nPrice / 10000;
  Result := FormatFloat('##,###,##0', nPrice); //Format('%0.1f',[fTemp]); //FormatFloat('##,###,##0', nPrice);
end;

function GetnPriceWithComma( sPrice: string ): Integer;
var
  sTemp: string;
begin
  //Result := 0;
  sTemp  :=  StringReplace( sPrice ,',','', [rfReplaceAll] );
  Result := StrToIntDef( sTemp,0);
end;

function GetsPriceWithComma( sPrice: string ): string;
begin
  Result := '';
  Result :=  StringReplace( sPrice ,',','', [rfReplaceAll] );
end;

function GetCurrentMonth( Month: TDateTime ):String;
begin
  Result := FormatDateTime( 'YYYY년MM월', Month );
end;

procedure GetTheAdd1Hour( var nHOUR: Integer; var nMIN: Integer; dtThe: TDateTime );
var
  Year, Month, Day : Word;
  Hour, Minute, Second, MillSecond : Word;
  dtTemp: TDateTime;
begin
  //Next month
  DateUtils.DecodeDateTime( dtThe ,
                            Year   ,
                            Month  ,
                            Day    ,
                            Hour   ,
                            Minute ,
                            Second ,
                            MillSecond );

  dtTemp := IncHour( dtThe, 1 );

  DateUtils.DecodeDateTime( dtTemp ,
                            Year   ,
                            Month  ,
                            Day    ,
                            Hour   ,
                            Minute ,
                            Second ,
                            MillSecond );

  nHOUR  := Hour;
  nMIN   := 0;
end;

function GetTodayWeek(): string;
  const days: array[1..7] of string = ('일','월','화','수','목','금','토');
begin
  Result :=  days[DayOfWeek(Now)];
end;

procedure GetTheHHMM( var nHOUR: Integer; var nMIN: Integer; dtThe: TDateTime );
var
  Year, Month, Day : Word;
  Hour, Minute, Second, MillSecond : Word;
begin
  //Next month
  DateUtils.DecodeDateTime( dtThe ,
                            Year   ,
                            Month  ,
                            Day    ,
                            Hour   ,
                            Minute ,
                            Second ,
                            MillSecond );
  nHOUR := Hour;
  nMIN  := Minute;
end;

function  Set2359( dtOrigin: TDateTime ): TDateTime;
var
  Year, Month, Day : Word;
  Hour, Minute, Second, MillSecond : Word;
begin
  DateUtils.DecodeDateTime( dtOrigin ,
                            Year   ,
                            Month  ,
                            Day    ,
                            Hour   ,
                            Minute ,
                            Second ,
                            MillSecond );

  Result := DateUtils.EncodeDateTime( Year  ,
                                      Month ,
                                      Day   ,
                                      23    ,
                                      59    ,
                                      59    ,
                                      0 );
end;

procedure GetTheYYYYMM( var nYEAR: Integer; var nMONTH: Integer; var nDAY: Integer; dtThe: TDateTime );
var
  Year, Month, Day : Word;
  Hour, Minute, Second, MillSecond : Word;
begin
  //Next month
  DateUtils.DecodeDateTime( dtThe ,
                            Year   ,
                            Month  ,
                            Day    ,
                            Hour   ,
                            Minute ,
                            Second ,
                            MillSecond );
  nYEAR  := Year;
  nMONTH := Month;
  nDAY   := Day;
end;

//Get the first day of the month
function GetMonthFirstDay( ADateTime: TDateTime ):TDateTime;
var
  Year,Month,Day:Word;
  Hour,Minute,Second,MillSecond:Word;
begin
  //Load the calendar of the current month
  DateUtils.DecodeDateTime( ADateTime ,
                            Year   ,
                            Month  ,
                            Day    ,
                            Hour   ,
                            Minute ,
                            Second ,
                            MillSecond );
  Hour   := 0;
  Day    := 1;
  Result := DateUtils.EncodeDateTime( Year  ,
                                      Month ,
                                      Day   ,
                                      0     ,
                                      0     ,
                                      0     ,
                                      0 );
end;

// https://niceit.tistory.com/202
// 프로그램 실행 파일명을 이용한 실행여부 판단..
function ExistsTheProcess( exeFileName: string ): Boolean;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
  Result := False;
  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
      UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) =
      UpperCase(ExeFileName))) then
    begin
      Result := True;
    end;
    ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;

function IfThen(c: boolean; a, b: string): string;
begin
  if c then
    Result := a
  else
    Result := b;
end;

procedure KillProcess(hWindowHandle: HWND);
var
  hprocessID: INTEGER;
  processHandle: THandle;
  DWResult: DWORD;
begin
  try
    SendMessageTimeout( hWindowHandle ,
                        WM_CLOSE ,
                        0, 0,
                        SMTO_ABORTIFHUNG or SMTO_NORMAL ,
                        5000 ,
                        DWResult );

    if isWindow( hWindowHandle ) then
    begin
      // PostMessage(hWindowHandle, WM_QUIT, 0, 0);

      { Get the process identifier for the window}
      GetWindowThreadProcessID( hWindowHandle, @hprocessID );

      if( hprocessID <> 0 )then
      begin
        { Get the process handle }
        processHandle := OpenProcess( PROCESS_TERMINATE or PROCESS_QUERY_INFORMATION,
                                      False,
                                      hprocessID );
        if( processHandle <> 0 )then
        begin
          { Terminate the process }
          TerminateProcess( processHandle, 0 );
          CloseHandle( ProcessHandle );
        end;
      end;

    end;
  except
    on E: Exception do
    begin
      Assert(False, E.message);
    end;
  end;
end;

function ExecuteFile( const filename ,
                            Params ,
                            DefaultDir : string;
                            ShowCmd    : integer ): THandle;
begin
  try
    {$IFDEF MSWINDOWS}
      result := ShellExecute( 0, 'Open',
                              PChar(filename),
                              PChar(Params),
                              PChar(DefaultDir),
                              ShowCmd );
    {$ENDIF}
    {$IFDEF MACOS}
      _system(PAnsiChar('open ' + AnsiString(filename)));
    {$ENDIF}
  except
    on E: Exception do
    begin
      Assert(False, E.message);
    end;
  end;
end;

function KillTask(ExeFileName: string): Integer;
const
  PROCESS_TERMINATE = $0001;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  hWnd         : THandle;
  FProcessEntry32: TProcessEntry32;
  //copyData       : TCopyDataStruct;
  //clsName  : Array[0..511] of char;
  //Text : Array[0..511] of char;
  Loop_cnt       : integer;

  function CheckProcess(ExeFileName: string) : Boolean;
  var
    hSnapShot: THandle;
    uProcess: TProcessEntry32;
    //FindBool : Boolean ;
  begin
    try
        Result := False ;
        Try
          hSnapShot := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
          if (hSnapShot = INVALID_HANDLE_VALUE) then exit;

          uProcess.dwSize := SizeOf(uProcess);

          if (Process32First(hSnapShot, uProcess)) then
          begin
            repeat
              if ( uProcess.th32ProcessID > 0 ) then
              begin
                if ( UpperCase( uProcess.szExeFile ) = UpperCase( ExeFileName ) ) or
                 ( UpperCase( ExtractFileName(uProcess.szExeFile) ) = UpperCase( ExeFileName ) )
                  then
                begin
                  Result := True ;
                  break;
                end;
              end;
            until not (Process32Next(hSnapShot, uProcess));
          end;
          CloseHandle(hSnapShot);
        Finally
        End;
    except
      on E: Exception do
      begin
        Assert(False, E.message);
      end;
    end;
  end;

  function GetProcessModule(dwPID: dword; ProcessName: string): boolean;
  var
    hModuleSnap: THandle;
    ModEntry: TModuleEntry32;
  begin
    try
      result := false;
      hModuleSnap := CreateToolhelp32Snapshot(TH32CS_SNAPMODULE, dwPID);
      if hModuleSnap = THandle(-1) then exit;
      ModEntry.dwSize := sizeof(TModuleEntry32);
      if Module32First(hModuleSnap, ModEntry) then
      begin
        repeat
          if LowerCase( ModEntry.szModule ) = LowerCase( ProcessName ) then
          begin
            CloseHandle(hModuleSnap);
            result := true;
            exit;
          end;
        until not Module32Next(hModuleSnap, ModEntry);
      end;
      CloseHandle(hModuleSnap);
    except
      on E: Exception do
      begin
        Assert(False, E.message);
      end;
    end;
  end;

  function KillProcess2(ProcessName: string): integer;
  var
    hProcessSnap: THandle;
    ProcEntry: TProcessEntry32;
    bCurrent: boolean;
    hProcess: THandle;
    nCode: DWORD; //프로세스 종료 상태
  begin
    try
      result := 0;
      hProcessSnap := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
      if hProcessSnap = THandle(-1) then exit;
      ProcEntry.dwSize := sizeof(TProcessEntry32);
      if Process32First(hProcessSnap, ProcEntry) then
      begin
        repeat
          bCurrent := GetProcessModule(ProcEntry.th32ProcessID, ProcessName);
          if bCurrent then
          begin
            hProcess := OpenProcess(PROCESS_ALL_ACCESS, TRUE, ProcEntry.th32ProcessID);
            if hProcess <> 0 then
            begin
              if TerminateProcess(hProcess, 0) then
              begin
                GetExitCodeProcess(hProcess, nCode);
              end;
              CloseHandle(hProcess);
              Inc(result);
              if result >= 2 then
              begin
                // 무한에서 빠저 나올려고함..
                break;
              end;
            end;
          end;
        //다음 프로세스의 정보를 구하여 있으면 루프를 돈다.
        until not Process32Next(hProcessSnap, ProcEntry);
      end;
      CloseHandle(hProcessSnap);
    except
      on E: Exception do
      begin
        Assert(False, E.message);
      end;
    end;
  end;

begin
  try
    Result := 0;

    if CheckProcess( ExeFileName )  then
    begin
       try
           with TIniFile.Create( ExtractFilePath( ParamStr(0) ) + 'SOLO_HANDLE.ini' ) do
           begin
              hWnd := ReadInteger('PRG_P',ExeFileName, 0 );
              WriteInteger('PRG_P',ExeFileName, 0 );
              Free;
              if hWnd > 0 then
              begin
                 postMessage( hWnd, WM_USER + 1004, 0, 0 );
                 Sleep(100);
                 postMessage(hWnd, WM_QUIT,0,0); //
                 Sleep(100);
                 if CheckProcess( ExeFileName )  then
                 begin
                     postMessage( hWnd, WM_USER + 1004, 0, 0 );
                     postMessage(hWnd, WM_QUIT,0,0);
                 end
                 else exit;

              end;
           end;
       except
       end;
    end
    else exit;

   Sleep(100);

    if CheckProcess( ExeFileName )  then
      try  ShellExecute(0, 'Open', PWideChar('TASKKILL.exe') , PWideChar(' /F /IM '+ ExeFileName +' /t ') , nil, SW_HIDE );  except end;

    KillProcess2(ExeFileName);
    Loop_cnt := 0;
    while CheckProcess(ExeFileName) do
    begin
      inc(Loop_cnt);
      FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
      FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
      ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);

      while Integer(ContinueLoop) <> 0 do
      begin
        if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
          UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) =
          UpperCase(ExeFileName))) then
          Result := Integer(TerminateProcess(
                            OpenProcess(PROCESS_TERMINATE,
                                        True,
                                        FProcessEntry32.th32ProcessID),
                                        0));
        ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
      end;
      CloseHandle(FSnapshotHandle);

      Sleep(100);
      if Loop_cnt >= 2 then exit;
    end;
  except
    on E: Exception do
    begin
      Assert(False, E.message);
    end;
  end;
end;

// http://www.martinstoeckli.ch/delphi/delphi.html#AppVersion
function GetFmtFileVersion( const FileName: String = '';
                            const Fmt     : String = '%d.%d.%d.%d' ): String;
var
  sFileName   : String;
  iBufferSize : DWORD;
  iDummy      : DWORD;
  pBuffer     : Pointer;
  pFileInfo   : Pointer;
  iVer        : array[1..4] of Word;

begin

  // Set default value..
  Result    := '';

  // Get filename of exe/dll if no filename is specified..
  sFileName := FileName;

  if (sFileName = '') then
  begin
    // Prepare buffer for path and terminating #0
    SetLength(sFileName, MAX_PATH + 1);
    SetLength(sFileName, GetModuleFileName(hInstance, PChar(sFileName), MAX_PATH + 1));
  end;

  // Get size of version info (0 if no version info exists)
  iBufferSize := GetFileVersionInfoSize( PChar(sFileName), iDummy );

  if (iBufferSize > 0) then
  begin
    GetMem(pBuffer, iBufferSize);
    try
      // Get fixed file info (language independent)
      GetFileVersionInfo(PChar(sFileName), 0, iBufferSize, pBuffer);
      VerQueryValue(pBuffer, '\', pFileInfo, iDummy);

      // Read version blocks
      iVer[1] := HiWord(PVSFixedFileInfo(pFileInfo)^.dwFileVersionMS);
      iVer[2] := LoWord(PVSFixedFileInfo(pFileInfo)^.dwFileVersionMS);
      iVer[3] := HiWord(PVSFixedFileInfo(pFileInfo)^.dwFileVersionLS);
      iVer[4] := LoWord(PVSFixedFileInfo(pFileInfo)^.dwFileVersionLS);

    finally
      FreeMem(pBuffer);
    end;
    // format result string
    Result := Format(Fmt, [iVer[1], iVer[2], iVer[3], iVer[4]]);
  end;
end;

function StrToByte(const Value: AnsiString): TBytes;
var
  I: Integer;
begin
  SetLength( Result, Length(Value));
  for I:= 0 to Length(Value)-1 do
    Result[I] := Ord(Value[I+1])-48;
end;

function Hex2Dec(const S: string): Longint;
var
  HexStr: string;
begin
  if Pos('$', S) = 0 then
    HexStr := '$' + S
  else
    HexStr := S;
  Result := StrToIntDef(HexStr, 0);
end;

function fDuplicateRun( sFile: String ) : Boolean;
begin

  Result := False;
  g_hWnd := CreateFileMapping( $FFFFFFFF,
                               nil,
                               PAGE_READWRITE,
                               0,
                               1024,
                               PChar( sFile ) );

  if( g_hWnd = 0 )then
  begin
    Result := True;
  end;

  if( GetLastError() = ERROR_ALREADY_EXISTS )then
  Begin
    CloseHandle( g_hWnd );
    Result := True;
  End;

end;

function HexStrToByte(const Value: AnsiString): TBytes;
var
  btTemp: Byte;
  asTemp: Ansistring;
  L, I: Integer;
begin
  L := Length( Value ) div 2;
  SetLength( Result, L);
  for I:= 0 to L-1 do
  begin
    if ( i = 0 )then
      asTemp := MidStr( Value, I*2, 2 )
    else
      asTemp := MidStr( Value, I*2, 3 );
    btTemp := Hex2Dec( asTemp );
    Result[I] := btTemp;
  end
end;

function ByteToStr(const Value: TBytes): AnsiString;
var
  I:Integer;
  S: AnsiString;
  Letra: AnsiChar;
begin
  S:='';
  for I := Length(Value)-1 Downto 0 do
  begin
    Letra := AnsiChar( Value[i]+48);
    S := Letra + S;
  end;
  Result:=S;
end;

Initialization
Begin
  ;
End;

Finalization
begin
  ;
end;

end.
