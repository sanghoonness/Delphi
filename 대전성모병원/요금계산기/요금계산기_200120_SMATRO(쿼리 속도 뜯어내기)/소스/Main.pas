unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ADODB, ExtCtrls, AdvPanel, StdCtrls, sButton,
  ComCtrls, sComboBox, AdvEdit, Buttons, DBAdvGrid, Mask, Grids, BaseGrid,
  AdvGrid, sEdit, sSplitter, jpeg, sLabel, sPanel, sCustomComboEdit, sTooledit,
  sMaskEdit, Sockets, IdComponent, IdRawBase, IdRawClient, IdIcmpClient,
  IdBaseComponent, IdAntiFreezeBase, IdAntiFreeze, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdTCPConnection, IdTCPClient, ScktComp,
  URLMon, WinInet, sSpeedButton, OoMisc, AdPort, IniFiles;

type
  TfrmMain = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    mnuClose: TMenuItem;
    mnuSetup: TMenuItem;
    mnuUnitInfo: TMenuItem;
    qryMainTemp: TADOQuery;
    AdvPanel1: TAdvPanel;
    pn1: TPanel;
    pnLpr: TsPanel;
    sLabel1: TsLabel;
    sPanel2: TsPanel;
    imgNIn: TImage;
    sSplitter1: TsSplitter;
    sLabel2: TsLabel;
    sPanel3: TsPanel;
    imgNOut: TImage;
    sSplitter2: TsSplitter;
    sLabel3: TsLabel;
    pnIOTot: TsPanel;
    sLabel4: TsLabel;
    edtNIn: TsEdit;
    edtNOut: TsEdit;
    edtSIn: TsEdit;
    edtSOut: TsEdit;
    pnIO: TsPanel;
    sLabel5: TsLabel;
    sgIO: TAdvStringGrid;
    pnYogum: TsPanel;
    pnlFee: TsPanel;
    pnN: TsPanel;
    pnlPTime: TsEdit;
    pnlTot: TsEdit;
    pnlDC: TsEdit;
    pnlDCList: TsEdit;
    edtInDate: TsEdit;
    edtNo: TsEdit;
    pnLost: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Label20: TLabel;
    edtLostTime: TMaskEdit;
    Panel35: TPanel;
    Label42: TLabel;
    imgLost: TImage;
    dgLost: TDBAdvGrid;
    Panel22: TPanel;
    rbDamage: TRadioButton;
    rbLost: TRadioButton;
    Panel1: TPanel;
    Label41: TLabel;
    Label19: TLabel;
    Label5: TLabel;
    btnLostProc: TBitBtn;
    btnNew: TBitBtn;
    edtLostCarNo: TEdit;
    btnSeek: TBitBtn;
    edtLostDate: TDateTimePicker;
    edtDCYogum: TAdvEdit;
    edtTotYogum: TAdvEdit;
    edtProcYogum: TAdvEdit;
    edtWedgeReader: TEdit;
    pnInit: TsPanel;
    sPanel7: TsPanel;
    pnlCashier: TsEdit;
    pnlMTot: TsEdit;
    pnlMCreditTot: TsEdit;
    pnlStart: TsEdit;
    pnlNow: TsEdit;
    pnlMCnt: TsEdit;
    pnlMCreditCnt: TsEdit;
    sPanel6: TsPanel;
    sLabel7: TsLabel;
    cmbFeeItem: TsComboBox;
    pnDCList: TsPanel;
    sp2: TSplitter;
    memMsg: TRichEdit;
    sPanel5: TsPanel;
    imgIn: TImage;
    sgIn: TAdvStringGrid;
    sPanel8: TsPanel;
    imgOut: TImage;
    sgOut: TAdvStringGrid;
    pnVan: TsPanel;
    sPanel10: TsPanel;
    edtRecv1: TsEdit;
    edtVanStatus: TsEdit;
    edtVanYogum: TsEdit;
    edtRecv2: TsEdit;
    sPanel11: TsPanel;
    sLabel30: TsLabel;
    lbVan: TLabel;
    edtCardData: TsEdit;
    sPanel1: TsPanel;
    btnProc: TsButton;
    btnCancel: TsButton;
    btnDCClear: TsButton;
    btnReceipt: TsButton;
    btnLost: TsButton;
    btnInOpen: TsButton;
    btnInClose: TsButton;
    btnOutOpen: TsButton;
    btnOutClose: TsButton;
    btnRegSeek: TsButton;
    btnManual: TsButton;
    btnManualOut: TsButton;
    qry1: TADOQuery;
    pnlReceipt: TsPanel;
    sLabelReceipt: TsLabel;
    lbReceipt: TListBox;
    pnRegSeek: TsPanel;
    sLabel6: TsLabel;
    Bevel2: TBevel;
    Label3: TLabel;
    Bevel3: TBevel;
    Label4: TLabel;
    Bevel8: TBevel;
    Label9: TLabel;
    Bevel10: TBevel;
    Label10: TLabel;
    Label11: TLabel;
    edtExpDateF: TMaskEdit;
    edtExpDateT: TMaskEdit;
    edtName: TEdit;
    edtTelNo: TEdit;
    edtCarNo: TEdit;
    btnSeekClose: TsButton;
    btnRegSearch: TsButton;
    pnModify: TsPanel;
    sLabel28: TsLabel;
    Label1: TLabel;
    edtMCarNo: TEdit;
    btnMOK: TsButton;
    btnMCancel: TsButton;
    Panel2: TPanel;
    imgModify: TImage;
    pnManual: TsPanel;
    sLabel31: TsLabel;
    Label6: TLabel;
    edtManualCarNo: TEdit;
    btnManualOK: TsButton;
    btnManualCancel: TsButton;
    pnManualOut: TsPanel;
    sLabel32: TsLabel;
    btnManualOutOk: TsButton;
    btnManualOutCancel: TsButton;
    edtOutTime: TsMaskEdit;
    edtOutDate: TsDateEdit;
    pnLostImage: TPanel;
    imgLostBig: TImage;
    IdAntiFreeze1: TIdAntiFreeze;
    ICMP: TIdIcmpClient;
    csInLpr1: TClientSocket;
    csOutLpr1: TClientSocket;
    csInLpr2: TClientSocket;
    csInLpr3: TClientSocket;
    csOutLpr2: TClientSocket;
    csOutLpr3: TClientSocket;
    PopupMenu1: TPopupMenu;
    mnuDetail: TMenuItem;
    mnuDC1: TMenuItem;
    mnuDC2: TMenuItem;
    mnuDC3: TMenuItem;
    mnuDC4: TMenuItem;
    mnuDC5: TMenuItem;
    mnuDC6: TMenuItem;
    mnuDC7: TMenuItem;
    mnuDC8: TMenuItem;
    mnuDC9: TMenuItem;
    mnuDC10: TMenuItem;
    mnuDC11: TMenuItem;
    mnuDC12: TMenuItem;
    mnuDC13: TMenuItem;
    mnuDC14: TMenuItem;
    mnuDC15: TMenuItem;
    mnuDC16: TMenuItem;
    mnuDC17: TMenuItem;
    mnuDC18: TMenuItem;
    mnuDC19: TMenuItem;
    mnuDC20: TMenuItem;
    mnuInOpen: TMenuItem;
    mnuInClose: TMenuItem;
    mnuOutOpen: TMenuItem;
    mnuOutClose: TMenuItem;
    mnuReceipt: TMenuItem;
    Timer1: TTimer;
    btnClose: TsSpeedButton;
    csInDsp1: TClientSocket;
    csInDsp2: TClientSocket;
    csInDsp3: TClientSocket;
    csOutDsp1: TClientSocket;
    csOutDsp2: TClientSocket;
    csOutDsp3: TClientSocket;
    btnInDsp: TsSpeedButton;
    btnOutDsp: TsSpeedButton;
    btnMagam: TsSpeedButton;
    btnLock: TsSpeedButton;
    pnDCBtn: TsPanel;
    btnDC1: TsPanel;
    sLabel8: TsLabel;
    btnDC12: TsPanel;
    sLabel19: TsLabel;
    btnDC3: TsPanel;
    sLabel10: TsLabel;
    btnDC4: TsPanel;
    sLabel11: TsLabel;
    btnDC5: TsPanel;
    sLabel12: TsLabel;
    btnDC6: TsPanel;
    sLabel13: TsLabel;
    btnDC17: TsPanel;
    sLabel24: TsLabel;
    btnDC8: TsPanel;
    sLabel15: TsLabel;
    btnDC9: TsPanel;
    sLabel16: TsLabel;
    btnDC10: TsPanel;
    sLabel17: TsLabel;
    btnDC11: TsPanel;
    sLabel18: TsLabel;
    btnDC2: TsPanel;
    sLabel9: TsLabel;
    btnDC13: TsPanel;
    sLabel20: TsLabel;
    btnDC14: TsPanel;
    sLabel21: TsLabel;
    btnDC15: TsPanel;
    sLabel22: TsLabel;
    btnDC16: TsPanel;
    sLabel23: TsLabel;
    btnDC7: TsPanel;
    sLabel14: TsLabel;
    btnDC18: TsPanel;
    sLabel25: TsLabel;
    btnDC19: TsPanel;
    sLabel26: TsLabel;
    btnDC20: TsPanel;
    sLabel27: TsLabel;
    ComPrn: TApdComPort;
    Button1: TButton;
    Button2: TButton;
    edt1: TEdit;
    edtDspNo: TEdit;
    edttt: TEdit;
    tInDsp: TTimer;
    tOutDsp: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mnuCloseClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnCancelClick(Sender: TObject);
    procedure mnuDetailClick(Sender: TObject);
    procedure btnDC1Click(Sender: TObject);
    procedure btnDC2Click(Sender: TObject);
    procedure btnDC3Click(Sender: TObject);
    procedure btnDC4Click(Sender: TObject);
    procedure btnDC5Click(Sender: TObject);
    procedure btnDC6Click(Sender: TObject);
    procedure btnDC7Click(Sender: TObject);
    procedure btnDC8Click(Sender: TObject);
    procedure btnDC9Click(Sender: TObject);
    procedure btnDC10Click(Sender: TObject);
    procedure btnDC11Click(Sender: TObject);
    procedure btnDC12Click(Sender: TObject);
    procedure btnDC13Click(Sender: TObject);
    procedure btnDC14Click(Sender: TObject);
    procedure btnDC15Click(Sender: TObject);
    procedure btnDC16Click(Sender: TObject);
    procedure btnDC17Click(Sender: TObject);
    procedure btnDC18Click(Sender: TObject);
    procedure btnDC19Click(Sender: TObject);
    procedure btnDC20Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure csInLpr1Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure csInLpr2Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure csInLpr3Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure csOutLpr1Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure csOutLpr2Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure csOutLpr3Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure mnuSetupClick(Sender: TObject);
    procedure mnuUnitInfoClick(Sender: TObject);
    procedure btnLockClick(Sender: TObject);
    procedure btnProcClick(Sender: TObject);
    procedure btnReceiptClick(Sender: TObject);
    procedure btnDCClearClick(Sender: TObject);
    procedure btnLostClick(Sender: TObject);
    procedure btnManualClick(Sender: TObject);
    procedure btnManualOutClick(Sender: TObject);
    procedure btnSeekClick(Sender: TObject);
    procedure dgLostClick(Sender: TObject);
    procedure btnLostProcClick(Sender: TObject);
    procedure sgIODblClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure sgOutDblClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure btnMOKClick(Sender: TObject);
    procedure btnMCancelClick(Sender: TObject);
    procedure edtMCarNoKeyPress(Sender: TObject; var Key: Char);
    procedure lbReceiptDblClick(Sender: TObject);
    procedure btnManualOutOkClick(Sender: TObject);
    procedure edtOutTimeKeyPress(Sender: TObject; var Key: Char);
    procedure btnManualOutCancelClick(Sender: TObject);
    procedure cmbFeeItemChange(Sender: TObject);
    procedure btnOutOpenClick(Sender: TObject);
    procedure btnMagamClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure edtProcYogumChange(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnInDspClick(Sender: TObject);
    procedure btnOutDspClick(Sender: TObject);
    procedure tInDspTimer(Sender: TObject);
    procedure tOutDspTimer(Sender: TObject);
  private
    { Private declarations }
    procedure FormAlign;
    procedure ICMPReply(ASender: TComponent; const ReplyStatus: TReplyStatus);
    function is_ping(IP: AnsiString): Boolean;
    procedure T_ProcClear;
    procedure ClearGTime;
    procedure ClearDCProc;
    procedure ClearFormData;
    procedure dcBtnClick(dcBtn: TsPanel);
    procedure InOpen;
    Procedure InClose;
    Procedure OutOpen;
    Procedure OutClose;
  public
    { Public declarations }
    procedure LprDataProc(nNo: Word; sLprData, sLprIP, sDspIP: AnsiString);
    function RecvLprProc(sLprFile1, sLprCarNo1, sLprFile2, sLprCarNo2, sIOTime: AnsiString;
                         nLprNo, nLprInOut, nLprRecog1, nLprRecog2: Byte; sDspIP: AnsiString): String;
    procedure NormalOut(sLprFile1, sLprCarNo1, sLprFile2, sLprCarNo2, sIOTime: AnsiString;
                        nLprNo, nLprInOut, nLprRecog1, nLprRecog2: Byte; sDspIP: AnsiString);
    procedure NormalProc(sLprFile1, sLprCarNo1, sLprFile2, sLprCarNo2, sIOTime: AnsiString;
                         nLprNo, nLprInOut, nLprRecog1, nLprRecog2: Byte; sDspIP: AnsiString);
    function chkHoliday(sDate: AnsiString): Boolean;
    procedure DCEnable(bCheck: Boolean);
    procedure GridClear;
    procedure NGridClear;
    procedure GridData(sResult: String);
    procedure PartGridData(sResult: String);
    procedure NGridData(sResult: String);
    procedure MoneyProc;
    procedure ManualOut(sLprFile1, sLprCarNo1, sLprFile2, sLprCarNo2, sIOTime: AnsiString;
                        nLprNo, nLprInOut, nLprRecog1, nLprRecog2: Byte);
    //nIO: 1-입구, 2-출구    nType: 1-정기차량, 2-일반차량, 3-요금표시
    procedure DspProc(nIO, nType: Byte; sData, sLprIP: AnsiString);
  end;

var
  frmMain: TfrmMain;
  ping_success: Boolean = False;
  bLostProc: Boolean = False;
  sChkDateTime, sNextDateTime, sInDate, sInTime, sOutDate, sOutTime, sChkDate,
  sChkTime, sNextTime: AnsiString;
  nYogum, nTotYogum, nItemMax, nTotMax, nDayCnt: Cardinal;
  nFeeNo: Word = 0;
  nDCList: Byte = 0;

  function DBConnect(pDBIP:Pointer):Boolean; StdCall; external 'Tariff.dll';
  function FeeCalc(nParkNo:Integer; nFeeNo:Integer; pInDateTime:Pointer; pOutDateTime:Pointer):Integer; StdCall; external 'Tariff.dll';
  function ReturnFee(nParkNo:Integer; nFeeNo:Integer; pInDateTime:Pointer; pOutDateTime:Pointer):Integer; StdCall; external 'Tariff.dll';

implementation
uses
  Global, Tables, Login, Setup, UnitInfo, Closing, InDspSet, DspSet;

{$R *.dfm}

procedure TfrmMain.ManualOut(sLprFile1, sLprCarNo1, sLprFile2, sLprCarNo2, sIOTime: AnsiString;
                             nLprNo, nLprInOut, nLprRecog1, nLprRecog2: Byte);
var
  sNow, sInCarNo, sInTKNo, sInDate, sInTime, sParking, sInFile, sImgFile1, sImgFile2,
  sLocalFile, sTime, sDir: aString;
  nDay, nHour, nMin, nOutCnt: Cardinal;
  nInUnitNo, i: Word;
  hr: HRESULT;
begin
  //일반차량 출차처리...
  try
    with dmTables.qryNormalOut1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from Gracetime where ParkNo = :N1');
      Parameters.ParamByName('N1').Value:= nCurrParkNo;
      Open;

      if RecordCount > 0 then
        with GTime do
        begin
          GT1:= FieldByName('GT1').AsString;
          GT2:= FieldByName('GT2').AsString;
          GT3:= FieldByName('GT3').AsString;
          GT4:= FieldByName('GT4').AsString;
          GT5:= FieldByName('GT5').AsString;
          GT6:= FieldByName('GT6').AsString;
          GT7:= FieldByName('GT7').AsString;
          GT8:= FieldByName('GT8').AsString;
          GT9:= FieldByName('GT9').AsInteger;
        end
      else
        ClearGTime;
    end;

    //화면표시
    pnN.Visible:= True;
    edtNo.Text:= sLprCarNo1;
    edtInDate.Text:= sManualInTime;
    sNow:= FormatDateTime('YYYY-MM-DD HH:NN:SS', Now);
    sParking:= '';
    nParkingMin:= 0;
    nParkingMin:= Trunc((StrToDateTime(MG_AddTime(Copy(sNow, 1, 16), 0, 1, 0, 0)+':01')-
                         StrToDateTime(edtInDate.Text))*24*60);
    nDay:= nParkingMin div (24*60);
    nHour:= (nParkingMin mod (24*60)) div 60;
    nMin:= (nParkingMin mod (24*60)) mod 60;

    if nDay > 0 then sParking:= sParking + IntToStr(nDay) + '일 ';
    if nHour > 0 then sParking:= sParking + IntToStr(nHour) + '시간 ';
    if nMin > 0 then sParking:= sParking + IntToStr(nMin) + '분';
    pnlPTime.Text:= sParking;

    if FormatDateTime('YYYY-MM-DD HH:NN', StrToDateTime(Copy(edtInDate.Text, 1, 16)) +
                                          StrToTime(GTime.GT1)) > Copy(sNow, 1, 16) then
    begin
      ShowMessage('회차허용시간 미초과차량!'#13#13#10 +
                  '입차시간: ' + edtInDate.Text + #13#13#10 +
                  '출차시간: ' + sNow + #13#13#10 +
                  '허용시간: ' + GTime.GT1);

      //DB Write...
      with dmTables.qryNormalOut2 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select * from IONCount Where ParkNo = :N1 and UnitNo = :N2 and ProcDate = :N3');
        Parameters.ParamByName('N1').Value:= nCurrParkNo;
        Parameters.ParamByName('N2').Value:= nLprNo;
        Parameters.ParamByName('N3').Value:= Copy(sNow, 1, 10);
        Open;

        if RecordCount > 0 then
        begin
          Case StrToInt(FormatDateTime('HH', Now)) of
            0 : nOutCnt:= FieldByName('Out00').AsInteger+1;
            1 : nOutCnt:= FieldByName('Out01').AsInteger+1;
            2 : nOutCnt:= FieldByName('Out02').AsInteger+1;
            3 : nOutCnt:= FieldByName('Out03').AsInteger+1;
            4 : nOutCnt:= FieldByName('Out04').AsInteger+1;
            5 : nOutCnt:= FieldByName('Out05').AsInteger+1;
            6 : nOutCnt:= FieldByName('Out06').AsInteger+1;
            7 : nOutCnt:= FieldByName('Out07').AsInteger+1;
            8 : nOutCnt:= FieldByName('Out08').AsInteger+1;
            9 : nOutCnt:= FieldByName('Out09').AsInteger+1;
            10: nOutCnt:= FieldByName('Out10').AsInteger+1;
            11: nOutCnt:= FieldByName('Out11').AsInteger+1;
            12: nOutCnt:= FieldByName('Out12').AsInteger+1;
            13: nOutCnt:= FieldByName('Out13').AsInteger+1;
            14: nOutCnt:= FieldByName('Out14').AsInteger+1;
            15: nOutCnt:= FieldByName('Out15').AsInteger+1;
            16: nOutCnt:= FieldByName('Out16').AsInteger+1;
            17: nOutCnt:= FieldByName('Out17').AsInteger+1;
            18: nOutCnt:= FieldByName('Out18').AsInteger+1;
            19: nOutCnt:= FieldByName('Out19').AsInteger+1;
            20: nOutCnt:= FieldByName('Out20').AsInteger+1;
            21: nOutCnt:= FieldByName('Out21').AsInteger+1;
            22: nOutCnt:= FieldByName('Out22').AsInteger+1;
            23: nOutCnt:= FieldByName('Out23').AsInteger+1;
          end;
          Close;
          SQL.Clear;
          SQL.Add('Update IONCount ');

          Case StrToInt(FormatDateTime('HH', Now)) of
            0 : SQL.Add('Set Out00 = :N1 ');
            1 : SQL.Add('Set Out01 = :N1 ');
            2 : SQL.Add('Set Out02 = :N1 ');
            3 : SQL.Add('Set Out03 = :N1 ');
            4 : SQL.Add('Set Out04 = :N1 ');
            5 : SQL.Add('Set Out05 = :N1 ');
            6 : SQL.Add('Set Out06 = :N1 ');
            7 : SQL.Add('Set Out07 = :N1 ');
            8 : SQL.Add('Set Out08 = :N1 ');
            9 : SQL.Add('Set Out09 = :N1 ');
            10: SQL.Add('Set Out10 = :N1 ');
            11: SQL.Add('Set Out11 = :N1 ');
            12: SQL.Add('Set Out12 = :N1 ');
            13: SQL.Add('Set Out13 = :N1 ');
            14: SQL.Add('Set Out14 = :N1 ');
            15: SQL.Add('Set Out15 = :N1 ');
            16: SQL.Add('Set Out16 = :N1 ');
            17: SQL.Add('Set Out17 = :N1 ');
            18: SQL.Add('Set Out18 = :N1 ');
            19: SQL.Add('Set Out19 = :N1 ');
            20: SQL.Add('Set Out20 = :N1 ');
            21: SQL.Add('Set Out21 = :N1 ');
            22: SQL.Add('Set Out22 = :N1 ');
            23: SQL.Add('Set Out23 = :N1 ');
          end;
          SQL.Add('Where ParkNo = :N2 and UnitNo = :N3 and ProcDate = :N4');
          Parameters.ParamByName('N1').Value:= nOutCnt;
          Parameters.ParamByName('N2').Value:= nCurrParkNo;
          Parameters.ParamByName('N3').Value:= nLprNo;
          Parameters.ParamByName('N4').Value:= Copy(sNow, 1, 10);
          ExecSQL; Close;
        end
        else
        begin
          Close;
          SQL.Clear;
          SQL.Add('Insert Into IONCount ');
          SQL.Add('(ParkNo, UnitNo, ProcDate, In00, In01, In02, In03, In04, ');
          SQL.Add('In05, In06, In07, In08, In09, In10, In11, In12, In13, In14, ');
          SQL.Add('In15, In16, In17, In18, In19, In20, In21, In22, In23, Out00, ');
          SQL.Add('Out01, Out02, Out03, Out04, Out05, Out06, Out07, Out08, Out09, ');
          SQL.Add('Out10, Out11, Out12, Out13, Out14, Out15, Out16, Out17, Out18, ');
          SQL.Add('Out19, Out20, Out21, Out22, Out23) Values ');
          SQL.Add('(:N1, :N2, :N3, 0, 0, 0, 0, 0, 0, 0, ');
          SQL.Add('0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ');
          SQL.Add('0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)');
          Parameters.ParamByName('N1').Value:= nCurrParkNo;
          Parameters.ParamByName('N2').Value:= nLprNo;
          Parameters.ParamByName('N3').Value:= Copy(sNow, 1, 10);
          ExecSQL;

          Close;
          SQL.Clear;
          SQL.Add('UpDate IONCount ');

          Case StrToInt(FormatDateTime('HH', Now)) of
            0 : SQL.Add('Set Out00 = :N1 ');
            1 : SQL.Add('Set Out01 = :N1 ');
            2 : SQL.Add('Set Out02 = :N1 ');
            3 : SQL.Add('Set Out03 = :N1 ');
            4 : SQL.Add('Set Out04 = :N1 ');
            5 : SQL.Add('Set Out05 = :N1 ');
            6 : SQL.Add('Set Out06 = :N1 ');
            7 : SQL.Add('Set Out07 = :N1 ');
            8 : SQL.Add('Set Out08 = :N1 ');
            9 : SQL.Add('Set Out09 = :N1 ');
            10: SQL.Add('Set Out10 = :N1 ');
            11: SQL.Add('Set Out11 = :N1 ');
            12: SQL.Add('Set Out12 = :N1 ');
            13: SQL.Add('Set Out13 = :N1 ');
            14: SQL.Add('Set Out14 = :N1 ');
            15: SQL.Add('Set Out15 = :N1 ');
            16: SQL.Add('Set Out16 = :N1 ');
            17: SQL.Add('Set Out17 = :N1 ');
            18: SQL.Add('Set Out18 = :N1 ');
            19: SQL.Add('Set Out19 = :N1 ');
            20: SQL.Add('Set Out20 = :N1 ');
            21: SQL.Add('Set Out21 = :N1 ');
            22: SQL.Add('Set Out22 = :N1 ');
            23: SQL.Add('Set Out23 = :N1 ');
          end;
          SQL.Add('Where ParkNo = :N2 and UnitNo = :N3 and ProcDate = :N4');
          Parameters.ParamByName('N1').Value:= 1;
          Parameters.ParamByName('N2').Value:= nCurrParkNo;
          Parameters.ParamByName('N3').Value:= nLprNo;
          Parameters.ParamByName('N4').Value:= Copy(sNow, 1, 10);
          ExecSQL;
        end;

        Close;
        SQL.Clear;
        SQL.Add('Select * from TKProc where ParkNo = :N1 and UnitNo = :N2 and ');
        SQL.Add('ProcDate = :N3 and ProcTime = :N4');
        Parameters.ParamByName('N1').Value:= nCurrParkNo;
        Parameters.ParamByName('N2').Value:= nCurrUnitNo;
        Parameters.ParamByName('N3').Value:= Copy(sNow, 1, 10);
        Parameters.ParamByName('N4').Value:= Copy(sNow, 12, 8);
        Open;

        if RecordCount <= 0 then
        begin
          Close;
          SQL.Clear;
          SQL.Add('Insert Into TKProc ');
          SQL.Add('(ParkNo, UnitNo, ProcDate, ProcTime, TKType, CarType, FeeNo, ');
          SQL.Add('TKNo, TKParkNo, TKUnitNo, CarNo, InDate, InTime, ParkingMin, ');
          SQL.Add('TotFee, TotDC, RealFee, RecvAmt, Change, DCCnt, MNo, UnPaid ');
          SQL.Add('ChkClosing, CommercialTariff, SpecialTariff, PayType) ');
          SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, ');
          SQL.Add(':N11, :N12, :N13, :N14, :N15, :N16, :N17, :N18, :N19, :N20, ');
          SQL.Add(':N21, :N22, :N23, :N24, :N25, :N26)');
          Parameters.ParamByName('N1' ).Value:= nCurrParkNo;
          Parameters.ParamByName('N2' ).Value:= nCurrUnitNo;
          Parameters.ParamByName('N3' ).Value:= Copy(sNow, 1, 10);
          Parameters.ParamByName('N4' ).Value:= Copy(sNow, 12, 8);
          Parameters.ParamByName('N5' ).Value:= nTKType;
          Parameters.ParamByName('N6' ).Value:= nCarType;
          Parameters.ParamByName('N7' ).Value:= nFeeNo;
          Parameters.ParamByName('N8' ).Value:= sManualTKNo;
          Parameters.ParamByName('N9' ).Value:= nCurrParkNo;
          Parameters.ParamByName('N10').Value:= nCurrUnitNo;
          Parameters.ParamByName('N11').Value:= sLprCarNo1;
          Parameters.ParamByName('N12').Value:= Copy(sManualInTime, 1, 10);
          Parameters.ParamByName('N13').Value:= Copy(sManualInTime, 12, 8);
          Parameters.ParamByName('N14').Value:= nParkingMin;
          Parameters.ParamByName('N15').Value:= 0;
          Parameters.ParamByName('N16').Value:= 0;
          Parameters.ParamByName('N17').Value:= 0;
          Parameters.ParamByName('N18').Value:= 0;
          Parameters.ParamByName('N19').Value:= 0;
          Parameters.ParamByName('N20').Value:= 0;
          Parameters.ParamByName('N21').Value:= nCurrMNo;
          Parameters.ParamByName('N22').Value:= 0;
          Parameters.ParamByName('N23').Value:= 0;
          Parameters.ParamByName('N24').Value:= 0;
          Parameters.ParamByName('N25').Value:= 0;
          Parameters.ParamByName('N26').Value:= 1;
          ExecSQL;
        end;

        Close;
        SQL.Clear;
        SQL.Add('Insert Into IONData ');
        SQL.Add('(ParkNo, UnitNo, ProcDate, ProcTime, TKNo, TKType, CarType, ');
        SQL.Add('InImage1, InCarNo1, InImage2, InCarNo2, Status, OutUnitNo, ');
        SQL.Add('OutDate, OutTime, OutChk, OutImage1, OutCarNo1, OutImage2, OutCarNo2, ');
        SQL.Add('InRecog1, OutRecog1, InRecog2, OutRecog2) ');
        SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, ');
        SQL.Add(':N12, :N13, :N14, :N15, :N16, :N17, :N18, :N19, :N20, ');
        SQL.Add(':N21, :N22, :N23, :N24)');
        Parameters.ParamByName('N1' ).Value:= nCurrParkNo;
        Parameters.ParamByName('N2' ).Value:= nCurrUnitNo;
        Parameters.ParamByName('N3' ).Value:= Copy(sManualInTime, 1, 10);
        Parameters.ParamByName('N4' ).Value:= Copy(sManualInTime, 12, 8);
        Parameters.ParamByName('N5' ).Value:= sManualTKNo;
        Parameters.ParamByName('N6' ).Value:= nTKType;
        Parameters.ParamByName('N7' ).Value:= nCarType;
        Parameters.ParamByName('N8' ).Value:= '';
        Parameters.ParamByName('N9' ).Value:= '';
        Parameters.ParamByName('N10').Value:= '';
        Parameters.ParamByName('N11').Value:= '';
        Parameters.ParamByName('N12').Value:= 1;
        Parameters.ParamByName('N13').Value:= nLprNo;
        Parameters.ParamByName('N14').Value:= Copy(sNow, 1, 10);
        Parameters.ParamByName('N15').Value:= Copy(sNow, 12, 8);
        Parameters.ParamByName('N16').Value:= 4;
        Parameters.ParamByName('N17').Value:= sLprFile1;
        Parameters.ParamByName('N18').Value:= sLprCarNo1;
        Parameters.ParamByName('N19').Value:= sLprFile2;
        Parameters.ParamByName('N20').Value:= sLprCarNo2;
        Parameters.ParamByName('N21').Value:= 3;
        Parameters.ParamByName('N22').Value:= nLprRecog1;
        Parameters.ParamByName('N23').Value:= 3;
        Parameters.ParamByName('N24').Value:= nLprRecog2;
        ExecSQL;

        Close;
        SQL.Clear;
        SQL.Add('Select * from IONCount where ProcDate = :N1');
        Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', Now);
        Open;
        nNOutCnt:= 0;

        for i:= 0 to 23 do
          nNOutCnt:= nNOutCnt + FieldByName('Out' + MG_InsZero(IntToStr(i), 2)).AsInteger;
      end;
      DspProc(2, 1, '회차허용차량' + MG_Left(sLprCarNo1, 12), aString(csOutDSP1.Host));
      OutOpen;
      NGridData(sInCarNo + '^' + Copy(sNow, 1, 10) + ' ' + Copy(sNow, 12, 8) + '^출 차');
      sPrtData:= '';
      ClearFormData;
    end
    else
    begin
      sNowLprFile1 := sLprFile1;
      sNowLprCarNo1:= sLprCarNo1;
      sNowLprFile2 := sLprFile2;
      sNowLprCarNo2:= sLprCarNo2;
      sNowIOTime   := sIOTime;
      nNowLprNo    := nLprNo;
      nNowLprInOut := nLprInOut;
      nNowLprRecog1:= nLprRecog1;
      nNowLprRecog2:= nLprRecog2;
      sNowInTKNo   := sManualTKNo;
      nNowInUnitNo := nCurrUnitNo;
      sNowInDate   := Copy(sManualInTime, 1, 10);
      sNowInTime   := Copy(sManualInTime, 12, 8);
      sNowInCarNo  := sLprCarNo1;
      sNowOutDate  := Copy(sNow, 1, 10);
      sNowOutTime  := Copy(sNow, 12, 8);

      nTotYogum:= FeeCalc(nCurrParkNo, nFeeNo, PAnsiChar(sNowInDate + ' ' + Copy(sNowInTime, 1, 5)),
                          PAnsiChar(Copy(sNow, 1, 16)));

      edtTotYogum.Text:= IntToStr(nTotYogum);
      edtTotYogum.AutoThousandSeparator:= True;
      edtProcYogum.Text:= IntToStr(nTotYogum);
      edtProcYogum.AutoThousandSeparator:= True;
      pnlTot.Text:= edtTotYogum.Text + '원';
      pnlFee.Caption:= edtTotYogum.Text + '원';
      pnlDC.Text:= edtDCYogum.Text + '원';
      pnYogum.Visible:= True;
      pnN.Visible:= True;
      pnInit.Visible:= False;

      if nDCList > 0 then
      begin
        pnDCBtn.Visible:= True;
        sp2.Visible:= False;
      end;
      DspProc(2, 1, '주차요금    ' + MG_Right(pnlFee.Caption, 12), aString(csOutDSP1.Host));

      btnProc.Enabled:= True;
      btnCancel.Enabled:= True;
      DCEnable(True);
      btnReceipt.Visible:= False;
      mnuReceipt.Enabled:= False;
      btnLost.Enabled:= False;
      btnInOpen  .Enabled:= False;
      btnInClose .Enabled:= False;
      btnOutOpen .Enabled:= False;
      btnOutClose.Enabled:= False;
      mnuInOpen  .Enabled:= False;
      mnuInClose .Enabled:= False;
      mnuOutOpen .Enabled:= False;
      mnuOutClose.Enabled:= False;
      sProcTime:= sNow;
      sDCOutTime:= sNow;
    end;
  except
    on E: Exception do ExceptLogging('TfrmMain.ManualOut: ' + aString(E.Message));
  end;
end;

procedure TfrmMain.GridClear;
var
  i, j : Integer;
begin
  if bLPR then
  begin
    sgIn .ColWidths[1]:= 0;
    sgIn .ColWidths[2]:= 0;
    imgIn.Visible:= True;
    imgOut.Visible:= True;
    sgIn .Left := 187;
    sgIn .Width:= 317;
    sgOut.Left := 694;
    sgOut.Width:= 319;
    imgIn.Picture.Assign(Nil);
    imgOut.Picture.Assign(Nil);
  end
  else
  begin
    imgIn.Visible:= False;
    imgOut.Visible:= False;
    sgIn .Left:= 2;
    sgIn.Width:= 504;
    sgOut.Left:= 509;
    sgOut.Width:= 504;
  end;

  with sgIn do
  begin
    Cells[0, 0] := '차량번호';
    Cells[1, 0] := '성  명';
    Cells[2, 0] := '회사명';
    Cells[3, 0] := '유효기간';
    Cells[4, 0] := '출입상태';


    for i := 1 to RowCount - 1 do
    begin
        for j := 0 to ColCount - 1 do
        begin
            Cells[j, i] := '';
        end;
    end;
  end;
  sgIn.Alignments[0, 0]:= taCenter;
  sgIn.Alignments[1, 0]:= taCenter;
  sgIn.Alignments[2, 0]:= taCenter;
  sgIn.Alignments[3, 0]:= taCenter;
  sgIn.Alignments[4, 0]:= taCenter;

  with sgOut do
  begin
    Cells[0, 0] := '차량번호';
    Cells[1, 0] := '입차일시';

    for i := 1 to RowCount - 1 do
    begin
        for j := 0 to ColCount - 1 do
        begin
            Cells[j, i] := '';
        end;
    end;
  end;
  sgOut.Alignments[0, 0]:= taCenter;
  sgOut.Alignments[1, 0]:= taCenter;
end;

procedure TfrmMain.NGridClear;
var
  i, j: Integer;
begin
  with sgIO do
  begin
    Cells[0, 0] := '차량번호';
    Cells[1, 0] := '출입일시';
    Cells[2, 0] := '출입상태';

    for i := 1 to RowCount - 1 do
    begin
        for j := 0 to ColCount - 1 do
        begin
            Cells[j, i] := '';
        end;
    end;
  end;
  sgIO.Alignments[0, 0]:= taCenter;
  sgIO.Alignments[1, 0]:= taCenter;
  sgIO.Alignments[2, 0]:= taCenter;
end;

procedure TfrmMain.GridData(sResult: String);
var
  sCarNo, sName, sCardNo, sExpDate, sStatus, sTemp: String;
  nPos: Byte;
begin
  if Length(sResult) > 4 then
  begin
    sCarNo:= Copy(sResult, 2, Pos('^', sResult)-2);
    sTemp:= Copy(sResult, Pos('^', sResult)+1, Length(sResult)-(Pos('^', sResult)));
    sName:= Copy(sTemp, 1, Pos('^', sTemp)-1);
    sTemp:= Copy(sTemp, Pos('^', sTemp) +1, Length(sTemp)-(Pos('^', sTemp)));
    sCardNo:= Copy(sTemp, 1, Pos('^', sTemp)-1);
    nPos:= Pos('^', sTemp);
    sTemp:= Copy(sTemp, nPos+ 1, (Length(sTemp)-(nPos))+2);
    sExpDate:= Copy(sTemp, 1, Pos('^', sTemp)-1);
    nPos:= Pos('^', sTemp);
    sStatus:= Copy(sTemp, nPos +1, Length(sTemp)-nPos);

    with sgIn do
    begin
      InsertRows(1, 1, True);
      Cells[0, 1]:= sCarNo;
      Cells[1, 1]:= sName;
      Cells[2, 1]:= sCardNo;
      Cells[3, 1]:= sExpDate;
      Cells[4, 1]:= sStatus;
    end;
    sgIn.Alignments[0, 1]:= taCenter;
    sgIn.Alignments[1, 1]:= taCenter;
    sgIn.Alignments[2, 1]:= taCenter;
    sgIn.Alignments[3, 1]:= taCenter;
    sgIn.Alignments[4, 1]:= taCenter;
  end;
end;

procedure TfrmMain.PartGridData(sResult: String);
var
  sCarNo, sIOTime: String;
  nPos: Byte;
begin
  if Length(sResult) > 4 then
  begin
    sCarNo:= Copy(sResult, 1, Pos('^', sResult)-1);
    nPos:= Pos('^', sResult);
    sIOTime:= Copy(sResult, nPos+1, Length(sResult)-nPos);
  end;
  sgOut.InsertRows(1, 1, True);

  sgOut.Cells[0, 1]:= sCarNo;
  sgOut.Cells[1, 1]:= sIOTime;

  sgOut.Alignments[0, 1]:= taCenter;
  sgOut.Alignments[1, 1]:= taCenter;
end;

procedure TfrmMain.NGridData(sResult: String);
var
  sCarNo, sIOTime, sStatus, sTemp: String;
  nPos: Byte;
begin
  if Length(sResult) > 4 then
  begin
    sCarNo:= Copy(sResult, 1, Pos('^', sResult)-1);
    sTemp:= Copy(sResult, Pos('^', sResult)+1, Length(sResult)-(Pos('^', sResult)));
    sIOTime:= Copy(sTemp, 1, Pos('^', sTemp)-1);
    nPos:= Pos('^', sTemp);
    sStatus:= Copy(sTemp, nPos +1, Length(sTemp)-nPos);

    with sgIO do
    begin
      InsertRows(1, 1, True);
      Cells[0, 1]:= sCarNo;
      Cells[1, 1]:= sIOTime;
      Cells[2, 1]:= sStatus;
    end;
    sgIO.Alignments[0, 1]:= taCenter;
    sgIO.Alignments[1, 1]:= taCenter;
    sgIO.Alignments[2, 1]:= taCenter;
  end;
end;

procedure TfrmMain.InOpen;
begin
  try
    //
  except
    on E: Exception do ExceptLogging('TfrmMain.InOpen: ' + aString(E.Message));
  end;
end;

procedure TfrmMain.InClose;
begin
  try
    //
  except
    on E: Exception do ExceptLogging('TfrmMain.InClose: ' + aString(E.Message));
  end;
end;

procedure TfrmMain.OutOpen;
begin
  try
    //
  except
    on E: Exception do ExceptLogging('TfrmMain.OutOpen: ' + aString(E.Message));
  end;
end;

procedure TfrmMain.OutClose;
begin
  try
    //
  except
    on E: Exception do ExceptLogging('TfrmMain.OutClose: ' + aString(E.Message));
  end;
end;

procedure TfrmMain.DCEnable(bCheck: Boolean);
var
  i: Byte;
begin
  for i:= 1 to 20 do
  begin
    TMenuItem(FindComponent('mnuDC' + IntToStr(i))).Enabled:= bCheck;
    TsPanel(FindComponent('btnDC' + IntToStr(i))).Enabled:= bCheck;
  end;
end;

procedure TfrmMain.dgLostClick(Sender: TObject);
var
  sIn, sLocalFile, sTime, sDir: aString;
  nNo: Byte;
begin
  try
    if dmTables.qryLost.RecordCount > 0 then
      with dmTables.qryLost do
      begin
        bMiProc:= True;
        nNo:= FieldByName('UnitNo').AsInteger;

        if FieldByName('InRecog1').AsInteger = 1 then
        begin
          sIn:= FieldByName('InImage1').AsString;
          sTime:= Copy(sIn, Pos('_', sIn)+1, 14);
          sLostInCarNo:= FieldByName('InCarNo1').AsString;
          nLostInRecog:= 1;
        end
        else
        if FieldByName('InRecog2').AsInteger = 1 then
        begin
          sIn:= FieldByName('InImage2').AsString;
          sTime:= Copy(sIn, Pos('_', sIn)+1, 14);
          sLostInCarNo:= FieldByName('InCarNo2').AsString;
          nLostInRecog:= 1;
        end
        else
        begin
          sIn:= FieldByName('InImage1').AsString;
          sTime:= Copy(sIn, Pos('_', sIn)+1, 14);
          sLostInCarNo:= FieldByName('InCarNo1').AsString;
          nLostInRecog:= FieldByName('InRecog1').AsInteger;
        end;
        sDir:= sImageDir + '\' + Copy(sTime, 1, 4) + '\' + Copy(sTime, 5, 2) + '\' +
               Copy(sTime, 7, 2) + '\' + IntToStr(nNo);
        sLostInDate:= FieldByName('ProcDate').AsString;
        sLostInTime:= FieldByName('ProcTime').AsString;
        nLostInUnitNo:= nNo;
        sLostInFile:= sIn;
        sLostInTKNo:= FieldByName('TKNo').AsString;

        if not DirectoryExists(sDir) then
        begin
          if not ForceDirectories(sDir) then
            ExceptLogging('이미지저장폴더 생성실패: ' + sDir);
        end;

        sLocalFile:= sDir + '\' + Copy(sIn, Pos('CH', sIn), Length(sIn)-(Pos('CH', sIn)-1));

        if FileExists(sLocalFile) then
        begin
          imgLost.Picture.LoadFromFile(sLocalFile);
          imgLostBig.Picture.LoadFromFile(sLocalFile);
        end
        else
        begin
          try
            if DownloadFileHTTP(wString(sIn), wString(sLocalFile)) then
            begin
              imgLost.Picture.LoadFromFile(sLocalFile);
              imgLostBig.Picture.LoadFromFile(sLocalFile);
            end
            else
            begin
              imgLost.Picture.Assign(Nil);
              imgLostBig.Picture.Assign(Nil);
              ExceptLogging('File Down 실패: ' + sIn);
            end;
          except
           on E: Exception do ExceptLogging('TfrmMain.Lost_FileDownload: ' + aString(E.Message));
          end;
        end;
      end;
  except
    on E: Exception do ExceptLogging('TfrmMain.dgLostClick: ' + E.Message);
  end;
end;

procedure TfrmMain.edtMCarNoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnMOkClick(Self);
end;

procedure TfrmMain.edtOutTimeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnManualOutOkClick(Self);
end;

procedure TfrmMain.edtProcYogumChange(Sender: TObject);
begin
  if edtProcYogum.Text <> '0' then
    DspProc(2, 1, '주차요금    ' + MG_Right(edtProcYogum.Text+'원', 12), aString(csOutDSP1.Host));
end;

procedure TfrmMain.Timer1Timer(Sender: TObject);
begin
  try
    pnlNow.Text:= FormatDateTime('YYYY-MM-DD HH:NN:SS', Now);
  except
    on  E: Exception do ExceptLogging('TfrmMain.Timer1Timer: ' + aString(E.Message));
  end;
end;

procedure TfrmMain.tInDspTimer(Sender: TObject);
var
  sSend, sDspData, sSpeed, sTime, sEffect: aString;
  sDsp1, sDsp2, sColor1, sColor2, sTemp1, sTemp2: aString;
  i: Byte;
begin
  try
    tInDsp.Enabled:= False;
    sSend:= '';
    sSpeed:= MG_InsZero(IntToStr(iSetup.ReadInteger('PARKING', 'IN_DSP_SPEED', 0)), 2);
    sTime:= MG_InsZero(IntToStr(iSetup.ReadInteger('PARKING', 'IN_DSP_TIME', 0)), 2);

    sDsp1:= aString(iSetup.ReadString('PARKING', 'IN_DSP_1_1', ''));
    sDsp2:= aString(iSetup.ReadString('PARKING', 'IN_DSP_1_2', ''));
    sTemp1:= iSetup.ReadString('PARKING', 'IN_DSP_COLOR_1_1', '');
    sTemp2:= iSetup.ReadString('PARKING', 'IN_DSP_COLOR_1_2', '');
    sColor1:= '';
    sColor2:= '';

    for i := 1 to 12 do
    begin
      sColor1:= sColor1 + AnsiChar(StrToInt('$0' + Copy(sTemp1, i, 1)));
    end;

    for i := 1 to 12 do
    begin
      sColor2:= sColor2 + AnsiChar(StrToInt('$0' + Copy(sTemp2, i, 1)));
    end;

    sEffect:= AnsiChar($00) + //AnsiChar(StrToInt('$' + edtDspNo.Text)) + //문구블록
              AnsiChar($00) + //배경이미지
              AnsiChar($00) + //문구저장위치
              AnsiChar($61) + //AnsiChar(StrToInt('$' + edttt.Text)) + //폰트크기
              AnsiChar($00) + //화면분할위치
              AnsiChar($00) + //완성형
              AnsiChar($80) + //분할화면효과없음
              AnsiChar($01) + //메인화면효과
              AnsiChar(StrToInt('$' + sSpeed)) + //속도
              AnsiChar(StrToInt('$' + sTime)) + //정지시간
              AnsiChar($00);  //문구수직위치
    sSend:= MakeDSPData(AnsiChar($53), sEffect, sColor1 + sColor2, sDsp1 + sDsp2);

    for i := 1 to 3 do
    begin
      if TClientSocket(FindComponent('csInDsp' + IntToStr(i))).Active then
        TClientSocket(FindComponent('csInDsp' + IntToStr(i))).Socket.SendText(sSend);
    end;
    //tInDsp.Enabled:= True;
  except
    on E: Exception do ExceptLogging('TfrmMain.tInDspTimer: ' + E.Message);
  end;
end;

procedure TfrmMain.tOutDspTimer(Sender: TObject);
var
  sSend, sDspData, sSpeed, sTime, sEffect: aString;
  sDsp1, sDsp2, sColor1, sColor2, sTemp1, sTemp2: aString;
  i: Byte;
begin
  try
    tOutDsp.Enabled:= False;
    sSend:= '';
    sSpeed:= MG_InsZero(IntToStr(iSetup.ReadInteger('PARKING', 'DSP_SPEED', 0)), 2);
    sTime:= MG_InsZero(IntToStr(iSetup.ReadInteger('PARKING', 'DSP_TIME', 0)), 2);

    sDsp1:= iSetup.ReadString('PARKING', 'DSP_1_1', '');
    sDsp2:= iSetup.ReadString('PARKING', 'DSP_1_2', '');
    sTemp1:= iSetup.ReadString('PARKING', 'DSP_COLOR_1_1', '');
    sTemp2:= iSetup.ReadString('PARKING', 'DSP_COLOR_1_2', '');
    sColor1:= '';
    sColor2:= '';

    for i := 1 to 12 do
    begin
      sColor1:= sColor1 + AnsiChar(StrToInt('$0' + Copy(sTemp1, i, 1)));
    end;

    for i := 1 to 12 do
    begin
      sColor2:= sColor2 + AnsiChar(StrToInt('$0' + Copy(sTemp2, i, 1)));
    end;

    sEffect:= AnsiChar($00) + //AnsiChar(StrToInt('$' + edtDspNo.Text)) + //문구블록
              AnsiChar($00) + //배경이미지
              AnsiChar($00) + //문구저장위치
              AnsiChar($61) + //AnsiChar(StrToInt('$' + edttt.Text)) + //폰트크기
              AnsiChar($00) + //화면분할위치
              AnsiChar($00) + //완성형
              AnsiChar($80) + //분할화면효과없음
              AnsiChar($01) + //메인화면효과
              AnsiChar(StrToInt('$' + sSpeed)) + //속도
              AnsiChar(StrToInt('$' + sTime)) + //정지시간
              AnsiChar($00);  //문구수직위치
    sSend:= MakeDSPData(AnsiChar($53), sEffect, sColor1 + sColor2, sDsp1 + sDsp2);

    for i := 1 to 3 do
    begin
      if TClientSocket(FindComponent('csOutDsp' + IntToStr(i))).Active then
        TClientSocket(FindComponent('csOutDsp' + IntToStr(i))).Socket.SendText(sSend);
    end;
  except
    on E: Exception do ExceptLogging('TfrmMain.tOutDspTimer: ' + E.Message);
  end;
end;

procedure TfrmMain.T_ProcClear;
begin
  with T_Proc do
  begin
    bHuilProc  := False;
    bWEProc    := False;
    sWESTTime  := '';
    nDayMax    := 0;
    nTotMax    := 0;
    nNormalCnt := 0;
    nHolidayCnt:= 0;
    nNowNDiv   := 1;
    nNowHDiv   := 1;
  end;
  nYogum:= 0;
  sChkDateTime:= '';
  sNextDateTime:= '';
end;

procedure TfrmMain.btnCloseClick(Sender: TObject);
begin
  Close;
end;

function TfrmMain.chkHoliday(sDate: aString): Boolean; //휴일: True, 평일
begin
  with dmTables.qryHoliday do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * from Holiday where ParkNo = :N1 and HDate = :N2');
    Parameters.ParamByName('N1').Value:= 1;
    Parameters.ParamByName('N2').Value:= sDate;
    Open;
    if RecordCount > 0 then Result:= True
    else                    Result:= False;
  end;
end;

procedure TfrmMain.sgIODblClickCell(Sender: TObject; ARow, ACol: Integer);
var
  sIn, sLocalFile, sTime, sDir: aString;
  nNo: Byte;
begin
  if ARow > 0 then
  begin
    nGridCheck:= 1;
    nModRow:= ARow;

    if (MG_StrTrim(sgIO.Cells[2, ARow], ' ') = '입차') then
    begin
      sOrgCarNo:= MG_StrTrim(sgIO.Cells[0, ARow], ' ');
      sOrgDate:= Copy(sgIO.Cells[1, ARow], 1, 10);
      sOrgTime:= Copy(sgIO.Cells[1, ARow], 12, 8);
      edtMCarNo.Text:= sOrgCarNo;

      with dmTables.qryTemp do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select * from IONdata where ParkNo = :N1 and ');
        SQL.Add('((InCarNo1 = :N2) or (InCarNo2 = :N3)) and ProcDate = :N4 and ProcTime = :N5');
        Parameters.ParamByName('N1').Value:= nCurrParkNo;
        Parameters.ParamByName('N2').Value:= sOrgCarNo;
        Parameters.ParamByName('N3').Value:= sOrgCarNo;
        Parameters.ParamByName('N4').Value:= sOrgDate;
        Parameters.ParamByName('N5').Value:= sOrgTime;
        Open;

        if RecordCount > 0 then
        begin
          nNo:= FieldByName('UnitNo').AsInteger;

          if FieldByName('InRecog1').AsInteger = 1 then
          begin
            sOrgFile:= FieldByName('InImage1').AsString;
            sTime:= Copy(sOrgFile, Pos('_', sOrgFile)+1, 14);
          end
          else
          if FieldByName('InRecog2').AsInteger = 1 then
          begin
            sOrgFile:= FieldByName('InImage2').AsString;
            sTime:= Copy(sOrgFile, Pos('_', sOrgFile)+1, 14);
          end
          else
          begin
            sOrgFile:= FieldByName('InImage1').AsString;
            sTime:= Copy(sOrgFile, Pos('_', sOrgFile)+1, 14);
          end;
        end
        else
          sOrgFile:= '';
      end;

      sDir:= sImageDir + '\' + Copy(sTime, 1, 4) + '\' + Copy(sTime, 5, 2) + '\' +
             Copy(sTime, 7, 2) + '\' + IntToStr(nNo);

      if not DirectoryExists(sDir) then
      begin
        if not ForceDirectories(sDir) then
          ExceptLogging('이미지저장폴더 생성실패: ' + sDir);
      end;
      sLocalFile:= sDir + '\' + Copy(sOrgFile, Pos('CH', sOrgFile), Length(sOrgFile)-(Pos('CH', sOrgFile)-1));

      if FileExists(sLocalFile) then
      begin
        imgModify.Picture.LoadFromFile(sLocalFile)
      end
      else
      begin
        try
          if DownloadFileHTTP(wString(sOrgFile), wString(sLocalFile)) then
          begin
            imgModify.Picture.LoadFromFile(sLocalFile)
          end
          else
          begin
            imgModify.Picture.Assign(Nil);
            ExceptLogging('File Down 실패: ' + sOrgFile);
          end;
        except
         on E: Exception do ExceptLogging('TfrmMain.sgIODblClickCell_FileDownload: ' + aString(E.Message));
        end;
      end;
      pnModify.Visible:= True;
      edtMCarNo.SetFocus;
      edtMCarNo.SelectAll;
    end
    else
      ShowMessage('차량번호인식으로 입차한 차량번호만 수정이 가능합니다.');
  end;
end;

procedure TfrmMain.sgOutDblClickCell(Sender: TObject; ARow, ACol: Integer);
var
  sIn, sLocalFile, sTime, sDir: aString;
  nNo: Byte;
begin
  if ARow > 0 then
  begin
    nGridCheck:= 2;
    nModRow:= ARow;

    sOrgCarNo:= MG_StrTrim(sgOut.Cells[0, ARow], ' ');
    sOrgDate:= Copy(sgOut.Cells[1, ARow], 1, 10);
    sOrgTime:= Copy(sgOut.Cells[1, ARow], 12, 8);
    edtMCarNo.Text:= sOrgCarNo;

    with dmTables.qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from IONdata where ParkNo = :N1 and ProcDate = :N2 and ProcTime = :N3 ');
      SQL.Add('and ((InCarNo1 = :N4) or (InCarNo2 = :N5))');
      Parameters.ParamByName('N1').Value:= nCurrParkNo;
      Parameters.ParamByName('N2').Value:= sOrgDate;
      Parameters.ParamByName('N3').Value:= sOrgTime;
      Parameters.ParamByName('N4').Value:= sOrgCarNo;
      Parameters.ParamByName('N5').Value:= sOrgCarNo;
      Open;

      if RecordCount > 0 then
      begin
        nNo:= FieldByName('UnitNo').AsInteger;

        if FieldByName('InRecog1').AsInteger = 1 then
        begin
          sOrgFile:= FieldByName('InImage1').AsString;
          sTime:= Copy(sOrgFile, Pos('_', sOrgFile)+1, 14);
        end
        else
        if FieldByName('InRecog2').AsInteger = 1 then
        begin
          sOrgFile:= FieldByName('InImage2').AsString;
          sTime:= Copy(sOrgFile, Pos('_', sOrgFile)+1, 14);
        end
        else
        begin
          sOrgFile:= FieldByName('InImage1').AsString;
          sTime:= Copy(sOrgFile, Pos('_', sOrgFile)+1, 14);
        end;
      end
      else
        sOrgFile:= '';
    end;

    sDir:= sImageDir + '\' + Copy(sTime, 1, 4) + '\' + Copy(sTime, 5, 2) + '\' +
           Copy(sTime, 7, 2) + '\' + IntToStr(nNo);

    if not DirectoryExists(sDir) then
    begin
      if not ForceDirectories(sDir) then
        ExceptLogging('이미지저장폴더 생성실패: ' + sDir);
    end;
    sLocalFile:= sDir + '\' + Copy(sOrgFile, Pos('CH', sOrgFile), Length(sOrgFile)-(Pos('CH', sOrgFile)-1));

    if FileExists(sLocalFile) then
    begin
      imgModify.Picture.LoadFromFile(sLocalFile)
    end
    else
    begin
      try
        if DownloadFileHTTP(wString(sOrgFile), wString(sLocalFile)) then
        begin
          imgModify.Picture.LoadFromFile(sLocalFile)
        end
        else
        begin
          imgModify.Picture.Assign(Nil);
          ExceptLogging('File Down 실패: ' + sOrgFile);
        end;
      except
       on E: Exception do ExceptLogging('TfrmMain.sgOutDblClickCell_FileDownload: ' + aString(E.Message));
      end;
    end;
    pnModify.Visible:= True;
    edtMCarNo.SetFocus;
    edtMCarNo.SelectAll;
  end;
end;

procedure TfrmMain.cmbFeeItemChange(Sender: TObject);
begin
  if cmbFeeItem.ItemIndex <> 0 then
  begin
    with dmTables.qryFeeItem do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from FeeItem where ParkNo = :N1 and FeeNo = :N2');
      Parameters.ParamByName('N1').Value:= nCurrParkNo;
      Parameters.ParamByName('N2').Value:= StrToInt(Copy(cmbFeeItem.Text, 1, Pos(':', cmbFeeItem.Text)-1));
      Open;

      if RecordCount > 0 then
      begin
        nFeeNo:= StrToInt(Copy(cmbFeeItem.Text, 1, Pos(':', cmbFeeItem.Text)-1));
        nItemMax:= FieldByName('ItemMax').AsInteger;
        nTotMax:= FieldByName('TotMax').AsInteger;
      end
      else
      begin
        nFeeNo:= 0;
        nItemMax:= 0;
        nTotMax:= 0;
      end;
    end;
  end
  else
  begin
    nFeeNo:= 0;
    nItemMax:= 0;
  end;
  nTotYogum:= FeeCalc(nCurrParkNo, nFeeNo, PAnsiChar(sFeeCalcInDateTime), PAnsiChar(sFeeCalcOutDateTime));

  edtTotYogum.Text:= IntToStr(nTotYogum);
  edtTotYogum.AutoThousandSeparator:= True;
  edtProcYogum.Text:= IntToStr(nTotYogum);
  edtProcYogum.AutoThousandSeparator:= True;
  pnlTot.Text:= edtTotYogum.Text + '원';
  pnlFee.Caption:= edtTotYogum.Text + '원';
  pnlDC.Text:= edtDCYogum.Text + '원';
  pnYogum.Visible:= True;
  pnN.Visible:= True;
  pnInit.Visible:= False;
end;

procedure TfrmMain.csInLpr1Read(Sender: TObject; Socket: TCustomWinSocket);
var
  sRecv, sDspIP: aString;
  i: Byte;
begin
  sRecv:= Socket.ReceiveText;
  sInLPRRecv1:= sRecv;
  ExceptLogging('LPR' + IntToStr(csInLpr1.Tag) + ' Recv: ' + sInLPRRecv1);

  if Length(sInLprRecv1) > 15 then
  begin
    for i := 1 to 10 do
    begin
      if RLpr[i].nUnitNo = csInLpr1.Tag then
      begin
        sDspIP:= RLpr[i].sDspIP;
        Break;
      end;
    end;
    LprDataProc(csInLpr1.Tag, sInLprRecv1, csInLpr1.Host, sDspIP);
  end;
  sInLPRRecv1:= '';
end;

procedure TfrmMain.csInLpr2Read(Sender: TObject; Socket: TCustomWinSocket);
var
  sRecv, sDspIP: aString;
  i: Byte;
begin
  sRecv:= Socket.ReceiveText;
  sInLPRRecv2:= sRecv;
  ExceptLogging('LPR' + IntToStr(csInLpr2.Tag) + ' Recv: ' + sInLPRRecv2);

  if Length(sInLPRRecv2) > 15 then
  begin
    for i := 1 to 10 do
    begin
      if RLpr[i].nUnitNo = csInLpr2.Tag then
      begin
        sDspIP:= RLpr[i].sDspIP;
        Break;
      end;
    end;

    LprDataProc(csInLpr2.Tag, sInLPRRecv2, csInLpr2.Host, sDspIP);
  end;
  sInLPRRecv2:= '';
end;

procedure TfrmMain.csInLpr3Read(Sender: TObject; Socket: TCustomWinSocket);
var
  sRecv, sDspIP: aString;
  i: Byte;
begin
  sRecv:= Socket.ReceiveText;
  sInLPRRecv3:= sRecv;
  ExceptLogging('LPR' + IntToStr(csInLpr3.Tag) + ' Recv: ' + sInLPRRecv3);

  if Length(sInLPRRecv3) > 15 then
  begin
    for i := 1 to 10 do
    begin
      if RLpr[i].nUnitNo = csInLpr3.Tag then
      begin
        sDspIP:= RLpr[i].sDspIP;
        Break;
      end;
    end;

    LprDataProc(csInLpr3.Tag, sInLPRRecv3, csInLpr3.Host, sDspIP);
  end;
  sInLPRRecv3:= '';
end;

procedure TfrmMain.csOutLpr1Read(Sender: TObject; Socket: TCustomWinSocket);
var
  sRecv, sDspIP: aString;
  i: Byte;
begin
  sRecv:= Socket.ReceiveText;
  sOutLPRRecv1:= sRecv;
  ExceptLogging('LPR' + IntToStr(csOutLpr1.Tag) + ' Recv: ' + sOutLPRRecv1);

  if Length(sOutLprRecv1) > 15 then
  begin
    for i := 1 to 10 do
    begin
      if RLpr[i].nUnitNo = csOutLpr1.Tag then
      begin
        sDspIP:= RLpr[i].sDspIP;
        Break;
      end;
    end;

    LprDataProc(csOutLpr1.Tag, sOutLprRecv1, csOutLpr1.Host, sDspIP);
  end;
  sOutLprRecv1:= '';
end;

procedure TfrmMain.csOutLpr2Read(Sender: TObject; Socket: TCustomWinSocket);
var
  sRecv, sDspIP: aString;
  i: Byte;
begin
  sRecv:= Socket.ReceiveText;
  sOutLPRRecv2:= sRecv;
  ExceptLogging('LPR' + IntToStr(csOutLpr2.Tag) + ' Recv: ' + sOutLPRRecv2);

  if Length(sOutLPRRecv2) > 15 then
  begin
    for i := 1 to 10 do
    begin
      if RLpr[i].nUnitNo = csOutLpr2.Tag then
      begin
        sDspIP:= RLpr[i].sDspIP;
        Break;
      end;
    end;

    LprDataProc(csOutLpr2.Tag, sOutLPRRecv2, csOutLpr2.Host, sDspIP);
  end;
  sOutLPRRecv2:= '';
end;

procedure TfrmMain.csOutLpr3Read(Sender: TObject; Socket: TCustomWinSocket);
var
  sRecv, sDspIP: aString;
  i: Byte;
begin
  sRecv:= Socket.ReceiveText;
  sOutLPRRecv3:= sRecv;
  ExceptLogging('LPR' + IntToStr(csOutLpr3.Tag) + ' Recv: ' + sOutLPRRecv3);

  if Length(sOutLPRRecv3) > 15 then
  begin
    for i := 1 to 10 do
    begin
      if RLpr[i].nUnitNo = csOutLpr3.Tag then
      begin
        sDspIP:= RLpr[i].sDspIP;
        Break;
      end;
    end;

    LprDataProc(csOutLpr3.Tag, sOutLPRRecv3, csOutLpr3.Host, sDspIP);
  end;
  sOutLPRRecv3:= '';
end;

procedure TfrmMain.ClearGTime;
begin
  with GTime do
  begin
    GT1:= '00:00';
    GT2:= '00:00';
    GT3:= '00:00';
    GT4:= '23:59';
    GT5:= '00:00';
    GT6:= '00:00';
    GT7:= '23:59';
    GT8:= '00:00';
    GT9:= 0;
  end;
end;

procedure TfrmMain.ClearDCProc;
var
  i: Integer;
begin
  for i:= 1 to 50 do
  begin
    with DCProc[i] do
    begin
      nDCNo:= 0;
      sDCName:= '';
      nDCAmt:= 0;
      nRealDCAmt:= 0;
      nDCType:= 0;
      nTime:= 0;
      sDCTKNo:= '';
      sDCTKIssueDate:= '';
      sDCTKIssueTime:= '';
    end;
  end;
end;

procedure TfrmMain.ClearFormData;
var
  sSend: String;
begin
  bMiProc:= False;
  bLostProc:= False;
  bManualOut:= False;
  sNowLprFile1 := '';
  sNowLprCarNo1:= '';
  sNowLprFile2 := '';
  sNowLprCarNo2:= '';
  sNowIOTime   := '';
  nNowLprNo    := 0;
  nNowLprInOut := 0;
  nNowLprRecog1:= 0;
  nNowLprRecog2:= 0;
  sNowInTKNo   := '';
  nNowInUnitNo := 0;
  sNowInDate   := '';
  sNowInTime   := '';
  sNowInCarNo  := '';
  sNowOutDate  := '';
  sNowOutTime  := '';
  sManualTKNo  := '';
  sManualInTime:= '';
  sFeeCalcInDateTime := '';
  sFeeCalcOutDateTime:= '';
  sLostInCarNo:= '';
  sLostInDate:= '';
  sLostInTime:= '';
  sLostInFile:= '';
  sLostInTKNo:= '';
  nLostInUnitNo:= 0;

  dmTables.qryLost.Close;
  edtNo.Text:= '';
  edtInDate.Text:= '';
  edtTotYogum.Text:= '0';
  edtProcYogum.Text:= '0';
  edtDCYogum.Text:= '0';
  pnlPTime.Text:= '';
  pnlPTime.Hint:= '';
  pnlTot.Text:= '0원';
  pnlDC.Text:= '0원';
  pnlDC.Hint:= '';
  pnlFee.Caption:= '0원';
  pnlFee.Hint:= '';
  pnlDCList.Text:= '';
  btnProc.Enabled:= False;
  btnCancel.Enabled:= False;
  //btnLost.Enabled:= True;
  btnInOpen  .Enabled:= True;
  btnInClose .Enabled:= True;
  btnOutOpen .Enabled:= True;
  btnOutClose.Enabled:= True;
  mnuInOpen  .Enabled:= True;
  mnuInClose .Enabled:= True;
  mnuOutOpen .Enabled:= True;
  mnuOutClose.Enabled:= True;
  btnClose.Enabled:= True;

  btnReceipt .Visible:= True;
  btnLostProc.Enabled:= False;
  btnDCClear .Enabled:= False;
  btnLost.Enabled:= False;
  Timer1.Enabled:= True;

  if sPrtData = '' then
  begin
    btnReceipt.Enabled:= False;
    mnuReceipt.Enabled:= False;
  end
  else
  begin
    btnReceipt.Enabled:= True;
    mnuReceipt.Enabled:= True;
  end;

  sProcTime:= '';
  sDCProcNo:= '0';
  sDCOutTime:= '';
  sPrtOutTime:= '';
  nParkingMin:= 0;
  nProcYogum:= 0;
  nDCYogum:= 0;
  pnInit.Visible:= True;
  pnYogum.Visible:= False;
  pnVan.Enabled:= False;
  pnVan.Visible:= False;
  pnN.Visible:= True;
  pnLost.Visible:= False;
  pnLostImage.Visible:= False;
  ClearGTime;
  ClearDCProc;
  nDCCnt:= 0;
  bLostProc:= False;
  pnlReceipt.Visible:= False;
  pnDCBtn.Enabled:= True;
  pnDCBtn.Visible:= False;
  sp2.Visible:= True;
  nTKType:= 1;
  nCarType:= 1;

  DCEnable(False);
  pnInit.Visible:= True;
  pnYogum.Visible:= False;
  pnInit.Left:= pnYogum.Left;
  pnInit.Top := pnYogum.Top;
  pnInit.DoubleBuffered:= True;
  pnlNow.DoubleBuffered:= True;
  imgNIn.Picture.Graphic:= Nil;
  imgNOut.Picture.Graphic:= Nil;
end;

procedure TfrmMain.dcBtnClick(dcBtn: TsPanel);
var
  nTimeDC,  //시간할인시 할인된 금액.
  nPerDC, nJulsa, nReturnFee: Integer;  //퍼센트할인시 할인된 금액.
  sName: String;
  i: Byte;
begin
  try
    if nProcYogum > 0 then
    begin
      if sDCProcNo = '0' then sDCProcNo:= IntToStr(GetTickCount);

      sName:= TMenuItem(FindComponent('mnuDC' + Copy(dcBtn.Name, 6, Length(dcBtn.Name)-5))).Caption;

      {//할인키별 적용가능횟수 처리하자.
      TMenuItem(FindComponent('mnuDC' + Copy(dcBtn.Name, 6, Length(dcBtn.Name)-5))).Enabled:= False;
      dcBtn.Enabled:= False;
      }

      Case dcBtn.HelpContext of
        0: begin //금액할인.
             nDCCnt:= nDCCnt + 1;

             if nProcYogum >= StrToInt(dcBtn.Hint) then
             begin
               nProcYogum:= nProcYogum - StrToInt(dcBtn.Hint);

               //10원 단위 절사한다.
               nJulsa:= nProcYogum mod 100;
               nProcYogum:= nProcYogum - nJulsa;
               nDCYogum:= nDCYogum + StrToInt(dcBtn.Hint);
               nDCYogum:= nDCYogum + nJulsa;
               edtProcYogum.Text:= IntToStr(nProcYogum);
               edtProcYogum.AutoThousandSeparator:= True;
               edtDCYogum.Text:= IntToStr(nDCYogum);
               edtDCYogum.AutoThousandSeparator:= True;
               pnlFee.Caption:= edtProcYogum.Text + '원';
               pnlDC.Text:= edtDCYogum.Text + '원';

               with DCProc[nDCCnt] do
               begin
                 nDCNo:= dcBtn.Tag;
                 sDCName:= sName;
                 nDCAmt:= StrToInt(dcBtn.Hint);
                 nRealDCAmt:= StrToInt(dcBtn.Hint);
                 nDCType:= 0;
               end;
             end
             else
             begin
               nDCYogum:= nDCYogum + nProcYogum;
               edtProcYogum.Text:= '0';
               edtDCYogum.Text:= IntToStr(nDCYogum);
               pnlFee.Caption:= '0 ';
               pnlDC.Text:= edtDCYogum.Text + '원';

               with DCProc[nDCCnt] do
               begin
                 nDCNo:= dcBtn.Tag;
                 sDCName:= sName;
                 nDCAmt:= StrToInt(dcBtn.Hint);
                 nRealDCAmt:= nProcYogum;
                 nDCType:= 0;
               end;
               nProcYogum:= 0;
             end;
           end;

        1: begin //시간할인.
             nDCCnt:= nDCCnt + 1;
             sDCOutTime:= MG_AddTime(sDCOutTime, 0, - StrToInt(dcBtn.Hint), 0, 0);
             nReturnFee:= ReturnFee(nCurrParkNo, nFeeNo, PAnsiChar(Copy(sDCOutTime, 1, 16)),
                                    PAnsiChar(sNowOutDate + ' ' + Copy(sNowOutTime, 1, 5)));
             nTimeDC:= nReturnFee;

             if nProcYogum >= nTimeDC then
             begin
               nProcYogum:= nProcYogum - nTimeDC;

               //10원 단위 절사한다.
               nJulsa:= nProcYogum mod 100;
               nProcYogum:= nProcYogum - nJulsa;
               nDCYogum:= nDCYogum + nTimeDC;
               nDCYogum:= nDCYogum + nJulsa;
               edtProcYogum.Text:= IntToStr(nProcYogum);
               edtProcYogum.AutoThousandSeparator:= True;
               edtDCYogum.Text:= IntToStr(nDCYogum);
               edtDCYogum.AutoThousandSeparator:= True;
               pnlFee.Caption:= edtProcYogum.Text + '원';
               pnlDC.Text:= edtDCYogum.Text + '원';

               with DCProc[nDCCnt] do
               begin
                 nDCNo:= dcBtn.Tag;
                 sDCName:= sName;
                 nDCAmt:= nTimeDC;
                 nRealDCAmt:= nTimeDC;
                 nDCType:= 1;
               end;
             end
             else
             begin
               nDCYogum:= nDCYogum + nTimeDC;
               edtProcYogum.Text:= '0';
               edtDCYogum.Text:= IntToStr(nDCYogum);
               pnlFee.Caption:= '0원';
               pnlDC.Text:= edtDCYogum.Text + '원';

               with DCProc[nDCCnt] do
               begin
                 nDCNo:= dcBtn.Tag;
                 sDCName:= sName;
                 nDCAmt:= nTimeDC;
                 nRealDCAmt:= nProcYogum;
                 nDCType:= 1;
               end;
               nProcYogum:= 0;
             end;
           end;

        2: begin //퍼센트할인.
             nDCCnt:= nDCCnt + 1;
             nPerDC:= (nProcYogum * StrToInt(dcBtn.Hint)) div 100;

             if nProcYogum >= nPerDC then
             begin
               nProcYogum:= nProcYogum - nPerDC;

               //10원 단위 절사한다.
               nJulsa:= nProcYogum mod 100;
               nProcYogum:= nProcYogum - nJulsa;
               nDCYogum:= nDCYogum + nPerDC;
               nDCYogum:= nDCYogum + nJulsa;
               edtProcYogum.Text:= IntToStr(nProcYogum);
               edtProcYogum.AutoThousandSeparator:= True;
               edtDCYogum.Text:= IntToStr(nDCYogum);
               edtDCYogum.AutoThousandSeparator:= True;
               pnlFee.Caption:= edtProcYogum.Text + '원';
               pnlDC.Text:= edtDCYogum.Text + '원';

               with DCProc[nDCCnt] do
               begin
                 nDCNo:= dcBtn.Tag;
                 sDCName:= sName;
                 nDCAmt:= nPerDC;
                 nRealDCAmt:= nPerDC;
                 nDCType:= 2;
               end;
             end
             else
             begin
               nDCYogum:= nDCYogum + nPerDC;
               edtProcYogum.Text:= '0';
               edtDCYogum.Text:= IntToStr(nDCYogum);
               pnlFee.Caption:= '0원';
               pnlDC.Text:= edtDCYogum.Text + '원';

               with DCProc[nDCCnt] do
               begin
                 nDCNo:= dcBtn.Tag;
                 sDCName:= sName;
                 nDCAmt:= nPerDC;
                 nRealDCAmt:= nProcYogum;
                 nDCType:= 2;
               end;
               nProcYogum:= 0;
             end;
           end;
      end;

      if nDCCnt = 20 then
      begin
        dcBtn.Enabled:= False;
        //mnuDCProc.Enabled:= False;
      end;
      btnDCClear.Enabled:= True;


      if pnlDCList.Text = '' then
      begin
        pnlDCList.Text:= sName;
      end
      else
      begin
        pnlDCList.Text:= pnlDCList.Text + ', ' + sName;
      end;
    end
    else
    begin
      for i:= 1 to 20 do
        TMenuItem(FindComponent('mnuDC' + IntToStr(i))).Enabled:= False;
      pnDCBtn.Enabled:= False;
    end;
  except
    on E: Exception do ExceptLogging('TfrmMain.dcBtnClick: ' + aString(E.Message));
  end;
end;

function TfrmMain.RecvLprProc(sLprFile1, sLprCarNo1, sLprFile2, sLprCarNo2, sIOTime: aString;
                              nLprNo, nLprInOut, nLprRecog1, nLprRecog2: Byte; sDspIP: aString): String;
var
  sRecv, sSend, sName: aString;
  nSTXPos, nETXPos, nParkNo, nUnitNo: Integer;

  sCardNo, sLastUseTime, sSTime, sETime, sCarNo, sMarkNo, sGroupName, sSCInDate,
  sSCInTime, sCompName, sDeptName, sExpDateF, sExpDateT, sLprDate, sLprTime: aString;
  nInOut, nStatus, nAPB, nWP, nSYoil, nEYoil, nCarNo, nGroupNo: Integer;
  nLastUnitNo: Byte;
  nIBCRC: Word;
  bHoliday: Boolean;
  nUseFlag, nLastStatus: Byte;
begin
  try
    //정기차량 처리....
    Result:= '^^^^';
    nParkNo:= nCurrParkNo;
    nUnitNo:= nLprNo;
    nInOut := nLprInOut;
    nCarNo := 0;
    nLastUnitNo:= 0;
    sCardNo:= '';
    sMarkNo:= '';
    bHoliday:= False;
    sLprDate:= Copy(sIOTime, 1, 10);
    sLprTime:= Copy(sIOTime, 12, 8);

    with dmTables.qryRecvLpr1 do
    begin
      Close;
      SQL.Clear;

      if sLprCarNo2 <> '' then
      begin
        SQL.Add('Select * from CustInfo where (CarNo = :N1) or (CarNo = :N2)');
        Parameters.ParamByName('N1').Value:= sLprCarNo1;
        Parameters.ParamByName('N2').Value:= sLprCarNo2;
      end
      else
      begin
        SQL.Add('Select * from CustInfo where CarNo = :N1');
        Parameters.ParamByName('N1').Value:= sLprCarNo1;
      end;
      Open;

      if RecordCount > 0 then
      begin
        sCardNo:= FieldByName('TKNo').AsString;
        sMarkNo:= FieldByName('MarkNo').AsString;
        nStatus:= FieldByName('Status').AsInteger;
        nAPB   := FieldByName('APB'   ).AsInteger;
        nLastStatus:= FieldByname('IOStatusNo').AsInteger;
        sLastUseTime:= FieldByName('LastUseDate').AsString + ' ' +
                       FieldByName('LastUseTime').AsString;
        nWp    := FieldByName('WPNo').AsInteger;
        nGroupNo:= FieldByName('GroupNo').AsInteger;
        sName:= FieldByName('Name').AsString;
        nLastUnitNo:= FieldByName('LastUnitNo').AsInteger;
        sCompName:= FieldByName('CompName').AsString;
        sDeptName:= FieldByName('DeptName').AsString;
        sExpDateF:= FieldByName('ExpDateF').AsString;
        sExpDateT:= FieldByName('ExpDateT').AsString;
        sCarNo:= FieldByName('CarNo').AsString;

        Result:= sCarNo + '^' + sName + '^' + sCompName + '^' + sExpDateT + '까지^';
      end;
    end;

    with dmTables do
    begin
      nSYoil:= 1;
      nEYoil:= 7;
      sSTime:= '00:00';
      sETime:= '23:59';

      with qryRecvLpr2 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select * from GGroup where ParkNo = :N1 and GroupNo = :N2');
        Parameters.ParamByName('N1').Value:= nCurrParkNo;
        Parameters.ParamByName('N2').Value:= nGroupNo;
        Open;

        if RecordCount > 0 then
        begin
          sGroupName:= FieldByName('GroupName').AsString;
          nGroupType:= FieldByName('GroupType').AsInteger;
          nUseFeeItem:= FieldByName('UseFeeItem').AsInteger;
        end;
      end;

      //현재 사용기간내에 있으면...
      if (sExpDateF <= FormatDateTime('YYYY-MM-DD', Now)) and
         (sExpDateT >= FormatDateTime('YYYY-MM-DD', Now)) then
      begin
        //입출구 구분(입구용:1, 출구용:2)
        if nInOut = 1 then
        begin
          if ((nSYoil <= DayOfWeek(Now)) and (nEYoil >= DayOfWeek(Now)) and
             (sSTime <= FormatDateTime('HH:NN', Now)) and (sETime >= FormatDateTime('HH:NN', Now))) then
          begin
            //상태(발매:0, 사용중:1, 전체봉쇄:3, 입차봉쇄:4, 출차봉쇄:5)
            Case nStatus of
              0  : begin  //발매
                     with qryRecvLpr2 do
                     begin
                       Close;
                       SQL.Clear;
                       SQL.Add('Update CustInfo Set LastParkNo = :N1, LastUnitNo = :N2, ');
                       SQL.Add('LastUseDate = :N3, LastUseTime = :N4, IOStatusNo = :N5, Status = :N6 ');

                       //APB가 "1회조정(2)" 이면 APB를 "자동(1)"으로 변경한다.
                       if nAPB = 2 then
                         SQL.Add(', APB = :N10 ');

                       SQL.Add('where ParkNo = :N7 and TKType = :N8 and CarNo = :N9');
                       Parameters.ParamByName('N1').Value:= nCurrParkNo;
                       Parameters.ParamByName('N2').Value:= nUnitNo;
                       Parameters.ParamByName('N3').Value:= sLprDate;
                       Parameters.ParamByName('N4').Value:= sLprTime;
                       Parameters.ParamByName('N5').Value:= 1;
                       Parameters.ParamByName('N6').Value:= 1;
                       Parameters.ParamByName('N7').Value:= nCurrParkNo;
                       Parameters.ParamByName('N8').Value:= 2;
                       Parameters.ParamByName('N9').Value:= sCarNo;

                       if nAPB = 2 then
                         Parameters.ParamByName('N10').Value:= 1;
                       ExecSQL;

                       Close;
                       SQL.Clear;
                       SQL.Add('Insert Into IOSData (ParkNo, UnitNo, ProcDate, ProcTime, TKType, ');
                       SQL.Add('CarType, GroupNo, GroupName, CompName, DeptName, Name, InCarNo1, ');
                       SQL.Add('InIOStatusNo, InImage1, InCarNo2, InImage2, TKNo) ');
                       SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, ');
                       SQL.Add(':N12, :N13, :N14, :N15, :N16, :N17)');
                       Parameters.ParamByName('N1' ).Value:= nParkNo;
                       Parameters.ParamByName('N2' ).Value:= nUnitNo;
                       Parameters.ParamByName('N3' ).Value:= sLprDate;
                       Parameters.ParamByName('N4' ).Value:= sLprTime;
                       Parameters.ParamByName('N5' ).Value:= 2;
                       Parameters.ParamByName('N6' ).Value:= 2;
                       Parameters.ParamByName('N7' ).Value:= nGroupNo;
                       Parameters.ParamByName('N8' ).Value:= sGroupName;
                       Parameters.ParamByName('N9' ).Value:= sCompName;
                       Parameters.ParamByName('N10').Value:= sDeptName;
                       Parameters.ParamByName('N11').Value:= sName;
                       Parameters.ParamByName('N12').Value:= sLprCarNo1;
                       Parameters.ParamByName('N13').Value:= 1;
                       Parameters.ParamByName('N14').Value:= sLprFile1;
                       Parameters.ParamByName('N15').Value:= sLprCarNo2;
                       Parameters.ParamByName('N16').Value:= sLprFile2;
                       Parameters.ParamByName('N17').Value:= sCardNo;
                       ExecSQL;
                     end;
                     DspProc(1, 1, '정기등록차량' + MG_Left(sCarNo, 12), sDspIP);
                     InOpen;
                     Result:= '1' + Result + '입차';
                   end;

              1,5: begin //정상, 출차봉쇄
                     if nAPB = 1 then  //자동
                     begin
                       if (nLastStatus = 1) or (nLastStatus = 8) then //주차장, APB위반 입차거부
                       begin
                         with qryRecvLpr2 do
                         begin
                           Close;
                           SQL.Clear;
                           SQL.Add('Update CustInfo Set LastParkNo = :N1, LastUnitNo = :N2, ');
                           SQL.Add('LastUseDate = :N3, LastUseTime = :N4, IOStatusNo = :N5 ');
                           SQL.Add('where ParkNo = :N6 and TKType = :N7 and CarNo = :N8');
                           Parameters.ParamByName('N1').Value:= nParkNo;
                           Parameters.ParamByName('N2').Value:= nUnitNo;
                           Parameters.ParamByName('N3').Value:= sLprDate;
                           Parameters.ParamByName('N4').Value:= sLprTime;
                           Parameters.ParamByName('N5').Value:= 9;
                           Parameters.ParamByName('N6').Value:= nParkNo;
                           Parameters.ParamByName('N7').Value:= 2;
                           Parameters.ParamByName('N8').Value:= sCarNo;
                           ExecSQL;

                           Close;
                           SQL.Clear;
                           SQL.Add('Insert Into IOSData (ParkNo, UnitNo, ProcDate, ProcTime, TKType, ');
                           SQL.Add('CarType, GroupNo, GroupName, CompName, DeptName, Name, InCarNo1, ');
                           SQL.Add('InIOStatusNo, InImage1, InCarNo2, InImage2, TKNo) ');
                           SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, :N12, ');
                           SQL.Add(':N13, :N14, :N15, :N16, :N17)');
                           Parameters.ParamByName('N1' ).Value:= nParkNo;
                           Parameters.ParamByName('N2' ).Value:= nUnitNo;
                           Parameters.ParamByName('N3' ).Value:= sLprDate;
                           Parameters.ParamByName('N4' ).Value:= sLprTime;
                           Parameters.ParamByName('N5' ).Value:= 2;
                           Parameters.ParamByName('N6' ).Value:= 2;
                           Parameters.ParamByName('N7' ).Value:= nGroupNo;
                           Parameters.ParamByName('N8' ).Value:= sGroupName;
                           Parameters.ParamByName('N9' ).Value:= sCompName;
                           Parameters.ParamByName('N10').Value:= sDeptName;
                           Parameters.ParamByName('N11').Value:= sName;
                           Parameters.ParamByName('N12').Value:= sLprCarNo1;
                           Parameters.ParamByName('N13').Value:= 7;
                           Parameters.ParamByName('N14').Value:= sLprFile1;
                           Parameters.ParamByName('N15').Value:= sLprCarNo2;
                           Parameters.ParamByName('N16').Value:= sLprFile2;
                           Parameters.ParamByName('N17').Value:= sCardNo;
                           ExecSQL;
                         end;
                         DspProc(1, 1, 'APB위반차량 ' + MG_Left(sCarNo, 12), sDspIP);
                         Result:= '1' + Result + 'APB위반';
                         ExceptLogging('##### APB 위반 차량 #####');
                       end
                       else
                       begin
                         //최종사용상태가 주차장 또는 APB위반 입차거부가 아니면 입차처리한다.
                         with qryRecvLpr2 do
                         begin
                           Close;
                           SQL.Clear;
                           SQL.Add('Update CustInfo Set LastParkNo = :N1, LastUnitNo = :N2, ');
                           SQL.Add('LastUseDate = :N3, LastUseTime = :N4, IOStatusNo = :N5, ');
                           SQL.Add('Status = :N6 where ParkNo = :N7 and TKType = :N8 and CarNo = :N9');
                           Parameters.ParamByName('N1').Value:= nParkNo;
                           Parameters.ParamByName('N2').Value:= nUnitNo;
                           Parameters.ParamByName('N3').Value:= sLprDate;
                           Parameters.ParamByName('N4').Value:= sLprTime;
                           Parameters.ParamByName('N5').Value:= 1;
                           Parameters.ParamByName('N6').Value:= 1;
                           Parameters.ParamByName('N7').Value:= nParkNo;
                           Parameters.ParamByName('N8').Value:= 2;
                           Parameters.ParamByName('N9').Value:= sCarNo;
                           ExecSQL;

                           Close;
                           SQL.Clear;
                           SQL.Add('Insert Into IOSData (ParkNo, UnitNo, ProcDate, ProcTime, TKType, ');
                           SQL.Add('CarType, GroupNo, GroupName, CompName, DeptName, Name, InCarNo1, ');
                           SQL.Add('InIOStatusNo, InImage1, InCarNo2, InImage2, TKNo) ');
                           SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, :N12, ');
                           SQL.Add(':N13, :N14, :N15, :N16, :N17)');
                           Parameters.ParamByName('N1' ).Value:= nParkNo;
                           Parameters.ParamByName('N2' ).Value:= nUnitNo;
                           Parameters.ParamByName('N3' ).Value:= sLprDate;
                           Parameters.ParamByName('N4' ).Value:= sLprTime;
                           Parameters.ParamByName('N5' ).Value:= 2;
                           Parameters.ParamByName('N6' ).Value:= 2;
                           Parameters.ParamByName('N7' ).Value:= nGroupNo;
                           Parameters.ParamByName('N8' ).Value:= sGroupName;
                           Parameters.ParamByName('N9' ).Value:= sCompName;
                           Parameters.ParamByName('N10').Value:= sDeptName;
                           Parameters.ParamByName('N11').Value:= sName;
                           Parameters.ParamByName('N12').Value:= sLprCarNo1;
                           Parameters.ParamByName('N13').Value:= 1;
                           Parameters.ParamByName('N14').Value:= sLprFile1;
                           Parameters.ParamByName('N15').Value:= sLprCarNo2;
                           Parameters.ParamByName('N16').Value:= sLprFile2;
                           Parameters.ParamByName('N17').Value:= sCardNo;
                           ExecSQL;
                         end;
                         DspProc(1, 1, '정기등록차량' + MG_Left(sCarNo, 12), sDspIP);
                         InOpen;
                         Result:= '1' + Result + '입차';
                       end;
                     end
                     else
                     if nAPB = 2 then
                     begin
                       //APB가 1회조정이면 APB를 자동으로 변경한다.
                       with qryRecvLpr2 do
                       begin
                         Close;
                         SQL.Clear;
                         SQL.Add('Update CustInfo Set LastParkNo = :N1, LastUnitNo = :N2, ');
                         SQL.Add('LastUseDate = :N3, LastUseTime = :N4, IOStatusNo = :N5, ');
                         SQL.Add('Status = :N6, APB = :N10 where ParkNo = :N7 and TKType = :N8 and CarNo = :N9');
                         Parameters.ParamByName('N1').Value:= nParkNo;
                         Parameters.ParamByName('N2').Value:= nUnitNo;
                         Parameters.ParamByName('N3').Value:= sLprDate;
                         Parameters.ParamByName('N4').Value:= sLprTime;
                         Parameters.ParamByName('N5').Value:= 1;
                         Parameters.ParamByName('N6').Value:= 1;
                         Parameters.ParamByName('N7').Value:= nParkNo;
                         Parameters.ParamByName('N8').Value:= 2;
                         Parameters.ParamByName('N9').Value:= sCarNo;
                         Parameters.ParamByName('N10').Value:= 1;
                         ExecSQL;

                         Close;
                         SQL.Clear;
                         SQL.Add('Insert Into IOSData (ParkNo, UnitNo, ProcDate, ProcTime, TKType, ');
                         SQL.Add('CarType, GroupNo, GroupName, CompName, DeptName, Name, InCarNo1, ');
                         SQL.Add('InIOStatusNo, InImage1, InCarNo2, InImage2, TKNo) ');
                         SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, :N12, ');
                         SQL.Add(':N13, :N14, :N15, :N16, :N17)');
                         Parameters.ParamByName('N1' ).Value:= nParkNo;
                         Parameters.ParamByName('N2' ).Value:= nUnitNo;
                         Parameters.ParamByName('N3' ).Value:= sLprDate;
                         Parameters.ParamByName('N4' ).Value:= sLprTime;
                         Parameters.ParamByName('N5' ).Value:= 2;
                         Parameters.ParamByName('N6' ).Value:= 2;
                         Parameters.ParamByName('N7' ).Value:= nGroupNo;
                         Parameters.ParamByName('N8' ).Value:= sGroupName;
                         Parameters.ParamByName('N9' ).Value:= sCompName;
                         Parameters.ParamByName('N10').Value:= sDeptName;
                         Parameters.ParamByName('N11').Value:= sName;
                         Parameters.ParamByName('N12').Value:= sLprCarNo1;
                         Parameters.ParamByName('N13').Value:= 1;
                         Parameters.ParamByName('N14').Value:= sLprFile1;
                         Parameters.ParamByName('N15').Value:= sLprCarNo2;
                         Parameters.ParamByName('N16').Value:= sLprFile2;
                         Parameters.ParamByName('N17').Value:= sCardNo;
                         ExecSQL;
                       end;
                       DspProc(1, 1, '정기등록차량' + MG_Left(sCarNo, 12), sDspIP);
                       InOpen;
                       Result:= '1' + Result + '입차';
                     end
                     else
                     if nAPB = 3 then
                     begin
                       //APB사용안함이면 입차처리한다.
                       with qryRecvLpr2 do
                       begin
                         Close;
                         SQL.Clear;
                         SQL.Add('Update CustInfo Set LastParkNo = :N1, LastUnitNo = :N2, ');
                         SQL.Add('LastUseDate = :N3, LastUseTime = :N4, IOStatusNo = :N5, ');
                         SQL.Add('Status = :N6 where ParkNo = :N7 and TKType = :N8 and CarNo = :N9');
                         Parameters.ParamByName('N1').Value:= nParkNo;
                         Parameters.ParamByName('N2').Value:= nUnitNo;
                         Parameters.ParamByName('N3').Value:= sLprDate;
                         Parameters.ParamByName('N4').Value:= sLprTime;
                         Parameters.ParamByName('N5').Value:= 1;
                         Parameters.ParamByName('N6').Value:= 1;
                         Parameters.ParamByName('N7').Value:= nParkNo;
                         Parameters.ParamByName('N8').Value:= 2;
                         Parameters.ParamByName('N9').Value:= sCarNo;
                         ExecSQL;

                         Close;
                         SQL.Clear;
                         SQL.Add('Insert Into IOSData (ParkNo, UnitNo, ProcDate, ProcTime, TKType, ');
                         SQL.Add('CarType, GroupNo, GroupName, CompName, DeptName, Name, InCarNo1, ');
                         SQL.Add('InIOStatusNo, InImage1, InCarNo2, InImage2, TKNo) ');
                         SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, :N12, ');
                         SQL.Add(':N13, :N14, :N15, :N16, :N17)');
                         Parameters.ParamByName('N1' ).Value:= nParkNo;
                         Parameters.ParamByName('N2' ).Value:= nUnitNo;
                         Parameters.ParamByName('N3' ).Value:= sLprDate;
                         Parameters.ParamByName('N4' ).Value:= sLprTime;
                         Parameters.ParamByName('N5' ).Value:= 2;
                         Parameters.ParamByName('N6' ).Value:= 2;
                         Parameters.ParamByName('N7' ).Value:= nGroupNo;
                         Parameters.ParamByName('N8' ).Value:= sGroupName;
                         Parameters.ParamByName('N9' ).Value:= sCompName;
                         Parameters.ParamByName('N10').Value:= sDeptName;
                         Parameters.ParamByName('N11').Value:= sName;
                         Parameters.ParamByName('N12').Value:= sLprCarNo1;
                         Parameters.ParamByName('N13').Value:= 1;
                         Parameters.ParamByName('N14').Value:= sLprFile1;
                         Parameters.ParamByName('N15').Value:= sLprCarNo2;
                         Parameters.ParamByName('N16').Value:= sLprFile2;
                         Parameters.ParamByName('N17').Value:= sCardNo;
                         ExecSQL;
                       end;
                       DspProc(1, 1, '정기등록차량' + MG_Left(sCarNo, 12), sDspIP);
                       InOpen;
                       Result:= '1' + Result + '입차';
                     end;
                   end;

              3,4: begin //전체봉쇄, 입차봉쇄
                     with qryRecvLpr2 do
                     begin
                       Close;
                       SQL.Clear;
                       SQL.Add('Update CustInfo Set LastParkNo = :N1, LastUnitNo = :N2, ');
                       SQL.Add('LastUseDate = :N3, LastUseTime = :N4, IOStatusNo = :N5 ');
                       SQL.Add('where ParkNo = :N6 and TKType = :N7 and CarNo = :N8');
                       Parameters.ParamByName('N1').Value:= nParkNo;
                       Parameters.ParamByName('N2').Value:= nUnitNo;
                       Parameters.ParamByName('N3').Value:= sLprDate;
                       Parameters.ParamByName('N4').Value:= sLprTime;
                       Parameters.ParamByName('N5').Value:= 9;
                       Parameters.ParamByName('N6').Value:= nParkNo;
                       Parameters.ParamByName('N7').Value:= 2;
                       Parameters.ParamByName('N8').Value:= sCarNo;
                       ExecSQL;

                       Close;
                       SQL.Clear;
                       SQL.Add('Insert Into IOSData (ParkNo, UnitNo, ProcDate, ProcTime, TKType, ');
                       SQL.Add('CarType, GroupNo, GroupName, CompName, DeptName, Name, InCarNo1, ');
                       SQL.Add('InIOStatusNo, InImage1, InCarNo2, InImage2, TKNo) ');
                       SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, :N12, ');
                       SQL.Add(':N13, :N14, :N15, :N16, :N17)');
                       Parameters.ParamByName('N1' ).Value:= nParkNo;
                       Parameters.ParamByName('N2' ).Value:= nUnitNo;
                       Parameters.ParamByName('N3' ).Value:= sLprDate;
                       Parameters.ParamByName('N4' ).Value:= sLprTime;
                       Parameters.ParamByName('N5' ).Value:= 2;
                       Parameters.ParamByName('N6' ).Value:= 2;
                       Parameters.ParamByName('N7' ).Value:= nGroupNo;
                       Parameters.ParamByName('N8' ).Value:= sGroupName;
                       Parameters.ParamByName('N9' ).Value:= sCompName;
                       Parameters.ParamByName('N10').Value:= sDeptName;
                       Parameters.ParamByName('N11').Value:= sName;
                       Parameters.ParamByName('N12').Value:= sLprCarNo1;
                       Parameters.ParamByName('N13').Value:= 9;
                       Parameters.ParamByName('N14').Value:= sLprFile1;
                       Parameters.ParamByName('N15').Value:= sLprCarNo2;
                       Parameters.ParamByName('N16').Value:= sLprFile2;
                       Parameters.ParamByName('N17').Value:= sCardNo;
                       ExecSQL;
                     end;
                     DspProc(1, 1, '봉쇄차량    ' + MG_Left(sCarNo, 12), sDspIP);
                     Result:= '1' + Result + '봉쇄차량';
                     ExceptLogging('##### 전체 또는 입차봉쇄 카드 #####');
                   end;
            end;
          end
          else
          begin
            with qryRecvLpr2 do
            begin
              Close;
              SQL.Clear;
              SQL.Add('Update CustInfo Set LastParkNo = :N1, LastUnitNo = :N2, ');
              SQL.Add('LastUseDate = :N3, LastUseTime = :N4, IOStatusNo = :N5 ');
              SQL.Add('where ParkNo = :N7 and TKType = :N8 and CarNo = :N9');
              Parameters.ParamByName('N1').Value:= nParkNo;
              Parameters.ParamByName('N2').Value:= nUnitNo;
              Parameters.ParamByName('N3').Value:= sLprDate;
              Parameters.ParamByName('N4').Value:= sLprTime;
              Parameters.ParamByName('N5').Value:= 18;
              Parameters.ParamByName('N7').Value:= nParkNo;
              Parameters.ParamByName('N8').Value:= 2;
              Parameters.ParamByName('N9').Value:= sCarNo;
              ExecSQL;

              Close;
              SQL.Clear;
              SQL.Add('Insert Into IOSData (ParkNo, UnitNo, ProcDate, ProcTime, TKType, ');
              SQL.Add('CarType, GroupNo, GroupName, CompName, DeptName, Name, InCarNo1, ');
              SQL.Add('InIOStatusNo, InImage1, InCarNo2, InImage2, TKNo) ');
              SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, :N12, ');
              SQL.Add(':N13, :N14, :N15, :N16, :N17)');
              Parameters.ParamByName('N1' ).Value:= nParkNo;
              Parameters.ParamByName('N2' ).Value:= nUnitNo;
              Parameters.ParamByName('N3' ).Value:= sLprDate;
              Parameters.ParamByName('N4' ).Value:= sLprTime;
              Parameters.ParamByName('N5' ).Value:= 2;
              Parameters.ParamByName('N6' ).Value:= 2;
              Parameters.ParamByName('N7' ).Value:= nGroupNo;
              Parameters.ParamByName('N8' ).Value:= sGroupName;
              Parameters.ParamByName('N9' ).Value:= sCompName;
              Parameters.ParamByName('N10').Value:= sDeptName;
              Parameters.ParamByName('N11').Value:= sName;
              Parameters.ParamByName('N12').Value:= sLprCarNo1;
              Parameters.ParamByName('N13').Value:= 5;
              Parameters.ParamByName('N14').Value:= sLprFile1;
              Parameters.ParamByName('N15').Value:= sLprCarNo2;
              Parameters.ParamByName('N16').Value:= sLprFile2;
              Parameters.ParamByName('N17').Value:= sCardNo;
              ExecSQL;
            end;
            DspProc(1, 1, '사용시간위반' + MG_Left(sCarNo, 12), sDspIP);
            Result:= '1' + Result + 'WP위반';
            ExceptLogging('##### 사용시간대(WP) 위반 #####');
          end;
        end
        else
        if nInOut = 2 then  //출구용
        begin
          if ((nSYoil <= DayOfWeek(Now)) and (nEYoil >= DayOfWeek(Now)) and
             (sSTime <= FormatDateTime('HH:NN', Now)) and (sETime >= FormatDateTime('HH:NN', Now))) then
          begin
            Case nStatus of
              0  : begin  //발매
                     with qryRecvLpr2 do
                     begin
                       Close;
                       SQL.Clear;
                       SQL.Add('Update CustInfo Set LastParkNo = :N1, LastUnitNo = :N2, ');
                       SQL.Add('LastUseDate = :N3, LastUseTime = :N4, IOStatusNo = :N5, Status = :N6 ');

                       //APB가 "1회조정(2)" 이면 APB를 "자동(1)"으로 변경한다.
                       if nAPB = 2 then
                         SQL.Add(', APB = :N10 ');

                       SQL.Add('where ParkNo = :N7 and TKType = :N8 and CarNo = :N9');
                       Parameters.ParamByName('N1').Value:= nParkNo;
                       Parameters.ParamByName('N2').Value:= nUnitNo;
                       Parameters.ParamByName('N3').Value:= sLprDate;
                       Parameters.ParamByName('N4').Value:= sLprTime;
                       Parameters.ParamByName('N5').Value:= 2;
                       Parameters.ParamByName('N6').Value:= 1;
                       Parameters.ParamByName('N7').Value:= nParkNo;
                       Parameters.ParamByName('N8').Value:= 2;
                       Parameters.ParamByName('N9').Value:= sCarNo;

                       if nAPB = 2 then
                         Parameters.ParamByName('N10').Value:= 1;
                       ExecSQL;

                       Close;
                       SQL.Clear;
                       SQL.Add('Insert Into IOSData (ParkNo, UnitNo, ProcDate, ProcTime, TKType, ');
                       SQL.Add('CarType, GroupNo, GroupName, CompName, DeptName, Name, InCarNo1, ');
                       SQL.Add('InIOStatusNo, InImage1, OutUnitNo, OutDate, OutTime, OutImage1, ');
                       SQL.Add('OutCarNo1, OutIOStatusNo, OutImage2, OutCarNo2, TKNo) ');
                       SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, ');
                       SQL.Add(':N12, :N13, :N14, :N15, :N16, :N17, :N18, :N19, :N20, :N21, :N22, :N23)');
                       Parameters.ParamByName('N1' ).Value:= nParkNo;
                       Parameters.ParamByName('N2' ).Value:= nUnitNo;
                       Parameters.ParamByName('N3' ).Value:= sLprDate;
                       Parameters.ParamByName('N4' ).Value:= sLprTime;
                       Parameters.ParamByName('N5' ).Value:= 2;
                       Parameters.ParamByName('N6' ).Value:= 2;
                       Parameters.ParamByName('N7' ).Value:= nGroupNo;
                       Parameters.ParamByName('N8' ).Value:= sGroupName;
                       Parameters.ParamByName('N9' ).Value:= sCompName;
                       Parameters.ParamByName('N10').Value:= sDeptName;
                       Parameters.ParamByName('N11').Value:= sName;
                       Parameters.ParamByName('N12').Value:= sCarNo;
                       Parameters.ParamByName('N13').Value:= 1;
                       Parameters.ParamByName('N14').Value:= '';
                       Parameters.ParamByName('N15').Value:= nUnitNo;
                       Parameters.ParamByName('N16').Value:= sLprDate;
                       Parameters.ParamByName('N17').Value:= sLprTime;
                       Parameters.ParamByName('N18').Value:= sLprFile1;
                       Parameters.ParamByName('N19').Value:= sLprCarNo1;
                       Parameters.ParamByName('N20').Value:= 2;
                       Parameters.ParamByName('N21').Value:= sLprFile2;
                       Parameters.ParamByName('N22').Value:= sLprCarNo2;
                       Parameters.ParamByName('N23').Value:= sCardNo;
                       ExecSQL;
                     end;
                     Result:= '2' + Result + '출차';
                     DspProc(2, 1, '정기등록차량' + MG_Left(sCarNo, 12), sDspIP);
                     OutOpen;
                   end;

              1,4: begin //사용중, 입차봉쇄
                     if nAPB = 1 then //자동
                     begin
                       if (nLastStatus = 2) or (nLastStatus = 9) then //외부, APB위반 출차거부
                       begin
                         with qryRecvLpr2 do
                         begin
                           Close;
                           SQL.Clear;
                           SQL.Add('Update CustInfo Set LastParkNo = :N1, LastUnitNo = :N2, ');
                           SQL.Add('LastUseDate = :N3, LastUseTime = :N4, IOStatusNo = :N5, ');
                           SQL.Add('Status = :N6 where ParkNo = :N7 and TKType = :N8 and CarNo = :N9');
                           Parameters.ParamByName('N1').Value:= nParkNo;
                           Parameters.ParamByName('N2').Value:= nUnitNo;
                           Parameters.ParamByName('N3').Value:= sLprDate;
                           Parameters.ParamByName('N4').Value:= sLprTime;
                           Parameters.ParamByName('N5').Value:= 8;
                           Parameters.ParamByName('N6').Value:= 1;
                           Parameters.ParamByName('N7').Value:= nParkNo;
                           Parameters.ParamByName('N8').Value:= 2;
                           Parameters.ParamByName('N9').Value:= sCarNo;
                           ExecSQL;

                           Close;
                           SQL.Clear;
                           SQL.Add('Select * from IOSData where ((InCarNo1 = :N1) or (InCarNo2 = :N2)) ');
                           SQL.Add('Order By ProcDate Desc, ProcTime Desc');
                           Parameters.ParamByName('N1').Value:= sCarNo;
                           Parameters.ParamByName('N2').Value:= sCarNo;
                           Open;

                           if RecordCount > 0 then
                           begin
                             First;

                             if FieldByName('OutDate').AsString = '' then
                             begin
                               //최종입차후 출차되지 않은 자료가 있다. 이때는 출차일시 자료를 Update한다.
                               sSCInDate:= FieldByName('ProcDate').AsString;
                               sSCInTime:= FieldByName('ProcTime').AsString;
                               nLastUnitNo:= FieldByName('UnitNo').AsInteger;

                               Close;
                               SQL.Clear;
                               SQL.Add('Update IOSData Set OutUnitNo = :N1, OutDate = :N2, OutTime = :N3, ');
                               SQL.Add('OutIOStatusNo = :N4, OutImage1 = :N5, OutCarNo1 = :N6, OutImage2 = :N12, OutCarNo2 = :N13 ');
                               SQL.Add('where ((InCarNo1 = :N7) or (InCarNo2 = :N11)) and ');
                               SQL.Add('ProcDate = :N8 and ProcTime = :N9 and UnitNo = :N10');
                               Parameters.ParamByName('N1').Value:= nUnitNo;
                               Parameters.ParamByName('N2').Value:= sLprDate;
                               Parameters.ParamByName('N3').Value:= sLprTime;
                               Parameters.ParamByName('N4').Value:= 8;
                               Parameters.ParamByName('N5').Value:= sLprFile1;
                               Parameters.ParamByName('N6').Value:= sLprCarNo1;
                               Parameters.ParamByName('N7').Value:= sCarNo;
                               Parameters.ParamByName('N8').Value:= sSCInDate;
                               Parameters.ParamByName('N9').Value:= sSCInTime;
                               Parameters.ParamByName('N10').Value:=nLastUnitNo;
                               Parameters.ParamByName('N11').Value:= sCarNo;
                               Parameters.ParamByName('N12').Value:= sLprFile2;
                               Parameters.ParamByName('N13').Value:= sLprCarNo2;
                               ExecSQL;
                             end
                             else
                             begin
                               //최종입차된 자료가 없다.  이때는 출차자료를 입차자료와 동일하게 Insert한다.
                               Close;
                               SQL.Clear;
                               SQL.Add('Insert Into IOSData (ParkNo, UnitNo, ProcDate, ProcTime, TKType, ');
                               SQL.Add('CarType, GroupNo, GroupName, CompName, DeptName, Name, InCarNo1, ');
                               SQL.Add('InIOStatusNo, InImage1, OutUnitNo, OutDate, OutTime, OutImage1, ');
                               SQL.Add('OutCarNo1, OutIOStatusNo, OutImage2, OutCarNo2, TKNo) ');
                               SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, ');
                               SQL.Add(':N12, :N13, :N14, :N15, :N16, :N17, :N18, :N19, :N20, :N21, :N22, :N23)');
                               Parameters.ParamByName('N1' ).Value:= nParkNo;
                               Parameters.ParamByName('N2' ).Value:= nUnitNo;
                               Parameters.ParamByName('N3' ).Value:= sLprDate;
                               Parameters.ParamByName('N4' ).Value:= sLprTime;
                               Parameters.ParamByName('N5' ).Value:= 2;
                               Parameters.ParamByName('N6' ).Value:= 2;
                               Parameters.ParamByName('N7' ).Value:= nGroupNo;
                               Parameters.ParamByName('N8' ).Value:= sGroupName;
                               Parameters.ParamByName('N9' ).Value:= sCompName;
                               Parameters.ParamByName('N10').Value:= sDeptName;
                               Parameters.ParamByName('N11').Value:= sName;
                               Parameters.ParamByName('N12').Value:= sCarNo;
                               Parameters.ParamByName('N13').Value:= 8;
                               Parameters.ParamByName('N14').Value:= '';
                               Parameters.ParamByName('N15').Value:= nUnitNo;
                               Parameters.ParamByName('N16').Value:= sLprDate;
                               Parameters.ParamByName('N17').Value:= sLprTime;
                               Parameters.ParamByName('N18').Value:= sLprFile1;
                               Parameters.ParamByName('N19').Value:= sLprCarNo1;
                               Parameters.ParamByName('N20').Value:= 8;
                               Parameters.ParamByName('N21').Value:= sLprFile2;
                               Parameters.ParamByName('N22').Value:= sLprCarNo2;
                               Parameters.ParamByName('N23').Value:= sCardNo;
                               ExecSQL;
                             end;
                           end;
                         end;
                         Result:= '2' + Result + 'APB위반';
                         DspProc(2, 1, 'APB위반차량 ' + MG_Left(sCarNo, 12), sDspIP);
                       end
                       else
                       begin
                         with qryRecvLpr2 do
                         begin
                           Close;
                           SQL.Clear;
                           SQL.Add('Update CustInfo Set LastParkNo = :N1, LastUnitNo = :N2, ');
                           SQL.Add('LastUseDate = :N3, LastUseTime = :N4, IOStatusNo = :N5, ');
                           SQL.Add('Status = :N6 where ParkNo = :N7 and TKType = :N8 and CarNo = :N9');
                           Parameters.ParamByName('N1').Value:= nParkNo;
                           Parameters.ParamByName('N2').Value:= nUnitNo;
                           Parameters.ParamByName('N3').Value:= sLprDate;
                           Parameters.ParamByName('N4').Value:= sLprTime;
                           Parameters.ParamByName('N5').Value:= 2;
                           Parameters.ParamByName('N6').Value:= 1;
                           Parameters.ParamByName('N7').Value:= nParkNo;
                           Parameters.ParamByName('N8').Value:= 2;
                           Parameters.ParamByName('N9').Value:= sCarNo;
                           ExecSQL;

                           Close;
                           SQL.Clear;
                           SQL.Add('Select * from IOSData where ((InCarNo1 = :N1) or (InCarNo2 = :N2)) ');
                           SQL.Add('Order By ProcDate Desc, ProcTime Desc');
                           Parameters.ParamByName('N1').Value:= sCarNo;
                           Parameters.ParamByName('N2').Value:= sCarNo;
                           Open;

                           if RecordCount > 0 then
                           begin
                             First;

                             if FieldByName('OutDate').AsString = '' then
                             begin
                               //최종입차후 출차되지 않은 자료가 있다. 이때는 출차일시 자료를 Update한다.
                               sSCInDate:= FieldByName('ProcDate').AsString;
                               sSCInTime:= FieldByName('ProcTime').AsString;
                               nLastUnitNo:= FieldByName('UnitNo').AsInteger;

                               Close;
                               SQL.Clear;
                               SQL.Add('Update IOSData Set OutUnitNo = :N1, OutDate = :N2, OutTime = :N3, ');
                               SQL.Add('OutIOStatusNo = :N4, OutImage1 = :N5, OutCarNo1 = :N6, OutImage2 = :12, OutCarNo2 = :N13 ');
                               SQL.Add('where ((InCarNo1 = :N7) or (InCarNo2 = :N11)) and ');
                               SQL.Add('ProcDate = :N8 and ProcTime = :N9 and UnitNo = :N10');
                               Parameters.ParamByName('N1').Value:= nUnitNo;
                               Parameters.ParamByName('N2').Value:= sLprDate;
                               Parameters.ParamByName('N3').Value:= sLprTime;
                               Parameters.ParamByName('N4').Value:= 2;
                               Parameters.ParamByName('N5').Value:= sLprFile1;
                               Parameters.ParamByName('N6').Value:= sLprCarNo1;
                               Parameters.ParamByName('N7').Value:= sCarNo;
                               Parameters.ParamByName('N8').Value:= sSCInDate;
                               Parameters.ParamByName('N9').Value:= sSCInTime;
                               Parameters.ParamByName('N10').Value:=nLastUnitNo;
                               Parameters.ParamByName('N11').Value:= sCarNo;
                               Parameters.ParamByName('N12').Value:= sLprFile2;
                               Parameters.ParamByName('N13').Value:= sLprCarNo2;
                               ExecSQL;
                             end
                             else
                             begin
                               //최종입차된 자료가 없다.  이때는 출차자료를 입차자료와 동일하게 Insert한다.
                               Close;
                               SQL.Clear;
                               SQL.Add('Insert Into IOSData (ParkNo, UnitNo, ProcDate, ProcTime, TKType, ');
                               SQL.Add('CarType, GroupNo, GroupName, CompName, DeptName, Name, InCarNo1, ');
                               SQL.Add('InIOStatusNo, InImage1, OutUnitNo, OutDate, OutTime, OutImage1, ');
                               SQL.Add('OutCarNo1, OutIOStatusNo, OutImage2, OutCarNo2, TKNo) ');
                               SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, ');
                               SQL.Add(':N12, :N13, :N14, :N15, :N16, :N17, :N18, :N19, :N20, :N21, :N22, :N23)');
                               Parameters.ParamByName('N1' ).Value:= nParkNo;
                               Parameters.ParamByName('N2' ).Value:= nUnitNo;
                               Parameters.ParamByName('N3' ).Value:= sLprDate;
                               Parameters.ParamByName('N4' ).Value:= sLprTime;
                               Parameters.ParamByName('N5' ).Value:= 2;
                               Parameters.ParamByName('N6' ).Value:= 2;
                               Parameters.ParamByName('N7' ).Value:= nGroupNo;
                               Parameters.ParamByName('N8' ).Value:= sGroupName;
                               Parameters.ParamByName('N9' ).Value:= sCompName;
                               Parameters.ParamByName('N10').Value:= sDeptName;
                               Parameters.ParamByName('N11').Value:= sName;
                               Parameters.ParamByName('N12').Value:= sCarNo;
                               Parameters.ParamByName('N13').Value:= 1;
                               Parameters.ParamByName('N14').Value:= '';
                               Parameters.ParamByName('N15').Value:= nUnitNo;
                               Parameters.ParamByName('N16').Value:= sLprDate;
                               Parameters.ParamByName('N17').Value:= sLprTime;
                               Parameters.ParamByName('N18').Value:= sLprFile1;
                               Parameters.ParamByName('N19').Value:= sLprCarNo1;
                               Parameters.ParamByName('N20').Value:= 2;
                               Parameters.ParamByName('N21').Value:= sLprFile2;
                               Parameters.ParamByName('N22').Value:= sLprCarNo2;
                               Parameters.ParamByName('N23').Value:= sCardNo;
                               ExecSQL;
                             end;
                           end;
                         end;
                         Result:= '2' + Result + '출차';
                         DspProc(2, 1, '정기등록차량' + MG_Left(sCarNo, 12), sDspIP);
                         OutOpen;
                       end
                     end
                     else
                     if nAPB = 2 then //1회조정
                     begin
                       with qryRecvLpr2 do
                       begin
                         Close;
                         SQL.Clear;
                         SQL.Add('Update CustInfo Set LastParkNo = :N1, LastUnitNo = :N2, ');
                         SQL.Add('LastUseDate = :N3, LastUseTime = :N4, IOStatusNo = :N5, Status = :N6 ');
                         SQL.Add('APB = :N10 where ParkNo = :N7 and TKType = :N8 and CarNo = :N9');
                         Parameters.ParamByName('N1').Value:= nParkNo;
                         Parameters.ParamByName('N2').Value:= nUnitNo;
                         Parameters.ParamByName('N3').Value:= sLprDate;
                         Parameters.ParamByName('N4').Value:= sLprTime;
                         Parameters.ParamByName('N5').Value:= 2;
                         Parameters.ParamByName('N6').Value:= 1;
                         Parameters.ParamByName('N7').Value:= nParkNo;
                         Parameters.ParamByName('N8').Value:= 2;
                         Parameters.ParamByName('N9').Value:= sCarNo;
                         Parameters.ParamByName('N10').Value:= 1;
                         ExecSQL;

                         Close;
                         SQL.Clear;
                         SQL.Add('Select * from IOSData where ((InCarNo1 = :N1) or (InCarNo2 = :N2)) ');
                         SQL.Add('Order By ProcDate Desc, ProcTime Desc');
                         Parameters.ParamByName('N1').Value:= sCarNo;
                         Parameters.ParamByName('N2').Value:= sCarNo;
                         Open;

                         if RecordCount > 0 then
                         begin
                           First;

                           if FieldByName('OutDate').AsString = '' then
                           begin
                             //최종입차후 출차되지 않은 자료가 있다. 이때는 출차일시 자료를 Update한다.
                             sSCInDate:= FieldByName('ProcDate').AsString;
                             sSCInTime:= FieldByName('ProcTime').AsString;
                             nLastUnitNo:= FieldByName('UnitNo').AsInteger;

                             Close;
                             SQL.Clear;
                             SQL.Add('Update IOSData Set OutUnitNo = :N1, OutDate = :N2, OutTime = :N3, ');
                             SQL.Add('OutIOStatusNo = :N4, OutImage1 = :N5, OutCarNo1 = :N6, OutImage2 = :N12, OutCarNo2 = :N13 ');
                             SQL.Add('where ((InCarNo1 = :N7) or (InCarNo2 = :N11)) and ');
                             SQL.Add('ProcDate = :N8 and ProcTime = :N9 and UnitNo = :N10');
                             Parameters.ParamByName('N1').Value:= nUnitNo;
                             Parameters.ParamByName('N2').Value:= sLprDate;
                             Parameters.ParamByName('N3').Value:= sLprTime;
                             Parameters.ParamByName('N4').Value:= 2;
                             Parameters.ParamByName('N5').Value:= sLprFile1;
                             Parameters.ParamByName('N6').Value:= sLprCarNo1;
                             Parameters.ParamByName('N7').Value:= sCarNo;
                             Parameters.ParamByName('N8').Value:= sSCInDate;
                             Parameters.ParamByName('N9').Value:= sSCInTime;
                             Parameters.ParamByName('N10').Value:=nLastUnitNo;
                             Parameters.ParamByName('N11').Value:= sCarNo;
                             Parameters.ParamByName('N12').Value:= sLprFile2;
                             Parameters.ParamByName('N13').Value:= sLprCarNo2;
                             ExecSQL;
                           end
                           else
                           begin
                             //최종입차된 자료가 없다.  이때는 출차자료를 입차자료와 동일하게 Insert한다.
                             Close;
                             SQL.Clear;
                             SQL.Add('Insert Into IOSData (ParkNo, UnitNo, ProcDate, ProcTime, TKType, ');
                             SQL.Add('CarType, GroupNo, GroupName, CompName, DeptName, Name, InCarNo1, ');
                             SQL.Add('InIOStatusNo, InImage1, OutUnitNo, OutDate, OutTime, OutImage1, ');
                             SQL.Add('OutCarNo1, OutIOStatusNo, OutImage2, OutCarNo2, TKNo) ');
                             SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, ');
                             SQL.Add(':N12, :N13, :N14, :N15, :N16, :N17, :N18, :N19, :N20, :N21, :N22, :N23)');
                             Parameters.ParamByName('N1' ).Value:= nParkNo;
                             Parameters.ParamByName('N2' ).Value:= nUnitNo;
                             Parameters.ParamByName('N3' ).Value:= sLprDate;
                             Parameters.ParamByName('N4' ).Value:= sLprTime;
                             Parameters.ParamByName('N5' ).Value:= 2;
                             Parameters.ParamByName('N6' ).Value:= 2;
                             Parameters.ParamByName('N7' ).Value:= nGroupNo;
                             Parameters.ParamByName('N8' ).Value:= sGroupName;
                             Parameters.ParamByName('N9' ).Value:= sCompName;
                             Parameters.ParamByName('N10').Value:= sDeptName;
                             Parameters.ParamByName('N11').Value:= sName;
                             Parameters.ParamByName('N12').Value:= sCarNo;
                             Parameters.ParamByName('N13').Value:= 1;
                             Parameters.ParamByName('N14').Value:= '';
                             Parameters.ParamByName('N15').Value:= nUnitNo;
                             Parameters.ParamByName('N16').Value:= sLprDate;
                             Parameters.ParamByName('N17').Value:= sLprTime;
                             Parameters.ParamByName('N18').Value:= sLprFile1;
                             Parameters.ParamByName('N19').Value:= sLprCarNo1;
                             Parameters.ParamByName('N20').Value:= 2;
                             Parameters.ParamByName('N21').Value:= sLprFile2;
                             Parameters.ParamByName('N22').Value:= sLprCarNo2;
                             Parameters.ParamByName('N23').Value:= sCardNo;
                             ExecSQL;
                           end;
                         end;
                       end;
                       Result:= '2' + Result + '출차';
                       DspProc(2, 1, '정기등록차량' + MG_Left(sCarNo, 12), sDspIP);
                       OutOpen;
                     end
                     else
                     if nAPB = 3 then //사용안함
                     begin
                         with qryRecvLpr2 do
                         begin
                           Close;
                           SQL.Clear;
                           SQL.Add('Update CustInfo Set LastParkNo = :N1, LastUnitNo = :N2, ');
                           SQL.Add('LastUseDate = :N3, LastUseTime = :N4, IOStatusNo = :N5, ');
                           SQL.Add('Status = :N6 where ParkNo = :N7 and TKType = :N8 and CarNo = :N9');
                           Parameters.ParamByName('N1').Value:= nParkNo;
                           Parameters.ParamByName('N2').Value:= nUnitNo;
                           Parameters.ParamByName('N3').Value:= sLprDate;
                           Parameters.ParamByName('N4').Value:= sLprTime;
                           Parameters.ParamByName('N5').Value:= 2;
                           Parameters.ParamByName('N6').Value:= 1;
                           Parameters.ParamByName('N7').Value:= nParkNo;
                           Parameters.ParamByName('N8').Value:= 2;
                           Parameters.ParamByName('N9').Value:= sCarNo;
                           ExecSQL;

                           Close;
                           SQL.Clear;
                           SQL.Add('Select * from IOSData where ((InCarNo1 = :N1) or (InCarNo2 = :N2)) ');
                           SQL.Add('Order By ProcDate Desc, ProcTime Desc');
                           Parameters.ParamByName('N1').Value:= sCarNo;
                           Parameters.ParamByName('N2').Value:= sCarNo;
                           Open;

                           if RecordCount > 0 then
                           begin
                             First;

                             if FieldByName('OutDate').AsString = '' then
                             begin
                               //최종입차후 출차되지 않은 자료가 있다. 이때는 출차일시 자료를 Update한다.
                               sSCInDate:= FieldByName('ProcDate').AsString;
                               sSCInTime:= FieldByName('ProcTime').AsString;
                               nLastUnitNo:= FieldByName('UnitNo').AsInteger;

                               Close;
                               SQL.Clear;
                               SQL.Add('Update IOSData Set OutUnitNo = :N1, OutDate = :N2, OutTime = :N3, ');
                               SQL.Add('OutIOStatusNo = :N4, OutImage1 = :N5, OutCarNo1 = :N6, OutImage2 = :N12, OutCarNo2 = :N13 ');
                               SQL.Add('where ((InCarNo1 = :N7) or (InCarNo2 = :N11)) and ');
                               SQL.Add('ProcDate = :N8 and ProcTime = :N9 and UnitNo = :N10');
                               Parameters.ParamByName('N1').Value:= nUnitNo;
                               Parameters.ParamByName('N2').Value:= sLprDate;
                               Parameters.ParamByName('N3').Value:= sLprTime;
                               Parameters.ParamByName('N4').Value:= 2;
                               Parameters.ParamByName('N5').Value:= sLprFile1;
                               Parameters.ParamByName('N6').Value:= sLprCarNo1;
                               Parameters.ParamByName('N7').Value:= sCarNo;
                               Parameters.ParamByName('N8').Value:= sSCInDate;
                               Parameters.ParamByName('N9').Value:= sSCInTime;
                               Parameters.ParamByName('N10').Value:=nLastUnitNo;
                               Parameters.ParamByName('N11').Value:= sCarNo;
                               Parameters.ParamByName('N12').Value:= sLprFile2;
                               Parameters.ParamByName('N13').Value:= sLprCarNo2;
                               ExecSQL;
                             end
                             else
                             begin
                               //최종입차된 자료가 없다.  이때는 출차자료를 입차자료와 동일하게 Insert한다.
                               Close;
                               SQL.Clear;
                               SQL.Add('Insert Into IOSData (ParkNo, UnitNo, ProcDate, ProcTime, TKType, ');
                               SQL.Add('CarType, GroupNo, GroupName, CompName, DeptName, Name, InCarNo1, ');
                               SQL.Add('InIOStatusNo, InImage1, OutUnitNo, OutDate, OutTime, OutImage1, ');
                               SQL.Add('OutCarNo1, OutIOStatusNo, OutImage2, OutCarNo2, TKNo) ');
                               SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, ');
                               SQL.Add(':N12, :N13, :N14, :N15, :N16, :N17, :N18, :N19, :N20, :N21, :N22, :N23)');
                               Parameters.ParamByName('N1' ).Value:= nParkNo;
                               Parameters.ParamByName('N2' ).Value:= nUnitNo;
                               Parameters.ParamByName('N3' ).Value:= sLprDate;
                               Parameters.ParamByName('N4' ).Value:= sLprTime;
                               Parameters.ParamByName('N5' ).Value:= 2;
                               Parameters.ParamByName('N6' ).Value:= 2;
                               Parameters.ParamByName('N7' ).Value:= nGroupNo;
                               Parameters.ParamByName('N8' ).Value:= sGroupName;
                               Parameters.ParamByName('N9' ).Value:= sCompName;
                               Parameters.ParamByName('N10').Value:= sDeptName;
                               Parameters.ParamByName('N11').Value:= sName;
                               Parameters.ParamByName('N12').Value:= sCarNo;
                               Parameters.ParamByName('N13').Value:= 1;
                               Parameters.ParamByName('N14').Value:= '';
                               Parameters.ParamByName('N15').Value:= nUnitNo;
                               Parameters.ParamByName('N16').Value:= sLprDate;
                               Parameters.ParamByName('N17').Value:= sLprTime;
                               Parameters.ParamByName('N18').Value:= sLprFile1;
                               Parameters.ParamByName('N19').Value:= sLprCarNo1;
                               Parameters.ParamByName('N20').Value:= 2;
                               Parameters.ParamByName('N21').Value:= sLprFile2;
                               Parameters.ParamByName('N22').Value:= sLprCarNo2;
                               Parameters.ParamByName('N23').Value:= sCardNo;
                               ExecSQL;
                             end;
                           end;
                         end;
                         Result:= '2' + Result + '출차';
                         DspProc(2, 1, '정기등록차량' + MG_Left(sCarNo, 12), sDspIP);
                         OutOpen;
                     end;
                   end;

              3,5: begin //전체봉쇄, 출차봉쇄
                     with qryRecvLpr2 do
                     begin
                       Close;
                       SQL.Clear;
                       SQL.Add('Update CustInfo Set LastParkNo = :N1, LastUnitNo = :N2, ');
                       SQL.Add('LastUseDate = :N3, LastUseTime = :N4, IOStatusNo = :N5 ');
                       SQL.Add('where ParkNo = :N6 and TKType = :N7 and CarNo = :N8');
                       Parameters.ParamByName('N1').Value:= nParkNo;
                       Parameters.ParamByName('N2').Value:= nUnitNo;
                       Parameters.ParamByName('N3').Value:= sLprDate;
                       Parameters.ParamByName('N4').Value:= sLprTime;
                       Parameters.ParamByName('N5').Value:= 10;
                       Parameters.ParamByName('N6').Value:= nParkNo;
                       Parameters.ParamByName('N7').Value:= 2;
                       Parameters.ParamByName('N8').Value:= sCarNo;
                       ExecSQL;

                       Close;
                       SQL.Clear;
                       SQL.Add('Select * from IOSData where ((InCarNo1 = :N1) or (InCarNo2 = :N2)) ');
                       SQL.Add('Order By InDate Desc, InTime Desc');
                       Parameters.ParamByName('N1').Value:= sCarNo;
                       Parameters.ParamByName('N2').Value:= sCarNo;
                       Open;

                       if RecordCount > 0 then
                       begin
                         First;

                         if FieldByName('OutDate').AsString = '' then
                         begin
                           //최종입차후 출차되지 않은 자료가 있다. 이때는 출차일시 자료를 Update한다.
                           sSCInDate:= FieldByName('ProcDate').AsString;
                           sSCInTime:= FieldByName('ProcTime').AsString;
                           nLastUnitNo:= FieldByName('UnitNo').AsInteger;

                           Close;
                           SQL.Clear;
                           SQL.Add('Update IOSData Set OutUnitNo = :N1, OutDate = :N2, OutTime = :N3, ');
                           SQL.Add('OutIOStatusNo = :N4, OutImage1 = :N5, OutCarNo1 = :N6, OutImage2 = :N12, OutCarNo2 = :N13 ');
                           SQL.Add('where ((InCarNo1 = :N7) or (InCarNo2 = :N11)) and ');
                           SQL.Add('ProcDate = :N8 and ProcTime = :N9 and UnitNo = :N10');
                           Parameters.ParamByName('N1').Value:= nUnitNo;
                           Parameters.ParamByName('N2').Value:= sLprDate;
                           Parameters.ParamByName('N3').Value:= sLprTime;
                           Parameters.ParamByName('N4').Value:= 10;
                           Parameters.ParamByName('N5').Value:= sLprFile1;
                           Parameters.ParamByName('N6').Value:= sLprCarNo1;
                           Parameters.ParamByName('N7').Value:= sCarNo;
                           Parameters.ParamByName('N8').Value:= sSCInDate;
                           Parameters.ParamByName('N9').Value:= sSCInTime;
                           Parameters.ParamByName('N10').Value:=nLastUnitNo;
                           Parameters.ParamByName('N11').Value:= sCarNo;
                           Parameters.ParamByName('N12').Value:= sLprFile2;
                           Parameters.ParamByName('N13').Value:= sLprCarNo2;
                           ExecSQL;
                         end
                         else
                         begin
                           //최종입차된 자료가 없다.  이때는 출차자료를 입차자료와 동일하게 Insert한다.
                           Close;
                           SQL.Clear;
                           SQL.Add('Insert Into IOSData (ParkNo, UnitNo, ProcDate, ProcTime, TKType, ');
                           SQL.Add('CarType, GroupNo, GroupName, CompName, DeptName, Name, InCarNo1, ');
                           SQL.Add('InIOStatusNo, InImage1, OutUnitNo, OutDate, OutTime, OutImage1, ');
                           SQL.Add('OutCarNo1, OutIOStatusNo, OutImage2, OutCarNo2, TKNo) ');
                           SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, ');
                           SQL.Add(':N12, :N13, :N14, :N15, :N16, :N17, :N18, :N19, :N20, :N21, :N22, :N23)');
                           Parameters.ParamByName('N1' ).Value:= nParkNo;
                           Parameters.ParamByName('N2' ).Value:= nUnitNo;
                           Parameters.ParamByName('N3' ).Value:= sLprDate;
                           Parameters.ParamByName('N4' ).Value:= sLprTime;
                           Parameters.ParamByName('N5' ).Value:= 2;
                           Parameters.ParamByName('N6' ).Value:= 2;
                           Parameters.ParamByName('N7' ).Value:= nGroupNo;
                           Parameters.ParamByName('N8' ).Value:= sGroupName;
                           Parameters.ParamByName('N9' ).Value:= sCompName;
                           Parameters.ParamByName('N10').Value:= sDeptName;
                           Parameters.ParamByName('N11').Value:= sName;
                           Parameters.ParamByName('N12').Value:= sCarNo;
                           Parameters.ParamByName('N13').Value:= 10;
                           Parameters.ParamByName('N14').Value:= '';
                           Parameters.ParamByName('N15').Value:= nUnitNo;
                           Parameters.ParamByName('N16').Value:= sLprDate;
                           Parameters.ParamByName('N17').Value:= sLprTime;
                           Parameters.ParamByName('N18').Value:= sLprFile1;
                           Parameters.ParamByName('N19').Value:= sLprCarNo1;
                           Parameters.ParamByName('N20').Value:= 10;
                           Parameters.ParamByName('N21').Value:= sLprFile2;
                           Parameters.ParamByName('N22').Value:= sLprCarNo2;
                           Parameters.ParamByName('N23').Value:= sCardNo;
                           ExecSQL;
                         end;
                       end;
                     end;
                     Result:= '2' + Result + '봉쇄중';
                     DspProc(2, 1, '  봉쇄차량  ' + MG_Left(sCarNo, 12), sDspIP);
                     ExceptLogging('##### 전체 또는 출차봉쇄 카드(출차) #####');
                   end;
            end;
          end
          else
          begin
            with qryRecvLpr2 do
            begin
              Close;
              SQL.Clear;
              SQL.Add('Update CustInfo Set LastParkNo = :N1, LastUnitNo = :N2, ');
              SQL.Add('LastUseDate = :N3, LastUseTime = :N4, IOStatusNo = :N5 ');
              SQL.Add('where ParkNo = :N7 and TKType = :N8 and CarNo = :N9');
              Parameters.ParamByName('N1').Value:= nParkNo;
              Parameters.ParamByName('N2').Value:= nUnitNo;
              Parameters.ParamByName('N3').Value:= sLprDate;
              Parameters.ParamByName('N4').Value:= sLprTime;
              Parameters.ParamByName('N5').Value:= 6;
              Parameters.ParamByName('N7').Value:= nParkNo;
              Parameters.ParamByName('N8').Value:= 2;
              Parameters.ParamByName('N9').Value:= sCarNo;
              ExecSQL;

              Close;
              SQL.Clear;
              SQL.Add('Select * from IOSData where ((InCarNo1 = :N1) or (InCarNo2 = :N2)) Order By ProcDate Desc, ProcTime Desc');
              Parameters.ParamByName('N1').Value:= sCarNo;
              Parameters.ParamByName('N2').Value:= sCarNo;
              Open;

              if RecordCount > 0 then
              begin
                First;

                if FieldByName('OutDate').AsString = '' then
                begin
                  //최종입차후 출차되지 않은 자료가 있다. 이때는 출차일시 자료를 Update한다.
                  sSCInDate:= FieldByName('ProcDate').AsString;
                  sSCInTime:= FieldByName('ProcTime').AsString;
                  nLastUnitNo:= FieldByName('UnitNo').AsInteger;

                  Close;
                  SQL.Clear;
                  SQL.Add('Update IOSData Set OutUnitNo = :N1, OutDate = :N2, OutTime = :N3, ');
                  SQL.Add('OutIOStatusNo = :N4, OutImage1 = :N5, OutCarNo1 = :N6, OutImage2 = :N12, OutCarNo2 = :N13 ');
                  SQL.Add('where ((InCarNo1 = :N7) or (InCarNo2 = :N11)) and ');
                  SQL.Add('ProcDate = :N8 and ProcTime = :N9 and UnitNo = :N10');
                  Parameters.ParamByName('N1').Value:= nUnitNo;
                  Parameters.ParamByName('N2').Value:= sLprDate;
                  Parameters.ParamByName('N3').Value:= sLprTime;
                  Parameters.ParamByName('N4').Value:= 6;
                  Parameters.ParamByName('N5').Value:= sLprFile1;
                  Parameters.ParamByName('N6').Value:= sLprCarNo1;
                  Parameters.ParamByName('N7').Value:= sCarNo;
                  Parameters.ParamByName('N8').Value:= sSCInDate;
                  Parameters.ParamByName('N9').Value:= sSCInTime;
                  Parameters.ParamByName('N10').Value:=nLastUnitNo;
                  Parameters.ParamByName('N11').Value:= sCarNo;
                  Parameters.ParamByName('N12').Value:= sLprFile2;
                  Parameters.ParamByName('N13').Value:= sLprCarNo2;
                  ExecSQL;
                end
                else
                begin
                  //최종입차된 자료가 없다.  이때는 출차자료를 입차자료와 동일하게 Insert한다.
                  Close;
                  SQL.Clear;
                  SQL.Add('Insert Into IOSData (ParkNo, UnitNo, ProcDate, ProcTime, TKType, ');
                  SQL.Add('CarType, GroupNo, GroupName, CompName, DeptName, Name, InCarNo1, ');
                  SQL.Add('InIOStatusNo, InImage1, OutUnitNo, OutDate, OutTime, OutImage1, ');
                  SQL.Add('OutCarNo1, OutIOStatusNo, OutImage2, OutCarNo2, TKNo) ');
                  SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, ');
                  SQL.Add(':N12, :N13, :N14, :N15, :N16, :N17, :N18, :N19, :N20, :N21, :N22, :N23)');
                  Parameters.ParamByName('N1' ).Value:= nParkNo;
                  Parameters.ParamByName('N2' ).Value:= nUnitNo;
                  Parameters.ParamByName('N3' ).Value:= sLprDate;
                  Parameters.ParamByName('N4' ).Value:= sLprTime;
                  Parameters.ParamByName('N5' ).Value:= 2;
                  Parameters.ParamByName('N6' ).Value:= 2;
                  Parameters.ParamByName('N7' ).Value:= nGroupNo;
                  Parameters.ParamByName('N8' ).Value:= sGroupName;
                  Parameters.ParamByName('N9' ).Value:= sCompName;
                  Parameters.ParamByName('N10').Value:= sDeptName;
                  Parameters.ParamByName('N11').Value:= sName;
                  Parameters.ParamByName('N12').Value:= sCarNo;
                  Parameters.ParamByName('N13').Value:= 6;
                  Parameters.ParamByName('N14').Value:= '';
                  Parameters.ParamByName('N15').Value:= nUnitNo;
                  Parameters.ParamByName('N16').Value:= sLprDate;
                  Parameters.ParamByName('N17').Value:= sLprTime;
                  Parameters.ParamByName('N18').Value:= sLprFile1;
                  Parameters.ParamByName('N19').Value:= sLprCarNo1;
                  Parameters.ParamByName('N20').Value:= 6;
                  Parameters.ParamByName('N21').Value:= sLprFile2;
                  Parameters.ParamByName('N22').Value:= sLprCarNo2;
                  Parameters.ParamByName('N23').Value:= sCardNo;
                  ExecSQL;
                end;
              end;
            end;
            Result:= '2' + Result + '시간위반';
            DspProc(2, 1, '사용시간위반' + MG_Left(sCarNo, 12), sDspIP);
            ExceptLogging('##### 사용시간대(WP) 위반(출차) #####');
          end;
        end
        else
        if nInOut = 3 then //재인식기
        begin
          //
        end;
      end
      else
      begin
        //카드사용기간 오류처리..
        with qryRecvLpr2 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Update CustInfo Set LastParkNo = :N1, LastUnitNo = :N2, ');
          SQL.Add('LastUseDate = :N3, LastUseTime = :N4, IOStatusNo = :N5 ');
          SQL.Add('where ParkNo = :N6 and TKType = :N7 and CarNo = :N8');
          Parameters.ParamByName('N1').Value:= nParkNo;
          Parameters.ParamByName('N2').Value:= nUnitNo;
          Parameters.ParamByName('N3').Value:= sLprDate;
          Parameters.ParamByName('N4').Value:= sLprTime;
          Parameters.ParamByName('N5').Value:= 3;
          Parameters.ParamByName('N6').Value:= nParkNo;
          Parameters.ParamByName('N7').Value:= 2;
          Parameters.ParamByName('N8').Value:= sCarNo;
          ExecSQL;

          Close;
          SQL.Clear;
          SQL.Add('Select * from IOSData where ((InCarNo1 = :N1) or (InCarNo2 = :N2)) Order By ProcDate Desc, ProcTime Desc');
          Parameters.ParamByName('N1').Value:= sCarNo;
          Parameters.ParamByName('N2').Value:= sCarNo;
          Open;

          if RecordCount > 0 then
          begin
            First;

            if FieldByName('OutDate').AsString = '' then
            begin
              //최종입차후 출차되지 않은 자료가 있다. 이때는 출차일시 자료를 Update한다.
              sSCInDate:= FieldByName('ProcDate').AsString;
              sSCInTime:= FieldByName('ProcTime').AsString;
              nLastUnitNo:= FieldByName('UnitNo').AsInteger;

              Close;
              SQL.Clear;
              SQL.Add('Update IOSData Set OutUnitNo = :N1, OutDate = :N2, OutTime = :N3, ');
              SQL.Add('OutIOStatusNo = :N4, OutImage1 = :N5, OutCarNo1 = :N6, OutImage2 = :N12, OutCarNo2 = :N13 ');
              SQL.Add('where ((InCarNo1 = :N7) or (InCarNo2 = :N11)) and ');
              SQL.Add('ProcDate = :N8 and ProcTime = :N9 and UnitNo = :N10');
              Parameters.ParamByName('N1').Value:= nUnitNo;
              Parameters.ParamByName('N2').Value:= sLprDate;
              Parameters.ParamByName('N3').Value:= sLprTime;
              Parameters.ParamByName('N4').Value:= 3;
              Parameters.ParamByName('N5').Value:= sLprFile1;
              Parameters.ParamByName('N6').Value:= sLprCarNo1;
              Parameters.ParamByName('N7').Value:= sCarNo;
              Parameters.ParamByName('N8').Value:= sSCInDate;
              Parameters.ParamByName('N9').Value:= sSCInTime;
              Parameters.ParamByName('N10').Value:=nLastUnitNo;
              Parameters.ParamByName('N11').Value:= sCarNo;
              Parameters.ParamByName('N12').Value:= sLprFile2;
              Parameters.ParamByName('N13').Value:= sLprCarNo2;
              ExecSQL;
            end
            else
            begin
              //최종입차된 자료가 없다.  이때는 출차자료를 입차자료와 동일하게 Insert한다.
              Close;
              SQL.Clear;
              SQL.Add('Insert Into IOSData (ParkNo, UnitNo, ProcDate, ProcTime, TKType, ');
              SQL.Add('CarType, GroupNo, GroupName, CompName, DeptName, Name, InCarNo1, ');
              SQL.Add('InIOStatusNo, InImage1, OutUnitNo, OutDate, OutTime, OutImage1, ');
              SQL.Add('OutCarNo1, OutIOStatusNo, OutImage2, OutCarNo2, TKNo) ');
              SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, ');
              SQL.Add(':N12, :N13, :N14, :N15, :N16, :N17, :N18, :N19, :N20, :N21, :N22, :N23)');
              Parameters.ParamByName('N1' ).Value:= nParkNo;
              Parameters.ParamByName('N2' ).Value:= nUnitNo;
              Parameters.ParamByName('N3' ).Value:= sLprDate;
              Parameters.ParamByName('N4' ).Value:= sLprTime;
              Parameters.ParamByName('N5' ).Value:= 2;
              Parameters.ParamByName('N6' ).Value:= 2;
              Parameters.ParamByName('N7' ).Value:= nGroupNo;
              Parameters.ParamByName('N8' ).Value:= sGroupName;
              Parameters.ParamByName('N9' ).Value:= sCompName;
              Parameters.ParamByName('N10').Value:= sDeptName;
              Parameters.ParamByName('N11').Value:= sName;
              Parameters.ParamByName('N12').Value:= sCarNo;
              Parameters.ParamByName('N13').Value:= 3;
              Parameters.ParamByName('N14').Value:= '';
              Parameters.ParamByName('N15').Value:= nUnitNo;
              Parameters.ParamByName('N16').Value:= sLprDate;
              Parameters.ParamByName('N17').Value:= sLprTime;
              Parameters.ParamByName('N18').Value:= sLprFile1;
              Parameters.ParamByName('N19').Value:= sLprCarNo1;
              Parameters.ParamByName('N20').Value:= 3;
              Parameters.ParamByName('N21').Value:= sLprFile2;
              Parameters.ParamByName('N22').Value:= sLprCarNo2;
              Parameters.ParamByName('N23').Value:= sCardNo;
              ExecSQL;
            end;
          end;
        end;

        if nInOut = 1 then
        begin
          Result:= '1' + Result + '유효기간';
          DspProc(1, 1, '사용기간위반' + MG_Left(sCarNo, 12), sDspIP);
        end
        else
        if nInOut = 2 then
        begin
          Result:= '2' + Result + '유효기간';
          DspProc(2, 1, '사용기간위반' + MG_Left(sCarNo, 12), sDspIP);
        end;
        ExceptLogging('##### 사용기간 오류 - 사용시작일: ' + sExpDateF +
                      ', 사용종료일: ' + sExpDateT + ' #####');
      end;
    end;
  except
    on E: Exception do ExceptLogging('RecvLprProc: ' + aString(E.Message));
  end;
end;

procedure TfrmMain.NormalOut(sLprFile1, sLprCarNo1, sLprFile2, sLprCarNo2, sIOTime: aString;
                             nLprNo, nLprInOut, nLprRecog1, nLprRecog2: Byte; sDspIP: aString);
var
  sNow, sInCarNo, sInTKNo, sInDate, sInTime, sParking, sInFile, sImgFile1, sImgFile2,
  sLocalFile, sTime, sDir: aString;
  nDay, nHour, nMin, nOutCnt: Cardinal;
  nInUnitNo, i: Word;
  hr: HRESULT;
begin
  //일반차량 출차처리...
  try
    if not bMiProc then
    begin
      if ((sLprCarNo1 = '0000000000') and (sLprCarNo2 = '')) or
         ((sLprCarNo2 = '0000000000') and (sLprCarNo1 = '')) or
         ((sLprCarNo1 = '0000000000') and (sLprCarNo2 = '0000000000')) or
         ((sLprCarNo1 = '') and (sLprCarNo2 = '')) then
      begin
        ShowMessage('미인식차량입니다. 미인식처리 또는 수동출차로 처리하여주세요!');
        btnLost.Enabled:= True;
        sNowLprFile1 := sLprFile1;
        sNowLprCarNo1:= sLprCarNo1;
        sNowLprFile2 := sLprFile2;
        sNowLprCarNo2:= sLprCarNo2;
        sNowIOTime   := sIOTime;
        nNowLprNo    := nLprNo;
        nNowLprInOut := nLprInOut;
        nNowLprRecog1:= nLprRecog1;
        nNowLprRecog2:= nLprRecog2;
        sNowInTKNo   := '';
        nNowInUnitNo := nCurrUnitNo;
        sNowInDate   := '';
        sNowInTime   := '';
        sNowInCarNo  := '';
        sNowOutDate  := '';
        sNowOutTime  := '';
        Exit;
      end;
    end;

    with dmTables.qryNormalOut1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from Gracetime where ParkNo = :N1');
      Parameters.ParamByName('N1').Value:= nCurrParkNo;
      Open;

      if RecordCount > 0 then
        with GTime do
        begin
          GT1:= FieldByName('GT1').AsString;
          GT2:= FieldByName('GT2').AsString;
          GT3:= FieldByName('GT3').AsString;
          GT4:= FieldByName('GT4').AsString;
          GT5:= FieldByName('GT5').AsString;
          GT6:= FieldByName('GT6').AsString;
          GT7:= FieldByName('GT7').AsString;
          GT8:= FieldByName('GT8').AsString;
          GT9:= FieldByName('GT9').AsInteger;
        end
      else
        ClearGTime;

      if not bMiProc then
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select * from IONData where OutChk = :N1 and ');

        if sLprCarNo2 <> '' then
        begin
          SQL.Add('((InCarNo1 = :N2) or (InCarNo2 = :N3) or (InCarNo1 = :N4) or (InCarNo2 = :N5)) ');
          Parameters.ParamByName('N1').Value:= 0;
          Parameters.ParamByName('N2').Value:= sLprCarNo1;
          Parameters.ParamByName('N3').Value:= sLprCarNo1;
          Parameters.ParamByName('N4').Value:= sLprCarNo2;
          Parameters.ParamByName('N5').Value:= sLprCarNo2;
        end
        else
        begin
          SQL.Add('((InCarNo1 = :N2) or (InCarNo2 = :N3)) ');
          Parameters.ParamByName('N1').Value:= 0;
          Parameters.ParamByName('N2').Value:= sLprCarNo1;
          Parameters.ParamByName('N3').Value:= sLprCarNo1;
        end;
      end
      else
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select * from IONData where OutChk = :N1 and ');

        if sLprCarNo2 <> '' then
        begin
          SQL.Add('((InCarNo1 = :N2) or (InCarNo2 = :N3) or (InCarNo1 = :N4) or (InCarNo2 = :N5)) ');
          Parameters.ParamByName('N1').Value:= 0;
          Parameters.ParamByName('N2').Value:= sLprCarNo1;
          Parameters.ParamByName('N3').Value:= sLprCarNo1;
          Parameters.ParamByName('N4').Value:= sLprCarNo2;
          Parameters.ParamByName('N5').Value:= sLprCarNo2;
        end
        else
        begin
          SQL.Add('((InCarNo1 = :N2) or (InCarNo2 = :N3)) ');
          Parameters.ParamByName('N1').Value:= 0;
          Parameters.ParamByName('N2').Value:= sLprCarNo1;
          Parameters.ParamByName('N3').Value:= sLprCarNo1;
        end;
        SQL.Add('and ProcDate = :N6 and ProcTime = :N7 ');
        Parameters.ParamByName('N6').Value:= sLostInDate;
        Parameters.ParamByName('N7').Value:= sLostInTime;
      end;
      SQL.Add('Order By ProcDate Desc, ProcTime Desc');
      Open;

      if RecordCount > 0 then
      begin
        nInUnitNo:= FieldByName('UnitNo').AsInteger;
        sInTKNo:= FieldByName('TKNo').AsString;

        if nLprRecog1 = 1 then
        begin
          sInCarNo:= sLprCarNo1;
          sInFile:= FieldByName('InImage1').AsString;
          sTime:= Copy(sInFile, Pos('_', sInFile)+1, 14);
        end
        else
        if nLprRecog2 = 1 then
        begin
          sInCarNo:= sLprCarNo2;
          sInFile:= FieldByName('InImage2').AsString;
          sTime:= Copy(sInFile, Pos('_', sInFile)+1, 14);
        end
        else
        begin
          sInCarNo:= sLprCarNo1;
          sInFile:= FieldByName('InImage1').AsString;
          sTime:= Copy(sInFile, Pos('_', sInFile)+1, 14);
        end;
        sInDate:= FieldByName('ProcDate').AsString;
        sInTime:= FieldByName('ProcTime').AsString;
      end
      else
      begin
        //입차자료 없음...
        sNowLprFile1 := sLprFile1;
        sNowLprCarNo1:= sLprCarNo1;
        sNowLprFile2 := sLprFile2;
        sNowLprCarNo2:= sLprCarNo2;
        sNowIOTime   := sIOTime;
        nNowLprNo    := nLprNo;
        nNowLprInOut := nLprInOut;
        nNowLprRecog1:= nLprRecog1;
        nNowLprRecog2:= nLprRecog2;
        sNowInTKNo   := '';
        nNowInUnitNo := 0;
        sNowInDate   := '';
        sNowInTime   := '';
        sNowInCarNo  := '';
        btnLost.Enabled:= True;
        ShowMessage('입차자료가 없습니다. 확인하여주세요!');
        Exit;
      end;
    end;
    sDir:= sImageDir + '\' + Copy(sTime, 1, 4) + '\' + Copy(sTime, 5, 2) + '\' +
           Copy(sTime, 7, 2) + '\' + IntToStr(nInUnitNo);

    if not DirectoryExists(sDir) then
    begin
      if not ForceDirectories(sDir) then
        ExceptLogging('이미지저장폴더 생성실패: ' + sDir);
    end;

    sLocalFile:= sDir + '\' + Copy(sInFile, Pos('CH', sInFile), Length(sInFile)-(Pos('CH', sInFile)-1));

    if FileExists(sLocalFile) then
      imgNIn.Picture.LoadFromFile(sLocalFile)
    else
    begin
      try
        if DownloadFileHTTP(wString(sInFile), wString(sLocalFile)) then
        begin
          imgNIn.Picture.LoadFromFile(sLocalFile);
        end
        else
        begin
          imgNIn.Picture.Assign(Nil);
          ExceptLogging('File Down 실패: ' + sInFile);
        end;
      except
        on E: Exception do ExceptLogging('TfrmMain.NormalOut_FileDownload: ' + aString(E.Message));
      end;
    end;

    //화면표시
    pnN.Visible:= True;
    edtNo.Text:= sInCarNo;
    edtInDate.Text:= sInDate + ' ' + sInTime;
    sNow:= FormatDateTime('YYYY-MM-DD HH:NN:SS', Now);
    sParking:= '';
    nParkingMin:= 0;
    nParkingMin:= Trunc((StrToDateTime(MG_AddTime(Copy(sNow, 1, 16), 0, 1, 0, 0)+':01')-
                         StrToDateTime(edtInDate.Text))*24*60);
    nDay:= nParkingMin div (24*60);
    nHour:= (nParkingMin mod (24*60)) div 60;
    nMin:= (nParkingMin mod (24*60)) mod 60;

    if nDay > 0 then sParking:= sParking + IntToStr(nDay) + '일 ';
    if nHour > 0 then sParking:= sParking + IntToStr(nHour) + '시간 ';
    if nMin > 0 then sParking:= sParking + IntToStr(nMin) + '분';
    pnlPTime.Text:= sParking;

    if FormatDateTime('YYYY-MM-DD HH:NN', StrToDateTime(Copy(edtInDate.Text, 1, 16)) +
                                          StrToTime(GTime.GT1)) > Copy(sNow, 1, 16) then
    begin
      ShowMessage('회차허용시간 미초과차량!'#13#13#10 +
                  '입차시간: ' + edtInDate.Text + #13#13#10 +
                  '출차시간: ' + sNow + #13#13#10 +
                  '허용시간: ' + GTime.GT1);

      //DB Write...
      with dmTables.qryNormalOut2 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select * from IONCount Where ParkNo = :N1 and UnitNo = :N2 and ProcDate = :N3');
        Parameters.ParamByName('N1').Value:= nCurrParkNo;
        Parameters.ParamByName('N2').Value:= nLprNo;
        Parameters.ParamByName('N3').Value:= Copy(sNow, 1, 10);
        Open;

        if RecordCount > 0 then
        begin
          Case StrToInt(FormatDateTime('HH', Now)) of
            0 : nOutCnt:= FieldByName('Out00').AsInteger+1;
            1 : nOutCnt:= FieldByName('Out01').AsInteger+1;
            2 : nOutCnt:= FieldByName('Out02').AsInteger+1;
            3 : nOutCnt:= FieldByName('Out03').AsInteger+1;
            4 : nOutCnt:= FieldByName('Out04').AsInteger+1;
            5 : nOutCnt:= FieldByName('Out05').AsInteger+1;
            6 : nOutCnt:= FieldByName('Out06').AsInteger+1;
            7 : nOutCnt:= FieldByName('Out07').AsInteger+1;
            8 : nOutCnt:= FieldByName('Out08').AsInteger+1;
            9 : nOutCnt:= FieldByName('Out09').AsInteger+1;
            10: nOutCnt:= FieldByName('Out10').AsInteger+1;
            11: nOutCnt:= FieldByName('Out11').AsInteger+1;
            12: nOutCnt:= FieldByName('Out12').AsInteger+1;
            13: nOutCnt:= FieldByName('Out13').AsInteger+1;
            14: nOutCnt:= FieldByName('Out14').AsInteger+1;
            15: nOutCnt:= FieldByName('Out15').AsInteger+1;
            16: nOutCnt:= FieldByName('Out16').AsInteger+1;
            17: nOutCnt:= FieldByName('Out17').AsInteger+1;
            18: nOutCnt:= FieldByName('Out18').AsInteger+1;
            19: nOutCnt:= FieldByName('Out19').AsInteger+1;
            20: nOutCnt:= FieldByName('Out20').AsInteger+1;
            21: nOutCnt:= FieldByName('Out21').AsInteger+1;
            22: nOutCnt:= FieldByName('Out22').AsInteger+1;
            23: nOutCnt:= FieldByName('Out23').AsInteger+1;
          end;
          Close;
          SQL.Clear;
          SQL.Add('Update IONCount ');

          Case StrToInt(FormatDateTime('HH', Now)) of
            0 : SQL.Add('Set Out00 = :N1 ');
            1 : SQL.Add('Set Out01 = :N1 ');
            2 : SQL.Add('Set Out02 = :N1 ');
            3 : SQL.Add('Set Out03 = :N1 ');
            4 : SQL.Add('Set Out04 = :N1 ');
            5 : SQL.Add('Set Out05 = :N1 ');
            6 : SQL.Add('Set Out06 = :N1 ');
            7 : SQL.Add('Set Out07 = :N1 ');
            8 : SQL.Add('Set Out08 = :N1 ');
            9 : SQL.Add('Set Out09 = :N1 ');
            10: SQL.Add('Set Out10 = :N1 ');
            11: SQL.Add('Set Out11 = :N1 ');
            12: SQL.Add('Set Out12 = :N1 ');
            13: SQL.Add('Set Out13 = :N1 ');
            14: SQL.Add('Set Out14 = :N1 ');
            15: SQL.Add('Set Out15 = :N1 ');
            16: SQL.Add('Set Out16 = :N1 ');
            17: SQL.Add('Set Out17 = :N1 ');
            18: SQL.Add('Set Out18 = :N1 ');
            19: SQL.Add('Set Out19 = :N1 ');
            20: SQL.Add('Set Out20 = :N1 ');
            21: SQL.Add('Set Out21 = :N1 ');
            22: SQL.Add('Set Out22 = :N1 ');
            23: SQL.Add('Set Out23 = :N1 ');
          end;
          SQL.Add('Where ParkNo = :N2 and UnitNo = :N3 and ProcDate = :N4');
          Parameters.ParamByName('N1').Value:= nOutCnt;
          Parameters.ParamByName('N2').Value:= nCurrParkNo;
          Parameters.ParamByName('N3').Value:= nLprNo;
          Parameters.ParamByName('N4').Value:= Copy(sNow, 1, 10);
          ExecSQL; Close;
        end
        else
        begin
          Close;
          SQL.Clear;
          SQL.Add('Insert Into IONCount ');
          SQL.Add('(ParkNo, UnitNo, ProcDate, In00, In01, In02, In03, In04, ');
          SQL.Add('In05, In06, In07, In08, In09, In10, In11, In12, In13, In14, ');
          SQL.Add('In15, In16, In17, In18, In19, In20, In21, In22, In23, Out00, ');
          SQL.Add('Out01, Out02, Out03, Out04, Out05, Out06, Out07, Out08, Out09, ');
          SQL.Add('Out10, Out11, Out12, Out13, Out14, Out15, Out16, Out17, Out18, ');
          SQL.Add('Out19, Out20, Out21, Out22, Out23) Values ');
          SQL.Add('(:N1, :N2, :N3, 0, 0, 0, 0, 0, 0, 0, ');
          SQL.Add('0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ');
          SQL.Add('0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)');
          Parameters.ParamByName('N1').Value:= nCurrParkNo;
          Parameters.ParamByName('N2').Value:= nLprNo;
          Parameters.ParamByName('N3').Value:= Copy(sNow, 1, 10);
          ExecSQL;

          Close;
          SQL.Clear;
          SQL.Add('UpDate IONCount ');

          Case StrToInt(FormatDateTime('HH', Now)) of
            0 : SQL.Add('Set Out00 = :N1 ');
            1 : SQL.Add('Set Out01 = :N1 ');
            2 : SQL.Add('Set Out02 = :N1 ');
            3 : SQL.Add('Set Out03 = :N1 ');
            4 : SQL.Add('Set Out04 = :N1 ');
            5 : SQL.Add('Set Out05 = :N1 ');
            6 : SQL.Add('Set Out06 = :N1 ');
            7 : SQL.Add('Set Out07 = :N1 ');
            8 : SQL.Add('Set Out08 = :N1 ');
            9 : SQL.Add('Set Out09 = :N1 ');
            10: SQL.Add('Set Out10 = :N1 ');
            11: SQL.Add('Set Out11 = :N1 ');
            12: SQL.Add('Set Out12 = :N1 ');
            13: SQL.Add('Set Out13 = :N1 ');
            14: SQL.Add('Set Out14 = :N1 ');
            15: SQL.Add('Set Out15 = :N1 ');
            16: SQL.Add('Set Out16 = :N1 ');
            17: SQL.Add('Set Out17 = :N1 ');
            18: SQL.Add('Set Out18 = :N1 ');
            19: SQL.Add('Set Out19 = :N1 ');
            20: SQL.Add('Set Out20 = :N1 ');
            21: SQL.Add('Set Out21 = :N1 ');
            22: SQL.Add('Set Out22 = :N1 ');
            23: SQL.Add('Set Out23 = :N1 ');
          end;
          SQL.Add('Where ParkNo = :N2 and UnitNo = :N3 and ProcDate = :N4');
          Parameters.ParamByName('N1').Value:= 1;
          Parameters.ParamByName('N2').Value:= nCurrParkNo;
          Parameters.ParamByName('N3').Value:= nLprNo;
          Parameters.ParamByName('N4').Value:= Copy(sNow, 1, 10);
          ExecSQL;
        end;

        Close;
        SQL.Clear;
        SQL.Add('Select * from TKProc where ParkNo = :N1 and UnitNo = :N2 and ');
        SQL.Add('ProcDate = :N3 and ProcTime = :N4');
        Parameters.ParamByName('N1').Value:= nCurrParkNo;
        Parameters.ParamByName('N2').Value:= nCurrUnitNo;
        Parameters.ParamByName('N3').Value:= Copy(sNow, 1, 10);
        Parameters.ParamByName('N4').Value:= Copy(sNow, 12, 8);
        Open;

        if RecordCount <= 0 then
        begin
          Close;
          SQL.Clear;
          SQL.Add('Insert Into TKProc ');
          SQL.Add('(ParkNo, UnitNo, ProcDate, ProcTime, TKType, CarType, FeeNo, ');
          SQL.Add('TKNo, TKParkNo, TKUnitNo, CarNo, InDate, InTime, ParkingMin, ');
          SQL.Add('TotFee, TotDC, RealFee, RecvAmt, Change, DCCnt, MNo, UnPaid, ');
          SQL.Add('ChkClosing, CommercialTariff, SpecialTariff, PayType) ');
          SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, ');
          SQL.Add(':N11, :N12, :N13, :N14, :N15, :N16, :N17, :N18, :N19, :N20, ');
          SQL.Add(':N21, :N22, :N23, :N24, :N25, :N26)');
          Parameters.ParamByName('N1' ).Value:= nCurrParkNo;
          Parameters.ParamByName('N2' ).Value:= nCurrUnitNo;
          Parameters.ParamByName('N3' ).Value:= Copy(sNow, 1, 10);
          Parameters.ParamByName('N4' ).Value:= Copy(sNow, 12, 8);
          Parameters.ParamByName('N5' ).Value:= nTKType;
          Parameters.ParamByName('N6' ).Value:= nCarType;
          Parameters.ParamByName('N7' ).Value:= nFeeNo;
          Parameters.ParamByName('N8' ).Value:= sInTKNo;
          Parameters.ParamByName('N9' ).Value:= nCurrParkNo;
          Parameters.ParamByName('N10').Value:= nInUnitNo;
          Parameters.ParamByName('N11').Value:= sInCarNo;
          Parameters.ParamByName('N12').Value:= sInDate;
          Parameters.ParamByName('N13').Value:= sInTime;
          Parameters.ParamByName('N14').Value:= nParkingMin;
          Parameters.ParamByName('N15').Value:= 0;
          Parameters.ParamByName('N16').Value:= 0;
          Parameters.ParamByName('N17').Value:= 0;
          Parameters.ParamByName('N18').Value:= 0;
          Parameters.ParamByName('N19').Value:= 0;
          Parameters.ParamByName('N20').Value:= 0;
          Parameters.ParamByName('N21').Value:= nCurrMNo;
          Parameters.ParamByName('N22').Value:= 0;
          Parameters.ParamByName('N23').Value:= 0;
          Parameters.ParamByName('N24').Value:= 0;
          Parameters.ParamByName('N25').Value:= 0;
          Parameters.ParamByName('N26').Value:= 1;
          ExecSQL;
        end;

        Close;
        SQL.Clear;
        SQL.Add('Select * from IONData Where ParkNo = :N1 and UnitNo = :N2 and ProcDate = :N3 and ');
        SQL.Add('ProcTime = :N4 and TKNo = :N5');
        Parameters.ParamByName('N1').Value:= nCurrParkNo;
        Parameters.ParamByName('N2').Value:= nInUnitNo;
        Parameters.ParamByName('N3').Value:= sInDate;
        Parameters.ParamByName('N4').Value:= sInTime;
        Parameters.ParamByName('N5').Value:= sInTKNo;
        Open;

        if RecordCount > 0 then
        begin
          //InData에 입차자료가 있으면...
          Close;
          SQL.Clear;
          SQL.Add('Update IONData Set OutUnitNo = :N1, OutDate = :N2, OutTime = :N3, OutChk = :N4, ');
          SQL.Add('OutImage1 = :N5, OutCarNo1 = :N6, OutImage2 = :N7, OutCarNo2 = :N8, ');
          SQL.Add('OutRecog1 = :N9, OutRecog2 = :N10, Reserve3 = :N16 ');
          SQL.Add('where ParkNo = :N11 and UnitNo = :N12 and ProcDate = :N13 and ProcTime = :N14 and TKNo = :N15');
          Parameters.ParamByName('N1' ).Value:= nLprNo;
          Parameters.ParamByName('N2' ).Value:= Copy(sNow, 1, 10);
          Parameters.ParamByName('N3' ).Value:= Copy(sNow, 12, 8);
          Parameters.ParamByName('N4' ).Value:= 4;
          Parameters.ParamByName('N5' ).Value:= sLprFile1;
          Parameters.ParamByName('N6' ).Value:= sLprCarNo1;
          Parameters.ParamByName('N7' ).Value:= sLprFile2;
          Parameters.ParamByName('N8' ).Value:= sLprCarNo2;
          Parameters.ParamByName('N9' ).Value:= nLprRecog1;
          Parameters.ParamByName('N10').Value:= nLprRecog2;
          Parameters.ParamByName('N11').Value:= nCurrParkNo;
          Parameters.ParamByName('N12').Value:= nInUnitNO;
          Parameters.ParamByName('N13').Value:= sInDate;
          Parameters.ParamByName('N14').Value:= sInTime;
          Parameters.ParamByName('N15').Value:= sInTKNo;

          if bMiProc then
            Parameters.ParamByName('N16').Value:= '미인식처리'
          else
          if bManualOut then
            Parameters.ParamByName('N16').Value:= '수동출차'
          else
            Parameters.ParamByName('N16').Value:= '';
          ExecSQL;
        end
        else
        begin
          //InData에 입차자료가 없으면...
          ExceptLogging('TfrmMain.NormalOut: 입차자료없음-' + sLprCarNo1 + ', ' + sLprCarNo2);
        end;

        Close;
        SQL.Clear;
        SQL.Add('Select * from IONCount where ProcDate = :N1');
        Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', Now);
        Open;
        nNOutCnt:= 0;

        for i:= 0 to 23 do
          nNOutCnt:= nNOutCnt + FieldByName('Out' + MG_InsZero(IntToStr(i), 2)).AsInteger;
      end;
      DspProc(2, 1, '회차허용차량' + MG_Left(sInCarNo, 12), sDspIP);
      OutOpen;
      NGridData(sInCarNo + '^' + Copy(sNow, 1, 10) + ' ' + Copy(sNow, 12, 8) + '^출 차');
      sPrtData:= '';
      ClearFormData;
    end
    else
    begin
      sNowLprFile1 := sLprFile1;
      sNowLprCarNo1:= sLprCarNo1;
      sNowLprFile2 := sLprFile2;
      sNowLprCarNo2:= sLprCarNo2;
      sNowIOTime   := sIOTime;
      nNowLprNo    := nLprNo;
      nNowLprInOut := nLprInOut;
      nNowLprRecog1:= nLprRecog1;
      nNowLprRecog2:= nLprRecog2;
      sNowInTKNo   := sInTKNo;
      nNowInUnitNo := nInUnitNo;
      sNowInDate   := sInDate;
      sNowInTime   := sInTime;
      sNowInCarNo  := sInCarNo;
      sNowOutDate  := Copy(sNow, 1, 10);
      sNowOutTime  := Copy(sNow, 12, 8);

      //FeeCalc(sNowInDate + ' ' + Copy(sNowInTime, 1, 5), Copy(sNow, 1, 16));
      nTotYogum:= FeeCalc(nCurrParkNo, nFeeNo, PAnsiChar(sNowInDate + ' ' + Copy(sNowInTime, 1, 5)),
                          PAnsiChar(Copy(sNow, 1, 16)));

      edtTotYogum.Text:= IntToStr(nTotYogum);
      edtTotYogum.AutoThousandSeparator:= True;
      edtProcYogum.Text:= IntToStr(nTotYogum);
      edtProcYogum.AutoThousandSeparator:= True;
      pnlTot.Text:= edtTotYogum.Text + '원';
      pnlFee.Caption:= edtTotYogum.Text + '원';
      pnlDC.Text:= edtDCYogum.Text + '원';
      pnYogum.Visible:= True;
      pnN.Visible:= True;
      pnInit.Visible:= False;

      if nDCList > 0 then
      begin
        pnDCBtn.Visible:= True;
        sp2.Visible:= False;
      end;
      DspProc(2, 1, '주차요금    ' + MG_Right(pnlFee.Caption, 12), sDspIP);

      btnProc.Enabled:= True;
      btnCancel.Enabled:= True;
      DCEnable(True);
      btnReceipt.Visible:= False;
      mnuReceipt.Enabled:= False;
      btnLost.Enabled:= False;
      btnInOpen  .Enabled:= False;
      btnInClose .Enabled:= False;
      btnOutOpen .Enabled:= False;
      btnOutClose.Enabled:= False;
      mnuInOpen  .Enabled:= False;
      mnuInClose .Enabled:= False;
      mnuOutOpen .Enabled:= False;
      mnuOutClose.Enabled:= False;
      sProcTime:= sNow;
      sDCOutTime:= sNow;
    end;
  except
    on E: Exception do ExceptLogging('TfrmMain.NormalOut: ' + aString(E.Message));
  end;
end;

procedure TfrmMain.NormalProc(sLprFile1, sLprCarNo1, sLprFile2, sLprCarNo2, sIOTime: aString;
                              nLprNo, nLprInOut, nLprRecog1, nLprRecog2: Byte; sDspIP: aString);
var
  sTKNo, sLprDate, sLprTime: aString;
begin
  try
    sLprDate:= Copy(sIOTime, 1, 10);
    sLprTime:= Copy(sIOTime, 12, 8);

    if nLprInOut = 1 then
    begin
      //입차처리...
      sTKNo:= MG_InsZero(IntToStr(GetTickCount), 10);

      with dmTables.qryNormal do
      begin
        Close;
        SQL.Clear;
        Close;
        SQL.Clear;
        SQL.Add('Insert Into IONData ');
        SQL.Add('(ParkNo, UnitNo, ProcDate, ProcTime, TKNo, TKType, CarType, InImage1, InCarNo1, ');
        SQL.Add('InImage2, InCarNo2, Status, InRecog1, InRecog2) ');
        SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, :N12, :N13, :N14)');
        Parameters.ParamByName('N1' ).Value:= nCurrParkNo;
        Parameters.ParamByName('N2' ).Value:= nLprNo;
        Parameters.ParamByName('N3' ).Value:= sLprDate;
        Parameters.ParamByName('N4' ).Value:= sLprTime;
        Parameters.ParamByName('N5' ).Value:= sTKNo;
        Parameters.ParamByName('N6' ).Value:= 1;
        Parameters.ParamByName('N7' ).Value:= 1;
        Parameters.ParamByName('N8' ).Value:= sLprFile1;
        Parameters.ParamByName('N9' ).Value:= sLprCarNo1;
        Parameters.ParamByName('N10').Value:= sLprFile2;
        Parameters.ParamByName('N11').Value:= sLprCarNo2;
        Parameters.ParamByName('N12').Value:= 1;
        Parameters.ParamByName('N13').Value:= nLprRecog1;
        Parameters.ParamByName('N14').Value:= nLprRecog2;
        ExecSQL;

        if (nLprRecog1 = 1) or (nLprRecog2 = 1) then
        begin
          if nLprRecog1 = 1 then
          begin
            NGridData(sLprCarNo1 + '^' + sLprDate + ' ' + sLprTime + '^입 차');
            DspProc(1, 2, '  일반차량    ' + MG_Left(sLprCarNo1, 12), sDspIP);
          end
          else
          if nLprRecog2 = 1 then
          begin
            NGridData(sLprCarNo2 + '^' + sLprDate + ' ' + sLprTime + '^입 차');
            DspProc(1, 2, '  일반차량    ' + MG_Left(sLprCarNo2, 12), sDspIP);
          end;
        end
        else
        begin
          PartGridData(sLprCarNo1 + '^' + sLprDate + ' ' + sLprTime);
          DspProc(1, 2, '  일반차량  ' + MG_Left(sLprCarNo1, 12), sDspIP);
        end;
        ExceptLogging('일반차량입차: ' + sLprCarNo1 + ', ' + sLprCarNo2);
      end;
    end
    else
    if nLprInOut = 2 then
    begin
      //출차처리...
      NormalOut(sLprFile1, sLprCarNo1, sLprFile2, sLprCarNo2, sIOTime, nLprNo, nLprInOut, nLprRecog1, nLprRecog2, sDspIP);
    end;
  except
    on E: Exception do ExceptLogging('TfrmMain.NormalProc: ' + aString(E.Message));
  end;
