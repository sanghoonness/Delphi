unit Tables;

interface

uses
  SysUtils,
  Dialogs,
  Classes,
  DB,
  Global,
  ADODB;

type
  TdmTables = class(TDataModule)

    ADODB: TADOConnection;
    qryLprProc: TADOQuery;
    qryNormal: TADOQuery;
    qryRecvLpr1: TADOQuery;
    qryRecvLpr2: TADOQuery;
    qryNormalOut1: TADOQuery;
    qryNormalOut2: TADOQuery;
    qryLost: TADOQuery;
    qryLostParkNo: TSmallintField;
    qryLostUnitNo: TWordField;
    qryLostUnitName: TStringField;
    qryLostProcDate: TStringField;
    qryLostProcTime: TStringField;
    qryLostTKNo: TStringField;
    qryLostTKType: TWordField;
    qryLostCarTypeNo: TWordField;
    qryLostInImage1: TStringField;
    qryLostInCarNo1: TStringField;
    qryLostInImage2: TStringField;
    qryLostInCarNo2: TStringField;
    qryLostStatus: TWordField;
    qryLostOutUnitNo: TWordField;
    qryLostOutDate: TStringField;
    qryLostOutTime: TStringField;
    qryLostOutChk: TWordField;
    qryLostOutImage1: TStringField;
    qryLostOutCarNo1: TStringField;
    qryLostOutImage2: TStringField;
    qryLostOutCarNo2: TStringField;
    qryLostInRecog1: TWordField;
    qryLostOutRecog1: TWordField;
    qryLostInRecog2: TWordField;
    qryLostOutRecog2: TWordField;
    qryLostReserve5: TStringField;
    qryLostReserve4: TStringField;
    qryLostReserve3: TStringField;
    qryLostReserve2: TStringField;
    qryLostReserve1: TStringField;
    dsLost: TDataSource;
    qryUnitInfo: TADOQuery;
    qryUnitInfoParkNo: TSmallintField;
    qryUnitInfoUnitNo: TWordField;
    qryUnitInfoUnitName: TStringField;
    qryUnitInfoUnitKind: TWordField;
    qryUnitInfoMyNo: TWordField;
    qryUnitInfoComPort: TWordField;
    qryUnitInfoBaudrate: TWordField;
    qryUnitInfoIPNo: TStringField;
    qryUnitInfoPortNo: TIntegerField;
    qryUnitInfoReserve1: TStringField;
    qryUnitInfoReserve2: TStringField;
    qryUnitInfoReserve3: TStringField;
    qryUnitInfoReserve4: TStringField;
    qryUnitInfoReserve5: TStringField;
    dsUnitInfo: TDataSource;
    qryHoliday: TADOQuery;
    qryHolidayParkNo: TSmallintField;
    qryHolidayHDate: TStringField;
    qryHolidayHName: TStringField;
    qryHolidayReserve1: TStringField;
    qryHolidayReserve2: TStringField;
    qryHolidayReserve3: TStringField;
    qryHolidayReserve4: TStringField;
    qryHolidayReserve5: TStringField;
    dsHoliday: TDataSource;
    qryHolidayHType: TWordField;
    qryReturnFee: TADOQuery;
    qryFeeCalc: TADOQuery;
    qryParkInfo: TADOQuery;
    dsParkInfo: TDataSource;
    qryParkInfoParkNo: TSmallintField;
    qryParkInfoParkName: TStringField;
    qryParkInfoParkAddr: TStringField;
    qryParkInfoRegNo: TStringField;
    qryParkInfoAdmin: TStringField;
    qryParkInfoTelephone: TStringField;
    qryParkInfoReceipt: TStringField;
    qryParkInfoDayMax: TIntegerField;
    qryParkInfoTotMax: TIntegerField;
    qryParkInfoCalcType: TWordField;
    qryParkInfoClosingTime: TStringField;
    qryParkInfoAutoClosing: TWordField;
    qryParkInfoHolidayProc: TWordField;
    qryParkInfoReceiptAuto: TWordField;
    qryParkInfoReceiptZero: TWordField;
    qryParkInfoTaxType: TWordField;
    qryParkInfoJunkType: TWordField;
    qryParkInfoRoundType: TWordField;
    qryParkInfoTimeDCType: TWordField;
    qryParkInfoCurrencyType: TWordField;
    qryParkInfoDCReason: TWordField;
    qryParkInfoLostCalc: TWordField;
    qryParkInfoLostAmount: TIntegerField;
    qryParkInfoSpecialTariff: TWordField;
    qryParkInfoCommercialCar: TWordField;
    qryParkInfoParkingDayMax: TWordField;
    qryParkInfoDCCntMax: TWordField;
    qryParkInfoVanIP: TStringField;
    qryParkInfoVanPort: TIntegerField;
    qryParkInfoReserve1: TStringField;
    qryParkInfoReserve2: TStringField;
    qryParkInfoReserve3: TStringField;
    qryParkInfoReserve4: TStringField;
    qryParkInfoReserve5: TStringField;
    qryTemp: TADOQuery;
    qryMoneyProc: TADOQuery;
    qryModify: TADOQuery;
    qryFeeItem: TADOQuery;
    qryBarProc: TADOQuery;
    qryFreeIO: TADOQuery;
    qryNormalIn1: TADOQuery;
    qryNormalIn2: TADOQuery;
    qryCancelData: TADOQuery;
    qryCtrl: TADOQuery;
    qryDCTemp: TADOQuery;
    qryRecvOutLpr1: TADOQuery;
    qryOutLpr1Proc: TADOQuery;
    qryRecvOutLpr2: TADOQuery;
    qryOutLpr2Proc: TADOQuery;
    qryRecvOutLpr3: TADOQuery;
    qryOutLpr3Proc: TADOQuery;
    qryRecvInLpr1: TADOQuery;
    qryInLpr1Proc: TADOQuery;
    qryRecvInLpr2: TADOQuery;
    qryInLpr2Proc: TADOQuery;
    qryRecvInLpr3: TADOQuery;
    qryInLpr3Proc: TADOQuery;
    qryRecvInLpr4: TADOQuery;
    qryInLpr4Proc: TADOQuery;
    qryRecvInLpr5: TADOQuery;
    qryInLpr5Proc: TADOQuery;
    qryMichulProc: TADOQuery;
    qrySCSearch: TADOQuery;
    dsSCSearch: TDataSource;
    qrySCSearchCarNo: TStringField;
    qrySCSearchName: TStringField;
    qrySCSearchCompName: TStringField;
    qrySCSearchExpDateF: TStringField;
    qrySCSearchExpDateT: TStringField;
    qryManualOut: TADOQuery;
    qryRecvOutLpr4: TADOQuery;
    qryOutLpr4Proc: TADOQuery;
    qryNormalOut3: TADOQuery;
    qryIOBData: TADOQuery;
    qryInsertBlackList: TADOQuery;
    qryVisitInsert: TADOQuery;
    qryVisit: TADOQuery;
    qryVisitList: TADOQuery;
    qryVisitDelete: TADOQuery;
    qryDbCheck: TADOQuery;
    qryVisitPoint: TADOQuery;
    qryVisitList2: TADOQuery;
    qryWORK: TADOQuery;
    qryWORK2: TADOQuery;
    qryWORK3: TADOQuery;

  private
    { Private declarations }

    // ???? ?????? ????&???? >>>>>>>>
    function fSelect_such_count_on_IONData( s_car_no: string ): Integer;
    function fSelect_such_count_on_IOSData( s_car_no: string ): Integer;

    function fSelect_all_count_on_CustInfo_IOSData( s_dong, s_ho: string ): Integer;
    function fSelect_all_count_on_visitinfo_IONData( s_dong, s_ho: string ): Integer;
    function fSelect_all_count_on_CustInfo_visitinfo_IONData_IOSData( var res: ST_IN_LIST_RES; s_dong, s_ho: string ): Integer;

  public
    { Public declarations }

    // ???? ?????? ????&???? >>>>>>>>
    function fSet_buf_select_all_on_IONData( {nBASE: Integer;} sCarNo: string; var  buf: ST_IN_LIST_RES ): Integer;
    function fSet_buf_select_all_on_IOSData( {nBASE: Integer;} sCarNo: string; var  buf: ST_IN_LIST_RES ): Integer;

    function fSelect_family_on_CustInfo( s_dong, s_ho: string ): ST_IN_LIST_RES;
    function fSelect_visitor_on_visitinfo( s_dong, s_ho: string ): ST_IN_LIST_RES;
    function fSelect_all_on_CustInfo_visitinfo( s_dong, s_ho: string ): ST_IN_LIST_RES;

    // ???????? ?????? ????&???? >>>>>>>>
    function fSelect_all_on_visitinfo( s_dong, s_ho: string ): ST_VISIT_LIST_RES;

    // ???????? ???? ????&???? >>>>>>>>
    function fSelect_max_tkno_on_visitinfo(): string;
    function fSelect_be_included_on_visitinfo( req : ST_VISIT_REG_REQ ): Integer;
    function fInsert_the_on_visitinfo( req : ST_VISIT_REG_REQ ): ST_VISIT_REG_RES;

    //?????? ?????? ???????? ???? ????&????
    function fSelect_be_included_on_visitinfo2( req : ST_VISIT_REG_REQ2 ): Integer;
    function fInsert_the_on_visitinfo2( req : ST_VISIT_REG_REQ2 ): ST_VISIT_REG_RES;
    function fSelect_the_on_visitInCar( req : ST_VISIT_REG_REQ2 ): ST_VISIT_REG_RES;

    // ????????.???? ????&???? >>>>>>>>
    function fDelete_the_on_visitinfo( req : ST_VISIT_DEL_REQ ): ST_VISIT_DEL_RES;

    // ???????? ????????.????.????&???? >>>>>>>>
    function fSelect_be_included_on_tVisitfavo( req : ST_VISIT_FAVO_REG_REQ ): Integer;
    function fInsert_the_on_tVisitfavo( req : ST_VISIT_FAVO_REG_REQ ): ST_VISIT_FAVO_REG_RES;

    // ???????? ???????? ??????.????&???? >>>>>>>>
    function fSelect_all_on_tVisitfavo( buf: ST_VISIT_FAVO_LIST_REQ ): ST_VISIT_FAVO_LIST_RES;

    // ???????? ???????? ????.????&???? >>>>>>>>
    function fSelect_be_deleted_on_tVisitfavo( req : ST_VISIT_FAVO_DEL_REQ ): Integer;
    function fDelete_The_on_tVisitfavo( req : ST_VISIT_FAVO_DEL_REQ ): ST_VISIT_FAVO_DEL_RES;

    // Alias ????????.????&???? >>>>>>>>
    function fSelect_such_alias_on_CustInfo( req : ST_ALIAS_SINGLE_REQ ): ST_ALIAS_SINGLE_RES;

    // Alias ???? ????&???? >>>>>>>>
    function fUpdate_the_alias_on_CustInfo( req : ST_CAR_ALIAS_MODIFY_REQ ): ST_CAR_ALIAS_MODIFY_RES;

    // ???????? ???????? ????&???? >>>>>>>>
    function fSelect_Cars_on_CustInfo( req : ST_FIND_CAR_REQ ): ST_FIND_CAR_RES;

  end;

