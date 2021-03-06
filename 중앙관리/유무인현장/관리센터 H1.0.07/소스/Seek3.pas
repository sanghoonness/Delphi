unit Seek3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, AdvEdit;

type
  TfrmSeek3 = class(TForm)
    rgSeek: TRadioGroup;
    edtSeek: TEdit;
    procedure FormShow(Sender: TObject);
    procedure edtSeekKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSeek3: TfrmSeek3;

implementation
uses
  Tables, Global, DCFixed;

{$R *.dfm}

procedure TfrmSeek3.edtSeekKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    if rgSeek.ItemIndex = 0 then
    begin
      if edtSeek.Text = '' then
      begin
        ShowMessage('검색할 사용자의 성명을 입력하여주세요!');
        edtSeek.SetFocus;
        Exit;
      end;

      With dmTables.qryDcFixed do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select * from dcFixed '
              + ' Where  Name like ' + MG_MakeStr('%' + Trim(edtSeek.Text) + '%')
              + ' Order by Name');
        Open;
      end;
    end;

    if rgSeek.ItemIndex = 1 then
    begin
      if edtSeek.Text = '' then
      begin
        ShowMessage('검색할 차량번호를 입력하여주세요!');
        edtSeek.SetFocus;
        Exit;
      end;

      With dmTables.qryDcFixed do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select * from dcFixed '
              + ' Where CarNo like ' + MG_MakeStr('%' + Trim(edtSeek.Text) + '%')
              + ' Order by CarNo');
        Open;
      end;
    end;
    //Close;
    ModalResult := mrCancel;
  end;
end;

procedure TfrmSeek3.FormShow(Sender: TObject);
begin
  edtSeek.Visible:= True;
  edtSeek.SetFocus;
end;

end.
