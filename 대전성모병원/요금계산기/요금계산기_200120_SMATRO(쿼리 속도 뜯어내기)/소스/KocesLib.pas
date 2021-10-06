unit KocesLib;

interface
uses
{$IFDEF WIN32}
  Windows;
{$ELSE}
  Wintypes, WinProcs;
{$ENDIF}

// 공통 header 부분
type PGFComHead = Record
    ApprVer : array[0..1] of AnsiChar;    // 전문버전 "A1"
    SvcType : array[0..1] of AnsiChar;    // 서비스종류 서비스전문표 참조
    TrdType : array[0..1] of AnsiChar;    // 업무 구분, 업무구분표 참조
    SndType : AnsiChar;                   // 전송구분, 'S': PG->VAN, 'R': VAN->PG
    TermId : array[0..9] of AnsiChar;     // 단말기번호 터미널아이디
    TrdDate : array[0..13] of AnsiChar;   // 거래일시 YYMMDDhhmmss
    TrdNo : array [0..9] of AnsiChar;     // 거래일련번호 (응답시 반환)
    MchData : array [0..19] of AnsiChar;  // 가맹점 데이타 (응답시 반환)
    AnsCode : array[0..3] of AnsiChar;    // 응답코드 (요청시는 스페이스)
End;

// IC보안 응답
type PosICResAppr = Record
    Header : PGFComHead;                    // 공통 헤더 부분
    TradeNo : array[0..11] of AnsiChar;     //Van 서 부여하는 거래 고유번호 LJFS
    AuNo : array[0..11] of AnsiChar;        //승인번호
    TradeDate : array[0..13] of AnsiChar;   //승인시간 'YYMMDDhhmmss' */
    Message : array[0..31] of AnsiChar;     //응답 메시지(거절 시 응답 Message) */
    Bin : array[0..39] of AnsiChar;         // 카드BIN
    CardKind : array[0..11] of AnsiChar;    //카드종류명 */
    OrdCd : array[0..3] of AnsiChar;        //발급사 코드 */
    OrdNm : array[0..11] of AnsiChar;       //발급사 명 */
    InpCd : array[0..3] of AnsiChar;        //매입사 코드 */
    InpNm : array[0..7] of AnsiChar;        //매입사 명 */
    MchNo : array[0..15] of AnsiChar;       //가맹점번호 */
    PtCardCd : array[0..1] of AnsiChar;     //포인트카드 코드*/
    PtCardNm : array[0..7] of AnsiChar;     //포인트카드사 명 */
    JukPoint : array[0..8] of AnsiChar;     //적립포인트 */
    GayPoint : array[0..8] of AnsiChar;     //가용포인트 */
    NujPoint : array[0..8] of AnsiChar;     //누적포인트 */
    SaleRate : array[0..8] of AnsiChar;     //할인율 */
    PtAuNo : array[0..19] of AnsiChar;      //적립승인번호 */
    PtMchNo : array[0..14] of AnsiChar;     //적립가맹점번호 */
    PtAnswerCd : array[0..3] of AnsiChar;   //적립응답코드 */
    PtMessage : array[0..47] of AnsiChar;   //적립응답메세지 */
    DDCYN : AnsiChar;                       //DC 여부      */
    EDIYN : AnsiChar;                       //EDI 여부      */
    CardType : AnsiChar;                    //카드구분 1:신용, 2:체크, 3:기프트, 4:선불 */
    TrdKey : array[0..11] of AnsiChar;      //거래 고유키 */
    KeyRenewal : array[0..1] of AnsiChar;   //키 갱신일자
    Filler : array[0..49] of AnsiChar;      //여유필드 */
    cCR : Char;                             //CR  0x0d */
End;

// 다운로드
type PGFDownLoadResAppr = Record
  Header : PGFComHead;
  Serial : array[0..19] of AnsiChar;      //제조일련번호
  Message : array[0..39] of AnsiChar;     //응답메시지
  SftVer : array[0..4] of AnsiChar;       //Terminal S/W Version
  ShpNm : array[0..39] of AnsiChar;       //가맹점명칭
  BsnNo : array[0..9] of AnsiChar;        //가맹점사업자번호
  PreNm : array[0..19] of AnsiChar;       //대표자명
  ShpAdr : array[0..49] of AnsiChar;      //가맹점주소
  ShpTel : array[0..14] of AnsiChar;      //가맹점전화번호
  cCR : AnsiChar;                         //CR  0x0d */
End;


Function KocesICReq
(var ResAppr: PosICResAppr;
 pTrdType: AnsiString; pAuData: AnsiString; pMonth: AnsiString; pTrdAmt: AnsiString; pSvcAmt: AnsiString;
 pTaxAmt: AnsiString; pTaxFreeAmt: AnsiString; pAuNo: AnsiString; pAuDate: AnsiString; pKeyYn: AnsiString;
 pInsYn: AnsiString; pCashNum: AnsiString; pCancelReason: AnsiString; pPtSvrCd: AnsiString; pPtInsYn: AnsiString;
 pPtCardCd: AnsiString):Integer;
StdCall; external 'C:\Koces\KocesICPos\KocesICLib.dll' name 'KocesICRequest';

Function DownLoadReq
(var ResAppr: PGFDownLoadResAppr;
 pTermID: AnsiString; pMchData: AnsiString; pSftVer: AnsiString; pSerial: AnsiString; pBsnNo: AnsiString):Integer;
StdCall; external 'C:\Koces\KocesICPos\KocesICLib.dll' name 'DownLoadRequest';

implementation

end.