var
  dmTables: TdmTables;

implementation

uses
    DateUtils
  , EasyOnHomeInfo;

{$R *.dfm}

function TdmTables.fSelect_such_count_on_IOSData( s_car_no: string ): Integer;
begin
  Result := 0;

  with qryWORK2 do
  begin

    Close;
    SQL.Clear;

    SQL.Add(' Select count(InCarNo1) CNT ');
    SQL.Add('   from IOSData             ');
    SQL.Add('  where InCarNo1 = :sCarNo  ');

    Parameters.ParamByName('sCarNo').Value := s_car_no;

    Open;
    First;

    if RecordCount = 0 then
    begin
      Result := 0;
    end
    else
    begin
      Result := FieldByName('CNT').AsInteger;
    end;
  end;
end;

//???? ???? ?? ???????? ???? ?? ???? ???? ????(?????? ??????)
function TdmTables.fSelect_the_on_visitInCar( req: ST_VISIT_REG_REQ2): ST_VISIT_REG_RES;
var
  nResult : Integer;
  nTemp   : Integer;
  sTKNo ,
  sTemp   : string;
  dtS     : TDateTime;
  dtE     : TDateTime;
  vstartDt, vstartDTime : string;
begin
  try
    Assert( False, '[HomeInfo] ???????? ???? ???? ????: '+req.s_car_number+'/'+req.s_date);
    try
      with qryWORK3 do
      begin
        //???????????? ???????? ???? ???? ?? ???? ?? ???? ????????
        if smartVillageVisit_Ver = 1 then
        begin
          Close;
          SQL.Clear;
          SQL.Text :='Select * From IONData '+#13#10+
                     'Where procdate = :v1 and IncarNo1 = :v2 '+#13#10+
                     'order by procdate desc, proctime desc ';
          Parameters.ParamByName('v1').Value := Copy(req.s_date, 1, 4)+'-'+Copy(req.s_date, 5, 2)+'-'+Copy(req.s_date, 7, 2);
          Parameters.ParamByName('v2').Value := req.s_car_number;
          Open;

          if Fields[0].AsString <> '' then
          begin
            //vstartDt    := Copy(fieldbyname('ProcDate').asString, 1, 4) + Copy(fieldbyname('ProcDate').asString, 6, 2) + Copy(fieldbyname('ProcDate').asString, 9, 2);
            //vstartDTime := Copy(fieldbyname('ProcTime').asString, 1, 2) + Copy(fieldbyname('ProcTime').asString, 4, 2)+ Copy(fieldbyname('ProcTime').asString, 7, 2);
            vstartDt    := fieldbyname('ProcDate').asString;
            vstartDTime := fieldbyname('ProcTime').asString;
            nsCardNo    := fieldbyname('TKno').asString;
            nsLprFile1  := fieldbyname('InImage1').asString;
            nsUnitNo    := fieldbyname('UnitNo').asInteger;
            nsVisitDt   := vstartDt +' '+vstartDTime;
            //nStartdate2 := vstartDt +' '+vstartDTime;
            //nEnddate2   := nStartdate2;
            Assert( False, '[HomeInfo] ????????(????????) ???? ????: '+req.s_car_number+'/'+vstartDt +'/'+ vstartDTime);
          end
          else
          begin
            vstartDt    := '';
            vstartDTime := '';
            nsCardNo    := '';
            nsLprFile1  := '';
            nsUnitNo    := -1;
            nStartdate2 := '';
            nEnddate2   := '';
            nsVisitDt   := '';
            Assert( False, '[HomeInfo] ????????(????????) ???? ???? ????: '+req.s_car_number+'/'+vstartDt +'/'+ vstartDTime);
          end;
        end;
      end;
    except
      on  E : exception  do
      begin
        Assert( False, '[HomeInfo]'+E.Message );
        //Result := -1;
      end;
    end;
  finally

  end;
end;

function TdmTables.fSelect_such_count_on_IONData( s_car_no: string ): Integer;
begin
  Result := 0;

  with qryWORK2 do
  begin

    Close;
    SQL.Clear;

    SQL.Add(' Select count(InCarNo1) CNT ');
    SQL.Add('   from IONData             ');
    SQL.Add('  where InCarNo1 = :sCarNo  ');

    Parameters.ParamByName('sCarNo').Value := s_car_no;

    Open;
    First;

    if RecordCount = 0 then
    begin
      Result := 0;
    end
    else
    begin
      Result := FieldByName('CNT').AsInteger;
    end;
  end;
end;

function TdmTables.fSelect_all_count_on_CustInfo_visitinfo_IONData_IOSData( var res: ST_IN_LIST_RES; s_dong, s_ho: string ): Integer;
var
  nTemp   : Integer;
  s_car_no: string;
