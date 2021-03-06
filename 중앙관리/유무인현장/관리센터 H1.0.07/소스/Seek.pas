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
    procedure FormShow(Sender: TObject);
    procedure rgSeekClick(Sender: TObject);
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
  //Close;
  ModalResult := mrCancel;
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

    if rgSeek.ItemIndex = 3 then
    begin
      if edtSeek.Text = '' then
      begin
        ShowMessage('검색할 부서명을 입력하여주세요!');
        edtSeek.SetFocus;
        Exit;
      end;

      With dmTables.qryCustInfo do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select * from CustInfo '
              + ' Where TKType = :N1 and deptName like ' + MG_MakeStr('%' + Trim(edtSeek.Text) + '%')
              + ' Order by deptName');
        Parameters.ParamByName('N1').Value:= 2;
        Open;
      end;
    end;

    //Close;
    ModalResult := mrCancel;
  end;
end;

procedure TfrmSeek.FormShow(Sender: TObject);
begin
  edtSeek.SetFocus;
  edtSeek.ImeMode := imSHanguel;
  KEYBD_EVENT(VK_HANGUL, 0, 0, 0);                 //  누름
  ToggleHanMode;
end;

procedure TfrmSeek.rgSeekClick(Sender: TObject);
begin
  edtSeek.SetFocus;
  edtSeek.ImeMode := imSHanguel;
  KEYBD_EVENT(VK_HANGUL, 0, 0, 0);                 //  누름
  ToggleHanMode;
end;

end.