end;

procedure TfrmMain.LprDataProc(nNo: Word; sLprData, sLprIP, sDspIP: aString);
var
  sCarNo1, sCarNo2, sTime, sTemp, sResult,
  sTest, sDir, sLocal1, sLocal2: String;
  sFile1, sFile2, sImgFile1, sImgFile2: String;
  nRecog1, nRecog2, nIO, i: Byte;
  hr: HRESULT;
begin
  try
    sCarNo1:= '';
    sCarNo2:= '';
    sFile1:= '';
    sFile2:= '';
    nRecog1:= 0;
    nRecog2:= 0;

    if Copy(sLprData, 1, 2) = 'NW' then
    begin
      //후면촬영결과가 전면촬영차량과 다르다. (새로운 차량이다)
      //NW제거
      sTemp:= Copy(sLprData, Pos('#', sLprData)+1, Length(sLprData)-Pos('#', sLprData));

      //CH제거
      sTemp:= Copy(sTemp, Pos('#', sTemp)+1, Length(sTemp)-Pos('#', sTemp));

      //차량번호 추출
      sCarNo1:= Copy(sTemp, 1, Pos('#', sTemp)-1);

      //차량번호제거
      sTemp:= Copy(sTemp, Pos('#', sTemp)+1, Length(sTemp)-Pos('#', sTemp));

      //인식여부 추출
      if (Copy(sTemp, 1, 1) = 'N') or (Copy(sTemp, 1, 1) = 'O') then
        nRecog1:= 1
      else
      if Copy(sTemp, 1, 1) = 'P' then
        nRecog1:= 2
      else
        nRecog1:= 3;

      sFile1:= Copy(sTemp, Pos('#', sTemp)+1, Length(sTemp)-Pos('#', sTemp));
      sLocal1:= Copy(sFile1, Pos('CH', sFile1), Length(sFile1) - (Pos('CH', sFile1)-1));
      sTime:= MG_StrToStr(Copy(sFile1, Pos('_', sFile1)+1, 14), '####-##-## ##:##:##');

      //인식여부제거하여 파일명 추출
      sFile1:= 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr(sFile1, '\', '/');
    end
    else
    if Copy(sLprData, 1, 2) = 'UP' then
    begin
      //오인식으로 전면과 후면촬영결과가 다르다...
      //이때는 CarNo1과 CarNo2, Image1, Image2를 구분하여 넣는다.
      //전면차량번호와 입차일시를 가지고 DB검색하여 CarNo2와 Image2를 업데이트한다.

      //UP제거
      sTemp:= Copy(sLprData, Pos('#', sLprData)+1, Length(sLprData)-Pos('#', sLprData));

      //CH제거
      sTemp:= Copy(sTemp, Pos('#', sTemp)+1, Length(sTemp)-Pos('#', sTemp));

      //차량번호1 추출
      sCarNo1:= Copy(sTemp, 1, Pos('#', sTemp)-1);

      //차량번호1제거
      sTemp:= Copy(sTemp, Pos('#', sTemp)+1, Length(sTemp)-Pos('#', sTemp));

      //인식여부1 추출
      if (Copy(sTemp, 1, 1) = 'N') or (Copy(sTemp, 1, 1) = 'O') then
        nRecog1:= 1
      else
      if Copy(sTemp, 1, 1) = 'P' then
        nRecog1:= 2
      else
        nRecog1:= 3;

      //인식여부1제거
      sTemp:= Copy(sTemp, Pos('#', sTemp)+1, Length(sTemp)-Pos('#', sTemp));

      //파일명1 추출
      sFile1:= Copy(sTemp, Pos('#', sTemp)+1, Length(sTemp)-Pos('#', sTemp));
      sLocal1:= Copy(sFile1, Pos('CH', sFile1), Length(sFile1) - (Pos('CH', sFile1)-1));
      sTime:= MG_StrToStr(Copy(sFile1, Pos('_', sFile1)+1, 14), '####-##-## ##:##:##');

      //인식여부제거하여 파일명 추출
      sFile1:= 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr(sFile1, '\', '/');

      //파일명1제거
      sTemp:= Copy(sTemp, Pos('#', sTemp)+1, Length(sTemp)-Pos('#', sTemp));

      //CH제거
      sTemp:= Copy(sTemp, Pos('#', sTemp)+1, Length(sTemp)-Pos('#', sTemp));

      //차량번호2 추출
      sCarNo2:= Copy(sTemp, 1, Pos('#', sTemp)-1);

      //차량번호2제거
      sTemp:= Copy(sTemp, Pos('#', sTemp)+1, Length(sTemp)-Pos('#', sTemp));

      //인식여부2 추출
      if (Copy(sTemp, 1, 1) = 'N') or (Copy(sTemp, 1, 1) = 'O') then
        nRecog2:= 1
      else
      if Copy(sTemp, 1, 1) = 'P' then
        nRecog2:= 2
      else
        nRecog2:= 3;

      sLocal2:= Copy(sTemp, Pos('#', sTemp)+1, Length(sTemp)-Pos('#', sTemp));
      sLocal2:= Copy(sLocal2, Pos('CH', sLocal2), Length(sLocal2) - (Pos('CH', sLocal2)-1));

      //인식여부2제거하여 파일명2 추출
      sFile2:= 'http://' + sLprIP + ':9080/MSImage' +
               MG_ReplaceStr(Copy(sTemp, Pos('#', sTemp)+1, Length(sTemp)-Pos('#', sTemp)), '\', '/');
    end
    else
    if Copy(sLprData, 1, 2) = 'NP' then
    begin
      //전면촬영된 차량과 후면촬영된 차량이 다르다.
      //이때는 CarNo1과 CarNo2를 개별차량으로 하여 차량2대를 입차처리한다.

      //NP제거
      sTemp:= Copy(sLprData, Pos('#', sLprData)+1, Length(sLprData)-Pos('#', sLprData));

      //CH제거
      sTemp:= Copy(sTemp, Pos('#', sTemp)+1, Length(sTemp)-Pos('#', sTemp));

      //차량번호1 추출
      sCarNo1:= Copy(sTemp, 1, Pos('#', sTemp)-1);

      //차량번호1제거
      sTemp:= Copy(sTemp, Pos('#', sTemp)+1, Length(sTemp)-Pos('#', sTemp));

      //인식여부1 추출
      if (Copy(sTemp, 1, 1) = 'N') or (Copy(sTemp, 1, 1) = 'O') then
        nRecog1:= 1
      else
      if Copy(sTemp, 1, 1) = 'P' then
        nRecog1:= 2
      else
        nRecog1:= 3;

      //인식여부1제거
      sTemp:= Copy(sTemp, Pos('#', sTemp)+1, Length(sTemp)-Pos('#', sTemp));

      //파일명1 추출
      sFile1:= Copy(sTemp, Pos('#', sTemp)+1, Length(sTemp)-Pos('#', sTemp));
      sLocal1:= Copy(sFile1, Pos('CH', sFile1), Length(sFile1) - (Pos('CH', sFile1)-1));
      sTime:= MG_StrToStr(Copy(sFile1, Pos('_', sFile1)+1, 14), '####-##-## ##:##:##');

      //인식여부제거하여 파일명 추출
      sFile1:= 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr(sFile1, '\', '/');

      //파일명1제거
      sTemp:= Copy(sTemp, Pos('#', sTemp)+1, Length(sTemp)-Pos('#', sTemp));

      //CH제거
      sTemp:= Copy(sTemp, Pos('#', sTemp)+1, Length(sTemp)-Pos('#', sTemp));

      //차량번호2 추출
      sCarNo2:= Copy(sTemp, 1, Pos('#', sTemp)-1);

      //차량번호2제거
      sTemp:= Copy(sTemp, Pos('#', sTemp)+1, Length(sTemp)-Pos('#', sTemp));

      //인식여부2 추출
      if (Copy(sTemp, 1, 1) = 'N') or (Copy(sTemp, 1, 1) = 'O') then
        nRecog2:= 1
      else
      if Copy(sTemp, 1, 1) = 'P' then
        nRecog2:= 2
      else
        nRecog2:= 3;

      sLocal2:= Copy(sTemp, Pos('#', sTemp)+1, Length(sTemp)-Pos('#', sTemp));
      sLocal2:= Copy(sLocal2, Pos('CH', sLocal2), Length(sLocal2) - (Pos('CH', sLocal2)-1));

      //인식여부2제거하여 파일명2 추출
      sFile2:= 'http://' + sLprIP + ':9080/MSImage' +
               MG_ReplaceStr(Copy(sTemp, Pos('#', sTemp)+1, Length(sTemp)-Pos('#', sTemp)), '\', '/');
    end
    else
    begin
      //CH제거
      sTemp:= Copy(sLprData, Pos('#', sLprData)+1, Length(sLprData)-Pos('#', sLprData));

      //차량번호 추출
      sCarNo1:= Copy(sTemp, 1, Pos('#', sTemp)-1);

      //차량번호제거
      sTemp:= Copy(sTemp, Pos('#', sTemp)+1, Length(sTemp)-Pos('#', sTemp));

      //인식여부 추출
      if (Copy(sTemp, 1, 1) = 'N') or (Copy(sTemp, 1, 1) = 'O') then
        nRecog1:= 1
      else
      if Copy(sTemp, 1, 1) = 'P' then
        nRecog1:= 2
      else
        nRecog1:= 3;

      //인식여부제거하여 파일명 추출
      sFile1:= Copy(sTemp, Pos('#', sTemp)+1, Length(sTemp)-Pos('#', sTemp));
      sLocal1:= Copy(sFile1, Pos('CH', sFile1), Length(sFile1) - (Pos('CH', sFile1)-1));
      sTime:= MG_StrToStr(Copy(sFile1, Pos('_', sFile1)+1, 14), '####-##-## ##:##:##');

      //인식여부제거하여 파일명 추출
      sFile1:= 'http://' + sLprIP + ':9080/MSImage' + MG_ReplaceStr(sFile1, '\', '/');
    end;
    ExceptLogging('LPR Check: ' + sCarNo1 + ',' + sFile1 + ',' + IntToStr(nRecog1) + ',' +
                                  sCarNo2 + ',' + sFile2 + ',' + IntToStr(nRecog2) + ', ' + sTime);
    sDir:= sImageDir + '\' + Copy(sTime, 1, 4) + '\' + Copy(sTime, 6, 2) + '\' +
           Copy(sTime, 9, 2) + '\' + IntToStr(nNo);

    if not DirectoryExists(sDir) then
    begin
      if not ForceDirectories(sDir) then
        ExceptLogging('이미지저장폴더 생성실패: ' + sDir);
    end;

    sImgFile1:= sDir + '\' + sLocal1;
    sImgFile2:= sDir + '\' + sLocal2;

    if sFile1 <> '' then
    begin
      if not DownloadFileHTTP(wString(sFile1), wString(sImgFile1)) then
        ExceptLogging('File Down 실패: ' + sFile1)
      else
      begin
        sOutLprFile:= sFile1;
        sOutLocalFile:= sImgFile1;
      end;
    end;

    if sFile2 <> '' then
    begin
      if not DownloadFileHTTP(wString(sFile2), wString(sImgFile2)) then
        ExceptLogging('File Down 실패: ' + sFile2)
      else
      begin
        sOutLprFile:= sFile2;
        sOutLocalFile:= sImgFile2;
      end;
    end;

    for i:= 1 to 10 do
    begin
      if RLpr[i].nUnitNo = nNo then
        nIO:= RLpr[i].nIO;
    end;

    with dmTables.qryLprProc do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from CustInfo ');

      if sCarNo2 <> '' then
      begin
        SQL.Add('where (CarNo = :N1) or (CarNo = :N2)');
        Parameters.ParamByName('N1').Value:= sCarNo1;
        Parameters.ParamByName('N2').Value:= sCarNo2;
        Open;
      end
      else
      begin
        SQL.Add('where CarNo = :N1');
        Parameters.ParamByName('N1').Value:= sCarNo1;
        Open;
      end;

      if RecordCount > 0 then
      begin
        //등록된 정기차량이면...
        sResult:= RecvLprProc(sFile1, sCarNo1, sFile2, sCarNo2, sTime, nNo, nIO, nRecog1, nRecog2, sDspIP);

        try
          if (nRecog1 = 1) and (FileExists(sImgFile1)) then
            imgIn.Picture.LoadFromFile(sImgFile1)
          else
          if (nRecog2 = 1) and (FileExists(sImgFile2)) then
            imgIn.Picture.LoadFromFile(sImgFile2)
          else
          if FileExists(sImgFile1) then
            imgIn.Picture.LoadFromFile(sImgFile1)
          else
            imgIn.Picture.Assign(Nil);
        except
          on E: Exception do ExceptLogging('이미지 로드 에러: ' + aString(E.Message));
        end;
        GridData(sResult);
      end
      else
      begin
        //일반차량 처리...
        NormalProc(sFile1, sCarNo1, sFile2, sCarNo2, sTime, nNo, nIO, nRecog1, nRecog2, sDspIP);

        if nIO = 1 then
        begin
          try
            if (nRecog1 = 1) and FileExists(sImgFile1) then
              imgNIn.Picture.LoadFromFile(sImgFile1)
            else
            if (nRecog2 = 1) and FileExists(sImgFile2) then
              imgNIn.Picture.LoadFromFile(sImgFile2)
            else
            if FileExists(sImgFile1) then
            begin
              imgOut.Picture.LoadFromFile(sImgFile1);
            end
            else
              ExceptLogging('파일없음: ' + sImgFile1);
          except
            on E: Exception do ExceptLogging('이미지 로드 에러: ' + aString(E.Message));
          end;
        end
        else
        if nIO = 2 then
        begin
          try
            if nRecog1 = 1 then
            begin
              if FileExists(sImgFile1) then
              begin
                imgNOut.Picture.LoadFromFile(sImgFile1);
              end
              else
                ExceptLogging('파일없음: ' + sImgFile1);
            end
            else
            if nRecog2 = 1 then
            begin
              if FileExists(sImgFile2) then
                imgNOut.Picture.LoadFromFile(sImgFile2)
              else
                ExceptLogging('파일없음: ' + sImgFile2);
            end
            else
            begin
              if FileExists(sImgFile1) then
                imgNOut.Picture.LoadFromFile(sImgFile1)
              else
                ExceptLogging('파일없음: ' + sImgFile1);
            end;
          except
            on E: Exception do ExceptLogging('이미지 로드 에러: ' + aString(E.Message));
          end;
        end;
      end;
    end;
  except
    on E: Exception do ExceptLogging('LprDataProc: ' + aString(E.Message));
  end;
end;

procedure TfrmMain.ICMPReply(ASender: TComponent; const ReplyStatus: TReplyStatus);
begin
  case ReplyStatus.ReplyStatusType of
    rsTimeOut: ping_success:= False;
    rsErrorUnreachable: ping_success:= False;
    rsEcho: ping_success:= True;
  end;
end;

function TfrmMain.is_ping(IP: AnsiString): Boolean;
begin
  Result:= False;
  try
    with ICMP do
    begin
      OnReply:= ICMPReply;
      ReceiveTimeOut:= 2000;
      Host:= wString(IP);
      Ping;
    end;
    Result:= ping_success;
  except
    on E: Exception do ExceptLogging('TfrmMain.is_ping: ' + aString(E.Message));
  end;
end;

procedure TfrmMain.lbReceiptDblClick(Sender: TObject);
var
  i, nSel: Integer;
  sSend: aString;
begin
  nSel:= 0;

  for i := 0 to (lbReceipt.Items.Count - 1) do
  begin
    if lbReceipt.Selected[i] then nSel:= i+1;
  end;
  sSend:= RReceipt[nSel].sRpt;

  if comPrn.Open and (sSend <> '') then
  begin
    comPrn.PutString(sSend);
    sSend:= '';
  end;
end;

procedure TfrmMain.btnCancelClick(Sender: TObject);
begin
  ClearFormData;
end;

procedure TfrmMain.FormAlign;
begin
    pnlReceipt.Top := (frmMain.ClientHeight - pnlReceipt.Height) div 2;
    pnlReceipt.Left:= (frmMain.ClientWidth - pnlReceipt.Width) div 2;
    pnRegSeek.Top := (frmMain.ClientHeight - pnRegSeek.Height) div 2;
    pnRegSeek.Left:= (frmMain.ClientWidth - pnRegSeek.Width) div 2;
    pnModify.Top := (frmMain.ClientHeight - pnModify.Height) div 2;
    pnModify.Left:= (frmMain.ClientWidth - pnModify.Width) div 2;
    pnManual.Top := (frmMain.ClientHeight - pnManual.Height) div 2;
    pnManual.Left:= (frmMain.ClientWidth - pnManual.Width) div 2;
    pnManualOut.Top := (frmMain.ClientHeight - pnManualOut.Height) div 2;
    pnManualOut.Left:= (frmMain.ClientWidth - pnManualOut.Width) div 2;

    pnLost.Top:= pnN.Top;
    pnLost.Left:= pnN.Left;
    pnInit.Top:= pnYogum.Top;
    pnInit.Left:= pnYogum.Left;
    pnVan.Top:= pnYogum.Top;
    pnVan.Left:= pnYogum.Left;
    edtNo.Color:= pnDCBtn.Color;
    edtInDate.Color:= pnDCBtn.Color;
    pnlPTime.Color:= pnDCBtn.Color;
    pnlTot.Color:= pnDCBtn.Color;
    pnlDC.Color:= pnDCBtn.Color;
    pnlDCList.Color:= pnDCBtn.Color;

    pnLostImage.Left:= 615;
    pnLostImage.Top := 80;

    sgIO.Color:= pnDCBtn.Color;
    cmbFeeItem.Color:= pnDCBtn.Color;
    pnlNow.Color:= pnDCBtn.Color;
    pnlStart.Color:= pnDCBtn.Color;
    pnlCashier.Color:= pnDCBtn.Color;
    pnlMTot.Color:= pnDCBtn.Color;
    pnlMCreditTot.Color:= pnDCBtn.Color;
    edtLostTime.Color:= pnDCBtn.Color;
    edtLostDate.Color:= pnDCBtn.Color;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Byte;
begin
  try
    ExceptLogging('Program Close!');

    for i:= 1 to 3 do
    begin
      with frmMain do
      begin
        if TClientSocket(FindComponent('csInLpr' + IntToStr(i))).Active then
          TClientSocket(FindComponent('csInLpr' + IntToStr(i))).Close;
      end;
    end;

    for i:= 1 to 3 do
    begin
      with frmMain do
      begin
        if TClientSocket(FindComponent('csOutLpr' + IntToStr(i))).Active then
          TClientSocket(FindComponent('csOutLpr' + IntToStr(i))).Close;
      end;
    end;

    for i:= 1 to 3 do
    begin
      with frmMain do
      begin
        if TClientSocket(FindComponent('csInDsp' + IntToStr(i))).Active then
          TClientSocket(FindComponent('csInDsp' + IntToStr(i))).Close;
      end;
    end;

    for i:= 1 to 3 do
    begin
      with frmMain do
      begin
        if TClientSocket(FindComponent('csOutDsp' + IntToStr(i))).Active then
          TClientSocket(FindComponent('csOutDsp' + IntToStr(i))).Close;
      end;
    end;

    Timer1.Enabled:= False;

    with dmTables do
    begin
      if ADODB.Connected then ADODB.Connected:= False;
    end;
    iSetup.Free;
  except
    on E: Exception do ExceptLogging('TfrmMain.FormClose: ' + aString(E.Message));
  end;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if MessageDlg('요금계산기 프로그램을 종료할까요?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    CanClose:= True
  else
    CanClose:= False;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  try
    CreateFileMapping( $FFFFFFFF, nil, PAGE_READWRITE, 0, 1, 'Parking_FC' );

    if GetLastError=ERROR_ALREADY_EXISTS then
    begin
      ShowMessage('요금계산기프로그램이 이미 실행중입니다.'#13#13#10 + '확인하여주세요!');
      halt;
    end;
    sCurrRunDir:= aString(ExtractFileDir(Application.ExeName));

    if not DirectoryExists('Log') then MkDir('Log');
    if not DirectoryExists('Temp') then MkDir('Temp');
  except
    on E: Exception do ExceptLogging('TfrmMain.FormCreate: ' + aString(E.Message));
  end;
end;

procedure TfrmMain.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and btnProc.Enabled then
    btnProcClick(Self);

  if (Key = #27) and btnCancel.Enabled then
    btnCancelClick(Self);
end;

procedure TfrmMain.FormShow(Sender: TObject);
var
  sDBString: aString;
  i, j: Integer;
  sTemp1, sTemp2: String;
begin
  try
    ExceptLogging('Program Start!');
    FormAlign;

    iSetup:= TIniFile.Create(ExtractFileDir(Application.ExeName) + '\ParkSet.ini');
    sDBIP:= iSetup.ReadString('PARKING', 'DB IP', '');
    sDBID:= iSetup.ReadString('PARKING', 'DB ID', '');
    sDBPW:= iSetup.ReadString('PARKING', 'DB PW', '');
    nCurrUnitNo:= iSetup.ReadInteger('PARKING', 'UnitNo', 0);
    sImageDir:= iSetup.ReadString('PARKING', 'LPRImage', 'C:\LPRImage');

    if not DirectoryExists(sImageDir) then
    begin
      if not ForceDirectories(sImageDir) then
        ExceptLogging('이미지저장폴더 생성실패: ' + sImageDir);
    end;

    if sDBIP = '' then
      sDBIP:= aString(InputBox('DB설정 입력', 'DB IP 또는 DB서버명을 입력하여주세요', ''));

    if sDBID = '' then
      sDBID:= aString(InputBox('DB ID 입력', 'DB 접속용 ID를 입력하여주세요', ''));

    if sDBPW = '' then
      sDBPW:= aString(InputBox('DB Password 입력', 'DB 접속용 Password를 입력하여주세요', ''));

    if (sDBIP <> '') and (sDBID <> '') and (sDBPW <> '') then
    begin
      try
        //DB연결...
        dmTables.ADODB.Connected:= False;
        sDBString:= 'Provider=SQLOLEDB.1;Persist Security Info=False;';
        sDBString:= sDBString + 'User ID=' + sDBID;
        sDBString:= sDBString + ';Password=' + sDBPW;
        sDBString:= sDBString + ';Initial Catalog=PARKING;Data Source=';
        sDBString:= sDBString + sDBIP;
        dmTables.ADODB.ConnectionString:= wString(sDBString);
        dmTables.ADODB.Connected:= True;
      except
        on E: Exception do
        begin
          ExceptLogging('DB Connect Error:' + aString(E.Message));
          ShowMessage('데이터베이스 연결에 실패하였습니다. 확인하여주세요.');
          Exit;
        end;
      end;
      iSetup.WriteString('PARKING', 'DB IP', sDBIP);
      iSetup.WriteString('PARKING', 'DB ID', sDBID);
      iSetup.WriteString('PARKING', 'DB PW', sDBPW);
    end;

    if (sDBIP = '') then
    begin
      ShowMessage('DB IP 또는 서버명을 입력하여주세요.'#13#10 +
                  'DB 연결이 안되면 프로그램을 정상적으로 실행할 수 없습니다.');
      Exit;
    end;

    if (sDBID = '') then
    begin
      ShowMessage('DB 접속용 ID를 입력하여주세요.'#13#10 +
                  'DB 연결이 안되면 프로그램을 정상적으로 실행할 수 없습니다.');
      Exit;
    end;

    if (sDBPW = '') then
    begin
      ShowMessage('DB 접속용 Password를 입력하여주세요.'#13#10 +
                  'DB 연결이 안되면 프로그램을 정상적으로 실행할 수 없습니다.');
      Exit;
    end;

    with qryMainTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from ParkInfo Order By ParkNo');
      Open;

      if RecordCount > 0 then
      begin
        nCurrParkNo:= FieldByName('ParkNo').AsInteger;

        if FieldByName('ReceiptZero').AsInteger = 0 then
          bZeroReceipt:= False
        else
          bZeroReceipt:= True;
      end
      else
        ExceptLogging('설치된 주차장이 없음!');
    end;
    nLoginResult:= 0;
    NextModalDialog(TfrmLogin.Create(Self));

    if nLoginResult = 0 then
    begin
      ShowMessage('로그인에 실패하여 프로그램을 종료합니다.');
      Close;
      Exit;
    end
    else
    begin
      DBConnect(PAnsiChar(sDBIP));
      pnlStart.Text:= FormatDateTime('YYYY-MM-DD HH:NN', Now);
      pnlCashier.Text:= sCurrMName;

      with qry1 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select Sum(RealFee), Count(*) from TKProc where ProcDate = :N1 and ');
        SQL.Add('MNo = :N2 and ChkClosing = :N3 and PayType = :N4');
        Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', Now);
        Parameters.ParamByName('N2').Value:= nCurrMNo;
        Parameters.ParamByName('N3').Value:= 0;
        Parameters.ParamByName('N4').Value:= 1;
        Open;

        if RecordCount > 0 then
        begin
          nMTot:= FieldByName('COLUMN1').AsInteger;
          nMCnt:= FieldByName('COLUMN2').AsInteger;
          pnlMTot.Text:= IntToStr(nMTot) + ' 원';
          pnlMCnt.Text:= IntToStr(nMCnt) + ' 건';
        end
        else
        begin
          pnlMTot.Text:= '0 원';
          pnlMCnt.Text:= '0 건';
        end;

        Close;
        SQL.Clear;
        SQL.Add('Select Sum(RealFee), Count(*) from TKProc where ProcDate = :N1 and ');
        SQL.Add('MNo = :N2 and ChkClosing = :N3 and PayType = :N4');
        Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', Now);
        Parameters.ParamByName('N2').Value:= nCurrMNo;
        Parameters.ParamByName('N3').Value:= 0;
        Parameters.ParamByName('N4').Value:= 2;
        Open;

        if RecordCount > 0 then
        begin
          nMCreditTot:= FieldByName('COLUMN1').AsInteger;
          nMCreditCnt:= FieldByName('COLUMN2').AsInteger;
          pnlMCreditTot.Text:= IntToStr(nMCreditTot) + ' 원';
          pnlMCreditCnt.Text:= IntToStr(nMCreditCnt) + ' 건';
        end
        else
        begin
          pnlMCreditTot.Text:= '0 원';
          pnlMCreditCnt.Text:= '0 건';
        end;
      end;
    end;

    with qryMainTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select Sum(RealFee), Count(*) from TKProc where ProcDate = :N1 and ');
      SQL.Add('MNo = :N2 and ChkClosing = :N3 and PayType = :N4');
      Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', Now);
      Parameters.ParamByName('N2').Value:= nCurrMNo;
      Parameters.ParamByName('N3').Value:= 0;
      Parameters.ParamByName('N4').Value:= 1;
      Open;

      if RecordCount > 0 then
      begin
        nMTot:= FieldByName('COLUMN1').AsInteger;
        nMCnt:= FieldByName('COLUMN2').AsInteger;
        pnlMTot.Text:= IntToStr(nMTot) + ' 원';
        pnlMCnt.Text:= IntToStr(nMCnt) + ' 건';
      end
      else
      begin
        pnlMTot.Text:= '0 원';
        pnlMCnt.Text:= '0 건';
      end;

      Close;
      SQL.Clear;
      SQL.Add('Select Sum(RealFee), Count(*) from TKProc where ProcDate = :N1 and ');
      SQL.Add('MNo = :N2 and ChkClosing = :N3 and PayType = :N4');
      Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', Now);
      Parameters.ParamByName('N2').Value:= nCurrMNo;
      Parameters.ParamByName('N3').Value:= 0;
      Parameters.ParamByName('N4').Value:= 2;
      Open;

      if RecordCount > 0 then
      begin
        nMCreditTot:= FieldByName('COLUMN1').AsInteger;
        nMCreditCnt:= FieldByName('COLUMN2').AsInteger;
        pnlMCreditTot.Text:= IntToStr(nMCreditTot) + ' 원';
        pnlMCreditCnt.Text:= IntToStr(nMCreditCnt) + ' 건';
      end
      else
      begin
        pnlMCreditTot.Text:= '0 원';
        pnlMCreditCnt.Text:= '0 건';
      end;

      Close;
      SQL.Clear;
      SQL.Add('Select ParkNo, UnitNo, UnitKind, ComPort, Baudrate ');
      SQL.Add('From UnitInfo Where UnitKind = :N1 and MyNo = :N2 and ParkNo = :N3 Order By ParkNo, UnitNo');
      Parameters.ParamByName('N1').Value:= 6; //영수증프린터
      Parameters.ParamByName('N2').Value:= nCurrUnitNo;
      Parameters.ParamByName('N3').Value:= nCurrParkNo;
      Open;

      if RecordCount > 0 then
      begin
        ComPRN.Open:= False;
        ComPRN.ComNumber:= FieldByName('ComPort').AsInteger;
        ComPRN.Baud:= FieldByName('BaudRate').AsInteger;
        ComPRN.Open:= True;
      end
      else
        ExceptLogging('설치된 영수증프린터가 없음!');

      for i:= 1 to 10 do
      begin
        RLPR[i].nUnitNo:= 0;
        RLPR[i].nIO:= 0;
      end;
      j:= 1;

      Close;
      SQL.Clear;
      SQL.Add('Select ParkNo, UnitNo, UnitKind, ComPort, Baudrate, IPNo, PortNo, Reserve1 ');
      SQL.Add('From UnitInfo Where UnitKind = :N1  and MyNo = :N2 and ParkNo = :N3 Order By ParkNo, UnitNo');
      Parameters.ParamByName('N1').Value:= 8; //입구LPR
      Parameters.ParamByName('N2').Value:= nCurrUnitNo;
      Parameters.ParamByName('N3').Value:= nCurrParkNo;
      Open;

      if RecordCount > 0 then
      begin
        i:= 1;

        while not Eof do
        begin
          with frmMain do
          begin
            TClientSocket(FindComponent('csInLpr' + IntToStr(i))).Host:=
              wString(MG_StrTrim(aString(FieldByName('IPNo').AsString), ' '));
            TClientSocket(FindComponent('csInLpr' + IntToStr(i))).Port:= FieldByName('PortNo').AsInteger;
            TClientSocket(FindComponent('csInLpr' + IntToStr(i))).Tag:= FieldByName('UnitNo').AsInteger;
            TClientSocket(FindComponent('csInLpr' + IntToStr(i))).Active:= True;
            RLpr[j].nUnitNo:= FieldByName('UnitNo').AsInteger;
            RLpr[j].sDSPIP:= FieldByName('Reserve1').AsString;
            RLpr[j].nIO:= 1;
          end;
          i:= i+1;
          j:= j+1;

          if i > 3 then Break;
          Next;
        end;
        bLPR:= True;
      end
      else
        ExceptLogging('설치된 입구 LPR이 없음!');

      Close;
      SQL.Clear;
      SQL.Add('Select ParkNo, UnitNo, UnitKind, ComPort, Baudrate, IPNo, PortNo, Reserve1 ');
      SQL.Add('From UnitInfo Where UnitKind = :N1 and MyNo = :N2 and ParkNo = :N3 Order By ParkNo, UnitNo');
      Parameters.ParamByName('N1').Value:= 9; //출구LPR
      Parameters.ParamByName('N2').Value:= nCurrUnitNo;
      Parameters.ParamByName('N3').Value:= nCurrParkNo;
      Open;

      if RecordCount > 0 then
      begin
        i:= 1;

        while not Eof do
        begin
          with frmMain do
          begin
            TClientSocket(FindComponent('csOutLpr' + IntToStr(i))).Host:=
              wString(MG_StrTrim(aString(FieldByName('IPNo').AsString), ' '));
            TClientSocket(FindComponent('csOutLpr' + IntToStr(i))).Port:= FieldByName('PortNo').AsInteger;
            TClientSocket(FindComponent('csOutLpr' + IntToStr(i))).Tag:= FieldByName('UnitNo').AsInteger;
            TClientSocket(FindComponent('csOutLpr' + IntToStr(i))).Active:= True;
            RLpr[j].nUnitNo:= FieldByName('UnitNo').AsInteger;
            RLpr[j].sDSPIP:= FieldByName('Reserve1').AsString;
            RLpr[j].nIO:= 2;
          end;
          i:= i+1;
          j:= j+1;

          if i > 3 then Break;
          Next;
        end;
        bLPR:= True;
      end
      else
        ExceptLogging('설치된 출구 LPR이 없음!');

      Close;
      SQL.Clear;
      SQL.Add('Select ParkNo, UnitNo, UnitKind, ComPort, Baudrate, IPNo, PortNo ');
      SQL.Add('From UnitInfo Where UnitKind = :N1 and MyNo = :N2 Order By ParkNo, UnitNo');
      Parameters.ParamByName('N1').Value:= 10; //입구전광판
      Parameters.ParamByName('N2').Value:= nCurrUnitNo;
      Open;

      if RecordCount > 0 then
      begin
        i:= 1;

        while not Eof do
        begin
          with frmMain do
          begin
            sTemp1:= wString(MG_StrTrim(aString(FieldByName('IPNo').AsString), ' '));
            TClientSocket(FindComponent('csInDsp' + IntToStr(i))).Host:=
              wString(MG_StrTrim(aString(FieldByName('IPNo').AsString), ' '));
            TClientSocket(FindComponent('csInDsp' + IntToStr(i))).Port:= FieldByName('PortNo').AsInteger;
            TClientSocket(FindComponent('csInDsp' + IntToStr(i))).Tag:= FieldByName('UnitNo').AsInteger;
            TClientSocket(FindComponent('csInDsp' + IntToStr(i))).Active:= True;
          end;
          i:= i+1;

          if i > 3 then Break;
          Next;
        end;
        bInDsp:= True;
        btnInDsp.Enabled:= True;
        tInDsp.Enabled:= True;
      end
      else
      begin
        bInDsp:= False;
        ExceptLogging('설치된 입구전광판이 없음!');
      end;

      Close;
      SQL.Clear;
      SQL.Add('Select ParkNo, UnitNo, UnitKind, ComPort, Baudrate, IPNo, PortNo ');
      SQL.Add('From UnitInfo Where UnitKind = :N1 and MyNo = :N2 Order By ParkNo, UnitNo');
      Parameters.ParamByName('N1').Value:= 11; //출구전광판
      Parameters.ParamByName('N2').Value:= nCurrUnitNo;
      Open;

      if RecordCount > 0 then
      begin
        i:= 1;

        while not Eof do
        begin
          with frmMain do
          begin
            TClientSocket(FindComponent('csOutDsp' + IntToStr(i))).Host:=
              wString(MG_StrTrim(aString(FieldByName('IPNo').AsString), ' '));
            TClientSocket(FindComponent('csOutDsp' + IntToStr(i))).Port:= FieldByName('PortNo').AsInteger;
            TClientSocket(FindComponent('csOutDsp' + IntToStr(i))).Tag:= FieldByName('UnitNo').AsInteger;
            TClientSocket(FindComponent('csOutDsp' + IntToStr(i))).Active:= True;
          end;
          i:= i+1;

          if i > 3 then Break;
          Next;
        end;
        bOutDsp:= True;
        btnOutDsp.Enabled:= True;
        tOutDsp.Enabled:= True;
      end
      else
      begin
        bOutDsp:= False;
        ExceptLogging('설치된 출구전광판이 없음!');
      end;

      pnlNow.Text:= FormatDateTime('YYYY-MM-DD HH:NN:SS', Now);
      pnlCashier.Text:= sCurrMName;

      with cmbFeeItem do
      begin
        Items.Clear;
        Items.Add('일반요금');
      end;

      Close;
      SQL.Clear;
      SQL.Add('Select * from FeeItem where ParkNo = :N1 Order By FeeNo');
      Parameters.ParamByName('N1').Value:= nCurrParkNo;
      Open;

      if RecordCount > 0 then
      begin
        while not Eof do
        begin
          cmbFeeItem.Items.Add(IntToStr(FieldByName('FeeNo').AsInteger) + ': ' + FieldByName('FeeName').AsString);
          Next;
        end;
      end;
      cmbFeeItem.ItemIndex:= 0;
      nFeeNo:= 0;
      nItemMax:= 0;
      nTotMax:= 0;
      pnN.Visible:= True;
      pnLost.Top:= pnN.Top;
      pnLost.Left:= pnN.Left;
      btnReceipt.Left:= btnDCClear.Left;
      btnReceipt.Top := btnDCClear.Top;

      with lbReceipt do
      begin
        Items.Clear;

        for i:= 1 to 10 do
        begin
          if RReceipt[i].sInOutTime <> '' then
            Items.Add(RReceipt[i].sInOutTime);
        end;
      end;

      Close;
      SQL.Clear;
      SQL.Add('Select * from DCInfo where ParkNo = :N2 Order By DCNo');
      Parameters.ParamByName('N2').Value:= nCurrParkNo;
      Open;

      if RecordCount > 0 then
      begin
        nDCList:= RecordCount;
        First;  i:= 1;

        while not Eof do
        begin
          Case i of
            1 : begin
                  btnDC1.Caption:= FieldByName('DCName').AsString;
                  btnDC1.HelpContext:= FieldByName('DCType').AsInteger;
                  btnDC1.Tag:= FieldByName('DCNo').AsInteger;
                  btnDC1.Hint:= IntToStr(FieldByName('DCValue').AsInteger);
                  btnDC1.Visible:= True;
                  mnuDC1.Caption:= FieldByName('DCName').AsString;
                  mnuDC1.Visible:= True;
                end;

            2 : begin
                  btnDC2.Caption:= FieldByName('DCName').AsString;
                  btnDC2.HelpContext:= FieldByName('DCType').AsInteger;
                  btnDC2.Tag:= FieldByName('DCNo').AsInteger;
                  btnDC2.Hint:= IntToStr(FieldByName('DCValue').AsInteger);
                  btnDC2.Visible:= True;
                  mnuDC2.Caption:= FieldByName('DCName').AsString;
                  mnuDC2.Visible:= True;
                end;

            3 : begin
                  btnDC3.Caption:= FieldByName('DCName').AsString;
                  btnDC3.HelpContext:= FieldByName('DCType').AsInteger;
                  btnDC3.Tag:= FieldByName('DCNo').AsInteger;
                  btnDC3.Hint:= IntToStr(FieldByName('DCValue').AsInteger);
                  btnDC3.Visible:= True;
                  mnuDC3.Caption:= FieldByName('DCName').AsString;
                  mnuDC3.Visible:= True;
                end;

            4 : begin
                  btnDC4.Caption:= FieldByName('DCName').AsString;
                  btnDC4.HelpContext:= FieldByName('DCType').AsInteger;
                  btnDC4.Tag:= FieldByName('DCNo').AsInteger;
                  btnDC4.Hint:= IntToStr(FieldByName('DCValue').AsInteger);
                  btnDC4.Visible:= True;
                  mnuDC4.Caption:= FieldByName('DCName').AsString;
                  mnuDC4.Visible:= True;
                end;

            5 : begin
                  btnDC5.Caption:= FieldByName('DCName').AsString;
                  btnDC5.HelpContext:= FieldByName('DCType').AsInteger;
                  btnDC5.Tag:= FieldByName('DCNo').AsInteger;
                  btnDC5.Hint:= IntToStr(FieldByName('DCValue').AsInteger);
                  btnDC5.Visible:= True;
                  mnuDC5.Caption:= FieldByName('DCName').AsString;
                  mnuDC5.Visible:= True;
                end;

            6 : begin
                  btnDC6.Caption:= FieldByName('DCName').AsString;
                  btnDC6.HelpContext:= FieldByName('DCType').AsInteger;
                  btnDC6.Tag:= FieldByName('DCNo').AsInteger;
                  btnDC6.Hint:= IntToStr(FieldByName('DCValue').AsInteger);
                  btnDC6.Visible:= True;
                  mnuDC6.Caption:= FieldByName('DCName').AsString;
                  mnuDC6.Visible:= True;
                end;

            7 : begin
                  btnDC7.Caption:= FieldByName('DCName').AsString;
                  btnDC7.HelpContext:= FieldByName('DCType').AsInteger;
                  btnDC7.Tag:= FieldByName('DCNo').AsInteger;
                  btnDC7.Hint:= IntToStr(FieldByName('DCValue').AsInteger);
                  btnDC7.Visible:= True;
                  mnuDC7.Caption:= FieldByName('DCName').AsString;
                  mnuDC7.Visible:= True;
                end;

            8 : begin
                  btnDC8.Caption:= FieldByName('DCName').AsString;
                  btnDC8.HelpContext:= FieldByName('DCType').AsInteger;
                  btnDC8.Tag:= FieldByName('DCNo').AsInteger;
                  btnDC8.Hint:= IntToStr(FieldByName('DCValue').AsInteger);
                  btnDC8.Visible:= True;
                  mnuDC8.Caption:= FieldByName('DCName').AsString;
                  mnuDC8.Visible:= True;
                end;

            9 : begin
                  btnDC9.Caption:= FieldByName('DCName').AsString;
                  btnDC9.HelpContext:= FieldByName('DCType').AsInteger;
                  btnDC9.Tag:= FieldByName('DCNo').AsInteger;
                  btnDC9.Hint:= IntToStr(FieldByName('DCValue').AsInteger);
                  btnDC9.Visible:= True;
                  mnuDC9.Caption:= FieldByName('DCName').AsString;
                  mnuDC9.Visible:= True;
                end;

            10: begin
                  btnDC10.Caption:= FieldByName('DCName').AsString;
                  btnDC10.HelpContext:= FieldByName('DCType').AsInteger;
                  btnDC10.Tag:= FieldByName('DCNo').AsInteger;
                  btnDC10.Hint:= IntToStr(FieldByName('DCValue').AsInteger);
                  btnDC10.Visible:= True;
                  mnuDC10.Caption:= FieldByName('DCName').AsString;
                  mnuDC10.Visible:= True;
                end;

            11: begin
                  btnDC11.Caption:= FieldByName('DCName').AsString;
                  btnDC11.HelpContext:= FieldByName('DCType').AsInteger;
                  btnDC11.Tag:= FieldByName('DCNo').AsInteger;
                  btnDC11.Hint:= IntToStr(FieldByName('DCValue').AsInteger);
                  btnDC11.Visible:= True;
                  mnuDC11.Caption:= FieldByName('DCName').AsString;
                  mnuDC11.Visible:= True;
                end;

            12: begin
                  btnDC12.Caption:= FieldByName('DCName').AsString;
                  btnDC12.HelpContext:= FieldByName('DCType').AsInteger;
                  btnDC12.Tag:= FieldByName('DCNo').AsInteger;
                  btnDC12.Hint:= IntToStr(FieldByName('DCValue').AsInteger);
                  btnDC12.Visible:= True;
                  mnuDC12.Caption:= FieldByName('DCName').AsString;
                  mnuDC12.Visible:= True;
                end;

            13: begin
                  btnDC13.Caption:= FieldByName('DCName').AsString;
                  btnDC13.HelpContext:= FieldByName('DCType').AsInteger;
                  btnDC13.Tag:= FieldByName('DCNo').AsInteger;
                  btnDC13.Hint:= IntToStr(FieldByName('DCValue').AsInteger);
                  btnDC13.Visible:= True;
                  mnuDC13.Caption:= FieldByName('DCName').AsString;
                  mnuDC13.Visible:= True;
                end;

            14: begin
                  btnDC14.Caption:= FieldByName('DCName').AsString;
                  btnDC14.HelpContext:= FieldByName('DCType').AsInteger;
                  btnDC14.Tag:= FieldByName('DCNo').AsInteger;
                  btnDC14.Hint:= IntToStr(FieldByName('DCValue').AsInteger);
                  btnDC14.Visible:= True;
                  mnuDC14.Caption:= FieldByName('DCName').AsString;
                  mnuDC14.Visible:= True;
                end;

            15: begin
                  btnDC15.Caption:= FieldByName('DCName').AsString;
                  btnDC15.HelpContext:= FieldByName('DCType').AsInteger;
                  btnDC15.Tag:= FieldByName('DCNo').AsInteger;
                  btnDC15.Hint:= IntToStr(FieldByName('DCValue').AsInteger);
                  btnDC15.Visible:= True;
                  mnuDC15.Caption:= FieldByName('DCName').AsString;
                  mnuDC15.Visible:= True;
                end;

            16: begin
                  btnDC16.Caption:= FieldByName('DCName').AsString;
                  btnDC16.HelpContext:= FieldByName('DCType').AsInteger;
                  btnDC16.Tag:= FieldByName('DCNo').AsInteger;
                  btnDC16.Hint:= IntToStr(FieldByName('DCValue').AsInteger);
                  btnDC16.Visible:= True;
                  mnuDC16.Caption:= FieldByName('DCName').AsString;
                  mnuDC16.Visible:= True;
                end;

            17: begin
                  btnDC17.Caption:= FieldByName('DCName').AsString;
                  btnDC17.HelpContext:= FieldByName('DCType').AsInteger;
                  btnDC17.Tag:= FieldByName('DCNo').AsInteger;
                  btnDC17.Hint:= IntToStr(FieldByName('DCValue').AsInteger);
                  btnDC17.Visible:= True;
                  mnuDC17.Caption:= FieldByName('DCName').AsString;
                  mnuDC17.Visible:= True;
                end;

            18: begin
                  btnDC18.Caption:= FieldByName('DCName').AsString;
                  btnDC18.HelpContext:= FieldByName('DCType').AsInteger;
                  btnDC18.Tag:= FieldByName('DCNo').AsInteger;
                  btnDC18.Hint:= IntToStr(FieldByName('DCValue').AsInteger);
                  btnDC18.Visible:= True;
                  mnuDC18.Caption:= FieldByName('DCName').AsString;
                  mnuDC18.Visible:= True;
                end;

            19: begin
                  btnDC19.Caption:= FieldByName('DCName').AsString;
                  btnDC19.HelpContext:= FieldByName('DCType').AsInteger;
                  btnDC19.Tag:= FieldByName('DCNo').AsInteger;
                  btnDC19.Hint:= IntToStr(FieldByName('DCValue').AsInteger);
                  btnDC19.Visible:= True;
                  mnuDC19.Caption:= FieldByName('DCName').AsString;
                  mnuDC19.Visible:= True;
                end;

            20: begin
                  btnDC20.Caption:= FieldByName('DCName').AsString;
                  btnDC20.HelpContext:= FieldByName('DCType').AsInteger;
                  btnDC20.Tag:= FieldByName('DCNo').AsInteger;
                  btnDC20.Hint:= IntToStr(FieldByName('DCValue').AsInteger);
                  btnDC20.Visible:= True;
                  mnuDC20.Caption:= FieldByName('DCName').AsString;
                  mnuDC20.Visible:= True;
                end;
          end;
          Next;  i:= i+1;
        end;
      end;
    end;
    ClearFormData;
    GridClear;
    NGridClear;
    Timer1.Enabled:= True;
  except
    on E: Exception do ExceptLogging('TfrmMain.FormShow: ' + aString(E.Message));
  end;
end;

procedure TfrmMain.mnuCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.mnuDetailClick(Sender: TObject);
begin
  //영수증...
  if mnuDetail.Tag = 0 then
  begin
    mnuDetail.Tag:= 1;
    pnlReceipt.Visible:= True;
    mnuDetail.Caption:= '지난 영수증 숨기기';
  end
  else
  begin
    mnuDetail.Tag:= 0;
    pnlReceipt.Visible:= False;
    mnuDetail.Caption:= '지난 영수증 보기';
  end;
end;

procedure TfrmMain.mnuSetupClick(Sender: TObject);
begin
  if bMenuLock then
  begin
    ShowMessage('관리자 메뉴입니다. 먼저 메뉴잠금을 해제하여주세요!');
    Exit;
  end;
  NextModalDialog(TfrmSetup.Create(Self));

  if bSetupChange and (nCurrMNo <> 99) then
  begin
    ShowMessage('환경설정이 변경되어 프로그램을 종료합니다.'#13#10 + '프로그램을 다시 시작하여 주세요!');
    Close;
  end;
end;

procedure TfrmMain.mnuUnitInfoClick(Sender: TObject);
begin
  if bMenuLock then
  begin
    ShowMessage('관리자 메뉴입니다. 먼저 메뉴잠금을 해제하여주세요!');
    Exit;
  end;
  NextModalDialog(TfrmUnitInfo.Create(Self));

  if bSetupChange and (nCurrMNo <> 99) then
  begin
    ShowMessage('환경설정이 변경되어 프로그램을 종료합니다.'#13#10 + '프로그램을 다시 시작하여 주세요!');
    Close;
  end;
end;

procedure TfrmMain.btnDC1Click(Sender: TObject);
begin
  nProcYogum:= StrToInt(MG_StrTrim(edtProcYogum.Text, ','));
  nDCYogum:= StrToInt(MG_StrTrim(edtDCYogum.Text, ','));
  dcBtnClick(btnDC1);
end;

procedure TfrmMain.btnDC2Click(Sender: TObject);
begin
  nProcYogum:= StrToInt(MG_StrTrim(edtProcYogum.Text, ','));
  nDCYogum:= StrToInt(MG_StrTrim(edtDCYogum.Text, ','));
  dcBtnClick(btnDC2);
end;

procedure TfrmMain.btnDC3Click(Sender: TObject);
begin
  nProcYogum:= StrToInt(MG_StrTrim(edtProcYogum.Text, ','));
  nDCYogum:= StrToInt(MG_StrTrim(edtDCYogum.Text, ','));
  dcBtnClick(btnDC3);
end;

procedure TfrmMain.btnDC4Click(Sender: TObject);
begin
  nProcYogum:= StrToInt(MG_StrTrim(edtProcYogum.Text, ','));
  nDCYogum:= StrToInt(MG_StrTrim(edtDCYogum.Text, ','));
  dcBtnClick(btnDC4);
end;

procedure TfrmMain.btnDC5Click(Sender: TObject);
begin
  nProcYogum:= StrToInt(MG_StrTrim(edtProcYogum.Text, ','));
  nDCYogum:= StrToInt(MG_StrTrim(edtDCYogum.Text, ','));
  dcBtnClick(btnDC5);
end;

procedure TfrmMain.btnDC6Click(Sender: TObject);
begin
  nProcYogum:= StrToInt(MG_StrTrim(edtProcYogum.Text, ','));
  nDCYogum:= StrToInt(MG_StrTrim(edtDCYogum.Text, ','));
  dcBtnClick(btnDC6);
end;

procedure TfrmMain.btnDC7Click(Sender: TObject);
begin
  nProcYogum:= StrToInt(MG_StrTrim(edtProcYogum.Text, ','));
  nDCYogum:= StrToInt(MG_StrTrim(edtDCYogum.Text, ','));
  dcBtnClick(btnDC7);
end;

procedure TfrmMain.btnDC8Click(Sender: TObject);
begin
  nProcYogum:= StrToInt(MG_StrTrim(edtProcYogum.Text, ','));
  nDCYogum:= StrToInt(MG_StrTrim(edtDCYogum.Text, ','));
  dcBtnClick(btnDC8);
end;

procedure TfrmMain.btnDC9Click(Sender: TObject);
begin
  nProcYogum:= StrToInt(MG_StrTrim(edtProcYogum.Text, ','));
  nDCYogum:= StrToInt(MG_StrTrim(edtDCYogum.Text, ','));
  dcBtnClick(btnDC9);
end;

procedure TfrmMain.btnDCClearClick(Sender: TObject);
var
  i: Byte;
begin
  for i:= 1 to 20 do
  begin
    TMenuItem(FindComponent('mnuDC' + IntToStr(i))).Enabled:= True;
    TsPanel(FindComponent('btnDC' + IntToStr(i))).Enabled:= True;
  end;
  ClearDCProc;
  sDCOutTime:= FormatDateTime('YYYY-MM-DD HH:NN:SS', Now);
  edtProcYogum.Text:= edtTotYogum.Text;
  edtDCYogum.Text:= '0';
  nProcYogum:= StrToInt(MG_StrTrim(edtProcYogum.Text, ','));
  nDCYogum:= 0;
  pnlFee.Caption:= edtProcYogum.Text + ' 원';
  pnlDC.Text:= edtDCYogum.Text + '원';
  nDCCnt:= 0;
  pnlDCList.Text:= '';
  btnDCClear.Enabled:= False;
end;

procedure TfrmMain.btnInDspClick(Sender: TObject);
begin
  NextModalDialog(TfrmInDspSet.Create(Self));
end;

procedure TfrmMain.btnLockClick(Sender: TObject);
begin
  if bMenuLock then
  begin
    NextModalDialog(TfrmLogin.Create(Self));

    Case nLoginResult of
      1:      begin
                btnLock.Caption:= '메뉴잠금';
                bMenuLock:= False;
              end;

      0:      begin
                ShowMessage('근무자확인에 실패하여 메뉴잠금을 해제할 수 없습니다.');
                Exit;
              end;
    end;
  end
  else
  begin
    if nLoginResult = 1 then
    begin
      btnLock.Caption:= '메뉴잠금해제';
      bMenuLock:= True;
    end;
  end;
end;

procedure TfrmMain.btnLostClick(Sender: TObject);
begin
  try
    dmTables.qryUnitInfo.Open;
    imgLost.Picture.Assign(Nil);
    pnYogum.Visible:= True;
    edtLostCarNo.Text:= '';
    pnN.Visible:= False;
    pnInit.Visible:= False;
    pnLost.Visible:= True;
    pnLostImage.Visible:= True;
    btnCancel.Enabled:= True;
    Timer1.Enabled:= False;
    edtLostDate.Date:= Now;
    edtLostCarNo.SetFocus;
  except
    on E: Exception do ExceptLogging('TfrmMain.btnLostClick: ' + aString(E.Message));
  end;
end;

procedure TfrmMain.btnLostProcClick(Sender: TObject);
var
  sResult: aString;
begin
  try
    pnN.Visible:= True;
    pnLost.Visible:= False;
    pnLostImage.Visible:= False;
    bLostProc:= True;

    with dmTables.qryLprProc do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from CustInfo ');
      SQL.Add('where CarNo = :N1');
      Parameters.ParamByName('N1').Value:= sLostInCarNo;
      Open;

      if RecordCount > 0 then
      begin
        //등록된 정기차량이면...
        sResult:= RecvLprProc(sNowLprFile1, sLostInCarNo, sNowLprFile2, sNowLprCarNo2,
                              sNowIOTime, nNowLprNo, nNowLprInOut, nNowLprRecog1, nNowLprRecog2, aString(csOutDSP1.Host));
        imgIn.Picture:= imgNOut.Picture;
        imgNOut.Picture.Assign(Nil);
        GridData(sResult);
        ClearFormData;
      end
      else
      begin
        //일반차량 처리...
        NormalProc(sNowLprFile1, sLostInCarNo, '', '',
                   sNowIOTime, nNowLprNo, nNowLprInOut, nNowLprRecog1, nNowLprRecog2, aString(csOutDSP1.Host));
        imgNIn.Picture:= imgLost.Picture;
      end;
    end;
  except
    on E: Exception do ExceptLogging('TfrmMain.btnLostProcClick: ' + aString(E.Message));
  end;
end;

procedure TfrmMain.btnMagamClick(Sender: TObject);
begin
  bClosing:= False;
  NextModalDialog(TfrmClosing.Create(Self));

  if bClosing then
  begin
    NextModalDialog(TfrmLogin.Create(Self));

    if nLoginResult <> 1 then
    begin
      ShowMessage('근무자확인에 실패하여 프로그램을 종료합니다.');
      Close;
      Exit;
    end
    else
    begin
      pnlStart.Text:= FormatDateTime('YYYY-MM-DD HH:NN', Now);
      pnlCashier.Text:= sCurrMName;

      with dmTables.qryTemp do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select Sum(RealFee), Count(*) from TKProc where ProcDate = :N1 and ');
        SQL.Add('MNo = :N2 and ChkClosing = :N3 and PayType = :N4');
        Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', Now);
        Parameters.ParamByName('N2').Value:= nCurrMNo;
        Parameters.ParamByName('N3').Value:= 0;
        Parameters.ParamByName('N4').Value:= 1;
        Open;

        if RecordCount > 0 then
        begin
          nMTot:= FieldByName('COLUMN1').AsInteger;
          nMCnt:= FieldByName('COLUMN2').AsInteger;
          pnlMTot.Text:= IntToStr(nMTot) + ' 원';
          pnlMCnt.Text:= IntToStr(nMCnt) + ' 건';
        end
        else
        begin
          pnlMTot.Text:= '0 원';
          pnlMCnt.Text:= '0 건';
        end;

        Close;
        SQL.Clear;
        SQL.Add('Select Sum(RealFee), Count(*) from TKProc where ProcDate = :N1 and ');
        SQL.Add('MNo = :N2 and ChkClosing = :N3 and PayType = :N4');
        Parameters.ParamByName('N1').Value:= FormatDateTime('YYYY-MM-DD', Now);
        Parameters.ParamByName('N2').Value:= nCurrMNo;
        Parameters.ParamByName('N3').Value:= 0;
        Parameters.ParamByName('N4').Value:= 2;
        Open;

        if RecordCount > 0 then
        begin
          nMCreditTot:= FieldByName('COLUMN1').AsInteger;
          nMCreditCnt:= FieldByName('COLUMN2').AsInteger;
          pnlMCreditTot.Text:= IntToStr(nMCreditTot) + ' 원';
          pnlMCreditCnt.Text:= IntToStr(nMCreditCnt) + ' 건';
        end
        else
        begin
          pnlMCreditTot.Text:= '0 원';
          pnlMCreditCnt.Text:= '0 건';
        end;
      end;
    end;
  end;
end;

procedure TfrmMain.btnManualClick(Sender: TObject);
begin
  pnManual.Visible:= True;
  edtManualCarNo.Text:= '';
  edtManualCarNo.SetFocus;
end;

procedure TfrmMain.btnManualOutCancelClick(Sender: TObject);
begin
  edtOutTime.Text:= '';
  pnManualOut.Visible:= False;
end;

procedure TfrmMain.btnManualOutClick(Sender: TObject);
begin
  pnManualOut.Visible:= True;
  edtOutDate.Date:= Now;
  edtOutTime.Text:= '';
  edtOutTime.SetFocus;
end;

procedure TfrmMain.btnManualOutOkClick(Sender: TObject);
var
  sCheck: TDateTime;
begin
  try
    try
      sCheck:= StrToTime(edtOutTime.Text + ':00');
    except
      on E: Exception do
      begin
        ShowMessage('출차시각을 정확히 입력하여주세요!');
        edtOutTime.SetFocus;
        Exit;
      end;
    end;
    nTKType:= 9;
    nCarType:= 1;
    sManualTKNo:= MG_InsZero(IntToStr(GetTickCount), 10);
    sNowInTKNo:= sManualTKNo;
    sManualInTime:= FormatDateTime('YYYY-MM-DD', edtOutDate.Date) + ' ' + edtOutTime.Text + ':00';
    sNowInDate:= Copy(sManualInTime, 1, 10);
    sNowInTime:= Copy(sManualInTime, 12, 8);
    sNowLprCarNo1:= '수동출차';
    sNowLprCarNo2:= '수동출차';
    ManualOut(sNowLprFile1, sNowLprCarNo1, sNowLprFile2, sNowLprCarNo2, sNowIOTime,
              nNowLprNo, 2, nNowLprRecog1, nNowLprRecog2);
    pnManualOut.Visible:= False;
  except
    on E: Exception do ExceptLogging('TfrmMain.btnManualOutOkClick: ' + E.Message);
  end;
end;

procedure TfrmMain.btnMCancelClick(Sender: TObject);
begin
  edtMCarNo.Text:= '';
  pnModify.Visible:= False;
  imgModify.Picture.Assign(Nil);
  nGridCheck:= 0;
end;

procedure TfrmMain.btnMOKClick(Sender: TObject);
var
  sCardNo, sName, sCompName, sDeptName, sGroupName, sExpDate, sResult: aString;
  nGroupNo, nType: Integer;
begin
  try
    with dmTables.qryModify do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from CustInfo where CarNo = :N1 and ');
      SQL.Add('ExpDateF <= :N2 and ExpDateT >= :N3');
      Parameters.ParamByName('N1').Value:= MG_StrTrim(edtMCarNo.Text, ' ');
      Parameters.ParamByName('N2').Value:= FormatDateTime('YYYY-MM-DD', Now);
      Parameters.ParamByName('N3').Value:= FormatDateTime('YYYY-MM-DD', Now);
      Open;

      if RecordCount > 0 then
      begin
        //정기차량 처리
        nType:= 1;
        sCardNo:= FieldByName('TKNo').AsString;
        nGroupNo:= FieldByName('GroupNo').AsInteger;
        sName:= FieldByName('Name').AsString;
        sCompName:= FieldByName('CompName').AsString;
        sDeptName:= FieldByName('DeptName').AsString;
        sExpDate:= FieldByName('ExpDateT').AsString;

        Close;
        SQL.Clear;
        SQL.Add('Select * from GGroup where ParkNo = :N1 and GroupNo = :N2');
        Parameters.ParamByName('N1').Value:= nCurrParkNo;
        Parameters.ParamByName('N2').Value:= nGroupNo;
        Open;

        if RecordCount > 0 then
          sGroupName:= FieldByName('GroupName').AsString;

        Close;
        SQL.Clear;
        SQL.Add('Update CustInfo Set LastParkNo = :N1, LastUnitNo = :N2, ');
        SQL.Add('LastUseDate = :N3, LastUseTime = :N4, IOStatusNo = :N5 ');
        SQL.Add('where ParkNo = :N6 and TKType = :N7 and TKNo = :N8');
        Parameters.ParamByName('N1').Value:= nCurrParkNo;
        Parameters.ParamByName('N2').Value:= nOrgUnitNo;
        Parameters.ParamByName('N3').Value:= sOrgDate;
        Parameters.ParamByName('N4').Value:= sOrgTime;
        Parameters.ParamByName('N5').Value:= 1;
        Parameters.ParamByName('N6').Value:= nCurrParkNo;
        Parameters.ParamByName('N7').Value:= 2;
        Parameters.ParamByName('N8').Value:= sCardNo;
        ExecSQL;

        Close;
        SQL.Clear;
        SQL.Add('Insert Into IOSData (ParkNo, UnitNo, ProcDate, ProcTime, TKNo, TKType, ');
        SQL.Add('CarType, GroupNo, GroupName, CompName, DeptName, Name, InCarNo1, ');
        SQL.Add('InIOStatusNo, InImage1, InRecog1, Reserve4, Reserve5) ');
        SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, ');
        SQL.Add(':N12, :N13, :N14, :N15, :N16, :N17, :N18)');
        Parameters.ParamByName('N1' ).Value:= nCurrParkNo;
        Parameters.ParamByName('N2' ).Value:= nOrgUnitNo;
        Parameters.ParamByName('N3' ).Value:= sOrgDate;
        Parameters.ParamByName('N4' ).Value:= sOrgTime;
        Parameters.ParamByName('N5' ).Value:= sCardNo;
        Parameters.ParamByName('N6' ).Value:= 2;
        Parameters.ParamByName('N7' ).Value:= 2;
        Parameters.ParamByName('N8' ).Value:= nGroupNo;
        Parameters.ParamByName('N9' ).Value:= sGroupName;
        Parameters.ParamByName('N10').Value:= sCompName;
        Parameters.ParamByName('N11').Value:= sDeptName;
        Parameters.ParamByName('N12').Value:= sName;
        Parameters.ParamByName('N13').Value:= MG_StrTrim(edtMCarNo.Text, ' ');
        Parameters.ParamByName('N14').Value:= 1;
        Parameters.ParamByName('N15').Value:= sOrgFile;
        Parameters.ParamByName('N16').Value:= 1;
        Parameters.ParamByName('N17').Value:= FormatDateTime('YYYY-MM-DD HH:NN:SS', Now);
        Parameters.ParamByName('N18').Value:= '차량번호수정';
        ExecSQL;

        Close;
        SQL.Clear;
        SQL.Add('Delete from IONData where ParkNo = :N1 and ProcDate = :N2 and ');
        SQL.Add('ProcTime = :N3 and ((InCarNo1 = :N4) or (InCarNo2 = :N5))');
        Parameters.ParamByName('N1').Value:= nCurrParkNo;
        Parameters.ParamByName('N2').Value:= sOrgDate;
        Parameters.ParamByName('N3').Value:= sOrgTime;
        Parameters.ParamByName('N4').Value:= MG_StrTrim(edtMCarNo.Text, ' ');
        Parameters.ParamByName('N5').Value:= MG_StrTrim(edtMCarNo.Text, ' ');
        ExecSQL;
        imgIn.Picture:= imgOut.Picture;
        imgOut.Picture.Assign(Nil);
      end
      else
      begin
        //일반차량 처리
        nType:= 2;
        Close;
        SQL.Clear;
        SQL.Add('Update IONData Set InCarNo1 = :N1, Reserve5 = :N2, Reserve4 = :N3 ');
        SQL.Add('Where ParkNo = :N4 and ProcDate = :N5 and ProcTime = :N6 and InCarNo1 = :N7');
        Parameters.ParamByName('N1').Value:= MG_StrTrim(edtMCarNo.Text, ' ');
        Parameters.ParamByName('N2').Value:= '차량번호수정';
        Parameters.ParamByName('N3').Value:= FormatDateTime('YYYY-MM-DD HH:NN:SS', Now);
        Parameters.ParamByName('N4').Value:= nCurrParkNo;
        Parameters.ParamByName('N5').Value:= sOrgDate;
        Parameters.ParamByName('N6').Value:= sOrgTime;
        Parameters.ParamByName('N7').Value:= sOrgCarNo;
        ExecSQL;
      end;

      if nGridCheck = 1 then
        sgIO.Cells[0, nModRow]:= MG_StrTrim(edtMCarNo.Text, ' ')
      else
      if nGridCheck = 2 then
      begin
        if nType = 1 then
        begin
          sResult:= '1' + MG_StrTrim(edtMCarNo.Text, ' ') + '^' + sName + '^' + sCompName + '^' + sExpDate + '까지^입차';
          GridData(sResult);
        end
        else
        if nType = 2 then
        begin
          NGridData(MG_StrTrim(edtMCarNo.Text, ' ') + '^' + sOrgDate + ' ' + sOrgTime + '^입 차');
        end;
        imgOut.Picture.Assign(Nil);
        sgOut.RemoveRows(nModRow, 1);
      end;

      edtMCarNo.Text:= '';
      imgModify.Picture.Assign(Nil);
      pnModify.Visible:= False;
      nGridCheck:= 0;
      sOrgCarNo:= '';
      sOrgDate:= '';
      sOrgTime:= '';
      sOrgFile:= '';
      nOrgUnitNo:= 0;
      ShowMessage('차량번호 수정을 완료하였습니다.');
    end;
  except
    on E: Exception do ExceptLogging('TfrmMain.btnMOKClick: ' + aString(E.Message));
  end;
end;

procedure TfrmMain.btnOutDspClick(Sender: TObject);
begin
  NextModalDialog(TfrmDspSet.Create(Self));
end;

procedure TfrmMain.btnOutOpenClick(Sender: TObject);
var
  sSend: aString;
begin
  try
    if csOutLpr1.Active then
    begin
      sSend:= 'BAR_OPEN-1';
      csOutLpr1.Socket.SendText(sSend);

      with dmTables.qryBarProc do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Insert BarProc ');
        SQL.Add('(ParkNo, UnitNo, ProcDate, ProcTime, Up, MNo, ChkClosing, ProcReason) ');
        SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8)');
        Parameters.ParamByName('N1').Value:= nCurrParkNo;
        Parameters.ParamByName('N2').Value:= nCurrUnitNo;
        Parameters.ParamByName('N3').Value:= FormatDateTime('YYYY-MM-DD', Now);
        Parameters.ParamByName('N4').Value:= FormatDateTime('HH:NN:SS', Now);
        Parameters.ParamByName('N5').Value:= 1;
        Parameters.ParamByName('N6').Value:= nCurrMNo;
        Parameters.ParamByName('N7').Value:= 0;
        Parameters.ParamByName('N8').Value:= '';
        ExecSQL;
      end;
    end;
  except
    on E: Exception do ExceptLogging('TfrmMain.btnOutOpenClick: ' + aString(E.Message));
  end;
end;

procedure TfrmMain.btnProcClick(Sender: TObject);
begin
  MoneyProc;
end;

procedure TfrmMain.btnReceiptClick(Sender: TObject);
var
  i: Byte;
begin
  if comPrn.Open and (sPrtData <> '') then
  begin
    comPrn.PutString(sPrtData);
    sPrtData:= '';
  end;
  btnReceipt.Enabled:= False;
end;

procedure TfrmMain.btnSeekClick(Sender: TObject);
var
  sIn, sResult, sTime: aString;
begin
  try
    with dmTables.qryTemp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from CustInfo where CarNo = :N1');
      Parameters.ParamByName('N1').Value:= edtLostCarNo.Text;
      Open;

      if RecordCount > 0 then
      begin
        //정기차량 처리
        sOutLprCarNo:= edtLostCarNo.Text;
        sTime:= FormatDateTime('YYYY-MM-DD HH:NN:SS', Now);
        sResult:= RecvLprProc(sOutLprFile, sOutLprCarNo, '', '', sTime, nCurrUnitNo, 2, 3, 3, aString(csOutDSP1.Host));

        try
          if FileExists(sOutLocalFile) then
            imgOut.Picture.LoadFromFile(sOutLocalFile);
        except
          on E: Exception do ExceptLogging('이미지 로드 에러: ' + E.Message);
        end;
        GridData(sResult);
        ClearFormData;
      end
      else
      begin
        //조회일자부터 오늘날짜까지 조회토록 한다...
        with dmTables.qryLost do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Select * from IONData where OutChk = :N1 and TKType = :N2 and Status = :N3 and ');
          SQL.Add('((ProcDate >= :N4) and (ProcDate <= :N5)) and ');
          SQL.Add('((InCarNo1 like ' + MG_MakeStr('%' + Trim(edtLostCarNo.Text) + '%') + ') or ' );
          SQL.Add('(InCarNo2 like ' + MG_MakeStr('%' + Trim(edtLostCarNo.Text) + '%') + '))');
          Parameters.ParamByName('N1').Value:= 0;
          Parameters.ParamByName('N2').Value:= 1;
          Parameters.ParamByName('N3').Value:= 1;
          Parameters.ParamByName('N4').Value:= FormatDateTime('YYYY-MM-DD', edtLostDate.Date);
          Parameters.ParamByName('N5').Value:= FormatDateTime('YYYY-MM-DD', Now);
          Open;

          if RecordCount > 0 then
          begin
            btnLostProc.Enabled:= True;
            dgLost.SetFocus;
          end;
        end;
      end;
    end;
  except
    on E: Exception do ExceptLogging('TfrmMain.btnSeekClick: ' + E.Message);
  end;
end;

procedure TfrmMain.Button1Click(Sender: TObject);
var
  sSend, sEffect, sColor, sData: aString;
begin
  sEffect:= AnsiChar($00) + //문구블록
            AnsiChar($01) + //표시방법
            AnsiChar($01) + //반복횟수
            AnsiChar($51) + //폰트크기
            AnsiChar($00) + //화면분할위치
            AnsiChar($00) + //완성형
            AnsiChar($80) + //분할화면효과없음
            AnsiChar($80) + //메인화면효과
            AnsiChar($00) + //속도
            AnsiChar($06) + //정지시간
            AnsiChar($00);  //문구수직위치
  sColor:= AnsiChar($01) + AnsiChar($01) + AnsiChar($01) + AnsiChar($01) +
           AnsiChar($01) + AnsiChar($01) + AnsiChar($01) + AnsiChar($01) +
           AnsiChar($01) + AnsiChar($01) + AnsiChar($01) + AnsiChar($01) +
           AnsiChar($02) + AnsiChar($02) + AnsiChar($02) + AnsiChar($02) +
           AnsiChar($02) + AnsiChar($02) + AnsiChar($02) + AnsiChar($02) +
           AnsiChar($02) + AnsiChar($02) + AnsiChar($02) + AnsiChar($02);
  //sData:= '차량용전광판테스트문구다';
  sData:= MG_Left(edt1.Text, 24);

  sSend:= MakeDSPData(AnsiChar($54), sEffect, sColor, sData);

  if csInDsp1.Active then
    csInDsp1.Socket.SendText(sSend);
end;

procedure TfrmMain.Button2Click(Sender: TObject);
var
  sSend, sEffect, sColor, sData: aString;
begin
  sEffect:= AnsiChar(StrToInt('$' + edtDspNo.Text)) + //AnsiChar($00) + //문구블록
            AnsiChar($00) + //배경이미지
            AnsiChar($00) + //문구저장위치
            //AnsiChar($01) + //표시방법
            AnsiChar(StrToInt('$' + edttt.Text)) + //AnsiChar($61) + //폰트크기
            AnsiChar($00) + //화면분할위치
            AnsiChar($00) + //완성형
            AnsiChar($80) + //분할화면효과없음
            AnsiChar($01) + //메인화면효과
            AnsiChar($14) + //속도
            AnsiChar($06) + //정지시간
            AnsiChar($00);  //문구수직위치
  sColor:= AnsiChar($01) + AnsiChar($01) + AnsiChar($01) + AnsiChar($01) +
           AnsiChar($01) + AnsiChar($01) + AnsiChar($01) + AnsiChar($01) +
           AnsiChar($01) + AnsiChar($01) + AnsiChar($01) + AnsiChar($01) +
           AnsiChar($02) + AnsiChar($02) + AnsiChar($02) + AnsiChar($02) +
           AnsiChar($02) + AnsiChar($02) + AnsiChar($02) + AnsiChar($02) +
           AnsiChar($02) + AnsiChar($02) + AnsiChar($02) + AnsiChar($02);
  sData:= MG_Left(edt1.Text, 24);

  sSend:= MakeDSPData(AnsiChar($53), sEffect, sColor, sData);

  if csInDsp1.Active then
    csInDsp1.Socket.SendText(sSend);
end;

procedure TfrmMain.btnDC10Click(Sender: TObject);
begin
  nProcYogum:= StrToInt(MG_StrTrim(edtProcYogum.Text, ','));
  nDCYogum:= StrToInt(MG_StrTrim(edtDCYogum.Text, ','));
  dcBtnClick(btnDC10);
end;

procedure TfrmMain.btnDC11Click(Sender: TObject);
begin
  nProcYogum:= StrToInt(MG_StrTrim(edtProcYogum.Text, ','));
  nDCYogum:= StrToInt(MG_StrTrim(edtDCYogum.Text, ','));
  dcBtnClick(btnDC11);
end;

procedure TfrmMain.btnDC12Click(Sender: TObject);
begin
  nProcYogum:= StrToInt(MG_StrTrim(edtProcYogum.Text, ','));
  nDCYogum:= StrToInt(MG_StrTrim(edtDCYogum.Text, ','));
  dcBtnClick(btnDC12);
end;

procedure TfrmMain.btnDC13Click(Sender: TObject);
begin
  nProcYogum:= StrToInt(MG_StrTrim(edtProcYogum.Text, ','));
  nDCYogum:= StrToInt(MG_StrTrim(edtDCYogum.Text, ','));
  dcBtnClick(btnDC13);
end;

procedure TfrmMain.btnDC14Click(Sender: TObject);
begin
  nProcYogum:= StrToInt(MG_StrTrim(edtProcYogum.Text, ','));
  nDCYogum:= StrToInt(MG_StrTrim(edtDCYogum.Text, ','));
  dcBtnClick(btnDC14);
end;

procedure TfrmMain.btnDC15Click(Sender: TObject);
begin
  nProcYogum:= StrToInt(MG_StrTrim(edtProcYogum.Text, ','));
  nDCYogum:= StrToInt(MG_StrTrim(edtDCYogum.Text, ','));
  dcBtnClick(btnDC15);
end;

procedure TfrmMain.btnDC16Click(Sender: TObject);
begin
  nProcYogum:= StrToInt(MG_StrTrim(edtProcYogum.Text, ','));
  nDCYogum:= StrToInt(MG_StrTrim(edtDCYogum.Text, ','));
  dcBtnClick(btnDC16);
end;

procedure TfrmMain.btnDC17Click(Sender: TObject);
begin
  nProcYogum:= StrToInt(MG_StrTrim(edtProcYogum.Text, ','));
  nDCYogum:= StrToInt(MG_StrTrim(edtDCYogum.Text, ','));
  dcBtnClick(btnDC17);
end;

procedure TfrmMain.btnDC18Click(Sender: TObject);
begin
  nProcYogum:= StrToInt(MG_StrTrim(edtProcYogum.Text, ','));
  nDCYogum:= StrToInt(MG_StrTrim(edtDCYogum.Text, ','));
  dcBtnClick(btnDC18);
end;

procedure TfrmMain.btnDC19Click(Sender: TObject);
begin
  nProcYogum:= StrToInt(MG_StrTrim(edtProcYogum.Text, ','));
  nDCYogum:= StrToInt(MG_StrTrim(edtDCYogum.Text, ','));
  dcBtnClick(btnDC19);
end;

procedure TfrmMain.btnDC20Click(Sender: TObject);
begin
  nProcYogum:= StrToInt(MG_StrTrim(edtProcYogum.Text, ','));
  nDCYogum:= StrToInt(MG_StrTrim(edtDCYogum.Text, ','));
  dcBtnClick(btnDC20);
end;

procedure TfrmMain.MoneyProc;
var
  i, nOutCnt: Integer;
  sParkName, sParkAddr, sRegNo, sAdmin, sTelephone, sReceipt, sCarNo, sChart: String;
  sSend: String;
begin
  //현금으로 계산...
  try
    nMCnt:= nMCnt + 1;
    pnlMCnt.Text:= IntToStr(nMCnt) + ' 건';
    nMTot:= nMTot + StrToInt(MG_StrTrim(edtProcYogum.Text, ','));
    pnlMTot.Text:= IntToStr(nMTot) + ' 원';
    nOutCnt:= 0;

    //DB Write...
    with dmTables.qryMoneyProc do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from IONCount Where ParkNo = :N1 and UnitNo = :N2 and ProcDate = :N3');
      Parameters.ParamByName('N1').Value:= nCurrParkNo;
      Parameters.ParamByName('N2').Value:= nNowLprNo;
      Parameters.ParamByName('N3').Value:= sNowOutDate;
      Open;

      if RecordCount > 0 then
      begin
        Case StrToInt(FormatDateTime('HH', Now)) of
          0 : nOutCnt:= FieldByName('Out00').AsInteger+1;
          1 : nOutCnt:= FieldByName('Out01').AsInteger+1;
          2 : nOutCnt:= FieldByName('Out02').AsInteger+1;
          3 : nOutCnt:= FieldByName('Out03').AsInteger+1;
          4 : nOutCnt:= FieldByName('Out04').AsInteger+1;
          5 : nOutCnt:= FieldByName('Out05').AsInteger+1;
          6 : nOutCnt:= FieldByName('Out06').AsInteger+1;
          7 : nOutCnt:= FieldByName('Out07').AsInteger+1;
          8 : nOutCnt:= FieldByName('Out08').AsInteger+1;
          9 : nOutCnt:= FieldByName('Out09').AsInteger+1;
          10: nOutCnt:= FieldByName('Out10').AsInteger+1;
          11: nOutCnt:= FieldByName('Out11').AsInteger+1;
          12: nOutCnt:= FieldByName('Out12').AsInteger+1;
          13: nOutCnt:= FieldByName('Out13').AsInteger+1;
          14: nOutCnt:= FieldByName('Out14').AsInteger+1;
          15: nOutCnt:= FieldByName('Out15').AsInteger+1;
          16: nOutCnt:= FieldByName('Out16').AsInteger+1;
          17: nOutCnt:= FieldByName('Out17').AsInteger+1;
          18: nOutCnt:= FieldByName('Out18').AsInteger+1;
          19: nOutCnt:= FieldByName('Out19').AsInteger+1;
          20: nOutCnt:= FieldByName('Out20').AsInteger+1;
          21: nOutCnt:= FieldByName('Out21').AsInteger+1;
          22: nOutCnt:= FieldByName('Out22').AsInteger+1;
          23: nOutCnt:= FieldByName('Out23').AsInteger+1;
        end;
        Close;
        SQL.Clear;
        SQL.Add('Update IONCount ');

        Case StrToInt(FormatDateTime('HH', Now)) of
          0 : SQL.Add('Set Out00 = :N1 ');
          1 : SQL.Add('Set Out01 = :N1 ');
          2 : SQL.Add('Set Out02 = :N1 ');
          3 : SQL.Add('Set Out03 = :N1 ');
          4 : SQL.Add('Set Out04 = :N1 ');
          5 : SQL.Add('Set Out05 = :N1 ');
          6 : SQL.Add('Set Out06 = :N1 ');
          7 : SQL.Add('Set Out07 = :N1 ');
          8 : SQL.Add('Set Out08 = :N1 ');
          9 : SQL.Add('Set Out09 = :N1 ');
          10: SQL.Add('Set Out10 = :N1 ');
          11: SQL.Add('Set Out11 = :N1 ');
          12: SQL.Add('Set Out12 = :N1 ');
          13: SQL.Add('Set Out13 = :N1 ');
          14: SQL.Add('Set Out14 = :N1 ');
          15: SQL.Add('Set Out15 = :N1 ');
          16: SQL.Add('Set Out16 = :N1 ');
          17: SQL.Add('Set Out17 = :N1 ');
          18: SQL.Add('Set Out18 = :N1 ');
          19: SQL.Add('Set Out19 = :N1 ');
          20: SQL.Add('Set Out20 = :N1 ');
          21: SQL.Add('Set Out21 = :N1 ');
          22: SQL.Add('Set Out22 = :N1 ');
          23: SQL.Add('Set Out23 = :N1 ');
        end;
        SQL.Add('Where ParkNo = :N2 and UnitNo = :N3 and ProcDate = :N4');
        Parameters.ParamByName('N1').Value:= nOutCnt;
        Parameters.ParamByName('N2').Value:= nCurrParkNo;
        Parameters.ParamByName('N3').Value:= nNowLprNo;
        Parameters.ParamByName('N4').Value:= sNowOutDate;
        ExecSQL; Close;
      end
      else
      begin
        Close;
        SQL.Clear;
        SQL.Add('Insert Into IONCount ');
        SQL.Add('(ParkNo, UnitNo, ProcDate, In00, In01, In02, In03, In04, ');
        SQL.Add('In05, In06, In07, In08, In09, In10, In11, In12, In13, In14, ');
        SQL.Add('In15, In16, In17, In18, In19, In20, In21, In22, In23, Out00, ');
        SQL.Add('Out01, Out02, Out03, Out04, Out05, Out06, Out07, Out08, Out09, ');
        SQL.Add('Out10, Out11, Out12, Out13, Out14, Out15, Out16, Out17, Out18, ');
        SQL.Add('Out19, Out20, Out21, Out22, Out23) Values ');
        SQL.Add('(:N1, :N2, :N3, 0, 0, 0, 0, 0, 0, 0, ');
        SQL.Add('0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ');
        SQL.Add('0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)');
        Parameters.ParamByName('N1').Value:= nCurrParkNo;
        Parameters.ParamByName('N2').Value:= nNowLprNo;
        Parameters.ParamByName('N3').Value:= sNowOutDate;
        ExecSQL;

        Close;
        SQL.Clear;
        SQL.Add('UpDate IONCount ');

        Case StrToInt(FormatDateTime('HH', Now)) of
          0 : SQL.Add('Set Out00 = :N1 ');
          1 : SQL.Add('Set Out01 = :N1 ');
          2 : SQL.Add('Set Out02 = :N1 ');
          3 : SQL.Add('Set Out03 = :N1 ');
          4 : SQL.Add('Set Out04 = :N1 ');
          5 : SQL.Add('Set Out05 = :N1 ');
          6 : SQL.Add('Set Out06 = :N1 ');
          7 : SQL.Add('Set Out07 = :N1 ');
          8 : SQL.Add('Set Out08 = :N1 ');
          9 : SQL.Add('Set Out09 = :N1 ');
          10: SQL.Add('Set Out10 = :N1 ');
          11: SQL.Add('Set Out11 = :N1 ');
          12: SQL.Add('Set Out12 = :N1 ');
          13: SQL.Add('Set Out13 = :N1 ');
          14: SQL.Add('Set Out14 = :N1 ');
          15: SQL.Add('Set Out15 = :N1 ');
          16: SQL.Add('Set Out16 = :N1 ');
          17: SQL.Add('Set Out17 = :N1 ');
          18: SQL.Add('Set Out18 = :N1 ');
          19: SQL.Add('Set Out19 = :N1 ');
          20: SQL.Add('Set Out20 = :N1 ');
          21: SQL.Add('Set Out21 = :N1 ');
          22: SQL.Add('Set Out22 = :N1 ');
          23: SQL.Add('Set Out23 = :N1 ');
        end;
        SQL.Add('Where ParkNo = :N2 and UnitNo = :N3 and ProcDate = :N4');
        Parameters.ParamByName('N1').Value:= 1;
        Parameters.ParamByName('N2').Value:= nCurrParkNo;
        Parameters.ParamByName('N3').Value:= nNowLprNo;
        Parameters.ParamByName('N4').Value:= sNowOutDate;
        ExecSQL; Close;
      end;

      Close;
      SQL.Clear;
      SQL.Add('Select * from TKProc where ParkNo = :N1 and UnitNo = :N2 and ');
      SQL.Add('ProcDate = :N3 and ProcTime = :N4');
      Parameters.ParamByName('N1').Value:= nCurrParkNo;
      Parameters.ParamByName('N2').Value:= nCurrUnitNo;
      Parameters.ParamByName('N3').Value:= sNowOutDate;
      Parameters.ParamByName('N4').Value:= sNowOutTime;
      Open;

      if RecordCount <= 0 then
      begin
        Close;
        SQL.Clear;
        SQL.Add('Insert Into TKProc ');
        SQL.Add('(ParkNo, UnitNo, ProcDate, ProcTime, TKType, CarType, FeeNo, ');
        SQL.Add('TKNo, TKParkNo, TKUnitNo, CarNo, InDate, InTime, ParkingMin, ');
        SQL.Add('TotFee, TotDC, RealFee, RecvAmt, Change, DCCnt, MNo, UnPaid, ');
        SQL.Add('ChkClosing, CommercialTariff, SpecialTariff, PayType) ');
        SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, ');
        SQL.Add(':N11, :N12, :N13, :N14, :N15, :N16, :N17, :N18, :N19, :N20, ');
        SQL.Add(':N21, :N22, :N23, :N24, :N25, :N26)');
        Parameters.ParamByName('N1' ).Value:= nCurrParkNo;
        Parameters.ParamByName('N2' ).Value:= nCurrUnitNo;
        Parameters.ParamByName('N3' ).Value:= sNowOutDate;
        Parameters.ParamByName('N4' ).Value:= sNowOutTime;
        Parameters.ParamByName('N5' ).Value:= 1;
        Parameters.ParamByName('N6' ).Value:= 1;
        Parameters.ParamByName('N7' ).Value:= nFeeNo;
        Parameters.ParamByName('N8' ).Value:= sNowInTKNo;
        Parameters.ParamByName('N9' ).Value:= nCurrParkNo;
        Parameters.ParamByName('N10').Value:= nNowInUnitNo;
        Parameters.ParamByName('N11').Value:= sNowInCarNo;
        Parameters.ParamByName('N12').Value:= sNowInDate;
        Parameters.ParamByName('N13').Value:= sNowInTime;
        Parameters.ParamByName('N14').Value:= nParkingMin;
        Parameters.ParamByName('N15').Value:= StrToInt(MG_StrTrim(edtTotYogum.Text, ','));
        Parameters.ParamByName('N16').Value:= StrToInt(MG_StrTrim(edtDCYogum.Text, ','));
        Parameters.ParamByName('N17').Value:= StrToInt(MG_StrTrim(edtProcYogum.Text, ','));
        Parameters.ParamByName('N18').Value:= StrToInt(MG_StrTrim(edtProcYogum.Text, ','));
        Parameters.ParamByName('N19').Value:= 0;
        Parameters.ParamByName('N20').Value:= nDCCnt;
        Parameters.ParamByName('N21').Value:= nCurrMNo;
        Parameters.ParamByName('N22').Value:= 0;
        Parameters.ParamByName('N23').Value:= 0;
        Parameters.ParamByName('N24').Value:= 0;
        Parameters.ParamByName('N25').Value:= 0;
        Parameters.ParamByName('N26').Value:= 1;
        ExecSQL;
      end;

      if nDCCnt > 0 then
        for i:= 1 to nDCCnt do
          if DCProc[i].nDCAmt > 0 then
          begin
            Close;
            SQL.Clear;
            SQL.Add('Insert Into DCDetail ');
            SQL.Add('(ParkNo, UnitNo, ProcDate, ProcTime, DCSeq, TKNo, CarNo, ');
            SQL.Add('DCNo, DCAmt, RealDCAmt, DCTKNo, DCTKIssueDate, DCTKIssueTime, DCType) ');
            SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, :N12, :N13, :N14)');
            Parameters.ParamByName('N1' ).Value:= nCurrParkNo;
            Parameters.ParamByName('N2' ).Value:= nCurrUnitNo;
            Parameters.ParamByName('N3' ).Value:= sNowOutDate;
            Parameters.ParamByName('N4' ).Value:= sNowOutTime;
            Parameters.ParamByName('N5' ).Value:= i;
            Parameters.ParamByName('N6' ).Value:= sNowInTKNo;
            Parameters.ParamByName('N7' ).Value:= sNowInCarNo;
            Parameters.ParamByName('N8' ).Value:= DCProc[i].nDCNo;
            Parameters.ParamByName('N9' ).Value:= DCProc[i].nDCAmt;
            Parameters.ParamByName('N10').Value:= DCProc[i].nRealDCAmt;
            Parameters.ParamByName('N11').Value:= DCProc[i].sDCTKNo;
            Parameters.ParamByName('N12').Value:= DCProc[i].sDCTKIssueDate;
            Parameters.ParamByName('N13').Value:= DCProc[i].sDCTKIssueTime;
            Parameters.ParamByName('N14').Value:= DCProc[i].nDCType;
            ExecSQL;
          end;

      Close;
      SQL.Clear;
      SQL.Add('Select * from IONData Where ParkNo = :N1 and UnitNo = :N2 and ProcDate = :N3 and ');
      SQL.Add('ProcTime = :N4 and TKNo = :N5');
      Parameters.ParamByName('N1').Value:= nCurrParkNo;
      Parameters.ParamByName('N2').Value:= nNowInUnitNo;
      Parameters.ParamByName('N3').Value:= sNowInDate;
      Parameters.ParamByName('N4').Value:= sNowInTime;
      Parameters.ParamByName('N5').Value:= sNowInTKNo;
      Open;

      if RecordCount > 0 then
      begin
        //InData에 입차자료가 있으면...
        Close;
        SQL.Clear;
        SQL.Add('Update IONData Set OutUnitNo = :N1, OutDate = :N2, OutTime = :N3, OutChk = :N4, ');
        SQL.Add('OutImage1 = :N5, OutCarNo1 = :N6, OutImage2 = :N7, OutCarNo2 = :N8, ');
        SQL.Add('OutRecog1 = :N9, OutRecog2 = :N10, Reserve3 = :N16 ');
        SQL.Add('where ParkNo = :N11 and UnitNo = :N12 and ProcDate = :N13 and ProcTime = :N14 and TKNo = :N15');
        Parameters.ParamByName('N1' ).Value:= nNowLprNo;
        Parameters.ParamByName('N2' ).Value:= sNowOutDate;
        Parameters.ParamByName('N3' ).Value:= sNowOutTime;

        if nDCCnt > 0 then
        begin
          //할인처리
          if StrToInt(MG_StrTrim(edtProcYogum.Text, ',')) > 0 then
          begin
            //할인처리후 유료출차
            Parameters.ParamByName('N4').Value:= 2;
          end
          else
          begin
            //무료출차
            Parameters.ParamByName('N4').Value:= 3;
          end;
        end
        else
        begin
          //할인처리 안함. 정상출차
          Parameters.ParamByName('N4').Value:= 1;
        end;
        Parameters.ParamByName('N5' ).Value:= sNowLprFile1;
        Parameters.ParamByName('N6' ).Value:= sNowLprCarNo1;
        Parameters.ParamByName('N7' ).Value:= sNowLprFile2;
        Parameters.ParamByName('N8' ).Value:= sNowLprCarNo2;
        Parameters.ParamByName('N9' ).Value:= nNowLprRecog1;
        Parameters.ParamByName('N10').Value:= nNowLprRecog2;
        Parameters.ParamByName('N11').Value:= nCurrParkNo;
        Parameters.ParamByName('N12').Value:= nNowInUnitNO;
        Parameters.ParamByName('N13').Value:= sNowInDate;
        Parameters.ParamByName('N14').Value:= sNowInTime;
        Parameters.ParamByName('N15').Value:= sNowInTKNo;

        if bMiProc then
          Parameters.ParamByName('N16').Value:= '미인식처리'
        else
        if bManualOut then
          Parameters.ParamByName('N16').Value:= '수동출차'
        else
          Parameters.ParamByName('N16').Value:= '';
        ExecSQL;
      end
      else
      begin
        //InData에 발권자료가 없으면...
        Close;
        SQL.Clear;
        SQL.Add('Insert Into IONData ');
        SQL.Add('(ParkNo, UnitNo, ProcDate, ProcTime, TKNo, TKType, CarType, ');
        SQL.Add('InImage1, InCarNo1, InImage2, InCarNo2, Status, OutUnitNo, ');
        SQL.Add('OutDate, OutTime, OutChk, OutImage1, OutCarNo1, OutImage2, OutCarNo2, ');
        SQL.Add('InRecog1, OutRecog1, InRecog2, OutRecog2, Reserve3) ');
        SQL.Add('Values (:N1, :N2, :N3, :N4, :N5, :N6, :N7, :N8, :N9, :N10, :N11, ');
        SQL.Add(':N12, :N13, :N14, :N15, :N16, :N17, :N18, :N19, :N20, ');
        SQL.Add(':N21, :N22, :N23, :N24, :N25)');
        Parameters.ParamByName('N1' ).Value:= nCurrParkNo;
        Parameters.ParamByName('N2' ).Value:= nNowInUnitNO;
        Parameters.ParamByName('N3' ).Value:= sNowInDate;
        Parameters.ParamByName('N4' ).Value:= sNowInTime;
        Parameters.ParamByName('N5' ).Value:= sNowInTKNo;
        Parameters.ParamByName('N6' ).Value:= 1;
        Parameters.ParamByName('N7' ).Value:= 1;
        Parameters.ParamByName('N8' ).Value:= '';
        Parameters.ParamByName('N9' ).Value:= '';
        Parameters.ParamByName('N10').Value:= '';
        Parameters.ParamByName('N11').Value:= '';
        Parameters.ParamByName('N12').Value:= 1;
        Parameters.ParamByName('N13').Value:= nNowLprNo;
        Parameters.ParamByName('N14').Value:= sNowOutDate;
        Parameters.ParamByName('N15').Value:= sNowOutTime;

        if nDCCnt > 0 then
        begin
          //할인처리
          if StrToInt(MG_StrTrim(edtProcYogum.Text, ',')) > 0 then
          begin
            //할인처리후 유료출차
            Parameters.ParamByName('N16').Value:= 2;
          end
          else
          begin
            //무료출차
            Parameters.ParamByName('N16').Value:= 3;
          end;
        end
        else
        begin
          //할인처리 안함. 정상출차
          Parameters.ParamByName('N16').Value:= 1;
        end;
        Parameters.ParamByName('N17').Value:= sNowLprFile1;
        Parameters.ParamByName('N18').Value:= sNowLprCarNo1;
        Parameters.ParamByName('N19').Value:= sNowLprFile2;
        Parameters.ParamByName('N20').Value:= sNowLprCarNo2;
        Parameters.ParamByName('N21').Value:= 3;
        Parameters.ParamByName('N22').Value:= 3;
        Parameters.ParamByName('N23').Value:= nNowLprRecog1;
        Parameters.ParamByName('N24').Value:= nNowLprRecog2;

        if bMiProc then
          Parameters.ParamByName('N25').Value:= '미인식처리'
        else
        if bManualOut then
          Parameters.ParamByName('N25').Value:= '수동출차'
        else
          Parameters.ParamByName('N25').Value:= '';
        ExecSQL;
      end;
      Close;
      SQL.Clear;
      SQL.Add('Select * from IONCount where ProcDate = :N1 and UnitNo = :N2');
      Parameters.ParamByName('N1').Value:= sNowOutDate;
      Parameters.ParamByName('N2').Value:= nNowLprNo;
      Open;
      nNOutCnt:= 0;

      for i:= 0 to 23 do
        nNOutCnt:= nNOutCnt + FieldByName('Out' + MG_InsZero(IntToStr(i), 2)).AsInteger;
    end;
    NGridData(sNowInCarNo + '^' + sNowOutDate + ' ' + sNowOutTime + '^출 차');

    if bZeroReceipt or (StrToInt(MG_StrTrim(edtProcYogum.Text, ',')) > 0) then
    begin
      if comPrn.Open then
        comPrn.PutString(WTP_Cash_Open);

      with dmTables.qryMoneyProc do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select * from ParkInfo where ParkNo = :N1');
        Parameters.ParamByName('N1').Value:= nCurrParkNo;
        Open;

        if RecordCount > 0 then
        begin
          sParkName := FieldByName('ParkName' ).AsString;
          sParkAddr := FieldByName('ParkAddr' ).AsString;
          sRegNo    := FieldByName('RegNo'    ).AsString;
          sAdmin    := FieldByName('Admin'    ).AsString;
          sTelephone:= FieldByName('Telephone').AsString;
          sReceipt  := FieldByName('Receipt'  ).AsString;
        end;
      end;

      //영수증인쇄...
      sPrtData:= '';
      sPrtData:= '========================================' + LF + LF + LF + CR + SO_WTP;
      sPrtData:= sPrtData + '    영   수   증' + LF + LF + LF + CR + SI_WTP;

      if Length(sParkName) > 29 then
      begin
        sPrtData:= sPrtData + '주차장명 : ' + Copy(sParkName, 1, 29) + LF + CR;

        if Length(sParkName) < 58 then
          sPrtData:= sPrtData + '           ' + Copy(sParkName, 30, Length(sParkName)-29) + LF + CR
        else
        begin
          if Length(sParkName) < 87 then
          begin
            sPrtData:= sPrtData + '           ' + Copy(sParkName, 30, 29) + LF + CR;
            sPrtData:= sPrtData + '           ' + Copy(sParkName, 60, Length(sParkName)-58) + LF + CR;
          end
          else
          begin
            sPrtData:= sPrtData + '           ' + Copy(sParkName, 30, 29) + LF + CR;
            sPrtData:= sPrtData + '           ' + Copy(sParkName, 59, 29) + LF + CR;
            sPrtData:= sPrtData + '           ' + Copy(sParkName, 88, Length(sParkName)-87) + LF + CR;
          end;
        end;
      end
      else
        sPrtData:= sPrtData + '주차장명 : ' + sParkName + LF + CR;

      if Length(sParkAddr) > 29 then
      begin
        sPrtData:= sPrtData + ' 주   소 : ' + Copy(sParkAddr, 1, 29) + LF + CR;

        if Length(sParkAddr) < 58 then
          sPrtData:= sPrtData + '           ' + Copy(sParkAddr, 30, Length(sParkAddr)-29) + LF + CR
        else
        begin
          if Length(sParkAddr) < 87 then
          begin
            sPrtData:= sPrtData + '           ' + Copy(sParkAddr, 30, 29) + LF + CR;
            sPrtData:= sPrtData + '           ' + Copy(sParkAddr, 60, Length(sParkAddr)-58) + LF + CR;
          end
          else
          begin
            sPrtData:= sPrtData + '           ' + Copy(sParkAddr, 30, 29) + LF + CR;
            sPrtData:= sPrtData + '           ' + Copy(sParkAddr, 59, 29) + LF + CR;
            sPrtData:= sPrtData + '           ' + Copy(sParkAddr, 88, Length(sParkAddr)-87) + LF + CR;
          end;
        end;
      end
      else
        sPrtData:= sPrtData + ' 주   소 : ' + sParkAddr + LF + CR;

      sPrtData:= sPrtData + '등록번호 : ' + sRegNo + LF + CR;

      if Length(sAdmin) > 29 then
      begin
        sPrtData:= sPrtData + '대표자명 : ' + Copy(sAdmin, 1, 29) + LF + CR;
        sPrtData:= sPrtData + '           ' + Copy(sAdmin, 30, Length(sAdmin)-29) + LF + CR;
      end
      else
        sPrtData:= sPrtData + '대표자명 : ' + sAdmin + LF + CR;

      sPrtData:= sPrtData + '전화번호 : ' + sTelephone + LF + CR;
      sPrtData:= sPrtData + '입차일시 : ' + sNowInDate + ' ' + sNowInTime + LF + CR;
      sPrtData:= sPrtData + '출차일시 : ' + sNowOutDate + ' ' + sNowOutTime + LF + CR;
      sPrtData:= sPrtData + '주차시간 : ' + pnlPTime.Text + LF + CR;
      sPrtData:= sPrtData + '정 산 원 : ' + sCurrMName + LF + CR;
      sPrtData:= sPrtData + '차량번호 : ' + sNowLprCarNo1 + LF + CR;

      if edtDCYogum.Text <> '0' then
      begin
        sPrtData:= sPrtData + '전체요금 : ' + pnlTot.Text + LF + CR;
        sPrtData:= sPrtData + '할인금액 : ' + pnlDC.Text + LF + CR;
        sPrtData:= sPrtData + '할인내용 : ' + pnlDCList.Text + LF + CR;
        sPrtData:= sPrtData + '받은금액 : ' + pnlFee.Caption + LF + LF + LF + CR;
      end
      else
        sPrtData:= sPrtData + '주차요금 : ' + pnlFee.Caption + LF + LF + LF + CR;

      if Length(sReceipt) > 40 then
      begin
        sPrtData:= sPrtData + Copy(sReceipt, 1, 40) + LF + CR;

        if Length(sReceipt) < 80 then
          sPrtData:= sPrtData + Copy(sReceipt, 41, Length(sReceipt)-40) + LF
                 + LF + LF + LF + LF + LF + LF + LF
        else
        begin
          sPrtData:= sPrtData + Copy(sReceipt, 41, 40) + LF + CR;
          sPrtData:= sPrtData + Copy(sReceipt, 81, Length(sReceipt)-80) + LF
                 + LF + LF + LF + LF + LF + LF + LF;
        end;
      end
      else
        sPrtData:= sPrtData + sReceipt + LF + LF + LF + LF + LF + LF + LF + LF;

      sPrtData:= sPrtData + FullCut_WTP;

      if lbReceipt.Count = 10 then lbReceipt.Items.Delete(lbReceipt.Count-1);
      lbReceipt.Items.Insert(0, sPrtOutTime + '  ' + MG_Left(sNowLprCarNo1, 12) + '  주차요금: ' + pnlFee.Caption);

      if RReceipt[9].sInOutTime <> '' then
      begin
        RReceipt[10].sInOutTime:= RReceipt[9].sInOutTime;
        RReceipt[10].sRpt:= RReceipt[9].sRpt;
      end;

      if RReceipt[8].sInOutTime <> '' then
      begin
        RReceipt[9].sInOutTime:= RReceipt[8].sInOutTime;
        RReceipt[9].sRpt:= RReceipt[8].sRpt;
      end;

      if RReceipt[7].sInOutTime <> '' then
      begin
        RReceipt[8].sInOutTime:= RReceipt[7].sInOutTime;
        RReceipt[8].sRpt:= RReceipt[7].sRpt;
      end;

      if RReceipt[6].sInOutTime <> '' then
      begin
        RReceipt[7].sInOutTime:= RReceipt[6].sInOutTime;
        RReceipt[7].sRpt:= RReceipt[6].sRpt;
      end;

      if RReceipt[5].sInOutTime <> '' then
      begin
        RReceipt[6].sInOutTime:= RReceipt[5].sInOutTime;
        RReceipt[6].sRpt:= RReceipt[5].sRpt;
      end;

      if RReceipt[4].sInOutTime <> '' then
      begin
        RReceipt[5].sInOutTime:= RReceipt[4].sInOutTime;
        RReceipt[5].sRpt:= RReceipt[4].sRpt;
      end;

      if RReceipt[3].sInOutTime <> '' then
      begin
        RReceipt[4].sInOutTime:= RReceipt[3].sInOutTime;
        RReceipt[4].sRpt:= RReceipt[3].sRpt;
      end;

      if RReceipt[2].sInOutTime <> '' then
      begin
        RReceipt[3].sInOutTime:= RReceipt[2].sInOutTime;
        RReceipt[3].sRpt:= RReceipt[2].sRpt;
      end;

      if RReceipt[1].sInOutTime <> '' then
      begin
        RReceipt[2].sInOutTime:= RReceipt[1].sInOutTime;
        RReceipt[2].sRpt:= RReceipt[1].sRpt;
      end;

      RReceipt[1].sInOutTime:= sPrtOutTime + '  주차요금: ' + pnlFee.Caption;
      RReceipt[1].sRpt:= sPrtData;
    end
    else
      sPrtData:= '';

    //차단기 열림.
    OutOpen;

    if bAutoReceipt and (sPrtData <> '') then
    begin
      btnReceiptClick(Self);
    end;

    ClearFormData;
  except
    on E: Exception do ExceptLogging('TfrmMain.MoneyProc: ' + aString(E.Message));
  end;
end;

//nIO: 1-입구, 2-출구    nType: 1-정기차량, 2-일반차량, 3-요금표시
procedure TfrmMain.DspProc(nIO, nType: Byte; sData, sLprIP: aString);
var
  i: Byte;
  sSend: aString;
  sTemp1, sTemp2: String;
begin
  try
    case nType of
      1: sSend:= MakeDSPData(AnsiChar($54), EMDSP, SCCOLOR, MG_Left(sData, 24));
      2: sSend:= MakeDSPData(AnsiChar($54), EMDSP, NOCOLOR, MG_Left(sData, 24));
      3: sSend:= MakeDSPData(AnsiChar($54), EMDSP, YOCOLOR, MG_Left(sData, 24));
    end;

    if nIO = 1 then
    begin
      for i := 1 to 3 do
      begin
        with frmMain do
        begin
          sTemp1:= TClientSocket(FindComponent('csInDsp' + IntToStr(i))).Host;
          sTemp2:= wString(sLprIP);

          if TClientSocket(FindComponent('csInDsp' + IntToStr(i))).Host = wString(sLprIP) then
          begin
            if TClientSocket(FindComponent('csInDsp' + IntToStr(i))).Active then
              TClientSocket(FindComponent('csInDsp' + IntToStr(i))).Socket.SendText(sSend);
          end;
        end;
      end;
    end
    else
    if nIO = 2 then
    begin
      for i := 1 to 3 do
      begin
        with frmMain do
        begin
          if TClientSocket(FindComponent('csOutDsp' + IntToStr(i))).Host = wString(sLprIP) then
          begin
            if TClientSocket(FindComponent('csOutDsp' + IntToStr(i))).Active then
              TClientSocket(FindComponent('csOutDsp' + IntToStr(i))).Socket.SendText(sSend);
          end;
        end;
      end;
    end;
  except
    on E: Exception do ExceptLogging('TfrmMain.DspProc: ' + aString(E.Message));
  end;
end;

end.

