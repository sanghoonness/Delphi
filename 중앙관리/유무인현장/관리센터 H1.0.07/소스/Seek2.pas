unit Seek2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, AdvEdit, imm;

type
  TfrmSeek2 = class(TForm)
    rgSeek: TRadioGroup;
    edtSeek: TEdit;
    edtDong: TAdvEdit;
    edtHo: TAdvEdit;
    procedure edtSeekKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure rgSeekClick(Sender: TObject);
    procedure edtDongKeyPress(Sender: TObject; var Key: Char);
    procedure edtHoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSeek2: TfrmSeek2;

implementation
uses
  Tables, Global, CustInfo;

{$R *.dfm}

procedure TfrmSeek2.edtDongKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    edtHo.SetFocus;
end;

procedure TfrmSeek2.edtHoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    {if edtDong.Text = '' then
    begin
      ShowMessage('검색할 동을 입력하여주세요!');
      edtDong.SetFocus;
      Exit;
    end;}

    if edtHo.Text = '' then
    begin
      ShowMessage('검색할 호를 입력하여주세요!');
      edtHo.SetFocus;
      Exit;
    end;

    With dmTables.qryCustInfo do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from CustInfo '
            + ' Where TKType = :N1 and CompName = :N2 and DeptName = :N3 '
            + ' Order by CompName, DeptName');
      Parameters.ParamByName('N1').Value:= 2;
      Parameters.ParamByName('N2').Value:= edtDong.Text;
      Parameters.ParamByName('N3').Value:= edtHo.Text;
      Open;
    end;
    //Close;
    ModalResult := mrCancel;
  end;
end;

procedure TfrmSeek2.edtSeekKeyPress(Sender: TObject; var Key: Char);
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
//      if edtSeek.Text = '' then
//      begin
//        ShowMessage('검색할 동/호를 입력하여주세요!');
//        edtSeek.SetFocus;
//        Exit;
//      end;

      With dmTables.qryCustInfo do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select * from CustInfo '
              + ' Where TKType = :N1 and (CompName = :N2 or DeptName = :N3) '
              + ' Order by CompName');
        Parameters.ParamByName('N1').Value:= 2;
        Parameters.ParamByName('N2').Value:= edtDong.Text;
        Parameters.ParamByName('N2').Value:= edtHo.Text;
        Open;
      end;
    end;

    if rgSeek.ItemIndex = 3 then
    begin
      if edtSeek.Text = '' then
      begin
        ShowMessage('검색할 전화번호를 입력하여주세요!');
        edtSeek.SetFocus;
        Exit;
      end;

      With dmTables.qryCustInfo do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select * from CustInfo '
              + ' Where TKType = :N1 and TelNo like ' + MG_MakeStr('%' + Trim(edtSeek.Text) + '%')
              + ' Order by CompName');
        Parameters.ParamByName('N1').Value:= 2;
        Open;
      end;
    end;

    //Close;
    ModalResult := mrCancel;
  end;
end;

procedure TfrmSeek2.FormShow(Sender: TObject);
begin
  edtDong.Top:= edtSeek.Top;
  edtHo.Top:= edtSeek.Top;
  edtSeek.Visible:= True;
  edtDong.Visible:= False;
  edtHo.Visible:= False;
  edtSeek.SetFocus;

  edtSeek.ImeMode := imSHanguel;
  KEYBD_EVENT(VK_HANGUL, 0, 0, 0);                 //  누름
  ToggleHanMode;
end;

procedure TfrmSeek2.rgSeekClick(Sender: TObject);
begin
  if rgSeek.ItemIndex <= 1 then
  begin
    edtSeek.Visible:= True;
    edtDong.Visible:= False;
    edtHo.Visible:= False;
    edtSeek.SetFocus;

    edtSeek.ImeMode := imSHanguel;
    KEYBD_EVENT(VK_HANGUL, 0, 0, 0);                 //  누름
    ToggleHanMode;
  end
  else if rgSeek.ItemIndex = 3 then
  begin
    edtSeek.Visible:= True;
    edtDong.Visible:= False;
    edtHo.Visible:= False;
    edtSeek.SetFocus;

    edtSeek.ImeMode := imSHanguel;
    KEYBD_EVENT(VK_HANGUL, 0, 0, 0);                 //  누름
    ToggleHanMode;
  end
  else
  begin
    edtSeek.Visible:= False;
    edtDong.Visible:= True;
    edtHo.Visible:= True;
    edtDong.SetFocus;

    edtDong.ImeMode := imSHanguel;
    edtHo.ImeMode := imSHanguel;
    KEYBD_EVENT(VK_HANGUL, 0, 0, 0);                 //  누름
    ToggleHanMode;
  end;
end;

end.
