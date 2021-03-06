unit CashSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvSmoothToggleButton, StdCtrls, GradientLabel,Menus, AdvEdit;

type
  TfrmCashSelect = class(TForm)
    GradientLabel1: TGradientLabel;
    btn1: TAdvSmoothToggleButton;
    btn2: TAdvSmoothToggleButton;
    PopupMenu1: TPopupMenu;
    g1: TMenuItem;
    N1: TMenuItem;
    edtBarcode: TAdvEdit;
    Label1: TLabel;
    CashCancel: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure g1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure CashCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCashSelect: TfrmCashSelect;

implementation
uses
  Global;

{$R *.dfm}

procedure TfrmCashSelect.btn1Click(Sender: TObject); //발행
begin
  nCashType:= 1;
  ModalResult := mrOk;
end;

procedure TfrmCashSelect.btn2Click(Sender: TObject); //미발행
begin
  nCashType:= 0;
  ModalResult := mrYes;
end;

procedure TfrmCashSelect.CashCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel; //현금 결제 시 취소 버튼 추가
end;

procedure TfrmCashSelect.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 49 then
    btn2.OnClick(Sender)
  else if Key = 50 then
    btn1.OnClick(Sender);

end;

procedure TfrmCashSelect.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //if (Key = #13) and btn2.Enabled then begin
  if (Key = #13) then begin
    if (edtBarcode.Text = '') then
      btn2Click(Self)
  //end else if (Key = #27) and btn1.Enabled then
  end else if (Key = #27)  then
  begin
    ModalResult := 2;
  end;
end;

procedure TfrmCashSelect.FormShow(Sender: TObject);
begin
//  btn2.SetFocus;
  edtBarcode.SetFocus;
  if not bCreditLoad then
    btn1.Enabled:= False;
end;

procedure TfrmCashSelect.g1Click(Sender: TObject);
begin
  btn2Click(Self);
end;

procedure TfrmCashSelect.N1Click(Sender: TObject);
begin
  btn1Click(Self);
end;

end.
