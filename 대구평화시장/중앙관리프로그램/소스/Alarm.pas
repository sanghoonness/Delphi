unit Alarm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, AdvEdit, Mask, Buttons;

type
  TfrmAlarm = class(TForm)
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
  frmAlarm: TfrmAlarm;

implementation
uses
  Global;

{$R *.dfm}

procedure TfrmAlarm.Button1Click(Sender: TObject);
begin
  if od1.Execute then
    edtFile.Text:= od1.FileName;
end;

procedure TfrmAlarm.btnSaveClick(Sender: TObject);
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
      ExceptLogging('TfrmAlarm.btnSaveClick: ' + aString(E.Message));
      ShowMessage('알람시간을 정확히 입력하여주세요!');
      edtTime.SetFocus;
      Exit;
    end;
  end;
  iSetup.WriteString('PARKING', 'Alarm File', edtFile.Text);
  iSetup.WriteString('PARKING', 'Alarm Time', edtTime.Text);
  sAlarmFile:= edtFile.Text;
  nAlarmTime:= nCheck;

  ShowMessage('알람설정이 완료되었습니다.');
end;

procedure TfrmAlarm.FormShow(Sender: TObject);
begin
  edtFile.Text:= sAlarmFile;
  edtTime.Text:= IntToStr(nAlarmTime);
end;

procedure TfrmAlarm.btnCloseClick(Sender: TObject);
begin
  Close;
end;

end.
