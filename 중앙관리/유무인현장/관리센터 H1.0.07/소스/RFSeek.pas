unit RFSeek;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmRFSeek = class(TForm)
    rgSeek: TRadioGroup;
    edtSeek: TEdit;
    procedure edtSeekKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRFSeek: TfrmRFSeek;

implementation
uses
  Tables, Global, RFSCCustInfo;

{$R *.dfm}

procedure TfrmRFSeek.edtSeekKeyPress(Sender: TObject; var Key: Char);
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

      With dmTables.qryCustinfo do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select * from Custinfo '
              + ' Where TKType = :N1 and Name like ' + MG_MakeStr('%' + Trim(edtSeek.Text) + '%')
              + ' Order by Name');
        Parameters.ParamByName('N1').Value:= 99;
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
        Parameters.ParamByName('N1').Value:= 99;
        Open;
      end;
    end;

    if rgSeek.ItemIndex = 2 then
    begin
      if edtSeek.Text = '' then
      begin
        ShowMessage('검색할 RF카드번호를 입력하여주세요!');
        edtSeek.SetFocus;
        Exit;
      end;

      With dmTables.qryCustInfo do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select * from CustInfo '
              + ' Where TKType = :N1 and TKNo like ' + MG_MakeStr('%' + Trim(edtSeek.Text) + '%')
              + ' Order by TKNo');
        Parameters.ParamByName('N1').Value:= 99;
        Open;
      end;
    end;
    Close;
  end;
end;

end.
