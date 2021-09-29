unit Koces;

interface

uses Global, IniFiles, SysUtils, Forms;

procedure CardDownload;
function CardPay(pCancel, pAmt, pAuthNo, pAuthDate : String) : TArray<String>;

implementation
uses KocesLib, StrUtils;

procedure CardDownload;
var
  nRtn: Integer;
  ResAppr: PGFDownLoadResAppr;
  sTermID: AnsiString;
  sMchData: AnsiString;
  sSftVer: AnsiString;
  sSerial: AnsiString;
  sBsnNo: AnsiString;
  sVanSetup: TIniFile;

begin
  try
    nRtn := 0;

    sVanSetup := TIniFile.Create(ExtractFileDir(Application.ExeName) + '\Koces.ini');

    sTermID   := AnsiString(sVanSetup.ReadString('INFO', 'TermID', ' '));
    sMchData  := ' ';
    sSftVer   := AnsiString(sVanSetup.ReadString('INFO', 'SftVer', ' '));
    sSerial   := AnsiString(sVanSetup.ReadString('INFO', 'Serial', ' '));
    sBsnNo    := AnsiString(sVanSetup.ReadString('INFO', 'BsnNo', ' '));

    Sleep(100);

    nRtn := DownLoadReq(ResAppr,
    sTermID, sMchData, sSftVer, sSerial, sBsnNo);

    if nRtn = -1 then
      ExceptLogging('승인요구 에러')
    else if nRtn = -2 then
      ExceptLogging('승인요구 Timeout')
    else if nRtn = -3 then
      ExceptLogging('KocesICPos를 실행해주세요')
    else
      begin

        ExceptLogging('ApprVer    : ['+ResAppr.Header.ApprVer   +']');
        ExceptLogging('SvcType    : ['+ResAppr.Header.SvcType   +']');
        ExceptLogging('TrdType    : ['+ResAppr.Header.TrdType   +']');
        ExceptLogging('SndType    : ['+ResAppr.Header.SndType   +']');
        ExceptLogging('TermID     : ['+ResAppr.Header.TermID    +']');
        ExceptLogging('TrdDate    : ['+ResAppr.Header.TrdDate   +']');
        ExceptLogging('TrdNo      : ['+ResAppr.Header.TrdNo     +']');
        ExceptLogging('MchData    : ['+ResAppr.Header.MchData   +']');
        ExceptLogging('AnsCode    : ['+ResAppr.Header.AnsCode   +']');

        ExceptLogging('Serial     : ['+ResAppr.Serial           +']');
        ExceptLogging('Message    : ['+ResAppr.Message          +']');
        ExceptLogging('SftVer     : ['+ResAppr.SftVer           +']');
        ExceptLogging('ShpNm      : ['+ResAppr.ShpNm            +']');
        ExceptLogging('BsnNo      : ['+ResAppr.BsnNo            +']');
        ExceptLogging('PreNm      : ['+ResAppr.PreNm            +']');
        ExceptLogging('ShpAdr     : ['+ResAppr.ShpAdr           +']');
        ExceptLogging('ShpTel     : ['+ResAppr.ShpTel           +']');

      end;
  except
    on E: Exception do
      ExceptLogging('CardDownload : ' + aString(E.Message));
  end;
end;


function CardPay(pCancel, pAmt, pAuthNo, pAuthDate : String) : TArray<String>;
var
  nRtn: Integer;
  ResAppr: PosICResAppr;
	sTrdType: AnsiString;
	sAuData: AnsiString;
	sMonth: AnsiString;
	sTrdAmt: AnsiString;
	sSvcAmt: AnsiString;
	sTaxAmt: AnsiString;
	sTaxFreeAmt: AnsiString;
	sAuNo: AnsiString;
	sAuDate: AnsiString;
	sKeyYn: AnsiString;
	sInsYn: AnsiString;
	sCashNum: AnsiString;
	sCancelReason: AnsiString;
	sPtSvrCd: AnsiString;
	sPtInsYn: AnsiString;
	sPtCardCd: AnsiString;

