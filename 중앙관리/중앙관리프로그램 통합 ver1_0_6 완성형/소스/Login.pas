unit Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, AdvEdit, AdvSmoothButton, AdvSmoothLabel,
  AdvCombo, AdvSmoothPanel, DB, ADODB;

type
  TfrmLogin = class(TForm)
    AdvSmoothPanel1: TAdvSmoothPanel;
    cmbManager: TAdvComboBox;
    AdvSmoothLabel1: TAdvSmoothLabel;
    AdvSmoothPanel2: TAdvSmoothPanel;
    btnNum0: TAdvSmoothButton;
    btnNum1: TAdvSmoothButton;
    btnNum2: TAdvSmoothButton;
    btnNum3: TAdvSmoothButton;
    btnNum4: TAdvSmoothButton;
    btnNum5: TAdvSmoothButton;
    btnNum6: TAdvSmoothButton;
    btnNum7: TAdvSmoothButton;
    btnNum8: TAdvSmoothButton;
    btnNum9: TAdvSmoothButton;
    btnBack: TAdvSmoothButton;
    btnDel: TAdvSmoothButton;
    btnOK: TAdvSmoothButton;
    edtPassword: TAdvEdit;
    btnLogin: TAdvSmoothButton;
    qryManager: TADOQuery;
    qryManagerParkNo: TSmallintField;
    qryManagerMNo: TWordField;
    qryManagerPasswd: TStringField;
    qryManagerMName: TStringField;
    qryManagerAuthority: TWordField;
    qryManagerReserve1: TStringField;
    qryManagerReserve2: TStringField;
    qryManagerReserve3: TStringField;
    qryManagerReserve4: TStringField;
    qryManagerReserve5: TStringField;
    edtCheck: TAdvEdit;
    procedure btnLoginClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnNum0Click(Sender: TObject);
    procedure btnNum1Click(Sender: TObject);
    procedure btnNum2Click(Sender: TObject);
    procedure btnNum3Click(Sender: TObject);
    procedure btnNum4Click(Sender: TObject);
    procedure btnNum5Click(Sender: TObject);
    procedure btnNum6Click(Sender: TObject);
    procedure btnNum7Click(Sender: TObject);
    procedure btnNum8Click(Sender: TObject);
    procedure btnNum9Click(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure cmbManagerChange(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure edtPasswordKeyPress(Sender: TObject; var Key: Char);
    procedure cmbManagerKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation
uses
  Tables, Global, Main;

{$R *.dfm}

procedure TfrmLogin.btnNum0Click(Sender: TObject);
begin
  edtPassword.Text:= edtPassword.Text + '0';
end;

procedure TfrmLogin.btnNum1Click(Sender: TObject);
begin
  edtPassword.Text:= edtPassword.Text + '1';
end;

procedure TfrmLogin.btnNum2Click(Sender: TObject);
begin
  edtPassword.Text:= edtPassword.Text + '2';
end;

procedure TfrmLogin.btnNum3Click(Sender: TObject);
begin
  edtPassword.Text:= edtPassword.Text + '3';
end;

procedure TfrmLogin.btnNum4Click(Sender: TObject);
begin
  edtPassword.Text:= edtPassword.Text + '4';
end;

procedure TfrmLogin.btnNum5Click(Sender: TObject);
begin
  edtPassword.Text:= edtPassword.Text + '5';
end;

procedure TfrmLogin.btnNum6Click(Sender: TObject);
begin
  edtPassword.Text:= edtPassword.Text + '6';
end;

procedure TfrmLogin.btnNum7Click(Sender: TObject);
begin
  edtPassword.Text:= edtPassword.Text + '7';
end;

procedure TfrmLogin.btnNum8Click(Sender: TObject);
begin
  edtPassword.Text:= edtPassword.Text + '8';
end;

procedure TfrmLogin.btnNum9Click(Sender: TObject);
begin
  edtPassword.Text:= edtPassword.Text + '9';
end;

procedure TfrmLogin.cmbManagerChange(Sender: TObject);
begin
  try
  //modified LJH 190628
//    if cmbManager.Text <> '(주)넥스파시스템' then
    if cmbManager.Text <> adminManager then
    begin
      with qryManager do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select * from Manager where ParkNo = :N1 and MName = :N2 Order By MNo');
        Parameters.ParamByName('N1').Value:= nCurrParkNo;
        Parameters.ParamByName('N2').Value:= cmbManager.Text;
        Open;

        if RecordCount > 0 then
        begin
          cmbManager.Tag:= FieldByName('MNo').AsInteger;
          edtCheck.Text:= IntToStr(cmbManager.Tag);
        end;
      end;
    end
    else
    begin
      cmbManager.Tag:= 255;
      edtCheck.Text:= '255';
    end;
    edtPassword.SetFocus;
  except
    on E: Exception do ExceptLogging('TfrmLogin.cmbManagerChange: ' + aString(E.Message));
  end;
end;

procedure TfrmLogin.cmbManagerKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    edtPassword.SetFocus;
end;

procedure TfrmLogin.edtPasswordKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnLoginClick(Self);
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  try
    cmbManager.Items.Clear;

    with qryManager do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select * from Manager where ParkNo = :N1 Order By MNo');
      Parameters.ParamByName('N1').Value:= nCurrParkNo;
      Open;

      if RecordCount > 0 then
      begin
        cmbManager.Tag:= FieldByName('MNo').AsInteger;
        edtCheck.Text:= IntToStr(cmbManager.Tag);

        while not Eof do
        begin
          cmbManager.Items.Add(FieldByName('MName').AsString);
          Next;
        end;
      end
      else
      begin
        cmbManager.Tag:= 255;
        edtCheck.Text:= '255';
      end;
    end;
//    cmbManager.Items.Add('(주)넥스파시스템');
    cmbManager.Items.Add(adminManager);
    cmbManager.ItemIndex:= 0;
    cmbManager.SetFocus;
    edtPassword.Text:= '';
  except
    on E: Exception do ExceptLogging('TfrmLogin.FormShow: ' + aString(E.Message));
  end;
end;

procedure TfrmLogin.btnBackClick(Sender: TObject);
var
  sPw: aString;
begin
  sPw:= aString(edtPassword.Text);

  if Length(sPw) > 1 then
    edtPassword.Text:= wString(Copy(sPw, 1, Length(sPw)-1))
  else
    edtPassword.Text:= '';
end;

procedure TfrmLogin.btnDelClick(Sender: TObject);
begin
  edtPassword.Text:= '';
end;

procedure TfrmLogin.btnLoginClick(Sender: TObject);
var
  sChkPW: aString;
begin
  try
  try
    sChkPW:= '12345678';

    if (MG_StrTrim(aString(edtPassword.Text), ' ') = '') then
    begin
      ShowMessage('비밀번호를 8자리이하로 입력하여주세요!');
      Exit;
    end;

    if dmTables.ADODB.Connected then
    begin
      with qryManager do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select * from Manager where MNo = :pMNo and Passwd = :pPasswd');
        Parameters.ParamByName('pMNo').Value := cmbManager.Tag;
        Parameters.ParamByName('pPasswd').Value := edtPassword.Text;
        Open;

        if RecordCount > 0 then
        begin
          nManagerAuthority:= FieldByName('Authority').AsInteger;
          nCurrMNo:= cmbManager.Tag;
          sCurrMName:= FieldByName('MName').AsString;
          nLoginResult:= 1;
        end
        else
        begin
          if (cmbManager.Tag = 255) and (aString(UpperCase(edtPassword.Text)) = sChkPW) then
          begin
            nManagerAuthority:= 0;
            nCurrMNo:= cmbManager.Tag;
            sCurrMName:= adminManager;
            nLoginResult:= 1;
            Exit;
          end;
          ShowMessage('비밀번호가 틀렸거나 없는 근무자 번호입니다.');
          edtPassword.Text:= '';
        end;
      end;
    end
    else
    begin
      if (cmbManager.Tag = 255) and (aString(UpperCase(edtPassword.Text)) = sChkPW) then
      begin
        nManagerAuthority:= 0;
        nCurrMNo:= cmbManager.Tag;
        sCurrMName:= adminManager;
        nLoginResult:= 1;
      end;
    end;
  except
    on E: Exception do ExceptLogging('TfrmLogin.btnLoginClick: ' + aString(E.Message));
  end;

  finally
    if nLoginResult = 1 then
      Close;
  end;
end;

end.
