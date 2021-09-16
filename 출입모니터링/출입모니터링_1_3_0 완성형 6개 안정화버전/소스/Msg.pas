unit Msg;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IniFiles;

type
  TfrmMessage = class(TForm)
    edtMemo: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    edtDong: TEdit;
    edtHo: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtmemo1: TEdit;
    procedure FormShow(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure ButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMessage: TfrmMessage;

implementation

{$R *.dfm}

procedure TfrmMessage.Button7Click(Sender: TObject);
var
  memo : AnsiString;
begin
  memo:= '';
  if Length(edtDong.Text) <> 0 then
  begin
     memo :=memo + edtDong.Text + '동 '
  end;
  if Length(edtDong.Text) <> 0 then
  begin
     memo :=memo + edtHo.Text + '호 '
  end;
  if Length(edtmemo1.Text) <> 0 then
  begin
     memo :=memo + edtmemo1.Text
  end;
  edtMemo.Text :=  memo;
  ModalResult := mrOK;
end;

procedure TfrmMessage.ButtonClick(Sender: TObject);
var
  memo : AnsiString;
begin
//  memo:= '';
//  if Length(edtDong.Text) <> 0 then
//  begin
//     memo :=memo + edtDong.Text + '동 '
//  end;
//  if Length(edtDong.Text) <> 0 then
//  begin
//     memo :=memo + edtHo.Text + '호 '
//  end;
  edtMemo1.Text :=(Sender as TButton).Caption;
//  ModalResult := mrOK;
//
end;

procedure TfrmMessage.FormShow(Sender: TObject);
var
  iniMsg: TIniFile;
begin
  iniMsg := TIniFile.Create(ExtractFileDir(Application.ExeName) + '\ParkSet.ini');
  Button1.Caption  := iniMsg.ReadString('PARKING', 'msg01', '');
  Button2.Caption  := iniMsg.ReadString('PARKING', 'msg02', '');
  Button3.Caption  := iniMsg.ReadString('PARKING', 'msg03', '');
  Button4.Caption  := iniMsg.ReadString('PARKING', 'msg04', '');
  Button5.Caption  := iniMsg.ReadString('PARKING', 'msg05', '');
  Button6.Caption  := iniMsg.ReadString('PARKING', 'msg06', '');

  edtdong.SetFocus;
end;

end.
