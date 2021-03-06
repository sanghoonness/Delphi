unit Alarm_vip;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, AdvEdit, Mask, Buttons;

type
  TfrmAlarm_vip = class(TForm)
    edtFile: TAdvEdit;
    Button1: TButton;
    od1: TOpenDialog;
    btnSave: TBitBtn;
    btnClose: TBitBtn;
    edtTime: TAdvEdit;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAlarm_vip: TfrmAlarm_vip;

implementation
uses
  Global;

{$R *.dfm}

procedure TfrmAlarm_vip.Button1Click(Sender: TObject);
begin
  if od1.Execute then
    edtFile.Text:= od1.FileName;
end;

procedure TfrmAlarm_vip.btnSaveClick(Sender: TObject);
var
  nCheck: Byte;
begin
  try
    nCheck:= StrToInt(edtTime.Text);

    if nCheck > 60 then
    begin
      ShowMessage('알람시간을 60이하로 입력하여주세요!');
      edtTime.SetFocus;
      Exit;
    end;
  except
    on E: Exception do
    begin
      ShowMessage('알람시간을 정확히 입력하여주세요!');
      edtTime.SetFocus;
      Exit;
    end;
  end;
  iSetup.WriteString('PARKING', 'Alarm FileVip', edtFile.Text);
  iSetup.WriteString('PARKING', 'Alarm TimeVip', edtTime.Text);
  sAlarmFileVip:= edtFile.Text;
  nAlarmTimeVip:= nCheck;

  ShowMessage('저장완료');
end;

procedure TfrmAlarm_vip.FormShow(Sender: TObject);
begin
  edtFile.Text:= sAlarmFileVip;
  edtTime.Text:= IntToStr(nAlarmTimeVip);
end;

procedure TfrmAlarm_vip.btnCloseClick(Sender: TObject);
begin
   ModalResult := mrCancel;
  //Close;
end;

end.
