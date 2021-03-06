unit Seek;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TfrmSeek = class(TForm)
    rgSeek: TRadioGroup;
    edtSeek: TEdit;
    btnCancel: TBitBtn;
    procedure edtSeekKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSeek: TfrmSeek;

implementation
uses
  Tables, Global, CustInfo;

{$R *.dfm}

procedure TfrmSeek.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSeek.edtSeekKeyPress(Sender: TObject; var Key: Char);
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

      With dmTables.qryCustInfo do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select * from Custinfo '
              + ' Where TKType = :N1 and Name like ' + MG_MakeStr('%' + Trim(edtSeek.Text) + '%')
              + ' Order by Name');
        Parameters.ParamByName('N1').Value:= 2;
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

      With dmTables.qryCustInfo do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select * from CustInfo '
              + ' Where TKType = :N1 and CarNo like ' + MG_MakeStr('%' + Trim(edtSeek.Text) + '%')
              + ' Order by CarNo');
        Parameters.ParamByName('N1').Value:= 2;
        Open;
      end;
    end;

    if rgSeek.ItemIndex = 2 then
    begin
      if edtSeek.Text = '' then
      begin
        ShowMessage('검색할 회사명을 입력하여주세요!');
        edtSeek.SetFocus;
        Exit;
      end;

      With dmTables.qryCustInfo do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select * from CustInfo '
              + ' Where TKType = :N1 and CompName like ' + MG_MakeStr('%' + Trim(edtSeek.Text) + '%')
              + ' Order by CompName');
        Parameters.ParamByName('N1').Value:= 2;
        Open;
      end;
    end;
    Close;
  end;
end;

end.