begin
  Result := 0;

  with qryWORK do
  begin

    Close;
    SQL.Clear;

    {$IFDEF  XXXXXXXXXXXXXXXXXXXXX}
    SQL.Text := ' select A.CarNo from (      '+#13#10+
                ' select CarNo               '+#13#10+
                '   from CustInfo            '+#13#10+
                '  where CompName = ''{N1}'' '+#13#10+
                '    and deptName = ''{N2}'' '+#13#10+
                ' UNION                      '+#13#10+
                ' select CarNo               '+#13#10+
                '   from visitinfo           '+#13#10+
                '  where dong     = ''{N1}'' '+#13#10+
                '    and ho       = ''{N2}'' '+#13#10+
                '    and Visit_flag = ''Y''  '+#13#10+
                ' )A                         '+#13#10+
                ' group by A.CarNo           ' ;
    {$ENDIF}

    //====================================================================
    // ???????? count..

    SQL.Text := ' select CarNo               '+#13#10+
                '   from CustInfo            '+#13#10+
                '  where CompName = ''{N1}'' '+#13#10+
                '    and deptName = ''{N2}'' '+#13#10+
                ' group by CarNo             ' ;

    SQL.Text := StringReplace( SQL.Text, '{N1}', s_dong, [rfReplaceAll]);
    SQL.Text := StringReplace( SQL.Text, '{N2}', s_ho  , [rfReplaceAll]);

    Open;
    first;

    if RecordCount = 0 then
    begin
      Result := Result + 0;
      res.a_list.n_count_1 := res.a_list.n_count_1 + 0;
    end
    else
    begin
      while not Eof do
      begin
        //##### (????????&????.????:N)
        s_car_no := FieldByName('CarNo').AsString;
        nTemp    := fSelect_such_count_on_IOSData( s_car_no );

        Result := Result + nTemp;
        res.a_list.n_count_1 := res.a_list.n_count_1 + nTemp;

        Next;
      end;
    end;



    //====================================================================
    // ???????? count..

    Close;
    SQL.Clear;

    SQL.Text := ' select CarNo                 '+#13#10+
                '   from visitinfo             '+#13#10+
                '  where dong       = ''{N1}'' '+#13#10+
                '    and ho         = ''{N2}'' '+#13#10+
                '    and Visit_flag = ''Y''    '+#13#10+
                ' group by CarNo               ' ;

    SQL.Text := StringReplace( SQL.Text, '{N1}', s_dong, [rfReplaceAll]);
    SQL.Text := StringReplace( SQL.Text, '{N2}', s_ho  , [rfReplaceAll]);

    Open;
    first;

    if RecordCount = 0 then
    begin
      Result := Result + 0;
      res.a_list.n_count_2 := res.a_list.n_count_2 + 0;
    end
    else
    begin
      while not Eof do
      begin
        //##### (????????&????.????:N)
        s_car_no := FieldByName('CarNo').AsString;
        nTemp    := fSelect_such_count_on_IONData( s_car_no );

        Result               := Result               + nTemp;
        res.a_list.n_count_2 := res.a_list.n_count_2 + nTemp;

        Next;
      end;
    end;

  end;
end;

function TdmTables.fSelect_all_count_on_visitinfo_IONData( s_dong, s_ho: string ): Integer;
var
  s_car_no: string;
begin
  Result := 0;

  with qryWORK do
  begin

    Close;
    SQL.Clear;

    SQL.Add(' select A.CarNo from (  ');
    SQL.Add(' select CarNo           ');
    SQL.Add('   from visitinfo       ');
    SQL.Add('  where dong = :sdong   ');
    SQL.Add('    and ho   = :sho     ');
    SQL.Add(' )A                     ');
    SQL.Add(' group by A.CarNo       ');

    Parameters.ParamByName('sdong').Value := s_dong;
    Parameters.ParamByName('sho'  ).Value := s_ho;

    Open;
    first;

    if RecordCount = 0 then
    begin
      Result := Result + 0;
    end
    else
    begin
      while not Eof do
      begin
        //##### (????????:N)
        s_car_no := FieldByName('CarNo').AsString;

        Result := Result + fSelect_such_count_on_IONData( s_car_no );
        Next;
      end;
    end;
  end;
end;

function TdmTables.fSelect_all_count_on_CustInfo_IOSData( s_dong, s_ho: string ): Integer;
var
  s_car_no: string;
begin
  Result := 0;

  with qryWORK do
  begin

    Close;
    SQL.Clear;

    SQL.Add(' select A.CarNo from (    ');
    SQL.Add(' select CarNo             ');
    SQL.Add('   from CustInfo          ');
    SQL.Add('  where CompName = :sdong ');
    SQL.Add('    and deptName = :sho   ');
    SQL.Add(' )A                       ');
    SQL.Add(' group by A.CarNo         ');

    Parameters.ParamByName('sdong').Value := s_dong;
    Parameters.ParamByName('sho'  ).Value := s_ho;

    Open;
    first;

    if RecordCount = 0 then
    begin
      Result := Result + 0;
    end
    else
    begin
      while not Eof do
      begin
        //##### (????????:N)
        s_car_no := FieldByName('CarNo').AsString;

        Result := Result + fSelect_such_count_on_IOSData( s_car_no );
        Next;
      end;
    end;
  end;
end;

function TdmTables.fSelect_max_tkno_on_visitinfo(): string;
var
  dTemp : double;
  sTemp : string;
begin
  Result := '';
  try
    try
      with qryWORK2 do
      begin

        Close;
        SQL.Clear;

        SQL.Add(' select max( tkno ) max ');
        SQL.Add('   from VisitInfo       ');
        Open;
        first;

        if RecordCount > 0 then
        begin
          sTemp := FieldByName('max').AsString;
          dTemp := StrToFloatDef( sTemp, 0 ) + 1;
        end
        else
        begin
          sTemp := formatdatetime( 'YYMMddHHmmsszz', now );
          dTemp := StrToFloatDef( sTemp, 0 );
        end;


      end;
    except
      on  E : exception  do
      begin
        Assert( False, '[HomeInfo]'+E.Message );

        sTemp := formatdatetime( 'YYMMddHHmmsszz', now );
        dTemp := StrToFloatDef( sTemp, 0 );
      end;
    end;
  finally
    Result := '0'+FloatToStr( dTemp );
  end;
end;

function TdmTables.fSelect_be_included_on_tVisitfavo( req : ST_VISIT_FAVO_REG_REQ ): Integer;
begin
  Result := 0;
{
    s_command    : string;
    s_dong       : string;
    s_ho         : string;
    s_car_number : string; // "????????",
    s_register   : string; // App???? ?????? ????????, ?????????? ?????? ??????????
}
  try
    try
      with qryWORK3 do
      begin

        Close;
        SQL.Clear;

        SQL.Text := ' select nReg_No              '+#13#10+
                    '   from tVisitfavo           '+#13#10+
                    '  where nDong       = :N1    '+#13#10+
                    '    and nHo         = :N2    '+#13#10+
                    '    and sCar_Number = :N3    '+#13#10+
                    '    and sDeleteYN   = ''N''  ' ;

        Parameters.ParamByName('N1').Value := req.s_dong       ;
        Parameters.ParamByName('N2').Value := req.s_ho         ;
        Parameters.ParamByName('N3').Value := req.s_car_number ;

        Open;

        Result := RecordCount;

      end;
    except
      on  E : exception  do
      begin
        Assert( False, '[HomeInfo]'+E.Message );
        Result := -1;
      end;
    end;
  finally
    ;
  end;
end;

function TdmTables.fSelect_be_included_on_visitinfo( req : ST_VISIT_REG_REQ ): Integer;
var
  nResult : Integer;
  nTemp   : Integer;
  sTKNo ,
  sTemp   : string;
  dtS     : TDateTime;
  dtE     : TDateTime;
begin

  Result := 0;

  try
    try
      with qryWORK3 do
      begin

        Close;
        SQL.Clear;

        SQL.Text := ' select CarNo                                     '+#13#10+
                    '   from visitInfo                                 '+#13#10+
                    '  where :N1 between StartDateTime and EndDatetime '+#13#10+
                    '    and dong  = :N2                               '+#13#10+
                    '    and ho    = :N3                               '+#13#10+
                    '    and carno = :N4 ;                             ' ;

        if( req.s_term <> '0' )then
        begin
          dtE   := StringToDate( req.s_date + '235959' );
          nTemp := StrToInt( req.s_term ) - 1;
          dtE   := IncDay( dtE, nTemp );
          //sTemp := DateTimeToStr( dtE );
        end
        else
        begin
          dtE := StringToDate( req.s_date + '235959' );
        end;

        dtS   := StringToDate( req.s_date + '000000' );

        Parameters.ParamByName('N1').Value := dtE              ;
        Parameters.ParamByName('N2').Value := req.s_dong       ;
        Parameters.ParamByName('N3').Value := req.s_ho         ;
        Parameters.ParamByName('N4').Value := req.s_car_number ;

        Open;

        Result := RecordCount;
        Result := Result;

      end;
    except
      on  E : exception  do
      begin
        Assert( False, '[HomeInfo]'+E.Message );
        Result := -1;
      end;
    end;
  finally
    ;
  end;