begin
  try
    nRtn := 0;

    if pCancel = 'Card' then // 카드승인
    begin
      sTrdType := 'F1';
    end
    else if pCancel = 'Cancel' then // 카드취소
    begin
      sTrdType := 'F2';
    end
    else if pCancel = 'H3' then // 현금승인
    begin
      sTrdType := 'H3';
    end
    else // H4 현금취소
    begin
      sTrdType := 'H4';
    end;

    sAuData := ' ';
    sMonth := '00';
    sTrdAmt := AnsiString(pAmt);
    sSvcAmt := '0';
    sTaxAmt := '0';
    sTaxFreeAmt := '0';
    sAuNo := AnsiString(pAuthNo);
    sAuDate := AnsiString(pAuthDate);
    sKeyYn := 'I';
    sInsYn := ' ';
    sCashNum := ' ';
    sCancelReason := ' ';
    sPtSvrCd := ' ';
    sPtInsYn := ' ';
    sPtCardCd := ' ';

    nRtn := KocesICReq(ResAppr,
    sTrdType, sAuData, sMonth, sTrdAmt, sSvcAmt,
    sTaxAmt, sTaxFreeAmt, sAuNo, sAuDate, sKeyYn,
    sInsYn, sCashNum, sCancelReason, sPtSvrCd, sPtInsYn,
    sPtCardCd);


    if nRtn = -1 then
      ExceptLogging('승인요구 에러')
    else if nRtn = -2 then
      ExceptLogging('승인요구 Timeout')
    else if nRtn = -3 then
      ExceptLogging('KocesICPos를 실행해주세요')
    else
    begin
      if Trim(ResAppr.Message) = '취소' then
      begin  
        nRtn := -4;
      end
      else
      begin
        ExceptLogging('ApprVer    : ['+ResAppr.Header.ApprVer   +']');
        ExceptLogging('SvcType    : ['+ResAppr.Header.SvcType   +']');
        ExceptLogging('TrdType    : ['+ResAppr.Header.TrdType   +']');
        ExceptLogging('SndType    : ['+ResAppr.Header.SndType   +']');
        ExceptLogging('TermID     : ['+ResAppr.Header.TermID    +']');
        ExceptLogging('TrdDate    : ['+ResAppr.Header.TrdDate   +']');
        ExceptLogging('TrdNo      : ['+ResAppr.Header.TrdNo     +']');
        ExceptLogging('MchData    : ['+ResAppr.Header.MchData   +']');
        ExceptLogging('AnsCode    : ['+ResAppr.Header.AnsCode   +']');


        ExceptLogging('TradeNo    : ['+ResAppr.TradeNo   +']');
        ExceptLogging('AuNo       : ['+ResAppr.AuNo      +']');
        ExceptLogging('TradeDate  : ['+ResAppr.TradeDate +']');
        ExceptLogging('Message    : ['+ResAppr.Message   +']');
        ExceptLogging('Bin        : ['+ResAppr.Bin       +']');
        ExceptLogging('CardKind   : ['+ResAppr.CardKind  +']');
        ExceptLogging('OrdCd      : ['+ResAppr.OrdCd     +']');
        ExceptLogging('OrdNm      : ['+ResAppr.OrdNm     +']');
        ExceptLogging('InpCd      : ['+ResAppr.InpCd     +']');
        ExceptLogging('InpNm      : ['+ResAppr.InpNm     +']');
        ExceptLogging('MchNo      : ['+ResAppr.MchNo     +']');
        ExceptLogging('PtCardCd   : ['+ResAppr.PtCardCd  +']');
        ExceptLogging('PtCardNm   : ['+ResAppr.PtCardNm  +']');
        ExceptLogging('JukPoint   : ['+ResAppr.JukPoint  +']');
        ExceptLogging('GayPoint   : ['+ResAppr.GayPoint  +']');
        ExceptLogging('NujPoint   : ['+ResAppr.NujPoint  +']');
        ExceptLogging('SaleRate   : ['+ResAppr.SaleRate  +']');
        ExceptLogging('PtAuNo     : ['+ResAppr.PtAuNo    +']');
        ExceptLogging('PtMchNo    : ['+ResAppr.PtMchNo   +']');
        ExceptLogging('PtAnswerCd : ['+ResAppr.PtAnswerCd+']');
        ExceptLogging('PtMessage  : ['+ResAppr.PtMessage +']');
        ExceptLogging('DDCYN      : ['+ResAppr.DDCYN     +']');
        ExceptLogging('EDIYN      : ['+ResAppr.EDIYN     +']');
        ExceptLogging('CardType   : ['+ResAppr.CardType  +']');
        ExceptLogging('TrdKey     : ['+ResAppr.TrdKey    +']');
        ExceptLogging('KeyRenewal : ['+ResAppr.KeyRenewal+']');
        ExceptLogging('');
      end;
    end;

    SetLength(result, 12);
    result[0] := IntToStr(nRtn);                // 결과값
    result[1] := Trim(ResAppr.TradeDate);   // 승인 시간
    result[2] := Trim(ResAppr.AuNo);        // 승인 번호
    result[3] := Trim(ResAppr.OrdNm);       // 발급사 명
    result[4] := Trim(ResAppr.InpNm);       // 매입사 명
    result[5] := Trim(ResAppr.CardType);    // 카드 종류
    result[6] := Trim(ResAppr.Bin);         // 카드 번호
    result[7] := Trim(ResAppr.MchNo);       // 가맹점번호
    result[8] := Trim(ResAppr.Message);     // 메세지
    //Added Woo.YH  제이컴 전송에 필요한 데이터 전달
    result[9] := Trim(ResAppr.TradeNo);       // Van서 부여하는 고유번호
    result[10]:= Trim(ResAppr.Header.TermID); // 단말기번호
    result[11]:= Trim(ResAppr.Header.AnsCode); // 단말기승인코드

  except
    on E: Exception do
      ExceptLogging('CardPay : ' + aString(E.Message));
  end;
end;

end.
