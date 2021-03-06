unit Alarm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, AdvEdit, Mask, Buttons;

type
   TfrmAlarm = class(TForm)
    edtAlarmFile: TAdvEdit;
    Button1: TButton;
    od1: TOpenDialog;
    btnSave: TBitBtn;
    btnClose: TBitBtn;
    edtTime: TAdvEdit;
    Label1: TLabel;
    grpblack: TGroupBox;
    Button2: TButton;
    edtAlarmN: TAdvEdit;
    edtTimeN: TAdvEdit;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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
    edtAlarmFile.Text:= od1.FileName;
end;

procedure TfrmAlarm.Button2Click(Sender: TObject);
begin
  if od1.Execute then
    edtAlarmN.Text:= od1.FileName;
end;

procedure TfrmAlarm.btnSaveClick(Sender: TObject);
var
  nCheck, nCheckN: Byte;
begin
  try
    nCheck  := StrToInt(edtTime.Text);

    if (nCheck > 60) then
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
  iSetup.WriteString('PARKING', 'Alarm File', edtAlarmFile.Text);
  iSetup.WriteString('PARKING', 'Alarm Time', edtTime.Text);
  iSetup.WriteString('PARKING', 'Alarm FileN', edtAlarmN.Text);
  iSetup.WriteString('PARKING', 'Alarm TimeN', edtTimeN.Text);
  sBAlarmFile:= edtAlarmFile.Text;
  nBAlarmTime:= nCheck;

  ShowMessage('저장 완료!');

end;

procedure TfrmAlarm.FormShow(Sender: TObject);
begin
  edtAlarmFile.Text:= sBAlarmFile;
  edtTime.Text:= IntToStr(nBAlarmTime);
end;

procedure TfrmAlarm.btnCloseClick(Sender: TObject);
begin
  Close;
end;

end.