end;

function TdmTables.fSelect_be_included_on_visitinfo2(req: ST_VISIT_REG_REQ2): Integer;
var
  nResult : Integer;
  nTemp   : Integer;
  sTKNo ,
  sTemp   : string;
  dtS     : TDateTime;
  dtE     : TDateTime;
  //vstartDt, vendDt, nStartdate, nEnddate, nStartdate2, nEnddate2 : string;
  vstartDt, vendDt, nStartdate, nEnddate: string;
begin
  Result := 0;
  try
    try
      with qryWORK3 do
      begin
        //???????????? ???????? ???? ???? ?? ???? ?? ???? ????????
        if smartVillageVisit_Ver = 1 then
        begin
          Close;
          SQL.Clear;
          SQL.Text :='Select Top 1 * From VisitInfo_SmartVillage '+#13#10+
                     'Where vcarno = :v1 and dong = :v2 and ho = :v3 and vtype =''ADDED'' '+#13#10+
                     'order by vstartDt desc';
          Parameters.ParamByName('v1').Value := req.s_car_number;
          Parameters.ParamByName('v2').Value := req.s_dong;
          Parameters.ParamByName('v3').Value := req.s_ho;
          Open;

          if Fields[0].AsString <> '' then
          begin
            nskind   := 'v';
            vstartDt := Copy(fieldbyname('vstartDt').asString, 1, 10) + ' ' + Copy(fieldbyname('vstartDt').asString, 12, 16);
            vendDt   := Copy(fieldbyname('vendDt').asString, 1, 10) + ' ' + Copy(fieldbyname('vendDt').asString, 12, 16);

            nStartdate := Copy(fieldbyname('vstartDt').asString, 1, 10);
            nEnddate   := Copy(fieldbyname('vendDt').asString, 1, 10);

            nStartdate2 := Copy(fieldbyname('vstartDt').asString, 1, 10) + ' ' + Copy(fieldbyname('vstartDt').asString, 12, 16);;
            nEnddate2   := Copy(fieldbyname('vendDt').asString, 1, 10) + ' ' + Copy(fieldbyname('vendDt').asString, 12, 16);

            req.s_dong := IntToStr(fieldbyname('dong').AsInteger);
            req.s_ho := IntToStr(fieldbyname('ho').AsInteger);
            req.s_car_number := fieldbyname('vcarno').AsString;
            Result := RecordCount;
          end
          else
          begin
            nStartdate2 :='';
            nEnddate2   :='';
            nskind   := 'n';
            nsUnitNo := -1;
            Result := -1;
          end;
        end
        else
        begin
        end;
      end;
    except
      on  E : exception  do
      begin
        Assert( False, '[HomeInfo]'+E.Message );
        Result := -1;
      end;
    end;
  finally

  end;
end;

function TdmTables.fInsert_the_on_tVisitfavo( req : ST_VISIT_FAVO_REG_REQ ): ST_VISIT_FAVO_REG_RES;
var
  nResult : Integer;
  nTemp   : Integer;
  sTKNo ,
  sTemp   : string;
  dtS     : TDateTime;
  dtE     : TDateTime;
