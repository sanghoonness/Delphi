unit Cancel_SMT;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, sButton, AdvEdit, sLabel, Vcl.ExtCtrls, Vcl.Mask, AdvSpin;

type
  TfrmCancel_SMT = class(TForm)
    Panel1: TPanel;
    sLabel1: TsLabel;
    Panel3: TPanel;
    lbVan: TLabel;
    Panel2: TPanel;
    edtCardName: TAdvEdit;
    edtJumNo: TAdvEdit;
    edtAuthNo: TAdvEdit;
    edtAuthDate: TAdvEdit;
    edtMsg: TAdvEdit;
    btnCancel: TsButton;
    Label1: TLabel;
    edtPrvAuthNo: TAdvEdit;
    edtPrvAuthDate: TAdvEdit;
    btnCreditCancel: TsButton;
    edtPrvAmt: TAdvSpinEdit;
    procedure btnCreditCancelClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
//    procedure tEventTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCancel_SMT: TfrmCancel_SMT;
  bClose: Boolean = False;

implementation
uses
  Global,Tables;

{$R *.dfm}

procedure TfrmCancel_SMT.btnCancelClick(Sender: TObject);
var
  sData, sError: aString;
  pError: PAnsiChar;
  nResult: Integer;
begin
  getmem(pError, 4096);

  try
    InspectionLog('### 근무자 승인취소 취소 ###');
    bClose:= True;
    sData:= 'TM';
//    nResult:= KReqCmd($FD, 0, 0, pAnsiChar(sData), pError);
    sError:= pError;
    bClose:= True;
    Close;
  finally
    FreeMem(pError);
  end;
end;

procedure TfrmCancel_SMT.btnCreditCancelClick(Sender: TObject);
var
  sData, sError: aString;
  pError: PAnsiChar;
  nAmt, nVat, nResult: Integer;
begin
  getmem(pError, 4096);

  try
    nAmt:= edtPRvAmt.Value;
    nVat:= nAmt div 11;

    if Copy(edtPrvAuthDate.Text, 1, 6) = FormatDateTime('YYMMDD', Now) then
      sData:= 'D2'
    else
      sData:= 'D4';

    sData:= sData + MG_Right('', 41) + '00' + Copy(edtPrvAuthDate.Text, 1, 6) + MG_Right(edtPrvAuthNo.Text, 12) +
            MG_Right(IntToStr(nAmt), 8) +
            MG_Right('0', 8) + MG_Right(IntToStr(nVat), 8) + MG_Right('', 20);
//    nResult:= KReqCmd($FD, 0, 0, pAnsiChar(sData), pError);
    sError:= pError;
    edtMsg.Text:= sError;
  finally
    FreeMem(pError);
  end;
end;

procedure TfrmCancel_SMT.FormShow(Sender: TObject);
begin
  InspectionLog('### 신용카드 승인취소 시작 ###');
  //tEvent.Enabled:= True;
  bClose:= False;
end;



end.
