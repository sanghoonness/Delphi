unit KocesLib;

interface
uses
{$IFDEF WIN32}
  Windows;
{$ELSE}
  Wintypes, WinProcs;
{$ENDIF}

// ���� header �κ�
type PGFComHead = Record
    ApprVer : array[0..1] of AnsiChar;    // �������� "A1"
    SvcType : array[0..1] of AnsiChar;    // �������� ��������ǥ ����
    TrdType : array[0..1] of AnsiChar;    // ���� ����, ��������ǥ ����
    SndType : AnsiChar;                   // ���۱���, 'S': PG->VAN, 'R': VAN->PG
    TermId : array[0..9] of AnsiChar;     // �ܸ����ȣ �͹̳ξ��̵�
    TrdDate : array[0..13] of AnsiChar;   // �ŷ��Ͻ� YYMMDDhhmmss
    TrdNo : array [0..9] of AnsiChar;     // �ŷ��Ϸù�ȣ (����� ��ȯ)
    MchData : array [0..19] of AnsiChar;  // ������ ����Ÿ (����� ��ȯ)
    AnsCode : array[0..3] of AnsiChar;    // �����ڵ� (��û�ô� �����̽�)
End;

// IC���� ����
type PosICResAppr = Record
    Header : PGFComHead;                    // ���� ��� �κ�
    TradeNo : array[0..11] of AnsiChar;     //Van �� �ο��ϴ� �ŷ� ������ȣ LJFS
    AuNo : array[0..11] of AnsiChar;        //���ι�ȣ
    TradeDate : array[0..13] of AnsiChar;   //���νð� 'YYMMDDhhmmss' */
    Message : array[0..31] of AnsiChar;     //���� �޽���(���� �� ���� Message) */
    Bin : array[0..39] of AnsiChar;         // ī��BIN
    CardKind : array[0..11] of AnsiChar;    //ī�������� */
    OrdCd : array[0..3] of AnsiChar;        //�߱޻� �ڵ� */
    OrdNm : array[0..11] of AnsiChar;       //�߱޻� �� */
    InpCd : array[0..3] of AnsiChar;        //���Ի� �ڵ� */
    InpNm : array[0..7] of AnsiChar;        //���Ի� �� */
    MchNo : array[0..15] of AnsiChar;       //��������ȣ */
    PtCardCd : array[0..1] of AnsiChar;     //����Ʈī�� �ڵ�*/
    PtCardNm : array[0..7] of AnsiChar;     //����Ʈī��� �� */
    JukPoint : array[0..8] of AnsiChar;     //��������Ʈ */
    GayPoint : array[0..8] of AnsiChar;     //��������Ʈ */
    NujPoint : array[0..8] of AnsiChar;     //��������Ʈ */
    SaleRate : array[0..8] of AnsiChar;     //������ */
    PtAuNo : array[0..19] of AnsiChar;      //�������ι�ȣ */
    PtMchNo : array[0..14] of AnsiChar;     //������������ȣ */
    PtAnswerCd : array[0..3] of AnsiChar;   //���������ڵ� */
    PtMessage : array[0..47] of AnsiChar;   //��������޼��� */
    DDCYN : AnsiChar;                       //DC ����      */
    EDIYN : AnsiChar;                       //EDI ����      */
    CardType : AnsiChar;                    //ī�屸�� 1:�ſ�, 2:üũ, 3:����Ʈ, 4:���� */
    TrdKey : array[0..11] of AnsiChar;      //�ŷ� ����Ű */
    KeyRenewal : array[0..1] of AnsiChar;   //Ű ��������
    Filler : array[0..49] of AnsiChar;      //�����ʵ� */
    cCR : Char;                             //CR  0x0d */
End;

// �ٿ�ε�
type PGFDownLoadResAppr = Record
  Header : PGFComHead;
  Serial : array[0..19] of AnsiChar;      //�����Ϸù�ȣ
  Message : array[0..39] of AnsiChar;     //����޽���
  SftVer : array[0..4] of AnsiChar;       //Terminal S/W Version
  ShpNm : array[0..39] of AnsiChar;       //��������Ī
  BsnNo : array[0..9] of AnsiChar;        //����������ڹ�ȣ
  PreNm : array[0..19] of AnsiChar;       //��ǥ�ڸ�
  ShpAdr : array[0..49] of AnsiChar;      //�������ּ�
  ShpTel : array[0..14] of AnsiChar;      //��������ȭ��ȣ
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