begin

  FillChar( Result, SizeOf(ST_VISIT_FAVO_REG_RES), #0 );

  {
    s_dong       : string; //
    s_ho         : string; //
    s_car_number : string; // "????????",
    s_register   : string; // App???? ?????? ????????, ?????????? ?????? ??????????
  }

  nResult := fSelect_be_included_on_tVisitfavo( req );

  if( nResult <= 0 )then
  begin
    try
      try
        with qryWORK do
        begin

          Close;
          SQL.Clear;

          SQL.Text := ' Insert Into         '+#13#10+
                      '   tVisitfavo (      '+#13#10+
                      '     nDong       ,   '+#13#10+
                      ' 	  nHo         ,   '+#13#10+
                      ' 	  sCar_Number ,   '+#13#10+
                      ' 	  sRegister       '+#13#10+
                      '   ) Values (        '+#13#10+
                      '     :N1 ,           '+#13#10+
                      ' 	  :N2 ,           '+#13#10+
                      ' 	  :N3 ,           '+#13#10+
                      ' 	  :N4             '+#13#10+
                      '   )                 ' ;

          Parameters.ParamByName('N1').Value := req.s_dong       ;
          Parameters.ParamByName('N2').Value := req.s_ho         ;
          Parameters.ParamByName('N3').Value := req.s_car_number ;
          Parameters.ParamByName('N4').Value := req.s_register   ;

          nResult := ExecSQL;;

          if( nResult = 0 )then
          begin
            Result.s_status  := '319';
            Result.s_message := 'Already registed favorites car';
          end
          else
          begin
            Result.s_status  := '200';
            Result.s_message := 'OK' ; //Format( '???????? ????(%s) ???? ??????????.', [sTKNo] );
          end;

        end;
      except
        on  E : exception  do
        begin
          Assert( False, '[HomeInfo]'+E.Message );

          Result.s_status  := '204';
          Result.s_message := E.Message;

        end;
      end;
    finally
      ;
    end;
  end
  else
  begin
    Result.s_status  := '319';
    Result.s_message := 'Already registed favorites car';
  end;

end;

function TdmTables.fSelect_be_deleted_on_tVisitfavo( req : ST_VISIT_FAVO_DEL_REQ ): Integer;
var
  sTemp   : string;
  nResult : Integer;
begin

  Result := 0;

  try
    try
      with qryWORK do
      begin

        Close;
        SQL.Clear;

        SQL.Text := ' select nReg_No                '+#13#10+
                    '   from tVisitfavo             '+#13#10+
                    '  where nDong       =   {N1}   '+#13#10+
                    '    and nHo         =   {N2}   '+#13#10+
                    '    and nReg_No     =   {N3}   '+#13#10+
                    '    and sDeleteYN   = ''Y''    '+#13#10+
                    '    and sCar_Number = ''{N4}'' ' ;

        {
        Parameters.ParamByName('N1').Value := req.s_dong       ;
        Parameters.ParamByName('N2').Value := req.s_ho         ;
        Parameters.ParamByName('N3').Value := req.s_reg_no     ;
        Parameters.ParamByName('N4').Value := req.s_car_number ;
        }

        SQL.Text := StringReplace( SQL.Text, '{N1}', req.s_dong       , [rfReplaceAll]);
        SQL.Text := StringReplace( SQL.Text, '{N2}', req.s_ho         , [rfReplaceAll]);
        SQL.Text := StringReplace( SQL.Text, '{N3}', req.s_reg_no     , [rfReplaceAll]);
        SQL.Text := StringReplace( SQL.Text, '{N4}', req.s_car_number , [rfReplaceAll]);

        open;

        Result := RecordCount;
        //--sTemp  := format( '[HomeInfo] %s [RecordCount:%d]' , [SQL.Text, RecordCount ] );
        //--Assert( false, sTemp );

      end;
    except
      on  E : exception  do
      begin
        Assert( False, '[HomeInfo]'+E.Message );
        Result := -1;
      end;
    end;
  finally
    ;
  end;

end;

function TdmTables.fSelect_such_alias_on_CustInfo( req : ST_ALIAS_SINGLE_REQ ): ST_ALIAS_SINGLE_RES;
var
  sTemp : string;
  I     : Integer;
begin

  FillChar( Result, SizeOf(ST_ALIAS_SINGLE_RES), #0 );

  Result.a_list := req.a_list;

  try
    try
      with qryWORK do
      begin

        for I := 0 to req.a_list.n_run_count-1 do
        begin
          sTemp := '';

          Close;
          SQL.Clear;

          SQL.Text := '   select top 1            '+#13#10+
                      '          CarNo            '+#13#10+
                      '        , sAlias           '+#13#10+
                      '     from CustInfo         '+#13#10+
                      '    where CarNo = ''{N1}'' '+#13#10+
                      ' order by dtUpd desc  ;    ' ;

          SQL.Text := StringReplace( SQL.Text, '{N1}', req.a_list.LIST[i].s_car_number , [rfReplaceAll]);

          Open;
          First;

          if( RecordCount = 1 )then
          begin
            sTemp := FieldByName( 'sAlias' ).AsString;
          end;

          Result.a_list.LIST[I].s_alias := sTemp;
        end;

        Result.s_status  := '200';
        Result.s_message := 'OK';

      end;
    except
      on  E : exception  do
      begin
        Assert( False, '[HomeInfo]'+E.Message );

        Result.s_status  := '204';
        Result.s_message := E.Message;
      end;
    end;
  finally
    ;
  end;

end;

function TdmTables.fUpdate_the_alias_on_CustInfo( req : ST_CAR_ALIAS_MODIFY_REQ ): ST_CAR_ALIAS_MODIFY_RES;
begin

  FillChar( Result, SizeOf(ST_CAR_ALIAS_MODIFY_RES), #0 );

  try
    try
      with qryWORK do
      begin

        Close;
        SQL.Clear;

        SQL.Text := ' update CustInfo              '+#13#10+
                    '    set sAlias   = ''{N1}'' , '+#13#10+
                    '        dtUpd    = GETDATE()  '+#13#10+
                    '  where CompName = ''{N2}''   '+#13#10+
                    '    and deptName = ''{N3}''   '+#13#10+
                    '    and CarNo    = ''{N4}''   ' ;

        SQL.Text := StringReplace( SQL.Text, '{N1}', req.s_alias      , [rfReplaceAll]);
        SQL.Text := StringReplace( SQL.Text, '{N2}', req.s_dong       , [rfReplaceAll]);
        SQL.Text := StringReplace( SQL.Text, '{N3}', req.s_ho         , [rfReplaceAll]);
        SQL.Text := StringReplace( SQL.Text, '{N4}', req.s_car_number , [rfReplaceAll]);

        //ShowMessage( SQL.Text );

        ExecSQL;

        Result.s_status  := '200';
        Result.s_message := 'OK' ;
      end;
    except
      on  E : exception  do
      begin
        Assert( False, '[HomeInfo]'+E.Message );

        Result.s_status  := '204';
        Result.s_message := E.Message;
      end;
    end;
  finally
    ;
  end;

end;

function TdmTables.fDelete_The_on_tVisitfavo( req : ST_VISIT_FAVO_DEL_REQ ): ST_VISIT_FAVO_DEL_RES;
var
  sTemp   : string;
  nResult : Integer;
begin

  FillChar( Result, SizeOf(ST_VISIT_FAVO_DEL_RES), #0 );

      // ???? ???????? ????..
  if( fSelect_be_deleted_on_tVisitfavo( req ) <= 0 )then
  begin
    try
      try
        with qryWORK do
        begin

          Close;
          SQL.Clear;

          SQL.Text := ' update tVisitfavo              '+#13#10+
                      '    set sDeleteYN   = ''Y'' ,   '+#13#10+
                      '        dtUpd       = GETDATE() '+#13#10+
                      '  where nDong       =   {N1}    '+#13#10+
                      '    and nHo         =   {N2}    '+#13#10+
                      '    and nReg_No     =   {N3}    '+#13#10+
                      '    and sCar_Number = ''{N4}''  ' ;

          {
            Parameters.ParamByName('N1').Value := req.s_dong       ;
            Parameters.ParamByName('N2').Value := req.s_ho         ;
            Parameters.ParamByName('N3').Value := req.s_reg_no     ;
            Parameters.ParamByName('N4').Value := req.s_car_number ;
          }

          SQL.Text := StringReplace( SQL.Text, '{N1}', req.s_dong       , [rfReplaceAll]);
          SQL.Text := StringReplace( SQL.Text, '{N2}', req.s_ho         , [rfReplaceAll]);
          SQL.Text := StringReplace( SQL.Text, '{N3}', req.s_reg_no     , [rfReplaceAll]);
          SQL.Text := StringReplace( SQL.Text, '{N4}', req.s_car_number , [rfReplaceAll]);

          //--sTemp  := format( '[HomeInfo] %s ', [ SQL.Text ] );
          //--Assert( false, sTemp );

          nResult := ExecSQL;

          if( nResult = 0 )then
          begin
            Result.s_status  := '319';
            Result.s_message := 'Already deleted visit favo car';
          end
          else
          begin
            Result.s_status  := '200';
            Result.s_message := 'OK' ;
          end;

        end;
      except
        on  E : exception  do
        begin
          Assert( False, '[HomeInfo]'+E.Message );

          Result.s_status  := '204';
          Result.s_message := E.Message;
        end;
      end;
    finally
      ;
    end;
  end
  else
  begin
    Result.s_status  := '319';
    Result.s_message := 'Already deleted visit car';
  end;

end;

function TdmTables.fDelete_the_on_visitinfo( req : ST_VISIT_DEL_REQ ): ST_VISIT_DEL_RES;
var
  nResult : Integer;
begin

  FillChar( Result, SizeOf(ST_VISIT_DEL_RES), #0 );

  try
    try
      with qryWORK do
      begin

        Close;
        SQL.Clear;

        SQL.Text := ' delete               '+#13#10+
                    '   from VisitInfo     '+#13#10+
                    '  where dong  = :N1   '+#13#10+
                    '    and ho    = :N2   '+#13#10+
                    '    and TKNo  = :N3   '+#13#10+
                    '    and CarNo = :N4 ; ' ;

        Parameters.ParamByName('N1').Value := req.s_dong       ;
        Parameters.ParamByName('N2').Value := req.s_ho         ;
        Parameters.ParamByName('N3').Value := req.s_reg_no     ;
        Parameters.ParamByName('N4').Value := req.s_car_number ;

        nResult := ExecSQL;;

        if( nResult = 0 )then
        begin
          Result.s_status  := '204';
          Result.s_message := 'There is no data on cars to visit.';
        end
        else
        begin
          Result.s_status  := '200';
          Result.s_message := 'OK' ; //Format( '???????? ????(%s) ???? ??????????.', [sTKNo] );
        end;

      end;
    except
      on  E : exception  do
      begin
        Assert( False, '[HomeInfo]'+E.Message );

        Result.s_status  := '204';
        Result.s_message := E.Message;

      end;
    end;
  finally
    ;
  end;

end;

function TdmTables.fInsert_the_on_visitinfo( req : ST_VISIT_REG_REQ ): ST_VISIT_REG_RES;
var
  nResult : Integer;
  nTemp   : Integer;
  sTKNo ,
  sTemp   : string;
  dtS     : TDateTime;
  dtE     : TDateTime;
begin

  nTemp := dmTables.fSelect_be_included_on_visitinfo( g_mid_json.p_visit_reg.req );

  if( nTemp <= 0 )then
  begin

    FillChar( Result, SizeOf(ST_VISIT_REG_RES), #0 );

    try
      try
        with qryWORK do
        begin

          Close;
          SQL.Clear;

          SQL.Text := ' Insert Into         '+#13#10+
                      '   VisitInfo (       '+#13#10+
                      '     Dong  ,         '+#13#10+
                      ' 	  Ho    ,         '+#13#10+
                      ' 	  CarNo ,         '+#13#10+
                      ' 	  StartDateTime , '+#13#10+
                      ' 	  EndDateTime   , '+#13#10+
                      ' 	  TKNo            '+#13#10+
                      '   ) Values (        '+#13#10+
                      '     :N1 ,           '+#13#10+
                      ' 	  :N2 ,           '+#13#10+
                      ' 	  :N3 ,           '+#13#10+
                      ' 	  :N4 ,           '+#13#10+
                      ' 	  :N5 ,           '+#13#10+
                      ' 	  :N6             '+#13#10+
                      '   )                 ' ;

          if( req.s_term <> '0' )then
          begin
            dtE   := StringToDate( req.s_date + '235959' );
            nTemp := StrToInt( req.s_term ) - 1;
            dtE   := IncDay( dtE, nTemp );
            //sTemp := DateTimeToStr( dtE );
          end
          else
          begin
            dtE := StringToDate( req.s_date + '235959' );
          end;

          dtS   := StringToDate( req.s_date + '000000' );


          sTKNo := fSelect_max_tkno_on_visitinfo();
          Result.s_reg_no := sTKNo;

          Parameters.ParamByName('N1').Value := req.s_dong       ;
          Parameters.ParamByName('N2').Value := req.s_ho         ;
          Parameters.ParamByName('N3').Value := req.s_car_number ;
          Parameters.ParamByName('N4').Value := dtS              ;
          Parameters.ParamByName('N5').Value := dtE              ;
          Parameters.ParamByName('N6').Value := sTKNo            ;

          nResult := ExecSQL;;

          if( nResult = 0 )then
          begin
            Result.s_status  := '204';
            Result.s_message := 'Registration of the visiting car failed.';
            Result.s_reg_no  := '';
          end
          else
          begin
            Result.s_status  := '200';
            Result.s_message := 'OK' ; //Format( '???????? ????(%s) ???? ??????????.', [sTKNo] );
          end;

        end;
      except
        on  E : exception  do
        begin
          Assert( False, '[HomeInfo]'+E.Message );

          Result.s_status  := '204';
          Result.s_message := E.Message;

        end;
      end;
    finally
      ;
    end;
  end
  else
  begin
    Result.s_status  := '319';
    Result.s_message := 'Already registed visit car.';
  end;

end;

function TdmTables.fInsert_the_on_visitinfo2(req: ST_VISIT_REG_REQ2): ST_VISIT_REG_RES;
var
  nResult : Integer;
  nTemp   : Integer;
  sTKNo ,
  sTemp   : string;
  dtS     : TDateTime;
  dtE     : TDateTime;
begin
  nsVisitDt := '';
  nTemp := dmTables.fSelect_be_included_on_visitinfo2( g_mid_json.p_visit_reg2.req );
  if( nTemp <= 0 )then
  begin
    Assert( False, '[HomeInfo] ?????????? ???? ???? ???? ???? '+g_mid_json.p_visit_reg2.req.s_dong+'/'+g_mid_json.p_visit_reg2.req.s_ho+'/'+g_mid_json.p_visit_reg2.req.s_car_number);
    FillChar( Result, SizeOf(ST_VISIT_REG_RES), #0 );
  end
  else
  begin
    Assert( False, '[HomeInfo] ?????????? ???? ???? '+g_mid_json.p_visit_reg2.req.s_dong+'/'+g_mid_json.p_visit_reg2.req.s_ho+'/'+g_mid_json.p_visit_reg2.req.s_car_number);
    Result.s_status  := '200';
    Result.s_message := 'OK' ;
    //???? ???? ???? ???? ????
    dmTables.fSelect_the_on_visitInCar(g_mid_json.p_visit_reg2.req);
    //Result.s_status  := '319';
    //Result.s_message := 'Already registed visit car.';
  end;

end;

function TdmTables.fSelect_Cars_on_CustInfo( req : ST_FIND_CAR_REQ ): ST_FIND_CAR_RES;
var
  nTotalCount ,
  I           : Integer;
  sTemp       : string;
  dtUpd       : TDateTime;
begin

  FillChar( Result, SizeOf(ST_FIND_CAR_RES), #0 );

  with qryWORK do
  begin

    Close;
    SQL.Clear;

    SQL.Text := ' select CompName  nDong  ,                      '+#13#10+
                '        deptName  nHo    ,                      '+#13#10+
                ' 	     CarNo     sCar_Number ,                 '+#13#10+
                ' 	     sAlias           ,                      '+#13#10+
                ' 	     IssueDate dtDate ,                      '+#13#10+
                ' 	     dtUpd                                   '+#13#10+
                '   from CustInfo                                '+#13#10+
                '  where GETDATE() between ExpDateF and ExpDateT '+#13#10+
                '    and CompName = ''{N1}''                     '+#13#10+
                '    and deptName = ''{N2}''                     '+#13#10+
                '  order by IssueDate desc ,                     '+#13#10+
                '           dtUpd     desc                       ' ;

    SQL.Text := StringReplace( SQL.Text, '{N1}', req.s_dong, [rfReplaceAll]);
    SQL.Text := StringReplace( SQL.Text, '{N2}', req.s_ho  , [rfReplaceAll]);

    //--ShowMessage( SQL.Text );

    Open;
    First;

    nTotalCount := RecordCount;
    Result.a_list.n_count := RecordCount;
    {
    if( RecordCount = 0 )then
    begin
      nTotalCount := 1; // fro dummy list one..
    end;
    }
    // ???? ???????? ????..
    SetLength( Result.a_list.LIST, nTotalCount );
    Result.a_list.n_count := nTotalCount;

    if eof then
    begin
      I := 0;

      Result.s_status  := '204';
      Result.s_message := 'There is no data for registered cars.';

      {
        car_number : "???? ????",
        date       : "yyyyMMdd", //????(????) ??
        alias      : "???? ????"
      }

      {
      // add dummy data..
      Result.a_list.LIST[I].s_dong       := '';
      Result.a_list.LIST[I].s_ho         := '';
      Result.a_list.LIST[I].s_car_number := '';
      Result.a_list.LIST[I].s_date       := '';
      Result.a_list.LIST[I].s_alias      := '';
      }
    end
    else
    begin
      while not Eof do
      begin
        // to work to set such-info on list
        I := Result.a_list.n_run_count;

        dtUpd := FieldByName( 'dtDate' ).AsDateTime;
        sTemp := FormatDateTime( 'yyyyMMdd', dtUpd );

        Result.a_list.LIST[I].s_dong       := FieldByName( 'nDong'       ).AsString;
        Result.a_list.LIST[I].s_ho         := FieldByName( 'nHo'         ).AsString;
        Result.a_list.LIST[I].s_car_number := FieldByName( 'sCar_Number' ).AsString;
        Result.a_list.LIST[I].s_date       := sTemp;
        Result.a_list.LIST[I].s_alias      := FieldByName( 'sAlias'      ).AsString;

        Inc( Result.a_list.n_run_count );

        Next;
      end;

      Result.s_status  := '200';
      Result.s_message := 'OK' ; //sTemp;
    end;

  end;

end;

function TdmTables.fSelect_all_on_tVisitfavo( buf: ST_VISIT_FAVO_LIST_REQ ): ST_VISIT_FAVO_LIST_RES;
var
  nTotalCount ,
  I           : Integer;
  sTemp       : string;
  dtUpd       : TDateTime;
begin

  FillChar( Result, SizeOf(ST_VISIT_FAVO_LIST_RES), #0 );

  with qryVisitList do
  begin

    Close;
    SQL.Clear;

    SQL.Text :=
              //' select top 100           '+#13#10+  // middleware buffer over full?? ???? 100???????? ????..
                ' select nReg_No           '+#13#10+
                '      , nDong             '+#13#10+
                ' 	   , nHo               '+#13#10+
                ' 	   , sCar_Number       '+#13#10+
                ' 	   , dtUpd             '+#13#10+
                ' 	   , sRegister         '+#13#10+
                '   from tVisitfavo        '+#13#10+
                '  where nDong     = {N1}  '+#13#10+
                '    and nHo       = {N2}  '+#13#10+
                '    and sDeleteYN = ''N'' '+#13#10+
                '  order by dtUpd desc   ; ' ;

    SQL.Text := StringReplace( SQL.Text, '{N1}', buf.s_dong, [rfReplaceAll]);
    SQL.Text := StringReplace( SQL.Text, '{N2}', buf.s_ho  , [rfReplaceAll]);

    //--ShowMessage( SQL.Text );

    Open;
    First;

    nTotalCount := RecordCount;

    {
    if( RecordCount = 0 )then
    begin
      nTotalCount := 1; // fro dummy list one..
    end;
    }

    // ???? ???????? ????..
    SetLength( Result.a_list.LIST, nTotalCount );
    Result.a_list.n_count := nTotalCount;

    if eof then
    begin
      I := 0;

      Result.s_status  := '204';
      Result.s_message := 'There is no data for visit favorite.';
      {
      // add dummy data..
      Result.a_list.LIST[I].s_date_time  := '';
      Result.a_list.LIST[I].s_dong       := '';
      Result.a_list.LIST[I].s_ho         := '';
      Result.a_list.LIST[I].s_reg_no     := '';
      Result.a_list.LIST[I].s_car_number := '';
      Result.a_list.LIST[I].s_register   := '';
      }
    end
    else
    begin
      while not Eof do
      begin
        // to work to set such-info on list
        I := Result.a_list.n_run_count;

        dtUpd := FieldByName( 'dtUpd' ).AsDateTime;
        sTemp := FormatDateTime( 'yyyyMMddhhmmss', dtUpd );

        Result.a_list.LIST[I].s_date_time  := sTemp;

        Result.a_list.LIST[I].s_dong       := FieldByName( 'nDong'       ).AsString;
        Result.a_list.LIST[I].s_ho         := FieldByName( 'nHo'         ).AsString;

        Result.a_list.LIST[I].s_reg_no     := FieldByName( 'nReg_No'     ).AsString;
        Result.a_list.LIST[I].s_car_number := FieldByName( 'sCar_Number' ).AsString;
        Result.a_list.LIST[I].s_register   := FieldByName( 'sRegister'   ).AsString;

        Inc( Result.a_list.n_run_count );

        Next;
      end;

      Result.s_status  := '200';
      Result.s_message := 'OK' ; //sTemp;
    end;

  end;
end;

function TdmTables.fSelect_all_on_visitinfo( s_dong, s_ho: string ): ST_VISIT_LIST_RES;
var
  nTemp ,
  nTotalCount ,
  I           : Integer;
  s_car_no    : string;
  sTemp       : string;
  dtS, dtE    : TDateTime;
begin
  s_car_no := '';
  FillChar( Result, SizeOf(ST_VISIT_LIST_RES), #0 );

  with qryVisitList do
  begin
    Close;
    SQL.Clear;

    if( (s_dong <> '') and
        (s_ho   <> '')    )then
    begin
      SQL.Text := '   select Tkno          ,  '+#13#10+
                  '          dong          ,  '+#13#10+
                  '          ho            ,  '+#13#10+
                  '          CarNo         ,  '+#13#10+
                  '          StartDateTime ,  '+#13#10+
                  '          EndDateTime   ,  '+#13#10+
                  '          visit_flag       '+#13#10+
                  '     from visitinfo        '+#13#10+
                  '    where dong = ''{N1}''  '+#13#10+
                  '      and ho   = ''{N2}''  '+#13#10+
                  ' order by EndDateTime desc ' ;

      SQL.Text := StringReplace( SQL.Text, '{N1}', s_dong, [rfReplaceAll]);
      SQL.Text := StringReplace( SQL.Text, '{N2}', s_ho  , [rfReplaceAll]);
    end
    else
    if( (s_dong <> '') and
        (s_ho   =  '')    )then
    begin
      SQL.Text := '   select Tkno          ,  '+#13#10+
                  '          dong          ,  '+#13#10+
                  '          ho            ,  '+#13#10+
                  '          CarNo         ,  '+#13#10+
                  '          StartDateTime ,  '+#13#10+
                  '          EndDateTime   ,  '+#13#10+
                  '          visit_flag       '+#13#10+
                  '     from visitinfo        '+#13#10+
                  '    where dong = ''{N1}''  '+#13#10+
                  ' order by EndDateTime desc ' ;

      SQL.Text := StringReplace( SQL.Text, '{N1}', s_dong, [rfReplaceAll]);
    end
    else
    if( (s_dong =  '') and
        (s_ho   <> '')    )then
    begin
      SQL.Text := '   select Tkno          ,  '+#13#10+
                  '          dong          ,  '+#13#10+
                  '          ho            ,  '+#13#10+
                  '          CarNo         ,  '+#13#10+
                  '          StartDateTime ,  '+#13#10+
                  '          EndDateTime   ,  '+#13#10+
                  '          visit_flag       '+#13#10+
                  '     from visitinfo        '+#13#10+
                  '    where                  '+#13#10+
                  '          ho   = ''{N2}''  '+#13#10+
                  ' order by EndDateTime desc ' ;

      SQL.Text := StringReplace( SQL.Text, '{N2}', s_ho  , [rfReplaceAll]);
    end
    else
    if( (s_dong = '') and
        (s_ho   = '')    )then
    begin
      SQL.Text := '   select Tkno          ,  '+#13#10+
                  '          dong          ,  '+#13#10+
                  '          ho            ,  '+#13#10+
                  '          CarNo         ,  '+#13#10+
                  '          StartDateTime ,  '+#13#10+
                  '          EndDateTime   ,  '+#13#10+
                  '          visit_flag       '+#13#10+
                  '     from visitinfo        '+#13#10+
                  ' order by EndDateTime desc ' ;
    end
    ;

    Assert( False, '[HomeInfo] '+SQL.Text );
    Open;

    sTemp := Format('RecordCount:%d',[RecordCount]);
    Assert( False, '[HomeInfo] '+sTemp );

    if eof then
    begin
      Result.s_status  := '204';
      Result.s_message := 'There is no data on cars to visit.'
    end
    else
    begin

      Result.a_list.n_count := RecordCount;

      SetLength( Result.a_list.LIST, RecordCount );

      while not Eof do
      begin

        I := Result.a_list.n_run_count;

        dtS   := FieldByName(	'StartDateTime').AsDateTime;
        dtE   := FieldByName(	'EndDateTime'  ).AsDateTime;

        nTemp := DaysBetween( dtE, dtS );
        sTemp := IntToStr( nTemp + 1 );

        Result.a_list.LIST[I].s_dong       := FieldByName( 'dong'       ).AsString;
        Result.a_list.LIST[I].s_ho         := FieldByName( 'ho'         ).AsString;
        Result.a_list.LIST[I].s_reg_no     := FieldByName( 'Tkno'       ).AsString;
        Result.a_list.LIST[I].s_car_number := FieldByName( 'CarNo'      ).AsString;
        Result.a_list.LIST[I].s_date       := FormatDateTime( 'yyyymmdd', dtS );
        Result.a_list.LIST[I].s_term       := sTemp;
        Result.a_list.LIST[I].s_visit_flag := FieldByName( 'visit_flag' ).AsString;

        Inc( Result.a_list.n_run_count );

        Next;
      end;

      Result.s_status  := '200';
      Result.s_message := 'OK' ; //sTemp;
    end;

  end;
end;

//'????([????]????&????) ????' ????..
function TdmTables.fSelect_all_on_CustInfo_visitinfo( s_dong, s_ho: string ): ST_IN_LIST_RES;
var
  bData       : Boolean;
  nTotalCount ,
  I           : Integer;
  s_car_no    : string;
  sTemp       : string;
begin

  bData    := False;
  s_car_no := '';

  FillChar( Result, SizeOf(ST_IN_LIST_RES), #0 );

  nTotalCount := fSelect_all_count_on_CustInfo_visitinfo_IONData_IOSData( Result ,
                                                                          s_dong ,
                                                                          s_ho       );

  sTemp := Format( '[HomeInfo] ???? family & visitor ??????????: %d??', [nTotalCount] );
  Assert( False, sTemp );

  // ???? ???????? ????..
  SetLength( Result.a_list.LIST, nTotalCount );
  Result.a_list.n_count := nTotalCount;

  with qryVisitList do
  begin

    Close;
    SQL.Clear;

    //====================================================================
    // ???????? ????????..

    SQL.Text := ' select CarNo               '+#13#10+
                '   from CustInfo            '+#13#10+
                '  where CompName = ''{N1}'' '+#13#10+
                '    and deptName = ''{N2}'' '+#13#10+
                ' group by CarNo             ' ;


    SQL.Text := StringReplace( SQL.Text, '{N1}', s_dong, [rfReplaceAll]);
    SQL.Text := StringReplace( SQL.Text, '{N2}', s_ho  , [rfReplaceAll]);

    Open;

    if eof then
    begin
      Result.s_status  := '204';
      Result.s_message := 'There is no data on regular and visiting cars.'
    end
    else
    begin
      bData := True;

      while not Eof do
      begin

        //##### (????????:N)
        s_car_no := FieldByName('CarNo').AsString;

        //#### (set res buffer)
        fSet_buf_select_all_on_IOSData( s_car_no, Result );

        Next;
      end;

      Result.s_status  := '200';
      Result.s_message := 'OK' ; //sTemp;
    end;

    Close;
    SQL.Clear;

    //====================================================================
    // ???????? ????????..

    SQL.Text := ' select CarNo               '+#13#10+
                '   from visitinfo           '+#13#10+
                '  where dong = ''{N1}''     '+#13#10+
                '    and ho   = ''{N2}''     '+#13#10+
                '    and Visit_flag = ''Y''  '+#13#10+ // ???? ?????? ?????????? ??????.. ??
                ' group by CarNo             ' ;


    SQL.Text := StringReplace( SQL.Text, '{N1}', s_dong, [rfReplaceAll]);
    SQL.Text := StringReplace( SQL.Text, '{N2}', s_ho  , [rfReplaceAll]);

    Open;

    if eof then
    begin
      if( bData = False )then
      begin
        Result.s_status  := '204';
        Result.s_message := 'There is no data on regular and visiting cars.'
      end;
    end
    else
    begin
      while not Eof do
      begin

        //##### (????????:N)
        s_car_no := FieldByName('CarNo').AsString;

        //#### (set res buffer)
        fSet_buf_select_all_on_IONData( s_car_no, Result );

        Next;
      end;

      Result.s_status  := '200';
      Result.s_message := 'OK' ; //sTemp;
    end;

  end;
end;

//'?????? ????????' ????..
function TdmTables.fSelect_visitor_on_visitinfo( s_dong, s_ho: string ): ST_IN_LIST_RES;
var
  nTotalCount ,
  I           : Integer;
  s_car_no    : string;
  sTemp       : string;
begin

  s_car_no := '';
  FillChar( Result, SizeOf(ST_IN_LIST_RES), #0 );

  nTotalCount := fSelect_all_count_on_visitinfo_IONData( s_dong, s_ho );
  sTemp := Format( '[HomeInfo] ???? visitor ??????????: %d??', [nTotalCount] );
  Assert( False, sTemp );

  // ???? ???????? ????..
  SetLength( Result.a_list.LIST, nTotalCount );
  Result.a_list.n_count := nTotalCount;

  with qryVisitList do
  begin

    Close;
    SQL.Clear;

    SQL.Add(' select A.CarNo from (      ');
    SQL.Add(' select CarNo               ');
    SQL.Add('   from visitinfo           ');
    SQL.Add('  where dong       = :sdong ');
    SQL.Add('    and ho         = :sho   ');
    SQL.Add('    and Visit_flag = ''Y''  '); // ?????? ?????? ?????? ????..
    SQL.Add(' )A                         ');
    SQL.Add(' group by A.CarNo           ');

    Parameters.ParamByName('sdong').Value := s_dong;
    Parameters.ParamByName('sho'  ).Value := s_ho;

    Open;

    if eof then
    begin
      Result.s_status  := '204';
      Result.s_message := 'There is no data on cars to visit.'
    end
    else
    begin
      while not Eof do
      begin

        //##### (????????:N)
        s_car_no := FieldByName('CarNo').AsString;

        //#### (set res buffer)
        fSet_buf_select_all_on_IONData( s_car_no, Result );

        Next;
      end;

      Result.s_status  := '200';
      Result.s_message := 'OK' ; //sTemp;
    end;

  end;
end;

//'(????) ????????' ????..
function TdmTables.fSelect_family_on_CustInfo( s_dong, s_ho: string ): ST_IN_LIST_RES;
var
  nTotalCount ,
  I           : Integer;
  s_car_no    : string;
  sTemp       : string;
begin

  s_car_no := '';
  FillChar( Result, SizeOf(ST_IN_LIST_RES), #0 );

  nTotalCount := fSelect_all_count_on_CustInfo_IOSData( s_dong, s_ho );
  sTemp := Format( '[HomeInfo] ???? family ??????????: %d??', [nTotalCount] );
  Assert( False, sTemp );

  // ???? ???????? ????..
  SetLength( Result.a_list.LIST, nTotalCount );
  Result.a_list.n_count := nTotalCount;

  with qryVisitList do
  begin

    Close;
    SQL.Clear;

    SQL.Add(' select A.CarNo from (    ');
    SQL.Add(' select CarNo             ');
    SQL.Add('   from CustInfo          ');
    SQL.Add('  where CompName = :sdong ');
    SQL.Add('    and deptName = :sho   ');
    SQL.Add(' )A                       ');
    SQL.Add(' group by A.CarNo         ');

    Parameters.ParamByName('sdong').Value := s_dong;
    Parameters.ParamByName('sho'  ).Value := s_ho;

    Open;

    if eof then
    begin
      Result.s_status  := '204';
      Result.s_message := 'Car information for commuter pass registration does not exist.';
    end
    else
    begin
      while not Eof do
      begin

        //##### (????????:N)
        s_car_no := FieldByName('CarNo').AsString;

        //#### (set res buffer)
        fSet_buf_select_all_on_IOSData( s_car_no, Result );

        Next;
      end;

      //--sTemp := Format( '????([??????]????.??????:%d??)', [Result.a_list.n_count] );

      Result.s_status  := '200';
      Result.s_message := 'OK' ; //sTemp;
    end;

  end;
end;

function TdmTables.fSet_buf_select_all_on_IOSData( sCarNo: string; var  buf: ST_IN_LIST_RES ): Integer;
var
  I    : Integer;
  sTemp: string;
begin

  qryVisitList2.Close;
  qryVisitList2.SQL.Clear;

  qryVisitList2.SQL.Add(' Select InCarNo1,         ');
  qryVisitList2.SQL.Add('        procdate,         ');
  qryVisitList2.SQL.Add('        procTime          ');
  qryVisitList2.SQL.Add('   from IOSData           ');
  qryVisitList2.SQL.Add('  where InCarNo1 = :N1    ');
  qryVisitList2.SQL.Add(' order by procdate desc , ');
  qryVisitList2.SQL.Add('          procTime desc   ');

  qryVisitList2.Parameters.ParamByName('N1').Value := sCarNo;
  qryVisitList2.Open;

  if qryVisitList2.eof then
  begin
    ;
  end
  else
  begin

    while not qryVisitList2.Eof do
    begin

      I := buf.a_list.n_run_count;

      // buffer full ????????..
      if( I <= buf.a_list.n_count )then
      begin
        sTemp :=         qryVisitList2.FieldByName('procdate').AsString;
        sTemp := sTemp + qryVisitList2.FieldByName('procTime').AsString;

        sTemp := StringReplace( sTemp, ' ', '', [rfReplaceAll, rfIgnoreCase]);
        sTemp := StringReplace( sTemp, '-', '', [rfReplaceAll, rfIgnoreCase]);
        sTemp := StringReplace( sTemp, ':', '', [rfReplaceAll, rfIgnoreCase]);

        buf.a_list.LIST[I].s_car_number := qryVisitList2.FieldByName('InCarNo1').AsString;
        buf.a_list.LIST[I].s_type       := '';
        buf.a_list.LIST[I].s_date_time  := sTemp;

        Inc( buf.a_list.n_run_count );
      end;

      qryVisitList2.Next;
    end;
  end;



  Result := I;

end;

function TdmTables.fSet_buf_select_all_on_IONData( sCarNo: string; var buf: ST_IN_LIST_RES ): Integer;
var
  I    : Integer;
  sTemp: string;
begin

  qryVisitList2.Close;
  qryVisitList2.SQL.Clear;

  qryVisitList2.SQL.Add(' Select InCarNo1,         ');
  qryVisitList2.SQL.Add('        procdate,         ');
  qryVisitList2.SQL.Add('        procTime          ');
  qryVisitList2.SQL.Add('   from IONData           ');
  qryVisitList2.SQL.Add('  where InCarNo1 = :N1    ');
  qryVisitList2.SQL.Add(' order by procdate desc , ');
  qryVisitList2.SQL.Add('          procTime desc   ');

  qryVisitList2.Parameters.ParamByName('N1').Value := sCarNo;
  qryVisitList2.Open;

  if qryVisitList2.eof then
  begin
    ;
  end
  else
  begin
    while not qryVisitList2.Eof do
    begin

      I := buf.a_list.n_run_count;

      // buffer full ????????..
      if( I <= buf.a_list.n_count )then
      begin
        sTemp :=         qryVisitList2.FieldByName('procdate').AsString;
        sTemp := sTemp + qryVisitList2.FieldByName('procTime').AsString;

        sTemp := StringReplace( sTemp, ' ', '', [rfReplaceAll, rfIgnoreCase]);
        sTemp := StringReplace( sTemp, '-', '', [rfReplaceAll, rfIgnoreCase]);
        sTemp := StringReplace( sTemp, ':', '', [rfReplaceAll, rfIgnoreCase]);

        buf.a_list.LIST[I].s_car_number := qryVisitList2.FieldByName('InCarNo1').AsString;
        buf.a_list.LIST[I].s_type       := '';
        buf.a_list.LIST[I].s_date_time  := sTemp;

        Inc( buf.a_list.n_run_count );
      end;

      qryVisitList2.Next;
    end;
  end;

  Result := I;

end;

end.
